Return-Path: <B54851@freescale.com>
Received: from na01-bn1-obe.outbound.protection.outlook.com
	(mail-bn1bbn0103.outbound.protection.outlook.com [157.56.111.103])
	by mail.openembedded.org (Postfix) with ESMTP id B27D47673C
	for <openembedded-core@lists.openembedded.org>;
	Fri,  7 Aug 2015 06:16:52 +0000 (UTC)
Received: from BN3PR0301CA0004.namprd03.prod.outlook.com (10.160.180.142) by
	BY1PR0301MB1174.namprd03.prod.outlook.com (10.160.195.145) with
	Microsoft
	SMTP Server (TLS) id 15.1.225.19; Fri, 7 Aug 2015 06:16:51 +0000
Received: from BY2FFO11FD037.protection.gbl (2a01:111:f400:7c0c::120) by
	BN3PR0301CA0004.outlook.office365.com (2a01:111:e400:4000::14) with
	Microsoft
	SMTP Server (TLS) id 15.1.225.19 via Frontend Transport; Fri, 7 Aug 2015
	06:16:50 +0000
Authentication-Results: spf=fail (sender IP is 192.88.158.2)
	smtp.mailfrom=freescale.com; freescale.mail.onmicrosoft.com; dkim=none
	(message not signed) header.d=none;
Received-SPF: Fail (protection.outlook.com: domain of freescale.com does not
	designate 192.88.158.2 as permitted sender)
	receiver=protection.outlook.com; 
	client-ip=192.88.158.2; helo=az84smr01.freescale.net;
Received: from az84smr01.freescale.net (192.88.158.2) by
	BY2FFO11FD037.mail.protection.outlook.com (10.1.14.222) with Microsoft
	SMTP Server (TLS) id 15.1.243.9 via Frontend Transport;
	Fri, 7 Aug 2015 06:16:50 +0000
Received: from carol-OptiPlex-3020.ap.freescale.net
	(carol-OptiPlex-3020.ap.freescale.net [10.192.241.17])
	by az84smr01.freescale.net (8.14.3/8.14.0) with ESMTP id t776GVN4028512;
	Thu, 6 Aug 2015 23:16:48 -0700
From: Yuqing Zhu <b54851@freescale.com>
To: <openembedded-core@lists.openembedded.org>
Date: Fri, 7 Aug 2015 14:16:40 +0800
Message-ID: <1438928203-12256-9-git-send-email-b54851@freescale.com>
X-Mailer: git-send-email 1.9.1
In-Reply-To: <1438928203-12256-1-git-send-email-b54851@freescale.com>
References: <1438928203-12256-1-git-send-email-b54851@freescale.com>
X-EOPAttributedMessage: 0
X-Microsoft-Exchange-Diagnostics: 1; BY2FFO11FD037;
	1:qlVhh7CK/10jT8JCczWEHi31fLbsq7TaPB6haDYxv1b8LyVbanwKq0If+MeTdH7YVRXmuS9G/yP8keFVj8mTtwIGA/RgHDh6htyA0pgSUaRNqbrB/LtEHOU35kdzyNpvnPiJ1uKXmQdsir6X9Z3ilIhCXOkXFUncTEgL/eZDvDgyRn6Q3XUYl7Zjz8cx/QQJLD6mwrMX//1hVk+rtr6vToigEjmnEUqYKA5C8Ed/Z9P0/4LQNmmBpr+Y4G6lYLAe5UK5GDTqPXbuuHWg5qw+27Jb7ct10ojWeKeGY0MjlXmSOWIALmyxOFtxrtjR19SNlGhoQTavUV0fxdHZFrWYPQ==
X-Forefront-Antispam-Report: CIP:192.88.158.2; CTRY:US; IPV:NLI; EFV:NLI;
	SFV:NSPM;
	SFS:(10019020)(6009001)(2980300002)(339900001)(189002)(199003)(87936001)(107886002)(5003940100001)(5001830100001)(189998001)(5001960100002)(5001860100001)(229853001)(2351001)(110136002)(50466002)(62966003)(36756003)(2950100001)(68736005)(77156002)(81156007)(15975445007)(77096005)(97736004)(4001540100001)(92566002)(6806004)(69596002)(85426001)(230783001)(33646002)(19580395003)(50986999)(76176999)(50226001)(105606002)(106466001)(19580405001)(104016003)(46102003)(575784001)(47776003)(86362001)(64706001)(48376002)(4001430100001);
	DIR:OUT; SFP:1102; SCL:1; SRVR:BY1PR0301MB1174;
	H:az84smr01.freescale.net; FPR:; SPF:Fail;
	PTR:InfoDomainNonexistent; MX:1; A:1; LANG:en; 
