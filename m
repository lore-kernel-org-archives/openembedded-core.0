Return-Path: <auh@yoctoproject.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 6114DE77378
	for <webhook@archiver.kernel.org>; Sun,  1 Oct 2023 18:13:18 +0000 (UTC)
Received: from a27-45.smtp-out.us-west-2.amazonses.com (a27-45.smtp-out.us-west-2.amazonses.com [54.240.27.45])
 by mx.groups.io with SMTP id smtpd.web10.65032.1696183992055461397
 for <openembedded-core@lists.openembedded.org>;
 Sun, 01 Oct 2023 11:13:12 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@yoctoproject.org header.s=lvjh2tk576v2ro5mi6k4dt3mc6wpqbky header.b=FfBzFAX2;
 dkim=pass header.i=@amazonses.com header.s=hsbnp7p3ensaochzwyq5wwmceodymuwv header.b=oz589yo0;
 spf=pass (domain: us-west-2.amazonses.com, ip: 54.240.27.45, mailfrom: 0101018aec71bc38-b4313961-155f-4688-b412-8094f4eed65b-000000@us-west-2.amazonses.com)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=lvjh2tk576v2ro5mi6k4dt3mc6wpqbky; d=yoctoproject.org;
	t=1696183991;
	h=Content-Type:MIME-Version:From:To:Cc:Subject:Message-Id:Date;
	bh=BoojysCBq4BnjRpYTx6bTXE8HLdmrEGrXhFdFtFbq/g=;
	b=FfBzFAX2oSvIdINo2PqfGvfnDwsZdbqSeSFk61Am2nb3a2BAOjDucEjYR8v1PoY3
	ODCxjtctCFlc9//QwyqxzVH+zXD1pxSyuWyYUIuztjA36He1w3uBw8PCf3WPPiY9RYw
	L5OO10Idoav3iv9Hpv6oeCs/A+okkq67D4j7FlwQ=
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=hsbnp7p3ensaochzwyq5wwmceodymuwv; d=amazonses.com; t=1696183991;
	h=Content-Type:MIME-Version:From:To:Cc:Subject:Message-Id:Date:Feedback-ID;
	bh=BoojysCBq4BnjRpYTx6bTXE8HLdmrEGrXhFdFtFbq/g=;
	b=oz589yo0pZ7Tip1FrDKtHwnmve6+7kn5+lwv/0WfJ5qVmqLRvEgmnYNgVm1OywFz
	TvullrQDmi1K55ZP0+mSbLnjbjZYgA/n97PTHxz6l1pb+jDY6WfJtvwY9/f14RYEWqg
	n2146Ktflw/y2pMvKCpYjCcAfM+WDVaO0LjLoIlQ=
Content-Type: multipart/mixed; boundary="===============3568168680803651299=="
MIME-Version: 1.0
From: auh@yoctoproject.org
To: Ross Burton <ross.burton@arm.com>
Cc: openembedded-core@lists.openembedded.org
Subject: [AUH] piglit: upgrading to 411510b9a086fa91363ea33d9e18d6600bb623bf
 SUCCEEDED
Message-ID: <0101018aec71bc38-b4313961-155f-4688-b412-8094f4eed65b-000000@us-west-2.amazonses.com>
Date: Sun, 1 Oct 2023 18:13:11 +0000
Feedback-ID: 1.us-west-2.9np3MYPs3fEaOBysGKSlUD4KtcmPijcmS9Az2Hwf7iQ=:AmazonSES
X-SES-Outgoing: 2023.10.01-54.240.27.45
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Sun, 01 Oct 2023 18:13:18 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/188566

--===============3568168680803651299==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

Hello,

this email is a notification from the Auto Upgrade Helper
that the automatic attempt to upgrade the recipe *piglit* to *411510b9a086fa91363ea33d9e18d6600bb623bf* has Succeeded.

