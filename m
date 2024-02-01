Return-Path: <auh@yoctoproject.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 36795C48BF2
	for <webhook@archiver.kernel.org>; Thu,  1 Feb 2024 18:00:16 +0000 (UTC)
Received: from a27-192.smtp-out.us-west-2.amazonses.com (a27-192.smtp-out.us-west-2.amazonses.com [54.240.27.192])
 by mx.groups.io with SMTP id smtpd.web11.2088.1706810404217592641
 for <openembedded-core@lists.openembedded.org>;
 Thu, 01 Feb 2024 10:00:07 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@yoctoproject.org header.s=lvjh2tk576v2ro5mi6k4dt3mc6wpqbky header.b=cCdS2l8B;
 dkim=pass header.i=@amazonses.com header.s=hsbnp7p3ensaochzwyq5wwmceodymuwv header.b=AS5VjzG+;
 spf=pass (domain: us-west-2.amazonses.com, ip: 54.240.27.192, mailfrom: 0101018d65d3fa45-427b5e4f-edf3-4ae7-9e07-43be04d463d3-000000@us-west-2.amazonses.com)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=lvjh2tk576v2ro5mi6k4dt3mc6wpqbky; d=yoctoproject.org;
	t=1706810407;
	h=Content-Type:MIME-Version:From:To:Cc:Subject:Message-Id:Date;
	bh=XrvhA22+y1IQxzw7ppyMUZxFQ66zmv2kyMf0FFgdH6c=;
	b=cCdS2l8BWHgfM8xiEHJSpDSHdQguEqYHe3j7OyWhd3Q6Sh1i8jno2gXLvopZGtb4
	pqaINhEHTtdcLYJ6B/q8Vg3iYNEYqleo6drQTicn4sS1UGOuUKD2qNKRszD9muiwOWN
	FOFk6EYZeAOZMnPStsWf/Q+YOAdALXYXTBB5PwuA=
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=hsbnp7p3ensaochzwyq5wwmceodymuwv; d=amazonses.com; t=1706810407;
	h=Content-Type:MIME-Version:From:To:Cc:Subject:Message-Id:Date:Feedback-ID;
	bh=XrvhA22+y1IQxzw7ppyMUZxFQ66zmv2kyMf0FFgdH6c=;
	b=AS5VjzG+tlOAxltItiPG9itnWk9FLVFrxaIqDGzvD4c6gDhH5zPbOUNtnTDMZMkb
	6L4P7cMUb7FngutRd2lrRSpunTtsYjCXim9al2bQmNirIvfAx2fzwx4Z+ync3vo284X
	Fe7OBRnmMMPCOy+XIyXrnBQIkPf32tH8MtWMTxTw=
Content-Type: multipart/mixed; boundary="===============1922547362357943869=="
MIME-Version: 1.0
From: auh@yoctoproject.org
To: Anuj Mittal <anuj.mittal@intel.com>
Cc: openembedded-core@lists.openembedded.org
Subject: [AUH] gst-devtools: upgrading to 1.22.9 SUCCEEDED
Message-ID: <0101018d65d3fa45-427b5e4f-edf3-4ae7-9e07-43be04d463d3-000000@us-west-2.amazonses.com>
Date: Thu, 1 Feb 2024 18:00:07 +0000
Feedback-ID: 1.us-west-2.9np3MYPs3fEaOBysGKSlUD4KtcmPijcmS9Az2Hwf7iQ=:AmazonSES
X-SES-Outgoing: 2024.02.01-54.240.27.192
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 01 Feb 2024 18:00:16 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/194694

--===============1922547362357943869==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

Hello,

this email is a notification from the Auto Upgrade Helper
that the automatic attempt to upgrade the recipe *gst-devtools* to *1.22.9* has Succeeded.

Next steps:
    - apply the patch: git am 0001-gst-devtools-upgrade-1.22.8-1.22.9.patch
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
From 5c7beb034d61a41961c54268afa5d6ca2a7f4157 Mon Sep 17 00:00:00 2001
From: Upgrade Helper <auh@yoctoproject.org>
Date: Thu, 1 Feb 2024 14:28:18 +0000
Subject: [PATCH] gst-devtools: upgrade 1.22.8 -> 1.22.9

