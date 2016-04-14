Return-Path: <zhenhua.luo@nxp.com>
Received: from na01-by2-obe.outbound.protection.outlook.com
	(mail-by2on0075.outbound.protection.outlook.com [207.46.100.75])
	by mail.openembedded.org (Postfix) with ESMTP id 4AB6A6FF5B
	for <openembedded-core@lists.openembedded.org>;
	Thu, 14 Apr 2016 11:01:13 +0000 (UTC)
Received: from BLUPR0301CA0001.namprd03.prod.outlook.com (10.162.113.139) by
	BN1PR0301MB0705.namprd03.prod.outlook.com (10.160.78.12) with Microsoft
	SMTP Server (TLS) id 15.1.453.26; Thu, 14 Apr 2016 09:26:49 +0000
Received: from BY2FFO11FD016.protection.gbl (2a01:111:f400:7c0c::128) by
	BLUPR0301CA0001.outlook.office365.com (2a01:111:e400:5259::11) with
	Microsoft SMTP Server (TLS) id 15.1.466.19 via Frontend Transport;
	Thu, 14 Apr 2016 09:26:49 +0000
Authentication-Results: spf=fail (sender IP is 192.88.168.50)
	smtp.mailfrom=nxp.com; nxp.com; dkim=none (message not signed)
	header.d=none;nxp.com; dmarc=none action=none header.from=nxp.com;
Received-SPF: Fail (protection.outlook.com: domain of nxp.com does not
	designate 192.88.168.50 as permitted sender)
	receiver=protection.outlook.com; 
	client-ip=192.88.168.50; helo=tx30smr01.am.freescale.net;
Received: from tx30smr01.am.freescale.net (192.88.168.50) by
	BY2FFO11FD016.mail.protection.outlook.com (10.1.14.148) with Microsoft
	SMTP Server (TLS) id 15.1.453.6 via Frontend Transport;
	Thu, 14 Apr 2016 09:26:48 +0000
Received: from sweet.ap.freescale.net (sweet.ap.freescale.net [10.193.20.55])
	by tx30smr01.am.freescale.net (8.14.3/8.14.0) with ESMTP id
	u3E9QjnW006750; Thu, 14 Apr 2016 02:26:47 -0700
From: Zhenhua Luo <zhenhua.luo@nxp.com>
To: <openembedded-core@lists.openembedded.org>
Date: Thu, 14 Apr 2016 17:26:44 +0800
Message-ID: <1460626004-27458-1-git-send-email-zhenhua.luo@nxp.com>
X-Mailer: git-send-email 2.4.11
X-EOPAttributedMessage: 0
X-Matching-Connectors: 131050996088122419;
	(91ab9b29-cfa4-454e-5278-08d120cd25b8); ()
X-Forefront-Antispam-Report: CIP:192.88.168.50; IPV:NLI; CTRY:US; EFV:NLI;
	SFV:NSPM;
	SFS:(10009020)(6009001)(2980300002)(1110001)(1109001)(339900001)(189002)(199003)(2906002)(36756003)(5003940100001)(50986999)(1096002)(1220700001)(11100500001)(92566002)(189998001)(50466002)(50226001)(110136002)(86362001)(105606002)(85426001)(77096005)(5008740100001)(19580405001)(33646002)(586003)(47776003)(19580395003)(106466001)(229853001)(2351001)(48376002)(104016004)(4326007)(6806005)(87936001)(81166005)(7059030);
	DIR:OUT; SFP:1101; SCL:1; SRVR:BN1PR0301MB0705;
	H:tx30smr01.am.freescale.net; FPR:; SPF:Fail; MLV:sfv; MX:1; A:1;
	LANG:en; 
