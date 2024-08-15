Return-Path: <auh@yoctoproject.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id F1050C5475C
	for <webhook@archiver.kernel.org>; Thu, 15 Aug 2024 18:59:04 +0000 (UTC)
Received: from a27-192.smtp-out.us-west-2.amazonses.com (a27-192.smtp-out.us-west-2.amazonses.com [54.240.27.192])
 by mx.groups.io with SMTP id smtpd.web11.131431.1723748334792855286
 for <openembedded-core@lists.openembedded.org>;
 Thu, 15 Aug 2024 11:58:54 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@yoctoproject.org header.s=rnkzp2s7ci3kogmesvov2nwn7wcc2dgx header.b=Q/zSh5Si;
 dkim=pass header.i=@amazonses.com header.s=7v7vs6w47njt4pimodk5mmttbegzsi6n header.b=VkyV1ift;
 spf=pass (domain: us-west-2.amazonses.com, ip: 54.240.27.192, mailfrom: 0101019157683ab6-d774f2ed-7292-4c76-a132-069254c68da2-000000@us-west-2.amazonses.com)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=rnkzp2s7ci3kogmesvov2nwn7wcc2dgx; d=yoctoproject.org;
	t=1723748334;
	h=Content-Type:MIME-Version:From:To:Cc:Subject:Message-Id:Date;
	bh=nBXGh+73PuzSJEqG+p1axLHvh6esKUPClBz8Ufb1iew=;
	b=Q/zSh5SimoFtMM8NagVlLH+1T4Av0zKBxJplwf4HCHWL1mdVNivuDQ2nATllSt9d
	YxvJ1DFMW4BjEIrcZEXFb1a4OnpQruxR8ACsSRMeHTKTlfhTg6Zgrr8wnHxVcMb36g/
	L+5r1EAad7ATfyAoY2mS37/Xe4U6whn3GgXBfqZE=
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=7v7vs6w47njt4pimodk5mmttbegzsi6n; d=amazonses.com; t=1723748334;
	h=Content-Type:MIME-Version:From:To:Cc:Subject:Message-Id:Date:Feedback-ID;
	bh=nBXGh+73PuzSJEqG+p1axLHvh6esKUPClBz8Ufb1iew=;
	b=VkyV1iftb9Qg6V5RkpcZkKu12v2eV8rvYC1yJnmKs1KUjBQ9/owJ1wUCxiVqWt+J
	5uhpCs2zP9VuyLOsQi5vo8NImX5XcUPhwJskV4+RYGs08VwgZg+ai2ZZOygiE+Y38/2
	jSyOmy7F3YiI35PwGK3b7VGqDEHMqa4sOyncKugg=
Content-Type: multipart/mixed; boundary="===============5061958980168379634=="
MIME-Version: 1.0
From: auh@yoctoproject.org
To: Tim Orling <tim.orling@konsulko.com>
Cc: openembedded-core@lists.openembedded.org
Subject: [AUH] python3-rpds-py: upgrading to 0.20.0 SUCCEEDED
Message-ID: <0101019157683ab6-d774f2ed-7292-4c76-a132-069254c68da2-000000@us-west-2.amazonses.com>
Date: Thu, 15 Aug 2024 18:58:54 +0000
Feedback-ID: ::1.us-west-2.9np3MYPs3fEaOBysGKSlUD4KtcmPijcmS9Az2Hwf7iQ=:AmazonSES
X-SES-Outgoing: 2024.08.15-54.240.27.192
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 15 Aug 2024 18:59:04 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/203392

--===============5061958980168379634==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

Hello,

this email is a notification from the Auto Upgrade Helper
that the automatic attempt to upgrade the recipe(s) *python3-rpds-py* to *0.20.0* has Succeeded.

Next steps:
    - apply the patch: git am 0001-python3-rpds-py-upgrade-0.18.1-0.20.0.patch
    - check the changes to upstream patches and summarize them in the commit message,
    - compile an image that contains the package
    - perform some basic sanity tests
    - amend the patch and sign it off: git commit -s --reset-author --amend
    - send it to the appropriate mailing list

Alternatively, if you believe the recipe should not be upgraded at this time,
you can fill RECIPE_NO_UPDATE_REASON in respective recipe file so that
automatic upgrades would no longer be attempted.

Please review the attached files for further information and build/update failures.
Any problem please file a bug at https://bugzilla.yoctoproject.org/enter_bug.cgi?product=Automated%20Update%20Handler

Regards,
The Upgrade Helper

-- >8 --
From af3970e767046ab5e82a5b7fc8f7ce21a41e3e6a Mon Sep 17 00:00:00 2001
From: Upgrade Helper <auh@yoctoproject.org>
Date: Thu, 15 Aug 2024 12:07:30 +0000
Subject: [PATCH] python3-rpds-py: upgrade 0.18.1 -> 0.20.0

---
 .../python/python3-rpds-py-crates.inc         | 102 +++++++-----------
 ...py_0.18.1.bb => python3-rpds-py_0.20.0.bb} |   2 +-
 2 files changed, 39 insertions(+), 65 deletions(-)
 rename meta/recipes-devtools/python/{python3-rpds-py_0.18.1.bb => python3-rpds-py_0.20.0.bb} (88%)

diff --git a/meta/recipes-devtools/python/python3-rpds-py-crates.inc b/meta/recipes-devtools/python/python3-rpds-py-crates.inc
index 3551bdb5f7..e6c1ef8add 100644
--- a/meta/recipes-devtools/python/python3-rpds-py-crates.inc
+++ b/meta/recipes-devtools/python/python3-rpds-py-crates.inc
@@ -3,80 +3,54 @@
 # from Cargo.lock
 SRC_URI += " \
     crate://crates.io/archery/1.2.0 \
-    crate://crates.io/autocfg/1.1.0 \
-    crate://crates.io/bitflags/1.3.2 \
+    crate://crates.io/autocfg/1.3.0 \
+    crate://crates.io/cc/1.0.90 \
     crate://crates.io/cfg-if/1.0.0 \
-    crate://crates.io/heck/0.4.1 \
-    crate://crates.io/indoc/2.0.4 \
-    crate://crates.io/libc/0.2.147 \
-    crate://crates.io/lock_api/0.4.10 \
-    crate://crates.io/memoffset/0.9.0 \
-    crate://crates.io/once_cell/1.18.0 \
-    crate://crates.io/parking_lot/0.12.1 \
-    crate://crates.io/parking_lot_core/0.9.8 \
+    crate://crates.io/heck/0.5.0 \
+    crate://crates.io/indoc/2.0.5 \
+    crate://crates.io/libc/0.2.155 \
+    crate://crates.io/memoffset/0.9.1 \
+    crate://crates.io/once_cell/1.19.0 \
     crate://crates.io/portable-atomic/1.6.0 \
-    crate://crates.io/proc-macro2/1.0.66 \
-    crate://crates.io/pyo3/0.20.3 \
-    crate://crates.io/pyo3-build-config/0.20.3 \
-    crate://crates.io/pyo3-ffi/0.20.3 \
-    crate://crates.io/pyo3-macros/0.20.3 \
-    crate://crates.io/pyo3-macros-backend/0.20.3 \
-    crate://crates.io/quote/1.0.31 \
-    crate://crates.io/redox_syscall/0.3.5 \
+    crate://crates.io/proc-macro2/1.0.86 \
+    crate://crates.io/pyo3/0.22.2 \
+    crate://crates.io/pyo3-build-config/0.22.2 \
+    crate://crates.io/pyo3-ffi/0.22.2 \
+    crate://crates.io/pyo3-macros/0.22.2 \
+    crate://crates.io/pyo3-macros-backend/0.22.2 \
+    crate://crates.io/python3-dll-a/0.2.10 \
+    crate://crates.io/quote/1.0.36 \
     crate://crates.io/rpds/1.1.0 \
-    crate://crates.io/scopeguard/1.1.0 \
-    crate://crates.io/smallvec/1.11.0 \
     crate://crates.io/static_assertions/1.1.0 \
-    crate://crates.io/syn/2.0.32 \
-    crate://crates.io/target-lexicon/0.12.9 \
-    crate://crates.io/triomphe/0.1.9 \
-    crate://crates.io/unicode-ident/1.0.11 \
+    crate://crates.io/syn/2.0.69 \
+    crate://crates.io/target-lexicon/0.12.14 \
+    crate://crates.io/triomphe/0.1.13 \
+    crate://crates.io/unicode-ident/1.0.12 \
     crate://crates.io/unindent/0.2.3 \
-    crate://crates.io/windows-targets/0.48.1 \
-    crate://crates.io/windows_aarch64_gnullvm/0.48.0 \
-    crate://crates.io/windows_aarch64_msvc/0.48.0 \
-    crate://crates.io/windows_i686_gnu/0.48.0 \
-    crate://crates.io/windows_i686_msvc/0.48.0 \
-    crate://crates.io/windows_x86_64_gnu/0.48.0 \
-    crate://crates.io/windows_x86_64_gnullvm/0.48.0 \
-    crate://crates.io/windows_x86_64_msvc/0.48.0 \
 "
 
 SRC_URI[archery-1.2.0.sha256sum] = "8967cd1cc9e9e1954f644e14fbd6042fe9a37da96c52a67e44a2ac18261f8561"
