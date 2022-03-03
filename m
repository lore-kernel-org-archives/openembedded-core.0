Return-Path: <auh@yoctoproject.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 38A37C4167B
	for <webhook@archiver.kernel.org>; Thu,  3 Mar 2022 17:42:25 +0000 (UTC)
Received: from a27-33.smtp-out.us-west-2.amazonses.com
 (a27-33.smtp-out.us-west-2.amazonses.com [54.240.27.33])
 by mx.groups.io with SMTP id smtpd.web09.13951.1646329344594507104
 for <openembedded-core@lists.openembedded.org>;
 Thu, 03 Mar 2022 09:42:24 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@yoctoproject.org
 header.s=rnkzp2s7ci3kogmesvov2nwn7wcc2dgx header.b=7zCwznZ2;
 spf=pass (domain: us-west-2.amazonses.com, ip: 54.240.27.33,
 mailfrom: 0101017f50e02f41-43119e0d-50f3-456b-a403-254d7a691e0a-000000@us-west-2.amazonses.com)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=rnkzp2s7ci3kogmesvov2nwn7wcc2dgx; d=yoctoproject.org;
	t=1646329344;
	h=Content-Type:MIME-Version:From:To:Cc:Subject:Message-Id:Date;
	bh=/Q1ZIFdeRmSdqoE93pDn9roHSW+bkRK9PORmslV7cWw=;
	b=7zCwznZ2x0qemTfVp4AvIag3W/3ikPV9UIRzXoYVgvk7xeeDYA4hQhr/DvsWAho+
	HROKz0Ggrj6BcUZoB67YXYIuzpgy09T81gctM1O/7t/JHaLAjuXvL1sxsxw7Bd95O3K
	3/jtVRdDZF0aNjuKPKrza8AgYVgwc/lBJWos8wxk=
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=7v7vs6w47njt4pimodk5mmttbegzsi6n; d=amazonses.com; t=1646329344;
	h=Content-Type:MIME-Version:From:To:Cc:Subject:Message-Id:Date:Feedback-ID;
	bh=/Q1ZIFdeRmSdqoE93pDn9roHSW+bkRK9PORmslV7cWw=;
	b=M3oFGhVANvDq9vaUqkHANPMksq4SfQF/erofIZEYsML0jE6/ORyJZl0OWff1504Q
	8I2nsVTj/8Q4DCTrELs8XONr764VaLRHJnMBKDalt6784A2+TYaCe2+BVC6yQt3K1L1
	15cBRp8P/63NXT6muZgrLvofNlQcG+RRxd4llkjQ=
Content-Type: multipart/mixed; boundary="===============5352074367352621683=="
MIME-Version: 1.0
From: auh@yoctoproject.org
To: Anuj Mittal <anuj.mittal@intel.com>
Cc: openembedded-core@lists.openembedded.org
Subject: [AUH] mmc-utils: upgrading to
 4303889c8bd9a2357587eb6ebacecb70098a264d SUCCEEDED
Message-ID: 
 <0101017f50e02f41-43119e0d-50f3-456b-a403-254d7a691e0a-000000@us-west-2.amazonses.com>
Date: Thu, 3 Mar 2022 17:42:23 +0000
Feedback-ID: 
 1.us-west-2.9np3MYPs3fEaOBysGKSlUD4KtcmPijcmS9Az2Hwf7iQ=:AmazonSES
X-SES-Outgoing: 2022.03.03-54.240.27.33
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 03 Mar 2022 17:42:25 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/162679

--===============5352074367352621683==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

Hello,

this email is a notification from the Auto Upgrade Helper
that the automatic attempt to upgrade the recipe *mmc-utils* to *4303889c8bd9a2357587eb6ebacecb70098a264d* has Succeeded.

Next steps:
    - apply the patch: git am 0001-mmc-utils-upgrade-to-latest-revision.patch
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
--===============5352074367352621683==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment; filename="buildhistory-diff-full.txt"

