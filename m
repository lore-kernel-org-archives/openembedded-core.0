Return-Path: <B50113@freescale.com>
X-Greylist: delayed 1984 seconds by postgrey-1.34 at layers.openembedded.org;
	Mon, 29 Dec 2014 09:47:52 UTC
Received: from na01-bl2-obe.outbound.protection.outlook.com
	(mail-bl2on0116.outbound.protection.outlook.com [65.55.169.116])
	by mail.openembedded.org (Postfix) with ESMTP id 6080E72647
	for <openembedded-core@lists.openembedded.org>;
	Mon, 29 Dec 2014 09:47:52 +0000 (UTC)
Received: from BN3PR0301CA0053.namprd03.prod.outlook.com (25.160.152.149) by
	CY1PR0301MB1257.namprd03.prod.outlook.com (25.161.212.155) with
	Microsoft
	SMTP Server (TLS) id 15.1.49.12; Mon, 29 Dec 2014 09:14:46 +0000
Received: from BN1AFFO11FD056.protection.gbl (2a01:111:f400:7c10::146) by
	BN3PR0301CA0053.outlook.office365.com (2a01:111:e400:401e::21) with
	Microsoft
	SMTP Server (TLS) id 15.1.49.12 via Frontend Transport; Mon, 29 Dec 2014
	09:14:46 +0000
Received: from tx30smr01.am.freescale.net (192.88.168.50) by
	BN1AFFO11FD056.mail.protection.outlook.com (10.58.53.71) with Microsoft
	SMTP Server (TLS) id 15.1.49.13 via Frontend Transport;
	Mon, 29 Dec 2014 09:14:45 +0000
Received: from b50113.ap.freescale.net (b50113.ap.freescale.net
	[10.192.241.89])
	by tx30smr01.am.freescale.net (8.14.3/8.14.0) with ESMTP id
	sBT9Egfe012453; Mon, 29 Dec 2014 02:14:43 -0700
From: Zidan Wang <b50113@freescale.com>
To: <openembedded-core@lists.openembedded.org>
Date: Mon, 29 Dec 2014 17:15:42 +0800
Message-ID: <1419844544-10137-1-git-send-email-b50113@freescale.com>
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
	SFS:(10019020)(6009001)(339900001)(199003)(189002)(50986999)(36756003)(120916001)(4396001)(97736003)(48376002)(31966008)(110136001)(92566001)(84676001)(89996001)(2351001)(99396003)(104016003)(21056001)(106466001)(46102003)(86362001)(87936001)(85426001)(6806004)(77156002)(47776003)(62966003)(20776003)(64706001)(50226001)(105606002)(107046002)(50466002)(450100001)(68736005)(77096005)(229853001)(33646002)(42262002);
	DIR:OUT; SFP:1102; SCL:1; SRVR:CY1PR0301MB1257;
	H:tx30smr01.am.freescale.net; FPR:; SPF:Fail; MLV:sfv;
	PTR:InfoDomainNonexistent; A:1; MX:1; LANG:en; 
MIME-Version: 1.0
X-DmarcAction: None
X-Microsoft-Antispam: UriScan:;
X-Microsoft-Antispam: BCL:0;PCL:0;RULEID:(3005003);SRVR:CY1PR0301MB1257;
X-Exchange-Antispam-Report-Test: UriScan:;
X-Exchange-Antispam-Report-CFA-Test: BCL:0; PCL:0; RULEID:(601004);
	SRVR:CY1PR0301MB1257; 
X-Forefront-PRVS: 0440AC9990
X-Exchange-Antispam-Report-CFA-Test: BCL:0; PCL:0; RULEID:;
	SRVR:CY1PR0301MB1257; 
X-OriginatorOrg: freescale.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 29 Dec 2014 09:14:45.7859 (UTC)
X-MS-Exchange-CrossTenant-Id: 710a03f5-10f6-4d38-9ff4-a80b81da590d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=710a03f5-10f6-4d38-9ff4-a80b81da590d;
	Ip=[192.88.168.50]
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CY1PR0301MB1257
Subject: [PATCH 0/2] Add patches for gstreamer1.4
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
X-List-Received-Date: Mon, 29 Dec 2014 09:47:53 -0000
Content-Type: text/plain

Add patches to gstreamer1.0-plugins-base and gstreamer1.0-plugins-good.

Zidan Wang (2):
  gstreamer1.0-plugins-base: Add
    taglist-not-send-to-down-stream-if-all-the-frame-cor.patch
  gstreamer1.0-plugins-good: Add decrease_asteriskh263_rank.patch

 ...-send-to-down-stream-if-all-the-frame-cor.patch | 57 ++++++++++++++++++++++
 .../gstreamer/gstreamer1.0-plugins-base_1.4.1.bb   |  1 +
 .../decrease_asteriskh263_rank.patch               | 25 ++++++++++
 .../gstreamer/gstreamer1.0-plugins-good_1.4.1.bb   |  1 +
 4 files changed, 84 insertions(+)
 create mode 100755 meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-base/taglist-not-send-to-down-stream-if-all-the-frame-cor.patch
 create mode 100755 meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-good/decrease_asteriskh263_rank.patch

-- 
1.9.1


