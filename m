Return-Path: <mubin.usman.sayyed@xilinx.com>
X-Greylist: delayed 3629 seconds by postgrey-1.34 at layers.openembedded.org;
	Tue, 23 Aug 2016 10:38:58 UTC
Received: from NAM02-SN1-obe.outbound.protection.outlook.com
	(mail-sn1nam02on0050.outbound.protection.outlook.com [104.47.36.50])
	by mail.openembedded.org (Postfix) with ESMTP id C36E8731AC
	for <openembedded-core@lists.openembedded.org>;
	Tue, 23 Aug 2016 10:38:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=xilinx.onmicrosoft.com; s=selector1-xilinx-com;
	h=From:Date:Subject:Message-ID:Content-Type:MIME-Version;
	bh=2OIYfCgI6qYsp+HUflkhaL53zXVUrjOSRO83QK3Frl4=;
	b=MRzEArhrWkRizxpar+169tjsXeojNImdZpCt53MICsU+5x+AhbLEtLJGm/VMDR/muIbGQ7HCbS09D6qQKo1a+GWKe7Zf+z9Aofo1aGDQ/DLvrZtB1tcE1sF+k92z629ahRrLaW5PoEXRfFLTPeTHs6blXab/PeikmG+PCkhModk=
Received: from BY1PR0201CA0042.namprd02.prod.outlook.com (10.160.191.180) by
	BN1PR02MB085.namprd02.prod.outlook.com (10.255.204.13) with Microsoft
	SMTP Server (version=TLS1_0,
	cipher=TLS_ECDHE_RSA_WITH_AES_256_CBC_SHA_P384) id
	15.1.587.13; Tue, 23 Aug 2016 09:04:04 +0000
Received: from BL2NAM02FT018.eop-nam02.prod.protection.outlook.com
	(2a01:111:f400:7e46::208) by BY1PR0201CA0042.outlook.office365.com
	(2a01:111:e400:4814::52) with Microsoft SMTP Server (version=TLS1_0,
	cipher=TLS_ECDHE_RSA_WITH_AES_256_CBC_SHA_P384) id 15.1.587.13 via
	Frontend Transport; Tue, 23 Aug 2016 09:04:03 +0000
Authentication-Results: spf=pass (sender IP is 149.199.60.100)
	smtp.mailfrom=xilinx.com; lists.openembedded.org; dkim=none (message not
	signed) header.d=none; lists.openembedded.org;
	dmarc=bestguesspass action=none header.from=xilinx.com;
Received-SPF: Pass (protection.outlook.com: domain of xilinx.com designates
	149.199.60.100 as permitted sender) receiver=protection.outlook.com;
	client-ip=149.199.60.100; helo=xsj-pvapsmtpgw02;
Received: from xsj-pvapsmtpgw02 (149.199.60.100) by
	BL2NAM02FT018.mail.protection.outlook.com (10.152.77.170) with
	Microsoft SMTP Server (version=TLS1_0,
	cipher=TLS_RSA_WITH_AES_256_CBC_SHA) id 15.1.577.8
	via Frontend Transport; Tue, 23 Aug 2016 09:04:04 +0000
Received: from unknown-38-66.xilinx.com ([149.199.38.66]:47530
	helo=xsj-pvapsmtp01) by xsj-pvapsmtpgw02 with esmtp (Exim 4.63)
	(envelope-from <mubin.usman.sayyed@xilinx.com>) id 1bc7cr-00006f-0P
	for openembedded-core@lists.openembedded.org;
	Tue, 23 Aug 2016 02:04:05 -0700
Received: from [127.0.0.1] (helo=localhost)
	by xsj-pvapsmtp01 with smtp (Exim 4.63)
	(envelope-from <mubin.usman.sayyed@xilinx.com>) id 1bc7cp-0003LY-2r
	for openembedded-core@lists.openembedded.org;
	Tue, 23 Aug 2016 02:04:03 -0700
