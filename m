Return-Path: <auh@yoctoproject.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id AA8A4C54FC6
	for <webhook@archiver.kernel.org>; Thu,  1 Aug 2024 18:27:26 +0000 (UTC)
Received: from a27-193.smtp-out.us-west-2.amazonses.com (a27-193.smtp-out.us-west-2.amazonses.com [54.240.27.193])
 by mx.groups.io with SMTP id smtpd.web10.75736.1722536822878673328
 for <openembedded-core@lists.openembedded.org>;
 Thu, 01 Aug 2024 11:27:15 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@yoctoproject.org header.s=rnkzp2s7ci3kogmesvov2nwn7wcc2dgx header.b=H9R4seRA;
 dkim=pass header.i=@amazonses.com header.s=7v7vs6w47njt4pimodk5mmttbegzsi6n header.b=QlYoD45Z;
 spf=pass (domain: us-west-2.amazonses.com, ip: 54.240.27.193, mailfrom: 010101910f32395d-dd3def46-6a20-430b-b15f-1b8b2498a775-000000@us-west-2.amazonses.com)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=rnkzp2s7ci3kogmesvov2nwn7wcc2dgx; d=yoctoproject.org;
	t=1722536835;
	h=Content-Type:MIME-Version:From:To:Cc:Subject:Message-Id:Date;
	bh=DDpt8g8yWnRZGZOnO3chRwvNeZDyArguJqSVN4Qkmgk=;
	b=H9R4seRAjjzasBTYAezsQNlDx5dQ8sSn41ROXo2p+WnyWGiLtMONq/OteDx0ZKKj
	bcNY9KRSa9WuFUL0t9UeNvSNnCbn3fFFPSfLyGLHpLa/OFvHoMkLYvoG4Z1iMVbKaCH
	dp41UEHqDiubxI1VVuTjHhhIkSNs0XNhTb3/pW8c=
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=7v7vs6w47njt4pimodk5mmttbegzsi6n; d=amazonses.com; t=1722536835;
	h=Content-Type:MIME-Version:From:To:Cc:Subject:Message-Id:Date:Feedback-ID;
	bh=DDpt8g8yWnRZGZOnO3chRwvNeZDyArguJqSVN4Qkmgk=;
	b=QlYoD45ZJijYqM9sfWu1M/Dl4gnAmrhXaoJlekw6t+wyJ011iCSeVWRexUrnPF1I
	JPeRfbQ3OGz6mv0Bo2wZOUd3qkQLLNGsgEpFtpCkG4zFyjsqjUs9ev576BhhxMPSdG5
	+UoYJiQkKlorWsGcxDL6tKEeo1SFRmZbH/B5rPj4=
Content-Type: multipart/mixed; boundary="===============8951097259006003941=="
MIME-Version: 1.0
From: auh@yoctoproject.org
To: Anuj Mittal <anuj.mittal@intel.com>
Cc: openembedded-core@lists.openembedded.org
Subject: [AUH] gst-devtools: upgrading to 1.24.6 SUCCEEDED
Message-ID: <010101910f32395d-dd3def46-6a20-430b-b15f-1b8b2498a775-000000@us-west-2.amazonses.com>
Date: Thu, 1 Aug 2024 18:27:15 +0000
Feedback-ID: ::1.us-west-2.9np3MYPs3fEaOBysGKSlUD4KtcmPijcmS9Az2Hwf7iQ=:AmazonSES
X-SES-Outgoing: 2024.08.01-54.240.27.193
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 01 Aug 2024 18:27:26 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/202864

--===============8951097259006003941==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

Hello,

this email is a notification from the Auto Upgrade Helper
that the automatic attempt to upgrade the recipe(s) *gst-devtools* to *1.24.6* has Succeeded.

Next steps:
    - apply the patch: git am 0001-gst-devtools-upgrade-1.24.5-1.24.6.patch
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
From c38b4f925f4424541bd61d9304cf5a13f18e8417 Mon Sep 17 00:00:00 2001
From: Upgrade Helper <auh@yoctoproject.org>
Date: Thu, 1 Aug 2024 15:18:08 +0000
Subject: [PATCH] gst-devtools: upgrade 1.24.5 -> 1.24.6

