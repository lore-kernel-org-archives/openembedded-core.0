Return-Path: <Tom.Hochstein@freescale.com>
Received: from na01-bn1-obe.outbound.protection.outlook.com
	(mail-bn1bn0106.outbound.protection.outlook.com [157.56.110.106])
	by mail.openembedded.org (Postfix) with ESMTP id E1559606A8
	for <openembedded-core@lists.openembedded.org>;
	Mon, 28 Mar 2016 23:36:50 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=freescale.onmicrosoft.com; s=selector1-freescale-com;
	h=From:To:Date:Subject:Message-ID:Content-Type:MIME-Version;
	bh=V/hWQQXqlJnyOTFzO4YzN/d2ehlEoS+v1wX8Pnslt9g=;
	b=hNXrcRCWVozhRH0I4eovJ/U1hZYbVkUmgut0As0aw7Ky39Mpl7fx6uD4RAjbcNaaTH/0bn6+61HEKJmcFZOmmtcFJMZqIbw8rO+cWtMv8JM01w6hJHvHgDE2Pr+jDDoP115A2rvAmaiZNBdfPH7k/SinqWFbCFr9L0gO+LnSC1M=
Received: from DM2PR03CA0039.namprd03.prod.outlook.com (10.141.96.38) by
	BY1PR03MB1420.namprd03.prod.outlook.com (10.162.127.150) with Microsoft
	SMTP Server (TLS) id 15.1.447.15; Mon, 28 Mar 2016 23:02:34 +0000
Received: from BN1AFFO11FD032.protection.gbl (2a01:111:f400:7c10::189) by
	DM2PR03CA0039.outlook.office365.com (2a01:111:e400:2428::38) with
	Microsoft SMTP Server (TLS) id 15.1.447.15 via Frontend Transport;
	Mon, 28 Mar 2016 23:02:34 +0000
Authentication-Results: spf=neutral (sender IP is 192.88.168.50)
	smtp.mailfrom=freescale.com; freescale.mail.onmicrosoft.com; dkim=none
	(message not signed) header.d=none; freescale.mail.onmicrosoft.com;
	dmarc=none action=none header.from=freescale.com;
Received-SPF: Neutral (protection.outlook.com: 192.88.168.50 is neither
	permitted nor denied by domain of freescale.com)
Received: from tx30smr01.am.freescale.net (192.88.168.50) by
	BN1AFFO11FD032.mail.protection.outlook.com (10.58.52.186) with
	Microsoft SMTP Server (TLS) id 15.1.453.6 via Frontend Transport;
	Mon, 28 Mar 2016 23:02:33 +0000
Received: from paisano.freescale.net (paisano.am.freescale.net [10.81.19.190])
	by tx30smr01.am.freescale.net (8.14.3/8.14.0) with ESMTP id
	u2SN1iO9022049; Mon, 28 Mar 2016 16:02:32 -0700
From: Tom Hochstein <tom.hochstein@freescale.com>
To: <openembedded-core@lists.openembedded.org>
Date: Mon, 28 Mar 2016 18:00:02 -0500
Message-ID: <1459206002-30154-5-git-send-email-tom.hochstein@freescale.com>
X-Mailer: git-send-email 2.1.4
In-Reply-To: <1459206002-30154-1-git-send-email-tom.hochstein@freescale.com>
References: <1459206002-30154-1-git-send-email-tom.hochstein@freescale.com>
X-EOPAttributedMessage: 0
X-Forefront-Antispam-Report: CIP:192.88.168.50; IPV:NLI; CTRY:US; EFV:NLI;
	SFV:NSPM;
	SFS:(10019020)(6009001)(2980300002)(3190300001)(199003)(189002)(87936001)(230783001)(47776003)(229853001)(2351001)(50226001)(106466001)(5003940100001)(33646002)(105586002)(1220700001)(1096002)(11100500001)(50986999)(586003)(86362001)(76176999)(104016004)(6806005)(19580405001)(450100001)(189998001)(92566002)(19580395003)(2950100001)(36756003)(2906002)(48376002)(81166005)(5008740100001)(50466002)(77096005)(4001430100002)(4326007)(110136002)(107886002)(53416004);
	DIR:OUT; SFP:1102; SCL:1; SRVR:BY1PR03MB1420;
	H:tx30smr01.am.freescale.net; FPR:; SPF:Neutral; MLV:sfv; A:1;
	MX:1; LANG:en; 
