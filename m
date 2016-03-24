Return-Path: <brad.mouring@ni.com>
Received: from ni.com (skprod3.natinst.com [130.164.80.24])
	by mail.openembedded.org (Postfix) with ESMTP id 3C60C731D8
	for <openembedded-core@lists.openembedded.org>;
	Thu, 24 Mar 2016 23:32:50 +0000 (UTC)
Received: from us-aus-mgwout1.amer.corp.natinst.com (nb-snip2-1338.natinst.com
	[130.164.19.135])
	by us-aus-skprod3.natinst.com (8.15.0.59/8.15.0.59) with ESMTP id
	u2ONWpdi016573; Thu, 24 Mar 2016 18:32:51 -0500
Received: from ni.com ([130.164.14.198])
	by us-aus-mgwout1.amer.corp.natinst.com (Lotus Domino Release 8.5.3FP6
	HF1218) with SMTP id 2016032418325140-191800 ;
	Thu, 24 Mar 2016 18:32:51 -0500 
Received: by ni.com (sSMTP sendmail emulation); Thu, 24 Mar 2016 18:32:50 -0500
From: Brad Mouring <brad.mouring@ni.com>
To: openembedded-core@lists.openembedded.org
Date: Thu, 24 Mar 2016 18:32:04 -0500
Message-Id: <1458862325-24367-3-git-send-email-brad.mouring@ni.com>
X-Mailer: git-send-email 2.7.3
In-Reply-To: <1458862325-24367-1-git-send-email-brad.mouring@ni.com>
References: <1458862325-24367-1-git-send-email-brad.mouring@ni.com>
X-MIMETrack: Itemize by SMTP Server on US-AUS-MGWOut1/AUS/H/NIC(Release
	8.5.3FP6 HF1218|December 12, 2014) at 03/24/2016 06:32:52 PM,
	Serialize by Router on US-AUS-MGWOut1/AUS/H/NIC(Release 8.5.3FP6
	HF1218|December 12, 2014) at 03/24/2016 06:32:52 PM,
	Serialize complete at 03/24/2016 06:32:52 PM
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10432:, ,
	definitions=2016-03-24_08:, , signatures=0
Cc: Brad Mouring <brad.mouring@ni.com>
Subject: [PATCH 2/3] busybox_git: Fix SRC_URI
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
X-List-Received-Date: Thu, 24 Mar 2016 23:32:51 -0000

Since the commit called out in the recipe is off the master branch,
update the gitful SRC_URI to specify the branch to use for the
recipe.

Signed-off-by: Brad Mouring <brad.mouring@ni.com>
---
 meta/recipes-core/busybox/busybox_git.bb | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta/recipes-core/busybox/busybox_git.bb b/meta/recipes-core/busybox/busybox_git.bb
index ade72f4..22ceb64 100644
--- a/meta/recipes-core/busybox/busybox_git.bb
+++ b/meta/recipes-core/busybox/busybox_git.bb
@@ -6,7 +6,7 @@ PV = "1.23.2+git${SRCPV}"
 
 S = "${WORKDIR}/git"
 
-SRC_URI = "git://busybox.net/busybox.git \
+SRC_URI = "git://busybox.net/busybox.git;branch=1_23_stable \
            file://get_header_tar.patch \
            file://busybox-appletlib-dependency.patch \
            file://busybox-udhcpc-no_deconfig.patch \
-- 
2.7.3


