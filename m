Return-Path: <auh@yoctoproject.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 4BFD4F428E4
	for <webhook@archiver.kernel.org>; Wed, 15 Apr 2026 14:04:52 +0000 (UTC)
Received: from a27-45.smtp-out.us-west-2.amazonses.com (a27-45.smtp-out.us-west-2.amazonses.com [54.240.27.45])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.19729.1776261867843336968
 for <openembedded-core@lists.openembedded.org>;
 Wed, 15 Apr 2026 07:04:48 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@yoctoproject.org header.s=j46ser6a2yusdzubpv7m7ewqgesde2ie header.b=juojc41E;
 dkim=pass header.i=@amazonses.com header.s=hsbnp7p3ensaochzwyq5wwmceodymuwv header.b=Ns0ypTsf;
 spf=pass (domain: us-west-2.amazonses.com, ip: 54.240.27.45, mailfrom: 0101019d917578ee-10abaa4c-298a-4ff4-ac1d-79315996dd3d-000000@us-west-2.amazonses.com)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=j46ser6a2yusdzubpv7m7ewqgesde2ie; d=yoctoproject.org;
	t=1776261888;
	h=Content-Type:MIME-Version:From:To:Cc:Subject:Message-Id:Date;
	bh=NPN024+DWnqDELRu7J0Ebak8vBE24P9hDGFQqX9wvgo=;
	b=juojc41Ec9eVy9WSsSdSJHc+ho9Xozvfr4oNx7iI3uBoED83DigOP95cn/VBqVHj
	Iu3fnBUiYO3PqinwLjx++pBsbtSKt4O1aaHYpi/IG7GCLtBIReFHb45hbLLmEHqmF+D
	tbwnQbciJ8lXUvxn4yMU/RSvPz2Zua6hEUSoiON4=
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=hsbnp7p3ensaochzwyq5wwmceodymuwv; d=amazonses.com; t=1776261888;
	h=Content-Type:MIME-Version:From:To:Cc:Subject:Message-Id:Date:Feedback-ID;
	bh=NPN024+DWnqDELRu7J0Ebak8vBE24P9hDGFQqX9wvgo=;
	b=Ns0ypTsfiGy3LVnohImd+eABq8csFHwh1H3Z5T2+cuB1fK+nx9QYnbKq4xSsG35J
	DU6cqhfpUmt/fqR21cbRF1JZqVTLduUFupzCjKXslrSh7KdvQqzZBBEvreJ+mDtB2pN
	Dr1oqg48nky0BqgY9/XNFcH0yoiK2UTS4JYTnpBY=
Content-Type: multipart/mixed; boundary="===============5037614618581247817=="
MIME-Version: 1.0
From: auh@yoctoproject.org
To: openembedded-core@lists.openembedded.org
Cc: 
Subject: [AUH] gsettings-desktop-schemas: upgrading to 50.1 SUCCEEDED
Message-ID: <0101019d917578ee-10abaa4c-298a-4ff4-ac1d-79315996dd3d-000000@us-west-2.amazonses.com>
Date: Wed, 15 Apr 2026 14:04:48 +0000
Feedback-ID: ::1.us-west-2.9np3MYPs3fEaOBysGKSlUD4KtcmPijcmS9Az2Hwf7iQ=:AmazonSES
X-SES-Outgoing: 2026.04.15-54.240.27.45
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 15 Apr 2026 14:04:52 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/235268

--===============5037614618581247817==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

Hello,

this email is a notification from the Auto Upgrade Helper
that the automatic attempt to upgrade the recipe(s) *gsettings-desktop-schemas* to *50.1* has Succeeded.

Next steps:
    - apply the patch: git am 0001-gsettings-desktop-schemas-upgrade-50.0-50.1.patch
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
From 1b3af759844d2c40ad9cbbd9fce85394d8466b2a Mon Sep 17 00:00:00 2001
From: Upgrade Helper <auh@yoctoproject.org>
Date: Wed, 15 Apr 2026 11:31:08 +0000
Subject: [PATCH] gsettings-desktop-schemas: upgrade 50.0 -> 50.1

---
 ...esktop-schemas_50.0.bb => gsettings-desktop-schemas_50.1.bb} | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta/recipes-gnome/gsettings-desktop-schemas/{gsettings-desktop-schemas_50.0.bb => gsettings-desktop-schemas_50.1.bb} (84%)

