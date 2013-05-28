Return-Path: <B19537@freescale.com>
Received: from co9outboundpool.messaging.microsoft.com
	(co9ehsobe003.messaging.microsoft.com [207.46.163.26])
	by mail.openembedded.org (Postfix) with ESMTP id 65DA26A36E
	for <openembedded-core@lists.openembedded.org>;
	Tue, 28 May 2013 09:47:55 +0000 (UTC)
Received: from mail55-co9-R.bigfish.com (10.236.132.229) by
	CO9EHSOBE017.bigfish.com (10.236.130.80) with Microsoft SMTP Server id
	14.1.225.23; Tue, 28 May 2013 09:47:55 +0000
Received: from mail55-co9 (localhost [127.0.0.1])	by mail55-co9-R.bigfish.com
	(Postfix) with ESMTP id D911E940256	for
	<openembedded-core@lists.openembedded.org>;
	Tue, 28 May 2013 09:47:55 +0000 (UTC)
X-Forefront-Antispam-Report: CIP:70.37.183.190; KIP:(null); UIP:(null); IPV:NLI;
	H:mail.freescale.net; RD:none; EFVD:NLI
X-SpamScore: 0
X-BigFish: VS0(zzzz1f42h1ee6h1de0h1fdah1202h1e76h1d1ah1d2ah1fc6hzz8275bhz2dh2a8h668h839hd24he5bhf0ah1288h12a5h12a9h12bdh12e5h137ah139eh13b6h1441h1504h1537h162dh1631h1758h1898h18e1h1946h19b5h1ad9h1b0ah1d0ch1d2eh1d3fh1dc1h1155h)
Received: from mail55-co9 (localhost.localdomain [127.0.0.1]) by mail55-co9
	(MessageSwitch) id 1369734474927760_29238;
	Tue, 28 May 2013 09:47:54 +0000 (UTC)
Received: from CO9EHSMHS020.bigfish.com (unknown [10.236.132.252])	by
	mail55-co9.bigfish.com (Postfix) with ESMTP id E08EBDC0069	for
	<openembedded-core@lists.openembedded.org>;
	Tue, 28 May 2013 09:47:54 +0000 (UTC)
Received: from mail.freescale.net (70.37.183.190) by CO9EHSMHS020.bigfish.com
	(10.236.130.30) with Microsoft SMTP Server (TLS) id 14.1.225.23;
	Tue, 28 May 2013 09:47:54 +0000
Received: from tx30smr01.am.freescale.net (10.81.153.31) by
	039-SN1MMR1-003.039d.mgd.msft.net (10.84.1.16) with Microsoft SMTP
	Server (TLS) id 14.2.328.11; Tue, 28 May 2013 09:48:49 +0000
Received: from b19537-desktop.ap.freescale.net
	(b19537-desktop.ap.freescale.net [10.192.208.197])	by
	tx30smr01.am.freescale.net (8.14.3/8.14.0) with ESMTP id r4S9loKh003085;
	Tue, 28 May 2013 02:47:51 -0700
From: Zhenhua Luo <zhenhua.luo@freescale.com>
To: <openembedded-core@lists.openembedded.org>
Date: Tue, 28 May 2013 17:53:27 +0800
Message-ID: <1369734807-20523-1-git-send-email-zhenhua.luo@freescale.com>
X-Mailer: git-send-email 1.7.9.5
MIME-Version: 1.0
X-OriginatorOrg: freescale.com
Cc: Zhenhua Luo <zhenhua.luo@freescale.com>, b40527@freescale.com
Subject: [PATCH] powerpc64-linux: Update cached autoconf value for apr on powerpc64
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
X-List-Received-Date: Tue, 28 May 2013 09:47:55 -0000
Content-Type: text/plain

Fix below apr configure issue of powerpc64 targets.
| configure:27173: checking whether TCP_NODELAY and TCP_CORK can both be
| enabled
| configure:27179: error: in `/home/yocto/workspace/sdk-devel/build_p5020ds-64b_release/tmp/work/ppc64e5500-fsl-linux/apr/1.4.6-r2/apr-1.4.6':
| configure:27181: error: cannot run test program while cross compiling

Signed-off-by: Zhenhua Luo <zhenhua.luo@freescale.com>
---
 meta/site/powerpc64-linux |    4 ++++
 1 file changed, 4 insertions(+)

diff --git a/meta/site/powerpc64-linux b/meta/site/powerpc64-linux
index 2b147d7..d64e230 100644
--- a/meta/site/powerpc64-linux
+++ b/meta/site/powerpc64-linux
@@ -33,3 +33,7 @@ screen_cv_sys_terminfo_used=${screen_cv_sys_terminfo_used=yes}
 
 # libpcap
 ac_cv_linux_vers=${ac_cv_linux_vers=2}
+
+# apr
+apr_cv_tcp_nodelay_with_cork=${apr_cv_tcp_nodelay_with_cork=yes}
+
-- 
1.7.9.5



