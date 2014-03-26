Return-Path: <Lauren.Post@freescale.com>
Received: from tx2outboundpool.messaging.microsoft.com
	(tx2ehsobe007.messaging.microsoft.com [65.55.88.31])
	by mail.openembedded.org (Postfix) with ESMTP id 0EA3660C02
	for <openembedded-core@lists.openembedded.org>;
	Wed, 26 Mar 2014 14:40:13 +0000 (UTC)
Received: from mail84-tx2-R.bigfish.com (10.9.14.252) by
	TX2EHSOBE013.bigfish.com (10.9.40.33) with Microsoft SMTP Server id
	14.1.225.22; Wed, 26 Mar 2014 14:40:13 +0000
Received: from mail84-tx2 (localhost [127.0.0.1])	by mail84-tx2-R.bigfish.com
	(Postfix) with ESMTP id 9F68A4201CB	for
	<openembedded-core@lists.openembedded.org>;
	Wed, 26 Mar 2014 14:40:13 +0000 (UTC)
X-Forefront-Antispam-Report: CIP:70.37.183.190; KIP:(null); UIP:(null); IPV:NLI;
	H:mail.freescale.net; RD:none; EFVD:NLI
X-SpamScore: 0
X-BigFish: VS0(zze0eahzz1f42h2148h208ch1ee6h1de0h1fdah2073h2146h1202h1e76h2189h1d1ah1d2ah21bch1fc6hzz1de098h8275bh1de097hz2dh2a8h839hd24he5bhf0ah1288h12a5h12a9h12bdh12e5h137ah139eh13b6h1441h1504h1537h162dh1631h1758h1898h18e1h1946h19b5h1ad9h1b0ah1b2fh2222h224fh1fb3h1d0ch1d2eh1d3fh1dfeh1dffh1e23h1fe8h1ff5h2218h2216h226dh22d0h24afh2327h2336h2438h2461h2487h24d7h2516h2545h255eh25cch25f6h2605h268bh1155h)
Received: from mail84-tx2 (localhost.localdomain [127.0.0.1]) by mail84-tx2
	(MessageSwitch) id 1395844810875124_8288;
	Wed, 26 Mar 2014 14:40:10 +0000 (UTC)
Received: from TX2EHSMHS024.bigfish.com (unknown [10.9.14.240])	by
	mail84-tx2.bigfish.com (Postfix) with ESMTP id B63CD2C0101;
	Wed, 26 Mar 2014 14:40:10 +0000 (UTC)
Received: from mail.freescale.net (70.37.183.190) by TX2EHSMHS024.bigfish.com
	(10.9.99.124) with Microsoft SMTP Server (TLS) id 14.16.227.3;
	Wed, 26 Mar 2014 14:40:08 +0000
Received: from tx30smr01.am.freescale.net (10.81.153.31) by
	039-SN1MMR1-003.039d.mgd.msft.net (10.84.1.16) with Microsoft SMTP
	Server (TLS) id 14.3.158.2; Wed, 26 Mar 2014 14:40:08 +0000
Received: from neo.am.freescale.net (neo.am.freescale.net [10.81.16.89])	by
	tx30smr01.am.freescale.net (8.14.3/8.14.0) with ESMTP id s2QEe74P001694;
	Wed, 26 Mar 2014 07:40:08 -0700
From: Lauren Post <lauren.post@freescale.com>
To: <openembedded-core@lists.openembedded.org>
Date: Wed, 26 Mar 2014 09:27:55 -0500
Message-ID: <1395844085-9929-2-git-send-email-lauren.post@freescale.com>
X-Mailer: git-send-email 1.7.9.5
In-Reply-To: <1395844085-9929-1-git-send-email-lauren.post@freescale.com>
References: <lauren.post@freescale.com>
	<1395844085-9929-1-git-send-email-lauren.post@freescale.com>
MIME-Version: 1.0
X-OriginatorOrg: freescale.com
X-FOPE-CONNECTOR: Id%0$Dn%*$RO%0$TLS%0$FQDN%$TlsDn%
X-FOPE-CONNECTOR: Id%0$Dn%FREESCALE.MAIL.ONMICROSOFT.COM$RO%1$TLS%0$FQDN%$TlsDn%
Subject: [PATCH 01/11] bluez4: Add virtual/bluez as provider
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
X-List-Received-Date: Wed, 26 Mar 2014 14:40:16 -0000
Content-Type: text/plain

This will make it easier to allow bluez5 support later
Without this change too many components depend directly on bluez4
If these components depend on virtual/bluez then easier to upgrade.

Signed-off-by: Lauren Post <lauren.post@freescale.com>
---
 meta/recipes-connectivity/bluez/bluez4.inc |    4 ++++
 1 file changed, 4 insertions(+)

diff --git a/meta/recipes-connectivity/bluez/bluez4.inc b/meta/recipes-connectivity/bluez/bluez4.inc
index 0827005..dce9642 100644
--- a/meta/recipes-connectivity/bluez/bluez4.inc
+++ b/meta/recipes-connectivity/bluez/bluez4.inc
@@ -7,9 +7,13 @@ LIC_FILES_CHKSUM = "file://COPYING;md5=12f884d2ae1ff87c09e5b7ccc2c4ca7e \
                     file://COPYING.LIB;md5=fb504b67c50331fc78734fed90fb0e09 \
                     file://src/main.c;beginline=1;endline=24;md5=9bc54b93cd7e17bf03f52513f39f926e \
                     file://sbc/sbc.c;beginline=1;endline=25;md5=1a40781ed30d50d8639323a184aeb191"
+
 DEPENDS = "udev libusb dbus-glib glib-2.0 libcheck readline libsndfile1"
 RDEPENDS_${PN}-dev = "bluez-hcidump"
 
+PROVIDES += "virtual/bluez"
+RPROVIDES_${PN} += "virtual/bluez"
+
 PACKAGECONFIG ??= "\
     ${@base_contains('DISTRO_FEATURES', 'alsa', 'alsa', '', d)}\
     ${@base_contains('DISTRO_FEATURES', 'pie', 'pie', '', d)}\
-- 
1.7.9.5