diff --git a/meta/recipes-gnome/gsettings-desktop-schemas/gsettings-desktop-schemas_50.0.bb b/meta/recipes-gnome/gsettings-desktop-schemas/gsettings-desktop-schemas_50.1.bb
similarity index 84%
rename from meta/recipes-gnome/gsettings-desktop-schemas/gsettings-desktop-schemas_50.0.bb
rename to meta/recipes-gnome/gsettings-desktop-schemas/gsettings-desktop-schemas_50.1.bb
index 5fda20c6c3..1edb548ad6 100644
--- a/meta/recipes-gnome/gsettings-desktop-schemas/gsettings-desktop-schemas_50.0.bb
+++ b/meta/recipes-gnome/gsettings-desktop-schemas/gsettings-desktop-schemas_50.1.bb
@@ -11,4 +11,4 @@ DEPENDS = "glib-2.0"
 
 inherit gnomebase gsettings gobject-introspection gettext
 
-SRC_URI[archive.sha256sum] = "358f07cb253727650e132805df3c69f7bf90448040bce171b6f6f2cb1b9c37ef"
+SRC_URI[archive.sha256sum] = "0a2aa25082672585d16fcdab61c7b0e33f035fb87476505c794f29565afa485b"
-- 
2.47.1


--===============5037614618581247817==
Content-Type: application/octet-stream
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: attachment;
 filename="0001-gsettings-desktop-schemas-upgrade-50.0-50.1.patch"

RnJvbSAxYjNhZjc1OTg0NGQyYzQwYWQ5Y2JiZDlmY2U4NTM5NGQ4NDY2YjJhIE1vbiBTZXAgMTcg
MDA6MDA6MDAgMjAwMQpGcm9tOiBVcGdyYWRlIEhlbHBlciA8YXVoQHlvY3RvcHJvamVjdC5vcmc+
CkRhdGU6IFdlZCwgMTUgQXByIDIwMjYgMTE6MzE6MDggKzAwMDAKU3ViamVjdDogW1BBVENIXSBn
c2V0dGluZ3MtZGVza3RvcC1zY2hlbWFzOiB1cGdyYWRlIDUwLjAgLT4gNTAuMQoKLS0tCiAuLi5l
c2t0b3Atc2NoZW1hc181MC4wLmJiID0+IGdzZXR0aW5ncy1kZXNrdG9wLXNjaGVtYXNfNTAuMS5i
Yn0gfCAyICstCiAxIGZpbGUgY2hhbmdlZCwgMSBpbnNlcnRpb24oKyksIDEgZGVsZXRpb24oLSkK
IHJlbmFtZSBtZXRhL3JlY2lwZXMtZ25vbWUvZ3NldHRpbmdzLWRlc2t0b3Atc2NoZW1hcy97Z3Nl
dHRpbmdzLWRlc2t0b3Atc2NoZW1hc181MC4wLmJiID0+IGdzZXR0aW5ncy1kZXNrdG9wLXNjaGVt
YXNfNTAuMS5iYn0gKDg0JSkKCmRpZmYgLS1naXQgYS9tZXRhL3JlY2lwZXMtZ25vbWUvZ3NldHRp
bmdzLWRlc2t0b3Atc2NoZW1hcy9nc2V0dGluZ3MtZGVza3RvcC1zY2hlbWFzXzUwLjAuYmIgYi9t
ZXRhL3JlY2lwZXMtZ25vbWUvZ3NldHRpbmdzLWRlc2t0b3Atc2NoZW1hcy9nc2V0dGluZ3MtZGVz
a3RvcC1zY2hlbWFzXzUwLjEuYmIKc2ltaWxhcml0eSBpbmRleCA4NCUKcmVuYW1lIGZyb20gbWV0
YS9yZWNpcGVzLWdub21lL2dzZXR0aW5ncy1kZXNrdG9wLXNjaGVtYXMvZ3NldHRpbmdzLWRlc2t0
b3Atc2NoZW1hc181MC4wLmJiCnJlbmFtZSB0byBtZXRhL3JlY2lwZXMtZ25vbWUvZ3NldHRpbmdz
LWRlc2t0b3Atc2NoZW1hcy9nc2V0dGluZ3MtZGVza3RvcC1zY2hlbWFzXzUwLjEuYmIKaW5kZXgg
NWZkYTIwYzZjMy4uMWVkYjU0OGFkNiAxMDA2NDQKLS0tIGEvbWV0YS9yZWNpcGVzLWdub21lL2dz
ZXR0aW5ncy1kZXNrdG9wLXNjaGVtYXMvZ3NldHRpbmdzLWRlc2t0b3Atc2NoZW1hc181MC4wLmJi
CisrKyBiL21ldGEvcmVjaXBlcy1nbm9tZS9nc2V0dGluZ3MtZGVza3RvcC1zY2hlbWFzL2dzZXR0
aW5ncy1kZXNrdG9wLXNjaGVtYXNfNTAuMS5iYgpAQCAtMTEsNCArMTEsNCBAQCBERVBFTkRTID0g
ImdsaWItMi4wIgogCiBpbmhlcml0IGdub21lYmFzZSBnc2V0dGluZ3MgZ29iamVjdC1pbnRyb3Nw
ZWN0aW9uIGdldHRleHQKIAotU1JDX1VSSVthcmNoaXZlLnNoYTI1NnN1bV0gPSAiMzU4ZjA3Y2Iy
NTM3Mjc2NTBlMTMyODA1ZGYzYzY5ZjdiZjkwNDQ4MDQwYmNlMTcxYjZmNmYyY2IxYjljMzdlZiIK
K1NSQ19VUklbYXJjaGl2ZS5zaGEyNTZzdW1dID0gIjBhMmFhMjUwODI2NzI1ODVkMTZmY2RhYjYx
YzdiMGUzM2YwMzVmYjg3NDc2NTA1Yzc5NGYyOTU2NWFmYTQ4NWIiCi0tIAoyLjQ3LjEKCg==

