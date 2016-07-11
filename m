Return-Path: <tom.hochstein@nxp.com>
Received: from EUR01-DB5-obe.outbound.protection.outlook.com
	(mail-db5eur01on0078.outbound.protection.outlook.com [104.47.2.78])
	by mail.openembedded.org (Postfix) with ESMTP id C0EAB731A9
	for <openembedded-core@lists.openembedded.org>;
	Tue, 12 Jul 2016 03:43:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nxp.com; s=selector1; 
	h=From:Date:Subject:Message-ID:Content-Type:MIME-Version;
	bh=+aTgfsa1kAq9TpRhjcV3Xedw4f2yvHHYuCGLuKTgdlA=;
	b=T90jU5Nmx7kpfB5DS8lwDk98PadTwNqSm8binVYg+G/pBgtUcB8vMvrzoA7Gh/pDf7LUUy3Z7icf9BLTMkISTOSHirJyWruuwYV/guDJLb6JXxS1LIXZSyOF/ya9SywJ4uXVOJ6A+Lmshdy4CPZ8CxlHhws/BDiFSlw74ypZZW8=
Authentication-Results: spf=none (sender IP is )
	smtp.mailfrom=tom.hochstein@nxp.com; 
Received: from tx30imx-01.am.freescale.net (192.88.168.49) by
	AMSPR04MB309.eurprd04.prod.outlook.com (10.242.107.15) with Microsoft
	SMTP Server (TLS) id 15.1.539.6; Mon, 11 Jul 2016 22:10:52 +0000
From: Tom Hochstein <tom.hochstein@nxp.com>
To: <openembedded-core@lists.openembedded.org>
Date: Mon, 11 Jul 2016 17:06:49 -0500
Message-ID: <1468274809-10301-1-git-send-email-tom.hochstein@nxp.com>
X-Mailer: git-send-email 1.9.1
MIME-Version: 1.0
X-Originating-IP: [192.88.168.49]
X-ClientProxiedBy: BLUPR0401CA0021.namprd04.prod.outlook.com (10.162.114.159)
	To AMSPR04MB309.eurprd04.prod.outlook.com (10.242.107.15)
X-MS-Office365-Filtering-Correlation-Id: fd3b5078-4001-4b33-1273-08d3a9d8393d
X-Microsoft-Exchange-Diagnostics: 1; AMSPR04MB309;
	2:zElNj32tl0NlPFcWB8LPTPxzUg/cC7uPi3iGC6w/dj9EfUcgHUm6VEAgQNtR4S/rwY3VGwKJLnoPVKMSEgYeA877Vm02Ctdu/CjxnpgfZArTq9WzPVXqJviNgdwvl75jQxnZoMvVRn9bkCbC1T2BEO3UbS2x2aD6VICMkECD8uen3QzpyWjEgvp+WCgRHKCH;
	3:w4pbn9/q5XwamFTP7zA+4nFYpPym37DgtfnpbV+WHxBLcJ1MsxrTtUzRPlejfcGs6hjh37uzuLG+aKk+0VEfJ4yuCxhId64+0fx4/5+RwWHsxKJ6jZBWo3g4ZhTHljDY
