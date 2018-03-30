Return-Path: <alejandr@xilinx.com>
X-Greylist: delayed 808 seconds by postgrey-1.34 at layers.openembedded.org;
	Fri, 30 Mar 2018 06:42:44 UTC
Received: from NAM02-CY1-obe.outbound.protection.outlook.com
	(mail-cys01nam02on0051.outbound.protection.outlook.com
	[104.47.37.51])
	by mail.openembedded.org (Postfix) with ESMTP id 98DCA74558
	for <openembedded-core@lists.openembedded.org>;
	Fri, 30 Mar 2018 06:42:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=xilinx.onmicrosoft.com; s=selector1-xilinx-com;
	h=From:Date:Subject:Message-ID:Content-Type:MIME-Version;
	bh=FqXZDwqIcPRUTtzVbd/UrezPW7ChmmtvLkFsLp4W/sw=;
	b=njyqYq4e4xnnNMODyFuMvKf0TeTAqlLr9VNK61OxrZQQ7Q/PmDJeIQvV+aT98ItK3UchaAueSkOZJ8kv5pBbQnSaDsxNgAiha3BGB8VsjNBo2Uns3HBx0Ub9FA7UuyVBz6YTBEWHhqkR3Wey7lnCDVVCUjU6ZFWnfrqhv+C784s=
Received: from BN6PR02CA0087.namprd02.prod.outlook.com (2603:10b6:405:60::28)
	by CY4PR02MB2264.namprd02.prod.outlook.com (2603:10b6:903:a::17) with
	Microsoft SMTP Server (version=TLS1_2,
	cipher=TLS_ECDHE_RSA_WITH_AES_256_CBC_SHA384_P256) id 15.20.631.10;
	Fri, 30 Mar 2018 06:28:33 +0000
Received: from SN1NAM02FT009.eop-nam02.prod.protection.outlook.com
	(2a01:111:f400:7e44::209) by BN6PR02CA0087.outlook.office365.com
	(2603:10b6:405:60::28) with Microsoft SMTP Server (version=TLS1_2,
	cipher=TLS_ECDHE_RSA_WITH_AES_256_CBC_SHA384) id 15.20.631.10 via
	Frontend Transport; Fri, 30 Mar 2018 06:28:32 +0000
Authentication-Results: spf=pass (sender IP is 149.199.60.100)
	smtp.mailfrom=xilinx.com; intel.com; dkim=none (message not signed)
	header.d=none;intel.com; dmarc=bestguesspass action=none
	header.from=xilinx.com;
Received-SPF: Pass (protection.outlook.com: domain of xilinx.com designates
	149.199.60.100 as permitted sender) receiver=protection.outlook.com;
	client-ip=149.199.60.100; helo=xsj-pvapsmtpgw02;
Received: from xsj-pvapsmtpgw02 (149.199.60.100) by
	SN1NAM02FT009.mail.protection.outlook.com (10.152.73.32) with Microsoft
	SMTP Server (version=TLS1_0,
	cipher=TLS_RSA_WITH_AES_256_CBC_SHA) id 15.20.631.7
	via Frontend Transport; Fri, 30 Mar 2018 06:28:32 +0000
Received: from unknown-38-66.xilinx.com ([149.199.38.66]:57979
	helo=xsj-pvapsmtp01) by xsj-pvapsmtpgw02 with esmtp (Exim 4.63)
	(envelope-from <alejandro.enedino.hernandez-samaniego@xilinx.com>)
	id 1f1nWZ-0007qS-JI; Thu, 29 Mar 2018 23:28:31 -0700
Received: from [127.0.0.1] (helo=localhost)
	by xsj-pvapsmtp01 with smtp (Exim 4.63)
	(envelope-from <alejandro.enedino.hernandez-samaniego@xilinx.com>)
	id 1f1nWU-0005Yj-G1; Thu, 29 Mar 2018 23:28:26 -0700
Received: from xsj-pvapsmtp01 (mailman.xilinx.com [149.199.38.66])
	by xsj-smtp-dlp2.xlnx.xilinx.com (8.13.8/8.13.1) with ESMTP id
	w2U6SNo8002567; Thu, 29 Mar 2018 23:28:23 -0700
