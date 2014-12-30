Return-Path: <B50113@freescale.com>
Received: from na01-bl2-obe.outbound.protection.outlook.com
	(mail-bl2on0135.outbound.protection.outlook.com [65.55.169.135])
	by mail.openembedded.org (Postfix) with ESMTP id 38844713F1
	for <openembedded-core@lists.openembedded.org>;
	Tue, 30 Dec 2014 02:54:57 +0000 (UTC)
Received: from BY2PR03CA005.namprd03.prod.outlook.com (10.255.93.22) by
	CY1PR0301MB1260.namprd03.prod.outlook.com (25.161.213.12) with
	Microsoft SMTP
	Server (TLS) id 15.1.49.12; Tue, 30 Dec 2014 02:54:55 +0000
Received: from BN1BFFO11FD030.protection.gbl (10.255.93.4) by
	BY2PR03CA005.outlook.office365.com (10.255.93.22) with Microsoft SMTP
	Server (TLS) id 15.1.49.12 via Frontend Transport;
	Tue, 30 Dec 2014 02:54:54 +0000
Received: from tx30smr01.am.freescale.net (192.88.168.50) by
	BN1BFFO11FD030.mail.protection.outlook.com (10.58.144.93) with
	Microsoft SMTP Server (TLS) id 15.1.49.13 via Frontend Transport;
	Tue, 30 Dec 2014 02:54:54 +0000
Received: from b50113.ap.freescale.net (b50113.ap.freescale.net
	[10.192.241.89])
	by tx30smr01.am.freescale.net (8.14.3/8.14.0) with ESMTP id
	sBU2spuJ009052; Mon, 29 Dec 2014 19:54:53 -0700
From: Zidan Wang <b50113@freescale.com>
To: <openembedded-core@lists.openembedded.org>
Date: Tue, 30 Dec 2014 10:55:51 +0800
Message-ID: <1419908153-18661-1-git-send-email-b50113@freescale.com>
X-Mailer: git-send-email 1.9.1
X-EOPAttributedMessage: 0
Received-SPF: Fail (protection.outlook.com: domain of freescale.com does not
	designate 192.88.168.50 as permitted sender)
	receiver=protection.outlook.com; 
	client-ip=192.88.168.50; helo=tx30smr01.am.freescale.net;
Authentication-Results: spf=fail (sender IP is 192.88.168.50)
	smtp.mailfrom=B50113@freescale.com; 
X-Forefront-Antispam-Report: CIP:192.88.168.50; CTRY:US; IPV:NLI; EFV:NLI;
	SFV:NSPM;
	SFS:(10019020)(6009001)(339900001)(189002)(199003)(77156002)(33646002)(99396003)(107046002)(77096005)(229853001)(46102003)(62966003)(68736005)(120916001)(36756003)(110136001)(6806004)(450100001)(106466001)(104016003)(2351001)(48376002)(84676001)(4396001)(87936001)(21056001)(64706001)(20776003)(89996001)(85426001)(86362001)(47776003)(105606002)(31966008)(50986999)(92566001)(50466002)(97736003)(50226001)(42262002);
	DIR:OUT; SFP:1102; SCL:1; SRVR:CY1PR0301MB1260;
	H:tx30smr01.am.freescale.net; FPR:; SPF:Fail; MLV:sfv;
	PTR:InfoDomainNonexistent; MX:1; A:1; LANG:en; 
MIME-Version: 1.0
X-Microsoft-Antispam: UriScan:;
X-Microsoft-Antispam: BCL:0;PCL:0;RULEID:;SRVR:CY1PR0301MB1260;
X-Forefront-PRVS: 04410E544A
X-OriginatorOrg: freescale.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 30 Dec 2014 02:54:54.4494 (UTC)
X-MS-Exchange-CrossTenant-Id: 710a03f5-10f6-4d38-9ff4-a80b81da590d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=710a03f5-10f6-4d38-9ff4-a80b81da590d;
	Ip=[192.88.168.50]
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CY1PR0301MB1260
Subject: [PATCH v2 0/2] Add two patches to gstreamer1.4
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
X-List-Received-Date: Tue, 30 Dec 2014 02:55:06 -0000
Content-Type: text/plain

Add patches to gstreamer1.0-plugins-base and gstreamer1.0-plugins-good.

Zidan Wang (2):
  gstreamer1.0-plugins-good: Decrease the rank as havn't this kind of
    decoder for asteriskh263
  gstreamer1.0-plugins-base: Taglist will not be sent to downstream if
    all the frame corrupted

 ...-send-to-down-stream-if-all-the-frame-cor.patch | 57 ++++++++++++++++++++++
 .../gstreamer/gstreamer1.0-plugins-base_1.4.1.bb   |  1 +
 .../decrease_asteriskh263_rank.patch               | 25 ++++++++++
 .../gstreamer/gstreamer1.0-plugins-good_1.4.1.bb   |  1 +
 4 files changed, 84 insertions(+)
 create mode 100755 meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-base/taglist-not-send-to-down-stream-if-all-the-frame-cor.patch
 create mode 100755 meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-good/decrease_asteriskh263_rank.patch

-- 
1.9.1