---
 .../0001-connect-has-a-different-signature-on-musl.patch       | 3 ++-
 .../{gst-devtools_1.22.8.bb => gst-devtools_1.22.9.bb}         | 2 +-
 2 files changed, 3 insertions(+), 2 deletions(-)
 rename meta/recipes-multimedia/gstreamer/{gst-devtools_1.22.8.bb => gst-devtools_1.22.9.bb} (95%)

diff --git a/meta/recipes-multimedia/gstreamer/gst-devtools/0001-connect-has-a-different-signature-on-musl.patch b/meta/recipes-multimedia/gstreamer/gst-devtools/0001-connect-has-a-different-signature-on-musl.patch
index c0e4581358..d3056c228c 100644
--- a/meta/recipes-multimedia/gstreamer/gst-devtools/0001-connect-has-a-different-signature-on-musl.patch
+++ b/meta/recipes-multimedia/gstreamer/gst-devtools/0001-connect-has-a-different-signature-on-musl.patch
@@ -1,4 +1,4 @@
-From 73b1002eda17451db1f58431b42c25203f1d3097 Mon Sep 17 00:00:00 2001
+From a1faa5ae50b1e88f37ed3821fdf1a7971ce45c15 Mon Sep 17 00:00:00 2001
 From: Khem Raj <raj.khem@gmail.com>
 Date: Sun, 9 Sep 2018 17:38:10 -0700
 Subject: [PATCH] connect has a different signature on musl
@@ -11,6 +11,7 @@ typcasted to struct sockaddr_in* type inside the function before use
 Upstream-Status: Pending
 
 Signed-off-by: Khem Raj <raj.khem@gmail.com>
+
 ---
  validate/plugins/fault_injection/socket_interposer.c | 7 ++++++-
  1 file changed, 6 insertions(+), 1 deletion(-)
diff --git a/meta/recipes-multimedia/gstreamer/gst-devtools_1.22.8.bb b/meta/recipes-multimedia/gstreamer/gst-devtools_1.22.9.bb
similarity index 95%
rename from meta/recipes-multimedia/gstreamer/gst-devtools_1.22.8.bb
rename to meta/recipes-multimedia/gstreamer/gst-devtools_1.22.9.bb
index 16a2dd85ce..f60234b528 100644
--- a/meta/recipes-multimedia/gstreamer/gst-devtools_1.22.8.bb
+++ b/meta/recipes-multimedia/gstreamer/gst-devtools_1.22.9.bb
@@ -12,7 +12,7 @@ SRC_URI = "https://gstreamer.freedesktop.org/src/gst-devtools/gst-devtools-${PV}
            file://0001-connect-has-a-different-signature-on-musl.patch \
            "
 
-SRC_URI[sha256sum] = "cd634056fcb16d035b3df5953ec85ae8bd56c68f29920b720ef920ca71ea76a7"
+SRC_URI[sha256sum] = "02e29400b44e9cc603aa6444dee5726b57edabef6455e6d0921ffed6f13840ee"
 
 DEPENDS = "json-glib glib-2.0 glib-2.0-native gstreamer1.0 gstreamer1.0-plugins-base"
 RRECOMMENDS:${PN} = "git"
-- 
2.42.0


--===============1922547362357943869==
Content-Type: application/octet-stream
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: attachment;
 filename="0001-gst-devtools-upgrade-1.22.8-1.22.9.patch"