--===============5037614618581247817==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment; filename="buildhistory-diff-full.txt"

packages/x86-64-v3-poky-linux/gsettings-desktop-schemas/gsettings-desktop-schemas-dbg: PKGV changed from 50.0 [default] to 50.1 [default]
packages/x86-64-v3-poky-linux/gsettings-desktop-schemas/gsettings-desktop-schemas-dbg: PV changed from "50.0" to "50.1"
packages/x86-64-v3-poky-linux/gsettings-desktop-schemas/gsettings-desktop-schemas-dev: PKGV changed from 50.0 [default] to 50.1 [default]
packages/x86-64-v3-poky-linux/gsettings-desktop-schemas/gsettings-desktop-schemas-dev: PV changed from "50.0" to "50.1"
packages/x86-64-v3-poky-linux/gsettings-desktop-schemas/gsettings-desktop-schemas-doc: PKGV changed from 50.0 [default] to 50.1 [default]
packages/x86-64-v3-poky-linux/gsettings-desktop-schemas/gsettings-desktop-schemas-doc: PV changed from "50.0" to "50.1"
packages/x86-64-v3-poky-linux/gsettings-desktop-schemas/gsettings-desktop-schemas-locale-ab: PKGV changed from 50.0 [default] to 50.1 [default]
packages/x86-64-v3-poky-linux/gsettings-desktop-schemas/gsettings-desktop-schemas-locale-ab: PV changed from "50.0" to "50.1"
packages/x86-64-v3-poky-linux/gsettings-desktop-schemas/gsettings-desktop-schemas-locale-as: PKGV changed from 50.0 [default] to 50.1 [default]
packages/x86-64-v3-poky-linux/gsettings-desktop-schemas/gsettings-desktop-schemas-locale-as: PV changed from "50.0" to "50.1"
packages/x86-64-v3-poky-linux/gsettings-desktop-schemas/gsettings-desktop-schemas-locale-be: PKGV changed from 50.0 [default] to 50.1 [default]
packages/x86-64-v3-poky-linux/gsettings-desktop-schemas/gsettings-desktop-schemas-locale-be: PV changed from "50.0" to "50.1"
packages/x86-64-v3-poky-linux/gsettings-desktop-schemas/gsettings-desktop-schemas-locale-bg: PKGV changed from 50.0 [default] to 50.1 [default]
packages/x86-64-v3-poky-linux/gsettings-desktop-schemas/gsettings-desktop-schemas-locale-bg: PV changed from "50.0" to "50.1"
packages/x86-64-v3-poky-linux/gsettings-desktop-schemas/gsettings-desktop-schemas-locale-bs: PKGV changed from 50.0 [default] to 50.1 [default]
packages/x86-64-v3-poky-linux/gsettings-desktop-schemas/gsettings-desktop-schemas-locale-bs: PV changed from "50.0" to "50.1"
packages/x86-64-v3-poky-linux/gsettings-desktop-schemas/gsettings-desktop-schemas-locale-ca+valencia: PKGV changed from 50.0 [default] to 50.1 [default]
packages/x86-64-v3-poky-linux/gsettings-desktop-schemas/gsettings-desktop-schemas-locale-ca+valencia: PV changed from "50.0" to "50.1"
packages/x86-64-v3-poky-linux/gsettings-desktop-schemas/gsettings-desktop-schemas-locale-ca: PKGV changed from 50.0 [default] to 50.1 [default]
packages/x86-64-v3-poky-linux/gsettings-desktop-schemas/gsettings-desktop-schemas-locale-ca: PV changed from "50.0" to "50.1"
packages/x86-64-v3-poky-linux/gsettings-desktop-schemas/gsettings-desktop-schemas-locale-cs: PKGV changed from 50.0 [default] to 50.1 [default]
packages/x86-64-v3-poky-linux/gsettings-desktop-schemas/gsettings-desktop-schemas-locale-cs: PV changed from "50.0" to "50.1"
packages/x86-64-v3-poky-linux/gsettings-desktop-schemas/gsettings-desktop-schemas-locale-da: PKGV changed from 50.0 [default] to 50.1 [default]
packages/x86-64-v3-poky-linux/gsettings-desktop-schemas/gsettings-desktop-schemas-locale-da: PV changed from "50.0" to "50.1"
packages/x86-64-v3-poky-linux/gsettings-desktop-schemas/gsettings-desktop-schemas-locale-de: PKGV changed from 50.0 [default] to 50.1 [default]
packages/x86-64-v3-poky-linux/gsettings-desktop-schemas/gsettings-desktop-schemas-locale-de: PV changed from "50.0" to "50.1"
packages/x86-64-v3-poky-linux/gsettings-desktop-schemas/gsettings-desktop-schemas-locale-de: PKGSIZE changed from 120603 to 122999 (+2%)
packages/x86-64-v3-poky-linux/gsettings-desktop-schemas/gsettings-desktop-schemas-locale-el: PKGV changed from 50.0 [default] to 50.1 [default]
packages/x86-64-v3-poky-linux/gsettings-desktop-schemas/gsettings-desktop-schemas-locale-el: PV changed from "50.0" to "50.1"
packages/x86-64-v3-poky-linux/gsettings-desktop-schemas/gsettings-desktop-schemas-locale-en-gb: PKGV changed from 50.0 [default] to 50.1 [default]
packages/x86-64-v3-poky-linux/gsettings-desktop-schemas/gsettings-desktop-schemas-locale-en-gb: PV changed from "50.0" to "50.1"
packages/x86-64-v3-poky-linux/gsettings-desktop-schemas/gsettings-desktop-schemas-locale-en-us: PKGV changed from 50.0 [default] to 50.1 [default]
packages/x86-64-v3-poky-linux/gsettings-desktop-schemas/gsettings-desktop-schemas-locale-en-us: PV changed from "50.0" to "50.1"
packages/x86-64-v3-poky-linux/gsettings-desktop-schemas/gsettings-desktop-schemas-locale-eo: PKGV changed from 50.0 [default] to 50.1 [default]
packages/x86-64-v3-poky-linux/gsettings-desktop-schemas/gsettings-desktop-schemas-locale-eo: PV changed from "50.0" to "50.1"
packages/x86-64-v3-poky-linux/gsettings-desktop-schemas/gsettings-desktop-schemas-locale-es: PKGV changed from 50.0 [default] to 50.1 [default]
packages/x86-64-v3-poky-linux/gsettings-desktop-schemas/gsettings-desktop-schemas-locale-es: PV changed from "50.0" to "50.1"
packages/x86-64-v3-poky-linux/gsettings-desktop-schemas/gsettings-desktop-schemas-locale-eu: PKGV changed from 50.0 [default] to 50.1 [default]
packages/x86-64-v3-poky-linux/gsettings-desktop-schemas/gsettings-desktop-schemas-locale-eu: PV changed from "50.0" to "50.1"
packages/x86-64-v3-poky-linux/gsettings-desktop-schemas/gsettings-desktop-schemas-locale-fa: PKGV changed from 50.0 [default] to 50.1 [default]
packages/x86-64-v3-poky-linux/gsettings-desktop-schemas/gsettings-desktop-schemas-locale-fa: PV changed from "50.0" to "50.1"
packages/x86-64-v3-poky-linux/gsettings-desktop-schemas/gsettings-desktop-schemas-locale-fi: PKGV changed from 50.0 [default] to 50.1 [default]
packages/x86-64-v3-poky-linux/gsettings-desktop-schemas/gsettings-desktop-schemas-locale-fi: PV changed from "50.0" to "50.1"
packages/x86-64-v3-poky-linux/gsettings-desktop-schemas/gsettings-desktop-schemas-locale-fr: PKGV changed from 50.0 [default] to 50.1 [default]
packages/x86-64-v3-poky-linux/gsettings-desktop-schemas/gsettings-desktop-schemas-locale-fr: PV changed from "50.0" to "50.1"
packages/x86-64-v3-poky-linux/gsettings-desktop-schemas/gsettings-desktop-schemas-locale-fr: PKGSIZE changed from 130931 to 131004 (+0%)
packages/x86-64-v3-poky-linux/gsettings-desktop-schemas/gsettings-desktop-schemas-locale-fur: PKGV changed from 50.0 [default] to 50.1 [default]
packages/x86-64-v3-poky-linux/gsettings-desktop-schemas/gsettings-desktop-schemas-locale-fur: PV changed from "50.0" to "50.1"
packages/x86-64-v3-poky-linux/gsettings-desktop-schemas/gsettings-desktop-schemas-locale-gl: PKGV changed from 50.0 [default] to 50.1 [default]
packages/x86-64-v3-poky-linux/gsettings-desktop-schemas/gsettings-desktop-schemas-locale-gl: PV changed from "50.0" to "50.1"
packages/x86-64-v3-poky-linux/gsettings-desktop-schemas/gsettings-desktop-schemas-locale-gu: PKGV changed from 50.0 [default] to 50.1 [default]
packages/x86-64-v3-poky-linux/gsettings-desktop-schemas/gsettings-desktop-schemas-locale-gu: PV changed from "50.0" to "50.1"
packages/x86-64-v3-poky-linux/gsettings-desktop-schemas/gsettings-desktop-schemas-locale-he: PKGV changed from 50.0 [default] to 50.1 [default]
packages/x86-64-v3-poky-linux/gsettings-desktop-schemas/gsettings-desktop-schemas-locale-he: PV changed from "50.0" to "50.1"
packages/x86-64-v3-poky-linux/gsettings-desktop-schemas/gsettings-desktop-schemas-locale-hi: PKGV changed from 50.0 [default] to 50.1 [default]
packages/x86-64-v3-poky-linux/gsettings-desktop-schemas/gsettings-desktop-schemas-locale-hi: PV changed from "50.0" to "50.1"
packages/x86-64-v3-poky-linux/gsettings-desktop-schemas/gsettings-desktop-schemas-locale-hr: PKGV changed from 50.0 [default] to 50.1 [default]
packages/x86-64-v3-poky-linux/gsettings-desktop-schemas/gsettings-desktop-schemas-locale-hr: PV changed from "50.0" to "50.1"
packages/x86-64-v3-poky-linux/gsettings-desktop-schemas/gsettings-desktop-schemas-locale-hu: PKGV changed from 50.0 [default] to 50.1 [default]
packages/x86-64-v3-poky-linux/gsettings-desktop-schemas/gsettings-desktop-schemas-locale-hu: PV changed from "50.0" to "50.1"
packages/x86-64-v3-poky-linux/gsettings-desktop-schemas/gsettings-desktop-schemas-locale-id: PKGV changed from 50.0 [default] to 50.1 [default]
packages/x86-64-v3-poky-linux/gsettings-desktop-schemas/gsettings-desktop-schemas-locale-id: PV changed from "50.0" to "50.1"
packages/x86-64-v3-poky-linux/gsettings-desktop-schemas/gsettings-desktop-schemas-locale-is: PKGV changed from 50.0 [default] to 50.1 [default]
packages/x86-64-v3-poky-linux/gsettings-desktop-schemas/gsettings-desktop-schemas-locale-is: PV changed from "50.0" to "50.1"
packages/x86-64-v3-poky-linux/gsettings-desktop-schemas/gsettings-desktop-schemas-locale-it: PKGV changed from 50.0 [default] to 50.1 [default]
packages/x86-64-v3-poky-linux/gsettings-desktop-schemas/gsettings-desktop-schemas-locale-it: PV changed from "50.0" to "50.1"
packages/x86-64-v3-poky-linux/gsettings-desktop-schemas/gsettings-desktop-schemas-locale-ja: PKGV changed from 50.0 [default] to 50.1 [default]
packages/x86-64-v3-poky-linux/gsettings-desktop-schemas/gsettings-desktop-schemas-locale-ja: PV changed from "50.0" to "50.1"
packages/x86-64-v3-poky-linux/gsettings-desktop-schemas/gsettings-desktop-schemas-locale-ka: PKGV changed from 50.0 [default] to 50.1 [default]
packages/x86-64-v3-poky-linux/gsettings-desktop-schemas/gsettings-desktop-schemas-locale-ka: PV changed from "50.0" to "50.1"
packages/x86-64-v3-poky-linux/gsettings-desktop-schemas/gsettings-desktop-schemas-locale-kab: PKGV changed from 50.0 [default] to 50.1 [default]
packages/x86-64-v3-poky-linux/gsettings-desktop-schemas/gsettings-desktop-schemas-locale-kab: PV changed from "50.0" to "50.1"
packages/x86-64-v3-poky-linux/gsettings-desktop-schemas/gsettings-desktop-schemas-locale-kk: PKGV changed from 50.0 [default] to 50.1 [default]
packages/x86-64-v3-poky-linux/gsettings-desktop-schemas/gsettings-desktop-schemas-locale-kk: PV changed from "50.0" to "50.1"
packages/x86-64-v3-poky-linux/gsettings-desktop-schemas/gsettings-desktop-schemas-locale-lt: PKGV changed from 50.0 [default] to 50.1 [default]
packages/x86-64-v3-poky-linux/gsettings-desktop-schemas/gsettings-desktop-schemas-locale-lt: PV changed from "50.0" to "50.1"
packages/x86-64-v3-poky-linux/gsettings-desktop-schemas/gsettings-desktop-schemas-locale-lv: PKGV changed from 50.0 [default] to 50.1 [default]
packages/x86-64-v3-poky-linux/gsettings-desktop-schemas/gsettings-desktop-schemas-locale-lv: PV changed from "50.0" to "50.1"
packages/x86-64-v3-poky-linux/gsettings-desktop-schemas/gsettings-desktop-schemas-locale-ml: PKGV changed from 50.0 [default] to 50.1 [default]
packages/x86-64-v3-poky-linux/gsettings-desktop-schemas/gsettings-desktop-schemas-locale-ml: PV changed from "50.0" to "50.1"
packages/x86-64-v3-poky-linux/gsettings-desktop-schemas/gsettings-desktop-schemas-locale-ms: PKGV changed from 50.0 [default] to 50.1 [default]
packages/x86-64-v3-poky-linux/gsettings-desktop-schemas/gsettings-desktop-schemas-locale-ms: PV changed from "50.0" to "50.1"
packages/x86-64-v3-poky-linux/gsettings-desktop-schemas/gsettings-desktop-schemas-locale-nb: PKGV changed from 50.0 [default] to 50.1 [default]
packages/x86-64-v3-poky-linux/gsettings-desktop-schemas/gsettings-desktop-schemas-locale-nb: PV changed from "50.0" to "50.1"
packages/x86-64-v3-poky-linux/gsettings-desktop-schemas/gsettings-desktop-schemas-locale-ne: PKGV changed from 50.0 [default] to 50.1 [default]
packages/x86-64-v3-poky-linux/gsettings-desktop-schemas/gsettings-desktop-schemas-locale-ne: PV changed from "50.0" to "50.1"
packages/x86-64-v3-poky-linux/gsettings-desktop-schemas/gsettings-desktop-schemas-locale-nl: PKGV changed from 50.0 [default] to 50.1 [default]
packages/x86-64-v3-poky-linux/gsettings-desktop-schemas/gsettings-desktop-schemas-locale-nl: PV changed from "50.0" to "50.1"
packages/x86-64-v3-poky-linux/gsettings-desktop-schemas/gsettings-desktop-schemas-locale-oc: PKGV changed from 50.0 [default] to 50.1 [default]
packages/x86-64-v3-poky-linux/gsettings-desktop-schemas/gsettings-desktop-schemas-locale-oc: PV changed from "50.0" to "50.1"
packages/x86-64-v3-poky-linux/gsettings-desktop-schemas/gsettings-desktop-schemas-locale-or: PKGV changed from 50.0 [default] to 50.1 [default]
packages/x86-64-v3-poky-linux/gsettings-desktop-schemas/gsettings-desktop-schemas-locale-or: PV changed from "50.0" to "50.1"
packages/x86-64-v3-poky-linux/gsettings-desktop-schemas/gsettings-desktop-schemas-locale-pa: PKGV changed from 50.0 [default] to 50.1 [default]
packages/x86-64-v3-poky-linux/gsettings-desktop-schemas/gsettings-desktop-schemas-locale-pa: PV changed from "50.0" to "50.1"
packages/x86-64-v3-poky-linux/gsettings-desktop-schemas/gsettings-desktop-schemas-locale-pl: PKGV changed from 50.0 [default] to 50.1 [default]
packages/x86-64-v3-poky-linux/gsettings-desktop-schemas/gsettings-desktop-schemas-locale-pl: PV changed from "50.0" to "50.1"
packages/x86-64-v3-poky-linux/gsettings-desktop-schemas/gsettings-desktop-schemas-locale-pl: PKGSIZE changed from 124326 to 123593 (-1%)
packages/x86-64-v3-poky-linux/gsettings-desktop-schemas/gsettings-desktop-schemas-locale-pt-br: PKGV changed from 50.0 [default] to 50.1 [default]
packages/x86-64-v3-poky-linux/gsettings-desktop-schemas/gsettings-desktop-schemas-locale-pt-br: PV changed from "50.0" to "50.1"
packages/x86-64-v3-poky-linux/gsettings-desktop-schemas/gsettings-desktop-schemas-locale-pt: PKGV changed from 50.0 [default] to 50.1 [default]
packages/x86-64-v3-poky-linux/gsettings-desktop-schemas/gsettings-desktop-schemas-locale-pt: PV changed from "50.0" to "50.1"
packages/x86-64-v3-poky-linux/gsettings-desktop-schemas/gsettings-desktop-schemas-locale-ro: PKGV changed from 50.0 [default] to 50.1 [default]
packages/x86-64-v3-poky-linux/gsettings-desktop-schemas/gsettings-desktop-schemas-locale-ro: PV changed from "50.0" to "50.1"
packages/x86-64-v3-poky-linux/gsettings-desktop-schemas/gsettings-desktop-schemas-locale-ru: PKGV changed from 50.0 [default] to 50.1 [default]
packages/x86-64-v3-poky-linux/gsettings-desktop-schemas/gsettings-desktop-schemas-locale-ru: PV changed from "50.0" to "50.1"
packages/x86-64-v3-poky-linux/gsettings-desktop-schemas/gsettings-desktop-schemas-locale-sk: PKGV changed from 50.0 [default] to 50.1 [default]
packages/x86-64-v3-poky-linux/gsettings-desktop-schemas/gsettings-desktop-schemas-locale-sk: PV changed from "50.0" to "50.1"
packages/x86-64-v3-poky-linux/gsettings-desktop-schemas/gsettings-desktop-schemas-locale-sl: PKGV changed from 50.0 [default] to 50.1 [default]
packages/x86-64-v3-poky-linux/gsettings-desktop-schemas/gsettings-desktop-schemas-locale-sl: PV changed from "50.0" to "50.1"
packages/x86-64-v3-poky-linux/gsettings-desktop-schemas/gsettings-desktop-schemas-locale-sr+latin: PKGV changed from 50.0 [default] to 50.1 [default]
packages/x86-64-v3-poky-linux/gsettings-desktop-schemas/gsettings-desktop-schemas-locale-sr+latin: PV changed from "50.0" to "50.1"
packages/x86-64-v3-poky-linux/gsettings-desktop-schemas/gsettings-desktop-schemas-locale-sr: PKGV changed from 50.0 [default] to 50.1 [default]
packages/x86-64-v3-poky-linux/gsettings-desktop-schemas/gsettings-desktop-schemas-locale-sr: PV changed from "50.0" to "50.1"
packages/x86-64-v3-poky-linux/gsettings-desktop-schemas/gsettings-desktop-schemas-locale-sr: PKGSIZE changed from 154393 to 156353 (+1%)
packages/x86-64-v3-poky-linux/gsettings-desktop-schemas/gsettings-desktop-schemas-locale-sv: PKGV changed from 50.0 [default] to 50.1 [default]
packages/x86-64-v3-poky-linux/gsettings-desktop-schemas/gsettings-desktop-schemas-locale-sv: PV changed from "50.0" to "50.1"
packages/x86-64-v3-poky-linux/gsettings-desktop-schemas/gsettings-desktop-schemas-locale-tg: PKGV changed from 50.0 [default] to 50.1 [default]
packages/x86-64-v3-poky-linux/gsettings-desktop-schemas/gsettings-desktop-schemas-locale-tg: PV changed from "50.0" to "50.1"
packages/x86-64-v3-poky-linux/gsettings-desktop-schemas/gsettings-desktop-schemas-locale-tr: PKGV changed from 50.0 [default] to 50.1 [default]
packages/x86-64-v3-poky-linux/gsettings-desktop-schemas/gsettings-desktop-schemas-locale-tr: PV changed from "50.0" to "50.1"
packages/x86-64-v3-poky-linux/gsettings-desktop-schemas/gsettings-desktop-schemas-locale-ug: PKGV changed from 50.0 [default] to 50.1 [default]
packages/x86-64-v3-poky-linux/gsettings-desktop-schemas/gsettings-desktop-schemas-locale-ug: PV changed from "50.0" to "50.1"
packages/x86-64-v3-poky-linux/gsettings-desktop-schemas/gsettings-desktop-schemas-locale-uk: PKGV changed from 50.0 [default] to 50.1 [default]
packages/x86-64-v3-poky-linux/gsettings-desktop-schemas/gsettings-desktop-schemas-locale-uk: PV changed from "50.0" to "50.1"
packages/x86-64-v3-poky-linux/gsettings-desktop-schemas/gsettings-desktop-schemas-locale-uz: PKGV changed from 50.0 [default] to 50.1 [default]
packages/x86-64-v3-poky-linux/gsettings-desktop-schemas/gsettings-desktop-schemas-locale-uz: PV changed from "50.0" to "50.1"
packages/x86-64-v3-poky-linux/gsettings-desktop-schemas/gsettings-desktop-schemas-locale-vi: PKGV changed from 50.0 [default] to 50.1 [default]
packages/x86-64-v3-poky-linux/gsettings-desktop-schemas/gsettings-desktop-schemas-locale-vi: PV changed from "50.0" to "50.1"
packages/x86-64-v3-poky-linux/gsettings-desktop-schemas/gsettings-desktop-schemas-locale-zh-cn: PKGV changed from 50.0 [default] to 50.1 [default]
packages/x86-64-v3-poky-linux/gsettings-desktop-schemas/gsettings-desktop-schemas-locale-zh-cn: PV changed from "50.0" to "50.1"
packages/x86-64-v3-poky-linux/gsettings-desktop-schemas/gsettings-desktop-schemas-locale-zh-hk: PKGV changed from 50.0 [default] to 50.1 [default]
packages/x86-64-v3-poky-linux/gsettings-desktop-schemas/gsettings-desktop-schemas-locale-zh-hk: PV changed from "50.0" to "50.1"
packages/x86-64-v3-poky-linux/gsettings-desktop-schemas/gsettings-desktop-schemas-locale-zh-tw: PKGV changed from 50.0 [default] to 50.1 [default]
packages/x86-64-v3-poky-linux/gsettings-desktop-schemas/gsettings-desktop-schemas-locale-zh-tw: PV changed from "50.0" to "50.1"
packages/x86-64-v3-poky-linux/gsettings-desktop-schemas/gsettings-desktop-schemas-src: PKGV changed from 50.0 [default] to 50.1 [default]
packages/x86-64-v3-poky-linux/gsettings-desktop-schemas/gsettings-desktop-schemas-src: PV changed from "50.0" to "50.1"
packages/x86-64-v3-poky-linux/gsettings-desktop-schemas/gsettings-desktop-schemas-staticdev: PKGV changed from 50.0 [default] to 50.1 [default]
packages/x86-64-v3-poky-linux/gsettings-desktop-schemas/gsettings-desktop-schemas-staticdev: PV changed from "50.0" to "50.1"
packages/x86-64-v3-poky-linux/gsettings-desktop-schemas/gsettings-desktop-schemas: PKGV changed from 50.0 [default] to 50.1 [default]
packages/x86-64-v3-poky-linux/gsettings-desktop-schemas/gsettings-desktop-schemas: PV changed from "50.0" to "50.1"
packages/x86-64-v3-poky-linux/gsettings-desktop-schemas: PKGV changed from 50.0 [default] to 50.1 [default]
packages/x86-64-v3-poky-linux/gsettings-desktop-schemas: SRC_URI changed from "https://download.gnome.org/sources//gsettings-desktop-schemas/50/gsettings-desktop-schemas-50.0.tar.xz;name=archive" to "https://download.gnome.org/sources//gsettings-desktop-schemas/50/gsettings-desktop-schemas-50.1.tar.xz;name=archive"
packages/x86-64-v3-poky-linux/gsettings-desktop-schemas: PV changed from "50.0" to "50.1"

--===============5037614618581247817==--