Received: from [172.19.2.8] (helo=xsjalejandr50.xilinx.com)
	by xsj-pvapsmtp01 with esmtp (Exim 4.63)
	(envelope-from <alejandr@xilinx.com>)
	id 1f1nWR-0005Y7-LF; Thu, 29 Mar 2018 23:28:23 -0700
From: Alejandro Enedino Hernandez Samaniego
	<alejandro.enedino.hernandez-samaniego@xilinx.com>
To: <openembedded-core@lists.openembedded.org>
Date: Thu, 29 Mar 2018 23:28:16 -0700
Message-ID: <df7b61c43d642005cd84667daabab7a0f0c8a667.1522390968.git.alejandr@xilinx.com>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <cover.1522390968.git.alejandr@xilinx.com>
References: <cover.1522390968.git.alejandr@xilinx.com>
X-RCIS-Action: ALLOW
X-TM-AS-Product-Ver: IMSS-7.1.0.1224-8.2.0.1013-23620.005
X-TM-AS-User-Approved-Sender: Yes;Yes
X-EOPAttributedMessage: 0
X-MS-Office365-Filtering-HT: Tenant
X-Forefront-Antispam-Report: CIP:149.199.60.100; IPV:NLI; CTRY:US; EFV:NLI;
	SFV:NSPM;
	SFS:(10009020)(39840400004)(346002)(376002)(39380400002)(396003)(2980300002)(438002)(3190300001)(199004)(189003)(486005)(8676002)(5660300001)(8746002)(107886003)(305945005)(486005)(2616005)(336012)(476003)(50466002)(48376002)(106466001)(36386004)(5890100001)(4326008)(446003)(81156014)(9786002)(8936002)(50226002)(81166006)(11346002)(478600001)(126002)(26005)(51416003)(6916009)(77096007)(426003)(7696005)(356003)(76176011)(106002)(6666003)(118296001)(2906002)(47776003)(36756003)(63266004)(186003)(316002)(54906003)(2351001)(59450400001)(107986001)(5001870100001);
	DIR:OUT; SFP:1101; SCL:1; SRVR:CY4PR02MB2264; H:xsj-pvapsmtpgw02;
	FPR:; SPF:Pass; LANG:en;
	PTR:unknown-60-100.xilinx.com,xapps1.xilinx.com; A:1; MX:1; 
X-Microsoft-Exchange-Diagnostics: 1; SN1NAM02FT009;
	1:WPLfyFzQsDrsBmOKE9zp60bQcESDHJnfGCyzCqJ0mr6oUp7ey3JIp0vDpstaZU8iZ9QztwzSihaUDJENuM1SVPQuXCmLwkUXYLDm5IxxlzsDb+183K+0ScuKVCo+t0Qh
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 00471a43-0197-4aac-d683-08d59607756a
X-Microsoft-Antispam: UriScan:; BCL:0; PCL:0;
	RULEID:(7020095)(4652020)(5600026)(4604075)(4608076)(4534165)(4627221)(201703031133081)(201702281549075)(2017052603328)(7153060);
	SRVR:CY4PR02MB2264; 
X-Microsoft-Exchange-Diagnostics: 1; CY4PR02MB2264;
	3:dLh9vmAHK3a1jEey4NvyFZcyH7Iig3t/z1L6Um2XhkBPXQC5jr9NpDjLW+EOPf/w1ju5bqiD3f5u4tdyc1O4HJtc566fkJltZDD12xQfmFZNm4XR14Qq40mCG7mKhF9uyJAnsd5TVzajFepV6VMI2ZE0GBW1AdLwZrncynkyPCWUOjV55ebvXHljOQR07/8acBeMn1kvNuJ6LfzDTdA+xp86W3fFKjc+aW0yoR6uDFfXYKNplJ+K0mXqdgfbRg3JErsukpSjZCkGvu59L79JJxaoNruEA04irWeCxxpt4jF/0n3A6eyC23yXZtjX4ctLrWcC8/N5Zbq18E6AnY9ysuH9bcQQraF3oImTEf1NYb8=;
	25:y8BBKipvNYrZBU17za0pi8fLkuHpAfrVL69uatMb0e6IwVWL1jBjRfpF/62AvEPEkstirxnf3CiyTjFqTGqzZ+cdDULQTcxLma+IGUEvKh+2qROViGK6+jWJwdFywmy447Ol+H9Ru/Syd5Ptej00oDwwZg2TL+mDcliIr0J2nl88WayBV/gua3Gfjf593eOVQaJMkoiGzdhekL+mbPTaallMK9zu/fzJ8NwPe4c9wJnB884QUEit50fyj/l09y84OrgHMMNhRa8vj811fTXTyL/t373m15tzJoNtX6KClzs8ai1KmWIyS6KqE/Qyyx2SDqVrywfeKdcIJ7V9E7nSjA==
