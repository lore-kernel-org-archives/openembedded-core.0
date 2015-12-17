Return-Path: <Tom.Hochstein@freescale.com>
Received: from na01-by2-obe.outbound.protection.outlook.com
	(mail-by2on0135.outbound.protection.outlook.com [207.46.100.135])
	by mail.openembedded.org (Postfix) with ESMTP id 09CC2731A3
	for <openembedded-core@lists.openembedded.org>;
	Thu, 17 Dec 2015 22:20:22 +0000 (UTC)
Received: from BLUPR03CA002.namprd03.prod.outlook.com (10.255.124.19) by
	BY1PR03MB1418.namprd03.prod.outlook.com (10.162.127.148) with Microsoft
	SMTP Server (TLS) id 15.1.355.16; Thu, 17 Dec 2015 22:05:01 +0000
Received: from BY2FFO11FD031.protection.gbl (10.255.124.4) by
	BLUPR03CA002.outlook.office365.com (10.255.124.19) with Microsoft SMTP
	Server (TLS) id 15.1.361.13 via Frontend Transport;
	Thu, 17 Dec 2015 22:05:01 +0000
Authentication-Results: spf=permerror (sender IP is 192.88.168.50)
	smtp.mailfrom=freescale.com; freescale.mail.onmicrosoft.com; dkim=none
	(message not signed) header.d=none; freescale.mail.onmicrosoft.com;
	dmarc=none action=none header.from=freescale.com;
Received-SPF: PermError (protection.outlook.com: domain of freescale.com used
	an invalid SPF mechanism)
Received: from tx30smr01.am.freescale.net (192.88.168.50) by
	BY2FFO11FD031.mail.protection.outlook.com (10.1.14.196) with Microsoft
	SMTP Server (TLS) id 15.1.355.15 via Frontend Transport;
	Thu, 17 Dec 2015 22:05:00 +0000
Received: from paisano.freescale.net (paisano.am.freescale.net [10.81.19.190])
	by tx30smr01.am.freescale.net (8.14.3/8.14.0) with ESMTP id
	tBHM50Tg006842; Thu, 17 Dec 2015 15:05:00 -0700
From: Tom Hochstein <tom.hochstein@freescale.com>
To: <openembedded-core@lists.openembedded.org>
Date: Thu, 17 Dec 2015 16:04:47 -0600
Message-ID: <1450389888-24760-3-git-send-email-tom.hochstein@freescale.com>
X-Mailer: git-send-email 2.1.4
In-Reply-To: <1450389888-24760-1-git-send-email-tom.hochstein@freescale.com>
References: <1450389888-24760-1-git-send-email-tom.hochstein@freescale.com>
X-EOPAttributedMessage: 0
X-Microsoft-Exchange-Diagnostics: 1; BY2FFO11FD031;
	1:EuF1iQmI4c16Yaadjx8iJgwxwxu2+m58B+tVa2ZbHCYyYT5qiKrq1y/TNZhmyuL0gA09d1B1HV27FPMjFBewkgAPQZLwcGVp8dy5dF3I7fmM4zwwUdPHiPmLknzGffsMpisaPtH8sCbuepu1i38U1133ZRd6D8VulFUn0vVCw8HMfI9fjL1HQJUfyekomDcvvuncVKdkQ90IVU5e/JLoPlgy7t0LdDVfzgCO36iCW2ZfkZ/KCzpi823BN0d5AWVD7yiK1dpeAEg83KUdi3lEPisFSiaGfocSFtMf5DtsSz3VGKZoQPByT8BqBhXJmtLB1AxmxtjoYlTF65+o0kUrlYCYSWf7yNyCicCpD3EFiq7hhMUVceH3kKhgZl4oCz/ruk5SJujgqHrFiQzBDyLUzcE/3e9HInu+/62BM7+Tihem4eS3iIr6CVMtX8kmDQMb
