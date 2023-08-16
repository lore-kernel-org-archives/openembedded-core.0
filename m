Return-Path: <auh@yoctoproject.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 0E370C64EAE
	for <webhook@archiver.kernel.org>; Wed, 16 Aug 2023 22:19:15 +0000 (UTC)
Received: from a27-33.smtp-out.us-west-2.amazonses.com (a27-33.smtp-out.us-west-2.amazonses.com [54.240.27.33])
 by mx.groups.io with SMTP id smtpd.web11.173811.1692224345044631087
 for <openembedded-core@lists.openembedded.org>;
 Wed, 16 Aug 2023 15:19:11 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@yoctoproject.org header.s=lvjh2tk576v2ro5mi6k4dt3mc6wpqbky header.b=T6ysHXSy;
 dkim=pass header.i=@amazonses.com header.s=hsbnp7p3ensaochzwyq5wwmceodymuwv header.b=Qy0M74re;
 spf=pass (domain: us-west-2.amazonses.com, ip: 54.240.27.33, mailfrom: 0101018a006e6c0a-e60d0e03-8410-4f2f-8512-911477530c5a-000000@us-west-2.amazonses.com)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=lvjh2tk576v2ro5mi6k4dt3mc6wpqbky; d=yoctoproject.org;
	t=1692224351;
	h=Content-Type:MIME-Version:From:To:Cc:Subject:Message-Id:Date;
	bh=0FD6iZExcXqDB0qq4GpSCxXBCKeeGdIkTuK7LPkuV8M=;
	b=T6ysHXSyNa4PxJD+kzUUM7lr7fzMSNoheJQDj9XuESJEfsn1oGjdsL+/+Q2eOIfe
	uxyj+4zYbdL77hEHXlEuIGHEPuxiTDI7t2ir/cfYQvrXEDqbJ51qB5G1ZGqiN1w2qHS
	7sTEWa6PYXRV70W8fhBXkVxRNh7LuXUAcEmTzucY=
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=hsbnp7p3ensaochzwyq5wwmceodymuwv; d=amazonses.com; t=1692224351;
	h=Content-Type:MIME-Version:From:To:Cc:Subject:Message-Id:Date:Feedback-ID;
	bh=0FD6iZExcXqDB0qq4GpSCxXBCKeeGdIkTuK7LPkuV8M=;
	b=Qy0M74reddBivkQ0912Axk/k2dx9qMKqqt4qOxkEcnnan5ZbensfOxTycO6D4Tyy
	wIF9HQ2seqeMejhfCRu9mAcnEAPNNM2ycZxyCamwS/jx8XMF+vhA+U0swdeJKdIeg9+
	eSHUpr6wcUNabVKfKn+iJ5o3FSFJ3EiX89dVhd34=
Content-Type: multipart/mixed; boundary="===============2240411258015043938=="
MIME-Version: 1.0
From: auh@yoctoproject.org
To: Anuj Mittal <anuj.mittal@intel.com>
Cc: openembedded-core@lists.openembedded.org
Subject: [AUH] gst-devtools: upgrading to 1.22.5 SUCCEEDED
Message-ID: <0101018a006e6c0a-e60d0e03-8410-4f2f-8512-911477530c5a-000000@us-west-2.amazonses.com>
Date: Wed, 16 Aug 2023 22:19:11 +0000
Feedback-ID: 1.us-west-2.9np3MYPs3fEaOBysGKSlUD4KtcmPijcmS9Az2Hwf7iQ=:AmazonSES
X-SES-Outgoing: 2023.08.16-54.240.27.33
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 16 Aug 2023 22:19:15 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/186233

--===============2240411258015043938==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

Hello,

this email is a notification from the Auto Upgrade Helper
that the automatic attempt to upgrade the recipe *gst-devtools* to *1.22.5* has Succeeded.

Next steps:
    - apply the patch: git am 0001-gst-devtools-upgrade-1.22.4-1.22.5.patch
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
From 7d220217e2fe372281390f9e39ca67c695d29e99 Mon Sep 17 00:00:00 2001
From: Upgrade Helper <auh@yoctoproject.org>
Date: Wed, 16 Aug 2023 16:59:18 +0000
Subject: [PATCH] gst-devtools: upgrade 1.22.4 -> 1.22.5

