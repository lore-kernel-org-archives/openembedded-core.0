Return-Path: <bhuvanchandra.dv@toradex.com>
Received: from emea01-am1-obe.outbound.protection.outlook.com
	(mail-am1on0113.outbound.protection.outlook.com [157.56.112.113])
	by mail.openembedded.org (Postfix) with ESMTP id 7E74C6011F
	for <openembedded-core@lists.openembedded.org>;
	Thu, 26 Nov 2015 09:11:48 +0000 (UTC)
Authentication-Results: spf=none (sender IP is )
	smtp.mailfrom=bhuvanchandra.dv@toradex.com; 
Received: from linuxdev-in.toradex.int (115.115.225.206) by
	DB3PR05MB268.eurprd05.prod.outlook.com (10.141.4.27) with Microsoft
	SMTP Server (TLS) id 15.1.331.20; Thu, 26 Nov 2015 09:11:45 +0000
From: Bhuvanchandra DV <bhuvanchandra.dv@toradex.com>
To: <openembedded-core@lists.openembedded.org>
Date: Thu, 26 Nov 2015 14:40:55 +0530
Message-ID: <1448529055-14630-1-git-send-email-bhuvanchandra.dv@toradex.com>
X-Mailer: git-send-email 2.6.2
MIME-Version: 1.0
X-Originating-IP: [115.115.225.206]
X-ClientProxiedBy: SG2PR04CA0051.apcprd04.prod.outlook.com (25.169.49.147) To
	DB3PR05MB268.eurprd05.prod.outlook.com (10.141.4.27)
X-Microsoft-Exchange-Diagnostics: 1; DB3PR05MB268;
	2:yt7GJ3tHNsSFP9DI424/TbX6f0CBWWluDqDFxwgUFa/3CEQIjaFD9wCQGYkh3YCwHLP9n/rnf28WQI4OF64BRFwT1LEA+cmpPKnMOSCo15C+V9ZROig3RWapttyRlUvZBsyj8whUEu0OcSuMMXva/g==;
	3:7CMcOmKQ4ziJlBjQRdLbMC/da8AaE3ZJTUOgmeidKPlYX1IKYGXphhAMzrXXCKTQFhkaNsXQN12JPY0C7+ZqbX1dlHvY5PU+oZXqGYAtqA9mwSQXOEGdXb+Cj416Iy5E;
	25:bJXEcxA34hmotUd7BovryZ4OPIWj8AkonapzFn5XSzYnzJz8C1NRb6yZbxz+1X1Ie+wP5TP9O3QH3pHZtsPAK4WBpnGIMX/k/gkiRdfVU4RSO7KuuWjXEggQZuXbJ2VFDh7LeUG/Tk6Cp1dLVu9M8vm9YBLtjWDo9UCjK5wgjQkAxeDrKORZI39c/1/kqUjZLLAJJYCxr6qruG972RkC/BCexmbLJ4Jz/53W5x+8U5KDN1WAwH3d+D5JI/WBX4rF8U55+kWgzymyyx2Oss0LdQ==;
	20:6O+vfDzvH/llnAX1uMcgwQkygmQGhJ4Iv73PmX9Q5P19dsPyf6UbsUYF/srlk0MJiO0CFFtEn+65NfGJaifQ1ADFjerAwSoEBTj342/ltCJ7ZTdgo5qLZyYTf9Aacg9Tx5WRjxiVIJaHxqh7cy/oVj43LDA4B+NgW8kOGyqOY/u2c9OHRFXx/8DqjpW52FrOsCaNsMMv/kI8jWI8QYqDdbq5+7iEqOVYnVzYP4OQXO1qcZb+gfHzbhmZLNU1ntx62LZ93Q+NmRTK1NU7LVhzHgeDhFkqEMvaLS5pKY7I9l4NH5os4ghd7Al2brRIOE1Q2pzJitLxORmyLtf9PKDgqg==
X-Microsoft-Antispam: UriScan:;BCL:0;PCL:0;RULEID:;SRVR:DB3PR05MB268;
X-Microsoft-Antispam-PRVS: <DB3PR05MB26851A8974F824F1156626A8D040@DB3PR05MB268.eurprd05.prod.outlook.com>
X-Exchange-Antispam-Report-Test: UriScan:(90676262408878);
X-Exchange-Antispam-Report-CFA-Test: BCL:0; PCL:0;
	RULEID:(601004)(2401047)(5005006)(520078)(8121501046)(3002001)(10201501046);
	SRVR:DB3PR05MB268; BCL:0; PCL:0; RULEID:; SRVR:DB3PR05MB268; 
