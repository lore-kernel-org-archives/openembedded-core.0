Return-Path: <Rasmus.Villemoes@prevas.se>
X-Greylist: delayed 39575 seconds by postgrey-1.34 at layers.openembedded.org;
	Fri, 23 Mar 2018 03:17:49 UTC
Received: from EUR01-DB5-obe.outbound.protection.outlook.com
	(mail-db5eur01on0118.outbound.protection.outlook.com [104.47.2.118])
	by mail.openembedded.org (Postfix) with ESMTP id 94CF3784BA
	for <openembedded-core@lists.openembedded.org>;
	Fri, 23 Mar 2018 03:17:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=prevasonline.onmicrosoft.com; s=selector1-prevas-se;
	h=From:Date:Subject:Message-ID:Content-Type:MIME-Version;
	bh=g1X4jYvi4Ru59kqfH/zYwjguw2B+4DSJfNAzx+c3PEo=;
	b=MptJKShFl1ZlPHAT5VKIGZhgQwrOUnYLvbDkZFYfzr3zMhMbz2E3IXxBH3oDPECf5vUWiSUcURQd58C5otFoTsNogo533kCTc77smkHdRC/GiwWGIg+weZzEdC8dKEq8bRwlqxLpimKglQDgG9VWEiQ9NN06uQxZJKZ3++NVtlY=
Authentication-Results: spf=none (sender IP is )
	smtp.mailfrom=Rasmus.Villemoes@prevas.se; 
