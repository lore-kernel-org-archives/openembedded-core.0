Return-Path: <samuli.piippo@qt.io>
Received: from EUR01-DB5-obe.outbound.protection.outlook.com
	(mail-db5eur01on0113.outbound.protection.outlook.com [104.47.2.113])
	by mail.openembedded.org (Postfix) with ESMTP id 8951071B4D
	for <openembedded-core@lists.openembedded.org>;
	Tue,  1 Nov 2016 13:38:00 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=qtcompany.onmicrosoft.com; s=selector1-qt-io;
	h=From:Date:Subject:Message-ID:Content-Type:MIME-Version;
	bh=JzlmwDaLKUDCh2R2hbQag+T+49US50YXowz+7tKvQTs=;
	b=HeqzGq4RAQXJ/K+bF6gFzvtI7y14S/ZnUD1oGZoN7BzS5a2KjR/HrXtIx7eARu8IJe8F80ydUStVP1s31nRTNhvteJ17/Pq5agPE1s6iGrLiGthl5gQ/Vt/tTHtpO5Y4cF/ftBJXoan9DraRh0jphoGrFcGjTkWBTZH8la8doYA=
Authentication-Results: spf=none (sender IP is )
	smtp.mailfrom=samuli.piippo@qt.io; 
Received: from piippo.intra.qt.io (192.89.120.53) by
	HE1PR0202MB2732.eurprd02.prod.outlook.com (10.171.91.138) with
	Microsoft SMTP Server (version=TLS1_2,
	cipher=TLS_ECDHE_RSA_WITH_AES_256_CBC_SHA384_P384) id
	15.1.693.12; Tue, 1 Nov 2016 13:22:53 +0000
From: Samuli Piippo <samuli.piippo@qt.io>
To: <openembedded-core@lists.openembedded.org>
Date: Tue, 1 Nov 2016 15:22:38 +0200
Message-ID: <1478006558-3119-1-git-send-email-samuli.piippo@qt.io>
X-Mailer: git-send-email 1.9.1
MIME-Version: 1.0
X-Originating-IP: [192.89.120.53]
X-ClientProxiedBy: AM2PR09CA0077.eurprd09.prod.outlook.com (10.160.228.173) To
	HE1PR0202MB2732.eurprd02.prod.outlook.com (10.171.91.138)
X-MS-Office365-Filtering-Correlation-Id: 79f13fa3-19e1-48f4-f6b0-08d4025a2feb
X-Microsoft-Exchange-Diagnostics: 1; HE1PR0202MB2732;
	2:X/j0jR8n17qE4xWTJ5zXJmc78WxBiE8YgQpf6aVe6O+B+Gm7dxc/DIdyZQ+Jv9q939zD45fd2zx8WIKHgep/KKqRI/OvYVmrfMqGD7B9WQ0xyfg4YNIC8zBAS2dcwd56coGIBkHtLzdfvfQR1HpmqilfOrn8LWXjMx0od5PCqSRVd1mrMOQIl6lcQEcme7eeaktHSTdm8LlZQDIuCneOJw==;
	3:HJD1SijEFQA0KpDz0DNou3UOU6+BH4KoBvomtsJqrl0rIZVS/Y211vbG/7vYqd34Zcoi2wyC4ojYgB5Xnn1YS+B4kbyfngqcfd3oolkJjaPsKjKGQquI1p62IWd/TLvHr2mznY2ah3pxyq+V9wVemw==