X-Microsoft-Exchange-Diagnostics: 1; DB3PR05MB268;
	4:XocWul8Q4ihZQcUd/aFvL7nzAPiDO7e3AuInqNlq874j6ROsQwzn0SCNoAruHcH50G0SgMyevAdEUVpHAlPLV1uCwb+vDqN8RHUti1SZZl1rS59nq89qpV7shbTTso8/iB/DPh4U49s8KOBqRF60gbWA/IIyQ6Vn2l1+qQYT3Y1DgyQNm6We5aONc3jihsnVc9mvAnKPhW0gnXRWZ5uqy0E1mVVLd/fue0OBgecp4BysQJz2M/D8Y/BjNyqI04Nxmqx/pn0Vor1N2vxjXuch+VMWAAWe/oV9yTyReRVV1k14ci67Cj5jJ+nWUCjfgVsvCkK3jUBwHH6QKAkfRP3OCj2c8iMLzfa5vV0/r6wsm8foB1qGFK7ZwQBuMhw+0kMntPdS2Aw4L6h5KCDp7v2mPxBRvc8ApZoSiD8DrgoYzwVWs4mdRfD7SJr66bIie21f
X-Forefront-PRVS: 0772E5DAD5
X-Forefront-Antispam-Report: SFV:NSPM;
	SFS:(10019020)(6009001)(199003)(189002)(50226001)(106356001)(50986999)(105586002)(33646002)(101416001)(86362001)(47776003)(87976001)(2351001)(110136002)(81156007)(189998001)(97736004)(5001960100002)(107886002)(53416004)(229853001)(42186005)(66066001)(19580405001)(19580395003)(92566002)(36756003)(40100003)(69596002)(5003940100001)(122386002)(77096005)(586003)(3846002)(4001430100002)(1096002)(6116002)(5004730100002)(50466002)(5008740100001)(48376002);
	DIR:OUT; SFP:1102; SCL:1; SRVR:DB3PR05MB268;
	H:linuxdev-in.toradex.int; FPR:; SPF:None; PTR:InfoNoRecords;
	A:1; MX:1; LANG:en; 
Received-SPF: None (protection.outlook.com: toradex.com does not designate
	permitted sender hosts)
X-Microsoft-Exchange-Diagnostics: =?us-ascii?Q?1; DB3PR05MB268;
	23:vfdxo16TfzCuGYD/vQIpjkU4K7s2lO8DSW52kTz286?=
	=?us-ascii?Q?2C/PKfwKmxrpjBamf2RGlFCTj3Bz7OTUdqZ9TJ1CAv6a6g9TMLsCvVaKC8Ol?=
	=?us-ascii?Q?OI16GIgQyL6AwhN3r0j3gl/o21LmvCdssPd073J5kS+npxyFK9zS6Yy9v5Xt?=
	=?us-ascii?Q?RQDg7fyrr8LtLJi6MNXGGes+A24yjm9es5h1uAg/N8MxuS/SUX173WJE0LdL?=
	=?us-ascii?Q?JtVuXaPKSO4kmscuulDpzekC/NtzXEtta4AbPkUt6rvJTgws2qTQ0NknrhLd?=
	=?us-ascii?Q?0CdnaGLfihFKZX+o6LG2Ji4pOq6taN2f7FlFKsmvIioDid3MiV4NSlLr+iei?=
	=?us-ascii?Q?GXb8xow4Gqw6+Si74b9WMv3CDN9iL/3AxkWoYGOv7KcSmBD4fkJx7sQMocQW?=
	=?us-ascii?Q?DFOF4C1P8VpV+a5kSwcgP9s/njLtA4dH1oO+Fgm3bq/FzNXdv4hFceMeL6sI?=
	=?us-ascii?Q?JUtg7EIITPu2RP8Lq6RDmcxlyOR/IbSxIWqZ35FC/e+WnGcsbnHth672gDMt?=
	=?us-ascii?Q?opph+E4tRL490CEbvygBl9HvVIBgtmPI3HOnf/Mss5kUyOrBoLR9rZJ8DRhR?=
	=?us-ascii?Q?4/yudI4ZRK7Xh++hWaPygw502Vvrmvn30DfvZbX+/A/nhS8+Zr1GtIwGJCeo?=
	=?us-ascii?Q?Pu4o5iFsRC+/Yfj4iMnD66psX8/g+ioSYESBWknPEYpnnu5dPfxuhxYgm7ZX?=
	=?us-ascii?Q?jCzkBh4PeVm1AMGI/GYL66XOCFT5wFlz+rK+apVvPIbiljYB8Vf7CWh17+Ew?=
	=?us-ascii?Q?u6gxCzrwha9vmCQL4Um7/ajqGlxAsRdyn5M3kWr2hRU6NaQhHN8SkbSIO1eg?=
	=?us-ascii?Q?av3AwEiHKW+wKiq8kX8A86HQXJjfSACLeuxQ6TqMNzn78Khse67xxhqHFS87?=
	=?us-ascii?Q?/bw66j+k1XYvukX+orhvkEEINHyI6JyZBpPQAH4Gg43sovxpVWcctCN2fNgd?=
	=?us-ascii?Q?uwrL85+J4eUlhKOEplk5YqoYFeUDAoefZ7dazwfRMS79eCB2h/cMfb3n27WK?=
	=?us-ascii?Q?FtSuxXlbuXf3UTA2Zfrlgi4v9+dVV5/W4Uee4ROefzJ814LALTx4v/iZA3Gh?=
	=?us-ascii?Q?AP8Lj+Q6+E9WPNBwHonkcdzNKgW3O8yNrs+8YS/OGf4au7TQ=3D=3D?=
