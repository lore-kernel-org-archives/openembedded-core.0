Return-Path: <auh@yoctoproject.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 06323C2BBEE
	for <webhook@archiver.kernel.org>; Fri,  1 Jul 2022 14:51:10 +0000 (UTC)
Received: from a27-192.smtp-out.us-west-2.amazonses.com
 (a27-192.smtp-out.us-west-2.amazonses.com [54.240.27.192])
 by mx.groups.io with SMTP id smtpd.web08.39310.1656687063013338220
 for <openembedded-core@lists.openembedded.org>;
 Fri, 01 Jul 2022 07:51:03 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@yoctoproject.org
 header.s=j46ser6a2yusdzubpv7m7ewqgesde2ie header.b=HT1B8bVM;
 spf=pass (domain: us-west-2.amazonses.com, ip: 54.240.27.192,
 mailfrom: 01010181ba3e6be5-0e22bfc8-d555-4035-9052-b65748239b87-000000@us-west-2.amazonses.com)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=j46ser6a2yusdzubpv7m7ewqgesde2ie; d=yoctoproject.org;
	t=1656687062;
	h=Content-Type:MIME-Version:From:To:Cc:Subject:Message-Id:Date;
	bh=beKnDnvSkEDtk36yC5lrdHiRen/zDQAl30ulOym7uhg=;
	b=HT1B8bVMn9bsUwVDa+ixUAFOdHGljgYNUZ2A4dDUQXjnygwVGlG1kNu1Pezsn5WZ
	hpQreapZ+ZhYM1UFrUZHasuGP3nRlZvpiIZEqA0ZZWh8aGkg+2Cg3jSzwu2bAQsYrBh
	IWipcf4/EairsHrggjMYzGuem6kmbq7B6dNfb17I=
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=gdwg2y3kokkkj5a55z2ilkup5wp5hhxx; d=amazonses.com; t=1656687062;
	h=Content-Type:MIME-Version:From:To:Cc:Subject:Message-Id:Date:Feedback-ID;
	bh=beKnDnvSkEDtk36yC5lrdHiRen/zDQAl30ulOym7uhg=;
	b=ex9GPME7b488h2JH62lFovNVde6h7lBYf3XwHSVfygLuvZXgRECtwvGZzAIbEOdt
	cHUAVTxnoCs09mITr9z3+vFFWs0EuMGKjiCknuxf1kfnZyJt1jx19nkrRh9+NZVJ55X
	tqqMLUfXnf3BIHK9TKsE+xOOMs6ck7CYM/pEmu58=
Content-Type: multipart/mixed; boundary="===============6442366931946853050=="
MIME-Version: 1.0
From: auh@yoctoproject.org
To: Tim Orling <tim.orling@konsulko.com>
Cc: openembedded-core@lists.openembedded.org
Subject: [AUH] python3-cffi: upgrading to 1.15.1 SUCCEEDED
Message-ID: 
 <01010181ba3e6be5-0e22bfc8-d555-4035-9052-b65748239b87-000000@us-west-2.amazonses.com>
Date: Fri, 1 Jul 2022 14:51:02 +0000
Feedback-ID: 
 1.us-west-2.9np3MYPs3fEaOBysGKSlUD4KtcmPijcmS9Az2Hwf7iQ=:AmazonSES
X-SES-Outgoing: 2022.07.01-54.240.27.192
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Fri, 01 Jul 2022 14:51:10 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/167485

--===============6442366931946853050==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

Hello,

this email is a notification from the Auto Upgrade Helper
that the automatic attempt to upgrade the recipe *python3-cffi* to *1.15.1* has Succeeded.

Next steps:
    - apply the patch: git am 0001-python3-cffi-upgrade-1.15.0-1.15.1.patch
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
--===============6442366931946853050==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment; filename="buildhistory-diff-full.txt"