X-Microsoft-Exchange-Diagnostics: 1; BY2FFO11FD016;
	1:zXEtEqvcPpQ6SA8xHtC8xzXbsEeHHogchGOuG8JCrUBf33oEqYDIBIDUc+PZdaBXf/2ovQdC4yWzpmRkngRv5n3Vye+YecdznsGktAWynWnAafAG2AePQCwM2qlAmExlMuMRRCMzO1jtwdjbHySM6ItPd9+BI2kNBY7AQmkq+e9IUHIdpNFQLjdI2aspTC7LqaL+iJ5k2ZJED16Vypf9iZhVK+GlSnmVxUlASscX9fE0Ir9X0CQIy8xQOIkfCiC2fc2Uwkfn5PX1ICYJm/iE614AiT/JY2V8hLDzDXaefxjX6XpG7a/SNQ/pUuQYFwJSGreJ+oL6DKOmuev9MXRTmpNWgudRRmUvwBZW5ghvmDSrT+6TOgtGG0VycZiCzmKDcOkUyihfY5MIBscQ6dXYd2y/GKYagB+5RZMFHXfsbo/gQbs9xQZ9eCV7jsiqq5yPNVGiz3NyaNo3W/w8+Qv5EYmrcqnB8BqEwVefwsBg4ALBn3KTblclFJ/EynycZE0iPWKN84vUMPOoJY8EOZjag7en01LbncWScw6X9sp+M6JFT0kX76LB12WOR1767CDJAWM91YS5kLoeyVQFftRp3ZoOd1HwcY1RTt++ti8bIqM7M7t8Mgax4AKqjQt3ExobaT6gcFYd63KbIPNC+K1c9IxuYmSFxqSKV7OsVMg1q+XHKWxmQj8u3JD/MlgOtH13
MIME-Version: 1.0
X-MS-Office365-Filtering-Correlation-Id: 3909d3a7-5ce2-4fc6-2c33-08d36446e7c2
X-Microsoft-Exchange-Diagnostics: 1; BN1PR0301MB0705;
	2:a3+OEzvX2+rkSVBwoNO3JlwPdnzdZIp3PXnibNsgGBhPw9CIKuu5AvDD0ASYzSriUYRRgmzgQo8BRyebARvrIKJJf7mh9yfRWXDhhOocYywdQGHdH0g2IzPXhRSC6DFvsFVHTP9XxuozV8Pyo+P1IvobLAzaQjy8GuX6jm0ll8t9aSKk2MyWNQqZVD1uwJj2;
	3:0VUjwVf6Ec7Ppk6yJY7iSxawA+D+1ZY047yuxEg/7Qq2WlJXik7/K9jHCyHgCNM0qGKwLHgyk+/LucuuLpk5F2twsVF+uuaWbXVpyr9q9VXCSBbaKs4quIVt7axvqBT6rygcw5YjPzby0NPhxdqG9NBINLulKsvAXeajPerxBqw2gIfl6D1W6bQNBfTYXWlkKYk0ESDc01upv5bDUot2ENJdpbb9oycB7pmc1AZROx0=;
	25:LHoISAT0RcfKDjCfPfw0/hrVEyaKJfeoMLKEr7miXXrPfLJL42R8203CW0lqIJJvJW/+p4Mgasm5OL5jk550dMFsdT4BeyEI934HW5gB0KEX9wjq5ZDqgC62g7P8GlO+Q7heOjds1jrGKhEdgdzlr+MIAhRD7UmXvJTBPH+JcicakOEE9z+AaHSbVmtQfpySxm0DPAUHFmdUHqXaCnO7tIOZqyIlIDMZI1PXreyYNG0ow9SROUEl2owcPOgJsL3z86xJItuOiTY53ZBWw+U2swfeEQjXkbZ3YEDVXDKBVAMM8KQ735GFNMo3EBDV5/9utcMGHUAPpBb64VpO/kcGHA==
X-Microsoft-Antispam: UriScan:;BCL:0;PCL:0;RULEID:;SRVR:BN1PR0301MB0705;
X-Microsoft-Antispam-PRVS: <BN1PR0301MB07056605813C7F4A83F3FED1EE970@BN1PR0301MB0705.namprd03.prod.outlook.com>
X-Exchange-Antispam-Report-Test: UriScan:;
X-Exchange-Antispam-Report-CFA-Test: BCL:0; PCL:0;
	RULEID:(601004)(2401047)(5005006)(13017025)(13018025)(13024025)(13015025)(8121501046)(13023025)(10201501046)(3002001)(6055026);
	SRVR:BN1PR0301MB0705; BCL:0; PCL:0; RULEID:(400006);
	SRVR:BN1PR0301MB0705; 
