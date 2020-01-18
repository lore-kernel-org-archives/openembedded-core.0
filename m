Return-Path: <alejandro@enedino.org>
Received: from NAM11-BN8-obe.outbound.protection.outlook.com
	(mail-bn8nam11on2087.outbound.protection.outlook.com [40.107.236.87])
	by mail.openembedded.org (Postfix) with ESMTP id 743C97F7BF
	for <openembedded-core@lists.openembedded.org>;
	Sat, 18 Jan 2020 21:22:51 +0000 (UTC)
Received: from BN6PR02CA0046.namprd02.prod.outlook.com (2603:10b6:404:5f::32)
	by BYAPR02MB5621.namprd02.prod.outlook.com (2603:10b6:a03:a4::32)
	with Microsoft SMTP Server (version=TLS1_2,
	cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.2644.20;
	Sat, 18 Jan 2020 21:22:51 +0000
Received: from CY1NAM02FT026.eop-nam02.prod.protection.outlook.com
	(2a01:111:f400:7e45::206) by BN6PR02CA0046.outlook.office365.com
	(2603:10b6:404:5f::32) with Microsoft SMTP Server (version=TLS1_2,
	cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.2644.20 via
	Frontend Transport; Sat, 18 Jan 2020 21:22:51 +0000
Authentication-Results: spf=none (sender IP is 149.199.60.83)
	smtp.mailfrom=enedino.org; lists.openembedded.org;
	dkim=none (message not
	signed) header.d=none;lists.openembedded.org; dmarc=none action=none
	header.from=enedino.org;
Received-SPF: None (protection.outlook.com: enedino.org does not designate
	permitted sender hosts)
Received: from xsj-pvapsmtpgw01 (149.199.60.83) by
	CY1NAM02FT026.mail.protection.outlook.com (10.152.75.157) with
	Microsoft SMTP Server (version=TLS1_0,
	cipher=TLS_RSA_WITH_AES_256_CBC_SHA) id 15.20.2644.19
	via Frontend Transport; Sat, 18 Jan 2020 21:22:50 +0000
Received: from unknown-38-66.xilinx.com ([149.199.38.66] helo=xsj-pvapsmtp01)
	by xsj-pvapsmtpgw01 with esmtp (Exim 4.63)
	(envelope-from <alejandro@enedino.org>)
	id 1isvYO-0001ni-N9; Sat, 18 Jan 2020 13:22:48 -0800
Received: from [127.0.0.1] (helo=xsj-smtp-dlp2.xlnx.xilinx.com)
	by xsj-pvapsmtp01 with esmtp (Exim 4.63)
	(envelope-from <alejandro@enedino.org>)
	id 1isvYJ-00030A-G9; Sat, 18 Jan 2020 13:22:43 -0800
Received: from xsj-pvapsmtp01 (mailhost.xilinx.com [149.199.38.66])
	by xsj-smtp-dlp2.xlnx.xilinx.com (8.13.8/8.13.1) with ESMTP id
	00ILMgIu003758; Sat, 18 Jan 2020 13:22:42 -0800
Received: from [172.19.2.8] (helo=xsjalejandr50.xilinx.com)
	by xsj-pvapsmtp01 with esmtp (Exim 4.63)
	(envelope-from <alejandro@enedino.org>)
	id 1isvYI-0002zr-MS; Sat, 18 Jan 2020 13:22:42 -0800
From: Alejandro Enedino Hernandez Samaniego <alejandro@enedino.org>
To: openembedded-core@lists.openembedded.org
Date: Sat, 18 Jan 2020 13:22:39 -0800
Message-Id: <1579382560-2540-1-git-send-email-alejandro@enedino.org>
X-Mailer: git-send-email 2.7.4
X-RCIS-Action: ALLOW
X-TM-AS-Product-Ver: IMSS-7.1.0.1224-8.2.0.1013-23620.005
X-TM-AS-Result: No--5.136-7.0-31-1
X-imss-scan-details: No--5.136-7.0-31-1;No--5.136-5.0-31-1
X-TM-AS-User-Approved-Sender: No;No
X-TM-AS-Result-Xfilter: Match text exemption rules:No
X-EOPAttributedMessage: 0
X-Matching-Connectors: 132238561709037941;
	(f9e945fa-a09a-4caa-7158-08d2eb1d8c44); ()
X-Forefront-Antispam-Report: CIP:149.199.60.83; IPV:; CTRY:US; EFV:NLI;
	SFV:NSPM;
	SFS:(10009020)(136003)(39860400002)(396003)(376002)(346002)(428003)(199004)(189003)(2616005)(356004)(6666004)(316002)(336012)(5660300002)(6916009)(2906002)(426003)(9786002)(26005)(498600001)(81156014)(81166006)(4326008)(107886003)(36756003)(86362001)(8676002)(8936002)(4744005)(70206006)(70586007);
	DIR:OUT; SFP:1101; SCL:1; SRVR:BYAPR02MB5621; H:xsj-pvapsmtpgw01;
	FPR:; SPF:None; LANG:en; PTR:unknown-60-83.xilinx.com; A:1; MX:1;
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: ed37052b-3aef-4087-d606-08d79c5c92bc
X-MS-TrafficTypeDiagnostic: BYAPR02MB5621:
X-Microsoft-Antispam-PRVS: <BYAPR02MB56218EAF3C4C6B00437712F7B8300@BYAPR02MB5621.namprd02.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:5236;
X-Forefront-PRVS: 0286D7B531
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: kqz+2yoOKwf+lhgs0D45UB/4+CuxtBtZBa2eYvZ9zbfZP124HjZ5LpjMetKwJWPub8GUABG0/FHm3NFdBlTO2CBoV2NfY8TqU3o2YAPH5JZ4oHzgadeBqsAjO5p9vHX+xm1bHY9NBf5iMxwFwSTvDfTFl/FLF6P6ctg9eLxIvR/kKz6srdR3z75z5pKDMikSk0vxgcpU83NSL0qisDlHtNZaahkF+7cqklrY+1AZLnUAGK/aQ1CnkfMuzLNVlDSX98xN/h5jBfspLjDZGo2VSc9LjMCWtZhyDM2kgWznPMjSqvWv2rTX1GWs6Sgbg9aXVtImF0awkRRMPsSBLFBQV6OjfHnzy2pqYE7VLRo+rYC/j+2vp8IaEuzMdT+F6bEOwKAso2MMcT+oG34bn0e405bfYfX5eJcYFwveLIqQnKbd3dujh625wNi23Xp7t4qs
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 18 Jan 2020 21:22:50.7706 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: ed37052b-3aef-4087-d606-08d79c5c92bc
X-MS-Exchange-CrossTenant-Id: 5afe0b00-7697-4969-b663-5eab37d5f47e
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=5afe0b00-7697-4969-b663-5eab37d5f47e;
	Ip=[149.199.60.83]; Helo=[xsj-pvapsmtpgw01]
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BYAPR02MB5621
Subject: [PATCH] machine_dict: Add i686 to the ELF machine dictionary
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
X-List-Received-Date: Sat, 18 Jan 2020 21:22:52 -0000
Content-Type: text/plain

An error like the following is thrown when building
baremetal applications on some x86 architectures:

  (machine, osabi, abiversion, littleendian, bits) \
    = oe.elf.machine_dict(d)[target_os][target_arch]

Exception: KeyError: i686

Since the i686 (target_arch) key does not exist in the dictionary.

Add the key to fix the error.

Signed-off-by: Alejandro Enedino Hernandez Samaniego <alejandro@enedino.org>
---
 meta/lib/oe/elf.py | 1 +
 1 file changed, 1 insertion(+)

diff --git a/meta/lib/oe/elf.py b/meta/lib/oe/elf.py
index 2562cea..e0c31ff 100644
--- a/meta/lib/oe/elf.py
+++ b/meta/lib/oe/elf.py
@@ -15,6 +15,7 @@ def machine_dict(d):
                         "aarch64" :   (183,    0,    0,          True,          64),
                         "aarch64_be" :(183,    0,    0,          False,         64),
                         "i586" :      (3,      0,    0,          True,          32),
+                        "i686" :      (3,      0,    0,          True,          32),
                         "x86_64":     (62,     0,    0,          True,          64),
                         "epiphany":   (4643,   0,    0,          True,          32),
                         "lm32":       (138,    0,    0,          False,         32),
-- 
2.7.4


