Return-Path: <auh@yoctoproject.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id B0532C54F42
	for <webhook@archiver.kernel.org>; Wed, 15 Nov 2023 14:37:10 +0000 (UTC)
Received: from a27-45.smtp-out.us-west-2.amazonses.com (a27-45.smtp-out.us-west-2.amazonses.com [54.240.27.45])
 by mx.groups.io with SMTP id smtpd.web10.14617.1700059029276521470
 for <openembedded-core@lists.openembedded.org>;
 Wed, 15 Nov 2023 06:37:09 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@yoctoproject.org header.s=lvjh2tk576v2ro5mi6k4dt3mc6wpqbky header.b=K2dycA2T;
 dkim=pass header.i=@amazonses.com header.s=hsbnp7p3ensaochzwyq5wwmceodymuwv header.b=i/xdc9V3;
 spf=pass (domain: us-west-2.amazonses.com, ip: 54.240.27.45, mailfrom: 0101018bd36a1c15-4671815b-c72e-44de-802c-83b875d883c6-000000@us-west-2.amazonses.com)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=lvjh2tk576v2ro5mi6k4dt3mc6wpqbky; d=yoctoproject.org;
	t=1700059028;
	h=Content-Type:MIME-Version:From:To:Cc:Subject:Message-Id:Date;
	bh=bKmA21Ymgwok6xh+Ju5Dj9l0mSWCyNtX8B2aRlCQoiM=;
	b=K2dycA2TQBrjXB4R3dCLsnaMB6VwwGvgOook2OuPL+9dBfGnWUZF7oMk3iwk6Nmt
	yDq2AbCMQD5gNHurbcXcUFr9EbgGrxR0mjBPungEF+oVq94JYJkGiV7veR6a0OXsBhy
	jpnu9PedBuPMPMMjJZ/fJSmfSMU5pRIMk2a/l7T0=
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=hsbnp7p3ensaochzwyq5wwmceodymuwv; d=amazonses.com; t=1700059028;
	h=Content-Type:MIME-Version:From:To:Cc:Subject:Message-Id:Date:Feedback-ID;
	bh=bKmA21Ymgwok6xh+Ju5Dj9l0mSWCyNtX8B2aRlCQoiM=;
	b=i/xdc9V3nRlDrSiUNH45JsrUA7hDkPp85wSq9U9byW0sjiaNh9ncUfn0c+Z8YzO7
	yXpOwozbWvKtBxkKrW1g4opvvOD3jvEUOz4mwWfO8uql2IeYAbOiJk4TMyhIXzYlvPy
	YAdjc/3TRVQHZtVyWFRnvolerg1O+Q4RG4u+BO9g=
Content-Type: multipart/mixed; boundary="===============5174498440840133897=="
MIME-Version: 1.0
From: auh@yoctoproject.org
To: Chen Qi <Qi.Chen@windriver.com>
Cc: openembedded-core@lists.openembedded.org
Subject: [AUH] dbus-wait: upgrading to
 64bc7c8fae61ded0c4e555aa775911f84c56e438 SUCCEEDED
Message-ID: <0101018bd36a1c15-4671815b-c72e-44de-802c-83b875d883c6-000000@us-west-2.amazonses.com>
Date: Wed, 15 Nov 2023 14:37:08 +0000
Feedback-ID: 1.us-west-2.9np3MYPs3fEaOBysGKSlUD4KtcmPijcmS9Az2Hwf7iQ=:AmazonSES
X-SES-Outgoing: 2023.11.15-54.240.27.45
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 15 Nov 2023 14:37:10 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/190607

--===============5174498440840133897==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

Hello,

this email is a notification from the Auto Upgrade Helper
that the automatic attempt to upgrade the recipe *dbus-wait* to *64bc7c8fae61ded0c4e555aa775911f84c56e438* has Succeeded.

Next steps:
    - apply the patch: git am 0001-dbus-wait-upgrade-to-latest-revision.patch
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
From 875f3a2c7cb9c5a6df30f219a12e2afaa60e4774 Mon Sep 17 00:00:00 2001
From: Upgrade Helper <auh@yoctoproject.org>
Date: Wed, 15 Nov 2023 05:22:22 +0000
Subject: [PATCH] dbus-wait: upgrade to latest revision

---
 meta/recipes-core/dbus-wait/dbus-wait_git.bb | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta/recipes-core/dbus-wait/dbus-wait_git.bb b/meta/recipes-core/dbus-wait/dbus-wait_git.bb
index 1cdf07d03d..39363b9b3a 100644
--- a/meta/recipes-core/dbus-wait/dbus-wait_git.bb
+++ b/meta/recipes-core/dbus-wait/dbus-wait_git.bb
@@ -7,7 +7,7 @@ LIC_FILES_CHKSUM = "file://COPYING;md5=b234ee4d69f5fce4486a80fdaf4a4263"
 
 DEPENDS = "dbus"
 
-SRCREV = "6cc6077a36fe2648a5f993fe7c16c9632f946517"
+SRCREV = "64bc7c8fae61ded0c4e555aa775911f84c56e438"
 PV = "0.1+git"
 
 SRC_URI = "git://git.yoctoproject.org/${BPN};branch=master;protocol=https"
-- 
2.39.2


--===============5174498440840133897==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment; filename="buildhistory-diff-full.txt"

