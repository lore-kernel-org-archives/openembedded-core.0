Return-Path: <alistai@xilinx.com>
X-Greylist: delayed 1097 seconds by postgrey-1.34 at layers.openembedded.org;
	Fri, 24 Mar 2017 16:47:14 UTC
Received: from NAM02-BL2-obe.outbound.protection.outlook.com
	(mail-bl2nam02on0072.outbound.protection.outlook.com [104.47.38.72])
	by mail.openembedded.org (Postfix) with ESMTP id 70EB077BBA
	for <openembedded-core@lists.openembedded.org>;
	Fri, 24 Mar 2017 16:47:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=xilinx.onmicrosoft.com; s=selector1-xilinx-com;
	h=From:Date:Subject:Message-ID:Content-Type:MIME-Version;
	bh=vpuXnglguJcCXgw7QsWTH+lyb8N5vAs8mblN1tva5dw=;
	b=Iqc86b8wKI9iVD9A4PGnQ803lqBsGAYCm9htsn3618IKRPR5PLHhTu8hWu4o0/An9SpK06Z/wEF/77zrSiY+u5bapDwHhI8kXKJrM/hjL5r3aCIjNnis+McxRYQNIvGkYnEvwtX5TG49G4Lw/6+2v5flEf32BmvDzi4DDCNVqEI=
Received: from MWHPR02CA0051.namprd02.prod.outlook.com (10.164.133.40) by
	DM2PR02MB1388.namprd02.prod.outlook.com (10.161.143.145) with Microsoft
	SMTP Server (version=TLS1_2,
	cipher=TLS_ECDHE_RSA_WITH_AES_256_CBC_SHA384_P384) id
	15.1.977.11; Fri, 24 Mar 2017 16:14:48 +0000
