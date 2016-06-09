Return-Path: <tom.hochstein@nxp.com>
Received: from emea01-am1-obe.outbound.protection.outlook.com
	(mail-am1on0088.outbound.protection.outlook.com [157.56.112.88])
	by mail.openembedded.org (Postfix) with ESMTP id 8BB92605FE
	for <openembedded-core@lists.openembedded.org>;
	Thu,  9 Jun 2016 19:58:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nxp.com; s=selector1; 
	h=From:Date:Subject:Message-ID:Content-Type:MIME-Version;
	bh=MuGPEPDVNDCtNGaKSwE4IfWsBrh21j3c47bPqMLIHLQ=;
	b=BUPUlYnWerK+OKTs/+SoU3wb8KSQ4WfQ+cztjuMHxK9/NKmlMvqSmw+sf/sWS8ipL1OOzsK+vqlNDkF3nPcX/SCvFs5Wp+NgTjqqBu3Gz++mB7FFRT+qjkXeccGeoL1rJoVLHSL8vDhN4kKEA9ZW5Chr5/l5KUkaanfnVjLacTk=
Authentication-Results: spf=none (sender IP is )
	smtp.mailfrom=tom.hochstein@nxp.com; 
Received: from tx30imx-01.am.freescale.net (192.88.168.49) by
	DBXPR04MB317.eurprd04.prod.outlook.com (10.141.232.12) with Microsoft
	SMTP Server (TLS) id 15.1.501.7; Thu, 9 Jun 2016 19:42:47 +0000
From: Tom Hochstein <tom.hochstein@nxp.com>
To: <openembedded-core@lists.openembedded.org>
Date: Thu, 9 Jun 2016 14:39:21 -0500
Message-ID: <1465501161-27757-1-git-send-email-tom.hochstein@nxp.com>
X-Mailer: git-send-email 1.9.1
MIME-Version: 1.0
X-Originating-IP: [192.88.168.49]
X-ClientProxiedBy: BY1PR20CA0001.namprd20.prod.outlook.com (10.162.140.11) To
	DBXPR04MB317.eurprd04.prod.outlook.com (10.141.232.12)
X-MS-Office365-Filtering-Correlation-Id: 7c9ab413-7b74-4e35-f460-08d3909e3c4e
X-Microsoft-Exchange-Diagnostics: 1; DBXPR04MB317;
	2:Jy3duxIbZEuKEu5xMehylA/rOT0bjv0ge3oE/MHTEI6leARh90JIePkfTfOkmWT1UMtA7IGzMVSMp4iV+R/LsNrLv6ltq6eeoKLOt5aLnf4yKdk8lfFH4zjVOd+EiLw/E0BDd8VJ5F+THrXj6/X1i/XNAfkWFXvNAAEHjtH/9spEjT1TwqCcoieCdg8jpGPs;
	3:3QnzMivfITVcqeoEIJVBHZRrQz5duCxSard2ytHTRtVMNSM7ZEqcaC0GnGNfg5Vn8lG2fdCkwv/NnELkQyHrt/so3ASOxr2pu07qYpBggO3EjsA2yPo75MS+2Xu5I3aA
X-Microsoft-Antispam: UriScan:;BCL:0;PCL:0;RULEID:;SRVR:DBXPR04MB317;
X-Microsoft-Exchange-Diagnostics: 1; DBXPR04MB317;
	25:HDRGX8uvm7gsvlZ9nJhRCbNUqcAf7TGXkid5YUcfvawlEDmK3BJ1konAxpHogRwu7zPvdmt0lngKcz3vo2wVwMGynNyKNMSJlc+JQJ80l7+xb6fccdB7q4tEVyLc04uksO1ULBaAl+qQp0PNbQHyiSH7U+1q27tStacKRysLFjAb1Hgv9jN2XKSiIahIt41rRzz8vGb0gvkH5f8ewk+5AulII5Xj6sUdt8duzuRUhhc2Oi2zRZwhFjTi1YkA+aP8fuU1YoUwnn+Pp6CeyicAqiWW+QKwuWLvxdO/w+o2DwdheAWwMKLQriunf1/ZOXBRiQ9BFS/BzlTKfMIqLzAFPcSq/x3kxkmvEMIg8k2DMRlWfq7/HjPCsE68ffZlgwhltESyoE7ldBvBnQPiiHH2i5cM62Zln73ZHc7rRoTrXBsB0zhS+5JcjzsqAAgyu5HDYJVA3/RCj2YNFM9+eJnHoe49QFrKLsoL/cW49A975Si2MhAJj+24kcj8HGUdU7COIp/Y39nX7FTt6dgcZNfHZ/L/iAlWFxuTRrp05Ujw41yUipNq8uq9fx/di/zeJq+YaIUUE9g1wdmjNzfYPZjhaeS88MKew6voPUFfuBQeJDAI/nQ97n8Dj4XCbIK/RBovk9KNiy24ha/78REsu9ig20Wnx2ikC+TACKV0vLSW2SLg+z0cl5D2BbWn+VLTA9GAL+rOrpczaYgKlshDv2QOXSsRNMwED551J0W5T3nZjrg=
