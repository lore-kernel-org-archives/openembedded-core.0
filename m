Return-Path: <auh@yoctoproject.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 38A5CCED62A
	for <webhook@archiver.kernel.org>; Sat, 15 Nov 2025 16:39:06 +0000 (UTC)
Received: from a27-31.smtp-out.us-west-2.amazonses.com (a27-31.smtp-out.us-west-2.amazonses.com [54.240.27.31])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.11931.1763224714352186146
 for <openembedded-core@lists.openembedded.org>;
 Sat, 15 Nov 2025 08:39:04 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@yoctoproject.org header.s=j46ser6a2yusdzubpv7m7ewqgesde2ie header.b=NxLxa2Fx;
 dkim=pass header.i=@amazonses.com header.s=gdwg2y3kokkkj5a55z2ilkup5wp5hhxx header.b=DsAn3Pin;
 spf=pass (domain: us-west-2.amazonses.com, ip: 54.240.27.31, mailfrom: 0101019a886271a8-c111781b-3500-4102-926e-1b0f72f71af6-000000@us-west-2.amazonses.com)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=j46ser6a2yusdzubpv7m7ewqgesde2ie; d=yoctoproject.org;
	t=1763224744;
	h=Content-Type:MIME-Version:From:To:Cc:Subject:Message-Id:Date;
	bh=XPp4Alebt1WyjK2TdP3gxRF3s4gzhkpg01EARSjCW/k=;
	b=NxLxa2FxEXCGtWQAbloSjjauG3hgLIx/D6X5jP52Mh81C8sMwGUuCPfQ9LvnX21m
	6qef1TD+OMWIw4HPrsPtd6arhhlLOza07o/ocZm4DmPJgpq4WJp39nsooSTkPWtfHEu
	UhBRhTTTl8cMSwq45GrQNNQh4zi0KzkQ0yTIplmM=
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=gdwg2y3kokkkj5a55z2ilkup5wp5hhxx; d=amazonses.com; t=1763224744;
	h=Content-Type:MIME-Version:From:To:Cc:Subject:Message-Id:Date:Feedback-ID;
	bh=XPp4Alebt1WyjK2TdP3gxRF3s4gzhkpg01EARSjCW/k=;
	b=DsAn3Pin+LutTw729iW267bAoRF9Htqc3RQGhTbDGPhKbAC4EAf6IunLJsLFczzm
	nxQQXgMfoFNAH/aLRsuPzd6yMmYA7QDUMVOnvUwgLPUwXGtRuLc9ccCzdCamCvDLj5T
	4EYtyzLzn1InXlgpXAqJUPqN2HKXSo37hcnayRUo=
Content-Type: multipart/mixed; boundary="===============4741968845953860954=="
MIME-Version: 1.0
From: auh@yoctoproject.org
To: openembedded-core@lists.openembedded.org
Cc: 
Subject: [AUH] libnotify: upgrading to 0.8.7 SUCCEEDED
Message-ID: <0101019a886271a8-c111781b-3500-4102-926e-1b0f72f71af6-000000@us-west-2.amazonses.com>
Date: Sat, 15 Nov 2025 16:39:04 +0000
Feedback-ID: ::1.us-west-2.9np3MYPs3fEaOBysGKSlUD4KtcmPijcmS9Az2Hwf7iQ=:AmazonSES
X-SES-Outgoing: 2025.11.15-54.240.27.31
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Sat, 15 Nov 2025 16:39:06 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/226410

--===============4741968845953860954==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

Hello,

this email is a notification from the Auto Upgrade Helper
that the automatic attempt to upgrade the recipe(s) *libnotify* to *0.8.7* has Succeeded.

Next steps:
    - apply the patch: git am 0001-libnotify-upgrade-0.8.6-0.8.7.patch
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
From 1dbdb5a472753bf68e6fb6b19f0cf34fde5308c5 Mon Sep 17 00:00:00 2001
From: Upgrade Helper <auh@yoctoproject.org>
Date: Sat, 15 Nov 2025 13:42:55 +0000
Subject: [PATCH] libnotify: upgrade 0.8.6 -> 0.8.7

---
 .../libnotify/{libnotify_0.8.6.bb => libnotify_0.8.7.bb}        | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta/recipes-gnome/libnotify/{libnotify_0.8.6.bb => libnotify_0.8.7.bb} (93%)

