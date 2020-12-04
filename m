Received: from NAM10-MW2-obe.outbound.protection.outlook.com (NAM10-MW2-obe.outbound.protection.outlook.com [40.107.94.66])
 by mx.groups.io with SMTP id smtpd.web10.9497.1607053670447547301
 for <openembedded-core@lists.openembedded.org>;
 Thu, 03 Dec 2020 19:47:51 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@windriversystems.onmicrosoft.com header.s=selector2-windriversystems-onmicrosoft-com header.b=O21NV2ZZ;
 spf=pass (domain: windriver.com, ip: 40.107.94.66, mailfrom: li.wang@windriver.com)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=ItHqS8spawIKcsY9FfNLBd4P+fBooTgcSWilSscshf8KYD0b/DUVHtNIzCqQFJBDD7HeNiwNDCLRQ06G0dNb8Rpmimv7jSf1FKu1TXwN4efdptvueaDO/F34oTV+co9FuZtiu2zXeevqlPFTOq5aVRKMfiosrrXo/Kx4NoP39ekK3wZzqqCjS9Se3vHjcvfu09U4+oVLuXQ1HHl0f4pMxZ+qhTtWZOqQO9EzGlBcDVoNVwo1llaZgtyerBXlUh8h56NZuViooR1Mxd4HFJgQYf9lBngYmFArb0oLiGAOjzdNnRvsuHSeXlyqOPI31zL4s4bJTTXsW9hUm2egeqMy7g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=WAWKiIWC+g3R91ntGJJpPp4AulgTQMVdf81eoWatHXI=;
 b=bS3oZeeGtzsAtpN+Inw5B6oDgNorhTbtuGH10XYfdOh72I0nGlVrfxer4NLd1YYuaBnagzqvj+ftvyYUcyW/8dhpYhCyKCT3+vx8eKX99nTXiqI3iw2tLQ0b5fou92UGoxMsatfTdluD0rF+GGbt7h1zC8iTTqdlJEn08RflzV7HD0G+++ypYlCT7uwMPCAxYnBWWYd2IXRb8a0MVllcegUs6Jf/+Q+smUd9vIwfFJiN/pDlpxIqqDoEuBRM9bo1ukY+1kvu03T3c8xDH34JhR+BFaSNNfugTuylCTvi36y5rcV0gz6LshBMKyXdlTroXL6DqN0QuiA1lhlLHo/eZw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=windriver.com; dmarc=pass action=none
 header.from=windriver.com; dkim=pass header.d=windriver.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=windriversystems.onmicrosoft.com;
 s=selector2-windriversystems-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=WAWKiIWC+g3R91ntGJJpPp4AulgTQMVdf81eoWatHXI=;
 b=O21NV2ZZ+lEf12g8/jWT4tnjxBGqFqMuvIYdmeSMaFJjdePMSGEbfo6lJsTaY55LbC4sbt9f56Mjr1PcZxzAdTR58ui8wEtQOYYnBswDSo78eR+BCWVjxSNLtCMJl+YDOis/vf4RQ3CQ9COER0Za2ynPlaIiL04qt8fLC4VnkEQ=
Authentication-Results: lists.openembedded.org; dkim=none (message not signed)
 header.d=none;lists.openembedded.org; dmarc=none action=none
 header.from=windriver.com;
Received: from DM6PR11MB3595.namprd11.prod.outlook.com (2603:10b6:5:142::16)
 by DM6PR11MB4756.namprd11.prod.outlook.com (2603:10b6:5:2a7::16) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3611.23; Fri, 4 Dec
 2020 03:47:47 +0000
Received: from DM6PR11MB3595.namprd11.prod.outlook.com
 ([fe80::54c6:c8e4:c594:eada]) by DM6PR11MB3595.namprd11.prod.outlook.com
 ([fe80::54c6:c8e4:c594:eada%6]) with mapi id 15.20.3611.025; Fri, 4 Dec 2020
 03:47:47 +0000
From: "Li Wang" <li.wang@windriver.com>
To: openembedded-core@lists.openembedded.org
Subject: [OE-core][master][PATCH] qemu: CVE-2020-25723
Date: Fri,  4 Dec 2020 03:44:24 +0000
Message-Id: <20201204034424.24854-1-li.wang@windriver.com>
X-Mailer: git-send-email 2.17.1
X-Originating-IP: [60.247.85.82]
X-ClientProxiedBy: HK2PR04CA0079.apcprd04.prod.outlook.com
 (2603:1096:202:15::23) To DM6PR11MB3595.namprd11.prod.outlook.com
 (2603:10b6:5:142::16)
