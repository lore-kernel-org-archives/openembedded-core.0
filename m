Return-Path: <tom.hochstein@nxp.com>
X-Greylist: delayed 10762 seconds by postgrey-1.34 at layers.openembedded.org;
	Mon, 18 Jul 2016 19:22:09 UTC
Received: from EUR02-VE1-obe.outbound.protection.outlook.com
	(mail-eopbgr20083.outbound.protection.outlook.com [40.107.2.83])
	by mail.openembedded.org (Postfix) with ESMTP id EE85B6FFD4
	for <openembedded-core@lists.openembedded.org>;
	Mon, 18 Jul 2016 19:22:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nxp.com; s=selector1; 
	h=From:Date:Subject:Message-ID:Content-Type:MIME-Version;
	bh=+U1dcmEWOEGBtv0lv7mw7/fW8b2uUGrLI4S2s2diwHU=;
	b=bJXT8vntS08qw5sM3CivVnHIjnUfsWCYHeusAZKeJYXZsiJrUPYniNm7PdbS1ec2R9KNa1//i3bJbsVR3lpT/JNXpTvVsD1s8Zz5mavZJSWR5rJVJKfaqLknvUBnpqWojfNSF8C7GzLMACwlSTzGwHF/fSfiSgStBmbZw3PUzCI=
Authentication-Results: spf=none (sender IP is )
	smtp.mailfrom=tom.hochstein@nxp.com; 
Received: from tx30imx-01.am.freescale.net (192.88.168.49) by
	DB4PR04MB313.eurprd04.prod.outlook.com (10.141.239.146) with Microsoft
	SMTP Server (TLS) id 15.1.539.14; Mon, 18 Jul 2016 14:47:32 +0000
From: Tom Hochstein <tom.hochstein@nxp.com>
To: <otavio@ossystems.com.br>, <openembedded-core@lists.openembedded.org>
Date: Mon, 18 Jul 2016 09:43:05 -0500
Message-ID: <1468852986-2487-2-git-send-email-tom.hochstein@nxp.com>
X-Mailer: git-send-email 1.9.1
In-Reply-To: <1468852986-2487-1-git-send-email-tom.hochstein@nxp.com>
References: <1468852986-2487-1-git-send-email-tom.hochstein@nxp.com>
MIME-Version: 1.0
X-Originating-IP: [192.88.168.49]
X-ClientProxiedBy: BY2PR05CA035.namprd05.prod.outlook.com (10.141.250.25) To
	DB4PR04MB313.eurprd04.prod.outlook.com (10.141.239.146)
X-MS-Office365-Filtering-Correlation-Id: 87a54471-d260-4104-127c-08d3af1a73e6
X-Microsoft-Exchange-Diagnostics: 1; DB4PR04MB313;
	2:yrZJflQlCqKxL94Zzbteg+sRSTA57PshyU+pxr06EmT2LC1eAsLYKr1YMZqbRKrEwAMLS5kR75Lz2hyUpolIAVapCG3UJ9yydr8jX/sBnFIej285HpPyokqxtKWG26bkND2sv4fENuKHHw8dB21xW40YJ+J1HooWTm0+URa916wmyI+APiCfIVt+qBsNwn11;
	3:l/7gUqytr/j4SLITab1gKxoE00kgq8DLhgkuljIS9yifdSt8/D49fy1r19rfAWO+PzkzOHxtcEdwzrf+UreKG/N7Jh1ALhCxrOJMOe2/Z6WCqusAd2jKGxxa6XEnPv56
