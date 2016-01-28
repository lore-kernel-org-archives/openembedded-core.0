Return-Path: <B54851@freescale.com>
Received: from na01-bn1-obe.outbound.protection.outlook.com
	(mail-bn1bn0106.outbound.protection.outlook.com [157.56.110.106])
	by mail.openembedded.org (Postfix) with ESMTP id 24B9B77164
	for <openembedded-core@lists.openembedded.org>;
	Thu, 28 Jan 2016 09:05:32 +0000 (UTC)
Received: from BY2PR03CA011.namprd03.prod.outlook.com (10.255.93.28) by
	BN3PR0301MB1172.namprd03.prod.outlook.com (10.160.156.146) with
	Microsoft
	SMTP Server (TLS) id 15.1.390.13; Thu, 28 Jan 2016 09:05:31 +0000
Received: from BY2FFO11FD008.protection.gbl (10.255.93.4) by
	BY2PR03CA011.outlook.office365.com (10.255.93.28) with Microsoft SMTP
	Server (TLS) id 15.1.396.15 via Frontend Transport;
	Thu, 28 Jan 2016 09:05:30 +0000
Authentication-Results: spf=permerror (sender IP is 192.88.168.50)
	smtp.mailfrom=freescale.com; freescale.mail.onmicrosoft.com; dkim=none
	(message not signed) header.d=none; freescale.mail.onmicrosoft.com;
	dmarc=none action=none header.from=freescale.com;
Received-SPF: PermError (protection.outlook.com: domain of freescale.com used
	an invalid SPF mechanism)
Received: from tx30smr01.am.freescale.net (192.88.168.50) by
	BY2FFO11FD008.mail.protection.outlook.com (10.1.14.159) with Microsoft
	SMTP Server (TLS) id 15.1.355.15 via Frontend Transport;
	Thu, 28 Jan 2016 09:05:30 +0000
Received: from carol-OptiPlex-3020.ap.freescale.net
	(carol-OptiPlex-3020.ap.freescale.net [10.192.241.17])
	by tx30smr01.am.freescale.net (8.14.3/8.14.0) with ESMTP id
	u0S95RjB031680; Thu, 28 Jan 2016 02:05:29 -0700
From: Yuqing Zhu <b54851@freescale.com>
To: <openembedded-core@lists.openembedded.org>
Date: Thu, 28 Jan 2016 17:02:46 +0800
Message-ID: <1453971768-27844-1-git-send-email-b54851@freescale.com>
X-Mailer: git-send-email 1.9.1
X-EOPAttributedMessage: 0
X-Microsoft-Exchange-Diagnostics: 1; BY2FFO11FD008;
	1:qQcuA/N9FACBSbcn6UU0aMbSE8IiMwgkYbdHwHh5U+tqHIZtTEa7o/f6LCUwKRRM0IsdOsPNBcMUQrPKSznesP5MVLy+NvfHlk1vNRwBVYSkDiuEUDYveUSSTG+C7pR8MOFWD1/gl6MVFHOw4uC/Gy2t8g0Lq2AKK5MohJDbXE8XYuor5wMC6lysaESabz543ZO7JW8ulBv4xs4zJOgitGdalWPXWD/yxtiG2gI5DC5A02u6giIad9BPImznXeqqCHuGZ3OdG9UaZoH8e0v1WAN00+dryXwZbdwNyHKGd8DRQGlBz2anozwDx/e+uf6u8rLrs9exZhf+rdrUEbUBFS2qTGnekp5AX/ohQc6scpKr8GGhInr2DBLVXs9so9rXc/LDLZRyhPdsJe+8ZYx48jYQxIz3B9MphIb4iogJ4FsUDagsOl2avHm3I2Lvy31G
X-Forefront-Antispam-Report: CIP:192.88.168.50; CTRY:US; IPV:NLI; EFV:NLI;
	SFV:NSPM;
	SFS:(10019020)(6009001)(2980300002)(448002)(199003)(189002)(4001430100002)(189998001)(104016004)(6806005)(106466001)(85326001)(50986999)(2351001)(1220700001)(50226001)(110136002)(107886002)(11100500001)(50466002)(3470700001)(229853001)(47776003)(86362001)(586003)(33646002)(4326007)(5003940100001)(77096005)(36756003)(48376002)(450100001)(97736004)(92566002)(81156007)(5008740100001)(87936001);
	DIR:OUT; SFP:1102; SCL:1; SRVR:BN3PR0301MB1172;
	H:tx30smr01.am.freescale.net; FPR:; SPF:PermError;
	PTR:InfoDomainNonexistent; A:1; MX:1; LANG:en; 