-SRC_URI[autocfg-1.1.0.sha256sum] = "d468802bab17cbc0cc575e9b053f41e72aa36bfa6b7f55e3529ffa43161b97fa"
-SRC_URI[bitflags-1.3.2.sha256sum] = "bef38d45163c2f1dde094a7dfd33ccf595c92905c8f8f4fdc18d06fb1037718a"
+SRC_URI[autocfg-1.3.0.sha256sum] = "0c4b4d0bd25bd0b74681c0ad21497610ce1b7c91b1022cd21c80c6fbdd9476b0"
+SRC_URI[cc-1.0.90.sha256sum] = "8cd6604a82acf3039f1144f54b8eb34e91ffba622051189e71b781822d5ee1f5"
 SRC_URI[cfg-if-1.0.0.sha256sum] = "baf1de4339761588bc0619e3cbc0120ee582ebb74b53b4efbf79117bd2da40fd"
-SRC_URI[heck-0.4.1.sha256sum] = "95505c38b4572b2d910cecb0281560f54b440a19336cbbcb27bf6ce6adc6f5a8"
-SRC_URI[indoc-2.0.4.sha256sum] = "1e186cfbae8084e513daff4240b4797e342f988cecda4fb6c939150f96315fd8"
-SRC_URI[libc-0.2.147.sha256sum] = "b4668fb0ea861c1df094127ac5f1da3409a82116a4ba74fca2e58ef927159bb3"
-SRC_URI[lock_api-0.4.10.sha256sum] = "c1cc9717a20b1bb222f333e6a92fd32f7d8a18ddc5a3191a11af45dcbf4dcd16"
-SRC_URI[memoffset-0.9.0.sha256sum] = "5a634b1c61a95585bd15607c6ab0c4e5b226e695ff2800ba0cdccddf208c406c"
-SRC_URI[once_cell-1.18.0.sha256sum] = "dd8b5dd2ae5ed71462c540258bedcb51965123ad7e7ccf4b9a8cafaa4a63576d"
-SRC_URI[parking_lot-0.12.1.sha256sum] = "3742b2c103b9f06bc9fff0a37ff4912935851bee6d36f3c02bcc755bcfec228f"
-SRC_URI[parking_lot_core-0.9.8.sha256sum] = "93f00c865fe7cabf650081affecd3871070f26767e7b2070a3ffae14c654b447"
+SRC_URI[heck-0.5.0.sha256sum] = "2304e00983f87ffb38b55b444b5e3b60a884b5d30c0fca7d82fe33449bbe55ea"
+SRC_URI[indoc-2.0.5.sha256sum] = "b248f5224d1d606005e02c97f5aa4e88eeb230488bcc03bc9ca4d7991399f2b5"
+SRC_URI[libc-0.2.155.sha256sum] = "97b3888a4aecf77e811145cadf6eef5901f4782c53886191b2f693f24761847c"
+SRC_URI[memoffset-0.9.1.sha256sum] = "488016bfae457b036d996092f6cb448677611ce4449e970ceaf42695203f218a"
+SRC_URI[once_cell-1.19.0.sha256sum] = "3fdb12b2476b595f9358c5161aa467c2438859caa136dec86c26fdd2efe17b92"
 SRC_URI[portable-atomic-1.6.0.sha256sum] = "7170ef9988bc169ba16dd36a7fa041e5c4cbeb6a35b76d4c03daded371eae7c0"
-SRC_URI[proc-macro2-1.0.66.sha256sum] = "18fb31db3f9bddb2ea821cde30a9f70117e3f119938b5ee630b7403aa6e2ead9"
-SRC_URI[pyo3-0.20.3.sha256sum] = "53bdbb96d49157e65d45cc287af5f32ffadd5f4761438b527b055fb0d4bb8233"
-SRC_URI[pyo3-build-config-0.20.3.sha256sum] = "deaa5745de3f5231ce10517a1f5dd97d53e5a2fd77aa6b5842292085831d48d7"
-SRC_URI[pyo3-ffi-0.20.3.sha256sum] = "62b42531d03e08d4ef1f6e85a2ed422eb678b8cd62b762e53891c05faf0d4afa"
-SRC_URI[pyo3-macros-0.20.3.sha256sum] = "7305c720fa01b8055ec95e484a6eca7a83c841267f0dd5280f0c8b8551d2c158"
-SRC_URI[pyo3-macros-backend-0.20.3.sha256sum] = "7c7e9b68bb9c3149c5b0cade5d07f953d6d125eb4337723c4ccdb665f1f96185"
-SRC_URI[quote-1.0.31.sha256sum] = "5fe8a65d69dd0808184ebb5f836ab526bb259db23c657efa38711b1072ee47f0"
-SRC_URI[redox_syscall-0.3.5.sha256sum] = "567664f262709473930a4bf9e51bf2ebf3348f2e748ccc50dea20646858f8f29"
+SRC_URI[proc-macro2-1.0.86.sha256sum] = "5e719e8df665df0d1c8fbfd238015744736151d4445ec0836b8e628aae103b77"
+SRC_URI[pyo3-0.22.2.sha256sum] = "831e8e819a138c36e212f3af3fd9eeffed6bf1510a805af35b0edee5ffa59433"
+SRC_URI[pyo3-build-config-0.22.2.sha256sum] = "1e8730e591b14492a8945cdff32f089250b05f5accecf74aeddf9e8272ce1fa8"
+SRC_URI[pyo3-ffi-0.22.2.sha256sum] = "5e97e919d2df92eb88ca80a037969f44e5e70356559654962cbb3316d00300c6"
+SRC_URI[pyo3-macros-0.22.2.sha256sum] = "eb57983022ad41f9e683a599f2fd13c3664d7063a3ac5714cae4b7bee7d3f206"
+SRC_URI[pyo3-macros-backend-0.22.2.sha256sum] = "ec480c0c51ddec81019531705acac51bcdbeae563557c982aa8263bb96880372"
+SRC_URI[python3-dll-a-0.2.10.sha256sum] = "bd0b78171a90d808b319acfad166c4790d9e9759bbc14ac8273fe133673dd41b"
+SRC_URI[quote-1.0.36.sha256sum] = "0fa76aaf39101c457836aec0ce2316dbdc3ab723cdda1c6bd4e6ad4208acaca7"
 SRC_URI[rpds-1.1.0.sha256sum] = "a0e15515d3ce3313324d842629ea4905c25a13f81953eadb88f85516f59290a4"