packages/core2-32-poky-linux/mmc-utils: PKGV changed from 0.1+gitAUTOINC+4637a7c0df [default] to 0.1+gitAUTOINC+4303889c8b [default]
packages/core2-32-poky-linux/mmc-utils: PV changed from "0.1+gitAUTOINC+4637a7c0df" to "0.1+gitAUTOINC+4303889c8b"
packages/core2-32-poky-linux/mmc-utils/mmc-utils-dbg: PKGSIZE changed from 230128 to 233864 (+2%)
packages/core2-32-poky-linux/mmc-utils/mmc-utils-dbg: PKGV changed from 0.1+git0+4637a7c0df to 0.1+git0+4303889c8b
packages/core2-32-poky-linux/mmc-utils/mmc-utils-dbg: PV changed from "0.1+gitAUTOINC+4637a7c0df" to "0.1+gitAUTOINC+4303889c8b"
packages/core2-32-poky-linux/mmc-utils/mmc-utils-dev: PKGV changed from 0.1+git0+4637a7c0df to 0.1+git0+4303889c8b
packages/core2-32-poky-linux/mmc-utils/mmc-utils-dev: PV changed from "0.1+gitAUTOINC+4637a7c0df" to "0.1+gitAUTOINC+4303889c8b"
packages/core2-32-poky-linux/mmc-utils/mmc-utils-doc: PKGV changed from 0.1+git0+4637a7c0df to 0.1+git0+4303889c8b
packages/core2-32-poky-linux/mmc-utils/mmc-utils-doc: PV changed from "0.1+gitAUTOINC+4637a7c0df" to "0.1+gitAUTOINC+4303889c8b"
packages/core2-32-poky-linux/mmc-utils/mmc-utils-locale: PKGV changed from 0.1+git0+4637a7c0df to 0.1+git0+4303889c8b
packages/core2-32-poky-linux/mmc-utils/mmc-utils-locale: PV changed from "0.1+gitAUTOINC+4637a7c0df" to "0.1+gitAUTOINC+4303889c8b"
packages/core2-32-poky-linux/mmc-utils/mmc-utils-src: PKGSIZE changed from 206469 to 208563 (+1%)
packages/core2-32-poky-linux/mmc-utils/mmc-utils-src: PKGV changed from 0.1+git0+4637a7c0df to 0.1+git0+4303889c8b
packages/core2-32-poky-linux/mmc-utils/mmc-utils-src: PV changed from "0.1+gitAUTOINC+4637a7c0df" to "0.1+gitAUTOINC+4303889c8b"
packages/core2-32-poky-linux/mmc-utils/mmc-utils-staticdev: PKGV changed from 0.1+git0+4637a7c0df to 0.1+git0+4303889c8b
packages/core2-32-poky-linux/mmc-utils/mmc-utils-staticdev: PV changed from "0.1+gitAUTOINC+4637a7c0df" to "0.1+gitAUTOINC+4303889c8b"
packages/core2-32-poky-linux/mmc-utils/mmc-utils: PKGV changed from 0.1+git0+4637a7c0df to 0.1+git0+4303889c8b
packages/core2-32-poky-linux/mmc-utils/mmc-utils: PV changed from "0.1+gitAUTOINC+4637a7c0df" to "0.1+gitAUTOINC+4303889c8b"

--===============5352074367352621683==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment; filename="buildhistory-diff.txt"

packages/core2-32-poky-linux/mmc-utils/mmc-utils-dbg: PKGV changed from 0.1+git0+4637a7c0df to 0.1+git0+4303889c8b
packages/core2-32-poky-linux/mmc-utils/mmc-utils-dev: PKGV changed from 0.1+git0+4637a7c0df to 0.1+git0+4303889c8b
packages/core2-32-poky-linux/mmc-utils/mmc-utils-doc: PKGV changed from 0.1+git0+4637a7c0df to 0.1+git0+4303889c8b
packages/core2-32-poky-linux/mmc-utils/mmc-utils-locale: PKGV changed from 0.1+git0+4637a7c0df to 0.1+git0+4303889c8b
packages/core2-32-poky-linux/mmc-utils/mmc-utils-src: PKGV changed from 0.1+git0+4637a7c0df to 0.1+git0+4303889c8b
packages/core2-32-poky-linux/mmc-utils/mmc-utils-staticdev: PKGV changed from 0.1+git0+4637a7c0df to 0.1+git0+4303889c8b
packages/core2-32-poky-linux/mmc-utils/mmc-utils: PKGV changed from 0.1+git0+4637a7c0df to 0.1+git0+4303889c8b

--===============5352074367352621683==
Content-Type: application/octet-stream
MIME-Version: 1.0
Content-Disposition: attachment;
 filename="0001-mmc-utils-upgrade-to-latest-revision.patch"

From 66c7ff5979c48c7949ca78dcec7eec3b13a58eed Mon Sep 17 00:00:00 2001
From: Upgrade Helper <auh@yoctoproject.org>
Date: Thu, 3 Mar 2022 14:09:29 +0000
Subject: [PATCH] mmc-utils: upgrade to latest revision

---
 meta/recipes-devtools/mmc/mmc-utils_git.bb | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta/recipes-devtools/mmc/mmc-utils_git.bb b/meta/recipes-devtools/mmc/mmc-utils_git.bb
index e4faa99e33..addefe9abf 100644
--- a/meta/recipes-devtools/mmc/mmc-utils_git.bb
+++ b/meta/recipes-devtools/mmc/mmc-utils_git.bb
@@ -5,7 +5,7 @@ LICENSE = "GPL-2.0-only"
 LIC_FILES_CHKSUM = "file://mmc.c;beginline=1;endline=20;md5=fae32792e20f4d27ade1c5a762d16b7d"
 
 SRCBRANCH ?= "master"
-SRCREV = "4637a7c0df49ba349f9f0e4ab0828133fc06cc81"
+SRCREV = "4303889c8bd9a2357587eb6ebacecb70098a264d"
 
 PV = "0.1+git${SRCPV}"
 
-- 
2.27.0


--===============5352074367352621683==--