X-Microsoft-Exchange-Diagnostics: 1; DBXPR04MB317;
	20:8gK43wRRnLQZJ2m1mboKLQa20V2ujSZ5Agq8DVIShwo7ZtY4ckNBmK0rHzObkh5KMrs3w0NYyQbL57aUuJo+koAgwIEnOpqwFq34rTZoE3XFuhvr6vbW+qS87oF9UxIurLcfqTGi/Zro83dn+Ing2Jx+KiQg4EGLH4BBE2kxywdETr42uYrhF1mbkUaDIZKMsXX9kBqHiCWSJn2B8VCMUOV1TKIDz7k5EpRdI7w3UMRBSpJl2wf+wCmcWD/0CoBmNJwhU24Hm4xeafT0nHv/Uu8WKgmq3IUWuUESFUSOvnpZA/vOwhzKqSk/RE81oHRPB8QIddeTKHgpeaaEb7vy1GOXFdZ8KWgYNJkRYA/xOEZiXeEAyvDde43tKr5xTCLfsDAFCqG+9IZIi0L7fIKDdnZO/A/B/6Dllb3UCtim8wJx4N91J2xrDlOAgroEJszK2JzILGEsfP66Hbg2Yz9pxdRMX+WlXKlP5NF5E8LUjSkt0p5M1EteAMxrTZVXdfgo;
	4:CJEqOIvMMIZQs9l//mwOe+kZY7fD54pUk/7UdVdByiztQzwwOc6fbw+fv8y9ZKotHqORgYHr3VZTu6gDaZrasx8L/p2MEYNDo0PbGeITOBujEg9qxl/YbAXgZ3IQ5OqJ6ItubYzibqC5BG+ettMdsIbNoanSuzETmC/8C4vuL+inv034kz3HnbLQk9SDBNQFYeSWO7rqSWkAjNlCaOytnOW0oayn/NkNfK31Fh7CdyVLfDFPcU6g1x/PNQcgPcfM4fvxGWcYOVND1Dp71Ot5mlNUdLprvZaQro4I+HulRYSp1GRVy1F8zhWZZZeFx5NIIMDUZ+Qd7UaN4jQTOdvMbkEIRLTKd+SBiSxPqF8UDBW84zhcEh6wPgLWOuzb8eAL9AHoMnn4b2qTJW4BWU5NBudpZkUbuM0L/tHex1aYEXua5yshIEVAPfhU3kGpcqxT
X-Microsoft-Antispam-PRVS: <DBXPR04MB31703A56219BA0A261B104DE25F0@DBXPR04MB317.eurprd04.prod.outlook.com>
X-Exchange-Antispam-Report-Test: UriScan:(185117386973197);
X-Exchange-Antispam-Report-CFA-Test: BCL:0; PCL:0;
	RULEID:(601004)(2401047)(8121501046)(5005006)(10201501046)(3002001)(6055026);
	SRVR:DBXPR04MB317; BCL:0; PCL:0; RULEID:; SRVR:DBXPR04MB317; 
X-Forefront-PRVS: 0968D37274
X-Forefront-Antispam-Report: SFV:NSPM;
	SFS:(10009020)(4630300001)(6009001)(189002)(199003)(105586002)(3846002)(229853001)(4326007)(586003)(33646002)(2351001)(50986999)(6116002)(106356001)(450100001)(50226002)(92566002)(81156014)(101416001)(2906002)(97736004)(19580395003)(19580405001)(81166006)(42186005)(8676002)(86362001)(48376002)(77096005)(189998001)(36756003)(47776003)(5003940100001)(50466002)(110136002)(5008740100001)(68736007)(66066001)(5004730100002);
	DIR:OUT; SFP:1101; SCL:1; SRVR:DBXPR04MB317;
	H:tx30imx-01.am.freescale.net; FPR:; SPF:None; PTR:InfoNoRecords;
	MX:1; A:1; LANG:en; 
Received-SPF: None (protection.outlook.com: nxp.com does not designate
	permitted sender hosts)
