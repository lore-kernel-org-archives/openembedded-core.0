Return-Path: <auh@yoctoproject.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 48BD0C3271A
	for <webhook@archiver.kernel.org>; Sat,  1 Jun 2024 17:33:42 +0000 (UTC)
Received: from a27-33.smtp-out.us-west-2.amazonses.com (a27-33.smtp-out.us-west-2.amazonses.com [54.240.27.33])
 by mx.groups.io with SMTP id smtpd.web10.42244.1717263219450838779
 for <openembedded-core@lists.openembedded.org>;
 Sat, 01 Jun 2024 10:33:39 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@yoctoproject.org header.s=rnkzp2s7ci3kogmesvov2nwn7wcc2dgx header.b=WnOB6cOW;
 dkim=pass header.i=@amazonses.com header.s=7v7vs6w47njt4pimodk5mmttbegzsi6n header.b=foQJ2rIM;
 spf=pass (domain: us-west-2.amazonses.com, ip: 54.240.27.33, mailfrom: 0101018fd4dd38b5-56caeedd-4c01-4183-b47e-75198ae1eefe-000000@us-west-2.amazonses.com)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=rnkzp2s7ci3kogmesvov2nwn7wcc2dgx; d=yoctoproject.org;
	t=1717263218;
	h=Content-Type:MIME-Version:From:To:Cc:Subject:Message-Id:Date;
	bh=uubXE2atTIK/J0lM7//4KNBjLN2bgD3vGUDncriqoOM=;
	b=WnOB6cOW2kWO1YmCY2BtyDgouw9FAO9+/51MWVeDuFQu8klNa//vButdH/JgZW6l
	p0zGbnbwo9+fKKKE5IeJV7F+zZEXcKJjeRphnieAURV3A3qRyxp9bHpkidj8cN3opY1
	S7NFozk4it//NQVABe2EllsIhoYnTXsMIoBNj9Xs=
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=7v7vs6w47njt4pimodk5mmttbegzsi6n; d=amazonses.com; t=1717263218;
	h=Content-Type:MIME-Version:From:To:Cc:Subject:Message-Id:Date:Feedback-ID;
	bh=uubXE2atTIK/J0lM7//4KNBjLN2bgD3vGUDncriqoOM=;
	b=foQJ2rIM6o11kS+CzZk1aGxZtr00QEAhSV2IjEtUrDWIfubhuLDgHwWFFfMADtOU
	UM0ZbfFFesFznJ0SQ0th8Cqcv0u3ijC3avkniyMDmznHSl6YMGmpKRWXhmdIKRHXvDT
	6T7pzOfNWKbhBq1tjSnVqP4Yybk2Rt/hZC9qcuFc=
Content-Type: multipart/mixed; boundary="===============6754470505510825788=="
MIME-Version: 1.0
From: auh@yoctoproject.org
To: Anuj Mittal <anuj.mittal@intel.com>
Cc: openembedded-core@lists.openembedded.org
Subject: [AUH] gst-devtools: upgrading to 1.24.4 SUCCEEDED
Message-ID: <0101018fd4dd38b5-56caeedd-4c01-4183-b47e-75198ae1eefe-000000@us-west-2.amazonses.com>
Date: Sat, 1 Jun 2024 17:33:38 +0000
Feedback-ID: ::1.us-west-2.9np3MYPs3fEaOBysGKSlUD4KtcmPijcmS9Az2Hwf7iQ=:AmazonSES
X-SES-Outgoing: 2024.06.01-54.240.27.33
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Sat, 01 Jun 2024 17:33:42 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/200174

--===============6754470505510825788==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

Hello,

this email is a notification from the Auto Upgrade Helper
that the automatic attempt to upgrade the recipe *gst-devtools* to *1.24.4* has Succeeded.

Next steps:
    - apply the patch: git am 0001-gst-devtools-upgrade-1.24.3-1.24.4.patch
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
From daa6e6c558137b7b91094e0363fd089be565c3a8 Mon Sep 17 00:00:00 2001
From: Upgrade Helper <auh@yoctoproject.org>
Date: Sat, 1 Jun 2024 14:36:31 +0000
Subject: [PATCH] gst-devtools: upgrade 1.24.3 -> 1.24.4

