Return-Path: <auh@yoctoproject.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id B1836CCA48B
	for <webhook@archiver.kernel.org>; Wed,  1 Jun 2022 16:18:48 +0000 (UTC)
Received: from a27-33.smtp-out.us-west-2.amazonses.com
 (a27-33.smtp-out.us-west-2.amazonses.com [54.240.27.33])
 by mx.groups.io with SMTP id smtpd.web09.623.1654100324193935065
 for <openembedded-core@lists.openembedded.org>;
 Wed, 01 Jun 2022 09:18:44 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@yoctoproject.org
 header.s=j46ser6a2yusdzubpv7m7ewqgesde2ie header.b=dfBY0TEz;
 spf=pass (domain: us-west-2.amazonses.com, ip: 54.240.27.33,
 mailfrom: 01010181200fec52-f5d41406-dd1b-4ecc-b73a-dc6fddc3367e-000000@us-west-2.amazonses.com)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=j46ser6a2yusdzubpv7m7ewqgesde2ie; d=yoctoproject.org;
	t=1654100323;
	h=Content-Type:MIME-Version:From:To:Cc:Subject:Message-Id:Date;
	bh=610JMrbyxGk/zWHRn93Eezfhtk/UiHRooKQE7rD/0Ic=;
	b=dfBY0TEzzR8pTKvMNmTa2fjw3A3tW65h07Z+IBvoBrF/7k/SniUaWCf6Ef3CCUdO
	6TRQlmKaRTPlWdtTu3JA5aIOfZdpmlEvBlYNi3no4nijkbV6K90OVdcSZ8gjBuEMaZR
	50TA5uwE1gvJnjoQ9ysRnjLQAqgIHQZeZfvp+hsc=
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=gdwg2y3kokkkj5a55z2ilkup5wp5hhxx; d=amazonses.com; t=1654100323;
	h=Content-Type:MIME-Version:From:To:Cc:Subject:Message-Id:Date:Feedback-ID;
	bh=610JMrbyxGk/zWHRn93Eezfhtk/UiHRooKQE7rD/0Ic=;
	b=Zmu8nWXgOVJhmPqrckgUaB79M99DZaKqBl8QZygjU7+Cm6WIegdUHpKQN7eZLV/V
	PMocE3zYUEsPwozE/KlKhorJNjqQaDfOw+QVzesAB44wyWq+Yfd5wZU6MKAX6gWKlHQ
	zxCI92ARNAHTtXF+HnlyxvlzD6LeA7op5WbshjXo=
Content-Type: multipart/mixed; boundary="===============7652183539438980600=="
MIME-Version: 1.0
From: auh@yoctoproject.org
To: Chen Qi <Qi.Chen@windriver.com>
Cc: openembedded-core@lists.openembedded.org
Subject: [AUH] sysklogd: upgrading to 2.4.0 SUCCEEDED
Message-ID: 
 <01010181200fec52-f5d41406-dd1b-4ecc-b73a-dc6fddc3367e-000000@us-west-2.amazonses.com>
Date: Wed, 1 Jun 2022 16:18:43 +0000
Feedback-ID: 
 1.us-west-2.9np3MYPs3fEaOBysGKSlUD4KtcmPijcmS9Az2Hwf7iQ=:AmazonSES
X-SES-Outgoing: 2022.06.01-54.240.27.33
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 01 Jun 2022 16:18:48 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/166410

--===============7652183539438980600==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

Hello,

this email is a notification from the Auto Upgrade Helper
that the automatic attempt to upgrade the recipe *sysklogd* to *2.4.0* has Succeeded.

Next steps:
    - apply the patch: git am 0001-sysklogd-upgrade-2.3.0-2.4.0.patch
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
--===============7652183539438980600==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment; filename="buildhistory-diff-full.txt"