---
 .../{gst-devtools_1.22.4.bb => gst-devtools_1.22.5.bb}          | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta/recipes-multimedia/gstreamer/{gst-devtools_1.22.4.bb => gst-devtools_1.22.5.bb} (95%)

diff --git a/meta/recipes-multimedia/gstreamer/gst-devtools_1.22.4.bb b/meta/recipes-multimedia/gstreamer/gst-devtools_1.22.5.bb
similarity index 95%
rename from meta/recipes-multimedia/gstreamer/gst-devtools_1.22.4.bb
rename to meta/recipes-multimedia/gstreamer/gst-devtools_1.22.5.bb
index beaf1a9b91..3e029396a6 100644
--- a/meta/recipes-multimedia/gstreamer/gst-devtools_1.22.4.bb
+++ b/meta/recipes-multimedia/gstreamer/gst-devtools_1.22.5.bb
@@ -12,7 +12,7 @@ SRC_URI = "https://gstreamer.freedesktop.org/src/gst-devtools/gst-devtools-${PV}
            file://0001-connect-has-a-different-signature-on-musl.patch \
            "
 
-SRC_URI[sha256sum] = "4c52053ce8c1df72fd81721e9f53de3b146edcf2de28f607be705bce4cf909d1"
+SRC_URI[sha256sum] = "2add1519aa6eeb01d544cb94293688ee3bc2079f6bca6075bf5c23d00a0921be"
 
 DEPENDS = "json-glib glib-2.0 glib-2.0-native gstreamer1.0 gstreamer1.0-plugins-base"
 RRECOMMENDS:${PN} = "git"
-- 
2.39.2


--===============2240411258015043938==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment; filename="buildhistory-diff-full.txt"

packages/core2-32-poky-linux/gst-devtools/gst-devtools-dbg: PV changed from "1.22.4" to "1.22.5"
packages/core2-32-poky-linux/gst-devtools/gst-devtools-dbg: PKGV changed from 1.22.4 [default] to 1.22.5 [default]
packages/core2-32-poky-linux/gst-devtools/gst-devtools-dbg: FILELIST: removed "/usr/lib/.debug/libgstvalidate-1.0.so.0.2204.0 /usr/lib/.debug/libgstvalidate-default-overrides-1.0.so.0.2204.0", added "/usr/lib/.debug/libgstvalidate-default-overrides-1.0.so.0.2205.0 /usr/lib/.debug/libgstvalidate-1.0.so.0.2205.0"
packages/core2-32-poky-linux/gst-devtools/gst-devtools-dev: PV changed from "1.22.4" to "1.22.5"
packages/core2-32-poky-linux/gst-devtools/gst-devtools-dev: PKGV changed from 1.22.4 [default] to 1.22.5 [default]
packages/core2-32-poky-linux/gst-devtools/gst-devtools-doc: PV changed from "1.22.4" to "1.22.5"
packages/core2-32-poky-linux/gst-devtools/gst-devtools-doc: PKGV changed from 1.22.4 [default] to 1.22.5 [default]
packages/core2-32-poky-linux/gst-devtools/gst-devtools-locale: PV changed from "1.22.4" to "1.22.5"
packages/core2-32-poky-linux/gst-devtools/gst-devtools-locale: PKGV changed from 1.22.4 [default] to 1.22.5 [default]
packages/core2-32-poky-linux/gst-devtools/gst-devtools-src: PV changed from "1.22.4" to "1.22.5"
packages/core2-32-poky-linux/gst-devtools/gst-devtools-src: PKGV changed from 1.22.4 [default] to 1.22.5 [default]
packages/core2-32-poky-linux/gst-devtools/gst-devtools-staticdev: PV changed from "1.22.4" to "1.22.5"
packages/core2-32-poky-linux/gst-devtools/gst-devtools-staticdev: PKGV changed from 1.22.4 [default] to 1.22.5 [default]
packages/core2-32-poky-linux/gst-devtools/gst-devtools: PV changed from "1.22.4" to "1.22.5"
packages/core2-32-poky-linux/gst-devtools/gst-devtools: PKGV changed from 1.22.4 [default] to 1.22.5 [default]
packages/core2-32-poky-linux/gst-devtools/gst-devtools: FILELIST: removed "/usr/lib/libgstvalidate-default-overrides-1.0.so.0.2204.0 /usr/lib/libgstvalidate-1.0.so.0.2204.0", added "/usr/lib/libgstvalidate-default-overrides-1.0.so.0.2205.0 /usr/lib/libgstvalidate-1.0.so.0.2205.0"
packages/core2-32-poky-linux/gst-devtools: PV changed from "1.22.4" to "1.22.5"
packages/core2-32-poky-linux/gst-devtools: PKGV changed from 1.22.4 [default] to 1.22.5 [default]
packages/core2-32-poky-linux/gst-devtools: SRC_URI changed from "https://gstreamer.freedesktop.org/src/gst-devtools/gst-devtools-1.22.4.tar.xz file://0001-connect-has-a-different-signature-on-musl.patch" to "https://gstreamer.freedesktop.org/src/gst-devtools/gst-devtools-1.22.5.tar.xz file://0001-connect-has-a-different-signature-on-musl.patch"
Changes to packages/core2-32-poky-linux/gst-devtools (sysroot):
  /usr/lib/libgstvalidate-1.0.so.0 changed symlink target from libgstvalidate-1.0.so.0.2204.0 to libgstvalidate-1.0.so.0.2205.0
  /usr/lib/libgstvalidate-default-overrides-1.0.so.0 changed symlink target from libgstvalidate-default-overrides-1.0.so.0.2204.0 to libgstvalidate-default-overrides-1.0.so.0.2205.0
  /usr/lib/libgstvalidate-1.0.so.0.2204.0 moved to /usr/lib/libgstvalidate-1.0.so.0.2205.0
  /usr/lib/libgstvalidate-default-overrides-1.0.so.0.2204.0 moved to /usr/lib/libgstvalidate-default-overrides-1.0.so.0.2205.0