Next steps:
    - apply the patch: git am 0001-piglit-upgrade-to-latest-revision.patch
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
From a4cd61de8feff7ac9e733539434b9272e194150a Mon Sep 17 00:00:00 2001
From: Upgrade Helper <auh@yoctoproject.org>
Date: Sun, 1 Oct 2023 16:00:09 +0000
Subject: [PATCH] piglit: upgrade to latest revision

---
 meta/recipes-graphics/piglit/piglit_git.bb | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta/recipes-graphics/piglit/piglit_git.bb b/meta/recipes-graphics/piglit/piglit_git.bb
index 69294c6c94..e582bb4120 100644
--- a/meta/recipes-graphics/piglit/piglit_git.bb
+++ b/meta/recipes-graphics/piglit/piglit_git.bb
@@ -13,7 +13,7 @@ SRC_URI = "git://gitlab.freedesktop.org/mesa/piglit.git;protocol=https;branch=ma
            "
 UPSTREAM_CHECK_COMMITS = "1"
 
-SRCREV = "71c21b1157c4f9a96453bdfcb9f4dda091360afd"
+SRCREV = "411510b9a086fa91363ea33d9e18d6600bb623bf"
 # (when PV goes above 1.0 remove the trailing r)
 PV = "1.0+gitr"
 
-- 
2.39.2


--===============3568168680803651299==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment; filename="buildhistory-diff-full.txt"

packages/core2-32-poky-linux/piglit/piglit-bash-completion: PKGV changed from 1.0+gitr0+71c21b1157 to 1.0+gitr0+411510b9a0
packages/core2-32-poky-linux/piglit/piglit-dbg: PKGV changed from 1.0+gitr0+71c21b1157 to 1.0+gitr0+411510b9a0
packages/core2-32-poky-linux/piglit/piglit-dev: PKGV changed from 1.0+gitr0+71c21b1157 to 1.0+gitr0+411510b9a0
packages/core2-32-poky-linux/piglit/piglit-doc: PKGV changed from 1.0+gitr0+71c21b1157 to 1.0+gitr0+411510b9a0
packages/core2-32-poky-linux/piglit/piglit-doc: PKGSIZE changed from 22650 to 22661 (+0%)
packages/core2-32-poky-linux/piglit/piglit-locale: PKGV changed from 1.0+gitr0+71c21b1157 to 1.0+gitr0+411510b9a0
packages/core2-32-poky-linux/piglit/piglit-src: PKGV changed from 1.0+gitr0+71c21b1157 to 1.0+gitr0+411510b9a0
packages/core2-32-poky-linux/piglit/piglit-staticdev: PKGV changed from 1.0+gitr0+71c21b1157 to 1.0+gitr0+411510b9a0
packages/core2-32-poky-linux/piglit/piglit: PKGV changed from 1.0+gitr0+71c21b1157 to 1.0+gitr0+411510b9a0
packages/core2-32-poky-linux/piglit/piglit: PKGSIZE changed from 2050283402 to 2050297180 (+0%)
packages/core2-32-poky-linux/piglit/piglit: FILELIST: added "/usr/lib/piglit/bin/arb_copy_image-levels-copy"

--===============3568168680803651299==
Content-Type: application/octet-stream
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: attachment;
 filename="0001-piglit-upgrade-to-latest-revision.patch"

