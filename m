Return-Path: <auh@yoctoproject.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 37F7FC531FF
	for <webhook@archiver.kernel.org>; Wed, 18 Feb 2026 18:42:02 +0000 (UTC)
Received: from a27-192.smtp-out.us-west-2.amazonses.com (a27-192.smtp-out.us-west-2.amazonses.com [54.240.27.192])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.1385.1771440096850223046
 for <openembedded-core@lists.openembedded.org>;
 Wed, 18 Feb 2026 10:41:50 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@yoctoproject.org header.s=j46ser6a2yusdzubpv7m7ewqgesde2ie header.b=Z8Yzz1gI;
 dkim=pass header.i=@amazonses.com header.s=gdwg2y3kokkkj5a55z2ilkup5wp5hhxx header.b=D5S97JFM;
 spf=pass (domain: us-west-2.amazonses.com, ip: 54.240.27.192, mailfrom: 0101019c720ef9c0-c37255a9-2afe-4bfe-92cf-d0cf08eabeb8-000000@us-west-2.amazonses.com)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=j46ser6a2yusdzubpv7m7ewqgesde2ie; d=yoctoproject.org;
	t=1771440110;
	h=Content-Type:MIME-Version:From:To:Cc:Subject:Message-Id:Date;
	bh=x8ILAKLdK8V/IfcCcjKA0CuP+ffqibsZMm6vUCg4SGk=;
	b=Z8Yzz1gIb2E7GCCdeOQkEZzLvCbKg2Af+x4MUGYf/jKrV1zNbndho6YcpGCwCE9B
	FpiF5AOIrv4ickYLJ/fXEqo7YVxz+Mv4cvo8zPFDqIKWVCUIWAgbOVg9R5EcxNpvrPF
	6MWpK4y/qr5N3XZVL/s5ZZ89SVXH03u+FNcca4K0=
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=gdwg2y3kokkkj5a55z2ilkup5wp5hhxx; d=amazonses.com; t=1771440110;
	h=Content-Type:MIME-Version:From:To:Cc:Subject:Message-Id:Date:Feedback-ID;
	bh=x8ILAKLdK8V/IfcCcjKA0CuP+ffqibsZMm6vUCg4SGk=;
	b=D5S97JFMC32+QkTDL3cwOKner5kxk6pYbDJMIVa8XMfgc87GVNzSS3RXkObvVcuL
	wrmoKdfflgy5bxYrHXJqRuF60F24wZKJWEMM5qEs320EKvVqfg4jVC/h1X7HlsmdLhO
	O8BRyqZizQRMudJoDM2E0HWJqSTOG/4FL+EY9RFQ=
Content-Type: multipart/mixed; boundary="===============4660349492663749562=="
MIME-Version: 1.0
From: auh@yoctoproject.org
To: openembedded-core@lists.openembedded.org
Cc: 
Subject: [AUH] librsvg: upgrading to 2.61.4 SUCCEEDED
Message-ID: <0101019c720ef9c0-c37255a9-2afe-4bfe-92cf-d0cf08eabeb8-000000@us-west-2.amazonses.com>
Date: Wed, 18 Feb 2026 18:41:50 +0000
Feedback-ID: ::1.us-west-2.9np3MYPs3fEaOBysGKSlUD4KtcmPijcmS9Az2Hwf7iQ=:AmazonSES
X-SES-Outgoing: 2026.02.18-54.240.27.192
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 18 Feb 2026 18:42:02 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/231381

--===============4660349492663749562==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

Hello,

this email is a notification from the Auto Upgrade Helper
that the automatic attempt to upgrade the recipe(s) *librsvg* to *2.61.4* has Succeeded.

Next steps:
    - apply the patch: git am 0001-librsvg-upgrade-2.61.3-2.61.4.patch
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
From e3567df1aaf30c76aef53342efbfe928b212672e Mon Sep 17 00:00:00 2001
From: Upgrade Helper <auh@yoctoproject.org>
Date: Wed, 18 Feb 2026 15:10:59 +0000
Subject: [PATCH] librsvg: upgrade 2.61.3 -> 2.61.4

---
 meta/recipes-gnome/librsvg/librsvg-crates.inc    | 16 ++++++++--------
 ...build-do-not-force-disable-gdk-pixbuf-l.patch |  2 +-
 ...tc-append-RUSTFLAGS-to-rustc-executable.patch |  2 +-
 ...Take-care-of-deprecated-assert_cmd-Comm.patch |  2 +-
 .../{librsvg_2.61.3.bb => librsvg_2.61.4.bb}     |  2 +-
 5 files changed, 12 insertions(+), 12 deletions(-)
 rename meta/recipes-gnome/librsvg/{librsvg_2.61.3.bb => librsvg_2.61.4.bb} (98%)

diff --git a/meta/recipes-gnome/librsvg/librsvg-crates.inc b/meta/recipes-gnome/librsvg/librsvg-crates.inc
index 2260a6f643..aa3c95c548 100644
--- a/meta/recipes-gnome/librsvg/librsvg-crates.inc
+++ b/meta/recipes-gnome/librsvg/librsvg-crates.inc
@@ -165,7 +165,7 @@ SRC_URI += " \
     crate://crates.io/normalize-line-endings/0.3.0 \
     crate://crates.io/num-bigint/0.4.6 \
     crate://crates.io/num-complex/0.4.6 \
-    crate://crates.io/num-conv/0.1.0 \
+    crate://crates.io/num-conv/0.2.0 \
     crate://crates.io/num-derive/0.4.2 \
     crate://crates.io/num-integer/0.1.46 \
     crate://crates.io/num-rational/0.4.2 \
@@ -268,9 +268,9 @@ SRC_URI += " \
     crate://crates.io/termtree/0.5.1 \
     crate://crates.io/thiserror/2.0.17 \
     crate://crates.io/thiserror-impl/2.0.17 \
-    crate://crates.io/time/0.3.44 \
-    crate://crates.io/time-core/0.1.6 \
-    crate://crates.io/time-macros/0.2.24 \
+    crate://crates.io/time/0.3.47 \
+    crate://crates.io/time-core/0.1.8 \
+    crate://crates.io/time-macros/0.2.27 \
     crate://crates.io/tinystr/0.8.2 \
     crate://crates.io/tinytemplate/1.2.1 \
     crate://crates.io/tinyvec/1.10.0 \
@@ -516,7 +516,7 @@ SRC_URI[nom_locate-5.0.0.sha256sum] = "0b577e2d69827c4740cba2b52efaad1c4cc7c7304
 SRC_URI[normalize-line-endings-0.3.0.sha256sum] = "61807f77802ff30975e01f4f071c8ba10c022052f98b3294119f3e615d13e5be"
 SRC_URI[num-bigint-0.4.6.sha256sum] = "a5e44f723f1133c9deac646763579fdb3ac745e418f2a7af9cd0c431da1f20b9"
 SRC_URI[num-complex-0.4.6.sha256sum] = "73f88a1307638156682bada9d7604135552957b7818057dcef22705b4d509495"
-SRC_URI[num-conv-0.1.0.sha256sum] = "51d515d32fb182ee37cda2ccdcb92950d6a3c2893aa280e540671c2cd0f3b1d9"
+SRC_URI[num-conv-0.2.0.sha256sum] = "cf97ec579c3c42f953ef76dbf8d55ac91fb219dde70e49aa4a6b7d74e9919050"
 SRC_URI[num-derive-0.4.2.sha256sum] = "ed3955f1a9c7c0c15e092f9c887db08b1fc683305fdf6eb6684f22555355e202"
 SRC_URI[num-integer-0.1.46.sha256sum] = "7969661fd2958a5cb096e56c8e1ad0444ac2bbcd0061bd28660485a44879858f"
 SRC_URI[num-rational-0.4.2.sha256sum] = "f83d14da390562dca69fc84082e73e548e1ad308d24accdedd2720017cb37824"
@@ -619,9 +619,9 @@ SRC_URI[tendril-0.4.3.sha256sum] = "d24a120c5fc464a3458240ee02c299ebcb9d67b5249c
 SRC_URI[termtree-0.5.1.sha256sum] = "8f50febec83f5ee1df3015341d8bd429f2d1cc62bcba7ea2076759d315084683"
 SRC_URI[thiserror-2.0.17.sha256sum] = "f63587ca0f12b72a0600bcba1d40081f830876000bb46dd2337a3051618f4fc8"
 SRC_URI[thiserror-impl-2.0.17.sha256sum] = "3ff15c8ecd7de3849db632e14d18d2571fa09dfc5ed93479bc4485c7a517c913"
-SRC_URI[time-0.3.44.sha256sum] = "91e7d9e3bb61134e77bde20dd4825b97c010155709965fedf0f49bb138e52a9d"
-SRC_URI[time-core-0.1.6.sha256sum] = "40868e7c1d2f0b8d73e4a8c7f0ff63af4f6d19be117e90bd73eb1d62cf831c6b"
-SRC_URI[time-macros-0.2.24.sha256sum] = "30cfb0125f12d9c277f35663a0a33f8c30190f4e4574868a330595412d34ebf3"
+SRC_URI[time-0.3.47.sha256sum] = "743bd48c283afc0388f9b8827b976905fb217ad9e647fae3a379a9283c4def2c"
+SRC_URI[time-core-0.1.8.sha256sum] = "7694e1cfe791f8d31026952abf09c69ca6f6fa4e1a1229e18988f06a04a12dca"
+SRC_URI[time-macros-0.2.27.sha256sum] = "2e70e4c5a0e0a8a4823ad65dfe1a6930e4f4d756dcd9dd7939022b5e8c501215"
 SRC_URI[tinystr-0.8.2.sha256sum] = "42d3e9c45c09de15d06dd8acf5f4e0e399e85927b7f00711024eb7ae10fa4869"
 SRC_URI[tinytemplate-1.2.1.sha256sum] = "be4d6b5f19ff7664e8c98d03e2139cb510db9b0a60b55f8e8709b689d939b6bc"
 SRC_URI[tinyvec-1.10.0.sha256sum] = "bfa5fdc3bce6191a1dbc8c02d5c8bffcf557bafa17c124c5264a458f1b0613fa"
diff --git a/meta/recipes-gnome/librsvg/librsvg/0001-Revert-meson.build-do-not-force-disable-gdk-pixbuf-l.patch b/meta/recipes-gnome/librsvg/librsvg/0001-Revert-meson.build-do-not-force-disable-gdk-pixbuf-l.patch
index b62f641d57..cbf59f2046 100644
--- a/meta/recipes-gnome/librsvg/librsvg/0001-Revert-meson.build-do-not-force-disable-gdk-pixbuf-l.patch
+++ b/meta/recipes-gnome/librsvg/librsvg/0001-Revert-meson.build-do-not-force-disable-gdk-pixbuf-l.patch
@@ -1,4 +1,4 @@
-From 33ece256bf7c156a34ab1ee3709718e38829cc9e Mon Sep 17 00:00:00 2001
+From b9a22f36a7008a92d045e73f278c10a7b15b80fd Mon Sep 17 00:00:00 2001
 From: Gyorgy Sarvari <skandigraun@gmail.com>
 Date: Wed, 6 Aug 2025 13:50:21 +0200
 Subject: [PATCH] Revert "meson.build: do not force-disable gdk-pixbuf-loader