X-MS-TrafficTypeDiagnostic: CY4PR02MB2264:
X-Microsoft-Exchange-Diagnostics: 1; CY4PR02MB2264;
	31:V/u6V5pfD/R+pTj6kQbSH7t1JUeROiJs/A5/+gX+Miq+7P68XJHU/8qY/GvwRQPCgmn78vp+nezyqjBJ4u97CHBqQBuXSEburt++JCF7tZbznuTBUBqVDjj7LW35f2/jPDoAST9CD/pTOubXJpPG0yPP1zc2EvPLoREDL1OFdVSUOLltmNY6xV7Y6IciyOgudzEU9UFIA4NAkrU0MQuCIQs/BMcQNK2q9fwkq6Sn1a0=;
	20:RhIfxfX49fHLW8RN9ij8jDp8Q5H5yAb/Sc0X6EL5tg6gPrWNESCcmVrmU8zZICDDuuFEbszh0pjDYP9m2QSUEH+69BDLoOxB7kAIf71v6mf5O2CHtZOMB2BsviZdTW6UUo9cjgd20RqwNj/m6OG/7SalAE6UgRoPdbUmJDf+0UENlT421oOER159cTNiCjCkaLxqW4cEGC8/Y3PEgRtMsLKLcznJ5STzF5W8qQnnReiXHFu00eDKh+n/ixZGt9v8L8Rd6yPGioj7/ceBeei10fDu8bs4bjYqWpJ5E8cJInDNup+m6gMAJNp8L9xR40v/T8xdwfOW/vmZcfHnGvFnrG+3bcHcw/x3cJWD3a/5ym8cAHpySPkycFcx8CzeCVACeRkU9fK/HBtLDJw6DivWvchzopugo60bQzACEQ0gRmEgGFF/5U95sYuX4lZ+bfurywHFd56oQPIc2YPt6N3fYVfSepKkh95yCw6WWpAguE4EMrBKkTDhuDFfulftKKH8
X-Auto-Response-Suppress: DR, RN, NRN, OOF, AutoReply
X-Microsoft-Antispam-PRVS: <CY4PR02MB2264CB1990F8D3D8B2EE52CCACA10@CY4PR02MB2264.namprd02.prod.outlook.com>
X-Exchange-Antispam-Report-Test: UriScan:(192813158149592)(17755550239193);
X-Exchange-Antispam-Report-CFA-Test: BCL:0; PCL:0;
	RULEID:(8211001083)(6040522)(2401047)(5005006)(8121501046)(3231221)(944501327)(52105095)(3002001)(93006095)(93004095)(10201501046)(6055026)(6041310)(20161123562045)(201703131423095)(201702281528075)(20161123555045)(201703061421075)(201703061406153)(20161123564045)(20161123558120)(20161123560045)(6072148)(201708071742011);
	SRVR:CY4PR02MB2264; BCL:0; PCL:0; RULEID:; SRVR:CY4PR02MB2264; 
X-Microsoft-Exchange-Diagnostics: 1; CY4PR02MB2264;
	4:2ISLj3/it1727gIlynY/Rf7qri2lB4UOHw5zaswmptCMfe9bAS3IvwEkgko0gjsG+vKWlQUQga/KsyyN2HxAkZOBuct9oRrb+HhT5SiB+LQz93qgh3AAD4Z8KicAuURWuL1y2z+GMbb1EC8ayMQcLUVdXzmnn5XEOYEruzZZk/QU7VU/G8JT4g72tllJ0v8AbGx59IL4ZS0L0LjEu4F3BqK5H4iXtVQMpqizQG1amviBiEfLEx9HzzmCmiEedZvLkBNckJMN3GmGLo8dhWrPfSkidXg7+0ZEY75AQMXo+X8FYwYrPGsO7JB0PGCV/ddV24vhq3HYpiFhltZ9HIfs6tJj7ppdwCDIy8Z35SemTZY=