Received: from xsj-pvapsmtp01 (mailhub.xilinx.com [149.199.38.66])
	by xsj-smtp-dlp2.xlnx.xilinx.com (8.13.8/8.13.1) with ESMTP id
	u7N93uEF017946; Tue, 23 Aug 2016 02:03:57 -0700
Received: from [172.23.146.171] (helo=xhdl3763.xilinx.com)
	by xsj-pvapsmtp01 with esmtp (Exim 4.63)
	(envelope-from <mubinusm@xilinx.com>)
	id 1bc7ci-0003Fa-IW; Tue, 23 Aug 2016 02:03:56 -0700
Received: by xhdl3763.xilinx.com (Postfix, from userid 44329)
	id 793FB2CE116C; Tue, 23 Aug 2016 14:33:55 +0530 (IST)
From: Mubin Sayyed <mubin.usman.sayyed@xilinx.com>
To: <openembedded-core@lists.openembedded.org>
Date: Tue, 23 Aug 2016 14:33:47 +0530
Message-ID: <1471943028-8276-3-git-send-email-mubinusm@xilinx.com>
X-Mailer: git-send-email 2.1.1
In-Reply-To: <1471943028-8276-1-git-send-email-mubinusm@xilinx.com>
References: <1471943028-8276-1-git-send-email-mubinusm@xilinx.com>
X-RCIS-Action: ALLOW
X-TM-AS-Product-Ver: IMSS-7.1.0.1224-8.0.0.1202-22530.005
X-TM-AS-User-Approved-Sender: Yes;Yes
X-EOPAttributedMessage: 0
X-MS-Office365-Filtering-HT: Tenant
X-Forefront-Antispam-Report: CIP:149.199.60.100; IPV:NLI; CTRY:US; EFV:NLI;
	SFV:NSPM;
	SFS:(10009020)(6009001)(7916002)(2980300002)(438002)(189002)(199003)(36386004)(106466001)(63266004)(5003940100001)(46386002)(47776003)(305945005)(229853001)(2351001)(103686003)(92566002)(15395725005)(356003)(7846002)(450100001)(189998001)(107886002)(110136002)(8936002)(50226002)(33646002)(36756003)(4326007)(19580405001)(50466002)(2950100001)(2906002)(48376002)(90966002)(87936001)(626004)(19580395003)(45336002)(50986999)(76176999)(42186005)(8676002)(4001430100002)(86362001)(586003)(15975445007)(52956003)(5660300001)(81166006)(81156014)(107986001)(5001870100001);
	DIR:OUT; SFP:1101; SCL:1; SRVR:BN1PR02MB085; H:xsj-pvapsmtpgw02;
	FPR:; SPF:Pass; PTR:xapps1.xilinx.com,unknown-60-100.xilinx.com;
	MX:1; A:1; LANG:en; 
X-Microsoft-Exchange-Diagnostics: 1; BL2NAM02FT018;
	1:oxmxcLWMNDT649JwJLhCMlcFErTXV994ma3j81GPhw2+P0M5aAKbH39GuP6PAffusfRVqLc62TcQAhzrm5Aigt5EO7+a3edsg8L0Uv/KsJ2VnXZXrl/988vYe6ijJtMW8gJxHpj2x3EIi4UlAxMXqEmFQL7AYO2D2rkKWVr9hODq+xkK4qy61EO7xy6Np1S0VrrBaBor/GT6LMqpAO41Y1TgT+8f9iBW6VUW+e7QwkOl6gPEMyRvkjod9UsllM9mc2PvggrcVVWpR1SuEwXef/GVPhwrF8HnQK7ihjG/H68QZ2+F0j2YyAD1oyqvDZX71ZnuTj+e3NjW51jHQRvdA8334kfPWeJ6Vq7t8QHMP/tBBgg5iuypEJN/UuWfOT1mGUHELOraXATLto3e7p85RapQE1LRuprS02MjzCQYppVsjcpWVAPmVC3/pYEglhuq8GzeN7GUR7f2a+bVYdDxoexYUTbxPZ37MP67f8mxR/lRE7NQkeZG7uiAbcxfB/HtjVn2TydElXs5S1lSf/pfBpPJXBL0HpUTsuwJWTPogisE692s5z81DDJncGKVZR45
