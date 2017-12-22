Return-Path: <BSREEKAN@xilinx.com>
X-Greylist: delayed 3637 seconds by postgrey-1.34 at layers.openembedded.org;
	Fri, 22 Dec 2017 22:31:49 UTC
Received: from NAM02-CY1-obe.outbound.protection.outlook.com
	(mail-cys01nam02on0080.outbound.protection.outlook.com
	[104.47.37.80])
	by mail.openembedded.org (Postfix) with ESMTP id D6064719B8
	for <openembedded-core@lists.openembedded.org>;
	Fri, 22 Dec 2017 22:31:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=xilinx.onmicrosoft.com; s=selector1-xilinx-com;
	h=From:Date:Subject:Message-ID:Content-Type:MIME-Version;
	bh=RTSEKr6w77YQsQJ3mJ27sqpWk70kcTF0zn433Glck8M=;
	b=naPqJ5KzRbeUqLPqe7gJyKJCC0IttUhbluPr+WxkDC1gu1/OJcwuEOInJ96QTlTAAEfqHa69v9MWn+3vO6NwXo/oGkfbV2wWMoPudhn8v2DV2oA3a+SKUDavN2cxnwkQAlax5UVnSaevrEHbaSV/eQNzeWKxMenHL0TnkK3+ryc=
Received: from CY4PR02CA0018.namprd02.prod.outlook.com (10.169.188.28) by
	MWHPR02MB3390.namprd02.prod.outlook.com (10.164.187.167) with Microsoft
	SMTP Server (version=TLS1_2,
	cipher=TLS_ECDHE_RSA_WITH_AES_256_CBC_SHA384_P256) id
	15.20.345.14; Fri, 22 Dec 2017 19:55:39 +0000
Received: from BL2NAM02FT018.eop-nam02.prod.protection.outlook.com
	(2a01:111:f400:7e46::208) by CY4PR02CA0018.outlook.office365.com
	(2603:10b6:903:18::28) with Microsoft SMTP Server (version=TLS1_2,
	cipher=TLS_ECDHE_RSA_WITH_AES_256_CBC_SHA384) id 15.20.345.14 via
	Frontend Transport; Fri, 22 Dec 2017 19:55:39 +0000
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
	cipher=TLS_RSA_WITH_AES_256_CBC_SHA) id 15.20.302.6
	via Frontend Transport; Fri, 22 Dec 2017 19:55:38 +0000
Received: from unknown-38-66.xilinx.com ([149.199.38.66]:50302
	helo=xsj-pvapsmtp01) by xsj-pvapsmtpgw02 with esmtp (Exim 4.63)
	(envelope-from <bhargava.sreekantappa-gayathri@xilinx.com>)
	id 1eSTPu-0000BZ-5h for openembedded-core@lists.openembedded.org;
	Fri, 22 Dec 2017 11:55:38 -0800
Received: from [127.0.0.1] (helo=localhost)
	by xsj-pvapsmtp01 with smtp (Exim 4.63)
	(envelope-from <bhargava.sreekantappa-gayathri@xilinx.com>)
	id 1eSTPu-0006sc-2z for openembedded-core@lists.openembedded.org;
	Fri, 22 Dec 2017 11:55:38 -0800
Received: from xsj-pvapsmtp01 (smtp.xilinx.com [149.199.38.66])
	by xsj-smtp-dlp2.xlnx.xilinx.com (8.13.8/8.13.1) with ESMTP id
	vBMJtVZx017849; Fri, 22 Dec 2017 11:55:31 -0800
Received: from [172.19.3.10] (helo=xsjbsreekan50.xilinx.com)
	by xsj-pvapsmtp01 with esmtp (Exim 4.63)
	(envelope-from <bhargava.sreekantappa-gayathri@xilinx.com>)
	id 1eSTPn-0006sA-4t; Fri, 22 Dec 2017 11:55:31 -0800
From: Bhargava Sreekantappa Gayathri
	<bhargava.sreekantappa-gayathri@xilinx.com>
To: <manjukum@xilinx.com>, <openembedded-core@lists.openembedded.org>
Date: Fri, 22 Dec 2017 11:55:23 -0800
Message-ID: <1513972523-23788-1-git-send-email-bhargava.sreekantappa-gayathri@xilinx.com>
X-Mailer: git-send-email 2.7.4
X-RCIS-Action: ALLOW
X-TM-AS-Product-Ver: IMSS-7.1.0.1224-8.2.0.1013-23546.001
X-TM-AS-User-Approved-Sender: Yes;Yes
X-EOPAttributedMessage: 0
X-MS-Office365-Filtering-HT: Tenant
X-Forefront-Antispam-Report: CIP:149.199.60.100; IPV:NLI; CTRY:US; EFV:NLI;
	SFV:NSPM;
	SFS:(10009020)(396003)(39860400002)(376002)(346002)(39380400002)(2980300002)(438002)(189003)(199004)(316002)(77096006)(9786002)(50226002)(107886003)(6666003)(48376002)(106466001)(8676002)(50466002)(5660300001)(81156014)(81166006)(16586007)(106002)(110136005)(8936002)(36386004)(478600001)(47776003)(36756003)(72206003)(4326008)(63266004)(2906002)(305945005)(356003)(51416003)(7696005)(59450400001)(107986001)(5001870100001);
	DIR:OUT; SFP:1101; SCL:1; SRVR:MWHPR02MB3390; H:xsj-pvapsmtpgw02;
	FPR:; SPF:Pass; PTR:xapps1.xilinx.com,unknown-60-100.xilinx.com;
	MX:1; A:1; LANG:en; 
