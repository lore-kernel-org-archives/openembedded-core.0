Return-Path: <auh@yoctoproject.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 714E7CDB472
	for <webhook@archiver.kernel.org>; Thu, 11 Jun 2026 16:31:55 +0000 (UTC)
Received: from a27-33.smtp-out.us-west-2.amazonses.com (a27-33.smtp-out.us-west-2.amazonses.com [54.240.27.33])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.50603.1781195495576136043
 for <openembedded-core@lists.openembedded.org>;
 Thu, 11 Jun 2026 09:31:54 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@yoctoproject.org header.s=lvjh2tk576v2ro5mi6k4dt3mc6wpqbky header.b=cNcPpo8Q;
 dkim=pass header.i=@amazonses.com header.s=hsbnp7p3ensaochzwyq5wwmceodymuwv header.b=xKUTjTIp;
 spf=pass (domain: us-west-2.amazonses.com, ip: 54.240.27.33, mailfrom: 0101019eb786a0fa-a73f8f06-a6cd-4263-bd1e-5e274a1c8154-000000@us-west-2.amazonses.com)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=lvjh2tk576v2ro5mi6k4dt3mc6wpqbky; d=yoctoproject.org;
	t=1781195514;
	h=Content-Type:MIME-Version:From:To:Cc:Subject:Message-Id:Date;
	bh=amBRj93okJ65dAH1ZppfuK6jOJ7QA7k70mpKPgeCAEU=;
	b=cNcPpo8QR24LdZU5N9x3BXHsFfEL1TVFfrkXzbrdIDhVnY7bzD5g2vSumehabOEK
	ZlY9N3JXtYCqTwDBr8cvvAWDy/93ZeqvBU2fWodDSZfhyhz4nryrHbHQ2gF8/gJvbI0
	WH7Zfu7C5cgg22BcgwfCC2s3NbPL7xyRiN3tRCos=
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=hsbnp7p3ensaochzwyq5wwmceodymuwv; d=amazonses.com; t=1781195514;
	h=Content-Type:MIME-Version:From:To:Cc:Subject:Message-Id:Date:Feedback-ID;
	bh=amBRj93okJ65dAH1ZppfuK6jOJ7QA7k70mpKPgeCAEU=;
	b=xKUTjTIpyzmLhDy8ACEEQGIe5jZ4WfDhPI3hZgW8MIbLc69/FS/21CliFePXxVbz
	soDdcx18nRDVZ5j9c70jWpTWZoQhJuBnjSYyYfOeN0m8zixjoEivmH1viWcv9MrMI75
	t/Q+BQf+uHQw4BXs2q5g/BnxzYz8mUPDSK5NGVdk=
Content-Type: multipart/mixed; boundary="===============6129507992072152024=="
MIME-Version: 1.0
From: auh@yoctoproject.org
To: 
	=?utf-8?q?Simone_Wei=C3=9F_=3Csimone=2Ep=2Eweiss=40posteo=2Ecom=3E?=@yoctoproject.org
Cc: openembedded-core@lists.openembedded.org
Subject: [AUH] libadwaita: upgrading to 1.9.1 SUCCEEDED
Message-ID: <0101019eb786a0fa-a73f8f06-a6cd-4263-bd1e-5e274a1c8154-000000@us-west-2.amazonses.com>
Date: Thu, 11 Jun 2026 16:31:54 +0000
Feedback-ID: ::1.us-west-2.9np3MYPs3fEaOBysGKSlUD4KtcmPijcmS9Az2Hwf7iQ=:AmazonSES
X-SES-Outgoing: 2026.06.11-54.240.27.33
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 11 Jun 2026 16:31:55 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/238529

--===============6129507992072152024==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

Hello,

this email is a notification from the Auto Upgrade Helper
that the automatic attempt to upgrade the recipe(s) *libadwaita* to *1.9.1* has Succeeded.

Next steps:
    - apply the patch: git am 0001-libadwaita-upgrade-1.9.0-1.9.1.patch
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
From f35d24c9819947bd34a0a1bb74a1ec1e0dd5816f Mon Sep 17 00:00:00 2001
From: Upgrade Helper <auh@yoctoproject.org>
Date: Thu, 11 Jun 2026 11:48:55 +0000
Subject: [PATCH] libadwaita: upgrade 1.9.0 -> 1.9.1

---
 .../libadwaita/{libadwaita_1.9.0.bb => libadwaita_1.9.1.bb}     | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta/recipes-gnome/libadwaita/{libadwaita_1.9.0.bb => libadwaita_1.9.1.bb} (89%)

diff --git a/meta/recipes-gnome/libadwaita/libadwaita_1.9.0.bb b/meta/recipes-gnome/libadwaita/libadwaita_1.9.1.bb
similarity index 89%
rename from meta/recipes-gnome/libadwaita/libadwaita_1.9.0.bb
rename to meta/recipes-gnome/libadwaita/libadwaita_1.9.1.bb
index 6236d075fe..cf4fe6b45f 100644
--- a/meta/recipes-gnome/libadwaita/libadwaita_1.9.0.bb
+++ b/meta/recipes-gnome/libadwaita/libadwaita_1.9.1.bb
@@ -12,7 +12,7 @@ DEPENDS = " \
 
 inherit gnomebase gobject-introspection gi-docgen vala features_check
 
-SRC_URI[archive.sha256sum] = "817837bf06363db5bbfce66085136eff1436af6625dfabff3ca08b87bfca1b6b"
+SRC_URI[archive.sha256sum] = "2ae34dbb3ea56d270925707cefa36050482ec88a741f1810b7619a5377c41a66"
 
 ANY_OF_DISTRO_FEATURES = "${GTK3DISTROFEATURES}"
 REQUIRED_DISTRO_FEATURES = "opengl"
-- 
2.47.1


--===============6129507992072152024==
Content-Type: application/octet-stream
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: attachment;
 filename="0001-libadwaita-upgrade-1.9.0-1.9.1.patch"

RnJvbSBmMzVkMjRjOTgxOTk0N2JkMzRhMGExYmI3NGExZWMxZTBkZDU4MTZmIE1vbiBTZXAgMTcg
MDA6MDA6MDAgMjAwMQpGcm9tOiBVcGdyYWRlIEhlbHBlciA8YXVoQHlvY3RvcHJvamVjdC5vcmc+
CkRhdGU6IFRodSwgMTEgSnVuIDIwMjYgMTE6NDg6NTUgKzAwMDAKU3ViamVjdDogW1BBVENIXSBs
aWJhZHdhaXRhOiB1cGdyYWRlIDEuOS4wIC0+IDEuOS4xCgotLS0KIC4uLi9saWJhZHdhaXRhL3ts
aWJhZHdhaXRhXzEuOS4wLmJiID0+IGxpYmFkd2FpdGFfMS45LjEuYmJ9ICAgICB8IDIgKy0KIDEg
ZmlsZSBjaGFuZ2VkLCAxIGluc2VydGlvbigrKSwgMSBkZWxldGlvbigtKQogcmVuYW1lIG1ldGEv
cmVjaXBlcy1nbm9tZS9saWJhZHdhaXRhL3tsaWJhZHdhaXRhXzEuOS4wLmJiID0+IGxpYmFkd2Fp
dGFfMS45LjEuYmJ9ICg4OSUpCgpkaWZmIC0tZ2l0IGEvbWV0YS9yZWNpcGVzLWdub21lL2xpYmFk
d2FpdGEvbGliYWR3YWl0YV8xLjkuMC5iYiBiL21ldGEvcmVjaXBlcy1nbm9tZS9saWJhZHdhaXRh
L2xpYmFkd2FpdGFfMS45LjEuYmIKc2ltaWxhcml0eSBpbmRleCA4OSUKcmVuYW1lIGZyb20gbWV0
YS9yZWNpcGVzLWdub21lL2xpYmFkd2FpdGEvbGliYWR3YWl0YV8xLjkuMC5iYgpyZW5hbWUgdG8g
bWV0YS9yZWNpcGVzLWdub21lL2xpYmFkd2FpdGEvbGliYWR3YWl0YV8xLjkuMS5iYgppbmRleCA2
MjM2ZDA3NWZlLi5jZjRmZTZiNDVmIDEwMDY0NAotLS0gYS9tZXRhL3JlY2lwZXMtZ25vbWUvbGli
YWR3YWl0YS9saWJhZHdhaXRhXzEuOS4wLmJiCisrKyBiL21ldGEvcmVjaXBlcy1nbm9tZS9saWJh
ZHdhaXRhL2xpYmFkd2FpdGFfMS45LjEuYmIKQEAgLTEyLDcgKzEyLDcgQEAgREVQRU5EUyA9ICIg
XAogCiBpbmhlcml0IGdub21lYmFzZSBnb2JqZWN0LWludHJvc3BlY3Rpb24gZ2ktZG9jZ2VuIHZh
bGEgZmVhdHVyZXNfY2hlY2sKIAotU1JDX1VSSVthcmNoaXZlLnNoYTI1NnN1bV0gPSAiODE3ODM3
YmYwNjM2M2RiNWJiZmNlNjYwODUxMzZlZmYxNDM2YWY2NjI1ZGZhYmZmM2NhMDhiODdiZmNhMWI2
YiIKK1NSQ19VUklbYXJjaGl2ZS5zaGEyNTZzdW1dID0gIjJhZTM0ZGJiM2VhNTZkMjcwOTI1NzA3
Y2VmYTM2MDUwNDgyZWM4OGE3NDFmMTgxMGI3NjE5YTUzNzdjNDFhNjYiCiAKIEFOWV9PRl9ESVNU
Uk9fRkVBVFVSRVMgPSAiJHtHVEszRElTVFJPRkVBVFVSRVN9IgogUkVRVUlSRURfRElTVFJPX0ZF
QVRVUkVTID0gIm9wZW5nbCIKLS0gCjIuNDcuMQoK

--===============6129507992072152024==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment; filename="buildhistory-diff-full.txt"

packages/x86-64-v3-poky-linux/libadwaita: PV changed from "1.9.0" to "1.9.1"
packages/x86-64-v3-poky-linux/libadwaita: SRC_URI changed from "https://download.gnome.org/sources//libadwaita/1.9/libadwaita-1.9.0.tar.xz;name=archive" to "https://download.gnome.org/sources//libadwaita/1.9/libadwaita-1.9.1.tar.xz;name=archive"
packages/x86-64-v3-poky-linux/libadwaita: PKGV changed from 1.9.0 [default] to 1.9.1 [default]
packages/x86-64-v3-poky-linux/libadwaita/libadwaita-dbg: PV changed from "1.9.0" to "1.9.1"
packages/x86-64-v3-poky-linux/libadwaita/libadwaita-dbg: PKGV changed from 1.9.0 [default] to 1.9.1 [default]
packages/x86-64-v3-poky-linux/libadwaita/libadwaita-dbg: PKGSIZE changed from 6407952 to 6410640 (+0%)
packages/x86-64-v3-poky-linux/libadwaita/libadwaita-dev: PV changed from "1.9.0" to "1.9.1"
packages/x86-64-v3-poky-linux/libadwaita/libadwaita-dev: PKGV changed from 1.9.0 [default] to 1.9.1 [default]
packages/x86-64-v3-poky-linux/libadwaita/libadwaita-dev: PKGSIZE changed from 2697195 to 2697223 (+0%)
packages/x86-64-v3-poky-linux/libadwaita/libadwaita-doc: PV changed from "1.9.0" to "1.9.1"
packages/x86-64-v3-poky-linux/libadwaita/libadwaita-doc: PKGV changed from 1.9.0 [default] to 1.9.1 [default]
packages/x86-64-v3-poky-linux/libadwaita/libadwaita-locale-ab: PV changed from "1.9.0" to "1.9.1"
packages/x86-64-v3-poky-linux/libadwaita/libadwaita-locale-ab: PKGV changed from 1.9.0 [default] to 1.9.1 [default]
packages/x86-64-v3-poky-linux/libadwaita/libadwaita-locale-be: PV changed from "1.9.0" to "1.9.1"
packages/x86-64-v3-poky-linux/libadwaita/libadwaita-locale-be: PKGV changed from 1.9.0 [default] to 1.9.1 [default]
packages/x86-64-v3-poky-linux/libadwaita/libadwaita-locale-be: PKGSIZE changed from 12410 to 12904 (+4%)
packages/x86-64-v3-poky-linux/libadwaita/libadwaita-locale-bg: PV changed from "1.9.0" to "1.9.1"
packages/x86-64-v3-poky-linux/libadwaita/libadwaita-locale-bg: PKGV changed from 1.9.0 [default] to 1.9.1 [default]
packages/x86-64-v3-poky-linux/libadwaita/libadwaita-locale-ca: PV changed from "1.9.0" to "1.9.1"
packages/x86-64-v3-poky-linux/libadwaita/libadwaita-locale-ca: PKGV changed from 1.9.0 [default] to 1.9.1 [default]
packages/x86-64-v3-poky-linux/libadwaita/libadwaita-locale-cs: PV changed from "1.9.0" to "1.9.1"
packages/x86-64-v3-poky-linux/libadwaita/libadwaita-locale-cs: PKGV changed from 1.9.0 [default] to 1.9.1 [default]
packages/x86-64-v3-poky-linux/libadwaita/libadwaita-locale-cs: PKGSIZE changed from 10184 to 10181 (-0%)
packages/x86-64-v3-poky-linux/libadwaita/libadwaita-locale-da: PV changed from "1.9.0" to "1.9.1"
packages/x86-64-v3-poky-linux/libadwaita/libadwaita-locale-da: PKGV changed from 1.9.0 [default] to 1.9.1 [default]
packages/x86-64-v3-poky-linux/libadwaita/libadwaita-locale-de: PV changed from "1.9.0" to "1.9.1"
packages/x86-64-v3-poky-linux/libadwaita/libadwaita-locale-de: PKGV changed from 1.9.0 [default] to 1.9.1 [default]
packages/x86-64-v3-poky-linux/libadwaita/libadwaita-locale-de: PKGSIZE changed from 9513 to 10357 (+9%)
packages/x86-64-v3-poky-linux/libadwaita/libadwaita-locale-el: PV changed from "1.9.0" to "1.9.1"
packages/x86-64-v3-poky-linux/libadwaita/libadwaita-locale-el: PKGV changed from 1.9.0 [default] to 1.9.1 [default]
packages/x86-64-v3-poky-linux/libadwaita/libadwaita-locale-en-gb: PV changed from "1.9.0" to "1.9.1"
packages/x86-64-v3-poky-linux/libadwaita/libadwaita-locale-en-gb: PKGV changed from 1.9.0 [default] to 1.9.1 [default]
packages/x86-64-v3-poky-linux/libadwaita/libadwaita-locale-eo: PV changed from "1.9.0" to "1.9.1"
packages/x86-64-v3-poky-linux/libadwaita/libadwaita-locale-eo: PKGV changed from 1.9.0 [default] to 1.9.1 [default]
packages/x86-64-v3-poky-linux/libadwaita/libadwaita-locale-es: PV changed from "1.9.0" to "1.9.1"
packages/x86-64-v3-poky-linux/libadwaita/libadwaita-locale-es: PKGV changed from 1.9.0 [default] to 1.9.1 [default]
packages/x86-64-v3-poky-linux/libadwaita/libadwaita-locale-eu: PV changed from "1.9.0" to "1.9.1"
packages/x86-64-v3-poky-linux/libadwaita/libadwaita-locale-eu: PKGV changed from 1.9.0 [default] to 1.9.1 [default]
packages/x86-64-v3-poky-linux/libadwaita/libadwaita-locale-fa: PV changed from "1.9.0" to "1.9.1"
packages/x86-64-v3-poky-linux/libadwaita/libadwaita-locale-fa: PKGV changed from 1.9.0 [default] to 1.9.1 [default]
packages/x86-64-v3-poky-linux/libadwaita/libadwaita-locale-fa: PKGSIZE changed from 11529 to 11998 (+4%)
packages/x86-64-v3-poky-linux/libadwaita/libadwaita-locale-fi: PV changed from "1.9.0" to "1.9.1"
packages/x86-64-v3-poky-linux/libadwaita/libadwaita-locale-fi: PKGV changed from 1.9.0 [default] to 1.9.1 [default]
packages/x86-64-v3-poky-linux/libadwaita/libadwaita-locale-fil: PV changed from "1.9.0" to "1.9.1"
packages/x86-64-v3-poky-linux/libadwaita/libadwaita-locale-fil: PKGV changed from 1.9.0 [default] to 1.9.1 [default]
packages/x86-64-v3-poky-linux/libadwaita/libadwaita-locale-fr: PV changed from "1.9.0" to "1.9.1"
packages/x86-64-v3-poky-linux/libadwaita/libadwaita-locale-fr: PKGV changed from 1.9.0 [default] to 1.9.1 [default]
packages/x86-64-v3-poky-linux/libadwaita/libadwaita-locale-fur: PV changed from "1.9.0" to "1.9.1"
packages/x86-64-v3-poky-linux/libadwaita/libadwaita-locale-fur: PKGV changed from 1.9.0 [default] to 1.9.1 [default]
packages/x86-64-v3-poky-linux/libadwaita/libadwaita-locale-gl: PV changed from "1.9.0" to "1.9.1"
packages/x86-64-v3-poky-linux/libadwaita/libadwaita-locale-gl: PKGV changed from 1.9.0 [default] to 1.9.1 [default]
packages/x86-64-v3-poky-linux/libadwaita/libadwaita-locale-he: PV changed from "1.9.0" to "1.9.1"
packages/x86-64-v3-poky-linux/libadwaita/libadwaita-locale-he: PKGV changed from 1.9.0 [default] to 1.9.1 [default]
packages/x86-64-v3-poky-linux/libadwaita/libadwaita-locale-hi: PV changed from "1.9.0" to "1.9.1"
packages/x86-64-v3-poky-linux/libadwaita/libadwaita-locale-hi: PKGV changed from 1.9.0 [default] to 1.9.1 [default]
packages/x86-64-v3-poky-linux/libadwaita/libadwaita-locale-hr: PV changed from "1.9.0" to "1.9.1"
packages/x86-64-v3-poky-linux/libadwaita/libadwaita-locale-hr: PKGV changed from 1.9.0 [default] to 1.9.1 [default]
packages/x86-64-v3-poky-linux/libadwaita/libadwaita-locale-hu: PV changed from "1.9.0" to "1.9.1"
packages/x86-64-v3-poky-linux/libadwaita/libadwaita-locale-hu: PKGV changed from 1.9.0 [default] to 1.9.1 [default]
packages/x86-64-v3-poky-linux/libadwaita/libadwaita-locale-ia: PV changed from "1.9.0" to "1.9.1"
packages/x86-64-v3-poky-linux/libadwaita/libadwaita-locale-ia: PKGV changed from 1.9.0 [default] to 1.9.1 [default]
packages/x86-64-v3-poky-linux/libadwaita/libadwaita-locale-id: PV changed from "1.9.0" to "1.9.1"
packages/x86-64-v3-poky-linux/libadwaita/libadwaita-locale-id: PKGV changed from 1.9.0 [default] to 1.9.1 [default]
packages/x86-64-v3-poky-linux/libadwaita/libadwaita-locale-it: PV changed from "1.9.0" to "1.9.1"
packages/x86-64-v3-poky-linux/libadwaita/libadwaita-locale-it: PKGV changed from 1.9.0 [default] to 1.9.1 [default]
packages/x86-64-v3-poky-linux/libadwaita/libadwaita-locale-ja: PV changed from "1.9.0" to "1.9.1"
packages/x86-64-v3-poky-linux/libadwaita/libadwaita-locale-ja: PKGV changed from 1.9.0 [default] to 1.9.1 [default]
packages/x86-64-v3-poky-linux/libadwaita/libadwaita-locale-ka: PV changed from "1.9.0" to "1.9.1"
packages/x86-64-v3-poky-linux/libadwaita/libadwaita-locale-ka: PKGV changed from 1.9.0 [default] to 1.9.1 [default]
packages/x86-64-v3-poky-linux/libadwaita/libadwaita-locale-kab: PV changed from "1.9.0" to "1.9.1"
packages/x86-64-v3-poky-linux/libadwaita/libadwaita-locale-kab: PKGV changed from 1.9.0 [default] to 1.9.1 [default]
packages/x86-64-v3-poky-linux/libadwaita/libadwaita-locale-kk: PV changed from "1.9.0" to "1.9.1"
packages/x86-64-v3-poky-linux/libadwaita/libadwaita-locale-kk: PKGV changed from 1.9.0 [default] to 1.9.1 [default]
packages/x86-64-v3-poky-linux/libadwaita/libadwaita-locale-ko: PV changed from "1.9.0" to "1.9.1"
packages/x86-64-v3-poky-linux/libadwaita/libadwaita-locale-ko: PKGV changed from 1.9.0 [default] to 1.9.1 [default]
packages/x86-64-v3-poky-linux/libadwaita/libadwaita-locale-lt: PV changed from "1.9.0" to "1.9.1"
packages/x86-64-v3-poky-linux/libadwaita/libadwaita-locale-lt: PKGV changed from 1.9.0 [default] to 1.9.1 [default]
packages/x86-64-v3-poky-linux/libadwaita/libadwaita-locale-lv: PV changed from "1.9.0" to "1.9.1"
packages/x86-64-v3-poky-linux/libadwaita/libadwaita-locale-lv: PKGV changed from 1.9.0 [default] to 1.9.1 [default]
packages/x86-64-v3-poky-linux/libadwaita/libadwaita-locale-nb: PV changed from "1.9.0" to "1.9.1"
packages/x86-64-v3-poky-linux/libadwaita/libadwaita-locale-nb: PKGV changed from 1.9.0 [default] to 1.9.1 [default]
packages/x86-64-v3-poky-linux/libadwaita/libadwaita-locale-nb: PKGSIZE changed from 8900 to 9452 (+6%)
packages/x86-64-v3-poky-linux/libadwaita/libadwaita-locale-ne: PV changed from "1.9.0" to "1.9.1"
packages/x86-64-v3-poky-linux/libadwaita/libadwaita-locale-ne: PKGV changed from 1.9.0 [default] to 1.9.1 [default]
packages/x86-64-v3-poky-linux/libadwaita/libadwaita-locale-nl: PV changed from "1.9.0" to "1.9.1"
packages/x86-64-v3-poky-linux/libadwaita/libadwaita-locale-nl: PKGV changed from 1.9.0 [default] to 1.9.1 [default]
packages/x86-64-v3-poky-linux/libadwaita/libadwaita-locale-nl: PKGSIZE changed from 9835 to 10231 (+4%)
packages/x86-64-v3-poky-linux/libadwaita/libadwaita-locale-nn: PV changed from "1.9.0" to "1.9.1"
packages/x86-64-v3-poky-linux/libadwaita/libadwaita-locale-nn: PKGV changed from 1.9.0 [default] to 1.9.1 [default]
packages/x86-64-v3-poky-linux/libadwaita/libadwaita-locale-oc: PV changed from "1.9.0" to "1.9.1"
packages/x86-64-v3-poky-linux/libadwaita/libadwaita-locale-oc: PKGV changed from 1.9.0 [default] to 1.9.1 [default]
packages/x86-64-v3-poky-linux/libadwaita/libadwaita-locale-pa: PV changed from "1.9.0" to "1.9.1"
packages/x86-64-v3-poky-linux/libadwaita/libadwaita-locale-pa: PKGV changed from 1.9.0 [default] to 1.9.1 [default]
packages/x86-64-v3-poky-linux/libadwaita/libadwaita-locale-pl: PV changed from "1.9.0" to "1.9.1"
packages/x86-64-v3-poky-linux/libadwaita/libadwaita-locale-pl: PKGV changed from 1.9.0 [default] to 1.9.1 [default]
packages/x86-64-v3-poky-linux/libadwaita/libadwaita-locale-pt-br: PV changed from "1.9.0" to "1.9.1"
packages/x86-64-v3-poky-linux/libadwaita/libadwaita-locale-pt-br: PKGV changed from 1.9.0 [default] to 1.9.1 [default]
packages/x86-64-v3-poky-linux/libadwaita/libadwaita-locale-pt: PV changed from "1.9.0" to "1.9.1"
packages/x86-64-v3-poky-linux/libadwaita/libadwaita-locale-pt: PKGV changed from 1.9.0 [default] to 1.9.1 [default]
packages/x86-64-v3-poky-linux/libadwaita/libadwaita-locale-ro: PV changed from "1.9.0" to "1.9.1"
packages/x86-64-v3-poky-linux/libadwaita/libadwaita-locale-ro: PKGV changed from 1.9.0 [default] to 1.9.1 [default]
packages/x86-64-v3-poky-linux/libadwaita/libadwaita-locale-ru: PV changed from "1.9.0" to "1.9.1"
packages/x86-64-v3-poky-linux/libadwaita/libadwaita-locale-ru: PKGV changed from 1.9.0 [default] to 1.9.1 [default]
packages/x86-64-v3-poky-linux/libadwaita/libadwaita-locale-sk: PV changed from "1.9.0" to "1.9.1"
packages/x86-64-v3-poky-linux/libadwaita/libadwaita-locale-sk: PKGV changed from 1.9.0 [default] to 1.9.1 [default]
packages/x86-64-v3-poky-linux/libadwaita/libadwaita-locale-sk: PKGSIZE changed from 6843 to 10861 (+59%)
packages/x86-64-v3-poky-linux/libadwaita/libadwaita-locale-sl: PV changed from "1.9.0" to "1.9.1"
packages/x86-64-v3-poky-linux/libadwaita/libadwaita-locale-sl: PKGV changed from 1.9.0 [default] to 1.9.1 [default]
packages/x86-64-v3-poky-linux/libadwaita/libadwaita-locale-sr+latin: PV changed from "1.9.0" to "1.9.1"
packages/x86-64-v3-poky-linux/libadwaita/libadwaita-locale-sr+latin: PKGV changed from 1.9.0 [default] to 1.9.1 [default]
packages/x86-64-v3-poky-linux/libadwaita/libadwaita-locale-sr: PV changed from "1.9.0" to "1.9.1"
packages/x86-64-v3-poky-linux/libadwaita/libadwaita-locale-sr: PKGV changed from 1.9.0 [default] to 1.9.1 [default]
packages/x86-64-v3-poky-linux/libadwaita/libadwaita-locale-sr: PKGSIZE changed from 11584 to 12529 (+8%)
packages/x86-64-v3-poky-linux/libadwaita/libadwaita-locale-sv: PV changed from "1.9.0" to "1.9.1"
packages/x86-64-v3-poky-linux/libadwaita/libadwaita-locale-sv: PKGV changed from 1.9.0 [default] to 1.9.1 [default]
packages/x86-64-v3-poky-linux/libadwaita/libadwaita-locale-th: PV changed from "1.9.0" to "1.9.1"
packages/x86-64-v3-poky-linux/libadwaita/libadwaita-locale-th: PKGV changed from 1.9.0 [default] to 1.9.1 [default]
packages/x86-64-v3-poky-linux/libadwaita/libadwaita-locale-tr: PV changed from "1.9.0" to "1.9.1"
packages/x86-64-v3-poky-linux/libadwaita/libadwaita-locale-tr: PKGV changed from 1.9.0 [default] to 1.9.1 [default]
packages/x86-64-v3-poky-linux/libadwaita/libadwaita-locale-ug: PV changed from "1.9.0" to "1.9.1"
packages/x86-64-v3-poky-linux/libadwaita/libadwaita-locale-ug: PKGV changed from 1.9.0 [default] to 1.9.1 [default]
packages/x86-64-v3-poky-linux/libadwaita/libadwaita-locale-uk: PV changed from "1.9.0" to "1.9.1"
packages/x86-64-v3-poky-linux/libadwaita/libadwaita-locale-uk: PKGV changed from 1.9.0 [default] to 1.9.1 [default]
packages/x86-64-v3-poky-linux/libadwaita/libadwaita-locale-uz: PV changed from "1.9.0" to "1.9.1"
packages/x86-64-v3-poky-linux/libadwaita/libadwaita-locale-uz: PKGV changed from 1.9.0 [default] to 1.9.1 [default]
packages/x86-64-v3-poky-linux/libadwaita/libadwaita-locale-vi: PV changed from "1.9.0" to "1.9.1"
packages/x86-64-v3-poky-linux/libadwaita/libadwaita-locale-vi: PKGV changed from 1.9.0 [default] to 1.9.1 [default]
packages/x86-64-v3-poky-linux/libadwaita/libadwaita-locale-zh-cn: PV changed from "1.9.0" to "1.9.1"
packages/x86-64-v3-poky-linux/libadwaita/libadwaita-locale-zh-cn: PKGV changed from 1.9.0 [default] to 1.9.1 [default]
packages/x86-64-v3-poky-linux/libadwaita/libadwaita-locale-zh-tw: PV changed from "1.9.0" to "1.9.1"
packages/x86-64-v3-poky-linux/libadwaita/libadwaita-locale-zh-tw: PKGV changed from 1.9.0 [default] to 1.9.1 [default]
packages/x86-64-v3-poky-linux/libadwaita/libadwaita-src: PV changed from "1.9.0" to "1.9.1"
packages/x86-64-v3-poky-linux/libadwaita/libadwaita-src: FILELIST: directory renamed /usr/src/debug/libadwaita/1.9.0/src/stylesheet -> /usr/src/debug/libadwaita/1.9.1/src/stylesheet, directory renamed /usr/src/debug/libadwaita/1.9.0/src -> /usr/src/debug/libadwaita/1.9.1/src
packages/x86-64-v3-poky-linux/libadwaita/libadwaita-src: PKGV changed from 1.9.0 [default] to 1.9.1 [default]
packages/x86-64-v3-poky-linux/libadwaita/libadwaita-src: PKGSIZE changed from 7811228 to 7813255 (+0%)
packages/x86-64-v3-poky-linux/libadwaita/libadwaita-staticdev: PV changed from "1.9.0" to "1.9.1"
packages/x86-64-v3-poky-linux/libadwaita/libadwaita-staticdev: PKGV changed from 1.9.0 [default] to 1.9.1 [default]
packages/x86-64-v3-poky-linux/libadwaita/libadwaita: PV changed from "1.9.0" to "1.9.1"
packages/x86-64-v3-poky-linux/libadwaita/libadwaita: PKGV changed from 1.9.0 [default] to 1.9.1 [default]
packages/x86-64-v3-poky-linux/libadwaita/libadwaita: PKGSIZE changed from 2266164 to 2270260 (+0%)

--===============6129507992072152024==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment; filename="bitbake-output-qemuarm_musl.txt"

NOTE: Reconnecting to bitbake server...
Loading cache...done.
Loaded 0 entries from dependency cache.
Parsing recipes...done.
Parsing of 951 .bb files complete (0 cached, 951 parsed). 1980 targets, 62 skipped, 0 masked, 0 errors.
NOTE: Resolving any missing task queue dependencies

Build Configuration:
BB_VERSION           = "2.19.0"
BUILD_SYS            = "x86_64-linux"
NATIVELSBSTRING      = "universal"
TARGET_SYS           = "arm-poky-linux-musleabi"
MACHINE              = "qemuarm"
SDKMACHINE           = "x86_64"
DISTRO               = "poky"
DISTRO_VERSION       = "6.0.99+snapshot-7f5b2ff913ed04ad3baf56004c4a177b2f7ffc59"
TUNE_FEATURES        = "arm vfp cortexa15 neon thumb callconvention-hard"
meta                 = "tmp-auh-upgrades:7f5b2ff913ed04ad3baf56004c4a177b2f7ffc59"
meta-yocto-bsp       
meta-poky            = "master:59c41245ad231f5320defcb275477e3d25a2203e"
workspace            = "<unknown>:<unknown>"