X-Microsoft-Antispam: UriScan:;BCL:0;PCL:0;RULEID:;SRVR:HE1PR0202MB2732;
X-Microsoft-Exchange-Diagnostics: 1; HE1PR0202MB2732;
	25:LJhDSm1TrORio6ii6uApGaUHZx6NlWYwggOIZCClw8MmhkljEvXQ+GKN3Yowu43lpCISw7MES8Kmqww+ZyzOjN+InmF89r69uqq4uh+we5brxMkrHJNhszmpbSVTGsRe2D5H46oNGGsCZFnkrJwlMtq87WlO8Ha8stZH4awhNMWF5TWA7e1Y3W95J2SKYtD0WgpMi1Kag0dMWe7FYCGtL39x6rLaw3ffDgoMnUtIBukVsIEMh3J9TuZlyDAuN+qgOLlY4rfCXIGDLVbHQ5c4gTSJJFzY/hgmG3XpIGihyIELqfICKO4uPjuGzy1LApauI61uTU3kZ/6/O5mrL9imlljwCWfpCs9k3KiFIGbjDLmcMslOgbeh8SexHZazy6u6uBhbkdOecaVQk1YVtHYvVnKVrLCWOQYF+H9AKnIp4zAdCkbz8id50E3JiA47Fn4pqJVVacdbWTkKTorwULwyIGl3jDcqEpmVqdRXpk9S1oYENWF46nMxA5abCO8ehBWhg4u6BaBUaztzD0hgZao0tRInXKGcR8otGpIkbuigGPIEs75JyYu1DndiKh1B35CByPK7/+cDKYuaPurdeT/zeWRRpfl5Xpy0naDAaqX9tjbBhMe+ynkNWWjd1fYWHdDOtIr6HrRvwJXg6tRv5Bop+hobTZ/gAAc2W/iYwkAKt8o2AtS1UaxFdTSFUgyykoQbGrxlpwZS2vFGLsxZzH8XO4GBYGQZwO3JFsQTBnz2JaE=
X-Microsoft-Exchange-Diagnostics: 1; HE1PR0202MB2732;
	31:mdlxBHV8zBlGUIGBBf1zLZx3C1hTTPT1XbE7mpzBmH9vD70pKZDTh4Zl10DPMFCCCiPp7ZUTlr6yMdo5U6P/RPkA0IkXyy+mX5PJNlQAKJF1ZdzsOYQoI8IkDlKvDbet44g0TNRJch4h2uznpg6GYNkpasItSunvplkFNCKXr+LJ4zL1v2NkDEsqSVIXZRJnFyQb3Ru8UwjbnD8DYEbg3GTmNdlOjyW6msb53wGijYbo7K3E+RddkwJKBjvtPKxg;
	20:3j3wj4g2/yNKULB+x9gTR2K4BU4NS+lChyyeerfgDQDU9oTsqLACO5Ef1f8C5beWB83vW6ib9YkJfkNlm3KEgTDTLyv8xdai4HnBz9VzhPw9ULgx1XmfIirOy3sfSmZMl81u148qpJ+3oW25u9yIVDOYK9WNi6whpzFsNGrWW3yMBPL3x2OSXS/aPlDkvuHboLEYcDdiDUEis7/cN7QZPwKSCxQbjFad/RplcRF7/ZOhM5tArtOCbvk+EYJeFxYT
X-Microsoft-Antispam-PRVS: <HE1PR0202MB2732CCA778AA5998874DB52BE9A10@HE1PR0202MB2732.eurprd02.prod.outlook.com>
X-Exchange-Antispam-Report-Test: UriScan:;
X-Exchange-Antispam-Report-CFA-Test: BCL:0; PCL:0;
	RULEID:(6040176)(601004)(2401047)(5005006)(8121501046)(3002001)(10201501046)(6042046)(6043046);
	SRVR:HE1PR0202MB2732; BCL:0; PCL:0; RULEID:;
	SRVR:HE1PR0202MB2732; 
X-Microsoft-Exchange-Diagnostics: 1; HE1PR0202MB2732;
	4:rpxvPGvFjA7zAAZwCq438gBfgWuvkQ6S5h3fFUzpmvP1bl6hETakxG8K40DQpW7DoWGt9DxtXMQEkpXFuUijB/Jq8Hl9nhiGeDC261TDYHm2cQ79l1osie588Xf9uUq70e75zIxeXrL/dKLIeV3ic/5rfPIElnmUm4I99Tz5iodor2Cx+pUiXZAJQWcDHaigae6rA9iG7OQi3mEcr37v3m951E4z8VoO+B8d2JRITuS9vMqjk34nFvfa5oFSaSxrP4xwPHlos2kc/M3vbzqmevnEDCG0JmU+vaSWpZL0W941q0O81rmMkZliDTYceSF2prBKuI6jWBaGAnunv83EifskvFrVrTvd03vl5jhg150aMy/EPWJPP+mxAfWadOjT9SYA0xFGtbBjVrI93TXIxTW2Fz9hym7n9u/1dVATfp+GX8cBRYbWD9lowoUrOqJn
