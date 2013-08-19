Return-Path: <RAA013@freescale.com>
Received: from db8outboundpool.messaging.microsoft.com
	(mail-db8lp0184.outbound.messaging.microsoft.com [213.199.154.184])
	by mail.openembedded.org (Postfix) with ESMTP id 4606E6B7D8
	for <openembedded-core@lists.openembedded.org>;
	Mon, 19 Aug 2013 19:24:43 +0000 (UTC)
Received: from mail160-db8-R.bigfish.com (10.174.8.237) by
	DB8EHSOBE030.bigfish.com (10.174.4.93) with Microsoft SMTP Server id
	14.1.225.22; Mon, 19 Aug 2013 19:24:43 +0000
Received: from mail160-db8 (localhost [127.0.0.1])	by
	mail160-db8-R.bigfish.com (Postfix) with ESMTP id F1DFE2E030E	for
	<openembedded-core@lists.openembedded.org>;
	Mon, 19 Aug 2013 19:24:42 +0000 (UTC)
X-Forefront-Antispam-Report: CIP:70.37.183.190; KIP:(null); UIP:(null); IPV:NLI;
	H:mail.freescale.net; RD:none; EFVD:NLI
X-SpamScore: -1
X-BigFish: VS-1(zz936eIzz1f42h208ch1ee6h1de0h1fdah2073h1202h1e76h1d1ah1d2ah1fc6hzz1de098h177df4h17326ah1de096h8275bh8275dh1de097hz2dh2a8h839hd24he5bhf0ah1288h12a5h12a9h12bdh12e5h137ah139eh13b6h1441h1504h1537h162dh1631h1758h1898h18e1h1946h19b5h1ad9h1b0ah1b2fh1fb3h1d0ch1d2eh1d3fh1dfeh1dffh1e23h1fe8h1ff5h1155h)
Received: from mail160-db8 (localhost.localdomain [127.0.0.1]) by mail160-db8
	(MessageSwitch) id 1376940280490964_27341;
	Mon, 19 Aug 2013 19:24:40 +0000 (UTC)
Received: from DB8EHSMHS006.bigfish.com (unknown [10.174.8.244])	by
	mail160-db8.bigfish.com (Postfix) with ESMTP id 6A697D8004A	for
	<openembedded-core@lists.openembedded.org>;
	Mon, 19 Aug 2013 19:24:40 +0000 (UTC)
Received: from mail.freescale.net (70.37.183.190) by DB8EHSMHS006.bigfish.com
	(10.174.4.16) with Microsoft SMTP Server (TLS) id 14.16.227.3;
	Mon, 19 Aug 2013 19:24:40 +0000
Received: from tx30smr01.am.freescale.net (10.81.153.31) by
	039-SN1MMR1-003.039d.mgd.msft.net (10.84.1.16) with Microsoft SMTP
	Server (TLS) id 14.3.146.2; Mon, 19 Aug 2013 19:24:38 +0000
Received: from neo.am.freescale.net (neo.am.freescale.net [10.81.16.89])	by
	tx30smr01.am.freescale.net (8.14.3/8.14.0) with ESMTP id r7JJOaQ4006424;
	Mon, 19 Aug 2013 12:24:38 -0700
From: Lauren Post <lauren.post@freescale.com>
To: <openembedded-core@lists.openembedded.org>
Date: Mon, 19 Aug 2013 14:17:44 -0500
Message-ID: <1376939864-4790-2-git-send-email-lauren.post@freescale.com>
X-Mailer: git-send-email 1.7.9.5
In-Reply-To: <1376939864-4790-1-git-send-email-lauren.post@freescale.com>
References: <lauren.post@freescale.com>
	<1376939864-4790-1-git-send-email-lauren.post@freescale.com>
MIME-Version: 1.0
X-OriginatorOrg: freescale.com
X-FOPE-CONNECTOR: Id%0$Dn%*$RO%0$TLS%0$FQDN%$TlsDn%
Subject: [v2][PATCH 2/2] directfb: add fusion patch for hangs on exit with
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
X-List-Received-Date: Mon, 19 Aug 2013 19:24:43 -0000
Content-Type: text/plain

directfb: add fusion patch for hangs on exit with
 
following tests:   direct_test, fusion_skirmish

Signed-off-by: Lauren Post <lauren.post@freescale.com>
---
 meta/recipes-graphics/directfb/directfb.inc        |    3 +-
 .../directfb/directfb/fusion.patch                 |   36 ++++++++++++++++++++
 2 files changed, 38 insertions(+), 1 deletion(-)
 create mode 100755 meta/recipes-graphics/directfb/directfb/fusion.patch

diff --git a/meta/recipes-graphics/directfb/directfb.inc b/meta/recipes-graphics/directfb/directfb.inc
index 60b12f7..a23209f 100644
--- a/meta/recipes-graphics/directfb/directfb.inc
+++ b/meta/recipes-graphics/directfb/directfb.inc
@@ -14,7 +14,8 @@ DEPENDS = "jpeg libpng freetype zlib tslib"
 INC_PR = "r0"
 
 SRC_URI = "http://directfb.org/downloads/Core/DirectFB-1.6/DirectFB-${PV}.tar.gz \
-           file://configurefix.patch"
+           file://configurefix.patch \
+           file://fusion.patch"
 
 S = "${WORKDIR}/DirectFB-${PV}"
 
diff --git a/meta/recipes-graphics/directfb/directfb/fusion.patch b/meta/recipes-graphics/directfb/directfb/fusion.patch
new file mode 100755
index 0000000..1f81a67
--- /dev/null
+++ b/meta/recipes-graphics/directfb/directfb/fusion.patch
@@ -0,0 +1,36 @@
+directfb: Fix for hangs in direct_test, fusion_skirmish on exit
+
+Upstream-Status: Pending
+Signed-off-by: Lauren Post <lauren.post@freescale.com>
+
+--- a/lib/fusion/fusion.c	2013-01-18 22:57:11.000000000 +0800
++++ b/lib/fusion/fusion.c	2013-07-04 10:42:56.502699119 +0800
+@@ -2853,9 +2853,14 @@
+           direct_mutex_lock( &world->event_dispatcher_mutex );
+ 
+           while (1) {
+-               if (!world->event_dispatcher_buffers)
++               if (!world->event_dispatcher_buffers){
+                     direct_waitqueue_wait( &world->event_dispatcher_cond, &world->event_dispatcher_mutex );
+-
++                    if (world->dispatch_stop) {
++                         D_DEBUG_AT( Fusion_Main_Dispatch, "  -> IGNORING (dispatch_stop!)\n" );
++                         direct_mutex_unlock( &world->event_dispatcher_mutex );
++                         return NULL;
++                    }
++               }
+                buf = (FusionEventDispatcherBuffer *)world->event_dispatcher_buffers;
+                D_MAGIC_ASSERT( buf, FusionEventDispatcherBuffer );
+ 
+@@ -2872,6 +2877,11 @@
+ //D_INFO("waiting...\n");
+                     D_ASSERT( buf->read_pos == buf->write_pos );
+                     direct_waitqueue_wait( &world->event_dispatcher_cond, &world->event_dispatcher_mutex );
++		      if (world->dispatch_stop) {
++                         D_DEBUG_AT( Fusion_Main_Dispatch, "  -> IGNORING (dispatch_stop!)\n" );
++                         direct_mutex_unlock( &world->event_dispatcher_mutex );
++                         return NULL;
++                    }
+                }
+ 
+                buf = (FusionEventDispatcherBuffer *)world->event_dispatcher_buffers;
-- 
1.7.9.5