Received: from CY1NAM02FT039.eop-nam02.prod.protection.outlook.com
	(2a01:111:f400:7e45::209) by MWHPR02CA0051.outlook.office365.com
	(2603:10b6:301:60::40) with Microsoft SMTP Server (version=TLS1_2,
	cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.991.14 via
	Frontend Transport; Fri, 24 Mar 2017 16:14:48 +0000
Authentication-Results: spf=pass (sender IP is 149.199.60.83)
	smtp.mailfrom=xilinx.com; nathanrossi.com;
	dkim=none (message not signed)
	header.d=none;nathanrossi.com; dmarc=bestguesspass action=none
	header.from=xilinx.com;
Received-SPF: Pass (protection.outlook.com: domain of xilinx.com designates
	149.199.60.83 as permitted sender) receiver=protection.outlook.com;
	client-ip=149.199.60.83; helo=xsj-pvapsmtpgw01;
Received: from xsj-pvapsmtpgw01 (149.199.60.83) by
	CY1NAM02FT039.mail.protection.outlook.com (10.152.75.140) with
	Microsoft SMTP Server (version=TLS1_0,
	cipher=TLS_RSA_WITH_AES_256_CBC_SHA) id 15.1.977.7
	via Frontend Transport; Fri, 24 Mar 2017 16:14:47 +0000
Received: from unknown-38-66.xilinx.com ([149.199.38.66] helo=xsj-pvapsmtp01)
	by xsj-pvapsmtpgw01 with esmtp (Exim 4.63)
	(envelope-from <alistair.francis@xilinx.com>)
	id 1crRrS-0004GE-Uy; Fri, 24 Mar 2017 09:14:46 -0700
Received: from [127.0.0.1] (helo=localhost)
	by xsj-pvapsmtp01 with smtp (Exim 4.63)
	(envelope-from <alistair.francis@xilinx.com>)
	id 1crRrS-0005fF-Qd; Fri, 24 Mar 2017 09:14:46 -0700
Received: from xsj-pvapsmtp01 (smtp.xilinx.com [149.199.38.66])
	by xsj-smtp-dlp1.xlnx.xilinx.com (8.13.8/8.13.1) with ESMTP id
	v2OGEf8p015310; Fri, 24 Mar 2017 09:14:41 -0700
Received: from [172.19.2.220] (helo=xsjalistai50.xilinx.com)
	by xsj-pvapsmtp01 with esmtp (Exim 4.63)
	(envelope-from <alistair.francis@xilinx.com>)
	id 1crRrM-0005cj-VL; Fri, 24 Mar 2017 09:14:41 -0700
From: Alistair Francis <alistair.francis@xilinx.com>
To: <openembedded-core@lists.openembedded.org>, <liezhi.yang@windriver.com>,
	<ross.burton@intel.com>
Date: Fri, 24 Mar 2017 09:12:16 -0700
Message-ID: <20170324161217.6285-1-alistair.francis@xilinx.com>
X-Mailer: git-send-email 2.9.3
X-RCIS-Action: ALLOW
X-TM-AS-Product-Ver: IMSS-7.1.0.1224-8.1.0.1062-22962.005
X-TM-AS-User-Approved-Sender: Yes;Yes
X-EOPAttributedMessage: 0
X-MS-Office365-Filtering-HT: Tenant
X-Forefront-Antispam-Report: CIP:149.199.60.83; IPV:NLI; CTRY:US; EFV:NLI;
	SFV:NSPM;
	SFS:(10009020)(6009001)(39450400003)(39850400002)(39840400002)(39410400002)(39860400002)(2980300002)(438002)(189002)(199003)(9170700003)(305945005)(356003)(47776003)(2201001)(50226002)(50466002)(8936002)(5660300001)(81166006)(107886003)(77096006)(38730400002)(50986999)(8676002)(63266004)(189998001)(39060400002)(36386004)(54906002)(33646002)(4326008)(9786002)(1076002)(36756003)(2906002)(106466001)(5003940100001)(6666003)(48376002)(107986001);
	DIR:OUT; SFP:1101; SCL:1; SRVR:DM2PR02MB1388; H:xsj-pvapsmtpgw01;
	FPR:; SPF:Pass; MLV:ovrnspm; MX:1; A:1;
	PTR:unknown-60-83.xilinx.com; LANG:en; 
X-Microsoft-Exchange-Diagnostics: 1; CY1NAM02FT039;
	1:fN8lN46Kk7Ey+aVy3PxV79DRbJs8TiLKzNpzttJjQNKuvRJoLQE8Vl1vlMLsxgWUpPnfUwEChA+qnH540Tb39vzmEFj95eo+5DzX/E/+FKEOz+kEshU/ySEaodBNyemWDu20sSck1xldcQ4bipYus2ySxKT6zNm68dOS5ATIs1tM2vNsaO6YGy1pGHpFQvFLjjOnNSiWKSA4WYcM1m/oqcGtNg+qwBRCnmEJFUsr2MZ4ekeUm0wA7fLrQgF3vRRH6dGkYvEvyIQqyNOj7A5KyEB67au5qZxNE/qfCgPd25UTTQlTMqRhpd23YIf2iOnEZ9MV1BOaVkiqdjSqvz1QgGXckk7y+hZyzuz8hhcz8KXCDrwFVwZ3OxVGXkwWDp++Ymx2cq/NXyEbR9OzQNXCnlTEJxf42ArJqPj+QoMxENplkX8J438++5D9Si4mpITGkyOnx+eUM7ZPDDFVJvP2tu2xlf5a4T1ODEjzJKkErzKIV7cG0DUVMVXy+p6mLq6DEp+8RW5tjksMwnCcpIs01+X5cscjEgbLFXLi3O5XCPkHB/iicsBDYzmTDu7ZXNmFiQeZPfLceFmIec4Z2vurLLFK3gLLmfQSy5Dnr+B5QS8k328CTZBHHZ4mGCZiFTYk
MIME-Version: 1.0
X-MS-Office365-Filtering-Correlation-Id: 5ec66e3a-2bba-4c57-47a8-08d472d0e48c
X-Microsoft-Antispam: UriScan:; BCL:0; PCL:0;
	RULEID:(22001)(8251501002)(2017030254075); SRVR:DM2PR02MB1388; 
X-Microsoft-Exchange-Diagnostics: 1; DM2PR02MB1388;
	3:T6kVcKQezZYDcRG2k+mbWSX/C7NSDtSDvyh0iMqsZxpPCoufLP2hrKjMxTtKy2t7V4+8M3gvLMIz6nxMCDXZS/hvkVYKFNuVee4NyeHwraQZZeo0bGpFVNormDz0Ktf9n3zoBPvk8NZeP5tEhX/yx88QqiHrqgfTNWdLKQBuDI0GICLAD8KSdYg2HoVPKAqsjZEKcm2iDVEGpekm3NsIpH7ozJ1XmpqyPXvZlPEUuzz1IOEPpf0OvFuPmpsGpBYg5uvZq4DxBL29162TUzb/ohbYS5TKcWNsg0ru2mvGRzJLBcBTq6zqNvx/ALN10TYrDkc4wmpx+1xvuHkV57/emPwbRbcdhqECb27FJEJwrVoiQAe0AXbhwkbKQRPDx9I3h4Qsczsn6nXXuhAWlCfC0x64hi1kh1I9iuLqvXLNYrY=;
	25:/dtw8EifRrMaYeG9pOsccVffpyvEk1PPTt1mxqxTEM6JkdOr0w+c2FZESf7Nc0FffLaI+4e3J/qcglI1tnCYCMqbIQrs8KNvmLRy0PBFXobmcymE+8pPl8ue0/A973tJ3VOP7saRWJTsC+CbaXTUL6qqJOmA6iASmDEsa1G2PrsRgAggwf3np1EYdO4jwsZ8qPw3REHyl6HRs+jARFAapNJYYYQtJtw47ruXCCRu4vcfbSOoEYroGnrSuIiyoxTVHysOEM+KW/Pj7hW+9MAYDK0WdSzhYaERpUZ61LutNdTwaH2RJnISqibXOZ1srD/w8xxslE5AD4g61YGIkq4/Ti4v8e6tSw2Fmed04WqrkSYHboUOOFtbcKxtana4vOcli+FGxZUad7oEtZvHB8ZzztNR9GK5uEClxgkIhXIRVTvoW0Te3PBc9LL79j9Dep5uxLkSTw/jq9eKspk1qsLfZg==
X-Microsoft-Exchange-Diagnostics: 1; DM2PR02MB1388;
	31:MJKdCmTJEEaFxpDIoIdBlnRx9DfR8Kn8wHqQZFQwVCXQ0IAS6+f3Kbjn5vsPsljSMK9MzWR7yuXFwpwfC6d3n9zkBy3f2LrFgNgK8izYltNM8bTRyokgqpESoHovL+q3aeMnHddaR+LUB/GWYCRAX65TaUYrA0vLeI7jqT8c2dQigBrryteq6fmyKPGJwdPJNEMF5GxbtYyiN7BzT0i8KDt1iGU7JJZh+SYyIhnhUPUZmAlOYnbKy3qXuaZc00NXW9BZmSMA2kHJQb7I6W+XjA==;
	20:lzyEoVWUl4RNEWFN2HjK1qA5ocFlLw25sJUgXy0DjPc082j5/JlwbRCKPylIqYRC1uq7ygF2E/4mAenUe5Hl2KvgxDbRNrUp1DqdMgxMHoaYzyEi0iZGh5QgZBDvd6FpT9HSE7C9P5/ZtyVVPvJr5R68EHlvpeftSGAUaM3CfpPdVdxqXVaMRfyr5G8QZO4DGNy/ECI/gRXYRy9XKOJS9cUf6ov2kSzZvNJyhWRudCDftx369MHxvXlSIcFK/fqhnDc0L4z5Ue95JvrflL3I0JvQPQ4F6xis2DFcjQyJ+kd/8Vkzxh27hkNcK5rpKBJJogBVsBA5WfrPG2FB7AxfUTlhxFX8Zlgy7BuMlEJ9cTjQa846fDpPRtA4cPfbfoyAXZk4e3FEwkdDg7+HzMsLCc83yAKBjf9ysJ57WQ15MQhFWCaDuje66Lh8MAVskWcuLrdBy61wBXbIUl3KhldsjBLMEZcqQuSABPW3hCyXGPJ9111ry/EqfoC4IzFZ1CK4
X-Microsoft-Antispam-PRVS: <DM2PR02MB1388699DC015B947D60DD929DC3E0@DM2PR02MB1388.namprd02.prod.outlook.com>
X-Exchange-Antispam-Report-Test: UriScan:(158342451672863)(192813158149592);
X-Exchange-Antispam-Report-CFA-Test: BCL:0; PCL:0;
	RULEID:(6040375)(601004)(2401047)(13017025)(13015025)(8121501046)(13024025)(5005006)(13023025)(13018025)(3002001)(10201501046)(6055026)(6041248)(20161123558025)(20161123564025)(20161123562025)(20161123555025)(20161123560025)(6072148);
	SRVR:DM2PR02MB1388; BCL:0; PCL:0; RULEID:; SRVR:DM2PR02MB1388; 
X-Microsoft-Exchange-Diagnostics: 1; DM2PR02MB1388;
	4:xKs6HuPMqlQlfmS6ezrJW3MQzoQv0ohULhZPZszFhI3Zoo/xnHMFdQ5aZ9zeIVLhqK6k27wo0oiucqD6cqMcJwG9virRYT1kOKYV/ewgREr7TTfCIbH/87BKSBhlFi5sdOiuTh8RZrC/zZQvULs4dlp6HshjZE0aohHcaHeIgZZ+48dqiUYLHRyNtauefsxysAnK3Ep1XCh3swSEMrXGjNHe+VmBpCqBaMqvcHAIiB2P7IQbVaJuUVGU4v0anIA4uMWdqYq3aXusnZokvsH4YS+mUpSeRIJsyI/isjQsSkUpdqjUc2wybXzMtoSWEochL57YhkEHIUtknOQ6lRULXK8jZHHS4xiXRvwvoMBp5PbHO0kwOBUqVABELlAcnnpiUaLm93bMD2spZG+uVOSNowAI21+jt3sbwA2zYYZuMIoWvM8v8sFQ7IGsc8HC06wYKwu2kHwulme+rkxgLUxkMNrA8xI1yeVhKTKxD/nuihjkslzZleUzDlhtbhD6VOWfYpymcdzKPBHIbKut45wpPXRouDfy73yupfMsoXpQB4aMf18AnhS7gKEco9GGvTbzIQ79dQrB/7k0Mpm775MHNtbgCIwoF/SoSsYo6J+lxnA89Kxs82mZM+p3ffghTyMb4WQ9J0KRviDH1vLp7TkCtPRZF4Ydr17Fgsbj1Q5ONF09dJTE7PlKwarTTdsogjGZZfP/jD8JKKD1dC3jtGyOek8531kCorMrasMynObKDvr6dLTC2c+zqXg7KSgecdvep6O14eW0DR/Lbh+dB0pOeMQO2n90MB63/39QGRHG6Hw=
X-Forefront-PRVS: 0256C18696
X-Microsoft-Exchange-Diagnostics: =?us-ascii?Q?1; DM2PR02MB1388;
	23:0OHdeqt6jDWyqB6zfiGSkZxJiDJr1Ukh61Un0P+r4?=
	=?us-ascii?Q?+rELB2aWwEwEgSD1zrS+XtcMc4qXOPyd80fqT5ZGlxHyU65Ee81YbsVT4fJ3?=
	=?us-ascii?Q?3+E+V4ZflXqa8MyVyjl9jsV1VrDjbuA+Cx3zey856QUBbOuJlESI8n5Ol3Ha?=
	=?us-ascii?Q?imvdj8ooqvZeU4PBovaWSGx7AVfwfEYKEDkI7u8i/JJJWUr6VnhVVjtz69Lq?=
	=?us-ascii?Q?nK/O4kJT52ioH9yxpaY7e1CA+KcwwwqCUxDHvutsdcjkr+xsZEE08zqd1dP3?=
	=?us-ascii?Q?jK14o2pjCbR+Z6//qQt/sJp5v0vebgO+ASe7tX+Ih/4ksOFouz012CeFBhl2?=
	=?us-ascii?Q?sq+jjJbjg0p717f+2eIxYtxI1R7CpbuXdPdN0iXc2NQuFhMbIxezGrjIt/rJ?=
	=?us-ascii?Q?mks/qCBVn5n1OnStlcCvcRD40/frBhvjxljQBz6v6uauM67qcCZHCSHG5/Fj?=
	=?us-ascii?Q?bCCAxY+2CN3aMMn6uirbVoWZHK/4I4xd5dN2e6iWYvJTj7hrhCjCKwC4i+ZY?=
	=?us-ascii?Q?9MU8shaDc4ISVG9DUey16f8rHPsaXCuyd94MHSs1ULDX/bLcQubl/7FeM/Xn?=
	=?us-ascii?Q?FEEx9VuIG+O/OzsgPnRXEouDHxhT0PXEJPmObkW4x/+SnIm1q0zkSmMs0XKs?=
	=?us-ascii?Q?D1/9yEp6Qyjm2NDmfNFcEsdeJxBWao/r/y9ybuDWyRCPMTxK2inHZzgAY2eI?=
	=?us-ascii?Q?MqLN+rKps2YCsRCvHx2ff3evpka2LGtyXCm+MtVKmCYf8JBOcS6XQWG57mAi?=
	=?us-ascii?Q?iG+cnRxre0Y7N16mj8GpmIuybKxsgviqxe7xz0m9HRQmC6H30w0BrKbo8qTk?=
	=?us-ascii?Q?CYG29UbpcEp2yxvXaSQR4QrJxC1DxGz2niMCMf8TNtfaiiCGp0jQmyiWG+jd?=
	=?us-ascii?Q?/fCs67e8On00Sv/tBDnDq5CUjN6Hvnpz1Tsd1JxXkwSzunFlGwKrE9s+jcZa?=
	=?us-ascii?Q?RqADvv31sKNHRPOh05VGuqXB8fU3fElx86ZEv1glZZY60SubMHlRfAqVQnVJ?=
	=?us-ascii?Q?kNKCgTESEE/CaIzA5MRH63y0sivhO8Kj0NfBFZS0YXkvg=3D=3D?=
X-Microsoft-Exchange-Diagnostics: 1; DM2PR02MB1388;
	6:BQXmwCysywp1461ErsUeuvOnQhWCRr61USIr/BNx2ljfjYonzGdtUpOtqDTtYjAVfu/hkmm39K7SfAS2EeO9PMeLVn1naGwd9/DdG8qsDW4e18B2YMZ3ii7AGEh5uh2gXF29P6hl/H/2OeN7vNNrUc2YzmwATsTf9tDV/Jio12u0AjU2GMKU/csJGu/UjsiwhrKHQ6LJtmW27j6YWzOWXuGGUukmvwQygkXTxmMgOEKQdv8fFNPSQN8MWjuYhA4eZV7GAmRHV7OcVkgWbkSHWqKkKT9hNUKhEEQ1H2fGLRQaiMNoow5x3yTnB2g0y04LkOyMrrMQVSvXJku1rdFZU2/AUZ0IG7P26D7uR+xWGFznlezD28G23H0P4ticsRYwr596jsl2ZVSDMon/S7TUgwC310S2WLwHqic68tSgzk8=;
	5:Wur2apA1/gjhDp+Y9/Za4EH3Lbyy+tL3nvypUieFcuP//rbmJRx0sLUXu9PkCiVacI7VtA2kUtUH7f1/KC5sHhNljNepUe9JARRKg4TNMRs6GW5pTwZ+wkNzW/c9CLu3yURXEmytb7aBvtjVC6XZqQ==;
	24:62FEk4hh5IR2cn0f38zmuS/JuggDTUzmbTK/1vo0ndb3lAz17okKlwR6Yj9Us/l9Yn9FJZGcvnBnjDoBg49oAnCINS6JqOtJGNp8MUKwr4k=
SpamDiagnosticOutput: 1:99
SpamDiagnosticMetadata: NSPM
X-Microsoft-Exchange-Diagnostics: 1; DM2PR02MB1388;
	7:lNfbwCxJnFR7o0DxWxEqtYkcsrtqZxYwHNFPqPhyJD854STiLzpiz2Xil8irsRUlSCXvCfNJ1x3X6kTngM1RiLm6SZpDiS0Sbt0K/VIPa5GladfVCUY9w7GdQxSNNN7IlPfdqkCdqtLeqHM/IafOWfEVJKCzZOlIgCcsM0B4+AZM9ChjzmsEQQWfMwLW0+013RsCN0yVXmJt+mySw7WIztQLTU1cP1rD+xL/1DNJ1mcX6xvqmpBtklap2z0XcG51Mn7GXwnD9LoEdgdUuyTG/JtFCVH+oZHikOKTUVrgWBMk6Iw/C6qz2gYPtnHl31xHbibQpoflaujMgaTlZS++cg==
X-OriginatorOrg: xilinx.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 24 Mar 2017 16:14:47.5807 (UTC)
X-MS-Exchange-CrossTenant-Id: 657af505-d5df-48d0-8300-c31994686c5c
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=657af505-d5df-48d0-8300-c31994686c5c;
	Ip=[149.199.60.83]; Helo=[xsj-pvapsmtpgw01]
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM2PR02MB1388
Subject: [PATCH 1/2] runqemu: Automatically add a TFTP directory for slirp boot
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
X-List-Received-Date: Fri, 24 Mar 2017 16:47:16 -0000
Content-Type: text/plain

When booting QEMU with slirp networking we want to use QEMUs TFTP server
to make the images in deploy accessible to the guest.

Signed-off-by: Alistair Francis <alistair.francis@xilinx.com>
---
 scripts/runqemu | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/scripts/runqemu b/scripts/runqemu
index 23c9efb..f76d976 100755
--- a/scripts/runqemu
+++ b/scripts/runqemu
@@ -832,7 +832,7 @@ class BaseConfig(object):
         self.kernel_cmdline_script += ' ip=dhcp'
         # Port mapping
         hostfwd = ",hostfwd=tcp::2222-:22,hostfwd=tcp::2323-:23"
-        qb_slirp_opt_default = "-netdev user,id=net0%s" % hostfwd
+        qb_slirp_opt_default = "-netdev user,id=net0%s,tftp=%s" % (hostfwd, self.get('DEPLOY_DIR_IMAGE'))
         qb_slirp_opt = self.get('QB_SLIRP_OPT') or qb_slirp_opt_default
         # Figure out the port
         ports = re.findall('hostfwd=[^-]*:([0-9]+)-[^,-]*', qb_slirp_opt)
-- 
2.9.3