X-Microsoft-Exchange-Diagnostics: 1; BN1AFFO11FD032;
	1:Qsi0Wino892bBbvwuUBRXSKYGewzIXma7YR1Z+dLNz3yXDSGACw6SfMK+uGz5omMow63hArlKumz83sA0yr0f6H88VBBLJ4Pq+MGaachPoprKqNoMDj13Pm6AAnTC1vUf4JfZYPghmYSpeICFp68yiKPi8fqkkfjQtb8tk+nDekEXm/MOQmDJz9nyPWulzB7OUPGycjBmW8Ry3xF5iNwCRKUpmuFSlDSLBPCQfihDfQIyE7RFiQGbt8hIGGXvXFerAjgjV1YLATcTewHWdx54A+9dGACG0IdUzS6scPl8yeykhgYCFqaUCfOmlqocVE3IJ4Sz/3L9o0/ZSNEbkzYbOSGuw9i+Ri0IWvN5VTD8idM14jVDCpLPnd2r9tPFydRmMR9dhMj+1+DuD4+ue56/abWx4zo8PaiIB5lzrvxWNVq3+BiByiHkseVYXJ1oLTTI1RP+zEOhqZHBP7Z/fP3bLqttriux3nytQborpKnDfXe6MiL+PzBhwshwi/jrFRgjfjjGLsshnaC9ivSP2aOWTRQ0slaT9Pm+ezZCoOwIHw=
MIME-Version: 1.0
X-MS-Office365-Filtering-Correlation-Id: ec690c68-cb00-41a5-73a5-08d3575d0c44
X-Microsoft-Exchange-Diagnostics: 1; BY1PR03MB1420;
	2:m5k6Kw0MNVYQ/89QhQQ2OeHAPWWvGVrzST5zWaVKGfZqpRK9mQfI5hMoaM5p0QE1y/RQZztcDH6IrSlKnvJ1T+pLXqMx5pGautufAOG4LdofEVt8fvBcuhLGtB85IDHZ+5hrKdYDZTTnn3P+WSAIWRTmPj/ofjS7LXNkgQQibTXes7um5b6gMKVUzvlh4Ako;
	3:oq9FJwOiXOZNOffafltvzI5G8rL9Vo3X/2hBuL2q4KKtmSwjImtq5RYj3D+z9Tn3USTWh8KLzXykCCy5b3lO7c+YTGCkQyEss5EPnEcHEwxnohxXe7hLA/9yUa4lIBKjJBdW/YYftErlFkBe7FGXkvmU56/374ZZl0979XUK5PXiQxXhD2ldmgKc+utPvBQolUepJo/gRQXhuOj3ydfTHFRGhbMTnp3PzcozQfWBw9Y=
X-Microsoft-Antispam: UriScan:;BCL:0;PCL:0;RULEID:;SRVR:BY1PR03MB1420;
X-Microsoft-Exchange-Diagnostics: 1; BY1PR03MB1420;
	25:Clam1C1Fl99SJySuFve2ASQX5flGNfnQFIaeLbnH/Fq8xOU9KuqqxuFqHsUZsMq1EwupmBiWvuyn8HjdkKCnjABChkGVcmf3h5ZXKVugyb+7m5SYkpigJ4oSfxW021evTldtYfmJHe21lyl+lTrqK55t6zESQYoDnwr+mQkStipxq2O0YD0837UPMfZxaor/sdPjwXbdADgaKYt1GzWO6w+bKtWxa+cEMdmiuO3AqL5IFKuizqG31//vxInorGVJMSTxplp1Qjb4jI6lpO3paapNXk6jie8/dgsxfR2feBVkllROvDqbBm656IVnfKQEi+XSCBTZMxdftJi59iS/C9adQ1NStRGdhGAOh/q1X07kMxXhs6hLVEeqwot3eflbQ2ha3Y8G0F2QZdmewHYgUVcIcpwY9BAv4V6LH1Bcf698jGRH40cGHly+zen0eplZNBv0csLBIuLkhKXU3vbSvXfvpfgePkucVl8lcPFmxY5a8MnZy5HlFQa8zw2go/EDVcI5f2MQJ13pqWE48OPjGdqlhpmpA4lz/DrDeMqJypptrlzLGVoEapGtcMyRtZzCPAlqfnvjpALrCXuvk4tzlg==