--===============2240411258015043938==
Content-Type: application/octet-stream
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: attachment;
 filename="0001-gst-devtools-upgrade-1.22.4-1.22.5.patch"

RnJvbSA3ZDIyMDIxN2UyZmUzNzIyODEzOTBmOWUzOWNhNjdjNjk1ZDI5ZTk5IE1vbiBTZXAgMTcg
MDA6MDA6MDAgMjAwMQpGcm9tOiBVcGdyYWRlIEhlbHBlciA8YXVoQHlvY3RvcHJvamVjdC5vcmc+
CkRhdGU6IFdlZCwgMTYgQXVnIDIwMjMgMTY6NTk6MTggKzAwMDAKU3ViamVjdDogW1BBVENIXSBn
c3QtZGV2dG9vbHM6IHVwZ3JhZGUgMS4yMi40IC0+IDEuMjIuNQoKLS0tCiAuLi4ve2dzdC1kZXZ0
b29sc18xLjIyLjQuYmIgPT4gZ3N0LWRldnRvb2xzXzEuMjIuNS5iYn0gICAgICAgICAgfCAyICst
CiAxIGZpbGUgY2hhbmdlZCwgMSBpbnNlcnRpb24oKyksIDEgZGVsZXRpb24oLSkKIHJlbmFtZSBt
ZXRhL3JlY2lwZXMtbXVsdGltZWRpYS9nc3RyZWFtZXIve2dzdC1kZXZ0b29sc18xLjIyLjQuYmIg
PT4gZ3N0LWRldnRvb2xzXzEuMjIuNS5iYn0gKDk1JSkKCmRpZmYgLS1naXQgYS9tZXRhL3JlY2lw
ZXMtbXVsdGltZWRpYS9nc3RyZWFtZXIvZ3N0LWRldnRvb2xzXzEuMjIuNC5iYiBiL21ldGEvcmVj
aXBlcy1tdWx0aW1lZGlhL2dzdHJlYW1lci9nc3QtZGV2dG9vbHNfMS4yMi41LmJiCnNpbWlsYXJp
dHkgaW5kZXggOTUlCnJlbmFtZSBmcm9tIG1ldGEvcmVjaXBlcy1tdWx0aW1lZGlhL2dzdHJlYW1l
ci9nc3QtZGV2dG9vbHNfMS4yMi40LmJiCnJlbmFtZSB0byBtZXRhL3JlY2lwZXMtbXVsdGltZWRp
YS9nc3RyZWFtZXIvZ3N0LWRldnRvb2xzXzEuMjIuNS5iYgppbmRleCBiZWFmMWE5YjkxLi4zZTAy
OTM5NmE2IDEwMDY0NAotLS0gYS9tZXRhL3JlY2lwZXMtbXVsdGltZWRpYS9nc3RyZWFtZXIvZ3N0
LWRldnRvb2xzXzEuMjIuNC5iYgorKysgYi9tZXRhL3JlY2lwZXMtbXVsdGltZWRpYS9nc3RyZWFt
ZXIvZ3N0LWRldnRvb2xzXzEuMjIuNS5iYgpAQCAtMTIsNyArMTIsNyBAQCBTUkNfVVJJID0gImh0
dHBzOi8vZ3N0cmVhbWVyLmZyZWVkZXNrdG9wLm9yZy9zcmMvZ3N0LWRldnRvb2xzL2dzdC1kZXZ0
b29scy0ke1BWfQogICAgICAgICAgICBmaWxlOi8vMDAwMS1jb25uZWN0LWhhcy1hLWRpZmZlcmVu
dC1zaWduYXR1cmUtb24tbXVzbC5wYXRjaCBcCiAgICAgICAgICAgICIKIAotU1JDX1VSSVtzaGEy
NTZzdW1dID0gIjRjNTIwNTNjZThjMWRmNzJmZDgxNzIxZTlmNTNkZTNiMTQ2ZWRjZjJkZTI4ZjYw
N2JlNzA1YmNlNGNmOTA5ZDEiCitTUkNfVVJJW3NoYTI1NnN1bV0gPSAiMmFkZDE1MTlhYTZlZWIw
MWQ1NDRjYjk0MjkzNjg4ZWUzYmMyMDc5ZjZiY2E2MDc1YmY1YzIzZDAwYTA5MjFiZSIKIAogREVQ
RU5EUyA9ICJqc29uLWdsaWIgZ2xpYi0yLjAgZ2xpYi0yLjAtbmF0aXZlIGdzdHJlYW1lcjEuMCBn
c3RyZWFtZXIxLjAtcGx1Z2lucy1iYXNlIgogUlJFQ09NTUVORFM6JHtQTn0gPSAiZ2l0IgotLSAK
Mi4zOS4yCgo=

