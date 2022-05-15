Return-Path: <auh@yoctoproject.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id D582EC4167B
	for <webhook@archiver.kernel.org>; Sun, 15 May 2022 17:15:21 +0000 (UTC)
Received: from a27-193.smtp-out.us-west-2.amazonses.com
 (a27-193.smtp-out.us-west-2.amazonses.com [54.240.27.193])
 by mx.groups.io with SMTP id smtpd.web08.18882.1652634912243368546
 for <openembedded-core@lists.openembedded.org>;
 Sun, 15 May 2022 10:15:13 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@yoctoproject.org
 header.s=j46ser6a2yusdzubpv7m7ewqgesde2ie header.b=YWW47X+S;
 spf=pass (domain: us-west-2.amazonses.com, ip: 54.240.27.193,
 mailfrom: 01010180c8b786af-04f54a0d-d007-41e5-8725-9a3870aa1bf3-000000@us-west-2.amazonses.com)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=j46ser6a2yusdzubpv7m7ewqgesde2ie; d=yoctoproject.org;
	t=1652634912;
	h=Content-Type:MIME-Version:From:To:Cc:Subject:Message-Id:Date;
	bh=RizNgcRBHoPSDI9p9fnSlC+zqDO6wHr24+LRauLJbTU=;
	b=YWW47X+S1nl9zJ6FD/HTQqJ9Ccar8lTLQjpWMoTKfMmYzde44p8uYPV99ggMZEw2
	jUZEYw/D+mL0tumqJlDYrzAVanf5MdtCUJa3MgyBcYlpXu57otsf2Ctb+5JsK0ToXS/
	flaGNXwbc33bQ98KCn956HuU3ExkfgE4bakTP8w0=
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=gdwg2y3kokkkj5a55z2ilkup5wp5hhxx; d=amazonses.com; t=1652634912;
	h=Content-Type:MIME-Version:From:To:Cc:Subject:Message-Id:Date:Feedback-ID;
	bh=RizNgcRBHoPSDI9p9fnSlC+zqDO6wHr24+LRauLJbTU=;
	b=UuZnLhJMIr36S32oARvOvRJjRsjPrt7YuTlyCR7w87dH/iJUctCa6jv19mnxPsBd
	r2NmX05leMUEa3P7E99nZGQN3d5KVpu+/5FKo0sJD/1lKO5Qmy5He7NbD4X2DUSSwAA
	a5QIFdhXlknH2g5wXXa2cqUOoOtDtkjydokpn/Hc=
Content-Type: multipart/mixed; boundary="===============9103394528052063463=="
MIME-Version: 1.0
From: auh@yoctoproject.org
To: Tim Orling <tim.orling@konsulko.com>
Cc: openembedded-core@lists.openembedded.org
Subject: [AUH] python3-hypothesis: upgrading to 6.46.4 SUCCEEDED
Message-ID: 
 <01010180c8b786af-04f54a0d-d007-41e5-8725-9a3870aa1bf3-000000@us-west-2.amazonses.com>
Date: Sun, 15 May 2022 17:15:12 +0000
Feedback-ID: 
 1.us-west-2.9np3MYPs3fEaOBysGKSlUD4KtcmPijcmS9Az2Hwf7iQ=:AmazonSES
X-SES-Outgoing: 2022.05.15-54.240.27.193
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Sun, 15 May 2022 17:15:21 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/165611

--===============9103394528052063463==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

Hello,

this email is a notification from the Auto Upgrade Helper
that the automatic attempt to upgrade the recipe *python3-hypothesis* to *6.46.4* has Succeeded.

Next steps:
    - apply the patch: git am 0001-python3-hypothesis-upgrade-6.46.0-6.46.4.patch
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
--===============9103394528052063463==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment; filename="buildhistory-diff-full.txt"

