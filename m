Return-Path: <auh@yoctoproject.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 24DF0C38A2C
	for <webhook@archiver.kernel.org>; Mon, 18 Apr 2022 14:25:54 +0000 (UTC)
Received: from a27-191.smtp-out.us-west-2.amazonses.com
 (a27-191.smtp-out.us-west-2.amazonses.com [54.240.27.191])
 by mx.groups.io with SMTP id smtpd.web09.11568.1650052688293003051
 for <openembedded-core@lists.openembedded.org>;
 Fri, 15 Apr 2022 12:58:08 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@yoctoproject.org
 header.s=rnkzp2s7ci3kogmesvov2nwn7wcc2dgx header.b=ZoZPQNks;
 spf=pass (domain: us-west-2.amazonses.com, ip: 54.240.27.191,
 mailfrom: 010101802ecde5dd-3967d9a4-d43f-42fa-8206-90c595baf91c-000000@us-west-2.amazonses.com)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=rnkzp2s7ci3kogmesvov2nwn7wcc2dgx; d=yoctoproject.org;
	t=1650052687;
	h=Content-Type:MIME-Version:From:To:Cc:Subject:Message-Id:Date;
	bh=7TiYqFdMrYYoFslYQo+u7jcJBHlX72138+O4nv6af0Y=;
	b=ZoZPQNksSsJYIugTl5ur9VpAAB1cDm9OdEDI7OdRzalQGqlpueDe9YNFFWUlNPHt
	7y1sj55baYlSRiOvX4bTnPjFwofzF9bYELakoSB8EvKzQxFzrK1Hze1aWilkP+xzqIw
	0K2xHD7iySKNqzf/fruS7xjUEiun9I6gk+kx5shI=
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=gdwg2y3kokkkj5a55z2ilkup5wp5hhxx; d=amazonses.com; t=1650052687;
	h=Content-Type:MIME-Version:From:To:Cc:Subject:Message-Id:Date:Feedback-ID;
	bh=7TiYqFdMrYYoFslYQo+u7jcJBHlX72138+O4nv6af0Y=;
	b=gX52tCcLIiQF2Z7AnEr8mJ3oj/+mXxZvvaVyvpyU0FV8JVcZHXBc4NuWCAp4g/+i
	GkKykHprojiOYlfnbU4cr6m6AiVMjpAFvFeKHVZnZbOcVfSMhE//+pnPiQVVgIrogHI
	Pusj6cyMdOzfcvYhMql5V942G/u+RnmjhdOydyiY=
Content-Type: multipart/mixed; boundary="===============2788903618160890273=="
MIME-Version: 1.0
From: auh@yoctoproject.org
To: Tim Orling <tim.orling@konsulko.com>
Cc: openembedded-core@lists.openembedded.org
Subject: [AUH] python3-zipp: upgrading to 3.8.0 SUCCEEDED
Message-ID: 
 <010101802ecde5dd-3967d9a4-d43f-42fa-8206-90c595baf91c-000000@us-west-2.amazonses.com>
Date: Fri, 15 Apr 2022 19:58:07 +0000
Feedback-ID: 
 1.us-west-2.9np3MYPs3fEaOBysGKSlUD4KtcmPijcmS9Az2Hwf7iQ=:AmazonSES
X-SES-Outgoing: 2022.04.15-54.240.27.191
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 18 Apr 2022 14:25:54 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/164474

--===============2788903618160890273==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

Hello,

this email is a notification from the Auto Upgrade Helper
that the automatic attempt to upgrade the recipe *python3-zipp* to *3.8.0* has Succeeded.

Next steps:
    - apply the patch: git am 0001-python3-zipp-upgrade-3.7.0-3.8.0.patch
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
--===============2788903618160890273==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment; filename="buildhistory-diff.txt"

Changes to packages/core2-32-poky-linux/python3-zipp (sysroot):
  /usr/lib/python3.10/site-packages/zipp-3.7.0.dist-info moved to /usr/lib/python3.10/site-packages/zipp-3.8.0.dist-info

--===============2788903618160890273==
Content-Type: application/octet-stream
MIME-Version: 1.0
Content-Disposition: attachment;
 filename="0001-python3-zipp-upgrade-3.7.0-3.8.0.patch"

From 48c6272b625dda1c453a588200f77e87a84e05f3 Mon Sep 17 00:00:00 2001
From: Upgrade Helper <auh@yoctoproject.org>
Date: Fri, 15 Apr 2022 09:43:10 +0000
Subject: [PATCH] python3-zipp: upgrade 3.7.0 -> 3.8.0

