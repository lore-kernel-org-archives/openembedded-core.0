Return-Path: <alistai@xilinx.com>
Received: from NAM03-BY2-obe.outbound.protection.outlook.com
	(mail-by2nam03on0075.outbound.protection.outlook.com [104.47.42.75])
	by mail.openembedded.org (Postfix) with ESMTP id 5CD986FF69
	for <openembedded-core@lists.openembedded.org>;
	Thu,  3 Nov 2016 00:52:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=xilinx.onmicrosoft.com; s=selector1-xilinx-com;
	h=From:Date:Subject:Message-ID:Content-Type:MIME-Version;
	bh=PXZnLu1u92hwvMzH1fCvU6bYSNRf4S8yqYu6moLY/CY=;
	b=xwnkyEKuM8GoTiaz+e28YGQNx9z+k8nfhdh24gT5W1X8zKgfAElH0RST2xSs/w2gGn23wPLMBc6W9v86FfnNrUmeKf1YmWvsy+DeOAyxvODZhiHc++rqRJbGvO3kqqomdFGDrKWgxwAMd10k+021adNCM0KxkWhJG2Ao5v1Od1A=
Received: from BN6PR02CA0064.namprd02.prod.outlook.com (10.175.94.154) by
	BY2PR02MB154.namprd02.prod.outlook.com (10.242.45.139) with Microsoft
	SMTP Server (version=TLS1_2,
	cipher=TLS_ECDHE_RSA_WITH_AES_256_CBC_SHA384_P384) id
	15.1.693.12; Thu, 3 Nov 2016 00:18:59 +0000
Received: from CY1NAM02FT052.eop-nam02.prod.protection.outlook.com
	(2a01:111:f400:7e45::203) by BN6PR02CA0064.outlook.office365.com
	(2603:10b6:404:f9::26) with Microsoft SMTP Server (version=TLS1_2,
	cipher=TLS_ECDHE_RSA_WITH_AES_256_CBC_SHA384_P384) id 15.1.693.12 via
	Frontend Transport; Thu, 3 Nov 2016 00:18:59 +0000
Authentication-Results: spf=pass (sender IP is 149.199.60.100)
	smtp.mailfrom=xilinx.com; nathanrossi.com;
	dkim=none (message not signed)
	header.d=none;nathanrossi.com; dmarc=bestguesspass action=none
	header.from=xilinx.com;
Received-SPF: Pass (protection.outlook.com: domain of xilinx.com designates
	149.199.60.100 as permitted sender) receiver=protection.outlook.com;
	client-ip=149.199.60.100; helo=xsj-pvapsmtpgw02;
Received: from xsj-pvapsmtpgw02 (149.199.60.100) by
	CY1NAM02FT052.mail.protection.outlook.com (10.152.74.123) with
	Microsoft SMTP Server (version=TLS1_0,
	cipher=TLS_RSA_WITH_AES_256_CBC_SHA) id 15.1.693.6
	via Frontend Transport; Thu, 3 Nov 2016 00:18:57 +0000
X-IncomingTopHeaderMarker: OriginalChecksum:; UpperCasedChecksum:;
	SizeAsReceived:1594; Count:17
Received: from unknown-38-66.xilinx.com ([149.199.38.66]:36850
	helo=xsj-pvapsmtp01) by xsj-pvapsmtpgw02 with esmtp (Exim 4.63)
	(envelope-from <alistair.francis@xilinx.com>)
	id 1c25k8-0007S8-4X; Wed, 02 Nov 2016 17:18:56 -0700
Received: from [127.0.0.1] (helo=localhost)
	by xsj-pvapsmtp01 with smtp (Exim 4.63)
	(envelope-from <alistair.francis@xilinx.com>)
	id 1c25k8-0007NB-0X; Wed, 02 Nov 2016 17:18:56 -0700