---
 .../0001-connect-has-a-different-signature-on-musl.patch        | 2 +-
 .../{gst-devtools_1.24.3.bb => gst-devtools_1.24.4.bb}          | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)
 rename meta/recipes-multimedia/gstreamer/{gst-devtools_1.24.3.bb => gst-devtools_1.24.4.bb} (95%)

diff --git a/meta/recipes-multimedia/gstreamer/gst-devtools/0001-connect-has-a-different-signature-on-musl.patch b/meta/recipes-multimedia/gstreamer/gst-devtools/0001-connect-has-a-different-signature-on-musl.patch
index 8520567f17..c0d472ab6e 100644
--- a/meta/recipes-multimedia/gstreamer/gst-devtools/0001-connect-has-a-different-signature-on-musl.patch
+++ b/meta/recipes-multimedia/gstreamer/gst-devtools/0001-connect-has-a-different-signature-on-musl.patch
@@ -1,4 +1,4 @@
-From c20894a5e6f52aa9fe3437e733a228b1a0eb6428 Mon Sep 17 00:00:00 2001
+From 18c5edde97ce0ee4ce11aedb782fe2388b7d2712 Mon Sep 17 00:00:00 2001
 From: Khem Raj <raj.khem@gmail.com>
 Date: Sun, 9 Sep 2018 17:38:10 -0700
 Subject: [PATCH] connect has a different signature on musl
diff --git a/meta/recipes-multimedia/gstreamer/gst-devtools_1.24.3.bb b/meta/recipes-multimedia/gstreamer/gst-devtools_1.24.4.bb
similarity index 95%
rename from meta/recipes-multimedia/gstreamer/gst-devtools_1.24.3.bb
rename to meta/recipes-multimedia/gstreamer/gst-devtools_1.24.4.bb
index 9df802afe9..eca0753cf2 100644
--- a/meta/recipes-multimedia/gstreamer/gst-devtools_1.24.3.bb
+++ b/meta/recipes-multimedia/gstreamer/gst-devtools_1.24.4.bb
@@ -12,7 +12,7 @@ SRC_URI = "https://gstreamer.freedesktop.org/src/gst-devtools/gst-devtools-${PV}
            file://0001-connect-has-a-different-signature-on-musl.patch \
            "
 
-SRC_URI[sha256sum] = "b91114a2fd958f42acf441186e87e2bec93538ef35a9f8248111197360ffb237"
+SRC_URI[sha256sum] = "8bff1b388522e03d761786e61fe9aff1f9867b8f7cc230043cbb2622dcf6f0fe"
 
 DEPENDS = "json-glib glib-2.0 glib-2.0-native gstreamer1.0 gstreamer1.0-plugins-base"
 RRECOMMENDS:${PN} = "git"
-- 
2.44.0


--===============6754470505510825788==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment; filename="buildhistory-diff-full.txt"

