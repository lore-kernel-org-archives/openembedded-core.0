Return-Path: <brad.mouring@ni.com>
Received: from ni.com (skprod3.natinst.com [130.164.80.24])
	by mail.openembedded.org (Postfix) with ESMTP id 2FFAA606A8
	for <openembedded-core@lists.openembedded.org>;
	Sat, 26 Mar 2016 02:06:46 +0000 (UTC)
Received: from us-aus-mgwout2.amer.corp.natinst.com (nb-snip2-1338.natinst.com
	[130.164.19.135])
	by us-aus-skprod3.natinst.com (8.15.0.59/8.15.0.59) with ESMTP id
	u2Q26k1l022757; Fri, 25 Mar 2016 21:06:47 -0500
Received: from ni.com ([130.164.14.198])
	by us-aus-mgwout2.amer.corp.natinst.com (Lotus Domino Release 8.5.3FP6
	HF1218) with SMTP id 2016032521064662-231219 ;
	Fri, 25 Mar 2016 21:06:46 -0500 
Received: by ni.com (sSMTP sendmail emulation); Fri, 25 Mar 2016 21:06:45 -0500
From: Brad Mouring <brad.mouring@ni.com>
To: openembedded-core@lists.openembedded.org
Date: Fri, 25 Mar 2016 21:05:36 -0500
Message-Id: <1458957936-29447-2-git-send-email-brad.mouring@ni.com>
X-Mailer: git-send-email 2.7.3
In-Reply-To: <1458957936-29447-1-git-send-email-brad.mouring@ni.com>
References: <1458862325-24367-1-git-send-email-brad.mouring@ni.com>
	<1458957936-29447-1-git-send-email-brad.mouring@ni.com>
X-MIMETrack: Itemize by SMTP Server on US-AUS-MGWOut2/AUS/H/NIC(Release
	8.5.3FP6 HF1218|December 12, 2014) at 03/25/2016 09:06:47 PM,
	Serialize by Router on US-AUS-MGWOut2/AUS/H/NIC(Release 8.5.3FP6
	HF1218|December 12, 2014) at 03/25/2016 09:06:47 PM,
	Serialize complete at 03/25/2016 09:06:47 PM
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10432:, ,
	definitions=2016-03-25_06:, , signatures=0
Cc: Brad Mouring <brad.mouring@ni.com>
Subject: [jethro][PATCH v2 2/2] busybox_git: Fix SRCREV
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
X-List-Received-Date: Sat, 26 Mar 2016 02:06:46 -0000

The SRCREV in the busybox git recipe did not point to a commit ID
on the master branch. Point the variable to something reachable from
the master branch (which fixes this recipe's fetch()).

Suggested-by: Khem Raj <raj.khem@gmail.com>
Signed-off-by: Brad Mouring <brad.mouring@ni.com>
---
 meta/recipes-core/busybox/busybox_git.bb | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta/recipes-core/busybox/busybox_git.bb b/meta/recipes-core/busybox/busybox_git.bb
index ade72f4..7c1b650 100644
--- a/meta/recipes-core/busybox/busybox_git.bb
+++ b/meta/recipes-core/busybox/busybox_git.bb
@@ -1,6 +1,6 @@
 require busybox.inc
 
-SRCREV = "be947c4d97c0dacb703a6f24dd813ff6dd3a33b6"
+SRCREV = "4d15068d83054a9f82b3f8842706cd6deb401e25"
 # Lookout for PV bump too when SRCREV is changed
 PV = "1.23.2+git${SRCPV}"
 
-- 
2.7.3


