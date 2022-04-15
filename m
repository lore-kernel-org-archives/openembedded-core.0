Return-Path: <auh@yoctoproject.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id B4EFEC47084
	for <webhook@archiver.kernel.org>; Mon, 18 Apr 2022 14:25:53 +0000 (UTC)
Received: from a27-193.smtp-out.us-west-2.amazonses.com
 (a27-193.smtp-out.us-west-2.amazonses.com [54.240.27.193])
 by mx.groups.io with SMTP id smtpd.web09.11559.1650052686015644738
 for <openembedded-core@lists.openembedded.org>;
 Fri, 15 Apr 2022 12:58:07 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@yoctoproject.org
 header.s=rnkzp2s7ci3kogmesvov2nwn7wcc2dgx header.b=D2eE005V;
 spf=pass (domain: us-west-2.amazonses.com, ip: 54.240.27.193,
 mailfrom: 010101802ecde479-71db803b-6c74-4810-96cd-31ea5c404f7a-000000@us-west-2.amazonses.com)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=rnkzp2s7ci3kogmesvov2nwn7wcc2dgx; d=yoctoproject.org;
	t=1650052687;
	h=Content-Type:MIME-Version:From:To:Cc:Subject:Message-Id:Date;
	bh=RdFvTatuxZaMINGwvcY5+weqV0nCRXdqW6TsD9YnTQ8=;
	b=D2eE005VN0ptV6W2TWkhHXbX3MW4C8x4Dv5gP6xytJgc8Qx+he5DVn5CBx4tAyBI
	LX+sQ4FUrXKOruT227tstHhwXYwQnb5JOWvOvFfolwz5nXmca+nsVMW4t0Z03yYq5nf
	hfmYd8FIoJP1u3RYN/HFA+8+6ixiZ3a3Pbci0Glo=
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=gdwg2y3kokkkj5a55z2ilkup5wp5hhxx; d=amazonses.com; t=1650052687;
	h=Content-Type:MIME-Version:From:To:Cc:Subject:Message-Id:Date:Feedback-ID;
	bh=RdFvTatuxZaMINGwvcY5+weqV0nCRXdqW6TsD9YnTQ8=;
	b=VMSpkK4OCbo0/pTpLbrLU5KaDeoMgQjyBkIBg5Lzbjscc8Rq39fll4ygZVG2+4Y/
	eKOkFCAOfHr1lW/VYvWbdg9kV7yS6r+GvDx00PG0sfaUUlUewz/KTVFpmlbLauxrw5F
	ebhn/MUfft9cF6ZzDa8WZKbGfN+Qffr476zYcwJY=
Content-Type: multipart/mixed; boundary="===============5676738007473879112=="
MIME-Version: 1.0
From: auh@yoctoproject.org
To: Tim Orling <tim.orling@konsulko.com>
Cc: openembedded-core@lists.openembedded.org
Subject: [AUH] python3-hypothesis: upgrading to 6.43.1 SUCCEEDED
Message-ID: 
 <010101802ecde479-71db803b-6c74-4810-96cd-31ea5c404f7a-000000@us-west-2.amazonses.com>
Date: Fri, 15 Apr 2022 19:58:06 +0000
Feedback-ID: 
 1.us-west-2.9np3MYPs3fEaOBysGKSlUD4KtcmPijcmS9Az2Hwf7iQ=:AmazonSES
X-SES-Outgoing: 2022.04.15-54.240.27.193
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 18 Apr 2022 14:25:53 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/164448

--===============5676738007473879112==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

Hello,

this email is a notification from the Auto Upgrade Helper
that the automatic attempt to upgrade the recipe *python3-hypothesis* to *6.43.1* has Succeeded.

Next steps:
    - apply the patch: git am 0001-python3-hypothesis-upgrade-6.39.5-6.43.1.patch
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
--===============5676738007473879112==
Content-Type: application/octet-stream
MIME-Version: 1.0
Content-Disposition: attachment;
 filename="0001-python3-hypothesis-upgrade-6.39.5-6.43.1.patch"

From cd4a85930d7b3783297396b8dfaea6ccd85d07b7 Mon Sep 17 00:00:00 2001
From: Upgrade Helper <auh@yoctoproject.org>
Date: Fri, 15 Apr 2022 09:13:05 +0000
Subject: [PATCH] python3-hypothesis: upgrade 6.39.5 -> 6.43.1

---
 ...ython3-hypothesis_6.39.5.bb => python3-hypothesis_6.43.1.bb} | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta/recipes-devtools/python/{python3-hypothesis_6.39.5.bb => python3-hypothesis_6.43.1.bb} (91%)