-SRC_URI[scopeguard-1.1.0.sha256sum] = "d29ab0c6d3fc0ee92fe66e2d99f700eab17a8d57d1c1d3b748380fb20baa78cd"
-SRC_URI[smallvec-1.11.0.sha256sum] = "62bb4feee49fdd9f707ef802e22365a35de4b7b299de4763d44bfea899442ff9"
 SRC_URI[static_assertions-1.1.0.sha256sum] = "a2eb9349b6444b326872e140eb1cf5e7c522154d69e7a0ffb0fb81c06b37543f"
-SRC_URI[syn-2.0.32.sha256sum] = "239814284fd6f1a4ffe4ca893952cdd93c224b6a1571c9a9eadd670295c0c9e2"
-SRC_URI[target-lexicon-0.12.9.sha256sum] = "df8e77cb757a61f51b947ec4a7e3646efd825b73561db1c232a8ccb639e611a0"
-SRC_URI[triomphe-0.1.9.sha256sum] = "0eee8098afad3fb0c54a9007aab6804558410503ad676d4633f9c2559a00ac0f"
-SRC_URI[unicode-ident-1.0.11.sha256sum] = "301abaae475aa91687eb82514b328ab47a211a533026cb25fc3e519b86adfc3c"
+SRC_URI[syn-2.0.69.sha256sum] = "201fcda3845c23e8212cd466bfebf0bd20694490fc0356ae8e428e0824a915a6"
+SRC_URI[target-lexicon-0.12.14.sha256sum] = "e1fc403891a21bcfb7c37834ba66a547a8f402146eba7265b5a6d88059c9ff2f"
+SRC_URI[triomphe-0.1.13.sha256sum] = "e6631e42e10b40c0690bf92f404ebcfe6e1fdb480391d15f17cc8e96eeed5369"
+SRC_URI[unicode-ident-1.0.12.sha256sum] = "3354b9ac3fae1ff6755cb6db53683adb661634f67557942dea4facebec0fee4b"
 SRC_URI[unindent-0.2.3.sha256sum] = "c7de7d73e1754487cb58364ee906a499937a0dfabd86bcb980fa99ec8c8fa2ce"
-SRC_URI[windows-targets-0.48.1.sha256sum] = "05d4b17490f70499f20b9e791dcf6a299785ce8af4d709018206dc5b4953e95f"
-SRC_URI[windows_aarch64_gnullvm-0.48.0.sha256sum] = "91ae572e1b79dba883e0d315474df7305d12f569b400fcf90581b06062f7e1bc"
-SRC_URI[windows_aarch64_msvc-0.48.0.sha256sum] = "b2ef27e0d7bdfcfc7b868b317c1d32c641a6fe4629c171b8928c7b08d98d7cf3"
-SRC_URI[windows_i686_gnu-0.48.0.sha256sum] = "622a1962a7db830d6fd0a69683c80a18fda201879f0f447f065a3b7467daa241"
-SRC_URI[windows_i686_msvc-0.48.0.sha256sum] = "4542c6e364ce21bf45d69fdd2a8e455fa38d316158cfd43b3ac1c5b1b19f8e00"
-SRC_URI[windows_x86_64_gnu-0.48.0.sha256sum] = "ca2b8a661f7628cbd23440e50b05d705db3686f894fc9580820623656af974b1"
-SRC_URI[windows_x86_64_gnullvm-0.48.0.sha256sum] = "7896dbc1f41e08872e9d5e8f8baa8fdd2677f29468c4e156210174edc7f7b953"
-SRC_URI[windows_x86_64_msvc-0.48.0.sha256sum] = "1a515f5799fe4961cb532f983ce2b23082366b898e52ffbce459c86f67c8378a"
diff --git a/meta/recipes-devtools/python/python3-rpds-py_0.18.1.bb b/meta/recipes-devtools/python/python3-rpds-py_0.20.0.bb
similarity index 88%
rename from meta/recipes-devtools/python/python3-rpds-py_0.18.1.bb
rename to meta/recipes-devtools/python/python3-rpds-py_0.20.0.bb
index f46df1115c..dd483ed88e 100644
--- a/meta/recipes-devtools/python/python3-rpds-py_0.18.1.bb
+++ b/meta/recipes-devtools/python/python3-rpds-py_0.20.0.bb
@@ -6,7 +6,7 @@ LIC_FILES_CHKSUM = "file://LICENSE;md5=7767fa537c4596c54141f32882c4a984"
 
 SRC_URI += "file://run-ptest"
 
-SRC_URI[sha256sum] = "dc48b479d540770c811fbd1eb9ba2bb66951863e448efec2e2c102625328e92f"
+SRC_URI[sha256sum] = "d72a210824facfdaf8768cf2d7ca25a042c30320b3020de2fa04640920d4e121"
 
 require ${BPN}-crates.inc
 
-- 
2.44.0


--===============5061958980168379634==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment; filename="buildhistory-diff.txt"

Changes to packages/core2-64-poky-linux/python3-rpds-py (sysroot):
  /usr/lib/python3.12/site-packages/rpds_py-0.18.1.dist-info moved to /usr/lib/python3.12/site-packages/rpds_py-0.20.0.dist-info

--===============5061958980168379634==
Content-Type: application/octet-stream
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: attachment;
 filename="0001-python3-rpds-py-upgrade-0.18.1-0.20.0.patch"

