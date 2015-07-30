Return-Path: <B54851@freescale.com>
Received: from na01-by2-obe.outbound.protection.outlook.com
	(mail-by2on0109.outbound.protection.outlook.com [207.46.100.109])
	by mail.openembedded.org (Postfix) with ESMTP id 6FFEF763CE
	for <openembedded-core@lists.openembedded.org>;
	Thu, 30 Jul 2015 10:04:24 +0000 (UTC)
Received: from DM2PR03CA0039.namprd03.prod.outlook.com (10.141.96.38) by
	CY1PR0301MB1179.namprd03.prod.outlook.com (10.160.165.22) with
	Microsoft SMTP
	Server (TLS) id 15.1.225.19; Thu, 30 Jul 2015 10:04:25 +0000
Received: from BY2FFO11FD028.protection.gbl (2a01:111:f400:7c0c::126) by
	DM2PR03CA0039.outlook.office365.com (2a01:111:e400:2428::38) with
	Microsoft SMTP Server (TLS) id 15.1.225.19 via Frontend Transport;
	Thu, 30 Jul 2015 10:04:24 +0000
Authentication-Results: spf=fail (sender IP is 192.88.168.50)
	smtp.mailfrom=freescale.com; freescale.mail.onmicrosoft.com; dkim=none
	(message not signed) header.d=none;
Received-SPF: Fail (protection.outlook.com: domain of freescale.com does not
	designate 192.88.168.50 as permitted sender)
	receiver=protection.outlook.com; 
	client-ip=192.88.168.50; helo=tx30smr01.am.freescale.net;
Received: from tx30smr01.am.freescale.net (192.88.168.50) by
	BY2FFO11FD028.mail.protection.outlook.com (10.1.15.217) with Microsoft
	SMTP Server (TLS) id 15.1.231.11 via Frontend Transport;
	Thu, 30 Jul 2015 10:04:23 +0000
Received: from carol-OptiPlex-3020.ap.freescale.net
	(carol-OptiPlex-3020.ap.freescale.net [10.192.241.17])
	by tx30smr01.am.freescale.net (8.14.3/8.14.0) with ESMTP id
	t6UA4Dki028536; Thu, 30 Jul 2015 03:04:21 -0700
From: Yuqing Zhu <b54851@freescale.com>
To: <openembedded-core@lists.openembedded.org>
Date: Fri, 31 Jul 2015 02:03:55 +0800
Message-ID: <1438279435-16336-4-git-send-email-b54851@freescale.com>
X-Mailer: git-send-email 1.9.1
In-Reply-To: <1438279435-16336-1-git-send-email-b54851@freescale.com>
References: <1438279435-16336-1-git-send-email-b54851@freescale.com>
X-EOPAttributedMessage: 0
X-Microsoft-Exchange-Diagnostics: 1; BY2FFO11FD028;
	1:f+IzXYTxcIicvQNJm1ZMBNjg4PqG5I54vplbiHkI0YB+I/5GkAhSUleP1geh1xkZQwFGSFWPU+yZXiIhCeiDyiX5pf7jvJhi9JcSE0yqRplg9fselBMOkWIXbbw27e0ZPi80KMwXyeW0uXxhz1AHtQxiJ3sZL/U9465gzEEHDVLwKdfrtJz2SPSVIOyKbQ8hizLPOp4/PkOFbOE5Ki+9ZSpLXf5RfZLJcXNv55YOL438V03wM30prxQw3rL+CZpswUHDFXJ6qf51duCks57wxdH3cOdYvzOEz5wyuegXwAys9Z6p8e/sslJJgIwD+XyKvDeZJOUlGJcZHDPFwudGsg==
X-Forefront-Antispam-Report: CIP:192.88.168.50; CTRY:US; IPV:NLI; EFV:NLI;
	SFV:NSPM;
	SFS:(10019020)(6009001)(2980300002)(339900001)(199003)(189002)(105606002)(36756003)(46102003)(19580405001)(19580395003)(15975445007)(2950100001)(230783001)(48376002)(77096005)(33646002)(5001960100002)(47776003)(110136002)(76176999)(2351001)(106466001)(229853001)(92566002)(87936001)(50226001)(107886002)(104016003)(77156002)(62966003)(189998001)(6806004)(85426001)(86362001)(50466002)(575784001)(50986999)(4001430100001);
	DIR:OUT; SFP:1102; SCL:1; SRVR:CY1PR0301MB1179;
	H:tx30smr01.am.freescale.net; FPR:; SPF:Fail; MLV:sfv; A:1; MX:1;
	LANG:en; 