packages/core2-32-poky-linux/python3-hypothesis: PKGV changed from 6.46.0 [default] to 6.46.4 [default]
packages/core2-32-poky-linux/python3-hypothesis: SRC_URI changed from "https://files.pythonhosted.org/packages/source/h/hypothesis/hypothesis-6.46.0.tar.gz file://run-ptest file://test_binary_search.py file://test_rle.py" to "https://files.pythonhosted.org/packages/source/h/hypothesis/hypothesis-6.46.4.tar.gz file://run-ptest file://test_binary_search.py file://test_rle.py"
packages/core2-32-poky-linux/python3-hypothesis: PV changed from "6.46.0" to "6.46.4"
packages/core2-32-poky-linux/python3-hypothesis/python3-hypothesis-dbg: PKGV changed from 6.46.0 [default] to 6.46.4 [default]
packages/core2-32-poky-linux/python3-hypothesis/python3-hypothesis-dbg: PV changed from "6.46.0" to "6.46.4"
packages/core2-32-poky-linux/python3-hypothesis/python3-hypothesis-dev: PKGV changed from 6.46.0 [default] to 6.46.4 [default]
packages/core2-32-poky-linux/python3-hypothesis/python3-hypothesis-dev: PV changed from "6.46.0" to "6.46.4"
packages/core2-32-poky-linux/python3-hypothesis/python3-hypothesis-doc: PKGV changed from 6.46.0 [default] to 6.46.4 [default]
packages/core2-32-poky-linux/python3-hypothesis/python3-hypothesis-doc: PV changed from "6.46.0" to "6.46.4"
packages/core2-32-poky-linux/python3-hypothesis/python3-hypothesis-locale: PKGV changed from 6.46.0 [default] to 6.46.4 [default]
packages/core2-32-poky-linux/python3-hypothesis/python3-hypothesis-locale: PV changed from "6.46.0" to "6.46.4"
packages/core2-32-poky-linux/python3-hypothesis/python3-hypothesis-ptest: PKGV changed from 6.46.0 [default] to 6.46.4 [default]
packages/core2-32-poky-linux/python3-hypothesis/python3-hypothesis-ptest: PV changed from "6.46.0" to "6.46.4"
packages/core2-32-poky-linux/python3-hypothesis/python3-hypothesis-src: PKGV changed from 6.46.0 [default] to 6.46.4 [default]
packages/core2-32-poky-linux/python3-hypothesis/python3-hypothesis-src: PV changed from "6.46.0" to "6.46.4"
packages/core2-32-poky-linux/python3-hypothesis/python3-hypothesis-staticdev: PKGV changed from 6.46.0 [default] to 6.46.4 [default]
packages/core2-32-poky-linux/python3-hypothesis/python3-hypothesis-staticdev: PV changed from "6.46.0" to "6.46.4"
packages/core2-32-poky-linux/python3-hypothesis/python3-hypothesis: PKGV changed from 6.46.0 [default] to 6.46.4 [default]
packages/core2-32-poky-linux/python3-hypothesis/python3-hypothesis: PV changed from "6.46.0" to "6.46.4"
packages/core2-32-poky-linux/python3-hypothesis/python3-hypothesis: PKGSIZE changed from 2046008 to 2052129 (+0%)
Changes to packages/core2-32-poky-linux/python3-hypothesis (sysroot):
  /usr/lib/python3.10/site-packages/hypothesis-6.46.0.dist-info moved to /usr/lib/python3.10/site-packages/hypothesis-6.46.4.dist-info

--===============9103394528052063463==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment; filename="buildhistory-diff.txt"

Changes to packages/core2-32-poky-linux/python3-hypothesis (sysroot):
  /usr/lib/python3.10/site-packages/hypothesis-6.46.0.dist-info moved to /usr/lib/python3.10/site-packages/hypothesis-6.46.4.dist-info

--===============9103394528052063463==
Content-Type: application/octet-stream
MIME-Version: 1.0
Content-Disposition: attachment;
 filename="0001-python3-hypothesis-upgrade-6.46.0-6.46.4.patch"

From d2f65385a324b2aff575d0d8b8af3e4ba8036bbd Mon Sep 17 00:00:00 2001
From: Upgrade Helper <auh@yoctoproject.org>
Date: Sun, 15 May 2022 08:45:16 +0000
Subject: [PATCH] python3-hypothesis: upgrade 6.46.0 -> 6.46.4

---
 ...ython3-hypothesis_6.46.0.bb => python3-hypothesis_6.46.4.bb} | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta/recipes-devtools/python/{python3-hypothesis_6.46.0.bb => python3-hypothesis_6.46.4.bb} (91%)

diff --git a/meta/recipes-devtools/python/python3-hypothesis_6.46.0.bb b/meta/recipes-devtools/python/python3-hypothesis_6.46.4.bb
similarity index 91%
rename from meta/recipes-devtools/python/python3-hypothesis_6.46.0.bb
rename to meta/recipes-devtools/python/python3-hypothesis_6.46.4.bb
index fb58297c27..86d6793670 100644
--- a/meta/recipes-devtools/python/python3-hypothesis_6.46.0.bb
+++ b/meta/recipes-devtools/python/python3-hypothesis_6.46.4.bb
@@ -13,7 +13,7 @@ SRC_URI += " \
     file://test_rle.py \
     "
 
-SRC_URI[sha256sum] = "349e4a94926c91377fa3806ff363c6b9b65f95bec67d146066a16610501bf067"
+SRC_URI[sha256sum] = "f5c24a3d3f8a0d8de2dd33079bf1580a3cfbfe74763187d47570fc9beea84c9b"
 
 RDEPENDS:${PN} += " \
     python3-attrs \
-- 
2.31.1


--===============9103394528052063463==--

