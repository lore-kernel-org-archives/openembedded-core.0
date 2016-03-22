Return-Path: <adrian.ratiu@ni.com>
Received: from ni.com (skprod2.natinst.com [130.164.80.23])
	by mail.openembedded.org (Postfix) with ESMTP id 823A16AC00
	for <openembedded-core@lists.openembedded.org>;
	Tue, 22 Mar 2016 14:49:40 +0000 (UTC)
Received: from us-aus-mgwout1.amer.corp.natinst.com (nb-snip2-1338.natinst.com
	[130.164.19.135])
	by us-aus-skprod2.natinst.com (8.15.0.59/8.15.0.59) with ESMTP id
	u2MEneVp018616 for <openembedded-core@lists.openembedded.org>;
	Tue, 22 Mar 2016 09:49:40 -0500
Received: from adi-pc-linux.emea.corp.natinst.com ([130.164.14.198])
	by us-aus-mgwout1.amer.corp.natinst.com (Lotus Domino Release 8.5.3FP6
	HF1218) with ESMTP id 2016032209494087-88663 ;
	Tue, 22 Mar 2016 09:49:40 -0500 
From: Ioan-Adrian Ratiu <adrian.ratiu@ni.com>
To: openembedded-core@lists.openembedded.org
Date: Tue, 22 Mar 2016 16:49:02 +0200
Message-Id: <2c1e4c9b74ddb6c21ea4485b53eb42b4cf0eceaa.1458657317.git.adrian.ratiu@ni.com>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <123f1a18e95c8aea9939e14a537b701de8137737.1458657317.git.adrian.ratiu@ni.com>
References: <123f1a18e95c8aea9939e14a537b701de8137737.1458657317.git.adrian.ratiu@ni.com>
X-MIMETrack: Itemize by SMTP Server on US-AUS-MGWOut1/AUS/H/NIC(Release
	8.5.3FP6 HF1218|December 12, 2014) at 03/22/2016 09:49:41 AM,
	Serialize by Router on US-AUS-MGWOut1/AUS/H/NIC(Release 8.5.3FP6
	HF1218|December 12, 2014) at 03/22/2016 09:49:41 AM,
	Serialize complete at 03/22/2016 09:49:41 AM
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10432:, ,
	definitions=2016-03-22_08:, , signatures=0
Subject: [PATCH 2/3] default-providers.inc: add VIRTUAL-RUNTIME_mountpoint
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

util-linux, sysvinit, and busybox are all capable of providing
mountpoint; add a VIRTUAL-RUNTIME_mountpoint in order to switch
runtime dependencies between the three at build time.

Signed-off-by: Richard Tollerton <rich.tollerton@ni.com>
Signed-off-by: Ioan-Adrian Ratiu <adrian.ratiu@ni.com>
---
 meta/conf/distro/include/default-providers.inc | 1 +
 1 file changed, 1 insertion(+)

diff --git a/meta/conf/distro/include/default-providers.inc b/meta/conf/distro/include/default-providers.inc
index ba85c78..d13e3ad 100644
--- a/meta/conf/distro/include/default-providers.inc
+++ b/meta/conf/distro/include/default-providers.inc
@@ -26,6 +26,7 @@ VIRTUAL-RUNTIME_getopt ?= "util-linux-getopt"
 VIRTUAL-RUNTIME_wireless-tools ?= "iw wireless-tools"
 VIRTUAL-RUNTIME_base-utils ?= "busybox"
 VIRTUAL-RUNTIME_base-utils-hwclock ?= "busybox-hwclock"
+VIRTUAL-RUNTIME_mountpoint ?= "util-linux-mountpoint"
 
 #
 # Default recipe providers
-- 
2.7.4