MIME-Version: 1.0
X-Microsoft-Exchange-Diagnostics: 1; CY1PR0301MB1179;
	2:7nHDgedMzqXof0Zk5OKYIKWq/fxVx0Il7FSBejm38eNa419xh3QOQyW2QQ2ZuYhliUkHHWWEUXEAvMVG/n57LreYSV9XoTfPIDljiMTwlRu5sF9G/tn0FcU2EhnLuf2Hcyo0AnxQF0HAD4W2X6Oh31a1pRHOA7+yfotWsOnVVYA=;
	3:hwBFESJlIugE6Phkg/Neg2sSyFD+bhG1CWjh3Dvuzjf4ahhXzaJsdV2wsel6yN97jhc0JbEBpo6Q9zDBcg375FpoFhQkncS6qYurekOpyupjGJVTx7gnKOSKIQmRALnqU2AuY911pfIx8DrMVuRntRtSxZ+lJaQKhjIKmUcudfXkvfpH/U/hlJphCOC6tNOyAb889GNd1vz6dYePHK1VgzZ0vCzkiTg7sA5fjxt4wuA=;
	25:flOZwroW3DGib8INzrLVJEjIi2Y6T4MX5jnq1tcGfFzA/do6uyfs1/nV5TD3WFSR5dnWLcF0S6yOEMVgal17S9ykV1SPWaCQC0cz4aTgON0xwebvxwIS2SlNKFOcr6WEhClzjn+sZfuft6IA+JlejHfjFqtbhLLVc9Eo1ai/peZURoPCTA6pp61I2MhtBX9LKSL5Ik7LCOhKE+l17Pgk/z1Lkqzae5dvBjJrKxRAIvF2CqlVFMaXjcW56/iapVfpgt2CvRkecvAiYOeYT7C5Cg==
X-Microsoft-Antispam: UriScan:;BCL:0;PCL:0;RULEID:;SRVR:CY1PR0301MB1179;
X-Microsoft-Exchange-Diagnostics: 1; CY1PR0301MB1179;
	20:TqUVnAXz8BywAJuyRCkoW22jiGQPKX/FcUQ/AKixgu62e1C7yHHfkt9XEABNqzUj8VV9Bn3OX9KT+2SOJj1tmL2yXqbvSh2xF3hIGEbNPZhLJK/4QY1pppcAlOwFEy2TXajmsX39L2wcxEewBTlDcPnxrTC+Qv3DB4kR7PKcgIGh2+ggwS1qOsT1wW5bsf5mtRC58OMA3mJaKXSp35icWxzwEzEyjWtZYZHmcQQ4G/shOmw6mwSNDHFkMSD4oIcad33dAApiIjEvdAAkkWWFqAefJC54516LRKHSI2X6xbA7Rn74F1kIFJQuRe+KSVzMQ9FIp/QSAI/hsCyD/6QmiDgimo9SLnmvzYYJYOC1Xf4=;
	4:bCFe3qDl6N+LSq7k7cgNe26fQzha6xfXHZeirIqShJ/Z21P5oroFHXRdo45MecxjDLf/8Owcw+Vt3d8Q4f/+YDZPMqCmiow1geC9MrVFF2MJ9e/c95SFErcID4sZbK4Ca+6ipXCfoLGGMVa3HwbQaQXekXAAtoOliEA7uFl0D9j87dQXxu+z2E+H1vhCVRCGS7f4U1qQc8x0zwErnkh7dncQdzl7eT25TvJYaqpgKqUvtK4J/n3eQrmzH8mbkddQ+ZgtaODxs1MgwAvpK3tirFnwi9xPP+JImfYiY7+dHZI=
CY1PR0301MB1179: X-MS-Exchange-Organization-RulesExecuted
X-Microsoft-Antispam-PRVS: <CY1PR0301MB1179D445E1F3F8F1A14135C7868B0@CY1PR0301MB1179.namprd03.prod.outlook.com>
X-Exchange-Antispam-Report-Test: UriScan:;
X-Exchange-Antispam-Report-CFA-Test: BCL:0; PCL:0;
	RULEID:(601004)(5005006)(3002001); SRVR:CY1PR0301MB1179; BCL:0;
	PCL:0; RULEID:; SRVR:CY1PR0301MB1179; 