---
 .../python/{python3-zipp_3.7.0.bb => python3-zipp_3.8.0.bb}     | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta/recipes-devtools/python/{python3-zipp_3.7.0.bb => python3-zipp_3.8.0.bb} (85%)

diff --git a/meta/recipes-devtools/python/python3-zipp_3.7.0.bb b/meta/recipes-devtools/python/python3-zipp_3.8.0.bb
similarity index 85%
rename from meta/recipes-devtools/python/python3-zipp_3.7.0.bb
rename to meta/recipes-devtools/python/python3-zipp_3.8.0.bb
index 495e7f51f0..f1fd383842 100644
--- a/meta/recipes-devtools/python/python3-zipp_3.7.0.bb
+++ b/meta/recipes-devtools/python/python3-zipp_3.8.0.bb
@@ -3,7 +3,7 @@ HOMEPAGE = "https://github.com/jaraco/zipp"
 LICENSE = "MIT"
 LIC_FILES_CHKSUM = "file://LICENSE;md5=7a7126e068206290f3fe9f8d6c713ea6"
 
-SRC_URI[sha256sum] = "9f50f446828eb9d45b267433fd3e9da8d801f614129124863f9c51ebceafb87d"
+SRC_URI[sha256sum] = "56bf8aadb83c24db6c4b577e13de374ccfb67da2078beba1d037c17980bf43ad"
 
 DEPENDS += "${PYTHON_PN}-setuptools-scm-native"
 
-- 
2.27.0


--===============2788903618160890273==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment; filename="buildhistory-diff-full.txt"

packages/core2-32-poky-linux/python3-zipp: SRC_URI changed from "https://files.pythonhosted.org/packages/source/z/zipp/zipp-3.7.0.tar.gz" to "https://files.pythonhosted.org/packages/source/z/zipp/zipp-3.8.0.tar.gz"
packages/core2-32-poky-linux/python3-zipp: PV changed from "3.7.0" to "3.8.0"
packages/core2-32-poky-linux/python3-zipp: PKGV changed from 3.7.0 [default] to 3.8.0 [default]
packages/core2-32-poky-linux/python3-zipp/python3-zipp-dbg: PV changed from "3.7.0" to "3.8.0"
packages/core2-32-poky-linux/python3-zipp/python3-zipp-dbg: PKGV changed from 3.7.0 [default] to 3.8.0 [default]
packages/core2-32-poky-linux/python3-zipp/python3-zipp-dev: PV changed from "3.7.0" to "3.8.0"
packages/core2-32-poky-linux/python3-zipp/python3-zipp-dev: PKGV changed from 3.7.0 [default] to 3.8.0 [default]
packages/core2-32-poky-linux/python3-zipp/python3-zipp-doc: PV changed from "3.7.0" to "3.8.0"
packages/core2-32-poky-linux/python3-zipp/python3-zipp-doc: PKGV changed from 3.7.0 [default] to 3.8.0 [default]
packages/core2-32-poky-linux/python3-zipp/python3-zipp-locale: PV changed from "3.7.0" to "3.8.0"
packages/core2-32-poky-linux/python3-zipp/python3-zipp-locale: PKGV changed from 3.7.0 [default] to 3.8.0 [default]
packages/core2-32-poky-linux/python3-zipp/python3-zipp-src: PV changed from "3.7.0" to "3.8.0"
packages/core2-32-poky-linux/python3-zipp/python3-zipp-src: PKGV changed from 3.7.0 [default] to 3.8.0 [default]
packages/core2-32-poky-linux/python3-zipp/python3-zipp-staticdev: PV changed from "3.7.0" to "3.8.0"
packages/core2-32-poky-linux/python3-zipp/python3-zipp-staticdev: PKGV changed from 3.7.0 [default] to 3.8.0 [default]
packages/core2-32-poky-linux/python3-zipp/python3-zipp: PKGSIZE changed from 22553 to 22205 (-2%)
packages/core2-32-poky-linux/python3-zipp/python3-zipp: PV changed from "3.7.0" to "3.8.0"
packages/core2-32-poky-linux/python3-zipp/python3-zipp: PKGV changed from 3.7.0 [default] to 3.8.0 [default]
Changes to packages/core2-32-poky-linux/python3-zipp (sysroot):
  /usr/lib/python3.10/site-packages/zipp-3.7.0.dist-info moved to /usr/lib/python3.10/site-packages/zipp-3.8.0.dist-info

--===============2788903618160890273==--