X-Microsoft-Exchange-Diagnostics: 1; BL2NAM02FT018;
	1:enNUO9dL+V8xx/8ud+6gR0xh5eemXJgRmGkgJPQhVhKPz6na8BYgh9V+82rJrr0S5rSANFmFXJktdWVi7+lL3E7hFHZiWt4HPvZBXKvIyFVNkETiRocn6LeeoOJgACBX
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 66613b4b-55d5-497d-56c9-08d54975f997
X-Microsoft-Antispam: UriScan:; BCL:0; PCL:0;
	RULEID:(4534020)(4602075)(4627115)(201703031133081)(201702281549075)(5600026)(4604075)(4608076)(2017052603307)(7153060);
	SRVR:MWHPR02MB3390; 
X-Microsoft-Exchange-Diagnostics: 1; MWHPR02MB3390;
	3:oJghE1FKqLYvMljZCpbK7IBjP3H/m/U212cg2NlFokplh5YGrRR1NEm3FcteMHNtjAzmDhXgrfqok/dSm2v+tymCMMvUIbO1H7ptyp0CInVJ+7Qs9TaRTfuAAeORV0rJwsi0KOfnr1BugZ3dGVSdJkTjc1OndlEtHYwQf18dicy4KHOZmD0dIOYPUc8sR/EBVGY+HnI4Heh4wrZBsrVAxS+AiRWolaR+zA8i/5cfua+A06J8YJSvNgQNRtoDC/I9smlap4kdmtd7ktWOtx3CE04SIZU63rOEj575T30qKLYpIGC7kpZPsZluONpHL05OI8lJoBl4cuabQiDoipq2LWD1RYc+Eb1jYxLV0oeO8cw=;
	25:rar/5FXnv79lQ0Qg1wwRicnDKBCkqMq/ETdcro10t7LnOAMI9O+8B8hsWBjnNsUi1f+gTaJpiZlu0GbjRQ3lTKT5girke/HNxcGrWnIbPIURDMY0lZ7/+rM37Ik0+44oybN48LFkNeR8DVudEcUYwcb0MncqbqkbmzqCRb4Q+4fZ6g7lRnZcQN0WS+hGnc331adGfRNjAzHkVoQk2nxTwmzJudwfwIQMXxhvjfwTTt2LxJJzgR/yWLnUvgzvr4K2dWUYoBs/2HAdVyHVtCUe9ZyJ6Fv1cstplPtoX029wtgWRXlazYWWXklo9c2NTm2MtISweHBY0dcQgnXo5hRy+A==
X-MS-TrafficTypeDiagnostic: MWHPR02MB3390:
X-Microsoft-Exchange-Diagnostics: 1; MWHPR02MB3390;
	31:M1Wm5tKAYkM2A7SY3gnTxtJ8sMqgEOZDwezEPOWOFio0ibGlqLOvGZfxMJjOzbVRzkYR+VXZrptADqjMev2lrtyKaRU87mz+fq3tDAU7S2O6MMz+QvOV32qm23PFleVTsCIkDtgI7cuufBBWdAOX80gkE6BPzR0g8vLk+KqUzpWKAbjptMykcYuSLPXloAge+xhCPIN+gix1q39vsCP2vKkNz6NZusnxdmJNTTATixs=;
	20:de+jeTYzayqUFLec6aLQeSi8nk1bHNJe0LAm4ga6sT7XUXZSGXg/a3Ewd3uLjeKKvZWHVhxk4sMlnuoRyoFuX2JPW3uRbkRvWchGgF3EvH69X9iSIu5z7dC7haC4Mh1liPtfmP1aRsAx0W5n7kkT7Nz5herglw+K6lg05DONsMkGf1j4VnV2Inf2VcHPy7Yr/MeuiqFyl0Q21AGL2xmBM6SwlvdUVtqsoMcaA5+HV/v5rR7NoVNqnEZWYwiPX//lxJJbl4uR+lQBd+2qYdtIAR49rQisB26otVTEOKQfSuyX4kqsSZUXsyp0NzU1Jn1lOjNIGpWRXwB3tWcZ7vsoSkHgP/hRASr6TSnCojQ3OSeZa9mL55x6gozq0h79W8PI7b1MCeQMgYCss5BQcjlPcrqQK3t0uXRx/KQB+eZqpVZQI29YsaHLaEWKlrCtEHt+XdHxhaimR894LWEIF6O9ui7TFlVuHisFpX7wAfxMeTxRgRZyiDYb9tmKhRzvkaGs