packages/core2-64-poky-linux/dbus-wait/dbus-wait-dbg: PKGV changed from 0.1+git0+6cc6077a36 to 0.1+git0+64bc7c8fae
packages/core2-64-poky-linux/dbus-wait/dbus-wait-dev: PKGV changed from 0.1+git0+6cc6077a36 to 0.1+git0+64bc7c8fae
packages/core2-64-poky-linux/dbus-wait/dbus-wait-doc: PKGV changed from 0.1+git0+6cc6077a36 to 0.1+git0+64bc7c8fae
packages/core2-64-poky-linux/dbus-wait/dbus-wait-locale: PKGV changed from 0.1+git0+6cc6077a36 to 0.1+git0+64bc7c8fae
packages/core2-64-poky-linux/dbus-wait/dbus-wait-src: PKGV changed from 0.1+git0+6cc6077a36 to 0.1+git0+64bc7c8fae
packages/core2-64-poky-linux/dbus-wait/dbus-wait-staticdev: PKGV changed from 0.1+git0+6cc6077a36 to 0.1+git0+64bc7c8fae
packages/core2-64-poky-linux/dbus-wait/dbus-wait: PKGV changed from 0.1+git0+6cc6077a36 to 0.1+git0+64bc7c8fae

--===============5174498440840133897==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment; filename="buildhistory-diff.txt"

packages/core2-64-poky-linux/dbus-wait/dbus-wait-dbg: PKGV changed from 0.1+git0+6cc6077a36 to 0.1+git0+64bc7c8fae
packages/core2-64-poky-linux/dbus-wait/dbus-wait-dev: PKGV changed from 0.1+git0+6cc6077a36 to 0.1+git0+64bc7c8fae
packages/core2-64-poky-linux/dbus-wait/dbus-wait-doc: PKGV changed from 0.1+git0+6cc6077a36 to 0.1+git0+64bc7c8fae
packages/core2-64-poky-linux/dbus-wait/dbus-wait-locale: PKGV changed from 0.1+git0+6cc6077a36 to 0.1+git0+64bc7c8fae
packages/core2-64-poky-linux/dbus-wait/dbus-wait-src: PKGV changed from 0.1+git0+6cc6077a36 to 0.1+git0+64bc7c8fae
packages/core2-64-poky-linux/dbus-wait/dbus-wait-staticdev: PKGV changed from 0.1+git0+6cc6077a36 to 0.1+git0+64bc7c8fae
packages/core2-64-poky-linux/dbus-wait/dbus-wait: PKGV changed from 0.1+git0+6cc6077a36 to 0.1+git0+64bc7c8fae

--===============5174498440840133897==
Content-Type: application/octet-stream
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: attachment;
 filename="0001-dbus-wait-upgrade-to-latest-revision.patch"

RnJvbSA4NzVmM2EyYzdjYjljNWE2ZGYzMGYyMTlhMTJlMmFmYWE2MGU0Nzc0IE1vbiBTZXAgMTcg
MDA6MDA6MDAgMjAwMQpGcm9tOiBVcGdyYWRlIEhlbHBlciA8YXVoQHlvY3RvcHJvamVjdC5vcmc+
CkRhdGU6IFdlZCwgMTUgTm92IDIwMjMgMDU6MjI6MjIgKzAwMDAKU3ViamVjdDogW1BBVENIXSBk
YnVzLXdhaXQ6IHVwZ3JhZGUgdG8gbGF0ZXN0IHJldmlzaW9uCgotLS0KIG1ldGEvcmVjaXBlcy1j
b3JlL2RidXMtd2FpdC9kYnVzLXdhaXRfZ2l0LmJiIHwgMiArLQogMSBmaWxlIGNoYW5nZWQsIDEg
aW5zZXJ0aW9uKCspLCAxIGRlbGV0aW9uKC0pCgpkaWZmIC0tZ2l0IGEvbWV0YS9yZWNpcGVzLWNv
cmUvZGJ1cy13YWl0L2RidXMtd2FpdF9naXQuYmIgYi9tZXRhL3JlY2lwZXMtY29yZS9kYnVzLXdh
aXQvZGJ1cy13YWl0X2dpdC5iYgppbmRleCAxY2RmMDdkMDNkLi4zOTM2M2I5YjNhIDEwMDY0NAot
LS0gYS9tZXRhL3JlY2lwZXMtY29yZS9kYnVzLXdhaXQvZGJ1cy13YWl0X2dpdC5iYgorKysgYi9t
ZXRhL3JlY2lwZXMtY29yZS9kYnVzLXdhaXQvZGJ1cy13YWl0X2dpdC5iYgpAQCAtNyw3ICs3LDcg
QEAgTElDX0ZJTEVTX0NIS1NVTSA9ICJmaWxlOi8vQ09QWUlORzttZDU9YjIzNGVlNGQ2OWY1ZmNl
NDQ4NmE4MGZkYWY0YTQyNjMiCiAKIERFUEVORFMgPSAiZGJ1cyIKIAotU1JDUkVWID0gIjZjYzYw
NzdhMzZmZTI2NDhhNWY5OTNmZTdjMTZjOTYzMmY5NDY1MTciCitTUkNSRVYgPSAiNjRiYzdjOGZh
ZTYxZGVkMGM0ZTU1NWFhNzc1OTExZjg0YzU2ZTQzOCIKIFBWID0gIjAuMStnaXQiCiAKIFNSQ19V
UkkgPSAiZ2l0Oi8vZ2l0LnlvY3RvcHJvamVjdC5vcmcvJHtCUE59O2JyYW5jaD1tYXN0ZXI7cHJv
dG9jb2w9aHR0cHMiCi0tIAoyLjM5LjIKCg==

--===============5174498440840133897==--