diff --git a/meta/recipes-gnome/libnotify/libnotify_0.8.6.bb b/meta/recipes-gnome/libnotify/libnotify_0.8.7.bb
similarity index 93%
rename from meta/recipes-gnome/libnotify/libnotify_0.8.6.bb
rename to meta/recipes-gnome/libnotify/libnotify_0.8.7.bb
index 6ff7ee4be1..1bea8ae319 100644
--- a/meta/recipes-gnome/libnotify/libnotify_0.8.6.bb
+++ b/meta/recipes-gnome/libnotify/libnotify_0.8.7.bb
@@ -20,7 +20,7 @@ inherit gnomebase gi-docgen features_check gobject-introspection
 # depends on gtk+3 if tests are enabled
 ANY_OF_DISTRO_FEATURES = "${@bb.utils.contains('PACKAGECONFIG', 'tests', '${GTK3DISTROFEATURES}', '', d)}"
 
-SRC_URI[archive.sha256sum] = "c5540aaefb60e1d63b1c587c05f2284ebe72ece7d0c0e5e4a778cfd5844b6b58"
+SRC_URI[archive.sha256sum] = "4be15202ec4184fce1ac15997ece5530d2be32fe9573875aeb10e3b573858748"
 
 EXTRA_OEMESON = "-Dman=false"
 
-- 
2.47.1


--===============4741968845953860954==
Content-Type: application/octet-stream
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: attachment;
 filename="0001-libnotify-upgrade-0.8.6-0.8.7.patch"

RnJvbSAxZGJkYjVhNDcyNzUzYmY2OGU2ZmI2YjE5ZjBjZjM0ZmRlNTMwOGM1IE1vbiBTZXAgMTcg
MDA6MDA6MDAgMjAwMQpGcm9tOiBVcGdyYWRlIEhlbHBlciA8YXVoQHlvY3RvcHJvamVjdC5vcmc+
CkRhdGU6IFNhdCwgMTUgTm92IDIwMjUgMTM6NDI6NTUgKzAwMDAKU3ViamVjdDogW1BBVENIXSBs
aWJub3RpZnk6IHVwZ3JhZGUgMC44LjYgLT4gMC44LjcKCi0tLQogLi4uL2xpYm5vdGlmeS97bGli
bm90aWZ5XzAuOC42LmJiID0+IGxpYm5vdGlmeV8wLjguNy5iYn0gICAgICAgIHwgMiArLQogMSBm
aWxlIGNoYW5nZWQsIDEgaW5zZXJ0aW9uKCspLCAxIGRlbGV0aW9uKC0pCiByZW5hbWUgbWV0YS9y
ZWNpcGVzLWdub21lL2xpYm5vdGlmeS97bGlibm90aWZ5XzAuOC42LmJiID0+IGxpYm5vdGlmeV8w
LjguNy5iYn0gKDkzJSkKCmRpZmYgLS1naXQgYS9tZXRhL3JlY2lwZXMtZ25vbWUvbGlibm90aWZ5
L2xpYm5vdGlmeV8wLjguNi5iYiBiL21ldGEvcmVjaXBlcy1nbm9tZS9saWJub3RpZnkvbGlibm90
aWZ5XzAuOC43LmJiCnNpbWlsYXJpdHkgaW5kZXggOTMlCnJlbmFtZSBmcm9tIG1ldGEvcmVjaXBl
cy1nbm9tZS9saWJub3RpZnkvbGlibm90aWZ5XzAuOC42LmJiCnJlbmFtZSB0byBtZXRhL3JlY2lw
ZXMtZ25vbWUvbGlibm90aWZ5L2xpYm5vdGlmeV8wLjguNy5iYgppbmRleCA2ZmY3ZWU0YmUxLi4x
YmVhOGFlMzE5IDEwMDY0NAotLS0gYS9tZXRhL3JlY2lwZXMtZ25vbWUvbGlibm90aWZ5L2xpYm5v
dGlmeV8wLjguNi5iYgorKysgYi9tZXRhL3JlY2lwZXMtZ25vbWUvbGlibm90aWZ5L2xpYm5vdGlm
eV8wLjguNy5iYgpAQCAtMjAsNyArMjAsNyBAQCBpbmhlcml0IGdub21lYmFzZSBnaS1kb2NnZW4g
ZmVhdHVyZXNfY2hlY2sgZ29iamVjdC1pbnRyb3NwZWN0aW9uCiAjIGRlcGVuZHMgb24gZ3RrKzMg
aWYgdGVzdHMgYXJlIGVuYWJsZWQKIEFOWV9PRl9ESVNUUk9fRkVBVFVSRVMgPSAiJHtAYmIudXRp
bHMuY29udGFpbnMoJ1BBQ0tBR0VDT05GSUcnLCAndGVzdHMnLCAnJHtHVEszRElTVFJPRkVBVFVS
RVN9JywgJycsIGQpfSIKIAotU1JDX1VSSVthcmNoaXZlLnNoYTI1NnN1bV0gPSAiYzU1NDBhYWVm
YjYwZTFkNjNiMWM1ODdjMDVmMjI4NGViZTcyZWNlN2QwYzBlNWU0YTc3OGNmZDU4NDRiNmI1OCIK
K1NSQ19VUklbYXJjaGl2ZS5zaGEyNTZzdW1dID0gIjRiZTE1MjAyZWM0MTg0ZmNlMWFjMTU5OTdl
Y2U1NTMwZDJiZTMyZmU5NTczODc1YWViMTBlM2I1NzM4NTg3NDgiCiAKIEVYVFJBX09FTUVTT04g
PSAiLURtYW49ZmFsc2UiCiAKLS0gCjIuNDcuMQoK

