Return-Path: <B54851@freescale.com>
Received: from na01-bn1-obe.outbound.protection.outlook.com
	(mail-bn1bn0105.outbound.protection.outlook.com [157.56.110.105])
	by mail.openembedded.org (Postfix) with ESMTP id EA34B601F7
	for <openembedded-core@lists.openembedded.org>;
	Wed, 29 Jul 2015 10:26:00 +0000 (UTC)
Received: from CH1PR03CA010.namprd03.prod.outlook.com (10.255.156.155) by
	CY1PR0301MB1177.namprd03.prod.outlook.com (10.160.165.20) with
	Microsoft SMTP
	Server (TLS) id 15.1.225.19; Wed, 29 Jul 2015 10:25:59 +0000
Received: from BL2FFO11OLC007.protection.gbl (10.255.156.132) by
	CH1PR03CA010.outlook.office365.com (10.255.156.155) with Microsoft SMTP
	Server (TLS) id 15.1.201.16 via Frontend Transport;
	Wed, 29 Jul 2015 10:25:59 +0000
Authentication-Results: spf=fail (sender IP is 192.88.168.50)
	smtp.mailfrom=freescale.com; freescale.mail.onmicrosoft.com; dkim=none
	(message not signed) header.d=none;
Received-SPF: Fail (protection.outlook.com: domain of freescale.com does not
	designate 192.88.168.50 as permitted sender)
	receiver=protection.outlook.com; 
	client-ip=192.88.168.50; helo=tx30smr01.am.freescale.net;
Received: from tx30smr01.am.freescale.net (192.88.168.50) by
	BL2FFO11OLC007.mail.protection.outlook.com (10.173.160.142) with
	Microsoft SMTP Server (TLS) id 15.1.231.11 via Frontend Transport;
	Wed, 29 Jul 2015 10:25:59 +0000
Received: from carol-OptiPlex-3020.ap.freescale.net
	(carol-OptiPlex-3020.ap.freescale.net [10.192.241.17])
	by tx30smr01.am.freescale.net (8.14.3/8.14.0) with ESMTP id
	t6TAPtZK004765; Wed, 29 Jul 2015 03:25:57 -0700
From: Yuqing Zhu <b54851@freescale.com>
To: <openembedded-core@lists.openembedded.org>
Date: Thu, 30 Jul 2015 02:25:34 +0800
Message-ID: <1438194339-13618-1-git-send-email-b54851@freescale.com>
X-Mailer: git-send-email 1.9.1
X-EOPAttributedMessage: 0
X-Microsoft-Exchange-Diagnostics: 1; BL2FFO11OLC007;
	1:iwhBXiQPfctcHvroLnw7wwOH6swGUZQp2k11/CeKjLAwosBdGHjM/REVZGLNfN6KtX3QAYBxNk5Kp0tdt00ua1y8IxwZLjAyzBY1y11YeQ73TJ2QlL9XIEscJSv5+8XGCXHnjmQhR5RGwL/Gmbmyp06r0dc3TZ8VskuV2rm63bQgDhTaDCg6fX+FEXqU669PepBgS71i/NO6Esc7vHZszYwPDI1DXrjhYO73NrnJGSVOXjuUZAIFBaNuuOixwuImtbK2sHVGtdfkHe8OK+na2T7yOalwNbHwBwcuFUu4M66YDABr2FyGnmfxLYTYt8m2nVDoDvhv7sASt8MwbtdwMQ==
X-Forefront-Antispam-Report: CIP:192.88.168.50; CTRY:US; IPV:NLI; EFV:NLI;
	SFV:NSPM;
	SFS:(10019020)(6009001)(2980300002)(339900001)(189002)(199003)(86362001)(87936001)(85426001)(105606002)(46102003)(50226001)(50466002)(230783001)(48376002)(6806004)(47776003)(50986999)(36756003)(104016003)(33646002)(77096005)(92566002)(189998001)(77156002)(62966003)(110136002)(5001960100002)(107886002)(2351001)(5001920100001)(229853001)(4001430100001);
	DIR:OUT; SFP:1102; SCL:1; SRVR:CY1PR0301MB1177;
	H:tx30smr01.am.freescale.net; FPR:; SPF:Fail; MLV:sfv; MX:1; A:1;
	LANG:en; 
