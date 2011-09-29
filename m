Received: from db3ehsobe002.messaging.microsoft.com ([213.199.154.140]
	helo=DB3EHSOBE002.bigfish.com)
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <B29882@freescale.com>) id 1R98RV-0000XM-9C
	for openembedded-core@lists.openembedded.org;
	Thu, 29 Sep 2011 06:41:53 +0200
Received: from mail34-db3-R.bigfish.com (10.3.81.242) by
	DB3EHSOBE002.bigfish.com (10.3.84.22) with Microsoft SMTP Server id
	14.1.225.22; Thu, 29 Sep 2011 04:21:19 +0000
Received: from mail34-db3 (localhost.localdomain [127.0.0.1])	by
	mail34-db3-R.bigfish.com (Postfix) with ESMTP id 6DA33FC8505	for
	<openembedded-core@lists.openembedded.org>;
	Thu, 29 Sep 2011 04:21:19 +0000 (UTC)
X-SpamScore: 3
X-BigFish: VS3(zzzz1202h1082kzz8275bhz2dh2a8h668h839h62h)
X-Spam-TCS-SCL: 1:0
X-Forefront-Antispam-Report: CIP:70.37.183.190; KIP:(null); UIP:(null);
	IPVD:NLI; H:mail.freescale.net; RD:none; EFVD:NLI
Received: from mail34-db3 (localhost.localdomain [127.0.0.1]) by mail34-db3
	(MessageSwitch) id 1317270079332491_19539;
	Thu, 29 Sep 2011 04:21:19 +0000 (UTC)
Received: from DB3EHSMHS014.bigfish.com (unknown [10.3.81.249])	by
	mail34-db3.bigfish.com (Postfix) with ESMTP id 47DBC4D005C	for
	<openembedded-core@lists.openembedded.org>;
	Thu, 29 Sep 2011 04:21:19 +0000 (UTC)
Received: from mail.freescale.net (70.37.183.190) by DB3EHSMHS014.bigfish.com
	(10.3.87.114) with Microsoft SMTP Server (TLS) id 14.1.225.22;
	Thu, 29 Sep 2011 04:21:15 +0000
Received: from az33smr01.freescale.net (10.64.34.199) by
	039-SN1MMR1-001.039d.mgd.msft.net (10.84.1.13) with Microsoft SMTP
	Server id 14.1.323.7; Wed, 28 Sep 2011 23:21:14 -0500
Received: from right.am.freescale.net (right.am.freescale.net [10.82.193.13])
	by az33smr01.freescale.net (8.13.1/8.13.0) with ESMTP id
	p8T4LAKw024559	for <openembedded-core@lists.openembedded.org>;
	Wed, 28 Sep 2011 23:21:13 -0500 (CDT)
From: Matthew McClintock <msm@freescale.com>
To: <openembedded-core@lists.openembedded.org>
Date: Wed, 28 Sep 2011 23:21:03 -0500
Message-ID: <1317270070-14250-9-git-send-email-msm@freescale.com>
X-Mailer: git-send-email 1.7.6.1
In-Reply-To: <1317270070-14250-1-git-send-email-msm@freescale.com>
References: <1317270070-14250-1-git-send-email-msm@freescale.com>
MIME-Version: 1.0
X-OriginatorOrg: freescale.com
Subject: [PATCH 09/16] Add autoconf cache for screen on powerpc64
X-BeenThere: openembedded-core@lists.openembedded.org
X-Mailman-Version: 2.1.11
Precedence: list
Reply-To: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
List-Id: Patches and discussions about the oe-core layer
	<openembedded-core.lists.openembedded.org>
List-Unsubscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/options/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.linuxtogo.org/pipermail/openembedded-core>
List-Post: <mailto:openembedded-core@lists.openembedded.org>
List-Help: <mailto:openembedded-core-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Thu, 29 Sep 2011 04:41:53 -0000
Content-Type: text/plain

Screen can not run tests for the target and depends on the aotuconf
cache for information about the target system

Signed-off-by: Matthew McClintock <msm@freescale.com>
---
 meta/site/powerpc64-linux |   13 +++++++++++++
 1 files changed, 13 insertions(+), 0 deletions(-)

diff --git a/meta/site/powerpc64-linux b/meta/site/powerpc64-linux
index 9430ea1..a49c717 100644
--- a/meta/site/powerpc64-linux
+++ b/meta/site/powerpc64-linux
@@ -19,3 +19,16 @@ ac_cv_sizeof_unsigned_long_long_int=${ac_cv_sizeof_unsigned_long_long_int=8}
 ac_cv_sizeof_unsigned_short=${ac_cv_sizeof_unsigned_short=2}
 ac_cv_sizeof_unsigned_short_int=${ac_cv_sizeof_unsigned_short_int=2}
 ac_cv_sizeof_void_p=${ac_cv_sizeof_void_p=8}
+
+# screen
+screen_cv_sys_bcopy_overlap=${screen_cv_sys_bcopy_overlap=no}
+screen_cv_sys_memcpy_overlap=${screen_cv_sys_memcpy_overlap=no}
+screen_cv_sys_memmove_overlap=${screen_cv_sys_memmove_overlap=no}
+screen_cv_sys_fifo_broken_impl=${screen_cv_sys_fifo_broken_impl=yes}
+screen_cv_sys_fifo_usable=${screen_cv_sys_fifo_usable=yes}
+screen_cv_sys_select_broken_retval=${screen_cv_sys_select_broken_retval=no}
+screen_cv_sys_sockets_nofs=${screen_cv_sys_sockets_nofs=no}
+screen_cv_sys_sockets_usable=${screen_cv_sys_sockets_usable=yes}
+screen_cv_sys_terminfo_used=${screen_cv_sys_terminfo_used=yes}
+
+
-- 
1.7.6.1