---
 .../0001-connect-has-a-different-signature-on-musl.patch        | 2 +-
 .../{gst-devtools_1.24.5.bb => gst-devtools_1.24.6.bb}          | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)
 rename meta/recipes-multimedia/gstreamer/{gst-devtools_1.24.5.bb => gst-devtools_1.24.6.bb} (95%)

diff --git a/meta/recipes-multimedia/gstreamer/gst-devtools/0001-connect-has-a-different-signature-on-musl.patch b/meta/recipes-multimedia/gstreamer/gst-devtools/0001-connect-has-a-different-signature-on-musl.patch
index 8520567f17..9b31a4aa6b 100644
--- a/meta/recipes-multimedia/gstreamer/gst-devtools/0001-connect-has-a-different-signature-on-musl.patch
+++ b/meta/recipes-multimedia/gstreamer/gst-devtools/0001-connect-has-a-different-signature-on-musl.patch
@@ -1,4 +1,4 @@
-From c20894a5e6f52aa9fe3437e733a228b1a0eb6428 Mon Sep 17 00:00:00 2001
+From 056490cf853c8147dd8e890cba1a356bc8704c1e Mon Sep 17 00:00:00 2001
 From: Khem Raj <raj.khem@gmail.com>
 Date: Sun, 9 Sep 2018 17:38:10 -0700
 Subject: [PATCH] connect has a different signature on musl
diff --git a/meta/recipes-multimedia/gstreamer/gst-devtools_1.24.5.bb b/meta/recipes-multimedia/gstreamer/gst-devtools_1.24.6.bb
similarity index 95%
rename from meta/recipes-multimedia/gstreamer/gst-devtools_1.24.5.bb
rename to meta/recipes-multimedia/gstreamer/gst-devtools_1.24.6.bb
index d4a81b69a1..1b448f7c55 100644
--- a/meta/recipes-multimedia/gstreamer/gst-devtools_1.24.5.bb
+++ b/meta/recipes-multimedia/gstreamer/gst-devtools_1.24.6.bb
@@ -12,7 +12,7 @@ SRC_URI = "https://gstreamer.freedesktop.org/src/gst-devtools/gst-devtools-${PV}
            file://0001-connect-has-a-different-signature-on-musl.patch \
            "
 
-SRC_URI[sha256sum] = "a96675898129a480d05bbf91071ec4e40154dcad6d62f3944154a6cb326045a4"
+SRC_URI[sha256sum] = "8beb9e98ed136c29f4ec10396dd6c8708a5645cdacda90af1b7196057de17672"
 
 DEPENDS = "json-glib glib-2.0 glib-2.0-native gstreamer1.0 gstreamer1.0-plugins-base"
 RRECOMMENDS:${PN} = "git"
-- 
2.44.0


--===============8951097259006003941==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment; filename="buildhistory-diff.txt"

packages/core2-64-poky-linux/gst-devtools/gst-devtools: FILELIST: removed "/usr/lib/libgstvalidate-default-overrides-1.0.so.0.2405.0 /usr/lib/libgstvalidate-1.0.so.0.2405.0", added "/usr/lib/libgstvalidate-default-overrides-1.0.so.0.2406.0 /usr/lib/libgstvalidate-1.0.so.0.2406.0"
Changes to packages/core2-64-poky-linux/gst-devtools (sysroot):
  /usr/lib/libgstvalidate-1.0.so.0 changed symlink target from libgstvalidate-1.0.so.0.2405.0 to libgstvalidate-1.0.so.0.2406.0
  /usr/lib/libgstvalidate-default-overrides-1.0.so.0 changed symlink target from libgstvalidate-default-overrides-1.0.so.0.2405.0 to libgstvalidate-default-overrides-1.0.so.0.2406.0
  /usr/lib/libgstvalidate-1.0.so.0.2405.0 moved to /usr/lib/libgstvalidate-1.0.so.0.2406.0
  /usr/lib/libgstvalidate-default-overrides-1.0.so.0.2405.0 moved to /usr/lib/libgstvalidate-default-overrides-1.0.so.0.2406.0

