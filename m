Return-Path: <alistai@xilinx.com>
X-Greylist: delayed 8254 seconds by postgrey-1.34 at layers.openembedded.org;
	Fri, 24 Mar 2017 18:46:49 UTC
Received: from NAM02-CY1-obe.outbound.protection.outlook.com
	(mail-cys01nam02on0040.outbound.protection.outlook.com
	[104.47.37.40])
	by mail.openembedded.org (Postfix) with ESMTP id 8A3CF77BE1
	for <openembedded-core@lists.openembedded.org>;
	Fri, 24 Mar 2017 18:46:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=xilinx.onmicrosoft.com; s=selector1-xilinx-com;
	h=From:Date:Subject:Message-ID:Content-Type:MIME-Version;
	bh=kcuJ//mk1XFwjNs6nOqzzN1KOkhXJbx2OQICsKwCjco=;
	b=sKomP8zP2DZJBS9jxGWuV7kCcv5gvQ4VcdS39LpM1DyI8uKUgL/VgDM71rfXZP0dMH3nSVGh53T1E2QU7FiqLjZivpkSISitPYb7kvf3OLb2KHDOBW22rFmecp7x9AUPs0Wbyx1Pz/kKsMPyle4u0HC3R0BSFaBBaZhVXGy5X4A=