X-Microsoft-Antispam: UriScan:;BCL:0;PCL:0;RULEID:;SRVR:AMSPR04MB309;
X-Microsoft-Exchange-Diagnostics: 1; AMSPR04MB309;
	25:h5PxXYh3YjExWhqjUOPI01R7Ot1uOEstihhEw0FfEOX4MTloLIsfMqF80Z+EH2HvSktmCeV93lSCIWlUTcFGCC5+PNDDIxv5Ky6PJp5sn/sgi4SQs+KJ96A7Aqr4SCiKFN/ApM/Cd3QVoYXLv3IoRdyIDVH9ufOX71623qsVLQs9v1ryGU4QQPOcgPirdAOvRmcn7FugYUeGBtr88Gnbz1FUkeCpattZASHkozPPaRyzFfP3vcNf5pehikMtnmY5XPJEmPinR8s+ng+3GXmy9Le3bcr4iIw2catvzwAVZ06IxnIrdpzbMRcEj4RIkuqSsZaVZJ3w0xhynPWZO7FPA2RMqwmFAXd9mKWjLkmvLRS5z6o2DupdPl94cN00JWxu07/lyF+KorK5Sc+evqevFmprdAJOMELc+aAmHDovKPNArmGYddgxYZEBrYjpnA7SGS1RkppwfvlOa/GuXE0zHEHC7FqdBMFAZ5sga9ez8yofsWx/OWgP+T+bXaIrqXIPT4Fop1v7momznUU0Bo3c3FhrvHv+4awd1MWns87yBwEywExnzb3spddYMnY5SJ5qNaweWLyhmp+bP7DVIJbHrYgseHNO6suVkkzoInG9s7pQ0EwjFqlIyecFXYauaj11SjCVC3oIhEELPwnfyY2NCZs1BOonXEk3Iz6S7WSKZmajl3m93VMONzGCM85RqS5BZDwXvzPdOtKtDOt0g/7aeo70vKJVYcLveIoglxR6bLE=;
	31:+qIjkRoaDmWiCaHdW58DZnVY4osBpmbu137oOCS7dMuinf9edCMrHk5cxi/YfqA13jGVFU85Ou8Zg/7Dp7I9yZME+JYgfYZ3wTZwqRMFtyhkmRndJnkkVX1p0zvv1DVhCUn4yga5VXyUIZqZOnsf8H1NbME0uMvSLLc/GtBr3BUWNmWhXztlm6aIDWsSTqPH9aLh5O6wVevsaCOlnFCaHw==
X-Microsoft-Exchange-Diagnostics: 1; AMSPR04MB309;
	20:XUN7I4m2SaEQswuVHdT3ZOKshQIV7YZg+Eq9UMBIKbVsuTRV5vY1HsSqqiesftBh31emlGs/9hR5O3LKDdS1i6mZpsmrPMXrrnDuSNXYHZn1WJJNiHMAl32a2WGt/OlVIwFHJV+vlM9uFX3HZ1WDwJvRNZUswXjXjr0gfpltPr74lsup9BfUGS09QN7kBgLrJXEmydSCXGOZDb1Qh+dTwdBJx2dvFnf17srsRNIqYXyL8IyhFuLTMJ40mb56hhbbknMZdk148DGSNoeF6jes/AylLNGdkwWrdQ8mlEKSl1qwyapFKf+NZ6fy67gO+jmiZAVMQJQCvNcC4tnyGU4G/Rty6us0Q2fSv2BTSibjh7xY/u5gP2Zr1CXyACPCbgC4iBxKX2c7cozGK8bDkyfnje1ergdrKQTubkClxGgI5bbyvVst7nkzOFwSy0t6mLfpPg57tzy7WYruCQcBHzd0y7INKaq9IpJGLmHbEDUutScoBnX0buz/sY6v1JKKqQBr;
	4:O/Gpg3E3SivCnxtZk1uv6Y4VMCk+v5XDWj+ehQxPHWGcTdkbQThy9TZZMQ4iDKT0thfCdyEhF/1eD0GFdAAYJkXeXxg6q2jANqOIrHRCF/Inghnqf0ds4P4jRHhCG7ch9lVpz4/9y0xhe1335ngPi15qpuYl24t/jWNh/IaOxqX5eH+FMjiXi6OKwCQzsbESYQFSB3U7BxhCU04Icm0sDoS3aodkyTu0+t9eL8LLqGdMnzogd+IRv9lhBktpMzOcDntjHURpMjzQV261LMt6ZNn20U+7W+hmx/4yVBskrltaBTF3QZU0StGhyCYI9Zoq0H1De+tuOy63rmiv8SDrJ1qzskRwBsjgftRgSI9ffJT51GvPFsUtA7rlBDdmk9yVOrc+MNVj8TMH/yKFJrfmCoHLThdtO8n0oAYTWypQ0mo2dTlkIVGuL7eI7P7FaeUk
