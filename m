Received: from co9ehsobe002.messaging.microsoft.com ([207.46.163.25]
	helo=co9outboundpool.messaging.microsoft.com)
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <B40290@freescale.com>) id 1UVeuK-0005sq-6C
	for openembedded-core@lists.openembedded.org;
	Fri, 26 Apr 2013 11:25:34 +0200
Received: from mail96-co9-R.bigfish.com (10.236.132.250) by
	CO9EHSOBE030.bigfish.com (10.236.130.93) with Microsoft SMTP Server id
	14.1.225.23; Fri, 26 Apr 2013 08:07:21 +0000
Received: from mail96-co9 (localhost [127.0.0.1])	by mail96-co9-R.bigfish.com
	(Postfix) with ESMTP id 4F645D000D2	for
	<openembedded-core@lists.openembedded.org>;
	Fri, 26 Apr 2013 08:07:21 +0000 (UTC)
X-Forefront-Antispam-Report: CIP:70.37.183.190; KIP:(null); UIP:(null); IPV:NLI;
	H:mail.freescale.net; RD:none; EFVD:NLI
X-SpamScore: 0
X-BigFish: VS0(zzzz1f42h1fc6h1ee6h1de0h1fdah1202h1e76h1d1ah1d2ahzz8275bhz2dh2a8h668h839he5bhf0ah1288h12a5h12a9h12bdh12e5h137ah139eh13b6h1441h1504h1537h162dh1631h1758h1898h18e1h1946h19b5h1ad9h1b0ah1d0ch1155h)
Received: from mail96-co9 (localhost.localdomain [127.0.0.1]) by mail96-co9
	(MessageSwitch) id 1366963639349391_30086;
	Fri, 26 Apr 2013 08:07:19 +0000 (UTC)
Received: from CO9EHSMHS014.bigfish.com (unknown [10.236.132.248])	by
	mail96-co9.bigfish.com (Postfix) with ESMTP id 531D11C005F	for
	<openembedded-core@lists.openembedded.org>;
	Fri, 26 Apr 2013 08:07:19 +0000 (UTC)
Received: from mail.freescale.net (70.37.183.190) by CO9EHSMHS014.bigfish.com
	(10.236.130.24) with Microsoft SMTP Server (TLS) id 14.1.225.23;
	Fri, 26 Apr 2013 08:07:11 +0000
Received: from tx30smr01.am.freescale.net (10.81.153.31) by
	039-SN1MMR1-001.039d.mgd.msft.net (10.84.1.13) with Microsoft SMTP
	Server (TLS) id 14.2.328.11; Fri, 26 Apr 2013 08:07:10 +0000
Received: from sbuilder136.ap.freescale.net (sun.ap.freescale.net
	[10.192.208.136])	by tx30smr01.am.freescale.net (8.14.3/8.14.0) with
	ESMTP id r3Q8771o016350;	Fri, 26 Apr 2013 01:07:08 -0700
From: Chunrong Guo <B40290@freescale.com>
To: <openembedded-core@lists.openembedded.org>
Date: Fri, 26 Apr 2013 16:07:03 +0800
Message-ID: <1366963623-13626-1-git-send-email-B40290@freescale.com>
X-Mailer: git-send-email 1.7.5.4
MIME-Version: 1.0
X-OriginatorOrg: freescale.com
Cc: Chunrong Guo <B40290@freescale.com>, B19537@freescale.com
Subject: [PATCH] connman: tist of connman do not support powerpc64
X-BeenThere: openembedded-core@lists.openembedded.org
X-Mailman-Version: 2.1.11
Precedence: list
List-Id: Patches and discussions about the oe-core layer
	<openembedded-core.lists.openembedded.org>
List-Unsubscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/options/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.linuxtogo.org/pipermail/openembedded-core>
List-Post: <mailto:openembedded-core@lists.openembedded.org>
List-Help: <mailto:openembedded-core-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Fri, 26 Apr 2013 09:25:44 -0000
Content-Type: text/plain

    connman build for powerpc 64bit boards were producing errors like this:
    | make[1]: *** [plugins/plugins_tist_la-tist.lo] Error 1
    | make[1]: *** Waiting for unfinished jobs....
    | make: *** [all] Error 2
    | ERROR: oe_runmake failed

Signed-off-by: Chunrong Guo <B40290@freescale.com>
---
 meta/recipes-connectivity/connman/connman.inc |    3 ++-
 1 files changed, 2 insertions(+), 1 deletions(-)

diff --git a/meta/recipes-connectivity/connman/connman.inc b/meta/recipes-connectivity/connman/connman.inc
index 589ece8..5389f3a 100644
--- a/meta/recipes-connectivity/connman/connman.inc
+++ b/meta/recipes-connectivity/connman/connman.inc
@@ -20,10 +20,11 @@ DEPENDS  = "dbus glib-2.0 ppp iptables gnutls \
             ${@base_contains('DISTRO_FEATURES', '3g','ofono', '', d)} \
             "
 
-INC_PR = "r19"
+INC_PR = "r20"
 
 TIST = "--enable-tist"
 TIST_powerpc = ""
+TIST_powerpc64 = ""
 
 EXTRA_OECONF += "\
     ac_cv_path_WPASUPPLICANT=${sbindir}/wpa_supplicant \
-- 
1.7.5.4