MIME-Version: 1.0
X-MS-Office365-Filtering-Correlation-Id: 070033eb-defb-4b5b-1ee0-08d327c22c24
X-Microsoft-Exchange-Diagnostics: 1; BN3PR0301MB1172;
	2:UeW+yJJrm6/rbE8Ce67NmvWIbGmzop+/TusIDbA7WDQeL49uot8CgSKSodolq4zKuA5rOILwnIDfnZoF8Mzdse5ZMQqIx719mQkZAy5JQZZ7ztadX2idBa/vu+FWg/4CbyNmvoqZ0xT8/hPj4a2cDYe2VmmwUkEbwVGNAjHofJGbX2cpHdqw+kIxF2zXA7yl;
	3:HlK2awSYtDpurVHYEvX5Fkb1JpOb58xZk5Ev70iiLc45dVNp60Br6AE673i17KG7Og2TgANK9p6h+M90qzoiz11z9rG72eMh6Q7bF/ZLjzqdGULop1mTZL4lNWJxGurUDLnsQnEuWR4NkMg4MtuqXBtmpFRIWvUyPFRmwSFPo6NiPbv3cW8R+3fj572A0jBcxUi11KII2k3UeY5l45HCAe7GiJbcjBmPS3VEBPSnFFM=;
	25:MFcw9mlNdnegTTImXnZRQtU52ncmw30ETMPbJLR8Z4CU5fq/ZvvokWjB87YUMOr2BREAZEIIPbBnQ1A5GaSR/YO/+YLeqHab75VCb3qZslpH2T+ckX6J2qFNjLZNj7vXLYGAa5HgkHJpl4Ns/1WQcAf8tgzQKlXJgBHXHpogxb9DEdlzKlKzihj2FVDFycjQVtxnNKZ3vIxmh1M1XEhTgKTNIjsUYqjsKU0hhGm4V8J2nx7Cy0QlNeeDnGykox6W
X-Exchange-Antispam-Report-Test: UriScan:; BCL:0; PCL:0; RULEID:;
	SRVR:BN3PR0301MB1172; 
X-Microsoft-Exchange-Diagnostics: 1; BN3PR0301MB1172;
	20:Dmg1dzc/BYv9n1wIjjWqDg1/2Y0KMCwkHdbas7/EUTKQTna1VlW5hDWNliPlVLwhSirHmwq7QWqxAuuzGI7acdyEzO3BFye4Jn9vSRtjfwCSAhLeZd0dEIhKGvWHPdbADaJLR9zfQAiHT/b4bRiN7SXUW0dLtt2VfYytof8/AAOrQCxpffDVBze6R0G7c/6Ntvix3i/AzC7SXyyhAjjopbaZmrb5rVZadWGgV06ffZ3l0KaRLZd4WVHyHYkLuTlcsPWeU1Uq4LI8Gjtb9sI+qMMi8ZnXicV5z5DEKeOF3BHNsUXii08lSA3X4vUjcagiOQTdWnM+Z4KKzI6GwMglI3bOzzkUwUO2/L4stnnthfSH8COhCQd9dcTCKepSTuxVVyCTfY69P9yNmvPBecMnJfIjv3csXHhYhPTKQTotXg2ZcRbVwCI6VdkJHJQNso90