packages/core2-64-poky-linux/gst-devtools/gst-devtools-dbg: PV changed from "1.24.3" to "1.24.4"
packages/core2-64-poky-linux/gst-devtools/gst-devtools-dbg: PKGV changed from 1.24.3 [default] to 1.24.4 [default]
packages/core2-64-poky-linux/gst-devtools/gst-devtools-dbg: FILELIST: removed "/usr/lib/.debug/libgstvalidate-1.0.so.0.2403.0 /usr/lib/.debug/libgstvalidate-default-overrides-1.0.so.0.2403.0", added "/usr/lib/.debug/libgstvalidate-1.0.so.0.2404.0 /usr/lib/.debug/libgstvalidate-default-overrides-1.0.so.0.2404.0"
packages/core2-64-poky-linux/gst-devtools/gst-devtools-dev: PV changed from "1.24.3" to "1.24.4"
packages/core2-64-poky-linux/gst-devtools/gst-devtools-dev: PKGV changed from 1.24.3 [default] to 1.24.4 [default]
packages/core2-64-poky-linux/gst-devtools/gst-devtools-doc: PV changed from "1.24.3" to "1.24.4"
packages/core2-64-poky-linux/gst-devtools/gst-devtools-doc: PKGV changed from 1.24.3 [default] to 1.24.4 [default]
packages/core2-64-poky-linux/gst-devtools/gst-devtools-locale: PV changed from "1.24.3" to "1.24.4"
packages/core2-64-poky-linux/gst-devtools/gst-devtools-locale: PKGV changed from 1.24.3 [default] to 1.24.4 [default]
packages/core2-64-poky-linux/gst-devtools/gst-devtools-src: PV changed from "1.24.3" to "1.24.4"
packages/core2-64-poky-linux/gst-devtools/gst-devtools-src: PKGV changed from 1.24.3 [default] to 1.24.4 [default]
packages/core2-64-poky-linux/gst-devtools/gst-devtools-staticdev: PV changed from "1.24.3" to "1.24.4"
packages/core2-64-poky-linux/gst-devtools/gst-devtools-staticdev: PKGV changed from 1.24.3 [default] to 1.24.4 [default]
packages/core2-64-poky-linux/gst-devtools/gst-devtools: PV changed from "1.24.3" to "1.24.4"
packages/core2-64-poky-linux/gst-devtools/gst-devtools: PKGV changed from 1.24.3 [default] to 1.24.4 [default]
packages/core2-64-poky-linux/gst-devtools/gst-devtools: FILELIST: removed "/usr/lib/libgstvalidate-1.0.so.0.2403.0 /usr/lib/libgstvalidate-default-overrides-1.0.so.0.2403.0", added "/usr/lib/libgstvalidate-1.0.so.0.2404.0 /usr/lib/libgstvalidate-default-overrides-1.0.so.0.2404.0"
packages/core2-64-poky-linux/gst-devtools: PV changed from "1.24.3" to "1.24.4"
packages/core2-64-poky-linux/gst-devtools: SRC_URI changed from "https://gstreamer.freedesktop.org/src/gst-devtools/gst-devtools-1.24.3.tar.xz file://0001-connect-has-a-different-signature-on-musl.patch" to "https://gstreamer.freedesktop.org/src/gst-devtools/gst-devtools-1.24.4.tar.xz file://0001-connect-has-a-different-signature-on-musl.patch"
packages/core2-64-poky-linux/gst-devtools: PKGV changed from 1.24.3 [default] to 1.24.4 [default]
Changes to packages/core2-64-poky-linux/gst-devtools (sysroot):
  /usr/lib/libgstvalidate-1.0.so.0 changed symlink target from libgstvalidate-1.0.so.0.2403.0 to libgstvalidate-1.0.so.0.2404.0
  /usr/lib/libgstvalidate-default-overrides-1.0.so.0 changed symlink target from libgstvalidate-default-overrides-1.0.so.0.2403.0 to libgstvalidate-default-overrides-1.0.so.0.2404.0
  /usr/lib/libgstvalidate-1.0.so.0.2403.0 moved to /usr/lib/libgstvalidate-1.0.so.0.2404.0
  /usr/lib/libgstvalidate-default-overrides-1.0.so.0.2403.0 moved to /usr/lib/libgstvalidate-default-overrides-1.0.so.0.2404.0

--===============6754470505510825788==
Content-Type: application/octet-stream
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: attachment;
 filename="0001-gst-devtools-upgrade-1.24.3-1.24.4.patch"