Initialising tasks...NOTE: The /proc/pressure files can't be read. Continuing build without monitoring pressure
Sstate summary: Wanted 1067 Local 823 Mirrors 0 Missed 244 Current 507 (77% match, 84% complete)
done.
Removing 2 stale sstate objects for arch allarch...done.
NOTE: Executing Tasks
NOTE: Running setscene task 591 of 1574 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-gnome/libadwaita/libadwaita_1.9.1.bb:do_populate_lic_setscene)
NOTE: Running setscene task 650 of 1574 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-multimedia/libtiff/tiff_4.7.1.bb:do_create_spdx_setscene)
NOTE: Running setscene task 682 of 1574 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/curl/curl_8.20.0.bb:do_create_spdx_setscene)
NOTE: Running setscene task 689 of 1574 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-multimedia/sbc/sbc_2.2.bb:do_create_recipe_spdx_setscene)
NOTE: Running setscene task 690 of 1574 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/libusb/libusb1_1.0.29.bb:do_create_spdx_setscene)
NOTE: Running setscene task 694 of 1574 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-multimedia/webp/libwebp_1.6.0.bb:do_create_recipe_spdx_setscene)
NOTE: Running setscene task 713 of 1574 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/wayland/wayland-protocols_1.48.bb:do_create_spdx_setscene)
NOTE: Running setscene task 714 of 1574 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/rust/libstd-rs_1.96.0.bb:do_create_spdx_setscene)
NOTE: Running setscene task 717 of 1574 (virtual:native:/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/cargo-c/cargo-c_0.10.22+cargo-0.96.0.bb:do_create_spdx_setscene)
NOTE: Running setscene task 720 of 1574 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/xorg-lib/libxshmfence_1.3.3.bb:do_create_spdx_setscene)
NOTE: Running setscene task 721 of 1574 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/drm/libdrm_2.4.133.bb:do_create_spdx_setscene)
NOTE: Running setscene task 726 of 1574 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-core/dbus/dbus_1.16.2.bb:do_create_spdx_setscene)
NOTE: Running setscene task 731 of 1574 (virtual:native:/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/python/python3-docutils_0.22.4.bb:do_create_recipe_spdx_setscene)
NOTE: Running setscene task 733 of 1574 (virtual:native:/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/libical/libical_3.0.20.bb:do_create_spdx_setscene)
NOTE: Running setscene task 735 of 1574 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/iso-codes/iso-codes_4.20.1.bb:do_create_spdx_setscene)
NOTE: Running setscene task 739 of 1574 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/vulkan/vulkan-loader_1.4.341.0.bb:do_create_spdx_setscene)
NOTE: recipe tiff-4.7.1-r0: task do_create_spdx_setscene: Started
NOTE: recipe sbc-2.2-r0: task do_create_recipe_spdx_setscene: Started
NOTE: recipe wayland-protocols-1.48-r0: task do_create_spdx_setscene: Started
NOTE: recipe libadwaita-1.9.1-r0: task do_populate_lic_setscene: Started
NOTE: recipe libwebp-1.6.0-r0: task do_create_recipe_spdx_setscene: Started
NOTE: recipe libusb1-1.0.29-r0: task do_create_spdx_setscene: Started
NOTE: recipe curl-8.20.0-r0: task do_create_spdx_setscene: Started
NOTE: recipe libxshmfence-1.3.3-r0: task do_create_spdx_setscene: Started
NOTE: recipe iso-codes-4.20.1-r0: task do_create_spdx_setscene: Started
NOTE: recipe libstd-rs-1.96.0-r0: task do_create_spdx_setscene: Started
NOTE: recipe libdrm-2.4.133-r0: task do_create_spdx_setscene: Started
NOTE: recipe vulkan-loader-1.4.341.0-r0: task do_create_spdx_setscene: Started
NOTE: recipe dbus-1.16.2-r0: task do_create_spdx_setscene: Started
NOTE: recipe python3-docutils-native-0.22.4-r0: task do_create_recipe_spdx_setscene: Started
NOTE: recipe libical-native-3.0.20-r0: task do_create_spdx_setscene: Started
NOTE: recipe wayland-protocols-1.48-r0: task do_create_spdx_setscene: Succeeded
NOTE: Running setscene task 741 of 1574 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-core/readline/readline_8.3.bb:do_create_spdx_setscene)
NOTE: recipe sbc-2.2-r0: task do_create_recipe_spdx_setscene: Succeeded
NOTE: recipe tiff-4.7.1-r0: task do_create_spdx_setscene: Succeeded
NOTE: Running setscene task 748 of 1574 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/xorg-app/xrandr_1.5.4.bb:do_create_spdx_setscene)
NOTE: recipe libadwaita-1.9.1-r0: task do_populate_lic_setscene: Succeeded
NOTE: recipe libwebp-1.6.0-r0: task do_create_recipe_spdx_setscene: Succeeded
NOTE: Running setscene task 761 of 1574 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-multimedia/libtheora/libtheora_1.2.0.bb:do_create_recipe_spdx_setscene)
NOTE: recipe libusb1-1.0.29-r0: task do_create_spdx_setscene: Succeeded
NOTE: Running setscene task 764 of 1574 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-multimedia/libsndfile/libsndfile1_1.2.2.bb:do_create_recipe_spdx_setscene)
NOTE: Running setscene task 768 of 1574 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/xorg-lib/libxdamage_1.1.7.bb:do_create_spdx_setscene)
NOTE: recipe libxshmfence-1.3.3-r0: task do_create_spdx_setscene: Succeeded
NOTE: Running setscene task 769 of 1574 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/xorg-lib/libxxf86vm_1.1.7.bb:do_create_spdx_setscene)
NOTE: recipe iso-codes-4.20.1-r0: task do_create_spdx_setscene: Succeeded
NOTE: Running setscene task 770 of 1574 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-multimedia/libtiff/tiff_4.7.1.bb:do_create_recipe_spdx_setscene)
NOTE: recipe libstd-rs-1.96.0-r0: task do_create_spdx_setscene: Succeeded
NOTE: recipe libdrm-2.4.133-r0: task do_create_spdx_setscene: Succeeded
NOTE: recipe vulkan-loader-1.4.341.0-r0: task do_create_spdx_setscene: Succeeded
NOTE: Running setscene task 774 of 1574 (virtual:native:/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-gnome/gdk-pixbuf/gdk-pixbuf_2.44.6.bb:do_create_recipe_spdx_setscene)
NOTE: recipe python3-docutils-native-0.22.4-r0: task do_create_recipe_spdx_setscene: Succeeded
NOTE: Running setscene task 779 of 1574 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/rust/libstd-rs_1.96.0.bb:do_create_recipe_spdx_setscene)
NOTE: Running setscene task 783 of 1574 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/wayland/wayland-protocols_1.48.bb:do_create_recipe_spdx_setscene)
NOTE: recipe curl-8.20.0-r0: task do_create_spdx_setscene: Succeeded
NOTE: Running setscene task 785 of 1574 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/xorg-lib/libxshmfence_1.3.3.bb:do_create_recipe_spdx_setscene)
NOTE: recipe dbus-1.16.2-r0: task do_create_spdx_setscene: Succeeded
NOTE: recipe libical-native-3.0.20-r0: task do_create_spdx_setscene: Succeeded
NOTE: Running setscene task 791 of 1574 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/cairo/cairo_1.18.4.bb:do_create_spdx_setscene)
NOTE: Running setscene task 793 of 1574 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-core/dbus/dbus_1.16.2.bb:do_create_recipe_spdx_setscene)
NOTE: Running setscene task 795 of 1574 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/drm/libdrm_2.4.133.bb:do_create_recipe_spdx_setscene)
NOTE: Running setscene task 796 of 1574 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/vulkan/vulkan-headers_1.4.341.0.bb:do_create_spdx_setscene)
NOTE: recipe cargo-c-native-0.10.22+cargo-0.96.0-r0: task do_create_spdx_setscene: Started
NOTE: recipe readline-8.3-r0: task do_create_spdx_setscene: Started
NOTE: recipe xrandr-1_1.5.4-r0: task do_create_spdx_setscene: Started
NOTE: recipe libtheora-1.2.0-r0: task do_create_recipe_spdx_setscene: Started
NOTE: recipe libsndfile1-1.2.2-r0: task do_create_recipe_spdx_setscene: Started
NOTE: recipe libxdamage-1_1.1.7-r0: task do_create_spdx_setscene: Started
NOTE: recipe libxxf86vm-1_1.1.7-r0: task do_create_spdx_setscene: Started
NOTE: recipe tiff-4.7.1-r0: task do_create_recipe_spdx_setscene: Started
NOTE: recipe wayland-protocols-1.48-r0: task do_create_recipe_spdx_setscene: Started
NOTE: recipe libxshmfence-1.3.3-r0: task do_create_recipe_spdx_setscene: Started
NOTE: recipe libstd-rs-1.96.0-r0: task do_create_recipe_spdx_setscene: Started
NOTE: recipe cargo-c-native-0.10.22+cargo-0.96.0-r0: task do_create_spdx_setscene: Succeeded
NOTE: recipe vulkan-headers-1.4.341.0-r0: task do_create_spdx_setscene: Started
NOTE: recipe cairo-1.18.4-r0: task do_create_spdx_setscene: Started
NOTE: Running setscene task 799 of 1574 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/xorg-lib/libsm_1.2.6.bb:do_create_spdx_setscene)
NOTE: recipe libdrm-2.4.133-r0: task do_create_recipe_spdx_setscene: Started
NOTE: recipe dbus-1.16.2-r0: task do_create_recipe_spdx_setscene: Started
NOTE: recipe gdk-pixbuf-native-2.44.6-r0: task do_create_recipe_spdx_setscene: Started
NOTE: recipe readline-8.3-r0: task do_create_spdx_setscene: Succeeded
NOTE: recipe xrandr-1_1.5.4-r0: task do_create_spdx_setscene: Succeeded
NOTE: recipe libtheora-1.2.0-r0: task do_create_recipe_spdx_setscene: Succeeded
NOTE: Running setscene task 805 of 1574 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/jpeg/libjpeg-turbo_3.1.4.1.bb:do_create_spdx_setscene)
NOTE: Running setscene task 806 of 1574 (virtual:native:/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/shared-mime-info/shared-mime-info_2.4.bb:do_create_spdx_setscene)
NOTE: recipe libsndfile1-1.2.2-r0: task do_create_recipe_spdx_setscene: Succeeded
NOTE: Running setscene task 810 of 1574 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/xorg-lib/libxrandr_1.5.5.bb:do_create_spdx_setscene)
NOTE: recipe libxdamage-1_1.1.7-r0: task do_create_spdx_setscene: Succeeded
NOTE: recipe wayland-protocols-1.48-r0: task do_create_recipe_spdx_setscene: Succeeded
NOTE: Running setscene task 811 of 1574 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/libusb/libusb1_1.0.29.bb:do_create_recipe_spdx_setscene)
NOTE: recipe libxxf86vm-1_1.1.7-r0: task do_create_spdx_setscene: Succeeded
NOTE: Running setscene task 819 of 1574 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-core/udev/eudev_3.2.14.bb:do_create_spdx_setscene)
NOTE: Running setscene task 822 of 1574 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-multimedia/libtiff/tiff_4.7.1.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 823 of 1574 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-multimedia/libtiff/tiff_4.7.1.bb:do_packagedata_setscene)
NOTE: recipe tiff-4.7.1-r0: task do_create_recipe_spdx_setscene: Succeeded
NOTE: Running setscene task 824 of 1574 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/appstream/appstream_1.1.2.bb:do_recipe_qa_setscene)
NOTE: recipe libxshmfence-1.3.3-r0: task do_create_recipe_spdx_setscene: Succeeded
NOTE: Running setscene task 829 of 1574 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/icu/icu_78.3.bb:do_create_recipe_spdx_setscene)
NOTE: recipe libstd-rs-1.96.0-r0: task do_create_recipe_spdx_setscene: Succeeded
NOTE: Running setscene task 840 of 1574 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/xorg-app/xrandr_1.5.4.bb:do_create_recipe_spdx_setscene)
NOTE: recipe vulkan-headers-1.4.341.0-r0: task do_create_spdx_setscene: Succeeded
NOTE: recipe cairo-1.18.4-r0: task do_create_spdx_setscene: Succeeded
NOTE: Running setscene task 845 of 1574 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/vulkan/vulkan-loader_1.4.341.0.bb:do_create_recipe_spdx_setscene)
NOTE: recipe libdrm-2.4.133-r0: task do_create_recipe_spdx_setscene: Succeeded
NOTE: Running setscene task 852 of 1574 (virtual:native:/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/cargo-c/cargo-c_0.10.22+cargo-0.96.0.bb:do_create_recipe_spdx_setscene)
NOTE: Running setscene task 853 of 1574 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/wayland/wayland_1.25.0.bb:do_create_spdx_setscene)
NOTE: recipe libsm-1_1.2.6-r0: task do_create_spdx_setscene: Started
NOTE: recipe dbus-1.16.2-r0: task do_create_recipe_spdx_setscene: Succeeded
NOTE: recipe gdk-pixbuf-native-2.44.6-r0: task do_create_recipe_spdx_setscene: Succeeded
NOTE: Running setscene task 857 of 1574 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/libepoxy/libepoxy_1.5.10.bb:do_deploy_source_date_epoch_setscene)
NOTE: Running setscene task 858 of 1574 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/xorg-lib/libxdamage_1.1.7.bb:do_create_recipe_spdx_setscene)
NOTE: recipe libjpeg-turbo-1_3.1.4.1-r0: task do_create_spdx_setscene: Started
NOTE: recipe libxrandr-1_1.5.5-r0: task do_create_spdx_setscene: Started
NOTE: recipe libusb1-1.0.29-r0: task do_create_recipe_spdx_setscene: Started
NOTE: recipe tiff-4.7.1-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe eudev-3.2.14-r0: task do_create_spdx_setscene: Started
NOTE: recipe tiff-4.7.1-r0: task do_packagedata_setscene: Started
NOTE: recipe appstream-1.1.2-r0: task do_recipe_qa_setscene: Started
NOTE: recipe shared-mime-info-native-2.4-r0: task do_create_spdx_setscene: Started
NOTE: recipe xrandr-1_1.5.4-r0: task do_create_recipe_spdx_setscene: Started
NOTE: recipe libsm-1_1.2.6-r0: task do_create_spdx_setscene: Succeeded
NOTE: recipe icu-78.3-r0: task do_create_recipe_spdx_setscene: Started
NOTE: Running setscene task 859 of 1574 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/xorg-lib/libxxf86vm_1.1.7.bb:do_create_recipe_spdx_setscene)
NOTE: recipe vulkan-loader-1.4.341.0-r0: task do_create_recipe_spdx_setscene: Started
NOTE: recipe libxdamage-1_1.1.7-r0: task do_create_recipe_spdx_setscene: Started
NOTE: recipe wayland-1.25.0-r0: task do_create_spdx_setscene: Started
NOTE: recipe libepoxy-1.5.10-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe libxrandr-1_1.5.5-r0: task do_create_spdx_setscene: Succeeded
NOTE: recipe libjpeg-turbo-1_3.1.4.1-r0: task do_create_spdx_setscene: Succeeded
NOTE: Running setscene task 861 of 1574 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-multimedia/flac/flac_1.5.0.bb:do_create_recipe_spdx_setscene)
NOTE: recipe libusb1-1.0.29-r0: task do_create_recipe_spdx_setscene: Succeeded
NOTE: Running setscene task 865 of 1574 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/fontconfig/fontconfig_2.17.1.bb:do_create_spdx_setscene)
NOTE: Running setscene task 866 of 1574 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-core/readline/readline_8.3.bb:do_create_recipe_spdx_setscene)
NOTE: recipe appstream-1.1.2-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe eudev-3.2.14-r0: task do_create_spdx_setscene: Succeeded
NOTE: Running setscene task 867 of 1574 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/curl/curl_8.20.0.bb:do_create_recipe_spdx_setscene)
NOTE: Running setscene task 868 of 1574 (virtual:native:/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/icu/icu_78.3.bb:do_create_spdx_setscene)
NOTE: recipe shared-mime-info-native-2.4-r0: task do_create_spdx_setscene: Succeeded
NOTE: Running setscene task 870 of 1574 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-multimedia/libvorbis/libvorbis_1.3.7.bb:do_create_recipe_spdx_setscene)
NOTE: recipe xrandr-1_1.5.4-r0: task do_create_recipe_spdx_setscene: Succeeded
NOTE: Running setscene task 872 of 1574 (virtual:native:/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/libical/libical_3.0.20.bb:do_create_recipe_spdx_setscene)
NOTE: recipe icu-78.3-r0: task do_create_recipe_spdx_setscene: Succeeded
NOTE: Running setscene task 874 of 1574 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/xorg-lib/libxfixes_6.0.2.bb:do_create_spdx_setscene)
NOTE: recipe vulkan-loader-1.4.341.0-r0: task do_create_recipe_spdx_setscene: Succeeded
NOTE: recipe tiff-4.7.1-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe libxxf86vm-1_1.1.7-r0: task do_create_recipe_spdx_setscene: Started
NOTE: Running setscene task 876 of 1574 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-gnome/libxmlb/libxmlb_0.3.26.bb:do_deploy_source_date_epoch_setscene)
NOTE: recipe libepoxy-1.5.10-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: Running setscene task 883 of 1574 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/xorg-lib/libxrender_0.9.12.bb:do_create_spdx_setscene)
NOTE: Running setscene task 884 of 1574 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/vulkan/vulkan-headers_1.4.341.0.bb:do_create_recipe_spdx_setscene)
NOTE: recipe libxdamage-1_1.1.7-r0: task do_create_recipe_spdx_setscene: Succeeded
NOTE: recipe wayland-1.25.0-r0: task do_create_spdx_setscene: Succeeded
NOTE: recipe tiff-4.7.1-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 887 of 1574 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/jpeg/libjpeg-turbo_3.1.4.1.bb:do_create_recipe_spdx_setscene)
NOTE: Running setscene task 889 of 1574 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/curl/curl_8.20.0.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 891 of 1574 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-multimedia/alsa/alsa-lib_1.2.15.3.bb:do_create_recipe_spdx_setscene)
NOTE: recipe flac-1.5.0-r0: task do_create_recipe_spdx_setscene: Started
NOTE: recipe cargo-c-native-0.10.22+cargo-0.96.0-r0: task do_create_recipe_spdx_setscene: Started
NOTE: recipe readline-8.3-r0: task do_create_recipe_spdx_setscene: Started
NOTE: recipe fontconfig-2.17.1-r0: task do_create_spdx_setscene: Started
NOTE: recipe libvorbis-1.3.7-r0: task do_create_recipe_spdx_setscene: Started
NOTE: recipe curl-8.20.0-r0: task do_create_recipe_spdx_setscene: Started
NOTE: recipe libxxf86vm-1_1.1.7-r0: task do_create_recipe_spdx_setscene: Succeeded
NOTE: Running setscene task 892 of 1574 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/curl/curl_8.20.0.bb:do_packagedata_setscene)
NOTE: recipe libxfixes-1_6.0.2-r0: task do_create_spdx_setscene: Started
NOTE: recipe libxrender-1_0.9.12-r0: task do_create_spdx_setscene: Started
NOTE: recipe vulkan-headers-1.4.341.0-r0: task do_create_recipe_spdx_setscene: Started
NOTE: recipe icu-native-78.3-r0: task do_create_spdx_setscene: Started
NOTE: recipe libxmlb-0.3.26-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe libjpeg-turbo-1_3.1.4.1-r0: task do_create_recipe_spdx_setscene: Started
NOTE: recipe alsa-lib-1.2.15.3-r0: task do_create_recipe_spdx_setscene: Started
NOTE: recipe libical-native-3.0.20-r0: task do_create_recipe_spdx_setscene: Started
NOTE: recipe curl-8.20.0-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe flac-1.5.0-r0: task do_create_recipe_spdx_setscene: Succeeded
NOTE: recipe cargo-c-native-0.10.22+cargo-0.96.0-r0: task do_create_recipe_spdx_setscene: Succeeded
NOTE: recipe readline-8.3-r0: task do_create_recipe_spdx_setscene: Succeeded
NOTE: Running setscene task 894 of 1574 (virtual:native:/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/xmlto/xmlto_0.0.29.bb:do_create_spdx_setscene)
NOTE: Running setscene task 896 of 1574 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/libusb/libusb1_1.0.29.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 900 of 1574 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-gnome/gtk+/gtk4_4.22.4.bb:do_recipe_qa_setscene)
NOTE: recipe fontconfig-2.17.1-r0: task do_create_spdx_setscene: Succeeded
NOTE: recipe libvorbis-1.3.7-r0: task do_create_recipe_spdx_setscene: Succeeded
NOTE: Running setscene task 901 of 1574 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-multimedia/libtiff/tiff_4.7.1.bb:do_recipe_qa_setscene)
NOTE: recipe curl-8.20.0-r0: task do_create_recipe_spdx_setscene: Succeeded
NOTE: Running setscene task 903 of 1574 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/cairo/cairo_1.18.4.bb:do_create_recipe_spdx_setscene)
NOTE: Running setscene task 905 of 1574 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-multimedia/libogg/libogg_1.3.6.bb:do_create_recipe_spdx_setscene)
NOTE: recipe libxfixes-1_6.0.2-r0: task do_create_spdx_setscene: Succeeded
NOTE: Running setscene task 906 of 1574 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/xorg-lib/libxext_1.3.7.bb:do_create_spdx_setscene)
NOTE: recipe icu-native-78.3-r0: task do_create_spdx_setscene: Succeeded
NOTE: Running setscene task 907 of 1574 (virtual:native:/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/shared-mime-info/shared-mime-info_2.4.bb:do_create_recipe_spdx_setscene)
NOTE: recipe libxrender-1_0.9.12-r0: task do_create_spdx_setscene: Succeeded
NOTE: recipe libxmlb-0.3.26-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: recipe vulkan-headers-1.4.341.0-r0: task do_create_recipe_spdx_setscene: Succeeded
NOTE: recipe libical-native-3.0.20-r0: task do_create_recipe_spdx_setscene: Succeeded
NOTE: Running setscene task 911 of 1574 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/xorg-lib/libsm_1.2.6.bb:do_create_recipe_spdx_setscene)
NOTE: Running setscene task 912 of 1574 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-core/glib-2.0/glib-2.0_2.88.0.bb:do_create_spdx_setscene)
NOTE: Running setscene task 913 of 1574 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/libfyaml/libfyaml_0.9.4.bb:do_deploy_source_date_epoch_setscene)
NOTE: recipe curl-8.20.0-r0: task do_packagedata_setscene: Started
NOTE: recipe libjpeg-turbo-1_3.1.4.1-r0: task do_create_recipe_spdx_setscene: Succeeded
NOTE: Running setscene task 915 of 1574 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/xorg-lib/libxrandr_1.5.5.bb:do_create_recipe_spdx_setscene)
NOTE: recipe alsa-lib-1.2.15.3-r0: task do_create_recipe_spdx_setscene: Succeeded
NOTE: Running setscene task 916 of 1574 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-core/udev/eudev_3.2.14.bb:do_create_recipe_spdx_setscene)
NOTE: Running setscene task 917 of 1574 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/xorg-lib/libxcursor_1.2.3.bb:do_recipe_qa_setscene)
NOTE: recipe libusb1-1.0.29-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe tiff-4.7.1-r0: task do_recipe_qa_setscene: Started
NOTE: recipe gtk4-4.22.4-r0: task do_recipe_qa_setscene: Started
NOTE: recipe libogg-1.3.6-r0: task do_create_recipe_spdx_setscene: Started
NOTE: recipe xmlto-native-0.0.29-r0: task do_create_spdx_setscene: Started
NOTE: recipe curl-8.20.0-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe cairo-1.18.4-r0: task do_create_recipe_spdx_setscene: Started
NOTE: Running setscene task 921 of 1574 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/graphene/graphene_1.10.8.bb:do_recipe_qa_setscene)
NOTE: recipe libxext-1_1.3.7-r0: task do_create_spdx_setscene: Started
NOTE: recipe libsm-1_1.2.6-r0: task do_create_recipe_spdx_setscene: Started
NOTE: recipe libfyaml-0.9.4-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe libxrandr-1_1.5.5-r0: task do_create_recipe_spdx_setscene: Started
NOTE: recipe libxcursor-1_1.2.3-r0: task do_recipe_qa_setscene: Started
NOTE: recipe eudev-3.2.14-r0: task do_create_recipe_spdx_setscene: Started
NOTE: recipe glib-2.0-1_2.88.0-r0: task do_create_spdx_setscene: Started
NOTE: recipe shared-mime-info-native-2.4-r0: task do_create_recipe_spdx_setscene: Started
NOTE: recipe tiff-4.7.1-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe curl-8.20.0-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 923 of 1574 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/libusb/libusb1_1.0.29.bb:do_packagedata_setscene)
NOTE: Running setscene task 924 of 1574 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-core/libxml/libxml2_2.15.3.bb:do_create_spdx_setscene)
NOTE: recipe gtk4-4.22.4-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe xmlto-native-0.0.29-r0: task do_create_spdx_setscene: Succeeded
NOTE: Running setscene task 935 of 1574 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-core/initscripts/initscripts_1.0.bb:do_create_spdx_setscene)
NOTE: Running setscene task 940 of 1574 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/xorg-lib/libxfixes_6.0.2.bb:do_create_recipe_spdx_setscene)
NOTE: recipe libogg-1.3.6-r0: task do_create_recipe_spdx_setscene: Succeeded
NOTE: Running setscene task 942 of 1574 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-gnome/libxmlb/libxmlb_0.3.26.bb:do_recipe_qa_setscene)
NOTE: recipe cairo-1.18.4-r0: task do_create_recipe_spdx_setscene: Succeeded
NOTE: Running setscene task 945 of 1574 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/libepoxy/libepoxy_1.5.10.bb:do_recipe_qa_setscene)
NOTE: recipe libxext-1_1.3.7-r0: task do_create_spdx_setscene: Succeeded
NOTE: Running setscene task 947 of 1574 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-bad_1.28.2.bb:do_recipe_qa_setscene)
NOTE: recipe libfyaml-0.9.4-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: recipe libxcursor-1_1.2.3-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe graphene-1.10.8-r0: task do_recipe_qa_setscene: Started
NOTE: Running setscene task 951 of 1574 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/xorg-lib/libxinerama_1.1.6.bb:do_recipe_qa_setscene)
NOTE: recipe libsm-1_1.2.6-r0: task do_create_recipe_spdx_setscene: Succeeded
NOTE: Running setscene task 957 of 1574 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/freetype/freetype_2.14.3.bb:do_create_spdx_setscene)
NOTE: recipe libusb1-1.0.29-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 959 of 1574 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/wayland/wayland_1.25.0.bb:do_create_recipe_spdx_setscene)
NOTE: recipe libxrandr-1_1.5.5-r0: task do_create_recipe_spdx_setscene: Succeeded
NOTE: Running setscene task 963 of 1574 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/xorg-lib/libxcomposite_0.4.7.bb:do_recipe_qa_setscene)
NOTE: Running setscene task 970 of 1574 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/xorg-lib/libxv_1.0.13.bb:do_recipe_qa_setscene)
NOTE: recipe shared-mime-info-native-2.4-r0: task do_create_recipe_spdx_setscene: Succeeded
NOTE: recipe eudev-3.2.14-r0: task do_create_recipe_spdx_setscene: Succeeded
NOTE: Running setscene task 971 of 1574 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/rust/libstd-rs_1.96.0.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 976 of 1574 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/fontconfig/fontconfig_2.17.1.bb:do_create_recipe_spdx_setscene)
NOTE: recipe glib-2.0-1_2.88.0-r0: task do_create_spdx_setscene: Succeeded
NOTE: Running setscene task 979 of 1574 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/iso-codes/iso-codes_4.20.1.bb:do_packagedata_setscene)
NOTE: recipe initscripts-1.0-r0: task do_create_spdx_setscene: Started
NOTE: recipe libusb1-1.0.29-r0: task do_packagedata_setscene: Started
NOTE: recipe libxml2-2.15.3-r0: task do_create_spdx_setscene: Started
NOTE: recipe libxfixes-1_6.0.2-r0: task do_create_recipe_spdx_setscene: Started
NOTE: recipe graphene-1.10.8-r0: task do_recipe_qa_setscene: Succeeded
NOTE: Running setscene task 980 of 1574 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-core/readline/readline_8.3.bb:do_populate_sysroot_setscene)
NOTE: recipe libxmlb-0.3.26-r0: task do_recipe_qa_setscene: Started
NOTE: recipe libepoxy-1.5.10-r0: task do_recipe_qa_setscene: Started
NOTE: recipe libxinerama-1_1.1.6-r0: task do_recipe_qa_setscene: Started
NOTE: recipe gstreamer1.0-plugins-bad-1.28.2-r0: task do_recipe_qa_setscene: Started
NOTE: recipe freetype-2.14.3-r0: task do_create_spdx_setscene: Started
NOTE: recipe libxcomposite-1_0.4.7-r0: task do_recipe_qa_setscene: Started
NOTE: recipe libxv-1.0.13-r0: task do_recipe_qa_setscene: Started
NOTE: recipe wayland-1.25.0-r0: task do_create_recipe_spdx_setscene: Started
NOTE: recipe fontconfig-2.17.1-r0: task do_create_recipe_spdx_setscene: Started
NOTE: recipe libstd-rs-1.96.0-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe iso-codes-4.20.1-r0: task do_packagedata_setscene: Started
NOTE: recipe initscripts-1.0-r0: task do_create_spdx_setscene: Succeeded
NOTE: Running setscene task 982 of 1574 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/libfyaml/libfyaml_0.9.4.bb:do_recipe_qa_setscene)
NOTE: recipe libxfixes-1_6.0.2-r0: task do_create_recipe_spdx_setscene: Succeeded
NOTE: Running setscene task 985 of 1574 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-gnome/librsvg/librsvg_2.62.2.bb:do_recipe_qa_setscene)
NOTE: recipe libxmlb-0.3.26-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe libxml2-2.15.3-r0: task do_create_spdx_setscene: Succeeded
NOTE: recipe libepoxy-1.5.10-r0: task do_recipe_qa_setscene: Succeeded
NOTE: Running setscene task 986 of 1574 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/xorg-lib/libxrender_0.9.12.bb:do_create_recipe_spdx_setscene)
NOTE: Running setscene task 988 of 1574 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/atk/at-spi2-core_2.60.4.bb:do_recipe_qa_setscene)
NOTE: Running setscene task 992 of 1574 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-multimedia/webp/libwebp_1.6.0.bb:do_deploy_source_date_epoch_setscene)
NOTE: recipe libxinerama-1_1.1.6-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe libusb1-1.0.29-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 993 of 1574 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-base_1.28.2.bb:do_recipe_qa_setscene)
NOTE: recipe gstreamer1.0-plugins-bad-1.28.2-r0: task do_recipe_qa_setscene: Succeeded
NOTE: Running setscene task 994 of 1574 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/rust/libstd-rs_1.96.0.bb:do_packagedata_setscene)
NOTE: recipe readline-8.3-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe libxcomposite-1_0.4.7-r0: task do_recipe_qa_setscene: Succeeded
NOTE: Running setscene task 995 of 1574 (virtual:native:/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/cargo-c/cargo-c_0.10.22+cargo-0.96.0.bb:do_populate_sysroot_setscene)
NOTE: recipe libxv-1.0.13-r0: task do_recipe_qa_setscene: Succeeded
NOTE: Running setscene task 999 of 1574 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-extended/libidn/libidn2_2.3.8.bb:do_packagedata_setscene)
NOTE: Running setscene task 1001 of 1574 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-core/initscripts/initscripts_1.0.bb:do_create_recipe_spdx_setscene)
NOTE: recipe freetype-2.14.3-r0: task do_create_spdx_setscene: Succeeded
NOTE: Running setscene task 1003 of 1574 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/curl/curl_8.20.0.bb:do_recipe_qa_setscene)
NOTE: recipe wayland-1.25.0-r0: task do_create_recipe_spdx_setscene: Succeeded
NOTE: Running setscene task 1004 of 1574 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-core/util-linux/util-linux_2.41.3.bb:do_create_spdx_setscene)
NOTE: recipe fontconfig-2.17.1-r0: task do_create_recipe_spdx_setscene: Succeeded
NOTE: Running setscene task 1005 of 1574 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-core/libxml/libxml2_2.15.3.bb:do_create_recipe_spdx_setscene)
NOTE: recipe libfyaml-0.9.4-r0: task do_recipe_qa_setscene: Started
NOTE: recipe libxrender-1_0.9.12-r0: task do_create_recipe_spdx_setscene: Started
NOTE: recipe libwebp-1.6.0-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe at-spi2-core-2.60.4-r0: task do_recipe_qa_setscene: Started
NOTE: recipe initscripts-1.0-r0: task do_create_recipe_spdx_setscene: Started
NOTE: recipe gstreamer1.0-plugins-base-1.28.2-r0: task do_recipe_qa_setscene: Started
NOTE: recipe libidn2-2.3.8-r0: task do_packagedata_setscene: Started
NOTE: recipe libstd-rs-1.96.0-r0: task do_packagedata_setscene: Started
NOTE: recipe curl-8.20.0-r0: task do_recipe_qa_setscene: Started
NOTE: recipe libfyaml-0.9.4-r0: task do_recipe_qa_setscene: Succeeded
NOTE: Running setscene task 1009 of 1574 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-core/readline/readline_8.3.bb:do_packagedata_setscene)
NOTE: recipe readline-8.3-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe libxml2-2.15.3-r0: task do_create_recipe_spdx_setscene: Started
NOTE: Running setscene task 1010 of 1574 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-core/dbus/dbus_1.16.2.bb:do_packagedata_setscene)
NOTE: recipe librsvg-2.62.2-r0: task do_recipe_qa_setscene: Started
NOTE: recipe util-linux-2.41.3-r0: task do_create_spdx_setscene: Started
NOTE: recipe libwebp-1.6.0-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: Running setscene task 1012 of 1574 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-core/udev/eudev_3.2.14.bb:do_populate_sysroot_setscene)
NOTE: recipe libxrender-1_0.9.12-r0: task do_create_recipe_spdx_setscene: Succeeded
NOTE: recipe at-spi2-core-2.60.4-r0: task do_recipe_qa_setscene: Succeeded
NOTE: Running setscene task 1013 of 1574 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/xorg-lib/libx11_1.8.13.bb:do_create_spdx_setscene)
NOTE: recipe gstreamer1.0-plugins-base-1.28.2-r0: task do_recipe_qa_setscene: Succeeded
NOTE: Running setscene task 1020 of 1574 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/freetype/freetype_2.14.3.bb:do_create_recipe_spdx_setscene)
NOTE: Running setscene task 1022 of 1574 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/xorg-lib/libxext_1.3.7.bb:do_create_recipe_spdx_setscene)
NOTE: recipe initscripts-1.0-r0: task do_create_recipe_spdx_setscene: Succeeded
NOTE: Running setscene task 1025 of 1574 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-multimedia/libtheora/libtheora_1.2.0.bb:do_recipe_qa_setscene)
NOTE: recipe curl-8.20.0-r0: task do_recipe_qa_setscene: Succeeded
NOTE: Running setscene task 1026 of 1574 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-multimedia/webp/libwebp_1.6.0.bb:do_recipe_qa_setscene)
NOTE: recipe libstd-rs-1.96.0-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe librsvg-2.62.2-r0: task do_recipe_qa_setscene: Succeeded
NOTE: Running setscene task 1027 of 1574 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/xorg-lib/libxkbcommon_1.13.1.bb:do_deploy_source_date_epoch_setscene)
NOTE: recipe libxml2-2.15.3-r0: task do_create_recipe_spdx_setscene: Succeeded
NOTE: Running setscene task 1030 of 1574 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-multimedia/sbc/sbc_2.2.bb:do_recipe_qa_setscene)
NOTE: Running setscene task 1031 of 1574 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/jpeg/libjpeg-turbo_3.1.4.1.bb:do_packagedata_setscene)
NOTE: recipe readline-8.3-r0: task do_packagedata_setscene: Started
NOTE: recipe cargo-c-native-0.10.22+cargo-0.96.0-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe util-linux-2.41.3-r0: task do_create_spdx_setscene: Succeeded
NOTE: Running setscene task 1032 of 1574 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-core/glib-2.0/glib-2.0_2.88.0.bb:do_create_recipe_spdx_setscene)
NOTE: recipe dbus-1.16.2-r0: task do_packagedata_setscene: Started
NOTE: recipe eudev-3.2.14-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe libx11-1_1.8.13-r0: task do_create_spdx_setscene: Started
NOTE: recipe libxext-1_1.3.7-r0: task do_create_recipe_spdx_setscene: Started
NOTE: recipe freetype-2.14.3-r0: task do_create_recipe_spdx_setscene: Started
NOTE: recipe libtheora-1.2.0-r0: task do_recipe_qa_setscene: Started
NOTE: recipe libwebp-1.6.0-r0: task do_recipe_qa_setscene: Started
NOTE: recipe libidn2-2.3.8-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 1037 of 1574 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/libical/libical_3.0.20.bb:do_deploy_source_date_epoch_setscene)
NOTE: recipe sbc-2.2-r0: task do_recipe_qa_setscene: Started
NOTE: recipe libxkbcommon-1.13.1-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe libjpeg-turbo-1_3.1.4.1-r0: task do_packagedata_setscene: Started
NOTE: recipe readline-8.3-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe libtheora-1.2.0-r0: task do_recipe_qa_setscene: Succeeded
NOTE: Running setscene task 1038 of 1574 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/mesa/libglu_9.0.3.bb:do_recipe_qa_setscene)
NOTE: Running setscene task 1039 of 1574 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/xorg-lib/libxshmfence_1.3.3.bb:do_packagedata_setscene)
NOTE: recipe libx11-1_1.8.13-r0: task do_create_spdx_setscene: Succeeded
NOTE: recipe freetype-2.14.3-r0: task do_create_recipe_spdx_setscene: Succeeded
NOTE: recipe libxext-1_1.3.7-r0: task do_create_recipe_spdx_setscene: Succeeded
NOTE: Running setscene task 1041 of 1574 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-extended/shadow/shadow-sysroot_4.6.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 1044 of 1574 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/xorg-lib/libxdamage_1.1.7.bb:do_packagedata_setscene)
NOTE: Running setscene task 1045 of 1574 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/xorg-lib/libxxf86vm_1.1.7.bb:do_packagedata_setscene)
NOTE: recipe glib-2.0-1_2.88.0-r0: task do_create_recipe_spdx_setscene: Started
NOTE: recipe libwebp-1.6.0-r0: task do_recipe_qa_setscene: Succeeded
NOTE: Running setscene task 1047 of 1574 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-extended/libidn/libidn2_2.3.8.bb:do_populate_sysroot_setscene)
NOTE: recipe dbus-1.16.2-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe sbc-2.2-r0: task do_recipe_qa_setscene: Succeeded
NOTE: Running setscene task 1050 of 1574 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-core/base-passwd/base-passwd_3.6.8.bb:do_packagedata_setscene)
NOTE: Running setscene task 1051 of 1574 (virtual:native:/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/wayland/wayland_1.25.0.bb:do_create_recipe_spdx_setscene)
NOTE: recipe libxkbcommon-1.13.1-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: Running setscene task 1054 of 1574 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-gnome/gobject-introspection/gobject-introspection_1.86.0.bb:do_create_spdx_setscene)
NOTE: recipe eudev-3.2.14-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe libstd-rs-1.96.0-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe libical-3.0.20-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: Running setscene task 1055 of 1574 (virtual:native:/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/libical/libical_3.0.20.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 1058 of 1574 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/xorg-lib/libx11_1.8.13.bb:do_create_recipe_spdx_setscene)
NOTE: recipe shadow-sysroot-4.6-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe libjpeg-turbo-1_3.1.4.1-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 1059 of 1574 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-gnome/libgudev/libgudev_238.bb:do_recipe_qa_setscene)
NOTE: recipe libxshmfence-1.3.3-r0: task do_packagedata_setscene: Started
NOTE: recipe libglu-2_9.0.3-r0: task do_recipe_qa_setscene: Started
NOTE: recipe glib-2.0-1_2.88.0-r0: task do_create_recipe_spdx_setscene: Succeeded
NOTE: Running setscene task 1060 of 1574 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-connectivity/bluez5/bluez5_5.86.bb:do_recipe_qa_setscene)
NOTE: recipe libxdamage-1_1.1.7-r0: task do_packagedata_setscene: Started
NOTE: recipe libxxf86vm-1_1.1.7-r0: task do_packagedata_setscene: Started
NOTE: recipe libidn2-2.3.8-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe base-passwd-3.6.8-r0: task do_packagedata_setscene: Started
NOTE: recipe libical-3.0.20-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: Running setscene task 1063 of 1574 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/drm/libdrm_2.4.133.bb:do_populate_sysroot_setscene)
NOTE: recipe gobject-introspection-1.86.0-r0: task do_create_spdx_setscene: Started
NOTE: recipe libx11-1_1.8.13-r0: task do_create_recipe_spdx_setscene: Started
NOTE: recipe libglu-2_9.0.3-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe wayland-native-1.25.0-r0: task do_create_recipe_spdx_setscene: Started
NOTE: Running setscene task 1064 of 1574 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/drm/libdrm_2.4.133.bb:do_packagedata_setscene)
NOTE: recipe libical-native-3.0.20-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe libgudev-238-r0: task do_recipe_qa_setscene: Started
NOTE: recipe libxshmfence-1.3.3-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 1065 of 1574 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-multimedia/libpng/libpng_1.6.58.bb:do_create_spdx_setscene)
NOTE: recipe bluez5-5.86-r0: task do_recipe_qa_setscene: Started
NOTE: recipe shadow-sysroot-4.6-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe libxdamage-1_1.1.7-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 1068 of 1574 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/xorg-lib/libxcb_1.17.0.bb:do_create_spdx_setscene)
NOTE: recipe libxxf86vm-1_1.1.7-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 1071 of 1574 (virtual:native:/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/xmlto/xmlto_0.0.29.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 1075 of 1574 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/xorg-app/xrandr_1.5.4.bb:do_populate_sysroot_setscene)
NOTE: recipe gobject-introspection-1.86.0-r0: task do_create_spdx_setscene: Succeeded
NOTE: Running setscene task 1076 of 1574 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/xorg-lib/libsm_1.2.6.bb:do_packagedata_setscene)
NOTE: recipe libx11-1_1.8.13-r0: task do_create_recipe_spdx_setscene: Succeeded
NOTE: recipe wayland-native-1.25.0-r0: task do_create_recipe_spdx_setscene: Succeeded
NOTE: recipe libdrm-2.4.133-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe base-passwd-3.6.8-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 1080 of 1574 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/python/python3_3.14.5.bb:do_create_spdx_setscene)
NOTE: Running setscene task 1081 of 1574 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/xorg-lib/libxtst_1.2.5.bb:do_recipe_qa_setscene)
NOTE: Running setscene task 1082 of 1574 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/jpeg/libjpeg-turbo_3.1.4.1.bb:do_populate_sysroot_setscene)
NOTE: recipe libidn2-2.3.8-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe libgudev-238-r0: task do_recipe_qa_setscene: Succeeded
NOTE: Running setscene task 1083 of 1574 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-core/udev/eudev_3.2.14.bb:do_packagedata_setscene)
NOTE: Running setscene task 1084 of 1574 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-core/base-passwd/base-passwd_3.6.8.bb:do_populate_sysroot_setscene)
NOTE: recipe libdrm-2.4.133-r0: task do_packagedata_setscene: Started
NOTE: recipe bluez5-5.86-r0: task do_recipe_qa_setscene: Succeeded
NOTE: Running setscene task 1091 of 1574 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/orc/orc_0.4.42.bb:do_recipe_qa_setscene)
NOTE: recipe libpng-1.6.58-r0: task do_create_spdx_setscene: Started
NOTE: recipe iso-codes-4.20.1-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 1092 of 1574 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/mesa/mesa.bb:do_recipe_qa_setscene)
NOTE: recipe libxcb-1.17.0-r0: task do_create_spdx_setscene: Started
NOTE: recipe xrandr-1_1.5.4-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe libical-native-3.0.20-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe libsm-1_1.2.6-r0: task do_packagedata_setscene: Started
NOTE: Running setscene task 1094 of 1574 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/xorg-lib/libxkbcommon_1.13.1.bb:do_recipe_qa_setscene)
NOTE: recipe xmlto-native-0.0.29-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe libxtst-1_1.2.5-r0: task do_recipe_qa_setscene: Started
NOTE: recipe libjpeg-turbo-1_3.1.4.1-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe base-passwd-3.6.8-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe eudev-3.2.14-r0: task do_packagedata_setscene: Started
NOTE: recipe orc-0.4.42-r0: task do_recipe_qa_setscene: Started
NOTE: recipe python3-3.14.5-r0: task do_create_spdx_setscene: Started
NOTE: recipe libdrm-2.4.133-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe libpng-1.6.58-r0: task do_create_spdx_setscene: Succeeded
NOTE: Running setscene task 1096 of 1574 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/libusb/libusb1_1.0.29.bb:do_recipe_qa_setscene)
NOTE: Running setscene task 1097 of 1574 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-multimedia/gstreamer/gstreamer1.0_1.28.2.bb:do_recipe_qa_setscene)
NOTE: recipe libxcb-1.17.0-r0: task do_create_spdx_setscene: Succeeded
NOTE: Running setscene task 1099 of 1574 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/libical/libical_3.0.20.bb:do_recipe_qa_setscene)
NOTE: recipe libxtst-1_1.2.5-r0: task do_recipe_qa_setscene: Succeeded
NOTE: Running setscene task 1100 of 1574 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/xorg-app/xrandr_1.5.4.bb:do_packagedata_setscene)
NOTE: recipe libdrm-2.4.133-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 1102 of 1574 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/vala/vala_0.56.19.bb:do_recipe_qa_setscene)
NOTE: recipe cargo-c-native-0.10.22+cargo-0.96.0-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe libxkbcommon-1.13.1-r0: task do_recipe_qa_setscene: Started
NOTE: recipe mesa-2_26.0.6-r0: task do_recipe_qa_setscene: Started
NOTE: Running setscene task 1107 of 1574 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/xorg-lib/libxshmfence_1.3.3.bb:do_populate_sysroot_setscene)
NOTE: recipe libsm-1_1.2.6-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 1108 of 1574 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/vulkan/vulkan-loader_1.4.341.0.bb:do_populate_sysroot_setscene)
NOTE: recipe xrandr-1_1.5.4-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe orc-0.4.42-r0: task do_recipe_qa_setscene: Succeeded
NOTE: Running setscene task 1111 of 1574 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/vulkan/vulkan-loader_1.4.341.0.bb:do_packagedata_setscene)
NOTE: Running setscene task 1115 of 1574 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/xorg-lib/libxdamage_1.1.7.bb:do_populate_sysroot_setscene)
NOTE: recipe xmlto-native-0.0.29-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 1116 of 1574 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/xorg-lib/libxxf86vm_1.1.7.bb:do_populate_sysroot_setscene)
NOTE: recipe eudev-3.2.14-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe python3-3.14.5-r0: task do_create_spdx_setscene: Succeeded
NOTE: recipe libusb1-1.0.29-r0: task do_recipe_qa_setscene: Started
NOTE: Running setscene task 1119 of 1574 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-core/util-linux/util-linux_2.41.3.bb:do_create_recipe_spdx_setscene)
NOTE: Running setscene task 1120 of 1574 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/libunistring/libunistring_1.4.2.bb:do_packagedata_setscene)
NOTE: recipe libjpeg-turbo-1_3.1.4.1-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe base-passwd-3.6.8-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 1123 of 1574 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-multimedia/libpng/libpng_1.6.58.bb:do_create_recipe_spdx_setscene)
NOTE: recipe gstreamer1.0-1.28.2-r0: task do_recipe_qa_setscene: Started
NOTE: Running setscene task 1128 of 1574 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/libunistring/libunistring_1.4.2.bb:do_populate_sysroot_setscene)
NOTE: recipe libical-3.0.20-r0: task do_recipe_qa_setscene: Started
NOTE: recipe libxkbcommon-1.13.1-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe mesa-2_26.0.6-r0: task do_recipe_qa_setscene: Succeeded
NOTE: Running setscene task 1129 of 1574 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/xorg-lib/libpciaccess_0.19.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 1130 of 1574 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-extended/shadow/shadow_4.19.4.bb:do_packagedata_setscene)
NOTE: recipe xrandr-1_1.5.4-r0: task do_packagedata_setscene: Started
NOTE: recipe vala-0.56.19-r0: task do_recipe_qa_setscene: Started
NOTE: recipe libxshmfence-1.3.3-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe vulkan-loader-1.4.341.0-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe libxdamage-1_1.1.7-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe vulkan-loader-1.4.341.0-r0: task do_packagedata_setscene: Started
NOTE: recipe libusb1-1.0.29-r0: task do_recipe_qa_setscene: Succeeded
NOTE: Running setscene task 1132 of 1574 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/pango/pango_1.57.1.bb:do_recipe_qa_setscene)
NOTE: recipe libxxf86vm-1_1.1.7-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe gstreamer1.0-1.28.2-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe libical-3.0.20-r0: task do_recipe_qa_setscene: Succeeded
NOTE: Running setscene task 1135 of 1574 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-extended/shadow/shadow-sysroot_4.6.bb:do_recipe_qa_setscene)
NOTE: Running setscene task 1136 of 1574 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/xorg-lib/xkeyboard-config_2.47.bb:do_recipe_qa_setscene)
NOTE: recipe libunistring-1.4.2-r0: task do_packagedata_setscene: Started
NOTE: recipe libunistring-1.4.2-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe vala-0.56.19-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe libpng-1.6.58-r0: task do_create_recipe_spdx_setscene: Started
NOTE: Running setscene task 1138 of 1574 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/shared-mime-info/shared-mime-info_2.4.bb:do_deploy_source_date_epoch_setscene)
NOTE: recipe util-linux-2.41.3-r0: task do_create_recipe_spdx_setscene: Started
NOTE: recipe libpciaccess-0.19-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe shadow-4.19.4-r0: task do_packagedata_setscene: Started
NOTE: recipe xrandr-1_1.5.4-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 1139 of 1574 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-extended/zstd/zstd_1.5.7.bb:do_create_spdx_setscene)
NOTE: recipe shadow-sysroot-4.6-r0: task do_recipe_qa_setscene: Started
NOTE: recipe pango-1.57.1-r0: task do_recipe_qa_setscene: Started
NOTE: recipe vulkan-loader-1.4.341.0-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe libxshmfence-1.3.3-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 1146 of 1574 (virtual:native:/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-gnome/gtk-doc/gtk-doc_1.35.1.bb:do_create_spdx_setscene)
NOTE: recipe vulkan-loader-1.4.341.0-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 1149 of 1574 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-gnome/gobject-introspection/gobject-introspection_1.86.0.bb:do_create_recipe_spdx_setscene)
NOTE: recipe xkeyboard-config-2.47-r0: task do_recipe_qa_setscene: Started
NOTE: Running setscene task 1150 of 1574 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/xorg-lib/libpciaccess_0.19.bb:do_packagedata_setscene)
NOTE: recipe libpng-1.6.58-r0: task do_create_recipe_spdx_setscene: Succeeded
NOTE: recipe libxdamage-1_1.1.7-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 1151 of 1574 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/clang/libcxx_git.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 1152 of 1574 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-connectivity/openssl/openssl_3.5.6.bb:do_create_spdx_setscene)
NOTE: recipe util-linux-2.41.3-r0: task do_create_recipe_spdx_setscene: Succeeded
NOTE: recipe libunistring-1.4.2-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 1154 of 1574 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/xorg-lib/libxcb_1.17.0.bb:do_create_recipe_spdx_setscene)
NOTE: recipe shared-mime-info-2.4-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: Running setscene task 1156 of 1574 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/xorg-lib/libice_1.1.2.bb:do_packagedata_setscene)
NOTE: recipe libxxf86vm-1_1.1.7-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 1160 of 1574 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-extended/libidn/libidn2_2.3.8.bb:do_recipe_qa_setscene)
NOTE: recipe zstd-1.5.7-r0: task do_create_spdx_setscene: Started
NOTE: recipe shadow-sysroot-4.6-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe libunistring-1.4.2-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 1162 of 1574 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/rust/libstd-rs_1.96.0.bb:do_recipe_qa_setscene)
NOTE: Running setscene task 1163 of 1574 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-gnome/gdk-pixbuf/gdk-pixbuf_2.44.6.bb:do_recipe_qa_setscene)
NOTE: recipe pango-1.57.1-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe libpciaccess-0.19-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 1164 of 1574 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/bash-completion/bash-completion_2.17.0.bb:do_create_spdx_setscene)
NOTE: Running setscene task 1166 of 1574 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-extended/xz/xz_5.8.3.bb:do_create_spdx_setscene)
NOTE: recipe xkeyboard-config-2.47-r0: task do_recipe_qa_setscene: Succeeded
NOTE: Running setscene task 1167 of 1574 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-core/dbus/dbus_1.16.2.bb:do_populate_sysroot_setscene)
NOTE: recipe shared-mime-info-2.4-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: recipe libpciaccess-0.19-r0: task do_packagedata_setscene: Started
NOTE: Running setscene task 1168 of 1574 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/clang/libcxx_git.bb:do_packagedata_setscene)
NOTE: recipe libcxx-22.1.7-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe gobject-introspection-1.86.0-r0: task do_create_recipe_spdx_setscene: Started
NOTE: recipe zstd-1.5.7-r0: task do_create_spdx_setscene: Succeeded
NOTE: recipe libxcb-1.17.0-r0: task do_create_recipe_spdx_setscene: Started
NOTE: recipe openssl-3.5.6-r0: task do_create_spdx_setscene: Started
NOTE: recipe gtk-doc-native-1.35.1-r0: task do_create_spdx_setscene: Started
NOTE: Running setscene task 1170 of 1574 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/shared-mime-info/shared-mime-info_2.4.bb:do_recipe_qa_setscene)
NOTE: recipe libice-1_1.1.2-r0: task do_packagedata_setscene: Started
NOTE: recipe libidn2-2.3.8-r0: task do_recipe_qa_setscene: Started
NOTE: recipe libstd-rs-1.96.0-r0: task do_recipe_qa_setscene: Started
NOTE: recipe bash-completion-2.17.0-r0: task do_create_spdx_setscene: Started
NOTE: recipe gdk-pixbuf-2.44.6-r0: task do_recipe_qa_setscene: Started
NOTE: recipe xz-5.8.3-r0: task do_create_spdx_setscene: Started
NOTE: recipe shadow-4.19.4-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe gtk-doc-native-1.35.1-r0: task do_create_spdx_setscene: Succeeded
NOTE: recipe gobject-introspection-1.86.0-r0: task do_create_recipe_spdx_setscene: Succeeded
NOTE: Running setscene task 1173 of 1574 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-core/zlib/zlib_1.3.2.bb:do_create_spdx_setscene)
NOTE: recipe libxcb-1.17.0-r0: task do_create_recipe_spdx_setscene: Succeeded
NOTE: recipe dbus-1.16.2-r0: task do_populate_sysroot_setscene: Started
NOTE: Running setscene task 1174 of 1574 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/xorg-lib/libxi_1.8.3.bb:do_recipe_qa_setscene)
NOTE: Running setscene task 1176 of 1574 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/xorg-lib/libxft_2.3.9.bb:do_recipe_qa_setscene)
NOTE: recipe libidn2-2.3.8-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe libcxx-22.1.7-r0: task do_packagedata_setscene: Started
NOTE: Running setscene task 1179 of 1574 (virtual:native:/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/cargo-c/cargo-c_0.10.22+cargo-0.96.0.bb:do_recipe_qa_setscene)
NOTE: Running setscene task 1180 of 1574 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/xorg-lib/libxfixes_6.0.2.bb:do_packagedata_setscene)
NOTE: recipe openssl-3.5.6-r0: task do_create_spdx_setscene: Succeeded
NOTE: recipe libpciaccess-0.19-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 1181 of 1574 (virtual:native:/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-gnome/gtk-doc/gtk-doc_1.35.1.bb:do_create_recipe_spdx_setscene)
NOTE: Running setscene task 1183 of 1574 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-core/expat/expat_2.8.1.bb:do_create_spdx_setscene)
NOTE: recipe shared-mime-info-2.4-r0: task do_recipe_qa_setscene: Started
NOTE: recipe libstd-rs-1.96.0-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe libice-1_1.1.2-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 1184 of 1574 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-kernel/kmod/kmod_34.2.bb:do_packagedata_setscene)
NOTE: Running setscene task 1188 of 1574 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-multimedia/alsa/alsa-lib_1.2.15.3.bb:do_deploy_source_date_epoch_setscene)
NOTE: recipe gdk-pixbuf-2.44.6-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe bash-completion-2.17.0-r0: task do_create_spdx_setscene: Succeeded
NOTE: Running setscene task 1192 of 1574 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-kernel/kmod/kmod_34.2.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 1198 of 1574 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/xorg-util/util-macros_1.20.2.bb:do_create_spdx_setscene)
NOTE: recipe xz-5.8.3-r0: task do_create_spdx_setscene: Succeeded
NOTE: Running setscene task 1202 of 1574 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/jpeg/libjpeg-turbo_3.1.4.1.bb:do_recipe_qa_setscene)
NOTE: recipe zlib-1.3.2-r0: task do_create_spdx_setscene: Started
NOTE: recipe shared-mime-info-2.4-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe libxft-1_2.3.9-r0: task do_recipe_qa_setscene: Started
NOTE: recipe libxi-1_1.8.3-r0: task do_recipe_qa_setscene: Started
NOTE: Running setscene task 1203 of 1574 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/xorg-proto/xorgproto_2025.1.bb:do_create_spdx_setscene)
NOTE: recipe libxfixes-1_6.0.2-r0: task do_packagedata_setscene: Started
NOTE: recipe libcxx-22.1.7-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe expat-2.8.1-r0: task do_create_spdx_setscene: Started
NOTE: Running setscene task 1205 of 1574 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/drm/libdrm_2.4.133.bb:do_recipe_qa_setscene)
NOTE: recipe alsa-lib-1.2.15.3-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe gtk-doc-native-1.35.1-r0: task do_create_recipe_spdx_setscene: Started
NOTE: recipe kmod-34.2-r0: task do_packagedata_setscene: Started
NOTE: recipe util-macros-1_1.20.2-r0: task do_create_spdx_setscene: Started
NOTE: recipe kmod-34.2-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe libjpeg-turbo-1_3.1.4.1-r0: task do_recipe_qa_setscene: Started
NOTE: recipe libxi-1_1.8.3-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe libxft-1_2.3.9-r0: task do_recipe_qa_setscene: Succeeded
NOTE: Running setscene task 1206 of 1574 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/xorg-lib/libxfixes_6.0.2.bb:do_populate_sysroot_setscene)
NOTE: recipe zlib-1.3.2-r0: task do_create_spdx_setscene: Succeeded
NOTE: recipe dbus-1.16.2-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 1210 of 1574 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-core/readline/readline_8.3.bb:do_recipe_qa_setscene)
NOTE: Running setscene task 1212 of 1574 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/wayland/wayland_1.25.0.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 1213 of 1574 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/wayland/wayland_1.25.0.bb:do_packagedata_setscene)
NOTE: recipe xorgproto-2025.1-r0: task do_create_spdx_setscene: Started
NOTE: recipe expat-2.8.1-r0: task do_create_spdx_setscene: Succeeded
NOTE: recipe alsa-lib-1.2.15.3-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: recipe gtk-doc-native-1.35.1-r0: task do_create_recipe_spdx_setscene: Succeeded
NOTE: Running setscene task 1218 of 1574 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-extended/bzip2/bzip2_1.0.8.bb:do_create_spdx_setscene)
NOTE: recipe libcxx-22.1.7-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 1222 of 1574 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-core/udev/eudev_3.2.14.bb:do_recipe_qa_setscene)
NOTE: Running setscene task 1223 of 1574 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-core/base-passwd/base-passwd_3.6.8.bb:do_recipe_qa_setscene)
NOTE: Running setscene task 1224 of 1574 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/cairo/cairo_1.18.4.bb:do_populate_sysroot_setscene)
NOTE: recipe libxfixes-1_6.0.2-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 1225 of 1574 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-multimedia/libsndfile/libsndfile1_1.2.2.bb:do_recipe_qa_setscene)
NOTE: recipe util-macros-1_1.20.2-r0: task do_create_spdx_setscene: Succeeded
NOTE: recipe libdrm-2.4.133-r0: task do_recipe_qa_setscene: Started
NOTE: recipe libjpeg-turbo-1_3.1.4.1-r0: task do_recipe_qa_setscene: Succeeded
NOTE: Running setscene task 1226 of 1574 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/xorg-lib/libxdamage_1.1.7.bb:do_recipe_qa_setscene)
NOTE: Running setscene task 1227 of 1574 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/xorg-lib/libxxf86vm_1.1.7.bb:do_recipe_qa_setscene)
NOTE: recipe cargo-c-native-0.10.22+cargo-0.96.0-r0: task do_recipe_qa_setscene: Started
NOTE: recipe libxfixes-1_6.0.2-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe readline-8.3-r0: task do_recipe_qa_setscene: Started
NOTE: recipe kmod-34.2-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe xorgproto-2025.1-r0: task do_create_spdx_setscene: Succeeded
NOTE: Running setscene task 1228 of 1574 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/vulkan/vulkan-loader_1.4.341.0.bb:do_recipe_qa_setscene)
NOTE: Running setscene task 1229 of 1574 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-extended/shadow/shadow_4.19.4.bb:do_populate_sysroot_setscene)
NOTE: recipe wayland-1.25.0-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe wayland-1.25.0-r0: task do_packagedata_setscene: Started
NOTE: recipe kmod-34.2-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 1230 of 1574 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/xorg-lib/libxrandr_1.5.5.bb:do_packagedata_setscene)
NOTE: recipe cargo-c-native-0.10.22+cargo-0.96.0-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe libdrm-2.4.133-r0: task do_recipe_qa_setscene: Succeeded
NOTE: Running setscene task 1231 of 1574 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/python/python3_3.14.5.bb:do_create_recipe_spdx_setscene)
NOTE: Running setscene task 1232 of 1574 (virtual:native:/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/libical/libical_3.0.20.bb:do_recipe_qa_setscene)
NOTE: recipe base-passwd-3.6.8-r0: task do_recipe_qa_setscene: Started
NOTE: recipe bzip2-1.0.8-r0: task do_create_spdx_setscene: Started
NOTE: recipe eudev-3.2.14-r0: task do_recipe_qa_setscene: Started
NOTE: recipe libsndfile1-1.2.2-r0: task do_recipe_qa_setscene: Started
NOTE: recipe cairo-1.18.4-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe libxdamage-1_1.1.7-r0: task do_recipe_qa_setscene: Started
NOTE: recipe libxxf86vm-1_1.1.7-r0: task do_recipe_qa_setscene: Started
NOTE: recipe readline-8.3-r0: task do_recipe_qa_setscene: Succeeded
NOTE: Running setscene task 1236 of 1574 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/xorg-app/xrandr_1.5.4.bb:do_recipe_qa_setscene)
NOTE: recipe vulkan-loader-1.4.341.0-r0: task do_recipe_qa_setscene: Started
NOTE: recipe shadow-4.19.4-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe base-passwd-3.6.8-r0: task do_recipe_qa_setscene: Succeeded
NOTE: Running setscene task 1237 of 1574 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/vulkan/vulkan-headers_1.4.341.0.bb:do_populate_sysroot_setscene)
NOTE: recipe eudev-3.2.14-r0: task do_recipe_qa_setscene: Succeeded
NOTE: Running setscene task 1238 of 1574 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-core/initscripts/initscripts_1.0.bb:do_packagedata_setscene)
NOTE: recipe libsndfile1-1.2.2-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe libxfixes-1_6.0.2-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe libxrandr-1_1.5.5-r0: task do_packagedata_setscene: Started
NOTE: Running setscene task 1240 of 1574 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-core/initscripts/initscripts_1.0.bb:do_populate_sysroot_setscene)
NOTE: recipe libxdamage-1_1.1.7-r0: task do_recipe_qa_setscene: Succeeded
NOTE: Running setscene task 1242 of 1574 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/libunistring/libunistring_1.4.2.bb:do_recipe_qa_setscene)
NOTE: recipe wayland-1.25.0-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe bzip2-1.0.8-r0: task do_create_spdx_setscene: Succeeded
NOTE: recipe libxxf86vm-1_1.1.7-r0: task do_recipe_qa_setscene: Succeeded
NOTE: Running setscene task 1243 of 1574 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-multimedia/libvorbis/libvorbis_1.3.7.bb:do_recipe_qa_setscene)
NOTE: Running setscene task 1244 of 1574 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/attr/attr_2.5.2.bb:do_packagedata_setscene)
NOTE: Running setscene task 1246 of 1574 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/xorg-proto/xorgproto_2025.1.bb:do_create_recipe_spdx_setscene)
NOTE: Running setscene task 1248 of 1574 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/bash-completion/bash-completion_2.17.0.bb:do_create_recipe_spdx_setscene)
NOTE: recipe wayland-1.25.0-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 1253 of 1574 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/xorg-lib/libxrandr_1.5.5.bb:do_populate_sysroot_setscene)
NOTE: recipe xrandr-1_1.5.4-r0: task do_recipe_qa_setscene: Started
NOTE: recipe libical-native-3.0.20-r0: task do_recipe_qa_setscene: Started
NOTE: recipe python3-3.14.5-r0: task do_create_recipe_spdx_setscene: Started
NOTE: recipe vulkan-loader-1.4.341.0-r0: task do_recipe_qa_setscene: Succeeded
NOTE: Running setscene task 1256 of 1574 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/cairo/cairo_1.18.4.bb:do_packagedata_setscene)
NOTE: recipe initscripts-1.0-r0: task do_packagedata_setscene: Started
NOTE: recipe vulkan-headers-1.4.341.0-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe initscripts-1.0-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe libunistring-1.4.2-r0: task do_recipe_qa_setscene: Started
NOTE: recipe libvorbis-1.3.7-r0: task do_recipe_qa_setscene: Started
NOTE: recipe bash-completion-2.17.0-r0: task do_create_recipe_spdx_setscene: Started
NOTE: recipe libxrandr-1_1.5.5-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe cairo-1.18.4-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe xrandr-1_1.5.4-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe libical-native-3.0.20-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe attr-2.5.2-r0: task do_packagedata_setscene: Started
NOTE: recipe xorgproto-2025.1-r0: task do_create_recipe_spdx_setscene: Started
NOTE: Running setscene task 1257 of 1574 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/xorg-lib/libxshmfence_1.3.3.bb:do_recipe_qa_setscene)
NOTE: Running setscene task 1258 of 1574 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-multimedia/flac/flac_1.5.0.bb:do_recipe_qa_setscene)
NOTE: Running setscene task 1260 of 1574 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/vulkan/vulkan-headers_1.4.341.0.bb:do_packagedata_setscene)
NOTE: Running setscene task 1261 of 1574 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/fribidi/fribidi_1.0.16.bb:do_recipe_qa_setscene)
NOTE: recipe shadow-4.19.4-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe libxrandr-1_1.5.5-r0: task do_populate_sysroot_setscene: Started
NOTE: Running setscene task 1262 of 1574 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-multimedia/alsa/alsa-lib_1.2.15.3.bb:do_recipe_qa_setscene)
NOTE: recipe python3-3.14.5-r0: task do_create_recipe_spdx_setscene: Succeeded
NOTE: Running setscene task 1263 of 1574 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-kernel/kmod/kmod_34.2.bb:do_recipe_qa_setscene)
NOTE: recipe cairo-1.18.4-r0: task do_packagedata_setscene: Started
NOTE: recipe libunistring-1.4.2-r0: task do_recipe_qa_setscene: Succeeded
NOTE: Running setscene task 1264 of 1574 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-core/dbus/dbus_1.16.2.bb:do_recipe_qa_setscene)
NOTE: recipe libvorbis-1.3.7-r0: task do_recipe_qa_setscene: Succeeded
NOTE: Running setscene task 1265 of 1574 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/icu/icu_78.3.bb:do_deploy_source_date_epoch_setscene)
NOTE: recipe bash-completion-2.17.0-r0: task do_create_recipe_spdx_setscene: Succeeded
NOTE: Running setscene task 1266 of 1574 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/xorg-lib/libsm_1.2.6.bb:do_populate_sysroot_setscene)
NOTE: recipe initscripts-1.0-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe libxshmfence-1.3.3-r0: task do_recipe_qa_setscene: Started
NOTE: Running setscene task 1267 of 1574 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/harfbuzz/harfbuzz_14.2.0.bb:do_recipe_qa_setscene)
NOTE: recipe xorgproto-2025.1-r0: task do_create_recipe_spdx_setscene: Succeeded
NOTE: recipe flac-1.5.0-r0: task do_recipe_qa_setscene: Started
NOTE: Running setscene task 1268 of 1574 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/clang/compiler-rt_git.bb:do_populate_sysroot_setscene)
NOTE: recipe vulkan-headers-1.4.341.0-r0: task do_packagedata_setscene: Started
NOTE: recipe initscripts-1.0-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe alsa-lib-1.2.15.3-r0: task do_recipe_qa_setscene: Started
NOTE: recipe fribidi-1.0.16-r0: task do_recipe_qa_setscene: Started
NOTE: Running setscene task 1270 of 1574 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/libtool/libtool-cross_2.5.4.bb:do_create_spdx_setscene)
NOTE: recipe kmod-34.2-r0: task do_recipe_qa_setscene: Started
NOTE: recipe libxrandr-1_1.5.5-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 1271 of 1574 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/clang/compiler-rt_git.bb:do_packagedata_setscene)
NOTE: recipe attr-2.5.2-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 1272 of 1574 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/xorg-util/util-macros_1.20.2.bb:do_create_recipe_spdx_setscene)
NOTE: recipe libxshmfence-1.3.3-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe vulkan-headers-1.4.341.0-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe cairo-1.18.4-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 1277 of 1574 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-core/expat/expat_2.8.1.bb:do_create_recipe_spdx_setscene)
NOTE: recipe flac-1.5.0-r0: task do_recipe_qa_setscene: Succeeded
NOTE: Running setscene task 1278 of 1574 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/clang/libcxx_git.bb:do_recipe_qa_setscene)
NOTE: Running setscene task 1280 of 1574 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/opkg-utils/opkg-utils_0.7.0.bb:do_create_spdx_setscene)
NOTE: recipe fribidi-1.0.16-r0: task do_recipe_qa_setscene: Succeeded
NOTE: Running setscene task 1281 of 1574 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-extended/shadow/shadow_4.19.4.bb:do_recipe_qa_setscene)
NOTE: recipe dbus-1.16.2-r0: task do_recipe_qa_setscene: Started
NOTE: recipe icu-78.3-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe libsm-1_1.2.6-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe alsa-lib-1.2.15.3-r0: task do_recipe_qa_setscene: Succeeded
NOTE: Running setscene task 1282 of 1574 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-core/libxml/libxml2_2.15.3.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 1284 of 1574 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-connectivity/openssl/openssl_3.5.6.bb:do_create_recipe_spdx_setscene)
NOTE: recipe libtool-cross-2.5.4-r0: task do_create_spdx_setscene: Started
NOTE: recipe harfbuzz-14.2.0-r0: task do_recipe_qa_setscene: Started
NOTE: recipe compiler-rt-22.1.7-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe kmod-34.2-r0: task do_recipe_qa_setscene: Succeeded
NOTE: Running setscene task 1287 of 1574 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-extended/zstd/zstd_1.5.7.bb:do_create_recipe_spdx_setscene)
NOTE: recipe vulkan-headers-1.4.341.0-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 1288 of 1574 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-extended/xz/xz_5.8.3.bb:do_create_recipe_spdx_setscene)
NOTE: recipe compiler-rt-22.1.7-r0: task do_packagedata_setscene: Started
NOTE: recipe util-macros-1_1.20.2-r0: task do_create_recipe_spdx_setscene: Started
NOTE: recipe dbus-1.16.2-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe icu-78.3-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: Running setscene task 1292 of 1574 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/attr/attr_2.5.2.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 1293 of 1574 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-core/base-files/base-files_3.0.14.bb:do_deploy_source_date_epoch_setscene)
NOTE: recipe opkg-utils-0.7.0-r0: task do_create_spdx_setscene: Started
NOTE: recipe harfbuzz-14.2.0-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe libcxx-22.1.7-r0: task do_recipe_qa_setscene: Started
NOTE: recipe expat-2.8.1-r0: task do_create_recipe_spdx_setscene: Started
NOTE: Running setscene task 1295 of 1574 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-core/libxml/libxml2_2.15.3.bb:do_packagedata_setscene)
NOTE: recipe shadow-4.19.4-r0: task do_recipe_qa_setscene: Started
NOTE: recipe libtool-cross-2.5.4-r0: task do_create_spdx_setscene: Succeeded
NOTE: Running setscene task 1296 of 1574 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-core/zlib/zlib_1.3.2.bb:do_create_recipe_spdx_setscene)
NOTE: recipe libxml2-2.15.3-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe zstd-1.5.7-r0: task do_create_recipe_spdx_setscene: Started
NOTE: recipe openssl-3.5.6-r0: task do_create_recipe_spdx_setscene: Started
NOTE: recipe libsm-1_1.2.6-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 1300 of 1574 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/xorg-lib/libxfixes_6.0.2.bb:do_recipe_qa_setscene)
NOTE: recipe xz-5.8.3-r0: task do_create_recipe_spdx_setscene: Started
NOTE: recipe compiler-rt-22.1.7-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe util-macros-1_1.20.2-r0: task do_create_recipe_spdx_setscene: Succeeded
NOTE: Running setscene task 1301 of 1574 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/xorg-lib/libpciaccess_0.19.bb:do_recipe_qa_setscene)
NOTE: Running setscene task 1302 of 1574 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-extended/bzip2/bzip2_1.0.8.bb:do_create_recipe_spdx_setscene)
NOTE: recipe libcxx-22.1.7-r0: task do_recipe_qa_setscene: Succeeded
NOTE: Running setscene task 1303 of 1574 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/xorg-lib/libxrender_0.9.12.bb:do_populate_sysroot_setscene)
NOTE: recipe opkg-utils-0.7.0-r0: task do_create_spdx_setscene: Succeeded
NOTE: recipe base-files-3.0.14-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe shadow-4.19.4-r0: task do_recipe_qa_setscene: Succeeded
NOTE: Running setscene task 1307 of 1574 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/xorg-lib/libxext_1.3.7.bb:do_packagedata_setscene)
NOTE: recipe expat-2.8.1-r0: task do_create_recipe_spdx_setscene: Succeeded
NOTE: recipe compiler-rt-22.1.7-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 1308 of 1574 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-core/glib-2.0/glib-2.0_2.88.0.bb:do_populate_sysroot_setscene)
NOTE: recipe attr-2.5.2-r0: task do_populate_sysroot_setscene: Started
NOTE: Running setscene task 1310 of 1574 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/xorg-lib/libsm_1.2.6.bb:do_recipe_qa_setscene)
NOTE: Running setscene task 1311 of 1574 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/xorg-lib/pixman_0.46.4.bb:do_packagedata_setscene)
NOTE: recipe openssl-3.5.6-r0: task do_create_recipe_spdx_setscene: Succeeded
NOTE: recipe libxml2-2.15.3-r0: task do_packagedata_setscene: Started
NOTE: recipe zlib-1.3.2-r0: task do_create_recipe_spdx_setscene: Started
NOTE: Running setscene task 1312 of 1574 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/xorg-lib/libice_1.1.2.bb:do_populate_sysroot_setscene)
NOTE: recipe zstd-1.5.7-r0: task do_create_recipe_spdx_setscene: Succeeded
NOTE: Running setscene task 1313 of 1574 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/gcc/gcc-runtime_16.1.bb:do_create_spdx_setscene)
NOTE: recipe xz-5.8.3-r0: task do_create_recipe_spdx_setscene: Succeeded
NOTE: Running setscene task 1314 of 1574 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/icu/icu_78.3.bb:do_recipe_qa_setscene)
NOTE: recipe libxfixes-1_6.0.2-r0: task do_recipe_qa_setscene: Started
NOTE: recipe base-files-3.0.14-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: Running setscene task 1317 of 1574 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/xorg-lib/libxext_1.3.7.bb:do_populate_sysroot_setscene)
NOTE: recipe libxml2-2.15.3-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe libpciaccess-0.19-r0: task do_recipe_qa_setscene: Started
NOTE: Running setscene task 1318 of 1574 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/fontconfig/fontconfig_2.17.1.bb:do_packagedata_setscene)
NOTE: recipe libxrender-1_0.9.12-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe bzip2-1.0.8-r0: task do_create_recipe_spdx_setscene: Started
NOTE: recipe libxext-1_1.3.7-r0: task do_packagedata_setscene: Started
NOTE: recipe libsm-1_1.2.6-r0: task do_recipe_qa_setscene: Started
NOTE: recipe zlib-1.3.2-r0: task do_create_recipe_spdx_setscene: Succeeded
NOTE: recipe pixman-1_0.46.4-r0: task do_packagedata_setscene: Started
NOTE: Running setscene task 1319 of 1574 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/fontconfig/fontconfig_2.17.1.bb:do_populate_sysroot_setscene)
NOTE: recipe glib-2.0-1_2.88.0-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe libice-1_1.1.2-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe libxfixes-1_6.0.2-r0: task do_recipe_qa_setscene: Succeeded
NOTE: Running setscene task 1320 of 1574 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-core/base-files/base-files_3.0.14.bb:do_recipe_qa_setscene)
NOTE: recipe attr-2.5.2-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe gcc-runtime-16.1.0-r0: task do_create_spdx_setscene: Started
NOTE: Running setscene task 1321 of 1574 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/wayland/wayland_1.25.0.bb:do_recipe_qa_setscene)
NOTE: recipe libpciaccess-0.19-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe libxml2-2.15.3-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe icu-78.3-r0: task do_recipe_qa_setscene: Started
NOTE: Running setscene task 1322 of 1574 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/xorg-lib/libxrandr_1.5.5.bb:do_recipe_qa_setscene)
NOTE: Running setscene task 1323 of 1574 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/vulkan/vulkan-headers_1.4.341.0.bb:do_recipe_qa_setscene)
NOTE: recipe libxext-1_1.3.7-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe libsm-1_1.2.6-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe bzip2-1.0.8-r0: task do_create_recipe_spdx_setscene: Succeeded
NOTE: Running setscene task 1324 of 1574 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/xorg-lib/pixman_0.46.4.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 1328 of 1574 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/xorg-lib/libxrender_0.9.12.bb:do_packagedata_setscene)
NOTE: recipe fontconfig-2.17.1-r0: task do_packagedata_setscene: Started
NOTE: recipe libxext-1_1.3.7-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 1330 of 1574 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-multimedia/libogg/libogg_1.3.6.bb:do_recipe_qa_setscene)
NOTE: recipe fontconfig-2.17.1-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe base-files-3.0.14-r0: task do_recipe_qa_setscene: Started
NOTE: recipe pixman-1_0.46.4-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 1331 of 1574 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/clang/compiler-rt_git.bb:do_recipe_qa_setscene)
NOTE: recipe libxrender-1_0.9.12-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe icu-78.3-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe gcc-runtime-16.1.0-r0: task do_create_spdx_setscene: Succeeded
NOTE: Running setscene task 1333 of 1574 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-core/initscripts/initscripts_1.0.bb:do_recipe_qa_setscene)
NOTE: Running setscene task 1334 of 1574 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-core/glib-2.0/glib-2.0_2.88.0.bb:do_packagedata_setscene)
NOTE: Running setscene task 1336 of 1574 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/libtool/libtool-cross_2.5.4.bb:do_create_recipe_spdx_setscene)
NOTE: recipe wayland-1.25.0-r0: task do_recipe_qa_setscene: Started
NOTE: recipe libice-1_1.1.2-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe libxrandr-1_1.5.5-r0: task do_recipe_qa_setscene: Started
NOTE: recipe vulkan-headers-1.4.341.0-r0: task do_recipe_qa_setscene: Started
NOTE: Running setscene task 1338 of 1574 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/attr/attr_2.5.2.bb:do_recipe_qa_setscene)
NOTE: recipe libxrender-1_0.9.12-r0: task do_packagedata_setscene: Started
NOTE: recipe pixman-1_0.46.4-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe base-files-3.0.14-r0: task do_recipe_qa_setscene: Succeeded
NOTE: Running setscene task 1342 of 1574 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/opkg-utils/opkg-utils_0.7.0.bb:do_create_recipe_spdx_setscene)
NOTE: recipe libogg-1.3.6-r0: task do_recipe_qa_setscene: Started
NOTE: recipe fontconfig-2.17.1-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe libxext-1_1.3.7-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 1343 of 1574 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-core/musl/musl_git.bb:do_create_spdx_setscene)
NOTE: Running setscene task 1345 of 1574 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/cairo/cairo_1.18.4.bb:do_recipe_qa_setscene)
NOTE: recipe glib-2.0-1_2.88.0-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe libtool-cross-2.5.4-r0: task do_create_recipe_spdx_setscene: Started
NOTE: recipe initscripts-1.0-r0: task do_recipe_qa_setscene: Started
NOTE: recipe compiler-rt-22.1.7-r0: task do_recipe_qa_setscene: Started
NOTE: Running setscene task 1347 of 1574 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/xorg-lib/libxext_1.3.7.bb:do_recipe_qa_setscene)
NOTE: recipe libxrandr-1_1.5.5-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe wayland-1.25.0-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe vulkan-headers-1.4.341.0-r0: task do_recipe_qa_setscene: Succeeded
NOTE: Running setscene task 1348 of 1574 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/freetype/freetype_2.14.3.bb:do_packagedata_setscene)
NOTE: Running setscene task 1350 of 1574 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/xorg-lib/libice_1.1.2.bb:do_recipe_qa_setscene)
NOTE: Running setscene task 1351 of 1574 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-core/libxml/libxml2_2.15.3.bb:do_recipe_qa_setscene)
NOTE: recipe glib-2.0-1_2.88.0-r0: task do_packagedata_setscene: Started
NOTE: recipe fontconfig-2.17.1-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe attr-2.5.2-r0: task do_recipe_qa_setscene: Started
NOTE: Running setscene task 1352 of 1574 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/freetype/freetype_2.14.3.bb:do_populate_sysroot_setscene)
NOTE: recipe libogg-1.3.6-r0: task do_recipe_qa_setscene: Succeeded
NOTE: Running setscene task 1354 of 1574 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/fontconfig/fontconfig_2.17.1.bb:do_recipe_qa_setscene)
NOTE: recipe opkg-utils-0.7.0-r0: task do_create_recipe_spdx_setscene: Started
NOTE: recipe libxrender-1_0.9.12-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe initscripts-1.0-r0: task do_recipe_qa_setscene: Succeeded
NOTE: Running setscene task 1357 of 1574 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/xorg-lib/libx11_1.8.13.bb:do_populate_sysroot_setscene)
NOTE: recipe compiler-rt-22.1.7-r0: task do_recipe_qa_setscene: Succeeded
NOTE: Running setscene task 1358 of 1574 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/xorg-lib/libx11_1.8.13.bb:do_packagedata_setscene)
NOTE: Running setscene task 1359 of 1574 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/xorg-lib/libxrender_0.9.12.bb:do_recipe_qa_setscene)
NOTE: recipe libtool-cross-2.5.4-r0: task do_create_recipe_spdx_setscene: Succeeded
NOTE: recipe musl-1.2.6+git-r0: task do_create_spdx_setscene: Started
NOTE: recipe libxext-1_1.3.7-r0: task do_recipe_qa_setscene: Started
NOTE: recipe pixman-1_0.46.4-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe cairo-1.18.4-r0: task do_recipe_qa_setscene: Started
NOTE: recipe libice-1_1.1.2-r0: task do_recipe_qa_setscene: Started
NOTE: recipe attr-2.5.2-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe freetype-2.14.3-r0: task do_packagedata_setscene: Started
NOTE: recipe libxml2-2.15.3-r0: task do_recipe_qa_setscene: Started
NOTE: recipe freetype-2.14.3-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe opkg-utils-0.7.0-r0: task do_create_recipe_spdx_setscene: Succeeded
NOTE: recipe fontconfig-2.17.1-r0: task do_recipe_qa_setscene: Started
NOTE: recipe libxext-1_1.3.7-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe libx11-1_1.8.13-r0: task do_populate_sysroot_setscene: Started
NOTE: Running setscene task 1360 of 1574 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/gcc/gcc-runtime_16.1.bb:do_create_recipe_spdx_setscene)
NOTE: recipe musl-1.2.6+git-r0: task do_create_spdx_setscene: Succeeded
NOTE: recipe libx11-1_1.8.13-r0: task do_packagedata_setscene: Started
NOTE: recipe libxrender-1_0.9.12-r0: task do_recipe_qa_setscene: Started
NOTE: recipe cairo-1.18.4-r0: task do_recipe_qa_setscene: Succeeded
NOTE: Running setscene task 1364 of 1574 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/xorg-lib/pixman_0.46.4.bb:do_recipe_qa_setscene)
NOTE: recipe libice-1_1.1.2-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe libxml2-2.15.3-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe freetype-2.14.3-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 1369 of 1574 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-multimedia/libpng/libpng_1.6.58.bb:do_packagedata_setscene)
NOTE: recipe fontconfig-2.17.1-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe libxrender-1_0.9.12-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe pixman-1_0.46.4-r0: task do_recipe_qa_setscene: Started
NOTE: recipe freetype-2.14.3-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe libx11-1_1.8.13-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe gcc-runtime-16.1.0-r0: task do_create_recipe_spdx_setscene: Started
NOTE: Running setscene task 1371 of 1574 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-multimedia/libpng/libpng_1.6.58.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 1373 of 1574 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/xorg-lib/xtrans_1.6.0.bb:do_packagedata_setscene)
NOTE: Running setscene task 1374 of 1574 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/freetype/freetype_2.14.3.bb:do_recipe_qa_setscene)
NOTE: Running setscene task 1375 of 1574 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/xorg-lib/libxcb_1.17.0.bb:do_packagedata_setscene)
NOTE: recipe libx11-1_1.8.13-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 1376 of 1574 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/xorg-lib/libxcb_1.17.0.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 1377 of 1574 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/xorg-lib/xtrans_1.6.0.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 1379 of 1574 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/xorg-lib/libx11_1.8.13.bb:do_recipe_qa_setscene)
NOTE: recipe libpng-1.6.58-r0: task do_packagedata_setscene: Started
NOTE: recipe pixman-1_0.46.4-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe gcc-runtime-16.1.0-r0: task do_create_recipe_spdx_setscene: Succeeded
NOTE: Running setscene task 1381 of 1574 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-core/musl/musl_git.bb:do_create_recipe_spdx_setscene)
NOTE: recipe xtrans-1_1.6.0-r0: task do_packagedata_setscene: Started
NOTE: recipe libpng-1.6.58-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe libxcb-1.17.0-r0: task do_packagedata_setscene: Started
NOTE: recipe freetype-2.14.3-r0: task do_recipe_qa_setscene: Started
NOTE: recipe libxcb-1.17.0-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe xtrans-1_1.6.0-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe libx11-1_1.8.13-r0: task do_recipe_qa_setscene: Started
NOTE: recipe libpng-1.6.58-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe musl-1.2.6+git-r0: task do_create_recipe_spdx_setscene: Started
NOTE: recipe freetype-2.14.3-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe libx11-1_1.8.13-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe xtrans-1_1.6.0-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe libpng-1.6.58-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 1385 of 1574 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-multimedia/libpng/libpng_1.6.58.bb:do_recipe_qa_setscene)
NOTE: recipe glib-2.0-1_2.88.0-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe musl-1.2.6+git-r0: task do_create_recipe_spdx_setscene: Succeeded
NOTE: recipe xtrans-1_1.6.0-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 1387 of 1574 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-core/util-linux/util-linux_2.41.3.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 1388 of 1574 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-gnome/gobject-introspection/gobject-introspection_1.86.0.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 1389 of 1574 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/libpcre/libpcre2_10.47.bb:do_packagedata_setscene)
NOTE: Running setscene task 1390 of 1574 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-gnome/gobject-introspection/gobject-introspection_1.86.0.bb:do_packagedata_setscene)
NOTE: Running setscene task 1391 of 1574 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-core/util-linux/util-linux_2.41.3.bb:do_packagedata_setscene)
NOTE: Running setscene task 1393 of 1574 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-core/glib-2.0/glib-2.0_2.88.0.bb:do_recipe_qa_setscene)
NOTE: Running setscene task 1400 of 1574 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/xorg-lib/xtrans_1.6.0.bb:do_recipe_qa_setscene)
NOTE: recipe libxcb-1.17.0-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe libxcb-1.17.0-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 1402 of 1574 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/xorg-lib/libpthread-stubs_0.5.bb:do_packagedata_setscene)
NOTE: Running setscene task 1403 of 1574 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/xorg-proto/xcb-proto_1.17.0.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 1404 of 1574 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/xorg-lib/libxdmcp_1.1.5.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 1405 of 1574 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/xorg-proto/xcb-proto_1.17.0.bb:do_packagedata_setscene)
NOTE: Running setscene task 1406 of 1574 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/xorg-lib/libpthread-stubs_0.5.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 1407 of 1574 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/xorg-lib/libxdmcp_1.1.5.bb:do_packagedata_setscene)
NOTE: Running setscene task 1408 of 1574 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/xorg-lib/libxau_1.0.12.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 1410 of 1574 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/xorg-lib/libxcb_1.17.0.bb:do_recipe_qa_setscene)
NOTE: recipe libpng-1.6.58-r0: task do_recipe_qa_setscene: Started
NOTE: recipe libpcre2-10.47-r0: task do_packagedata_setscene: Started
NOTE: recipe xtrans-1_1.6.0-r0: task do_recipe_qa_setscene: Started
NOTE: recipe gobject-introspection-1.86.0-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe gobject-introspection-1.86.0-r0: task do_packagedata_setscene: Started
NOTE: recipe util-linux-2.41.3-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe glib-2.0-1_2.88.0-r0: task do_recipe_qa_setscene: Started
NOTE: recipe util-linux-2.41.3-r0: task do_packagedata_setscene: Started
NOTE: recipe libpthread-stubs-0.5-r0: task do_packagedata_setscene: Started
NOTE: recipe xcb-proto-1.17.0-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe libxdmcp-1_1.1.5-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe libpthread-stubs-0.5-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe libxdmcp-1_1.1.5-r0: task do_packagedata_setscene: Started
NOTE: recipe libxau-1_1.0.12-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe libxcb-1.17.0-r0: task do_recipe_qa_setscene: Started
NOTE: recipe libpng-1.6.58-r0: task do_recipe_qa_setscene: Succeeded
NOTE: Running setscene task 1411 of 1574 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/xorg-lib/libxau_1.0.12.bb:do_packagedata_setscene)
NOTE: recipe xcb-proto-1.17.0-r0: task do_packagedata_setscene: Started
NOTE: recipe xtrans-1_1.6.0-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe glib-2.0-1_2.88.0-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe libxcb-1.17.0-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe gobject-introspection-1.86.0-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 1413 of 1574 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/python/python3_3.14.5.bb:do_packagedata_setscene)
NOTE: recipe libpcre2-10.47-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe libpthread-stubs-0.5-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe libxau-1_1.0.12-r0: task do_packagedata_setscene: Started
NOTE: recipe libxdmcp-1_1.1.5-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe gobject-introspection-1.86.0-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe util-linux-2.41.3-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 1418 of 1574 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/python/python3_3.14.5.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 1420 of 1574 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-gnome/gobject-introspection/gobject-introspection_1.86.0.bb:do_recipe_qa_setscene)
NOTE: Running setscene task 1422 of 1574 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/libpcre/libpcre2_10.47.bb:do_populate_sysroot_setscene)
NOTE: recipe libpthread-stubs-0.5-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe libxdmcp-1_1.1.5-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 1425 of 1574 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/xorg-lib/libpthread-stubs_0.5.bb:do_recipe_qa_setscene)
NOTE: recipe xcb-proto-1.17.0-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe libxau-1_1.0.12-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 1427 of 1574 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/xorg-lib/libxdmcp_1.1.5.bb:do_recipe_qa_setscene)
NOTE: recipe xcb-proto-1.17.0-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 1430 of 1574 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/xorg-proto/xcb-proto_1.17.0.bb:do_recipe_qa_setscene)
NOTE: recipe libxau-1_1.0.12-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 1432 of 1574 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/xorg-proto/xorgproto_2025.1.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 1434 of 1574 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/xorg-util/util-macros_1.20.2.bb:do_packagedata_setscene)
NOTE: Running setscene task 1435 of 1574 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/xorg-lib/libxau_1.0.12.bb:do_recipe_qa_setscene)
NOTE: Running setscene task 1436 of 1574 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/xorg-proto/xorgproto_2025.1.bb:do_packagedata_setscene)
NOTE: Running setscene task 1437 of 1574 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/xorg-util/util-macros_1.20.2.bb:do_populate_sysroot_setscene)
NOTE: recipe python3-3.14.5-r0: task do_packagedata_setscene: Started
NOTE: recipe libpcre2-10.47-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe libpthread-stubs-0.5-r0: task do_recipe_qa_setscene: Started
NOTE: recipe gobject-introspection-1.86.0-r0: task do_recipe_qa_setscene: Started
NOTE: recipe libxdmcp-1_1.1.5-r0: task do_recipe_qa_setscene: Started
NOTE: recipe xcb-proto-1.17.0-r0: task do_recipe_qa_setscene: Started
NOTE: Running task 917 of 3619 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/icu/icu_78.3.bb:do_fetch)
NOTE: recipe python3-3.14.5-r0: task do_populate_sysroot_setscene: Started
NOTE: Running task 986 of 3619 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/shared-mime-info/shared-mime-info_2.4.bb:do_fetch)
NOTE: Running task 988 of 3619 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-gnome/gdk-pixbuf/gdk-pixbuf_2.44.6.bb:do_fetch)
NOTE: recipe gobject-introspection-1.86.0-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe libpthread-stubs-0.5-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe libxdmcp-1_1.1.5-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe util-macros-1_1.20.2-r0: task do_packagedata_setscene: Started
NOTE: recipe xorgproto-2025.1-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe libxau-1_1.0.12-r0: task do_recipe_qa_setscene: Started
NOTE: recipe util-macros-1_1.20.2-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe xcb-proto-1.17.0-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe xorgproto-2025.1-r0: task do_packagedata_setscene: Started
NOTE: recipe icu-78.3-r0: task do_fetch: Started
NOTE: recipe libpcre2-10.47-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 1439 of 1574 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/libpcre/libpcre2_10.47.bb:do_recipe_qa_setscene)
NOTE: recipe libxau-1_1.0.12-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe shared-mime-info-2.4-r0: task do_fetch: Started
NOTE: recipe gdk-pixbuf-2.44.6-r0: task do_fetch: Started
NOTE: recipe util-macros-1_1.20.2-r0: task do_packagedata_setscene: Succeeded
NOTE: Running task 1113 of 3619 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/shared-mime-info/shared-mime-info_2.4.bb:do_write_config)
NOTE: recipe xorgproto-2025.1-r0: task do_packagedata_setscene: Succeeded
NOTE: Running task 1120 of 3619 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-gnome/gdk-pixbuf/gdk-pixbuf_2.44.6.bb:do_write_config)
NOTE: recipe util-macros-1_1.20.2-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 1443 of 1574 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/xorg-util/util-macros_1.20.2.bb:do_recipe_qa_setscene)
NOTE: recipe xorgproto-2025.1-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 1445 of 1574 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/xorg-proto/xorgproto_2025.1.bb:do_recipe_qa_setscene)
NOTE: recipe libpcre2-10.47-r0: task do_recipe_qa_setscene: Started
NOTE: Running task 1171 of 3619 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-core/base-files/base-files_3.0.14.bb:do_fetch)
NOTE: Running task 1205 of 3619 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/vala/vala_0.56.19.bb:do_fetch)
NOTE: Running task 1210 of 3619 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/fribidi/fribidi_1.0.16.bb:do_fetch)
NOTE: Running task 1211 of 3619 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/harfbuzz/harfbuzz_14.2.0.bb:do_fetch)
NOTE: Running task 1215 of 3619 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/xorg-lib/libxft_2.3.9.bb:do_fetch)
NOTE: recipe shared-mime-info-2.4-r0: task do_write_config: Started
NOTE: recipe shared-mime-info-2.4-r0: task do_fetch: Succeeded
NOTE: recipe libpcre2-10.47-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe gdk-pixbuf-2.44.6-r0: task do_write_config: Started
NOTE: recipe util-macros-1_1.20.2-r0: task do_recipe_qa_setscene: Started
NOTE: recipe python3-3.14.5-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 1447 of 1574 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/gdbm/gdbm_1.26.bb:do_packagedata_setscene)
NOTE: Running setscene task 1448 of 1574 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/libffi/libffi_3.5.2.bb:do_packagedata_setscene)
NOTE: Running setscene task 1449 of 1574 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/libedit/libedit_20260512-3.1.bb:do_packagedata_setscene)
NOTE: recipe xorgproto-2025.1-r0: task do_recipe_qa_setscene: Started
NOTE: recipe base-files-3.0.14-r0: task do_fetch: Started
NOTE: recipe shared-mime-info-2.4-r0: task do_write_config: Succeeded
NOTE: recipe base-files-3.0.14-r0: task do_fetch: Succeeded
NOTE: Running setscene task 1450 of 1574 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-extended/bzip2/bzip2_1.0.8.bb:do_packagedata_setscene)
NOTE: Running setscene task 1451 of 1574 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-extended/xz/xz_5.8.3.bb:do_packagedata_setscene)
NOTE: recipe vala-0.56.19-r0: task do_fetch: Started
NOTE: recipe fribidi-1.0.16-r0: task do_fetch: Started
NOTE: recipe harfbuzz-14.2.0-r0: task do_fetch: Started
NOTE: recipe python3-3.14.5-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe gdk-pixbuf-2.44.6-r0: task do_write_config: Succeeded
NOTE: Running setscene task 1452 of 1574 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-extended/xz/xz_5.8.3.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 1453 of 1574 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-extended/zstd/zstd_1.5.7.bb:do_packagedata_setscene)
NOTE: recipe libxft-1_2.3.9-r0: task do_fetch: Started
NOTE: recipe util-macros-1_1.20.2-r0: task do_recipe_qa_setscene: Succeeded
NOTE: Running setscene task 1454 of 1574 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-connectivity/openssl/openssl_3.5.6.bb:do_populate_sysroot_setscene)
NOTE: recipe xorgproto-2025.1-r0: task do_recipe_qa_setscene: Succeeded
NOTE: Running setscene task 1455 of 1574 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/gdbm/gdbm_1.26.bb:do_populate_sysroot_setscene)
NOTE: recipe util-linux-2.41.3-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 1457 of 1574 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-core/expat/expat_2.8.1.bb:do_packagedata_setscene)
NOTE: recipe libffi-3.5.2-r0: task do_packagedata_setscene: Started
NOTE: recipe libedit-20260512-3.1-r0: task do_packagedata_setscene: Started
NOTE: recipe gdbm-1.26-r0: task do_packagedata_setscene: Started
NOTE: recipe bzip2-1.0.8-r0: task do_packagedata_setscene: Started
NOTE: recipe xz-5.8.3-r0: task do_packagedata_setscene: Started
NOTE: recipe zstd-1.5.7-r0: task do_packagedata_setscene: Started
NOTE: recipe xz-5.8.3-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe openssl-3.5.6-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe gdbm-1.26-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe expat-2.8.1-r0: task do_packagedata_setscene: Started
NOTE: recipe libffi-3.5.2-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe libedit-20260512-3.1-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 1458 of 1574 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-connectivity/openssl/openssl_3.5.6.bb:do_packagedata_setscene)
NOTE: Running setscene task 1460 of 1574 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/sqlite/sqlite3_3.53.0.bb:do_populate_sysroot_setscene)
NOTE: recipe bzip2-1.0.8-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 1461 of 1574 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/libcap-ng/libcap-ng_0.9.1.bb:do_packagedata_setscene)
NOTE: recipe zstd-1.5.7-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 1463 of 1574 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-extended/zstd/zstd_1.5.7.bb:do_populate_sysroot_setscene)
NOTE: recipe gdbm-1.26-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 1465 of 1574 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/libcap-ng/libcap-ng_0.9.1.bb:do_populate_sysroot_setscene)
NOTE: recipe xz-5.8.3-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 1466 of 1574 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-core/expat/expat_2.8.1.bb:do_populate_sysroot_setscene)
NOTE: recipe sqlite3-3_3.53.0-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe expat-2.8.1-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe gdbm-1.26-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 1467 of 1574 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/libffi/libffi_3.5.2.bb:do_populate_sysroot_setscene)
NOTE: recipe openssl-3.5.6-r0: task do_packagedata_setscene: Started
NOTE: Running setscene task 1468 of 1574 (virtual:native:/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-gnome/gtk-doc/gtk-doc_1.35.1.bb:do_populate_sysroot_setscene)
NOTE: recipe libcap-ng-0.9.1-r0: task do_packagedata_setscene: Started
NOTE: recipe zstd-1.5.7-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe xz-5.8.3-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 1469 of 1574 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-core/zlib/zlib_1.3.2.bb:do_populate_sysroot_setscene)
NOTE: recipe libcap-ng-0.9.1-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe openssl-3.5.6-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe expat-2.8.1-r0: task do_populate_sysroot_setscene: Started
NOTE: Running setscene task 1471 of 1574 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-extended/pam/libpam_1.7.2.bb:do_populate_sysroot_setscene)
NOTE: recipe libffi-3.5.2-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe gtk-doc-native-1.35.1-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe sqlite3-3_3.53.0-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe zlib-1.3.2-r0: task do_populate_sysroot_setscene: Started
NOTE: Running setscene task 1472 of 1574 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-extended/pam/libpam_1.7.2.bb:do_packagedata_setscene)
NOTE: recipe gdk-pixbuf-2.44.6-r0: task do_fetch: Succeeded
NOTE: recipe libcap-ng-0.9.1-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe openssl-3.5.6-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 1474 of 1574 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-extended/bzip2/bzip2_1.0.8.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 1475 of 1574 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/bash-completion/bash-completion_2.17.0.bb:do_packagedata_setscene)
NOTE: Running setscene task 1476 of 1574 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-core/util-linux/util-linux-libuuid_2.41.3.bb:do_populate_sysroot_setscene)
NOTE: recipe zstd-1.5.7-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 1477 of 1574 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-core/zlib/zlib_1.3.2.bb:do_packagedata_setscene)
NOTE: recipe libpam-1.7.2-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe libcap-ng-0.9.1-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 1479 of 1574 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/libedit/libedit_20260512-3.1.bb:do_populate_sysroot_setscene)
NOTE: recipe expat-2.8.1-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 1480 of 1574 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/python/python3_3.14.5.bb:do_recipe_qa_setscene)
NOTE: recipe libffi-3.5.2-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 1483 of 1574 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/bash-completion/bash-completion_2.17.0.bb:do_populate_sysroot_setscene)
NOTE: recipe libpam-1.7.2-r0: task do_packagedata_setscene: Started
NOTE: recipe bash-completion-2.17.0-r0: task do_packagedata_setscene: Started
NOTE: recipe bzip2-1.0.8-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe gtk-doc-native-1.35.1-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe util-linux-libuuid-2.41.3-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe vala-0.56.19-r0: task do_fetch: Succeeded
NOTE: Running setscene task 1488 of 1574 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/gdbm/gdbm_1.26.bb:do_recipe_qa_setscene)
NOTE: recipe zlib-1.3.2-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 1489 of 1574 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-core/util-linux/util-linux-libuuid_2.41.3.bb:do_packagedata_setscene)
NOTE: Running setscene task 1491 of 1574 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/sqlite/sqlite3_3.53.0.bb:do_packagedata_setscene)
NOTE: recipe zlib-1.3.2-r0: task do_packagedata_setscene: Started
NOTE: recipe fribidi-1.0.16-r0: task do_fetch: Succeeded
NOTE: recipe libedit-20260512-3.1-r0: task do_populate_sysroot_setscene: Started
NOTE: Running setscene task 1493 of 1574 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/libffi/libffi_3.5.2.bb:do_recipe_qa_setscene)
NOTE: recipe bash-completion-2.17.0-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe libpam-1.7.2-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 1494 of 1574 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-core/expat/expat_2.8.1.bb:do_recipe_qa_setscene)
NOTE: recipe python3-3.14.5-r0: task do_recipe_qa_setscene: Started
NOTE: recipe gdbm-1.26-r0: task do_recipe_qa_setscene: Started
NOTE: recipe bash-completion-2.17.0-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe sqlite3-3_3.53.0-r0: task do_packagedata_setscene: Started
NOTE: Running setscene task 1495 of 1574 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-core/ncurses/ncurses_6.6.bb:do_packagedata_setscene)
NOTE: recipe bzip2-1.0.8-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe util-linux-libuuid-2.41.3-r0: task do_packagedata_setscene: Started
NOTE: recipe zlib-1.3.2-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe util-linux-libuuid-2.41.3-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 1498 of 1574 (virtual:native:/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-gnome/gtk-doc/gtk-doc_1.35.1.bb:do_recipe_qa_setscene)
NOTE: recipe libffi-3.5.2-r0: task do_recipe_qa_setscene: Started
NOTE: Running setscene task 1500 of 1574 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-extended/zstd/zstd_1.5.7.bb:do_recipe_qa_setscene)
NOTE: Running setscene task 1501 of 1574 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-core/util-linux/util-linux_2.41.3.bb:do_recipe_qa_setscene)
NOTE: recipe libedit-20260512-3.1-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe python3-3.14.5-r0: task do_recipe_qa_setscene: Succeeded
NOTE: Running setscene task 1504 of 1574 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-core/ncurses/ncurses_6.6.bb:do_populate_sysroot_setscene)
NOTE: recipe gdbm-1.26-r0: task do_recipe_qa_setscene: Succeeded
NOTE: Running setscene task 1508 of 1574 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-extended/xz/xz_5.8.3.bb:do_recipe_qa_setscene)
NOTE: Running setscene task 1509 of 1574 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-connectivity/openssl/openssl_3.5.6.bb:do_recipe_qa_setscene)
NOTE: recipe expat-2.8.1-r0: task do_recipe_qa_setscene: Started
NOTE: recipe bash-completion-2.17.0-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 1511 of 1574 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/libcap-ng/libcap-ng_0.9.1.bb:do_recipe_qa_setscene)
NOTE: recipe libffi-3.5.2-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe ncurses-6.6-r0: task do_packagedata_setscene: Started
NOTE: Running setscene task 1514 of 1574 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-core/zlib/zlib_1.3.2.bb:do_recipe_qa_setscene)
NOTE: recipe sqlite3-3_3.53.0-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 1515 of 1574 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-extended/bzip2/bzip2_1.0.8.bb:do_recipe_qa_setscene)
NOTE: recipe zstd-1.5.7-r0: task do_recipe_qa_setscene: Started
NOTE: recipe util-linux-libuuid-2.41.3-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe gtk-doc-native-1.35.1-r0: task do_recipe_qa_setscene: Started
NOTE: recipe expat-2.8.1-r0: task do_recipe_qa_setscene: Succeeded
NOTE: Running setscene task 1517 of 1574 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/bash-completion/bash-completion_2.17.0.bb:do_recipe_qa_setscene)
NOTE: recipe util-linux-2.41.3-r0: task do_recipe_qa_setscene: Started
NOTE: Running setscene task 1518 of 1574 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/libedit/libedit_20260512-3.1.bb:do_recipe_qa_setscene)
NOTE: recipe ncurses-6.6-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe xz-5.8.3-r0: task do_recipe_qa_setscene: Started
NOTE: recipe openssl-3.5.6-r0: task do_recipe_qa_setscene: Started
NOTE: recipe libcap-ng-0.9.1-r0: task do_recipe_qa_setscene: Started
NOTE: recipe zstd-1.5.7-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe zlib-1.3.2-r0: task do_recipe_qa_setscene: Started
NOTE: Running setscene task 1522 of 1574 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/sqlite/sqlite3_3.53.0.bb:do_recipe_qa_setscene)
NOTE: recipe gtk-doc-native-1.35.1-r0: task do_recipe_qa_setscene: Succeeded
NOTE: Running setscene task 1523 of 1574 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-core/util-linux/util-linux-libuuid_2.41.3.bb:do_recipe_qa_setscene)
NOTE: recipe bzip2-1.0.8-r0: task do_recipe_qa_setscene: Started
NOTE: recipe util-linux-2.41.3-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe bash-completion-2.17.0-r0: task do_recipe_qa_setscene: Started
NOTE: recipe xz-5.8.3-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe libedit-20260512-3.1-r0: task do_recipe_qa_setscene: Started
NOTE: recipe openssl-3.5.6-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe libcap-ng-0.9.1-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe zlib-1.3.2-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe ncurses-6.6-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 1525 of 1574 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/opkg-utils/opkg-utils_0.7.0.bb:do_packagedata_setscene)
NOTE: recipe bzip2-1.0.8-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe sqlite3-3_3.53.0-r0: task do_recipe_qa_setscene: Started
NOTE: recipe ncurses-6.6-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe util-linux-libuuid-2.41.3-r0: task do_recipe_qa_setscene: Started
NOTE: Running setscene task 1526 of 1574 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/libtool/libtool-cross_2.5.4.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 1528 of 1574 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-core/ncurses/ncurses_6.6.bb:do_recipe_qa_setscene)
NOTE: Running setscene task 1529 of 1574 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/opkg-utils/opkg-utils_0.7.0.bb:do_populate_sysroot_setscene)
NOTE: recipe bash-completion-2.17.0-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe libedit-20260512-3.1-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe sqlite3-3_3.53.0-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe opkg-utils-0.7.0-r0: task do_packagedata_setscene: Started
NOTE: recipe util-linux-libuuid-2.41.3-r0: task do_recipe_qa_setscene: Succeeded
NOTE: Running task 1383 of 3619 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/shared-mime-info/shared-mime-info_2.4.bb:do_unpack)
NOTE: Running task 1384 of 3619 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-gnome/gdk-pixbuf/gdk-pixbuf_2.44.6.bb:do_unpack)
NOTE: recipe libtool-cross-2.5.4-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe opkg-utils-0.7.0-r0: task do_populate_sysroot_setscene: Started
NOTE: Running task 1415 of 3619 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-core/base-files/base-files_3.0.14.bb:do_unpack)
NOTE: Running task 1422 of 3619 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/pango/pango_1.57.1.bb:do_fetch)
NOTE: recipe ncurses-6.6-r0: task do_recipe_qa_setscene: Started
NOTE: Running task 1441 of 3619 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-gnome/librsvg/librsvg_2.62.2.bb:do_fetch)
NOTE: Running task 1449 of 3619 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/vala/vala_0.56.19.bb:do_unpack)
NOTE: Running task 1452 of 3619 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/fribidi/fribidi_1.0.16.bb:do_unpack)
NOTE: recipe libpam-1.7.2-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 1532 of 1574 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-extended/pam/libpam_1.7.2.bb:do_recipe_qa_setscene)
NOTE: recipe opkg-utils-0.7.0-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 1534 of 1574 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/gcc/gcc-runtime_16.1.bb:do_packagedata_setscene)
NOTE: Running task 1497 of 3619 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-core/base-files/base-files_3.0.14.bb:do_prepare_recipe_sysroot)
NOTE: recipe shared-mime-info-2.4-r0: task do_unpack: Started
NOTE: recipe ncurses-6.6-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe base-files-3.0.14-r0: task do_unpack: Started
NOTE: recipe gdk-pixbuf-2.44.6-r0: task do_unpack: Started
NOTE: recipe pango-1.57.1-r0: task do_fetch: Started
NOTE: recipe vala-0.56.19-r0: task do_unpack: Started
NOTE: recipe opkg-utils-0.7.0-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe fribidi-1.0.16-r0: task do_unpack: Started
NOTE: recipe libtool-cross-2.5.4-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 1536 of 1574 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/opkg-utils/opkg-utils_0.7.0.bb:do_recipe_qa_setscene)
NOTE: Running setscene task 1538 of 1574 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/libtool/libtool-cross_2.5.4.bb:do_recipe_qa_setscene)
NOTE: Running setscene task 1539 of 1574 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/gcc/gcc-runtime_16.1.bb:do_populate_sysroot_setscene)
NOTE: recipe libpam-1.7.2-r0: task do_recipe_qa_setscene: Started
NOTE: recipe base-files-3.0.14-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe base-files-3.0.14-r0: task do_unpack: Succeeded
NOTE: Running task 1532 of 3619 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-core/base-files/base-files_3.0.14.bb:do_patch)
NOTE: recipe gcc-runtime-16.1.0-r0: task do_packagedata_setscene: Started
NOTE: recipe librsvg-2.62.2-r0: task do_fetch: Started
NOTE: recipe libtool-cross-2.5.4-r0: task do_recipe_qa_setscene: Started
NOTE: recipe opkg-utils-0.7.0-r0: task do_recipe_qa_setscene: Started
NOTE: recipe libpam-1.7.2-r0: task do_recipe_qa_setscene: Succeeded
NOTE: Running task 1543 of 3619 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-multimedia/gstreamer/gstreamer1.0_1.28.2.bb:do_fetch)
NOTE: recipe gcc-runtime-16.1.0-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe base-files-3.0.14-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: Running task 1554 of 3619 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/fribidi/fribidi_1.0.16.bb:do_write_config)
NOTE: recipe fribidi-1.0.16-r0: task do_unpack: Succeeded
NOTE: Running task 1555 of 3619 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/fribidi/fribidi_1.0.16.bb:do_patch)
NOTE: recipe harfbuzz-14.2.0-r0: task do_fetch: Succeeded
NOTE: recipe base-files-3.0.14-r0: task do_patch: Started
NOTE: Running task 1556 of 3619 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/harfbuzz/harfbuzz_14.2.0.bb:do_unpack)
NOTE: recipe libtool-cross-2.5.4-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe opkg-utils-0.7.0-r0: task do_recipe_qa_setscene: Succeeded
NOTE: Running task 1567 of 3619 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/harfbuzz/harfbuzz_14.2.0.bb:do_write_config)
NOTE: Running task 1572 of 3619 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-multimedia/libogg/libogg_1.3.6.bb:do_fetch)
NOTE: recipe base-files-3.0.14-r0: task do_patch: Succeeded
NOTE: Running task 1574 of 3619 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-core/base-files/base-files_3.0.14.bb:do_configure)
NOTE: recipe gcc-runtime-16.1.0-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 1541 of 1574 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/gcc/libgcc_16.1.bb:do_packagedata_setscene)
NOTE: recipe gdk-pixbuf-2.44.6-r0: task do_unpack: Succeeded
NOTE: Running task 1575 of 3619 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-gnome/gdk-pixbuf/gdk-pixbuf_2.44.6.bb:do_patch)
NOTE: recipe fribidi-1.0.16-r0: task do_write_config: Started
NOTE: recipe fribidi-1.0.16-r0: task do_patch: Started
NOTE: recipe gstreamer1.0-1.28.2-r0: task do_fetch: Started
NOTE: recipe harfbuzz-14.2.0-r0: task do_unpack: Started
NOTE: recipe libogg-1.3.6-r0: task do_fetch: Started
NOTE: recipe fribidi-1.0.16-r0: task do_write_config: Succeeded
NOTE: recipe harfbuzz-14.2.0-r0: task do_write_config: Started
NOTE: recipe base-files-3.0.14-r0: task do_configure: Started
NOTE: Running task 1580 of 3619 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/pango/pango_1.57.1.bb:do_write_config)
NOTE: recipe libgcc-16.1.0-r0: task do_packagedata_setscene: Started
NOTE: recipe fribidi-1.0.16-r0: task do_patch: Succeeded
NOTE: Running task 1581 of 3619 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/fribidi/fribidi_1.0.16.bb:do_deploy_source_date_epoch)
NOTE: recipe harfbuzz-14.2.0-r0: task do_write_config: Succeeded
NOTE: recipe gdk-pixbuf-2.44.6-r0: task do_patch: Started
NOTE: recipe vala-0.56.19-r0: task do_unpack: Succeeded
NOTE: recipe base-files-3.0.14-r0: task do_configure: Succeeded
NOTE: Running task 1596 of 3619 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/vala/vala_0.56.19.bb:do_patch)
NOTE: Running task 1609 of 3619 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-core/base-files/base-files_3.0.14.bb:do_compile)
NOTE: recipe pango-1.57.1-r0: task do_write_config: Started
NOTE: recipe libgcc-16.1.0-r0: task do_packagedata_setscene: Succeeded
NOTE: Running task 1671 of 3619 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/libical/libical_3.0.20.bb:do_fetch)
NOTE: Running setscene task 1543 of 1574 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-core/musl/musl_git.bb:do_packagedata_setscene)
NOTE: recipe gcc-runtime-16.1.0-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 1544 of 1574 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/gcc/gcc-runtime_16.1.bb:do_recipe_qa_setscene)
NOTE: recipe fribidi-1.0.16-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe pango-1.57.1-r0: task do_write_config: Succeeded
NOTE: recipe vala-0.56.19-r0: task do_patch: Started
NOTE: recipe base-files-3.0.14-r0: task do_compile: Started
NOTE: Running setscene task 1545 of 1574 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/gcc/libgcc_16.1.bb:do_populate_sysroot_setscene)
NOTE: recipe pango-1.57.1-r0: task do_fetch: Succeeded
NOTE: Running task 1672 of 3619 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/pango/pango_1.57.1.bb:do_unpack)
NOTE: recipe gstreamer1.0-1.28.2-r0: task do_fetch: Succeeded
NOTE: Running task 1673 of 3619 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-multimedia/gstreamer/gstreamer1.0_1.28.2.bb:do_unpack)
NOTE: recipe musl-1.2.6+git-r0: task do_packagedata_setscene: Started
NOTE: recipe base-files-3.0.14-r0: task do_compile: Succeeded
NOTE: recipe libical-3.0.20-r0: task do_fetch: Started
NOTE: Running task 1674 of 3619 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-core/base-files/base-files_3.0.14.bb:do_install)
NOTE: recipe gcc-runtime-16.1.0-r0: task do_recipe_qa_setscene: Started
NOTE: recipe vala-0.56.19-r0: task do_patch: Succeeded
NOTE: recipe gdk-pixbuf-2.44.6-r0: task do_patch: Succeeded
NOTE: recipe libgcc-16.1.0-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe pango-1.57.1-r0: task do_unpack: Started
NOTE: recipe gstreamer1.0-1.28.2-r0: task do_unpack: Started
NOTE: recipe gcc-runtime-16.1.0-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe musl-1.2.6+git-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe shared-mime-info-2.4-r0: task do_unpack: Succeeded
NOTE: recipe fribidi-1.0.16-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: recipe libgcc-16.1.0-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe gstreamer1.0-1.28.2-r0: task do_unpack: Succeeded
NOTE: recipe pango-1.57.1-r0: task do_unpack: Succeeded
NOTE: recipe libical-3.0.20-r0: task do_fetch: Succeeded
NOTE: Task /srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/fribidi/fribidi_1.0.16.bb:do_deploy_source_date_epoch unihash changed to f067a1a02e716fb8a003707af091d84c90b8c7b284e864ee06a25fe708d74fe5
NOTE: Running setscene task 1517 of 1574 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-core/musl/musl_git.bb:do_populate_sysroot_setscene)
NOTE: recipe base-files-3.0.14-r0: task do_install: Started
NOTE: Running setscene task 1518 of 1574 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/gcc/libgcc_16.1.bb:do_recipe_qa_setscene)
NOTE: Running setscene task 1526 of 1574 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-kernel/linux-libc-headers/linux-libc-headers_6.18.bb:do_packagedata_setscene)
NOTE: Running setscene task 1527 of 1574 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-core/musl/bsd-headers.bb:do_packagedata_setscene)
NOTE: Running setscene task 1530 of 1574 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-core/musl/libssp-nonshared.bb:do_packagedata_setscene)
NOTE: Running task 1677 of 3619 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/shared-mime-info/shared-mime-info_2.4.bb:do_patch)
NOTE: Running task 1678 of 3619 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-gnome/gdk-pixbuf/gdk-pixbuf_2.44.6.bb:do_deploy_source_date_epoch)
NOTE: Running task 1679 of 3619 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/pango/pango_1.57.1.bb:do_patch)
NOTE: Running task 1680 of 3619 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/vala/vala_0.56.19.bb:do_deploy_source_date_epoch)
NOTE: Running task 1681 of 3619 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-multimedia/gstreamer/gstreamer1.0_1.28.2.bb:do_patch)
NOTE: recipe musl-1.2.6+git-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe bsd-headers-1.0-r0: task do_packagedata_setscene: Started
NOTE: recipe libssp-nonshared-1.0-r0: task do_packagedata_setscene: Started
NOTE: recipe linux-libc-headers-6.18-r0: task do_packagedata_setscene: Started
NOTE: recipe libgcc-16.1.0-r0: task do_recipe_qa_setscene: Started
NOTE: recipe shared-mime-info-2.4-r0: task do_patch: Started
NOTE: recipe vala-0.56.19-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe pango-1.57.1-r0: task do_patch: Started
NOTE: recipe gdk-pixbuf-2.44.6-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe gstreamer1.0-1.28.2-r0: task do_patch: Started
NOTE: recipe libgcc-16.1.0-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe bsd-headers-1.0-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe libssp-nonshared-1.0-r0: task do_packagedata_setscene: Succeeded
NOTE: Running task 1723 of 3619 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/mesa/mesa.bb:do_fetch)
NOTE: recipe linux-libc-headers-6.18-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe pango-1.57.1-r0: task do_patch: Succeeded
NOTE: Running task 1740 of 3619 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/libical/libical_3.0.20.bb:do_unpack)
NOTE: Running task 1747 of 3619 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-connectivity/bluez5/bluez5_5.86.bb:do_fetch)
NOTE: Running task 1753 of 3619 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/pango/pango_1.57.1.bb:do_deploy_source_date_epoch)
NOTE: Running task 1755 of 3619 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-gnome/librsvg/librsvg_2.62.2.bb:do_write_config)
NOTE: recipe musl-1.2.6+git-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe harfbuzz-14.2.0-r0: task do_unpack: Succeeded
NOTE: Running setscene task 1558 of 1574 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-core/musl/bsd-headers.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 1561 of 1574 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-kernel/linux-libc-headers/linux-libc-headers_6.18.bb:do_populate_sysroot_setscene)
NOTE: recipe base-files-3.0.14-r0: task do_install: Succeeded
NOTE: Running setscene task 1563 of 1574 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-core/musl/musl_git.bb:do_recipe_qa_setscene)
NOTE: recipe libxft-1_2.3.9-r0: task do_fetch: Succeeded
NOTE: Running setscene task 1564 of 1574 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-core/musl/libssp-nonshared.bb:do_populate_sysroot_setscene)
NOTE: recipe libical-3.0.20-r0: task do_unpack: Started
NOTE: recipe shared-mime-info-2.4-r0: task do_patch: Succeeded
NOTE: recipe bluez5-5.86-r0: task do_fetch: Started
NOTE: recipe mesa-2_26.0.6-r0: task do_fetch: Started
NOTE: recipe bsd-headers-1.0-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe pango-1.57.1-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe linux-libc-headers-6.18-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe mesa-2_26.0.6-r0: task do_fetch: Succeeded
NOTE: Running task 1768 of 3619 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/harfbuzz/harfbuzz_14.2.0.bb:do_patch)
NOTE: recipe gdk-pixbuf-2.44.6-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: Running task 1769 of 3619 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/xorg-lib/libxft_2.3.9.bb:do_unpack)
NOTE: Task /srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-gnome/gdk-pixbuf/gdk-pixbuf_2.44.6.bb:do_deploy_source_date_epoch unihash changed to bec179bd11183a1baa929f0c0c1308c2b952b2434e66063e14613a074b0856da
NOTE: recipe musl-1.2.6+git-r0: task do_recipe_qa_setscene: Started
NOTE: recipe libssp-nonshared-1.0-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe librsvg-2.62.2-r0: task do_write_config: Started
NOTE: recipe vala-0.56.19-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: recipe libical-3.0.20-r0: task do_unpack: Succeeded
NOTE: recipe libxft-1_2.3.9-r0: task do_unpack: Started
NOTE: recipe harfbuzz-14.2.0-r0: task do_patch: Started
NOTE: recipe musl-1.2.6+git-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe gstreamer1.0-1.28.2-r0: task do_patch: Succeeded
NOTE: recipe bsd-headers-1.0-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe librsvg-2.62.2-r0: task do_write_config: Succeeded
NOTE: Task /srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/vala/vala_0.56.19.bb:do_deploy_source_date_epoch unihash changed to 951b4e8f80179894ceb371733a848aae2caaa0db8a143fc3cc904514f3e21452
NOTE: recipe libxft-1_2.3.9-r0: task do_unpack: Succeeded
NOTE: recipe pango-1.57.1-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: recipe libssp-nonshared-1.0-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe harfbuzz-14.2.0-r0: task do_patch: Succeeded
NOTE: recipe bluez5-5.86-r0: task do_fetch: Succeeded
NOTE: recipe linux-libc-headers-6.18-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Task /srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/pango/pango_1.57.1.bb:do_deploy_source_date_epoch unihash changed to febc172b5ad027f97aac7a8ed5fb8f922b6d1f20be6670d073df330d49c962ec
NOTE: Running setscene task 1529 of 1574 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-core/musl/bsd-headers.bb:do_recipe_qa_setscene)
NOTE: Running setscene task 1532 of 1574 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-kernel/linux-libc-headers/linux-libc-headers_6.18.bb:do_recipe_qa_setscene)
NOTE: Running setscene task 1534 of 1574 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-core/musl/libssp-nonshared.bb:do_recipe_qa_setscene)
NOTE: Running task 1786 of 3619 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/xorg-lib/libxft_2.3.9.bb:do_patch)
NOTE: Running task 1787 of 3619 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-core/base-files/base-files_3.0.14.bb:do_populate_sysroot)
NOTE: Running task 1788 of 3619 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/harfbuzz/harfbuzz_14.2.0.bb:do_deploy_source_date_epoch)
NOTE: Running task 1789 of 3619 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/libical/libical_3.0.20.bb:do_patch)
NOTE: Running task 1830 of 3619 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/mesa/mesa.bb:do_unpack)
NOTE: Running task 1835 of 3619 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-multimedia/gstreamer/gstreamer1.0_1.28.2.bb:do_deploy_source_date_epoch)
NOTE: Running task 1836 of 3619 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-multimedia/gstreamer/gstreamer1.0_1.28.2.bb:do_write_config)
NOTE: Running task 1856 of 3619 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-connectivity/bluez5/bluez5_5.86.bb:do_unpack)
NOTE: Running task 1859 of 3619 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-gnome/libxmlb/libxmlb_0.3.26.bb:do_fetch)
NOTE: Running task 1869 of 3619 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-multimedia/alsa/alsa-lib_1.2.15.3.bb:do_fetch)
NOTE: recipe bsd-headers-1.0-r0: task do_recipe_qa_setscene: Started
NOTE: recipe linux-libc-headers-6.18-r0: task do_recipe_qa_setscene: Started
NOTE: recipe libssp-nonshared-1.0-r0: task do_recipe_qa_setscene: Started
NOTE: recipe base-files-3.0.14-r0: task do_populate_sysroot: Started
NOTE: recipe libxft-1_2.3.9-r0: task do_patch: Started
NOTE: recipe harfbuzz-14.2.0-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe libical-3.0.20-r0: task do_patch: Started
NOTE: recipe bsd-headers-1.0-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe linux-libc-headers-6.18-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe libssp-nonshared-1.0-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe gstreamer1.0-1.28.2-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe gstreamer1.0-1.28.2-r0: task do_write_config: Started
NOTE: recipe alsa-lib-1.2.15.3-r0: task do_fetch: Started
NOTE: Setscene tasks completed
NOTE: recipe bluez5-5.86-r0: task do_unpack: Started
NOTE: recipe libxmlb-0.3.26-r0: task do_fetch: Started
NOTE: recipe mesa-2_26.0.6-r0: task do_unpack: Started
NOTE: recipe libxft-1_2.3.9-r0: task do_patch: Succeeded
NOTE: recipe gstreamer1.0-1.28.2-r0: task do_write_config: Succeeded
NOTE: Running task 2178 of 3619 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/shared-mime-info/shared-mime-info_2.4.bb:do_prepare_recipe_sysroot)
NOTE: Running task 2285 of 3619 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/vala/vala_0.56.19.bb:do_prepare_recipe_sysroot)
NOTE: Running task 2286 of 3619 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/fribidi/fribidi_1.0.16.bb:do_prepare_recipe_sysroot)
NOTE: Running task 2287 of 3619 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/xorg-lib/libxft_2.3.9.bb:do_deploy_source_date_epoch)
NOTE: Running task 2288 of 3619 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/xorg-lib/libxft_2.3.9.bb:do_prepare_recipe_sysroot)
NOTE: recipe libical-3.0.20-r0: task do_patch: Succeeded
NOTE: recipe icu-78.3-r0: task do_fetch: Succeeded
NOTE: recipe harfbuzz-14.2.0-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: recipe gstreamer1.0-1.28.2-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: Running task 2346 of 3619 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/icu/icu_78.3.bb:do_unpack)
NOTE: Running task 2347 of 3619 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/icu/icu_78.3.bb:do_prepare_recipe_sysroot)
NOTE: recipe shared-mime-info-2.4-r0: task do_prepare_recipe_sysroot: Started
NOTE: Task /srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/harfbuzz/harfbuzz_14.2.0.bb:do_deploy_source_date_epoch unihash changed to e03eeaac17be765e4d90f344f9e272abfe5d0184c8d3ab54db63da323ee18840
NOTE: recipe bluez5-5.86-r0: task do_unpack: Succeeded
NOTE: recipe vala-0.56.19-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe libxft-1_2.3.9-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe fribidi-1.0.16-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe libxft-1_2.3.9-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe icu-78.3-r0: task do_unpack: Started
NOTE: recipe icu-78.3-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe base-files-3.0.14-r0: task do_populate_sysroot: Succeeded
NOTE: Task /srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-multimedia/gstreamer/gstreamer1.0_1.28.2.bb:do_deploy_source_date_epoch unihash changed to e04b92f0729440d7ae431cef8a6fb7b44f6ed790ed367625c410512f18b39a1e
NOTE: Task /srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-core/base-files/base-files_3.0.14.bb:do_populate_sysroot unihash changed to 56f86136d7a4cf1994dc4410aea1740546a49f4519d7112a9e473f8c6a2f81f4
NOTE: Reported task /srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-core/base-files/base-files_3.0.14.bb:do_create_spdx as unihash 17792610ca9af8915defba559870e798075c94794e5c20f680575d07feb679ba to wss://hashserv-eu.yoctoproject.org/ws ({'taskhash': '3c3525eeb4f7f02ccbdb8e01a74fda8a6a87a7e6271bfd4ac46e1b310cb9965e', 'method': 'oe.sstatesig.OEOuthashBasic', 'unihash': '17792610ca9af8915defba559870e798075c94794e5c20f680575d07feb679ba'})
NOTE: Task /srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-core/base-files/base-files_3.0.14.bb:do_create_spdx unihash changed 3c3525eeb4f7f02ccbdb8e01a74fda8a6a87a7e6271bfd4ac46e1b310cb9965e -> 17792610ca9af8915defba559870e798075c94794e5c20f680575d07feb679ba as wanted
NOTE: Already covered setscene for /srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-core/base-files/base-files_3.0.14.bb:do_create_spdx so ignoring rehash (remap)
NOTE: recipe libxft-1_2.3.9-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: Running task 2352 of 3619 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-multimedia/gstreamer/gstreamer1.0_1.28.2.bb:do_prepare_recipe_sysroot)
NOTE: Task /srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/xorg-lib/libxft_2.3.9.bb:do_deploy_source_date_epoch unihash changed to 9dd63fc23f766eb264b4568db86fb2a9524594bc06432349977495fdc17231f5
NOTE: recipe libxft-1_2.3.9-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: recipe alsa-lib-1.2.15.3-r0: task do_fetch: Succeeded
NOTE: recipe gstreamer1.0-1.28.2-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe icu-78.3-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: Setscene tasks completed
NOTE: Running task 2362 of 3619 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/xorg-lib/libxft_2.3.9.bb:do_configure)
NOTE: Running task 2370 of 3619 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-connectivity/bluez5/bluez5_5.86.bb:do_patch)
NOTE: Running task 2381 of 3619 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-multimedia/libvorbis/libvorbis_1.3.7.bb:do_fetch)
NOTE: recipe fribidi-1.0.16-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: Running task 2442 of 3619 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/fribidi/fribidi_1.0.16.bb:do_configure)
NOTE: Running task 2526 of 3619 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-multimedia/flac/flac_1.5.0.bb:do_fetch)
NOTE: Running task 2556 of 3619 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/mesa/mesa.bb:do_prepare_recipe_sysroot)
NOTE: Running task 2558 of 3619 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-multimedia/alsa/alsa-lib_1.2.15.3.bb:do_unpack)
NOTE: Running task 2560 of 3619 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/xorg-lib/libxi_1.8.3.bb:do_fetch)
NOTE: recipe libxft-1_2.3.9-r0: task do_configure: Started
NOTE: recipe libvorbis-1.3.7-r0: task do_fetch: Started
NOTE: recipe bluez5-5.86-r0: task do_patch: Started
NOTE: recipe fribidi-1.0.16-r0: task do_configure: Started
NOTE: recipe flac-1.5.0-r0: task do_fetch: Started
NOTE: recipe alsa-lib-1.2.15.3-r0: task do_unpack: Started
NOTE: recipe libxi-1_1.8.3-r0: task do_fetch: Started
NOTE: recipe shared-mime-info-2.4-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: recipe mesa-2_26.0.6-r0: task do_prepare_recipe_sysroot: Started
NOTE: Running task 2561 of 3619 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/shared-mime-info/shared-mime-info_2.4.bb:do_configure)
NOTE: recipe vala-0.56.19-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: Running task 2562 of 3619 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/vala/vala_0.56.19.bb:do_configure)
NOTE: recipe shared-mime-info-2.4-r0: task do_configure: Started
NOTE: recipe vala-0.56.19-r0: task do_configure: Started
NOTE: recipe alsa-lib-1.2.15.3-r0: task do_unpack: Succeeded
NOTE: Running task 2563 of 3619 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-multimedia/alsa/alsa-lib_1.2.15.3.bb:do_patch)
NOTE: recipe alsa-lib-1.2.15.3-r0: task do_patch: Started
NOTE: recipe gstreamer1.0-1.28.2-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: recipe bluez5-5.86-r0: task do_patch: Succeeded
NOTE: Running task 2564 of 3619 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-multimedia/gstreamer/gstreamer1.0_1.28.2.bb:do_configure)
NOTE: Running task 2576 of 3619 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/libical/libical_3.0.20.bb:do_generate_toolchain_file)
NOTE: recipe alsa-lib-1.2.15.3-r0: task do_patch: Succeeded
NOTE: Running task 2583 of 3619 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-connectivity/bluez5/bluez5_5.86.bb:do_deploy_source_date_epoch)
NOTE: recipe libxmlb-0.3.26-r0: task do_fetch: Succeeded
NOTE: Running task 2584 of 3619 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-gnome/libxmlb/libxmlb_0.3.26.bb:do_unpack)
NOTE: recipe gstreamer1.0-1.28.2-r0: task do_configure: Started
NOTE: recipe libical-3.0.20-r0: task do_generate_toolchain_file: Started
NOTE: recipe libical-3.0.20-r0: task do_generate_toolchain_file: Succeeded
NOTE: Running task 2592 of 3619 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-multimedia/libsndfile/libsndfile1_1.2.2.bb:do_fetch)
NOTE: recipe bluez5-5.86-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe libxmlb-0.3.26-r0: task do_unpack: Started
NOTE: recipe libsndfile1-1.2.2-r0: task do_fetch: Started
NOTE: recipe mesa-2_26.0.6-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: Running task 2593 of 3619 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/orc/orc_0.4.42.bb:do_fetch)
NOTE: recipe orc-0.4.42-r0: task do_fetch: Started
NOTE: recipe bluez5-5.86-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: Task /srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-connectivity/bluez5/bluez5_5.86.bb:do_deploy_source_date_epoch unihash changed to 3b887ae10056636cedf350f893eab74cb2d800980cf7a240c29867ef530d8077
NOTE: recipe libogg-1.3.6-r0: task do_fetch: Succeeded
NOTE: Setscene tasks completed
NOTE: Running task 2594 of 3619 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-multimedia/libogg/libogg_1.3.6.bb:do_unpack)
NOTE: Running task 2595 of 3619 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-multimedia/libogg/libogg_1.3.6.bb:do_prepare_recipe_sysroot)
NOTE: recipe icu-78.3-r0: task do_unpack: Succeeded
NOTE: Running task 2596 of 3619 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/icu/icu_78.3.bb:do_patch)
NOTE: recipe libogg-1.3.6-r0: task do_unpack: Started
NOTE: recipe libogg-1.3.6-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe libogg-1.3.6-r0: task do_unpack: Succeeded
NOTE: Running task 2597 of 3619 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-multimedia/libogg/libogg_1.3.6.bb:do_patch)
NOTE: recipe icu-78.3-r0: task do_patch: Started
NOTE: recipe libxmlb-0.3.26-r0: task do_unpack: Succeeded
NOTE: Running task 2598 of 3619 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-gnome/libxmlb/libxmlb_0.3.26.bb:do_patch)
NOTE: recipe libogg-1.3.6-r0: task do_patch: Started
NOTE: recipe libsndfile1-1.2.2-r0: task do_fetch: Succeeded
NOTE: Running task 2601 of 3619 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/xorg-lib/xkeyboard-config_2.47.bb:do_fetch)
NOTE: recipe libxmlb-0.3.26-r0: task do_patch: Started
NOTE: recipe libogg-1.3.6-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: recipe libogg-1.3.6-r0: task do_patch: Succeeded
NOTE: recipe xkeyboard-config-2.47-r0: task do_fetch: Started
NOTE: Running task 2608 of 3619 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-multimedia/libogg/libogg_1.3.6.bb:do_deploy_source_date_epoch)
NOTE: recipe xkeyboard-config-2.47-r0: task do_fetch: Succeeded
NOTE: Running task 2638 of 3619 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-gnome/libxmlb/libxmlb_0.3.26.bb:do_write_config)
NOTE: Running task 2639 of 3619 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-gnome/libxmlb/libxmlb_0.3.26.bb:do_prepare_recipe_sysroot)
NOTE: recipe libxmlb-0.3.26-r0: task do_patch: Succeeded
NOTE: Running task 2648 of 3619 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/xorg-lib/libxkbcommon_1.13.1.bb:do_fetch)
NOTE: recipe libogg-1.3.6-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe icu-78.3-r0: task do_patch: Succeeded
NOTE: recipe libxmlb-0.3.26-r0: task do_write_config: Started
NOTE: recipe libxmlb-0.3.26-r0: task do_prepare_recipe_sysroot: Started
NOTE: Running task 2650 of 3619 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/icu/icu_78.3.bb:do_make_icudata)
NOTE: recipe libxkbcommon-1.13.1-r0: task do_fetch: Started
NOTE: recipe libxmlb-0.3.26-r0: task do_write_config: Succeeded
NOTE: Running task 2652 of 3619 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-multimedia/libsndfile/libsndfile1_1.2.2.bb:do_unpack)
NOTE: recipe icu-78.3-r0: task do_make_icudata: Started
NOTE: recipe libsndfile1-1.2.2-r0: task do_unpack: Started
NOTE: recipe libogg-1.3.6-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: recipe icu-78.3-r0: task do_make_icudata: Succeeded
NOTE: Task /srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-multimedia/libogg/libogg_1.3.6.bb:do_deploy_source_date_epoch unihash changed to 14e5fcbcb822c6994e8b3ead4634e2096bf04c5bc70e1b7a4d5aa59ceb4e22c3
NOTE: recipe orc-0.4.42-r0: task do_fetch: Succeeded
NOTE: recipe libsndfile1-1.2.2-r0: task do_unpack: Succeeded
NOTE: recipe libxkbcommon-1.13.1-r0: task do_fetch: Succeeded
NOTE: recipe fribidi-1.0.16-r0: task do_configure: Succeeded
NOTE: Setscene tasks completed
NOTE: Running task 2653 of 3619 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/icu/icu_78.3.bb:do_configure)
NOTE: Running task 2654 of 3619 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-multimedia/libogg/libogg_1.3.6.bb:do_configure)
NOTE: Running task 2655 of 3619 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/fribidi/fribidi_1.0.16.bb:do_compile)
NOTE: Running task 2656 of 3619 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/orc/orc_0.4.42.bb:do_unpack)
NOTE: Running task 2658 of 3619 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/xorg-lib/xkeyboard-config_2.47.bb:do_unpack)
NOTE: Running task 2659 of 3619 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/mesa/mesa.bb:do_write_config)
NOTE: recipe libogg-1.3.6-r0: task do_configure: Started
NOTE: recipe icu-78.3-r0: task do_configure: Started
NOTE: recipe fribidi-1.0.16-r0: task do_compile: Started
NOTE: recipe orc-0.4.42-r0: task do_unpack: Started
NOTE: recipe xkeyboard-config-2.47-r0: task do_unpack: Started
NOTE: recipe mesa-2_26.0.6-r0: task do_write_config: Started
NOTE: recipe orc-0.4.42-r0: task do_unpack: Succeeded
NOTE: Running task 2660 of 3619 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-multimedia/libsndfile/libsndfile1_1.2.2.bb:do_patch)
NOTE: recipe libxmlb-0.3.26-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: recipe mesa-2_26.0.6-r0: task do_write_config: Succeeded
NOTE: recipe xkeyboard-config-2.47-r0: task do_unpack: Succeeded
NOTE: Running task 2661 of 3619 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-gnome/libxmlb/libxmlb_0.3.26.bb:do_configure)
NOTE: Running task 2662 of 3619 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/orc/orc_0.4.42.bb:do_patch)
NOTE: Running task 2663 of 3619 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/xorg-lib/xkeyboard-config_2.47.bb:do_patch)
NOTE: recipe libsndfile1-1.2.2-r0: task do_patch: Started
NOTE: recipe mesa-2_26.0.6-r0: task do_unpack: Succeeded
NOTE: Running task 2664 of 3619 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/mesa/mesa.bb:do_patch)
NOTE: recipe libxmlb-0.3.26-r0: task do_configure: Started
NOTE: recipe orc-0.4.42-r0: task do_patch: Started
NOTE: recipe xkeyboard-config-2.47-r0: task do_patch: Started
NOTE: recipe orc-0.4.42-r0: task do_patch: Succeeded
NOTE: recipe xkeyboard-config-2.47-r0: task do_patch: Succeeded
NOTE: recipe mesa-2_26.0.6-r0: task do_patch: Started
NOTE: Running task 2669 of 3619 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-multimedia/alsa/alsa-lib_1.2.15.3.bb:do_prepare_recipe_sysroot)
NOTE: Running task 2681 of 3619 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/mesa/libglu_9.0.3.bb:do_fetch)
NOTE: recipe alsa-lib-1.2.15.3-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe libglu-2_9.0.3-r0: task do_fetch: Started
NOTE: recipe libglu-2_9.0.3-r0: task do_fetch: Succeeded
NOTE: Running task 2683 of 3619 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-multimedia/libtheora/libtheora_1.2.0.bb:do_fetch)
NOTE: recipe mesa-2_26.0.6-r0: task do_patch: Succeeded
NOTE: recipe libtheora-1.2.0-r0: task do_fetch: Started
NOTE: Running task 2684 of 3619 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/mesa/mesa.bb:do_deploy_source_date_epoch)
NOTE: recipe libsndfile1-1.2.2-r0: task do_patch: Succeeded
NOTE: Running task 2685 of 3619 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/mesa/mesa.bb:do_rust_create_wrappers)
NOTE: recipe shared-mime-info-2.4-r0: task do_configure: Succeeded
NOTE: Running task 2686 of 3619 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/shared-mime-info/shared-mime-info_2.4.bb:do_compile)
NOTE: recipe alsa-lib-1.2.15.3-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: recipe flac-1.5.0-r0: task do_fetch: Succeeded
NOTE: Setscene tasks completed
NOTE: Running task 2687 of 3619 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-multimedia/flac/flac_1.5.0.bb:do_unpack)
NOTE: Running task 2688 of 3619 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/mesa/mesa.bb:do_rust_gen_targets)
NOTE: recipe mesa-2_26.0.6-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe mesa-2_26.0.6-r0: task do_rust_create_wrappers: Started
NOTE: recipe shared-mime-info-2.4-r0: task do_compile: Started
NOTE: recipe flac-1.5.0-r0: task do_unpack: Started
NOTE: recipe mesa-2_26.0.6-r0: task do_rust_gen_targets: Started
NOTE: recipe libvorbis-1.3.7-r0: task do_fetch: Succeeded
NOTE: Setscene tasks completed
NOTE: Running task 2689 of 3619 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-multimedia/libvorbis/libvorbis_1.3.7.bb:do_unpack)
NOTE: recipe mesa-2_26.0.6-r0: task do_rust_create_wrappers: Succeeded
NOTE: Running task 2690 of 3619 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-multimedia/alsa/alsa-lib_1.2.15.3.bb:do_configure)
NOTE: recipe mesa-2_26.0.6-r0: task do_rust_gen_targets: Succeeded
NOTE: Running task 2691 of 3619 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/xorg-lib/libxv_1.0.13.bb:do_fetch)
NOTE: recipe flac-1.5.0-r0: task do_unpack: Succeeded
NOTE: Running task 2692 of 3619 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-multimedia/flac/flac_1.5.0.bb:do_patch)
NOTE: recipe libvorbis-1.3.7-r0: task do_unpack: Started
NOTE: recipe alsa-lib-1.2.15.3-r0: task do_configure: Started
NOTE: recipe libxv-1.0.13-r0: task do_fetch: Started
NOTE: recipe flac-1.5.0-r0: task do_patch: Started
NOTE: recipe mesa-2_26.0.6-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: Task /srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/mesa/mesa.bb:do_deploy_source_date_epoch unihash changed to a5687d6c8b3103e663668a0180858ffebdb793773e62720b43acb1fccc7b1ac0
NOTE: recipe libvorbis-1.3.7-r0: task do_unpack: Succeeded
NOTE: recipe flac-1.5.0-r0: task do_patch: Succeeded
NOTE: Setscene tasks completed
NOTE: Running task 2693 of 3619 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-multimedia/libvorbis/libvorbis_1.3.7.bb:do_patch)
NOTE: Running task 2694 of 3619 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/mesa/mesa.bb:do_configure)
NOTE: Running task 2705 of 3619 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/xorg-lib/libxkbcommon_1.13.1.bb:do_unpack)
NOTE: recipe libvorbis-1.3.7-r0: task do_patch: Started
NOTE: recipe libxkbcommon-1.13.1-r0: task do_unpack: Started
NOTE: recipe mesa-2_26.0.6-r0: task do_configure: Started
NOTE: recipe libvorbis-1.3.7-r0: task do_patch: Succeeded
NOTE: Running task 2706 of 3619 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-multimedia/libvorbis/libvorbis_1.3.7.bb:do_deploy_source_date_epoch)
NOTE: recipe libvorbis-1.3.7-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe fribidi-1.0.16-r0: task do_compile: Succeeded
NOTE: Running task 2707 of 3619 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/fribidi/fribidi_1.0.16.bb:do_install)
NOTE: recipe fribidi-1.0.16-r0: task do_install: Started
NOTE: recipe libvorbis-1.3.7-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: Task /srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-multimedia/libvorbis/libvorbis_1.3.7.bb:do_deploy_source_date_epoch unihash changed to 31d32bf3418c95d5c02e210d0f86e37a847eae7b5ed2d870bf65f249ca398d3d
NOTE: Setscene tasks completed
NOTE: Running task 2710 of 3619 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-multimedia/flac/flac_1.5.0.bb:do_deploy_source_date_epoch)
NOTE: recipe libxi-1_1.8.3-r0: task do_fetch: Succeeded
NOTE: Running task 2711 of 3619 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/xorg-lib/libxi_1.8.3.bb:do_unpack)
NOTE: recipe libxkbcommon-1.13.1-r0: task do_unpack: Succeeded
NOTE: Running task 2712 of 3619 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/xorg-lib/libxkbcommon_1.13.1.bb:do_patch)
NOTE: recipe flac-1.5.0-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe libxi-1_1.8.3-r0: task do_unpack: Started
NOTE: recipe libxi-1_1.8.3-r0: task do_unpack: Succeeded
NOTE: recipe libxkbcommon-1.13.1-r0: task do_patch: Started
NOTE: Running task 2713 of 3619 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/xorg-lib/libxi_1.8.3.bb:do_patch)
NOTE: recipe libxkbcommon-1.13.1-r0: task do_patch: Succeeded
NOTE: recipe libxi-1_1.8.3-r0: task do_patch: Started
NOTE: Running task 2722 of 3619 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/xorg-lib/libxtst_1.2.5.bb:do_fetch)
NOTE: recipe libxi-1_1.8.3-r0: task do_patch: Succeeded
NOTE: recipe libxtst-1_1.2.5-r0: task do_fetch: Started
NOTE: Running task 2723 of 3619 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/xorg-lib/libxi_1.8.3.bb:do_deploy_source_date_epoch)
NOTE: recipe flac-1.5.0-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: Task /srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-multimedia/flac/flac_1.5.0.bb:do_deploy_source_date_epoch unihash changed to c4a7de96a9bb7389e1b445fac5e770cc45cdb08816f3d741d7188ef1628fcca1
NOTE: recipe libxi-1_1.8.3-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe fribidi-1.0.16-r0: task do_install: Succeeded
NOTE: Setscene tasks completed
NOTE: Running task 2724 of 3619 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/fribidi/fribidi_1.0.16.bb:do_populate_sysroot)
NOTE: Running task 2725 of 3619 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-multimedia/webp/libwebp_1.6.0.bb:do_fetch)
NOTE: recipe libwebp-1.6.0-r0: task do_fetch: Started
NOTE: recipe fribidi-1.0.16-r0: task do_populate_sysroot: Started
NOTE: recipe libxi-1_1.8.3-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: Task /srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/xorg-lib/libxi_1.8.3.bb:do_deploy_source_date_epoch unihash changed to 375aaccfa2bfeb97305ba21a30c2787a21534cdddad3ad5665ecaa6d47e138f7
NOTE: Setscene tasks completed
NOTE: Running task 2726 of 3619 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-multimedia/sbc/sbc_2.2.bb:do_fetch)
NOTE: recipe libwebp-1.6.0-r0: task do_fetch: Succeeded
NOTE: Running task 2727 of 3619 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-gnome/libgudev/libgudev_238.bb:do_fetch)
NOTE: recipe sbc-2.2-r0: task do_fetch: Started
NOTE: recipe libgudev-238-r0: task do_fetch: Started
NOTE: recipe fribidi-1.0.16-r0: task do_populate_sysroot: Succeeded
NOTE: recipe sbc-2.2-r0: task do_fetch: Succeeded
NOTE: Running task 2728 of 3619 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-base_1.28.2.bb:do_fetch)
NOTE: Running task 2729 of 3619 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/xorg-lib/libxi_1.8.3.bb:do_prepare_recipe_sysroot)
NOTE: recipe gstreamer1.0-plugins-base-1.28.2-r0: task do_fetch: Started
NOTE: recipe libxi-1_1.8.3-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe gstreamer1.0-plugins-base-1.28.2-r0: task do_fetch: Succeeded
NOTE: Running task 2732 of 3619 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/mesa/libglu_9.0.3.bb:do_unpack)
NOTE: recipe libgudev-238-r0: task do_fetch: Succeeded
NOTE: Running task 2743 of 3619 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-multimedia/libsndfile/libsndfile1_1.2.2.bb:do_deploy_source_date_epoch)
NOTE: recipe libglu-2_9.0.3-r0: task do_unpack: Started
NOTE: recipe libglu-2_9.0.3-r0: task do_unpack: Succeeded
NOTE: Running task 2744 of 3619 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/mesa/libglu_9.0.3.bb:do_patch)
NOTE: recipe libsndfile1-1.2.2-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe libxi-1_1.8.3-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: recipe libglu-2_9.0.3-r0: task do_patch: Started
NOTE: Running task 2745 of 3619 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/xorg-lib/libxi_1.8.3.bb:do_configure)
NOTE: recipe libxv-1.0.13-r0: task do_fetch: Succeeded
NOTE: Running task 2746 of 3619 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/xorg-lib/libxv_1.0.13.bb:do_unpack)
NOTE: recipe libglu-2_9.0.3-r0: task do_patch: Succeeded
NOTE: Running task 2747 of 3619 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/orc/orc_0.4.42.bb:do_deploy_source_date_epoch)
NOTE: recipe libsndfile1-1.2.2-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: Task /srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-multimedia/libsndfile/libsndfile1_1.2.2.bb:do_deploy_source_date_epoch unihash changed to 7f1872850ef448ee2d1a107118d04c6427fe9b11202e704d9371ab678d2b5a91
NOTE: recipe libxi-1_1.8.3-r0: task do_configure: Started
NOTE: recipe libxv-1.0.13-r0: task do_unpack: Started
NOTE: recipe libxv-1.0.13-r0: task do_unpack: Succeeded
NOTE: recipe libxmlb-0.3.26-r0: task do_configure: Succeeded
NOTE: recipe orc-0.4.42-r0: task do_deploy_source_date_epoch: Started
NOTE: Setscene tasks completed
NOTE: Running task 2748 of 3619 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/xorg-lib/libxv_1.0.13.bb:do_patch)
NOTE: Running task 2751 of 3619 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/xorg-lib/xkeyboard-config_2.47.bb:do_deploy_source_date_epoch)
NOTE: Running task 2752 of 3619 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-gnome/libxmlb/libxmlb_0.3.26.bb:do_configure_ptest_base)
NOTE: recipe shared-mime-info-2.4-r0: task do_compile: Succeeded
NOTE: recipe libxv-1.0.13-r0: task do_patch: Started
NOTE: recipe xkeyboard-config-2.47-r0: task do_deploy_source_date_epoch: Started
NOTE: Running task 2753 of 3619 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/shared-mime-info/shared-mime-info_2.4.bb:do_install)
NOTE: recipe libxmlb-0.3.26-r0: task do_configure_ptest_base: Started
NOTE: recipe libxv-1.0.13-r0: task do_patch: Succeeded
NOTE: Running task 2759 of 3619 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/orc/orc_0.4.42.bb:do_write_config)
NOTE: recipe libxmlb-0.3.26-r0: task do_configure_ptest_base: Succeeded
NOTE: Running task 2760 of 3619 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-gnome/libxmlb/libxmlb_0.3.26.bb:do_compile)
NOTE: recipe shared-mime-info-2.4-r0: task do_install: Started
NOTE: recipe orc-0.4.42-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: Task /srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/orc/orc_0.4.42.bb:do_deploy_source_date_epoch unihash changed to 736755b861dbf7577e92993c54603a9b8791e85ab3444fc737147dd073400d6e
NOTE: recipe orc-0.4.42-r0: task do_write_config: Started
NOTE: recipe xkeyboard-config-2.47-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: recipe orc-0.4.42-r0: task do_write_config: Succeeded
NOTE: Task /srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/xorg-lib/xkeyboard-config_2.47.bb:do_deploy_source_date_epoch unihash changed to 0e6dd4b92779ee7f9d4aef6c08a153cd5f194300c4294b28a029766f7a5a9008
NOTE: recipe libxmlb-0.3.26-r0: task do_compile: Started
NOTE: Setscene tasks completed
NOTE: Running task 2761 of 3619 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/orc/orc_0.4.42.bb:do_prepare_recipe_sysroot)
NOTE: Running task 2762 of 3619 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/xorg-lib/xkeyboard-config_2.47.bb:do_write_config)
NOTE: Running task 2763 of 3619 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/xorg-lib/xkeyboard-config_2.47.bb:do_prepare_recipe_sysroot)
NOTE: recipe orc-0.4.42-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe xkeyboard-config-2.47-r0: task do_write_config: Started
NOTE: recipe xkeyboard-config-2.47-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe gstreamer1.0-1.28.2-r0: task do_configure: Succeeded
NOTE: recipe xkeyboard-config-2.47-r0: task do_write_config: Succeeded
NOTE: Running task 2769 of 3619 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-multimedia/gstreamer/gstreamer1.0_1.28.2.bb:do_configure_ptest_base)
NOTE: Running task 2776 of 3619 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/fribidi/fribidi_1.0.16.bb:do_package)
NOTE: recipe gstreamer1.0-1.28.2-r0: task do_configure_ptest_base: Started
NOTE: recipe fribidi-1.0.16-r0: task do_package: Started
NOTE: recipe gstreamer1.0-1.28.2-r0: task do_configure_ptest_base: Succeeded
NOTE: Running task 2777 of 3619 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-multimedia/gstreamer/gstreamer1.0_1.28.2.bb:do_compile)
NOTE: recipe orc-0.4.42-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: recipe gstreamer1.0-1.28.2-r0: task do_compile: Started
NOTE: Running task 2778 of 3619 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/orc/orc_0.4.42.bb:do_configure)
NOTE: recipe xkeyboard-config-2.47-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: Running task 2779 of 3619 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/xorg-lib/xkeyboard-config_2.47.bb:do_configure)
NOTE: recipe orc-0.4.42-r0: task do_configure: Started
NOTE: recipe xkeyboard-config-2.47-r0: task do_configure: Started
NOTE: recipe shared-mime-info-2.4-r0: task do_install: Succeeded
NOTE: Running task 2780 of 3619 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/shared-mime-info/shared-mime-info_2.4.bb:do_populate_sysroot)
NOTE: recipe libxtst-1_1.2.5-r0: task do_fetch: Succeeded
NOTE: Setscene tasks completed
NOTE: Running task 2781 of 3619 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/xorg-lib/libxtst_1.2.5.bb:do_unpack)
NOTE: recipe icu-78.3-r0: task do_configure: Succeeded
NOTE: Running task 2782 of 3619 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/icu/icu_78.3.bb:do_configure_ptest_base)
NOTE: recipe shared-mime-info-2.4-r0: task do_populate_sysroot: Started
NOTE: recipe libxtst-1_1.2.5-r0: task do_unpack: Started
NOTE: recipe icu-78.3-r0: task do_configure_ptest_base: Started
NOTE: recipe libxtst-1_1.2.5-r0: task do_unpack: Succeeded
NOTE: Running task 2783 of 3619 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-multimedia/webp/libwebp_1.6.0.bb:do_unpack)
NOTE: recipe icu-78.3-r0: task do_configure_ptest_base: Succeeded
NOTE: Running task 2784 of 3619 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/icu/icu_78.3.bb:do_compile)
NOTE: recipe libwebp-1.6.0-r0: task do_unpack: Started
NOTE: recipe libwebp-1.6.0-r0: task do_unpack: Succeeded
NOTE: Running task 2785 of 3619 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-multimedia/sbc/sbc_2.2.bb:do_unpack)
NOTE: recipe icu-78.3-r0: task do_compile: Started
NOTE: recipe sbc-2.2-r0: task do_unpack: Started
NOTE: recipe sbc-2.2-r0: task do_unpack: Succeeded
NOTE: Running task 2786 of 3619 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-gnome/libgudev/libgudev_238.bb:do_unpack)
NOTE: recipe libgudev-238-r0: task do_unpack: Started
NOTE: recipe libgudev-238-r0: task do_unpack: Succeeded
NOTE: Running task 2787 of 3619 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-base_1.28.2.bb:do_unpack)
NOTE: recipe fribidi-1.0.16-r0: task do_package: Succeeded
NOTE: recipe shared-mime-info-2.4-r0: task do_populate_sysroot: Succeeded
NOTE: Running task 2790 of 3619 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/xorg-lib/libxtst_1.2.5.bb:do_patch)
NOTE: Running task 2791 of 3619 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-gnome/gdk-pixbuf/gdk-pixbuf_2.44.6.bb:do_prepare_recipe_sysroot)
NOTE: recipe gstreamer1.0-plugins-base-1.28.2-r0: task do_unpack: Started
NOTE: recipe libxtst-1_1.2.5-r0: task do_patch: Started
NOTE: recipe gdk-pixbuf-2.44.6-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe libxtst-1_1.2.5-r0: task do_patch: Succeeded
NOTE: Running task 2792 of 3619 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-multimedia/webp/libwebp_1.6.0.bb:do_patch)
NOTE: recipe libxft-1_2.3.9-r0: task do_configure: Succeeded
NOTE: recipe xkeyboard-config-2.47-r0: task do_configure: Succeeded
NOTE: recipe gstreamer1.0-plugins-base-1.28.2-r0: task do_unpack: Succeeded
NOTE: Running task 2793 of 3619 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/xorg-lib/libxft_2.3.9.bb:do_compile)
NOTE: Running task 2794 of 3619 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/xorg-lib/xkeyboard-config_2.47.bb:do_compile)
NOTE: recipe libwebp-1.6.0-r0: task do_patch: Started
NOTE: Running task 2795 of 3619 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-multimedia/sbc/sbc_2.2.bb:do_patch)
NOTE: recipe libxft-1_2.3.9-r0: task do_compile: Started
NOTE: recipe libwebp-1.6.0-r0: task do_patch: Succeeded
NOTE: Running task 2796 of 3619 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-gnome/libgudev/libgudev_238.bb:do_patch)
NOTE: recipe sbc-2.2-r0: task do_patch: Started
NOTE: recipe xkeyboard-config-2.47-r0: task do_compile: Started
NOTE: recipe sbc-2.2-r0: task do_patch: Succeeded
NOTE: Running task 2797 of 3619 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-base_1.28.2.bb:do_patch)
NOTE: recipe libgudev-238-r0: task do_patch: Started
NOTE: recipe gstreamer1.0-plugins-base-1.28.2-r0: task do_patch: Started
NOTE: recipe orc-0.4.42-r0: task do_configure: Succeeded
NOTE: recipe libgudev-238-r0: task do_patch: Succeeded
NOTE: Running task 2807 of 3619 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/xorg-lib/libxcomposite_0.4.7.bb:do_fetch)
NOTE: Running task 2808 of 3619 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/orc/orc_0.4.42.bb:do_compile)
NOTE: recipe gdk-pixbuf-2.44.6-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: Running task 2809 of 3619 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-gnome/gdk-pixbuf/gdk-pixbuf_2.44.6.bb:do_configure)
NOTE: recipe libxcomposite-1_0.4.7-r0: task do_fetch: Started
NOTE: recipe orc-0.4.42-r0: task do_compile: Started
NOTE: recipe gdk-pixbuf-2.44.6-r0: task do_configure: Started
NOTE: recipe gstreamer1.0-plugins-base-1.28.2-r0: task do_patch: Succeeded
NOTE: Running task 2810 of 3619 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/atk/at-spi2-core_2.60.4.bb:do_fetch)
NOTE: recipe at-spi2-core-2.60.4-r0: task do_fetch: Started
NOTE: recipe xkeyboard-config-2.47-r0: task do_compile: Succeeded
NOTE: Running task 2811 of 3619 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/xorg-lib/xkeyboard-config_2.47.bb:do_install)
NOTE: recipe libxft-1_2.3.9-r0: task do_compile: Succeeded
NOTE: Running task 2812 of 3619 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/xorg-lib/libxft_2.3.9.bb:do_install)
NOTE: recipe xkeyboard-config-2.47-r0: task do_install: Started
NOTE: recipe at-spi2-core-2.60.4-r0: task do_fetch: Succeeded
NOTE: Running task 2813 of 3619 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-bad_1.28.2.bb:do_fetch)
NOTE: recipe libxft-1_2.3.9-r0: task do_install: Started
NOTE: recipe gstreamer1.0-plugins-bad-1.28.2-r0: task do_fetch: Started
NOTE: recipe gstreamer1.0-plugins-bad-1.28.2-r0: task do_fetch: Succeeded
NOTE: Running task 2814 of 3619 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/libepoxy/libepoxy_1.5.10.bb:do_fetch)
NOTE: recipe libtheora-1.2.0-r0: task do_fetch: Succeeded
NOTE: Running task 2815 of 3619 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-multimedia/libtheora/libtheora_1.2.0.bb:do_unpack)
NOTE: recipe libepoxy-1.5.10-r0: task do_fetch: Started
NOTE: recipe libtheora-1.2.0-r0: task do_unpack: Started
NOTE: recipe libtheora-1.2.0-r0: task do_unpack: Succeeded
NOTE: Running task 2816 of 3619 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-multimedia/libtheora/libtheora_1.2.0.bb:do_patch)
NOTE: recipe libepoxy-1.5.10-r0: task do_fetch: Succeeded
NOTE: Running task 2817 of 3619 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/graphene/graphene_1.10.8.bb:do_fetch)
NOTE: recipe libxft-1_2.3.9-r0: task do_install: Succeeded
NOTE: Running task 2818 of 3619 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/xorg-lib/libxft_2.3.9.bb:do_populate_sysroot)
NOTE: recipe graphene-1.10.8-r0: task do_fetch: Started
NOTE: recipe libtheora-1.2.0-r0: task do_patch: Started
NOTE: recipe vala-0.56.19-r0: task do_configure: Succeeded
NOTE: Running task 2819 of 3619 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/vala/vala_0.56.19.bb:do_compile)
NOTE: recipe libxft-1_2.3.9-r0: task do_populate_sysroot: Started
NOTE: recipe libtheora-1.2.0-r0: task do_patch: Succeeded
NOTE: Running task 2820 of 3619 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/xorg-lib/libxcursor_1.2.3.bb:do_fetch)
NOTE: recipe vala-0.56.19-r0: task do_compile: Started
NOTE: recipe libxcursor-1_1.2.3-r0: task do_fetch: Started
NOTE: recipe graphene-1.10.8-r0: task do_fetch: Succeeded
NOTE: Running task 2822 of 3619 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/xorg-lib/libxinerama_1.1.6.bb:do_fetch)
NOTE: recipe libogg-1.3.6-r0: task do_configure: Succeeded
NOTE: Running task 2823 of 3619 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-multimedia/libogg/libogg_1.3.6.bb:do_compile)
NOTE: recipe libxinerama-1_1.1.6-r0: task do_fetch: Started
NOTE: recipe libogg-1.3.6-r0: task do_compile: Started
NOTE: recipe libxft-1_2.3.9-r0: task do_populate_sysroot: Succeeded
NOTE: recipe libxmlb-0.3.26-r0: task do_compile: Succeeded
NOTE: recipe xkeyboard-config-2.47-r0: task do_install: Succeeded
NOTE: Running task 2824 of 3619 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/libfyaml/libfyaml_0.9.4.bb:do_fetch)
NOTE: Running task 2830 of 3619 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/fribidi/fribidi_1.0.16.bb:do_packagedata)
NOTE: Running task 2831 of 3619 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/xorg-lib/libxft_2.3.9.bb:do_package)
NOTE: recipe fribidi-1.0.16-r0: task do_packagedata: Started
NOTE: recipe libfyaml-0.9.4-r0: task do_fetch: Started
NOTE: recipe libxft-1_2.3.9-r0: task do_package: Started
NOTE: recipe fribidi-1.0.16-r0: task do_packagedata: Succeeded
NOTE: Task /srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/fribidi/fribidi_1.0.16.bb:do_packagedata unihash changed to 655f09b34235a3952f6a13b8ad167ba06f6c4b5705bafe46ccf5c6cb275b2f04
NOTE: recipe libxcomposite-1_0.4.7-r0: task do_fetch: Succeeded
NOTE: Setscene tasks completed
NOTE: Running task 2853 of 3619 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/xorg-lib/xkeyboard-config_2.47.bb:do_populate_sysroot)
NOTE: Running task 2857 of 3619 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/xorg-lib/libxkbcommon_1.13.1.bb:do_write_config)
NOTE: recipe xkeyboard-config-2.47-r0: task do_populate_sysroot: Started
NOTE: recipe libxkbcommon-1.13.1-r0: task do_write_config: Started
NOTE: recipe libogg-1.3.6-r0: task do_compile: Succeeded
NOTE: Running task 2858 of 3619 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-multimedia/libogg/libogg_1.3.6.bb:do_install)
NOTE: recipe libfyaml-0.9.4-r0: task do_fetch: Succeeded
NOTE: recipe libxkbcommon-1.13.1-r0: task do_write_config: Succeeded
NOTE: Running task 2875 of 3619 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/mesa/libglu_9.0.3.bb:do_deploy_source_date_epoch)
NOTE: Running task 2877 of 3619 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-multimedia/libtheora/libtheora_1.2.0.bb:do_deploy_source_date_epoch)
NOTE: recipe mesa-2_26.0.6-r0: task do_configure: Succeeded
NOTE: Running task 2878 of 3619 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/mesa/mesa.bb:do_compile)
NOTE: recipe libglu-2_9.0.3-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe libtheora-1.2.0-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe libogg-1.3.6-r0: task do_install: Started
NOTE: recipe mesa-2_26.0.6-r0: task do_compile: Started
NOTE: recipe libtheora-1.2.0-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: Task /srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-multimedia/libtheora/libtheora_1.2.0.bb:do_deploy_source_date_epoch unihash changed to 9d7a4b67d32b4ee63c0e74ae9461ebfc3bfc9fcbbf9070dbb0f4a5482bee5df8
NOTE: recipe libglu-2_9.0.3-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: recipe xkeyboard-config-2.47-r0: task do_populate_sysroot: Succeeded
NOTE: Task /srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/mesa/libglu_9.0.3.bb:do_deploy_source_date_epoch unihash changed to 9042d78ffa5870baf86b2fd57d44a9ad16a63710bf9969910cc6750aa600cc94
NOTE: recipe libxinerama-1_1.1.6-r0: task do_fetch: Succeeded
NOTE: Setscene tasks completed
NOTE: Running task 2879 of 3619 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/xorg-lib/libxkbcommon_1.13.1.bb:do_prepare_recipe_sysroot)
NOTE: Running task 2880 of 3619 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/xorg-lib/libxv_1.0.13.bb:do_deploy_source_date_epoch)
NOTE: Running task 2882 of 3619 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/mesa/libglu_9.0.3.bb:do_write_config)
NOTE: Running task 2885 of 3619 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/xorg-lib/libxv_1.0.13.bb:do_prepare_recipe_sysroot)
NOTE: recipe alsa-lib-1.2.15.3-r0: task do_configure: Succeeded
NOTE: recipe libxcursor-1_1.2.3-r0: task do_fetch: Succeeded
NOTE: Running task 2886 of 3619 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-multimedia/alsa/alsa-lib_1.2.15.3.bb:do_compile)
NOTE: Running task 2890 of 3619 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/xorg-lib/libxcomposite_0.4.7.bb:do_unpack)
NOTE: recipe libogg-1.3.6-r0: task do_install: Succeeded
NOTE: Running task 2891 of 3619 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-multimedia/libogg/libogg_1.3.6.bb:do_populate_sysroot)
NOTE: recipe libxv-1.0.13-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe libxv-1.0.13-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe libxkbcommon-1.13.1-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe libglu-2_9.0.3-r0: task do_write_config: Started
NOTE: recipe alsa-lib-1.2.15.3-r0: task do_compile: Started
NOTE: recipe libxcomposite-1_0.4.7-r0: task do_unpack: Started
NOTE: recipe orc-0.4.42-r0: task do_compile: Succeeded
NOTE: recipe libogg-1.3.6-r0: task do_populate_sysroot: Started
NOTE: recipe libglu-2_9.0.3-r0: task do_write_config: Succeeded
NOTE: recipe libxcomposite-1_0.4.7-r0: task do_unpack: Succeeded
NOTE: Running task 2892 of 3619 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-multimedia/libogg/libogg_1.3.6.bb:do_package)
NOTE: Running task 2893 of 3619 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/orc/orc_0.4.42.bb:do_install)
NOTE: Running task 2894 of 3619 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/atk/at-spi2-core_2.60.4.bb:do_unpack)
NOTE: recipe libxv-1.0.13-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: Task /srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/xorg-lib/libxv_1.0.13.bb:do_deploy_source_date_epoch unihash changed to 265e7b3015d8766e8641df65e1d48d4c36c23b694998b1b58be4f7bbf4822843
NOTE: recipe at-spi2-core-2.60.4-r0: task do_unpack: Started
NOTE: recipe libxv-1.0.13-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: recipe libogg-1.3.6-r0: task do_package: Started
NOTE: recipe orc-0.4.42-r0: task do_install: Started
NOTE: Setscene tasks completed
NOTE: Running task 2895 of 3619 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-bad_1.28.2.bb:do_unpack)
NOTE: Setscene tasks completed
NOTE: Running task 2896 of 3619 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/xorg-lib/libxv_1.0.13.bb:do_configure)
NOTE: recipe at-spi2-core-2.60.4-r0: task do_unpack: Succeeded
NOTE: Running task 2897 of 3619 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/libepoxy/libepoxy_1.5.10.bb:do_unpack)
NOTE: recipe libxv-1.0.13-r0: task do_configure: Started
NOTE: recipe gstreamer1.0-plugins-bad-1.28.2-r0: task do_unpack: Started
NOTE: recipe libepoxy-1.5.10-r0: task do_unpack: Started
NOTE: recipe libxkbcommon-1.13.1-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: Running task 2898 of 3619 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/xorg-lib/libxkbcommon_1.13.1.bb:do_configure)
NOTE: recipe libogg-1.3.6-r0: task do_populate_sysroot: Succeeded
NOTE: Running task 2899 of 3619 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-multimedia/libvorbis/libvorbis_1.3.7.bb:do_prepare_recipe_sysroot)
NOTE: recipe libxkbcommon-1.13.1-r0: task do_configure: Started
NOTE: recipe libvorbis-1.3.7-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe gdk-pixbuf-2.44.6-r0: task do_configure: Succeeded
NOTE: Running task 2900 of 3619 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-gnome/gdk-pixbuf/gdk-pixbuf_2.44.6.bb:do_configure_ptest_base)
NOTE: recipe libvorbis-1.3.7-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: Running task 2901 of 3619 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-multimedia/libvorbis/libvorbis_1.3.7.bb:do_configure)
NOTE: recipe libepoxy-1.5.10-r0: task do_unpack: Succeeded
NOTE: recipe gdk-pixbuf-2.44.6-r0: task do_configure_ptest_base: Started
NOTE: recipe libvorbis-1.3.7-r0: task do_configure: Started
NOTE: Running task 2902 of 3619 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-multimedia/flac/flac_1.5.0.bb:do_prepare_recipe_sysroot)
NOTE: recipe orc-0.4.42-r0: task do_install: Succeeded
NOTE: recipe gstreamer1.0-plugins-bad-1.28.2-r0: task do_unpack: Succeeded
NOTE: Running task 2903 of 3619 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-multimedia/libtheora/libtheora_1.2.0.bb:do_prepare_recipe_sysroot)
NOTE: Running task 2904 of 3619 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/orc/orc_0.4.42.bb:do_populate_sysroot)
NOTE: recipe gdk-pixbuf-2.44.6-r0: task do_configure_ptest_base: Succeeded
NOTE: recipe flac-1.5.0-r0: task do_prepare_recipe_sysroot: Started
NOTE: Running task 2905 of 3619 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-gnome/gdk-pixbuf/gdk-pixbuf_2.44.6.bb:do_compile)
NOTE: recipe libtheora-1.2.0-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe orc-0.4.42-r0: task do_populate_sysroot: Started
NOTE: recipe gdk-pixbuf-2.44.6-r0: task do_compile: Started
NOTE: recipe libtheora-1.2.0-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: Running task 2906 of 3619 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-multimedia/libtheora/libtheora_1.2.0.bb:do_configure)
NOTE: recipe flac-1.5.0-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: Running task 2907 of 3619 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-multimedia/flac/flac_1.5.0.bb:do_configure)
NOTE: recipe libtheora-1.2.0-r0: task do_configure: Started
NOTE: recipe flac-1.5.0-r0: task do_configure: Started
NOTE: recipe orc-0.4.42-r0: task do_populate_sysroot: Succeeded
NOTE: Running task 2908 of 3619 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/graphene/graphene_1.10.8.bb:do_unpack)
NOTE: recipe graphene-1.10.8-r0: task do_unpack: Started
NOTE: recipe libxft-1_2.3.9-r0: task do_package: Succeeded
NOTE: recipe graphene-1.10.8-r0: task do_unpack: Succeeded
NOTE: Running task 2909 of 3619 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/xorg-lib/libxcursor_1.2.3.bb:do_unpack)
NOTE: Running task 2910 of 3619 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/xorg-lib/libxft_2.3.9.bb:do_packagedata)
NOTE: recipe libxcursor-1_1.2.3-r0: task do_unpack: Started
NOTE: recipe libxft-1_2.3.9-r0: task do_packagedata: Started
NOTE: recipe libxcursor-1_1.2.3-r0: task do_unpack: Succeeded
NOTE: Running task 2912 of 3619 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/xorg-lib/libxinerama_1.1.6.bb:do_unpack)
NOTE: recipe libxinerama-1_1.1.6-r0: task do_unpack: Started
NOTE: recipe libxi-1_1.8.3-r0: task do_configure: Succeeded
NOTE: Running task 2913 of 3619 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/xorg-lib/libxi_1.8.3.bb:do_compile)
NOTE: recipe libxinerama-1_1.1.6-r0: task do_unpack: Succeeded
NOTE: Running task 2914 of 3619 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/libfyaml/libfyaml_0.9.4.bb:do_unpack)
NOTE: recipe libxft-1_2.3.9-r0: task do_packagedata: Succeeded
NOTE: Task /srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/xorg-lib/libxft_2.3.9.bb:do_packagedata unihash changed to ebe9aab36db31662cac0fc210ff9f85f11b6601960420bf82176c9fa01f66a1c
NOTE: recipe libxi-1_1.8.3-r0: task do_compile: Started
NOTE: Setscene tasks completed
NOTE: recipe libfyaml-0.9.4-r0: task do_unpack: Started
NOTE: Running task 2919 of 3619 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/xorg-lib/libxcomposite_0.4.7.bb:do_patch)
NOTE: recipe libfyaml-0.9.4-r0: task do_unpack: Succeeded
NOTE: Running task 2920 of 3619 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/atk/at-spi2-core_2.60.4.bb:do_patch)
NOTE: recipe libxcomposite-1_0.4.7-r0: task do_patch: Started
NOTE: recipe at-spi2-core-2.60.4-r0: task do_patch: Started
NOTE: recipe libxcomposite-1_0.4.7-r0: task do_patch: Succeeded
NOTE: Running task 2921 of 3619 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-bad_1.28.2.bb:do_patch)
NOTE: recipe at-spi2-core-2.60.4-r0: task do_patch: Succeeded
NOTE: Running task 2922 of 3619 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/libepoxy/libepoxy_1.5.10.bb:do_patch)
NOTE: recipe gstreamer1.0-plugins-bad-1.28.2-r0: task do_patch: Started
NOTE: recipe libepoxy-1.5.10-r0: task do_patch: Started
NOTE: recipe libogg-1.3.6-r0: task do_package: Succeeded
NOTE: recipe libepoxy-1.5.10-r0: task do_patch: Succeeded
NOTE: Running task 2923 of 3619 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/graphene/graphene_1.10.8.bb:do_patch)
NOTE: Running task 2924 of 3619 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-multimedia/libogg/libogg_1.3.6.bb:do_packagedata)
NOTE: recipe gstreamer1.0-plugins-bad-1.28.2-r0: task do_patch: Succeeded
NOTE: Running task 2925 of 3619 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/xorg-lib/libxcursor_1.2.3.bb:do_patch)
NOTE: recipe libogg-1.3.6-r0: task do_packagedata: Started
NOTE: recipe graphene-1.10.8-r0: task do_patch: Started
NOTE: recipe libxcursor-1_1.2.3-r0: task do_patch: Started
NOTE: recipe libxcursor-1_1.2.3-r0: task do_patch: Succeeded
NOTE: recipe graphene-1.10.8-r0: task do_patch: Succeeded
NOTE: Running task 2927 of 3619 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/xorg-lib/libxinerama_1.1.6.bb:do_patch)
NOTE: Running task 2928 of 3619 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/libfyaml/libfyaml_0.9.4.bb:do_patch)
NOTE: recipe libogg-1.3.6-r0: task do_packagedata: Succeeded
NOTE: recipe libfyaml-0.9.4-r0: task do_patch: Started
NOTE: recipe libxinerama-1_1.1.6-r0: task do_patch: Started
NOTE: Task /srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-multimedia/libogg/libogg_1.3.6.bb:do_packagedata unihash changed to 1507a7fe44eee91536eca917fbbd8ee97940f687d79b05d77d3c54a89293ec2e
NOTE: recipe libxinerama-1_1.1.6-r0: task do_patch: Succeeded
NOTE: recipe libfyaml-0.9.4-r0: task do_patch: Succeeded
NOTE: Setscene tasks completed
NOTE: Running task 2929 of 3619 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/shared-mime-info/shared-mime-info_2.4.bb:do_package)
NOTE: Running task 2931 of 3619 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-gnome/libxmlb/libxmlb_0.3.26.bb:do_compile_ptest_base)
NOTE: Running task 2940 of 3619 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-gnome/gtk+/gtk4_4.22.4.bb:do_fetch)
NOTE: recipe shared-mime-info-2.4-r0: task do_package: Started
NOTE: recipe libxmlb-0.3.26-r0: task do_compile_ptest_base: Started
NOTE: recipe gtk4-4.22.4-r0: task do_fetch: Started
NOTE: recipe gtk4-4.22.4-r0: task do_fetch: Succeeded
NOTE: Running task 2941 of 3619 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/appstream/appstream_1.1.2.bb:do_fetch)
NOTE: recipe libxmlb-0.3.26-r0: task do_compile_ptest_base: Succeeded
NOTE: Running task 2942 of 3619 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-gnome/libxmlb/libxmlb_0.3.26.bb:do_install)
NOTE: recipe appstream-1.1.2-r0: task do_fetch: Started
NOTE: recipe appstream-1.1.2-r0: task do_fetch: Succeeded
NOTE: Running task 2964 of 3619 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/xorg-lib/libxtst_1.2.5.bb:do_deploy_source_date_epoch)
NOTE: recipe libxkbcommon-1.13.1-r0: task do_configure: Succeeded
NOTE: recipe libxmlb-0.3.26-r0: task do_install: Started
NOTE: Running task 2965 of 3619 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/xorg-lib/libxkbcommon_1.13.1.bb:do_compile)
NOTE: recipe libxtst-1_1.2.5-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe librsvg-2.62.2-r0: task do_fetch: Succeeded
NOTE: Setscene tasks completed
NOTE: Running task 2966 of 3619 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-gnome/librsvg/librsvg_2.62.2.bb:do_unpack)
NOTE: recipe libxkbcommon-1.13.1-r0: task do_compile: Started
NOTE: recipe libxtst-1_1.2.5-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: Task /srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/xorg-lib/libxtst_1.2.5.bb:do_deploy_source_date_epoch unihash changed to 24ba60406585344d1350a9f311f0fc2e0634045715030ca49fa0f99972b870ee
NOTE: Setscene tasks completed
NOTE: Running task 2968 of 3619 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-multimedia/sbc/sbc_2.2.bb:do_deploy_source_date_epoch)
NOTE: recipe librsvg-2.62.2-r0: task do_unpack: Started
NOTE: recipe sbc-2.2-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe libxmlb-0.3.26-r0: task do_install: Succeeded
NOTE: recipe libxi-1_1.8.3-r0: task do_compile: Succeeded
NOTE: Running task 2969 of 3619 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-gnome/libgudev/libgudev_238.bb:do_deploy_source_date_epoch)
NOTE: Running task 2970 of 3619 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/xorg-lib/libxi_1.8.3.bb:do_install)
NOTE: recipe sbc-2.2-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: Task /srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-multimedia/sbc/sbc_2.2.bb:do_deploy_source_date_epoch unihash changed to 77df565be99352dcc168daa2e8cec706a2ebd6aa830ddc9a73241e2c713f333b
NOTE: recipe libxi-1_1.8.3-r0: task do_install: Started
NOTE: Setscene tasks completed
NOTE: Running task 2971 of 3619 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-base_1.28.2.bb:do_deploy_source_date_epoch)
NOTE: recipe libgudev-238-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe gstreamer1.0-plugins-base-1.28.2-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe libgudev-238-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: Task /srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-gnome/libgudev/libgudev_238.bb:do_deploy_source_date_epoch unihash changed to 4f9d13590d3c80e4177b4a63bce550a56674fbe0a6d588e2a8e971eee4720d3a
NOTE: Setscene tasks completed
NOTE: Running task 2973 of 3619 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-multimedia/webp/libwebp_1.6.0.bb:do_prepare_recipe_sysroot)
NOTE: recipe gstreamer1.0-plugins-base-1.28.2-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: Task /srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-base_1.28.2.bb:do_deploy_source_date_epoch unihash changed to 25762f6dfd7e1becf65963840b338a4ae5f0f4bf7d8a04a07a6fccabe36d4449
NOTE: Setscene tasks completed
NOTE: Running task 2974 of 3619 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-gnome/libgudev/libgudev_238.bb:do_write_config)
NOTE: recipe libwebp-1.6.0-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe libxi-1_1.8.3-r0: task do_install: Succeeded
NOTE: Running task 2975 of 3619 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/xorg-lib/libxi_1.8.3.bb:do_populate_sysroot)
NOTE: recipe libgudev-238-r0: task do_write_config: Started
NOTE: recipe libxi-1_1.8.3-r0: task do_populate_sysroot: Started
NOTE: recipe libgudev-238-r0: task do_write_config: Succeeded
NOTE: Running task 2976 of 3619 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-gnome/libgudev/libgudev_238.bb:do_prepare_recipe_sysroot)
NOTE: recipe libwebp-1.6.0-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: Running task 2977 of 3619 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-base_1.28.2.bb:do_write_config)
NOTE: recipe libgudev-238-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe gstreamer1.0-plugins-base-1.28.2-r0: task do_write_config: Started
NOTE: recipe gstreamer1.0-plugins-base-1.28.2-r0: task do_write_config: Succeeded
NOTE: Running task 2978 of 3619 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-multimedia/webp/libwebp_1.6.0.bb:do_configure)
NOTE: recipe libwebp-1.6.0-r0: task do_configure: Started
NOTE: recipe libxi-1_1.8.3-r0: task do_populate_sysroot: Succeeded
NOTE: Running task 2979 of 3619 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/xorg-lib/libxtst_1.2.5.bb:do_prepare_recipe_sysroot)
NOTE: recipe libgudev-238-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: recipe libxtst-1_1.2.5-r0: task do_prepare_recipe_sysroot: Started
NOTE: Running task 2980 of 3619 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-gnome/libgudev/libgudev_238.bb:do_configure)
NOTE: recipe libgudev-238-r0: task do_configure: Started
NOTE: recipe libxtst-1_1.2.5-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: Running task 2981 of 3619 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/xorg-lib/libxtst_1.2.5.bb:do_configure)
NOTE: recipe libxtst-1_1.2.5-r0: task do_configure: Started
NOTE: recipe gdk-pixbuf-2.44.6-r0: task do_compile: Succeeded
NOTE: Running task 2982 of 3619 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-gnome/gdk-pixbuf/gdk-pixbuf_2.44.6.bb:do_compile_ptest_base)
NOTE: recipe gdk-pixbuf-2.44.6-r0: task do_compile_ptest_base: Started
NOTE: recipe gdk-pixbuf-2.44.6-r0: task do_compile_ptest_base: Succeeded
NOTE: Running task 2983 of 3619 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-gnome/gdk-pixbuf/gdk-pixbuf_2.44.6.bb:do_install)
NOTE: recipe gdk-pixbuf-2.44.6-r0: task do_install: Started
NOTE: recipe gstreamer1.0-1.28.2-r0: task do_compile: Succeeded
NOTE: Running task 2984 of 3619 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-multimedia/gstreamer/gstreamer1.0_1.28.2.bb:do_compile_ptest_base)
NOTE: recipe gstreamer1.0-1.28.2-r0: task do_compile_ptest_base: Started
NOTE: recipe gstreamer1.0-1.28.2-r0: task do_compile_ptest_base: Succeeded
NOTE: Running task 2985 of 3619 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-multimedia/gstreamer/gstreamer1.0_1.28.2.bb:do_install)
NOTE: recipe gstreamer1.0-1.28.2-r0: task do_install: Started
NOTE: recipe libvorbis-1.3.7-r0: task do_configure: Succeeded
NOTE: Setscene tasks completed
NOTE: Running task 2986 of 3619 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-multimedia/libvorbis/libvorbis_1.3.7.bb:do_compile)
NOTE: recipe libvorbis-1.3.7-r0: task do_compile: Started
NOTE: recipe libgudev-238-r0: task do_configure: Succeeded
NOTE: Running task 2987 of 3619 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-gnome/libgudev/libgudev_238.bb:do_compile)
NOTE: recipe libtheora-1.2.0-r0: task do_configure: Succeeded
NOTE: Setscene tasks completed
NOTE: Running task 2988 of 3619 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-multimedia/libtheora/libtheora_1.2.0.bb:do_compile)
NOTE: recipe libgudev-238-r0: task do_compile: Started
NOTE: recipe libtheora-1.2.0-r0: task do_compile: Started
NOTE: recipe libxv-1.0.13-r0: task do_configure: Succeeded
NOTE: Running task 2989 of 3619 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/xorg-lib/libxv_1.0.13.bb:do_compile)
NOTE: recipe libxkbcommon-1.13.1-r0: task do_compile: Succeeded
NOTE: Running task 2990 of 3619 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/xorg-lib/libxkbcommon_1.13.1.bb:do_install)
NOTE: recipe libxv-1.0.13-r0: task do_compile: Started
NOTE: recipe libxkbcommon-1.13.1-r0: task do_install: Started
NOTE: recipe gdk-pixbuf-2.44.6-r0: task do_install: Succeeded
NOTE: Running task 2991 of 3619 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-gnome/gdk-pixbuf/gdk-pixbuf_2.44.6.bb:do_install_ptest_base)
NOTE: recipe gdk-pixbuf-2.44.6-r0: task do_install_ptest_base: Started
NOTE: recipe gdk-pixbuf-2.44.6-r0: task do_install_ptest_base: Succeeded
NOTE: Running task 2992 of 3619 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-gnome/gdk-pixbuf/gdk-pixbuf_2.44.6.bb:do_populate_sysroot)
NOTE: recipe libxv-1.0.13-r0: task do_compile: Succeeded
NOTE: recipe librsvg-2.62.2-r0: task do_unpack: Succeeded
NOTE: recipe gdk-pixbuf-2.44.6-r0: task do_populate_sysroot: Started
NOTE: Running task 2993 of 3619 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/xorg-lib/libxv_1.0.13.bb:do_install)
NOTE: Running task 2994 of 3619 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-gnome/librsvg/librsvg_2.62.2.bb:do_patch)
NOTE: recipe gstreamer1.0-1.28.2-r0: task do_install: Succeeded
NOTE: Running task 2995 of 3619 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-multimedia/gstreamer/gstreamer1.0_1.28.2.bb:do_install_ptest_base)
NOTE: recipe libxv-1.0.13-r0: task do_install: Started
NOTE: recipe libvorbis-1.3.7-r0: task do_compile: Succeeded
NOTE: Running task 2996 of 3619 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-multimedia/libvorbis/libvorbis_1.3.7.bb:do_install)
NOTE: recipe libxkbcommon-1.13.1-r0: task do_install: Succeeded
NOTE: recipe librsvg-2.62.2-r0: task do_patch: Started
NOTE: Running task 2997 of 3619 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/xorg-lib/libxkbcommon_1.13.1.bb:do_populate_sysroot)
NOTE: recipe gstreamer1.0-1.28.2-r0: task do_install_ptest_base: Started
NOTE: recipe libvorbis-1.3.7-r0: task do_install: Started
NOTE: recipe gstreamer1.0-1.28.2-r0: task do_install_ptest_base: Succeeded
NOTE: recipe libxkbcommon-1.13.1-r0: task do_populate_sysroot: Started
NOTE: Running task 2998 of 3619 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-multimedia/gstreamer/gstreamer1.0_1.28.2.bb:do_populate_sysroot)
NOTE: recipe gdk-pixbuf-2.44.6-r0: task do_populate_sysroot: Succeeded
NOTE: Running task 3005 of 3619 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/xorg-lib/libxi_1.8.3.bb:do_package)
NOTE: recipe gstreamer1.0-1.28.2-r0: task do_populate_sysroot: Started
NOTE: recipe librsvg-2.62.2-r0: task do_patch: Succeeded
NOTE: Running task 3006 of 3619 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-gnome/librsvg/librsvg_2.62.2.bb:do_deploy_source_date_epoch)
NOTE: recipe libxi-1_1.8.3-r0: task do_package: Started
NOTE: recipe libxv-1.0.13-r0: task do_install: Succeeded
NOTE: Running task 3007 of 3619 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-gnome/librsvg/librsvg_2.62.2.bb:do_rust_gen_targets)
NOTE: recipe libxkbcommon-1.13.1-r0: task do_populate_sysroot: Succeeded
NOTE: Running task 3008 of 3619 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/xorg-lib/libxv_1.0.13.bb:do_populate_sysroot)
NOTE: recipe librsvg-2.62.2-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe librsvg-2.62.2-r0: task do_rust_gen_targets: Started
NOTE: recipe librsvg-2.62.2-r0: task do_rust_gen_targets: Succeeded
NOTE: recipe libxv-1.0.13-r0: task do_populate_sysroot: Started
NOTE: Running task 3029 of 3619 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-gnome/gtk+/gtk4_4.22.4.bb:do_unpack)
NOTE: recipe librsvg-2.62.2-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: Task /srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-gnome/librsvg/librsvg_2.62.2.bb:do_deploy_source_date_epoch unihash changed to 0aafef562b3e0ac29555029a0ff4c70ca7d038afcd6911f82293ccbe515ff151
NOTE: recipe libtheora-1.2.0-r0: task do_compile: Succeeded
NOTE: recipe gtk4-4.22.4-r0: task do_unpack: Started
NOTE: Setscene tasks completed
NOTE: Running task 3030 of 3619 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-multimedia/libtheora/libtheora_1.2.0.bb:do_install)
NOTE: recipe gstreamer1.0-1.28.2-r0: task do_populate_sysroot: Succeeded
NOTE: Running task 3031 of 3619 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/appstream/appstream_1.1.2.bb:do_unpack)
NOTE: Running task 3035 of 3619 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-core/base-files/base-files_3.0.14.bb:do_package)
NOTE: recipe libvorbis-1.3.7-r0: task do_install: Succeeded
NOTE: recipe appstream-1.1.2-r0: task do_unpack: Started
NOTE: recipe libtheora-1.2.0-r0: task do_install: Started
NOTE: Running task 3036 of 3619 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-multimedia/libvorbis/libvorbis_1.3.7.bb:do_populate_sysroot)
NOTE: recipe base-files-3.0.14-r0: task do_package: Started
NOTE: recipe libxv-1.0.13-r0: task do_populate_sysroot: Succeeded
NOTE: recipe libvorbis-1.3.7-r0: task do_populate_sysroot: Started
NOTE: Running task 3037 of 3619 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-multimedia/libvorbis/libvorbis_1.3.7.bb:do_package)
NOTE: recipe appstream-1.1.2-r0: task do_unpack: Succeeded
NOTE: Running task 3040 of 3619 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/appstream/appstream_1.1.2.bb:do_patch)
NOTE: recipe libvorbis-1.3.7-r0: task do_package: Started
NOTE: recipe appstream-1.1.2-r0: task do_patch: Started
NOTE: recipe shared-mime-info-2.4-r0: task do_package: Succeeded
NOTE: Running task 3041 of 3619 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/shared-mime-info/shared-mime-info_2.4.bb:do_packagedata)
NOTE: recipe shared-mime-info-2.4-r0: task do_packagedata: Started
NOTE: recipe libvorbis-1.3.7-r0: task do_populate_sysroot: Succeeded
NOTE: Running task 3047 of 3619 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/fribidi/fribidi_1.0.16.bb:do_create_recipe_spdx)
NOTE: recipe appstream-1.1.2-r0: task do_patch: Succeeded
NOTE: Running task 3048 of 3619 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/harfbuzz/harfbuzz_14.2.0.bb:do_create_recipe_spdx)
NOTE: recipe libgudev-238-r0: task do_compile: Succeeded
NOTE: recipe fribidi-1.0.16-r0: task do_create_recipe_spdx: Started
NOTE: recipe libtheora-1.2.0-r0: task do_install: Succeeded
NOTE: Running task 3049 of 3619 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-gnome/libgudev/libgudev_238.bb:do_install)
NOTE: Running task 3050 of 3619 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-multimedia/libtheora/libtheora_1.2.0.bb:do_populate_sysroot)
NOTE: recipe harfbuzz-14.2.0-r0: task do_create_recipe_spdx: Started
NOTE: recipe libtheora-1.2.0-r0: task do_populate_sysroot: Started
NOTE: recipe libgudev-238-r0: task do_install: Started
NOTE: recipe gtk4-4.22.4-r0: task do_unpack: Succeeded
NOTE: recipe fribidi-1.0.16-r0: task do_create_recipe_spdx: Succeeded
NOTE: Running task 3051 of 3619 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-gnome/gtk+/gtk4_4.22.4.bb:do_patch)
NOTE: Running task 3062 of 3619 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/xorg-lib/libxft_2.3.9.bb:do_create_recipe_spdx)
NOTE: recipe gtk4-4.22.4-r0: task do_patch: Started
NOTE: recipe harfbuzz-14.2.0-r0: task do_create_recipe_spdx: Succeeded
NOTE: recipe libxft-1_2.3.9-r0: task do_create_recipe_spdx: Started
NOTE: Running task 3063 of 3619 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/xorg-lib/libxcomposite_0.4.7.bb:do_deploy_source_date_epoch)
NOTE: recipe gtk4-4.22.4-r0: task do_patch: Succeeded
NOTE: Running task 3064 of 3619 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/atk/at-spi2-core_2.60.4.bb:do_deploy_source_date_epoch)
NOTE: recipe shared-mime-info-2.4-r0: task do_packagedata: Succeeded
NOTE: Task /srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/shared-mime-info/shared-mime-info_2.4.bb:do_packagedata unihash changed to 6e067d0ecfa58a707bd794cea42bdd9661323e9199cb5f84d776c18fa7b3ea0f
NOTE: Setscene tasks completed
NOTE: Running task 3065 of 3619 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-gnome/gdk-pixbuf/gdk-pixbuf_2.44.6.bb:do_package)
NOTE: recipe libxcomposite-1_0.4.7-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe libtheora-1.2.0-r0: task do_populate_sysroot: Succeeded
NOTE: recipe libxft-1_2.3.9-r0: task do_create_recipe_spdx: Succeeded
NOTE: Running task 3066 of 3619 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-bad_1.28.2.bb:do_deploy_source_date_epoch)
NOTE: Running task 3068 of 3619 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/graphene/graphene_1.10.8.bb:do_deploy_source_date_epoch)
NOTE: recipe at-spi2-core-2.60.4-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe graphene-1.10.8-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe gstreamer1.0-plugins-bad-1.28.2-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe gdk-pixbuf-2.44.6-r0: task do_package: Started
NOTE: recipe libxcomposite-1_0.4.7-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: Task /srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/xorg-lib/libxcomposite_0.4.7.bb:do_deploy_source_date_epoch unihash changed to 85819d071d9c6f524ecaecdb6ff5d8ea039f769e2688a7f3f860b451e72843e8
NOTE: recipe at-spi2-core-2.60.4-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: recipe libgudev-238-r0: task do_install: Succeeded
NOTE: Task /srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/atk/at-spi2-core_2.60.4.bb:do_deploy_source_date_epoch unihash changed to 398a38d0ad9c86feb9f034dd4997328758faf19c35ddf2d860c7a34005a2e6ff
NOTE: recipe graphene-1.10.8-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: recipe gstreamer1.0-plugins-bad-1.28.2-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: Task /srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/graphene/graphene_1.10.8.bb:do_deploy_source_date_epoch unihash changed to df565cc150da9ad44a6e90d5f273c5ff654a5f8dcfcd3c8c3451a6e9b1adb457
NOTE: Task /srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-bad_1.28.2.bb:do_deploy_source_date_epoch unihash changed to 2f25c1b16e996155498adbab7abd2c658073b48000ed022e72920fbb41878127
NOTE: Setscene tasks completed
NOTE: Running task 3069 of 3619 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-gnome/libgudev/libgudev_238.bb:do_populate_sysroot)
NOTE: Running task 3070 of 3619 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/xorg-lib/libxcursor_1.2.3.bb:do_deploy_source_date_epoch)
NOTE: Running task 3072 of 3619 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/xorg-lib/libxinerama_1.1.6.bb:do_deploy_source_date_epoch)
NOTE: Running task 3074 of 3619 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-multimedia/gstreamer/gstreamer1.0_1.28.2.bb:do_package)
NOTE: Running task 3075 of 3619 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/orc/orc_0.4.42.bb:do_package)
NOTE: recipe libxcursor-1_1.2.3-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe libxinerama-1_1.1.6-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe libgudev-238-r0: task do_populate_sysroot: Started
NOTE: recipe gstreamer1.0-1.28.2-r0: task do_package: Started
NOTE: recipe orc-0.4.42-r0: task do_package: Started
NOTE: recipe libxi-1_1.8.3-r0: task do_package: Succeeded
NOTE: recipe libxinerama-1_1.1.6-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: recipe libxcursor-1_1.2.3-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: Task /srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/xorg-lib/libxinerama_1.1.6.bb:do_deploy_source_date_epoch unihash changed to ea7d1af69bd20eacb114257902c0423f308f69a5874cfd7d41f260c6f6bbcd48
NOTE: recipe base-files-3.0.14-r0: task do_package: Succeeded
NOTE: Task /srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/xorg-lib/libxcursor_1.2.3.bb:do_deploy_source_date_epoch unihash changed to 60208da05b72ebc099a80a4ac6494b2c5172c8edb2de9a53e77089b607eb28b7
NOTE: Setscene tasks completed
NOTE: Running task 3076 of 3619 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/xorg-lib/libxi_1.8.3.bb:do_packagedata)
NOTE: Running task 3077 of 3619 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-core/base-files/base-files_3.0.14.bb:do_packagedata)
NOTE: Running task 3078 of 3619 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/xorg-lib/xkeyboard-config_2.47.bb:do_package)
NOTE: Running task 3082 of 3619 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/xorg-lib/libxcomposite_0.4.7.bb:do_prepare_recipe_sysroot)
NOTE: recipe libgudev-238-r0: task do_populate_sysroot: Succeeded
NOTE: recipe libxi-1_1.8.3-r0: task do_packagedata: Started
NOTE: recipe base-files-3.0.14-r0: task do_packagedata: Started
NOTE: Running task 3083 of 3619 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/atk/at-spi2-core_2.60.4.bb:do_write_config)
NOTE: recipe libxcomposite-1_0.4.7-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe xkeyboard-config-2.47-r0: task do_package: Started
NOTE: recipe at-spi2-core-2.60.4-r0: task do_write_config: Started
NOTE: recipe at-spi2-core-2.60.4-r0: task do_write_config: Succeeded
NOTE: Running task 3084 of 3619 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-bad_1.28.2.bb:do_write_config)
NOTE: recipe libxi-1_1.8.3-r0: task do_packagedata: Succeeded
NOTE: recipe libxcomposite-1_0.4.7-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: Task /srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/xorg-lib/libxi_1.8.3.bb:do_packagedata unihash changed to 89c6cd0edc6dfd32a4239b0cd1614f20957d62df2fdb06d2e385ba119cb8e9bb
NOTE: recipe base-files-3.0.14-r0: task do_packagedata: Succeeded
NOTE: recipe gstreamer1.0-plugins-bad-1.28.2-r0: task do_write_config: Started
NOTE: Task /srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-core/base-files/base-files_3.0.14.bb:do_packagedata unihash changed to 27a1287f03f8699e6a83b8e7203f6b85f617ccd1b7f11fa183cd486905f39fba
NOTE: Reported task /srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-core/base-files/base-files_3.0.14.bb:do_create_spdx as unihash 17792610ca9af8915defba559870e798075c94794e5c20f680575d07feb679ba to wss://hashserv-eu.yoctoproject.org/ws ({'taskhash': '5b9134403cfd97c7f80c9ad4bbe9c514d811fa7b95fe6eeab9148191b33f3d84', 'method': 'oe.sstatesig.OEOuthashBasic', 'unihash': '17792610ca9af8915defba559870e798075c94794e5c20f680575d07feb679ba'})
NOTE: Task /srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-core/base-files/base-files_3.0.14.bb:do_create_spdx unihash changed 5b9134403cfd97c7f80c9ad4bbe9c514d811fa7b95fe6eeab9148191b33f3d84 -> 17792610ca9af8915defba559870e798075c94794e5c20f680575d07feb679ba as wanted
NOTE: Already covered setscene for /srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-core/base-files/base-files_3.0.14.bb:do_create_spdx so ignoring rehash (remap)
NOTE: recipe gstreamer1.0-plugins-bad-1.28.2-r0: task do_write_config: Succeeded
NOTE: recipe flac-1.5.0-r0: task do_configure: Succeeded
NOTE: Setscene tasks completed
NOTE: Running task 3086 of 3619 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/libepoxy/libepoxy_1.5.10.bb:do_write_config)
NOTE: Running task 3087 of 3619 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/graphene/graphene_1.10.8.bb:do_write_config)
NOTE: Setscene tasks completed
NOTE: Running task 3088 of 3619 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-multimedia/flac/flac_1.5.0.bb:do_compile)
NOTE: Running task 3089 of 3619 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/graphene/graphene_1.10.8.bb:do_prepare_recipe_sysroot)
NOTE: Running task 3090 of 3619 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/xorg-lib/libxcursor_1.2.3.bb:do_prepare_recipe_sysroot)
NOTE: recipe libepoxy-1.5.10-r0: task do_write_config: Started
NOTE: recipe graphene-1.10.8-r0: task do_write_config: Started
NOTE: recipe flac-1.5.0-r0: task do_compile: Started
NOTE: recipe libwebp-1.6.0-r0: task do_configure: Succeeded
NOTE: recipe libxcursor-1_1.2.3-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe graphene-1.10.8-r0: task do_prepare_recipe_sysroot: Started
NOTE: Running task 3091 of 3619 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-multimedia/webp/libwebp_1.6.0.bb:do_compile)
NOTE: recipe libepoxy-1.5.10-r0: task do_write_config: Succeeded
NOTE: recipe graphene-1.10.8-r0: task do_write_config: Succeeded
NOTE: Running task 3093 of 3619 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/xorg-lib/libxinerama_1.1.6.bb:do_prepare_recipe_sysroot)
NOTE: Running task 3094 of 3619 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/libfyaml/libfyaml_0.9.4.bb:do_prepare_recipe_sysroot)
NOTE: recipe libwebp-1.6.0-r0: task do_compile: Started
NOTE: recipe libxinerama-1_1.1.6-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe libfyaml-0.9.4-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe libxcursor-1_1.2.3-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: Running task 3095 of 3619 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/xorg-lib/libxcomposite_0.4.7.bb:do_configure)
NOTE: recipe libfyaml-0.9.4-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: recipe libxinerama-1_1.1.6-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: Running task 3096 of 3619 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/xorg-lib/libxcursor_1.2.3.bb:do_configure)
NOTE: Running task 3098 of 3619 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/xorg-lib/libxinerama_1.1.6.bb:do_configure)
NOTE: recipe libxcomposite-1_0.4.7-r0: task do_configure: Started
NOTE: recipe alsa-lib-1.2.15.3-r0: task do_compile: Succeeded
NOTE: recipe libvorbis-1.3.7-r0: task do_package: Succeeded
NOTE: Running task 3099 of 3619 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-multimedia/alsa/alsa-lib_1.2.15.3.bb:do_install)
NOTE: Running task 3100 of 3619 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-multimedia/libvorbis/libvorbis_1.3.7.bb:do_packagedata)
NOTE: recipe libxinerama-1_1.1.6-r0: task do_configure: Started
NOTE: recipe libxcursor-1_1.2.3-r0: task do_configure: Started
NOTE: recipe graphene-1.10.8-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: Running task 3101 of 3619 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/graphene/graphene_1.10.8.bb:do_configure)
NOTE: recipe alsa-lib-1.2.15.3-r0: task do_install: Started
NOTE: recipe libvorbis-1.3.7-r0: task do_packagedata: Started
NOTE: recipe graphene-1.10.8-r0: task do_configure: Started
NOTE: recipe libvorbis-1.3.7-r0: task do_packagedata: Succeeded
NOTE: Task /srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-multimedia/libvorbis/libvorbis_1.3.7.bb:do_packagedata unihash changed to c7658ea4e1db7d0305a5de68f5e6140e1430e59cce32dccebef48be22f2274db
NOTE: Setscene tasks completed
NOTE: Running task 3102 of 3619 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/libfyaml/libfyaml_0.9.4.bb:do_configure)
NOTE: recipe orc-0.4.42-r0: task do_package: Succeeded
NOTE: recipe libfyaml-0.9.4-r0: task do_configure: Started
NOTE: Running task 3105 of 3619 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-gnome/libxmlb/libxmlb_0.3.26.bb:do_install_ptest_base)
NOTE: recipe libxtst-1_1.2.5-r0: task do_configure: Succeeded
NOTE: Setscene tasks completed
NOTE: Running task 3106 of 3619 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/xorg-lib/libxtst_1.2.5.bb:do_compile)
NOTE: recipe libxtst-1_1.2.5-r0: task do_compile: Started
NOTE: recipe libxmlb-0.3.26-r0: task do_install_ptest_base: Started
NOTE: recipe libxmlb-0.3.26-r0: task do_install_ptest_base: Succeeded
NOTE: Running task 3108 of 3619 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/orc/orc_0.4.42.bb:do_packagedata)
NOTE: recipe orc-0.4.42-r0: task do_packagedata: Started
NOTE: recipe orc-0.4.42-r0: task do_packagedata: Succeeded
NOTE: Task /srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/orc/orc_0.4.42.bb:do_packagedata unihash changed to d945c13c1f805517683472757c9e0b65279727b18b809dda48b7c16dfe21b70a
NOTE: recipe libxtst-1_1.2.5-r0: task do_compile: Succeeded
NOTE: Setscene tasks completed
NOTE: Running task 3109 of 3619 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/xorg-lib/libxtst_1.2.5.bb:do_install)
NOTE: recipe alsa-lib-1.2.15.3-r0: task do_install: Succeeded
NOTE: Running task 3139 of 3619 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/pango/pango_1.57.1.bb:do_create_recipe_spdx)
NOTE: Running task 3140 of 3619 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-multimedia/alsa/alsa-lib_1.2.15.3.bb:do_populate_sysroot)
NOTE: recipe pango-1.57.1-r0: task do_create_recipe_spdx: Started
NOTE: recipe libxtst-1_1.2.5-r0: task do_install: Started
NOTE: recipe alsa-lib-1.2.15.3-r0: task do_populate_sysroot: Started
NOTE: recipe pango-1.57.1-r0: task do_create_recipe_spdx: Succeeded
NOTE: Running task 3141 of 3619 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-multimedia/alsa/alsa-lib_1.2.15.3.bb:do_package)
NOTE: recipe alsa-lib-1.2.15.3-r0: task do_package: Started
NOTE: recipe libxtst-1_1.2.5-r0: task do_install: Succeeded
NOTE: recipe alsa-lib-1.2.15.3-r0: task do_populate_sysroot: Succeeded
NOTE: Running task 3142 of 3619 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/xorg-lib/libxtst_1.2.5.bb:do_populate_sysroot)
NOTE: Running task 3143 of 3619 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-gnome/libadwaita/libadwaita_1.9.1.bb:do_recipe_qa)
NOTE: recipe libxtst-1_1.2.5-r0: task do_populate_sysroot: Started
NOTE: recipe libadwaita-1.9.1-r0: task do_recipe_qa: Started
NOTE: recipe libadwaita-1.9.1-r0: task do_recipe_qa: Succeeded
NOTE: Running task 3144 of 3619 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-gnome/libadwaita/libadwaita_1.9.1.bb:do_fetch)
NOTE: recipe libadwaita-1.9.1-r0: task do_fetch: Started
NOTE: recipe libadwaita-1.9.1-r0: task do_fetch: Succeeded
NOTE: Running task 3146 of 3619 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/vala/vala_0.56.19.bb:do_create_recipe_spdx)
NOTE: recipe libxtst-1_1.2.5-r0: task do_populate_sysroot: Succeeded
NOTE: recipe vala-0.56.19-r0: task do_create_recipe_spdx: Started
NOTE: Running task 3147 of 3619 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/atk/at-spi2-core_2.60.4.bb:do_prepare_recipe_sysroot)
NOTE: recipe at-spi2-core-2.60.4-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe vala-0.56.19-r0: task do_create_recipe_spdx: Succeeded
NOTE: Running task 3152 of 3619 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/mesa/mesa.bb:do_create_recipe_spdx)
NOTE: recipe mesa-2_26.0.6-r0: task do_create_recipe_spdx: Started
NOTE: recipe mesa-2_26.0.6-r0: task do_create_recipe_spdx: Succeeded
NOTE: Running task 3155 of 3619 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/shared-mime-info/shared-mime-info_2.4.bb:do_create_recipe_spdx)
NOTE: recipe shared-mime-info-2.4-r0: task do_create_recipe_spdx: Started
NOTE: recipe at-spi2-core-2.60.4-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: recipe shared-mime-info-2.4-r0: task do_create_recipe_spdx: Succeeded
NOTE: recipe xkeyboard-config-2.47-r0: task do_package: Succeeded
NOTE: Running task 3156 of 3619 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/atk/at-spi2-core_2.60.4.bb:do_configure)
NOTE: Running task 3161 of 3619 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/xorg-lib/xkeyboard-config_2.47.bb:do_packagedata)
NOTE: Running task 3191 of 3619 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-gnome/libxmlb/libxmlb_0.3.26.bb:do_populate_sysroot)
NOTE: recipe at-spi2-core-2.60.4-r0: task do_configure: Started
NOTE: recipe xkeyboard-config-2.47-r0: task do_packagedata: Started
NOTE: recipe libxmlb-0.3.26-r0: task do_populate_sysroot: Started
NOTE: recipe graphene-1.10.8-r0: task do_configure: Succeeded
NOTE: Running task 3192 of 3619 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/graphene/graphene_1.10.8.bb:do_compile)
NOTE: recipe xkeyboard-config-2.47-r0: task do_packagedata: Succeeded
NOTE: Task /srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/xorg-lib/xkeyboard-config_2.47.bb:do_packagedata unihash changed to 73d788881519ecfa52eda71ce71ff71dccd00d3025edff7140f518e792f86e06
NOTE: recipe graphene-1.10.8-r0: task do_compile: Started
NOTE: recipe libxmlb-0.3.26-r0: task do_populate_sysroot: Succeeded
NOTE: Setscene tasks completed
NOTE: Running task 3193 of 3619 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/xorg-lib/libxkbcommon_1.13.1.bb:do_package)
NOTE: Running task 3194 of 3619 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-gnome/gtk+/gtk4_4.22.4.bb:do_deploy_source_date_epoch)
NOTE: recipe gtk4-4.22.4-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe libxkbcommon-1.13.1-r0: task do_package: Started
NOTE: recipe gtk4-4.22.4-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: Task /srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-gnome/gtk+/gtk4_4.22.4.bb:do_deploy_source_date_epoch unihash changed to f52cfe925f400c94c4fa351d580d47526b2bbd9f1489f45ed3f3b109a27c138b
NOTE: Setscene tasks completed
NOTE: Running task 3195 of 3619 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/appstream/appstream_1.1.2.bb:do_deploy_source_date_epoch)
NOTE: recipe appstream-1.1.2-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe appstream-1.1.2-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: Task /srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/appstream/appstream_1.1.2.bb:do_deploy_source_date_epoch unihash changed to 1fc129d39c2dc93bbc47cd63df3b2257b9c647039727b93f101a2d7d5a40abb8
NOTE: Setscene tasks completed
NOTE: Running task 3198 of 3619 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-gnome/libadwaita/libadwaita_1.9.1.bb:do_unpack)
NOTE: recipe alsa-lib-1.2.15.3-r0: task do_package: Succeeded
NOTE: recipe libadwaita-1.9.1-r0: task do_unpack: Started
NOTE: Running task 3199 of 3619 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-multimedia/alsa/alsa-lib_1.2.15.3.bb:do_packagedata)
NOTE: recipe alsa-lib-1.2.15.3-r0: task do_packagedata: Started
NOTE: recipe libadwaita-1.9.1-r0: task do_unpack: Succeeded
NOTE: Running task 3201 of 3619 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-multimedia/libtheora/libtheora_1.2.0.bb:do_package)
NOTE: recipe libtheora-1.2.0-r0: task do_package: Started
NOTE: recipe alsa-lib-1.2.15.3-r0: task do_packagedata: Succeeded
NOTE: Task /srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-multimedia/alsa/alsa-lib_1.2.15.3.bb:do_packagedata unihash changed to c459ae26115948e89bfd28a8d33350c8b150637cb886beb99da23dcebe307394
NOTE: Setscene tasks completed
NOTE: Running task 3202 of 3619 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/xorg-lib/libxv_1.0.13.bb:do_package)
NOTE: recipe libxv-1.0.13-r0: task do_package: Started
NOTE: recipe libxkbcommon-1.13.1-r0: task do_package: Succeeded
NOTE: Running task 3203 of 3619 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/xorg-lib/libxkbcommon_1.13.1.bb:do_packagedata)
NOTE: recipe libxkbcommon-1.13.1-r0: task do_packagedata: Started
NOTE: recipe libxkbcommon-1.13.1-r0: task do_packagedata: Succeeded
NOTE: Task /srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/xorg-lib/libxkbcommon_1.13.1.bb:do_packagedata unihash changed to 06be307abd770c93da76f564e4b2969f12caf67691e9074db7eb9cf7b6c6d557
NOTE: Setscene tasks completed
NOTE: Running task 3205 of 3619 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-gnome/gtk+/gtk4_4.22.4.bb:do_write_config)
NOTE: recipe gtk4-4.22.4-r0: task do_write_config: Started
NOTE: recipe gtk4-4.22.4-r0: task do_write_config: Succeeded
NOTE: Running task 3206 of 3619 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/appstream/appstream_1.1.2.bb:do_write_config)
NOTE: recipe appstream-1.1.2-r0: task do_write_config: Started
NOTE: recipe appstream-1.1.2-r0: task do_write_config: Succeeded
NOTE: recipe libwebp-1.6.0-r0: task do_compile: Succeeded
NOTE: Running task 3207 of 3619 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-multimedia/webp/libwebp_1.6.0.bb:do_install)
NOTE: Running task 3210 of 3619 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-gnome/libadwaita/libadwaita_1.9.1.bb:do_patch)
NOTE: recipe libadwaita-1.9.1-r0: task do_patch: Started
NOTE: recipe libwebp-1.6.0-r0: task do_install: Started
NOTE: recipe gdk-pixbuf-2.44.6-r0: task do_package: Succeeded
NOTE: recipe flac-1.5.0-r0: task do_compile: Succeeded
NOTE: Running task 3211 of 3619 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-gnome/gdk-pixbuf/gdk-pixbuf_2.44.6.bb:do_packagedata)
NOTE: recipe libadwaita-1.9.1-r0: task do_patch: Succeeded
NOTE: Running task 3212 of 3619 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-multimedia/flac/flac_1.5.0.bb:do_install)
NOTE: Running task 3222 of 3619 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/xorg-lib/libxtst_1.2.5.bb:do_package)
NOTE: recipe libtheora-1.2.0-r0: task do_package: Succeeded
NOTE: recipe gdk-pixbuf-2.44.6-r0: task do_packagedata: Started
NOTE: recipe libxinerama-1_1.1.6-r0: task do_configure: Succeeded
NOTE: Running task 3223 of 3619 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/xorg-lib/libxinerama_1.1.6.bb:do_compile)
NOTE: recipe flac-1.5.0-r0: task do_install: Started
NOTE: Running task 3224 of 3619 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-multimedia/libtheora/libtheora_1.2.0.bb:do_packagedata)
NOTE: recipe libxcomposite-1_0.4.7-r0: task do_configure: Succeeded
NOTE: recipe libxtst-1_1.2.5-r0: task do_package: Started
NOTE: Running task 3225 of 3619 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/xorg-lib/libxcomposite_0.4.7.bb:do_compile)
NOTE: recipe gstreamer1.0-1.28.2-r0: task do_package: Succeeded
NOTE: recipe libxinerama-1_1.1.6-r0: task do_compile: Started
NOTE: recipe libtheora-1.2.0-r0: task do_packagedata: Started
NOTE: Running task 3226 of 3619 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-multimedia/gstreamer/gstreamer1.0_1.28.2.bb:do_packagedata)
NOTE: recipe libxcomposite-1_0.4.7-r0: task do_compile: Started
NOTE: recipe at-spi2-core-2.60.4-r0: task do_configure: Succeeded
NOTE: Running task 3227 of 3619 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/atk/at-spi2-core_2.60.4.bb:do_compile)
NOTE: recipe libxv-1.0.13-r0: task do_package: Succeeded
NOTE: Running task 3228 of 3619 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/xorg-lib/libxv_1.0.13.bb:do_packagedata)
NOTE: recipe gstreamer1.0-1.28.2-r0: task do_packagedata: Started
NOTE: recipe libxcursor-1_1.2.3-r0: task do_configure: Succeeded
NOTE: Running task 3229 of 3619 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/xorg-lib/libxcursor_1.2.3.bb:do_compile)
NOTE: recipe at-spi2-core-2.60.4-r0: task do_compile: Started
NOTE: recipe libxv-1.0.13-r0: task do_packagedata: Started
NOTE: recipe libtheora-1.2.0-r0: task do_packagedata: Succeeded
NOTE: recipe libxcursor-1_1.2.3-r0: task do_compile: Started
NOTE: Task /srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-multimedia/libtheora/libtheora_1.2.0.bb:do_packagedata unihash changed to 38440443559d0e4644381a96cba7ef97c2241e02cc9c668dedd07a85e9bd4dbe
NOTE: Running task 3231 of 3619 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-gnome/libgudev/libgudev_238.bb:do_package)
NOTE: recipe libxinerama-1_1.1.6-r0: task do_compile: Succeeded
NOTE: Running task 3232 of 3619 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/xorg-lib/libxinerama_1.1.6.bb:do_install)
NOTE: recipe libxcomposite-1_0.4.7-r0: task do_compile: Succeeded
NOTE: Running task 3233 of 3619 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/xorg-lib/libxcomposite_0.4.7.bb:do_install)
NOTE: recipe libxv-1.0.13-r0: task do_packagedata: Succeeded
NOTE: recipe vala-0.56.19-r0: task do_compile: Succeeded
NOTE: Task /srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/xorg-lib/libxv_1.0.13.bb:do_packagedata unihash changed to aea4b599669c7226437c5b7bae13189b952aaf10ef5de8308f22cdbabdb6206c
NOTE: recipe libgudev-238-r0: task do_package: Started
NOTE: recipe libxinerama-1_1.1.6-r0: task do_install: Started
NOTE: Running task 3234 of 3619 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/vala/vala_0.56.19.bb:do_install)
NOTE: recipe gstreamer1.0-1.28.2-r0: task do_packagedata: Succeeded
NOTE: Running task 3237 of 3619 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/xorg-lib/libxi_1.8.3.bb:do_create_recipe_spdx)
NOTE: recipe libxcomposite-1_0.4.7-r0: task do_install: Started
NOTE: Task /srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-multimedia/gstreamer/gstreamer1.0_1.28.2.bb:do_packagedata unihash changed to 5b9c9b68737569a60ba225d8e12580cfd5c6fd785729c1b534f92cb62ea55aa6
NOTE: recipe graphene-1.10.8-r0: task do_compile: Succeeded
NOTE: recipe gdk-pixbuf-2.44.6-r0: task do_packagedata: Succeeded
NOTE: Task /srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-gnome/gdk-pixbuf/gdk-pixbuf_2.44.6.bb:do_packagedata unihash changed to a53b2979987333375795f0e186de06774fdc4aca7cb018e8832d3967d09ba5fa
NOTE: recipe libxi-1_1.8.3-r0: task do_create_recipe_spdx: Started
NOTE: recipe vala-0.56.19-r0: task do_install: Started
NOTE: Setscene tasks completed
NOTE: Running task 3238 of 3619 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/graphene/graphene_1.10.8.bb:do_install)
NOTE: Running task 3242 of 3619 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-gnome/gdk-pixbuf/gdk-pixbuf_2.44.6.bb:do_create_recipe_spdx)
NOTE: Running task 3256 of 3619 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-multimedia/libogg/libogg_1.3.6.bb:do_create_spdx)
NOTE: recipe libwebp-1.6.0-r0: task do_install: Succeeded
NOTE: Running task 3257 of 3619 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-multimedia/webp/libwebp_1.6.0.bb:do_populate_sysroot)
NOTE: recipe libxinerama-1_1.1.6-r0: task do_install: Succeeded
NOTE: recipe gdk-pixbuf-2.44.6-r0: task do_create_recipe_spdx: Started
NOTE: recipe libxi-1_1.8.3-r0: task do_create_recipe_spdx: Succeeded
NOTE: recipe libogg-1.3.6-r0: task do_create_spdx: Started
NOTE: Running task 3258 of 3619 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/xorg-lib/libxinerama_1.1.6.bb:do_populate_sysroot)
NOTE: recipe libxcursor-1_1.2.3-r0: task do_compile: Succeeded
NOTE: recipe graphene-1.10.8-r0: task do_install: Started
NOTE: Running task 3259 of 3619 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-multimedia/webp/libwebp_1.6.0.bb:do_package)
NOTE: Running task 3260 of 3619 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/xorg-lib/libxcursor_1.2.3.bb:do_install)
NOTE: recipe libxcomposite-1_0.4.7-r0: task do_install: Succeeded
NOTE: recipe libwebp-1.6.0-r0: task do_populate_sysroot: Started
NOTE: Running task 3261 of 3619 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/xorg-lib/libxcomposite_0.4.7.bb:do_populate_sysroot)
NOTE: recipe libxinerama-1_1.1.6-r0: task do_populate_sysroot: Started
NOTE: recipe libwebp-1.6.0-r0: task do_package: Started
NOTE: recipe libxcursor-1_1.2.3-r0: task do_install: Started
NOTE: recipe libxcomposite-1_0.4.7-r0: task do_populate_sysroot: Started
NOTE: recipe gdk-pixbuf-2.44.6-r0: task do_create_recipe_spdx: Succeeded
NOTE: Running task 3262 of 3619 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/xorg-lib/libxcomposite_0.4.7.bb:do_package)
NOTE: recipe libogg-1.3.6-r0: task do_create_spdx: Succeeded
NOTE: Running task 3264 of 3619 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/xorg-lib/libxinerama_1.1.6.bb:do_package)
NOTE: recipe libxcomposite-1_0.4.7-r0: task do_package: Started
NOTE: recipe libxinerama-1_1.1.6-r0: task do_package: Started
NOTE: recipe libwebp-1.6.0-r0: task do_populate_sysroot: Succeeded
NOTE: Running task 3265 of 3619 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-gnome/libxmlb/libxmlb_0.3.26.bb:do_package)
NOTE: recipe libxinerama-1_1.1.6-r0: task do_populate_sysroot: Succeeded
NOTE: Running task 3268 of 3619 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-multimedia/gstreamer/gstreamer1.0_1.28.2.bb:do_create_recipe_spdx)
NOTE: recipe libxcomposite-1_0.4.7-r0: task do_populate_sysroot: Succeeded
NOTE: Running task 3270 of 3619 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/orc/orc_0.4.42.bb:do_create_recipe_spdx)
NOTE: recipe libxcursor-1_1.2.3-r0: task do_install: Succeeded
NOTE: recipe graphene-1.10.8-r0: task do_install: Succeeded
NOTE: Running task 3271 of 3619 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/xorg-lib/libxcursor_1.2.3.bb:do_populate_sysroot)
NOTE: recipe gstreamer1.0-1.28.2-r0: task do_create_recipe_spdx: Started
NOTE: Running task 3272 of 3619 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/graphene/graphene_1.10.8.bb:do_populate_sysroot)
NOTE: recipe libfyaml-0.9.4-r0: task do_configure: Succeeded
NOTE: recipe libxmlb-0.3.26-r0: task do_package: Started
NOTE: Running task 3273 of 3619 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/libfyaml/libfyaml_0.9.4.bb:do_compile)
NOTE: recipe orc-0.4.42-r0: task do_create_recipe_spdx: Started
NOTE: recipe libxcursor-1_1.2.3-r0: task do_populate_sysroot: Started
NOTE: recipe graphene-1.10.8-r0: task do_populate_sysroot: Started
NOTE: recipe libfyaml-0.9.4-r0: task do_compile: Started
NOTE: recipe gstreamer1.0-1.28.2-r0: task do_create_recipe_spdx: Succeeded
NOTE: Running task 3274 of 3619 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/graphene/graphene_1.10.8.bb:do_package)
NOTE: recipe orc-0.4.42-r0: task do_create_recipe_spdx: Succeeded
NOTE: Running task 3275 of 3619 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/xorg-lib/libxcursor_1.2.3.bb:do_package)
NOTE: recipe graphene-1.10.8-r0: task do_package: Started
NOTE: recipe libxcursor-1_1.2.3-r0: task do_package: Started
NOTE: recipe libxcursor-1_1.2.3-r0: task do_populate_sysroot: Succeeded
NOTE: Running task 3277 of 3619 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/xorg-lib/xkeyboard-config_2.47.bb:do_create_recipe_spdx)
NOTE: recipe graphene-1.10.8-r0: task do_populate_sysroot: Succeeded
NOTE: Running task 3298 of 3619 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-gnome/libadwaita/libadwaita_1.9.1.bb:do_deploy_source_date_epoch)
NOTE: recipe xkeyboard-config-2.47-r0: task do_create_recipe_spdx: Started
NOTE: recipe libxtst-1_1.2.5-r0: task do_package: Succeeded
NOTE: Running task 3299 of 3619 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/xorg-lib/libxtst_1.2.5.bb:do_packagedata)
NOTE: recipe libadwaita-1.9.1-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe libxtst-1_1.2.5-r0: task do_packagedata: Started
NOTE: recipe flac-1.5.0-r0: task do_install: Succeeded
NOTE: recipe vala-0.56.19-r0: task do_install: Succeeded
NOTE: Running task 3300 of 3619 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-multimedia/flac/flac_1.5.0.bb:do_populate_sysroot)
NOTE: recipe xkeyboard-config-2.47-r0: task do_create_recipe_spdx: Succeeded
NOTE: Running task 3301 of 3619 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/vala/vala_0.56.19.bb:do_populate_sysroot)
NOTE: Running task 3302 of 3619 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/vala/vala_0.56.19.bb:do_package)
NOTE: recipe libadwaita-1.9.1-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: recipe flac-1.5.0-r0: task do_populate_sysroot: Started
NOTE: Running task 3303 of 3619 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-multimedia/flac/flac_1.5.0.bb:do_package)
NOTE: recipe vala-0.56.19-r0: task do_populate_sysroot: Started
NOTE: recipe vala-0.56.19-r0: task do_package: Started
NOTE: recipe libgudev-238-r0: task do_package: Succeeded
NOTE: recipe flac-1.5.0-r0: task do_package: Started
NOTE: recipe libxtst-1_1.2.5-r0: task do_packagedata: Succeeded
NOTE: Running task 3304 of 3619 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-gnome/libgudev/libgudev_238.bb:do_packagedata)
NOTE: Running task 3306 of 3619 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/xorg-lib/libxkbcommon_1.13.1.bb:do_create_recipe_spdx)
NOTE: recipe libgudev-238-r0: task do_packagedata: Started
NOTE: recipe libxkbcommon-1.13.1-r0: task do_create_recipe_spdx: Started
NOTE: recipe flac-1.5.0-r0: task do_populate_sysroot: Succeeded
NOTE: Running task 3307 of 3619 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-multimedia/libsndfile/libsndfile1_1.2.2.bb:do_prepare_recipe_sysroot)
NOTE: recipe libsndfile1-1.2.2-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe libxkbcommon-1.13.1-r0: task do_create_recipe_spdx: Succeeded
NOTE: Running task 3308 of 3619 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-gnome/librsvg/librsvg_2.62.2.bb:do_create_recipe_spdx)
NOTE: recipe libgudev-238-r0: task do_packagedata: Succeeded
NOTE: Task /srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-gnome/libgudev/libgudev_238.bb:do_packagedata unihash changed to 0c54eb13a0c5676375e679eb922f9a98da3f4ba97def4c704d1e2f54f8471e92
NOTE: Setscene tasks completed
NOTE: Running task 3326 of 3619 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/fribidi/fribidi_1.0.16.bb:do_create_spdx)
NOTE: recipe vala-0.56.19-r0: task do_populate_sysroot: Succeeded
NOTE: recipe librsvg-2.62.2-r0: task do_create_recipe_spdx: Started
NOTE: Running task 3329 of 3619 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-gnome/libadwaita/libadwaita_1.9.1.bb:do_write_config)
NOTE: recipe libsndfile1-1.2.2-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: Running task 3330 of 3619 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-multimedia/libsndfile/libsndfile1_1.2.2.bb:do_configure)
NOTE: recipe fribidi-1.0.16-r0: task do_create_spdx: Started
NOTE: recipe libadwaita-1.9.1-r0: task do_write_config: Started
NOTE: recipe libsndfile1-1.2.2-r0: task do_configure: Started
NOTE: recipe libadwaita-1.9.1-r0: task do_write_config: Succeeded
NOTE: Running task 3332 of 3619 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/xorg-lib/libxft_2.3.9.bb:do_create_spdx)
NOTE: recipe librsvg-2.62.2-r0: task do_create_recipe_spdx: Succeeded
NOTE: Running task 3333 of 3619 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/libical/libical_3.0.20.bb:do_create_recipe_spdx)
NOTE: recipe libxft-1_2.3.9-r0: task do_create_spdx: Started
NOTE: recipe libxcomposite-1_0.4.7-r0: task do_package: Succeeded
NOTE: recipe fribidi-1.0.16-r0: task do_create_spdx: Succeeded
NOTE: Running task 3334 of 3619 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/xorg-lib/libxcomposite_0.4.7.bb:do_packagedata)
NOTE: Running task 3335 of 3619 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/mesa/libglu_9.0.3.bb:do_create_recipe_spdx)
NOTE: recipe libxinerama-1_1.1.6-r0: task do_package: Succeeded
NOTE: recipe libical-3.0.20-r0: task do_create_recipe_spdx: Started
NOTE: Running task 3336 of 3619 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/xorg-lib/libxinerama_1.1.6.bb:do_packagedata)
NOTE: recipe libxcomposite-1_0.4.7-r0: task do_packagedata: Started
NOTE: recipe libglu-2_9.0.3-r0: task do_create_recipe_spdx: Started
NOTE: recipe libxinerama-1_1.1.6-r0: task do_packagedata: Started
NOTE: recipe libxft-1_2.3.9-r0: task do_create_spdx: Succeeded
NOTE: recipe libical-3.0.20-r0: task do_create_recipe_spdx: Succeeded
NOTE: Running task 3339 of 3619 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/xorg-lib/libxv_1.0.13.bb:do_create_recipe_spdx)
NOTE: Running task 3353 of 3619 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/shared-mime-info/shared-mime-info_2.4.bb:do_create_spdx)
NOTE: recipe libglu-2_9.0.3-r0: task do_create_recipe_spdx: Succeeded
NOTE: Running task 3354 of 3619 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/xorg-lib/libxtst_1.2.5.bb:do_create_recipe_spdx)
NOTE: recipe libxcomposite-1_0.4.7-r0: task do_packagedata: Succeeded
NOTE: recipe libxv-1.0.13-r0: task do_create_recipe_spdx: Started
NOTE: Task /srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/xorg-lib/libxcomposite_0.4.7.bb:do_packagedata unihash changed to 3a489870769763fe83e580cef28e4bdbbe2be8ada1ec0bc3d594d6b0c6a50005
NOTE: recipe libxinerama-1_1.1.6-r0: task do_packagedata: Succeeded
NOTE: recipe shared-mime-info-2.4-r0: task do_create_spdx: Started
NOTE: recipe libxtst-1_1.2.5-r0: task do_create_recipe_spdx: Started
NOTE: recipe libxmlb-0.3.26-r0: task do_package: Succeeded
NOTE: Setscene tasks completed
NOTE: Running task 3356 of 3619 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-gnome/libxmlb/libxmlb_0.3.26.bb:do_packagedata)
NOTE: recipe graphene-1.10.8-r0: task do_package: Succeeded
NOTE: Running task 3358 of 3619 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-connectivity/bluez5/bluez5_5.86.bb:do_create_recipe_spdx)
NOTE: Running task 3360 of 3619 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-gnome/libgudev/libgudev_238.bb:do_create_recipe_spdx)
NOTE: Running task 3361 of 3619 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/graphene/graphene_1.10.8.bb:do_packagedata)
NOTE: recipe libxmlb-0.3.26-r0: task do_packagedata: Started
NOTE: recipe libwebp-1.6.0-r0: task do_package: Succeeded
NOTE: recipe libxv-1.0.13-r0: task do_create_recipe_spdx: Succeeded
NOTE: recipe libgudev-238-r0: task do_create_recipe_spdx: Started
NOTE: recipe bluez5-5.86-r0: task do_create_recipe_spdx: Started
NOTE: Running task 3362 of 3619 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-base_1.28.2.bb:do_create_recipe_spdx)
NOTE: Running task 3363 of 3619 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-multimedia/webp/libwebp_1.6.0.bb:do_packagedata)
NOTE: recipe graphene-1.10.8-r0: task do_packagedata: Started
NOTE: recipe libxtst-1_1.2.5-r0: task do_create_recipe_spdx: Succeeded
NOTE: Running task 3369 of 3619 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-multimedia/alsa/alsa-lib_1.2.15.3.bb:do_create_spdx)
NOTE: recipe gstreamer1.0-plugins-base-1.28.2-r0: task do_create_recipe_spdx: Started
NOTE: recipe libwebp-1.6.0-r0: task do_packagedata: Started
NOTE: recipe alsa-lib-1.2.15.3-r0: task do_create_spdx: Started
NOTE: recipe libgudev-238-r0: task do_create_recipe_spdx: Succeeded
NOTE: Running task 3370 of 3619 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-multimedia/libvorbis/libvorbis_1.3.7.bb:do_create_spdx)
NOTE: recipe bluez5-5.86-r0: task do_create_recipe_spdx: Succeeded
NOTE: recipe libxcursor-1_1.2.3-r0: task do_package: Succeeded
NOTE: Running task 3374 of 3619 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/xorg-lib/libxi_1.8.3.bb:do_create_spdx)
NOTE: recipe libxmlb-0.3.26-r0: task do_packagedata: Succeeded
NOTE: Running task 3375 of 3619 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/xorg-lib/libxcursor_1.2.3.bb:do_packagedata)
NOTE: recipe graphene-1.10.8-r0: task do_packagedata: Succeeded
NOTE: Running task 3380 of 3619 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/xorg-lib/libxcomposite_0.4.7.bb:do_create_recipe_spdx)
NOTE: Running task 3381 of 3619 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/atk/at-spi2-core_2.60.4.bb:do_create_recipe_spdx)
NOTE: recipe libvorbis-1.3.7-r0: task do_create_spdx: Started
NOTE: recipe gstreamer1.0-plugins-base-1.28.2-r0: task do_create_recipe_spdx: Succeeded
NOTE: Running task 3382 of 3619 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-bad_1.28.2.bb:do_create_recipe_spdx)
NOTE: recipe libxi-1_1.8.3-r0: task do_create_spdx: Started
NOTE: recipe libwebp-1.6.0-r0: task do_packagedata: Succeeded
NOTE: recipe libxcursor-1_1.2.3-r0: task do_packagedata: Started
NOTE: Running task 3383 of 3619 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/libepoxy/libepoxy_1.5.10.bb:do_create_recipe_spdx)
NOTE: recipe libxcomposite-1_0.4.7-r0: task do_create_recipe_spdx: Started
NOTE: recipe at-spi2-core-2.60.4-r0: task do_create_recipe_spdx: Started
NOTE: recipe gstreamer1.0-plugins-bad-1.28.2-r0: task do_create_recipe_spdx: Started
NOTE: recipe libepoxy-1.5.10-r0: task do_create_recipe_spdx: Started
NOTE: recipe at-spi2-core-2.60.4-r0: task do_compile: Succeeded
NOTE: Running task 3384 of 3619 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/atk/at-spi2-core_2.60.4.bb:do_install)
NOTE: recipe libxcomposite-1_0.4.7-r0: task do_create_recipe_spdx: Succeeded
NOTE: recipe libxcursor-1_1.2.3-r0: task do_packagedata: Succeeded
NOTE: Running task 3385 of 3619 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/graphene/graphene_1.10.8.bb:do_create_recipe_spdx)
NOTE: recipe at-spi2-core-2.60.4-r0: task do_create_recipe_spdx: Succeeded
NOTE: Task /srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/xorg-lib/libxcursor_1.2.3.bb:do_packagedata unihash changed to b7ff63f6c62005d45c9117e1707aa208e44cab4154ea54bbffc6ef72b6323ece
NOTE: recipe alsa-lib-1.2.15.3-r0: task do_create_spdx: Succeeded
NOTE: Setscene tasks completed
NOTE: Running task 3386 of 3619 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/xorg-lib/libxcursor_1.2.3.bb:do_create_recipe_spdx)
NOTE: Running task 3388 of 3619 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/xorg-lib/libxinerama_1.1.6.bb:do_create_recipe_spdx)
NOTE: Running task 3390 of 3619 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/libfyaml/libfyaml_0.9.4.bb:do_create_recipe_spdx)
NOTE: recipe libxi-1_1.8.3-r0: task do_create_spdx: Succeeded
NOTE: recipe libepoxy-1.5.10-r0: task do_create_recipe_spdx: Succeeded
NOTE: recipe libvorbis-1.3.7-r0: task do_create_spdx: Succeeded
NOTE: Running task 3392 of 3619 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-gnome/libxmlb/libxmlb_0.3.26.bb:do_create_recipe_spdx)
NOTE: recipe gstreamer1.0-plugins-bad-1.28.2-r0: task do_create_recipe_spdx: Succeeded
NOTE: Running task 3411 of 3619 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-multimedia/gstreamer/gstreamer1.0_1.28.2.bb:do_create_spdx)
NOTE: recipe graphene-1.10.8-r0: task do_create_recipe_spdx: Started
NOTE: recipe at-spi2-core-2.60.4-r0: task do_install: Started
NOTE: Running task 3413 of 3619 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/orc/orc_0.4.42.bb:do_create_spdx)
NOTE: Running task 3415 of 3619 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/xorg-lib/xkeyboard-config_2.47.bb:do_create_spdx)
NOTE: recipe libxcursor-1_1.2.3-r0: task do_create_recipe_spdx: Started
NOTE: recipe libxinerama-1_1.1.6-r0: task do_create_recipe_spdx: Started
NOTE: recipe libfyaml-0.9.4-r0: task do_create_recipe_spdx: Started
NOTE: recipe libxmlb-0.3.26-r0: task do_create_recipe_spdx: Started
NOTE: recipe gstreamer1.0-1.28.2-r0: task do_create_spdx: Started
NOTE: recipe orc-0.4.42-r0: task do_create_spdx: Started
NOTE: recipe xkeyboard-config-2.47-r0: task do_create_spdx: Started
NOTE: recipe shared-mime-info-2.4-r0: task do_create_spdx: Succeeded
NOTE: Running task 3416 of 3619 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-gnome/gdk-pixbuf/gdk-pixbuf_2.44.6.bb:do_create_spdx)
NOTE: recipe libxinerama-1_1.1.6-r0: task do_create_recipe_spdx: Succeeded
NOTE: recipe libxmlb-0.3.26-r0: task do_create_recipe_spdx: Succeeded
NOTE: recipe graphene-1.10.8-r0: task do_create_recipe_spdx: Succeeded
NOTE: Running task 3433 of 3619 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-multimedia/libtheora/libtheora_1.2.0.bb:do_create_spdx)
NOTE: recipe libxcursor-1_1.2.3-r0: task do_create_recipe_spdx: Succeeded
NOTE: Running task 3434 of 3619 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/xorg-lib/libxv_1.0.13.bb:do_create_spdx)
NOTE: recipe libfyaml-0.9.4-r0: task do_create_recipe_spdx: Succeeded
NOTE: Running task 3435 of 3619 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-gnome/gtk+/gtk4_4.22.4.bb:do_create_recipe_spdx)
NOTE: Running task 3436 of 3619 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/appstream/appstream_1.1.2.bb:do_create_recipe_spdx)
NOTE: Running task 3438 of 3619 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/xorg-lib/libxtst_1.2.5.bb:do_create_spdx)
NOTE: recipe gdk-pixbuf-2.44.6-r0: task do_create_spdx: Started
NOTE: recipe libtheora-1.2.0-r0: task do_create_spdx: Started
NOTE: recipe libxv-1.0.13-r0: task do_create_spdx: Started
NOTE: recipe gtk4-4.22.4-r0: task do_create_recipe_spdx: Started
NOTE: recipe appstream-1.1.2-r0: task do_create_recipe_spdx: Started
NOTE: recipe libxtst-1_1.2.5-r0: task do_create_spdx: Started
NOTE: recipe orc-0.4.42-r0: task do_create_spdx: Succeeded
NOTE: Running task 3439 of 3619 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-multimedia/webp/libwebp_1.6.0.bb:do_create_spdx)
NOTE: recipe libwebp-1.6.0-r0: task do_create_spdx: Started
NOTE: recipe appstream-1.1.2-r0: task do_create_recipe_spdx: Succeeded
NOTE: recipe libtheora-1.2.0-r0: task do_create_spdx: Succeeded
NOTE: Running task 3441 of 3619 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-gnome/libgudev/libgudev_238.bb:do_create_spdx)
NOTE: recipe gtk4-4.22.4-r0: task do_create_recipe_spdx: Succeeded
NOTE: recipe libxv-1.0.13-r0: task do_create_spdx: Succeeded
NOTE: recipe libxtst-1_1.2.5-r0: task do_create_spdx: Succeeded
NOTE: Running task 3444 of 3619 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/xorg-lib/libxcomposite_0.4.7.bb:do_create_spdx)
NOTE: Running task 3445 of 3619 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/graphene/graphene_1.10.8.bb:do_create_spdx)
NOTE: Running task 3446 of 3619 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/xorg-lib/libxcursor_1.2.3.bb:do_create_spdx)
NOTE: Running task 3448 of 3619 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/xorg-lib/libxinerama_1.1.6.bb:do_create_spdx)
NOTE: recipe libgudev-238-r0: task do_create_spdx: Started
NOTE: recipe libxcomposite-1_0.4.7-r0: task do_create_spdx: Started
NOTE: recipe xkeyboard-config-2.47-r0: task do_create_spdx: Succeeded
NOTE: Running task 3449 of 3619 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/xorg-lib/libxkbcommon_1.13.1.bb:do_create_spdx)
NOTE: recipe graphene-1.10.8-r0: task do_create_spdx: Started
NOTE: recipe flac-1.5.0-r0: task do_package: Succeeded
NOTE: recipe libxcursor-1_1.2.3-r0: task do_create_spdx: Started
NOTE: recipe libxinerama-1_1.1.6-r0: task do_create_spdx: Started
NOTE: recipe libwebp-1.6.0-r0: task do_create_spdx: Succeeded
NOTE: Running task 3450 of 3619 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-multimedia/flac/flac_1.5.0.bb:do_packagedata)
NOTE: Running task 3453 of 3619 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-gnome/libxmlb/libxmlb_0.3.26.bb:do_create_spdx)
NOTE: recipe libxkbcommon-1.13.1-r0: task do_create_spdx: Started
NOTE: recipe flac-1.5.0-r0: task do_packagedata: Started
NOTE: recipe libgudev-238-r0: task do_create_spdx: Succeeded
NOTE: recipe libxmlb-0.3.26-r0: task do_create_spdx: Started
NOTE: recipe at-spi2-core-2.60.4-r0: task do_install: Succeeded
NOTE: Running task 3463 of 3619 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-gnome/libadwaita/libadwaita_1.9.1.bb:do_create_recipe_spdx)
NOTE: Running task 3464 of 3619 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/atk/at-spi2-core_2.60.4.bb:do_populate_sysroot)
NOTE: recipe libxcomposite-1_0.4.7-r0: task do_create_spdx: Succeeded
NOTE: Running task 3465 of 3619 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/atk/at-spi2-core_2.60.4.bb:do_package)
NOTE: recipe libxinerama-1_1.1.6-r0: task do_create_spdx: Succeeded
NOTE: recipe libxcursor-1_1.2.3-r0: task do_create_spdx: Succeeded
NOTE: recipe libadwaita-1.9.1-r0: task do_create_recipe_spdx: Started
NOTE: recipe graphene-1.10.8-r0: task do_create_spdx: Succeeded
NOTE: recipe gstreamer1.0-1.28.2-r0: task do_create_spdx: Succeeded
NOTE: recipe at-spi2-core-2.60.4-r0: task do_populate_sysroot: Started
NOTE: recipe flac-1.5.0-r0: task do_packagedata: Succeeded
NOTE: Running task 3473 of 3619 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-multimedia/flac/flac_1.5.0.bb:do_create_spdx)
NOTE: recipe at-spi2-core-2.60.4-r0: task do_package: Started
NOTE: recipe libxkbcommon-1.13.1-r0: task do_create_spdx: Succeeded
NOTE: recipe flac-1.5.0-r0: task do_create_spdx: Started
NOTE: recipe libadwaita-1.9.1-r0: task do_create_recipe_spdx: Succeeded
NOTE: recipe libxmlb-0.3.26-r0: task do_create_spdx: Succeeded
NOTE: recipe vala-0.56.19-r0: task do_package: Succeeded
NOTE: Running task 3474 of 3619 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/vala/vala_0.56.19.bb:do_packagedata)
NOTE: recipe gdk-pixbuf-2.44.6-r0: task do_create_spdx: Succeeded
NOTE: recipe vala-0.56.19-r0: task do_packagedata: Started
NOTE: recipe at-spi2-core-2.60.4-r0: task do_populate_sysroot: Succeeded
NOTE: recipe flac-1.5.0-r0: task do_create_spdx: Succeeded
NOTE: recipe vala-0.56.19-r0: task do_packagedata: Succeeded
NOTE: Running task 3475 of 3619 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/vala/vala_0.56.19.bb:do_create_spdx)
NOTE: recipe vala-0.56.19-r0: task do_create_spdx: Started
NOTE: recipe vala-0.56.19-r0: task do_create_spdx: Succeeded
NOTE: recipe libfyaml-0.9.4-r0: task do_compile: Succeeded
NOTE: Running task 3476 of 3619 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/libfyaml/libfyaml_0.9.4.bb:do_install)
NOTE: recipe libfyaml-0.9.4-r0: task do_install: Started
NOTE: recipe libfyaml-0.9.4-r0: task do_install: Succeeded
NOTE: Running task 3477 of 3619 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/libfyaml/libfyaml_0.9.4.bb:do_populate_sysroot)
NOTE: Running task 3478 of 3619 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/libfyaml/libfyaml_0.9.4.bb:do_package)
NOTE: recipe libfyaml-0.9.4-r0: task do_populate_sysroot: Started
NOTE: recipe libfyaml-0.9.4-r0: task do_package: Started
NOTE: recipe libfyaml-0.9.4-r0: task do_populate_sysroot: Succeeded
NOTE: Running task 3479 of 3619 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/appstream/appstream_1.1.2.bb:do_prepare_recipe_sysroot)
NOTE: recipe appstream-1.1.2-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe appstream-1.1.2-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: Running task 3480 of 3619 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/appstream/appstream_1.1.2.bb:do_configure)
NOTE: recipe appstream-1.1.2-r0: task do_configure: Started
NOTE: recipe at-spi2-core-2.60.4-r0: task do_package: Succeeded
NOTE: Running task 3481 of 3619 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/atk/at-spi2-core_2.60.4.bb:do_packagedata)
NOTE: recipe at-spi2-core-2.60.4-r0: task do_packagedata: Started
NOTE: recipe libfyaml-0.9.4-r0: task do_package: Succeeded
NOTE: Running task 3482 of 3619 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/libfyaml/libfyaml_0.9.4.bb:do_packagedata)
NOTE: recipe libfyaml-0.9.4-r0: task do_packagedata: Started
NOTE: recipe libfyaml-0.9.4-r0: task do_packagedata: Succeeded
NOTE: Running task 3483 of 3619 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/libfyaml/libfyaml_0.9.4.bb:do_create_spdx)
NOTE: recipe at-spi2-core-2.60.4-r0: task do_packagedata: Succeeded
NOTE: Running task 3484 of 3619 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/atk/at-spi2-core_2.60.4.bb:do_create_spdx)
NOTE: recipe libfyaml-0.9.4-r0: task do_create_spdx: Started
NOTE: recipe at-spi2-core-2.60.4-r0: task do_create_spdx: Started
NOTE: recipe libfyaml-0.9.4-r0: task do_create_spdx: Succeeded
NOTE: recipe at-spi2-core-2.60.4-r0: task do_create_spdx: Succeeded
NOTE: recipe icu-78.3-r0: task do_compile: Succeeded
NOTE: Running task 3485 of 3619 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/icu/icu_78.3.bb:do_compile_ptest_base)
NOTE: recipe appstream-1.1.2-r0: task do_configure: Succeeded
NOTE: Running task 3486 of 3619 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/appstream/appstream_1.1.2.bb:do_compile)
NOTE: recipe icu-78.3-r0: task do_compile_ptest_base: Started
NOTE: recipe appstream-1.1.2-r0: task do_compile: Started
NOTE: recipe libsndfile1-1.2.2-r0: task do_configure: Succeeded
NOTE: Running task 3487 of 3619 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-multimedia/libsndfile/libsndfile1_1.2.2.bb:do_compile)
NOTE: recipe libsndfile1-1.2.2-r0: task do_compile: Started
NOTE: recipe libsndfile1-1.2.2-r0: task do_compile: Succeeded
NOTE: Running task 3488 of 3619 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-multimedia/libsndfile/libsndfile1_1.2.2.bb:do_install)
NOTE: recipe libsndfile1-1.2.2-r0: task do_install: Started
NOTE: recipe libsndfile1-1.2.2-r0: task do_install: Succeeded
NOTE: Running task 3489 of 3619 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-multimedia/libsndfile/libsndfile1_1.2.2.bb:do_populate_sysroot)
NOTE: Running task 3490 of 3619 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-multimedia/libsndfile/libsndfile1_1.2.2.bb:do_package)
NOTE: recipe libsndfile1-1.2.2-r0: task do_populate_sysroot: Started
NOTE: recipe libsndfile1-1.2.2-r0: task do_package: Started
NOTE: recipe libsndfile1-1.2.2-r0: task do_populate_sysroot: Succeeded
NOTE: Running task 3491 of 3619 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-multimedia/sbc/sbc_2.2.bb:do_prepare_recipe_sysroot)
NOTE: recipe sbc-2.2-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe sbc-2.2-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: Running task 3492 of 3619 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-multimedia/sbc/sbc_2.2.bb:do_configure)
NOTE: recipe sbc-2.2-r0: task do_configure: Started
NOTE: recipe appstream-1.1.2-r0: task do_compile: Succeeded
NOTE: Running task 3493 of 3619 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/appstream/appstream_1.1.2.bb:do_install)
NOTE: recipe appstream-1.1.2-r0: task do_install: Started
NOTE: recipe libsndfile1-1.2.2-r0: task do_package: Succeeded
NOTE: Running task 3494 of 3619 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-multimedia/libsndfile/libsndfile1_1.2.2.bb:do_packagedata)
NOTE: recipe libsndfile1-1.2.2-r0: task do_packagedata: Started
NOTE: recipe appstream-1.1.2-r0: task do_install: Succeeded
NOTE: Running task 3495 of 3619 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/appstream/appstream_1.1.2.bb:do_package)
NOTE: Running task 3496 of 3619 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/appstream/appstream_1.1.2.bb:do_populate_sysroot)
NOTE: recipe appstream-1.1.2-r0: task do_package: Started
NOTE: recipe appstream-1.1.2-r0: task do_populate_sysroot: Started
NOTE: recipe libsndfile1-1.2.2-r0: task do_packagedata: Succeeded
NOTE: Running task 3497 of 3619 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-multimedia/libsndfile/libsndfile1_1.2.2.bb:do_create_spdx)
NOTE: recipe libsndfile1-1.2.2-r0: task do_create_spdx: Started
NOTE: recipe appstream-1.1.2-r0: task do_populate_sysroot: Succeeded
NOTE: recipe libsndfile1-1.2.2-r0: task do_create_spdx: Succeeded
NOTE: recipe sbc-2.2-r0: task do_configure: Succeeded
NOTE: Running task 3498 of 3619 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-multimedia/sbc/sbc_2.2.bb:do_compile)
NOTE: recipe sbc-2.2-r0: task do_compile: Started
NOTE: recipe appstream-1.1.2-r0: task do_package: Succeeded
NOTE: Running task 3499 of 3619 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/appstream/appstream_1.1.2.bb:do_packagedata)
NOTE: recipe appstream-1.1.2-r0: task do_packagedata: Started
NOTE: recipe appstream-1.1.2-r0: task do_packagedata: Succeeded
NOTE: Running task 3500 of 3619 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/appstream/appstream_1.1.2.bb:do_create_spdx)
NOTE: recipe appstream-1.1.2-r0: task do_create_spdx: Started
NOTE: recipe sbc-2.2-r0: task do_compile: Succeeded
NOTE: Running task 3501 of 3619 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-multimedia/sbc/sbc_2.2.bb:do_install)
NOTE: recipe sbc-2.2-r0: task do_install: Started
NOTE: recipe sbc-2.2-r0: task do_install: Succeeded
NOTE: Running task 3502 of 3619 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-multimedia/sbc/sbc_2.2.bb:do_populate_sysroot)
NOTE: Running task 3503 of 3619 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-multimedia/sbc/sbc_2.2.bb:do_package)
NOTE: recipe sbc-2.2-r0: task do_package: Started
NOTE: recipe sbc-2.2-r0: task do_populate_sysroot: Started
NOTE: recipe appstream-1.1.2-r0: task do_create_spdx: Succeeded
NOTE: recipe sbc-2.2-r0: task do_populate_sysroot: Succeeded
NOTE: recipe sbc-2.2-r0: task do_package: Succeeded
NOTE: Running task 3504 of 3619 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-multimedia/sbc/sbc_2.2.bb:do_packagedata)
NOTE: recipe sbc-2.2-r0: task do_packagedata: Started
NOTE: recipe sbc-2.2-r0: task do_packagedata: Succeeded
NOTE: Running task 3505 of 3619 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-multimedia/sbc/sbc_2.2.bb:do_create_spdx)
NOTE: recipe mesa-2_26.0.6-r0: task do_compile: Succeeded
NOTE: recipe sbc-2.2-r0: task do_create_spdx: Started
NOTE: Running task 3506 of 3619 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/mesa/mesa.bb:do_install)
NOTE: recipe mesa-2_26.0.6-r0: task do_install: Started
NOTE: recipe sbc-2.2-r0: task do_create_spdx: Succeeded
NOTE: recipe mesa-2_26.0.6-r0: task do_install: Succeeded
NOTE: Running task 3507 of 3619 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/mesa/mesa.bb:do_populate_sysroot)
NOTE: Running task 3508 of 3619 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/mesa/mesa.bb:do_package)
NOTE: recipe mesa-2_26.0.6-r0: task do_populate_sysroot: Started
NOTE: recipe mesa-2_26.0.6-r0: task do_package: Started
NOTE: recipe mesa-2_26.0.6-r0: task do_populate_sysroot: Succeeded
NOTE: Running task 3509 of 3619 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/mesa/libglu_9.0.3.bb:do_prepare_recipe_sysroot)
NOTE: Running task 3510 of 3619 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/libepoxy/libepoxy_1.5.10.bb:do_prepare_recipe_sysroot)
NOTE: recipe libglu-2_9.0.3-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe libepoxy-1.5.10-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe libglu-2_9.0.3-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: recipe libepoxy-1.5.10-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: Running task 3511 of 3619 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/libepoxy/libepoxy_1.5.10.bb:do_configure)
NOTE: Running task 3512 of 3619 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/mesa/libglu_9.0.3.bb:do_configure)
NOTE: recipe libepoxy-1.5.10-r0: task do_configure: Started
NOTE: recipe libglu-2_9.0.3-r0: task do_configure: Started
NOTE: recipe libglu-2_9.0.3-r0: task do_configure: Succeeded
NOTE: Running task 3513 of 3619 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/mesa/libglu_9.0.3.bb:do_compile)
NOTE: recipe libglu-2_9.0.3-r0: task do_compile: Started
NOTE: recipe libepoxy-1.5.10-r0: task do_configure: Succeeded
NOTE: Running task 3514 of 3619 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/libepoxy/libepoxy_1.5.10.bb:do_compile)
NOTE: recipe libepoxy-1.5.10-r0: task do_compile: Started
NOTE: recipe mesa-2_26.0.6-r0: task do_package: Succeeded
NOTE: Running task 3515 of 3619 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/mesa/mesa.bb:do_packagedata)
NOTE: recipe mesa-2_26.0.6-r0: task do_packagedata: Started
NOTE: recipe libglu-2_9.0.3-r0: task do_compile: Succeeded
NOTE: Running task 3516 of 3619 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/mesa/libglu_9.0.3.bb:do_install)
NOTE: recipe libglu-2_9.0.3-r0: task do_install: Started
NOTE: recipe libglu-2_9.0.3-r0: task do_install: Succeeded
NOTE: Running task 3517 of 3619 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/mesa/libglu_9.0.3.bb:do_populate_sysroot)
NOTE: recipe libglu-2_9.0.3-r0: task do_populate_sysroot: Started
NOTE: recipe libglu-2_9.0.3-r0: task do_populate_sysroot: Succeeded
NOTE: recipe icu-78.3-r0: task do_compile_ptest_base: Succeeded
NOTE: Running task 3518 of 3619 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/icu/icu_78.3.bb:do_install)
NOTE: recipe icu-78.3-r0: task do_install: Started
NOTE: recipe mesa-2_26.0.6-r0: task do_packagedata: Failed
NOTE: recipe icu-78.3-r0: task do_install: Succeeded
NOTE: recipe libepoxy-1.5.10-r0: task do_compile: Succeeded
NOTE: Tasks Summary: Attempted 3518 tasks of which 3026 didn't need to be rerun and 1 failed.
NOTE: Writing buildhistory
NOTE: Writing buildhistory took: 2 seconds
NOTE: The errors for this build are stored in /srv/pokybuild/yocto-worker/auh/build/build/tmp/log/error-report/error_report_20260611114718.txt
You can send the errors to a reports server by running:
  send-error-report /srv/pokybuild/yocto-worker/auh/build/build/tmp/log/error-report/error_report_20260611114718.txt [-s server]