RnJvbSBhZjM5NzBlNzY3MDQ2YWI1ZTgyYTViN2ZjOGY3Y2UyMWE0MWUzZTZhIE1vbiBTZXAgMTcg
MDA6MDA6MDAgMjAwMQpGcm9tOiBVcGdyYWRlIEhlbHBlciA8YXVoQHlvY3RvcHJvamVjdC5vcmc+
CkRhdGU6IFRodSwgMTUgQXVnIDIwMjQgMTI6MDc6MzAgKzAwMDAKU3ViamVjdDogW1BBVENIXSBw
eXRob24zLXJwZHMtcHk6IHVwZ3JhZGUgMC4xOC4xIC0+IDAuMjAuMAoKLS0tCiAuLi4vcHl0aG9u
L3B5dGhvbjMtcnBkcy1weS1jcmF0ZXMuaW5jICAgICAgICAgfCAxMDIgKysrKysrKy0tLS0tLS0t
LS0tCiAuLi5weV8wLjE4LjEuYmIgPT4gcHl0aG9uMy1ycGRzLXB5XzAuMjAuMC5iYn0gfCAgIDIg
Ky0KIDIgZmlsZXMgY2hhbmdlZCwgMzkgaW5zZXJ0aW9ucygrKSwgNjUgZGVsZXRpb25zKC0pCiBy
ZW5hbWUgbWV0YS9yZWNpcGVzLWRldnRvb2xzL3B5dGhvbi97cHl0aG9uMy1ycGRzLXB5XzAuMTgu
MS5iYiA9PiBweXRob24zLXJwZHMtcHlfMC4yMC4wLmJifSAoODglKQoKZGlmZiAtLWdpdCBhL21l
dGEvcmVjaXBlcy1kZXZ0b29scy9weXRob24vcHl0aG9uMy1ycGRzLXB5LWNyYXRlcy5pbmMgYi9t
ZXRhL3JlY2lwZXMtZGV2dG9vbHMvcHl0aG9uL3B5dGhvbjMtcnBkcy1weS1jcmF0ZXMuaW5jCmlu
ZGV4IDM1NTFiZGI1ZjcuLmU2YzFlZjhhZGQgMTAwNjQ0Ci0tLSBhL21ldGEvcmVjaXBlcy1kZXZ0
b29scy9weXRob24vcHl0aG9uMy1ycGRzLXB5LWNyYXRlcy5pbmMKKysrIGIvbWV0YS9yZWNpcGVz
LWRldnRvb2xzL3B5dGhvbi9weXRob24zLXJwZHMtcHktY3JhdGVzLmluYwpAQCAtMyw4MCArMyw1
NCBAQAogIyBmcm9tIENhcmdvLmxvY2sKIFNSQ19VUkkgKz0gIiBcCiAgICAgY3JhdGU6Ly9jcmF0
ZXMuaW8vYXJjaGVyeS8xLjIuMCBcCi0gICAgY3JhdGU6Ly9jcmF0ZXMuaW8vYXV0b2NmZy8xLjEu
MCBcCi0gICAgY3JhdGU6Ly9jcmF0ZXMuaW8vYml0ZmxhZ3MvMS4zLjIgXAorICAgIGNyYXRlOi8v
Y3JhdGVzLmlvL2F1dG9jZmcvMS4zLjAgXAorICAgIGNyYXRlOi8vY3JhdGVzLmlvL2NjLzEuMC45
MCBcCiAgICAgY3JhdGU6Ly9jcmF0ZXMuaW8vY2ZnLWlmLzEuMC4wIFwKLSAgICBjcmF0ZTovL2Ny
YXRlcy5pby9oZWNrLzAuNC4xIFwKLSAgICBjcmF0ZTovL2NyYXRlcy5pby9pbmRvYy8yLjAuNCBc
Ci0gICAgY3JhdGU6Ly9jcmF0ZXMuaW8vbGliYy8wLjIuMTQ3IFwKLSAgICBjcmF0ZTovL2NyYXRl
cy5pby9sb2NrX2FwaS8wLjQuMTAgXAotICAgIGNyYXRlOi8vY3JhdGVzLmlvL21lbW9mZnNldC8w
LjkuMCBcCi0gICAgY3JhdGU6Ly9jcmF0ZXMuaW8vb25jZV9jZWxsLzEuMTguMCBcCi0gICAgY3Jh
dGU6Ly9jcmF0ZXMuaW8vcGFya2luZ19sb3QvMC4xMi4xIFwKLSAgICBjcmF0ZTovL2NyYXRlcy5p
by9wYXJraW5nX2xvdF9jb3JlLzAuOS44IFwKKyAgICBjcmF0ZTovL2NyYXRlcy5pby9oZWNrLzAu
NS4wIFwKKyAgICBjcmF0ZTovL2NyYXRlcy5pby9pbmRvYy8yLjAuNSBcCisgICAgY3JhdGU6Ly9j
cmF0ZXMuaW8vbGliYy8wLjIuMTU1IFwKKyAgICBjcmF0ZTovL2NyYXRlcy5pby9tZW1vZmZzZXQv
MC45LjEgXAorICAgIGNyYXRlOi8vY3JhdGVzLmlvL29uY2VfY2VsbC8xLjE5LjAgXAogICAgIGNy
YXRlOi8vY3JhdGVzLmlvL3BvcnRhYmxlLWF0b21pYy8xLjYuMCBcCi0gICAgY3JhdGU6Ly9jcmF0
ZXMuaW8vcHJvYy1tYWNybzIvMS4wLjY2IFwKLSAgICBjcmF0ZTovL2NyYXRlcy5pby9weW8zLzAu
MjAuMyBcCi0gICAgY3JhdGU6Ly9jcmF0ZXMuaW8vcHlvMy1idWlsZC1jb25maWcvMC4yMC4zIFwK
LSAgICBjcmF0ZTovL2NyYXRlcy5pby9weW8zLWZmaS8wLjIwLjMgXAotICAgIGNyYXRlOi8vY3Jh
dGVzLmlvL3B5bzMtbWFjcm9zLzAuMjAuMyBcCi0gICAgY3JhdGU6Ly9jcmF0ZXMuaW8vcHlvMy1t
YWNyb3MtYmFja2VuZC8wLjIwLjMgXAotICAgIGNyYXRlOi8vY3JhdGVzLmlvL3F1b3RlLzEuMC4z
MSBcCi0gICAgY3JhdGU6Ly9jcmF0ZXMuaW8vcmVkb3hfc3lzY2FsbC8wLjMuNSBcCisgICAgY3Jh
dGU6Ly9jcmF0ZXMuaW8vcHJvYy1tYWNybzIvMS4wLjg2IFwKKyAgICBjcmF0ZTovL2NyYXRlcy5p
by9weW8zLzAuMjIuMiBcCisgICAgY3JhdGU6Ly9jcmF0ZXMuaW8vcHlvMy1idWlsZC1jb25maWcv
MC4yMi4yIFwKKyAgICBjcmF0ZTovL2NyYXRlcy5pby9weW8zLWZmaS8wLjIyLjIgXAorICAgIGNy
YXRlOi8vY3JhdGVzLmlvL3B5bzMtbWFjcm9zLzAuMjIuMiBcCisgICAgY3JhdGU6Ly9jcmF0ZXMu
aW8vcHlvMy1tYWNyb3MtYmFja2VuZC8wLjIyLjIgXAorICAgIGNyYXRlOi8vY3JhdGVzLmlvL3B5
dGhvbjMtZGxsLWEvMC4yLjEwIFwKKyAgICBjcmF0ZTovL2NyYXRlcy5pby9xdW90ZS8xLjAuMzYg
XAogICAgIGNyYXRlOi8vY3JhdGVzLmlvL3JwZHMvMS4xLjAgXAotICAgIGNyYXRlOi8vY3JhdGVz
LmlvL3Njb3BlZ3VhcmQvMS4xLjAgXAotICAgIGNyYXRlOi8vY3JhdGVzLmlvL3NtYWxsdmVjLzEu
MTEuMCBcCiAgICAgY3JhdGU6Ly9jcmF0ZXMuaW8vc3RhdGljX2Fzc2VydGlvbnMvMS4xLjAgXAot
ICAgIGNyYXRlOi8vY3JhdGVzLmlvL3N5bi8yLjAuMzIgXAotICAgIGNyYXRlOi8vY3JhdGVzLmlv
L3RhcmdldC1sZXhpY29uLzAuMTIuOSBcCi0gICAgY3JhdGU6Ly9jcmF0ZXMuaW8vdHJpb21waGUv
MC4xLjkgXAotICAgIGNyYXRlOi8vY3JhdGVzLmlvL3VuaWNvZGUtaWRlbnQvMS4wLjExIFwKKyAg
ICBjcmF0ZTovL2NyYXRlcy5pby9zeW4vMi4wLjY5IFwKKyAgICBjcmF0ZTovL2NyYXRlcy5pby90
YXJnZXQtbGV4aWNvbi8wLjEyLjE0IFwKKyAgICBjcmF0ZTovL2NyYXRlcy5pby90cmlvbXBoZS8w
LjEuMTMgXAorICAgIGNyYXRlOi8vY3JhdGVzLmlvL3VuaWNvZGUtaWRlbnQvMS4wLjEyIFwKICAg
ICBjcmF0ZTovL2NyYXRlcy5pby91bmluZGVudC8wLjIuMyBcCi0gICAgY3JhdGU6Ly9jcmF0ZXMu
aW8vd2luZG93cy10YXJnZXRzLzAuNDguMSBcCi0gICAgY3JhdGU6Ly9jcmF0ZXMuaW8vd2luZG93
c19hYXJjaDY0X2dudWxsdm0vMC40OC4wIFwKLSAgICBjcmF0ZTovL2NyYXRlcy5pby93aW5kb3dz
X2FhcmNoNjRfbXN2Yy8wLjQ4LjAgXAotICAgIGNyYXRlOi8vY3JhdGVzLmlvL3dpbmRvd3NfaTY4
Nl9nbnUvMC40OC4wIFwKLSAgICBjcmF0ZTovL2NyYXRlcy5pby93aW5kb3dzX2k2ODZfbXN2Yy8w
LjQ4LjAgXAotICAgIGNyYXRlOi8vY3JhdGVzLmlvL3dpbmRvd3NfeDg2XzY0X2dudS8wLjQ4LjAg
XAotICAgIGNyYXRlOi8vY3JhdGVzLmlvL3dpbmRvd3NfeDg2XzY0X2dudWxsdm0vMC40OC4wIFwK
LSAgICBjcmF0ZTovL2NyYXRlcy5pby93aW5kb3dzX3g4Nl82NF9tc3ZjLzAuNDguMCBcCiAiCiAK
IFNSQ19VUklbYXJjaGVyeS0xLjIuMC5zaGEyNTZzdW1dID0gIjg5NjdjZDFjYzllOWUxOTU0ZjY0
NGUxNGZiZDYwNDJmZTlhMzdkYTk2YzUyYTY3ZTQ0YTJhYzE4MjYxZjg1NjEiCi1TUkNfVVJJW2F1
dG9jZmctMS4xLjAuc2hhMjU2c3VtXSA9ICJkNDY4ODAyYmFiMTdjYmMwY2M1NzVlOWIwNTNmNDFl
NzJhYTM2YmZhNmI3ZjU1ZTM1MjlmZmE0MzE2MWI5N2ZhIgotU1JDX1VSSVtiaXRmbGFncy0xLjMu
Mi5zaGEyNTZzdW1dID0gImJlZjM4ZDQ1MTYzYzJmMWRkZTA5NGE3ZGZkMzNjY2Y1OTVjOTI5MDVj
OGY4ZjRmZGMxOGQwNmZiMTAzNzcxOGEiCitTUkNfVVJJW2F1dG9jZmctMS4zLjAuc2hhMjU2c3Vt
XSA9ICIwYzRiNGQwYmQyNWJkMGI3NDY4MWMwYWQyMTQ5NzYxMGNlMWI3YzkxYjEwMjJjZDIxYzgw
YzZmYmRkOTQ3NmIwIgorU1JDX1VSSVtjYy0xLjAuOTAuc2hhMjU2c3VtXSA9ICI4Y2Q2NjA0YTgy
YWNmMzAzOWYxMTQ0ZjU0YjhlYjM0ZTkxZmZiYTYyMjA1MTE4OWU3MWI3ODE4MjJkNWVlMWY1Igog
U1JDX1VSSVtjZmctaWYtMS4wLjAuc2hhMjU2c3VtXSA9ICJiYWYxZGU0MzM5NzYxNTg4YmMwNjE5
ZTNjYmMwMTIwZWU1ODJlYmI3NGI1M2I0ZWZiZjc5MTE3YmQyZGE0MGZkIgotU1JDX1VSSVtoZWNr
LTAuNC4xLnNoYTI1NnN1bV0gPSAiOTU1MDVjMzhiNDU3MmIyZDkxMGNlY2IwMjgxNTYwZjU0YjQ0
MGExOTMzNmNiYmNiMjdiZjZjZTZhZGM2ZjVhOCIKLVNSQ19VUklbaW5kb2MtMi4wLjQuc2hhMjU2
c3VtXSA9ICIxZTE4NmNmYmFlODA4NGU1MTNkYWZmNDI0MGI0Nzk3ZTM0MmY5ODhjZWNkYTRmYjZj
OTM5MTUwZjk2MzE1ZmQ4IgotU1JDX1VSSVtsaWJjLTAuMi4xNDcuc2hhMjU2c3VtXSA9ICJiNDY2
OGZiMGVhODYxYzFkZjA5NDEyN2FjNWYxZGEzNDA5YTgyMTE2YTRiYTc0ZmNhMmU1OGVmOTI3MTU5
YmIzIgotU1JDX1VSSVtsb2NrX2FwaS0wLjQuMTAuc2hhMjU2c3VtXSA9ICJjMWNjOTcxN2EyMGIx
YmIyMjJmMzMzZTZhOTJmZDMyZjdkOGExOGRkYzVhMzE5MWExMWFmNDVkY2JmNGRjZDE2IgotU1JD
X1VSSVttZW1vZmZzZXQtMC45LjAuc2hhMjU2c3VtXSA9ICI1YTYzNGIxYzYxYTk1NTg1YmQxNTYw
N2M2YWIwYzRlNWIyMjZlNjk1ZmYyODAwYmEwY2RjY2RkZjIwOGM0MDZjIgotU1JDX1VSSVtvbmNl
X2NlbGwtMS4xOC4wLnNoYTI1NnN1bV0gPSAiZGQ4YjVkZDJhZTVlZDcxNDYyYzU0MDI1OGJlZGNi
NTE5NjUxMjNhZDdlN2NjZjRiOWE4Y2FmYWE0YTYzNTc2ZCIKLVNSQ19VUklbcGFya2luZ19sb3Qt
MC4xMi4xLnNoYTI1NnN1bV0gPSAiMzc0MmIyYzEwM2I5ZjA2YmM5ZmZmMGEzN2ZmNDkxMjkzNTg1
MWJlZTZkMzZmM2MwMmJjYzc1NWJjZmVjMjI4ZiIKLVNSQ19VUklbcGFya2luZ19sb3RfY29yZS0w
LjkuOC5zaGEyNTZzdW1dID0gIjkzZjAwYzg2NWZlN2NhYmY2NTAwODFhZmZlY2QzODcxMDcwZjI2
NzY3ZTdiMjA3MGEzZmZhZTE0YzY1NGI0NDciCitTUkNfVVJJW2hlY2stMC41LjAuc2hhMjU2c3Vt
XSA9ICIyMzA0ZTAwOTgzZjg3ZmZiMzhiNTViNDQ0YjVlM2I2MGE4ODRiNWQzMGMwZmNhN2Q4MmZl
MzM0NDliYmU1NWVhIgorU1JDX1VSSVtpbmRvYy0yLjAuNS5zaGEyNTZzdW1dID0gImIyNDhmNTIy
NGQxZDYwNjAwNWUwMmM5N2Y1YWE0ZTg4ZWViMjMwNDg4YmNjMDNiYzljYTRkNzk5MTM5OWYyYjUi
CitTUkNfVVJJW2xpYmMtMC4yLjE1NS5zaGEyNTZzdW1dID0gIjk3YjM4ODhhNGFlY2Y3N2U4MTEx
NDVjYWRmNmVlZjU5MDFmNDc4MmM1Mzg4NjE5MWIyZjY5M2YyNDc2MTg0N2MiCitTUkNfVVJJW21l
bW9mZnNldC0wLjkuMS5zaGEyNTZzdW1dID0gIjQ4ODAxNmJmYWU0NTdiMDM2ZDk5NjA5MmY2Y2I0
NDg2Nzc2MTFjZTQ0NDllOTcwY2VhZjQyNjk1MjAzZjIxOGEiCitTUkNfVVJJW29uY2VfY2VsbC0x
LjE5LjAuc2hhMjU2c3VtXSA9ICIzZmRiMTJiMjQ3NmI1OTVmOTM1OGM1MTYxYWE0NjdjMjQzODg1
OWNhYTEzNmRlYzg2YzI2ZmRkMmVmZTE3YjkyIgogU1JDX1VSSVtwb3J0YWJsZS1hdG9taWMtMS42
LjAuc2hhMjU2c3VtXSA9ICI3MTcwZWY5OTg4YmMxNjliYTE2ZGQzNmE3ZmEwNDFlNWM0Y2JlYjZh
MzViNzZkNGMwM2RhZGVkMzcxZWFlN2MwIgotU1JDX1VSSVtwcm9jLW1hY3JvMi0xLjAuNjYuc2hh
MjU2c3VtXSA9ICIxOGZiMzFkYjNmOWJkZGIyZWE4MjFjZGUzMGE5ZjcwMTE3ZTNmMTE5OTM4YjVl
ZTYzMGI3NDAzYWE2ZTJlYWQ5IgotU1JDX1VSSVtweW8zLTAuMjAuMy5zaGEyNTZzdW1dID0gIjUz
YmRiYjk2ZDQ5MTU3ZTY1ZDQ1Y2MyODdhZjVmMzJmZmFkZDVmNDc2MTQzOGI1MjdiMDU1ZmIwZDRi
YjgyMzMiCi1TUkNfVVJJW3B5bzMtYnVpbGQtY29uZmlnLTAuMjAuMy5zaGEyNTZzdW1dID0gImRl
YWE1NzQ1ZGUzZjUyMzFjZTEwNTE3YTFmNWRkOTdkNTNlNWEyZmQ3N2FhNmI1ODQyMjkyMDg1ODMx
ZDQ4ZDciCi1TUkNfVVJJW3B5bzMtZmZpLTAuMjAuMy5zaGEyNTZzdW1dID0gIjYyYjQyNTMxZDAz
ZTA4ZDRlZjFmNmU4NWEyZWQ0MjJlYjY3OGI4Y2Q2MmI3NjJlNTM4OTFjMDVmYWYwZDRhZmEiCi1T
UkNfVVJJW3B5bzMtbWFjcm9zLTAuMjAuMy5zaGEyNTZzdW1dID0gIjczMDVjNzIwZmEwMWI4MDU1
ZWM5NWU0ODRhNmVjYTdhODNjODQxMjY3ZjBkZDUyODBmMGM4Yjg1NTFkMmMxNTgiCi1TUkNfVVJJ
W3B5bzMtbWFjcm9zLWJhY2tlbmQtMC4yMC4zLnNoYTI1NnN1bV0gPSAiN2M3ZTliNjhiYjljMzE0
OWM1YjBjYWRlNWQwN2Y5NTNkNmQxMjVlYjQzMzc3MjNjNGNjZGI2NjVmMWY5NjE4NSIKLVNSQ19V
UklbcXVvdGUtMS4wLjMxLnNoYTI1NnN1bV0gPSAiNWZlOGE2NWQ2OWRkMDgwODE4NGViYjVmODM2
YWI1MjZiYjI1OWRiMjNjNjU3ZWZhMzg3MTFiMTA3MmVlNDdmMCIKLVNSQ19VUklbcmVkb3hfc3lz
Y2FsbC0wLjMuNS5zaGEyNTZzdW1dID0gIjU2NzY2NGYyNjI3MDk0NzM5MzBhNGJmOWU1MWJmMmVi
ZjMzNDhmMmU3NDhjY2M1MGRlYTIwNjQ2ODU4ZjhmMjkiCitTUkNfVVJJW3Byb2MtbWFjcm8yLTEu
MC44Ni5zaGEyNTZzdW1dID0gIjVlNzE5ZThkZjY2NWRmMGQxYzhmYmZkMjM4MDE1NzQ0NzM2MTUx
ZDQ0NDVlYzA4MzZiOGU2MjhhYWUxMDNiNzciCitTUkNfVVJJW3B5bzMtMC4yMi4yLnNoYTI1NnN1
bV0gPSAiODMxZThlODE5YTEzOGMzNmUyMTJmM2FmM2ZkOWVlZmZlZDZiZjE1MTBhODA1YWYzNWIw
ZWRlZTVmZmE1OTQzMyIKK1NSQ19VUklbcHlvMy1idWlsZC1jb25maWctMC4yMi4yLnNoYTI1NnN1
bV0gPSAiMWU4NzMwZTU5MWIxNDQ5MmE4OTQ1Y2RmZjMyZjA4OTI1MGIwNWY1YWNjZWNmNzRhZWRk
ZjllODI3MmNlMWZhOCIKK1NSQ19VUklbcHlvMy1mZmktMC4yMi4yLnNoYTI1NnN1bV0gPSAiNWU5
N2U5MTlkMmRmOTJlYjg4Y2E4MGEwMzc5NjlmNDRlNWU3MDM1NjU1OTY1NDk2MmNiYjMzMTZkMDAz
MDBjNiIKK1NSQ19VUklbcHlvMy1tYWNyb3MtMC4yMi4yLnNoYTI1NnN1bV0gPSAiZWI1Nzk4MzAy
MmFkNDFmOWU2ODNhNTk5ZjJmZDEzYzM2NjRkNzA2M2EzYWM1NzE0Y2FlNGI3YmVlN2QzZjIwNiIK
K1NSQ19VUklbcHlvMy1tYWNyb3MtYmFja2VuZC0wLjIyLjIuc2hhMjU2c3VtXSA9ICJlYzQ4MGMw
YzUxZGRlYzgxMDE5NTMxNzA1YWNhYzUxYmNkYmVhZTU2MzU1N2M5ODJhYTgyNjNiYjk2ODgwMzcy
IgorU1JDX1VSSVtweXRob24zLWRsbC1hLTAuMi4xMC5zaGEyNTZzdW1dID0gImJkMGI3ODE3MWE5
MGQ4MDhiMzE5YWNmYWQxNjZjNDc5MGQ5ZTk3NTliYmMxNGFjODI3M2ZlMTMzNjczZGQ0MWIiCitT
UkNfVVJJW3F1b3RlLTEuMC4zNi5zaGEyNTZzdW1dID0gIjBmYTc2YWFmMzkxMDFjNDU3ODM2YWVj
MGNlMjMxNmRiZGMzYWI3MjNjZGRhMWM2YmQ0ZTZhZDQyMDhhY2FjYTciCiBTUkNfVVJJW3JwZHMt
MS4xLjAuc2hhMjU2c3VtXSA9ICJhMGUxNTUxNWQzY2UzMzEzMzI0ZDg0MjYyOWVhNDkwNWMyNWEx
M2Y4MTk1M2VhZGI4OGY4NTUxNmY1OTI5MGE0IgotU1JDX1VSSVtzY29wZWd1YXJkLTEuMS4wLnNo
YTI1NnN1bV0gPSAiZDI5YWIwYzZkM2ZjMGVlOTJmZTY2ZTJkOTlmNzAwZWFiMTdhOGQ1N2QxYzFk
M2I3NDgzODBmYjIwYmFhNzhjZCIKLVNSQ19VUklbc21hbGx2ZWMtMS4xMS4wLnNoYTI1NnN1bV0g
PSAiNjJiYjRmZWVlNDlmZGQ5ZjcwN2VmODAyZTIyMzY1YTM1ZGU0YjdiMjk5ZGU0NzYzZDQ0YmZl
YTg5OTQ0MmZmOSIKIFNSQ19VUklbc3RhdGljX2Fzc2VydGlvbnMtMS4xLjAuc2hhMjU2c3VtXSA9
ICJhMmViOTM0OWI2NDQ0YjMyNjg3MmUxNDBlYjFjZjVlN2M1MjIxNTRkNjllN2EwZmZiMGZiODFj
MDZiMzc1NDNmIgotU1JDX1VSSVtzeW4tMi4wLjMyLnNoYTI1NnN1bV0gPSAiMjM5ODE0Mjg0ZmQ2
ZjFhNGZmZTRjYTg5Mzk1MmNkZDkzYzIyNGI2YTE1NzFjOWE5ZWFkZDY3MDI5NWMwYzllMiIKLVNS
Q19VUklbdGFyZ2V0LWxleGljb24tMC4xMi45LnNoYTI1NnN1bV0gPSAiZGY4ZTc3Y2I3NTdhNjFm
NTFiOTQ3ZWM0YTdlMzY0NmVmZDgyNWI3MzU2MWRiMWMyMzJhOGNjYjYzOWU2MTFhMCIKLVNSQ19V
UklbdHJpb21waGUtMC4xLjkuc2hhMjU2c3VtXSA9ICIwZWVlODA5OGFmYWQzZmIwYzU0YTkwMDdh
YWI2ODA0NTU4NDEwNTAzYWQ2NzZkNDYzM2Y5YzI1NTlhMDBhYzBmIgotU1JDX1VSSVt1bmljb2Rl
LWlkZW50LTEuMC4xMS5zaGEyNTZzdW1dID0gIjMwMWFiYWFlNDc1YWE5MTY4N2ViODI1MTRiMzI4
YWI0N2EyMTFhNTMzMDI2Y2IyNWZjM2U1MTliODZhZGZjM2MiCitTUkNfVVJJW3N5bi0yLjAuNjku
c2hhMjU2c3VtXSA9ICIyMDFmY2RhMzg0NWMyM2U4MjEyY2Q0NjZiZmViZjBiZDIwNjk0NDkwZmMw
MzU2YWU4ZTQyOGUwODI0YTkxNWE2IgorU1JDX1VSSVt0YXJnZXQtbGV4aWNvbi0wLjEyLjE0LnNo
YTI1NnN1bV0gPSAiZTFmYzQwMzg5MWEyMWJjZmI3YzM3ODM0YmE2NmE1NDdhOGY0MDIxNDZlYmE3
MjY1YjVhNmQ4ODA1OWM5ZmYyZiIKK1NSQ19VUklbdHJpb21waGUtMC4xLjEzLnNoYTI1NnN1bV0g
PSAiZTY2MzFlNDJlMTBiNDBjMDY5MGJmOTJmNDA0ZWJjZmU2ZTFmZGI0ODAzOTFkMTVmMTdjYzhl
OTZlZWVkNTM2OSIKK1NSQ19VUklbdW5pY29kZS1pZGVudC0xLjAuMTIuc2hhMjU2c3VtXSA9ICIz
MzU0YjlhYzNmYWUxZmY2NzU1Y2I2ZGI1MzY4M2FkYjY2MTYzNGY2NzU1Nzk0MmRlYTRmYWNlYmVj
MGZlZTRiIgogU1JDX1VSSVt1bmluZGVudC0wLjIuMy5zaGEyNTZzdW1dID0gImM3ZGU3ZDczZTE3
NTQ0ODdjYjU4MzY0ZWU5MDZhNDk5OTM3YTBkZmFiZDg2YmNiOTgwZmE5OWVjOGM4ZmEyY2UiCi1T
UkNfVVJJW3dpbmRvd3MtdGFyZ2V0cy0wLjQ4LjEuc2hhMjU2c3VtXSA9ICIwNWQ0YjE3NDkwZjcw
NDk5ZjIwYjllNzkxZGNmNmEyOTk3ODVjZThhZjRkNzA5MDE4MjA2ZGM1YjQ5NTNlOTVmIgotU1JD
X1VSSVt3aW5kb3dzX2FhcmNoNjRfZ251bGx2bS0wLjQ4LjAuc2hhMjU2c3VtXSA9ICI5MWFlNTcy
ZTFiNzlkYmE4ODNlMGQzMTU0NzRkZjczMDVkMTJmNTY5YjQwMGZjZjkwNTgxYjA2MDYyZjdlMWJj
IgotU1JDX1VSSVt3aW5kb3dzX2FhcmNoNjRfbXN2Yy0wLjQ4LjAuc2hhMjU2c3VtXSA9ICJiMmVm
MjdlMGQ3YmRmY2ZjN2I4NjhiMzE3YzFkMzJjNjQxYTZmZTQ2MjljMTcxYjg5MjhjN2IwOGQ5OGQ3
Y2YzIgotU1JDX1VSSVt3aW5kb3dzX2k2ODZfZ251LTAuNDguMC5zaGEyNTZzdW1dID0gIjYyMmEx
OTYyYTdkYjgzMGQ2ZmQwYTY5NjgzYzgwYTE4ZmRhMjAxODc5ZjBmNDQ3ZjA2NWEzYjc0NjdkYWEy
NDEiCi1TUkNfVVJJW3dpbmRvd3NfaTY4Nl9tc3ZjLTAuNDguMC5zaGEyNTZzdW1dID0gIjQ1NDJj
NmUzNjRjZTIxYmY0NWQ2OWZkZDJhOGU0NTVmYTM4ZDMxNjE1OGNmZDQzYjNhYzFjNWIxYjE5Zjhl
MDAiCi1TUkNfVVJJW3dpbmRvd3NfeDg2XzY0X2dudS0wLjQ4LjAuc2hhMjU2c3VtXSA9ICJjYTJi
OGE2NjFmNzYyOGNiZDIzNDQwZTUwYjA1ZDcwNWRiMzY4NmY4OTRmYzk1ODA4MjA2MjM2NTZhZjk3
NGIxIgotU1JDX1VSSVt3aW5kb3dzX3g4Nl82NF9nbnVsbHZtLTAuNDguMC5zaGEyNTZzdW1dID0g
Ijc4OTZkYmMxZjQxZTA4ODcyZTlkNWU4ZjhiYWE4ZmRkMjY3N2YyOTQ2OGM0ZTE1NjIxMDE3NGVk
YzdmN2I5NTMiCi1TUkNfVVJJW3dpbmRvd3NfeDg2XzY0X21zdmMtMC40OC4wLnNoYTI1NnN1bV0g
PSAiMWE1MTVmNTc5OWZlNDk2MWNiNTMyZjk4M2NlMmIyMzA4MjM2NmI4OThlNTJmZmJjZTQ1OWM4
NmY2N2M4Mzc4YSIKZGlmZiAtLWdpdCBhL21ldGEvcmVjaXBlcy1kZXZ0b29scy9weXRob24vcHl0
aG9uMy1ycGRzLXB5XzAuMTguMS5iYiBiL21ldGEvcmVjaXBlcy1kZXZ0b29scy9weXRob24vcHl0
aG9uMy1ycGRzLXB5XzAuMjAuMC5iYgpzaW1pbGFyaXR5IGluZGV4IDg4JQpyZW5hbWUgZnJvbSBt
ZXRhL3JlY2lwZXMtZGV2dG9vbHMvcHl0aG9uL3B5dGhvbjMtcnBkcy1weV8wLjE4LjEuYmIKcmVu
YW1lIHRvIG1ldGEvcmVjaXBlcy1kZXZ0b29scy9weXRob24vcHl0aG9uMy1ycGRzLXB5XzAuMjAu
MC5iYgppbmRleCBmNDZkZjExMTVjLi5kZDQ4M2VkODhlIDEwMDY0NAotLS0gYS9tZXRhL3JlY2lw
ZXMtZGV2dG9vbHMvcHl0aG9uL3B5dGhvbjMtcnBkcy1weV8wLjE4LjEuYmIKKysrIGIvbWV0YS9y
ZWNpcGVzLWRldnRvb2xzL3B5dGhvbi9weXRob24zLXJwZHMtcHlfMC4yMC4wLmJiCkBAIC02LDcg
KzYsNyBAQCBMSUNfRklMRVNfQ0hLU1VNID0gImZpbGU6Ly9MSUNFTlNFO21kNT03NzY3ZmE1Mzdj
NDU5NmM1NDE0MWYzMjg4MmM0YTk4NCIKIAogU1JDX1VSSSArPSAiZmlsZTovL3J1bi1wdGVzdCIK
IAotU1JDX1VSSVtzaGEyNTZzdW1dID0gImRjNDhiNDc5ZDU0MDc3MGM4MTFmYmQxZWI5YmEyYmI2
Njk1MTg2M2U0NDhlZmVjMmUyYzEwMjYyNTMyOGU5MmYiCitTUkNfVVJJW3NoYTI1NnN1bV0gPSAi
ZDcyYTIxMDgyNGZhY2ZkYWY4NzY4Y2YyZDdjYTI1YTA0MmMzMDMyMGIzMDIwZGUyZmEwNDY0MDky
MGQ0ZTEyMSIKIAogcmVxdWlyZSAke0JQTn0tY3JhdGVzLmluYwogCi0tIAoyLjQ0LjAKCg==

