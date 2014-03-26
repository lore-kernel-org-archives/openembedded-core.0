Return-Path: <Lauren.Post@freescale.com>
Received: from va3outboundpool.messaging.microsoft.com
	(va3ehsobe001.messaging.microsoft.com [216.32.180.11])
	by mail.openembedded.org (Postfix) with ESMTP id 8E8F86FA41
	for <openembedded-core@lists.openembedded.org>;
	Wed, 26 Mar 2014 14:40:13 +0000 (UTC)
Received: from mail185-va3-R.bigfish.com (10.7.14.241) by
	VA3EHSOBE001.bigfish.com (10.7.40.21) with Microsoft SMTP Server id
	14.1.225.22; Wed, 26 Mar 2014 14:40:12 +0000
Received: from mail185-va3 (localhost [127.0.0.1])	by
	mail185-va3-R.bigfish.com (Postfix) with ESMTP id 6D3CE1001E8	for
	<openembedded-core@lists.openembedded.org>;
	Wed, 26 Mar 2014 14:40:12 +0000 (UTC)
X-Forefront-Antispam-Report: CIP:70.37.183.190; KIP:(null); UIP:(null); IPV:NLI;
	H:mail.freescale.net; RD:none; EFVD:NLI
X-SpamScore: 0
X-BigFish: VS0(zzzz1f42h2148h208ch1ee6h1de0h1fdah2073h2146h1202h1e76h2189h1d1ah1d2ah21bch1fc6hzz1de098h8275bh1de097hz2dh2a8h839hd24he5bhf0ah1288h12a5h12a9h12bdh12e5h137ah139eh13b6h1441h1504h1537h162dh1631h1758h1898h18e1h1946h19b5h1ad9h1b0ah1b2fh2222h224fh1fb3h1d0ch1d2eh1d3fh1dfeh1dffh1e23h1fe8h1ff5h2218h2216h226dh22d0h24afh2327h2336h2438h2461h2487h24d7h2516h2545h255eh25cch25f6h2605h268bh1155h)
Received: from mail185-va3 (localhost.localdomain [127.0.0.1]) by mail185-va3
	(MessageSwitch) id 1395844811533792_20003;
	Wed, 26 Mar 2014 14:40:11 +0000 (UTC)
Received: from VA3EHSMHS022.bigfish.com (unknown [10.7.14.235])	by
	mail185-va3.bigfish.com (Postfix) with ESMTP id 7601718004C;
	Wed, 26 Mar 2014 14:40:11 +0000 (UTC)
Received: from mail.freescale.net (70.37.183.190) by VA3EHSMHS022.bigfish.com
	(10.7.99.32) with Microsoft SMTP Server (TLS) id 14.16.227.3;
	Wed, 26 Mar 2014 14:40:09 +0000
Received: from tx30smr01.am.freescale.net (10.81.153.31) by
	039-SN1MMR1-001.039d.mgd.msft.net (10.84.1.13) with Microsoft SMTP
	Server (TLS) id 14.3.158.2; Wed, 26 Mar 2014 14:40:08 +0000
Received: from neo.am.freescale.net (neo.am.freescale.net [10.81.16.89])	by
	tx30smr01.am.freescale.net (8.14.3/8.14.0) with ESMTP id s2QEe74Z001694;
	Wed, 26 Mar 2014 07:40:08 -0700
From: Lauren Post <lauren.post@freescale.com>
To: <openembedded-core@lists.openembedded.org>
Date: Wed, 26 Mar 2014 09:28:05 -0500
Message-ID: <1395844085-9929-12-git-send-email-lauren.post@freescale.com>
X-Mailer: git-send-email 1.7.9.5
In-Reply-To: <1395844085-9929-1-git-send-email-lauren.post@freescale.com>
References: <lauren.post@freescale.com>
	<1395844085-9929-1-git-send-email-lauren.post@freescale.com>
MIME-Version: 1.0
X-OriginatorOrg: freescale.com
X-FOPE-CONNECTOR: Id%0$Dn%*$RO%0$TLS%0$FQDN%$TlsDn%
X-FOPE-CONNECTOR: Id%0$Dn%FREESCALE.MAIL.ONMICROSOFT.COM$RO%1$TLS%0$FQDN%$TlsDn%
Subject: [PATCH 11/11] package-group: Change bluez4 to virtual/bluez
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

This allows easy transition to bluez5 in future

Signed-off-by: Lauren Post <lauren.post@freescale.com>
---
 .../packagegroups/packagegroup-base.bb             |    2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta/recipes-core/packagegroups/packagegroup-base.bb b/meta/recipes-core/packagegroups/packagegroup-base.bb
index 368c318..d920082 100644
--- a/meta/recipes-core/packagegroups/packagegroup-base.bb
+++ b/meta/recipes-core/packagegroups/packagegroup-base.bb
@@ -210,7 +210,7 @@ RRECOMMENDS_packagegroup-base-pcmcia = "\
 
 SUMMARY_packagegroup-base-bluetooth = "Bluetooth support"
 RDEPENDS_packagegroup-base-bluetooth = "\
-    bluez4 \
+    virtual/bluez \
     ${@base_contains('COMBINED_FEATURES', 'alsa', 'libasound-module-bluez', '',d)} \
     "
 
-- 
1.7.9.5