X-Forefront-PRVS: 06274D1C43
X-Microsoft-Exchange-Diagnostics: =?us-ascii?Q?1; CY4PR02MB2264;
	23:Z3EodGYUIG17P74M4QKq1NwUH/lGeSxe7Tu4WdYoc?=
	=?us-ascii?Q?6J224Bw2GcOsCsY1rzl4GvsETW2bMUl497aYYnfvmh+QvgoueYSPxJo7Fn6Q?=
	=?us-ascii?Q?+eyggW1qOcfaNDFX5P7yuZg6c/vgfW5t+OyqzzUfSaZfwcuM6jbpnUpZJztC?=
	=?us-ascii?Q?ClYSsO1sFtMbH2zCGxmKe23H6MYE44BqQetuDtadwzlHcFrsx+QBSELF+RvZ?=
	=?us-ascii?Q?3P5q+4BUYQvePWyIvySzZIJvGsyo467HhHxQU36OE/NGS2xPAyYTfNSREY2M?=
	=?us-ascii?Q?LuCHpq/Zljm3Pyg26CYlRNpAiHSgUTXfFwJyluEA/jszAbK06yUli887xlpM?=
	=?us-ascii?Q?HEwxn2eyCTINc0Eo8nzaYLO5EpubKR7ygUKaQ1jhP/RXQkRA5L1dYsmtUwHs?=
	=?us-ascii?Q?6+k+2LRhvKkLka+947sH4jHbnJ14hqnwZ5u/B7aeiurUa69whX4SZGCSsHAz?=
	=?us-ascii?Q?6V7yEPKqXgvp2EPeMmp/L/3a+LyainY8AHOMYynHfbsSiyDEOwgqmKRjdsLE?=
	=?us-ascii?Q?mXnxkp2tQ/hHewF5ZyXnK3Cq9Q5jvaNsXGSMCgPfMFv7D1nJcp6+yZqr/bAf?=
	=?us-ascii?Q?R+WejNK7PlbjQoi85JcA4r1NSAyzzUnn3eAGYMpu4cRLvSiPQcpPWZ5m9Po5?=
	=?us-ascii?Q?7ATyg52zKnFGEfU70en6s+OR+bdfklpvFO8Wx85ADrgBTEoKuJGMLs9PCXa3?=
	=?us-ascii?Q?gP8RUadC8YTbDpqptdfz601OxiMK6S59P3IA7ti4HEptfc+XtAY+YV8uAOA4?=
	=?us-ascii?Q?kn81Xvb9Drxv8YE9qZlsRN8JvjcEibtIcJifRRjzAH/9eunDk+TKehf/1oNK?=
	=?us-ascii?Q?jCa9khzaZFsN1p8RIEo5Cr42XNG7K1RHXbYZCCa4OESJsvIYv+i9SqR47gJf?=
	=?us-ascii?Q?INN9S9pJdtx2gLved+Xw/YIiIkzA+X1t5bKdVzs+PsIJTMhIZeRMyZqm/9gA?=
	=?us-ascii?Q?S3o6guRecJW83TvZ6CN1JHRW3Eck58MtKVhw2Kb6azl7jFk3T32MGoJts2dX?=
	=?us-ascii?Q?PgHdpnNEYO3BKeEMv5J0GJnBN192QzefJa/dAdnf5YuV2IpuYKoyJYxd0WoP?=
	=?us-ascii?Q?Lv+ihB+FjA8F6yQT7BovAa0sU27Vi+nKm0uJXqGawEPsYt8ApCkQIvkIRSOW?=
	=?us-ascii?Q?KWpFbIOjVI9IrrB19A4OIWaDzMKCbNk1QTSokgLR+3Nh/R78DwBBrVJrlQXd?=
	=?us-ascii?Q?M4i6uS/CapXgCjMcwpFZenB1uXoyy72DDOudqOVg6T/pEY2g3WzcjkNJ5I41?=
	=?us-ascii?Q?9W3xP2anoogjSyyO0xuicP40Q2wqmuOFczdZKVf?=
