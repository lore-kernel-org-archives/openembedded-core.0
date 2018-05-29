Return-Path: <MANJUKUM@xilinx.com>
X-Greylist: delayed 601 seconds by postgrey-1.34 at layers.openembedded.org;
	Tue, 29 May 2018 05:55:10 UTC
Received: from NAM01-SN1-obe.outbound.protection.outlook.com
	(mail-sn1nam01on0048.outbound.protection.outlook.com [104.47.32.48])
	by mail.openembedded.org (Postfix) with ESMTP id 278326AC00
	for <openembedded-core@lists.openembedded.org>;
	Tue, 29 May 2018 05:55:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=xilinx.onmicrosoft.com; s=selector1-xilinx-com;
	h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
	bh=UrjcjcI3kL9SzyqF+4MXoZ+BXAVt6pFn0amitXd0LC4=;
	b=wu/n5pUUXcyPVPJgm63BsQaUUtR7KfH11Mw56JEli37mNQUEs1KirqAXb5vKdGgw1ABHvwJwgo7QqryoOVxNPXGmp1wRraIa9sVWHStY556C6hz+9uZh34zIs4OPx5sldTAGQ/L9wfdAO3OKZWaP3eQFkWyN31rz4wviDFnpd7s=
Received: from BN6PR02CA0098.namprd02.prod.outlook.com (2603:10b6:405:60::39)
	by BYAPR02MB4136.namprd02.prod.outlook.com (2603:10b6:a02:fa::29)
	with Microsoft SMTP Server (version=TLS1_2,
	cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.797.11;
	Tue, 29 May 2018 05:55:10 +0000
Received: from CY1NAM02FT053.eop-nam02.prod.protection.outlook.com
	(2a01:111:f400:7e45::205) by BN6PR02CA0098.outlook.office365.com
	(2603:10b6:405:60::39) with Microsoft SMTP Server (version=TLS1_2,
	cipher=TLS_ECDHE_RSA_WITH_AES_256_CBC_SHA384) id 15.20.820.11 via
	Frontend Transport; Tue, 29 May 2018 05:55:09 +0000
Authentication-Results: spf=pass (sender IP is 149.199.60.83)
	smtp.mailfrom=xilinx.com; linuxfoundation.org;
	dkim=none (message not signed)
	header.d=none;linuxfoundation.org; dmarc=bestguesspass action=none
	header.from=xilinx.com;
Received-SPF: Pass (protection.outlook.com: domain of xilinx.com designates
	149.199.60.83 as permitted sender) receiver=protection.outlook.com;
	client-ip=149.199.60.83; helo=xsj-pvapsmtpgw01;
Received: from xsj-pvapsmtpgw01 (149.199.60.83) by
	CY1NAM02FT053.mail.protection.outlook.com (10.152.74.165) with
	Microsoft SMTP Server (version=TLS1_0,
	cipher=TLS_RSA_WITH_AES_256_CBC_SHA) id 15.20.820.8
	via Frontend Transport; Tue, 29 May 2018 05:55:09 +0000
Received: from unknown-38-66.xilinx.com ([149.199.38.66] helo=xsj-pvapsmtp01)
	by xsj-pvapsmtpgw01 with esmtp (Exim 4.63)
	(envelope-from <manjukumar.harthikote-matha@xilinx.com>)
	id 1fNXbA-0004M0-OR; Mon, 28 May 2018 22:55:08 -0700
Received: from [127.0.0.1] (helo=localhost)
	by xsj-pvapsmtp01 with smtp (Exim 4.63)
	(envelope-from <manjukumar.harthikote-matha@xilinx.com>)
	id 1fNXb5-0008AH-NK; Mon, 28 May 2018 22:55:03 -0700
Received: from xsj-pvapsmtp01 (smtp3.xilinx.com [149.199.38.66])
	by xsj-smtp-dlp1.xlnx.xilinx.com (8.13.8/8.13.1) with ESMTP id
	w4T5sx1i027995; Mon, 28 May 2018 22:54:59 -0700
Received: from [172.19.2.216] (helo=xsjmanjukum50.xilinx.com)
	by xsj-pvapsmtp01 with esmtp (Exim 4.63)
	(envelope-from <manjukumar.harthikote-matha@xilinx.com>)
	id 1fNXb1-00086R-Ma; Mon, 28 May 2018 22:54:59 -0700
From: Manjukumar Matha <manjukumar.harthikote-matha@xilinx.com>
To: <openembedded-core@lists.openembedded.org>
Date: Mon, 28 May 2018 22:54:54 -0700
Message-ID: <1527573294-23866-1-git-send-email-manjukumar.harthikote-matha@xilinx.com>
X-Mailer: git-send-email 2.7.4
X-RCIS-Action: ALLOW
X-TM-AS-Product-Ver: IMSS-7.1.0.1224-8.2.0.1013-23620.005
X-TM-AS-User-Approved-Sender: Yes;Yes
X-EOPAttributedMessage: 0
X-MS-Office365-Filtering-HT: Tenant
X-Forefront-Antispam-Report: CIP:149.199.60.83; IPV:NLI; CTRY:US; EFV:NLI;
	SFV:NSPM;
	SFS:(10009020)(39380400002)(39860400002)(376002)(396003)(346002)(2980300002)(438002)(199004)(189003)(77096007)(7696005)(26005)(106002)(48376002)(47776003)(4326008)(107886003)(186003)(1857600001)(9786002)(426003)(336012)(575784001)(486006)(51416003)(72206003)(476003)(478600001)(356003)(2616005)(126002)(305945005)(36756003)(63266004)(106466001)(50226002)(2906002)(5660300001)(36386004)(316002)(50466002)(54906003)(81156014)(8936002)(6666003)(6916009)(8676002)(81166006)(16586007)(2351001)(107986001);
	DIR:OUT; SFP:1101; SCL:1; SRVR:BYAPR02MB4136; H:xsj-pvapsmtpgw01;
	FPR:; SPF:Pass; LANG:en; PTR:unknown-60-83.xilinx.com; A:1; MX:1;
X-Microsoft-Exchange-Diagnostics: 1; CY1NAM02FT053;
	1:rTV4Y7CuU2ch7rSKG8ZyWe9s4xX0oGi76iEl99whfPR/62Hk0PHxy34Dr2UBLmh/ZE75l9LLZ/N4jzK2+wpW+iFsnO7RphB9mFfPUKuyxjpHG+b/cpwh8IywVnEYKChS
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-Microsoft-Antispam: UriScan:; BCL:0; PCL:0;
	RULEID:(7020095)(4652020)(5600026)(4608076)(4534165)(4627221)(201703031133081)(201702281549075)(2017052603328)(7153060);
	SRVR:BYAPR02MB4136; 
X-Microsoft-Exchange-Diagnostics: 1; BYAPR02MB4136;
	3:MjAD+PpyzR3XmzCP9Yylv3Zl+q+IvoHc5H66u2iS8qbMpF/DqC3FoJ69n2qrV9yhDrcKPj9yfO+O6hldiZXA83IbDy/ynWSNSGiSu4rQx0V4ixZOfe0fqnQbmcEpb49j0E5gm+IALL1DNpShyI05fYtqynABlxLi/Dxknvh/OsBKL3lScQQXb3CRj8PRruNlT4nfI+V6/sEbM8aIPIfQ3iLee9vqjpD6I5B4niCijPL0E9BBmiXe4U3wiYVKp7reudHnVNl8WG1CYGVV0Ea4kMu5Qfq/KIiytF6GCUkwxFMcNyfW80XfX4rkvmJ0je2af6WinizxHX8fdlYC+qXTT8cqtYVd6SofIyw8/4isfMM=;
	25:8QWqUbgL7bppTaqtww4sCBfLa0eFPyHA90JmxlVNhaGFZYFonexkJNCtIKWEmnsDgP4h8RdFWtrFywoQQfp/1bDlOCmCfPsxlpbRDFJwqqWuBi0+2tL8zysEwUsFW6WUMqhiccU30F3cV/Wet7oNNK+uooowS23NeiBdcpqNhaq+pWBins6NTY/C8NvnmgGafCaqaJsTlTN12WzqlUHQ240hngWQ0nFam0emF9YyXhOKeZpP87At76ODX5HbTspuvv8gdUFdSJ1Banfcvjt2y295Efo8L1+HLs/OZUJW7XDWOFUnTABjUY7ZCDSrpXNKGOICftiy0fQ0X9932lXCgw==
X-MS-TrafficTypeDiagnostic: BYAPR02MB4136:
X-Microsoft-Exchange-Diagnostics: 1; BYAPR02MB4136;
	31:eLgd1u9joc1iJfZBf4QqctQ7eGTlAbGLuGanFMX9Hx2g7zo+Lvr7OCKS1C0v1DyilxxjsKwv61fOtXlEugQCQ5Fnw8b4h+6QtPneV0vpkIl3AiHeQuKKkrCRkGE2hFbi+ZVFVvvJW4YEtqwXJkuiFMFT6r8u7AK4Xov8SpDM2DfooF3Ix+emUDGTsh2O1XcwpiYlqd+Zf3+IKeALlk1TLZXrIIlNwuhXIF+EbcTrXkM=;
	20:uYb2I2HGaNlTsa9ShZfeYXWD/xGtPEeoLeX4tXZCShuHfrkjDQpy8CXEiCOxA2uWj0jQmqWvVTBrd47HuH28ykgyKGyFE9dgoeuI5pktcyjkOMxhIkipA8Hl/BvyjTm6tXc3A21zSDfui9jkVZ1BdVXam/U76NBzpQSS5DVarwoZ1EqWbs2aGRrsiaPmtacG75R92cTvz8Pmdz4FcEjFS61EdoJ7w59Ob+FoJg/23hF6JsFvKEdQbWLy4qoUrgkwbIDE58pE+Wa2+Jlg8dE1TyQzJg6IgIV6zHE6ASBnPADLpOObGb555oF/2wTzM/8FGKXhyCW84hHruMXv63pfrZsekd5nXmmDNaIjLix6wmQ66JW+PajAk78WQNnlwKrJxgHZmwm2Q1Q7nA+0YF0OBN10V+q3t+ZSlwOuTTgHqb7x2xpIM4ARALOUGCatc/5l9q4tXpzK7IsFOYwnyd5Fc5ipVpYpwn5LrbPSZz+qN1xHklP5OjRYvLzmDVTgC0Kk
X-Auto-Response-Suppress: DR, RN, NRN, OOF, AutoReply
X-Microsoft-Antispam-PRVS: <BYAPR02MB413691E33E5FEFBE0CD40CA1B96D0@BYAPR02MB4136.namprd02.prod.outlook.com>
X-Exchange-Antispam-Report-Test: UriScan:(192813158149592)(228905959029699);
X-MS-Exchange-SenderADCheck: 1
X-Exchange-Antispam-Report-CFA-Test: BCL:0; PCL:0;
	RULEID:(8211001083)(6040522)(2401047)(5005006)(8121501046)(10201501046)(93006095)(93004095)(3002001)(3231254)(944501410)(52105095)(6055026)(149027)(150027)(6041310)(20161123562045)(201703131423095)(201702281528075)(20161123555045)(201703061421075)(201703061406153)(20161123560045)(20161123558120)(20161123564045)(6072148)(201708071742011)(7699016);
	SRVR:BYAPR02MB4136; BCL:0; PCL:0; RULEID:; SRVR:BYAPR02MB4136; 
X-Microsoft-Exchange-Diagnostics: 1; BYAPR02MB4136;
	4:MnjpIEXHTqGgqbewi80T9155bPm860AdJ9KKqUGhdGxQbuh/rUTZ6/ETLwvAitw1g/pGuzmZG5BJDpg3mH+mMi4hH1a5AXlWBpDieydFNPCz9o4Slti9nRbA7+ZiBDJ+yvaYvCO+36KroY9WG4iujmY3LrY6cSiBBPnyZPPzYd3mwiwbUoRtr332rlEBnLsefmOUR0AartM2Bpk7ZCwlvjc/tT9IBP2i///2fGyITVWZJkZXck/qXlyTw7PSzl47rfeSCM0wuAGMRbli8E6TE9xc2GrlygGO9LdSFtTHP/p1zANbpLls2eP452RkdanGge12gEznHj3YkgkaZx4BccKbCALGNqD6kds1RCcSd+Y=
X-Forefront-PRVS: 0687389FB0
X-Microsoft-Exchange-Diagnostics: =?us-ascii?Q?1; BYAPR02MB4136;
	23:LeP7JIjGntzrka+8dLb3WX6ZqCOcM3NdqiYXBRYur?=
	=?us-ascii?Q?6zsCMMq7RfSkndBkkCMxbRdE2HsRvJCx4Gjp5OTHLKnropCsPKmxH8JSu/Xi?=
	=?us-ascii?Q?NzUwE+TdXfyhq3zzS8T8o4jbiDXQt64hqL3nGwIbUlDmsM5TiznRURWDg+/d?=
	=?us-ascii?Q?5zrC6LAdzkVwIUsHrNE/2+VmIb/THlmZ9kIRSocTNc4NkI18ASUuUa2IUfJf?=
	=?us-ascii?Q?olluULg/Vm80UhDRqZpqIglNPnKmLiZlhgEGivCtxvF2g5AfE37oviSHZFNk?=
	=?us-ascii?Q?iVl3fEklYZaoHoOPUgi0SRSG2iVx5AkMdHMBQRYGFz42hLzKB/MmlKtWcypY?=
	=?us-ascii?Q?EWZJ2YSPqfltbszpze8HGzkqCpW1SRxsBzkiFiGHDKvrns4Vcp6BNcI1mu7J?=
	=?us-ascii?Q?2e4lssYYUUWVUqoDBb4UJjRbbxM7gp58meXF7W/jkJyLE+727hBUNm3PUWBM?=
	=?us-ascii?Q?eYtfoBdNoRxk+RuKpkoN2I7qcrhgwvVodSNtdOz8lM6I5e2DaUmtZbhC3IfV?=
	=?us-ascii?Q?Z3s5tZuesAFcUnAavJRzrPf6HEn2aAfQ2CxkstR9ej6r5jJCSpBPsyfRUjmO?=
	=?us-ascii?Q?9BFaALPwCwCrrEZg20gOfwaHqH0fBwhMRssPuhYxhHSQN0frRDrEerope8pj?=
	=?us-ascii?Q?5jTRhuwt73pkEiGREcZVgrj8a+V0kaJBQci7MzO4uqPHY4+Pit23jO517OJs?=
	=?us-ascii?Q?fQobQ/DfRcCb2/Pm9EqMRAbS8+YIcPJYKVGJ/CvF36IbNJCIufOitnQ4G4KK?=
	=?us-ascii?Q?v9lIiPXQHw+tLsXqSY1wv6Gs8LbG0dDTcKYxsSh0OJ+E5cU8OUYDsLo4IpNo?=
	=?us-ascii?Q?Jd75QAiQrF14PlY6w4gHkJOcfBtB6AsaiXQwJV0UX2F6nTh5wmcN4Y79uPrF?=
	=?us-ascii?Q?1T14Pe2tEgRWFIe49h3mllkFskZ/lNvHDwnK5jLVQSGnwESHbr5nqCPm4uD8?=
	=?us-ascii?Q?W3S+uvTGtOIHkjQfg84rS2vq4Ln5Gow9w+5MwmzZAZabLB3kXlMgpF3u9lof?=
	=?us-ascii?Q?60w4uL5DCX0D8f5fX3tVOCPr5aRPdpLtPJVvHQSZDgKQ7i3YAoA0MYQ7Gllf?=
	=?us-ascii?Q?6KlZRgvDjMeepTHZTQ9fW2tguPyPCo0TDyK5WFb9NfiH08qDkT8dtFShppnl?=
	=?us-ascii?Q?zqgae4w9tMXMSh7AzX915KnXWKPptV8?=
X-Microsoft-Antispam-Message-Info: MiNhCDkZMUVYtS7jUwkH/OHwWb1jVyStkyIgtG/Cli8QYbjvq0e9bk+H/mN9rYDz1swg7+/I0GGl3NQ8f/jN+d0rveBNxJOd1KbLQ0j3HaR3YIqrUxsRayb50Q7SbrOvovSoOzAAdD+VAKFtz4AcN3cRVcb7cCEGg0MXTy6HzyJFfOvlDx+uRk69RUpoeCoF
X-Microsoft-Exchange-Diagnostics: 1; BYAPR02MB4136;
	6:aV2OsLmuz9F8ZtcTciBc8tubmH0MrJX4Xv+sZEML5b3CdSdYexPHPUwgcbiGYauaNo37ZeegofXpsx2jv7qeQA/riyAE5l3P1aNT0HEWzssxZs4TSlEnw+RgnxdRcwKL56g+Kz+1no7J5lM3GAboiwGVKXVlNm90nyOAGAQCVDaq5tkj6iWG8NbnWmivu+mNsk5X7oLX/Esg8HjgWPB3pI1CyS2hqFSUiLqzq2hpSjhBJAEFdt1GmLOFMEMJ0KCF9QJe0V0C/Y7oHF7XdZ/6dHzJNGPIzA8ZYum64YiLg+azcLBrgWlp93gPliC9BSHmPzgHwrcirKX1/FQ2098Io8rsCtQriEvL1IvxJ+I7IbUoV7MnZLpnkhWDBFbQRO1WVD30DFMF+jwM9W+xrbzmmbibQtGOhrRYQgAnYbDA9DS9OQs32LN0HeLM/nqGVr8KGQgkUg3M9oGb2SYxL3DGUA==;
	5:S7qNTFcp8n+khUFiB4ZZ2iooaUG+uHLQ1CJCRas0W0vxgM2GE84944Ruimng/SrPbiwUontX49sW3DkYxb71jgXsnM0oPqpL0yAIbmqcUnZNFtrKhD9+YRBtthFDagjaus1BRKkrk8lwuHIDPf0K7WZGuj+EefEFh981mgtk3Co=;
	24:S85S7dxi616/ptFUCRBLf5MUhyc5X+Eb3Mzi6FD1PKpENbVK8mlKFVi5RF43l5TeSoVuM6zKDstGF28yVpCdHlyEfwAF9+QOMl1Y7qxoOQc=
SpamDiagnosticOutput: 1:99
SpamDiagnosticMetadata: NSPM
X-Microsoft-Exchange-Diagnostics: 1; BYAPR02MB4136;
	7:BkuBHTFf9IPpGr2Cq1P+ec6An/5QMrrgTfud9Jt2c09LHIUVzy4txSoC/ae50mO68yiC4qslW26Y5+f8qwcgPmN+f+YlPRZReuGr5DkmjVkfzv4aAfmc0LoXquKlraSn2zTYeW905opFPHXHmxIpsrjUppI4pe9uMtmzejGAhgRolsfEqw8tv0S9M+BRjIzAwGcTn/0cZWbp86fJUzh7MkdBs2P0Ks3YdAMdzGhLxlbANof/5w4kEPEcPeTsD0eL
X-MS-Office365-Filtering-Correlation-Id: 2321c2a9-0806-4ebe-2a7f-08d5c528bc8e
X-OriginatorOrg: xilinx.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 29 May 2018 05:55:09.2934 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 2321c2a9-0806-4ebe-2a7f-08d5c528bc8e
X-MS-Exchange-CrossTenant-Id: 657af505-d5df-48d0-8300-c31994686c5c
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=657af505-d5df-48d0-8300-c31994686c5c;
	Ip=[149.199.60.83]; Helo=[xsj-pvapsmtpgw01]
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BYAPR02MB4136
Subject: [sumo][PATCH] sysvinit-inittab: do not use 'exit 1' to postpone to first boot
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
X-List-Received-Date: Tue, 29 May 2018 05:55:11 -0000
Content-Type: text/plain

From: Alexander Kanavin <alexander.kanavin@linux.intel.com>

Instead, first check if we need to do anything at all during first boot,
and if so, either postpone to first boot via pkg_postinst_ontarget()
when running on host, or run the necessary setup code when running on target.

(From OE-Core rev: 16df1717c3813ba773e0dfa2d1db471816d8b99b)

This is a backport from master

Signed-off-by: Alexander Kanavin <alexander.kanavin@linux.intel.com>
Signed-off-by: Ross Burton <ross.burton@intel.com>
Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
Signed-off-by: Manjukumar Matha <manjukumar.harthikote-matha@xilinx.com>
---
 meta/recipes-core/sysvinit/sysvinit-inittab_2.88dsf.bb | 15 +++++++++------
 1 file changed, 9 insertions(+), 6 deletions(-)

diff --git a/meta/recipes-core/sysvinit/sysvinit-inittab_2.88dsf.bb b/meta/recipes-core/sysvinit/sysvinit-inittab_2.88dsf.bb
index 5b9c422..8585a41 100644
--- a/meta/recipes-core/sysvinit/sysvinit-inittab_2.88dsf.bb
+++ b/meta/recipes-core/sysvinit/sysvinit-inittab_2.88dsf.bb
@@ -53,8 +53,15 @@ EOF
 }
 
 pkg_postinst_${PN} () {
+# run this on host and on target
+if [ "${SERIAL_CONSOLES_CHECK}" = "" ]; then
+       exit 0
+fi
+}
+
+pkg_postinst_ontarget_${PN} () {
 # run this on the target
-if [ "x$D" = "x" ] && [ -e /proc/consoles ]; then
+if [ -e /proc/consoles ]; then
 	tmp="${SERIAL_CONSOLES_CHECK}"
 	for i in $tmp
 	do
@@ -68,11 +75,7 @@ if [ "x$D" = "x" ] && [ -e /proc/consoles ]; then
 	done
 	kill -HUP 1
 else
-	if [ "${SERIAL_CONSOLES_CHECK}" = "" ]; then
-		exit 0
-	else
-		exit 1
-	fi
+	exit 1
 fi
 }
 
-- 
2.7.4