--===============2240411258015043938==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment; filename="buildhistory-diff.txt"

packages/core2-32-poky-linux/gst-devtools/gst-devtools: FILELIST: removed "/usr/lib/libgstvalidate-1.0.so.0.2204.0 /usr/lib/libgstvalidate-default-overrides-1.0.so.0.2204.0", added "/usr/lib/libgstvalidate-default-overrides-1.0.so.0.2205.0 /usr/lib/libgstvalidate-1.0.so.0.2205.0"
Changes to packages/core2-32-poky-linux/gst-devtools (sysroot):
  /usr/lib/libgstvalidate-1.0.so.0 changed symlink target from libgstvalidate-1.0.so.0.2204.0 to libgstvalidate-1.0.so.0.2205.0
  /usr/lib/libgstvalidate-default-overrides-1.0.so.0 changed symlink target from libgstvalidate-default-overrides-1.0.so.0.2204.0 to libgstvalidate-default-overrides-1.0.so.0.2205.0
  /usr/lib/libgstvalidate-1.0.so.0.2204.0 moved to /usr/lib/libgstvalidate-1.0.so.0.2205.0
  /usr/lib/libgstvalidate-default-overrides-1.0.so.0.2204.0 moved to /usr/lib/libgstvalidate-default-overrides-1.0.so.0.2205.0

--===============2240411258015043938==--