RnJvbSA1YzdiZWIwMzRkNjFhNDE5NjFjNTQyNjhhZmE1ZDZjYTJhN2Y0MTU3IE1vbiBTZXAgMTcg
MDA6MDA6MDAgMjAwMQpGcm9tOiBVcGdyYWRlIEhlbHBlciA8YXVoQHlvY3RvcHJvamVjdC5vcmc+
CkRhdGU6IFRodSwgMSBGZWIgMjAyNCAxNDoyODoxOCArMDAwMApTdWJqZWN0OiBbUEFUQ0hdIGdz
dC1kZXZ0b29sczogdXBncmFkZSAxLjIyLjggLT4gMS4yMi45CgotLS0KIC4uLi8wMDAxLWNvbm5l
Y3QtaGFzLWEtZGlmZmVyZW50LXNpZ25hdHVyZS1vbi1tdXNsLnBhdGNoICAgICAgIHwgMyArKy0K
IC4uLi97Z3N0LWRldnRvb2xzXzEuMjIuOC5iYiA9PiBnc3QtZGV2dG9vbHNfMS4yMi45LmJifSAg
ICAgICAgIHwgMiArLQogMiBmaWxlcyBjaGFuZ2VkLCAzIGluc2VydGlvbnMoKyksIDIgZGVsZXRp
b25zKC0pCiByZW5hbWUgbWV0YS9yZWNpcGVzLW11bHRpbWVkaWEvZ3N0cmVhbWVyL3tnc3QtZGV2
dG9vbHNfMS4yMi44LmJiID0+IGdzdC1kZXZ0b29sc18xLjIyLjkuYmJ9ICg5NSUpCgpkaWZmIC0t
Z2l0IGEvbWV0YS9yZWNpcGVzLW11bHRpbWVkaWEvZ3N0cmVhbWVyL2dzdC1kZXZ0b29scy8wMDAx
LWNvbm5lY3QtaGFzLWEtZGlmZmVyZW50LXNpZ25hdHVyZS1vbi1tdXNsLnBhdGNoIGIvbWV0YS9y
ZWNpcGVzLW11bHRpbWVkaWEvZ3N0cmVhbWVyL2dzdC1kZXZ0b29scy8wMDAxLWNvbm5lY3QtaGFz
LWEtZGlmZmVyZW50LXNpZ25hdHVyZS1vbi1tdXNsLnBhdGNoCmluZGV4IGMwZTQ1ODEzNTguLmQz
MDU2YzIyOGMgMTAwNjQ0Ci0tLSBhL21ldGEvcmVjaXBlcy1tdWx0aW1lZGlhL2dzdHJlYW1lci9n
c3QtZGV2dG9vbHMvMDAwMS1jb25uZWN0LWhhcy1hLWRpZmZlcmVudC1zaWduYXR1cmUtb24tbXVz
bC5wYXRjaAorKysgYi9tZXRhL3JlY2lwZXMtbXVsdGltZWRpYS9nc3RyZWFtZXIvZ3N0LWRldnRv
b2xzLzAwMDEtY29ubmVjdC1oYXMtYS1kaWZmZXJlbnQtc2lnbmF0dXJlLW9uLW11c2wucGF0Y2gK
QEAgLTEsNCArMSw0IEBACi1Gcm9tIDczYjEwMDJlZGExNzQ1MWRiMWY1ODQzMWI0MmMyNTIwM2Yx
ZDMwOTcgTW9uIFNlcCAxNyAwMDowMDowMCAyMDAxCitGcm9tIGExZmFhNWFlNTBiMWU4OGYzN2Vk
MzgyMWZkZjFhNzk3MWNlNDVjMTUgTW9uIFNlcCAxNyAwMDowMDowMCAyMDAxCiBGcm9tOiBLaGVt
IFJhaiA8cmFqLmtoZW1AZ21haWwuY29tPgogRGF0ZTogU3VuLCA5IFNlcCAyMDE4IDE3OjM4OjEw
IC0wNzAwCiBTdWJqZWN0OiBbUEFUQ0hdIGNvbm5lY3QgaGFzIGEgZGlmZmVyZW50IHNpZ25hdHVy
ZSBvbiBtdXNsCkBAIC0xMSw2ICsxMSw3IEBAIHR5cGNhc3RlZCB0byBzdHJ1Y3Qgc29ja2FkZHJf
aW4qIHR5cGUgaW5zaWRlIHRoZSBmdW5jdGlvbiBiZWZvcmUgdXNlCiBVcHN0cmVhbS1TdGF0dXM6
IFBlbmRpbmcKIAogU2lnbmVkLW9mZi1ieTogS2hlbSBSYWogPHJhai5raGVtQGdtYWlsLmNvbT4K
KwogLS0tCiAgdmFsaWRhdGUvcGx1Z2lucy9mYXVsdF9pbmplY3Rpb24vc29ja2V0X2ludGVycG9z
ZXIuYyB8IDcgKysrKysrLQogIDEgZmlsZSBjaGFuZ2VkLCA2IGluc2VydGlvbnMoKyksIDEgZGVs
ZXRpb24oLSkKZGlmZiAtLWdpdCBhL21ldGEvcmVjaXBlcy1tdWx0aW1lZGlhL2dzdHJlYW1lci9n
c3QtZGV2dG9vbHNfMS4yMi44LmJiIGIvbWV0YS9yZWNpcGVzLW11bHRpbWVkaWEvZ3N0cmVhbWVy
L2dzdC1kZXZ0b29sc18xLjIyLjkuYmIKc2ltaWxhcml0eSBpbmRleCA5NSUKcmVuYW1lIGZyb20g
bWV0YS9yZWNpcGVzLW11bHRpbWVkaWEvZ3N0cmVhbWVyL2dzdC1kZXZ0b29sc18xLjIyLjguYmIK
cmVuYW1lIHRvIG1ldGEvcmVjaXBlcy1tdWx0aW1lZGlhL2dzdHJlYW1lci9nc3QtZGV2dG9vbHNf
MS4yMi45LmJiCmluZGV4IDE2YTJkZDg1Y2UuLmY2MDIzNGI1MjggMTAwNjQ0Ci0tLSBhL21ldGEv
cmVjaXBlcy1tdWx0aW1lZGlhL2dzdHJlYW1lci9nc3QtZGV2dG9vbHNfMS4yMi44LmJiCisrKyBi
L21ldGEvcmVjaXBlcy1tdWx0aW1lZGlhL2dzdHJlYW1lci9nc3QtZGV2dG9vbHNfMS4yMi45LmJi
CkBAIC0xMiw3ICsxMiw3IEBAIFNSQ19VUkkgPSAiaHR0cHM6Ly9nc3RyZWFtZXIuZnJlZWRlc2t0
b3Aub3JnL3NyYy9nc3QtZGV2dG9vbHMvZ3N0LWRldnRvb2xzLSR7UFZ9CiAgICAgICAgICAgIGZp
bGU6Ly8wMDAxLWNvbm5lY3QtaGFzLWEtZGlmZmVyZW50LXNpZ25hdHVyZS1vbi1tdXNsLnBhdGNo
IFwKICAgICAgICAgICAgIgogCi1TUkNfVVJJW3NoYTI1NnN1bV0gPSAiY2Q2MzQwNTZmY2IxNmQw
MzViM2RmNTk1M2VjODVhZThiZDU2YzY4ZjI5OTIwYjcyMGVmOTIwY2E3MWVhNzZhNyIKK1NSQ19V
Uklbc2hhMjU2c3VtXSA9ICIwMmUyOTQwMGI0NGU5Y2M2MDNhYTY0NDRkZWU1NzI2YjU3ZWRhYmVm
NjQ1NWU2ZDA5MjFmZmVkNmYxMzg0MGVlIgogCiBERVBFTkRTID0gImpzb24tZ2xpYiBnbGliLTIu
MCBnbGliLTIuMC1uYXRpdmUgZ3N0cmVhbWVyMS4wIGdzdHJlYW1lcjEuMC1wbHVnaW5zLWJhc2Ui
CiBSUkVDT01NRU5EUzoke1BOfSA9ICJnaXQiCi0tIAoyLjQyLjAKCg==