X-Microsoft-Antispam-PRVS: <AMSPR04MB3095FCF5D56301EA1FC2F78E23F0@AMSPR04MB309.eurprd04.prod.outlook.com>
X-Exchange-Antispam-Report-Test: UriScan:(185117386973197);
X-Exchange-Antispam-Report-CFA-Test: BCL:0; PCL:0;
	RULEID:(601004)(2401047)(8121501046)(5005006)(3002001)(10201501046)(6055026);
	SRVR:AMSPR04MB309; BCL:0; PCL:0; RULEID:; SRVR:AMSPR04MB309; 
X-Forefront-PRVS: 00003DBFE7
X-Forefront-Antispam-Report: SFV:NSPM;
	SFS:(10009020)(4630300001)(6009001)(7916002)(199003)(189002)(4326007)(305945005)(5003940100001)(7846002)(86362001)(2906002)(7736002)(77096005)(586003)(450100001)(19580405001)(105586002)(19580395003)(101416001)(92566002)(8676002)(106356001)(47776003)(66066001)(50226002)(50986999)(81156014)(110136002)(81166006)(33646002)(3846002)(42186005)(2351001)(189998001)(50466002)(68736007)(229853001)(97736004)(48376002)(6116002)(36756003);
	DIR:OUT; SFP:1101; SCL:1; SRVR:AMSPR04MB309;
	H:tx30imx-01.am.freescale.net; FPR:; SPF:None; PTR:InfoNoRecords;
	A:1; MX:1; LANG:en; 
Received-SPF: None (protection.outlook.com: nxp.com does not designate
	permitted sender hosts)
X-Microsoft-Exchange-Diagnostics: =?us-ascii?Q?1; AMSPR04MB309;
	23:aSMtMUF26zNpuHnTDjvz3RP/55uFzJYctThzzICxOA?=
	=?us-ascii?Q?kMfd9Yo7bV55sCsSfBiLmosyAmu9+yuWcj2lvZv7feGowihIFMJjknugVSTi?=
	=?us-ascii?Q?/HH8p9ZZLBRXhwu7jGzqZykKrdlUlgcUpjqO7hI+bt6qtco7TZx+ZoW00bxG?=
	=?us-ascii?Q?B/ycmDf8RqZthlhceQMmLt0JxZnYcZaIjvEX5k1Ka+AssgFAGqcNGHWWNOgP?=
	=?us-ascii?Q?+f/n2qKXI/JdOUooNOKWLIiSkR+aDf/1SzIQzU9RgtNp/NW7WnT6vTL0v7gg?=
	=?us-ascii?Q?rH1rea6JvEwbBEFMMRC52dIlgsV0+xJW+g/Iz54Y0FauaiPYd9FhPf0dfIQg?=
	=?us-ascii?Q?IisIGufC/fpGqwAIc2B37gB+SfGPgcr1EXNLPadyagMMHn9fXY8mXplD9/6g?=
	=?us-ascii?Q?KmNU0JewMuLht5F6ypF0q2UY85FOqjkVqAt5dPuS9zuavZM360wJq9EDRFUE?=
	=?us-ascii?Q?uYqmBhJDcIEy6SKkU3porMl7EIxnVP4GNlnGZ00h9KkWgpjrs3/iC6mnEVur?=
	=?us-ascii?Q?rb6VonU5gc+BvaAduzLGY8VtWFwXSiAWii/QM6sncjbRf3BsIUsVgnM4Ysiq?=
	=?us-ascii?Q?uvxLnWO67a6f19i4YmY2f/YCZe7x1nnZMeD/tAeJpUC8luP3mvRogwP0Exkm?=
	=?us-ascii?Q?1cAyHh9lKmimF+IDrflYx2kc+WAv1Sd6MouLTVq/MwqxomQBKz6fhO/IYTFc?=
	=?us-ascii?Q?M7C9i+W6ZmFHOoHgYl5SJQhM0vTORRRZWEoFLPOA+M0H6RR7GT+QdUkvlh3b?=
	=?us-ascii?Q?GUSuWb7udVJJEv5qJA4OjxZwGuzp3kxACZHboYrIWM0xbJ6DtlhZSP1zop4x?=
	=?us-ascii?Q?yf5v3w9odJHsheJfLGF0yn/JCAsfLhengoPWEgoY9z8nn3qXJ9ipxjSpItel?=
	=?us-ascii?Q?G+wCBgPqZdB8A+1N8pIoAf+AW1GqmAP6qI/8RGeXWmHMikBQAkaL4FdxEN+y?=
	=?us-ascii?Q?ty/vJuIgPEyxD5Ec0x9vabNlPZaXLWrE4ixyDGWq1dQctRaz9xEGH0CLVRWg?=
	=?us-ascii?Q?sflIH3lsDrJ6PPgi6fGNPD3JXgv1dNjDnXihIjHgiUdX5PdFl6Z5q54tLmHv?=
	=?us-ascii?Q?iSLT8=3D?=