MIME-Version: 1.0
X-Microsoft-Exchange-Diagnostics: 1; CY1PR0301MB1177;
	2:J21R/DfzKO12OtsIqs0A7C3mS+zv5xd64IxghjN1WhvBf7x34smvPfFkAIOj1Ib2hJ3f/XXYv335XoQF+RoodNeRD06zy5BzBzCquitJCtbLo2bJ2cY7y91kY15LXgiaZ/9gZDEszj84bbrWHpivjqACEm1shpW/ta7tikE4OPQ=;
	3:J2FgC6gOTywZdwKa4oJbfEtk1lfcJMjIcvEiluKNSM59dEU8vr75nHXNT4G+KSGw6QwtRBkIdsepcDQaa/j3vJd/zGRTh92DgQDFrmxi8gUMYseIA5nk9KgGkC8Ar3vmihusetfxHaZDxEVeK1dmdi7CJG1VrZ+E03TeUxXGr0MpvLShW5I8p7wWNsztzJ6voegjlL/rH4Imd0RG7SR0Ogk4UciLre7+eta9NcZdVf4=;
	25:w631X4gaEReqq1rvjht4qo0n7rKRTva2JsOIUO6dWZywuRJrWZPWWc1nCWthzzzulX861E+kjs+ZOHpje2l3q74jr1+ZWj3XR9lJBZ/Ok0kXE/5CMKs7EaBl7IGLS8LsWCS2URQJc6krJS+dhV0tNpp0u/O9PoZV7z8asCVQCiPn0rlU1l48I6L1UTWTKmM6b7BYfNXbFnmgL+i4SP5yS8FZWTxGgmn3LozvgG1qzIJYANN7ajyeuRETLckq/F5k
X-Microsoft-Antispam: UriScan:;BCL:0;PCL:0;RULEID:;SRVR:CY1PR0301MB1177;
X-Microsoft-Exchange-Diagnostics: 1; CY1PR0301MB1177;
	20:bhgDNRISCdkYMKLWc8NjbJcVJ+zn9d3ABE+5eLhrMYdaBAKrJFsoBong18IGTm+y+xma/R9tCyCyN6Ig48zOQh0HkSl+e7JUed99arQMJ7wHXACefVBZN0OTxazGCUbD3hnrIc94u7ZECxK40CMnqh3weSNgts02f9bdXBOIlYKmK9NyHkzrWLHWYtH+idhhH0bCRJN8EJAbUdqABcT6k5TjH4603EQYj6ww8vPj6leHU43A+PfnLxjFULRjdNB2jUMLxvTRkkTMSENQTr9gULDQVWig9KJp1TLo3dw2/IspM0tQdSqmlbKTpA/ZR9XiSBDm4uSRyFZ7iACqpYI3mPYjOMN9ZuJBveBR1//SiZM=;
	4:JlEaIcUzFpIlVeZLBtp1b4FLd0SHJnI1u+vWL4kwGlbxao+IV0sJn+Jb8A52sfUweKKzx0/R0Cu3+7q/i0WvUntVcjuASCfqYgtfO9ANDgjCuetMawqKJp1VVeGTEFlsMq5hkKiqUUCAcsRYwcRpAVOIRAd3VTmPEZoPijdKbjdePB5Me1+qk6AXRGE3TAgMOk+l+Cv9i/bn6hm14vfvYXfTD2Mpa3595B+pQ7sfzkgl8aKrCAJIS5VEsg2ePS70kaTCafke9Ojs1R/IrFIktpPLrUYLfxt+Uh9WIIGUpYY=
X-Microsoft-Antispam-PRVS: <CY1PR0301MB1177972A5F847D6E20591005868C0@CY1PR0301MB1177.namprd03.prod.outlook.com>
X-Exchange-Antispam-Report-Test: UriScan:;
X-Exchange-Antispam-Report-CFA-Test: BCL:0; PCL:0;
	RULEID:(601004)(5005006)(3002001); SRVR:CY1PR0301MB1177; BCL:0;
	PCL:0; RULEID:; SRVR:CY1PR0301MB1177; 
X-Forefront-PRVS: 0652EA5565
X-Microsoft-Exchange-Diagnostics: 1; CY1PR0301MB1177;
	23:D75I3T+6/AhX9Rox1kApBwmm4GRH+JELxiNeZxXSQ1AsJ1wJpVSFoARsA6btsRDYE5mq4RzsaQCKp3rbjUGh1eYqtXAgjDkB7CVc9rouRej8iaiLu35S6np82UpfLr40uIaSaQyzCHhT4EP3wxJZ2qMIr7niudlUUsRl7yQgIMmomiR9CAcG+huo/80FnNluTJ7u2CIaJb0LZb/J2A6kAlKrYL4OuX/qk7ijL+KSqoG88JfqGEu2C5JaeEEDnYSsUXf3mV8jcDBTw+mEg1WdVpHJgeYu2/Thp+swXfC+5y85N1drK6R/oKZXvKzQG0y+dPusVrZjOLUJPzi9XuHM7A5qArX57QLAZulpjUjawvBlTL4E4rMMcGSMJq2DZ4cA2xKl2iNkdye3b3DPnfpcQsESXJ2XU+Le3Ivavomrc1RX+JaJd7XotN+Y9J9QeTCx3evtLLbvjla8afY+oceXQ0DZXdL4ws/4gFYOguNuVXSzzbYVcEmigsGoRdP/GWb8SRLikmYq7ohMtDir/8t7LxPk20ZGQPTAkmHIPM+iOVnrHf2OoY0Ub4hKQjx6fTn6Mb7MxYPMSiPv0fSgnF6nbxmLYCG53rU6ACsREE3bZqc2F1l1weY3i3rtHDYkArshUv4YA5dcgT+3afFFEv33kuwR9t3VRWj0Xd8wDcZu9hPs7B8qmefXBKqS4WMrvlUuz+jSUY4s4sKk8gG4a1gq6QLpjTyluZ0UO3r7GaJu6fPUGuoLKMdcx75uP7zIeZN7X6OisFH1R75COpFIewvPNbG5Yrllz+mQcXc4313a1cyBlumqwvjiIDHzPJFlD+G0/VNs5olVMy/xEEQZi0Rtvv+/3GkAo/VagSOgnJ+AgqY=