packages/core2-32-poky-linux/sysklogd: PKGV changed from 2.3.0 [default] to 2.4.0 [default]
packages/core2-32-poky-linux/sysklogd: PV changed from "2.3.0" to "2.4.0"
packages/core2-32-poky-linux/sysklogd/sysklogd-dbg: PKGSIZE changed from 140460 to 145164 (+3%)
packages/core2-32-poky-linux/sysklogd/sysklogd-dbg: PKGV changed from 2.3.0 [default] to 2.4.0 [default]
packages/core2-32-poky-linux/sysklogd/sysklogd-dbg: PV changed from "2.3.0" to "2.4.0"
packages/core2-32-poky-linux/sysklogd/sysklogd-dev: PKGV changed from 2.3.0 [default] to 2.4.0 [default]
packages/core2-32-poky-linux/sysklogd/sysklogd-dev: PV changed from "2.3.0" to "2.4.0"
packages/core2-32-poky-linux/sysklogd/sysklogd-doc: PKGSIZE changed from 82417 to 86560 (+5%)
packages/core2-32-poky-linux/sysklogd/sysklogd-doc: PKGV changed from 2.3.0 [default] to 2.4.0 [default]
packages/core2-32-poky-linux/sysklogd/sysklogd-doc: PV changed from "2.3.0" to "2.4.0"
packages/core2-32-poky-linux/sysklogd/sysklogd-locale: PKGV changed from 2.3.0 [default] to 2.4.0 [default]
packages/core2-32-poky-linux/sysklogd/sysklogd-locale: PV changed from "2.3.0" to "2.4.0"
packages/core2-32-poky-linux/sysklogd/sysklogd-src: PKGSIZE changed from 136715 to 143372 (+5%)
packages/core2-32-poky-linux/sysklogd/sysklogd-src: PKGV changed from 2.3.0 [default] to 2.4.0 [default]
packages/core2-32-poky-linux/sysklogd/sysklogd-src: PV changed from "2.3.0" to "2.4.0"
packages/core2-32-poky-linux/sysklogd/sysklogd-staticdev: PKGV changed from 2.3.0 [default] to 2.4.0 [default]
packages/core2-32-poky-linux/sysklogd/sysklogd-staticdev: PV changed from "2.3.0" to "2.4.0"
packages/core2-32-poky-linux/sysklogd/sysklogd: PKGSIZE changed from 87356 to 87805 (+1%)
packages/core2-32-poky-linux/sysklogd/sysklogd: PKGV changed from 2.3.0 [default] to 2.4.0 [default]
packages/core2-32-poky-linux/sysklogd/sysklogd: PV changed from "2.3.0" to "2.4.0"

--===============7652183539438980600==
Content-Type: application/octet-stream
MIME-Version: 1.0
Content-Disposition: attachment;
 filename="0001-sysklogd-upgrade-2.3.0-2.4.0.patch"

From 94553edaa92921f3c854184e6da90cf4cc270e4a Mon Sep 17 00:00:00 2001
From: Upgrade Helper <auh@yoctoproject.org>
Date: Wed, 1 Jun 2022 10:21:58 +0000
Subject: [PATCH] sysklogd: upgrade 2.3.0 -> 2.4.0

---
 .../sysklogd/{sysklogd_2.3.0.bb => sysklogd_2.4.0.bb}           | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta/recipes-extended/sysklogd/{sysklogd_2.3.0.bb => sysklogd_2.4.0.bb} (97%)

diff --git a/meta/recipes-extended/sysklogd/sysklogd_2.3.0.bb b/meta/recipes-extended/sysklogd/sysklogd_2.4.0.bb
similarity index 97%
rename from meta/recipes-extended/sysklogd/sysklogd_2.3.0.bb
rename to meta/recipes-extended/sysklogd/sysklogd_2.4.0.bb
index 7043f3d391..4e6da70e4a 100644
--- a/meta/recipes-extended/sysklogd/sysklogd_2.3.0.bb
+++ b/meta/recipes-extended/sysklogd/sysklogd_2.4.0.bb
@@ -14,7 +14,7 @@ SRC_URI = "git://github.com/troglobit/sysklogd.git;branch=master;protocol=https
            file://sysklogd \
            "
 
-SRCREV = "03c2c9c68d5d02675326527774e7e9cba3490ba0"
+SRCREV = "7dc4783af8e8e0d200d38a87b6a4bc9bbec5ce92"
 
 S = "${WORKDIR}/git"
 
-- 
2.31.1


--===============7652183539438980600==--

