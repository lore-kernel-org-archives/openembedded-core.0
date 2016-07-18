Return-Path: <tom.hochstein@nxp.com>
Received: from EUR01-DB5-obe.outbound.protection.outlook.com
	(mail-db5eur01on0045.outbound.protection.outlook.com [104.47.2.45])
	by mail.openembedded.org (Postfix) with ESMTP id 58ACE6FF78
	for <openembedded-core@lists.openembedded.org>;
	Mon, 18 Jul 2016 15:19:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nxp.com; s=selector1; 
	h=From:Date:Subject:Message-ID:Content-Type:MIME-Version;
	bh=OuT0Us16obMAp114gNkCL36HV+cT6KrDfu3qwBa0HmM=;
	b=Cojxg5lB/nWWbtiz+g108dn7q1XZpLek7VDyj3u/mrezCeRu5GMhlgKuA+c/EDDmtgH2J8fpsIzJuTT4OMWR1Z0dPs5q5OCkD5G9g7gnyfuGg3vnq7FdIzow7DtsHBNtgMXImbQ2Hey6+e8k2LqRLFx8a0rkdWWend7WW8l3D8o=
Authentication-Results: spf=none (sender IP is )
	smtp.mailfrom=tom.hochstein@nxp.com; 
Received: from tx30imx-01.am.freescale.net (192.88.168.49) by
	DB4PR04MB313.eurprd04.prod.outlook.com (10.141.239.146) with Microsoft
	SMTP Server (TLS) id 15.1.539.14; Mon, 18 Jul 2016 14:47:31 +0000
From: Tom Hochstein <tom.hochstein@nxp.com>
To: <otavio@ossystems.com.br>, <openembedded-core@lists.openembedded.org>
Date: Mon, 18 Jul 2016 09:43:04 -0500
Message-ID: <1468852986-2487-1-git-send-email-tom.hochstein@nxp.com>
X-Mailer: git-send-email 1.9.1
MIME-Version: 1.0
X-Originating-IP: [192.88.168.49]
X-ClientProxiedBy: BY2PR05CA035.namprd05.prod.outlook.com (10.141.250.25) To
	DB4PR04MB313.eurprd04.prod.outlook.com (10.141.239.146)
X-MS-Office365-Filtering-Correlation-Id: 434a5411-ecc0-4f16-c05b-08d3af1a730e
X-Microsoft-Exchange-Diagnostics: 1; DB4PR04MB313;
	2:N8QLiQGBsRrRalwk8UGy66nhMKnfjhuqG8k7oZm8jyVYNkhW1+QaBSWW45zdq6eO3XA4cjdSPPqUFMyME1TW2tJzaiMJKUjYtA14w2RaaIivhHGG1v8UcfdrpVYUXtzcfsZdck44WqbY4ZLao5ZkuKphysSiSyLfJCsMZxICk8JVyEfvaWyGqTlcD2Z12Rce;
	3:22F4hrNVt0fi2188Sqskj23zEHzbZTs1kBimTSCL8CuTXpwnhL5qa0DxUvmyTsOLswyUKrXs4y/I1Vqysx2WlEoVAWmhKJDjl159pHu5e371w+iysQYeRDP7Hp6M1hhT