Return-Path: li.wang@windriver.com
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from bfbf5eb70dd2.wrs.com (60.247.85.82) by HK2PR04CA0079.apcprd04.prod.outlook.com (2603:1096:202:15::23) with Microsoft SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3632.17 via Frontend Transport; Fri, 4 Dec 2020 03:47:46 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 2e39a4bb-a88a-4dc5-19ed-08d898075d66
X-MS-TrafficTypeDiagnostic: DM6PR11MB4756:
X-Microsoft-Antispam-PRVS: 
	<DM6PR11MB475650D07145CE120DC15353EFF10@DM6PR11MB4756.namprd11.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:59;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 
	8rNBOrcLImL2HIqdcNpkURgfoPyXiZOP5QqFV8FvMpoKcITrOLyEZgXzqDHFd1ozRI0yyVuBqCUreOLvhvU3ODIGunCqwM80SDC+aW2/JWFn8j7ywerwf8wUTZYOGsBHbjtuoCuDANK63r02ukqxIKqYu4kQb66ktgQKRJvOBVrzAQ1Ebda1ENzlHTwPSIUXtg2I4aBctLZgsfupHLB92sE+iOTYrEHlw9jCCTSZEGqA/mShjyiHLpE+aeJScjid7LQZVU5CXc7F+ZtupzwwHWbsh3L82VF7ZHgRT7/LunHGG/lkt47ncpwl4/f1RSghJWISrN2v/z4PJ526I9BKDOr0+GR1OqlM3RY2PTHbkbxpKfU07Vg//wWxYIvoRBIPeZB91UAd7+3XXlN/zX/vqf7dAVtIk03A+2bO5weBXQLfgwW0GgUsaxxhghpmWELTKfFW5OM36F05RZDehj4eig==
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DM6PR11MB3595.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(4636009)(376002)(136003)(346002)(39850400004)(366004)(396003)(6506007)(966005)(66946007)(956004)(83380400001)(44832011)(2616005)(6916009)(36756003)(66556008)(6486002)(66476007)(26005)(52116002)(8936002)(478600001)(83080400002)(5660300002)(6666004)(6512007)(1076003)(8676002)(86362001)(16526019)(186003)(2906002)(316002);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData: 
	=?us-ascii?Q?lKWqXorOixL3Ld/x5r3usw82nwVsDoYauFjd745EZ92PgMoTbWk5rdP4tSBs?=
 =?us-ascii?Q?qQmqTPr7TyB510cKsc6U2Ie70eJAiYTkELNmm42y1LuS3mEF1FPvGMZHS/mi?=
 =?us-ascii?Q?Ij6uyiyIhYxpXNjXwxNPd4r73sgQO+h7wgAVeQSi4YshXze+EqoYb2D1yA/L?=
 =?us-ascii?Q?hvHcxNSbquPBy1LTvGO8rtVrpOceS2h6TYHUWd7BmzmkbEIwSqtvmERRj6PB?=
 =?us-ascii?Q?IBcD7hEYXYp5CF3JsoinX0sNkeRJ+ymlkICL5nzbr5Qwxvy8uQ26J46O+axe?=
 =?us-ascii?Q?7utVHXIYQmMFBSwoqDQW+G6Hy4ojQZA7OOVwe2v01PH8Tl6vcdxpqsCKObio?=
 =?us-ascii?Q?t2hfarRxF7+IuFrEB5svTbnqDKEC91r/SNFQzSnxswHW7j3pgvlxXKq8sT73?=
 =?us-ascii?Q?TJIE4LRCUwTuhglI2QJQVuTZUBdFDeQFM2aQHB2/ysLesWuVTndpG0/HjVrs?=
 =?us-ascii?Q?uV9dhihzqKxmhPKCEhaBzzh1QWI3KzHFlZZqlw6XDmj5KReB5eA/i9+yDRuF?=
 =?us-ascii?Q?nU93//3HokTBfneHBNOkFYSQv/QFxNk4Pv36nphqh6RJilbeFNvRP6rpwMRE?=
 =?us-ascii?Q?qX2njGlP9TbU/Y3B68yJOy0jLTkIYeXAnRAi9e2j75tK4HZLPEqLi+a1ieFe?=
 =?us-ascii?Q?k6vLp0N1pXCM2b+eKeVThUwtEBubAMto2Uf4ujrqoveaDtQFLrvKUjiarB6a?=
 =?us-ascii?Q?QWTkyky9gtIzC722bg54+gRkB4NmFieZTR56t98Cb0A20nYNHMpHAXyAplhg?=
 =?us-ascii?Q?ri3ex8LXOuP1iiGL8eoU0VlKSPSHQbbXc4A1X2bs5tYq8O518KHivZBrtUTG?=
 =?us-ascii?Q?/2b2BVgneEx8FX5TQiB2ljDxcdJoOJszoC1JMyvDLYvPjXOM1AnsSFdn65wr?=
 =?us-ascii?Q?JjNx5VVTbMaKqdiiB4Jvs+x2x9bNO9BFBIiujaNTxm42eOjcFTjJmmgV18md?=
 =?us-ascii?Q?xoFr6erNXa8681+1dm9JtZhwoKVy/twzHT6qSFMaRwMHePis4uLrdqAMpIWK?=
 =?us-ascii?Q?doUv?=
