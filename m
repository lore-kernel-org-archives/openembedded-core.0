Return-Path: <Tom.Hochstein@freescale.com>
Received: from na01-bn1-obe.outbound.protection.outlook.com
	(mail-bn1on0136.outbound.protection.outlook.com [157.56.110.136])
	by mail.openembedded.org (Postfix) with ESMTP id 84C196FFD7
	for <openembedded-core@lists.openembedded.org>;
	Thu, 21 Jan 2016 22:48:09 +0000 (UTC)
Received: from DM2PR03CA0026.namprd03.prod.outlook.com (10.141.96.25) by
	BN3PR03MB1413.namprd03.prod.outlook.com (10.163.34.20) with Microsoft
	SMTP Server (TLS) id 15.1.390.13; Thu, 21 Jan 2016 22:48:08 +0000
Received: from BY2FFO11FD024.protection.gbl (2a01:111:f400:7c0c::111) by
	DM2PR03CA0026.outlook.office365.com (2a01:111:e400:2428::25) with
	Microsoft SMTP Server (TLS) id 15.1.390.13 via Frontend Transport;
	Thu, 21 Jan 2016 22:48:08 +0000
Authentication-Results: spf=permerror (sender IP is 192.88.168.50)
	smtp.mailfrom=freescale.com; freescale.mail.onmicrosoft.com; dkim=none
	(message not signed) header.d=none; freescale.mail.onmicrosoft.com;
	dmarc=none action=none header.from=freescale.com;
Received-SPF: PermError (protection.outlook.com: domain of freescale.com used
	an invalid SPF mechanism)
Received: from tx30smr01.am.freescale.net (192.88.168.50) by
	BY2FFO11FD024.mail.protection.outlook.com (10.1.15.213) with Microsoft
	SMTP Server (TLS) id 15.1.355.15 via Frontend Transport;
	Thu, 21 Jan 2016 22:48:07 +0000
Received: from paisano.freescale.net (paisano.am.freescale.net [10.81.19.190])
	by tx30smr01.am.freescale.net (8.14.3/8.14.0) with ESMTP id
	u0LMm654012064; Thu, 21 Jan 2016 15:48:07 -0700
From: Tom Hochstein <tom.hochstein@freescale.com>
To: <openembedded-core@lists.openembedded.org>
Date: Thu, 21 Jan 2016 16:47:33 -0600
Message-ID: <1453416456-27728-2-git-send-email-tom.hochstein@freescale.com>
X-Mailer: git-send-email 2.1.4
In-Reply-To: <1453416456-27728-1-git-send-email-tom.hochstein@freescale.com>
References: <1453416456-27728-1-git-send-email-tom.hochstein@freescale.com>
X-EOPAttributedMessage: 0
X-Microsoft-Exchange-Diagnostics: 1; BY2FFO11FD024;
	1:EE0Fghb9eOI3YbciVb195YSJOBB/n8CskaH49W2x1dRwg86yy792q2v4PN/BK6tbO8rEibk8RBegPExtCxwDh2yF3DBRdxLLiUgobz9O5jaHyOzlkD3tp2BCHF2tUpVAsBhNbd+ufyma3e8j30S5BNhqV+NYDUkuLOToiWZSjBBCSb/mHkYQTkloCZnvUQEoBvWZuAPxAgIDmZC/PsXiWlIKBy0SMExLnCXRxFyOTvLSnzd/llDW0fbv7aRH11fx8K60u3SCiCVXkVaEZlKeVFTW1sU4oQynKcpU52+t3K/F51rH2ZGFu0cW3hHg5Phpqf3o7QhkImvPCtWMYzByjM7V7oAJKTm4iwTj6aOoqWYkWn9cv2lfpPfeer/PfMEBhLg2GV+HbOwiPKXCToNBqiTA9eLT19VQyl3gKONY9WaybV3gYxukiMncI+5sINY9RD48eS8MUZxyEgKwHpNGnU83wIUNO09Cy/2jOaZzcFM=