X-Forefront-PRVS: 01136D2D90
X-Forefront-Antispam-Report: SFV:NSPM;
	SFS:(10019020)(4630300001)(6009001)(7916002)(199003)(189002)(189998001)(33646002)(305945005)(5003940100001)(107886002)(19580395003)(19580405001)(6916009)(81166006)(92566002)(48376002)(450100001)(6666003)(7736002)(8676002)(86362001)(7846002)(50466002)(81156014)(68736007)(50986999)(66066001)(105586002)(3846002)(50226002)(36756003)(110136003)(2351001)(47776003)(6116002)(586003)(42186005)(229853001)(77096005)(74482002)(2906002)(97736004)(101416001)(5660300001)(69596002)(106356001)(53416004);
	DIR:OUT; SFP:1102; SCL:1; SRVR:HE1PR0202MB2732;
	H:piippo.intra.qt.io; FPR:; SPF:None; PTR:InfoNoRecords; A:1;
	MX:1; LANG:en; 
Received-SPF: None (protection.outlook.com: qt.io does not designate permitted
	sender hosts)
X-Microsoft-Exchange-Diagnostics: =?us-ascii?Q?1; HE1PR0202MB2732;
	23:NxGgsafI8S/oHX2bVsHz1K6GgnCu5D1ZGyyVNQg?=
	=?us-ascii?Q?G7SAIYrP8gyaViVFM4z8MhNLG1My2+xqq2lUyUUnNXKS6kxrtGa0qyYC8wDU?=
	=?us-ascii?Q?2fRE7x5xv8/fjkWTJ9ynGebFJLbNvxnROs6k7TAeOvpRMyAydHGr4QtuDRmb?=
	=?us-ascii?Q?5GMmu+O1m2mHWez14ES9B/PvxKnWNmx+coy/6zFFm9L2/befisd+eXpBHciM?=
	=?us-ascii?Q?FMJExp+GmXYExtpqGGZZjgXmhsmekm4kHWR8dpKItMqDFlV1G1ujN0gi5C9V?=
	=?us-ascii?Q?sX+ZJl0WLgQfHJtM4eNUT5Han3Dc/H7lti+h8l6br/A3Ryyqg17ESlkAG5n7?=
	=?us-ascii?Q?4yz3FtEkvM6nJvjLxJrcufe9aQOLzrjqoI1QgvzJ72c02/x+9TkJyHSxhPM4?=
	=?us-ascii?Q?9kk1dH7f4XIv6KDcy9z3NpTPH+G337Mg0lhbI1E44F+Cja+lYgEQp/se28Et?=
	=?us-ascii?Q?7/KU+leB+2FtBYRsM2Qtn2pZ4Nvko1WfF4NZvu7yV3OPqjZ0HWQoX1P2Zyf2?=
	=?us-ascii?Q?BJWiZoWSq5WXhY5pbGYMaLQLqd6wmmlM3ftm04wqvuSB+hvV83DuPzXc2N8Y?=
	=?us-ascii?Q?FseA2eGl+mUIPlCV8QWnyoj9U9MXXi/uQkIuFta2h1HcTE4Rc4+HHINsFdWm?=
	=?us-ascii?Q?82FdUdtzgNi7SGiub61qYx+yNt+9/6PHuACUS23U2/BISF3kKA3Efa8/1Fy9?=
	=?us-ascii?Q?PXkp9BgWhg9/6um8gtYNWiiKREpwn0Pl7pyf9dxkFDvFNsdJi9SMWSm4z/gL?=
	=?us-ascii?Q?yy1WiNPi1Wy/ZznaBfKcDMO+KXPh4klqd/1W+Gbzdcv3M0FpIaBty28YZwyv?=
	=?us-ascii?Q?H27bN4QasMYKC6v3aZKteIMoe0vKNRj1BLb48Fea5Eis2rYWasdRwEYMqr56?=
	=?us-ascii?Q?k+P4yYoI4AXMG209agktryv8XGKkG5ll3hvfdVDFZ4CMiwsU2J5nZkqRtdcc?=
	=?us-ascii?Q?oZAd7fZlOR7LmdDiuSpP7JqDl/CQtjqMy7ApcReBfII3cHQnW9rM+t3kmPj9?=
	=?us-ascii?Q?QpEfg5SD8Di0TWU/APInnZtBUb4eU1uaMstZ5gHgrSmLf07t3ggMQDyBr00o?=
	=?us-ascii?Q?ZUtvJLA+FKnpITyFq0GvEbC5+czhoeb9f0Q0ievIRQ+5HicWcFv6hbgQUfdU?=
	=?us-ascii?Q?b4lDGh1X5la1f4ZMUPqSWFuMcHpj31OCc?=