diff --git a/meta/recipes-gnome/librsvg/librsvg/0001-query-rustc-append-RUSTFLAGS-to-rustc-executable.patch b/meta/recipes-gnome/librsvg/librsvg/0001-query-rustc-append-RUSTFLAGS-to-rustc-executable.patch
index a3596fc288..20963253be 100644
--- a/meta/recipes-gnome/librsvg/librsvg/0001-query-rustc-append-RUSTFLAGS-to-rustc-executable.patch
+++ b/meta/recipes-gnome/librsvg/librsvg/0001-query-rustc-append-RUSTFLAGS-to-rustc-executable.patch
@@ -1,4 +1,4 @@
-From e89982e61e50c7d25d563f2fa0481f9bba481f04 Mon Sep 17 00:00:00 2001
+From 90d76028b56766971408791bf6b61c425b8ff3c0 Mon Sep 17 00:00:00 2001
 From: Gyorgy Sarvari <skandigraun@gmail.com>
 Date: Sat, 2 Aug 2025 20:57:49 +0200
 Subject: [PATCH] query-rustc: append RUSTFLAGS to rustc executable
diff --git a/meta/recipes-gnome/librsvg/librsvg/0001-tests-revert-Take-care-of-deprecated-assert_cmd-Comm.patch b/meta/recipes-gnome/librsvg/librsvg/0001-tests-revert-Take-care-of-deprecated-assert_cmd-Comm.patch
index f893d81e9a..3fee3e7f62 100644
--- a/meta/recipes-gnome/librsvg/librsvg/0001-tests-revert-Take-care-of-deprecated-assert_cmd-Comm.patch
+++ b/meta/recipes-gnome/librsvg/librsvg/0001-tests-revert-Take-care-of-deprecated-assert_cmd-Comm.patch
@@ -1,4 +1,4 @@
-From bc089af8ce38ad268bc4283040ec28241c5064a6 Mon Sep 17 00:00:00 2001
+From 6216caff03646201c64721078cdf272a39226043 Mon Sep 17 00:00:00 2001
 From: Alexander Kanavin <alex@linutronix.de>
 Date: Thu, 18 Dec 2025 18:43:20 +0100
 Subject: [PATCH] tests: revert 'Take care of deprecated
diff --git a/meta/recipes-gnome/librsvg/librsvg_2.61.3.bb b/meta/recipes-gnome/librsvg/librsvg_2.61.4.bb
similarity index 98%
rename from meta/recipes-gnome/librsvg/librsvg_2.61.3.bb
rename to meta/recipes-gnome/librsvg/librsvg_2.61.4.bb
index cab8471c33..00ca35a94e 100644
--- a/meta/recipes-gnome/librsvg/librsvg_2.61.3.bb
+++ b/meta/recipes-gnome/librsvg/librsvg_2.61.4.bb
@@ -27,7 +27,7 @@ SRC_URI += "file://0001-query-rustc-append-RUSTFLAGS-to-rustc-executable.patch \
             file://0001-Revert-meson.build-do-not-force-disable-gdk-pixbuf-l.patch \
             file://0001-tests-revert-Take-care-of-deprecated-assert_cmd-Comm.patch \
             file://run-ptest"
-SRC_URI[archive.sha256sum] = "a56d2c80d744ad2f2718f85df466fe71d24ff1f9bc3e5ef588bde4d7e87815f2"
+SRC_URI[archive.sha256sum] = "fca0ea28d1f28f95c8407d2579f4702dac085e7c758644daca8b40d1e072ca0c"
 
 UPSTREAM_CHECK_REGEX = "librsvg-(?P<pver>\d+\.\d+\.(?!9\d+)\d+)"
 
-- 
2.47.1


--===============4660349492663749562==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment; filename="buildhistory-diff.txt"

packages/x86-64-v3-poky-linux/librsvg/librsvg-ptest: FILELIST: removed "/usr/lib/librsvg/ptest/loading_disallowed-1faeba7bbcdf4c21 /usr/lib/librsvg/ptest/primitive_geometries-7f1e4c52456514a1 /usr/lib/librsvg/ptest/rsvg_convert-162c4a1883a8e6cb /usr/lib/librsvg/ptest/primitives-5ab53eb2d76f0599 /usr/lib/librsvg/ptest/filters-774fcf19ece0bb6c /usr/lib/librsvg/ptest/errors-bd66fe68a37328e6 /usr/lib/librsvg/ptest/rsvg-bf4241f815cd4c8b /usr/lib/librsvg/ptest/reference-dfa3eb92a17bc4d4 /usr/lib/librsvg/ptest/shapes-df2f735ae94dc558 /usr/lib/librsvg/ptest/loading_crash-7815708013e0de5c /usr/lib/librsvg/ptest/intrinsic_dimensions-8844bfde88fb695c /usr/lib/librsvg/ptest/text-d4b4c4f2ed13df0e /usr/lib/librsvg/ptest/bugs-44871a7a85a30746 /usr/lib/librsvg/ptest/rsvg_convert-f741e7a71b0152f3 /usr/lib/librsvg/ptest/render_crash-c0b18b4f69ba511b /usr/lib/librsvg/ptest/api-0bc3829dacbf0114 /usr/lib/librsvg/ptest/geometries-e58f22a4c673b0ea /usr/lib/librsvg/ptest/rsvg_convert-6fa5b5404531cebf", adde
 d "/usr/lib/librsvg/ptest/geometries-eec0112ba44600dd /usr/lib/librsvg/ptest/render_crash-dffc41b12c497c3e /usr/lib/librsvg/ptest/text-47301d091b73485e /usr/lib/librsvg/ptest/primitive_geometries-83d4db0715e2b57e /usr/lib/librsvg/ptest/rsvg_convert-3a0d54cc25095cdc /usr/lib/librsvg/ptest/loading_crash-3b4b35fa4d47284e /usr/lib/librsvg/ptest/intrinsic_dimensions-31f444b53470848a /usr/lib/librsvg/ptest/loading_disallowed-46281ffc6a661bb9 /usr/lib/librsvg/ptest/primitives-cc097f3866002aed /usr/lib/librsvg/ptest/api-09caabbacf1aed15 /usr/lib/librsvg/ptest/filters-446706903806d1cf /usr/lib/librsvg/ptest/errors-0dd0da945f3b676c /usr/lib/librsvg/ptest/bugs-ae21758c05a24472 /usr/lib/librsvg/ptest/rsvg-2d9ac265f99c3b9e /usr/lib/librsvg/ptest/shapes-88d964dae2bd855f /usr/lib/librsvg/ptest/rsvg_convert-eeda74f5bd7ae4c8 /usr/lib/librsvg/ptest/rsvg_convert-8d8c2d1199dbfb84 /usr/lib/librsvg/ptest/reference-c7d78be0128faea9"
packages/x86-64-v3-poky-linux/librsvg/librsvg: FILELIST: removed "/usr/lib/librsvg-2.so.2.61.3", added "/usr/lib/librsvg-2.so.2.61.4"
Changes to packages/x86-64-v3-poky-linux/librsvg (sysroot):
  /usr/lib/librsvg-2.so.2 changed symlink target from librsvg-2.so.2.61.3 to librsvg-2.so.2.61.4
  /usr/lib/librsvg-2.so.2.61.3 moved to /usr/lib/librsvg-2.so.2.61.4

--===============4660349492663749562==
Content-Type: application/octet-stream
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: attachment;
 filename="0001-librsvg-upgrade-2.61.3-2.61.4.patch"

