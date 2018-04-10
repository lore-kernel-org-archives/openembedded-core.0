Return-Path: <JAEWON@xilinx.com>
X-Greylist: delayed 2048 seconds by postgrey-1.34 at layers.openembedded.org;
	Tue, 10 Apr 2018 22:01:03 UTC
Received: from NAM03-CO1-obe.outbound.protection.outlook.com
	(mail-co1nam03on0072.outbound.protection.outlook.com [104.47.40.72])
	by mail.openembedded.org (Postfix) with ESMTP id 1726772002
	for <openembedded-core@lists.openembedded.org>;
	Tue, 10 Apr 2018 22:01:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=xilinx.onmicrosoft.com; s=selector1-xilinx-com;
	h=From:Date:Subject:Message-ID:Content-Type:MIME-Version;
	bh=q2GCCrKXPpnL1iCYV17R0edZJ692MGCjwdi+rMu1AWM=;
	b=ExWD8jhxNTwx1aa89H7sDcd9O0/95IP1eduv3oih2eZARtqIP1kvvEEnFDUjJo5tLJzloaWrCGU7l/l3d4xf6r3pov6hMycnGK0u6aYOfC7cfJGKg4+y+pvmR4IAccXxUoZllxXvigWoksNq9x9rafmXWhZ9O4QtpOPh9rgsYWE=
Received: from MWHPR02CA0035.namprd02.prod.outlook.com (2603:10b6:301:60::24)
	by CY1PR02MB1399.namprd02.prod.outlook.com (2a01:111:e400:50f3::20)
	with Microsoft SMTP Server (version=TLS1_2,
	cipher=TLS_ECDHE_RSA_WITH_AES_256_CBC_SHA384_P256) id 15.20.653.12;
	Tue, 10 Apr 2018 21:26:55 +0000
Received: from SN1NAM02FT028.eop-nam02.prod.protection.outlook.com
	(2a01:111:f400:7e44::203) by MWHPR02CA0035.outlook.office365.com
	(2603:10b6:301:60::24) with Microsoft SMTP Server (version=TLS1_2,
	cipher=TLS_ECDHE_RSA_WITH_AES_256_CBC_SHA384) id 15.20.675.10 via
	Frontend Transport; Tue, 10 Apr 2018 21:26:55 +0000
Authentication-Results: spf=pass (sender IP is 149.199.60.83)
	smtp.mailfrom=xilinx.com; lists.openembedded.org; dkim=none (message not
	signed) header.d=none; lists.openembedded.org;
	dmarc=bestguesspass action=none header.from=xilinx.com;
Received-SPF: Pass (protection.outlook.com: domain of xilinx.com designates
	149.199.60.83 as permitted sender) receiver=protection.outlook.com;
	client-ip=149.199.60.83; helo=xsj-pvapsmtpgw01;
Received: from xsj-pvapsmtpgw01 (149.199.60.83) by
	SN1NAM02FT028.mail.protection.outlook.com (10.152.72.105) with
	Microsoft SMTP Server (version=TLS1_0,
	cipher=TLS_RSA_WITH_AES_256_CBC_SHA) id 15.20.653.8
	via Frontend Transport; Tue, 10 Apr 2018 21:26:54 +0000
Received: from unknown-38-66.xilinx.com ([149.199.38.66] helo=xsj-pvapsmtp01)
	by xsj-pvapsmtpgw01 with esmtp (Exim 4.63)
	(envelope-from <jaewon.lee@xilinx.com>) id 1f60n0-0000WM-Js
	for openembedded-core@lists.openembedded.org;
	Tue, 10 Apr 2018 14:26:54 -0700
Received: from [127.0.0.1] (helo=localhost)
	by xsj-pvapsmtp01 with smtp (Exim 4.63)
	(envelope-from <jaewon.lee@xilinx.com>) id 1f60mv-0008Ps-Gs
	for openembedded-core@lists.openembedded.org;
	Tue, 10 Apr 2018 14:26:49 -0700