X-Microsoft-Exchange-Diagnostics: 1; BY1PR03MB1420;
	20:DMWdXergkSsqyW93lHFIx9nROuG6Y5QY7e7hhBdURgwsRY+rJIgWBGfnj+0SSNeJxVunnM6B5nmJ0Xoe+P9BNF7MqC4Efo3KpFekODeRlls26gs3raqxhrAePVqlUmFX17/jIxxaui9Ub8YWca/oV0kgTQ7VMXrp4TmJtw9QRh5KayRJkqKKASXGVZKQ3clay6Z1hm3Co3LTWfKuC63/lUoiCKIyyDat8aYfjQt/qWNHHZlF+CBTu+jQjwA744+LuSNvEmIunRp4rq5SmkOSCt3fhypk13LkaU6HL9gXeOY8SqiY/X8Kpd14pVKEqhmU9Ic6d89sT7fkbvP8ol1HthVhurJFJdCjXJaqWkMIItLDz5X+wPkGq/UrxRevF8bdDbG7w3tWB3fdoIekVpu+wSuihj5Zg52ajdZWZZrIyeYO7rfMCrkX+20W+68cOjeU;
	4:n09BBfQfobWtwz/PqUgCTFMJ0m/8JplXSpt9fXt5zwEgrSGram2v0ZGkKp3nQKZ2c5PFbzAisTgn8dgb6uyWDyauQSLeD0HSg8ObWodey6YNdv7bUvm1uM2jgZgIxpaQxEFe2IN+6IEbGvCr+v4dxB4wEtWfyessBKEUbCju6p+TLBEeODVa4rnhV3A2Z0KAPsmHnFKrv1jNKd3SoZYBv7kRkiLE/4tElB79MVVcX+itIy0IZuBDe6zp/ulvEKmUpgZEoq5H0KSmAGMgksH2DlqKnVXruFNAcMc/qjP6TjlQByomcLiivmsbT2GaysBmz5VA6QokpeFtZVxVnSZrJRyGCv0zl1dU/d5uva1FzJUefjxJse5pn0jY/2NArHwrfha+DxTBneFgigxQ0EFX92D9VDRDoMvs6DnASHdcXrL8FL0yR1cuEvUAb3FqrYJUmkdCNutScUGZy4//Ikk08Q==
X-Microsoft-Antispam-PRVS: <BY1PR03MB142011721EBE5BDB9912FDC8E8860@BY1PR03MB1420.namprd03.prod.outlook.com>
X-Exchange-Antispam-Report-Test: UriScan:;
X-Exchange-Antispam-Report-CFA-Test: BCL:0; PCL:0;
	RULEID:(601004)(2401047)(13017025)(13023025)(13015025)(8121501046)(13024025)(13018025)(5005006)(10201501046)(3002001);
	SRVR:BY1PR03MB1420; BCL:0; PCL:0; RULEID:; SRVR:BY1PR03MB1420; 
X-Forefront-PRVS: 0895DF8FFD
X-Microsoft-Exchange-Diagnostics: =?us-ascii?Q?1; BY1PR03MB1420;
	23:jmYwZEdWa4P297Hkh6spDaKWsGHrMo3lheUp/tKeo?=
	=?us-ascii?Q?3G6oA5HcQVS6vunulj08MJTh9TS1tSLlRednfw6TN4HCsO2dboHHbZW8aXEt?=
	=?us-ascii?Q?5/UyYb5XbQj4G4DFQaQX3TKuYZZDskoXgbVBsLG869wlqRj8FeWhmj6sJw19?=
	=?us-ascii?Q?MeFZCF23pot/Bm7XTsxbKG2Qfutpyqx52M37lqu/aWx+0q9CPpt2cElUOzqV?=
	=?us-ascii?Q?LqnUwwCyRZrf84T1RfczG+/9MvKSfksL/pNkBNLi28Fvn+NZheXQ8dllFISU?=
	=?us-ascii?Q?qe1V0dmPAm3rM7KtFxtfIIcwEEJ1gS6vEHbtKcp5XpcpYvdj3NPlXeiNKZiM?=
	=?us-ascii?Q?VwXST/MpIXjgrwuUdhpTh3sULH0Gd8Rbotid04bu5WD2zmfVXUcGa/yxS3wd?=
	=?us-ascii?Q?qw0ws1yOG+xCvOzCKsZ7lT5Z23lp1hCWsS4+KWRPL8xCrI0Xe6jhOy0zsK0t?=
	=?us-ascii?Q?27252I/hSHADhg+jK+gdP8uSq745C4egy3baHoJt51tiSOqxTg0JvDur5FYV?=
	=?us-ascii?Q?EDhdBcpw55tDdxYk03Hv1ZgFwio6TEAwAEx50rZyV/t5ctjBGP1NMVZktKNv?=
	=?us-ascii?Q?86Lj6bGtR7NiPd8S5GYKhAoPsAPK5QldCnnswlEpM+pJfz/CBOpxqJRmFtwr?=
	=?us-ascii?Q?4FxVbfKxiu/EHKSWxMzprZGyy8Xehwm7VoPVyPEM5DRkhfnMmVYhhm5rrqjL?=
	=?us-ascii?Q?Shw/Wfc/u61ulhMFqo3W1ORDpPTqwmp21+x7fIwI7MD+cxH7JliBMG+QRnZ3?=
	=?us-ascii?Q?Bj7anlAcGt7UQ+n/VO4lr+7uoAuGC1nWCab91yOfxoU2NjOh+D++kPvQh1wd?=
	=?us-ascii?Q?fmB68ve8FVkMJMfTWD3nDYlXRT31MWNQPx2wYq5bgMfMzORUtYhP/XxfGKZn?=
	=?us-ascii?Q?phMIw8M4vv4n/fdXB5qrP6oRwhOpfMBCwAut4E45Ga/Bk6WgHtknnH6mIz/q?=
	=?us-ascii?Q?CDGmcQkljejRLMgJi7TQllM7MNqgzK+L3FCS5y3tVT6XonWCh8YXbt9RKtlT?=
	=?us-ascii?Q?75TvKD6QtgtgeM9cAVrD4MXjDaTtbEVNo+f38xiog7xELPkFUnzYWJB+5Xx6?=
	=?us-ascii?Q?RPpTULhuEXz6SNVXPItu+kpvPbBeFCx00507XXX7dMostQpMQ=3D=3D?=