X-Microsoft-Exchange-Diagnostics: 1; DB3PR05MB268;
	5:uMQptfBdV2wVXai41tjX3QG0d+BCj1QQ0eRXybxAzK7/dMQGR+3lj8xLD4bj79ysWPa7mLF5ioXSf472CguYJOUEaamsgDhjRvmOcHLOlV6O2O92xm3LkPiFyHkr/4HNwVEfyCFHuOrMofJUSCc0og==;
	24:hmusLMYyMOCcc3pMiizT/DkmE9fNLYBvPAKls3tLuxe5BZWrJtAR7FPo9y6AlGoYN8qe/s1LGIixz9Z+kiZ5qKK3L8wiouiU0zg3TBHAdbE=
SpamDiagnosticOutput: 1:23
SpamDiagnosticMetadata: NSPM
X-OriginatorOrg: toradex.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 26 Nov 2015 09:11:45.5770 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DB3PR05MB268
Subject: [fido][PATCH] linux-firmware: rtl8192cx: Add latest available firmware
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
X-List-Received-Date: Thu, 26 Nov 2015 09:11:50 -0000
Content-Type: text/plain

Add latest available firmware binaries for RTL8192CX chipsets.
These new firmwares have been released in 2012, have been used
by the mainline kernel as preferred firmware since 3.13 and
even backported to stable branches.

Signed-off-by: Bhuvanchandra DV <bhuvanchandra.dv@toradex.com>
---
 meta/recipes-kernel/linux-firmware/linux-firmware_git.bb | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/meta/recipes-kernel/linux-firmware/linux-firmware_git.bb b/meta/recipes-kernel/linux-firmware/linux-firmware_git.bb
index 16ebf6a..e81bce0 100644
--- a/meta/recipes-kernel/linux-firmware/linux-firmware_git.bb
+++ b/meta/recipes-kernel/linux-firmware/linux-firmware_git.bb
@@ -145,13 +145,13 @@ FILES_${PN}-rtl-license = " \
 
 LICENSE_${PN}-rtl8192cu = "Firmware-rtlwifi"
 FILES_${PN}-rtl8192cu = " \
-  /lib/firmware/rtlwifi/rtl8192cufw.bin \
+  /lib/firmware/rtlwifi/rtl8192cufw*.bin \
 "
 RDEPENDS_${PN}-rtl8192cu += "${PN}-rtl-license"
 
 LICENSE_${PN}-rtl8192ce = "Firmware-rtlwifi"
 FILES_${PN}-rtl8192ce = " \
-  /lib/firmware/rtlwifi/rtl8192cfw.bin \
+  /lib/firmware/rtlwifi/rtl8192cfw*.bin \
 "
 RDEPENDS_${PN}-rtl8192ce += "${PN}-rtl-license"
 
-- 
2.6.2


