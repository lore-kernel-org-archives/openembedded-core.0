Return-Path: <auh@yoctoproject.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 229ACC25B0E
	for <webhook@archiver.kernel.org>; Fri,  1 Dec 2023 13:14:59 +0000 (UTC)
Received: from a27-33.smtp-out.us-west-2.amazonses.com (a27-33.smtp-out.us-west-2.amazonses.com [54.240.27.33])
 by mx.groups.io with SMTP id smtpd.web11.22184.1701436491052799886
 for <openembedded-core@lists.openembedded.org>;
 Fri, 01 Dec 2023 05:14:51 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@yoctoproject.org header.s=lvjh2tk576v2ro5mi6k4dt3mc6wpqbky header.b=bCdMyAdx;
 dkim=pass header.i=@amazonses.com header.s=hsbnp7p3ensaochzwyq5wwmceodymuwv header.b=gvURfVhb;
 spf=pass (domain: us-west-2.amazonses.com, ip: 54.240.27.33, mailfrom: 0101018c258480f0-7b93f517-5a0e-4ef9-af45-bf1b5a66f025-000000@us-west-2.amazonses.com)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=lvjh2tk576v2ro5mi6k4dt3mc6wpqbky; d=yoctoproject.org;
	t=1701436490;
	h=Content-Type:MIME-Version:From:To:Cc:Subject:Message-Id:Date;
	bh=s5x9NZmiOT9cOdQENaAEt2atmN2klawsEUJEmPb1sz8=;
	b=bCdMyAdxefdcKhqr86qVLLkoRpyVU9GW9hfkchxFKdGYnqm8JC37V7f+vfPHG793
	bih8mplOcG9qu9Eki/IL2igKo5kWCLYb+6ln4uixILJQ1+v8ZpxNWhLuYuoYgrm6GeV
	A2UvHQ5GySDt9J3DHYl5m31wfrDLIPqoR7Ly3bQ4=
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=hsbnp7p3ensaochzwyq5wwmceodymuwv; d=amazonses.com; t=1701436490;
	h=Content-Type:MIME-Version:From:To:Cc:Subject:Message-Id:Date:Feedback-ID;
	bh=s5x9NZmiOT9cOdQENaAEt2atmN2klawsEUJEmPb1sz8=;
	b=gvURfVhbK3YiWjgEVTctARiVPd+wyB0diT58tqI0Ws4xSJBoiEL9c9ju8nin8E96
	BdmxfxnPQCthMdz0VK8RIEh5eoubDNdJuN9/tKuvBgmBY91Vkepmj8ceg0ibPyMbc/z
	FUgmxf97wLDzaEe2DgxeAIZWs2mPDH7QM+7w1Ofo=
Content-Type: multipart/mixed; boundary="===============1813270379083020388=="
MIME-Version: 1.0
From: auh@yoctoproject.org
To: Anuj Mittal <anuj.mittal@intel.com>
Cc: openembedded-core@lists.openembedded.org
Subject: [AUH] base-passwd: upgrading to 3.6.3 SUCCEEDED
Message-ID: <0101018c258480f0-7b93f517-5a0e-4ef9-af45-bf1b5a66f025-000000@us-west-2.amazonses.com>
Date: Fri, 1 Dec 2023 13:14:49 +0000
Feedback-ID: 1.us-west-2.9np3MYPs3fEaOBysGKSlUD4KtcmPijcmS9Az2Hwf7iQ=:AmazonSES
X-SES-Outgoing: 2023.12.01-54.240.27.33
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Fri, 01 Dec 2023 13:14:59 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/191580

--===============1813270379083020388==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

Hello,

this email is a notification from the Auto Upgrade Helper
that the automatic attempt to upgrade the recipe *base-passwd* to *3.6.3* has Succeeded.

Next steps:
    - apply the patch: git am 0001-base-passwd-upgrade-3.6.2-3.6.3.patch
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
From 246f5970ee4ab64a625d17530e313fd0a66fbcbd Mon Sep 17 00:00:00 2001
From: Upgrade Helper <auh@yoctoproject.org>
Date: Fri, 1 Dec 2023 05:55:07 +0000
Subject: [PATCH] base-passwd: upgrade 3.6.2 -> 3.6.3

---
 .../base-passwd/{base-passwd_3.6.2.bb => base-passwd_3.6.3.bb}  | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta/recipes-core/base-passwd/{base-passwd_3.6.2.bb => base-passwd_3.6.3.bb} (98%)