Received: from xsj-pvapsmtp01 (xsj-smtp1.xilinx.com [149.199.38.66])
	by xsj-smtp-dlp2.xlnx.xilinx.com (8.13.8/8.13.1) with ESMTP id
	w3ALQmLr016553; Tue, 10 Apr 2018 14:26:48 -0700
Received: from [172.19.3.42] (helo=xsjjaewon50.xilinx.com)
	by xsj-pvapsmtp01 with esmtp (Exim 4.63)
	(envelope-from <jaewon.lee@xilinx.com>)
	id 1f60mu-0008Po-KJ; Tue, 10 Apr 2018 14:26:48 -0700
From: Jaewon Lee <jaewon.lee@xilinx.com>
To: <openembedded-core@lists.openembedded.org>
Date: Tue, 10 Apr 2018 14:26:47 -0700
Message-ID: <1523395607-4898-1-git-send-email-jaewon.lee@xilinx.com>
X-Mailer: git-send-email 2.7.4
X-RCIS-Action: ALLOW
X-TM-AS-Product-Ver: IMSS-7.1.0.1224-8.2.0.1013-23620.005
X-TM-AS-User-Approved-Sender: Yes;Yes
X-EOPAttributedMessage: 0
X-MS-Office365-Filtering-HT: Tenant
X-Forefront-Antispam-Report: CIP:149.199.60.83; IPV:NLI; CTRY:US; EFV:NLI;
	SFV:NSPM;
	SFS:(10009020)(376002)(346002)(39380400002)(39860400002)(396003)(2980300002)(438002)(189003)(199004)(50466002)(5660300001)(8936002)(2906002)(2616005)(81156014)(77096007)(26005)(81166006)(72206003)(478600001)(426003)(1857600001)(305945005)(8676002)(8746002)(106466001)(6916009)(63266004)(186003)(51416003)(336012)(48376002)(50226002)(356003)(54906003)(59450400001)(316002)(5890100001)(36386004)(4326008)(36756003)(7696005)(575784001)(107886003)(47776003)(9786002)(106002)(126002)(486006)(2351001)(476003)(107986001);
	DIR:OUT; SFP:1101; SCL:1; SRVR:CY1PR02MB1399; H:xsj-pvapsmtpgw01;
	FPR:; SPF:Pass; LANG:en; PTR:unknown-60-83.xilinx.com; MX:1; A:1;
X-Microsoft-Exchange-Diagnostics: 1; SN1NAM02FT028;
	1:Qrhvjh5RUr86RRCTVgEyYYNeYp964f/o0YhpSoP1nnf1Sw7eGCFOv532SJibdIJ/jg6L+IwTOFEWUeW07wvL9L6FIXZZArPWynloCKxMHFUaOU+VdmUjNACbXcORaV0n
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-Microsoft-Antispam: UriScan:; BCL:0; PCL:0;
	RULEID:(7020095)(4652020)(5600026)(4608076)(4534165)(4627221)(201703031133081)(201702281549075)(2017052603328)(7153060);
	SRVR:CY1PR02MB1399; 
X-Microsoft-Exchange-Diagnostics: 1; CY1PR02MB1399;
	3:rM1231+YovlMmWaoghsf4S38NzMraz9StrK1SGB2BOSzz7ETv1pfX4QfEEpyIRd3CQjvXSLFHCzamF8ZjdBFB+i6ycxzH66xcFPt10Z+skZ0FCsckJAps3PVY39dqTSaxNtWH0ywvjQYSFV6knqnYHpHc0g3li0YDjHAm/wxN8spUdh6rq1ei4UdJK8SK7upMJRpVgs4ODhKGKvIu5NRYq4rGJDMsm12bTQfuH0s680OOqFEQ7KqS61/XyTHGuEePl2qWPe+Js+Ri1yy1KdXl5h8kTYyBQqvg5UxlAaJfwtRkHvoJY9KlwyWsnD2BmxsNKRGBJL4NgsIqN4JJ1L4pKqqpumxXvr7JMXchCcd75Y=;
	25:YY5Y5WpaJDIWgPFKaorXDGC4F+Mp6XsGKb4ga6XmWcJeUksgRWQVYDJenWqwlEdV8bUbHl12bFXrhuQzLiCNJftgsYhXDQC3EFOACHWT+VmpeRXl08XHaMtvYRrnmR4tcgcZNMoBadggt7CQ1Pi6O+/DIoLP9yyaApFOBJ4aVkHvnBc9+H+6BI8lh+OdNICOx+mwVfqu1aqi0WvdEaeFPCJoLBkG/oy8CpWQXR72bze0SvjuIYQEyGwCpAqhz8kBWYT0Iv2vktUmeCdAXqLRJ2/0virLJ4mkOkpbbl9G2lZhySsH2QAosO/FnTymNEDWTxXYIBy2b0PcK+hsmsrc8A==