MIME-Version: 1.0
X-MS-Office365-Filtering-Correlation-Id: 91cac1cc-3ec7-43ad-24cd-08d3cb346ec8
X-Microsoft-Exchange-Diagnostics: 1; BN1PR02MB085;
	2:i2er2pxWwo3vei6g+2GgC+Z0mk6qbb32usOIL+AYaQNm5Fv1V1RAqILwKbHCS1W/g0dfVar5nueq9nwPY6INDdSdwKxriEdSYku6uy5dpTKyNl5vERoNV/N1Bk7I2xw7NN/51nKxwcsvdIWsB5CWt29Vs50znWoVHNF8VdIBCgNe8PojhiGJXkVzDTpjVtbp;
	3:C+3HKLJA3/Z3hBscAAf8U24pcVqNIQbN+o0E15WPbNAzdyE3ZmbjNZJf3FmbB7QJ4B45j4aBBpIgfKp+0XRpfOnlTLiKeqx/LnHQGm/cHIqYAfDNPs+LiG1nLO5gSgr2Uc1r/ml/JRtMFURAMzMGlYBU5pdNOpj6uUTNqJl/41mloDD3TpY+O8uanKVJAr8l/atrrfDAFahHAW4ek4PO+IojPsaBqpHajdtJWqebGnqouZX/p9NXx85Y7ZZ6XJc/sXGUKmAeM1OznkCw2TqS7g==;
	25:7TW3vxOGIZPFCRMBK0ArTN0bmQsZOadLgkFO0Jgd0ON8oAhqvfvYk2QhjlA+tZU9xKJ9QQikgaesPkilQcdmYykZf9MfEP6pCFrp5MR4nzGfm8xZFpHDxD4iXi7jfQAm2pSXW/xBrzm6TwhojQo/y0LnhcjuzC2eSRysmYS2qASvsZDFven+AKoOP5/aLvuowsf8URdbyptdD5/HEPAVFP5eCoNyV6ucUQlklkdgBZfLFpRpa7rMjky2diwa0MGMs0NbDd1cAWmFmrn+I7SlD9B37+7kWHZigBF7Ut1DHgxzQWyzW1zdXH7K5AC/n/wP/vx7LXOoCb7c3HbLtL3C37jqt3HSWWfHonU/EjRbHqCVYbZCO2fEplRvmMXiia+2+bODCTMYnvBKgaHcJTrZ/gh2ckI7CjicWMi9E67fTAk=
X-Microsoft-Antispam: UriScan:; BCL:0; PCL:0; RULEID:(8251501002);
	SRVR:BN1PR02MB085; 
X-Microsoft-Exchange-Diagnostics: 1; BN1PR02MB085;
	31:omPk1zqnLJPzyqLPL3bbciuXvZuMfYdmbLjXo9lqJcRom9AemgUIERpU+lh587pRO57cmXEJc+t3b6vO83QxbEANhwEerqyBGzn7Bvk87aubY4T3or+0HmkQVZuSDsrc9cRBFxZHaT+QiNm5HV7gt9hNG+7OraagTY62g+rodhk+D4C4X7r03FBhxJByXNIWsDpCkzPynP2j0vJuRHld34hoc/IXSXZzHPgfGnzBRoM=;
	20:vWYd8bKXEI410K9HT0ehGE4K2m9pc8ZrDkpF7lX8jDYfLmTUC5iK29JTS+2NCJQSTUnX8K+RP1ldVXrf+HRWKfqL4RmbKWca8Alyz/Kbv06VncpQSLiuMmhw/9JESXzGXb4NsvGeHsLbQWahDq0+QrvlMXRIx8LdvmrdxP4a7+gD7ZEjBbAiNARIYlkdD+D3GnyPVkimJbwRAGcSd+77VT7uHkYNjFsqD8NGV251gry18bjDcofHODoXS3EBpc8n3ZukXqTx54otFHEcajvhCwGvNBHrNfrhwh0AlmblQ6w26tXwL/d8RoXzuEBdQ1G/l2i9T/KOA8G98bVoZ02JNGwH+PFfloOfXlEbRe3oAVYoEd4lK0w0Os0hRyhjdnzpp1wrPt0WHiWXIZp01LMkBLZ3kniVuxaFlKw8K75XtSaeHKGdBSVFIWK3bA2pcAUJLsj/LvWVyH/a4KMSKVRPvbtwooiGXJ3CErXQDuV9tCTbFYXDVZ+eMToLL1N4sBQz