X-Forefront-PRVS: 06530126A4
X-Microsoft-Exchange-Diagnostics: =?us-ascii?Q?1; CY1PR0301MB1179;
	23:g4/CfHpL0oqEJY10O5AVjeA09MOXyNRbT8l+37b?=
	=?us-ascii?Q?pWLa99HWQNaYrvG63SEx2l20+49FDOQ+iEL2dggeJ7dXdB8TmGk0bOylEXoX?=
	=?us-ascii?Q?UShhasQ8ISoAU2pmRCoH+I6T+Vb/T1JwbNh1AJcvk6I6q+V8xXlWDATqmOW7?=
	=?us-ascii?Q?twlFVgUEmyz+6xE4ni4PcUMWt7faHtWHU4MKJ0DBSrvB4Q49xrxt55/Bsuk7?=
	=?us-ascii?Q?CdqbxCbDu+O3ksqPZlgmuUALUITo1V80VFmkHpfVJ6jOLYjxZO3hmyL46gWp?=
	=?us-ascii?Q?3isGemcGE1l3YMkWpkmhDhFxvSMqMamV2eZhfjNkZYIZ8yb4KgCl1yJHzsg1?=
	=?us-ascii?Q?v/Pn1+/FKxY6BnV268644hsz02bINhbn8CyJ1wtQowsFnqZEZmsZ0IkcOTvP?=
	=?us-ascii?Q?i51y62ZZBH+eWO6WMgkAp1rdohN6/2lqetydmhGBIkVnwACyiMLa31MUO5gj?=
	=?us-ascii?Q?JLLPjJCgs/Z402ISPLi2sp/bZTiTI+5KS2vnnywrY0DmPAAYswICIsRhUjO1?=
	=?us-ascii?Q?/jMI/SBufFofizbB6cbJf3TGDtY/rIyC/E68UKRa5kyKddAJWO6yhcvVjign?=
	=?us-ascii?Q?ZyjQssSQzo4XxxpThLwu9QtgJI/78mv0QHrKd4TgNjMc1voDQCEqec//Uu2f?=
	=?us-ascii?Q?mRtUR2ygbot6zWbNJok4ti/mPSx+8gHUOX69/uGDQS1lv1vB+lrpe+YGhxFZ?=
	=?us-ascii?Q?wEXdaMzXgGiNdO+LRp+uitWIeJ/rGwHRCRcs+xjw3IRJ34fjuqbBUpO+rJQU?=
	=?us-ascii?Q?fGuTH1quv+r1eSgvCiFTpIOcCdNHw/7TJDH4pgVoJFe8rW/r43SeN60nubRR?=
	=?us-ascii?Q?Lnhi16r86ryA101IEzhGGjVzwRPU33zEQBHml7IMCJyAIzxkimFbkVgqdose?=
	=?us-ascii?Q?qguiG74DsKs+p2WT66bbRfrTnXL+FeSsqof9efwgvs0hvW/hSMQ1Hy+ShDOd?=
	=?us-ascii?Q?77qJI8+gvFrAl9EZvvPWRXXRoDJWmquotqKTmVZg6Bpm99Gz/IiVX6YLDSey?=
	=?us-ascii?Q?a7E917FGiz8DZWpFvyktVf0uA?=
X-Microsoft-Exchange-Diagnostics: 1; CY1PR0301MB1179;
	5:iTlDFEmVGW5tZ2SCrQ4bXafPhgHE2O3UWPjVwumA0AQWpo/gpkE13tFHspNJGVRz4EgHaeMJgiitMaFEnwYSFe7oo4dld2KgzCNU4yeZM2di3t9woSWuERDYygyg5SAJ2MMDVhVNHrfyhPWVOwBbBw==;
	24:LwTOV5MtqM6uOtl3toWQEgF0c1uFPBn+59vFbtPknLl7Elgmb7TcLm1q7aKr0DaDbzjOPwGPD1/qAKhdbwcAGdkUWpLLFWR+hBEWLT5M9eg=;
	20:qBlI5GMvyjcpJId/5mJo0Gwn8N1DdimEVfT652nSL3Fz5TIlSHjYNxBK4SHWc9kMsTvHWPsl0fcueByD+OcbrA==
X-OriginatorOrg: freescale.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 30 Jul 2015 10:04:23.5881 (UTC)
X-MS-Exchange-CrossTenant-Id: 710a03f5-10f6-4d38-9ff4-a80b81da590d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=710a03f5-10f6-4d38-9ff4-a80b81da590d;
	Ip=[192.88.168.50]; Helo=[tx30smr01.am.freescale.net]
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CY1PR0301MB1179
Subject: [poky][PATCH v5 3/3] gstreamer1.0-plugins-base: Add gstplaysink related patch
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
X-List-Received-Date: Thu, 30 Jul 2015 10:04:25 -0000
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