X-MS-TrafficTypeDiagnostic: CY1PR02MB1399:
X-Microsoft-Exchange-Diagnostics: 1; CY1PR02MB1399;
	31:YQxHDQVaiEEUELBln7qNT7AM3nvl19llROxTrH561jwchmha/h9RCtIAxKFwh/KZxviekvqvrgmOWAtVQkjJYOBAMB2bJH/BkonCbFI4V7ixYKcO8PAGD8phDS6NyaU67/mWh8gF3xUsZKUB7owlJqJgGj2fIHbjp9AY2sm3LSeNhWn86PROIpEej9xulKYQvjMhWZkqsUm0mwSZs9D8XfZshulC/I94/Htj7fRxa9k=;
	20:0SnJ5Ki/fmZKFGanwRhhrB6FmR9Uwob85KUZRlWWAh+xKBy+adYsXMQXIwYhxMJmXkfCGTK1hYW7kD5g9z0+biEtqHYYkjIKkIUV9+LQT9L1BjqP0W9E9r5AhLFfNb6IabnrdtDjvbZX7F150TlqL9byXeWTPrtEUW0s3WAW8xT6whdItNFyQVz9KR6+8onbNCQ9XfR8DIfVgBm2e8owOwzITRY0pSRwHwH6dSAPc+uZ5uoemkHczQ/3mXF2eyen6G9cvahOX+sNkSLDVHCD9FvjtvT2bfGFEWpxUvrTekeGsNbAsR+GscTPXuLQDadsTsSgBsY0Q1zxaKPmrVoHF6Ae8+lZLHDgJqyA8OaAvJjG8cG++RrgA3AM2GMZkyIzFST/USKsfvo4hdpYelTC4ok0Sj3q2QjwNpG02uRVhRp67R3KSgt/0bfavg6nHmGHlXuLPnCrvde9JDG5HSEFg70Elu+3IhqbH5Z2ObSEUqWL1X1ubxUaxm58oo9h7NiI
X-Auto-Response-Suppress: DR, RN, NRN, OOF, AutoReply
X-Microsoft-Antispam-PRVS: <CY1PR02MB1399EB7EA9FE230D6CE89DB1AFBE0@CY1PR02MB1399.namprd02.prod.outlook.com>
X-Exchange-Antispam-Report-Test: UriScan:(158342451672863)(192813158149592)(17755550239193); 
X-Exchange-Antispam-Report-CFA-Test: BCL:0; PCL:0;
	RULEID:(8211001083)(6040522)(2401047)(8121501046)(5005006)(93006095)(93004095)(3231221)(944501327)(52105095)(3002001)(10201501046)(6055026)(6041310)(20161123564045)(201703131423095)(201702281528075)(20161123555045)(201703061421075)(201703061406153)(20161123558120)(20161123562045)(20161123560045)(6072148)(201708071742011);
	SRVR:CY1PR02MB1399; BCL:0; PCL:0; RULEID:; SRVR:CY1PR02MB1399; 
X-Microsoft-Exchange-Diagnostics: 1; CY1PR02MB1399;
	4:8B9ee7qxAwjDmGHbaDeeJPJ4oGRM+gCzRwDHmk1V3ge0Z+X0SScbDicSZ8PbM130sHt11c03gafsBh8JM5BdXzLZuXFN+RyXXkWvL2se+cniwOflI2wUrcgDJjDD3ACjJLCOFYR8HTI93ozxEOQhSBBJLgg9LVzwVJfXiIWsneK4CsHYVS+Ja3ODOaBjd57/O/KuZrHkDfQqTwM5PCfAU5Gx6GUK/GjW0hxgyyoGj95rjIWwHS7lKt+DaGSlvRHiQbyLf/Onoq8LzW0tvRTL+ALMsIgryAG09bVEWynPa3ZFAuKW4W/ZpkIT2CDi3hPzNtLfv+NYJ9b+MekYvFGh2thET7/BwsB0ItvAsktLB4ZskGsoCnsUUEtiZBrwDkWv