X-Microsoft-Antispam-PRVS: <MWHPR02MB3390E60F835FBF80C8A4DBE1B0020@MWHPR02MB3390.namprd02.prod.outlook.com>
X-Exchange-Antispam-Report-Test: UriScan:(192813158149592);
X-Exchange-Antispam-Report-CFA-Test: BCL:0; PCL:0;
	RULEID:(6040470)(2401047)(8121501046)(5005006)(3231023)(944501047)(93006095)(93004095)(3002001)(10201501046)(6055026)(6041268)(20161123560045)(20161123562045)(20161123558120)(20161123564045)(201703131423095)(201702281528075)(20161123555045)(201703061421075)(201703061406153)(6072148)(201708071742011);
	SRVR:MWHPR02MB3390; BCL:0; PCL:0;
	RULEID:(100000803101)(100110400095); SRVR:MWHPR02MB3390; 
X-Microsoft-Exchange-Diagnostics: 1; MWHPR02MB3390;
	4:Jc/MMFGY+ulj2xQWpJ4jPgAgM6be0UrrHSA1fTU056bhvFYFRxhwok/JENuqswWUgocGlUMwk8pjS87laESYnQLHXr0XTQg8Zac2Dwc9FE98mniMToHyH42OYjo21DtTEshFBCBfiDRZykqph3XdA9y6acK41fzn2TxXPyvcgwMnuyC7TQoAhbIL+DyuIK10UtSzbZIYDcth8SrYAY69rK/xX+SxhKwZq+9B+o1vBKPPhgG8pK6Z3qemZdtANSMIEjVcxOtR0CKvjfCuCInOfs0NiQJ8FUQLHKV+Ah36wVxewwLmUnWw5213Cbebi6E2
X-Forefront-PRVS: 05299D545B
X-Microsoft-Exchange-Diagnostics: =?us-ascii?Q?1; MWHPR02MB3390;
	23:AzbZM8uXJ7AuMZ/J9OP4J2OAe7cMNCjL9E9zBerWW?=
	=?us-ascii?Q?au7haK7Sd+v0QwpvUcJfKFhQ93uAAHmX8duvFsyvIL86cM1apUafiiwjv179?=
	=?us-ascii?Q?RKJBn0fe6H3fMW9zrlugAR3CKsc6jBM7Z7DD4UmYNnS6s1M/Nt8gy1pHaijS?=
	=?us-ascii?Q?Rif7SyJmf8C0P6OEJfaANNY2dR7L9b6zeJWvBuxLNGslFwzVs3b9dmflFWjR?=
	=?us-ascii?Q?CfKGH+u8GCuOfcExUtnKEYez6v7kbKkxfEM8Fa79wOSGb+2uGRTaczToM4Y+?=
	=?us-ascii?Q?EdPjMMSORfGexJvyzjBZ+cA0/RQJCUusXZBWTl5DD/MP/bnG93CCRnFKwKUA?=
	=?us-ascii?Q?5KloK6bfMxi605OxPH4jOAOHnDSL3K9xAxfQY/dBGZNX9Zl2nUcsUfFwr3EW?=
	=?us-ascii?Q?hBTp9v/6GR2Sjky5tjTN3hKfHM2PFZtQwHLq3qbOY6ohRlpIvm0zTZxCDk5n?=
	=?us-ascii?Q?jsNVaYokivP2wE4dB+BTheeOCvscClYGrQ5xgbAacrwUY7jkDSnozghuVuZR?=
	=?us-ascii?Q?WHGf6jwPtxDxKGOlvX5TswefrJZJoKpfySFpFMLD1QQefhnCUr3mf0abgX37?=
	=?us-ascii?Q?R5oqaVFFhrzruVlEwigRyFFlefq9AANfN+ZZnsuYvPaI5nZqmo91f9oHFiTg?=
	=?us-ascii?Q?oTvngj4LOdY+Dd/OHHZx/VM8y1L8k8WfcvIrPNdr5tbsvOLQgbfnw7AIK94Y?=
	=?us-ascii?Q?dt/M2xBY0Q8wYhQqyv6xfs3mZ87debh/B1hpcXXArlqnBrpke6qP527936Pb?=
	=?us-ascii?Q?k4jGua8zj5tN05by6OgqSJfmwbxusGG/SUwgcnGjY8uo3lskAIA7PVd8yK6i?=
	=?us-ascii?Q?qyh3HgFf643IBGPnClGwrZyOXy3OZHfTg8LhaXHCJ4CjRpwt9nw7Fp6oV4RD?=
	=?us-ascii?Q?OVi5cfKJiaLuP+5LrJv/It+YOBmJ1CpTS+jt/UpdNgiJh8nKA4cxI3j9AFY9?=
	=?us-ascii?Q?08yh6H0KPV+4mJHo8Vp0kMuQFPtmKFdEhmCOQpCQmap+sMuN3fxRSoND3c6H?=
	=?us-ascii?Q?jk=3D?=