RnJvbSBlMzU2N2RmMWFhZjMwYzc2YWVmNTMzNDJlZmJmZTkyOGIyMTI2NzJlIE1vbiBTZXAgMTcg
MDA6MDA6MDAgMjAwMQpGcm9tOiBVcGdyYWRlIEhlbHBlciA8YXVoQHlvY3RvcHJvamVjdC5vcmc+
CkRhdGU6IFdlZCwgMTggRmViIDIwMjYgMTU6MTA6NTkgKzAwMDAKU3ViamVjdDogW1BBVENIXSBs
aWJyc3ZnOiB1cGdyYWRlIDIuNjEuMyAtPiAyLjYxLjQKCi0tLQogbWV0YS9yZWNpcGVzLWdub21l
L2xpYnJzdmcvbGlicnN2Zy1jcmF0ZXMuaW5jICAgIHwgMTYgKysrKysrKystLS0tLS0tLQogLi4u
YnVpbGQtZG8tbm90LWZvcmNlLWRpc2FibGUtZ2RrLXBpeGJ1Zi1sLnBhdGNoIHwgIDIgKy0KIC4u
LnRjLWFwcGVuZC1SVVNURkxBR1MtdG8tcnVzdGMtZXhlY3V0YWJsZS5wYXRjaCB8ICAyICstCiAu
Li5UYWtlLWNhcmUtb2YtZGVwcmVjYXRlZC1hc3NlcnRfY21kLUNvbW0ucGF0Y2ggfCAgMiArLQog
Li4uL3tsaWJyc3ZnXzIuNjEuMy5iYiA9PiBsaWJyc3ZnXzIuNjEuNC5iYn0gICAgIHwgIDIgKy0K
IDUgZmlsZXMgY2hhbmdlZCwgMTIgaW5zZXJ0aW9ucygrKSwgMTIgZGVsZXRpb25zKC0pCiByZW5h
bWUgbWV0YS9yZWNpcGVzLWdub21lL2xpYnJzdmcve2xpYnJzdmdfMi42MS4zLmJiID0+IGxpYnJz
dmdfMi42MS40LmJifSAoOTglKQoKZGlmZiAtLWdpdCBhL21ldGEvcmVjaXBlcy1nbm9tZS9saWJy
c3ZnL2xpYnJzdmctY3JhdGVzLmluYyBiL21ldGEvcmVjaXBlcy1nbm9tZS9saWJyc3ZnL2xpYnJz
dmctY3JhdGVzLmluYwppbmRleCAyMjYwYTZmNjQzLi5hYTNjOTVjNTQ4IDEwMDY0NAotLS0gYS9t
ZXRhL3JlY2lwZXMtZ25vbWUvbGlicnN2Zy9saWJyc3ZnLWNyYXRlcy5pbmMKKysrIGIvbWV0YS9y
ZWNpcGVzLWdub21lL2xpYnJzdmcvbGlicnN2Zy1jcmF0ZXMuaW5jCkBAIC0xNjUsNyArMTY1LDcg
QEAgU1JDX1VSSSArPSAiIFwKICAgICBjcmF0ZTovL2NyYXRlcy5pby9ub3JtYWxpemUtbGluZS1l
bmRpbmdzLzAuMy4wIFwKICAgICBjcmF0ZTovL2NyYXRlcy5pby9udW0tYmlnaW50LzAuNC42IFwK
ICAgICBjcmF0ZTovL2NyYXRlcy5pby9udW0tY29tcGxleC8wLjQuNiBcCi0gICAgY3JhdGU6Ly9j
cmF0ZXMuaW8vbnVtLWNvbnYvMC4xLjAgXAorICAgIGNyYXRlOi8vY3JhdGVzLmlvL251bS1jb252
LzAuMi4wIFwKICAgICBjcmF0ZTovL2NyYXRlcy5pby9udW0tZGVyaXZlLzAuNC4yIFwKICAgICBj
cmF0ZTovL2NyYXRlcy5pby9udW0taW50ZWdlci8wLjEuNDYgXAogICAgIGNyYXRlOi8vY3JhdGVz
LmlvL251bS1yYXRpb25hbC8wLjQuMiBcCkBAIC0yNjgsOSArMjY4LDkgQEAgU1JDX1VSSSArPSAi
IFwKICAgICBjcmF0ZTovL2NyYXRlcy5pby90ZXJtdHJlZS8wLjUuMSBcCiAgICAgY3JhdGU6Ly9j
cmF0ZXMuaW8vdGhpc2Vycm9yLzIuMC4xNyBcCiAgICAgY3JhdGU6Ly9jcmF0ZXMuaW8vdGhpc2Vy
cm9yLWltcGwvMi4wLjE3IFwKLSAgICBjcmF0ZTovL2NyYXRlcy5pby90aW1lLzAuMy40NCBcCi0g
ICAgY3JhdGU6Ly9jcmF0ZXMuaW8vdGltZS1jb3JlLzAuMS42IFwKLSAgICBjcmF0ZTovL2NyYXRl
cy5pby90aW1lLW1hY3Jvcy8wLjIuMjQgXAorICAgIGNyYXRlOi8vY3JhdGVzLmlvL3RpbWUvMC4z
LjQ3IFwKKyAgICBjcmF0ZTovL2NyYXRlcy5pby90aW1lLWNvcmUvMC4xLjggXAorICAgIGNyYXRl
Oi8vY3JhdGVzLmlvL3RpbWUtbWFjcm9zLzAuMi4yNyBcCiAgICAgY3JhdGU6Ly9jcmF0ZXMuaW8v
dGlueXN0ci8wLjguMiBcCiAgICAgY3JhdGU6Ly9jcmF0ZXMuaW8vdGlueXRlbXBsYXRlLzEuMi4x
IFwKICAgICBjcmF0ZTovL2NyYXRlcy5pby90aW55dmVjLzEuMTAuMCBcCkBAIC01MTYsNyArNTE2
LDcgQEAgU1JDX1VSSVtub21fbG9jYXRlLTUuMC4wLnNoYTI1NnN1bV0gPSAiMGI1NzdlMmQ2OTgy
N2M0NzQwY2JhMmI1MmVmYWFkMWM0Y2M3YzczMDQKIFNSQ19VUklbbm9ybWFsaXplLWxpbmUtZW5k
aW5ncy0wLjMuMC5zaGEyNTZzdW1dID0gIjYxODA3Zjc3ODAyZmYzMDk3NWUwMWY0ZjA3MWM4YmEx
MGMwMjIwNTJmOThiMzI5NDExOWYzZTYxNWQxM2U1YmUiCiBTUkNfVVJJW251bS1iaWdpbnQtMC40
LjYuc2hhMjU2c3VtXSA9ICJhNWU0NGY3MjNmMTEzM2M5ZGVhYzY0Njc2MzU3OWZkYjNhYzc0NWU0
MThmMmE3YWY5Y2QwYzQzMWRhMWYyMGI5IgogU1JDX1VSSVtudW0tY29tcGxleC0wLjQuNi5zaGEy
NTZzdW1dID0gIjczZjg4YTEzMDc2MzgxNTY2ODJiYWRhOWQ3NjA0MTM1NTUyOTU3Yjc4MTgwNTdk
Y2VmMjI3MDViNGQ1MDk0OTUiCi1TUkNfVVJJW251bS1jb252LTAuMS4wLnNoYTI1NnN1bV0gPSAi
NTFkNTE1ZDMyZmIxODJlZTM3Y2RhMmNjZGNiOTI5NTBkNmEzYzI4OTNhYTI4MGU1NDA2NzFjMmNk
MGYzYjFkOSIKK1NSQ19VUklbbnVtLWNvbnYtMC4yLjAuc2hhMjU2c3VtXSA9ICJjZjk3ZWM1Nzlj
M2M0MmY5NTNlZjc2ZGJmOGQ1NWFjOTFmYjIxOWRkZTcwZTQ5YWE0YTZiN2Q3NGU5OTE5MDUwIgog
U1JDX1VSSVtudW0tZGVyaXZlLTAuNC4yLnNoYTI1NnN1bV0gPSAiZWQzOTU1ZjFhOWM3YzBjMTVl
MDkyZjljODg3ZGIwOGIxZmM2ODMzMDVmZGY2ZWI2Njg0ZjIyNTU1MzU1ZTIwMiIKIFNSQ19VUklb
bnVtLWludGVnZXItMC4xLjQ2LnNoYTI1NnN1bV0gPSAiNzk2OTY2MWZkMjk1OGE1Y2IwOTZlNTZj
OGUxYWQwNDQ0YWMyYmJjZDAwNjFiZDI4NjYwNDg1YTQ0ODc5ODU4ZiIKIFNSQ19VUklbbnVtLXJh
dGlvbmFsLTAuNC4yLnNoYTI1NnN1bV0gPSAiZjgzZDE0ZGEzOTA1NjJkY2E2OWZjODQwODJlNzNl
NTQ4ZTFhZDMwOGQyNGFjY2RlZGQyNzIwMDE3Y2IzNzgyNCIKQEAgLTYxOSw5ICs2MTksOSBAQCBT
UkNfVVJJW3RlbmRyaWwtMC40LjMuc2hhMjU2c3VtXSA9ICJkMjRhMTIwYzVmYzQ2NGEzNDU4MjQw
ZWUwMmMyOTllYmNiOWQ2N2I1MjQ5YwogU1JDX1VSSVt0ZXJtdHJlZS0wLjUuMS5zaGEyNTZzdW1d
ID0gIjhmNTBmZWJlYzgzZjVlZTFkZjMwMTUzNDFkOGJkNDI5ZjJkMWNjNjJiY2JhN2VhMjA3Njc1
OWQzMTUwODQ2ODMiCiBTUkNfVVJJW3RoaXNlcnJvci0yLjAuMTcuc2hhMjU2c3VtXSA9ICJmNjM1
ODdjYTBmMTJiNzJhMDYwMGJjYmExZDQwMDgxZjgzMDg3NjAwMGJiNDZkZDIzMzdhMzA1MTYxOGY0
ZmM4IgogU1JDX1VSSVt0aGlzZXJyb3ItaW1wbC0yLjAuMTcuc2hhMjU2c3VtXSA9ICIzZmYxNWM4
ZWNkN2RlMzg0OWRiNjMyZTE0ZDE4ZDI1NzFmYTA5ZGZjNWVkOTM0NzliYzQ0ODVjN2E1MTdjOTEz
IgotU1JDX1VSSVt0aW1lLTAuMy40NC5zaGEyNTZzdW1dID0gIjkxZTdkOWUzYmI2MTEzNGU3N2Jk
ZTIwZGQ0ODI1Yjk3YzAxMDE1NTcwOTk2NWZlZGYwZjQ5YmIxMzhlNTJhOWQiCi1TUkNfVVJJW3Rp
bWUtY29yZS0wLjEuNi5zaGEyNTZzdW1dID0gIjQwODY4ZTdjMWQyZjBiOGQ3M2U0YThjN2YwZmY2
M2FmNGY2ZDE5YmUxMTdlOTBiZDczZWIxZDYyY2Y4MzFjNmIiCi1TUkNfVVJJW3RpbWUtbWFjcm9z
LTAuMi4yNC5zaGEyNTZzdW1dID0gIjMwY2ZiMDEyNWYxMmQ5YzI3N2YzNTY2M2EwYTMzZjhjMzAx
OTBmNGU0NTc0ODY4YTMzMDU5NTQxMmQzNGViZjMiCitTUkNfVVJJW3RpbWUtMC4zLjQ3LnNoYTI1
NnN1bV0gPSAiNzQzYmQ0OGMyODNhZmMwMzg4ZjliODgyN2I5NzY5MDVmYjIxN2FkOWU2NDdmYWUz
YTM3OWE5MjgzYzRkZWYyYyIKK1NSQ19VUklbdGltZS1jb3JlLTAuMS44LnNoYTI1NnN1bV0gPSAi
NzY5NGUxY2ZlNzkxZjhkMzEwMjY5NTJhYmYwOWM2OWNhNmY2ZmE0ZTFhMTIyOWUxODk4OGYwNmEw
NGExMmRjYSIKK1NSQ19VUklbdGltZS1tYWNyb3MtMC4yLjI3LnNoYTI1NnN1bV0gPSAiMmU3MGU0
YzVhMGUwYThhNDgyM2FkNjVkZmUxYTY5MzBlNGY0ZDc1NmRjZDlkZDc5MzkwMjJiNWU4YzUwMTIx
NSIKIFNSQ19VUklbdGlueXN0ci0wLjguMi5zaGEyNTZzdW1dID0gIjQyZDNlOWM0NWMwOWRlMTVk
MDZkZDhhY2Y1ZjRlMGUzOTllODU5MjdiN2YwMDcxMTAyNGViN2FlMTBmYTQ4NjkiCiBTUkNfVVJJ
W3Rpbnl0ZW1wbGF0ZS0xLjIuMS5zaGEyNTZzdW1dID0gImJlNGQ2YjVmMTlmZjc2NjRlOGM5OGQw
M2UyMTM5Y2I1MTBkYjliMGE2MGI1NWY4ZTg3MDliNjg5ZDkzOWI2YmMiCiBTUkNfVVJJW3Rpbnl2
ZWMtMS4xMC4wLnNoYTI1NnN1bV0gPSAiYmZhNWZkYzNiY2U2MTkxYTFkYmM4YzAyZDVjOGJmZmNm
NTU3YmFmYTE3YzEyNGM1MjY0YTQ1OGYxYjA2MTNmYSIKZGlmZiAtLWdpdCBhL21ldGEvcmVjaXBl
cy1nbm9tZS9saWJyc3ZnL2xpYnJzdmcvMDAwMS1SZXZlcnQtbWVzb24uYnVpbGQtZG8tbm90LWZv
cmNlLWRpc2FibGUtZ2RrLXBpeGJ1Zi1sLnBhdGNoIGIvbWV0YS9yZWNpcGVzLWdub21lL2xpYnJz
dmcvbGlicnN2Zy8wMDAxLVJldmVydC1tZXNvbi5idWlsZC1kby1ub3QtZm9yY2UtZGlzYWJsZS1n
ZGstcGl4YnVmLWwucGF0Y2gKaW5kZXggYjYyZjY0MWQ1Ny4uY2JmNTlmMjA0NiAxMDA2NDQKLS0t
IGEvbWV0YS9yZWNpcGVzLWdub21lL2xpYnJzdmcvbGlicnN2Zy8wMDAxLVJldmVydC1tZXNvbi5i
dWlsZC1kby1ub3QtZm9yY2UtZGlzYWJsZS1nZGstcGl4YnVmLWwucGF0Y2gKKysrIGIvbWV0YS9y
ZWNpcGVzLWdub21lL2xpYnJzdmcvbGlicnN2Zy8wMDAxLVJldmVydC1tZXNvbi5idWlsZC1kby1u
b3QtZm9yY2UtZGlzYWJsZS1nZGstcGl4YnVmLWwucGF0Y2gKQEAgLTEsNCArMSw0IEBACi1Gcm9t
IDMzZWNlMjU2YmY3YzE1NmEzNGFiMWVlMzcwOTcxOGUzODgyOWNjOWUgTW9uIFNlcCAxNyAwMDow
MDowMCAyMDAxCitGcm9tIGI5YTIyZjM2YTcwMDhhOTJkMDQ1ZTczZjI3OGMxMGE3YjE1YjgwZmQg
TW9uIFNlcCAxNyAwMDowMDowMCAyMDAxCiBGcm9tOiBHeW9yZ3kgU2FydmFyaSA8c2thbmRpZ3Jh
dW5AZ21haWwuY29tPgogRGF0ZTogV2VkLCA2IEF1ZyAyMDI1IDEzOjUwOjIxICswMjAwCiBTdWJq
ZWN0OiBbUEFUQ0hdIFJldmVydCAibWVzb24uYnVpbGQ6IGRvIG5vdCBmb3JjZS1kaXNhYmxlIGdk
ay1waXhidWYtbG9hZGVyCmRpZmYgLS1naXQgYS9tZXRhL3JlY2lwZXMtZ25vbWUvbGlicnN2Zy9s
aWJyc3ZnLzAwMDEtcXVlcnktcnVzdGMtYXBwZW5kLVJVU1RGTEFHUy10by1ydXN0Yy1leGVjdXRh
YmxlLnBhdGNoIGIvbWV0YS9yZWNpcGVzLWdub21lL2xpYnJzdmcvbGlicnN2Zy8wMDAxLXF1ZXJ5
LXJ1c3RjLWFwcGVuZC1SVVNURkxBR1MtdG8tcnVzdGMtZXhlY3V0YWJsZS5wYXRjaAppbmRleCBh
MzU5NmZjMjg4Li4yMDk2MzI1M2JlIDEwMDY0NAotLS0gYS9tZXRhL3JlY2lwZXMtZ25vbWUvbGli
cnN2Zy9saWJyc3ZnLzAwMDEtcXVlcnktcnVzdGMtYXBwZW5kLVJVU1RGTEFHUy10by1ydXN0Yy1l
eGVjdXRhYmxlLnBhdGNoCisrKyBiL21ldGEvcmVjaXBlcy1nbm9tZS9saWJyc3ZnL2xpYnJzdmcv
MDAwMS1xdWVyeS1ydXN0Yy1hcHBlbmQtUlVTVEZMQUdTLXRvLXJ1c3RjLWV4ZWN1dGFibGUucGF0
Y2gKQEAgLTEsNCArMSw0IEBACi1Gcm9tIGU4OTk4MmU2MWU1MGM3ZDI1ZDU2M2YyZmEwNDgxZjli
YmE0ODFmMDQgTW9uIFNlcCAxNyAwMDowMDowMCAyMDAxCitGcm9tIDkwZDc2MDI4YjU2NzY2OTcx
NDA4NzkxYmY2YjYxYzQyNWI4ZmYzYzAgTW9uIFNlcCAxNyAwMDowMDowMCAyMDAxCiBGcm9tOiBH
eW9yZ3kgU2FydmFyaSA8c2thbmRpZ3JhdW5AZ21haWwuY29tPgogRGF0ZTogU2F0LCAyIEF1ZyAy
MDI1IDIwOjU3OjQ5ICswMjAwCiBTdWJqZWN0OiBbUEFUQ0hdIHF1ZXJ5LXJ1c3RjOiBhcHBlbmQg
UlVTVEZMQUdTIHRvIHJ1c3RjIGV4ZWN1dGFibGUKZGlmZiAtLWdpdCBhL21ldGEvcmVjaXBlcy1n
bm9tZS9saWJyc3ZnL2xpYnJzdmcvMDAwMS10ZXN0cy1yZXZlcnQtVGFrZS1jYXJlLW9mLWRlcHJl
Y2F0ZWQtYXNzZXJ0X2NtZC1Db21tLnBhdGNoIGIvbWV0YS9yZWNpcGVzLWdub21lL2xpYnJzdmcv
bGlicnN2Zy8wMDAxLXRlc3RzLXJldmVydC1UYWtlLWNhcmUtb2YtZGVwcmVjYXRlZC1hc3NlcnRf
Y21kLUNvbW0ucGF0Y2gKaW5kZXggZjg5M2Q4MWU5YS4uM2ZlZTNlN2Y2MiAxMDA2NDQKLS0tIGEv
bWV0YS9yZWNpcGVzLWdub21lL2xpYnJzdmcvbGlicnN2Zy8wMDAxLXRlc3RzLXJldmVydC1UYWtl
LWNhcmUtb2YtZGVwcmVjYXRlZC1hc3NlcnRfY21kLUNvbW0ucGF0Y2gKKysrIGIvbWV0YS9yZWNp
cGVzLWdub21lL2xpYnJzdmcvbGlicnN2Zy8wMDAxLXRlc3RzLXJldmVydC1UYWtlLWNhcmUtb2Yt
ZGVwcmVjYXRlZC1hc3NlcnRfY21kLUNvbW0ucGF0Y2gKQEAgLTEsNCArMSw0IEBACi1Gcm9tIGJj
MDg5YWY4Y2UzOGFkMjY4YmM0MjgzMDQwZWMyODI0MWM1MDY0YTYgTW9uIFNlcCAxNyAwMDowMDow
MCAyMDAxCitGcm9tIDYyMTZjYWZmMDM2NDYyMDFjNjQ3MjEwNzhjZGYyNzJhMzkyMjYwNDMgTW9u
IFNlcCAxNyAwMDowMDowMCAyMDAxCiBGcm9tOiBBbGV4YW5kZXIgS2FuYXZpbiA8YWxleEBsaW51
dHJvbml4LmRlPgogRGF0ZTogVGh1LCAxOCBEZWMgMjAyNSAxODo0MzoyMCArMDEwMAogU3ViamVj
dDogW1BBVENIXSB0ZXN0czogcmV2ZXJ0ICdUYWtlIGNhcmUgb2YgZGVwcmVjYXRlZApkaWZmIC0t
Z2l0IGEvbWV0YS9yZWNpcGVzLWdub21lL2xpYnJzdmcvbGlicnN2Z18yLjYxLjMuYmIgYi9tZXRh
L3JlY2lwZXMtZ25vbWUvbGlicnN2Zy9saWJyc3ZnXzIuNjEuNC5iYgpzaW1pbGFyaXR5IGluZGV4
IDk4JQpyZW5hbWUgZnJvbSBtZXRhL3JlY2lwZXMtZ25vbWUvbGlicnN2Zy9saWJyc3ZnXzIuNjEu
My5iYgpyZW5hbWUgdG8gbWV0YS9yZWNpcGVzLWdub21lL2xpYnJzdmcvbGlicnN2Z18yLjYxLjQu
YmIKaW5kZXggY2FiODQ3MWMzMy4uMDBjYTM1YTk0ZSAxMDA2NDQKLS0tIGEvbWV0YS9yZWNpcGVz
LWdub21lL2xpYnJzdmcvbGlicnN2Z18yLjYxLjMuYmIKKysrIGIvbWV0YS9yZWNpcGVzLWdub21l
L2xpYnJzdmcvbGlicnN2Z18yLjYxLjQuYmIKQEAgLTI3LDcgKzI3LDcgQEAgU1JDX1VSSSArPSAi
ZmlsZTovLzAwMDEtcXVlcnktcnVzdGMtYXBwZW5kLVJVU1RGTEFHUy10by1ydXN0Yy1leGVjdXRh
YmxlLnBhdGNoIFwKICAgICAgICAgICAgIGZpbGU6Ly8wMDAxLVJldmVydC1tZXNvbi5idWlsZC1k
by1ub3QtZm9yY2UtZGlzYWJsZS1nZGstcGl4YnVmLWwucGF0Y2ggXAogICAgICAgICAgICAgZmls
ZTovLzAwMDEtdGVzdHMtcmV2ZXJ0LVRha2UtY2FyZS1vZi1kZXByZWNhdGVkLWFzc2VydF9jbWQt
Q29tbS5wYXRjaCBcCiAgICAgICAgICAgICBmaWxlOi8vcnVuLXB0ZXN0IgotU1JDX1VSSVthcmNo
aXZlLnNoYTI1NnN1bV0gPSAiYTU2ZDJjODBkNzQ0YWQyZjI3MThmODVkZjQ2NmZlNzFkMjRmZjFm
OWJjM2U1ZWY1ODhiZGU0ZDdlODc4MTVmMiIKK1NSQ19VUklbYXJjaGl2ZS5zaGEyNTZzdW1dID0g
ImZjYTBlYTI4ZDFmMjhmOTVjODQwN2QyNTc5ZjQ3MDJkYWMwODVlN2M3NTg2NDRkYWNhOGI0MGQx
ZTA3MmNhMGMiCiAKIFVQU1RSRUFNX0NIRUNLX1JFR0VYID0gImxpYnJzdmctKD9QPHB2ZXI+XGQr
XC5cZCtcLig/ITlcZCspXGQrKSIKIAotLSAKMi40Ny4xCgo=

