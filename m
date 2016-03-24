Return-Path: <brad.mouring@ni.com>
Received: from ni.com (skprod2.natinst.com [130.164.80.23])
	by mail.openembedded.org (Postfix) with ESMTP id 12E80731F1
	for <openembedded-core@lists.openembedded.org>;
	Thu, 24 Mar 2016 23:32:51 +0000 (UTC)
Received: from us-aus-mgwout2.amer.corp.natinst.com (nb-snip2-1338.natinst.com
	[130.164.19.135])
	by us-aus-skprod2.natinst.com (8.15.0.59/8.15.0.59) with ESMTP id
	u2ONWqhC023003; Thu, 24 Mar 2016 18:32:52 -0500
Received: from ni.com ([130.164.14.198])
	by us-aus-mgwout2.amer.corp.natinst.com (Lotus Domino Release 8.5.3FP6
	HF1218) with SMTP id 2016032418325239-193601 ;
	Thu, 24 Mar 2016 18:32:52 -0500 
Received: by ni.com (sSMTP sendmail emulation); Thu, 24 Mar 2016 18:32:51 -0500
From: Brad Mouring <brad.mouring@ni.com>
To: openembedded-core@lists.openembedded.org
Date: Thu, 24 Mar 2016 18:32:05 -0500
Message-Id: <1458862325-24367-4-git-send-email-brad.mouring@ni.com>
X-Mailer: git-send-email 2.7.3
In-Reply-To: <1458862325-24367-1-git-send-email-brad.mouring@ni.com>
References: <1458862325-24367-1-git-send-email-brad.mouring@ni.com>
X-MIMETrack: Itemize by SMTP Server on US-AUS-MGWOut2/AUS/H/NIC(Release
	8.5.3FP6 HF1218|December 12, 2014) at 03/24/2016 06:32:53 PM,
	Serialize by Router on US-AUS-MGWOut2/AUS/H/NIC(Release 8.5.3FP6
	HF1218|December 12, 2014) at 03/24/2016 06:32:53 PM,
	Serialize complete at 03/24/2016 06:32:53 PM
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10432:, ,
	definitions=2016-03-24_08:, , signatures=0
Cc: Brad Mouring <brad.mouring@ni.com>
Subject: [PATCH 3/3] busybox-git: Backport patch to fix zcip false-conflict
X-BeenThere: openembedded-core@lists.openembedded.org
X-Mailman-Version: 2.1.12
Precedence: list
List-Id: Patches and discussions about the oe-core layer
	<openembedded-core.lists.openembedded.org>
List-Unsubscribe: <http://lists.openembedded.org/mailman/options/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.openembedded.org/pipermail/openembedded-core/>
List-Post: <mailto:openembedded-core@lists.openembedded.org>
List-Help: <mailto:openembedded-core-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.openembedded.org/mailman/listinfo/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Thu, 24 Mar 2016 23:32:52 -0000

Busybox upstream fixed the issue where an incorrect comparison of
addresses led to bogus renegotiation of a new ll ip in 1.24. Backport
this change to the -git recipe.

Signed-off-by: Brad Mouring <brad.mouring@ni.com>
---
 meta/recipes-core/busybox/busybox_git.bb | 1 +
 1 file changed, 1 insertion(+)

diff --git a/meta/recipes-core/busybox/busybox_git.bb b/meta/recipes-core/busybox/busybox_git.bb
index 22ceb64..e915e4d 100644
--- a/meta/recipes-core/busybox/busybox_git.bb
+++ b/meta/recipes-core/busybox/busybox_git.bb
@@ -38,6 +38,7 @@ SRC_URI = "git://busybox.net/busybox.git;branch=1_23_stable \
            file://busybox-cross-menuconfig.patch \
            file://0001-ifconfig-fix-double-free-fatal-error-in-INET_sprint.patch \
            file://0001-chown-fix-help-text.patch \
+           file://0001-zcip-fix-wrong-comparison-of-source-IP-with-our-IP.patch \
            file://mount-via-label.cfg \
            file://sha1sum.cfg \
            file://sha256sum.cfg \
-- 
2.7.3