X-Forefront-Antispam-Report: CIP:192.88.168.50; CTRY:US; IPV:NLI; EFV:NLI;
	SFV:NSPM;
	SFS:(10019020)(6009001)(2980300002)(448002)(3190300001)(189002)(199003)(4001430100002)(85326001)(586003)(77096005)(50466002)(1096002)(5008740100001)(48376002)(1220700001)(6806005)(86362001)(230783001)(36756003)(104016004)(92566002)(50226001)(19580405001)(5001960100002)(450100001)(87936001)(81156007)(97736004)(76176999)(2351001)(5003940100001)(110136002)(50986999)(107886002)(33646002)(47776003)(189998001)(2950100001)(11100500001)(53416004)(106466001)(19580395003)(229853001);
	DIR:OUT; SFP:1102; SCL:1; SRVR:BY1PR03MB1418;
	H:tx30smr01.am.freescale.net; FPR:; SPF:PermError;
	PTR:InfoDomainNonexistent; MX:1; A:1; LANG:en; 
MIME-Version: 1.0
X-Microsoft-Exchange-Diagnostics: 1; BY1PR03MB1418;
	2:nY1bfgggyE+vBQHnz8v0ePxmyw1mcH8G/dv0EtvDajKAYgHhBrY92qpNErA8y5k2y97hhECtODhNiStHc6UTM0DZdLXn8A/o6Y5gy6vTg2Lez0rn9xPkOIpUum62hPfAoGaSFsLBa3XALv4zP4Wcrg==;
	3:JUHlivUmf9yNdQisvHkgSI+80TaWkMYmNB1T0ROKdxP8P5d/O9JpvX0cvVZiAuS7ozL7xKGw08BIAuLELUE0Zz0uPSpwEX6hpUfYJ6h7AVvrIt/rd45dQfd0oxcLUhudQoDAy7MY4DR5bOEvCdi+61OnCkoxpR1BIixG7tpQa5D5ia/LzS2QFzDSd+8Ja9KWz+GmIm4lqfe6tAjoJKLLmxQNniUdWtv9qV9d6m9O3Es=;
	25:mRPHundSLX30yzGNsKWtOiaKHPiWdKTROZ+CBW/MJL7WoGo2NHMCCEuFPIv7fErGOHBF2UVagOGVgWuYD0Dk3P+IjgSzUJWZzwDGI6HSn3ehiiKIeBirx1DuPaqOqX/14mLyNeFJhBKa9pyS2DM59hZCDei4dbW8FkHNtA6JgmrjpJKr8PC7zQVWHqdwPkI+9oUz301vYhUD0/O2UMFYYZSZzPFdVma0eKWnkTAwiSCjcW1TjPM8mOfwv0aMKsFQRRXj0q4Zoa17sauXfxfH9A==
X-Microsoft-Antispam: UriScan:;BCL:0;PCL:0;RULEID:;SRVR:BY1PR03MB1418;
X-Microsoft-Exchange-Diagnostics: 1; BY1PR03MB1418;
	20:/D3TyjHXO0Ts/bc8ktSDOScZDpGzHjPH2W3vVmLIezGCbfroOzA3mD87wc8kVl9fO5nG29aLoUNETunniM4/i4/1tn+znX1md8SaLtrF0XrjRL9mzItWnr7IS+BE9BT3c9yMLFncJGmD029B1o1RFekbxVXVF1yGMf/6nMy9St58pFxvvXVgWRBeqNU5ubXyDmZABDH6rVhjL3EqbzL3CABc+DoZw57du7dWuob/gc5Zw9FXVlldculUE0BUAODWunr81AA5vHtEDIqrOHATCS1KF3v4s0Entxw+PnLSSwdqPnohSfklXPOAV0Y4ApsLnLK2POGyYX+4LY2jyFd52YjKk2V6bi64N6QuDG4zBO8=;
	4:fIkC2HY41816euzJv6vvOn3p/TzMZMGcRFwM8z/ex9Y1QEGmLUeKY8l0Pv+EHdjilq9MjN4R4dwLlSnM9QXxLW69HzIrzYlHJcbt7CodYBoSe5gGZTqG0gfaOeKtyWorsdsevls0+Ga+WhzCuM+Gl9FbaRBtr4cuF6CP/PS+YwoioAG/nRdQaPyj6UTBnvCtLrhuVDS+HT1gyU47FQq9ItOY/q6hF9DXHoRYqsY/nVPcxy9/zDjaQFAoA2fxeoCf1ilXu+lW0hcc5pwLxjqGIRxmN4Wa1o9qlsF6khYu0nu2aVFaWHscZYmc8eOVrhxgJRXAVAJtuDgBSfKBohMKVRIQe+kRrhuo459sb9a1ULBdpULJ1tktGpxfPjkQrctmMuA/ou3DtUm07wHvXlLwEB00FmGRlFjgpMnbRr+2DrRThRd2PFwJ0u8oVws91nme