X-Microsoft-Exchange-Diagnostics: =?us-ascii?Q?1; DBXPR04MB317;
	23:XJwl3hpIIK0ysZH3N+UWoAYvccRmzYpLL1g3S50hT2?=
	=?us-ascii?Q?/xX98bpCH9JlPj5uw5PxdjcGEteR2MHt+8gDdoHhRmQuy1mh3uLZ1ryQPXk9?=
	=?us-ascii?Q?x+zLwEmvyKx8QQvUplIUkSkfC1v1UxWCbih27QKeg6klF8S7T5BnvL1Zzg+T?=
	=?us-ascii?Q?X6mKjYqzrzhGyw+rNBamrrViO7EBVnXtAPf8TBnKiuVyfqaZEJCTskvXBrv5?=
	=?us-ascii?Q?h1l10ZkaHVuomBmnIc6vWtmewmfEQT5JKfityRI4rjQDKgRjLcPefX2LUDrr?=
	=?us-ascii?Q?C034Zcqid3fd3vjARde/ZJDpxDryZVkqKFisOMDS1l+0p72gqhvki6ACIncZ?=
	=?us-ascii?Q?dV9nWl1GkdzEMqAtct8ZaEJTVhjgi8YbFUkqyWzHsVuNRSHKwPBagaCJvkMo?=
	=?us-ascii?Q?uXaIYHlNZv1dShSBXKxMeB1AX7uHff3PTde6TNQFVHOnF61/+aWepZ3hmZVd?=
	=?us-ascii?Q?aNY8SSh6aNKm5igxxTfg0yp88ClZPeiu39LJUFLzuJ370h7p68F+NXiVZdxn?=
	=?us-ascii?Q?Og9i+OkQUGdXakFuZbRapKxoQXfeVZXTciwRI5IQDdBBXfSNgo05/dqba+a0?=
	=?us-ascii?Q?x8BLvC/yiRnHhpTtDqW/RktNlB8I5lLmUxzY+SafIVmUoXkDqf699iWLegvP?=
	=?us-ascii?Q?N6onsU/JbMFUy7WCsgS5rrn0R4hWoM/cLMJqOg+0BhofbSabUk7NCKnqFK4A?=
	=?us-ascii?Q?HPAVlVIKF8qdWkkFQridySEbFIop7Y2dvag7GMl+mAOaa9mIRs10PPht7ZdS?=
	=?us-ascii?Q?Of+8P0w18/Fh63Oq2SJSVfDQvLTNGtDpN7JA3kBykDuNPH5qQIvVuDbBPKV7?=
	=?us-ascii?Q?HnoR+23W2foI2vEFTQIwFmWQrklolXOSRVChfVxG09GUkNa1nJifbXjOBOcq?=
	=?us-ascii?Q?xEPK+HSIKRr16hBYyCGtp6yxOTW+uogGa5ukmHX6QPJXtqFlFCzLpTbanWk/?=
	=?us-ascii?Q?dStos48ilcOX1wzUvtNoCfy+N33VP6VbaZP3DJQaRE/8D+zUrQ6p302eDm9T?=
	=?us-ascii?Q?MqFCrrgZXXBfo1ism6Z5ajhbdt0ODmk5HqxP1XKERAMg=3D=3D?=
X-Microsoft-Exchange-Diagnostics: 1; DBXPR04MB317;
	5:lslmqRqe4yaK77/wnJ+Iuz/1dUraDiLu7qb6UgFbUaNJ+f7LkWHmVdVj5PdFwqs1VtHCIRC41fbI/HgvWyZ5YQDu4a0xtILbqCwzOIq3xunjQoPod5/o8qlZ0hLbZl/LjeA+c93i75LJlY583LCFAA==;
	24:1qPsuWfyS4H1FM7ETpXpEaVoyi9+3YAe16kcyDfjk3kFTi277dzp1p+pTQdrh0EzBDsMdriIUlvv/41WaSROgjA+f/llGlz2ufOPA79kcAA=;
	7:/m0Vxaq2zF8zKvcco+E6Xc83gUVQi0LJ+i8r+objP8VA15xagNk1jVtL7mGxe67MGBW285txVkECLrRDSr5d0AQ2HO2T6MQWBWkKTdwxgEBHeNF6k7JpMdr05abojX5LR5AYxmTlr/cnNEyzQkGPgdTw2pHZm0TejQ6Sr5/cU9hHIqBcLRCQkV65G8O4gFVRx33Tkfcy50qnkmDqPuG+DFuZTBYMmP04YJtmC5NCxRk=
SpamDiagnosticOutput: 1:99
SpamDiagnosticMetadata: NSPM
X-OriginatorOrg: nxp.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 09 Jun 2016 19:42:47.2599 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DBXPR04MB317
Subject: [PATCH] weston: Fix builds that don't include XWayland support
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
X-List-Received-Date: Thu, 09 Jun 2016 19:58:18 -0000
Content-Type: text/plain

If DISTRO_FEATURES contained wayland but not x11, the build
would fail due to nothing providing xserver-xorg-xwayland.

Signed-off-by: Tom Hochstein <tom.hochstein@nxp.com>
---
 meta/recipes-graphics/wayland/weston_1.10.0.bb | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta/recipes-graphics/wayland/weston_1.10.0.bb b/meta/recipes-graphics/wayland/weston_1.10.0.bb
index 37a4839..5bbbeb8 100644
--- a/meta/recipes-graphics/wayland/weston_1.10.0.bb
+++ b/meta/recipes-graphics/wayland/weston_1.10.0.bb
@@ -100,7 +100,7 @@ do_install_append() {
 	fi
 }
 
-PACKAGE_BEFORE_PN += "${PN}-xwayland"
+PACKAGE_BEFORE_PN += "${@bb.utils.contains('DISTRO_FEATURES', 'x11 wayland', '${PN}-xwayland', '', d)}"
 PACKAGES += "${PN}-examples"
 
 FILES_${PN} = "${bindir}/weston ${bindir}/weston-terminal ${bindir}/weston-info ${bindir}/weston-launch ${bindir}/wcap-decode ${libexecdir} ${libdir}/${BPN}/*.so ${datadir}"
-- 
1.9.1