--===============8951097259006003941==
Content-Type: application/octet-stream
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: attachment;
 filename="0001-gst-devtools-upgrade-1.24.5-1.24.6.patch"

RnJvbSBjMzhiNGY5MjVmNDQyNDU0MWJkNjFkOTMwNGNmNWExM2YxOGU4NDE3IE1vbiBTZXAgMTcg
MDA6MDA6MDAgMjAwMQpGcm9tOiBVcGdyYWRlIEhlbHBlciA8YXVoQHlvY3RvcHJvamVjdC5vcmc+
CkRhdGU6IFRodSwgMSBBdWcgMjAyNCAxNToxODowOCArMDAwMApTdWJqZWN0OiBbUEFUQ0hdIGdz
dC1kZXZ0b29sczogdXBncmFkZSAxLjI0LjUgLT4gMS4yNC42CgotLS0KIC4uLi8wMDAxLWNvbm5l
Y3QtaGFzLWEtZGlmZmVyZW50LXNpZ25hdHVyZS1vbi1tdXNsLnBhdGNoICAgICAgICB8IDIgKy0K
IC4uLi97Z3N0LWRldnRvb2xzXzEuMjQuNS5iYiA9PiBnc3QtZGV2dG9vbHNfMS4yNC42LmJifSAg
ICAgICAgICB8IDIgKy0KIDIgZmlsZXMgY2hhbmdlZCwgMiBpbnNlcnRpb25zKCspLCAyIGRlbGV0
aW9ucygtKQogcmVuYW1lIG1ldGEvcmVjaXBlcy1tdWx0aW1lZGlhL2dzdHJlYW1lci97Z3N0LWRl
dnRvb2xzXzEuMjQuNS5iYiA9PiBnc3QtZGV2dG9vbHNfMS4yNC42LmJifSAoOTUlKQoKZGlmZiAt
LWdpdCBhL21ldGEvcmVjaXBlcy1tdWx0aW1lZGlhL2dzdHJlYW1lci9nc3QtZGV2dG9vbHMvMDAw
MS1jb25uZWN0LWhhcy1hLWRpZmZlcmVudC1zaWduYXR1cmUtb24tbXVzbC5wYXRjaCBiL21ldGEv
cmVjaXBlcy1tdWx0aW1lZGlhL2dzdHJlYW1lci9nc3QtZGV2dG9vbHMvMDAwMS1jb25uZWN0LWhh
cy1hLWRpZmZlcmVudC1zaWduYXR1cmUtb24tbXVzbC5wYXRjaAppbmRleCA4NTIwNTY3ZjE3Li45
YjMxYTRhYTZiIDEwMDY0NAotLS0gYS9tZXRhL3JlY2lwZXMtbXVsdGltZWRpYS9nc3RyZWFtZXIv
Z3N0LWRldnRvb2xzLzAwMDEtY29ubmVjdC1oYXMtYS1kaWZmZXJlbnQtc2lnbmF0dXJlLW9uLW11
c2wucGF0Y2gKKysrIGIvbWV0YS9yZWNpcGVzLW11bHRpbWVkaWEvZ3N0cmVhbWVyL2dzdC1kZXZ0
b29scy8wMDAxLWNvbm5lY3QtaGFzLWEtZGlmZmVyZW50LXNpZ25hdHVyZS1vbi1tdXNsLnBhdGNo
CkBAIC0xLDQgKzEsNCBAQAotRnJvbSBjMjA4OTRhNWU2ZjUyYWE5ZmUzNDM3ZTczM2EyMjhiMWEw
ZWI2NDI4IE1vbiBTZXAgMTcgMDA6MDA6MDAgMjAwMQorRnJvbSAwNTY0OTBjZjg1M2M4MTQ3ZGQ4
ZTg5MGNiYTFhMzU2YmM4NzA0YzFlIE1vbiBTZXAgMTcgMDA6MDA6MDAgMjAwMQogRnJvbTogS2hl
bSBSYWogPHJhai5raGVtQGdtYWlsLmNvbT4KIERhdGU6IFN1biwgOSBTZXAgMjAxOCAxNzozODox
MCAtMDcwMAogU3ViamVjdDogW1BBVENIXSBjb25uZWN0IGhhcyBhIGRpZmZlcmVudCBzaWduYXR1
cmUgb24gbXVzbApkaWZmIC0tZ2l0IGEvbWV0YS9yZWNpcGVzLW11bHRpbWVkaWEvZ3N0cmVhbWVy
L2dzdC1kZXZ0b29sc18xLjI0LjUuYmIgYi9tZXRhL3JlY2lwZXMtbXVsdGltZWRpYS9nc3RyZWFt
ZXIvZ3N0LWRldnRvb2xzXzEuMjQuNi5iYgpzaW1pbGFyaXR5IGluZGV4IDk1JQpyZW5hbWUgZnJv
bSBtZXRhL3JlY2lwZXMtbXVsdGltZWRpYS9nc3RyZWFtZXIvZ3N0LWRldnRvb2xzXzEuMjQuNS5i
YgpyZW5hbWUgdG8gbWV0YS9yZWNpcGVzLW11bHRpbWVkaWEvZ3N0cmVhbWVyL2dzdC1kZXZ0b29s
c18xLjI0LjYuYmIKaW5kZXggZDRhODFiNjlhMS4uMWI0NDhmN2M1NSAxMDA2NDQKLS0tIGEvbWV0
YS9yZWNpcGVzLW11bHRpbWVkaWEvZ3N0cmVhbWVyL2dzdC1kZXZ0b29sc18xLjI0LjUuYmIKKysr
IGIvbWV0YS9yZWNpcGVzLW11bHRpbWVkaWEvZ3N0cmVhbWVyL2dzdC1kZXZ0b29sc18xLjI0LjYu
YmIKQEAgLTEyLDcgKzEyLDcgQEAgU1JDX1VSSSA9ICJodHRwczovL2dzdHJlYW1lci5mcmVlZGVz
a3RvcC5vcmcvc3JjL2dzdC1kZXZ0b29scy9nc3QtZGV2dG9vbHMtJHtQVn0KICAgICAgICAgICAg
ZmlsZTovLzAwMDEtY29ubmVjdC1oYXMtYS1kaWZmZXJlbnQtc2lnbmF0dXJlLW9uLW11c2wucGF0
Y2ggXAogICAgICAgICAgICAiCiAKLVNSQ19VUklbc2hhMjU2c3VtXSA9ICJhOTY2NzU4OTgxMjlh
NDgwZDA1YmJmOTEwNzFlYzRlNDAxNTRkY2FkNmQ2MmYzOTQ0MTU0YTZjYjMyNjA0NWE0IgorU1JD
X1VSSVtzaGEyNTZzdW1dID0gIjhiZWI5ZTk4ZWQxMzZjMjlmNGVjMTAzOTZkZDZjODcwOGE1NjQ1
Y2RhY2RhOTBhZjFiNzE5NjA1N2RlMTc2NzIiCiAKIERFUEVORFMgPSAianNvbi1nbGliIGdsaWIt
Mi4wIGdsaWItMi4wLW5hdGl2ZSBnc3RyZWFtZXIxLjAgZ3N0cmVhbWVyMS4wLXBsdWdpbnMtYmFz
ZSIKIFJSRUNPTU1FTkRTOiR7UE59ID0gImdpdCIKLS0gCjIuNDQuMAoK