--===============5061958980168379634==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment; filename="buildhistory-diff-full.txt"

packages/core2-64-poky-linux/python3-rpds-py: PKGV changed from 0.18.1 [default] to 0.20.0 [default]
packages/core2-64-poky-linux/python3-rpds-py: SRC_URI changed from "https://files.pythonhosted.org/packages/source/r/rpds_py/rpds_py-0.18.1.tar.gz;downloadfilename=rpds_py-0.18.1.tar.gz file://run-ptest crate://crates.io/archery/1.2.0 crate://crates.io/autocfg/1.1.0 crate://crates.io/bitflags/1.3.2 crate://crates.io/cfg-if/1.0.0 crate://crates.io/heck/0.4.1 crate://crates.io/indoc/2.0.4 crate://crates.io/libc/0.2.147 crate://crates.io/lock_api/0.4.10 crate://crates.io/memoffset/0.9.0 crate://crates.io/once_cell/1.18.0 crate://crates.io/parking_lot/0.12.1 crate://crates.io/parking_lot_core/0.9.8 crate://crates.io/portable-atomic/1.6.0 crate://crates.io/proc-macro2/1.0.66 crate://crates.io/pyo3/0.20.3 crate://crates.io/pyo3-build-config/0.20.3 crate://crates.io/pyo3-ffi/0.20.3 crate://crates.io/pyo3-macros/0.20.3 crate://crates.io/pyo3-macros-backend/0.20.3 crate://crates.io/quote/1.0.31 crate://crates.io/redox_syscall/0.3.5 crate://crates.io/rpds/1.1.0 crate://crates.io/scopeguard/1.1
 .0 crate://crates.io/smallvec/1.11.0 crate://crates.io/static_assertions/1.1.0 crate://crates.io/syn/2.0.32 crate://crates.io/target-lexicon/0.12.9 crate://crates.io/triomphe/0.1.9 crate://crates.io/unicode-ident/1.0.11 crate://crates.io/unindent/0.2.3 crate://crates.io/windows-targets/0.48.1 crate://crates.io/windows_aarch64_gnullvm/0.48.0 crate://crates.io/windows_aarch64_msvc/0.48.0 crate://crates.io/windows_i686_gnu/0.48.0 crate://crates.io/windows_i686_msvc/0.48.0 crate://crates.io/windows_x86_64_gnu/0.48.0 crate://crates.io/windows_x86_64_gnullvm/0.48.0 crate://crates.io/windows_x86_64_msvc/0.48.0" to "https://files.pythonhosted.org/packages/source/r/rpds_py/rpds_py-0.20.0.tar.gz;downloadfilename=rpds_py-0.20.0.tar.gz file://run-ptest crate://crates.io/archery/1.2.0 crate://crates.io/autocfg/1.3.0 crate://crates.io/cc/1.0.90 crate://crates.io/cfg-if/1.0.0 crate://crates.io/heck/0.5.0 crate://crates.io/indoc/2.0.5 crate://crates.io/libc/0.2.155 crate://crates.io/memoffset/0.9.1
  crate://crates.io/once_cell/1.19.0 crate://crates.io/portable-atomic/1.6.0 crate://crates.io/proc-macro2/1.0.86 crate://crates.io/pyo3/0.22.2 crate://crates.io/pyo3-build-config/0.22.2 crate://crates.io/pyo3-ffi/0.22.2 crate://crates.io/pyo3-macros/0.22.2 crate://crates.io/pyo3-macros-backend/0.22.2 crate://crates.io/python3-dll-a/0.2.10 crate://crates.io/quote/1.0.36 crate://crates.io/rpds/1.1.0 crate://crates.io/static_assertions/1.1.0 crate://crates.io/syn/2.0.69 crate://crates.io/target-lexicon/0.12.14 crate://crates.io/triomphe/0.1.13 crate://crates.io/unicode-ident/1.0.12 crate://crates.io/unindent/0.2.3"
