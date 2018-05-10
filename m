Return-Path: <prvs=661f1634c=Alistair.Francis@wdc.com>
Received: from esa6.hgst.iphmx.com (esa6.hgst.iphmx.com [216.71.154.45])
	by mail.openembedded.org (Postfix) with ESMTP id 333757531A
	for <openembedded-core@lists.openembedded.org>;
	Thu, 10 May 2018 21:31:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
	d=wdc.com; i=@wdc.com; q=dns/txt; s=dkim.wdc.com;
	t=1525987883; x=1557523883;
	h=from:to:cc:subject:date:message-id:mime-version;
	bh=FbHVDMFBBDs/83VTzfxxubIJowcmrL490acDMgu63Ys=;
	b=BkiVS3C+y093b3ZI+aOTzxWYrrJnXV0QoIYCDmS+WWqlRVSMOmKCM8L9
	9CJfFFDBQzw9ycDVhC6+UH0dZ52GLtgwzGoQWv4sRPXeOucMWpDVgq+po
	gpBdNXnOQzP1MmRd6YckZdTJo+A4Fce+mkn7wzLAvXa4NSALn97A/Rtvi
	jclsHnw0DCgVbGf3c64zm4ot7mOhPrBRGGUKeQ5TKt1f2I/x3D5N3KRJK
	lo/aFPa2mPhc0d4W4KzPNARWGuJURHDgfyH9ypWww7Nnb58UDaqycP94B
	R1NZCK1OjPrJ7eDSCZU3HMqHT5tRaxi1aSKw6AGMOLy/MNAy6JcNWl9Vd A==;
X-IronPort-AV: E=Sophos;i="5.49,386,1520870400"; d="scan'208";a="78568671"
Received: from mail-dm3nam03lp0018.outbound.protection.outlook.com (HELO
	NAM03-DM3-obe.outbound.protection.outlook.com) ([207.46.163.18])
	by ob1.hgst.iphmx.com with ESMTP; 11 May 2018 05:31:22 +0800
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=sharedspace.onmicrosoft.com; s=selector1-wdc-com;
	h=From:Date:Subject:Message-ID:Content-Type:MIME-Version;
	bh=EXUB6dq5LKpVnmYciEkOlABo1uMAKVT631UTHQ4CPOE=;
	b=OEXZiDwWLhzGu38S9wDm2jAAif+LIJzKUX9V+ZFiH6UgyRbdzN9oLKbDOUBfk/XQerBsqzzDmSmMz3XHT25+nVyG24larQtvlvrQxn2wro+bXNre93VizUJaeRRbNv2xDtvJSb1BfctU4GzRqyhmft2l4jOBRZczwPFDbZFXvco=
Authentication-Results: spf=none (sender IP is )
	smtp.mailfrom=Alistair.Francis@wdc.com; 