X-Microsoft-Exchange-Diagnostics: 1; MWHPR02MB3390;
	6:jum/9uEOdvtiCAEoiOMcTia2il9hYeYHXU0EB22douj6qvpOZgjNRfEEqOkq9G7/lDoPv+VIMM+xo5MJHuV8nEos3AxWdRyLfmeMBSKeBcKDryQ4iI8CqXdUexjKiXxXAofMmvYL8dH4xV9VKTXNSSxUcihHGqzLuO1pqxGaJNVZMnpj1nk6F0zaMeoQKOcqXKpfzW6Zv4lFwdXo8If3qW8l3vOVWFjTcEB8J62M+61/9mWQnFYRQARTTVr0c8QJZ/ca2ukxd/MhXGpp8RPQWe4oQ5Z5k6WidoXecdXQPyQNZht8W4VaT7B7zYvRWvduUHmzP/0gAYzgu1ped/DzcRyIeXrjjsXdXGqUrB+QYXE=;
	5:iKw+zYe/V2OfEsjul4PYzM5LdMI1LXGY0pWOLISEo97+qbI5KS04nHRbQC1dMWxlD1p4HODzF9vDUOPNHg3hMP4v7pUssgtK2ihCOKBdUyRsh2EL5i8Kc+Ak6LOPi+r3QPl/EHjcgfhnAXOhfVNsr9dxQcG9pwsO+lg30fCz30w=;
	24:TkJq3sgehS5MAJ0H5RZn+EKEBD3imRAQLap5xrRB2WSEdK/zvaHdr+iVKb8xIAd7dYwU1UBGMFdiG0RgzerWOKMm0/rJk4S6ioa9VfxEaRk=;
	7:wWdDawMHDTSMZqs+4A+3FN78a6NTV1G3hLbsiA+7FvEzmRyqHL3ZRc+ESwtvLXwhhpXKIzPhXyvEKt1TWeh87fItliHpXkCisGqDNvF4OWAciqkaAhEGgOonvwS9TXvIjjBkWusqS4XrYnu0Bo36zZtK/zFO4tTtHWH+/Cz+sLE29C6TWj8lvYVXadwPXKCeJPhdqA1vhKpOYTKImSLvCDSrlWZDYacq6fIVGhsxL7DYQ2lMMMIAibFjevTJXbNt
SpamDiagnosticOutput: 1:99
SpamDiagnosticMetadata: NSPM
X-OriginatorOrg: xilinx.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 22 Dec 2017 19:55:38.8364 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 66613b4b-55d5-497d-56c9-08d54975f997
X-MS-Exchange-CrossTenant-Id: 657af505-d5df-48d0-8300-c31994686c5c
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=657af505-d5df-48d0-8300-c31994686c5c;
	Ip=[149.199.60.100]; Helo=[xsj-pvapsmtpgw02]
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MWHPR02MB3390
Cc: Bhargava Sreekantappa Gayathri <bhargava.sreekantappa-gayathri@xilinx.com>
Subject: [PATCH] systemtap_git.inc: Add microblazeel as a supported architecture
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
X-List-Received-Date: Fri, 22 Dec 2017 22:31:50 -0000
Content-Type: text/plain

This patch adds microblazeel as a supported architecture for systemtap.

Signed-off-by: Bhargava Sreekantappa Gayathri <bhargava.sreekantappa-gayathri@xilinx.com>
---
 meta/recipes-kernel/systemtap/systemtap_git.inc | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta/recipes-kernel/systemtap/systemtap_git.inc b/meta/recipes-kernel/systemtap/systemtap_git.inc
index 3dc688a..547b3c1 100644
--- a/meta/recipes-kernel/systemtap/systemtap_git.inc
+++ b/meta/recipes-kernel/systemtap/systemtap_git.inc
@@ -16,7 +16,7 @@ SRC_URI = "git://sourceware.org/git/systemtap.git \
            "
 
 # systemtap doesn't support mips
-COMPATIBLE_HOST = '(x86_64|i.86|powerpc|arm|aarch64).*-linux'
+COMPATIBLE_HOST = '(x86_64|i.86|powerpc|arm|aarch64|microblazeel).*-linux'
 
 S = "${WORKDIR}/git"
 
-- 
2.7.4