diff --git a/meta/recipes-core/base-passwd/base-passwd_3.6.2.bb b/meta/recipes-core/base-passwd/base-passwd_3.6.3.bb
similarity index 98%
rename from meta/recipes-core/base-passwd/base-passwd_3.6.2.bb
rename to meta/recipes-core/base-passwd/base-passwd_3.6.3.bb
index bb4b49e6ab..9d7703b1c0 100644
--- a/meta/recipes-core/base-passwd/base-passwd_3.6.2.bb
+++ b/meta/recipes-core/base-passwd/base-passwd_3.6.3.bb
@@ -15,7 +15,7 @@ SRC_URI = "https://launchpad.net/debian/+archive/primary/+files/${BPN}_${PV}.tar
            file://0001-base-passwd-Add-the-sgx-group.patch \
            "
 
-SRC_URI[sha256sum] = "06dc78352bf38a8df76ff295e15ab5654cdefe41e62368b15bfcbbab8e4ec2a0"
+SRC_URI[sha256sum] = "83575327d8318a419caf2d543341215c046044073d1afec2acc0ac4d8095ff39"
 
 # the package is taken from launchpad; that source is static and goes stale
 # so we check the latest upstream from a directory that does get updated
-- 
2.39.2


--===============1813270379083020388==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment; filename="buildhistory-diff-full.txt"

packages/core2-64-poky-linux/base-passwd/base-passwd-dbg: PV changed from "3.6.2" to "3.6.3"
packages/core2-64-poky-linux/base-passwd/base-passwd-dbg: PKGV changed from 3.6.2 [default] to 3.6.3 [default]
packages/core2-64-poky-linux/base-passwd/base-passwd-dev: PV changed from "3.6.2" to "3.6.3"
packages/core2-64-poky-linux/base-passwd/base-passwd-dev: PKGV changed from 3.6.2 [default] to 3.6.3 [default]
packages/core2-64-poky-linux/base-passwd/base-passwd-doc: PKGSIZE changed from 19779 to 19813 (+0%)
packages/core2-64-poky-linux/base-passwd/base-passwd-doc: PV changed from "3.6.2" to "3.6.3"
packages/core2-64-poky-linux/base-passwd/base-passwd-doc: PKGV changed from 3.6.2 [default] to 3.6.3 [default]
packages/core2-64-poky-linux/base-passwd/base-passwd-locale: PV changed from "3.6.2" to "3.6.3"
packages/core2-64-poky-linux/base-passwd/base-passwd-locale: PKGV changed from 3.6.2 [default] to 3.6.3 [default]
packages/core2-64-poky-linux/base-passwd/base-passwd-src: PV changed from "3.6.2" to "3.6.3"
packages/core2-64-poky-linux/base-passwd/base-passwd-src: PKGV changed from 3.6.2 [default] to 3.6.3 [default]
packages/core2-64-poky-linux/base-passwd/base-passwd-staticdev: PV changed from "3.6.2" to "3.6.3"
packages/core2-64-poky-linux/base-passwd/base-passwd-staticdev: PKGV changed from 3.6.2 [default] to 3.6.3 [default]
packages/core2-64-poky-linux/base-passwd/base-passwd-update: PV changed from "3.6.2" to "3.6.3"
packages/core2-64-poky-linux/base-passwd/base-passwd-update: PKGV changed from 3.6.2 [default] to 3.6.3 [default]
packages/core2-64-poky-linux/base-passwd/base-passwd: PV changed from "3.6.2" to "3.6.3"
packages/core2-64-poky-linux/base-passwd/base-passwd: PKGV changed from 3.6.2 [default] to 3.6.3 [default]
packages/core2-64-poky-linux/base-passwd: PV changed from "3.6.2" to "3.6.3"
packages/core2-64-poky-linux/base-passwd: SRC_URI changed from "https://launchpad.net/debian/+archive/primary/+files/base-passwd_3.6.2.tar.xz file://0001-Add-a-shutdown-group.patch file://0002-Use-bin-sh-instead-of-bin-bash-for-the-root-user.patch file://0003-Remove-for-root-since-we-do-not-have-an-etc-shadow.patch file://0004-Add-an-input-group-for-the-dev-input-devices.patch file://0005-Add-kvm-group.patch file://0007-Add-wheel-group.patch file://0001-base-passwd-Add-the-sgx-group.patch" to "https://launchpad.net/debian/+archive/primary/+files/base-passwd_3.6.3.tar.xz file://0001-Add-a-shutdown-group.patch file://0002-Use-bin-sh-instead-of-bin-bash-for-the-root-user.patch file://0003-Remove-for-root-since-we-do-not-have-an-etc-shadow.patch file://0004-Add-an-input-group-for-the-dev-input-devices.patch file://0005-Add-kvm-group.patch file://0007-Add-wheel-group.patch file://0001-base-passwd-Add-the-sgx-group.patch"
packages/core2-64-poky-linux/base-passwd: PKGV changed from 3.6.2 [default] to 3.6.3 [default]