--===============1922547362357943869==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment; filename="buildhistory-diff.txt"

packages/core2-64-poky-linux/gst-devtools/gst-devtools: FILELIST: removed "/usr/lib/libgstvalidate-1.0.so.0.2208.0 /usr/lib/libgstvalidate-default-overrides-1.0.so.0.2208.0", added "/usr/lib/libgstvalidate-default-overrides-1.0.so.0.2209.0 /usr/lib/libgstvalidate-1.0.so.0.2209.0"
Changes to packages/core2-64-poky-linux/gst-devtools (sysroot):
  /usr/lib/libgstvalidate-1.0.so.0 changed symlink target from libgstvalidate-1.0.so.0.2208.0 to libgstvalidate-1.0.so.0.2209.0
  /usr/lib/libgstvalidate-default-overrides-1.0.so.0 changed symlink target from libgstvalidate-default-overrides-1.0.so.0.2208.0 to libgstvalidate-default-overrides-1.0.so.0.2209.0
  /usr/lib/libgstvalidate-1.0.so.0.2208.0 moved to /usr/lib/libgstvalidate-1.0.so.0.2209.0
  /usr/lib/libgstvalidate-default-overrides-1.0.so.0.2208.0 moved to /usr/lib/libgstvalidate-default-overrides-1.0.so.0.2209.0

--===============1922547362357943869==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment; filename="buildhistory-diff-full.txt"

