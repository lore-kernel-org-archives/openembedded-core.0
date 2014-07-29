Return-Path: <ting.liu@freescale.com>
Received: from na01-by2-obe.outbound.protection.outlook.com
	(mail-by2lp0236.outbound.protection.outlook.com [207.46.163.236])
	by mail.openembedded.org (Postfix) with ESMTP id 81D4E65D9B
	for <openembedded-core@lists.openembedded.org>;
	Tue, 29 Jul 2014 09:01:08 +0000 (UTC)
Received: from BY2PR03CA072.namprd03.prod.outlook.com (10.141.249.45) by
	BLUPR03MB151.namprd03.prod.outlook.com (10.255.212.25) with Microsoft
	SMTP Server (TLS) id 15.0.995.14; Tue, 29 Jul 2014 09:01:07 +0000
Received: from BN1AFFO11FD046.protection.gbl (2a01:111:f400:7c10::199) by
	BY2PR03CA072.outlook.office365.com (2a01:111:e400:2c5d::45) with
	Microsoft SMTP Server (TLS) id 15.0.995.14 via Frontend Transport;
	Tue, 29 Jul 2014 09:01:06 +0000
Received: from tx30smr01.am.freescale.net (192.88.168.50) by
	BN1AFFO11FD046.mail.protection.outlook.com (10.58.53.61) with Microsoft
	SMTP Server (TLS) id 15.0.990.10 via Frontend Transport;
	Tue, 29 Jul 2014 09:01:06 +0000
Received: from b28495.ap.freescale.net (b28495.ap.freescale.net [10.193.20.99])
	by tx30smr01.am.freescale.net (8.14.3/8.14.0) with ESMTP id
	s6T912bc013841; Tue, 29 Jul 2014 02:01:04 -0700
From: <ting.liu@freescale.com>
To: <openembedded-core@lists.openembedded.org>
Date: Tue, 29 Jul 2014 17:03:43 +0800
Message-ID: <1406624623-25774-1-git-send-email-ting.liu@freescale.com>
X-Mailer: git-send-email 1.7.3.4
X-EOPAttributedMessage: 0
X-Forefront-Antispam-Report: CIP:192.88.168.50; CTRY:US; IPV:CAL; IPV:NLI;
	EFV:NLI; SFV:NSPM;
	SFS:(6009001)(189002)(199002)(84676001)(88136002)(102836001)(85306003)(106466001)(92726001)(89996001)(104166001)(99396002)(68736004)(87286001)(87936001)(26826002)(92566001)(33646002)(50986999)(229853001)(105606002)(107046002)(21056001)(110136001)(104016003)(79102001)(95666004)(2351001)(85852003)(97736001)(48376002)(50226001)(6806004)(36756003)(77982001)(46102001)(76482001)(4396001)(83322001)(81342001)(74502001)(80022001)(20776003)(93916002)(81542001)(31966008)(83072002)(86152002)(62966002)(86362001)(50466002)(77156001)(64706001)(44976005)(19580405001)(19580395003)(74662001)(47776003);
	DIR:OUT; SFP:; SCL:1; SRVR:BLUPR03MB151;
	H:tx30smr01.am.freescale.net; FPR:; MLV:ovrnspm;
	PTR:InfoDomainNonexistent; MX:1; LANG:en; 
MIME-Version: 1.0
X-Microsoft-Antispam: BCL:0;PCL:0;RULEID:
X-Forefront-PRVS: 0287BBA78D
Received-SPF: Fail (protection.outlook.com: domain of freescale.com does not
	designate 192.88.168.50 as permitted sender)
	receiver=protection.outlook.com; 
	client-ip=192.88.168.50; helo=tx30smr01.am.freescale.net;
Authentication-Results: spf=fail (sender IP is 192.88.168.50)
	smtp.mailfrom=ting.liu@freescale.com; 
X-OriginatorOrg: freescale.com
Subject: [PATCH] base-files: set dynamic COLUMNS via resize command
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
X-List-Received-Date: Tue, 29 Jul 2014 09:01:08 -0000
Content-Type: text/plain

From: Ting Liu <ting.liu@freescale.com>

By default, COLUMNS is set to 80. If possible, run 'resize' to
determine what the current dimensions are. This avoids the final
part of long lines overlap the start of the same line.

Signed-off-by: Ting Liu <ting.liu@freescale.com>
---
 meta/recipes-core/base-files/base-files/profile |    4 ++++
 1 files changed, 4 insertions(+), 0 deletions(-)

diff --git a/meta/recipes-core/base-files/base-files/profile b/meta/recipes-core/base-files/base-files/profile
index 0b2d9d7..88ab8d8 100644
--- a/meta/recipes-core/base-files/base-files/profile
+++ b/meta/recipes-core/base-files/base-files/profile
@@ -26,6 +26,10 @@ if [ -d /etc/profile.d ]; then
   unset i
 fi
 
+if [ -x /usr/bin/resize ];then
+  /usr/bin/resize >/dev/null
+fi
+
 export PATH PS1 OPIEDIR QPEDIR QTDIR EDITOR TERM
 
 umask 022
-- 
1.7.3.4