Received: from xsj-pvapsmtp01 (smtp3.xilinx.com [149.199.38.66])
	by xsj-smtp-dlp2.xlnx.xilinx.com (8.13.8/8.13.1) with ESMTP id
	uA30IkxK021704; Wed, 2 Nov 2016 17:18:46 -0700
Received: from [172.19.74.182] (helo=xsjalistai50.xilinx.com)
	by xsj-pvapsmtp01 with esmtp (Exim 4.63)
	(envelope-from <alistair.francis@xilinx.com>)
	id 1c25jy-0007L9-9H; Wed, 02 Nov 2016 17:18:46 -0700
From: Alistair Francis <alistair.francis@xilinx.com>
To: <liezhi.yang@windriver.com>, <openembedded-core@lists.openembedded.org>
Date: Wed, 2 Nov 2016 17:17:16 -0700
Message-ID: <1478132237-28350-2-git-send-email-alistair.francis@xilinx.com>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <1478132237-28350-1-git-send-email-alistair.francis@xilinx.com>
References: <1478132237-28350-1-git-send-email-alistair.francis@xilinx.com>
X-RCIS-Action: ALLOW
X-TM-AS-Product-Ver: IMSS-7.1.0.1224-8.0.0.1202-22674.005
X-TM-AS-User-Approved-Sender: Yes;Yes
X-IncomingHeaderCount: 17
X-EOPAttributedMessage: 0
X-MS-Office365-Filtering-HT: Tenant
X-Forefront-Antispam-Report: CIP:149.199.60.100; IPV:NLI; CTRY:US; EFV:NLI;
	SFV:NSPM;
	SFS:(10009020)(6009001)(7916002)(2980300002)(438002)(199003)(189002)(229853001)(586003)(63266004)(87936001)(4001430100002)(92566002)(36386004)(50226002)(106466001)(77096005)(189998001)(47776003)(50986999)(4326007)(5003940100001)(5001770100001)(11100500001)(356003)(2950100002)(36756003)(305945005)(7846002)(76176999)(5660300001)(6666003)(19580395003)(19580405001)(107886002)(626004)(48376002)(8936002)(2906002)(81166006)(8676002)(50466002)(33646002)(81156014)(9786002)(107986001)(5001870100001);
	DIR:OUT; SFP:1101; SCL:1; SRVR:BY2PR02MB154; H:xsj-pvapsmtpgw02;
	FPR:; SPF:Pass; PTR:unknown-60-100.xilinx.com,xapps1.xilinx.com;
	A:1; MX:1; LANG:en; 
X-Microsoft-Exchange-Diagnostics: 1; CY1NAM02FT052;
	1:7L/wZC/c21tBNKqEk8szN/d628yCiEJDIm3p5CsZj6gN81xyyHWap7kndwd/x0ew/ZTBAwx+M5bG2thPjej7JiQC9KLKJTNgHGKe7kOaDhiUYm9j0k7tFZeIBgr/GogBqm5v8b+rZnN5WqXM+R7AUifzFEtGs7fJFnNBUVizv9c5HPS9IjhCGFOl36CdiTC7wBUd1XhIbqN43PiL3uVVhuvwtzR0MnJ82Lzwgitq7h83csWLuWn/C14frkau7K3pLambFSpOWKQSHmoHjWkpdg5nSsQ9KxQLDlSqH9sYqzYKDjAFsdyInDByJVe9B0273qMClGNUKGNSfkZn8Kc/F0Ltj+H/6kA8vSoWMo7t5wciMlx+qwtW2ro3rWkcKTa1vXJA6xPEBeqotZoMzbN9PBSCBcYu85eJSjUVhWxpkX8j0N9D8mybBYob9kaytGeGIpSSm1tA+k9O/bxo6dxWQErtZfc4kJYgSl/GXV39alH5MzlcAy6qpWKgHC0Xg0ktjXVNrkJlapc/Re0eDqU3hnd2V6Iyq9EfMxz3mLvODwAFRegk7wmtjAVgFuC1gDaFR9Lidqe0/q0S3Gq4D6JZK5nlqqcLfTp9TFIU4+TkQRo=