X-Microsoft-Antispam-PRVS: <BY1PR03MB14186F4D5BEBB978C40BC952E8E00@BY1PR03MB1418.namprd03.prod.outlook.com>
X-Exchange-Antispam-Report-Test: UriScan:(101931422205132);
X-Exchange-Antispam-Report-CFA-Test: BCL:0; PCL:0;
	RULEID:(601004)(2401047)(5005006)(520078)(8121501046)(10201501046)(3002001);
	SRVR:BY1PR03MB1418; BCL:0; PCL:0; RULEID:; SRVR:BY1PR03MB1418; 
X-Forefront-PRVS: 07935ACF08
X-Microsoft-Exchange-Diagnostics: =?us-ascii?Q?1; BY1PR03MB1418;
	23:X/9fVo2UTx9x3TTF2EOQhyE4cWbHMNkIClmE9J4+i?=
	=?us-ascii?Q?1Cu2MDsdD6IRmybSyce/LJ53GsfWQo5FbVXVDFK5E4/Z3HtbjEx4BSKKDPbD?=
	=?us-ascii?Q?lmX8u5Sw+WT7bPUrPbdaljT35vARYFwmuV2cSyG8IIns3Ax92+YAGR0Xvo2v?=
	=?us-ascii?Q?UMFZ1SJfkEMjJKQtKhih5ZB0MNsIMONgoNFTioXA1KTtyE9JG7q8xeI58qxI?=
	=?us-ascii?Q?pL2cKaGXb427UXlQZO2uSvaTCzts9gIZx2yHRr8Zg5vQZgkhzoRAchPJVC+w?=
	=?us-ascii?Q?lkdCTv1MPQt1D35mLWMrksu0Ov3TNbAnaOMg0TqgvHyAwD9KityUi46CzfM/?=
	=?us-ascii?Q?rjK0o5bJ5K01CyoIr3150cSEFEGiX2h67Ojz7XIDRdqkvGGZxJhqEyJqv8l/?=
	=?us-ascii?Q?LbzMGeA7ZlQfxQtkm3hyMaPK0+ktp0TW+pKL6kl3fHWwFrZh0BG611mV8v6D?=
	=?us-ascii?Q?lf+GKYdyoUUBmQYR5I27wD+NS1iuFCthMuS9txNzgOlPuo7cGven/tJigG0G?=
	=?us-ascii?Q?KCEsBy7s5d4vVU45x/xk31vhVHogau3QOJOIt6w/CE+InQihfMxpr4p9R6e9?=
	=?us-ascii?Q?NL8iUYSemOxTZ9ZlhlpxWleFFW599e0lj+WipLZDIQ0pjnfNZCt8AmCKIfO/?=
	=?us-ascii?Q?18tz9auUWVBPeAKPyLeMRlGrJ4gtcBrJN4Sq4ysoxtNzwC5GQp3DHkoG6qVQ?=
	=?us-ascii?Q?0R5lkV3rAom/cKQ3udALgofH2tdozRxXMYexxCkMp3nTXy3at7MTBZc1gD+e?=
	=?us-ascii?Q?D/QurdPgeMh2xenWZGxpYAFs7BY8X1MlCAX6V06cJ3ajRnMlvOaJOunPALG+?=
	=?us-ascii?Q?u/BlbsYzAmqgJPTA7rWH6jSHGExXWIAd8Pc05Y6KjvMGiPvkZnjmm285cQlX?=
	=?us-ascii?Q?3PupIS5k7+HqjxOMazORF0jAsV9VxbISP4ptIgZBUjLdc4zu3ZyQOZsDa2e4?=
	=?us-ascii?Q?xyhDUfUEl4x7renU+xH7G2iZPpnonRTqAcbJZvJM8IBPBBQ1QatqVB8LhsQd?=
	=?us-ascii?Q?u9ABsF6Rn/vbHrMfj63xTjZMQQxUaf+pZeES4T89BRgq9bt1Tdj7OHN9uAKU?=
	=?us-ascii?Q?GetBXJBrwfr1AXNRA2kO2DGXQCskWZJKg+PAebHo0Me8DRywpBVzNE9YpAjK?=
	=?us-ascii?Q?ICZiB+lS7KHU35xxcoMBQOUR1/EJxPs?=