--===============4741968845953860954==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment; filename="buildhistory-diff-full.txt"

packages/x86-64-v3-poky-linux/libnotify: SRC_URI changed from "https://download.gnome.org/sources//libnotify/0.8/libnotify-0.8.6.tar.xz;name=archive" to "https://download.gnome.org/sources//libnotify/0.8/libnotify-0.8.7.tar.xz;name=archive"
packages/x86-64-v3-poky-linux/libnotify: PKGV changed from 0.8.6 [default] to 0.8.7 [default]
packages/x86-64-v3-poky-linux/libnotify: PV changed from "0.8.6" to "0.8.7"
packages/x86-64-v3-poky-linux/libnotify/libnotify-dbg: PKGSIZE changed from 158448 to 170720 (+8%)
packages/x86-64-v3-poky-linux/libnotify/libnotify-dbg: PKGV changed from 0.8.6 [default] to 0.8.7 [default]
packages/x86-64-v3-poky-linux/libnotify/libnotify-dbg: PV changed from "0.8.6" to "0.8.7"
packages/x86-64-v3-poky-linux/libnotify/libnotify-dev: PKGSIZE changed from 70863 to 72549 (+2%)
packages/x86-64-v3-poky-linux/libnotify/libnotify-dev: PKGV changed from 0.8.6 [default] to 0.8.7 [default]
packages/x86-64-v3-poky-linux/libnotify/libnotify-dev: PV changed from "0.8.6" to "0.8.7"
packages/x86-64-v3-poky-linux/libnotify/libnotify-doc: PKGV changed from 0.8.6 [default] to 0.8.7 [default]
packages/x86-64-v3-poky-linux/libnotify/libnotify-doc: PV changed from "0.8.6" to "0.8.7"
packages/x86-64-v3-poky-linux/libnotify/libnotify-locale: PKGV changed from 0.8.6 [default] to 0.8.7 [default]
packages/x86-64-v3-poky-linux/libnotify/libnotify-locale: PV changed from "0.8.6" to "0.8.7"
packages/x86-64-v3-poky-linux/libnotify/libnotify-src: PKGV changed from 0.8.6 [default] to 0.8.7 [default]
packages/x86-64-v3-poky-linux/libnotify/libnotify-src: PV changed from "0.8.6" to "0.8.7"
packages/x86-64-v3-poky-linux/libnotify/libnotify-staticdev: PKGV changed from 0.8.6 [default] to 0.8.7 [default]
packages/x86-64-v3-poky-linux/libnotify/libnotify-staticdev: PV changed from "0.8.6" to "0.8.7"
packages/x86-64-v3-poky-linux/libnotify/libnotify: PKGSIZE changed from 83342 to 83502 (+0%)
packages/x86-64-v3-poky-linux/libnotify/libnotify: PKGV changed from 0.8.6 [default] to 0.8.7 [default]
packages/x86-64-v3-poky-linux/libnotify/libnotify: PV changed from "0.8.6" to "0.8.7"

--===============4741968845953860954==--

