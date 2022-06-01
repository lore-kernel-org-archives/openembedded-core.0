Return-Path: <auh@yoctoproject.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 3AA43CCA47A
	for <webhook@archiver.kernel.org>; Wed,  1 Jun 2022 16:18:48 +0000 (UTC)
Received: from a27-192.smtp-out.us-west-2.amazonses.com
 (a27-192.smtp-out.us-west-2.amazonses.com [54.240.27.192])
 by mx.groups.io with SMTP id smtpd.web08.657.1654100323818224796
 for <openembedded-core@lists.openembedded.org>;
 Wed, 01 Jun 2022 09:18:44 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@yoctoproject.org
 header.s=j46ser6a2yusdzubpv7m7ewqgesde2ie header.b=mWciCgS4;
 spf=pass (domain: us-west-2.amazonses.com, ip: 54.240.27.192,
 mailfrom: 01010181200fef78-aa0f73d8-c3fd-46c0-a2e0-f93b49e4652f-000000@us-west-2.amazonses.com)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=j46ser6a2yusdzubpv7m7ewqgesde2ie; d=yoctoproject.org;
	t=1654100324;
	h=Content-Type:MIME-Version:From:To:Cc:Subject:Message-Id:Date;
	bh=V8uNRvJ4uRRftliX5cXmtir7qgT0MADvrhePNG2ZN6w=;
	b=mWciCgS4tD3utRn1HjKdncsv3bDlTsLfo+WLu6DaEY5BBji3Fc1h/2DqKa+Gf8Yw
	tvrSRZ0dvbHMRC4QLuqRnh4aiFE6ow/ubRGhftRhaBAld3tG3+1PtEEpMpA3//RMn/I
	WkBOxFT8maUvpCKxySJOaG/Nel7qVp5NXMT7ZNPE=
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=gdwg2y3kokkkj5a55z2ilkup5wp5hhxx; d=amazonses.com; t=1654100324;
	h=Content-Type:MIME-Version:From:To:Cc:Subject:Message-Id:Date:Feedback-ID;
	bh=V8uNRvJ4uRRftliX5cXmtir7qgT0MADvrhePNG2ZN6w=;
	b=NSzAV2n4CnYwauJL+gZRVilZuDnVYljczd4vzfwvK0IQiTfW0o7vbI83k91DM3VT
	kMm47Iph/g2N4sfNASTmfxXpcxnPIyA1Kr+kVnn6IxedI6T4+x/KWWfIWBY43XgjNQ+
	Q4j7UgkXyuJimhnuO6zI0ukqV+zBQ2ZhM0bG5ykM=
Content-Type: multipart/mixed; boundary="===============1758453561194449557=="
MIME-Version: 1.0
From: auh@yoctoproject.org
To: Joshua Watt <JPEWhacker@gmail.com>
Cc: openembedded-core@lists.openembedded.org
Subject: [AUH] diffoscope: upgrading to 214 SUCCEEDED
Message-ID: 
 <01010181200fef78-aa0f73d8-c3fd-46c0-a2e0-f93b49e4652f-000000@us-west-2.amazonses.com>
Date: Wed, 1 Jun 2022 16:18:44 +0000
Feedback-ID: 
 1.us-west-2.9np3MYPs3fEaOBysGKSlUD4KtcmPijcmS9Az2Hwf7iQ=:AmazonSES
X-SES-Outgoing: 2022.06.01-54.240.27.192
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 01 Jun 2022 16:18:48 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/166426

--===============1758453561194449557==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

Hello,

this email is a notification from the Auto Upgrade Helper
that the automatic attempt to upgrade the recipe *diffoscope* to *214* has Succeeded.

Next steps:
    - apply the patch: git am 0001-diffoscope-upgrade-212-214.patch
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
--===============1758453561194449557==
Content-Type: application/octet-stream
MIME-Version: 1.0
Content-Disposition: attachment;
 filename="0001-diffoscope-upgrade-212-214.patch"

From a8dcb424f2f453b7b61d8d2f650abc1d1ee92429 Mon Sep 17 00:00:00 2001
From: Upgrade Helper <auh@yoctoproject.org>
Date: Wed, 1 Jun 2022 15:56:43 +0000
Subject: [PATCH] diffoscope: upgrade 212 -> 214

---
 .../diffoscope/{diffoscope_212.bb => diffoscope_214.bb}         | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta/recipes-support/diffoscope/{diffoscope_212.bb => diffoscope_214.bb} (92%)

