Return-Path: <B54851@freescale.com>
Received: from na01-by2-obe.outbound.protection.outlook.com
	(mail-by2on0148.outbound.protection.outlook.com [207.46.100.148])
	by mail.openembedded.org (Postfix) with ESMTP id CF6CC60167
	for <openembedded-core@lists.openembedded.org>;
	Thu,  6 Aug 2015 10:29:18 +0000 (UTC)
Received: from CH1PR03CA006.namprd03.prod.outlook.com (10.255.156.151) by
	DM2PR0301MB1184.namprd03.prod.outlook.com (10.160.217.146) with
	Microsoft
	SMTP Server (TLS) id 15.1.225.19; Thu, 6 Aug 2015 10:29:17 +0000
Received: from BY2FFO11FD028.protection.gbl (10.255.156.132) by
	CH1PR03CA006.outlook.office365.com (10.255.156.151) with Microsoft SMTP
	Server (TLS) id 15.1.225.19 via Frontend Transport;
	Thu, 6 Aug 2015 10:29:17 +0000
Authentication-Results: spf=fail (sender IP is 192.88.158.2)
	smtp.mailfrom=freescale.com; freescale.mail.onmicrosoft.com; dkim=none
	(message not signed) header.d=none;
Received-SPF: Fail (protection.outlook.com: domain of freescale.com does not
	designate 192.88.158.2 as permitted sender)
	receiver=protection.outlook.com; 
	client-ip=192.88.158.2; helo=az84smr01.freescale.net;
Received: from az84smr01.freescale.net (192.88.158.2) by
	BY2FFO11FD028.mail.protection.outlook.com (10.1.15.217) with Microsoft
	SMTP Server (TLS) id 15.1.243.9 via Frontend Transport;
	Thu, 6 Aug 2015 10:29:16 +0000
Received: from carol-OptiPlex-3020.ap.freescale.net
	(carol-OptiPlex-3020.ap.freescale.net [10.192.241.17])
	by az84smr01.freescale.net (8.14.3/8.14.0) with ESMTP id t76ATEAX027298;
	Thu, 6 Aug 2015 03:29:14 -0700
From: Yuqing Zhu <b54851@freescale.com>
To: <openembedded-core@lists.openembedded.org>
Date: Thu, 6 Aug 2015 18:29:25 +0800
Message-ID: <1438856968-9564-1-git-send-email-b54851@freescale.com>
X-Mailer: git-send-email 1.9.1
X-EOPAttributedMessage: 0
X-Microsoft-Exchange-Diagnostics: 1; BY2FFO11FD028;
	1:5yhS02L/uwnlJ1liDZbSSg7ycCGjRgW25rifJUDYL1YzKEO6RrjNBfTYMMYThQj7EaVe1wqzbLFqtAik3LG6AAB3GRQvAKuvxSxiYqh8b4NaLEgLV7QtBTz62WA6mAWW+8PDhIz8ppaqvk4qjG5rQ+5DRabuPHiy037yNym19QTs6k34fRces0ap7pKsz3kE7vj3EPUa2A8HzdRWLv7xPU8wTIT4UaR3NEMi0Pu8WdOz+voG99/fy465b5yBIHT72Kc45yAOhJw7eVtTGH3VJ7TbcGximbI2pVjnac0vNuilPNGRuc6z67qR8Kl8fYaGddOzZCkjRUdrsCw8hJQd3Q==
X-Forefront-Antispam-Report: CIP:192.88.158.2; CTRY:US; IPV:NLI; EFV:NLI;
	SFV:NSPM;
	SFS:(10019020)(6009001)(2980300002)(339900001)(199003)(189002)(5001960100002)(107886002)(36756003)(5001860100001)(110136002)(5001830100001)(189998001)(50986999)(92566002)(50226001)(81156007)(4001540100001)(46102003)(5003940100001)(106466001)(97736004)(47776003)(6806004)(33646002)(64706001)(77096005)(86362001)(68736005)(50466002)(77156002)(105606002)(62966003)(104016003)(48376002)(87936001)(229853001)(2351001)(85426001)(69596002)(4001430100001);
	DIR:OUT; SFP:1102; SCL:1; SRVR:DM2PR0301MB1184;
	H:az84smr01.freescale.net; FPR:; SPF:Fail;
	PTR:InfoDomainNonexistent; A:1; MX:1; LANG:en; 