X-Microsoft-Exchange-Diagnostics: 1; BY1PR03MB1418;
	5:eY+O7K9z01HueUZJs8HYSje3P4A3OzuUDphKjcFfuR3kbnCPszJGhrSC7ymnwaqwB7RhdX74pY2QciNcry80jZy1mphE3CK2b4ugSVI+0sGZ8ZMOs7zqLcn225VeQFjKBkiWSdRTamVcdK6IM3RJ6w==;
	24:cc0JaIEYKuGazzUCTgpsXixJTivnee/ohanVbG7DDHCN8mDCn6mwImNfSDFp3obyLYV7uZ2NnmjK1UgxmBTBVvvztrgC/CvE4SaygVaQXHA=
X-OriginatorOrg: freescale.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 17 Dec 2015 22:05:00.8237 (UTC)
X-MS-Exchange-CrossTenant-Id: 710a03f5-10f6-4d38-9ff4-a80b81da590d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=710a03f5-10f6-4d38-9ff4-a80b81da590d;
	Ip=[192.88.168.50]; Helo=[tx30smr01.am.freescale.net]
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BY1PR03MB1418
Subject: [<OE-core][PATCH v2 3/4] packagegroup-core-x11-base: Remove matchbox for XWayland case.
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
X-List-Received-Date: Thu, 17 Dec 2015 22:20:23 -0000
Content-Type: text/plain

Matchbox is redundant when Weston is run.

Signed-off-by: Tom Hochstein <tom.hochstein@freescale.com>
---
 meta/recipes-graphics/packagegroups/packagegroup-core-x11-base.bb | 3 +--
 1 file changed, 1 insertion(+), 2 deletions(-)

diff --git a/meta/recipes-graphics/packagegroups/packagegroup-core-x11-base.bb b/meta/recipes-graphics/packagegroups/packagegroup-core-x11-base.bb
index 17301a0..6c567ea 100644
--- a/meta/recipes-graphics/packagegroups/packagegroup-core-x11-base.bb
+++ b/meta/recipes-graphics/packagegroups/packagegroup-core-x11-base.bb
@@ -12,8 +12,7 @@ RDEPENDS_${PN} = "\
     packagegroup-core-x11-utils \
     dbus \
     pointercal \
-    matchbox-terminal \
-    matchbox-wm \
+    ${@bb.utils.contains('DISTRO_FEATURES', 'wayland', '', 'matchbox-terminal matchbox-wm', d)} \
     mini-x-session \
     liberation-fonts \
     "
-- 
2.1.4