X-Microsoft-Antispam-PRVS: <BN1PR02MB085EFA9AD27E565EA393874BDEB0@BN1PR02MB085.namprd02.prod.outlook.com>
X-Exchange-Antispam-Report-Test: UriScan:(192813158149592);
X-Exchange-Antispam-Report-CFA-Test: BCL:0; PCL:0;
	RULEID:(6040176)(601004)(2401047)(13015025)(13017025)(13023025)(13024025)(13018025)(5005006)(8121501046)(3002001)(10201501046)(6055026);
	SRVR:BN1PR02MB085; BCL:0; PCL:0; RULEID:; SRVR:BN1PR02MB085; 
X-Microsoft-Exchange-Diagnostics: 1; BN1PR02MB085;
	4:ffj0aLhfHwC6EMO/Cb0+5yqTyL/FIqrQ5n04gIB5RnVdOsCADn72l+3ttqllwXASenckl/n9zC0ytYmtykfFPJB247T6m5ivoK29q5Ym/DpAufo6X3RaCJIDlWmq1gLgnZq0EXU+SDCVJEdLOD4KpU8lXCy4zMZ/bbVhugx2hJh0tmimvrrZes+6gzlpQ1cd3LeK5Nfaj+FSuC/g2+af8BDDU6yXHHvFGl4iZx6/kzZwoYwBFjQmDwYTAXLmfb1ns2iGsNPqSYLOq1Q/DxV32/ydPd82KEI/BsG1OwwRBBnv5xHrHphV8P29yYtwi34I9POQxTwsp1GB2zVQpvl3I9GldCpvuXLKtmHAgBNaohXMgiEy4hfhRV5giFzoukRBlaV9mPK6QnVYq7XXsYfIbbcXJRVapkebfJyQW0RrhjTa+VSGqwz5AJXotv7ytaQi/HK5QgwmKLqNU8AQEeoLiHndZ8E6exXcS2EqeMWXwo+l4rskBkf1vunz1XvkiaLtSEaIhAlFyj+fh/TqpXs2Q31OVaThdTdDG36wz1FJonU=