MIME-Version: 1.0
X-Microsoft-Exchange-Diagnostics: 1; DM2PR0301MB1184;
	2:EALmMfO9KzNXhQKAItp2+TLHVDWIPeVxwCdgGVJQqj3ycm2WC1Z8eG9Uu02NEOF8kmpnmLCqwx7hmrZiIa+C3p17TXTguWaEpzePtTZ3OEHuqk2aRMjb4cm6CsdkphpPzgBkc/gvd/oxFbSizzBTvI24vFHzhcL3rS0MFljbM54=;
	3:czdJ45or8BkRc0tDhV4najUY8YSFa+sI4sPczTowdPqSfVUa7zRj8Ebi75itCKYYFuaNV/PpX9J/R2FEQN4REkJ0dfNoqltbdsh6mRbkfI5m2FO9t7XGSziCUBbZQpUCy+VUVMVhFd9tir99snwud7KHUvHmShkVYKnSAuj4ZU3YJniNDcqlaia2WMY6wurpsIgkH6SMjUjhbHtLCz2KK3hpr9SEoRDrbhdz2fJOcFs=;
	25:TwaX5nYvzt7DQ8T7SP8fNKSckYXYdGLwBsEfP/VFHx6GOeyi2Pe+A1DIG04a672MyW2JhwinHLaCZnFn7yP3u1LlAvQuElAe0LGgX/ady7VsphjWgqHzADc/rZIeSKuiirmlWz0Z3lgwvMBmi77Ubn2eR3KLPzQgVEeqHk8iOyT9tWm37g5VgFn8WmAEGjB8wnrRnwjEKlrhBbCIFx6nnqNAm/0h7DZLtTd170zSP12MIje/6uWrhr2A0EAXpGlg208zBMtqUEDNPHvJtKpkUQ==
X-Microsoft-Antispam: UriScan:;BCL:0;PCL:0;RULEID:;SRVR:DM2PR0301MB1184;
X-Microsoft-Exchange-Diagnostics: 1; DM2PR0301MB1184;
	20:OojuDYnbPvKpN2H9eL57Bwm/c1QpM24mG6gHspKy3D+eI5vUh7hP1zMaTv+OzkzQ010oGk68k5OFbRt1izjJInBLQy4E9jTrsJlzb8vh1xV+bBiF14cT7XpVrPWODpneHW4V/g/ZsAqoRjYSdJ50YKMPrN8alhZ4+VTK6JOP7PgD/NO5aWLkHcPOXMg7xxjsLWx07UQFxpil8ol/gVupoZSYrMhzWwo+4tE3QXq9tQkyrreJzwFuk5Zl4NW1Ou4c0vAjIdD2JcPjceeWaJxa/A7XYAqyHTVKJ+AaAYY/O/lPlGbVlSOD2VNwKalz+RG2KMs0EExjiMnwompi+oPaE24DkaJDCa3Nu8nEEE9LKgs=;
	4:UMcilUQafGPkBOqK8QZYFNz7JKVm3xqVJZkJ7rui2WF2w+pp7lp2IYX1VZZnrmJyQtjKNkfzn/yS69XA6EnPAAYbHnRQuYa4WYmc5wMWP66XQCLZ1FNmjOVsQl9YsTy5FLbtz4yRPA1b4x69GoPu3SZQNqsUAFsy6JQ2Ncn58LSBt3vP5gmTGhnkN3pD0gZ89mqwScU7NarAGwImiZuhJeje8Bu99tIabeI3aHv4x8dwBShTyLEkaK4hn+T3SrLunAWProaVy2C9o7vfFTdKCR8lV3l2WWnpVC3aiKkZ3hg=
X-Microsoft-Antispam-PRVS: <DM2PR0301MB1184F8FA158855F389F0C9F786740@DM2PR0301MB1184.namprd03.prod.outlook.com>
X-Exchange-Antispam-Report-Test: UriScan:;
X-Exchange-Antispam-Report-CFA-Test: BCL:0; PCL:0;
	RULEID:(601004)(5005006)(3002001); SRVR:DM2PR0301MB1184; BCL:0;
	PCL:0; RULEID:; SRVR:DM2PR0301MB1184; 