packages/core2-64-poky-linux/gst-devtools/gst-devtools-dbg: FILELIST: removed "/usr/lib/.debug/libgstvalidate-default-overrides-1.0.so.0.2208.0 /usr/lib/.debug/libgstvalidate-1.0.so.0.2208.0", added "/usr/lib/.debug/libgstvalidate-default-overrides-1.0.so.0.2209.0 /usr/lib/.debug/libgstvalidate-1.0.so.0.2209.0"
packages/core2-64-poky-linux/gst-devtools/gst-devtools-dbg: PKGV changed from 1.22.8 [default] to 1.22.9 [default]
packages/core2-64-poky-linux/gst-devtools/gst-devtools-dbg: PV changed from "1.22.8" to "1.22.9"
packages/core2-64-poky-linux/gst-devtools/gst-devtools-dev: PKGV changed from 1.22.8 [default] to 1.22.9 [default]
packages/core2-64-poky-linux/gst-devtools/gst-devtools-dev: PV changed from "1.22.8" to "1.22.9"
packages/core2-64-poky-linux/gst-devtools/gst-devtools-doc: PKGV changed from 1.22.8 [default] to 1.22.9 [default]
packages/core2-64-poky-linux/gst-devtools/gst-devtools-doc: PV changed from "1.22.8" to "1.22.9"
packages/core2-64-poky-linux/gst-devtools/gst-devtools-locale: PKGV changed from 1.22.8 [default] to 1.22.9 [default]
packages/core2-64-poky-linux/gst-devtools/gst-devtools-locale: PV changed from "1.22.8" to "1.22.9"
packages/core2-64-poky-linux/gst-devtools/gst-devtools-src: PKGV changed from 1.22.8 [default] to 1.22.9 [default]
packages/core2-64-poky-linux/gst-devtools/gst-devtools-src: PV changed from "1.22.8" to "1.22.9"
packages/core2-64-poky-linux/gst-devtools/gst-devtools-staticdev: PKGV changed from 1.22.8 [default] to 1.22.9 [default]
packages/core2-64-poky-linux/gst-devtools/gst-devtools-staticdev: PV changed from "1.22.8" to "1.22.9"
packages/core2-64-poky-linux/gst-devtools/gst-devtools: FILELIST: removed "/usr/lib/libgstvalidate-1.0.so.0.2208.0 /usr/lib/libgstvalidate-default-overrides-1.0.so.0.2208.0", added "/usr/lib/libgstvalidate-default-overrides-1.0.so.0.2209.0 /usr/lib/libgstvalidate-1.0.so.0.2209.0"
packages/core2-64-poky-linux/gst-devtools/gst-devtools: PKGV changed from 1.22.8 [default] to 1.22.9 [default]
packages/core2-64-poky-linux/gst-devtools/gst-devtools: PV changed from "1.22.8" to "1.22.9"
packages/core2-64-poky-linux/gst-devtools: PKGV changed from 1.22.8 [default] to 1.22.9 [default]
packages/core2-64-poky-linux/gst-devtools: SRC_URI changed from "https://gstreamer.freedesktop.org/src/gst-devtools/gst-devtools-1.22.8.tar.xz file://0001-connect-has-a-different-signature-on-musl.patch" to "https://gstreamer.freedesktop.org/src/gst-devtools/gst-devtools-1.22.9.tar.xz file://0001-connect-has-a-different-signature-on-musl.patch"
packages/core2-64-poky-linux/gst-devtools: PV changed from "1.22.8" to "1.22.9"
Changes to packages/core2-64-poky-linux/gst-devtools (sysroot):
  /usr/lib/libgstvalidate-1.0.so.0 changed symlink target from libgstvalidate-1.0.so.0.2208.0 to libgstvalidate-1.0.so.0.2209.0
  /usr/lib/libgstvalidate-default-overrides-1.0.so.0 changed symlink target from libgstvalidate-default-overrides-1.0.so.0.2208.0 to libgstvalidate-default-overrides-1.0.so.0.2209.0
  /usr/lib/libgstvalidate-1.0.so.0.2208.0 moved to /usr/lib/libgstvalidate-1.0.so.0.2209.0
  /usr/lib/libgstvalidate-default-overrides-1.0.so.0.2208.0 moved to /usr/lib/libgstvalidate-default-overrides-1.0.so.0.2209.0

--===============1922547362357943869==--

