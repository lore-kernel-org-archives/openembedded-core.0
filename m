Return-Path: <ckalluri@xilinx.com>
X-Greylist: delayed 35085 seconds by postgrey-1.34 at layers.openembedded.org;
	Wed, 05 Dec 2018 05:39:53 UTC
Received: from NAM05-DM3-obe.outbound.protection.outlook.com
	(mail-eopbgr730076.outbound.protection.outlook.com [40.107.73.76])
	by mail.openembedded.org (Postfix) with ESMTP id E64AE6C14B
	for <openembedded-core@lists.openembedded.org>;
	Wed,  5 Dec 2018 05:39:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=xilinx.onmicrosoft.com; s=selector1-xilinx-com;
	h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
	bh=JmF1/EXAKwb34edXesETqVD4UkQL9ldzjEJd32dFAlI=;
	b=eAL4mBxHkIxnbsxvS2rysbxR7tKfPYLO85L9/gthplB07PzF3ubwIfBVHupKbmNbdVhgfnDVDvXxGdRsjDzBj3cUqK6RbUVS69qqp6OWJbCC9IzlGEJYWW+wwJIm2NzGrcZo/tNP5GJAfJSvPlft030e8QgV0YO0/QDj+4uyUFA=
Received: from SN4PR0201CA0063.namprd02.prod.outlook.com
	(2603:10b6:803:20::25) by DM6PR02MB4330.namprd02.prod.outlook.com
	(2603:10b6:5:2a::27) with Microsoft SMTP Server (version=TLS1_2,
	cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.1404.17;
	Wed, 5 Dec 2018 01:09:34 +0000
Received: from SN1NAM02FT047.eop-nam02.prod.protection.outlook.com
	(2a01:111:f400:7e44::208) by SN4PR0201CA0063.outlook.office365.com
	(2603:10b6:803:20::25) with Microsoft SMTP Server (version=TLS1_2,
	cipher=TLS_ECDHE_RSA_WITH_AES_256_CBC_SHA384) id 15.20.1404.17 via
	Frontend Transport; Wed, 5 Dec 2018 01:09:34 +0000
Authentication-Results: spf=pass (sender IP is 149.199.60.83)
	smtp.mailfrom=xilinx.com; lists.openembedded.org; dkim=none (message not
	signed) header.d=none; lists.openembedded.org;
	dmarc=bestguesspass action=none header.from=xilinx.com;
Received-SPF: Pass (protection.outlook.com: domain of xilinx.com designates
	149.199.60.83 as permitted sender) receiver=protection.outlook.com;
	client-ip=149.199.60.83; helo=xsj-pvapsmtpgw01;
Received: from xsj-pvapsmtpgw01 (149.199.60.83) by
	SN1NAM02FT047.mail.protection.outlook.com (10.152.72.201) with
	Microsoft SMTP Server (version=TLS1_0,
	cipher=TLS_RSA_WITH_AES_256_CBC_SHA) id 15.20.1404.17
	via Frontend Transport; Wed, 5 Dec 2018 01:09:33 +0000
Received: from unknown-38-66.xilinx.com ([149.199.38.66] helo=xsj-pvapsmtp01)
	by xsj-pvapsmtpgw01 with esmtp (Exim 4.63)
	(envelope-from <chandana.kalluri@xilinx.com>) id 1gULBr-0006rm-8V
	for openembedded-core@lists.openembedded.org;
	Tue, 04 Dec 2018 16:37:23 -0800
Received: from [127.0.0.1] (helo=localhost)
	by xsj-pvapsmtp01 with smtp (Exim 4.63)
	(envelope-from <chandana.kalluri@xilinx.com>) id 1gULBl-0007rA-SY
	for openembedded-core@lists.openembedded.org;
	Tue, 04 Dec 2018 16:37:17 -0800
Received: from xsj-pvapsmtp01 (xsj-pvapsmtp01.xilinx.com [149.199.38.66])
	by xsj-smtp-dlp1.xlnx.xilinx.com (8.13.8/8.13.1) with ESMTP id
	wB50bB3n005869; Tue, 4 Dec 2018 16:37:11 -0800
Received: from [172.19.2.12] (helo=xsjckalluri50.xilinx.com)
	by xsj-pvapsmtp01 with esmtp (Exim 4.63)
	(envelope-from <chandana.kalluri@xilinx.com>)
	id 1gULBe-0007qa-No; Tue, 04 Dec 2018 16:37:10 -0800
From: Sai Hari Chandana Kalluri <chandana.kalluri@xilinx.com>
To: <openembedded-core@lists.openembedded.org>
Date: Tue, 4 Dec 2018 16:37:05 -0800
Message-ID: <1543970227-15416-2-git-send-email-chandana.kalluri@xilinx.com>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <1543970227-15416-1-git-send-email-chandana.kalluri@xilinx.com>
References: <1543970227-15416-1-git-send-email-chandana.kalluri@xilinx.com>
X-RCIS-Action: ALLOW
X-TM-AS-Product-Ver: IMSS-7.1.0.1224-8.2.0.1013-23620.005
X-TM-AS-User-Approved-Sender: Yes;Yes
X-EOPAttributedMessage: 0
X-MS-Office365-Filtering-HT: Tenant
X-Forefront-Antispam-Report: CIP:149.199.60.83; IPV:NLI; CTRY:US; EFV:NLI;
	SFV:NSPM;
	SFS:(10009020)(39860400002)(346002)(376002)(396003)(136003)(2980300002)(189003)(199004)(36756003)(426003)(76176011)(6916009)(5660300001)(51416003)(7696005)(8936002)(81156014)(36386004)(316002)(446003)(48376002)(356004)(50466002)(54906003)(107886003)(106002)(15650500001)(4326008)(6666004)(50226002)(8676002)(81166006)(63266004)(486006)(16586007)(186003)(476003)(77096007)(26005)(2351001)(126002)(9786002)(14444005)(11346002)(2906002)(106466001)(2616005)(47776003)(478600001)(305945005)(336012)(107986001);
	DIR:OUT; SFP:1101; SCL:1; SRVR:DM6PR02MB4330; H:xsj-pvapsmtpgw01;
	FPR:; SPF:Pass; LANG:en; PTR:unknown-60-83.xilinx.com; MX:1; A:1;
X-Microsoft-Exchange-Diagnostics: 1; SN1NAM02FT047;
	1:KfoKcKy+5AeV9ffryI7vnBuaZX5TIxREVHsTgqk8L3Q8YY3OcIRr392aeOT+e4PaMCJaaaSnMgC9fHlpZzoYqFZl4YTJNnIxxfloWv6/ilaAayo4PcG4tOVGDAIWluyM
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: f3b54cd0-facc-46c1-0285-08d65a4e5165
X-Microsoft-Antispam: BCL:0; PCL:0;
	RULEID:(2390098)(7020095)(4652040)(8989299)(4534185)(4627221)(201703031133081)(201702281549075)(8990200)(5600074)(711020)(4608076)(2017052603328)(7153060);
	SRVR:DM6PR02MB4330; 
X-Microsoft-Exchange-Diagnostics: 1; DM6PR02MB4330;
	3:q/zk2l9PbnC1YpZHV4RRh/S6Lt9dYhdT/PXjfTpRV51DNe3ECEeZ6rBeA/VifGAJr+JriZ+NyD49VF8X+QGQIovGpy0VzOFJIiKWkhQAAWMzv5GBKnRtcU3TGhyJ7ZR3ijNiNEv7c6sutn2qm850kv8HB0AV+lMOQoht610Cm1/IM+hlhpYvVYAj0K3CRdmLxwhTtrU0MWQoYnRplFBr4X23zew0PLG0FHhB4OpbwJYaFXBhKxzgvb9FL7Zeu7S/hsWrv8t/LbZxfC3cxO+Cy1PvocTvrRXXSSAFUEyKKIGJqzoiZyrB2lGFJIgT+YmEfgpnXaL17U5Xe8v4Byn5LtNmoc6KM2OVWQx6JbmGzP4=;
	25:O49VWh+HehxVvAb7FWTUI8jrRsb/nNRMqmkAbZ+oCZzd6Qq6NveQnGcSFXnO9CUbbDmKWGwEIe9i6tQ6YwK51ESqiCfLC7y7Z8KIkzac9Cm/NOJqtwqdkdd5zQJ3j9iRj+8It3RO7p/f3XSVwvii7rASSS2wJgOXsFMeEZQWMfyvhtUvK5yHmmVDf1usoJjczIyZrfNDgmHgoL2q1U5qYigOKDp2mBBVEb6LMtWEOrxGV19c9AxT+Xfeijjo+npMKkgYloANB0ugFiRuTvO9ftLjyGWxhKcNY31xDaZ7uur3XeygZQ+obp4VWEIA50MW5taHzrTVvGXstlYH+2h86A==
X-MS-TrafficTypeDiagnostic: DM6PR02MB4330:
X-Microsoft-Exchange-Diagnostics: 1; DM6PR02MB4330;
	31:pLEjHRC8irCxMfpZC10beiRnmYEnJNtpVC7a9YhgTn+GcY+c3pS8BkmbcY7g8UwAGrhFRTU+oNI5wtyD2FPg4lg5oZeXbJrN+n+8hOcx2LpusSUAND7htKjoXLzUafYeOAZzkG5pKFS2Ww93V4vtAFXr2BXuxhYnIBOOpjQ0itTtOmgELkJgAni1lhSfop05LeoOV8NcjD9m178bk3lyYw6y1eFWvKgDFzrjD4xD3+E=;
	20:xZ8MKaxRudCpi0+E7Vh4mMdVFYNeVNOFpGufTrh6ZAnRbNg7cj8EiqNBBvaC/N1TE5bIT1/LfUHSWnjSsVcP7e0CDVQ9Tdf4r2jHo2xxRepsMy36LoXcDMHEH6c1bqqNdWxUezGZeBWGGlGyeX0eERbbO/GlYWN093DKROUwh/+W+vsSEruvVFoUdbPnY6NQpMwxT4ktUSlyTAgU6D2eL3PO/TZP/3vhm9bMhG0OkjV5h2GhVHexvdinwdGKJz8AFEglf7WeMW16mofiO7BWAjPEbL2SZSqK8hBUGhCKVRq9b5JR/sIcHo+i7nA6JszaTHrBPKbpnB1MnzHTCIab5fBudody8/gpOm2IRz68MEy7lnzo0zi1WzhpmHID6UeX6Sou57Q8rHmAcrO3jZZPH2LYeSOqcFvapzpVYfyfsrncchz67bO9n+BvY+rSvitZoLzowe+T0T+ddVtegG1epTxoe26cBLdILiDYIRDNpdwBWMjLgmpLQw8xG4esgx+b
X-Auto-Response-Suppress: DR, RN, NRN, OOF, AutoReply
X-Microsoft-Antispam-PRVS: <DM6PR02MB43303F9D773AE60A810D0111B0A80@DM6PR02MB4330.namprd02.prod.outlook.com>
X-MS-Exchange-SenderADCheck: 1
X-Exchange-Antispam-Report-CFA-Test: BCL:0; PCL:0;
	RULEID:(8211001083)(6040522)(2401047)(8121501046)(5005006)(3002001)(93006095)(93004095)(10201501046)(3231455)(999002)(944501520)(52105112)(6055026)(148016)(149066)(150057)(6041310)(20161123560045)(201703131423095)(201702281528075)(20161123555045)(201703061421075)(201703061406153)(20161123564045)(20161123562045)(20161123558120)(201708071742011)(7699051)(76991095);
	SRVR:DM6PR02MB4330; BCL:0; PCL:0; RULEID:; SRVR:DM6PR02MB4330; 
X-Microsoft-Exchange-Diagnostics: 1; DM6PR02MB4330;
	4:qvwoCia0QFbtZ/3+8i4rymBr8VOggp6gs6/98i0J/+Gp6hrpKjO150fOe6DucJOUa2Ukj+JNffft4Zz7N3XKmME/fXx1Qd1DfbV243oqRLBCTzzRtlnQHX2qoxzwqy+wI4Ube0NaFoBA47y6hMRbQLSiLShh2g4H5VID16f2hq8ZcV9BjUbfxAGpjUkVsZC32cJnUdWNM3H6Cg8X3iIBsD31RFwd0RguHfbSgbhlnbeNtymwcmHTovgu18sIz37ntfBsKr1p8gSDwMU2eqwY9A==
X-Forefront-PRVS: 08770259B4
X-Microsoft-Exchange-Diagnostics: =?us-ascii?Q?1; DM6PR02MB4330;
	23:gbdqNljkxNZhfRyasfrZVv68zB4DlkMrx10YGv53g?=
	=?us-ascii?Q?iYwSRHeBX5vFvttk0481Cl3m1vmiLQ8YvMgCvD/GMz+Tfjh88FD7Qrrba2So?=
	=?us-ascii?Q?D9OHJltq51xt+fgJExRKOeZQwJfXeQyxuzsTGNqAep1vu+ICophwbjQ8f/Ng?=
	=?us-ascii?Q?W1m+Z/YwYBy00I61iZDXBWkNqC7fZcfmv8Q3Vy0tvdin0MCvRPYeOb7pf1zU?=
	=?us-ascii?Q?L5RH/OKYQBbXBqep1kLcdeCXbHT98P9nLpNWCvqEje7iouNVAW9AGedmuDKn?=
	=?us-ascii?Q?8AIOgAOv8ibUNWieTtq4LhHAZDiWHJvUjVnjLj5k8YO8xiB90CF0iv/lbCOL?=
	=?us-ascii?Q?69P3gETXXmsq4ZFwkATKPEQX/A8+Gr25F31vS4ypP9gpOaNEl9HfP8Fm+oMd?=
	=?us-ascii?Q?pC+/8FYxVpQXNDPBvTXWFilV5Nkyhh6TsIdnIjO1lZa8mMvM6v0FN6Z00g9a?=
	=?us-ascii?Q?LjYEJmFw196gxYseSUDa2o0otr/OAE8g1wWafhJycfyOspecWq7P0eiABj8f?=
	=?us-ascii?Q?SyBSwGrImz9JzE36L3Fm2BWl8DYtSwuwVkcGYcidH6wvZGZHBcVQmYvheuHa?=
	=?us-ascii?Q?XSf7TffdgkD48/B282SONVUS136OW1/dRFJe5LcxSqvCV6sSoqJLfBDh541c?=
	=?us-ascii?Q?Q83E/NkDH/MRgHzuzUq2/6XkSfDjN0/cQjD5fC/aTwcGxJAkNlubOepkEw5T?=
	=?us-ascii?Q?728q3N9xXn1d5l2EUf2jtODxy7agdoFY0aaLND1D2NIPiXS9SrLXlmFZnuMV?=
	=?us-ascii?Q?hNuUVw9geH+vJJmuvIEm3+QBB2zAu78BXIFhfqSkv1ME50TxbcyLZjJeKCII?=
	=?us-ascii?Q?DEab1/03HnEApxYEy0q4pOD88YQM+QpJEA6FckcVoNOnSdo9hpm9WNk5J9G3?=
	=?us-ascii?Q?IxVKt8h5yvsQgD+wekvxgoyGvv7wST+brWcT4wwlsNUfbTOW6QSO9vjgNWsJ?=
	=?us-ascii?Q?273AfycmJS7qTwmdgmZMMfvVu2cmslIXJ3cqtpiNMXS9Zb3Vr8/l/7/alzag?=
	=?us-ascii?Q?fin+TgKsQVixfq12lzUMpshicTEuUEhsnEzQWa8xk3HlIXDVoW/7jrF7NlhV?=
	=?us-ascii?Q?dumd9/6Zx158e9EiqctFxTyk9G8ZzcMx8Vx2QI8den1VhoXUDYlgIPjR1593?=
	=?us-ascii?Q?TD2kWI5GObXuNmT5MZ9Eqnm8RYPRaiO?=
X-Microsoft-Antispam-Message-Info: 04ugnU6EeK3KrSRYgnCtsBvrKU3if8sLk67lJ7r3xnRGQi7nbXPWUYMbc/6BK87EafjmOvbto16ABrmppdPcUECGBPT0HQ5RYCEkTQJ1XhthUqH/hD7HMhjLa2ZjGr7EL4EmV5ahgjn93xANddzYt5J+q9BbxRlAqyovhJU6WaTCyjt4PGxS+K2Jb8fr04J5vYpTnoc2K+aIpg6UcXIWsB88q6Ch1MOug5OPNLBhTPdKqzEmDl7lo8mFSvebR8vMewj8UhWzuuZqLZYHN2UYCf7jBXCwdpzxUyFwLK/te8GNvhLJ8wjPctilnQAbGL9jiqsC6tCfOZVGwZJnq1452XK9V0ko0DHuhFwqxRBdRWg=
X-Microsoft-Exchange-Diagnostics: 1; DM6PR02MB4330;
	6:qk2Jp03dTRJbNYHS2SvO1IZOIAKIseu7zkqH/L+d++IRJZlTd0paKymPRP3qrx8CBwGJCyz9sAW/3+qRzD/KKzcdE7h+ffQiGdtQhqRoCU72HrxUbaZM+XGghhoWm6ndxVLjbnGgSVGcdoTkBXB0RHGVHrLIh+YbQiDhEEhqIxUBHPa9zdlm7R1/hXASo+s+GYcPjPYjv4Fd9s9MwgS1vuYhEmFtELgA2FXGMG9/KEk7GDbHZ0MMFE+/tJ+oUT9HQo+X2Wr9ZDgsj5F9XC+hT5kpot18dYnh/2SENRhnwOZqi7DnI88CNhbUWSGO5XqpmDul6evsJWBlfePlL6+mI89rKfJKu6MFJR1cfGBsfDCuDj60lkMrVnHXA6uUu6d+zAm25NPXbI53bfLksEq8oiUWio379cFqk75G+/T/9Q2uUeiD7kUJGaXkeYHylhbkvJWNjmFVc/KWTAANxXOrww==;
	5:yMtx85XH8t0s/qfdHi8WudiFbOMz6zsFHB9cGbTmfNcZYVurgClSCaZt1+g6+jm2xCvrwGIon9g7lFgkIXhO52owvduqfF3vVObialq/478HG+cAzngGfJHCUP7Z6SOGjOpuWZf6bbyh5w0bG0cpCaymnfnNSRwmzt4vpv40EPg=;
	7:dvxz22x2Ajp1TH8kw9p/VJM8Kf6Wq21CyvaT/hmPsLNOA0mle2w0OgyRZHXY9gWb54CzmNPlY6roorrtyknnjQtamwmORogiQFy6XLHlNSx9BxMYNTUR8B+HG1qeVBiLbW1A2aOhKDealU7PiodMWA==
SpamDiagnosticOutput: 1:99
SpamDiagnosticMetadata: NSPM
X-OriginatorOrg: xilinx.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 05 Dec 2018 01:09:33.4027 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: f3b54cd0-facc-46c1-0285-08d65a4e5165
X-MS-Exchange-CrossTenant-Id: 657af505-d5df-48d0-8300-c31994686c5c
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=657af505-d5df-48d0-8300-c31994686c5c;
	Ip=[149.199.60.83]; Helo=[xsj-pvapsmtpgw01]
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM6PR02MB4330
Cc: Sai Hari Chandana Kalluri <chandana.kalluri@xilinx.com>
Subject: [PATCH 1/3] devtool modify: Update devtool modify to copy source from work-shared if its already downloaded.
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
X-List-Received-Date: Wed, 05 Dec 2018 05:39:54 -0000
Content-Type: text/plain

In the regular devtool modify flow, the kernel source is fetched by running
do_fetch task. This is an overhead in time and space.

This patch updates modify command to check if the kernel source is already
downloaded. If so, then instead of calling do_fetch, copy the source from
work-shared to devtool workspace by creating hard links to be more efficient.
Else run the usual devtool modify flow and call do_fetch task.

[YOCTO #10416]

Signed-off-by: Sai Hari Chandana Kalluri <chandana.kalluri@xilinx.com>
Signed-off-by: Alejandro Enedino Hernandez Samaniego <alejandr@xilinx.com>
---
 scripts/lib/devtool/standard.py | 124 ++++++++++++++++++++++++++++++++++++++--
 1 file changed, 120 insertions(+), 4 deletions(-)

diff --git a/scripts/lib/devtool/standard.py b/scripts/lib/devtool/standard.py
index d14b7a6..3a8222a 100644
--- a/scripts/lib/devtool/standard.py
+++ b/scripts/lib/devtool/standard.py
@@ -712,6 +712,53 @@ def _check_preserve(config, recipename):
                     tf.write(line)
     os.rename(newfile, origfile)
 
+# Function links a file from src location to dest location
+def copy_file(c,dest):
+    import errno
+    destdir = os.path.dirname(dest)
+    if os.path.islink(c):
+       linkto = os.readlink(c)
+       if os.path.lexists(dest):
+            if not os.path.islink(dest):
+                raise OSError(errno.EEXIST, "Link %s already exists as a file" % dest, dest)
+            if os.readlink(dest) == linkto:
+                return dest
+            raise OSError(errno.EEXIST, "Link %s already exists to a different location? (%s vs %s)" % (dest, os.readlink(dest), linkto), dest)
+       os.symlink(linkto, dest)
+    else:
+       try:
+           os.link(c, dest)
+       except OSError as err:
+           if err.errno == errno.EXDEV:
+                bb.utils.copyfile(c, dest)
+           else:
+                raise
+
+# Function creates folders in a given target location
+def copy_dirs(root,dirs,target):
+    for d in dirs:
+        destdir =  os.path.join(target,d)
+        if os.path.islink(os.path.join(root,d)):
+             linkto = os.readlink(os.path.join(root,d))
+             os.symlink(linkto,destdir) 
+        else:
+             bb.utils.mkdirhier(target+d)
+
+# Function to link src dir to dest dir
+def copy_src_to_ws(srcdir,srctree):
+    target = srctree
+    if os.path.exists(target):
+        raise DevtoolError('source already in your workspace')
+
+    bb.utils.mkdirhier(target)
+    for root,dirs,files in os.walk(srcdir):
+        #convert abspath to relpath for root
+        destdir = root.replace(srcdir,"")
+        target = srctree+destdir+"/"
+        copy_dirs(root,dirs,target)  
+        for f in files:
+           copy_file(os.path.join(root,f),os.path.join(target,f))
+
 def modify(args, config, basepath, workspace):
     """Entry point for the devtool 'modify' subcommand"""
     import bb
@@ -758,6 +805,73 @@ def modify(args, config, basepath, workspace):
         initial_rev = None
         commits = []
         check_commits = False
+
+        if bb.data.inherits_class('kernel-yocto', rd):
+               srcdir = rd.getVar('STAGING_KERNEL_DIR')
+               if os.path.exists(srcdir) and os.listdir(srcdir):
+                  copy_src_to_ws(srcdir,srctree)
+
+                  workdir = rd.getVar('WORKDIR')
+                  srcsubdir = rd.getVar('S')
+                  localfilesdir = os.path.join(srctree,'oe-local-files') 
+                  # Move local source files into separate subdir
+                  recipe_patches = [os.path.basename(patch) for patch in oe.recipeutils.get_recipe_patches(rd)]
+                  local_files = oe.recipeutils.get_recipe_local_files(rd)
+
+                  for key in local_files.copy():
+                        if key.endswith('scc'):
+                              sccfile = open(local_files[key], 'r')
+                              for l in sccfile:
+                                  line = l.split()
+                                  if line and line[0] in ('kconf', 'patch'):
+                                        local_files[line[-1]] = os.path.join(os.path.dirname(local_files[key]), line[-1])
+                                        shutil.copy2(os.path.join(os.path.dirname(local_files[key]), line[-1]), workdir)
+                              sccfile.close()
+
+                  # Ignore local files with subdir={BP}
+                  srcabspath = os.path.abspath(srcsubdir)
+                  local_files = [fname for fname in local_files if os.path.exists(os.path.join(workdir, fname)) and  (srcabspath == workdir or not  os.path.join(workdir, fname).startswith(srcabspath + os.sep))]
+                  if local_files:
+                       for fname in local_files:
+                              copy_src_to_ws(os.path.join(workdir, fname), os.path.join(srctree, 'oe-local-files', fname))
+                       with open(os.path.join(srctree, 'oe-local-files', '.gitignore'), 'w') as f:
+                              f.write('# Ignore local files, by default. Remove this file ''if you want to commit the directory to Git\n*\n')
+
+                  if os.path.abspath(rd.getVar('S')) == os.path.abspath(rd.getVar('WORKDIR')):
+                  # If recipe extracts to ${WORKDIR}, symlink the files into the srctree
+                  # (otherwise the recipe won't build as expected)
+                        local_files_dir = os.path.join(srctree, 'oe-local-files')
+                        addfiles = []
+                        for root, _, files in os.walk(local_files_dir):
+                            relpth = os.path.relpath(root, local_files_dir)
+                            if relpth != '.':
+                                  bb.utils.mkdirhier(os.path.join(srctree, relpth))
+                            for fn in files:
+                                if fn == '.gitignore':
+                                    continue
+                                destpth = os.path.join(srctree, relpth, fn)
+                                if os.path.exists(destpth):
+                                    os.unlink(destpth)
+                                os.symlink('oe-local-files/%s' % fn, destpth)
+                                addfiles.append(os.path.join(relpth, fn))
+                        if addfiles:
+                           bb.process.run('git add %s' % ' '.join(addfiles), cwd=srctree)
+                        useroptions = []
+                        oe.patch.GitApplyTree.gitCommandUserOptions(useroptions, d=d)
+                        bb.process.run('git %s commit -a -m "Committing local file symlinks\n\n%s"' % (' '.join(useroptions), oe.patch.GitApplyTree.ignore_commit_prefix), cwd=srctree)
+
+                  task = 'do_configure'
+                  res = tinfoil.build_targets(pn, task, handle_events=True)
+
+                  # Copy .config to workspace 
+                  kconfpath=rd.getVar('B')
+                  logger.info('Copying kernel config to workspace')
+                  shutil.copy2(os.path.join(kconfpath, '.config'),srctree)
+
+                  # Set this to true, we still need to get initial_rev
+                  # by parsing the git repo
+                  args.no_extract = True
+
         if not args.no_extract:
             initial_rev, _ = _extract_source(srctree, args.keep_temp, args.branch, False, config, basepath, workspace, args.fixed_setup, rd, tinfoil, no_overrides=args.no_overrides)
             if not initial_rev:
@@ -843,10 +957,12 @@ def modify(args, config, basepath, workspace):
                 f.write('\ndo_patch() {\n'
                         '    :\n'
                         '}\n')
-                f.write('\ndo_configure_append() {\n'
-                        '    cp ${B}/.config ${S}/.config.baseline\n'
-                        '    ln -sfT ${B}/.config ${S}/.config.new\n'
-                        '}\n')
+
+            if rd.getVarFlag('do_menuconfig','task'):
+                    f.write('\ndo_configure_append() {\n'
+                    '    cp ${B}/.config ${S}/.config.baseline\n'
+                    '    ln -sfT ${B}/.config ${S}/.config.new\n'
+                    '}\n')
             if initial_rev:
                 f.write('\n# initial_rev: %s\n' % initial_rev)
                 for commit in commits:
-- 
2.7.4