RnJvbSBhNGNkNjFkZThmZWZmN2FjOWU3MzM1Mzk0MzRiOTI3MmUxOTQxNTBhIE1vbiBTZXAgMTcg
MDA6MDA6MDAgMjAwMQpGcm9tOiBVcGdyYWRlIEhlbHBlciA8YXVoQHlvY3RvcHJvamVjdC5vcmc+
CkRhdGU6IFN1biwgMSBPY3QgMjAyMyAxNjowMDowOSArMDAwMApTdWJqZWN0OiBbUEFUQ0hdIHBp
Z2xpdDogdXBncmFkZSB0byBsYXRlc3QgcmV2aXNpb24KCi0tLQogbWV0YS9yZWNpcGVzLWdyYXBo
aWNzL3BpZ2xpdC9waWdsaXRfZ2l0LmJiIHwgMiArLQogMSBmaWxlIGNoYW5nZWQsIDEgaW5zZXJ0
aW9uKCspLCAxIGRlbGV0aW9uKC0pCgpkaWZmIC0tZ2l0IGEvbWV0YS9yZWNpcGVzLWdyYXBoaWNz
L3BpZ2xpdC9waWdsaXRfZ2l0LmJiIGIvbWV0YS9yZWNpcGVzLWdyYXBoaWNzL3BpZ2xpdC9waWds
aXRfZ2l0LmJiCmluZGV4IDY5Mjk0YzZjOTQuLmU1ODJiYjQxMjAgMTAwNjQ0Ci0tLSBhL21ldGEv
cmVjaXBlcy1ncmFwaGljcy9waWdsaXQvcGlnbGl0X2dpdC5iYgorKysgYi9tZXRhL3JlY2lwZXMt
Z3JhcGhpY3MvcGlnbGl0L3BpZ2xpdF9naXQuYmIKQEAgLTEzLDcgKzEzLDcgQEAgU1JDX1VSSSA9
ICJnaXQ6Ly9naXRsYWIuZnJlZWRlc2t0b3Aub3JnL21lc2EvcGlnbGl0LmdpdDtwcm90b2NvbD1o
dHRwczticmFuY2g9bWEKICAgICAgICAgICAgIgogVVBTVFJFQU1fQ0hFQ0tfQ09NTUlUUyA9ICIx
IgogCi1TUkNSRVYgPSAiNzFjMjFiMTE1N2M0ZjlhOTY0NTNiZGZjYjlmNGRkYTA5MTM2MGFmZCIK
K1NSQ1JFViA9ICI0MTE1MTBiOWEwODZmYTkxMzYzZWEzM2Q5ZTE4ZDY2MDBiYjYyM2JmIgogIyAo
d2hlbiBQViBnb2VzIGFib3ZlIDEuMCByZW1vdmUgdGhlIHRyYWlsaW5nIHIpCiBQViA9ICIxLjAr
Z2l0ciIKIAotLSAKMi4zOS4yCgo=

--===============3568168680803651299==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment; filename="buildhistory-diff.txt"

packages/core2-32-poky-linux/piglit/piglit-bash-completion: PKGV changed from 1.0+gitr0+71c21b1157 to 1.0+gitr0+411510b9a0
packages/core2-32-poky-linux/piglit/piglit-dbg: PKGV changed from 1.0+gitr0+71c21b1157 to 1.0+gitr0+411510b9a0
packages/core2-32-poky-linux/piglit/piglit-dev: PKGV changed from 1.0+gitr0+71c21b1157 to 1.0+gitr0+411510b9a0
packages/core2-32-poky-linux/piglit/piglit-doc: PKGV changed from 1.0+gitr0+71c21b1157 to 1.0+gitr0+411510b9a0
packages/core2-32-poky-linux/piglit/piglit-locale: PKGV changed from 1.0+gitr0+71c21b1157 to 1.0+gitr0+411510b9a0
packages/core2-32-poky-linux/piglit/piglit-src: PKGV changed from 1.0+gitr0+71c21b1157 to 1.0+gitr0+411510b9a0
packages/core2-32-poky-linux/piglit/piglit-staticdev: PKGV changed from 1.0+gitr0+71c21b1157 to 1.0+gitr0+411510b9a0
packages/core2-32-poky-linux/piglit/piglit: FILELIST: added "/usr/lib/piglit/bin/arb_copy_image-levels-copy"
packages/core2-32-poky-linux/piglit/piglit: PKGV changed from 1.0+gitr0+71c21b1157 to 1.0+gitr0+411510b9a0

--===============3568168680803651299==--