X-Microsoft-Exchange-Diagnostics: 1; AMSPR04MB309;
	6:RLTMjyGmMkRp+v81XfszWuWsV5/mSPZd96CFF1+9b4dhPS8BvnkS1GjeTmromDbq0dh+BW8EWOxilGrTobCsQzpJHjbgELAV8IE+Mn0PaM4mZxXiB3l9tuJgdPVjNuscIonEGuwhJ4B0xvWVTqhpR31fGUpn7siNxm8RSub+/o7GnqZagjvOiTH/5fHEEnXEdn54b/2WSxz2IoqUS6uviLbUtcjore1Lk+eKHBynk9mImxFED30k4sdfOOaW9lYf0R766LgMGZ71NGkYRbQHdhOeu3cC4x64kA9XAxhdoGcHbKl4RLcsJs71CWFVcCWXRpd9/WbjaHGWfj3SXqOPIg==;
	5:zGt/7XNGT1ld9mto9FXFVLNl6WLtkdXwEXeeECkoeNB+hEl/MGr0MXkk21VjHBSiTanTcHOTCAk+WNVC3ssBzDwzsnFr5XMmn8GBkz9OYrtfeJS8fh+h3loPltIQ0gVExPueovzuioB39ZhMjJV8hQ==;
	24:/Bz5rUfLd3ExjpnzpcH6PcBjhtgNriMXVwX2JqRCaHzsh61us3VHbllwLoKvoNZAuUaipUjircwfWQQGBKRYrpgDI1sac7nEBIy2UQASRYs=;
	7:lIhkEjWIafwT50ApbQTjfGvvE+GnwroU3ruifBqyhZnvhIDyC8omu9RUKA2nH+WbnDautDoopc1sNtjYzHmkicjJbXDHiHHsBeJHsQosoF8woQnTEScfdIeIfqWoNmkexlF5to5LRduvOGtvT1wQi7tvsxyXqFX6v2DtIXzeli3Z1MoxAivTM0tyiN3oO4/tWZRP4iA6QNDmOX1Y+7OJA0m0c4fXg7sjd/tEw58H491hPjJ551MEs/WGu9MXLaEn
SpamDiagnosticOutput: 1:99
SpamDiagnosticMetadata: NSPM
X-OriginatorOrg: nxp.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 11 Jul 2016 22:10:52.2551 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AMSPR04MB309
Subject: [PATCH] weston-init: De-couple framebuffer console from Weston
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
X-List-Received-Date: Tue, 12 Jul 2016 03:43:06 -0000
Content-Type: text/plain

The framebuffer console was using the same I/O as Weston. We fix this
by having openvt switch to the new VT when starting weston-launch.

Signed-off-by: Tom Hochstein <tom.hochstein@nxp.com>
---
 meta/recipes-graphics/wayland/weston-init/weston-start | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta/recipes-graphics/wayland/weston-init/weston-start b/meta/recipes-graphics/wayland/weston-init/weston-start
index 5b7604f..1ede12e 100755
--- a/meta/recipes-graphics/wayland/weston-init/weston-start
+++ b/meta/recipes-graphics/wayland/weston-init/weston-start
@@ -37,7 +37,7 @@ else
 	launcher="weston-launch --"
 fi
 
-openvt_args=""
+openvt_args="-s"
 while [ -n "$1" ]; do
 	openvt_args="$openvt_args $1"
 	shift
-- 
1.9.1