X-Forefront-PRVS: 0638FD5066
X-Microsoft-Exchange-Diagnostics: =?us-ascii?Q?1; CY1PR02MB1399;
	23:YCtdIw9F7NfCuiCt4KICMa++BH9vORu99ppzQYuVC?=
	=?us-ascii?Q?2lnMzVg1jLlm66juupDrbDGKUu04H4NBWmDeiN0KcUD4XJVoayyJA+n6VFv4?=
	=?us-ascii?Q?1JRBbUJULchChXHpZy8bje1aMVaLn4LItrrK+CVs1+jCXDkToJyDROdTIggV?=
	=?us-ascii?Q?ImtonzJGLT92LQq4djD/xAl40fjSvrxAkS97pI9ueHsccOc1AiSonSXg43a+?=
	=?us-ascii?Q?VLPrJv2Qc9xLLxEJv/MncsaaarsaY2Cgy7Ou3DnBz7sFJQNLKEduclXL2VeS?=
	=?us-ascii?Q?3JmMVQ96LDeri81z/0TyG7SLlLEFdIlhPCWSZ6LJNNjR2D854oXNFOUZG666?=
	=?us-ascii?Q?gN14FxyYHaztzfbC4vv94T0y1cw+TWMfbUa6lQ6RIKTrCwezq3SNnUS8bKxn?=
	=?us-ascii?Q?KFssW/R8pl2IIxCupEkBnnh9IABirps7e5IeBgE08M8500aUsGLYwOSsjr7T?=
	=?us-ascii?Q?ICHt0HuZ3WXE8nJXxx4LJGAK63I6dQmvt/JSGj9FihT5OO7QM1Ub0yy13akT?=
	=?us-ascii?Q?o5EbWMYp5hP/dBqyVoXUTkTRAJkT3l9q4sA1HxHbqmEqTytQVdM6B1UKH93f?=
	=?us-ascii?Q?s8+3ymQFv16vTroqyJg1bs19bmzkp25iwsSiLurm82RJqkEcpOAha/Ql0bcP?=
	=?us-ascii?Q?Hjt93mV5uj9P4d8HhxUgsIaMo0Gjr2YSrlaB04PuqBNtxc4ogYl/HnQq0L7p?=
	=?us-ascii?Q?/05aaVXRvTy0rDpPaEBDgtNxcuAE5QPszOeqnI1HKbw4pCUSBD9kolT7vtZH?=
	=?us-ascii?Q?cy5y1RXlLFCw79MoYEprX5bq3XhuVA95Z7zWto9Rpc7clvntBE7eu25VOmYv?=
	=?us-ascii?Q?pPnRs/pnl7XddUg9Ko4PIhBZgR6glYGA83vlYvXjDZnBu7Ky4a27bEo9ixx/?=
	=?us-ascii?Q?USjXa11Spheu7gdnTh8UCEnVcrsf40c4wmkRnGk3kCbK8vbr/1FRHbhFKioz?=
	=?us-ascii?Q?G8rz0yRLANOkn8ot6S4ziKVxcAHwMZ5pbNebjvL387rMRj8DKpKd7j9SVUwp?=
	=?us-ascii?Q?Fny5WCuASCJil+fUMdsfBuL0u4ZDMUgqDAjcopzRzuhN6wVd5bQKv/W1j5mF?=
	=?us-ascii?Q?xUQms64PF9OUGmeMmxHQ6tcEjrir2G2DqOGWhNhixp2LmTxHibc+WkkZIpSe?=
	=?us-ascii?Q?KRHX4QHyE4BE+gsIjcpo2B3Ycinzu49mNzi9fgdNGxU0Hn5NQaMSRuCj+SZ9?=
	=?us-ascii?Q?vg0oafysvgQ2n4=3D?=