Received: from risc6-mainframe.int.fusionio.com (199.255.44.171) by
	BN6PR04MB0402.namprd04.prod.outlook.com (2603:10b6:404:91::19) with
	Microsoft SMTP Server (version=TLS1_2,
	cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
	15.20.755.16; Thu, 10 May 2018 21:31:19 +0000
From: Alistair Francis <alistair.francis@wdc.com>
To: openembedded-core@lists.openembedded.org
Date: Thu, 10 May 2018 14:30:58 -0700
Message-Id: <20180510213058.68614-1-alistair.francis@wdc.com>
X-Mailer: git-send-email 2.17.0
MIME-Version: 1.0
X-Originating-IP: [199.255.44.171]
X-ClientProxiedBy: CO2PR07CA0077.namprd07.prod.outlook.com (2603:10b6:100::45)
	To BN6PR04MB0402.namprd04.prod.outlook.com
	(2603:10b6:404:91::19)
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-HT: Tenant
X-Microsoft-Antispam: UriScan:; BCL:0; PCL:0;
	RULEID:(7020095)(4652020)(4534165)(4627221)(201703031133081)(201702281549075)(5600026)(48565401081)(2017052603328)(7153060)(7193020);
	SRVR:BN6PR04MB0402; 
X-Microsoft-Exchange-Diagnostics: 1; BN6PR04MB0402;
	3:4g0/IOxgpmwRQr3cfXssBpjHVzydbQY/ANHe6aRu1BJJ71LrA16LjG5qnX/ogNPC2whz3GX1LEnFkBlVLpnmtp5Y3p5t1m3bi+YuVs44aebrBiGa+4Jr1lScUlfyKqvD1QP2zgOA3Ae/sSTGMQ6FTHZP0lcMU0B2Z6LyDD1uFN56Tbgw+FuZwGuGJwK1lRiSbnNC7hQ1dcfGBA02QDEsGwKeb8PWWNYcYK2JE5HDuTc1wnsR7ciCsPuuSaUDf/ws;
	25:osKBiKhT3AZarnVTk5iNv5CRVuxUU1bFKLORRgtkS6mzl0AN5j9B+Fb/fPoDHPpsvRt/omejE9t2mSXzLcswUk3MN0+5HDHRndywpswwzFoJl5WA0g74G3Kefbpt/aFEDgVlls6eXbyMX3Is5buOMTPSWtX/b0DJ/670CXNCoVc3VLkRS5JAFS0XpoQZXw9DlXR1964sj71J1T/nieDL3DqG5bOvk79/ZHc5pcRFCpLuFEdvdqmr6R0QxeNnSwXtfv8ebIhBzjagaeed/J4++Usmg2daLviRajJZskdFlRFARaGrmqF9QlwfTyXjnwkAyHgk5t/N0q5y8CXyGnus0Q==;
	31:rpcRyHqLcThcTkIKEwoRI7NIZM3usI7YrA+UWO3b+7uP64cgWWuHpPi1YIbStVuo6H2RAIcXK/KcJt7nlEPkAteB+bzuwXd5880P4ypCKBzIUJw0ph/LsqD+mYpchnfFcxdQEf9ShQCcXl4oeAqpYU679x59unwnqM7AzcCuvbrEtIXV3Oyv99nCzZPXD4xHLPcEHwQ9ybINRsWTahfGEm1DCPEPXCPtX8GR7Oc7u1E=
X-MS-TrafficTypeDiagnostic: BN6PR04MB0402:
WDCIPOUTBOUND: EOP-TRUE
X-Microsoft-Exchange-Diagnostics: 1; BN6PR04MB0402;
	20:kRtl/q2ynyw1Igb701TWsW0UkLIAJdtmpeqTZn/afuYeHbLuQLboKbC9ST7hnwPXRp6chgaHLu8RNXdCjn98yG+jtck8ZwoAARJIBLZvsyvwKZHfZTZcMu7gKWmr7RfJaXs7Js8L3H4NXeAARKmCNT/npLdCPaowuKM5rYUXW0Bd1UoxGWPQTuu5zfYms5Aur8WbZG7ce4qUrJXVoY06K/uvhrzLOppz0AUCE1pGta1jdxGZexTVdJNG/8cl8rKKDgKdCzb+zU75rnbxQidfU7KdG/qB5DpvsabduZo6j7al0DiFw9iKZO9VMgRu9qT19YfV1PeEM/yUEIRZ9FPc+woWEbxsF8l+bQ6qtOdt0phr7WcEFlTEzvTTJgJPWcN4SfkU7bPB9BP8fKdrZ9trHeGVfqR4MQQ0h2Tm5fBtYMpSfxEWylqWrIsoNMz7GczdDQAbWI0WFasDDPJNgPoNFMDFDJZTrzzjtAidM8hb1DUZgx65wdlH7vk7M/JYpLBd;
	4:z2nlmirnS/JSo4sBg952OzPa7lRXpMDL3KZZNVEqUBiARkrcT5f82ehAQB/ZtoHYeQYzTQBeCMFslcYNE1awR06N/C21HYBrcCLTU9WWk+Kf5rXEs9s91H/sBBtXFgUeTWCHuvHWBIn81eDjov7l0vWK0cGMS3JEsH85P7883glq/ufjz17k+JWJCh6mx0zG7wsu0VNqDyyKaAHg9OOXU0J6h5Skl1s503mX/DXntb7McgHbIPe/Wd0ZyrxoK4LtCAcVgsc1Ish2NYdsVtCebQ==
X-Microsoft-Antispam-PRVS: <BN6PR04MB0402FC3C6C00BDD7B123669C90980@BN6PR04MB0402.namprd04.prod.outlook.com>
X-Exchange-Antispam-Report-Test: UriScan:;
X-MS-Exchange-SenderADCheck: 1
X-Exchange-Antispam-Report-CFA-Test: BCL:0; PCL:0;
	RULEID:(6040522)(2401047)(8121501046)(5005006)(93006095)(93001095)(3002001)(10201501046)(3231254)(944501410)(52105095)(6055026)(149027)(150027)(6041310)(20161123560045)(20161123564045)(20161123562045)(20161123558120)(201703131423095)(201702281528075)(20161123555045)(201703061421075)(201703061406153)(6072148)(201708071742011);
	SRVR:BN6PR04MB0402; BCL:0; PCL:0; RULEID:; SRVR:BN6PR04MB0402; 
X-Forefront-PRVS: 066898046A
X-Forefront-Antispam-Report: SFV:NSPM;
	SFS:(10019020)(39860400002)(376002)(39380400002)(396003)(346002)(366004)(189003)(199004)(16586007)(50466002)(72206003)(386003)(6486002)(47776003)(575784001)(486006)(16526019)(86362001)(44832011)(68736007)(5660300001)(6666003)(476003)(2616005)(956004)(4326008)(186003)(51416003)(2906002)(8936002)(39060400002)(478600001)(53936002)(6506007)(26005)(25786009)(52116002)(6512007)(6916009)(105586002)(305945005)(36756003)(7736002)(6116002)(106356001)(3846002)(1076002)(50226002)(97736004)(81156014)(81166006)(66066001)(8676002)(1857600001)(316002)(2351001)(2361001)(48376002);
	DIR:OUT; SFP:1102; SCL:1; SRVR:BN6PR04MB0402;
	H:risc6-mainframe.int.fusionio.com; FPR:; SPF:None; LANG:en;
	PTR:InfoNoRecords; MX:1; A:1; 
X-Microsoft-Exchange-Diagnostics: =?us-ascii?Q?1; BN6PR04MB0402;
	23:wfjgzJIdRwLZWMwbVlXHQVdBxevwpZRsvdfM7CJec?=
	=?us-ascii?Q?IgH/MI3oRqw2sJHfHHcfCHww3hmrHwVk6UflA2Zk6G9UWAskJoaNvYJF34YU?=
	=?us-ascii?Q?74fmOE/CvvxkZsJ+r7dyemPIGC/whgWIDQ+KKGM0ECCML5FjWX1ELa0bon9x?=
	=?us-ascii?Q?TZr1P+r0HW5UCpKMbORC9DW3TrzpEz2v4a+LBiTB/zOt5LLshDOcft+VtzZ2?=
	=?us-ascii?Q?OBW68E16LasUlRhH36D+k3w1xzgIpMgCAg5GzgTzq9I9XRTcSXvdxBIzprlI?=
	=?us-ascii?Q?0IU7s2oWzgeToi8+CiGBARVCNqw1Auha/uUC5BaO4CUcStWNR9SV3qBjh+Gc?=
	=?us-ascii?Q?sWf94/6NQXiXWjEJcimL/gEJw0VBX0YBJDtB60AE1Z6ceMyhIgo5FKEybFTk?=
	=?us-ascii?Q?wgE/areTsVmG2YuEBUGX0mNFll6XPTNOzIv8TTuYH67cf4UFOk8VFuWpr9Tj?=
	=?us-ascii?Q?Zbdg/zhJWm/mxc9edaB/suDxwFFlq3ENewA9eImWi1WnPJXjTM9HVjn5S+Qb?=
	=?us-ascii?Q?9ikoqqSJbhLI1rhriqWkE2sZ6lkE9zaHTpp8nvefBTPE71aZBvOkSwi+Q+tf?=
	=?us-ascii?Q?19duh2/o/JvRDvCQ6pVTsN40F5/IN1eGATPtimPr/b8TAmcr2dNRheWsPS1v?=
	=?us-ascii?Q?jPhBLQSAHslAMVyCeNqWnvwvKp1WTSRIFPxukFmhCC8LqP7xebeDRU4GNT3m?=
	=?us-ascii?Q?iKDUk+WXzA+iyjRrCVUuYfsd8h7E+NPL7nepXwDCXvBNsofb3pjCa0nEIPj3?=
	=?us-ascii?Q?wQ+rQhSJKU6oIImNPVirHpduSYHAOYfIlcKzgCyx4WCk967xsp1uMZoKmNpQ?=
	=?us-ascii?Q?9njX4FqTmuOUElfW6uLe2In4be0kywCI8QWWBFZF0Yb5xzJifEcIDI8l4Uef?=
	=?us-ascii?Q?N6/XGuYavuIDQP38hmp5ZuUZQCQtHCsl7q1ldDuzyXSFZl2Rr+9pgqxSNxzC?=
	=?us-ascii?Q?GrIG3YLGeVvR1DZSRc4yeTqwVEBEOEx/GqpLRXuPPLkTV3eemzM/0do0G43C?=
	=?us-ascii?Q?LNdhBIkgzCV86p8xrnxTY2PTyyFjmeQW0Dt+NA0dy1WxLQWxWDVJYOt6t552?=
	=?us-ascii?Q?G7Or8z86V30c7AP4+ReZe3k6lZY5EWi7HAO49Q6OMhR3+GkjRHIpy0Ye88Kc?=
	=?us-ascii?Q?Ovj3p5T/2VvVlLrkLkS31KANHYw0O4bo6lWhSD/H911Q/yBXnkKEdF1zXxB9?=
	=?us-ascii?Q?ctibLw5dZcku3y39EDVm2edEFzsKMkpj7b+MxV2h/mB25QrbzcKykn2czGEi?=
	=?us-ascii?Q?9kysNdu3VtbEOmL/wp6lQCM66BMFQ45yrc01x5SVxxyHLrGAHO8Ub/+i0MVN?=
	=?us-ascii?B?QT09?=
X-Microsoft-Antispam-Message-Info: Ydzz+5oivf4ZBqwp4QnpAYWMuwPO0cWHKwoi6sOsPP7mTUKMBAUgLdB2MBYTkRy/qEG/8Sjg20lc0gOrvqsIl+xfkhNNbrU3LYEV0VrkY33U3G2fC9lAb1P3/soIfb1HvW4K20juvc8b+M0W36XwqaqUCpIb1zvFcOcXhYbA7Pv9+ix6LnIdQc2HRj2KTjht
X-Microsoft-Exchange-Diagnostics: 1; BN6PR04MB0402;
	6:CX4D/l98mcVzwWBWfBlrejvg+ehOV0r7d3148R7DHoMirTakmTB45a/OtGy18b41L7t+y8FYvkqLIooxk7YAMtJvjYolf89Gk/5I/g430qbWlhDV4r+VsPpoBFK37zeeTVbXuxSj0U6s+iqq7EQ1eC7wSekUHCHGlTplZYS0AyNPw0dwX1HT7tGy2FjaUqOx1p/vWBsig3eO+FtFYpOCw05DtUmz5yty2RvY6C+Rv3cnrWDCLV7qT43WjGK8g1++/2OaPcKsuqjXRyMBrvbNM2X9Xu5Fw7poy71rhVlW8sj3yoADEDcTZVbS/1zYTe2AqDP5x5IpXqJAAY2mLdfWE2A0iFqyHiEaCignywJRtu3evszNB4iDO0Du/d53CicB0SI8HbLn6ROtq3xdvhO7Ey1YVXmbK82Ck0CerzAd1xALpVLwoKqU5K9jiV6y/TjSsyy0zmcz4RznTG8s9mRImA==;
	5:r9/0VEDQ3F/s2vcXAL8CrZLFMW9YmiQ3XAI5M8R3AEI0spor9v+D31sbJuFiN9QAAX0t+katMFqZesIQPllOC5NBvpDVUOhovQnIY/HWrdrAWChseYbpDtSq7a5/NZrv+sTWQih6+c+VSpc2wBnTMkR6Pqc/cL7bIY3+q7jJLZo=;
	24:hPCHoEpA64z3aiGeOFBHwX5Wes17TtOgLOlHFBrrLTqJo4tfF1Thyhizklb2CNG5QBs9xM0TPBTJ4Kbj1nyilfuA+BgNbiCKVlRxsyOdQw4=
SpamDiagnosticOutput: 1:99
SpamDiagnosticMetadata: NSPM
X-Microsoft-Exchange-Diagnostics: 1; BN6PR04MB0402;
	7:qowEnDcTlpGjbcIrd0HNcoMl+ocylzDgSdVXYc1q/jDYzfSNmMdDUdoNI7haiG0idw851CtMRCrtYehakS1XeeDIsrbmoNe6y/h0vl39K7lX2yR7r73NkSaZjS+BOKBv5w0utdFy72QvM3yiS+Wsk7YM1QdF/Uvr+rGOpWEm38sQ71ZMlGv5xQzPwdDbhUF6e01fwfEvwtcsJpzY7R5V7mDpQPXqjVztE+/Aqjm9ld+hql7IWs/k9GVJop7fqofE;
	20:FbqrO5eKdub8lPgvRNB9FoXBXsmjxDwSZaMcWo0XslZGxhSsghFF0V7e3VcRQ5hUn95S+HbydcBWgaszAcMYNAM68IvREaUyzIdAFY1L7ZptK7TBBBLDfIkdMIafy16dNWcHXzfBcUHMisIv8FH+aVwndAdcP2rtWq5OfvR9Qag=
X-MS-Office365-Filtering-Correlation-Id: 61b269f5-1c84-4376-b962-08d5b6bd5f10
X-OriginatorOrg: wdc.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 10 May 2018 21:31:19.6053 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 61b269f5-1c84-4376-b962-08d5b6bd5f10
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: b61c8803-16f3-4c35-9b17-6f65f441df86
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BN6PR04MB0402
Subject: [PATCH] recipes-graphics/libsdl2: Add native and nativesdk support
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
X-List-Received-Date: Thu, 10 May 2018 21:31:21 -0000
Content-Type: text/plain

Allow building libsdl2 for native and nativesdk. This is required to use
libsdl2 in QEMU.

Signed-off-by: Alistair Francis <alistair.francis@wdc.com>
---
 meta/recipes-graphics/libsdl2/libsdl2_2.0.8.bb | 7 +++++++
 1 file changed, 7 insertions(+)

diff --git a/meta/recipes-graphics/libsdl2/libsdl2_2.0.8.bb b/meta/recipes-graphics/libsdl2/libsdl2_2.0.8.bb
index c0cf70d7fd..36508ec349 100644
--- a/meta/recipes-graphics/libsdl2/libsdl2_2.0.8.bb
+++ b/meta/recipes-graphics/libsdl2/libsdl2_2.0.8.bb
@@ -42,6 +42,11 @@ PACKAGECONFIG ??= " \
     ${@bb.utils.filter('DISTRO_FEATURES', 'alsa directfb pulseaudio x11', d)} \
     ${@bb.utils.contains('DISTRO_FEATURES', 'wayland', 'wayland gles2', '', d)} \
 "
+PACKAGECONFIG_class-native = "${PACKAGECONFIG_GL} x11"
+PACKAGECONFIG_class-nativesdk = "${PACKAGECONFIG_GL} \
+                                 ${@bb.utils.filter('DISTRO_FEATURES', 'x11', d)} \
+"
+
 PACKAGECONFIG[alsa]       = "--enable-alsa --disable-alsatest,--disable-alsa,alsa-lib,"
 PACKAGECONFIG[directfb]   = "--enable-video-directfb,--disable-video-directfb,directfb"
 PACKAGECONFIG[gles2]      = "--enable-video-opengles,--disable-video-opengles,virtual/libgles2"
@@ -63,3 +68,5 @@ do_configure_prepend() {
 }
 
 FILES_${PN}-dev += "${libdir}/cmake"
+
+BBCLASSEXTEND = "native nativesdk"
-- 
2.17.0