X-Microsoft-Exchange-Diagnostics: 1; HE1PR0202MB2732;
	6:X9DRvxKAEj1gcZfdoWyfFhUnONxlR/8J9kQSy1wjIchstn8Zr+LAZmniCOaYFmw+KHeH5GWSXODa+emd8wLei1whE8qv+0TuN1W5TjDVHjDUCDY/UA+XpITv5G1DkwLuJTGQ0KsjhDWxNsMDab9O1GL6FGXwxex18iuu0e2J7DuYOXJYNS30mtNTwHo3t/lf2+ohcoYuEOFNuSgBsFsMJCCpjeHDqvEmul0a3xe/pKzqxf/V1kRqk6NZgstbKn6eqiHM1aKYRfAtzpP9kcNhYsPulIGyauPfI3H17FW5jN01RFwR61+ADnYIkgKKr5OlzOExfHbaPrcLvrGsoqXSjA==;
	5:gMgyMvXTSGfMTP35UEPh3psBYdQPDgCDhJqthzpolj4Um30mpcRAXUXEVwQvhFkHl+jH3bpasHlYflNDBttAaQqda9jrRqAxYQjlrY0S3Xl8fBf5Qay779CF6QlTC2zsHlMVwyth7DQM9SO7pRW98A==;
	24:63dbzgyrhMDAO8DPgi4VZMMAp/2h8i8e5eToeHA1p3hyRPOPQbM9jFbXodDH2aM6d3gAlj/CgzjXnoPics3OLiRvfrGjbvg7HHBYu2B2IrA=
SpamDiagnosticOutput: 1:99
SpamDiagnosticMetadata: NSPM
X-Microsoft-Exchange-Diagnostics: 1; HE1PR0202MB2732;
	7:yjUeueEO/eCdl8LJuWuQm4mhoHPdtpGEqPCGGpITJkoF+8UhzlXyA7I/HqBOvfztSXkywOL7eBU6pFDLlMDICLylCRdKkxAO1+aOvO659lgRKwBuNApUOxPMZk8gndKtrL3VJcDvY6pckOo66QoVGj521E9tVv1ENe3QUb1rkiHNR9nW1GQZ6E4DabhQOpm5iun/FGJZPrnd/GbZknKAnkMWb8COmtgpADHFNZMmCKfMlsos+G3bRp6uckWAIejiMMruKQbexYG94t9Bm/D0kLKpKREiDVq6krvJc6t/HRJA5bCSI+1sbL9OTQAKAUdk3NqoH4Fl5heDyZz8shlW3f0ZAg4JO4KPYg3wgcVf8aQ=
X-OriginatorOrg: qt.io
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 01 Nov 2016 13:22:53.8226 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-Transport-CrossTenantHeadersStamped: HE1PR0202MB2732
Subject: [PATCH] package_manager.py: correctly remove all dependent packages
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
X-List-Received-Date: Tue, 01 Nov 2016 13:38:01 -0000
Content-Type: text/plain

Do not use --force-depends when trying to remove all dependent packages,
as it removes only the selected package and not the dependent packages.

Signed-off-by: Samuli Piippo <samuli.piippo@qt.io>
---
 meta/lib/oe/package_manager.py | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta/lib/oe/package_manager.py b/meta/lib/oe/package_manager.py
index 3cee973..a9d216a 100644
--- a/meta/lib/oe/package_manager.py
+++ b/meta/lib/oe/package_manager.py
@@ -1776,7 +1776,7 @@ class OpkgPM(OpkgDpkgPM):
 
     def remove(self, pkgs, with_dependencies=True):
         if with_dependencies:
-            cmd = "%s %s --force-depends --force-remove --force-removal-of-dependent-packages remove %s" % \
+            cmd = "%s %s --force-remove --force-removal-of-dependent-packages remove %s" % \
                 (self.opkg_cmd, self.opkg_args, ' '.join(pkgs))
         else:
             cmd = "%s %s --force-depends remove %s" % \
-- 
1.9.1