X-Forefront-Antispam-Report: CIP:192.88.168.50; CTRY:US; IPV:NLI; EFV:NLI;
	SFV:NSPM;
	SFS:(10019020)(6009001)(2980300002)(448002)(3190300001)(199003)(189002)(230783001)(19580395003)(85326001)(87936001)(106466001)(2351001)(229853001)(76176999)(33646002)(47776003)(92566002)(110136002)(1096002)(81156007)(5008740100001)(48376002)(107886002)(50466002)(5001960100002)(5003940100001)(450100001)(77096005)(36756003)(19580405001)(189998001)(586003)(2906002)(53416004)(104016004)(50986999)(1220700001)(11100500001)(6806005)(2950100001)(86362001)(4326007)(97736004)(4001430100002)(50226001);
	DIR:OUT; SFP:1102; SCL:1; SRVR:BN3PR03MB1413;
	H:tx30smr01.am.freescale.net; FPR:; SPF:PermError;
	PTR:InfoDomainNonexistent; A:1; MX:1; LANG:en; 
MIME-Version: 1.0
X-MS-Office365-Filtering-Correlation-Id: 9fcd5f04-ec70-4d77-5ac3-08d322b4ee80
X-Microsoft-Exchange-Diagnostics: 1; BN3PR03MB1413;
	2:VMVLfb8BSAr/oyddSghRsAU34mWDIlBnt3IC+QwhsGTyYmb0Lkbf4ZwJMyc+cHUrhVxRWxOMSsCmNdAeDWPJA/chpq6VLjANWz01ZS4NLeKPPo6Jmz7WCChVSEVgVG7oRIVAmqBm/BNDnbOvnkcGUv2MEbtBImq2gGHF+MeErsgoQ/xoepPzjRALP0hH4/3T;
	3:bqvR6Irj/WXf88J7Rojcw9qIS6fDVOyzkZ9VcPnmFPPHfnOIlQOENHqBbMrRdV72gslKyGZ5J0IMEBOddJtFaSzFR/X48WuaeB7P4G+Vy7YgOWSjSG3Msoay5PDnS+zB9CVfsR11f3gdRnO6Im/GovRczbr22CPUYLitBeAVFG5s/tQc6MY2izPCc8DfRw1QKO7MDMJJ7UUXraGK8F8eG9aXQhLGHrPeCNkvBVcZ5Xs=;
	25:vdQX7XP/cS2+LEoQO0PwjNtF4eP3CP1t0HopQ3KxaKBS+PYjuU8jkEF3voBIDAVRMoA0nST0a5KhqDXYGNLr8Qdg+OHVWwluBcOhUWGHs2q4mdxkvmiKhDrnaTFDE4UuxeuqW/NyNS0ptgvQW2dhynTU3s63IJTGkaDOWcD2c4tLoR5joaaxgGYjCC8x8ElpvAXctwnfKBGcwJWL9hUpued4RBCApY6zvyuBLFEyD3pliccLrGq9K8R0PknRE3Ps
X-Exchange-Antispam-Report-Test: UriScan:; BCL:0; PCL:0; RULEID:;
	SRVR:BN3PR03MB1413; UriScan:(101931422205132); 
X-Microsoft-Exchange-Diagnostics: 1; BN3PR03MB1413;
	20:E6mw6ymxRYOwmW9DNR07BFQ5nGRGFicJA4VaVJpjzcXqkdexLRcNj3+YVBmhcwlzFCaxnXjbqgagC88wT+9bcUp88u8WzXW4ee4bv2XUEvrfAjwxgBNlZV2siHR9+BhQMQMVlSXBWISgdeCjlbF96exnBaHfJ5w/3xPYczHtm4RicC1v5Kp41tLSKAmcDTnHSvo9WpCuInacPD5dgtPkY87l1DE1gjA5srNDBa7whcR5+UuxZpautcDfok6eKnJL/+BK93Lansn5iMbTtdLYbbiWIi3AlW4JtZFb49t004Ocw83Nk0pWKMykXcGq1pQU/LYo+LzLXsSWF5Sm9yk6kFPvbR+mbC+mNT6ridQmdW/IreSyGf9ILoCat1aXSDNwr6SPa0N9QAguitsRCLtZCr7VTwKfeBfGfUSJ98+tUZeA+mEurWDYa+eNhUBMEAoN