MIME-Version: 1.0
X-Microsoft-Exchange-Diagnostics: 1; BY1PR0301MB1174;
	2:aQfpXhRQYK7eMF0y4dUijFv4TgfE1gmgp3ab8S4TsdJwbu8WJ759XuV4w5+ONRoHjwyb4IInIFAa1H9/2U2pOPdGwT3hgdikBOMFdJhMSQNe1hL41wRgjcqchU1lHboxgGBu0WVXhC4Q8Vi2Qs/ueiZwjLtsxyZavZz0c7k8hvg=;
	3:NAOjiWut+aG//J0sy7w2uFNy75WMnf/LuVCnBvt7+SYYHSg8+OXBPLy7O0D+LDNV/BGDPGNymSay1tnU3/fCmFcxHaltaMuh89MbVdx+95GT2kLOHDmEdwss+gICOPtjWTZUNUcUqLay8waiu9aCH+wVya7Fs6avBwBMFyVW7Yi31SQwfYdoa81x72B/ASTkiFZCvAkDs3Kh4GSXPqmdva/6E0FhNOEfcLJlwH1Rwss=;
	25:Rf61tEwaqL5Qh7WVK6R53wujgITufOC1q1bB5K0XjE39M0ocKFdJLyKX3X9vNB2rhKt+NuRtqJRbYT59TuE9VRnQLOjYElanV9vSrTQ6jEIyCh64Ob5bT8MVLio7cAStuhV8AdK9T8I6OR3sFVVQtwABDfJuhFZVzmjavfeZHS7sjZBfZ2ltSwRuW6dRbxJPMYwKsacxdSYscfvvOunQQlgiK5U/scaMiT0jAmhQIDr82tGZioHdJBT6qijr9baGHN1jv/zaiPOys4EmSsGCtw==
X-Microsoft-Antispam: UriScan:;BCL:0;PCL:0;RULEID:;SRVR:BY1PR0301MB1174;
X-Microsoft-Exchange-Diagnostics: 1; BY1PR0301MB1174;
	20:25uvl2uJc+XlHkJekce1agwCr/3RZONcRJS8WH1OICAK96OS4mAYPstZprv9cwqablhRHL4Yk+yb2aass2RFxY5Wa8FoqPTmsX6gixOoGpNOZEvTCnE8sjBHW0oAs0m/t6BkdEKrqL/Jcy008IAN6RMD7G1Rg6YQ4WGn4lfuQK+LdZl/MeSW1Iyzjuh96JP8pTDdPbkz+LnofrAkuLr7NjBG4uZEld5LQ2ZnmnSmw+z8T+xskKsdoHFydDsJhx66ckUm2ldsBr4v4/9DlPKLdEZ8ywpqrNWlNEFFYPMgUTwIEXGzX4TjZmXXfFFwWKd+EMFN8c+l+wMPbybOolNUp5uCKDdWRl5isJl/5QS1djE=;
	4:4XCqWMA++0BGyRkdrtYFTUB20oSU1ek8tTqLDJo9BDo0G0R9creTMfbti6AkojXuA8beEB3A0pN2bny5BNzNRIqoB1Rai8C+/XIc5p/KXCgiRxsb57SD9kigU2SVTNhTdY5cYrbVAohkW6lu55w0jkJ1V51QS7EjZj/4E1w67Xw5puS0M28QGwwQfxcvOAFb0fzEsRAk4OUA3V25P/f2OBtCqEmmVwifUCSqjBS/IbCIE8y5YCX+rPE5Bl5DRkr86RwravHjbknaPOpu01k4DrwiNYiQAv5M/lAbd7/aQVo=
X-Microsoft-Antispam-PRVS: <BY1PR0301MB1174959AAAAC133DAAB1E40886730@BY1PR0301MB1174.namprd03.prod.outlook.com>
X-Exchange-Antispam-Report-Test: UriScan:;
X-Exchange-Antispam-Report-CFA-Test: BCL:0; PCL:0;
	RULEID:(601004)(5005006)(3002001); SRVR:BY1PR0301MB1174; BCL:0;
	PCL:0; RULEID:; SRVR:BY1PR0301MB1174; 