--===============8951097259006003941==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment; filename="buildhistory-diff-full.txt"

packages/core2-64-poky-linux/gst-devtools/gst-devtools-dbg: PKGV changed from 1.24.5 [default] to 1.24.6 [default]
packages/core2-64-poky-linux/gst-devtools/gst-devtools-dbg: FILELIST: removed "/usr/lib/.debug/libgstvalidate-1.0.so.0.2405.0 /usr/lib/.debug/libgstvalidate-default-overrides-1.0.so.0.2405.0", added "/usr/lib/.debug/libgstvalidate-1.0.so.0.2406.0 /usr/lib/.debug/libgstvalidate-default-overrides-1.0.so.0.2406.0"
packages/core2-64-poky-linux/gst-devtools/gst-devtools-dbg: PV changed from "1.24.5" to "1.24.6"
packages/core2-64-poky-linux/gst-devtools/gst-devtools-dev: PKGV changed from 1.24.5 [default] to 1.24.6 [default]
packages/core2-64-poky-linux/gst-devtools/gst-devtools-dev: PV changed from "1.24.5" to "1.24.6"
packages/core2-64-poky-linux/gst-devtools/gst-devtools-doc: PKGV changed from 1.24.5 [default] to 1.24.6 [default]
packages/core2-64-poky-linux/gst-devtools/gst-devtools-doc: PV changed from "1.24.5" to "1.24.6"
packages/core2-64-poky-linux/gst-devtools/gst-devtools-locale: PKGV changed from 1.24.5 [default] to 1.24.6 [default]
packages/core2-64-poky-linux/gst-devtools/gst-devtools-locale: PV changed from "1.24.5" to "1.24.6"
packages/core2-64-poky-linux/gst-devtools/gst-devtools-src: PKGV changed from 1.24.5 [default] to 1.24.6 [default]
packages/core2-64-poky-linux/gst-devtools/gst-devtools-src: PKGSIZE changed from 966038 to 965990 (-0%)
packages/core2-64-poky-linux/gst-devtools/gst-devtools-src: PV changed from "1.24.5" to "1.24.6"
packages/core2-64-poky-linux/gst-devtools/gst-devtools-staticdev: PKGV changed from 1.24.5 [default] to 1.24.6 [default]
packages/core2-64-poky-linux/gst-devtools/gst-devtools-staticdev: PV changed from "1.24.5" to "1.24.6"
packages/core2-64-poky-linux/gst-devtools/gst-devtools: PKGV changed from 1.24.5 [default] to 1.24.6 [default]
packages/core2-64-poky-linux/gst-devtools/gst-devtools: FILELIST: removed "/usr/lib/libgstvalidate-1.0.so.0.2405.0 /usr/lib/libgstvalidate-default-overrides-1.0.so.0.2405.0", added "/usr/lib/libgstvalidate-1.0.so.0.2406.0 /usr/lib/libgstvalidate-default-overrides-1.0.so.0.2406.0"
packages/core2-64-poky-linux/gst-devtools/gst-devtools: PV changed from "1.24.5" to "1.24.6"
packages/core2-64-poky-linux/gst-devtools: PKGV changed from 1.24.5 [default] to 1.24.6 [default]
packages/core2-64-poky-linux/gst-devtools: SRC_URI changed from "https://gstreamer.freedesktop.org/src/gst-devtools/gst-devtools-1.24.5.tar.xz file://0001-connect-has-a-different-signature-on-musl.patch" to "https://gstreamer.freedesktop.org/src/gst-devtools/gst-devtools-1.24.6.tar.xz file://0001-connect-has-a-different-signature-on-musl.patch"
packages/core2-64-poky-linux/gst-devtools: PV changed from "1.24.5" to "1.24.6"
Changes to packages/core2-64-poky-linux/gst-devtools (sysroot):
  /usr/lib/libgstvalidate-1.0.so.0 changed symlink target from libgstvalidate-1.0.so.0.2405.0 to libgstvalidate-1.0.so.0.2406.0
  /usr/lib/libgstvalidate-default-overrides-1.0.so.0 changed symlink target from libgstvalidate-default-overrides-1.0.so.0.2405.0 to libgstvalidate-default-overrides-1.0.so.0.2406.0
  /usr/lib/libgstvalidate-1.0.so.0.2405.0 moved to /usr/lib/libgstvalidate-1.0.so.0.2406.0
  /usr/lib/libgstvalidate-default-overrides-1.0.so.0.2405.0 moved to /usr/lib/libgstvalidate-default-overrides-1.0.so.0.2406.0

--===============8951097259006003941==--