MIME-Version: 1.0
X-MS-Office365-Filtering-Correlation-Id: 2912da16-a6c1-409e-5293-08d4037f0198
X-Microsoft-Exchange-Diagnostics: 1; BY2PR02MB154;
	2:2JX5ovu45XkDGf70aYwvsAQfhRh8RsKMpcBFLaoz6gke4GZitntBEEnsroiRAwMq1YrSamcB9XI+FwT9QyWCRTkZ3MUxyLF7s7oJHR3Pj8Airo/SzVb7FQ7K2UkztgT8eLchzL9dKmoQZXbSmbC6skJ/FtYsNelC8PS35NEm9c8GguhdHIXelwZJGXsyois/LOJ7jVPXmUHTYXYrZlg7Jg==;
	3:wPYqwt62RhlymTHuzqQrSoV6Rk0J0PJUIVJ/pyy/qMzOB/jariJT2GJX0HeTJoiIyR6q5SRWCK6YyG4793wCGO+RBY0cihe1KgACk5cFt87Hgxc9YEEp8cJPbxNNyKTD7BrmoRqsYKb9JWBAlu/0MYJSwV+wgxOULSLlCIVrNBPn2MGhz6q0XAwOSKeEBdb+S4FFugsRd0vjguaMR8ylWMF3vj1v0bnBvjv78np/b8Ci9OtPg6JvDSR4ZhHnF4MpJ0ilvOUZIMReQidYBguL5HrVYkF9TEg/owncEj5dCps=
X-Microsoft-Antispam: UriScan:; BCL:0; PCL:0; RULEID:(8251501002);
	SRVR:BY2PR02MB154; 
X-Microsoft-Exchange-Diagnostics: 1; BY2PR02MB154;
	25:lucGTnAUDk6R/+MUBnZXVAdYMw++DixCijY20yNFyr7qOppeuiIyrU9ZAWOFQthHhSzONTWdEb+tRXWJFzQwJ1HAzI+cIdsW5S5OuaAL41JPe7X5MnMaURDul5cdwhC5LgDYhhra/0fh/xV8bl0K0gzC0mjSXKwUxRVgYmTOMoI8irYb/cgMTSyQFZziDWR+1CCEfTybDYjxdi95dwuK6dkyU3uEFLujsoezqqpCyHDyYESdXXVBhY3TcdibdhXP13SEOAZQajJwvzbJogHgwpwdIWnCzB2hN0Js0BWmEC5fS/TUTPoFHA0y3AarTwPogxo7iUypieXJiASDkb0H49+5+GESDMMWaVNmnW/2m8wwG51E55jxy6OZnWmXRwrzy8qfAY5psP5YsHYOYz7UyS3/JXm46AYcTPI2uMoGH0yaxq0tj9HL8StvxFzgJlCe;
	31:eDbBz3xIpclu0uf3TmN5WN5njseV2p2Ur7HVHp3PScf/nlSsACqM4mQH18Qc9hoHnXXw1zMiTIAbvIhcYzTU5+IroJZBwlWIf8agqmsZbHw+5aYgvSGwNoCNgYenqmdQsf6tXKiZ3Hu7rmC4J57p+HQ+dBBT2sFzy6x/LEYUJzg8SKuhrv4ceqs5UT3EiCekK6kJQnhFTJaaXJJt4nuO4bDy754TVl8og22z3RNbhy7jpabuhbYnr+vKB3d53Tcn