--===============1813270379083020388==
Content-Type: application/octet-stream
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: attachment;
 filename="0001-base-passwd-upgrade-3.6.2-3.6.3.patch"

RnJvbSAyNDZmNTk3MGVlNGFiNjRhNjI1ZDE3NTMwZTMxM2ZkMGE2NmZiY2JkIE1vbiBTZXAgMTcg
MDA6MDA6MDAgMjAwMQpGcm9tOiBVcGdyYWRlIEhlbHBlciA8YXVoQHlvY3RvcHJvamVjdC5vcmc+
CkRhdGU6IEZyaSwgMSBEZWMgMjAyMyAwNTo1NTowNyArMDAwMApTdWJqZWN0OiBbUEFUQ0hdIGJh
c2UtcGFzc3dkOiB1cGdyYWRlIDMuNi4yIC0+IDMuNi4zCgotLS0KIC4uLi9iYXNlLXBhc3N3ZC97
YmFzZS1wYXNzd2RfMy42LjIuYmIgPT4gYmFzZS1wYXNzd2RfMy42LjMuYmJ9ICB8IDIgKy0KIDEg
ZmlsZSBjaGFuZ2VkLCAxIGluc2VydGlvbigrKSwgMSBkZWxldGlvbigtKQogcmVuYW1lIG1ldGEv
cmVjaXBlcy1jb3JlL2Jhc2UtcGFzc3dkL3tiYXNlLXBhc3N3ZF8zLjYuMi5iYiA9PiBiYXNlLXBh
c3N3ZF8zLjYuMy5iYn0gKDk4JSkKCmRpZmYgLS1naXQgYS9tZXRhL3JlY2lwZXMtY29yZS9iYXNl
LXBhc3N3ZC9iYXNlLXBhc3N3ZF8zLjYuMi5iYiBiL21ldGEvcmVjaXBlcy1jb3JlL2Jhc2UtcGFz
c3dkL2Jhc2UtcGFzc3dkXzMuNi4zLmJiCnNpbWlsYXJpdHkgaW5kZXggOTglCnJlbmFtZSBmcm9t
IG1ldGEvcmVjaXBlcy1jb3JlL2Jhc2UtcGFzc3dkL2Jhc2UtcGFzc3dkXzMuNi4yLmJiCnJlbmFt
ZSB0byBtZXRhL3JlY2lwZXMtY29yZS9iYXNlLXBhc3N3ZC9iYXNlLXBhc3N3ZF8zLjYuMy5iYgpp
bmRleCBiYjRiNDllNmFiLi45ZDc3MDNiMWMwIDEwMDY0NAotLS0gYS9tZXRhL3JlY2lwZXMtY29y
ZS9iYXNlLXBhc3N3ZC9iYXNlLXBhc3N3ZF8zLjYuMi5iYgorKysgYi9tZXRhL3JlY2lwZXMtY29y
ZS9iYXNlLXBhc3N3ZC9iYXNlLXBhc3N3ZF8zLjYuMy5iYgpAQCAtMTUsNyArMTUsNyBAQCBTUkNf
VVJJID0gImh0dHBzOi8vbGF1bmNocGFkLm5ldC9kZWJpYW4vK2FyY2hpdmUvcHJpbWFyeS8rZmls
ZXMvJHtCUE59XyR7UFZ9LnRhcgogICAgICAgICAgICBmaWxlOi8vMDAwMS1iYXNlLXBhc3N3ZC1B
ZGQtdGhlLXNneC1ncm91cC5wYXRjaCBcCiAgICAgICAgICAgICIKIAotU1JDX1VSSVtzaGEyNTZz
dW1dID0gIjA2ZGM3ODM1MmJmMzhhOGRmNzZmZjI5NWUxNWFiNTY1NGNkZWZlNDFlNjIzNjhiMTVi
ZmNiYmFiOGU0ZWMyYTAiCitTUkNfVVJJW3NoYTI1NnN1bV0gPSAiODM1NzUzMjdkODMxOGE0MTlj
YWYyZDU0MzM0MTIxNWMwNDYwNDQwNzNkMWFmZWMyYWNjMGFjNGQ4MDk1ZmYzOSIKIAogIyB0aGUg
cGFja2FnZSBpcyB0YWtlbiBmcm9tIGxhdW5jaHBhZDsgdGhhdCBzb3VyY2UgaXMgc3RhdGljIGFu
ZCBnb2VzIHN0YWxlCiAjIHNvIHdlIGNoZWNrIHRoZSBsYXRlc3QgdXBzdHJlYW0gZnJvbSBhIGRp
cmVjdG9yeSB0aGF0IGRvZXMgZ2V0IHVwZGF0ZWQKLS0gCjIuMzkuMgoK

--===============1813270379083020388==--