X-Microsoft-Exchange-Diagnostics: 1; BY1PR03MB1420;
	5:my5/bOTkIwh83Wpc6YlPrf445uxgcgVOPbMOR/oX/Mfvo1tZylS1tPuAUc1exgYwlzv5iMu4JAV+9uiM7XOEUxotla87zqMRDGV/7G7/tGOuOR/xCySbMFcktsHvLWfRKBvc21dHwhoZcy92Nnuxww==;
	24:qTnANFyWF5FYEA5Pu8ALUs2RH5qbOaHnyg8yOImTjQCL0C05m3ETXdVwK2nSOmKvB/KqBndTAiSb3DXNfz+AD6Rbmmnfu7X5v4hA19cZYNs=
X-OriginatorOrg: freescale.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 28 Mar 2016 23:02:33.7043 (UTC)
X-MS-Exchange-CrossTenant-Id: 710a03f5-10f6-4d38-9ff4-a80b81da590d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=710a03f5-10f6-4d38-9ff4-a80b81da590d;
	Ip=[192.88.168.50]; Helo=[tx30smr01.am.freescale.net]
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BY1PR03MB1420
Subject: [PATCH v4 5/5] packagegroup-core-x11-xserver: Add XWayland support
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
X-List-Received-Date: Mon, 28 Mar 2016 23:36:53 -0000
Content-Type: text/plain

Include xserver-xorg-xwayland package when configured for XWayland.

Signed-off-by: Tom Hochstein <tom.hochstein@freescale.com>
---
 .../packagegroups/packagegroup-core-x11-xserver.bb                 | 7 ++++++-
 1 file changed, 6 insertions(+), 1 deletion(-)

diff --git a/meta/recipes-graphics/packagegroups/packagegroup-core-x11-xserver.bb b/meta/recipes-graphics/packagegroups/packagegroup-core-x11-xserver.bb
index c53f1b7..56c28f9 100644
--- a/meta/recipes-graphics/packagegroups/packagegroup-core-x11-xserver.bb
+++ b/meta/recipes-graphics/packagegroups/packagegroup-core-x11-xserver.bb
@@ -12,7 +12,12 @@ inherit packagegroup distro_features_check
 # rdepends on XSERVER
 REQUIRED_DISTRO_FEATURES = "x11"
 
-XSERVER ?= "xserver-xorg xf86-video-fbdev xf86-input-evdev"
+XSERVER ?= " \
+    xserver-xorg \
+    ${@base_contains('DISTRO_FEATURES', 'xwayland', 'xserver-xorg-xwayland', '', d)} \
+    xf86-video-fbdev \
+    xf86-input-evdev \
+    "
 XSERVERCODECS ?= ""
 
 RDEPENDS_${PN} = "\
-- 
2.1.4