X-Microsoft-Antispam-Message-Info: 50bbvxhHtTn3tVqmXXci4PQki3M+a0TCKAm1lr6RTl7k97WZePDkp2ryxCfBX3ldzQ3Jv5b1kCz1YcxvWqL3KcuiwzJQAnA0W9CF01hq57xiCRgog7PgUfU5qR0FIqvKR0d8twuDGStNXQXaKXMkAijPXU4iBwJTmvqP2q/kBmgClDo4/ntp9QJck2BK0n95
X-Microsoft-Exchange-Diagnostics: 1; CY1PR02MB1399;
	6:yu0YiDiv+AmyTUomSw44DLEa9CpdJyh5zbMShe1UWY6WW1SnHsdDgAbBaW68Q5pi4ZgvSJcLtoDbuqSTF2+V5maRyvojSAVydQtgWXd96dEBzrpGYrTy2OPN5H16jS6ADNvUPoO0SHM8V115tIJO+FdmxHd+Wv3nAc00NdEldrb4OOeN2D8rHr5FAJskgrf5Fynp+bysV0JEvExly6HMd+wrx221nagoHXs3GkZ9VR3oDD0t95i7UFsDNRbn8In0umOCbfjI1w3OotSVeNnPlFnUUF3qJRHohETd0EWevBzwkxK+1gWHNGxViNwiWPgE/HSJ0FRPsBuZ1RdQPNmpuYMPNt/GpzMY4XsOSAjsTuKaY3e0oQHrW62yZd9x+t1DPaGHULrAfHBGIQsz8PiG1o8JDQ1RLEY2SqJS8e9jdJflm9qsIzxtp2VfglqhI/Kog0nXM92HMrCjfyFOkGGWaA==;
	5:+tfTj/Cq0tuTlM2kvbxtrlKO5aVXcoItkZF+ymOq7+07ip6fA/Y95AnYuEYRs6+F/ogBChdyS0AdjkxvpBv5ArT7LT2tBjdKoOFwOFJ2sS7Xeuc/VfYxagaKaYo+mgZgiuVxjr6g/mCymOAY4qLwM+tn9jJOyHZfJQKlkWp0I9U=;
	24:eexZ8H/LLUUiFADA3IxV6zFA41rX+tijOeNyyRb5QDs9t5rU0fOFKHiZCvR4gsqsqMVA+dxr9lgatvLD8zeTjKgMP+Hye+bfLH6g5cgGdAw=
SpamDiagnosticOutput: 1:99
SpamDiagnosticMetadata: NSPM
X-Microsoft-Exchange-Diagnostics: 1; CY1PR02MB1399;
	7:OlpL5KnTEAiiL0LyrNnVlDTgxdiL7bpZMLEf9bTIlZL3Qll4ZYZZt+DDfagm7fqJkfQAdU1yAfmBaisE3mn+y2pJlIeexlgELbFdqvBCh8VwGlZ9WKeGJaEKu6sspg/yT2CP6ccIK3d+P/0OKASC9kXfELEfFHhFvBVOKb+MKNqY1eKSCsw1d7tReq5qxvT/wjApiRKOgg6Hxb0ge/2iEKX5ntlvAzSEXu3g2IF95yVu8aCIHjVQGvz+bNmTXd2n
X-MS-Office365-Filtering-Correlation-Id: f08bff89-21ab-4a74-3017-08d59f29c8a4
X-OriginatorOrg: xilinx.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 10 Apr 2018 21:26:54.9909 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: f08bff89-21ab-4a74-3017-08d59f29c8a4
X-MS-Exchange-CrossTenant-Id: 657af505-d5df-48d0-8300-c31994686c5c
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=657af505-d5df-48d0-8300-c31994686c5c;
	Ip=[149.199.60.83]; Helo=[xsj-pvapsmtpgw01]
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CY1PR02MB1399
Subject: [PATCH] gconf: fix saving of settings when config folder doesnt exist
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
X-List-Received-Date: Tue, 10 Apr 2018 22:01:04 -0000
Content-Type: text/plain
Content-Transfer-Encoding: quoted-printable