X-Microsoft-Antispam: UriScan:;BCL:0;PCL:0;RULEID:;SRVR:DB4PR04MB313;
X-Microsoft-Exchange-Diagnostics: 1; DB4PR04MB313;
	25:dwoipa/ZM25WwbwpH8xJ0bO0BI5LTuUU78irvHVNkb/xYT1fSVu1MzWTxVIEU8naTKGAnGlgQsVSGm5gGbhTjPqQMG4pagDrwaWiNACPzJBu3nzO8Qs8hQsAGaEYeAbIe5y/P0nKps8I0lOmyyOWPYdMMNQj+hy0PpNh4o2U5ixHPUfcFxIcM1zQVi3XLoHmpHBkZm5xpmrd/b9UIA5+dYgYRK8PoA4iUnjo5FgVN1EmCgrJ2lFM7/cs5/FmY8pOhHwLB5vvUuk2mfyT+BezcKo8sWZ093rcILqV89Ttkd0NZMz/zFgotfUkds+PgbqVJdQjKtz9WLp+/ng1wHu9dZR/Z0IWQTRNOaFUY9E6yC/T4yaHMrajC5wnuvS6lUYmylhcuiSQzvC3IDIkbEA1Ik8v5PMmddakta/vXOmG555Cap6zyDUD+mPtCqfi44yMvwy/S+hLR/EVp1eEkv2fHUrD990p9TotVfssJIUgWg0OWLS0VPSNaGW1znn+kydzVLj0IlblsEQQIqEKjmnsO7QhmNpZU16gxjIlIQq9Z1xQQZN/rcHHKbzaiHL758Gx/4XxKWN2XDBnVnOsxCqWbueBj4nNJZtUdlNNAiM4pBWhyfOtD/3v91+/FYCHUu5YlLTliOp8cHap2TNiv2VCPHrOAN1cnUlswE94h2XRZx4DkQgQPdAKReMzwN1VjSXO0Ih1ZK12hVUsnhdLB2a8tfmcDKRZl8N2fJj1ZtIlFfI=;
	31:LodiA9+VovzaGyFliiue+TlGszLq47YeLS494xjPGAHSy6t7AQxHwIzjXPllQrZ40MCPjawkjWWzXxn7FlIolGEI4gmA0KnHqcY0+0RlHdhQTHArrILGrRIcI9OBfzryQFo24R+I2WDF3z3wYyukJq3l4AFpTBJ3ce2iMs2VXMQl2gdS8DrWpFZ/26D2JJzuNLgaJh5NKDKKDvzBG0nHbg==
X-Microsoft-Exchange-Diagnostics: 1; DB4PR04MB313;
	20:wbnirn1ST5bsBZzf4eKkb4tJlyN9/JgcXGFJRkqxAikEd+CLk2wWwq7xndCs3/4kiQwcLSLtiEWFZQDkA+ef2uwla5rJs8pDVADNbrW1gQFiMDRWx/T0w1mPisFuGq9r+0PfhqudLM7ZuKNZBWXAmIECduuAE8dYxP45171+tI0IMVor4Es4YivoqaW3A3BQp6pDIvAhUBFB70QuYJQNyXiBrTeRWAMj7G+b5odruzehPdUkIOwe9e55rIrfIzHXql8Wqx1+CnYr5ZMKsC7xyariN4OW5Dg8FF/8GsTKmNHRBIl2zD66Ej1UThzOgq7V1TL5rHNZf1GEdKSgEC8T1nl5Kq4Vz11M7HAOcuJSohFeEJmn5dOG4wJOAR66RkEDM9kShPvH21T3kllayssr2eFnv8ZBqmNTDhbusaB37CJosAMXoPrTUj5v6+D7GLYg0YhkbjtAatNQh6ypGrbWwxiFOP8xewWN9klJL0DjcoTYfPQtyLMbFTQWidlZamZO;
	4:JBhwrqNPg2PVk3xMdT3dTaeKXZMHYyaZDbiXjvwd6YoOI235uH8TYSzer+D7R7Jd4b9AuyIIFXX7YEGqfgoOOUdUCzppPBSInvXJzSnGqAqg5ULhMmMJNj8f5DqEC8QZJMzyKhFolg53rOovqCeelATXfqa8Jbo+lHfNG1avZwZ8/7PqvA8gOJc2P8f+nBzuTEJaeRxEoWLjtQUiFEzwMySWYdRWHKLy7fsf5K6Ah4ZXybPx4SlTaJzlT46Q0OpYA1EgvCLs95lFHCt8Ad4VqKXq3skx20O/IWUAbOgZC+zKvf7dUnBDS/TVp1mYuVlk9lxBie84Zy7lHsk/q9NitJLwiz+oexsWWYVOuHiLFjwjJZGvlItbAZjXCdY742VMGr5yDbR7OJqFE1zfOygHNPZGWNUo9Gqvdar4307wyk3kPpsB//LBTcCRR9DxW51Q
X-Microsoft-Antispam-PRVS: <DB4PR04MB313D52B61FDB9A8FD5B05D0E2360@DB4PR04MB313.eurprd04.prod.outlook.com>
X-Exchange-Antispam-Report-Test: UriScan:(185117386973197);
X-Exchange-Antispam-Report-CFA-Test: BCL:0; PCL:0;
	RULEID:(601004)(2401047)(8121501046)(5005006)(3002001)(10201501046)(6055026);
	SRVR:DB4PR04MB313; BCL:0; PCL:0; RULEID:; SRVR:DB4PR04MB313; 