X-Forefront-PRVS: 066153096A
X-Microsoft-Exchange-Diagnostics: =?us-ascii?Q?1; BY1PR0301MB1174;
	23:mGNRNdjqU3Je5TTnDb2OxDMDi1vdUDXqbrP7Udf?=
	=?us-ascii?Q?pBWbGkE1chRTXJfIR3htX9MksTkIUAn6OwVjC9AM75LAldtflc2eomPOkC6B?=
	=?us-ascii?Q?FXQYIqdq9eX0jIgUBbMh942p351ruq9aHO/TnCtcT/x7sbQ6+g8vPJUVvA3o?=
	=?us-ascii?Q?wUdQI5vxiQs1CwCDT6PHb9zick7mANlbaOVPuv/3oIy/EqeSKJr6oXHxVuOR?=
	=?us-ascii?Q?AVvTR8iNN3nLhfV+SAucbTGQM94IO1iL7BAq3G6+NK+lMicNARao1a4mRg7Z?=
	=?us-ascii?Q?0fzj6pYfLtikGGH05iFkwMHrBP+kQIRTAFF+VyyvyWvdhjN+aV/11naErDAi?=
	=?us-ascii?Q?SGiTVGPIGVQ971zVTDCqweof0SfIDwi2KyjVVBhBKqyBXcyqZTNYahpm23Bq?=
	=?us-ascii?Q?r4+O7Xv+dO25d+WzR3kZdQih2BUEsODFVj59B8K671P29rsLYV0RUNB5dPWV?=
	=?us-ascii?Q?z8oOBMSRU9MJBUljPNOZY7IC3z+weX0R39U5nq5UWn7YxM6Mk3XUXLY6kRfl?=
	=?us-ascii?Q?EMCxol0PVvjW6a6A/fJT58ow26kD6/yR7h0oLXI5Qn3VrBfHLbGOzUhW7XBp?=
	=?us-ascii?Q?kEgyCdEAbnWdYPBOVHfossz6RGafHQy9/gaR9EmDRzjHQ/UUJlxWlg/0aqtR?=
	=?us-ascii?Q?cmlWWxlaMXmms7pGELWxt1lvANf/+zGyLBnhg/dynaWecqdTCfJxhg+ysVTo?=
	=?us-ascii?Q?PmAEpq/3z1wYu0IjL1VBw2U8Gif0jBgfDhpsOPHEiAaZA4XtxKbgHUSXAhu9?=
	=?us-ascii?Q?Y6mw7EKZ6B9yYc2pVMEQ3mkvGTwMD0PMB8F79LQhZ/DgyuWp9qZPZTmFQE7F?=
	=?us-ascii?Q?8uW1JeHkVOJqEFhiSrUnWFbDRP1Ntej1NSIfuNv9Ll947WOfJe6SdEIQ+v8i?=
	=?us-ascii?Q?T1BFRPyNxZHwTdOIjsDUOwiOmgXnqFyZXFZwAqG9aJGewnFzNfLBbXIr9i4t?=
	=?us-ascii?Q?JDezYrApodB/mPYArLqpBgIEQRJasDqYQEXXHqbpgHUGeBWrllBK9jPN0h+L?=
	=?us-ascii?Q?Oi4alWHnHzVgbOtQ9NGv6cc53ADLNWX45On2P5/lC6LMqmN3HaYGcxYY7qa8?=
	=?us-ascii?Q?LBEDosSmDj7nDTJxL/XBoZ1ib2frh8qOOaYe1Jir3FuRgwqHzshu4d77WBlx?=
	=?us-ascii?Q?2ZwtaEQS00mRtqI7bgpbd96iUB4AQBR4YoP3HBGhgeb2GXBBn6h6FenQFJ2C?=
	=?us-ascii?Q?nkBw2C/qvm5X9Jgr30bLFyeiLi7Oc5jMbuXBUdrKVDOLlSHgjY8qlYEV+FbF?=
	=?us-ascii?Q?QZGObMSBbZLMHDCTguXI=3D?=
X-Microsoft-Exchange-Diagnostics: 1; BY1PR0301MB1174;
	5:NKeoXxzrejsuqA+7RFuzU5Zi+FD3RfES6AC26T5YcAUR8dYQgI0+gNDgFOlaCzpxbwV98uDEjja/+sKppOTaIc2aurY5wLkqglnBLAUJbRNMe+J3CGYQTd5jL05nteFZHWP4oH7dxM+bBNG7YJvBuA==;
	24:p3A1KZA8/PAQ5PjOeNXXnGadthl41aWkxPeOEPDIL3g/n6W1vaoEMfiM6IiIbneXf12LH4ogG+ulMB3JtW25rkM0mSMs3surx14kpnIsFwU=;
	20:7QOQ+FEezbFVHYrnRF2hGteTtnYeRrZ/LArJFwOiRbno5M37uiA0AwJFCNBOFvisPx7U4LN73tAW+biZMQHOig==
