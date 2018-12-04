Return-Path: <ckalluri@xilinx.com>
X-Greylist: delayed 32402 seconds by postgrey-1.34 at layers.openembedded.org;
	Wed, 05 Dec 2018 15:59:56 UTC
Received: from NAM02-BL2-obe.outbound.protection.outlook.com
	(mail-eopbgr750045.outbound.protection.outlook.com [40.107.75.45])
	by mail.openembedded.org (Postfix) with ESMTP id E68CC6D242
	for <openembedded-core@lists.openembedded.org>;
	Wed,  5 Dec 2018 15:59:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=xilinx.onmicrosoft.com; s=selector1-xilinx-com;
	h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
	bh=JmF1/EXAKwb34edXesETqVD4UkQL9ldzjEJd32dFAlI=;
	b=Kg5oV+/W1sbrnTKJMGb4XMh55gKupYf9C/rSwZE0e0ImGKXStLeH0LNPgUyDgJVXwCFggrlw3Vf5N8fjb+sb3l+npms7159F+d8CTyPrlpKjH86TVvVV62KrOPYiW5XVPoYzbONQpn5LqDekpgxu+Sz+pON0qWd2VqLqLZp3Tz8=
Received: from DM6PR02CA0019.namprd02.prod.outlook.com (2603:10b6:5:1c::32) by
	BL0PR02MB4449.namprd02.prod.outlook.com (2603:10b6:208:45::26) with
	Microsoft SMTP Server (version=TLS1_2,
	cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
	15.20.1382.22; Tue, 4 Dec 2018 19:55:09 +0000
Received: from CY1NAM02FT048.eop-nam02.prod.protection.outlook.com
	(2a01:111:f400:7e45::201) by DM6PR02CA0019.outlook.office365.com
	(2603:10b6:5:1c::32) with Microsoft SMTP Server (version=TLS1_2,
	cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.1382.22 via
	Frontend Transport; Tue, 4 Dec 2018 19:55:09 +0000
Authentication-Results: spf=pass (sender IP is 149.199.60.83)
	smtp.mailfrom=xilinx.com; lists.openembedded.org; dkim=none (message not
	signed) header.d=none; lists.openembedded.org;
	dmarc=bestguesspass action=none header.from=xilinx.com;
Received-SPF: Pass (protection.outlook.com: domain of xilinx.com designates
	149.199.60.83 as permitted sender) receiver=protection.outlook.com;
	client-ip=149.199.60.83; helo=xsj-pvapsmtpgw01;
Received: from xsj-pvapsmtpgw01 (149.199.60.83) by
	CY1NAM02FT048.mail.protection.outlook.com (10.152.74.227) with
	Microsoft SMTP Server (version=TLS1_0,
	cipher=TLS_RSA_WITH_AES_256_CBC_SHA) id 15.20.1382.18
	via Frontend Transport; Tue, 4 Dec 2018 19:55:08 +0000
Received: from unknown-38-66.xilinx.com ([149.199.38.66] helo=xsj-pvapsmtp01)
	by xsj-pvapsmtpgw01 with esmtp (Exim 4.63)
	(envelope-from <chandana.kalluri@xilinx.com>) id 1gUGmh-0004e0-EM
	for openembedded-core@lists.openembedded.org;
	Tue, 04 Dec 2018 11:55:07 -0800
Received: from [127.0.0.1] (helo=localhost)
	by xsj-pvapsmtp01 with smtp (Exim 4.63)
	(envelope-from <chandana.kalluri@xilinx.com>) id 1gUGmc-0003aA-A0
	for openembedded-core@lists.openembedded.org;
	Tue, 04 Dec 2018 11:55:02 -0800
Received: from [172.19.2.12] (helo=xsjckalluri50.xilinx.com)
	by xsj-pvapsmtp01 with esmtp (Exim 4.63)
	(envelope-from <chandana.kalluri@xilinx.com>)
	id 1gUGmP-0003Ue-Dd; Tue, 04 Dec 2018 11:54:49 -0800
From: Sai Hari Chandana Kalluri <chandana.kalluri@xilinx.com>
To: <openembedded-core@lists.openembedded.org>
Date: Tue, 4 Dec 2018 11:54:40 -0800
Message-ID: <1543953282-1856-2-git-send-email-chandana.kalluri@xilinx.com>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <1543953282-1856-1-git-send-email-chandana.kalluri@xilinx.com>
References: <1543953282-1856-1-git-send-email-chandana.kalluri@xilinx.com>
X-TM-AS-Product-Ver: IMSS-7.1.0.1224-8.2.0.1013-23620.005
X-TM-AS-User-Approved-Sender: Yes;Yes
X-EOPAttributedMessage: 0
X-MS-Office365-Filtering-HT: Tenant
X-Forefront-Antispam-Report: CIP:149.199.60.83; IPV:NLI; CTRY:US; EFV:NLI;
	SFV:NSPM;
	SFS:(10009020)(376002)(346002)(136003)(39860400002)(396003)(2980300002)(199004)(189003)(126002)(486006)(2616005)(107886003)(4326008)(63266004)(446003)(186003)(14444005)(476003)(2351001)(5660300001)(106466001)(2906002)(11346002)(9786002)(26005)(8676002)(336012)(426003)(305945005)(50226002)(478600001)(8936002)(6666004)(15650500001)(36386004)(76176011)(81156014)(81166006)(77096007)(47776003)(356004)(54906003)(106002)(16586007)(316002)(36756003)(50466002)(48376002)(6916009)(7696005)(51416003)(107986001);
	DIR:OUT; SFP:1101; SCL:1; SRVR:BL0PR02MB4449; H:xsj-pvapsmtpgw01;
	FPR:; SPF:Pass; LANG:en; PTR:unknown-60-83.xilinx.com; A:1; MX:1;
X-Microsoft-Exchange-Diagnostics: 1; CY1NAM02FT048;
	1:h0MN08j4AgVaWxhbJd2bCZ+R6P0QzFg1mk5zkaaR0DHincYiRHYBzqZcmUhtiZ9wIIyv0HSCNp6ndN8giWHtZS7FGq2sbVCAAmtMKAGkb0iw7fIP66Cxegs7EXsXqSpK
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 485bd593-97d9-4843-cb86-08d65a2264dc
X-Microsoft-Antispam: BCL:0; PCL:0;
	RULEID:(2390098)(7020095)(4652040)(8989299)(4534185)(4627221)(201703031133081)(201702281549075)(8990200)(5600074)(711020)(4608076)(2017052603328)(7153060);
	SRVR:BL0PR02MB4449; 
X-Microsoft-Exchange-Diagnostics: 1; BL0PR02MB4449;
	3:Fnlu99tq4r0YQ3FZP0kpXBLpnEvZ3Vmv4gZrVmQRsOr8tpDO6K7+BZwZ1qwWZOJxBnT4veDI4DVwal5pHiv8YvtsNIg8oy7K/ul1R44hhyuHUkpH+5Tfuu43bkY1tBgxo3A7AtgLhpeSjGnQ7BTUO9OTNjMAcxP/6qcjGTu9/Z6aYIvri0m0mAqyZ2NTifZQZ0teNpc0WzODA/ONokzGVELG9yEkjz+dWIgnX886q4OTwatLSWSY/9k36VbverSrj6nUTrPIncssSW5KIBoJ1S45W26pMAH6OUsur98TZTVhOZwJWUSJ0g8XtItW7NhXR2ZOeunlwS9yVnQupzWM1PYe8bFCtvtYW+TI2Eu85qc=;
	25:w3Wk6PtGbJvyfanNAZGoGO95uzm0/9asc4nNNJQn5t6cnvotaq8KddL30G6yoGITJjdVIKZ3KcZ4IHUvyPRtZr6W1x1qXAyFiOExJLWOt/FWtJd7rjk3MPL6Ulmwb19GtoA9uIJVjQPyJAGDhg7M/NKnQUfduIyAUZCyM+2fiSJ1WGvFHuYyLvy1LpMrve/GxnQk0GBaoS8GLDTEoE3XjecpDsJwUr8NVOyl5qeK2DFjGUyQYGZ8+yHxoJx+qRWyVXIA/3aEoOMNxlFhMW0Ll0lQDnCtagRUqWgkQODY1izk2m3n7sljfzVIvsed5K0bLbNsXBOP386Q91fr3gD/Cg==
X-MS-TrafficTypeDiagnostic: BL0PR02MB4449:|BL0PR02MB4449:
X-Microsoft-Exchange-Diagnostics: 1; BL0PR02MB4449;
	31:Drvwm997JXfs+5A6t6Xhh//PzVS/qhSM/uGwBASiChwzHG76Eki3xn1VUPw4btaEfVXFKoIZtLWetsoIL1vwMq9/H/JACd/UhdG0cLNCjBG1qg0IQZVcusVlSBjUTIozSU4zByoL2la++xEiFSS42Mnry6cJfgQFYJIthuPTMiIf31SRIKNWZOd4FvVHch+n5a+a7fcxYqpUsj0VCaDxXQuGNdJgkRih9rKDWACnELQ=;
	20:21DPFeIzRGiaU9RE8SHUgDat29xVnXSI/csEx48JjrDro1s0Z5Df9DtrqxbtuInc5Zjx9Two8kcU/lWXY5OBdMYvZ3D2QGPmcFnNSFSOybzowCC76tMcqfTMIFIwjUc5pwUI43YD9voBR8s2Nbzw3vaOFhfyr0HmLAW0pygPyEZQBRYMSCjLpDtTn/hNxDWYGWVTK7cNnP1ey08F9gJWGys4s0rA10AA/UOE4RWYWAgBI8BgnESoOdwigfqycuoXnk/bA3Cyx3Wzto97yL9w02EPzaes9ncRmcCsQOH39ftmBvJlO6ML9XRdTGf8nW2sdN9dwjACNSPUhl2e2hHgV57koBf0k3M7F277T8Ts2lrK67pEcluzUYVcfuM0ECPoQTf7JmKZupC7Kd3DyUFajdttdyrFzZbX9yZi3Vn6tFeBGWCZ51si7Srt2d+GAQh1uIkc4bU999a8fuJI2FEs4DqRC8LR0No9kw59eUCsfxQy4brceRZGec5tHR6fDqY4
X-Auto-Response-Suppress: DR, RN, NRN, OOF, AutoReply
X-Microsoft-Antispam-PRVS: <BL0PR02MB444970B1200930D045B57787B0AF0@BL0PR02MB4449.namprd02.prod.outlook.com>
X-MS-Exchange-SenderADCheck: 1
X-Exchange-Antispam-Report-CFA-Test: BCL:0; PCL:0;
	RULEID:(8211001083)(6040522)(2401047)(8121501046)(5005006)(93006095)(93004095)(3231455)(999002)(944501493)(52105112)(3002001)(10201501046)(6055026)(148016)(149066)(150057)(6041310)(20161123562045)(201703131423095)(201702281528075)(20161123555045)(201703061421075)(201703061406153)(20161123564045)(20161123560045)(20161123558120)(201708071742011)(7699051)(76991095);
	SRVR:BL0PR02MB4449; BCL:0; PCL:0; RULEID:; SRVR:BL0PR02MB4449; 
X-Microsoft-Exchange-Diagnostics: 1; BL0PR02MB4449;
	4:jbA6DvRjs5rsQgKCLSCqcZqKjHFEnswIbvyty28UNqFz53gfIojgZCbx88shLEe65QMWESgmxDnNk+UimePgmKS6WT6Climuwv4tDA9UUjksUPPgY6DFoxsXvnWkGiZucHp8mSMNCwK67JIu4wEfTBAR2j4GBmzXGVdjALr2EOWrxNvTSrDEnoDBT94zUD9yaxPrXbknYrM+NtnAx+rDW/39Po9vZLBQa1tQQ8D7ULE7nmoJlHAwY6m/I5lwGESTtIMjiXuMX8LG+bfPo9DrQA==
X-Forefront-PRVS: 0876988AF0
X-Microsoft-Exchange-Diagnostics: =?us-ascii?Q?1; BL0PR02MB4449;
	23:x7f/BfJ9mZGT4qmBGW4m4J5k84AeBQB/jAkSaTyGq?=
	=?us-ascii?Q?6ZJUj7QVbWprefAcuDlmWRX+sAYd7YD6jPXJrx5X6BTMXMdJl3fCNbgWxEOS?=
	=?us-ascii?Q?qtkZNOfKMj8vzEWTdAY/h8O37J1q4sgay95+GKglVEANqe0HvkSrk1HO+yhd?=
	=?us-ascii?Q?Ki2wKHhMoDxQkKaV1hQ4bzN5HE+KeKHsRvNgUKxKuuo4E13mjkVF8wL2QpAr?=
	=?us-ascii?Q?yGFu6jN1octm7v44ml906seS8pflmH3At5H2o9pkZum7C5HiS1cwoT7lPLaG?=
	=?us-ascii?Q?M/U0xQZ928Z2gdmBLdizfj8thihHJyVQ8p5qRCApNVHQY25TEn6CZM5Qwwue?=
	=?us-ascii?Q?ib4S/VsNa6Zd5IIFEtFsqisa2SOhrx3Aj5AQ0o3L0ZkWhGu0uK6igbwbQIH4?=
	=?us-ascii?Q?VYdcNnUs3v4OhWLf9IWW9pDyDnZW8xj1MY5AswEoM9DfM3MvTXe5ahJI0Q4e?=
	=?us-ascii?Q?TwGB7j9XkF0Jh4Yxlg0WxFL7j0aR+z4KBLhQCil3CKdO1sgxyBQ3LTGHhrKP?=
	=?us-ascii?Q?+PCH8GpdofE53lwqeL6iZ/sCqHhxI2+REE0BPJmccm+XmuPt1EbYhOkaAxjg?=
	=?us-ascii?Q?osPukiBeqPjaqbtrtBHUHkt6OMr87UFGe6fWnz57fOJO71q6yJcc4YgUQUe6?=
	=?us-ascii?Q?gswoeqMzHqWBvHgxUxU0m39HuwbhI9xbhUhBHdiy05LLjwYLUPLjmhPMyq5V?=
	=?us-ascii?Q?9Aox4qJQ3VRV2c28vgwTidK9PxB5rBLZAFWWX3KRA3UIwt1nwOSTK09qDhNT?=
	=?us-ascii?Q?07kdBA2KVJsKfsJ4VzJikAcqyYfT0oiSglwONySVixRj4o01j/CMjXiV86Az?=
	=?us-ascii?Q?32YqXdvRB/0SVdY3tEa2aDn0foLhCuf4jYxwIHtwum/XkZgWIzOOU9dFzdtT?=
	=?us-ascii?Q?CYgSMTFQuWBuIhkfotyqDbnimXLzYoXGGMS8i4IZmF1wqlyVDn+0H2obgNUA?=
	=?us-ascii?Q?Guh4PJHvlBbKO2Yk6iwsJcToLchai7RnKSlaTZICGa4z2LSE/D8SfdaWHt2o?=
	=?us-ascii?Q?G+MqtUfSPOY3jE4EvmcpODrO0DvpztasUsKqFeYX81H1clmwAAmpctcVaqHv?=
	=?us-ascii?Q?CJdjxtueWAJvhUzeKqsUaxQDwDFnFi1elzT+DmXguTnL1bHJdLm/IMc3/Kyc?=
	=?us-ascii?Q?TuOKNvsM3ywRwF2ON2bOIHXMYmRZPvs?=
X-Microsoft-Antispam-Message-Info: WVyT4BmOv1jd4LQ35yQjTcWhLsCNv8yV37A1pIXWRdUEt8iHoiIkN6DjfLHm/2VPRr/4vsiUjaDRvvFGqXdOtzOB4nndEJvyME4m9sRrV1bXmU9YUsx1wwPrY4bVYo27Mf+5+DC2Ql/Vm8vVRGjs4hBqdxeTQODQbBulUeMuzx+x4C8+3lldqYXcvx8BYQh/lwFS/w83XedRoGxxvanFU2R26DTv1rIu3wQq/VUd/JnuICIcisMp10BdE4CHuHQ71m5WfQ8pzonxmMY5hDqlbj2CUYvc6MEoa+gchZpEiRukvm/d0i2YNQgtrVOqGUbeDFnazZLmTvALM3ukaFU5NiPOGTDgijx/E8Na5t9mpto=
X-Microsoft-Exchange-Diagnostics: 1; BL0PR02MB4449;
	6:l+mzJ2cV79diMWUbv6LYoR+VGz14nlJdYzRJy65pEcFrvlKbRCEqOa/CvTwu/bJYrMjG2KU9oDfXgVwSSIGml/794NaMGqxyysw17HEhzP2bJp4vdPv2N/qA3ARO9nayeuuGjBb5cH4E5y15iA+vNS7g4GL7bee9cb/YbQim0KNeq2n4kuL6/fz5WXlBIsvmMzD5wcuYSKW3R6aKhLqEY4vomXxYFq/zfwEF1x6LbO8vrK2FJuWti8GknpfKhMPGghQx4EFP8O3s5qv1kUiRmHMYn0nAH/BDgFsfvdJCV0tgOEtF+oNidT5q6K89e8lMLORtx0HplzlGInIWUfbxsSb68S2NnJMHplmGj5/1EOkYcFFamqGghOlCl/g9RZ5n8S1DwukGjEHsg8MNfyMw3Txx1BOi1htkQseyO9GI9wNRBKk9nkaJEXcrxPEG0pSUva73MHcyY7nEk5p7bLRu1A==;
	5:o/28BzFA4LcB0cl1JF0a+Puq6HpiUeD2eqHUA1f0HXAH0/J5HkZIC+DLDGxKoUfcnGm6WFOXhlJnWu8BFnCnLhALrtk6SDMZ5OLX16nnq4B9FRn7qYIEvh7w1kh4m7e3hGDYsD9v9AakH5Ou87dgnY/JXjoVjj7yMxb8pcSNQoo=;
	7:gEXWIPoQ85M5R/nFfPnqZDTytNMObPz/F+gGn6mi6UlCX/Cpz1ULT2l09oFO72Pa5bZNHkqBgkKvoCf5g8BfNFPlmYB2u2g8bVFqbHqrRDK4EX0HGbUFwnagJm3q98T2LFW/x041zlJhoiFjUgWbXg==
SpamDiagnosticOutput: 1:99
SpamDiagnosticMetadata: NSPM
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 04 Dec 2018 19:55:08.1926 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 485bd593-97d9-4843-cb86-08d65a2264dc
X-MS-Exchange-CrossTenant-Id: 657af505-d5df-48d0-8300-c31994686c5c
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=657af505-d5df-48d0-8300-c31994686c5c;
	Ip=[149.199.60.83]; Helo=[xsj-pvapsmtpgw01]
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BL0PR02MB4449
X-Microsoft-Exchange-Diagnostics: 1; BL0PR02MB4449;
	23:5b6AAHOqGA+enFi5HpBJaKisDoPv2/ifvWV9cmd4uamWrM07mRn3YNQ/TQQGRoEUYcY956ejdzc0mqHYciiw756BUgLA6nUDpgeLyjR1zaoxfugVtPrE5yUEQ/QoiiUp054sYYYvVhtKcmWRWnAJDA==
X-OriginatorOrg: xilinx.com
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
X-List-Received-Date: Wed, 05 Dec 2018 15:59:57 -0000
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