diff --git a/meta/recipes-devtools/python/python3-hypothesis_6.39.5.bb b/meta/recipes-devtools/python/python3-hypothesis_6.43.1.bb
similarity index 91%
rename from meta/recipes-devtools/python/python3-hypothesis_6.39.5.bb
rename to meta/recipes-devtools/python/python3-hypothesis_6.43.1.bb
index 03ec94c1c1..3896d7173a 100644
--- a/meta/recipes-devtools/python/python3-hypothesis_6.39.5.bb
+++ b/meta/recipes-devtools/python/python3-hypothesis_6.43.1.bb
@@ -13,7 +13,7 @@ SRC_URI += " \
     file://test_rle.py \
     "
 
-SRC_URI[sha256sum] = "2972edc54c90c70049facfc31db19f1997f9c5e89d2a05f6eeea1107600350f0"
+SRC_URI[sha256sum] = "b0ef5f82bb925e540f5d26e7e06280fa88113a763cc3e6832c93301766fa6900"
 
 RDEPENDS:${PN} += " \
     python3-attrs \
-- 
2.27.0


--===============5676738007473879112==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment; filename="buildhistory-diff.txt"

Changes to packages/core2-32-poky-linux/python3-hypothesis (sysroot):
  /usr/lib/python3.10/site-packages/hypothesis-6.39.5.dist-info moved to /usr/lib/python3.10/site-packages/hypothesis-6.43.1.dist-info

--===============5676738007473879112==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment; filename="buildhistory-diff-full.txt"

packages/core2-32-poky-linux/python3-hypothesis: PV changed from "6.39.5" to "6.43.1"
packages/core2-32-poky-linux/python3-hypothesis: SRC_URI changed from "https://files.pythonhosted.org/packages/source/h/hypothesis/hypothesis-6.39.5.tar.gz file://run-ptest file://test_binary_search.py file://test_rle.py" to "https://files.pythonhosted.org/packages/source/h/hypothesis/hypothesis-6.43.1.tar.gz file://run-ptest file://test_binary_search.py file://test_rle.py"
packages/core2-32-poky-linux/python3-hypothesis: PKGV changed from 6.39.5 [default] to 6.43.1 [default]
packages/core2-32-poky-linux/python3-hypothesis/python3-hypothesis-dbg: PV changed from "6.39.5" to "6.43.1"
packages/core2-32-poky-linux/python3-hypothesis/python3-hypothesis-dbg: PKGV changed from 6.39.5 [default] to 6.43.1 [default]
packages/core2-32-poky-linux/python3-hypothesis/python3-hypothesis-dev: PV changed from "6.39.5" to "6.43.1"
packages/core2-32-poky-linux/python3-hypothesis/python3-hypothesis-dev: PKGV changed from 6.39.5 [default] to 6.43.1 [default]
packages/core2-32-poky-linux/python3-hypothesis/python3-hypothesis-doc: PV changed from "6.39.5" to "6.43.1"
packages/core2-32-poky-linux/python3-hypothesis/python3-hypothesis-doc: PKGV changed from 6.39.5 [default] to 6.43.1 [default]
packages/core2-32-poky-linux/python3-hypothesis/python3-hypothesis-locale: PV changed from "6.39.5" to "6.43.1"
packages/core2-32-poky-linux/python3-hypothesis/python3-hypothesis-locale: PKGV changed from 6.39.5 [default] to 6.43.1 [default]
packages/core2-32-poky-linux/python3-hypothesis/python3-hypothesis-ptest: PV changed from "6.39.5" to "6.43.1"
packages/core2-32-poky-linux/python3-hypothesis/python3-hypothesis-ptest: PKGV changed from 6.39.5 [default] to 6.43.1 [default]
packages/core2-32-poky-linux/python3-hypothesis/python3-hypothesis-src: PV changed from "6.39.5" to "6.43.1"
packages/core2-32-poky-linux/python3-hypothesis/python3-hypothesis-src: PKGV changed from 6.39.5 [default] to 6.43.1 [default]
packages/core2-32-poky-linux/python3-hypothesis/python3-hypothesis-staticdev: PV changed from "6.39.5" to "6.43.1"
packages/core2-32-poky-linux/python3-hypothesis/python3-hypothesis-staticdev: PKGV changed from 6.39.5 [default] to 6.43.1 [default]
packages/core2-32-poky-linux/python3-hypothesis/python3-hypothesis: PV changed from "6.39.5" to "6.43.1"
packages/core2-32-poky-linux/python3-hypothesis/python3-hypothesis: PKGV changed from 6.39.5 [default] to 6.43.1 [default]
packages/core2-32-poky-linux/python3-hypothesis/python3-hypothesis: PKGSIZE changed from 2021519 to 2035653 (+1%)
Changes to packages/core2-32-poky-linux/python3-hypothesis (sysroot):
  /usr/lib/python3.10/site-packages/hypothesis-6.39.5.dist-info moved to /usr/lib/python3.10/site-packages/hypothesis-6.43.1.dist-info

--===============5676738007473879112==--