diff --git a/meta/recipes-support/diffoscope/diffoscope_212.bb b/meta/recipes-support/diffoscope/diffoscope_214.bb
similarity index 92%
rename from meta/recipes-support/diffoscope/diffoscope_212.bb
rename to meta/recipes-support/diffoscope/diffoscope_214.bb
index 41f896d74f..7327407162 100644
--- a/meta/recipes-support/diffoscope/diffoscope_212.bb
+++ b/meta/recipes-support/diffoscope/diffoscope_214.bb
@@ -12,7 +12,7 @@ PYPI_PACKAGE = "diffoscope"
 
 inherit pypi setuptools3
 
-SRC_URI[sha256sum] = "744260ccf2bb869c58c50dfab68957dd494b12e446520993d0925b2394ea1db7"
+SRC_URI[sha256sum] = "d670774498667be9dde75b14d94f57526834fc6b1d6aff89f6c68570a2246b03"
 
 RDEPENDS:${PN} += "binutils vim squashfs-tools python3-libarchive-c python3-magic python3-rpm"
 
-- 
2.31.1


--===============1758453561194449557==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment; filename="buildhistory-diff-full.txt"

packages/core2-32-poky-linux/diffoscope/diffoscope-dbg: PV changed from "212" to "214"
packages/core2-32-poky-linux/diffoscope/diffoscope-dbg: PKGV changed from 212 [default] to 214 [default]
packages/core2-32-poky-linux/diffoscope/diffoscope-dev: PV changed from "212" to "214"
packages/core2-32-poky-linux/diffoscope/diffoscope-dev: PKGV changed from 212 [default] to 214 [default]
packages/core2-32-poky-linux/diffoscope/diffoscope-doc: PV changed from "212" to "214"
packages/core2-32-poky-linux/diffoscope/diffoscope-doc: PKGV changed from 212 [default] to 214 [default]
packages/core2-32-poky-linux/diffoscope/diffoscope-locale: PV changed from "212" to "214"
packages/core2-32-poky-linux/diffoscope/diffoscope-locale: PKGV changed from 212 [default] to 214 [default]
packages/core2-32-poky-linux/diffoscope/diffoscope-src: PV changed from "212" to "214"
packages/core2-32-poky-linux/diffoscope/diffoscope-src: PKGV changed from 212 [default] to 214 [default]
packages/core2-32-poky-linux/diffoscope/diffoscope-staticdev: PV changed from "212" to "214"
packages/core2-32-poky-linux/diffoscope/diffoscope-staticdev: PKGV changed from 212 [default] to 214 [default]
packages/core2-32-poky-linux/diffoscope/diffoscope: PKGSIZE changed from 1054847 to 1055982 (+0%)
packages/core2-32-poky-linux/diffoscope/diffoscope: PV changed from "212" to "214"
packages/core2-32-poky-linux/diffoscope/diffoscope: PKGV changed from 212 [default] to 214 [default]
packages/core2-32-poky-linux/diffoscope: SRC_URI changed from "https://files.pythonhosted.org/packages/source/d/diffoscope/diffoscope-212.tar.gz" to "https://files.pythonhosted.org/packages/source/d/diffoscope/diffoscope-214.tar.gz"
packages/core2-32-poky-linux/diffoscope: PV changed from "212" to "214"
packages/core2-32-poky-linux/diffoscope: PKGV changed from 212 [default] to 214 [default]
Changes to packages/core2-32-poky-linux/diffoscope (sysroot):
  /usr/lib/python3.10/site-packages/diffoscope-212.dist-info moved to /usr/lib/python3.10/site-packages/diffoscope-214.dist-info

--===============1758453561194449557==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment; filename="buildhistory-diff.txt"

Changes to packages/core2-32-poky-linux/diffoscope (sysroot):
  /usr/lib/python3.10/site-packages/diffoscope-212.dist-info moved to /usr/lib/python3.10/site-packages/diffoscope-214.dist-info

--===============1758453561194449557==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment; filename="bitbake-output-qemux86_musl.txt"

WARNING: Host distribution "almalinux-8.6" has not been validated with this version of the build system; you may possibly experience unexpected failures. It is recommended that you use a tested distribution.
Loading cache...done.
Loaded 0 entries from dependency cache.
Parsing recipes...done.
Parsing of 883 .bb files complete (0 cached, 883 parsed). 1643 targets, 49 skipped, 0 masked, 0 errors.
Removing 100 recipes from the core2-32 sysroot...done.
Removing 120 recipes from the qemux86 sysroot...done.

Summary: There was 1 WARNING message.
Summary: There was 1 ERROR message, returning a non-zero exit code.
/usr/lib64/python3.6/importlib/_bootstrap.py:219: ImportWarning: can't resolve package from __spec__ or __package__, falling back on __name__ and __path__
  return f(*args, **kwds)
ERROR: Nothing PROVIDES 'diffoscope'
diffoscope was skipped: incompatible with host i686-poky-linux-musl (not in COMPATIBLE_HOST)

--===============1758453561194449557==--