X-Microsoft-Antispam: UriScan:;BCL:0;PCL:0;RULEID:;SRVR:DB4PR04MB313;
X-Microsoft-Exchange-Diagnostics: 1; DB4PR04MB313;
	25:xY5gHrlPJyc5hfAA9LwME+QFGQshCcgoBA1gri6PZ1+HibppB0h+vGqNFpZhYqFhVVLA9lgWoKhcUD+pahNDnm116V54jah4CbG8BDB5HLw2w78og9sfpeYXn1QhuyJBegFqNLnz7EcmVmlEE14/UQ2f5Svuo3jUE2vIis2+lFRtBgPWtl5o9p393G8M4/WACGNNtG3wTvFAR9CEF0bxZ2Rr6AErVbBgz+hfS1tLH+7e3ZKEg+G8WzBMIgBt8vhRS2Obc4uDymQMhqiWEw/unUMO1i+vMHcsuZHTU+7UGAoeGZ2GfWCqYGVpdxhVcT/tW9SwzW5brlpCNp1YYP0sH2w6cgyzMyTTfGiF8KqZFDDJ936VfXIgBFXzptbG0bPQeDPVBjIaLXe/hm10Ciwu9Sz/r3I+htDsN7Gmgl+2yKizSl+K7u7wy763s0GxMZmOR5gPjsMXTpV+Jl/M2XYVnYfDhIpxvqRr1v/w0x4XPFpMf9ps1VxeVBVSgukCB7qEGV7sPZpEhJamW6HVR+MU0nm8NzALeFr3MeFJBtf7VZRkB4/uj8XkAi5T/sLn1MXrBn4wvPGd4Nrl6+5Q9EU7b7vIcMT7NS0wwwdUlkTESRg0WnlapjY+IM7l813lgKaPmI96caq0ydDg/tKM5yvvUAP/5MUL1T2Axtnj3YpOCowRli7nXEPpdoGHcZCbyl1u6ADUYrPHvmumbf9QbEDk4TiGbQteZeVjMima00svDTk=;
	31:tZRLijRoQZu/XkA02dBDE4QWsCmGOet2vLqw4gXl4IhxQqZibUGIrMmG5wSq3bHdYuXc/g2sMOPCtFqge0/7ZBh/vKlnsz/TJS51W+7B16hYbYxEahVx47E0I2AIcpU6f+Z1Xz/osZdA/4WKpu0lqL7jpN6v8pl6aKPIteYff4/hiAvsIgvbGrFBPt9RfIA1RJ5MlzdE1v4kButXIlI7eQ==
X-Microsoft-Exchange-Diagnostics: 1; DB4PR04MB313;
	20:/T8QufX9ZQd/XFveb1rkYz2I+tMbLZBhj4Xun7O+mkmecBKNYosAro2iqKdn+VcMSw4Ro2lJs1DhrKCYm9bFw3Nm9fUG15gNvBubwR5HThXAx9rbt1yF4bYZT29Zt2P6+YKdl8+quCAXrfbpowtNI3isMxskIeaRGPIXQiZo884TOgCi9tUervkCepelTGNzN5fwHKXrmab47K2SEFya/thh13EDtpdIOjiUFQEuN7AQumaU+4AeLDfSPRdk4yfSAPfSh/tw88VRQsL11+e6o9DXTq7G2ItrBka8O/QZ/2nHih522bfXZcnaG3Yeg5MjvT+iaSuok08bnbVkpJdp6r24QBORuPS5f9hiskybJsebwxX8dBs907r3zPnfuJtnbRmJJtzYLXtyuiv297Y4TieokHuheVdYkgPBHUNxYUhVCI5xbn/GTWrcazG2qM2yVmceLNPE0QlBBlNLjzspT7MEIl9rZ1d6MJXpdLT7IG4bxVVLt3NbcId3gn/6PwCS;
	4:frzp4e9p+7CfOarKVg9yrAduJ8BpfxIu/c15ZJInUX/EMfFkppDW1lqrmrbj3+bCyFIOHyolEnbBle+Scj/FGSP5i6jKVWhOB7INNMoaQpIrquTsJHfAhJhF3q33+zeBfAJqdupbkXAVQahSpj4BOVuePj61KZhiGBjW5ddvIb8OKF+ygN4tdiFi1a6++rKvwDe8w0GvhLBKNY/kbPCxpE8fzp1c4TilIp+FzHTk0cKrLTxo3egnYNyunrv5HicdS3oMRmGHk+IACZUiI4HE++71+92FvxxDXU0kwWqfHx/pzGiIMnaNkcQVIrUYHv8qOJ0XPQnZcHvV4uMtLoUYSwibxzbRBR6x73Fs8hk5RyTt8Xc05U7mCKFkxr8NDwCPqGZZSfFabzZSKiEbsET0c1YLBXYz8LMCpc0b7aMGhgrG8Zz2Js4EYK/gjn9xXeFD