X-Microsoft-Exchange-Diagnostics: 1; BN1PR0301MB0705;
	4:Dgit6/hh+0isIpzUMhj+te5heTk0ucg8tSZrVvNBqbRLW0RzZLhmLhYUW5vBVFmnXL3i1x2njTSq5KDMZngnGGtG3JJVregLI/Aop7LZjxlxHI6T+n6VHHgg/7P+GNMXWd9+luqDe1klLKqMlvEcr73Hc54uElNKjE7cozNMEVVhmTZIEyWO32iaI2kUHSfttVhnj+AJehNnkfLbuIjtW9H7dwWQjqZF/NuC2DPkY2+VCkXamVEqN44xxqiMTPEOMrM30EG1Ouc/6V6hWu1YMXysP3XIqKYUmGYZrElP/hTAy6fs3QIWrar6JGRrAJfR1QmmlGafUMXx5VbMO/Zl7skVBb2HJ+raPXczT5sQsJCOT36uRxoYOlhhTa9rvMvE8HH9ABUfoXUwcSKUWrSNS0LSORurtW64F9uS0T0yUzIAChL481NFjWTRiUapz72vh7moCUhqTlPubtkLdrwqZPm5r91HroQ8uUWwduTKpw8=
X-Forefront-PRVS: 0912297777
X-Microsoft-Exchange-Diagnostics: =?us-ascii?Q?1; BN1PR0301MB0705;
	23:RYh7fTx9S0lPJg85V1u5kuk+RhEH1x0ml3cOin/?=
	=?us-ascii?Q?huTgnkqvJ8siHg4gDlY9n+FcDARcZSgE3qfbCPE4rzBE2I9WhSnIRrn7OpTz?=
	=?us-ascii?Q?LLkZktLKFT1pz0ioeCXjg0WORkM70xdGFqs7GpZDDNuY7bmxDknmVCpXvGVh?=
	=?us-ascii?Q?5SXxdNu40+Po9CbZ7PiIo2UzloKILuD1rM1AWAKwY4kofrU5ieWMEcYvRWGB?=
	=?us-ascii?Q?99zgGUIheoqpP91/5ipsWEP9Vv8kN2HkeWceS8lkZTFDM6byYTzUbXdVSCQb?=
	=?us-ascii?Q?CprE219A92CmotUHPSGAG+S+3eCz+mJFi5sAHxkNPen3kp2tc80OcdrvHECa?=
	=?us-ascii?Q?rzwfq6sKoHKLw1deQ1Bzh+QfDW81g3gB6VqDsppnq2GE0ekz/gZ46f8tj/x7?=
	=?us-ascii?Q?LTiWmBO8F2ZfT5nCtO5Nva9m3L1BZRK00cFlLoKdYv6MQC+HOAIgfUN0eZ2w?=
	=?us-ascii?Q?sirDM9RfbCodByXcHw2vImeg0ZEj7sQcZK5Gn7FhE+5+V9yk+eXlAMbMIeQe?=
	=?us-ascii?Q?oToEg4YNBD+C3Ekw6w/n9XyIuy0GggpyzJ93h6H6C/mtAmvLsFrXFVbJJ59o?=
	=?us-ascii?Q?pbBrrITi0iGzls/xkjKLGhIaCVdRNoz0YyEKRyqhcbjK2sE+2MHcnxetaGl8?=
	=?us-ascii?Q?aq7JnMnq7FpSo/BjXp8hksgIgTmC3Nm3ZP/q939BUpdt2gQKFQXNWongX2m6?=
	=?us-ascii?Q?eUT3C9NIaMlnM65TWSf0KCV22aUYkjCXz43nKGlcEFTPwO6a12LnTbWxLRFJ?=
	=?us-ascii?Q?mw+RggqT2sp1p4SCFmoT/ubKnNMfToAbotpL+D9sb1Mth5spDZVK7k1aru0R?=
	=?us-ascii?Q?mkw5SKYjTqBU1JXU8e1BuQEEx1tZRMNQEhd6twwNg9TYBKCy24GS/nJ/ocwU?=
	=?us-ascii?Q?3fqm8GC0kXwYKEHBoyhtwrEZBM1P3hQW2hGOfyGDrdthmcnuG6ktGcTMlSYC?=
	=?us-ascii?Q?N5s/ZOAgH8t9Dmvs5Hw1vdVq9HHplPtrkWVHw1a4S+kbjMRII+i0r7bnO2pR?=
	=?us-ascii?Q?Sg5zqW6iLd0+xF3/44V4HgKrn?=