In some circumstances, gconf isn't able to save configurations
because ~/.config folder aka root_dir doesn't exist.

For example when saving settings using matchbox-appearance,
the following error is shown:

GConf Error: Configuration server couldn't be contacted: D-BUS error:
Can't overwrite existing read-only value: Value for
`/desktop/poky/interface/font_name' set in a read-only source at the
front of your configuration path

This issue was not seen before because ~/.config directory is shared
between several packages and one of those packages usually creates it
by the time gconf wants to use it.

This patch makes sure that gconf creates the .config directory if it
doesn't exist, along with the gconf directory inside it.

[YOCTO #12632]

Signed-off-by: Alejandro Hernandez <alejandr@xilinx.com>
Signed-off-by: Jaewon Lee <jaewon.lee@xilinx.com>
---
 .../gnome/gconf/create_config_directory.patch      | 28 ++++++++++++++++++=
++++
 meta/recipes-gnome/gnome/gconf_3.2.6.bb            |  1 +
 2 files changed, 29 insertions(+)
 create mode 100644 meta/recipes-gnome/gnome/gconf/create_config_directory.=
patch

diff --git a/meta/recipes-gnome/gnome/gconf/create_config_directory.patch b=
/meta/recipes-gnome/gnome/gconf/create_config_directory.patch
new file mode 100644
index 0000000..e02932c
--- /dev/null
+++ b/meta/recipes-gnome/gnome/gconf/create_config_directory.patch
@@ -0,0 +1,28 @@
+Upstream-Status: Pending
+
+In some circumstances, gconf isn't able to save configurations
+because ~/.config folder aka root_dir doesn't exist.
+This issue was not seen before because ~/.config directory is shared
+between several packages and one of those packages usually creates it
+by the time gconf wants to use it.
+
+This patch makes sure that gconf creates the .config directory if it
+doesn't exist, along with the gconf directory inside it.
+
+Signed-off-by: Jaewon Lee <jaewon.lee@xilinx.com>
+Signed-off-by: Alejandro Hernandez <alejandr@xilinx.com>
+
+
+Index: GConf-3.2.6/backends/markup-backend.c
+=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
+--- GConf-3.2.6.orig/backends/markup-backend.c
++++ GConf-3.2.6/backends/markup-backend.c
+@@ -276,7 +276,7 @@ resolve_address (const char *address,
+       /* dir_mode without search bits */
+       file_mode =3D dir_mode & (~0111);
+     }
+-  else if (g_mkdir (root_dir, dir_mode) < 0)
++  else if (g_mkdir_with_parents (root_dir, dir_mode) < 0)
+     {
+       /* Error out even on EEXIST - shouldn't happen anyway */
+       gconf_set_error (err, GCONF_ERROR_FAILED,
diff --git a/meta/recipes-gnome/gnome/gconf_3.2.6.bb b/meta/recipes-gnome/g=
nome/gconf_3.2.6.bb
index 92fd12c..120ae3e 100644
--- a/meta/recipes-gnome/gnome/gconf_3.2.6.bb
+++ b/meta/recipes-gnome/gnome/gconf_3.2.6.bb
@@ -11,6 +11,7 @@ inherit gnomebase gtk-doc gettext gobject-introspection g=
io-module-cache
 SRC_URI =3D "${GNOME_MIRROR}/GConf/${@gnome_verdir("${PV}")}/GConf-${PV}.t=
ar.xz;name=3Darchive \
            file://remove_plus_from_invalid_characters_list.patch \
            file://unable-connect-dbus.patch \
+           file://create_config_directory.patch \
 "

 SRC_URI[archive.md5sum] =3D "2b16996d0e4b112856ee5c59130e822c"
--
2.7.4

This email and any attachments are intended for the sole use of the named r=
ecipient(s) and contain(s) confidential information that may be proprietary=
, privileged or copyrighted under applicable law. If you are not the intend=
ed recipient, do not read, copy, or forward this email message or any attac=
hments. Delete this email message and any attachments immediately.