X-Forefront-PRVS: 06607E485E
X-Microsoft-Exchange-Diagnostics: =?us-ascii?Q?1; DM2PR0301MB1184;
	23:b7TEPcil/ASi+6uvgjU0P+B8btIIm99nIXhUr4d?=
	=?us-ascii?Q?cwCk7pLeGmtCggP1gpnP6pyAK9TSbD5vo7rr33RGQ1lbKdhVqM6o0j0C2KLK?=
	=?us-ascii?Q?hwzhTnI7tDTVbvsWyz4rINAob7bc5A8jl4RnDViPRvE2875Z7vyJxq66fCq3?=
	=?us-ascii?Q?ePAKP7qeUyhnnpXCQlsunFHWK8bb4iHGymA03MwROV4OiE2bHLk8+jkQOPe6?=
	=?us-ascii?Q?9Q4PmjTHZn/vqwl5Xqi1i8DL7199rPWaH8vRwHXhNsPqoUNlWLvPF8ObXY3i?=
	=?us-ascii?Q?8EDYYJn0Lcis3M3ioB14m4J0JSZY3DQVUK+frSSHaAX7j39SBtmScx4BRDU/?=
	=?us-ascii?Q?Tt/Ms0QRFrkV1SfM1uDfJrfA42AZXGNBBsOGsv/2//k2OIkkDy7o6dy8Zeg0?=
	=?us-ascii?Q?IBZ2yUXtsQHc6KS8bgJ4kUugkozwW0BNPh6rP35MNuhgt8petTzlHpX8YrG5?=
	=?us-ascii?Q?r68OOh9B89n+QkzYypRthTbtQl1NlROj3MVd+PwUJU8BrFx0QJBlTKWBZyyI?=
	=?us-ascii?Q?aAMLgDPC+qAAsbPKD7oBL9WsfFhqeZ80qrSzrbWQ29FsbBavfzg4eWK0RzUr?=
	=?us-ascii?Q?Nlho7KNyBP/O00aqQauLDs9nmF3ubwQHbYCnPf0cCqguo9y9KRseU74XWBI7?=
	=?us-ascii?Q?wwyPdCaES+Ym6Mukt6+ebsjx90HuTUsQA8dD5IuInRz4XpK4Psj464d4SZns?=
	=?us-ascii?Q?92fFPla5ZviONB6E6fuchTJYhVozHr91LnKouAl/lgbyEoJmVnaXkkCIdACz?=
	=?us-ascii?Q?Csz+7oAND3jlR2fUnwcxRHCSUbs3vZw+ikTdoJHidcoqZiYxVoYPokxZ0rZJ?=
	=?us-ascii?Q?rpsSCe5mVjDya3wByrShdLZJtxpZtqvF40DzD6jr8hOCC/1Uk0Wx/afZh3Tr?=
	=?us-ascii?Q?qmc9tQciF/sSO0o0uusgNHbJFTBWiaD+Od1rJwAB64sTzgonRhjVmde2I2vX?=
	=?us-ascii?Q?6Gsq9e5U6l0w8EF+8pBvReokAgBBt+y3+EEi5ulD7+VvtDl2dShLdOX1Doyu?=
	=?us-ascii?Q?QVSmgKzFFSPCnlGfk0OAG3OHwrncV5JulsL6pGu/rIfzOt9A89M9jqjT9ksS?=
	=?us-ascii?Q?Q1yzcq2fPFIuUjzusGyMiAd3VtA7P?=
X-Microsoft-Exchange-Diagnostics: 1; DM2PR0301MB1184;
	5:HhKeWyrx73SDPOSxS5GN4bePyNfKdMPPRzHXA85kEAtjUrvt9GhN79GqXAhlnJBjtX7FEBphxIHJDH2PtiVvJSusaLIe4O74p4GaH/vHw9AH3f8ccNslOeisKbry0ZbcdEr6WKlcf/JSXe2UlSOjYw==;
	24:nw2CnwcZQb+998Ttzipvkw+gXOgFkQBjmEwGMOY4+gKfVVrCGtvFsXPBH82PHaX0BuHIRSsLedzIGSZZMI1lN7VlRQAihLCtmmoI4INujeg=;
	20:WEhitZzAaenxUGsu04g2YNzfhgVmMxa9eFXDEKrwQLI52SdJPYbjjp2uMMueo1tN1RwJz/l7ybbJBPZ9hw/9og==
X-OriginatorOrg: freescale.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 06 Aug 2015 10:29:16.8322 (UTC)
X-MS-Exchange-CrossTenant-Id: 710a03f5-10f6-4d38-9ff4-a80b81da590d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=710a03f5-10f6-4d38-9ff4-a80b81da590d; Ip=[192.88.158.2];
	Helo=[az84smr01.freescale.net]
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM2PR0301MB1184
Subject: [poky][PATCH v6 0/3] Add patches for Gstreamer 1.4.5 base
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
X-List-Received-Date: Thu, 06 Aug 2015 10:29:19 -0000
Content-Type: text/plain

Fix issue about gstreamer1.0-plugins-base

-ssaparse: Enhance SSA text lines parsing.

-subparse: Set need_segment after sink pad receive GST_EVENT_SEGMENT.

-encodebin: Need more buffers in output queue for better performance.


Yuqing Zhu (3):
  gstreamer1.0-plugins-base: Add ssaparse related patch
  gstreamer1.0-plugins-base: Add subparse related patch
  gstreamer1.0-plugins-base: Add encodebin related patch

 ...3-ssaparse-enhance-SSA-text-lines-parsing.patch | 225 +++++++++++++++++++++
 ...t-need_segment-after-sink-pad-received-GS.patch |  69 +++++++
 ...eed-more-buffers-in-output-queue-for-bett.patch |  32 +++
 .../gstreamer/gstreamer1.0-plugins-base_1.4.5.bb   |   3 +
 4 files changed, 329 insertions(+)
 create mode 100644 meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-base/0003-ssaparse-enhance-SSA-text-lines-parsing.patch
 create mode 100644 meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-base/0004-subparse-set-need_segment-after-sink-pad-received-GS.patch
 create mode 100644 meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-base/encodebin-Need-more-buffers-in-output-queue-for-bett.patch

-- 
1.9.1