RnJvbSBkYWE2ZTZjNTU4MTM3YjdiOTEwOTRlMDM2M2ZkMDg5YmU1NjVjM2E4IE1vbiBTZXAgMTcg
MDA6MDA6MDAgMjAwMQpGcm9tOiBVcGdyYWRlIEhlbHBlciA8YXVoQHlvY3RvcHJvamVjdC5vcmc+
CkRhdGU6IFNhdCwgMSBKdW4gMjAyNCAxNDozNjozMSArMDAwMApTdWJqZWN0OiBbUEFUQ0hdIGdz
dC1kZXZ0b29sczogdXBncmFkZSAxLjI0LjMgLT4gMS4yNC40CgotLS0KIC4uLi8wMDAxLWNvbm5l
Y3QtaGFzLWEtZGlmZmVyZW50LXNpZ25hdHVyZS1vbi1tdXNsLnBhdGNoICAgICAgICB8IDIgKy0K
IC4uLi97Z3N0LWRldnRvb2xzXzEuMjQuMy5iYiA9PiBnc3QtZGV2dG9vbHNfMS4yNC40LmJifSAg
ICAgICAgICB8IDIgKy0KIDIgZmlsZXMgY2hhbmdlZCwgMiBpbnNlcnRpb25zKCspLCAyIGRlbGV0
aW9ucygtKQogcmVuYW1lIG1ldGEvcmVjaXBlcy1tdWx0aW1lZGlhL2dzdHJlYW1lci97Z3N0LWRl
dnRvb2xzXzEuMjQuMy5iYiA9PiBnc3QtZGV2dG9vbHNfMS4yNC40LmJifSAoOTUlKQoKZGlmZiAt
LWdpdCBhL21ldGEvcmVjaXBlcy1tdWx0aW1lZGlhL2dzdHJlYW1lci9nc3QtZGV2dG9vbHMvMDAw
MS1jb25uZWN0LWhhcy1hLWRpZmZlcmVudC1zaWduYXR1cmUtb24tbXVzbC5wYXRjaCBiL21ldGEv
cmVjaXBlcy1tdWx0aW1lZGlhL2dzdHJlYW1lci9nc3QtZGV2dG9vbHMvMDAwMS1jb25uZWN0LWhh
cy1hLWRpZmZlcmVudC1zaWduYXR1cmUtb24tbXVzbC5wYXRjaAppbmRleCA4NTIwNTY3ZjE3Li5j
MGQ0NzJhYjZlIDEwMDY0NAotLS0gYS9tZXRhL3JlY2lwZXMtbXVsdGltZWRpYS9nc3RyZWFtZXIv
Z3N0LWRldnRvb2xzLzAwMDEtY29ubmVjdC1oYXMtYS1kaWZmZXJlbnQtc2lnbmF0dXJlLW9uLW11
c2wucGF0Y2gKKysrIGIvbWV0YS9yZWNpcGVzLW11bHRpbWVkaWEvZ3N0cmVhbWVyL2dzdC1kZXZ0
b29scy8wMDAxLWNvbm5lY3QtaGFzLWEtZGlmZmVyZW50LXNpZ25hdHVyZS1vbi1tdXNsLnBhdGNo
CkBAIC0xLDQgKzEsNCBAQAotRnJvbSBjMjA4OTRhNWU2ZjUyYWE5ZmUzNDM3ZTczM2EyMjhiMWEw
ZWI2NDI4IE1vbiBTZXAgMTcgMDA6MDA6MDAgMjAwMQorRnJvbSAxOGM1ZWRkZTk3Y2UwZWU0Y2Ux
MWFlZGI3ODJmZTIzODhiN2QyNzEyIE1vbiBTZXAgMTcgMDA6MDA6MDAgMjAwMQogRnJvbTogS2hl
bSBSYWogPHJhai5raGVtQGdtYWlsLmNvbT4KIERhdGU6IFN1biwgOSBTZXAgMjAxOCAxNzozODox
MCAtMDcwMAogU3ViamVjdDogW1BBVENIXSBjb25uZWN0IGhhcyBhIGRpZmZlcmVudCBzaWduYXR1
cmUgb24gbXVzbApkaWZmIC0tZ2l0IGEvbWV0YS9yZWNpcGVzLW11bHRpbWVkaWEvZ3N0cmVhbWVy
L2dzdC1kZXZ0b29sc18xLjI0LjMuYmIgYi9tZXRhL3JlY2lwZXMtbXVsdGltZWRpYS9nc3RyZWFt
ZXIvZ3N0LWRldnRvb2xzXzEuMjQuNC5iYgpzaW1pbGFyaXR5IGluZGV4IDk1JQpyZW5hbWUgZnJv
bSBtZXRhL3JlY2lwZXMtbXVsdGltZWRpYS9nc3RyZWFtZXIvZ3N0LWRldnRvb2xzXzEuMjQuMy5i
YgpyZW5hbWUgdG8gbWV0YS9yZWNpcGVzLW11bHRpbWVkaWEvZ3N0cmVhbWVyL2dzdC1kZXZ0b29s
c18xLjI0LjQuYmIKaW5kZXggOWRmODAyYWZlOS4uZWNhMDc1M2NmMiAxMDA2NDQKLS0tIGEvbWV0
YS9yZWNpcGVzLW11bHRpbWVkaWEvZ3N0cmVhbWVyL2dzdC1kZXZ0b29sc18xLjI0LjMuYmIKKysr
IGIvbWV0YS9yZWNpcGVzLW11bHRpbWVkaWEvZ3N0cmVhbWVyL2dzdC1kZXZ0b29sc18xLjI0LjQu
YmIKQEAgLTEyLDcgKzEyLDcgQEAgU1JDX1VSSSA9ICJodHRwczovL2dzdHJlYW1lci5mcmVlZGVz
a3RvcC5vcmcvc3JjL2dzdC1kZXZ0b29scy9nc3QtZGV2dG9vbHMtJHtQVn0KICAgICAgICAgICAg
ZmlsZTovLzAwMDEtY29ubmVjdC1oYXMtYS1kaWZmZXJlbnQtc2lnbmF0dXJlLW9uLW11c2wucGF0
Y2ggXAogICAgICAgICAgICAiCiAKLVNSQ19VUklbc2hhMjU2c3VtXSA9ICJiOTExMTRhMmZkOTU4
ZjQyYWNmNDQxMTg2ZTg3ZTJiZWM5MzUzOGVmMzVhOWY4MjQ4MTExMTk3MzYwZmZiMjM3IgorU1JD
X1VSSVtzaGEyNTZzdW1dID0gIjhiZmYxYjM4ODUyMmUwM2Q3NjE3ODZlNjFmZTlhZmYxZjk4Njdi
OGY3Y2MyMzAwNDNjYmIyNjIyZGNmNmYwZmUiCiAKIERFUEVORFMgPSAianNvbi1nbGliIGdsaWIt
Mi4wIGdsaWItMi4wLW5hdGl2ZSBnc3RyZWFtZXIxLjAgZ3N0cmVhbWVyMS4wLXBsdWdpbnMtYmFz
ZSIKIFJSRUNPTU1FTkRTOiR7UE59ID0gImdpdCIKLS0gCjIuNDQuMAoK