X-OriginatorOrg: freescale.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 07 Aug 2015 06:16:50.1562 (UTC)
X-MS-Exchange-CrossTenant-Id: 710a03f5-10f6-4d38-9ff4-a80b81da590d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=710a03f5-10f6-4d38-9ff4-a80b81da590d; Ip=[192.88.158.2];
	Helo=[az84smr01.freescale.net]
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BY1PR0301MB1174
Subject: [poky][PATCH v7 08/11] gstreamer1.0-plugins-base: Add gstplaysink related patch
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
X-List-Received-Date: Fri, 07 Aug 2015 06:16:53 -0000
Content-Type: text/plain

Don't set async of custom text-sink to false.
Setting async to false will lead A/V sync problem when seeking.
The preroll need to use GAP event instead of setting async to false.

Signed-off-by: Yuqing Zhu <b54851@freescale.com>
---
 ...-don-t-set-async-of-custom-text-sink-to-f.patch | 31 ++++++++++++++++++++++
 .../gstreamer/gstreamer1.0-plugins-base_1.4.5.bb   |  1 +
 2 files changed, 32 insertions(+)
 create mode 100644 meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-base/0002-gstplaysink-don-t-set-async-of-custom-text-sink-to-f.patch

diff --git a/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-base/0002-gstplaysink-don-t-set-async-of-custom-text-sink-to-f.patch b/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-base/0002-gstplaysink-don-t-set-async-of-custom-text-sink-to-f.patch
new file mode 100644
index 0000000..39c146a
--- /dev/null
+++ b/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-base/0002-gstplaysink-don-t-set-async-of-custom-text-sink-to-f.patch
@@ -0,0 +1,31 @@
+From 0a78555ea6c8c2f1ee27ee4707e8d7aa00ab7a66 Mon Sep 17 00:00:00 2001
+From: Mingke Wang <mingke.wang@freescale.com>
+Date: Thu, 19 Mar 2015 14:15:25 +0800
+Subject: [PATCH 2/4] gstplaysink: don't set async of custom text-sink to
+ false
+
+set async to false lead to A/V sync problem when seeking.
+the preroll need use GAP event instead of set async to false.
+
+Upstream-Status: Submitted [https://bugzilla.gnome.org/show_bug.cgi?id=747499]
+
+Signed-off-by: Mingke Wang <mingke.wang@freescale.com>
+
+diff --git a/gst/playback/gstplaysink.c b/gst/playback/gstplaysink.c
+old mode 100644
+new mode 100755
+index f5a2d42..fba0172
+--- a/gst/playback/gstplaysink.c
++++ b/gst/playback/gstplaysink.c
+@@ -2408,7 +2408,7 @@ gen_text_chain (GstPlaySink * playsink)
+           G_TYPE_BOOLEAN);
+       if (elem) {
+         /* make sure the sparse subtitles don't participate in the preroll */
+-        g_object_set (elem, "async", FALSE, NULL);
++        //g_object_set (elem, "async", FALSE, NULL);
+         GST_DEBUG_OBJECT (playsink, "adding custom text sink");
+         gst_bin_add (bin, chain->sink);
+         /* NOTE streamsynchronizer needs streams decoupled */
+-- 
+1.7.9.5
+
diff --git a/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-base_1.4.5.bb b/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-base_1.4.5.bb
index 7aba40d..8d926f3 100644
--- a/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-base_1.4.5.bb
+++ b/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-base_1.4.5.bb
@@ -18,6 +18,7 @@ SRC_URI += "file://do-not-change-eos-event-to-gap-event-if.patch \
             file://do-not-change-eos-event-to-gap-event2.patch \
             file://do-not-change-eos-event-to-gap-event3.patch \
             file://0001-basetextoverlay-make-memory-copy-when-video-buffer-s.patch \
+            file://0002-gstplaysink-don-t-set-async-of-custom-text-sink-to-f.patch \
 "
 
 SRC_URI[md5sum] = "357165af625c0ca353ab47c5d843920e"
-- 
1.9.1


