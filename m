Return-Path: <auh@yoctoproject.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 51D9BCCA49E
	for <webhook@archiver.kernel.org>; Wed, 15 Jun 2022 13:03:46 +0000 (UTC)
Received: from a27-31.smtp-out.us-west-2.amazonses.com
 (a27-31.smtp-out.us-west-2.amazonses.com [54.240.27.31])
 by mx.groups.io with SMTP id smtpd.web11.4419.1655298221457139043
 for <openembedded-core@lists.openembedded.org>;
 Wed, 15 Jun 2022 06:03:41 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@yoctoproject.org
 header.s=j46ser6a2yusdzubpv7m7ewqgesde2ie header.b=ahWV7Py6;
 spf=pass (domain: us-west-2.amazonses.com, ip: 54.240.27.31,
 mailfrom: 01010181677661e4-918a2f1d-6448-4407-8dc5-70e6c3f8ea8e-000000@us-west-2.amazonses.com)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=j46ser6a2yusdzubpv7m7ewqgesde2ie; d=yoctoproject.org;
	t=1655298220;
	h=Content-Type:MIME-Version:From:To:Cc:Subject:Message-Id:Date;
	bh=6RdCgV5GGtbesEIMXP9B+ACld6vgENJnZYxi0KytlOk=;
	b=ahWV7Py6doDRtHCDzlbYWc5kHzrnaxT1jLajkrLEZ0ZyClYYVYm+zdaNZRDkAKgJ
	iIEedKPOtK4CrulYEA14qLSC3p9HZVUkEhHbBlO5Cmp0OlewIveQP8pyNU1ElSCpVTx
	p4UBbpo+2PlYtoRTrvfDx5FjgyxUW3C/D4WAV23g=
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=gdwg2y3kokkkj5a55z2ilkup5wp5hhxx; d=amazonses.com; t=1655298220;
	h=Content-Type:MIME-Version:From:To:Cc:Subject:Message-Id:Date:Feedback-ID;
	bh=6RdCgV5GGtbesEIMXP9B+ACld6vgENJnZYxi0KytlOk=;
	b=kdQ7uw1ExoqspLN8joPGXtO6nsuAPJE/mFdzGY0AK/dg0JNlpF1Pdla2KrAq5W+H
	jqIzPxlGGkwaiABDvaNv1x9hhN9Vxtsnq6hZQCnj9vc9WVBQZAZpfZy9lix48/6E4sj
	TMdO8Z8omKlwdMHOT/L88dCm8cADqmG0ClOUKLag=
Content-Type: multipart/mixed; boundary="===============2443305514195990553=="
MIME-Version: 1.0
From: auh@yoctoproject.org
To: Tim Orling <tim.orling@konsulko.com>
Cc: openembedded-core@lists.openembedded.org
Subject: [AUH] python3-requests: upgrading to 2.28.0 SUCCEEDED
Message-ID: 
 <01010181677661e4-918a2f1d-6448-4407-8dc5-70e6c3f8ea8e-000000@us-west-2.amazonses.com>
Date: Wed, 15 Jun 2022 13:03:40 +0000
Feedback-ID: 
 1.us-west-2.9np3MYPs3fEaOBysGKSlUD4KtcmPijcmS9Az2Hwf7iQ=:AmazonSES
X-SES-Outgoing: 2022.06.15-54.240.27.31
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 15 Jun 2022 13:03:46 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/166947

--===============2443305514195990553==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

Hello,

this email is a notification from the Auto Upgrade Helper
that the automatic attempt to upgrade the recipe *python3-requests* to *2.28.0* has Succeeded.

Next steps:
    - apply the patch: git am 0001-python3-requests-upgrade-2.27.1-2.28.0.patch
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
--===============2443305514195990553==
Content-Type: application/octet-stream
MIME-Version: 1.0
Content-Disposition: attachment;
 filename="0001-python3-requests-upgrade-2.27.1-2.28.0.patch"

From aa832f71ca44e7b21f5ff2c97fbef7e4b195552d Mon Sep 17 00:00:00 2001
From: Upgrade Helper <auh@yoctoproject.org>
Date: Wed, 15 Jun 2022 08:35:34 +0000
Subject: [PATCH] python3-requests: upgrade 2.27.1 -> 2.28.0

---
 .../{python3-requests_2.27.1.bb => python3-requests_2.28.0.bb}  | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta/recipes-devtools/python/{python3-requests_2.27.1.bb => python3-requests_2.28.0.bb} (86%)