X-Microsoft-Antispam-Message-Info: q4BeetZzgIUFb6eq5DzDLYuT4tMxxO9voS+/BkBMSWNtN9HH+i4Rb3DV4Ki4FrXQVIzlf0UXz/mRZVKvSV2IPWksVeVBOOc1xrr1KuxPTFg/VSmfUaGuM2r2haJWgebygzTzu2cWrzMQl2S0ond2NkdrHzbeNsHSsRAUATYfayKtzHRTZGkI/OzxYI0p19W0
X-Microsoft-Exchange-Diagnostics: 1; CY4PR02MB2264;
	6:vQX9JE9obRl17eaDl7h0A3qykKiRkI/l8mFZCMZzLXa3zl5sYjbFIoBKgJpp13rYPm+hw4TQtLmhSGtwfMRIMSbP0Mm/Ubi9ePQ8OKdVW057o8apjZuy5aq3tqSMq0Orwo+BxZ6ox2WNxaWupdSR2ARACvKE7pOCk2WPF1qtjFQk2dfv67rSK3/x6AH62B43K4DJFeaA3jKGk7udSLXX0HlpCmu4wh7fZ+emp/lXuqBnd3MHRJO4qbCCbXya2+fkctK1h00yNS9FV0QRI9nvd7Emqc6q0kMTk3oYoqnsRW6xkNMTgjrPj+hHC/4AV6X7XrQNWu2yHfL/S2ql8MAYv4A04yBUDY+N3ce1/IBS4yHvezRxrxGHek/e2a90yuE2VQq58ZwhcD1KP2spwxkKKUMyvtL6Ae0qwZILVYRLgAeLFZ4sErhT+ilqxm6tclRl9fzuE+fdCRRIr9nKXN+VLg==;
	5:X18JXTljwpuuPx609JCDUixrQ0gXM2pEZ6DJGMe1OIg/kAlUA7MxOwJNVdgUWRzKUOZQI7ntrGVSXg6olsHTC9DJPpa9g9u3G25FcP6AwcnW+jTl3VEL5FThhp+HApOQ8AL486Mpisen6z7KR3Ic1rmhTywOi8HltFCDkDYyScY=;
	24:0aitcgmouV8QYCZ3yfBNLO51FatdMa+zHggu/22KpOVUCZNo9idHTiOXTQPeJ5V6ByDvH9kqf4wF6Gb7/OMerEBeIWSayCX22GPXnOLeSe8=
SpamDiagnosticOutput: 1:99
SpamDiagnosticMetadata: NSPM
X-Microsoft-Exchange-Diagnostics: 1; CY4PR02MB2264;
	7:SjYD9B5mXZ99adQLfrpQBSrIXDaWvYmsbxbq4BbSj0ohezC+2Vrvfqsvxg3VuDrwam5rYzfrlLFKwQNNoJVRq3rrtr2rqg1rQpVYcF7W0oYBXHR9j5yoqjPO98MTW1fejQo9T4nypqxz0BJu/f5kFY9sJK4yQmLSM+c8PbUhoxFFKOmo1zmVh/K0t6V5ZIvGp+qXyclEl1rM0UieuA+x3xVeDrOmBEeMtxolE5dDNChrymlymw+aemnyqSO0m/ir
X-OriginatorOrg: xilinx.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 30 Mar 2018 06:28:32.0104 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 00471a43-0197-4aac-d683-08d59607756a
X-MS-Exchange-CrossTenant-Id: 657af505-d5df-48d0-8300-c31994686c5c
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=657af505-d5df-48d0-8300-c31994686c5c;
	Ip=[149.199.60.100]; Helo=[xsj-pvapsmtpgw02]
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CY4PR02MB2264
Subject: [PATCH 1/2] python3: fix create_manifest to handle pycache folders
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
X-List-Received-Date: Fri, 30 Mar 2018 06:42:44 -0000
Content-Type: text/plain
Content-Transfer-Encoding: quoted-printable