--===============4660349492663749562==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment; filename="buildhistory-diff-full.txt"

packages/x86-64-v3-poky-linux/librsvg: SRC_URI changed from "https://download.gnome.org/sources//librsvg/2.61/librsvg-2.61.3.tar.xz;name=archive crate://crates.io/adler2/2.0.1 crate://crates.io/aes/0.8.4 crate://crates.io/ahash/0.8.12 crate://crates.io/aho-corasick/1.1.4 crate://crates.io/android_system_properties/0.1.5 crate://crates.io/anes/0.1.6 crate://crates.io/anstream/0.6.21 crate://crates.io/anstyle/1.0.13 crate://crates.io/anstyle-parse/0.2.7 crate://crates.io/anstyle-query/1.1.4 crate://crates.io/anstyle-wincon/3.0.10 crate://crates.io/approx/0.5.1 crate://crates.io/assert_cmd/2.1.1 crate://crates.io/autocfg/1.5.0 crate://crates.io/av-data/0.4.4 crate://crates.io/bit-set/0.8.0 crate://crates.io/bit-vec/0.8.0 crate://crates.io/bitflags/2.10.0 crate://crates.io/bitreader/0.3.11 crate://crates.io/block/0.1.6 crate://crates.io/block-buffer/0.10.4 crate://crates.io/block-padding/0.3.3 crate://crates.io/bstr/1.12.1 crate://crates.io/bumpalo/3.19.0 crate://crates.io/byte-slice-cas
 t/1.2.3 crate://crates.io/bytecount/0.6.9 crate://crates.io/bytemuck/1.24.0 crate://crates.io/byteorder/1.5.0 crate://crates.io/byteorder-lite/0.1.0 crate://crates.io/bytes/1.10.1 crate://crates.io/cairo-rs/0.21.2 crate://crates.io/cairo-sys-rs/0.21.2 crate://crates.io/cast/0.3.0 crate://crates.io/cbc/0.1.2 crate://crates.io/cc/1.2.44 crate://crates.io/cfg-expr/0.20.4 crate://crates.io/cfg-if/1.0.4 crate://crates.io/chrono/0.4.42 crate://crates.io/ciborium/0.2.2 crate://crates.io/ciborium-io/0.2.2 crate://crates.io/ciborium-ll/0.2.2 crate://crates.io/cipher/0.4.4 crate://crates.io/clap/4.5.51 crate://crates.io/clap_builder/4.5.51 crate://crates.io/clap_complete/4.5.60 crate://crates.io/clap_derive/4.5.49 crate://crates.io/clap_lex/0.7.6 crate://crates.io/color_quant/1.1.0 crate://crates.io/colorchoice/1.0.4 crate://crates.io/core-foundation-sys/0.8.7 crate://crates.io/cpufeatures/0.2.17 crate://crates.io/crc32fast/1.5.0 crate://crates.io/criterion/0.7.0 crate://crates.io/criterion-p
 lot/0.6.0 crate://crates.io/crossbeam-deque/0.8.6 crate://crates.io/crossbeam-epoch/0.9.18 crate://crates.io/crossbeam-utils/0.8.21 crate://crates.io/crunchy/0.2.4 crate://crates.io/crypto-common/0.1.6 crate://crates.io/cssparser/0.35.0 crate://crates.io/cssparser-color/0.3.0 crate://crates.io/cssparser-macros/0.6.1 crate://crates.io/data-url/0.3.2 crate://crates.io/dav1d/0.10.4 crate://crates.io/dav1d-sys/0.8.3 crate://crates.io/deranged/0.5.5 crate://crates.io/derive_more/2.0.1 crate://crates.io/derive_more-impl/2.0.1 crate://crates.io/difflib/0.4.0 crate://crates.io/digest/0.10.7 crate://crates.io/displaydoc/0.2.5 crate://crates.io/dlib/0.5.2 crate://crates.io/dtoa/1.0.10 crate://crates.io/dtoa-short/0.3.5 crate://crates.io/ecb/0.1.2 crate://crates.io/either/1.15.0 crate://crates.io/encoding_rs/0.8.35 crate://crates.io/equivalent/1.0.2 crate://crates.io/errno/0.3.14 crate://crates.io/fallible_collections/0.4.9 crate://crates.io/fastrand/2.3.0 crate://crates.io/fdeflate/0.3.7 crat
 e://crates.io/find-msvc-tools/0.1.4 crate://crates.io/flate2/1.1.5 crate://crates.io/float-cmp/0.10.0 crate://crates.io/fnv/1.0.7 crate://crates.io/form_urlencoded/1.2.2 crate://crates.io/futf/0.1.5 crate://crates.io/futures-channel/0.3.31 crate://crates.io/futures-core/0.3.31 crate://crates.io/futures-executor/0.3.31 crate://crates.io/futures-io/0.3.31 crate://crates.io/futures-macro/0.3.31 crate://crates.io/futures-task/0.3.31 crate://crates.io/futures-util/0.3.31 crate://crates.io/fxhash/0.2.1 crate://crates.io/gdk-pixbuf/0.21.2 crate://crates.io/gdk-pixbuf-sys/0.21.2 crate://crates.io/generic-array/0.14.9 crate://crates.io/getrandom/0.3.4 crate://crates.io/gif/0.13.3 crate://crates.io/gio/0.21.4 crate://crates.io/gio-sys/0.21.2 crate://crates.io/glib/0.21.4 crate://crates.io/glib-macros/0.21.4 crate://crates.io/glib-sys/0.21.2 crate://crates.io/gobject-sys/0.21.2 crate://crates.io/half/2.7.1 crate://crates.io/hashbrown/0.13.2 crate://crates.io/hashbrown/0.16.0 crate://crates.io/
 heck/0.5.0 crate://crates.io/iana-time-zone/0.1.64 crate://crates.io/iana-time-zone-haiku/0.1.2 crate://crates.io/icu_collections/2.1.1 crate://crates.io/icu_locale_core/2.1.1 crate://crates.io/icu_normalizer/2.1.1 crate://crates.io/icu_normalizer_data/2.1.1 crate://crates.io/icu_properties/2.1.1 crate://crates.io/icu_properties_data/2.1.1 crate://crates.io/icu_provider/2.1.1 crate://crates.io/idna/1.1.0 crate://crates.io/idna_adapter/1.2.1 crate://crates.io/image/0.25.8 crate://crates.io/image-webp/0.2.4 crate://crates.io/indexmap/2.12.0 crate://crates.io/inout/0.1.4 crate://crates.io/is_terminal_polyfill/1.70.2 crate://crates.io/itertools/0.13.0 crate://crates.io/itertools/0.14.0 crate://crates.io/itoa/1.0.15 crate://crates.io/jiff/0.2.15 crate://crates.io/jiff-static/0.2.15 crate://crates.io/jiff-tzdb/0.1.4 crate://crates.io/jiff-tzdb-platform/0.1.3 crate://crates.io/js-sys/0.3.82 crate://crates.io/language-tags/0.3.2 crate://crates.io/lazy_static/1.5.0 crate://crates.io/libc/0.2
 .177 crate://crates.io/libloading/0.8.9 crate://crates.io/linux-raw-sys/0.11.0 crate://crates.io/litemap/0.8.1 crate://crates.io/locale_config/0.3.0 crate://crates.io/lock_api/0.4.14 crate://crates.io/log/0.4.28 crate://crates.io/lopdf/0.38.0 crate://crates.io/mac/0.1.1 crate://crates.io/malloc_buf/0.0.6 crate://crates.io/markup5ever/0.35.0 crate://crates.io/matches/0.1.10 crate://crates.io/matrixmultiply/0.3.10 crate://crates.io/md-5/0.10.6 crate://crates.io/memchr/2.7.6 crate://crates.io/miniz_oxide/0.8.9 crate://crates.io/moxcms/0.7.9 crate://crates.io/mp4parse/0.17.0 crate://crates.io/nalgebra/0.33.2 crate://crates.io/nalgebra-macros/0.2.2 crate://crates.io/new_debug_unreachable/1.0.6 crate://crates.io/nom/8.0.0 crate://crates.io/nom_locate/5.0.0 crate://crates.io/normalize-line-endings/0.3.0 crate://crates.io/num-bigint/0.4.6 crate://crates.io/num-complex/0.4.6 crate://crates.io/num-conv/0.1.0 crate://crates.io/num-derive/0.4.2 crate://crates.io/num-integer/0.1.46 crate://crate
 s.io/num-rational/0.4.2 crate://crates.io/num-traits/0.2.19 crate://crates.io/objc/0.2.7 crate://crates.io/objc-foundation/0.1.1 crate://crates.io/objc_id/0.1.1 crate://crates.io/once_cell/1.21.3 crate://crates.io/once_cell_polyfill/1.70.2 crate://crates.io/oorandom/11.1.5 crate://crates.io/pango/0.21.3 crate://crates.io/pango-sys/0.21.2 crate://crates.io/pangocairo/0.21.2 crate://crates.io/pangocairo-sys/0.21.2 crate://crates.io/parking_lot/0.12.5 crate://crates.io/parking_lot_core/0.9.12 crate://crates.io/paste/1.0.15 crate://crates.io/percent-encoding/2.3.2 crate://crates.io/phf/0.11.3 crate://crates.io/phf_codegen/0.11.3 crate://crates.io/phf_generator/0.11.3 crate://crates.io/phf_macros/0.11.3 crate://crates.io/phf_shared/0.11.3 crate://crates.io/phf_shared/0.13.1 crate://crates.io/pin-project-lite/0.2.16 crate://crates.io/pin-utils/0.1.0 crate://crates.io/pkg-config/0.3.32 crate://crates.io/plotters/0.3.7 crate://crates.io/plotters-backend/0.3.7 crate://crates.io/plotters-svg/
 0.3.7 crate://crates.io/png/0.18.0 crate://crates.io/portable-atomic/1.11.1 crate://crates.io/portable-atomic-util/0.2.4 crate://crates.io/potential_utf/0.1.4 crate://crates.io/powerfmt/0.2.0 crate://crates.io/ppv-lite86/0.2.21 crate://crates.io/precomputed-hash/0.1.1 crate://crates.io/predicates/3.1.3 crate://crates.io/predicates-core/1.0.9 crate://crates.io/predicates-tree/1.0.12 crate://crates.io/proc-macro-crate/3.4.0 crate://crates.io/proc-macro2/1.0.103 crate://crates.io/proptest/1.9.0 crate://crates.io/pxfm/0.1.25 crate://crates.io/quick-error/1.2.3 crate://crates.io/quick-error/2.0.1 crate://crates.io/quote/1.0.41 crate://crates.io/r-efi/5.3.0 crate://crates.io/rand/0.8.5 crate://crates.io/rand/0.9.2 crate://crates.io/rand_chacha/0.9.0 crate://crates.io/rand_core/0.6.4 crate://crates.io/rand_core/0.9.3 crate://crates.io/rand_xorshift/0.4.0 crate://crates.io/rangemap/1.6.0 crate://crates.io/rawpointer/0.2.1 crate://crates.io/rayon/1.11.0 crate://crates.io/rayon-core/1.13.0 cr
 ate://crates.io/rctree/0.6.0 crate://crates.io/redox_syscall/0.5.18 crate://crates.io/regex/1.12.2 crate://crates.io/regex-automata/0.4.13 crate://crates.io/regex-syntax/0.8.8 crate://crates.io/rgb/0.8.52 crate://crates.io/rustix/1.1.2 crate://crates.io/rustversion/1.0.22 crate://crates.io/rusty-fork/0.3.1 crate://crates.io/ryu/1.0.20 crate://crates.io/safe_arch/0.7.4 crate://crates.io/same-file/1.0.6 crate://crates.io/scopeguard/1.2.0 crate://crates.io/selectors/0.31.0 crate://crates.io/serde/1.0.228 crate://crates.io/serde_core/1.0.228 crate://crates.io/serde_derive/1.0.228 crate://crates.io/serde_json/1.0.145 crate://crates.io/serde_spanned/1.0.3 crate://crates.io/servo_arc/0.4.1 crate://crates.io/sha2/0.10.9 crate://crates.io/shell-words/1.1.0 crate://crates.io/shlex/1.3.0 crate://crates.io/simba/0.9.1 crate://crates.io/simd-adler32/0.3.7 crate://crates.io/siphasher/1.0.1 crate://crates.io/slab/0.4.11 crate://crates.io/smallvec/1.15.1 crate://crates.io/stable_deref_trait/1.2.1 c
 rate://crates.io/static_assertions/1.1.0 crate://crates.io/string_cache/0.8.9 crate://crates.io/string_cache/0.9.0 crate://crates.io/string_cache_codegen/0.5.4 crate://crates.io/stringprep/0.1.5 crate://crates.io/strsim/0.11.1 crate://crates.io/syn/2.0.108 crate://crates.io/synstructure/0.13.2 crate://crates.io/system-deps/7.0.7 crate://crates.io/target-lexicon/0.13.3 crate://crates.io/tempfile/3.23.0 crate://crates.io/tendril/0.4.3 crate://crates.io/termtree/0.5.1 crate://crates.io/thiserror/2.0.17 crate://crates.io/thiserror-impl/2.0.17 crate://crates.io/time/0.3.44 crate://crates.io/time-core/0.1.6 crate://crates.io/time-macros/0.2.24 crate://crates.io/tinystr/0.8.2 crate://crates.io/tinytemplate/1.2.1 crate://crates.io/tinyvec/1.10.0 crate://crates.io/tinyvec_macros/0.1.1 crate://crates.io/toml/0.9.8 crate://crates.io/toml_datetime/0.7.3 crate://crates.io/toml_edit/0.23.7 crate://crates.io/toml_parser/1.0.4 crate://crates.io/toml_writer/1.0.4 crate://crates.io/ttf-parser/0.25.1 
 crate://crates.io/typenum/1.19.0 crate://crates.io/unarray/0.1.4 crate://crates.io/unicode-bidi/0.3.18 crate://crates.io/unicode-ident/1.0.22 crate://crates.io/unicode-normalization/0.1.25 crate://crates.io/unicode-properties/0.1.4 crate://crates.io/url/2.5.7 crate://crates.io/utf-8/0.7.6 crate://crates.io/utf8_iter/1.0.4 crate://crates.io/utf8parse/0.2.2 crate://crates.io/version-compare/0.2.1 crate://crates.io/version_check/0.9.5 crate://crates.io/wait-timeout/0.2.1 crate://crates.io/walkdir/2.5.0 crate://crates.io/wasip2/1.0.1+wasi-0.2.4 crate://crates.io/wasm-bindgen/0.2.105 crate://crates.io/wasm-bindgen-macro/0.2.105 crate://crates.io/wasm-bindgen-macro-support/0.2.105 crate://crates.io/wasm-bindgen-shared/0.2.105 crate://crates.io/web-sys/0.3.82 crate://crates.io/web_atoms/0.1.3 crate://crates.io/weezl/0.1.10 crate://crates.io/wide/0.7.33 crate://crates.io/winapi/0.3.9 crate://crates.io/winapi-i686-pc-windows-gnu/0.4.0 crate://crates.io/winapi-util/0.1.11 crate://crates.io/wi
 napi-x86_64-pc-windows-gnu/0.4.0 crate://crates.io/windows-core/0.62.2 crate://crates.io/windows-implement/0.60.2 crate://crates.io/windows-interface/0.59.3 crate://crates.io/windows-link/0.2.1 crate://crates.io/windows-result/0.4.1 crate://crates.io/windows-strings/0.5.1 crate://crates.io/windows-sys/0.59.0 crate://crates.io/windows-sys/0.60.2 crate://crates.io/windows-sys/0.61.2 crate://crates.io/windows-targets/0.52.6 crate://crates.io/windows-targets/0.53.5 crate://crates.io/windows_aarch64_gnullvm/0.52.6 crate://crates.io/windows_aarch64_gnullvm/0.53.1 crate://crates.io/windows_aarch64_msvc/0.52.6 crate://crates.io/windows_aarch64_msvc/0.53.1 crate://crates.io/windows_i686_gnu/0.52.6 crate://crates.io/windows_i686_gnu/0.53.1 crate://crates.io/windows_i686_gnullvm/0.52.6 crate://crates.io/windows_i686_gnullvm/0.53.1 crate://crates.io/windows_i686_msvc/0.52.6 crate://crates.io/windows_i686_msvc/0.53.1 crate://crates.io/windows_x86_64_gnu/0.52.6 crate://crates.io/windows_x86_64_gn
 u/0.53.1 crate://crates.io/windows_x86_64_gnullvm/0.52.6 crate://crates.io/windows_x86_64_gnullvm/0.53.1 crate://crates.io/windows_x86_64_msvc/0.52.6 crate://crates.io/windows_x86_64_msvc/0.53.1 crate://crates.io/winnow/0.7.13 crate://crates.io/wit-bindgen/0.46.0 crate://crates.io/writeable/0.6.2 crate://crates.io/xml5ever/0.35.0 crate://crates.io/yeslogic-fontconfig-sys/6.0.0 crate://crates.io/yoke/0.8.1 crate://crates.io/yoke-derive/0.8.1 crate://crates.io/zerocopy/0.8.27 crate://crates.io/zerocopy-derive/0.8.27 crate://crates.io/zerofrom/0.1.6 crate://crates.io/zerofrom-derive/0.1.6 crate://crates.io/zerotrie/0.2.3 crate://crates.io/zerovec/0.11.5 crate://crates.io/zerovec-derive/0.11.2 crate://crates.io/zune-core/0.4.12 crate://crates.io/zune-jpeg/0.4.21 file://0001-query-rustc-append-RUSTFLAGS-to-rustc-executable.patch file://0001-Revert-meson.build-do-not-force-disable-gdk-pixbuf-l.patch file://0001-tests-revert-Take-care-of-deprecated-assert_cmd-Comm.patch file://run-ptest" t
 o "https://download.gnome.org/sources//librsvg/2.61/librsvg-2.61.4.tar.xz;name=archive crate://crates.io/adler2/2.0.1 crate://crates.io/aes/0.8.4 crate://crates.io/ahash/0.8.12 crate://crates.io/aho-corasick/1.1.4 crate://crates.io/android_system_properties/0.1.5 crate://crates.io/anes/0.1.6 crate://crates.io/anstream/0.6.21 crate://crates.io/anstyle/1.0.13 crate://crates.io/anstyle-parse/0.2.7 crate://crates.io/anstyle-query/1.1.4 crate://crates.io/anstyle-wincon/3.0.10 crate://crates.io/approx/0.5.1 crate://crates.io/assert_cmd/2.1.1 crate://crates.io/autocfg/1.5.0 crate://crates.io/av-data/0.4.4 crate://crates.io/bit-set/0.8.0 crate://crates.io/bit-vec/0.8.0 crate://crates.io/bitflags/2.10.0 crate://crates.io/bitreader/0.3.11 crate://crates.io/block/0.1.6 crate://crates.io/block-buffer/0.10.4 crate://crates.io/block-padding/0.3.3 crate://crates.io/bstr/1.12.1 crate://crates.io/bumpalo/3.19.0 crate://crates.io/byte-slice-cast/1.2.3 crate://crates.io/bytecount/0.6.9 crate://crates.
 io/bytemuck/1.24.0 crate://crates.io/byteorder/1.5.0 crate://crates.io/byteorder-lite/0.1.0 crate://crates.io/bytes/1.10.1 crate://crates.io/cairo-rs/0.21.2 crate://crates.io/cairo-sys-rs/0.21.2 crate://crates.io/cast/0.3.0 crate://crates.io/cbc/0.1.2 crate://crates.io/cc/1.2.44 crate://crates.io/cfg-expr/0.20.4 crate://crates.io/cfg-if/1.0.4 crate://crates.io/chrono/0.4.42 crate://crates.io/ciborium/0.2.2 crate://crates.io/ciborium-io/0.2.2 crate://crates.io/ciborium-ll/0.2.2 crate://crates.io/cipher/0.4.4 crate://crates.io/clap/4.5.51 crate://crates.io/clap_builder/4.5.51 crate://crates.io/clap_complete/4.5.60 crate://crates.io/clap_derive/4.5.49 crate://crates.io/clap_lex/0.7.6 crate://crates.io/color_quant/1.1.0 crate://crates.io/colorchoice/1.0.4 crate://crates.io/core-foundation-sys/0.8.7 crate://crates.io/cpufeatures/0.2.17 crate://crates.io/crc32fast/1.5.0 crate://crates.io/criterion/0.7.0 crate://crates.io/criterion-plot/0.6.0 crate://crates.io/crossbeam-deque/0.8.6 crate:/
 /crates.io/crossbeam-epoch/0.9.18 crate://crates.io/crossbeam-utils/0.8.21 crate://crates.io/crunchy/0.2.4 crate://crates.io/crypto-common/0.1.6 crate://crates.io/cssparser/0.35.0 crate://crates.io/cssparser-color/0.3.0 crate://crates.io/cssparser-macros/0.6.1 crate://crates.io/data-url/0.3.2 crate://crates.io/dav1d/0.10.4 crate://crates.io/dav1d-sys/0.8.3 crate://crates.io/deranged/0.5.5 crate://crates.io/derive_more/2.0.1 crate://crates.io/derive_more-impl/2.0.1 crate://crates.io/difflib/0.4.0 crate://crates.io/digest/0.10.7 crate://crates.io/displaydoc/0.2.5 crate://crates.io/dlib/0.5.2 crate://crates.io/dtoa/1.0.10 crate://crates.io/dtoa-short/0.3.5 crate://crates.io/ecb/0.1.2 crate://crates.io/either/1.15.0 crate://crates.io/encoding_rs/0.8.35 crate://crates.io/equivalent/1.0.2 crate://crates.io/errno/0.3.14 crate://crates.io/fallible_collections/0.4.9 crate://crates.io/fastrand/2.3.0 crate://crates.io/fdeflate/0.3.7 crate://crates.io/find-msvc-tools/0.1.4 crate://crates.io/fla
 te2/1.1.5 crate://crates.io/float-cmp/0.10.0 crate://crates.io/fnv/1.0.7 crate://crates.io/form_urlencoded/1.2.2 crate://crates.io/futf/0.1.5 crate://crates.io/futures-channel/0.3.31 crate://crates.io/futures-core/0.3.31 crate://crates.io/futures-executor/0.3.31 crate://crates.io/futures-io/0.3.31 crate://crates.io/futures-macro/0.3.31 crate://crates.io/futures-task/0.3.31 crate://crates.io/futures-util/0.3.31 crate://crates.io/fxhash/0.2.1 crate://crates.io/gdk-pixbuf/0.21.2 crate://crates.io/gdk-pixbuf-sys/0.21.2 crate://crates.io/generic-array/0.14.9 crate://crates.io/getrandom/0.3.4 crate://crates.io/gif/0.13.3 crate://crates.io/gio/0.21.4 crate://crates.io/gio-sys/0.21.2 crate://crates.io/glib/0.21.4 crate://crates.io/glib-macros/0.21.4 crate://crates.io/glib-sys/0.21.2 crate://crates.io/gobject-sys/0.21.2 crate://crates.io/half/2.7.1 crate://crates.io/hashbrown/0.13.2 crate://crates.io/hashbrown/0.16.0 crate://crates.io/heck/0.5.0 crate://crates.io/iana-time-zone/0.1.64 crate:
 //crates.io/iana-time-zone-haiku/0.1.2 crate://crates.io/icu_collections/2.1.1 crate://crates.io/icu_locale_core/2.1.1 crate://crates.io/icu_normalizer/2.1.1 crate://crates.io/icu_normalizer_data/2.1.1 crate://crates.io/icu_properties/2.1.1 crate://crates.io/icu_properties_data/2.1.1 crate://crates.io/icu_provider/2.1.1 crate://crates.io/idna/1.1.0 crate://crates.io/idna_adapter/1.2.1 crate://crates.io/image/0.25.8 crate://crates.io/image-webp/0.2.4 crate://crates.io/indexmap/2.12.0 crate://crates.io/inout/0.1.4 crate://crates.io/is_terminal_polyfill/1.70.2 crate://crates.io/itertools/0.13.0 crate://crates.io/itertools/0.14.0 crate://crates.io/itoa/1.0.15 crate://crates.io/jiff/0.2.15 crate://crates.io/jiff-static/0.2.15 crate://crates.io/jiff-tzdb/0.1.4 crate://crates.io/jiff-tzdb-platform/0.1.3 crate://crates.io/js-sys/0.3.82 crate://crates.io/language-tags/0.3.2 crate://crates.io/lazy_static/1.5.0 crate://crates.io/libc/0.2.177 crate://crates.io/libloading/0.8.9 crate://crates.io
 /linux-raw-sys/0.11.0 crate://crates.io/litemap/0.8.1 crate://crates.io/locale_config/0.3.0 crate://crates.io/lock_api/0.4.14 crate://crates.io/log/0.4.28 crate://crates.io/lopdf/0.38.0 crate://crates.io/mac/0.1.1 crate://crates.io/malloc_buf/0.0.6 crate://crates.io/markup5ever/0.35.0 crate://crates.io/matches/0.1.10 crate://crates.io/matrixmultiply/0.3.10 crate://crates.io/md-5/0.10.6 crate://crates.io/memchr/2.7.6 crate://crates.io/miniz_oxide/0.8.9 crate://crates.io/moxcms/0.7.9 crate://crates.io/mp4parse/0.17.0 crate://crates.io/nalgebra/0.33.2 crate://crates.io/nalgebra-macros/0.2.2 crate://crates.io/new_debug_unreachable/1.0.6 crate://crates.io/nom/8.0.0 crate://crates.io/nom_locate/5.0.0 crate://crates.io/normalize-line-endings/0.3.0 crate://crates.io/num-bigint/0.4.6 crate://crates.io/num-complex/0.4.6 crate://crates.io/num-conv/0.2.0 crate://crates.io/num-derive/0.4.2 crate://crates.io/num-integer/0.1.46 crate://crates.io/num-rational/0.4.2 crate://crates.io/num-traits/0.2.
 19 crate://crates.io/objc/0.2.7 crate://crates.io/objc-foundation/0.1.1 crate://crates.io/objc_id/0.1.1 crate://crates.io/once_cell/1.21.3 crate://crates.io/once_cell_polyfill/1.70.2 crate://crates.io/oorandom/11.1.5 crate://crates.io/pango/0.21.3 crate://crates.io/pango-sys/0.21.2 crate://crates.io/pangocairo/0.21.2 crate://crates.io/pangocairo-sys/0.21.2 crate://crates.io/parking_lot/0.12.5 crate://crates.io/parking_lot_core/0.9.12 crate://crates.io/paste/1.0.15 crate://crates.io/percent-encoding/2.3.2 crate://crates.io/phf/0.11.3 crate://crates.io/phf_codegen/0.11.3 crate://crates.io/phf_generator/0.11.3 crate://crates.io/phf_macros/0.11.3 crate://crates.io/phf_shared/0.11.3 crate://crates.io/phf_shared/0.13.1 crate://crates.io/pin-project-lite/0.2.16 crate://crates.io/pin-utils/0.1.0 crate://crates.io/pkg-config/0.3.32 crate://crates.io/plotters/0.3.7 crate://crates.io/plotters-backend/0.3.7 crate://crates.io/plotters-svg/0.3.7 crate://crates.io/png/0.18.0 crate://crates.io/port
 able-atomic/1.11.1 crate://crates.io/portable-atomic-util/0.2.4 crate://crates.io/potential_utf/0.1.4 crate://crates.io/powerfmt/0.2.0 crate://crates.io/ppv-lite86/0.2.21 crate://crates.io/precomputed-hash/0.1.1 crate://crates.io/predicates/3.1.3 crate://crates.io/predicates-core/1.0.9 crate://crates.io/predicates-tree/1.0.12 crate://crates.io/proc-macro-crate/3.4.0 crate://crates.io/proc-macro2/1.0.103 crate://crates.io/proptest/1.9.0 crate://crates.io/pxfm/0.1.25 crate://crates.io/quick-error/1.2.3 crate://crates.io/quick-error/2.0.1 crate://crates.io/quote/1.0.41 crate://crates.io/r-efi/5.3.0 crate://crates.io/rand/0.8.5 crate://crates.io/rand/0.9.2 crate://crates.io/rand_chacha/0.9.0 crate://crates.io/rand_core/0.6.4 crate://crates.io/rand_core/0.9.3 crate://crates.io/rand_xorshift/0.4.0 crate://crates.io/rangemap/1.6.0 crate://crates.io/rawpointer/0.2.1 crate://crates.io/rayon/1.11.0 crate://crates.io/rayon-core/1.13.0 crate://crates.io/rctree/0.6.0 crate://crates.io/redox_sysc
 all/0.5.18 crate://crates.io/regex/1.12.2 crate://crates.io/regex-automata/0.4.13 crate://crates.io/regex-syntax/0.8.8 crate://crates.io/rgb/0.8.52 crate://crates.io/rustix/1.1.2 crate://crates.io/rustversion/1.0.22 crate://crates.io/rusty-fork/0.3.1 crate://crates.io/ryu/1.0.20 crate://crates.io/safe_arch/0.7.4 crate://crates.io/same-file/1.0.6 crate://crates.io/scopeguard/1.2.0 crate://crates.io/selectors/0.31.0 crate://crates.io/serde/1.0.228 crate://crates.io/serde_core/1.0.228 crate://crates.io/serde_derive/1.0.228 crate://crates.io/serde_json/1.0.145 crate://crates.io/serde_spanned/1.0.3 crate://crates.io/servo_arc/0.4.1 crate://crates.io/sha2/0.10.9 crate://crates.io/shell-words/1.1.0 crate://crates.io/shlex/1.3.0 crate://crates.io/simba/0.9.1 crate://crates.io/simd-adler32/0.3.7 crate://crates.io/siphasher/1.0.1 crate://crates.io/slab/0.4.11 crate://crates.io/smallvec/1.15.1 crate://crates.io/stable_deref_trait/1.2.1 crate://crates.io/static_assertions/1.1.0 crate://crates.i
 o/string_cache/0.8.9 crate://crates.io/string_cache/0.9.0 crate://crates.io/string_cache_codegen/0.5.4 crate://crates.io/stringprep/0.1.5 crate://crates.io/strsim/0.11.1 crate://crates.io/syn/2.0.108 crate://crates.io/synstructure/0.13.2 crate://crates.io/system-deps/7.0.7 crate://crates.io/target-lexicon/0.13.3 crate://crates.io/tempfile/3.23.0 crate://crates.io/tendril/0.4.3 crate://crates.io/termtree/0.5.1 crate://crates.io/thiserror/2.0.17 crate://crates.io/thiserror-impl/2.0.17 crate://crates.io/time/0.3.47 crate://crates.io/time-core/0.1.8 crate://crates.io/time-macros/0.2.27 crate://crates.io/tinystr/0.8.2 crate://crates.io/tinytemplate/1.2.1 crate://crates.io/tinyvec/1.10.0 crate://crates.io/tinyvec_macros/0.1.1 crate://crates.io/toml/0.9.8 crate://crates.io/toml_datetime/0.7.3 crate://crates.io/toml_edit/0.23.7 crate://crates.io/toml_parser/1.0.4 crate://crates.io/toml_writer/1.0.4 crate://crates.io/ttf-parser/0.25.1 crate://crates.io/typenum/1.19.0 crate://crates.io/unarra
 y/0.1.4 crate://crates.io/unicode-bidi/0.3.18 crate://crates.io/unicode-ident/1.0.22 crate://crates.io/unicode-normalization/0.1.25 crate://crates.io/unicode-properties/0.1.4 crate://crates.io/url/2.5.7 crate://crates.io/utf-8/0.7.6 crate://crates.io/utf8_iter/1.0.4 crate://crates.io/utf8parse/0.2.2 crate://crates.io/version-compare/0.2.1 crate://crates.io/version_check/0.9.5 crate://crates.io/wait-timeout/0.2.1 crate://crates.io/walkdir/2.5.0 crate://crates.io/wasip2/1.0.1+wasi-0.2.4 crate://crates.io/wasm-bindgen/0.2.105 crate://crates.io/wasm-bindgen-macro/0.2.105 crate://crates.io/wasm-bindgen-macro-support/0.2.105 crate://crates.io/wasm-bindgen-shared/0.2.105 crate://crates.io/web-sys/0.3.82 crate://crates.io/web_atoms/0.1.3 crate://crates.io/weezl/0.1.10 crate://crates.io/wide/0.7.33 crate://crates.io/winapi/0.3.9 crate://crates.io/winapi-i686-pc-windows-gnu/0.4.0 crate://crates.io/winapi-util/0.1.11 crate://crates.io/winapi-x86_64-pc-windows-gnu/0.4.0 crate://crates.io/window
 s-core/0.62.2 crate://crates.io/windows-implement/0.60.2 crate://crates.io/windows-interface/0.59.3 crate://crates.io/windows-link/0.2.1 crate://crates.io/windows-result/0.4.1 crate://crates.io/windows-strings/0.5.1 crate://crates.io/windows-sys/0.59.0 crate://crates.io/windows-sys/0.60.2 crate://crates.io/windows-sys/0.61.2 crate://crates.io/windows-targets/0.52.6 crate://crates.io/windows-targets/0.53.5 crate://crates.io/windows_aarch64_gnullvm/0.52.6 crate://crates.io/windows_aarch64_gnullvm/0.53.1 crate://crates.io/windows_aarch64_msvc/0.52.6 crate://crates.io/windows_aarch64_msvc/0.53.1 crate://crates.io/windows_i686_gnu/0.52.6 crate://crates.io/windows_i686_gnu/0.53.1 crate://crates.io/windows_i686_gnullvm/0.52.6 crate://crates.io/windows_i686_gnullvm/0.53.1 crate://crates.io/windows_i686_msvc/0.52.6 crate://crates.io/windows_i686_msvc/0.53.1 crate://crates.io/windows_x86_64_gnu/0.52.6 crate://crates.io/windows_x86_64_gnu/0.53.1 crate://crates.io/windows_x86_64_gnullvm/0.52.6 
 crate://crates.io/windows_x86_64_gnullvm/0.53.1 crate://crates.io/windows_x86_64_msvc/0.52.6 crate://crates.io/windows_x86_64_msvc/0.53.1 crate://crates.io/winnow/0.7.13 crate://crates.io/wit-bindgen/0.46.0 crate://crates.io/writeable/0.6.2 crate://crates.io/xml5ever/0.35.0 crate://crates.io/yeslogic-fontconfig-sys/6.0.0 crate://crates.io/yoke/0.8.1 crate://crates.io/yoke-derive/0.8.1 crate://crates.io/zerocopy/0.8.27 crate://crates.io/zerocopy-derive/0.8.27 crate://crates.io/zerofrom/0.1.6 crate://crates.io/zerofrom-derive/0.1.6 crate://crates.io/zerotrie/0.2.3 crate://crates.io/zerovec/0.11.5 crate://crates.io/zerovec-derive/0.11.2 crate://crates.io/zune-core/0.4.12 crate://crates.io/zune-jpeg/0.4.21 file://0001-query-rustc-append-RUSTFLAGS-to-rustc-executable.patch file://0001-Revert-meson.build-do-not-force-disable-gdk-pixbuf-l.patch file://0001-tests-revert-Take-care-of-deprecated-assert_cmd-Comm.patch file://run-ptest"