X-Forefront-PRVS: 004395A01C
X-Microsoft-Exchange-Diagnostics: =?us-ascii?Q?1; BN1PR02MB085;
	23:Mwq4DVYNcjXtW7pdgb8W0afa+Qs2bnAxr4fUYfSzY5?=
	=?us-ascii?Q?zzP62U+NHPH7R5yff98l0CMM4jdCd3tYHH27D0dYkzLPKeE31Imge0UYl2I9?=
	=?us-ascii?Q?3xH4Yn6aWLCQaxwMMEnQGj2swIsidx9BOm0BqJILL1+JW3fOAC2MpVlvFXvT?=
	=?us-ascii?Q?/V7sKzcTBDtRZRDtqE9PNFD4B+/NhP3Oq6uIYu7+E4pQ55IM/mXJFQW0OBh/?=
	=?us-ascii?Q?uSQFA7f8dP5aaF+7cfzkXcFh0yTlOC+Qp7B3DnXZEHF2QCKnuqBuv8EfN1EZ?=
	=?us-ascii?Q?RNsDhWSexQ7X+8FTAV9LZEMAoHyKd4WTvvbPVF9+QyF5/QrlmzZ9nmUzi38H?=
	=?us-ascii?Q?sfjJgiCqS5c7CA1L9zrrmIaLB3+LOLmSnKhgzUSiHfVnqGRvYQYduqc6vfeV?=
	=?us-ascii?Q?pVcBDWmE/pstHR9Zphm6Ew9VMFvHWDBQpSh3UI5VfyMboGWBd5qBxwb9MlJD?=
	=?us-ascii?Q?yTNqWo+e7Dg3s7KabIA01hidVQxolXabX2382LluLt87TY810zx8MHxyQcR5?=
	=?us-ascii?Q?GJ9TS2GK7erpOhrT1DQ2Ave7/ut6hs8gGreGgShcK8566TbOGm+H+ifKSNLq?=
	=?us-ascii?Q?X0Jxt95mvrvNF08GM+p81LyIX7ai8y2qlbG3EuopncCRtPb3eq7po0vjdk6m?=
	=?us-ascii?Q?ZO4xq4wqYwwZAdUc7JA7KHvr5fCWWRotrc1uFHDHqx9YVZwA0Wone6ASZ7qP?=
	=?us-ascii?Q?2xRdEdyJr6Vz90ySbTbLu4TWuWR3qzaOL/vshAUg1kf/7CRCBAilxpCa8vf+?=
	=?us-ascii?Q?KEdgVvsKZTwhcDDNy/ZM2adjHW+bAbEW7QSrZTP58uNOhYqCQQMttOjxZLK4?=
	=?us-ascii?Q?BxdxxD7pOtNluB7SbEFm1uQSgwLrnYesshj9sfSXNWRqUBMysjscxg53hyLU?=
	=?us-ascii?Q?3cMKJtJkqfAef8KFrw30JruA+zsBkqgT+Z78ShrNy5yVjf2SyzoStqf6DU0e?=
	=?us-ascii?Q?nGec0kie3BwMa6EHIhQKmx7kBzih+J8H3MdSQLr/qEp/zbyl/WRUlP9nAKFd?=
	=?us-ascii?Q?t/abF9hnVOkPxmciu0Lomt2qAxtdfrXHPd08HU7td3vrV21k4RenxB9xgL6C?=
	=?us-ascii?Q?Njfz+NbfaMDMmaRi31AVj3GnYxFmZdx9SNpTO4Mt0z/CIrXc05hzawIdH8O1?=
	=?us-ascii?Q?wkQHxxiiGKAipFWA0bfzEO7CKJfYPBpqyPoZMafla2e2OtwXmXKLYIFac257?=
	=?us-ascii?Q?IZ9rRf7VhyCxXTYsIE5wfujTvcWDpbGlBSeOjOW87jIwXgohf76Rvw/OC8BL?=
	=?us-ascii?Q?AA5wxgxW+IZtNq1OO+jk+ozjCrtsU35mUWw2Ig3IUBWL+5FRylexnjGb/o9Q?=
	=?us-ascii?Q?=3D=3D?=
X-Microsoft-Exchange-Diagnostics: 1; BN1PR02MB085;
	6:e7Vp0swtJEU2P8btDiVMF0XhTUR8DHLkmh9FeKTQco3NTBmd4Es86FiZYg/r+Dv1yVaV2IZv+DrV74UrauzlOHuu9gtKW/N5ZrTwiAoaFOzyEC+Dw5OSCg4mZytYAf3WBpvALGHqLxre9m+1S+FoPqYbJe9Bk9d0X++/+jczQ4j+PnPKp7gjH8lOjzATy2jXKjPXUeLir6wHskhEUocYygfIrflIRPlTvheyedNDWKN68YFQv2iC9TN5v+SSfVLYZ3Zscba13a2sxhFXo9tnWZo7IsjqpaKBfS9iKqXpvfaoZcVLc694eC1b4NMDY1taKje6PPHhTsPVbzL58a+tHA==;
	5:dFK5/Vm7K+ik43s9+ACj6G/r5gZc8b7N39RMKSCmo1wvpZdPH9O83EVE/0cFjfE9N7Gd7OVgkXWVP642qiJYVsY9sZlfMMMqXwgK1RRjxUiD+GaRZL8rw1P1PCpO1aUULgQRCmW9bM3/Md2Zugcy+g==;
	24:/RVRt2sdP3JkJqno6TTOqPxJ6sJRoxrSdP79YbueL4jhCz5Fg6J71ZItv2jjyZ8FyKbm161j8iYUCCD+vT96NcIV7cRWhZIkgwRLJlOB83I=;
	7:S3PWP5gq+Nb34jJ4WIx3qP40k0eBQXa56m9KnuhxKAjhSA475KkCZE2LiO8FuIqfjLBSKqF8iXSROn5zWswG/eKw+9XJ4uujRhjUOLdZzfTBq28vEQK5zTcWgKC9a9DXOd2VJf2S8y8+U/Fw4ixtUTq5J+1BB9feCMY4CxPvUyAx0sVtCkMpo9997s4Zv9EnCuxYHgC/VQfdXPhdxuKhj0K+igPKGf6PyQjr0R8MGt9I5gCLS5nzihzS4fZsfV1V
