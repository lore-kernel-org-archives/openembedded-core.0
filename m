Return-Path: <brad.mouring@ni.com>
Received: from ni.com (skprod2.natinst.com [130.164.80.23])
	by mail.openembedded.org (Postfix) with ESMTP id 61B2365CBC
	for <openembedded-core@lists.openembedded.org>;
	Tue, 22 Mar 2016 23:18:09 +0000 (UTC)
Received: from us-aus-mgwout1.amer.corp.natinst.com (nb-snip2-1338.natinst.com
	[130.164.19.135])
	by us-aus-skprod2.natinst.com (8.15.0.59/8.15.0.59) with ESMTP id
	u2MNI9Qd032108; Tue, 22 Mar 2016 18:18:09 -0500
Received: from ni.com ([130.164.14.198])
	by us-aus-mgwout1.amer.corp.natinst.com (Lotus Domino Release 8.5.3FP6
	HF1218) with SMTP id 2016032218180940-109000 ;
	Tue, 22 Mar 2016 18:18:09 -0500 
Received: by ni.com (sSMTP sendmail emulation); Tue, 22 Mar 2016 18:18:08 -0500
From: Brad Mouring <brad.mouring@ni.com>
To: Richard Purdie <richard.purdie@linuxfoundation.org>,
	openembedded-core@lists.openembedded.org
Date: Tue, 22 Mar 2016 18:18:01 -0500
Message-Id: <1458688681-31394-4-git-send-email-brad.mouring@ni.com>
X-Mailer: git-send-email 2.7.3
In-Reply-To: <1458688681-31394-1-git-send-email-brad.mouring@ni.com>
References: <1458688681-31394-1-git-send-email-brad.mouring@ni.com>
X-MIMETrack: Itemize by SMTP Server on US-AUS-MGWOut1/AUS/H/NIC(Release
	8.5.3FP6 HF1218|December 12, 2014) at 03/22/2016 06:18:10 PM,
	Serialize by Router on US-AUS-MGWOut1/AUS/H/NIC(Release 8.5.3FP6
	HF1218|December 12, 2014) at 03/22/2016 06:18:10 PM,
	Serialize complete at 03/22/2016 06:18:10 PM
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10432:, ,
	definitions=2016-03-22_09:, , signatures=0
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
X-List-Received-Date: Tue, 22 Mar 2016 23:18:09 -0000

Busybox upstream fixed the issue where an incorrect comparison of
addresses led to bogus renegotiation of a new ll ip in 1.24. Backport
this change to the -git recipe.

Signed-off-by: Brad Mouring <brad.mouring@ni.com>
---
 meta/recipes-core/busybox/busybox_git.bb | 1 +
 1 file changed, 1 insertion(+)

diff --git a/meta/recipes-core/busybox/busybox_git.bb b/meta/recipes-core/busybox/busybox_git.bb
index 47c1364..11c390e 100644
--- a/meta/recipes-core/busybox/busybox_git.bb
+++ b/meta/recipes-core/busybox/busybox_git.bb
@@ -34,6 +34,7 @@ SRC_URI = "git://busybox.net/busybox.git;branch=1_23_stable \
            file://inetd.conf \
            file://inetd \
            file://login-utilities.cfg \
+           file://0001-zcip-fix-wrong-comparison-of-source-IP-with-our-IP.patch \
 "
 
 EXTRA_OEMAKE += "V=1 ARCH=${TARGET_ARCH} CROSS_COMPILE=${TARGET_PREFIX} SKIP_STRIP=y"
-- 
2.7.3


