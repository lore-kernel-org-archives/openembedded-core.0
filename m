Return-Path: <ting.liu@freescale.com>
Received: from db9outboundpool.messaging.microsoft.com
	(mail-db9lp0253.outbound.messaging.microsoft.com [213.199.154.253])
	by mail.openembedded.org (Postfix) with ESMTP id ED4096B446
	for <openembedded-core@lists.openembedded.org>;
	Tue, 14 Jan 2014 09:50:04 +0000 (UTC)
Received: from mail160-db9-R.bigfish.com (10.174.16.234) by
	DB9EHSOBE034.bigfish.com (10.174.14.97) with Microsoft SMTP Server id
	14.1.225.22; Tue, 14 Jan 2014 09:50:05 +0000
Received: from mail160-db9 (localhost [127.0.0.1])	by
	mail160-db9-R.bigfish.com (Postfix) with ESMTP id CC4073600AA	for
	<openembedded-core@lists.openembedded.org>;
	Tue, 14 Jan 2014 09:50:04 +0000 (UTC)
X-Forefront-Antispam-Report: CIP:70.37.183.190; KIP:(null); UIP:(null); IPV:NLI;
	H:mail.freescale.net; RD:none; EFVD:NLI
X-SpamScore: 0
X-BigFish: VS0(zzd799hzz1f42h208ch1ee6h1de0h1fdah2073h2146h1202h1e76h2189h1d1ah1d2ah21a7h1fc6hzz1de098h8275bh1de097hz2dh2a8h839hd24he5bhf0ah1288h12a5h12a9h12bdh12e5h137ah139eh13b6h1441h1504h1537h162dh1631h1758h1898h18e1h1946h19b5h1ad9h1b0ah1b2fh2222h224fh1fb3h1d0ch1d2eh1d3fh1dc1h1dfeh1dffh1e23h1fe8h1ff5h2218h2216h226dh22d0h2327h2336h2438h2461h1155h)
Received: from mail160-db9 (localhost.localdomain [127.0.0.1]) by mail160-db9
	(MessageSwitch) id 1389693002692157_18252;
	Tue, 14 Jan 2014 09:50:02 +0000 (UTC)
Received: from DB9EHSMHS027.bigfish.com (unknown [10.174.16.250])	by
	mail160-db9.bigfish.com (Postfix) with ESMTP id A2D82340046;
	Tue, 14 Jan 2014 09:50:02 +0000 (UTC)
Received: from mail.freescale.net (70.37.183.190) by DB9EHSMHS027.bigfish.com
	(10.174.14.37) with Microsoft SMTP Server (TLS) id 14.16.227.3;
	Tue, 14 Jan 2014 09:50:02 +0000
Received: from tx30smr01.am.freescale.net (10.81.153.31) by
	039-SN1MMR1-003.039d.mgd.msft.net (10.84.1.16) with Microsoft SMTP
	Server (TLS) id 14.3.158.2; Tue, 14 Jan 2014 09:50:00 +0000
Received: from b28495.ap.freescale.net (b28495.ap.freescale.net
	[10.193.20.146])	by tx30smr01.am.freescale.net (8.14.3/8.14.0) with
	ESMTP id s0E9nvwp027247;	Tue, 14 Jan 2014 02:49:59 -0700
From: <b28495@freescale.com>
To: <openembedded-core@lists.openembedded.org>
Date: Tue, 14 Jan 2014 17:49:55 +0800
Message-ID: <1389692997-5088-1-git-send-email-b28495@freescale.com>
X-Mailer: git-send-email 1.7.3.4
MIME-Version: 1.0
X-OriginatorOrg: freescale.com
X-FOPE-CONNECTOR: Id%0$Dn%*$RO%0$TLS%0$FQDN%$TlsDn%
X-FOPE-CONNECTOR: Id%0$Dn%FREESCALE.MAIL.ONMICROSOFT.COM$RO%1$TLS%0$FQDN%$TlsDn%
Subject: [PATCH 1/3] dbus: Add missing RDEPENDS of base-files
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
X-List-Received-Date: Tue, 14 Jan 2014 09:50:07 -0000
Content-Type: text/plain

From: Ting Liu <b28495@freescale.com>

Fix the below issue:
| Computing transaction...error: Can't install
| dbus-1-1.6.18-r0@ppce500v2: no package provides base-files
|

Signed-off-by: Ting Liu <b28495@freescale.com>
---
 meta/recipes-core/dbus/dbus.inc |    2 +-
 1 files changed, 1 insertions(+), 1 deletions(-)

diff --git a/meta/recipes-core/dbus/dbus.inc b/meta/recipes-core/dbus/dbus.inc
index 9bdb489..88aca2e 100644
--- a/meta/recipes-core/dbus/dbus.inc
+++ b/meta/recipes-core/dbus/dbus.inc
@@ -6,7 +6,7 @@ LICENSE = "AFL-2 | GPLv2+"
 LIC_FILES_CHKSUM = "file://COPYING;md5=10dded3b58148f3f1fd804b26354af3e \
                     file://dbus/dbus.h;beginline=6;endline=20;md5=7755c9d7abccd5dbd25a6a974538bb3c"
 DEPENDS = "expat virtual/libintl"
-RDEPENDS_dbus = "${@base_contains('DISTRO_FEATURES', 'ptest', 'dbus-ptest-ptest', '', d)} initscripts-functions"
+RDEPENDS_dbus = "${@base_contains('DISTRO_FEATURES', 'ptest', 'dbus-ptest-ptest', '', d)} initscripts-functions base-files"
 RDEPENDS_dbus_class-native = ""
 RDEPENDS_dbus_class-nativesdk = ""
 
-- 
1.7.3.4