X-Microsoft-Exchange-Diagnostics: 1; BY2PR02MB154;
	20:gkF7MBoyRBF3yMdLoQIy06YFQPzIsoJSVCP6ycGSEkb/sdkOiYb6u0npyMuBeM20OyZqIzvZifEGT9DDrl9WsGIjSscxmhHkA0GEd/7DR+UXRYWcA1EzHukYHC5WqN/mPPY9QAW4EktaNeMkVo0aoB2afWZe/hAce89S5+5svnK+bei9WcZgLc8fiurDoNPdDIWTcU/Rgc15CTHxejmK2GBTlSNkQ4q9BH9HNKj3UkgYvAbJzZ5ULpT8PQDbU7PojyMHDk2rqBIkVzicoP+DM0u5oajp2K74cXQLzwPboIKjzLKfT4zOpK54tgAFAZgaxbsB062z3O/n0iofN1pm774e36iQZVbUwHSOIqJdhodgRFD3RQ2avIhuz6t8xu+DWXDaJnEE806dq/mVo0GQOK2fTchrunfsUWe/VmJ0jIjunECg6vjswP9Tb+VWdCTG2/aGgqLC0iBpaVTW0IlnS5AI1VY8hXvr16woV+VZX1MloVD7JXSMDJrH4Lt9iRE3
X-Microsoft-Antispam-PRVS: <BY2PR02MB1548497C6507E097A4694E6DCA30@BY2PR02MB154.namprd02.prod.outlook.com>
X-Exchange-Antispam-Report-Test: UriScan:(192813158149592);
X-Exchange-Antispam-Report-CFA-Test: BCL:0; PCL:0;
	RULEID:(6040176)(601004)(2401047)(13015025)(13024025)(8121501046)(13023025)(13017025)(5005006)(13018025)(3002001)(10201501046)(6055026);
	SRVR:BY2PR02MB154; BCL:0; PCL:0; RULEID:; SRVR:BY2PR02MB154; 
X-Microsoft-Exchange-Diagnostics: 1; BY2PR02MB154;
	4:ikupoPmfbjAUhMN6LtZereFguNiXQbNkOeV87VK3K7IHrIK+dEze1e2ar4nD4KpEHL2NcxBjQVV0zOahWYEebGF6UvjRu6P8WrUWpWECSshcZC//y05Cv7Zryl7QlZtQe5AIicC8mVSKi/LUx6KP9fvo/j3fdlVkEIabCP41V7oPTi3mQqUONGxYDAo9jh70zff8GSyTEhsc0LZWxbGGUJqI+OM1lIDwdn6rlWqV10D24BPNC2fm5qPlY49uLxxGxzeNIvPjFUAPY6XKXKtV736kNMuLEBT+820vxtlFbLhXewNoBKEbwEyPvY07rV7yW+6xfn47XmVXsYvRvR7VisdDM4j1+FhP85SjkpeO2gJpyt7gtYQZq3ZSaTM/PrmDw/3Cr63H3kE9DiL4emav3Hl1pmt5Vdk8vAVvbha2qN7AX3/bq3bg8TW0b9g2YEM4Pc4evcNzYUT7zO+i3+jPACRMZ/uXfgLxsIHs7wi088jR46TiggaJQLkM9dncrI+egSSCD0pYwya8doiCidCUu4zCGIKwDpFA5igj7OALatcjuUxqSDizhbU46Vpv+Wha