X-Forefront-PRVS: 083526BF8A
X-Microsoft-Exchange-Diagnostics: =?us-ascii?Q?1; BN3PR0301MB1172;
	23:kxhpCwa9g7rsExaa4YZzsKVxEft5Z97KZKB++qA?=
	=?us-ascii?Q?uC01ghF+LQEolXWnbSE+tlQ0llIHeCdCTE04YT3inDE/E/+/Nai456VUqPaD?=
	=?us-ascii?Q?90Vb62aSabB/xUssoY17u3gNcNGGDjNx0bvLjxvb0ki3R+/wGovlFLcembj5?=
	=?us-ascii?Q?B3ePDosm543W72On+1U2IXjrJiTEUvVJQCGNJnA7BvZDDzqzkHyI7CLymHRn?=
	=?us-ascii?Q?eaMUgcCIdth0lY5UfA3yluZLOT7as8ZanvUey9PDL7C8QqM2cHIZcveB+SXt?=
	=?us-ascii?Q?R5jGVM+Pstl3ypGA+t2VX63wIRLYzR1Hq3SEeEyb2atKKZn3DlgpXCjCojyD?=
	=?us-ascii?Q?N3LWTn709/5KXWCT+yhZNnnjBX6tbhnQczTwYFXnLc7LCPpXvBA1atp2UO41?=
	=?us-ascii?Q?rs4PQOm8b6vI5IeoMqXWNcO9L3g2URG4GPEaa/BLyOnwP8YIhkrjnRv0KNoA?=
	=?us-ascii?Q?sMcjhzUC6Nh2DWhrCYwFT9tEbwkWUQd4/aeYZzv0mvXtvNfp4PniG4KAx7+u?=
	=?us-ascii?Q?JphleCTHnXkRG0knhmtT8wWOUIAOhtFjJRFBlzCaxyljnivnEolWydqe82Vt?=
	=?us-ascii?Q?FuYbyW7xx0vRseP4zik6U4N1ZP3ttVRyQbLXESKO9n+YnTIde7pzeQO3yY2l?=
	=?us-ascii?Q?JWi3dxN6AICC+22Gxkp9+eYCdKRb+8JpdBAmMX3mUAO75v2UpJkgXDOcEyzx?=
	=?us-ascii?Q?fcILYHi7mcX1tK8uYGOlyuZyNYqwB2gzjbrTJgRcVpm8kws4V6GUj1Dg8dzK?=
	=?us-ascii?Q?uwhsUROg9jS6HCDq9gt0RMIJKzkHQT9VU00lDP15V59eyemguZIH4E/n5CBm?=
	=?us-ascii?Q?IUur1gch44Uy7kmUkxyXwb16N+xlW26Lw7iP6BfcjqZ/1MKMLO5XmZ2AjdgF?=
	=?us-ascii?Q?boQkDdKprZFY5gp9gTcENW45pZXINbkb6U+2w8tsqMkicVkbxCCnK6Vx0AAO?=
	=?us-ascii?Q?+VUBRIMruNYHSsZ0SKhVKe011nSfuxilLMWSvDteoYQ=3D=3D?=
X-Microsoft-Exchange-Diagnostics: 1; BN3PR0301MB1172;
	24:yxbnab81Nv48SIo0/d3lMdPsQaMX0o5RGXcHVPW6Kld93nY84PYDs5CPtfN/sGi/isl4RIKK3Ae9OSBaaOzHgCzz+d1YmJriXseLLw4OavI=
X-OriginatorOrg: freescale.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 28 Jan 2016 09:05:30.5047 (UTC)
X-MS-Exchange-CrossTenant-Id: 710a03f5-10f6-4d38-9ff4-a80b81da590d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=710a03f5-10f6-4d38-9ff4-a80b81da590d;
	Ip=[192.88.168.50]; Helo=[tx30smr01.am.freescale.net]
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BN3PR0301MB1172
Subject: [poky][PATCH 0/2] Add patches for gstreamer 1.6
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
X-List-Received-Date: Thu, 28 Jan 2016 09:05:33 -0000
Content-Type: text/plain

As gstreamer has been upgraded from 1.6.2 to 1.6.3, and my former patches haven't 
been accepted yet, need to recreate the patches based on new recipe.

---gstreamer1.0-plugins-base
   Add video crop supporting when convert frame.

---gstreamer1.0-plugins-bad
   Fix memory leak of navigation thread.


Yuqing Zhu (2):
  gstreamer1.0-plugins-bad: Fix memory leak of navigation thread
  gstreamer1.0-plugins-base: Add video crop supporting when convert
    frame

 ...window-fix-memory-leak-of-navigation-thre.patch |  35 +++++
 .../gstreamer/gstreamer1.0-plugins-bad_1.6.3.bb    |   1 +
 ...ame-Support-video-crop-when-convert-frame.patch | 143 +++++++++++++++++++++
 .../gstreamer/gstreamer1.0-plugins-base_1.6.3.bb   |   1 +
 4 files changed, 180 insertions(+)
 create mode 100755 meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-bad/0002-glplugin-glwindow-fix-memory-leak-of-navigation-thre.patch
 create mode 100755 meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-base/0005-convertframe-Support-video-crop-when-convert-frame.patch

-- 
1.9.1