X-Microsoft-Exchange-Diagnostics: 1; BN1PR0301MB0705;
	5:5Q8cdS6Ey0GMCRbC7pKEnVQ0wCnfKIlnaI0QiU1zxUF9nNOuCfk6tDtW3b48Y5z53Y37lyvaKS6H/BA1Y571tXlFOCSLn4z8wdGr9s3iLr0kF5t/srMfXxk/uqvHF/qLZD8gxmdYVujU/AATUSYaVJf+GK3g97/uFAhopYCnhlw=;
	24:iDQzGZGN1JH0TL6lITO1xyccHcqJ2hJ4Q1hR4vCd55ZZ1aBfLrNM4XUs0W2zklbhJ+CT2v/1vfh1FOGoZIOuPqYmyc5imQeDS0+qzRoKjTM=
SpamDiagnosticOutput: 1:23
SpamDiagnosticMetadata: NSPM
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 14 Apr 2016 09:26:48.6250 (UTC)
X-MS-Exchange-CrossTenant-Id: 5afe0b00-7697-4969-b663-5eab37d5f47e
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=5afe0b00-7697-4969-b663-5eab37d5f47e;
	Ip=[192.88.168.50]; Helo=[tx30smr01.am.freescale.net]
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BN1PR0301MB0705
Subject: [master/krogoth][oe-core PATCH] meta/classes/qemu.bbclass: set -cpu of ppce5500/ppce6500 to e500mc
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
X-List-Received-Date: Thu, 14 Apr 2016 11:01:15 -0000
Content-Type: text/plain

The e5500 and e6500 cpu types are not supported by native qemu, set the value
of -cpu to e500mc. Without this change, build will fail for packages which use
qemuwrapper in compile phase due to the following error.
| Unable to find CPU definition

e.g. gobject-introspection

Signed-off-by: Zhenhua Luo <zhenhua.luo@nxp.com>
---
 meta/classes/qemu.bbclass | 8 ++++----
 1 file changed, 4 insertions(+), 4 deletions(-)

diff --git a/meta/classes/qemu.bbclass b/meta/classes/qemu.bbclass
index f3d3be8..75739db 100644
--- a/meta/classes/qemu.bbclass
+++ b/meta/classes/qemu.bbclass
@@ -52,8 +52,8 @@ QEMU_OPTIONS[vardeps] += "QEMU_EXTRAOPTIONS_${PACKAGE_ARCH}"
 
 QEMU_EXTRAOPTIONS_ppce500v2 = " -cpu e500v2"
 QEMU_EXTRAOPTIONS_ppce500mc = " -cpu e500mc"
-QEMU_EXTRAOPTIONS_ppce5500 = " -cpu e5500"
-QEMU_EXTRAOPTIONS_ppc64e5500 = " -cpu e5500"
-QEMU_EXTRAOPTIONS_ppce6500 = " -cpu e6500"
-QEMU_EXTRAOPTIONS_ppc64e6500 = " -cpu e6500"
+QEMU_EXTRAOPTIONS_ppce5500 = " -cpu e500mc"
+QEMU_EXTRAOPTIONS_ppc64e5500 = " -cpu e500mc"
+QEMU_EXTRAOPTIONS_ppce6500 = " -cpu e500mc"
+QEMU_EXTRAOPTIONS_ppc64e6500 = " -cpu e500mc"
 QEMU_EXTRAOPTIONS_ppc7400 = " -cpu 7400"
-- 
2.4.11