packages/x86-64-v3-poky-linux/librsvg: PV changed from "2.61.3" to "2.61.4"
packages/x86-64-v3-poky-linux/librsvg: PKGV changed from 2.61.3 [default] to 2.61.4 [default]
packages/x86-64-v3-poky-linux/librsvg/librsvg-dbg: FILELIST: removed "/usr/lib/librsvg/ptest/.debug/intrinsic_dimensions-8844bfde88fb695c /usr/lib/librsvg/ptest/.debug/primitive_geometries-7f1e4c52456514a1 /usr/lib/.debug/librsvg-2.so.2.61.3 /usr/lib/librsvg/ptest/.debug/shapes-df2f735ae94dc558 /usr/lib/librsvg/ptest/.debug/errors-bd66fe68a37328e6 /usr/lib/librsvg/ptest/.debug/text-d4b4c4f2ed13df0e /usr/lib/librsvg/ptest/.debug/render_crash-c0b18b4f69ba511b /usr/lib/librsvg/ptest/.debug/reference-dfa3eb92a17bc4d4 /usr/lib/librsvg/ptest/.debug/primitives-5ab53eb2d76f0599 /usr/lib/librsvg/ptest/.debug/loading_crash-7815708013e0de5c /usr/lib/librsvg/ptest/.debug/loading_disallowed-1faeba7bbcdf4c21 /usr/lib/librsvg/ptest/.debug/rsvg_convert-6fa5b5404531cebf /usr/lib/librsvg/ptest/.debug/filters-774fcf19ece0bb6c /usr/lib/librsvg/ptest/.debug/rsvg-bf4241f815cd4c8b /usr/lib/librsvg/ptest/.debug/api-0bc3829dacbf0114 /usr/lib/librsvg/ptest/.debug/rsvg_convert-f741e7a71b0152f3 /usr/lib/librsvg
 /ptest/.debug/geometries-e58f22a4c673b0ea /usr/lib/librsvg/ptest/.debug/bugs-44871a7a85a30746 /usr/lib/librsvg/ptest/.debug/rsvg_convert-162c4a1883a8e6cb", added "/usr/lib/librsvg/ptest/.debug/loading_disallowed-46281ffc6a661bb9 /usr/lib/librsvg/ptest/.debug/errors-0dd0da945f3b676c /usr/lib/librsvg/ptest/.debug/api-09caabbacf1aed15 /usr/lib/librsvg/ptest/.debug/bugs-ae21758c05a24472 /usr/lib/librsvg/ptest/.debug/rsvg_convert-8d8c2d1199dbfb84 /usr/lib/librsvg/ptest/.debug/rsvg_convert-eeda74f5bd7ae4c8 /usr/lib/.debug/librsvg-2.so.2.61.4 /usr/lib/librsvg/ptest/.debug/text-47301d091b73485e /usr/lib/librsvg/ptest/.debug/reference-c7d78be0128faea9 /usr/lib/librsvg/ptest/.debug/intrinsic_dimensions-31f444b53470848a /usr/lib/librsvg/ptest/.debug/rsvg-2d9ac265f99c3b9e /usr/lib/librsvg/ptest/.debug/shapes-88d964dae2bd855f /usr/lib/librsvg/ptest/.debug/render_crash-dffc41b12c497c3e /usr/lib/librsvg/ptest/.debug/primitive_geometries-83d4db0715e2b57e /usr/lib/librsvg/ptest/.debug/rsvg_convert-3
 a0d54cc25095cdc /usr/lib/librsvg/ptest/.debug/primitives-cc097f3866002aed /usr/lib/librsvg/ptest/.debug/loading_crash-3b4b35fa4d47284e /usr/lib/librsvg/ptest/.debug/filters-446706903806d1cf /usr/lib/librsvg/ptest/.debug/geometries-eec0112ba44600dd"