packages/core2-32-poky-linux/python3-cffi: SRC_URI changed from "https://files.pythonhosted.org/packages/source/c/cffi/cffi-1.15.0.tar.gz" to "https://files.pythonhosted.org/packages/source/c/cffi/cffi-1.15.1.tar.gz"
packages/core2-32-poky-linux/python3-cffi: PKGV changed from 1.15.0 [default] to 1.15.1 [default]
packages/core2-32-poky-linux/python3-cffi: PV changed from "1.15.0" to "1.15.1"
packages/core2-32-poky-linux/python3-cffi/python3-cffi-dbg: PKGSIZE changed from 373480 to 375064 (+0%)
packages/core2-32-poky-linux/python3-cffi/python3-cffi-dbg: PKGV changed from 1.15.0 [default] to 1.15.1 [default]
packages/core2-32-poky-linux/python3-cffi/python3-cffi-dbg: PV changed from "1.15.0" to "1.15.1"
packages/core2-32-poky-linux/python3-cffi/python3-cffi-dev: PKGV changed from 1.15.0 [default] to 1.15.1 [default]
packages/core2-32-poky-linux/python3-cffi/python3-cffi-dev: PV changed from "1.15.0" to "1.15.1"
packages/core2-32-poky-linux/python3-cffi/python3-cffi-doc: PKGV changed from 1.15.0 [default] to 1.15.1 [default]
packages/core2-32-poky-linux/python3-cffi/python3-cffi-doc: PV changed from "1.15.0" to "1.15.1"
packages/core2-32-poky-linux/python3-cffi/python3-cffi-locale: PKGV changed from 1.15.0 [default] to 1.15.1 [default]
packages/core2-32-poky-linux/python3-cffi/python3-cffi-locale: PV changed from "1.15.0" to "1.15.1"
packages/core2-32-poky-linux/python3-cffi/python3-cffi-src: PKGSIZE changed from 482888 to 484006 (+0%)
packages/core2-32-poky-linux/python3-cffi/python3-cffi-src: PKGV changed from 1.15.0 [default] to 1.15.1 [default]
packages/core2-32-poky-linux/python3-cffi/python3-cffi-src: PV changed from "1.15.0" to "1.15.1"
packages/core2-32-poky-linux/python3-cffi/python3-cffi-staticdev: PKGV changed from 1.15.0 [default] to 1.15.1 [default]
packages/core2-32-poky-linux/python3-cffi/python3-cffi-staticdev: PV changed from "1.15.0" to "1.15.1"
packages/core2-32-poky-linux/python3-cffi/python3-cffi: PKGSIZE changed from 809454 to 813699 (+1%)
packages/core2-32-poky-linux/python3-cffi/python3-cffi: PKGV changed from 1.15.0 [default] to 1.15.1 [default]
packages/core2-32-poky-linux/python3-cffi/python3-cffi: PV changed from "1.15.0" to "1.15.1"
Changes to packages/core2-32-poky-linux/python3-cffi (sysroot):
  /usr/lib/python3.10/site-packages/cffi-1.15.0.dist-info moved to /usr/lib/python3.10/site-packages/cffi-1.15.1.dist-info

--===============6442366931946853050==
Content-Type: application/octet-stream
MIME-Version: 1.0
Content-Disposition: attachment;
 filename="0001-python3-cffi-upgrade-1.15.0-1.15.1.patch"

From 7c130ac08591e3e32596e2d812f9742bdda0ab56 Mon Sep 17 00:00:00 2001
From: Upgrade Helper <auh@yoctoproject.org>
Date: Fri, 1 Jul 2022 08:13:03 +0000
Subject: [PATCH] python3-cffi: upgrade 1.15.0 -> 1.15.1

---
 .../python/{python3-cffi_1.15.0.bb => python3-cffi_1.15.1.bb}   | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta/recipes-devtools/python/{python3-cffi_1.15.0.bb => python3-cffi_1.15.1.bb} (83%)

diff --git a/meta/recipes-devtools/python/python3-cffi_1.15.0.bb b/meta/recipes-devtools/python/python3-cffi_1.15.1.bb
similarity index 83%
rename from meta/recipes-devtools/python/python3-cffi_1.15.0.bb
rename to meta/recipes-devtools/python/python3-cffi_1.15.1.bb
index c36f23b3dd..daa290a54e 100644
--- a/meta/recipes-devtools/python/python3-cffi_1.15.0.bb
+++ b/meta/recipes-devtools/python/python3-cffi_1.15.1.bb
@@ -4,7 +4,7 @@ LICENSE = "MIT"
 LIC_FILES_CHKSUM = "file://LICENSE;md5=5677e2fdbf7cdda61d6dd2b57df547bf"
 DEPENDS += "libffi ${PYTHON_PN}-pycparser"
 
-SRC_URI[sha256sum] = "920f0d66a896c2d99f0adbb391f990a84091179542c205fa53ce5787aff87954"
+SRC_URI[sha256sum] = "d400bfb9a37b1351253cb402671cea7e89bdecc294e8016a707f6d1d8ac934f9"
 
 inherit pypi setuptools3
 
-- 
2.31.1


--===============6442366931946853050==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment; filename="buildhistory-diff.txt"

Changes to packages/core2-32-poky-linux/python3-cffi (sysroot):
  /usr/lib/python3.10/site-packages/cffi-1.15.0.dist-info moved to /usr/lib/python3.10/site-packages/cffi-1.15.1.dist-info

--===============6442366931946853050==--