X-Microsoft-Antispam-PRVS: <BN3PR03MB1413F82327600C62217EFB14E8C30@BN3PR03MB1413.namprd03.prod.outlook.com>
X-Exchange-Antispam-Report-CFA-Test: BCL:0; PCL:0;
	RULEID:(123027)(601004)(2401047)(13018025)(13024025)(13023025)(13015025)(13017025)(5005006)(8121501046)(520078)(10201501046)(3002001);
	SRVR:BN3PR03MB1413; BCL:0; PCL:0; RULEID:; SRVR:BN3PR03MB1413; 
X-Microsoft-Exchange-Diagnostics: 1; BN3PR03MB1413;
	4:Nb4448NIBHEKyEg3bWSUSY6V6JuS/XnFBDgjUTfeO2LspIMaTE2XcDXKqmZDbjuQEu3sqiKXMOrUEQIdl/1xd0rKGQ3dKxXAKKcB+sZ1tgKBfphdWgpM6k/a9QZ0kdmqD2b6cqP6XvimBRaoexlAV8K6Y94IhcFDiiun8z+IaNcGUb6HjSnvNxC2k1fMxR184eHr8garIh8xAEg2pf4fPpddkJBhVUcp1nWZfWr3B7hcRlYlUa3zkHWtOf5YqY/JW/Pa5pcfDUzAbDWwTvMRRu11lIfNJehEIPH+sxtcC46qUOZLc/EvCv/j/bLg6EamxixCMYSzkBbAeRV5m+iDB0EtE78/c4Nt5aq1pQ8jQq8kIT5SP8QVG2r/eFVsbLZiN7DGSbzXroQGHS1IqUPDModWVHTL7VgJxc6qwuWz5bcGkCW2AzGPeAyAOJumFNR+Nkzygnf/1sG52t34wGVVzB5nnb4AEyw1r3lq3jZSV4U7HYO8wwEMNsUzmtcLk7Mi47a/rwM6hQBFgTn8thT+rARsr2qUKApAFITqRLI1xTI=