X-Microsoft-Exchange-Diagnostics: 1; CY1PR0301MB1177;
	5:r5ULTwsnufP8jv6d/Lu6Bw9FeZYEQ7BosFnpZ8EvMT58U37Z9YIZwA0dAVQbw7wJSXgR3aIz3hlGvhjZsFG4TQwWxusdb0Qa6oP4V0X1FwmsciDBgvdymB1gp9kBk89+hst7f5kxht7rLORDFiXoXg==;
	24:sZdn21mn90t3siTwgsll4y/gp/sznC0SkQOH2180B7rTHXzqac0bxS6rIRTLWxkw7SOAUmKlGB0sCd4CHDWassRxePtzNcne+fmmpt7yQBM=;
	20:VhMMYP69hUYgDbrwwVwntoQqjwcPBkUsovmNWnzEvb8+rODWGH1W/KTkeu7N0qpi39x++rSgz51GP2jFUYdxiw==
X-OriginatorOrg: freescale.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 29 Jul 2015 10:25:59.0350 (UTC)
X-MS-Exchange-CrossTenant-Id: 710a03f5-10f6-4d38-9ff4-a80b81da590d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=710a03f5-10f6-4d38-9ff4-a80b81da590d;
	Ip=[192.88.168.50]; Helo=[tx30smr01.am.freescale.net]
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CY1PR0301MB1177
Subject: [poky][PATCH v4 0/5] gstreamer1.0-plugins-base: Add patches for Gstreamer 1.4.5 base
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
X-List-Received-Date: Wed, 29 Jul 2015 10:26:01 -0000
Content-Type: text/plain

Fix id3demux issue

Handle audio/video decoder error

Update video alignment after video alignment

Gstvideofilter use new GST_VIDEO_FRAME_MAP_FLAG_NO_REF
Add GST_VIDEO_FRAME_MAP_FLAG_NO_REF, keeping buffer writable
Don't ref buffers twice when mapping

Keep sticky events around when doing a soft reset

Yuqing Zhu (5):
  gstreamer1.0-plugins-base: Bug fix for id3demux issue
  gstreamer1.0-plugins-base: handle audio/video decoder error
  gstreamer1.0-plugins-base: update video alignment after video
    alignment
  gstreamer1.0-plugins-base: Add GST_VIDEO_FRAME_MAP_FLAG_NO_REF related
    patch
  gstreamer1.0-plugins-base: Add videoencoder related patch

 ...rame-Don-t-ref-buffers-twice-when-mapping.patch | 26 +++++++
 ...frame-Add-GST_VIDEO_FRAME_MAP_FLAG_NO_REF.patch | 87 ++++++++++++++++++++++
 ...r-Use-new-GST_VIDEO_FRAME_MAP_FLAG_NO_REF.patch | 69 +++++++++++++++++
 .../fix-id3demux-utf16-to-utf8-issue.patch         | 54 ++++++++++++++
 .../handle-audio-video-decoder-error.patch         | 64 ++++++++++++++++
 .../videobuffer_updata_alignment_update.patch      | 53 +++++++++++++
 ...p-sticky-events-around-when-doing-a-soft-.patch | 46 ++++++++++++
 .../gstreamer/gstreamer1.0-plugins-base_1.4.5.bb   |  7 ++
 8 files changed, 406 insertions(+)
 create mode 100644 meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-base/0001-video-frame-Don-t-ref-buffers-twice-when-mapping.patch
 create mode 100644 meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-base/0002-video-frame-Add-GST_VIDEO_FRAME_MAP_FLAG_NO_REF.patch
 create mode 100644 meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-base/0003-videofilter-Use-new-GST_VIDEO_FRAME_MAP_FLAG_NO_REF.patch
 create mode 100755 meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-base/fix-id3demux-utf16-to-utf8-issue.patch
 create mode 100755 meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-base/handle-audio-video-decoder-error.patch
 create mode 100755 meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-base/videobuffer_updata_alignment_update.patch
 create mode 100644 meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-base/videoencoder-Keep-sticky-events-around-when-doing-a-soft-.patch

-- 
1.9.1