packages/x86-64-v3-poky-linux/librsvg/librsvg-dbg: PV changed from "2.61.3" to "2.61.4"
packages/x86-64-v3-poky-linux/librsvg/librsvg-dbg: PKGSIZE changed from 48988776 to 48986048 (-0%)
packages/x86-64-v3-poky-linux/librsvg/librsvg-dbg: PKGV changed from 2.61.3 [default] to 2.61.4 [default]
packages/x86-64-v3-poky-linux/librsvg/librsvg-dev: PV changed from "2.61.3" to "2.61.4"
packages/x86-64-v3-poky-linux/librsvg/librsvg-dev: PKGV changed from 2.61.3 [default] to 2.61.4 [default]
packages/x86-64-v3-poky-linux/librsvg/librsvg-doc: PV changed from "2.61.3" to "2.61.4"
packages/x86-64-v3-poky-linux/librsvg/librsvg-doc: PKGV changed from 2.61.3 [default] to 2.61.4 [default]
packages/x86-64-v3-poky-linux/librsvg/librsvg-gtk: PV changed from "2.61.3" to "2.61.4"
packages/x86-64-v3-poky-linux/librsvg/librsvg-gtk: PKGV changed from 2.61.3 [default] to 2.61.4 [default]
packages/x86-64-v3-poky-linux/librsvg/librsvg-locale: PV changed from "2.61.3" to "2.61.4"
packages/x86-64-v3-poky-linux/librsvg/librsvg-locale: PKGV changed from 2.61.3 [default] to 2.61.4 [default]
packages/x86-64-v3-poky-linux/librsvg/librsvg-ptest: FILELIST: removed "/usr/lib/librsvg/ptest/filters-774fcf19ece0bb6c /usr/lib/librsvg/ptest/rsvg-bf4241f815cd4c8b /usr/lib/librsvg/ptest/rsvg_convert-162c4a1883a8e6cb /usr/lib/librsvg/ptest/reference-dfa3eb92a17bc4d4 /usr/lib/librsvg/ptest/intrinsic_dimensions-8844bfde88fb695c /usr/lib/librsvg/ptest/shapes-df2f735ae94dc558 /usr/lib/librsvg/ptest/geometries-e58f22a4c673b0ea /usr/lib/librsvg/ptest/rsvg_convert-6fa5b5404531cebf /usr/lib/librsvg/ptest/errors-bd66fe68a37328e6 /usr/lib/librsvg/ptest/loading_disallowed-1faeba7bbcdf4c21 /usr/lib/librsvg/ptest/rsvg_convert-f741e7a71b0152f3 /usr/lib/librsvg/ptest/loading_crash-7815708013e0de5c /usr/lib/librsvg/ptest/api-0bc3829dacbf0114 /usr/lib/librsvg/ptest/text-d4b4c4f2ed13df0e /usr/lib/librsvg/ptest/primitives-5ab53eb2d76f0599 /usr/lib/librsvg/ptest/primitive_geometries-7f1e4c52456514a1 /usr/lib/librsvg/ptest/render_crash-c0b18b4f69ba511b /usr/lib/librsvg/ptest/bugs-44871a7a85a30746", adde
 d "/usr/lib/librsvg/ptest/render_crash-dffc41b12c497c3e /usr/lib/librsvg/ptest/errors-0dd0da945f3b676c /usr/lib/librsvg/ptest/rsvg_convert-3a0d54cc25095cdc /usr/lib/librsvg/ptest/rsvg-2d9ac265f99c3b9e /usr/lib/librsvg/ptest/geometries-eec0112ba44600dd /usr/lib/librsvg/ptest/rsvg_convert-eeda74f5bd7ae4c8 /usr/lib/librsvg/ptest/filters-446706903806d1cf /usr/lib/librsvg/ptest/text-47301d091b73485e /usr/lib/librsvg/ptest/primitive_geometries-83d4db0715e2b57e /usr/lib/librsvg/ptest/shapes-88d964dae2bd855f /usr/lib/librsvg/ptest/api-09caabbacf1aed15 /usr/lib/librsvg/ptest/reference-c7d78be0128faea9 /usr/lib/librsvg/ptest/loading_disallowed-46281ffc6a661bb9 /usr/lib/librsvg/ptest/loading_crash-3b4b35fa4d47284e /usr/lib/librsvg/ptest/bugs-ae21758c05a24472 /usr/lib/librsvg/ptest/rsvg_convert-8d8c2d1199dbfb84 /usr/lib/librsvg/ptest/intrinsic_dimensions-31f444b53470848a /usr/lib/librsvg/ptest/primitives-cc097f3866002aed"