We have a couple of python modules that contain folders themselves,
for that reason they also contain a __pycache__ folder inside those
directories, since we include the whole folder in the manifest, the
pycache directories end up with the files and not the cache files.

This patch catches that and adds the directories to the correct
structure.

Signed-off-by: Alejandro Enedino Hernandez Samaniego <alejandr@xilinx.com>
---
 .../python/python3/create_manifest3.py               |  5 ++++-
 .../python/python3/python3-manifest.json             | 20 +++++++++++-----=
----
 2 files changed, 15 insertions(+), 10 deletions(-)

diff --git a/meta/recipes-devtools/python/python3/create_manifest3.py b/met=
a/recipes-devtools/python/python3/create_manifest3.py
index ead27e9..43e95ce 100644
--- a/meta/recipes-devtools/python/python3/create_manifest3.py
+++ b/meta/recipes-devtools/python/python3/create_manifest3.py
@@ -186,7 +186,10 @@ for key in old_manifest:
         # Ignore folders, since we don't import those, difficult to handle=
 multilib
         if isFolder(value):
             # Pass folders directly
-            new_manifest[key]['files'].append(value)
+            if isCached(value):
+                new_manifest[key]['cached'].append(value)
+            else:
+                new_manifest[key]['files'].append(value)
         # Ignore binaries, since we don't import those
         if '${bindir}' in value:
             # Pass it directly to the new manifest data structure
diff --git a/meta/recipes-devtools/python/python3/python3-manifest.json b/m=
eta/recipes-devtools/python/python3/python3-manifest.json
index 95071c5..911be8e 100644
--- a/meta/recipes-devtools/python/python3/python3-manifest.json
+++ b/meta/recipes-devtools/python/python3/python3-manifest.json
@@ -737,21 +737,21 @@
             "${libdir}/python3.5/__pycache__/poplib.*.pyc",
             "${libdir}/python3.5/__pycache__/smtplib.*.pyc",
             "${libdir}/python3.5/__pycache__/telnetlib.*.pyc",
-            "${libdir}/python3.5/__pycache__/uuid.*.pyc"
+            "${libdir}/python3.5/__pycache__/uuid.*.pyc",
+            "${libdir}/python3.5/http/__pycache__",
+            "${libdir}/python3.5/urllib/__pycache__"
         ],
         "files": [
             "${libdir}/python3.5/base64.py",
             "${libdir}/python3.5/ftplib.py",
             "${libdir}/python3.5/hmac.py",
             "${libdir}/python3.5/http",
-            "${libdir}/python3.5/http/__pycache__",
             "${libdir}/python3.5/mimetypes.py",
             "${libdir}/python3.5/nntplib.py",
             "${libdir}/python3.5/poplib.py",
             "${libdir}/python3.5/smtplib.py",
             "${libdir}/python3.5/telnetlib.py",
             "${libdir}/python3.5/urllib",
-            "${libdir}/python3.5/urllib/__pycache__",
             "${libdir}/python3.5/uuid.py"
         ],
         "rdepends": [
@@ -1088,11 +1088,12 @@
         "summary": "Python typing support"
     },
     "unittest": {
-        "cached": [],
+        "cached": [
+            "${libdir}/python3.5/unittest/__pycache__"
+        ],
         "files": [
             "${libdir}/python3.5/unittest",
-            "${libdir}/python3.5/unittest/",
-            "${libdir}/python3.5/unittest/__pycache__"
+            "${libdir}/python3.5/unittest/"
         ],
         "rdepends": [
             "core",
@@ -1132,11 +1133,12 @@
         "summary": "Python basic XML support"
     },
     "xmlrpc": {
-        "cached": [],
-        "files": [
-            "${libdir}/python3.5/xmlrpc",
+        "cached": [
             "${libdir}/python3.5/xmlrpc/__pycache__"
         ],
+        "files": [
+            "${libdir}/python3.5/xmlrpc"
+        ],
         "rdepends": [
             "core",
             "xml"
--
2.7.4

This email and any attachments are intended for the sole use of the named r=
ecipient(s) and contain(s) confidential information that may be proprietary=
, privileged or copyrighted under applicable law. If you are not the intend=
ed recipient, do not read, copy, or forward this email message or any attac=
hments. Delete this email message and any attachments immediately.