X-Forefront-PRVS: 00073DB75F
X-Forefront-Antispam-Report: SFV:NSPM;
	SFS:(10009020)(4630300001)(6009001)(7916002)(189002)(199003)(36756003)(33646002)(7736002)(66066001)(19580405001)(305945005)(229853001)(19580395003)(81156014)(47776003)(105586002)(7846002)(42186005)(8676002)(50466002)(92566002)(48376002)(2906002)(81166006)(189998001)(86362001)(101416001)(4326007)(6116002)(5001770100001)(586003)(3846002)(97736004)(5003940100001)(50986999)(77096005)(106356001)(50226002)(68736007)(2101003);
	DIR:OUT; SFP:1101; SCL:1; SRVR:DB4PR04MB313;
	H:tx30imx-01.am.freescale.net; FPR:; SPF:None; PTR:InfoNoRecords;
	MX:1; A:1; LANG:en; 
Received-SPF: None (protection.outlook.com: nxp.com does not designate
	permitted sender hosts)
X-Microsoft-Exchange-Diagnostics: =?us-ascii?Q?1; DB4PR04MB313;
	23:BV820jBfpIlhenpMBEPhWursVnENAkXjGv4uJ9XQrX?=
	=?us-ascii?Q?qwyBByjHbc+8UwrBbccrITub8D/tCiRwvWA8aRtCqg/zon4ocs/Arj4Bss8+?=
	=?us-ascii?Q?dwgOstJa/3uNQB6qSu7G9yenKlSyuec2YrkKV8pK6iQZS076M4d1FMjx0pz2?=
	=?us-ascii?Q?F35ra4gmLvbTYI3x53pRy9PVWJThz+H19d+ZnYrwpUcymDYlwAnTJsl91Do9?=
	=?us-ascii?Q?9A54tYUZpZ9NgYnlDzQUlRpqUJeP9riTMBux+MTsK3/KP5XcvhJ74n6Mg0cl?=
	=?us-ascii?Q?fObS1FfvhE3u3kmJQskKYgzBLQY+Z5y5RAjxtdSFNV63PToVXAWgYccspAkj?=
	=?us-ascii?Q?veJpCPDW4i7/ikK8aW8h5N8l41BWYFw7Hcp/ikryjFAzp2Wq1Y82zF/pwizi?=
	=?us-ascii?Q?exRAaNIjqzjwkEUdGd8b/chyQPnNA6zYTuotw41FE50X+6Hic6DbiiXt/Acp?=
	=?us-ascii?Q?uK9wyw6iHHu53uTkSbGASSFDPBaYnt+LfpcNMG1d5NApN4I0EZ1uBExPxdu4?=
	=?us-ascii?Q?dnsSldue0aUJgD8NMgjGEfTUP0U4fJ5CdrDdI+zjX/m4n6zmMs7+P07fWgfY?=
	=?us-ascii?Q?oiuW9dhCdQtMUorEI9C3YJVwtPGaR3zIlIE3MSni8WpqgtgWcCjcb7cKSMuI?=
	=?us-ascii?Q?MFc+vCjdOAg71yS+Dd/lAHACtX+xoi+McQT6qrGi+lAVUcok+uP+nngBKbVH?=
	=?us-ascii?Q?Nh52iEgl2gkP0vYhYrzMReR82jy4gukAnHJlKQ/H9j+Nzh5IOu8zWiROzJ94?=
	=?us-ascii?Q?htvTyV8DxBLf+Srapo+dCGoyC+JDlZJl8ZZnSQpThiHE6s5M/CVbb2Z9QAEv?=
	=?us-ascii?Q?2x1ArZcTnFgMk+4GdIwhkg81OF0+RD4CzTW65SVpcC/JhNGykTSN2i3ES4Jm?=
	=?us-ascii?Q?qB2T2PaQdQ0PGSHtAFOGKhnyuBydxyaPzizlNUYVaUM/7rO6/mLjCEdqhGv2?=
	=?us-ascii?Q?KfPz3jkCOpW7al9FDEn399xBDrajKzfAHeVhSY/h4tCcU2gbm2g0STn7pXXg?=
	=?us-ascii?Q?21gN9+UmzQ7V3WfqNJxaSQaSget8SuUdzHOijwQZPabw=3D=3D?=