packages/x86-64-v3-poky-linux/librsvg/librsvg-ptest: PV changed from "2.61.3" to "2.61.4"
packages/x86-64-v3-poky-linux/librsvg/librsvg-ptest: PKGSIZE changed from 109660879 to 109664975 (+0%)
packages/x86-64-v3-poky-linux/librsvg/librsvg-ptest: PKGV changed from 2.61.3 [default] to 2.61.4 [default]
packages/x86-64-v3-poky-linux/librsvg/librsvg-src: FILELIST: directory renamed /usr/src/debug/librsvg/2.61.3/include/librsvg -> /usr/src/debug/librsvg/2.61.4/include/librsvg
packages/x86-64-v3-poky-linux/librsvg/librsvg-src: PV changed from "2.61.3" to "2.61.4"
packages/x86-64-v3-poky-linux/librsvg/librsvg-src: PKGV changed from 2.61.3 [default] to 2.61.4 [default]
packages/x86-64-v3-poky-linux/librsvg/librsvg-staticdev: PV changed from "2.61.3" to "2.61.4"
packages/x86-64-v3-poky-linux/librsvg/librsvg-staticdev: PKGV changed from 2.61.3 [default] to 2.61.4 [default]
packages/x86-64-v3-poky-linux/librsvg/librsvg: FILELIST: removed "/usr/lib/librsvg-2.so.2.61.3", added "/usr/lib/librsvg-2.so.2.61.4"
packages/x86-64-v3-poky-linux/librsvg/librsvg: PV changed from "2.61.3" to "2.61.4"
packages/x86-64-v3-poky-linux/librsvg/librsvg: PKGV changed from 2.61.3 [default] to 2.61.4 [default]
packages/x86-64-v3-poky-linux/librsvg/rsvg: PV changed from "2.61.3" to "2.61.4"
packages/x86-64-v3-poky-linux/librsvg/rsvg: PKGV changed from 2.61.3 [default] to 2.61.4 [default]
Changes to packages/x86-64-v3-poky-linux/librsvg (sysroot):
  /usr/lib/librsvg-2.so.2 changed symlink target from librsvg-2.so.2.61.3 to librsvg-2.so.2.61.4
  /usr/lib/librsvg-2.so.2.61.3 moved to /usr/lib/librsvg-2.so.2.61.4

--===============4660349492663749562==--