X-Microsoft-Antispam-PRVS: <DB4PR04MB313E40966A0F11602BC0CCDE2360@DB4PR04MB313.eurprd04.prod.outlook.com>
X-Exchange-Antispam-Report-Test: UriScan:(185117386973197);
X-Exchange-Antispam-Report-CFA-Test: BCL:0; PCL:0;
	RULEID:(601004)(2401047)(8121501046)(5005006)(3002001)(10201501046)(6055026);
	SRVR:DB4PR04MB313; BCL:0; PCL:0; RULEID:; SRVR:DB4PR04MB313; 
X-Forefront-PRVS: 00073DB75F
X-Forefront-Antispam-Report: SFV:NSPM;
	SFS:(10009020)(4630300001)(6009001)(7916002)(189002)(199003)(36756003)(33646002)(7736002)(66066001)(19580405001)(305945005)(229853001)(19580395003)(81156014)(47776003)(105586002)(7846002)(42186005)(8676002)(50466002)(92566002)(2950100001)(48376002)(2906002)(81166006)(189998001)(86362001)(101416001)(4326007)(6116002)(5001770100001)(586003)(3846002)(97736004)(5003940100001)(50986999)(76176999)(77096005)(106356001)(50226002)(68736007)(2101003);
	DIR:OUT; SFP:1101; SCL:1; SRVR:DB4PR04MB313;
	H:tx30imx-01.am.freescale.net; FPR:; SPF:None; PTR:InfoNoRecords;
	MX:1; A:1; LANG:en; 
Received-SPF: None (protection.outlook.com: nxp.com does not designate
	permitted sender hosts)
X-Microsoft-Exchange-Diagnostics: =?us-ascii?Q?1; DB4PR04MB313;
	23:VlRnssDOp2LUXlxJg0LZDq8bfn6qKo1SU3f+iPQHst?=
	=?us-ascii?Q?jMn6UIbkYKYkOmRtUvb+7thvF6/GivKfLYZywS8hDnytxtYyTSQ2qNPdZxfK?=
	=?us-ascii?Q?fysTsDjnyR6BMEXzoJeYRPSZ+flZxVzPCXpfVlzIkbFSO40KaraF6Gsy8iNQ?=
	=?us-ascii?Q?22kFQ5ZOoyMdMCMp5K5B+hYuDMhyNS+BVURyoBA224U2opbMoKKr1p2lGnnH?=
	=?us-ascii?Q?j6HYyxX6KbdpH9OzvnVSXcKODngDrzP7hkobQeKT5iX/vohBTyGPp139vTG+?=
	=?us-ascii?Q?/GucXN7aAJXbx80TkXK455tdPwAW6Y3YpiTH3l86CjWPvsHTC5j5kSwls/er?=
	=?us-ascii?Q?siE7Q6gLWZKy9dey71iPnJo9hI7lVjE5g/HS5zjaR8X0xLdHvJFhrQxgCCD1?=
	=?us-ascii?Q?r2O2j9vmG47fo5ZCiwLmx3X0Z2qf6kHWqAY/sP0EEKhPHgZBPbqo57PN/LFK?=
	=?us-ascii?Q?o6zAgh9VPXC4Dl5KrQjjZ+1WMoyC/HU1IB9/5uIabeewh6NHhtdzxndSS5yl?=
	=?us-ascii?Q?iu041hWGCJ6DOHjFdXuN0a+ZiHXJM0SLCENMlwseQAP7JbTGmtZabxX5j4fa?=
	=?us-ascii?Q?DMNcWq1UpQNEkfcYyrVVJ3WxA4rS9qWV8S2bVE3GNHVpYXVlXeKL3rA8ZuoX?=
	=?us-ascii?Q?UTAy46GV4Yw5rbAwrMoRaWX3AkHKrh0sVRuxPHZ0o5G8Y84MNv7TOx+NPm6H?=
	=?us-ascii?Q?ZzFRsQUoSP1qWnke939rnOP12WSqdcbYARqGSfqPBu92qTSvG0hsFyrAzso7?=
	=?us-ascii?Q?ewy6CpJu5BE7uhSiwVOQ/pHgrSdc79IfSNQ879gSePVAJBAd4j2Voxzf97KA?=
	=?us-ascii?Q?d6mE3ugq7cA+lWz9gtOV2eYFWGauEA3dACii214dVGqmeP4qpfk23W1hJ4m7?=
	=?us-ascii?Q?uexpTe60ye7zPCM6aJQPtF2xkXxxariOTZNdkUxb+yT7l796lpBHMY8DDb6D?=
	=?us-ascii?Q?eCSn2KZwGxFooTeROapliX8iZosYlriwBgg9g1Tj4Xvu9G8A0ClLv84+Uqve?=
	=?us-ascii?Q?e/aWYWvbaDVi0wNuaY5tM3dQ5IcJRIOJf/aMz6vPjK/KYfFTNvLZpNROAqTY?=
	=?us-ascii?Q?Fo+v06l3lMKnyZ0DsW6ifzMzeL?=