X-Microsoft-Exchange-Diagnostics: 1; DB4PR04MB313;
	6:CoW2hvHUyDnixbN687Wxxe5WtoP0JdkI2owJtrCm1IyrSDrkL4ztzqUtmJs2KagXDkethLwVPMg0I4PF0b/Ue8zI1QsJok0PRetvvi7EohXqY9eZbaXqVgIgg3y0jSfIafuAYr/NecboTMamcY8kGJDcG9NP0E49hIGptQ3Sr3zvoKl+jAo4Q2U5A9KQgNbVl92D3msNX+DEhErPpicU2xF3GNDqJH3FbbjQJqaHmERk6nng3fjakz6PNbfaUUOanQsONtIMf6dwVl/cmBGIaU2hgRIDpNumkulYTJgMBuqzdiPkqOUw1XZ50ntkHAp7SpGK+5Fr3i+S6GgfYbmTjQ==;
	5:fwkPCupjKw9RjrcTvPfn4++fM0gXRHaHVVGG0cYAXAljo1vYb8qhILUMJm4sO6Zh2Y6HwYcRL7Tg4WC8nwVgZOalMdtHVJY+juA6rK9X3SHvi+3htJLPfZl2IMo8FVK6iL2tvpwp/0LT0slLy57R3Q==;
	24:AKwezs6ro/+xHTkK9FtPfKyFx2vuVRwqvl1laa2qwoBTyNfRX+9PnR7OjlrIacUwiIgtA2a41qZZO6KfVNC6EQDZBxokE2fyDv5eAe+/8pc=;
	7:K2kTCAPzsqYNKgWwk4Z/n66Hf1KiTnMcOOXs9kDJt/lv5N8abi0FkR4Vz7APlbWxNJWG3KeWIxAmWMTF4H77hkTdTAzgOqYaWH1Mr4FGEBMek2Y4tUBJ0AGUbxjn8Hfal2duprq4Teoq3vXuvkhbcSYgbr9fOocB26WiUv8wJhpExf3lgnVB4n1SdRyqx4SB8ouLPb+gi2R6KvNezXV0FozawxG3wADf6/nKU44HAOm8qGGlmjZZkGyv4kQ/JU0k
SpamDiagnosticOutput: 1:99
SpamDiagnosticMetadata: NSPM
X-OriginatorOrg: nxp.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 18 Jul 2016 14:47:31.4291 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DB4PR04MB313
Subject: [PATCH v3 1/3] weston-init: De-couple framebuffer console from Weston for systemd startup
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
X-List-Received-Date: Mon, 18 Jul 2016 15:19:10 -0000
Content-Type: text/plain

The framebuffer console was using the same I/O as Weston. We fix this
by having openvt switch to the new VT when starting weston-launch, same
as is already done for the sysvinit case.

Signed-off-by: Tom Hochstein <tom.hochstein@nxp.com>
---
 meta/recipes-graphics/wayland/weston-init/init         | 2 +-
 meta/recipes-graphics/wayland/weston-init/weston-start | 3 ++-
 2 files changed, 3 insertions(+), 2 deletions(-)

diff --git a/meta/recipes-graphics/wayland/weston-init/init b/meta/recipes-graphics/wayland/weston-init/init
index 5c925f4..d3e87c6 100644
--- a/meta/recipes-graphics/wayland/weston-init/init
+++ b/meta/recipes-graphics/wayland/weston-init/init
@@ -31,7 +31,7 @@ case "$1" in
   start)
         . /etc/profile
 
-        weston-start -s -- $OPTARGS
+        weston-start -- $OPTARGS
   ;;
 
   stop)
diff --git a/meta/recipes-graphics/wayland/weston-init/weston-start b/meta/recipes-graphics/wayland/weston-init/weston-start
index 5b7604f..d7358ba 100755
--- a/meta/recipes-graphics/wayland/weston-init/weston-start
+++ b/meta/recipes-graphics/wayland/weston-init/weston-start
@@ -1,5 +1,6 @@
 #!/bin/sh
 # Copyright (C) 2016 O.S. Systems Software LTDA.
+# Copyright (C) 2016 Freescale Semiconductor
 
 export PATH="/sbin:/usr/sbin:/bin:/usr/bin"
 
@@ -37,7 +38,7 @@ else
 	launcher="weston-launch --"
 fi
 
-openvt_args=""
+openvt_args="-s"
 while [ -n "$1" ]; do
 	openvt_args="$openvt_args $1"
 	shift
-- 
1.9.1