SpamDiagnosticOutput: 1:99
SpamDiagnosticMetadata: NSPM
X-OriginatorOrg: xilinx.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 23 Aug 2016 09:04:04.4688 (UTC)
X-MS-Exchange-CrossTenant-Id: 657af505-d5df-48d0-8300-c31994686c5c
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=657af505-d5df-48d0-8300-c31994686c5c;
	Ip=[149.199.60.100]; Helo=[xsj-pvapsmtpgw02]
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BN1PR02MB085
Cc: Mubin Sayyed <mubinusm@xilinx.com>
Subject: [meta-oe] [master] [PATCH 2/3] benchmarks:Added recipe for dhrystone
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
X-List-Received-Date: Tue, 23 Aug 2016 10:39:00 -0000
Content-Type: text/plain

This patch adds recipe for dhrystone benchmarks.
Dhrystone benchmarks measure CPU performance.

Signed-off-by: Mubin Sayyed <mubinusm@xilinx.com>
---
 .../recipes-benchmark/dhrystone/dhrystone_2.1.bb   | 22 ++++++++++++++++++++++
 1 file changed, 22 insertions(+)
 create mode 100644 meta-oe/recipes-benchmark/dhrystone/dhrystone_2.1.bb

diff --git a/meta-oe/recipes-benchmark/dhrystone/dhrystone_2.1.bb b/meta-oe/recipes-benchmark/dhrystone/dhrystone_2.1.bb
new file mode 100644
index 0000000..d0026d5
--- /dev/null
+++ b/meta-oe/recipes-benchmark/dhrystone/dhrystone_2.1.bb
@@ -0,0 +1,22 @@
+DESCRIPTION = "CPU Benchmark to measure integer performance"
+SECTION = "benchmark/tests"
+HOMEPAGE = "http://en.wikipedia.org/wiki/Dhrystone"
+
+LICENSE = "NCSA"
+LIC_FILES_CHKSUM = "file://${COMMON_LICENSE_DIR}/NCSA;md5=1b5fdec70ee13ad8a91667f16c1959d7"
+
+SRC_URI = "http://fossies.org/linux/privat/old/dhrystone-${PV}.tar.gz"
+	 
+SRC_URI[md5sum] = "15e13d1d2329571a60c04b2f05920d24"
+SRC_URI[sha256sum] = "8c8da46c34fde271b8f60a96a432164d2918706911199f43514861f07ef6b2f1"
+
+EXTRA_OEMAKE = "-e MAKEFLAGS='GCC=${CC}' 'PROGS=unix' 'TIME_FUNC= -DTIME' \
+                'HZ=60' 'OPTIMIZE= -O4' 'GCCOPTIM=-O'"
+S = "${WORKDIR}"
+
+do_install () {
+
+	install -d ${D}${bindir}
+	install -m 0755 gcc_dry2  ${D}${bindir}
+	install -m 0755 gcc_dry2reg  ${D}${bindir}
+}
-- 
1.9.1


