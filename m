Return-Path: <B28495@freescale.com>
Received: from co1outboundpool.messaging.microsoft.com
	(co1ehsobe003.messaging.microsoft.com [216.32.180.186])
	by mail.openembedded.org (Postfix) with ESMTP id 6FEA56CC7F
	for <openembedded-core@lists.openembedded.org>;
	Fri, 11 Oct 2013 08:11:52 +0000 (UTC)
Received: from mail83-co1-R.bigfish.com (10.243.78.229) by
	CO1EHSOBE027.bigfish.com (10.243.66.90) with Microsoft SMTP Server id
	14.1.225.22; Fri, 11 Oct 2013 08:11:54 +0000
Received: from mail83-co1 (localhost [127.0.0.1])	by mail83-co1-R.bigfish.com
	(Postfix) with ESMTP id 083135001AD	for
	<openembedded-core@lists.openembedded.org>;
	Fri, 11 Oct 2013 08:11:54 +0000 (UTC)
X-Forefront-Antispam-Report: CIP:70.37.183.190; KIP:(null); UIP:(null); IPV:NLI;
	H:mail.freescale.net; RD:none; EFVD:NLI
X-SpamScore: 0
X-BigFish: VS0(zzd799hzz1f42h208ch1ee6h1de0h1fdah2073h1202h1e76h1d1ah1d2ah1fc6hzz1de098h17326ah1de097h186068h8275bh8275dhz2dh2a8h839hd24he5bhf0ah1288h12a5h12a9h12bdh12e5h137ah139eh13b6h1441h1504h1537h162dh1631h1758h1898h18e1h1946h19b5h1ad9h1b0ah1b2fh1fb3h1d0ch1d2eh1d3fh1dfeh1dffh1e23h1fe8h1ff5h1155h)
Received: from mail83-co1 (localhost.localdomain [127.0.0.1]) by mail83-co1
	(MessageSwitch) id 1381479112913528_30200;
	Fri, 11 Oct 2013 08:11:52 +0000 (UTC)
Received: from CO1EHSMHS011.bigfish.com (unknown [10.243.78.241])	by
	mail83-co1.bigfish.com (Postfix) with ESMTP id DAE7C34004A	for
	<openembedded-core@lists.openembedded.org>;
	Fri, 11 Oct 2013 08:11:52 +0000 (UTC)
Received: from mail.freescale.net (70.37.183.190) by CO1EHSMHS011.bigfish.com
	(10.243.66.21) with Microsoft SMTP Server (TLS) id 14.16.227.3;
	Fri, 11 Oct 2013 08:11:52 +0000
Received: from tx30smr01.am.freescale.net (10.81.153.31) by
	039-SN1MMR1-003.039d.mgd.msft.net (10.84.1.16) with Microsoft SMTP
	Server (TLS) id 14.3.158.2; Fri, 11 Oct 2013 08:11:51 +0000
Received: from NETWORKudp177383uds.ap.freescale.net
	(udp144273uds.ap.freescale.net [10.193.20.27])	by
	tx30smr01.am.freescale.net
	(8.14.3/8.14.0) with ESMTP id r9B8Bl2B030874;
	Fri, 11 Oct 2013 01:11:50 -0700
From: <b28495@freescale.com>
To: <openembedded-core@lists.openembedded.org>
Date: Fri, 11 Oct 2013 16:11:45 +0800
Message-ID: <1381479105-21972-2-git-send-email-b28495@freescale.com>
X-Mailer: git-send-email 1.7.3.4
In-Reply-To: <1381479105-21972-1-git-send-email-b28495@freescale.com>
References: <1381479105-21972-1-git-send-email-b28495@freescale.com>
MIME-Version: 1.0
X-OriginatorOrg: freescale.com
X-FOPE-CONNECTOR: Id%0$Dn%*$RO%0$TLS%0$FQDN%$TlsDn%
Subject: [PATCH 2/2] socat: add dependency on tcp-wrappers
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
X-List-Received-Date: Fri, 11 Oct 2013 08:11:53 -0000
Content-Type: text/plain

From: Ting Liu <b28495@freescale.com>

Fix the below issue:
| Computing transaction...error: Can't install
| socat-1.7.2.2-r0@ppce500v2: no package provides libwrap.so.0
|
| Saving cache...
|

Signed-off-by: Ting Liu <b28495@freescale.com>
---
 meta/recipes-connectivity/socat/socat_1.7.2.2.bb |    2 +-
 1 files changed, 1 insertions(+), 1 deletions(-)

diff --git a/meta/recipes-connectivity/socat/socat_1.7.2.2.bb b/meta/recipes-connectivity/socat/socat_1.7.2.2.bb
index f015def..6f1bf0c 100644
--- a/meta/recipes-connectivity/socat/socat_1.7.2.2.bb
+++ b/meta/recipes-connectivity/socat/socat_1.7.2.2.bb
@@ -4,7 +4,7 @@ HOMEPAGE = "http://www.dest-unreach.org/socat/"
 
 SECTION = "console/network"
 
-DEPENDS = "openssl readline"
+DEPENDS = "openssl readline tcp-wrappers"
 
 LICENSE = "GPL-2.0+-with-OpenSSL-exception"
 LIC_FILES_CHKSUM = "file://COPYING;md5=18810669f13b87348459e611d31ab760 \
-- 
1.7.3.4