NOTE: The contents of these logs will be posted in public if you use the above command with the default server. Please ensure you remove any identifying or proprietary information when prompted before sending.

Summary: 1 task failed:
  /srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/mesa/mesa.bb:do_packagedata
    log: /srv/pokybuild/yocto-worker/auh/build/build/tmp/work/cortexa15t2hf-neon-poky-linux-musleabi/mesa/26.0.6/temp/log.do_packagedata.1906692
Summary: There were 28 ERROR messages, returning a non-zero exit code.
ERROR: mesa-2_26.0.6-r0 do_packagedata: QA Issue: Package version for package mesa-src went backwards which would break package feeds (from 2:26.1.2-r0 to 2:26.0.6-r0) [version-going-backwards]
ERROR: mesa-2_26.0.6-r0 do_packagedata: QA Issue: Package version for package mesa-dbg went backwards which would break package feeds (from 2:26.1.2-r0 to 2:26.0.6-r0) [version-going-backwards]
ERROR: mesa-2_26.0.6-r0 do_packagedata: QA Issue: Package version for package libegl-mesa went backwards which would break package feeds (from 2:26.1.2-r0 to 2:26.0.6-r0) [version-going-backwards]
ERROR: mesa-2_26.0.6-r0 do_packagedata: QA Issue: Package version for package libegl-mesa-dev went backwards which would break package feeds (from 2:26.1.2-r0 to 2:26.0.6-r0) [version-going-backwards]
ERROR: mesa-2_26.0.6-r0 do_packagedata: QA Issue: Package version for package libgallium went backwards which would break package feeds (from 2:26.1.2-r0 to 2:26.0.6-r0) [version-going-backwards]
ERROR: mesa-2_26.0.6-r0 do_packagedata: QA Issue: Package version for package libgl-mesa went backwards which would break package feeds (from 2:26.1.2-r0 to 2:26.0.6-r0) [version-going-backwards]
ERROR: mesa-2_26.0.6-r0 do_packagedata: QA Issue: Package version for package libgl-mesa-dev went backwards which would break package feeds (from 2:26.1.2-r0 to 2:26.0.6-r0) [version-going-backwards]
ERROR: mesa-2_26.0.6-r0 do_packagedata: QA Issue: Package version for package libglx-mesa went backwards which would break package feeds (from 2:26.1.2-r0 to 2:26.0.6-r0) [version-going-backwards]
ERROR: mesa-2_26.0.6-r0 do_packagedata: QA Issue: Package version for package libglx-mesa-dev went backwards which would break package feeds (from 2:26.1.2-r0 to 2:26.0.6-r0) [version-going-backwards]
ERROR: mesa-2_26.0.6-r0 do_packagedata: QA Issue: Package version for package libglapi went backwards which would break package feeds (from 2:26.1.2-r0 to 2:26.0.6-r0) [version-going-backwards]
ERROR: mesa-2_26.0.6-r0 do_packagedata: QA Issue: Package version for package libglapi-dev went backwards which would break package feeds (from 2:26.1.2-r0 to 2:26.0.6-r0) [version-going-backwards]
ERROR: mesa-2_26.0.6-r0 do_packagedata: QA Issue: Package version for package libgbm went backwards which would break package feeds (from 2:26.1.2-r0 to 2:26.0.6-r0) [version-going-backwards]
ERROR: mesa-2_26.0.6-r0 do_packagedata: QA Issue: Package version for package libgbm-dev went backwards which would break package feeds (from 2:26.1.2-r0 to 2:26.0.6-r0) [version-going-backwards]
ERROR: mesa-2_26.0.6-r0 do_packagedata: QA Issue: Package version for package libgles1-mesa went backwards which would break package feeds (from 2:26.1.2-r0 to 2:26.0.6-r0) [version-going-backwards]
ERROR: mesa-2_26.0.6-r0 do_packagedata: QA Issue: Package version for package libgles1-mesa-dev went backwards which would break package feeds (from 2:26.1.2-r0 to 2:26.0.6-r0) [version-going-backwards]
ERROR: mesa-2_26.0.6-r0 do_packagedata: QA Issue: Package version for package libgles2-mesa went backwards which would break package feeds (from 2:26.1.2-r0 to 2:26.0.6-r0) [version-going-backwards]
ERROR: mesa-2_26.0.6-r0 do_packagedata: QA Issue: Package version for package libgles2-mesa-dev went backwards which would break package feeds (from 2:26.1.2-r0 to 2:26.0.6-r0) [version-going-backwards]
ERROR: mesa-2_26.0.6-r0 do_packagedata: QA Issue: Package version for package libopencl-mesa went backwards which would break package feeds (from 2:26.1.2-r0 to 2:26.0.6-r0) [version-going-backwards]
ERROR: mesa-2_26.0.6-r0 do_packagedata: QA Issue: Package version for package libteflon went backwards which would break package feeds (from 2:26.1.2-r0 to 2:26.0.6-r0) [version-going-backwards]
ERROR: mesa-2_26.0.6-r0 do_packagedata: QA Issue: Package version for package mesa-megadriver went backwards which would break package feeds (from 2:26.1.2-r0 to 2:26.0.6-r0) [version-going-backwards]
ERROR: mesa-2_26.0.6-r0 do_packagedata: QA Issue: Package version for package mesa-vulkan-drivers went backwards which would break package feeds (from 2:26.1.2-r0 to 2:26.0.6-r0) [version-going-backwards]
ERROR: mesa-2_26.0.6-r0 do_packagedata: QA Issue: Package version for package mesa-tools went backwards which would break package feeds (from 2:26.1.2-r0 to 2:26.0.6-r0) [version-going-backwards]
ERROR: mesa-2_26.0.6-r0 do_packagedata: QA Issue: Package version for package mesa-staticdev went backwards which would break package feeds (from 2:26.1.2-r0 to 2:26.0.6-r0) [version-going-backwards]
ERROR: mesa-2_26.0.6-r0 do_packagedata: QA Issue: Package version for package mesa-dev went backwards which would break package feeds (from 2:26.1.2-r0 to 2:26.0.6-r0) [version-going-backwards]
ERROR: mesa-2_26.0.6-r0 do_packagedata: QA Issue: Package version for package mesa-doc went backwards which would break package feeds (from 2:26.1.2-r0 to 2:26.0.6-r0) [version-going-backwards]
ERROR: mesa-2_26.0.6-r0 do_packagedata: QA Issue: Package version for package mesa-locale went backwards which would break package feeds (from 2:26.1.2-r0 to 2:26.0.6-r0) [version-going-backwards]
ERROR: mesa-2_26.0.6-r0 do_packagedata: QA Issue: Package version for package mesa went backwards which would break package feeds (from 2:26.1.2-r0 to 2:26.0.6-r0) [version-going-backwards]
ERROR: mesa-2_26.0.6-r0 do_packagedata: Fatal QA errors were found, failing task.
ERROR: Logfile of failure stored in: /srv/pokybuild/yocto-worker/auh/build/build/tmp/work/cortexa15t2hf-neon-poky-linux-musleabi/mesa/26.0.6/temp/log.do_packagedata.1906692
ERROR: Task (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/mesa/mesa.bb:do_packagedata) failed with exit code '1'

--===============6129507992072152024==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment; filename="buildhistory-diff.txt"

packages/x86-64-v3-poky-linux/libadwaita/libadwaita-locale-sk: PKGSIZE changed from 6843 to 10861 (+59%)

--===============6129507992072152024==--