X-OriginatorOrg: windriver.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 2e39a4bb-a88a-4dc5-19ed-08d898075d66
X-MS-Exchange-CrossTenant-AuthSource: DM6PR11MB3595.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 04 Dec 2020 03:47:47.6288
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 8ddb2873-a1ad-4a18-ae4e-4644631433be
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: P3l9byxWOQDikPKM0s8r9YfR5oUS78tNtmsz4HCw+Z0OCRGzox2FL8AUgmwoLYufdLYTdsOSuzwe961BrA+9Aw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM6PR11MB4756
Content-Type: text/plain

References:
https://nvd.nist.gov/vuln/detail/CVE-2020-25723
https://bugzilla.redhat.com/show_bug.cgi?id=1898579

backport patch from:
https://git.qemu.org/?p=qemu.git;a=commit;h=2fdb42d840400d58f2e706ecca82c142b97bcbd6

Signed-off-by: Li Wang <li.wang@windriver.com>
---
 meta/recipes-devtools/qemu/qemu.inc           |  1 +
 .../qemu/qemu/CVE-2020-25723.patch            | 51 +++++++++++++++++++
 2 files changed, 52 insertions(+)
 create mode 100644 meta/recipes-devtools/qemu/qemu/CVE-2020-25723.patch

diff --git a/meta/recipes-devtools/qemu/qemu.inc b/meta/recipes-devtools/qemu/qemu.inc
index 274c855d35..ecff54d61d 100644
--- a/meta/recipes-devtools/qemu/qemu.inc
+++ b/meta/recipes-devtools/qemu/qemu.inc
@@ -35,6 +35,7 @@ SRC_URI = "https://download.qemu.org/${BPN}-${PV}.tar.xz \
            file://CVE-2020-24352.patch \
            file://CVE-2020-29129-CVE-2020-29130.patch \
            file://CVE-2020-25624.patch \
+           file://CVE-2020-25723.patch \
            "
 UPSTREAM_CHECK_REGEX = "qemu-(?P<pver>\d+(\.\d+)+)\.tar"
 
diff --git a/meta/recipes-devtools/qemu/qemu/CVE-2020-25723.patch b/meta/recipes-devtools/qemu/qemu/CVE-2020-25723.patch
new file mode 100644
index 0000000000..90b3a2f41c
--- /dev/null
+++ b/meta/recipes-devtools/qemu/qemu/CVE-2020-25723.patch
@@ -0,0 +1,51 @@
+From 2fdb42d840400d58f2e706ecca82c142b97bcbd6 Mon Sep 17 00:00:00 2001
+From: Li Qiang <liq3ea@163.com>
+Date: Wed, 12 Aug 2020 09:17:27 -0700
+Subject: [PATCH] hw: ehci: check return value of 'usb_packet_map'
+
+If 'usb_packet_map' fails, we should stop to process the usb
+request.
+
+Signed-off-by: Li Qiang <liq3ea@163.com>
+Message-Id: <20200812161727.29412-1-liq3ea@163.com>
+Signed-off-by: Gerd Hoffmann <kraxel@redhat.com>
+
+Upstream-Status: Backport
+CVE: CVE-2020-25723
+[https://git.qemu.org/?p=qemu.git;a=commit;h=2fdb42d840400d58f2e706ecca82c142b97bcbd6]
+Signed-off-by: Li Wang <li.wang@windriver.com>
+---
+ hw/usb/hcd-ehci.c | 10 ++++++++--
+ 1 file changed, 8 insertions(+), 2 deletions(-)
+
+diff --git a/hw/usb/hcd-ehci.c b/hw/usb/hcd-ehci.c
+index 1495e8f..1fbb02a 100644
+--- a/hw/usb/hcd-ehci.c
++++ b/hw/usb/hcd-ehci.c
+@@ -1373,7 +1373,10 @@ static int ehci_execute(EHCIPacket *p, const char *action)
+         spd = (p->pid == USB_TOKEN_IN && NLPTR_TBIT(p->qtd.altnext) == 0);
+         usb_packet_setup(&p->packet, p->pid, ep, 0, p->qtdaddr, spd,
+                          (p->qtd.token & QTD_TOKEN_IOC) != 0);
+-        usb_packet_map(&p->packet, &p->sgl);
++        if (usb_packet_map(&p->packet, &p->sgl)) {
++            qemu_sglist_destroy(&p->sgl);
++            return -1;
++        }
+         p->async = EHCI_ASYNC_INITIALIZED;
+     }
+ 
+@@ -1452,7 +1455,10 @@ static int ehci_process_itd(EHCIState *ehci,
+             if (ep && ep->type == USB_ENDPOINT_XFER_ISOC) {
+                 usb_packet_setup(&ehci->ipacket, pid, ep, 0, addr, false,
+                                  (itd->transact[i] & ITD_XACT_IOC) != 0);
+-                usb_packet_map(&ehci->ipacket, &ehci->isgl);
++                if (usb_packet_map(&ehci->ipacket, &ehci->isgl)) {
++                    qemu_sglist_destroy(&ehci->isgl);
++                    return -1;
++                }
+                 usb_handle_packet(dev, &ehci->ipacket);
+                 usb_packet_unmap(&ehci->ipacket, &ehci->isgl);
+             } else {
+-- 
+2.17.1
+
-- 
2.17.1

