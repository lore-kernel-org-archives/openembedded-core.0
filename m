Return-Path: <adrian.ratiu@ni.com>
Received: from ni.com (skprod3.natinst.com [130.164.80.24])
	by mail.openembedded.org (Postfix) with ESMTP id AB4F16612C
	for <openembedded-core@lists.openembedded.org>;
	Tue, 22 Mar 2016 14:49:40 +0000 (UTC)
Received: from us-aus-mgwout1.amer.corp.natinst.com (nb-snip2-1338.natinst.com
	[130.164.19.135])
	by us-aus-skprod3.natinst.com (8.15.0.59/8.15.0.59) with ESMTP id
	u2MEnf2s029150 for <openembedded-core@lists.openembedded.org>;
	Tue, 22 Mar 2016 09:49:41 -0500
Received: from adi-pc-linux.emea.corp.natinst.com ([130.164.14.198])
	by us-aus-mgwout1.amer.corp.natinst.com (Lotus Domino Release 8.5.3FP6
	HF1218) with ESMTP id 2016032209494171-88664 ;
	Tue, 22 Mar 2016 09:49:41 -0500 
From: Ioan-Adrian Ratiu <adrian.ratiu@ni.com>
To: openembedded-core@lists.openembedded.org
Date: Tue, 22 Mar 2016 16:49:03 +0200
Message-Id: <6a3dabb3d4fb36a11f3094dd3446c817e017286e.1458657317.git.adrian.ratiu@ni.com>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <123f1a18e95c8aea9939e14a537b701de8137737.1458657317.git.adrian.ratiu@ni.com>
References: <123f1a18e95c8aea9939e14a537b701de8137737.1458657317.git.adrian.ratiu@ni.com>
X-MIMETrack: Itemize by SMTP Server on US-AUS-MGWOut1/AUS/H/NIC(Release
	8.5.3FP6 HF1218|December 12, 2014) at 03/22/2016 09:49:41 AM,
	Serialize by Router on US-AUS-MGWOut1/AUS/H/NIC(Release 8.5.3FP6
	HF1218|December 12, 2014) at 03/22/2016 09:49:42 AM,
	Serialize complete at 03/22/2016 09:49:42 AM
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10432:, ,
	definitions=2016-03-22_08:, , signatures=0
Subject: [PATCH 3/3] sysvinit: downgrade ALTERNATIVE_PRIORITY[mountpoint]
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
X-List-Received-Date: Tue, 22 Mar 2016 14:49:42 -0000

From: Richard Tollerton <rich.tollerton@ni.com>

sysvinit is objectively less maintained than util-linux or busybox, each
of which may supply its own mountpoint implementation. Adjust the
ALTERNATIVE_PRIORITY to select the sysvinit implementation as the last
resort.

Signed-off-by: Richard Tollerton <rich.tollerton@ni.com>
Signed-off-by: Ioan-Adrian Ratiu <adrian.ratiu@ni.com>
---
 meta/recipes-core/sysvinit/sysvinit_2.88dsf.bb | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/meta/recipes-core/sysvinit/sysvinit_2.88dsf.bb b/meta/recipes-core/sysvinit/sysvinit_2.88dsf.bb
index e4aa4c3..0f0df85 100644
--- a/meta/recipes-core/sysvinit/sysvinit_2.88dsf.bb
+++ b/meta/recipes-core/sysvinit/sysvinit_2.88dsf.bb
@@ -39,6 +39,8 @@ ALTERNATIVE_LINK_NAME[init] = "${base_sbindir}/init"
 ALTERNATIVE_PRIORITY[init] = "50"
 
 ALTERNATIVE_LINK_NAME[mountpoint] = "${base_bindir}/mountpoint"
+ALTERNATIVE_PRIORITY[mountpoint] = "20"
+
 ALTERNATIVE_LINK_NAME[halt] = "${base_sbindir}/halt"
 ALTERNATIVE_LINK_NAME[reboot] = "${base_sbindir}/reboot"
 ALTERNATIVE_LINK_NAME[runlevel] = "${base_sbindir}/runlevel"
-- 
2.7.4