--===============6754470505510825788==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment; filename="buildhistory-diff.txt"

packages/core2-64-poky-linux/gst-devtools/gst-devtools: FILELIST: removed "/usr/lib/libgstvalidate-1.0.so.0.2403.0 /usr/lib/libgstvalidate-default-overrides-1.0.so.0.2403.0", added "/usr/lib/libgstvalidate-1.0.so.0.2404.0 /usr/lib/libgstvalidate-default-overrides-1.0.so.0.2404.0"
Changes to packages/core2-64-poky-linux/gst-devtools (sysroot):
  /usr/lib/libgstvalidate-1.0.so.0 changed symlink target from libgstvalidate-1.0.so.0.2403.0 to libgstvalidate-1.0.so.0.2404.0
  /usr/lib/libgstvalidate-default-overrides-1.0.so.0 changed symlink target from libgstvalidate-default-overrides-1.0.so.0.2403.0 to libgstvalidate-default-overrides-1.0.so.0.2404.0
  /usr/lib/libgstvalidate-1.0.so.0.2403.0 moved to /usr/lib/libgstvalidate-1.0.so.0.2404.0
  /usr/lib/libgstvalidate-default-overrides-1.0.so.0.2403.0 moved to /usr/lib/libgstvalidate-default-overrides-1.0.so.0.2404.0

--===============6754470505510825788==--