X-Forefront-PRVS: 08286A0BE2
X-Microsoft-Exchange-Diagnostics: =?us-ascii?Q?1; BN3PR03MB1413;
	23:4fDfLJlFdLQ8h5W/XzZ+pNrlTw3NFqwF9qvq4gNr4?=
	=?us-ascii?Q?ArcDGWY1D9nUzCV+dUj7eO2DpkL0f/tl2EmCdfpsLAZbOc4tgy5yS4a+bfZ2?=
	=?us-ascii?Q?gKF0doJTjG/vhng6cYuvfXjar67r7ZryfY4akyRXgFr2Th95Ch7eqYhSwkfI?=
	=?us-ascii?Q?Xcfzh27OjGTLHR73r4qkjnpcYCn46IADDBm+VxjdCHZsj8ekk4nPSHo/8oSd?=
	=?us-ascii?Q?fkd5t6oUCQLG2M5bp6jW9UUD+JF8jfdDjFEx4glZkg1CQrONrBfAY2uCdMhv?=
	=?us-ascii?Q?zdbPY98kNSv64VoxgZjRplrnnoj3P99NUNiv3SFbStIbNhk5DCecfR8PQNHE?=
	=?us-ascii?Q?X0K8NrjMQeAKvxewlpOrR3+zFFhcROwhPzDMhUd6q3/cSp7t5PoN4Pod0f7O?=
	=?us-ascii?Q?vqRhHma0aMzMwo9AeNEKG52f0pXYEAGnY/ri2MUEa/QUIruEcehExVcwc4nW?=
	=?us-ascii?Q?7x04yR0wCXwIfZLBHcMoYuue5a2EiTUA+FdDoKv81DgrfTAQLomjfuYp0ecI?=
	=?us-ascii?Q?gff7tfhKpGx/tWSqEBPjQ9VVVRdLM/TDBTbt9dtxo8ktwg+kmMtERwDBxC1J?=
	=?us-ascii?Q?oTcogWLEWnkXyM2k9i6PxaYw2V8hmZFOuEU3hFoBT23Tq5SG2XIbLvRWxhzz?=
	=?us-ascii?Q?wV4o2icpJtpBX+NzZMGFgK9cETXvvIY8nepI+DCv+fDeLH28odwBcIyijQn9?=
	=?us-ascii?Q?nJiXfd+8RXUzI7tV9Bz9OKZ7tZmxPO9nL90eHC47IY7DacHJALOBkldCWBrs?=
	=?us-ascii?Q?8FQbooSSK+oCmJ2NbYM9suD25AHmpPmV4C6MYMqPz33aC7ZgCxg58RIXKLNn?=
	=?us-ascii?Q?X8gBf5cnVhVVM7VbuuQRYhhUmP4IJdajWJxuDa/fHydripxpFDWHzKwviskI?=
	=?us-ascii?Q?4JsvsbFXSuiKCwD+x7O0SaoG19hfQ2DBycV2GYq4LB/Pjpi4Rs8O0AQK8Xcd?=
	=?us-ascii?Q?7h5z3EX2lYb8hLIdfutLCp9h4ToZRiAqMXuFFsL13xRxqLXlX75na9z+E5P9?=
	=?us-ascii?Q?jG/H824ODuai3QxjibpmZ+/vi2BbDY3XZC7HQd4MreOGojjMVRR7Ls/lsfVD?=
	=?us-ascii?Q?8No7SX9EyQaXlaOC5HCCSIssPlytaUCbnyPABzoBHrmTorea0uCUypHbj7ce?=
	=?us-ascii?Q?nVsVE8coN5ygphLmuUGKadh9jiOHOyRYyDT2VnImq5EaSCz+EMLFE9IWqjHu?=
	=?us-ascii?Q?6CgZ3NvE1N8xnc=3D?=
X-Microsoft-Exchange-Diagnostics: 1; BN3PR03MB1413;
	5:E3IsRAwb1RiDghGigrwirezo7xT2N6UaLiFIJv+nNjdaFjSBSPKaxzBA5HDqxE2tFnjNE0eWAvAGbZAcPss1V1zYnAhmQn51M87vk8umxch1/pK4tbwzJRjAN6YnjIZutJuSclR4g5svWZqze56u1w==;
	24:rdjmOHfyzYf43ujqIctNBYKxqZZS54II/hdekH+r9e8r2E4DMm83MIjiIYDT7OxMOLO2ixjs7u1n1drqRi/Wo++Ll60nfHEqIQXklVShY1s=
X-OriginatorOrg: freescale.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 21 Jan 2016 22:48:07.7722 (UTC)
X-MS-Exchange-CrossTenant-Id: 710a03f5-10f6-4d38-9ff4-a80b81da590d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=710a03f5-10f6-4d38-9ff4-a80b81da590d;
	Ip=[192.88.168.50]; Helo=[tx30smr01.am.freescale.net]
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BN3PR03MB1413
Subject: [PATCH v3 2/5] packagegroup-core-x11-xserver: Add xserver-xorg-xwayland for XWayland image
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
X-List-Received-Date: Thu, 21 Jan 2016 22:48:11 -0000
Content-Type: text/plain

The package xserver-xorg-xwayland is required for XWayland support.

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