X-Forefront-PRVS: 011579F31F
X-Microsoft-Exchange-Diagnostics: =?us-ascii?Q?1; BY2PR02MB154;
	23:n17BitwXw2Gjfz5A6SzkGVg9/gLU9In9ngQJIGC9P8?=
	=?us-ascii?Q?ytD+/INtqq3KX4uqC3Sd4Bx9NXi0GZlsWZKsqCk8vScVXjBICEDnQSIYZlE7?=
	=?us-ascii?Q?OTC3NSqn9pW+zW4w2ceisY+BaV3lECqp0YqfONvs/btIrjdNHv2LzedyhXkH?=
	=?us-ascii?Q?9gHSyfWKM04y6idEaNouDgeIRhRXWFNghnP55qKtdFGbYasAgI+kcuOl8PhO?=
	=?us-ascii?Q?htQ9ViCqEbAuTiYOyUExzpfPM6PiH+p9uF2cTiTxF6zfsYHCNmpHGePbTgPp?=
	=?us-ascii?Q?4Px/p0ORfKbFAYiKrFNOksDGUG9My23HLRedkxKmjKTBS7rMTaglaza8kfBa?=
	=?us-ascii?Q?AstL8RM3Kcts8pSILtrEaTnFGlhcs1N4vQvFluIPn9nU+mkfu9kp9tbLQfd5?=
	=?us-ascii?Q?/A0uWaE4kvAQZYlaiOZ8ICQxxRwZaywi4IfOwopSh02ayuOsssiBRsCmGxsS?=
	=?us-ascii?Q?hswLT72Z801PcmF2UUECtKhFMlcIyGvtMsGdo3Q8nzFWSsgRkPiQcO3nLF8T?=
	=?us-ascii?Q?sgzrItTrzMNsWUDRXOBS30hjXH/tO1WMUClvWoWKNainqeMg5HLb/Je/W58c?=
	=?us-ascii?Q?YmCdoLj8Zek7+GW7+88yRx7BVI4CqGpVwLbfSlzbP4/LqFSywSlWwp+34VSP?=
	=?us-ascii?Q?fmH+pVk46z8EFGCMfGr+4DW93noKgpZ8WTfx5GERKasOeRo5tSMHeqWJ/W8J?=
	=?us-ascii?Q?Y1sf76ZXHLKFDqErwpl3F1lcNVV2qMAzRXkMMXz4zDsT9D73QLP7ynK/GIvn?=
	=?us-ascii?Q?ikbemN30RouaOs9S4RujwMt+SdWkb4tZtNCw1oxby1XwiFtS9pb2y2qsAaUT?=
	=?us-ascii?Q?sA6IiNZth0ZgwLBkNPgsv6AQT9zP3nIUcSP5Lgh51vKe1yf9d2hX1hl4pVPR?=
	=?us-ascii?Q?4MLIVbDlmw4ZzKCMk9EZeaSabY+xBjN5E2xmK+34zruF4bWcgUE09T3W5eXo?=
	=?us-ascii?Q?G5HIke0RnwucDpKw4kqOG/nCkPfrrTAwHOAnpXRPju+lTwLeK5PFDj/xKFaW?=
	=?us-ascii?Q?PYGwpYY72Cs+/7cIwMdATnm8rXjdMHBJwKuPoLuw17z6JEC8SZrN7N0AkV2E?=
	=?us-ascii?Q?6WdqHkyU1i3qp/rhDLrnljZ4SVg+PH1e6tDPchdVaha6ED3dhsHEWZVozN3+?=
	=?us-ascii?Q?rSZpM9zGQ684a+hslZmTnBZOYvAfgP?=
X-Microsoft-Exchange-Diagnostics: 1; BY2PR02MB154;
	6:4o2nl5kT5xfNGy30+7qrX0+jnPZzNBr9xmxwSwGhASGPJN0ju7Tt8OuwQQ0BOhcf9VUvzyqVgimIIp3S+z4hR+bFRjb28rTO6RTgGuD/dDQVJfwePhc7TwZF3+NSrLXxrq/nleglZ/lpkJ52/RUVQg6jnmu7jhkud0fgqI/UJGiy/tvHTezI3qqqIVn4O5YtmUGJAu1oFAcfeP4jeOkUAeckuPpGUYuKhgy0nBOC1kLrGgyfRsOkKj6jJDfUdxEiHYNnjz098TLWxwNLysgnLupF7qEm0wYsDhugw6zP+YVHSK/La4S+XzDkkvX/LFfH2wMafG+b74kj0x48JYv/d9jZVvdMIRb933oAhka7NCc=;
	5:IlbHV2b9pd2I9qbGdFqiAVCj4GPWA+8g7H2TNhVW2ADXGKgqJUyaOGPC971m6pjJE3WFb4LhQHBimOz/OjVYxHL9NXk0HqmRgyLsOj6CdL/wVVCTW4pkvTMzz1Bd3I6rgc4jRXxXaa5v08QbLI8z+eKtb/oIjJDa5g6j9Ar41J4=;
	24:8pnfyogLt8g3TwSaUw9i2QtOI3NJFbo/vKlIKJ1IpFaiariLqDIN8rLE4tw2N/KXgbH7Y47PSvzZeTsUD7OCW7LnB+ZlA+6dubvjow2MAfg=