diff --git a/meta/recipes-devtools/python/python3-requests_2.27.1.bb b/meta/recipes-devtools/python/python3-requests_2.28.0.bb
similarity index 86%
rename from meta/recipes-devtools/python/python3-requests_2.27.1.bb
rename to meta/recipes-devtools/python/python3-requests_2.28.0.bb
index af52b7caf5..f71763565d 100644
--- a/meta/recipes-devtools/python/python3-requests_2.27.1.bb
+++ b/meta/recipes-devtools/python/python3-requests_2.28.0.bb
@@ -3,7 +3,7 @@ HOMEPAGE = "http://python-requests.org"
 LICENSE = "Apache-2.0"
 LIC_FILES_CHKSUM = "file://LICENSE;md5=34400b68072d710fecd0a2940a0d1658"
 
-SRC_URI[sha256sum] = "68d7c56fd5a8999887728ef304a6d12edc7be74f1cfa47714fc8b414525c9a61"
+SRC_URI[sha256sum] = "d568723a7ebd25875d8d1eaf5dfa068cd2fc8194b2e483d7b1f7c81918dbec6b"
 
 inherit pypi setuptools3
 
-- 
2.31.1


--===============2443305514195990553==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment; filename="buildhistory-diff-full.txt"

packages/core2-32-poky-linux/python3-requests: PV changed from "2.27.1" to "2.28.0"
packages/core2-32-poky-linux/python3-requests: SRC_URI changed from "https://files.pythonhosted.org/packages/source/r/requests/requests-2.27.1.tar.gz" to "https://files.pythonhosted.org/packages/source/r/requests/requests-2.28.0.tar.gz"
packages/core2-32-poky-linux/python3-requests: PKGV changed from 2.27.1 [default] to 2.28.0 [default]
packages/core2-32-poky-linux/python3-requests/python3-requests-dbg: PV changed from "2.27.1" to "2.28.0"
packages/core2-32-poky-linux/python3-requests/python3-requests-dbg: PKGV changed from 2.27.1 [default] to 2.28.0 [default]
packages/core2-32-poky-linux/python3-requests/python3-requests-dev: PV changed from "2.27.1" to "2.28.0"
packages/core2-32-poky-linux/python3-requests/python3-requests-dev: PKGV changed from 2.27.1 [default] to 2.28.0 [default]
packages/core2-32-poky-linux/python3-requests/python3-requests-doc: PV changed from "2.27.1" to "2.28.0"
packages/core2-32-poky-linux/python3-requests/python3-requests-doc: PKGV changed from 2.27.1 [default] to 2.28.0 [default]
packages/core2-32-poky-linux/python3-requests/python3-requests-locale: PV changed from "2.27.1" to "2.28.0"
packages/core2-32-poky-linux/python3-requests/python3-requests-locale: PKGV changed from 2.27.1 [default] to 2.28.0 [default]
packages/core2-32-poky-linux/python3-requests/python3-requests-src: PV changed from "2.27.1" to "2.28.0"
packages/core2-32-poky-linux/python3-requests/python3-requests-src: PKGV changed from 2.27.1 [default] to 2.28.0 [default]
packages/core2-32-poky-linux/python3-requests/python3-requests-staticdev: PV changed from "2.27.1" to "2.28.0"
packages/core2-32-poky-linux/python3-requests/python3-requests-staticdev: PKGV changed from 2.27.1 [default] to 2.28.0 [default]
packages/core2-32-poky-linux/python3-requests/python3-requests: PV changed from "2.27.1" to "2.28.0"
packages/core2-32-poky-linux/python3-requests/python3-requests: PKGSIZE changed from 342632 to 342567 (-0%)
packages/core2-32-poky-linux/python3-requests/python3-requests: PKGV changed from 2.27.1 [default] to 2.28.0 [default]
Changes to packages/core2-32-poky-linux/python3-requests (sysroot):
  /usr/lib/python3.10/site-packages/requests-2.27.1.dist-info moved to /usr/lib/python3.10/site-packages/requests-2.28.0.dist-info

--===============2443305514195990553==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment; filename="buildhistory-diff.txt"

Changes to packages/core2-32-poky-linux/python3-requests (sysroot):
  /usr/lib/python3.10/site-packages/requests-2.27.1.dist-info moved to /usr/lib/python3.10/site-packages/requests-2.28.0.dist-info

--===============2443305514195990553==--

