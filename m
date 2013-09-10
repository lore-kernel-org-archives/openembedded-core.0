Return-Path: <B28495@freescale.com>
Received: from co9outboundpool.messaging.microsoft.com
	(co9ehsobe001.messaging.microsoft.com [207.46.163.24])
	by mail.openembedded.org (Postfix) with ESMTP id 8845661853
	for <openembedded-core@lists.openembedded.org>;
	Tue, 10 Sep 2013 10:02:16 +0000 (UTC)
Received: from mail126-co9-R.bigfish.com (10.236.132.243) by
	CO9EHSOBE007.bigfish.com (10.236.130.70) with Microsoft SMTP Server id
	14.1.225.22; Tue, 10 Sep 2013 10:02:17 +0000
Received: from mail126-co9 (localhost [127.0.0.1])	by
	mail126-co9-R.bigfish.com (Postfix) with ESMTP id 87963740044	for
	<openembedded-core@lists.openembedded.org>;
	Tue, 10 Sep 2013 10:02:17 +0000 (UTC)
X-Forefront-Antispam-Report: CIP:70.37.183.190; KIP:(null); UIP:(null); IPV:NLI;
	H:mail.freescale.net; RD:none; EFVD:NLI
X-SpamScore: 0
X-BigFish: VS0(zzzz1f42h208ch1ee6h1de0h1fdah2073h1202h1e76h1d1ah1d2ah1fc6hzz1de098h1de097h8275bhz2dh2a8h839hd24he5bhf0ah1288h12a5h12a9h12bdh12e5h137ah139eh13b6h1441h1504h1537h162dh1631h1758h1898h18e1h1946h19b5h1ad9h1b0ah1b2fh1fb3h1d0ch1d2eh1d3fh1dc1h1dfeh1dffh1e23h1fe8h1ff5h1155h)
Received: from mail126-co9 (localhost.localdomain [127.0.0.1]) by mail126-co9
	(MessageSwitch) id 1378807335737049_12017;
	Tue, 10 Sep 2013 10:02:15 +0000 (UTC)
Received: from CO9EHSMHS027.bigfish.com (unknown [10.236.132.251])	by
	mail126-co9.bigfish.com (Postfix) with ESMTP id AF5C420047	for
	<openembedded-core@lists.openembedded.org>;
	Tue, 10 Sep 2013 10:02:15 +0000 (UTC)
Received: from mail.freescale.net (70.37.183.190) by CO9EHSMHS027.bigfish.com
	(10.236.130.37) with Microsoft SMTP Server (TLS) id 14.16.227.3;
	Tue, 10 Sep 2013 10:02:15 +0000
Received: from tx30smr01.am.freescale.net (10.81.153.31) by
	039-SN1MMR1-005.039d.mgd.msft.net (10.84.1.17) with Microsoft SMTP
	Server (TLS) id 14.3.158.2; Tue, 10 Sep 2013 10:02:14 +0000
Received: from sbuilder136.ap.freescale.net (sun.ap.freescale.net
	[10.192.208.136])	by tx30smr01.am.freescale.net (8.14.3/8.14.0) with
	ESMTP id r8AA2Bf9026872;	Tue, 10 Sep 2013 03:02:12 -0700
From: <b28495@freescale.com>
To: <openembedded-core@lists.openembedded.org>
Date: Tue, 10 Sep 2013 18:02:10 +0800
Message-ID: <1378807330-15606-1-git-send-email-b28495@freescale.com>
X-Mailer: git-send-email 1.7.5.4
MIME-Version: 1.0
X-OriginatorOrg: freescale.com
X-FOPE-CONNECTOR: Id%0$Dn%*$RO%0$TLS%0$FQDN%$TlsDn%
Subject: [PATCH v2] libcroco: disable Bsymbolic if it is not supported on some hosts
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
X-List-Received-Date: Tue, 10 Sep 2013 10:02:17 -0000
Content-Type: text/plain

From: Ting Liu <b28495@freescale.com>

When trying to build on my Centos 5.5 machine, got below error:
| checking for gtkdoc-mkpdf... no
| checking whether to build gtk-doc documentation... no
| checking for CROCO... yes
| checking if gcc supports "-Wl,-Bsymbolic-functions" flag...
| configure: error: -Bsymbolic requested but not supported by ld. Use --disable-Bsymbolic to disable
| Configure failed. The contents of all config.log files follows to aid debugging
|
| configure: exit 1
| ERROR: oe_runconf failed

Set --enable_Bsymbolic=auto to disable it when it is not suppported.

Signed-off-by: Ting Liu <b28495@freescale.com>
---
 meta/recipes-support/libcroco/libcroco_0.6.8.bb |    2 +-
 1 files changed, 1 insertions(+), 1 deletions(-)

diff --git a/meta/recipes-support/libcroco/libcroco_0.6.8.bb b/meta/recipes-support/libcroco/libcroco_0.6.8.bb
index 3c5dc9a..fe1a42d 100644
--- a/meta/recipes-support/libcroco/libcroco_0.6.8.bb
+++ b/meta/recipes-support/libcroco/libcroco_0.6.8.bb
@@ -10,7 +10,7 @@ LIC_FILES_CHKSUM = "file://COPYING;md5=55ca817ccb7d5b5b66355690e9abc605 \
 SECTION = "x11/utils"
 DEPENDS = "glib-2.0 libxml2 zlib"
 BBCLASSEXTEND = "native"
-
+EXTRA_OECONF += "--enable_Bsymbolic=auto"
 PR = "r1"
 
 inherit autotools pkgconfig gnomebase
-- 
1.7.5.4