packages/core2-64-poky-linux/python3-rpds-py: PV changed from "0.18.1" to "0.20.0"
packages/core2-64-poky-linux/python3-rpds-py/python3-rpds-py-dbg: PKGV changed from 0.18.1 [default] to 0.20.0 [default]
packages/core2-64-poky-linux/python3-rpds-py/python3-rpds-py-dbg: PKGSIZE changed from 287056 to 271344 (-5%)
packages/core2-64-poky-linux/python3-rpds-py/python3-rpds-py-dbg: PV changed from "0.18.1" to "0.20.0"
packages/core2-64-poky-linux/python3-rpds-py/python3-rpds-py-dev: PKGV changed from 0.18.1 [default] to 0.20.0 [default]
packages/core2-64-poky-linux/python3-rpds-py/python3-rpds-py-dev: PV changed from "0.18.1" to "0.20.0"
packages/core2-64-poky-linux/python3-rpds-py/python3-rpds-py-doc: PKGV changed from 0.18.1 [default] to 0.20.0 [default]
packages/core2-64-poky-linux/python3-rpds-py/python3-rpds-py-doc: PV changed from "0.18.1" to "0.20.0"
packages/core2-64-poky-linux/python3-rpds-py/python3-rpds-py-locale: PKGV changed from 0.18.1 [default] to 0.20.0 [default]
packages/core2-64-poky-linux/python3-rpds-py/python3-rpds-py-locale: PV changed from "0.18.1" to "0.20.0"
packages/core2-64-poky-linux/python3-rpds-py/python3-rpds-py-ptest: PKGV changed from 0.18.1 [default] to 0.20.0 [default]
packages/core2-64-poky-linux/python3-rpds-py/python3-rpds-py-ptest: PKGSIZE changed from 27932 to 29493 (+6%)
packages/core2-64-poky-linux/python3-rpds-py/python3-rpds-py-ptest: PV changed from "0.18.1" to "0.20.0"
packages/core2-64-poky-linux/python3-rpds-py/python3-rpds-py-src: PKGV changed from 0.18.1 [default] to 0.20.0 [default]
packages/core2-64-poky-linux/python3-rpds-py/python3-rpds-py-src: PV changed from "0.18.1" to "0.20.0"
packages/core2-64-poky-linux/python3-rpds-py/python3-rpds-py-staticdev: PKGV changed from 0.18.1 [default] to 0.20.0 [default]
packages/core2-64-poky-linux/python3-rpds-py/python3-rpds-py-staticdev: PV changed from "0.18.1" to "0.20.0"
packages/core2-64-poky-linux/python3-rpds-py/python3-rpds-py: PKGV changed from 0.18.1 [default] to 0.20.0 [default]
packages/core2-64-poky-linux/python3-rpds-py/python3-rpds-py: PKGSIZE changed from 733501 to 758096 (+3%)
packages/core2-64-poky-linux/python3-rpds-py/python3-rpds-py: PV changed from "0.18.1" to "0.20.0"
Changes to packages/core2-64-poky-linux/python3-rpds-py (sysroot):
  /usr/lib/python3.12/site-packages/rpds_py-0.18.1.dist-info moved to /usr/lib/python3.12/site-packages/rpds_py-0.20.0.dist-info

--===============5061958980168379634==--