X-Microsoft-Exchange-Diagnostics: 1; DB4PR04MB313;
	6:2fz6f6jOePXTdt2OSFE+aPd53wBss+7mSoyyaoovjI4/IglFq4gtY3q2G2Y3yLizk8pmB3SGzTGlYXMzwllk/+z9Wa9RHDmEgdD3++mGKMOdEnXp92Yalx1dzaA2XdwvmAsQ95JIrXeiQ7OmoopMVApYYcI2Co5NmI1H2PqmCvDsinMJcpwvABIPPwtW25gpqcdgwCjEVSjZd6xlI0O+nkLoQ0UZ+obvHbv/0g0GiOFE2Of6Tli5Jh5519YepgPNvw/vKsWF46u/VGiMIea9Z39GQDQcwyZLUxfAGtBdIPUh/D5YqSPc9Qo3B61vEjND+xT7p/b9tJuBNJL7y+JY9w==;
	5:pTTFbkr3RvxVYMyYXGSH/XZr8Mu10UkmHVcmmrHbXr2Ccl/5P6eY98xAQMYjRNGkdtdHJF+dexOaksbuL9MT80npdVLCjyZ/DN/XBQCJZK6qAtQGpJfgQtr38wu4PYwv64cubw94V2Ba2oe9Kb5v1w==;
	24:n1sucOOl8x623rxIBy3f941jQNriNLX8Hxw9TAcIztNVCa49UfdIB9mzm/B7k95ziLBxHvi6oKE2Fe/vXlIzjB59e2rqAn3YmH/1dEy0FFk=;
	7:OMl3x9rB4pZ2/GS93D9IeeGwPufd2W+fUmTTqOh7unCgdl8dGoVt8CIc3VfwFSAfS/dH+eveg3c03xu1moYebHW7bLKDzGGwQMA0olbjgiMWAfuo6/ft4eRsOz+okPbkMae/VXzMMq2yXExe6LSsX59EPWRIlqDyXAd0VHJtT03v0c3PXaCq7EdurcI3hZG1qYJd1j2Z2e+MHUE5YTK1HkFB2p2ZCE+E7dLwwQo2MQNsPsd+GHxB9qCMOcEAkyZ5
SpamDiagnosticOutput: 1:99
SpamDiagnosticMetadata: NSPM
X-OriginatorOrg: nxp.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 18 Jul 2016 14:47:32.8402 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DB4PR04MB313
Subject: [PATCH v3 2/3] weston-init: Fix weston-start to handle 0 or 1 args
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
X-List-Received-Date: Mon, 18 Jul 2016 19:22:12 -0000
Content-Type: text/plain

The parser incorrectly treated anything less than 2 args as an error.

Signed-off-by: Tom Hochstein <tom.hochstein@nxp.com>
---
 meta/recipes-graphics/wayland/weston-init/weston-start | 7 +------
 1 file changed, 1 insertion(+), 6 deletions(-)

diff --git a/meta/recipes-graphics/wayland/weston-init/weston-start b/meta/recipes-graphics/wayland/weston-init/weston-start
index d7358ba..cd64216 100755
--- a/meta/recipes-graphics/wayland/weston-init/weston-start
+++ b/meta/recipes-graphics/wayland/weston-init/weston-start
@@ -6,7 +6,7 @@ export PATH="/sbin:/usr/sbin:/bin:/usr/bin"
 
 usage() {
     cat <<EOF
-    $0 <openvt arguments> -- <weston options>
+    $0 [<openvt arguments>] [-- <weston options>]
 EOF
 }
 
@@ -23,11 +23,6 @@ add_openvt_argument() {
 	openvt_args="$openvt_args $1"
 }
 
-if test $# -lt 2; then
-	usage
-	exit 1
-fi
-
 if [ -n "$WAYLAND_DISPLAY" ]; then
 	echo "ERROR: A Wayland compositor is already running, nested Weston instance is not supported yet."
 	exit 1
-- 
1.9.1


