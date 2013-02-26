Received: from va3ehsobe003.messaging.microsoft.com ([216.32.180.13]
	helo=va3outboundpool.messaging.microsoft.com)
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <B29882@freescale.com>) id 1UATk6-0006Bq-8n
	for openembedded-core@lists.openembedded.org;
	Wed, 27 Feb 2013 00:15:26 +0100
Received: from mail217-va3-R.bigfish.com (10.7.14.236) by
	VA3EHSOBE010.bigfish.com (10.7.40.12) with Microsoft SMTP Server id
	14.1.225.23; Tue, 26 Feb 2013 21:58:50 +0000
Received: from mail217-va3 (localhost [127.0.0.1])	by
	mail217-va3-R.bigfish.com (Postfix) with ESMTP id 8D1CAC00233	for
	<openembedded-core@lists.openembedded.org>;
	Tue, 26 Feb 2013 21:58:50 +0000 (UTC)
X-Forefront-Antispam-Report: CIP:70.37.183.190; KIP:(null); UIP:(null); IPV:NLI;
	H:mail.freescale.net; RD:none; EFVD:NLI
X-SpamScore: 3
X-BigFish: VS3(zzzz1f42h1ee6h1de0h1202h1e76h1d1ah1d2ah1082kzz8275bhz2dh2a8h668h839hd24he5bhf0ah1288h12a5h12a9h12bdh12e5h137ah139eh13b6h1441h1504h1537h162dh1631h1758h1898h18e1h1946h19b5h1155h)
Received: from mail217-va3 (localhost.localdomain [127.0.0.1]) by mail217-va3
	(MessageSwitch) id 1361915927635741_1147;
	Tue, 26 Feb 2013 21:58:47 +0000 (UTC)
Received: from VA3EHSMHS007.bigfish.com (unknown [10.7.14.253])	by
	mail217-va3.bigfish.com (Postfix) with ESMTP id 98E2AC0090	for
	<openembedded-core@lists.openembedded.org>;
	Tue, 26 Feb 2013 21:58:47 +0000 (UTC)
Received: from mail.freescale.net (70.37.183.190) by VA3EHSMHS007.bigfish.com
	(10.7.99.17) with Microsoft SMTP Server (TLS) id 14.1.225.23;
	Tue, 26 Feb 2013 21:58:46 +0000
Received: from tx30smr01.am.freescale.net (10.81.153.31) by
	039-SN1MMR1-005.039d.mgd.msft.net (10.84.1.17) with Microsoft SMTP
	Server (TLS) id 14.2.328.11; Tue, 26 Feb 2013 21:58:36 +0000
Received: from right.am.freescale.net (right.am.freescale.net [10.82.176.228])
	by tx30smr01.am.freescale.net (8.14.3/8.14.0) with ESMTP id
	r1QLwieq007813 for <openembedded-core@lists.openembedded.org>;
	Tue, 26 Feb 2013 14:58:45 -0700
From: Matthew McClintock <msm@freescale.com>
To: <openembedded-core@lists.openembedded.org>
Date: Tue, 26 Feb 2013 15:58:42 -0600
Message-ID: <1361915924-23046-2-git-send-email-msm@freescale.com>
X-Mailer: git-send-email 1.7.9.7
In-Reply-To: <1361915924-23046-1-git-send-email-msm@freescale.com>
References: <1361915924-23046-1-git-send-email-msm@freescale.com>
MIME-Version: 1.0
X-OriginatorOrg: freescale.com
Subject: [PATCH 2/4] gcc-common.inc: handle case where tune is not defined
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
X-List-Received-Date: Tue, 26 Feb 2013 23:15:26 -0000
Content-Type: text/plain

Signed-off-by: Matthew McClintock <msm@freescale.com>
---
 meta/recipes-devtools/gcc/gcc-common.inc |    2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta/recipes-devtools/gcc/gcc-common.inc b/meta/recipes-devtools/gcc/gcc-common.inc
index ad96989..6b61800 100644
--- a/meta/recipes-devtools/gcc/gcc-common.inc
+++ b/meta/recipes-devtools/gcc/gcc-common.inc
@@ -38,7 +38,7 @@ def get_gcc_multiarch_setting(bb, d):
 def get_tune_parameters(tune, d):
     availtunes = d.getVar('AVAILTUNES', True)
     if tune not in availtunes.split():
-        bb.error('The tune: %s is not one of the available tunes: %s', tune, availtunes)
+        bb.error('The tune: %s is not one of the available tunes: %s', tune or None, availtunes)
 
     localdata = bb.data.createCopy(d)
     override = ':tune-' + tune
-- 
1.7.9.7