Received: from prevas-ravi.prevas.se (81.216.59.226) by
	AM5PR10MB0436.EURPRD10.PROD.OUTLOOK.COM (2603:10a6:203:25::22) with
	Microsoft SMTP Server (version=TLS1_2,
	cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
	15.20.609.10; Thu, 22 Mar 2018 13:44:22 +0000
From: Rasmus Villemoes <rasmus.villemoes@prevas.dk>
To: openembedded-core@lists.openembedded.org
Date: Thu, 22 Mar 2018 14:44:13 +0100
Message-Id: <20180322134413.8079-1-rasmus.villemoes@prevas.dk>
X-Mailer: git-send-email 2.15.1
MIME-Version: 1.0
X-Originating-IP: [81.216.59.226]
X-ClientProxiedBy: HE1PR0701CA0077.eurprd07.prod.outlook.com
	(2603:10a6:3:64::21) To AM5PR10MB0436.EURPRD10.PROD.OUTLOOK.COM
	(2603:10a6:203:25::22)
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: f0086d9f-2c32-497a-3248-08d58ffb053d
X-Microsoft-Antispam: UriScan:; BCL:0; PCL:0;
	RULEID:(7020095)(4652020)(5600026)(4604075)(4534165)(4627221)(201703031133081)(201702281549075)(2017052603328)(7153060)(7193020);
	SRVR:AM5PR10MB0436; 
X-Microsoft-Exchange-Diagnostics: 1; AM5PR10MB0436;
	3:dkjEbYqe3ZzWcGNAr7b6s0zUb8jbqJt+C/NC3ilmq7pnsG/RiyLTSMMVOuVkx+7+yEfL4EQDmZ049LJn8Qlh39lOAqEAqL/kNBZDL8LBjfro/StbwDPv4TNBh0H6x/5sHfhGuH/vFGgnO0AS3EWBiv+uLnHX9jv97T+BNbJv9kDmvDm0O+a3QnSFVwnlmZ372goG5j3K6RHo4kDtBUFgvPegrVWb1sMYftWxOmFvB3hI5zJcalkRlsOOFvbFihrZ;
	25:WobuFUpm2KzFwGYrY8StnOXbnM8kz8z59UgsIYB/3whBSMAx9mUO81qfllxBIorjWMKJSsSKPt9qPthV0bO3DFM8R87DLSudpNIUInR+O6mNMNqacZhdkXABENYExIeRI9lwU7O0+KTUVoPrMQPbrmJNhTW8zDexFdTVHwgbqt/GXXqxqUxbwU6ICso823oklcFsiBHiEA1iMsL3m8JD3CouHNnGX7kJkti8qIk79mmXGCBxlYU8sftTniBv+wX+cOcqb5Bb1mFDztHN6sK9L6B3njIARqKXOwSLzuoCwpZvyB0CDwW9WmC8qJULFqay99crUaq2faFau42+RPgHbA==;
	31:3XUbAQt3inbqI/X+pYIym8SCEmnsEHv3hWmiF5J4CuOTK4EMDTIWs/acza9bEe9GKWuC/cZ5KuEly5CN9uKlfhF7822MR0cxp4HlDN5W4dbpINcEjM6cYYxnTQ6vedU3g7o7HjmFUTQbh64SA545i3aNrI4qO/Kp+Z5qkJpioGq80XoxkPS+Cm5te5x0ToTDT2VJFJq1Waugh3ugwsHqJQWh8kE3kgB13lqJmcg2BYQ=
X-MS-TrafficTypeDiagnostic: AM5PR10MB0436:
X-Microsoft-Antispam-PRVS: <AM5PR10MB0436E6FEA62528CEF3D3B6AC8AA90@AM5PR10MB0436.EURPRD10.PROD.OUTLOOK.COM>
X-Exchange-Antispam-Report-Test: UriScan:;
X-Exchange-Antispam-Report-CFA-Test: BCL:0; PCL:0;
	RULEID:(6040522)(2401047)(8121501046)(5005006)(3002001)(10201501046)(93006095)(3231221)(944501327)(52105095)(6041310)(20161123562045)(201703131423095)(201702281528075)(20161123555045)(201703061421075)(201703061406153)(20161123560045)(20161123564045)(20161123558120)(6072148)(201708071742011);
	SRVR:AM5PR10MB0436; BCL:0; PCL:0; RULEID:; SRVR:AM5PR10MB0436; 
X-Microsoft-Exchange-Diagnostics: 1; AM5PR10MB0436;
	4:e0WAoYnCxFb+Fy2+iBadYvfdfpZ7RpRNOpwvY+okSJrKa8l7cuYsvsJR5TAveTd1yA932dtt0M05vmbVwUPf8ZsKydc+wTz/VSJo3aBlAvCy3Ag1As7eXPBmoprpB7c3I4NgVn/E54wgOpwpBVAPie8TZc5q1Ib4qqKrDk9THktaWEPvNxPD9sCwob8/kjV+nwI+XmVpY385XSprWBa6pBMMhXHW73EJcYY44f4IgeL+y+XMM18ovcS2S0WtwQN+qD+vcuPxYmU+Snp163+CnA==
X-Forefront-PRVS: 0619D53754
X-Forefront-Antispam-Report: SFV:NSPM;
	SFS:(10019020)(366004)(39380400002)(346002)(396003)(376002)(39850400004)(189003)(199004)(106356001)(478600001)(4326008)(47776003)(42882007)(66066001)(36756003)(50226002)(1076002)(3846002)(386003)(6506007)(6116002)(74482002)(5660300001)(7736002)(305945005)(2906002)(25786009)(51416003)(50466002)(48376002)(59450400001)(52116002)(6486002)(69596002)(26005)(8676002)(68736007)(16586007)(72206003)(6512007)(107886003)(97736004)(53416004)(316002)(53936002)(8936002)(8976002)(81156014)(81166006)(186003)(16526019)(6666003)(1857600001)(2361001)(2351001)(6916009)(105586002);
	DIR:OUT; SFP:1102; SCL:1; SRVR:AM5PR10MB0436;
	H:prevas-ravi.prevas.se; FPR:; SPF:None; PTR:InfoNoRecords; MX:1;
	A:1; LANG:en; 
Received-SPF: None (protection.outlook.com: prevas.se does not designate
	permitted sender hosts)
X-Microsoft-Exchange-Diagnostics: =?us-ascii?Q?1; AM5PR10MB0436;
	23:qui3bZ8I6LVyw3zNI9mvxpNn+yrSTTIKeLuDNnLUN?=
	=?us-ascii?Q?MwzzWc/0/q53xW8ekdIJJcOhocZ6/37oHokLgtFel4/YvCZ3Wcn9WGHHSYSZ?=
	=?us-ascii?Q?/G1udWIe/2WQkqI3VFD9f/idkKjzRUavAP3wOppQTDLnzSg20OjaJ3qXSPol?=
	=?us-ascii?Q?P4hLcUThOaYz3X5FgLj549rT+FPQNQBgKakQe2VBnIkdwrbyUy30g15jVEGM?=
	=?us-ascii?Q?H7IqT9U/qdZkNFBFLTH2sCajUGH/B8MBkPsnIQF7OcMVcNi12mlnothHIbH+?=
	=?us-ascii?Q?5WULmHLMC3MRW2lKyFiZLtgvD8xf0r1rIQ3+bGQF2wcmU2Vsv6VvPf0npLSo?=
	=?us-ascii?Q?2eBrw/tmEhfWThsZLcYHqGf/MtGL74SQ/H6hPC0WgYriaatos/c2nAsSIT7a?=
	=?us-ascii?Q?+8dZTmNQE1He/N2Mn3/N6SqSupHtgTfzzR1HJOTUl0rpL52upU8zNWhOYKHI?=
	=?us-ascii?Q?8R/zG2h6N1QwpBly9Q13GNdSeQq8nLXcR0gb3xkaQ1RK3BOgvklyw3CAzlGE?=
	=?us-ascii?Q?QJ2OWu3bb4QS5H2MdzCJp+4/Ff1B1AgRLoc3RSog6+PHzZDLo58I0IQstHlf?=
	=?us-ascii?Q?gWDYSYSZxVKZNmmqyuRvEhOpBtReQJOEmKOcg2hTVdiB6ChQQmKwnBprQABr?=
	=?us-ascii?Q?Y0lzpj82/1qlw/uI5NdqluU3ea1te9zDiMRJ1dSqJwgRGgUMIr7sh4tUDxm+?=
	=?us-ascii?Q?I+nf+lgomxaQHQyMIk9pNXp2ZpYoJQ50j0jmR1h6UVga0f7GTX6UwED2i75t?=
	=?us-ascii?Q?brBAkOHPTd45YkchCoqdDfUG9M6qQoK+DxArxuOqXbttrlN9hkKwMXynaBo4?=
	=?us-ascii?Q?RffeE+WPKffntaE/6VnqGfXUQ78JvCYX3+RXyUGVttdx4MBGl8eSslVJhyP/?=
	=?us-ascii?Q?ukuyij7pGAremdM1eTLT4XKWgJLmatfmhXWban3IyeOyPP0Uu0Lt1nP2fQop?=
	=?us-ascii?Q?uUoIxKPHXnKJTR2NMky3UCgMvZdmQDQAc3InXncTmk0cmaMi8ClN7ybkwsNt?=
	=?us-ascii?Q?kmNMEHXdvNejE8RxByLTSlKcmHdk5E7iILXmQiZ62S838LdTxlGz+gMDXIhX?=
	=?us-ascii?Q?zR0YSBjp+91ij8U/BQJxIUpX3kehT71OkGm01RWlglPt1N+a9p4HomjCmwX9?=
	=?us-ascii?Q?TfLRuHvK/5QRzT3oAXq5r5UeGuiVg9/06SU+nvWvLe3wFqpsozvubEK/Hv/f?=
	=?us-ascii?Q?H7+EusCc0uT8J6MTTpNhcg4W5aDjGnTSBc+ASq3GNfr1dmUoQSfj/ahz/p1O?=
	=?us-ascii?Q?KZa9LDoPUypXuX2Exxa7UNU9LHe6kdB5MhzIwKbLGZSBZs/kAboZq7HdF57o?=
	=?us-ascii?B?Zz09?=
X-Microsoft-Antispam-Message-Info: uqpxlyhuHtGE0cjtQ3jJzr7GmiQ7pyhPwVPmnuppr7thWcMcIQIOlScq3SClGXFJesYyq3Ihg9EH1rYWfqdH/fYD8gqBbD3ICG5HQWtQiX+AqNWgqYv5sXev4kZOj5tW9My2EMN2xz70l78XIn2N5NazrY9zLKvEgWqnZMKy/LlYTeByjbs2nYvF9AwYl1Da
X-Microsoft-Exchange-Diagnostics: 1; AM5PR10MB0436;
	6:kRnQQo+u7CKsGNh8ZUADHftyp9SNvTOLNxr+44YVrvLsMDkJdBzSVl1zflWO42V0Am91j8fWwm8Ye6yc01dbeQhWMe/B3uWH/Ni6zSHjyDBfX4SCwBZyXYxwfyfOfvDptBCdzSUT8ERe9W9CpqlRlWTw6p3+XrW9jS01xvGa42qEbXzy5On6Ove+wC0NfV0g95ou8a7DZRMFXE/mRohQHk5gaGk4vLyLWZi/pxdwc4wMrkLKpj8PJD9i0d0gXQyuNwt/ZPrusiLS3fnazGADM3UkiHc6KifL3DqmGXpUr94YwPHIi8wpX61c23y3O0bm2Y8nv5SXpDPC4uXv/01KUZQGahPOemtIzcroU0y43mf0D6y5SwkczlzX0U6lBXOrSZhdt9KpceUVBNTAc9d76k/mmoFXgGoWN6xcLnFLmZ6K/XF8u1LETTiAo2NiXdYrD1BoJJL+fT4XxM7QBRzvkg==;
	5:TAu4+G0YDwX82szFdV2sKE0qn8giauZXIQ5jS3OSFCaCbz5G02ozlyFgW4xFuSofw2bT6h+cbGxzKewMM4+6EMfIDu6+rWXWYxeOaNSOicDAKAjxQ0YNCN8OlDrBL8iezrILLRcEYqwwZhtbCCCc47dla1uZuxgA8egoBNvWtKg=;
	24:Tuq6xCFyATk7UyqdHlqQEGDU6VogrsoqR7lKN7QBNuYoOcRaoN5OGOuhDzb2wYeUOcVP6FPoBRhpAj5fgBKG/E2f83ehQFX7K02ptWJp3Oo=
SpamDiagnosticOutput: 1:99
SpamDiagnosticMetadata: NSPM
X-Microsoft-Exchange-Diagnostics: 1; AM5PR10MB0436;
	7:GQe72mljdMc2Dn4MOLpf27nLGEOW0BmFUUdj5JX7q5ATpIbDssgGvet9tTOxs1ACE0jU0kGXro1nv9vtEdAFK2AtkTS1bcQILEHvkrCIht53DnLAdSG73yoag8SMunk3RCg2WPNsikG8QqDHhZ5O+L63PHC0uBRNgSmYnSU/2fMrCJrRri1lRUvzhP6Kb9YjxZ+s04HGxniQOmY+mzYKK7Rdl7jx6A852ezsM8dIiXMDzWtcY+mF2rxCGWl6rDtK
X-OriginatorOrg: prevas.dk
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 22 Mar 2018 13:44:22.7909 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: f0086d9f-2c32-497a-3248-08d58ffb053d
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: d350cf71-778d-4780-88f5-071a4cb1ed61
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM5PR10MB0436
Subject: [PATCH] wic: allow bitbake variables in kickstarter files
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
X-List-Received-Date: Fri, 23 Mar 2018 03:17:51 -0000
Content-Type: text/plain

image_types_wic.bbclass has a mechanism for doing variable substitution
on .wks files by simply letting the input file be called
.wks.in. However, that doesn't allow using variables in files included
via the include directive.

This adds (somewhat naive) support for variable substitution in all
files parsed by wic. The user should add all required variables to
WICVARS to get them exported appropriately.

Signed-off-by: Rasmus Villemoes <rasmus.villemoes@prevas.dk>
---
 scripts/lib/wic/ksparser.py | 17 +++++++++++++++++
 1 file changed, 17 insertions(+)

diff --git a/scripts/lib/wic/ksparser.py b/scripts/lib/wic/ksparser.py
index e590b2fe3c..3dc17d7fde 100644
--- a/scripts/lib/wic/ksparser.py
+++ b/scripts/lib/wic/ksparser.py
@@ -28,14 +28,30 @@
 import os
 import shlex
 import logging
+import re
 
 from argparse import ArgumentParser, ArgumentError, ArgumentTypeError
 
 from wic.engine import find_canned
 from wic.partition import Partition
+from wic.misc import get_bitbake_var
 
 logger = logging.getLogger('wic')
 
+__expand_var_regexp__ = re.compile(r"\${[^{}@\n\t :]+}")
+
+def expand_line(line):
+    while True:
+        m = __expand_var_regexp__.search(line)
+        if not m:
+            return line
+        key = m.group()[2:-1]
+        val = get_bitbake_var(key)
+        if val is None:
+            logger.warning("cannot expand variable %s" % key)
+            return line
+        line = line[:m.start()] + val + line[m.end():]
+
 class KickStartError(Exception):
     """Custom exception."""
     pass
@@ -189,6 +205,7 @@ class KickStart():
                 line = line.strip()
                 lineno += 1
                 if line and line[0] != '#':
+                    line = expand_line(line)
                     try:
                         line_args = shlex.split(line)
                         parsed = parser.parse_args(line_args)
-- 
2.15.1


