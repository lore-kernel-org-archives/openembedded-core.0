Return-Path: <ckalluri@xilinx.com>
X-Greylist: delayed 695 seconds by postgrey-1.34 at layers.openembedded.org;
	Fri, 25 Jan 2019 22:36:43 UTC
Received: from NAM01-BN3-obe.outbound.protection.outlook.com
	(mail-eopbgr740040.outbound.protection.outlook.com [40.107.74.40])
	by mail.openembedded.org (Postfix) with ESMTP id 7311F7C3A9
	for <openembedded-core@lists.openembedded.org>;
	Fri, 25 Jan 2019 22:36:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=xilinx.onmicrosoft.com; s=selector1-xilinx-com;
	h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
	bh=QxVdt6r26axH9279Bg+0gtaf4OJeUhXwgEqwA2bPZmo=;
	b=t9gEWBQHJvTSDau5f9B10+SLOHPFr7SBQPY8y3vqtbu1xjn7dfNH0iAm8YdcA0Jintr6ibGTDPFVulBbZ6fZt4i7Y/PIhf4WASSc5jDwmEzfxPfOMtPyqE1o/ZA2D9vhqYF9QNJnr75DB9Nfj/xdece46m89MzxjcI4M3ef5uGU=
Received: from BN6PR02CA0089.namprd02.prod.outlook.com (2603:10b6:405:60::30)
	by BYAPR02MB4454.namprd02.prod.outlook.com (2603:10b6:a03:57::27)
	with Microsoft SMTP Server (version=TLS1_2,
	cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.1558.16;
	Fri, 25 Jan 2019 19:53:18 +0000
Received: from BL2NAM02FT016.eop-nam02.prod.protection.outlook.com
	(2a01:111:f400:7e46::205) by BN6PR02CA0089.outlook.office365.com
	(2603:10b6:405:60::30) with Microsoft SMTP Server (version=TLS1_2,
	cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.1558.16 via
	Frontend Transport; Fri, 25 Jan 2019 19:53:17 +0000
Authentication-Results: spf=pass (sender IP is 149.199.60.100)
	smtp.mailfrom=xilinx.com; lists.openembedded.org; dkim=none (message not
	signed) header.d=none; lists.openembedded.org;
	dmarc=bestguesspass action=none header.from=xilinx.com;
Received-SPF: Pass (protection.outlook.com: domain of xilinx.com designates
	149.199.60.100 as permitted sender) receiver=protection.outlook.com;
	client-ip=149.199.60.100; helo=xsj-pvapsmtpgw02;
Received: from xsj-pvapsmtpgw02 (149.199.60.100) by
	BL2NAM02FT016.mail.protection.outlook.com (10.152.77.171) with
	Microsoft SMTP Server (version=TLS1_0,
	cipher=TLS_RSA_WITH_AES_256_CBC_SHA) id 15.20.1580.10
	via Frontend Transport; Fri, 25 Jan 2019 19:53:16 +0000
Received: from unknown-38-66.xilinx.com ([149.199.38.66]:46494
	helo=xsj-pvapsmtp01) by xsj-pvapsmtpgw02 with esmtp (Exim 4.63)
	(envelope-from <chandana.kalluri@xilinx.com>) id 1gn7XQ-000068-Bp
	for openembedded-core@lists.openembedded.org;
	Fri, 25 Jan 2019 11:53:16 -0800
Received: from [127.0.0.1] (helo=localhost)
	by xsj-pvapsmtp01 with smtp (Exim 4.63)
	(envelope-from <chandana.kalluri@xilinx.com>) id 1gn7XL-0006ct-7l
	for openembedded-core@lists.openembedded.org;
	Fri, 25 Jan 2019 11:53:11 -0800
Received: from xsj-pvapsmtp01 (xsj-mail.xilinx.com [149.199.38.66])
	by xsj-smtp-dlp2.xlnx.xilinx.com (8.13.8/8.13.1) with ESMTP id
	x0PJr4g5005324; Fri, 25 Jan 2019 11:53:04 -0800
Received: from [172.19.2.12] (helo=xsjckalluri50.xilinx.com)
	by xsj-pvapsmtp01 with esmtp (Exim 4.63)
	(envelope-from <chandana.kalluri@xilinx.com>)
	id 1gn7XE-0006bl-L0; Fri, 25 Jan 2019 11:53:04 -0800
From: Sai Hari Chandana Kalluri <chandana.kalluri@xilinx.com>
To: <openembedded-core@lists.openembedded.org>
Date: Fri, 25 Jan 2019 11:53:00 -0800
Message-ID: <1548445982-25182-2-git-send-email-chandana.kalluri@xilinx.com>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <1548445982-25182-1-git-send-email-chandana.kalluri@xilinx.com>
References: <1548445982-25182-1-git-send-email-chandana.kalluri@xilinx.com>
X-RCIS-Action: ALLOW
X-TM-AS-Product-Ver: IMSS-7.1.0.1224-8.2.0.1013-23620.005
X-TM-AS-User-Approved-Sender: Yes;Yes
X-EOPAttributedMessage: 0
X-MS-Office365-Filtering-HT: Tenant
X-Forefront-Antispam-Report: CIP:149.199.60.100; IPV:NLI; CTRY:US; EFV:NLI;
	SFV:NSPM;
	SFS:(10009020)(39850400004)(346002)(136003)(376002)(396003)(2980300002)(189003)(199004)(54534003)(336012)(36756003)(81166006)(356004)(6666004)(15650500001)(6916009)(7696005)(8676002)(81156014)(426003)(51416003)(8936002)(106002)(16586007)(478600001)(50466002)(54906003)(476003)(50226002)(446003)(47776003)(126002)(2616005)(4326008)(11346002)(48376002)(76176011)(305945005)(9786002)(107886003)(77096007)(63266004)(106466001)(26005)(36386004)(2351001)(316002)(186003)(486006)(2906002)(14444005)(107986001)(5001870100001);
	DIR:OUT; SFP:1101; SCL:1; SRVR:BYAPR02MB4454; H:xsj-pvapsmtpgw02;
	FPR:; SPF:Pass; LANG:en;
	PTR:unknown-60-100.xilinx.com,xapps1.xilinx.com; MX:1; A:1; 
X-Microsoft-Exchange-Diagnostics: 1; BL2NAM02FT016;
	1:4Kf8/TIdcp1bFNxtoi+M0P98NOCtryKYQVTe6AKkG6+eohhVRXxs3By+MkY71BBbvsmb2wC6c350G7MTiQE8xoBXqRoIN1FaKTfXb0c1J68Y0cQEKSZlht+rW1nTjDx33PnPX29ZrENPE4CH7mXBtA==
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: ea03bfe9-2302-4323-8ecd-08d682febfe1
X-Microsoft-Antispam: BCL:0; PCL:0;
	RULEID:(2390118)(7020095)(4652040)(8989299)(4534185)(4627221)(201703031133081)(201702281549075)(8990200)(5600110)(711020)(4605077)(4608076)(4709027)(2017052603328)(7153060);
	SRVR:BYAPR02MB4454; 
X-Microsoft-Exchange-Diagnostics: 1; BYAPR02MB4454;
	3:f4mdtfRLMcCpjJlQO78BdAI7QILOe+F84w8DQwO5zWE9za05ZVpz4A6UZRG/wFhi/RFa8PzG7tJE0t0rUWvopnco88FCgeqaVFwLSxB7LwK0EMz2Bj2jxTcaZamzv6pKI/7sFmG94/2e3znL0j1GblBJyh5McOvTfhqfoZemCBzxQw7xfb8L4i2ByOgLXuXBMzXjHkzPoNLFhKQOCVF5+CjzVAYZXL6aISSpGpC3uw295phHnB4LFm7AP8Y/hc7vdQXMdWKROHsUtcbE4zwfkytmyTLH1p/uGp5stVIvurnjjerAwYCzlHUo6MK/ZGW5k/N2S/R0a19zN6RRXL13RjuI7MRulsAlLSgIuw8veEk3a0tnUmIkN49siCIHafgZ;
	25:Cl6oEd3Yv10+DJSpamXQyEHvVamtpd8K+jaVxvczHth4cfMH6tS3eF+UQ8shu4MDQt37zwsd6LZTK21wv0jlXPI4FJXtjQKt8jLLPPbkUu4HPDrO4x3bcmErGAvSIPBHktkB6O3SqKKnFkIatAsyWGzvSaPAcKA1vwvyqvOYdg09tAHtwppCVPE3Nz7ymsy8uNy373IROJCJBiHccv1qMNbgOPpuVrh8PRn7qxoxCliu0l8bia56Sgf/OMqWT9jI6thIi0rms37V3W3bFo2fRauxqmQBwELfgzrgYvqoGpRBzDM9Hl9NYgx4+kWY6Yhs6cMg+CSet4bEm/EIXa+/uw==
X-MS-TrafficTypeDiagnostic: BYAPR02MB4454:|BYAPR02MB4454:
X-Microsoft-Exchange-Diagnostics: 1; BYAPR02MB4454;
	31:ByGR3Lje6rmQnp36IWL7JwZ0aF8seaZb26y96FY2VHMRSjYmn6iuHE2mKMOpzJO/e2baZ+/H7ljTPC+pzRFeKbOMn5uRsd01S6ixzkMO/ptCE14QhFYJewCT0qbyucta1o5a2HJOkrrgOWBWlfh8l+6DugH/dsvXGmA57fYNE3Osv79hqdaWPEQ4n1ECaD2Vow+x9B3PHcm0o0fvUt55RxBJao56GnIAqjjFr1Zoorc=;
	20:1SlsuFlbvLw4tJAx8mFFn4iPNO/aUQJQYIT4nZLcXHArmDPpdnt7ZfHTufRg7wbw6+4O7Dw2yTDhKSxdUsDLzL0qoCt0ZV/8HICcZ5h9FLM20BZllyuYBjLLVNJzvCJ5W5x6xUnIgRFWKDTpGvyBDqCWh+38No+jgovHSNLlNJeGBw9CJMH196y7ntdbcqh6UcgE+Pd7kUVS4adHrieX5r5uk80ydCRs4BGIaIIbVuCFroPzFVWr3ehqCE8w105gCIS4RvrzecxArO7pOnz8OGdL2bNSEni+yOPa82kiWyZLquJZINLHxsUnEf6GKLpyNxwh7QBL6WMAJ8YsgjHX8rxraePdEeRZJTvVCTZ+al3A4MYIqLRrmebzkf2JnG/tqsMxgjRc03emrLdP6BG80CwjlA9V+uJrWybDm1m62+VNyUJJ8L/mbYcBhFdBMBCINoovVcY2qOxKhw3+5ImWtQY1svS7U6sDCD87PJPnOhKaIWeSOhXY9V43jCTu+w2W
X-Auto-Response-Suppress: DR, RN, NRN, OOF, AutoReply
X-Microsoft-Antispam-PRVS: <BYAPR02MB445450887B9010B7284F49D2B09B0@BYAPR02MB4454.namprd02.prod.outlook.com>
X-Microsoft-Exchange-Diagnostics: 1; BYAPR02MB4454;
	4:pbyFbaQgRf0jKn51RafYVKwAZYltPjLJQkBUb+BYjM8f4rDaIu25Jp4tqh2r6pjM4dcEkkU9WVepCDxABIS5gi4ZMYdDt4Nllxn370UEYpkURlRVZaweJPYIkazzlvn58z9h7/pPVv7bD1D+QUP2z3/jXVspKNSJsnrXUiVRCVu6S2NoN2YavnaJ2qhQR1Wdp1rBLBkj4FbIdgDe/ariCQPkFctqCEhChRZPdMOr5z9m6Syd5Nfq4neIEHW/TIwst6s4HVApQrHNE+IZp0swjNpHx2yXiZcJv8LSjI8yeWxBD328i/VU8F+Xpi7ZEPzX
X-Forefront-PRVS: 0928072091
X-Microsoft-Exchange-Diagnostics: =?us-ascii?Q?1; BYAPR02MB4454;
	23:yX7Fh2xxfeaZGG5wa7FH9BH52EyppkMFVNi/SCUoS?=
	=?us-ascii?Q?kRfU+Ahrxjfy7sl19vFtxNkE3mgT44gpuSs9EvBIU5qirJAE1P31CIySWBiI?=
	=?us-ascii?Q?o/pDk8ocvU/9tYewNTcmfANB/xM2xOFX8YysxCsOC1CQSwkBXlL3d98MaDhr?=
	=?us-ascii?Q?vzpYIoLF0WKdhovI2nX40FrTLb5kcv9d+sFOcFnBtgK/hk2xfUO21x1o/OD8?=
	=?us-ascii?Q?QFIEYIKFeIXOURW68Lnd2cSXNxa1QizVRxYeH6FHkXXI8U2+WdIQkq+pGsHg?=
	=?us-ascii?Q?7swtIujaBKIocUs9IHMCyCwrPR0DevzTdT7zeBH22zN04wHABmea4H4C+sPB?=
	=?us-ascii?Q?WQF6Sh5v1UpIGhXNOc49aQEJdOeRVOVtKgFrEmJJiv5JtSPbkVUjiE4X5Vpx?=
	=?us-ascii?Q?S6ZR0bz6l0Wg2Omz4VGRgZVYBrsWyZWP7i9HpwXxNS3Psh6ZqfyeaC4LZBLK?=
	=?us-ascii?Q?GttHAlYMgRyuWnzsrtnjQs6o1FJ6rnHCUCh2nqJrkELH7YExSymUrtruN4OX?=
	=?us-ascii?Q?Tc4Wt9KpxR1kPVTawH3NpMKm1eYoUBsSvr+2ctOLxactbUT6SnDa3eV2PUYL?=
	=?us-ascii?Q?kTMxxAbAnu4YSwZK612bi7JUzeLV6+OLPEjZT7eFZBDBbvdGufY3xukZK87Q?=
	=?us-ascii?Q?v9+zRkkoHEL4MwFhdRiwLXlIStqYXM1H8+Lcu/85KE4UQ+PzVGl49DeZHLeM?=
	=?us-ascii?Q?prPOtp1hQzoagpjxcvquJ10n1iI4LKpGAS4MnSNR89K4jkXiBGLUr2SYVoda?=
	=?us-ascii?Q?Bjrlcjnt9utH1qLf6AUEuE82NgBQgM4WLnSz4YoYAiLDP9kfvWAc3AHaBEjV?=
	=?us-ascii?Q?Blfz5zLTXAP8teqDBVtW8KKLmgrLukEsS47Uw+wCgnU49Bn8004qgSBnxTKT?=
	=?us-ascii?Q?S+m+tQ7CEWBxuXljoZ27pQgiChphn1cCl18BxCieepIAM7Q158QsdDpybe3V?=
	=?us-ascii?Q?y1nDrXBHbhTiVlmoojXhgQpEPcNMdJjCY/uT2w1GvE4MGD6uZqWxSpYDdvmo?=
	=?us-ascii?Q?cAhOjSfTbvrSm3F9ntmJ6FAkM8VbDW7W9QZC4hmRNjGCh7XKZDyRgPnV4kOI?=
	=?us-ascii?Q?IuZ0GJpzNdMY/equFbbIxTvnszVh6eJqbV4joZ9Htor3c3693Qy95+NILSO2?=
	=?us-ascii?Q?n02bZvkGfrS1Yl2+Kz+jFcCaS2ADw2mbWBDAs3gj11L7GQ2W94CABetoTsAu?=
	=?us-ascii?Q?KIiRLNy3HP2WC0=3D?=
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam-Message-Info: Pul2CSUPuU6txxg0TK+KrC6A+Z70hsTmI5JJvkSAv4AwDodAPWhamPhrQybEE4/hj0HaETEMO+tzcO/ZGn0MquUxeKXa2MZdbS3BLTdYfZurbIacOVnkhzrmXIz6x2D1+Qu9Imp81rAjopUBGpxbspgsmlqPR8eKnRbMOhoOH5nh6iM/5m3q9jZJQPvARMELCb7QBngWmeR/7SxdedmB9J5lY+nf1TDWeGqlpxibVhRlk7JV5aZ9TmyW27cw3skuMLbVw9lkKDFnJFPH+1sHcfP2FB24Qon646yxGpvLnpvnOaCG2Dv7BtWNHJXOLr5WfMC/nTQ2QIxeVkUKaf3bx3AYddXMS58wUgrsAoQo/Tn0/tTtEriaquYEEjOhzUqRORsOStZPPLWuriDNxrIixSrdBbRW6Tc/hWf4Hlj0qvs=
X-Microsoft-Exchange-Diagnostics: 1; BYAPR02MB4454;
	6:UPIAdVp2erjcMIcDHCfIiGmFJLsDUCdiylJpDEr3TyBujk2CX6rYw96s1Pqy73ctDStxKIiEArgK46dcKFUDmEOYETCFbQdNCsv+V+O9X1z4kD/oQSMHNjjNlAxtNCEgaaTyGtsDbEto6pjtlrSIxO5pCMCYPadjsyEHzKQ2cfd4si1bVSM2E8knIXeKQesfSg8J7ftk2kMpP4eM740gEVudS6JPrDy+AAu5yDShm9Hlx7bpg/vDAogfbzaPlg2NLwTLx85yH6aMmnEQBE+s8S656S1+EZjsvXEbjiSuKrd6j+KVFoAQnd9F1MrZPOZFgtdmb3RP+oMOTK+u+0MRhr++v6F8drNcMjZIHD5DaQse4JYQAIM9FtO1oh186gdjnezsKcqoJwOi3Lpn2hSE0EVrsrp0Eg0hvinuhTC5CJs+08DidG66X0En2PFGHXduRqGQON8P8Yc4rnJq8wLhdg==;
	5:H7Fljd7kMR89my6tJLMQljQmISL7n5mJLwJr6SQkk7NYIeJPgCRu+cDv+N7MVzm7LezCmYqFjanOc4rA7P82tJ8gb9Lxoi6xZF6nucuYDqTRflU2RYmDx++WNbQw5B+bihN3xjAJo5UqFm0A0atXcWj0+fuhCMk5mN1HfRJKWig/b3V6hWJNiETzya7UxwYlpPiqIfqdgtOydFlRJPn39g==;
	7:9cyqmR9ZgaIApvmn1nnHOJvXY2Ouo7QMR+BeMhcXcYoCwBbTMvIkcIX1Yl8L7daKpvHGpviJx32TJkVzLu764esupUNnAlUAXWy+QP4MUw/y6g/a4Pb2B7ulOh+xg2GdEmbLHL7GONl5LeLOpmL30A==
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 25 Jan 2019 19:53:16.8945 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: ea03bfe9-2302-4323-8ecd-08d682febfe1
X-MS-Exchange-CrossTenant-Id: 657af505-d5df-48d0-8300-c31994686c5c
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=657af505-d5df-48d0-8300-c31994686c5c;
	Ip=[149.199.60.100]; Helo=[xsj-pvapsmtpgw02]
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BYAPR02MB4454
X-Microsoft-Exchange-Diagnostics: 1; BYAPR02MB4454;
	23:H7t4r4tekAwDugv+LGbG5AtWZPhdsJStGwcosN6kHMbSn7CpXAVjVJij42xaM2M3ncdnE2UcGuZMNHSpHKgKJRsRGH3XaPJ+QoYtaiio8V4X3f030FN6xFX+EICo/vEUYXsfdkFJuXiTwKEc0emjdQ==
X-OriginatorOrg: xilinx.com
Cc: Sai Hari Chandana Kalluri <chandana.kalluri@xilinx.com>
Subject: [PATCH v2 1/3] devtool modify: Update devtool modify to copy source from work-shared if its already downloaded.
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
X-List-Received-Date: Fri, 25 Jan 2019 22:36:43 -0000
Content-Type: text/plain

In the regular devtool modify flow, the kernel source is fetched by running
do_fetch task. This is an overhead in time and space.

This patch updates modify command to check if the kernel source is already
downloaded. If so, then instead of calling do_fetch, copy the source
from work-shared to devtool workspace by creating hard links. Else run
the usual devtool modify flow and call do_fetch task.

[YOCTO #10416]

Signed-off-by: Sai Hari Chandana Kalluri <chandana.kalluri@xilinx.com>
Signed-off-by: Alejandro Enedino Hernandez Samaniego <alejandr@xilinx.com>
---
changelog v2: 
1. Add a check to verify the set kernel version by user and kernel version
present in work-shared before creating hard links. This is to ensure that right
kernel version is present in workspace.
---
 scripts/lib/devtool/standard.py | 148 ++++++++++++++++++++++++++++++++++++++--
 1 file changed, 144 insertions(+), 4 deletions(-)

diff --git a/scripts/lib/devtool/standard.py b/scripts/lib/devtool/standard.py
index b7d4d47..ba1afa4 100644
--- a/scripts/lib/devtool/standard.py
+++ b/scripts/lib/devtool/standard.py
@@ -717,6 +717,72 @@ def _check_preserve(config, recipename):
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
+def get_staging_kver(srcdir):
+     #Kernel version from work-shared
+     kerver = []
+     staging_kerVer=""
+     if os.path.exists(srcdir) and os.listdir(srcdir):
+            with open(os.path.join(srcdir,"Makefile")) as f:
+                 version = [next(f) for x in range(5)][1:4]
+                 for word in version:
+                       kerver.append(word.split('= ')[1].split('\n')[0])
+                 staging_kerVer = ".".join(kerver)
+     return staging_kerVer
+
+def get_staging_kbranch(srcdir):
+      staging_kbranch = ""
+      if os.path.exists(srcdir) and os.listdir(srcdir):
+          (branch, _) = bb.process.run('git branch | grep \* | cut -d \' \' -f2', cwd=srcdir)
+          staging_kbranch = "".join(branch.split('\n')[0])
+      return staging_kbranch
+
 def modify(args, config, basepath, workspace):
     """Entry point for the devtool 'modify' subcommand"""
     import bb
@@ -763,6 +829,78 @@ def modify(args, config, basepath, workspace):
         initial_rev = None
         commits = []
         check_commits = False
+
+        if bb.data.inherits_class('kernel-yocto', rd):
+               #Current set kernel version
+               kernelVersion = rd.getVar('LINUX_VERSION')
+               srcdir = rd.getVar('STAGING_KERNEL_DIR')
+               kbranch = rd.getVar('KBRANCH')
+
+               staging_kerVer = get_staging_kver(srcdir)
+               staging_kbranch = get_staging_kbranch(srcdir)
+               if (os.path.exists(srcdir) and os.listdir(srcdir)) and (kernelVersion in staging_kerVer and staging_kbranch == kbranch):
+                  copy_src_to_ws(srcdir,srctree)
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
@@ -852,10 +990,12 @@ def modify(args, config, basepath, workspace):
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