SpamDiagnosticOutput: 1:99
SpamDiagnosticMetadata: NSPM
X-Microsoft-Exchange-Diagnostics: 1; BY2PR02MB154;
	7:8D5+zpEEw52O7PEYmfYgUt0xzAa5Zm0yxQJ5a1OnT4TaTHRAqA5VaqtChkjT5zweFM5QVNOs5vHHkdhXYtFDYJ8jts6Xnv/A/Z+TWhfPEj21RVJmxq4FvTxSoJBlw9KYbYJFpPD+rNQe5puutkmE6c76R1lA6V7nB3OmmZuGX8LB9kP45pGtqg1UaXdpb2zf0F4Go4oC8d8Br6oVUdUgYxlG5V5k9oRDkycglvTwIH7kUWCcQcVvQ2DZppLSe1ObRKKMMOSpIwyMs00NEJ2922XAnb9Dk9upmX2gLou28kgaafAQmbjiwArxdW93Q6UWsP6/Ov1aMcBaQsH0VaX4YoC9lj9Ojxz2bU8RkYIXARU=
X-OriginatorOrg: xilinx.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 03 Nov 2016 00:18:57.2321 (UTC)
X-MS-Exchange-CrossTenant-Id: 657af505-d5df-48d0-8300-c31994686c5c
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=657af505-d5df-48d0-8300-c31994686c5c;
	Ip=[149.199.60.100]; Helo=[xsj-pvapsmtpgw02]
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BY2PR02MB154
Subject: [PATCH v2 1/2] runqemu: Split out the base name of QB_DEFAULT_KERNEL
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
X-List-Received-Date: Thu, 03 Nov 2016 00:52:33 -0000
Content-Type: text/plain

The function write_qemuboot_conf() in qemuboot.bbclass always inserts
the full path into QB_DEFAULT_KERNEL. Remove this path before using the
variable.

Signed-off-by: Alistair Francis <alistair.francis@xilinx.com>
---
 scripts/runqemu | 5 ++++-
 1 file changed, 4 insertions(+), 1 deletion(-)

diff --git a/scripts/runqemu b/scripts/runqemu
index dbe17ab..922ebaf 100755
--- a/scripts/runqemu
+++ b/scripts/runqemu
@@ -478,9 +478,12 @@ class BaseConfig(object):
         if self.fstype in self.vmtypes:
             return
 
+        # QB_DEFAULT_KERNEL is always a full file path
+        kernel_name = os.path.basename(self.get('QB_DEFAULT_KERNEL'))
+
         deploy_dir_image = self.get('DEPLOY_DIR_IMAGE')
         if not self.kernel:
-            kernel_match_name = "%s/%s" % (deploy_dir_image, self.get('QB_DEFAULT_KERNEL'))
+            kernel_match_name = "%s/%s" % (deploy_dir_image, kernel_name)
             kernel_match_link = "%s/%s" % (deploy_dir_image, self.get('KERNEL_IMAGETYPE'))
             kernel_startswith = "%s/%s*" % (deploy_dir_image, self.get('KERNEL_IMAGETYPE'))
             cmds = (kernel_match_name, kernel_match_link, kernel_startswith)
-- 
2.7.4


