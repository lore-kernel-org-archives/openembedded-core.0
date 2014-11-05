Return-Path: <ben.shelton@ni.com>
Received: from ni.com (skprod2.natinst.com [130.164.80.23])
	by mail.openembedded.org (Postfix) with ESMTP id 7735472009
	for <openembedded-core@lists.openembedded.org>;
	Wed,  5 Nov 2014 21:26:33 +0000 (UTC)
Received: from us-aus-mgwout1.amer.corp.natinst.com (nb-snip2-1338.natinst.com
	[130.164.19.135])
	by us-aus-skprod2.natinst.com (8.14.5/8.14.5) with ESMTP id
	sA5LQXfN000913 for <openembedded-core@lists.openembedded.org>;
	Wed, 5 Nov 2014 15:26:33 -0600
Received: from bshelton-desktop.natinst.com ([130.164.14.198])
	by us-aus-mgwout1.amer.corp.natinst.com (Lotus Domino Release 8.5.3FP6)
	with ESMTP id 2014110515263342-711015 ;
	Wed, 5 Nov 2014 15:26:33 -0600 
From: Ben Shelton <ben.shelton@ni.com>
To: openembedded-core@lists.openembedded.org
Date: Wed, 5 Nov 2014 15:26:16 -0600
Message-Id: <1415222777-6782-2-git-send-email-ben.shelton@ni.com>
X-Mailer: git-send-email 2.1.3
In-Reply-To: <1415222777-6782-1-git-send-email-ben.shelton@ni.com>
References: <1415222777-6782-1-git-send-email-ben.shelton@ni.com>
X-MIMETrack: Itemize by SMTP Server on US-AUS-MGWOut1/AUS/H/NIC(Release
	8.5.3FP6|November 21, 2013) at 11/05/2014 03:26:33 PM,
	Serialize by Router on US-AUS-MGWOut1/AUS/H/NIC(Release
	8.5.3FP6|November 21, 2013) at 11/05/2014 03:26:33 PM,
	Serialize complete at 11/05/2014 03:26:33 PM
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10432:5.12.52, 1.0.28,
	0.0.0000
	definitions=2014-11-05_08:2014-11-05, 2014-11-05,
	1970-01-01 signatures=0
Subject: [PATCH 2/3] default-providers.inc: define VIRTUAL-RUNTIME_getopt
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
X-List-Received-Date: Wed, 05 Nov 2014 21:26:36 -0000

From: Richard Tollerton <rich.tollerton@ni.com>

getopt can be provided by either util-linux or busybox. Allow the
distro to control which implementation is used, and default it to
util-linux.

Signed-off-by: Richard Tollerton <rich.tollerton@ni.com>
Acked-by: Ken Sharp <ken.sharp@ni.com>
Acked-by: Ben Shelton <ben.shelton@ni.com
Acked-by: Brad Mouring <brad.mouring@ni.com>
---
 meta/conf/distro/include/default-providers.inc | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/meta/conf/distro/include/default-providers.inc b/meta/conf/distro/include/default-providers.inc
index a1167fd..e15794f 100644
--- a/meta/conf/distro/include/default-providers.inc
+++ b/meta/conf/distro/include/default-providers.inc
@@ -21,6 +21,7 @@ PREFERRED_PROVIDER_xf86-video-intel ?= "xf86-video-intel"
 VIRTUAL-RUNTIME_update-alternatives ?= "update-alternatives-opkg"
 VIRTUAL-RUNTIME_apm ?= "apm"
 VIRTUAL-RUNTIME_alsa-state ?= "alsa-state"
+VIRTUAL-RUNTIME_getopt ?= "util-linux-getopt"
 
 #
 # Default recipe providers
@@ -45,3 +46,4 @@ PREFERRED_PROVIDER_udev ?= "${@bb.utils.contains('DISTRO_FEATURES','systemd','sy
 PREFERRED_PROVIDER_bluez4 ?= "bluez4"
 # Alternative is ltp-ddt in meta-oe: meta-oe/recipes-devtools/ltp-ddt/ltp-ddt_0.0.4.bb
 PREFERRED_PROVIDER_ltp ?= "ltp"
+PREFERRED_PROVIDER_getopt ?= "util-linux-getopt"
-- 
2.1.3