Received: from CY4PR02CA0043.namprd02.prod.outlook.com (10.175.57.157) by
	DM2PR0201MB0765.namprd02.prod.outlook.com (10.160.95.11) with Microsoft
	SMTP Server (version=TLS1_2,
	cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id
	15.1.991.14; Fri, 24 Mar 2017 16:14:48 +0000
Received: from SN1NAM02FT047.eop-nam02.prod.protection.outlook.com
	(2a01:111:f400:7e44::202) by CY4PR02CA0043.outlook.office365.com
	(2603:10b6:903:117::29) with Microsoft SMTP Server (version=TLS1_2,
	cipher=TLS_ECDHE_RSA_WITH_AES_256_CBC_SHA384_P384) id 15.1.977.11 via
	Frontend Transport; Fri, 24 Mar 2017 16:14:47 +0000
Authentication-Results: spf=pass (sender IP is 149.199.60.100)
	smtp.mailfrom=xilinx.com; nathanrossi.com;
	dkim=none (message not signed)
	header.d=none;nathanrossi.com; dmarc=bestguesspass action=none
	header.from=xilinx.com;
Received-SPF: Pass (protection.outlook.com: domain of xilinx.com designates
	149.199.60.100 as permitted sender) receiver=protection.outlook.com;
	client-ip=149.199.60.100; helo=xsj-pvapsmtpgw02;
Received: from xsj-pvapsmtpgw02 (149.199.60.100) by
	SN1NAM02FT047.mail.protection.outlook.com (10.152.72.201) with
	Microsoft SMTP Server (version=TLS1_0,
	cipher=TLS_RSA_WITH_AES_256_CBC_SHA) id 15.1.977.7
	via Frontend Transport; Fri, 24 Mar 2017 16:14:47 +0000
Received: from unknown-38-66.xilinx.com ([149.199.38.66]:52569
	helo=xsj-pvapsmtp01) by xsj-pvapsmtpgw02 with esmtp (Exim 4.63)
	(envelope-from <alistair.francis@xilinx.com>)
	id 1crRrS-0000tM-SC; Fri, 24 Mar 2017 09:14:46 -0700
Received: from [127.0.0.1] (helo=localhost)
	by xsj-pvapsmtp01 with smtp (Exim 4.63)
	(envelope-from <alistair.francis@xilinx.com>)
	id 1crRrS-0005fF-NV; Fri, 24 Mar 2017 09:14:46 -0700
Received: from xsj-pvapsmtp01 (smtp3.xilinx.com [149.199.38.66])
	by xsj-smtp-dlp1.xlnx.xilinx.com (8.13.8/8.13.1) with ESMTP id
	v2OGEfmn015314; Fri, 24 Mar 2017 09:14:41 -0700
Received: from [172.19.2.220] (helo=xsjalistai50.xilinx.com)
	by xsj-pvapsmtp01 with esmtp (Exim 4.63)
	(envelope-from <alistair.francis@xilinx.com>)
	id 1crRrN-0005cj-HN; Fri, 24 Mar 2017 09:14:41 -0700
From: Alistair Francis <alistair.francis@xilinx.com>
To: <openembedded-core@lists.openembedded.org>, <liezhi.yang@windriver.com>,
	<ross.burton@intel.com>
Date: Fri, 24 Mar 2017 09:12:17 -0700
Message-ID: <20170324161217.6285-2-alistair.francis@xilinx.com>
X-Mailer: git-send-email 2.9.3
In-Reply-To: <20170324161217.6285-1-alistair.francis@xilinx.com>
References: <20170324161217.6285-1-alistair.francis@xilinx.com>
X-RCIS-Action: ALLOW
X-TM-AS-Product-Ver: IMSS-7.1.0.1224-8.1.0.1062-22962.005
X-TM-AS-User-Approved-Sender: Yes;Yes
X-EOPAttributedMessage: 0
X-MS-Office365-Filtering-HT: Tenant
X-Forefront-Antispam-Report: CIP:149.199.60.100; IPV:NLI; CTRY:US; EFV:NLI;
	SFV:NSPM;
	SFS:(10009020)(6009001)(39860400002)(39850400002)(39450400003)(39840400002)(39410400002)(2980300002)(438002)(189002)(199003)(9170700003)(4326008)(47776003)(305945005)(38730400002)(39060400002)(50986999)(107886003)(76176999)(63266004)(2906002)(33646002)(1076002)(9786002)(189998001)(50226002)(2201001)(81166006)(50466002)(8676002)(106466001)(5660300001)(54906002)(8936002)(356003)(2950100002)(6666003)(36756003)(5003940100001)(48376002)(77096006)(36386004)(107986001);
	DIR:OUT; SFP:1101; SCL:1; SRVR:DM2PR0201MB0765;
	H:xsj-pvapsmtpgw02; FPR:; SPF:Pass; MLV:ovrnspm; MX:1; A:1;
	PTR:unknown-60-100.xilinx.com,xapps1.xilinx.com; LANG:en; 
X-Microsoft-Exchange-Diagnostics: 1; SN1NAM02FT047;
	1:gguPXzQ8UZWR500ouVykWhA8GBDtfzOlLsWZR1tk1ss3pM2fRm+5Ua9AS13/8tTbPLuMV5cBUMutMJuPvq61v402rQFizQ/ws7v5WGdKLBxpKHwSPJf7gRsrkAVYilm3FWOx33IkjoBV30B5Fy4Br/HC8IZ+efi2jrZffylGH+6U5MtX2//8L15UvxZC2lzEDSw3Mn75WJk8UDkWcIu/hMvodiIYKoE/zWP06OsVMKZRL1X9XoLOUZE3xxBFKMfS2Ik2zKCxjn4lWAd19JzcJ2anmG55cnsmJvdYSaVwePAh9c1g5HFf5Kui5pS/dt/sNFZCVYqnZljBfBC9nyIQ6XOb0DnexqO9wa5YUJwxP1m8VKkKomasuU7sIJOQbPto+SlhIA0uXlG5m6MPmjWW08EJqjkcWJ551TBuj/WjjST6qOWvJcjB/A5qHfgm1IU4ThiEH7JrhNdygPLpsYNqqy7Ex6IXZDeDUOvUeYtcfyWpyssbNALWfSPR7+dsj0WatWFeT9IbRYYpmxc/gjCq2WRkj2X0CoCmtR7p/daH+RogkcTQr+qdg4XatAEPm6ICvtc93Ased92vDZw/t8KMC/4pcdpqYnH23SQElNIJxvlTHKelP6BzIQughihgSbc6
MIME-Version: 1.0
X-MS-Office365-Filtering-Correlation-Id: c7e88f30-44f4-4759-fb9d-08d472d0e465
X-Microsoft-Antispam: UriScan:; BCL:0; PCL:0;
	RULEID:(22001)(8251501002)(2017030254075); SRVR:DM2PR0201MB0765;
X-Microsoft-Exchange-Diagnostics: 1; DM2PR0201MB0765;
	3:i2KCQknZla2FuS8Nqth2zLBw80sJzEqeHI4Sp4JoeeU/YCzbc88Sf5951MNcCS40SP/VU90kzkYgPctn97E9eQ5vu3uOnk22dbGGReJLkfeOD5zEAyvkql/hzVOKKvbNnrbtYXOPkAmc7WLN+8LocKs1TfLx5Y1l3jKzhyp9iv89NYVl4TWfqsHw/DO78S+lswiKGJeVL1daLj8FM/JiinFwfovpPG+4cd6KBiDXO9l0FRsVmSlziyZKBRQhunA8gQPcYw6zI9A5abFiNBfTGurAbSHmyh/6sDgJ7SrKfwUnSTtTEnO1WFlp89xrI5fWnx+2vxtZcZapQEJfHIafVs78AfgjGz19uXd3qQ2jlnSOESqxgNGnflZ0H8FZT3bJimhADucj0aKymjqJ/cIjVYEkHi197evjCSkxWPEfegvYZo0ACGFYkDIfwjCspP95;
	25:d4n8jJN/+2gRNkhguTPZcjsRYN/DBLBAmF1CrJhP6C4MSk08cayMVrJTgobVGKvEgpK0rCVLosCJ3nnklkEfEsatS+ZAGMiHgz2ttaWwpGPGcxjueMacwJVZposQUGiZqDm0KlljExc68ZX6JpOCshYpFIluSMtStP0HHGCxJKrFKezlahDqsdoMMvv6qhfuvxmTKb8599YIlggcASDqMP8knIgcm8XygmjNs24osjNFjvvCNLT9ZnqtqeLwsvAcaAB+PJr3t34IhLXD5p7yW1RykuahpYLfP+eKjnvKqk4C6L9LZ7KO4UvffWHwygQOEUISs+YVuJIPCG5XLNQO0mJILOwoU2XTF6kuVC7Vvf35Uk7CsQm+Ud4S0ds+YOoYN48cEXuq76WaXGVRsqVS/JwHu5lKYAyOkyw94YmF5h70F/rYxKEeo92muOZwEb0S+YwhqZyPUk3A1TyV4EGkkA==
X-Microsoft-Exchange-Diagnostics: 1; DM2PR0201MB0765;
	31:AqYcp0uvghZLGU+mRL/VDE/k6/6be5yEf0Bh17oHzWrcN07ABpcAPT/1g55aNV3HS5TNq82Mit9T7AiqqSUdP6rqWr4UyJuunLZ1obWMgEJpe0qnIeokpXSHfuKBrWapCQLu5zWABFVwigDQFnfIPI8jBWYaL95qVoF9IYAezY1SuR8OJSAW805cw3CQugOVGs+wqM9jyaw1RLAWWHYm1BvGyEYcx5Yo92vbflABYFl+EmIMuBy9vXj4gs0ZpVYLPnMrxd+NrS3QG0QLVnurRX0kw6ryyc64waa0T9b+uIk=;
	20:jjU7e/ZfpZa3HEeVPahMnZew2tWAuIj3pueEYkVADKprpTPIzgtUXr2HxZc2wm4HOjMC2Y6q1BDANwQLYCmc6a8vJM8DdUMVtDCWQ1gGIoH8Mgm7fVE8gqp5e6qHRHsPr8nCmdoKMrl25+J6TOomPDGQfOHMCXIbKjTyowUfEYbOjd8rVmMQs5kG0h08sMQaZ4KJpLMgOhfY9oHputOiq91wPFjNUfMAuFy1xdPfkcxLmDrEYlMYISyWRx5uTCC5dcdfAiV6hq0UIZvN04XKVljukhDik0Q3cCcitTDMVQfvWLJ3RXpaysEtTTiS3hotRSwL+vopp66nxuo21jiogYrXAGxvv06JeCKPl95y6zYajkP+KcdfSgvGx/AD3ITzU/VLjxflnRzK61Rh8hmKhIYDde1JCAOFis9E5n4CbL4F5kvlg/p1ODEt7fomUJmxfRXdEGfXeOTy/0M2m8Ub9A2HGnS3gGWHI6tTCuzN5Xm8+90mL7hUen78xkb0R0Op
X-Microsoft-Antispam-PRVS: <DM2PR0201MB0765F79E7E94DDA68F8832F7DC3E0@DM2PR0201MB0765.namprd02.prod.outlook.com>
X-Exchange-Antispam-Report-Test: UriScan:(788757137089)(192813158149592)(127540120423786)(21532816269658);
X-Exchange-Antispam-Report-CFA-Test: BCL:0; PCL:0;
	RULEID:(6040375)(601004)(2401047)(8121501046)(13024025)(5005006)(13015025)(13017025)(13018025)(13023025)(10201501046)(3002001)(6055026)(6041248)(20161123564025)(20161123555025)(20161123558025)(20161123562025)(20161123560025)(6072148);
	SRVR:DM2PR0201MB0765; BCL:0; PCL:0; RULEID:;
	SRVR:DM2PR0201MB0765; 
X-Microsoft-Exchange-Diagnostics: 1; DM2PR0201MB0765;
	4:reEPpWV36TARPtlAykyXp8ZK3udrEuvaehOCBO1iQLivjDDyKsDcJLOO/SuuMy0fZ/V5mKbFi1eS4NhHQAMDxSX4AXvDqwvYKNjs1jSx4HymJ8P96++PyWCEaUjeqJGjSFQIR+/611MOrp5+UeLTldTyiZD+QHjOpGvnelxvyP+TUR4DgEiXAjl3w2cWMIUGsRUidoVBiwStU6SIGd+FuwMeWMwEAqZAs2ivuVWfX93Qg5MsA6lhPgr7vBmDZFr9CuXi5Z4qzmZOXv9FNIFFHhVYz4RvJLbc0W5nxUWzOpZSoC3aXp8wVE2+HaqIl+C4wp4Kyy6dHyHE63jT5nRXOmPo9ZxGf5EM1NXjcF1XuLChFgkkYPRhqIiFc7SujhZxeDFHUQ7alt1f7AYsxJe//7ud/QGwwAAWogUoVvAEfci2g5EwWhKcQAEYViDizGGhgYkHwQWkMR2nmotlqq1PICBEEE8ENfwHIDDORHWOvYTxYQYlZcqyDO+tUh5hqhyzLWETQnWeMXT+kJJ+MqzU3hBp6g7q7JEMu5PQLBoFUySr5YM7Xf5fVNRqNrD9IU926IoWnmPwnhJJByNnVslPP5ab1IRnuQ+UO2PoguE9XLBaHJ1yRlx+nJhtnBWwEzcX3yumvI5gpg2n/LtEE/6FcZ7YSXfmohBfgFZvtOpSHzD3Gh6ehR+ScQe41KmvAUXkJJMF2vT+vDxt+nGOS6skS2rYbw/mJ1fNwC+zEcvdYiSfJtCDOZhNEbFrFSz0EcfLgOyx2jz8Wwzn0U9kz6LCHQnlK7SqsUl4rH67vZCi0lIhEkd8rl9kkPYp5tD2Rxe6ROseIj/S2tcM6s/NHvtQ6l5Ill2U9rn5zts4mpP2z8c=
X-Forefront-PRVS: 0256C18696
X-Microsoft-Exchange-Diagnostics: =?us-ascii?Q?1; DM2PR0201MB0765;
	23:B+8jDFzpuIcIjYknZY4/nopyldcaB0Ado6LJUYO?=
	=?us-ascii?Q?O3a6+DnX0tbxc8QG72kYgml6Z9a0zB+1K4lmGafCpgSBafAzRVf2p7cdS5jX?=
	=?us-ascii?Q?sPnN5nOGC27eiHzLIbTX1gJxfHnFvtNTpSdvi1I2jBMmtjohKxvVvoPZOCAZ?=
	=?us-ascii?Q?ZrtUWUyzwo3BAbzieLyZaP576x/iNDt3+fwLxMl8VYWCP36jDh/Qx7rSDEen?=
	=?us-ascii?Q?03Up8M78pGwLkzPserSH007UG4KKpfhryPAwVImcO+WtGdhVffbX8Yi2ZQTj?=
	=?us-ascii?Q?r/MSI0FEXT6JzIirOAgCSQ6WztQvXIYo6hc5SJWnyFFvJEjh06NB99Lj1Mwu?=
	=?us-ascii?Q?evIb7NwoY7hmN2gg7m1G9fVT66zVq8/g8oXwoAA+8XAxRHECDCOvAXHEu1Ea?=
	=?us-ascii?Q?Tn7SLRwHVcb3+J84y75WiFh8QTjhbMGfr8cnH0nzPjIfG2dPgDwi1NRQ/OWa?=
	=?us-ascii?Q?yAWcoPqWG6+XVBRc1SJ3/p0h3i3fcyxq42NGK1f9qxJcAKPRNXrTOYa0ILGU?=
	=?us-ascii?Q?UsYwEcZCoQ4Ddldzze33NLQ/YWWCsy60qNuq3APQBO0Ot7NHglaKWUdb5dJ0?=
	=?us-ascii?Q?CVy/jn/iTihMTgahxqGCaKfp5bzrrLF+XEebR9GITcIUMbUQessuY8tLLJJM?=
	=?us-ascii?Q?Z544P+OEftL0b5i5F6OITh6QVMtn6uICcAWGVs0EgSm/oG7peInkRHswadqu?=
	=?us-ascii?Q?bsZkFCKFHaI47q/xEi11fe5kGPzdx392taSSU+8R0JgYUFRxJsylNg2UVjKP?=
	=?us-ascii?Q?dF9oU1OFFoU5kFLWfOdU39tWNpr3tdaTOYAD5I0p8fmriadr90tcwwwnxq9b?=
	=?us-ascii?Q?e/1As2KIhuw4P7g7eFMSayxULxUbZ1btZoySfpqbnIuz1xaD+0397rBUOBmS?=
	=?us-ascii?Q?ebLTKFHV2Sw/RYGYOEhG6h1I6qMpkunv7w/Qvb3w0+Wbu7sbc3hJw2qX80IJ?=
	=?us-ascii?Q?0jX/q3RcpD0kI/xWaPjRLpr0YvtqztdVqYvXiqTGdiR8fQPUtOQHUl2LGTlg?=
	=?us-ascii?Q?JofFwX0KBMzO1wZ62P52juh4rF5Zryu+25t5PzOLmqQlBck9DPwmk6szvtqj?=
	=?us-ascii?Q?r40g+KVqGZl1pDF0ygtZ/WNGhCqWy?=
X-Microsoft-Exchange-Diagnostics: 1; DM2PR0201MB0765;
	6:BgfnH8bxTdTCVJD6SqYj9epEygSJy1YB1n5KsPqQx4+sbFBAY5CqibcR2VWbhABOx2VPUy6dYCaFRsQqjxzr2kPkS4OJxdZXweSZXQw0nz9xC7QYCHRh2bvlhvH9VnKet8/OPC+EeJe/LO22nZrktgFZrwr2J/BZtVp/XxWClsyGCIGtMbePHJoXeSBE3snAOLFKfS23ezVZLhGL5nNKPbEit0N8TzTqFiEsnD2mCAzHPX9a3IC3UeDHcxm/bTSTXz0VZRTmGpsYykds1IIKz6QWYVH1Cjb/+D6KORE2R3FfMydZDjw8YBy4iNgnMesAQ/N5VoXWnP3d8sQAbN8l47Z8Qw9bihxgTDD1iH3582HIuaPERMRiLsIuFmCiIaZNjrm+AoSpmCS7Rx4eGhbeQV2BQF2imdDTwMaYIyrz8q4=;
	5:VcjWRGA7/jOoXzgAYdiKptRunHRCqQFBvFsTXq2TZXsr2sbDLqyo5g9nCtPti/8DYjOAn9uhBdrAQGIOnDlHcapwOr7zS4AQqBLy4oHO461GYNHr9cvoEcM125DhXbDNZuPYIdMxvVcGbKgaLLYCqg==;
	24:FkIW2/GE4spJfzgkZIwzPT/hOhy3pJDA/Gac+y6oyaxKJ3nlmVQwcb9ifuA+MV3FtP0yJDmmq25j4pJOhh0hGwoJ9bpNzDbQA2/+ai6uaU4=
SpamDiagnosticOutput: 1:99
SpamDiagnosticMetadata: NSPM
X-Microsoft-Exchange-Diagnostics: 1; DM2PR0201MB0765;
	7:A53WSfSqcQ5Tc9032xShke1/PSTPJzCw8GQEkgzd6HphLl1cGT+OaDcq9RLkRfihLMPr/j5RJs5tmDbpkPpZ+t9MohPVKuoE1JlwGRtj6HPkQ4/0xqp5NBWntGhR0N1ka9io7S3t3eabzb3uY3vJY3+mxnVzn5kkTyMscy+y9IuDQ/rk5smZF20Kbxc33TOJiOQPJKs/joOF4Uf153KTYHqlcHtqsH3YkU4i6sXuaaAOiT4BYEOjwjHN3ZudxkMH5uAj1ulZgJs5WuUbgscaQ/yp23uEexDXvkQ0/Ti9wxxwrRMDTiy89adS3wcqR/H/4CGZHjT5Kp4l/4e4C91fsw==
X-OriginatorOrg: xilinx.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 24 Mar 2017 16:14:47.4079 (UTC)
X-MS-Exchange-CrossTenant-Id: 657af505-d5df-48d0-8300-c31994686c5c
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=657af505-d5df-48d0-8300-c31994686c5c;
	Ip=[149.199.60.100]; Helo=[xsj-pvapsmtpgw02]
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM2PR0201MB0765
Subject: [PATCH 2/2] runqemu: Add a background command option
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
X-List-Received-Date: Fri, 24 Mar 2017 18:46:51 -0000
Content-Type: text/plain

This allows callers to specify commands that should be run in the background
while running QEMU. This can be specified by assigning the commands to the
'QB_BACKGROUND_COMMAND' varialbe in the machine conf.

This is useful for starting automated debugging instances, automated
testing instances (using QMP) or other servers/clients that QEMU can
connect to.

Signed-off-by: Alistair Francis <alistair.francis@xilinx.com>
---
 documentation/ref-manual/migration.xml | 2 ++
 scripts/runqemu                        | 7 +++++++
 2 files changed, 9 insertions(+)

diff --git a/documentation/ref-manual/migration.xml b/documentation/ref-manual/migration.xml
index 2bdb542..15db364 100644
--- a/documentation/ref-manual/migration.xml
+++ b/documentation/ref-manual/migration.xml
@@ -3581,6 +3581,8 @@ $ runqemu qemux86-64 tmp/deploy/images/qemux86-64/core-image-minimal-qemux86-64.
      QB_TCPSERIAL_OPT: tcp serial port option (e.g.
                        " -device virtio-serial-device -chardev socket,id=virtcon,port=@PORT@,host=127.0.0.1 -device      virtconsole,chardev=virtcon"
                        runqemu will replace "@PORT@" with the port number which is used.
+     QB_BACKGROUND_COMMAND: If specified this command is run in the background while
+                            running QEMU.
             </literallayout>
         </para>
 
diff --git a/scripts/runqemu b/scripts/runqemu
index f76d976..b5cc56a 100755
--- a/scripts/runqemu
+++ b/scripts/runqemu
@@ -1118,6 +1118,13 @@ class BaseConfig(object):
                 kernel_opts += " -dtb %s" % self.dtb
         else:
             kernel_opts = ""
+        background_cmd = self.get('QB_BACKGROUND_COMMAND')
+
+        if background_cmd:
+            logger.info('Running in the background %s' % background_cmd)
+            if subprocess.call(background_cmd + ' &', shell=True) != 0:
+                raise Exception('Failed to run %s' % cmd)
+
         cmd = "%s %s" % (self.qemu_opt, kernel_opts)
         logger.info('Running %s' % cmd)
         if subprocess.call(cmd, shell=True) != 0:
-- 
2.9.3


