Return-Path: <alistai@xilinx.com>
Received: from NAM02-BL2-obe.outbound.protection.outlook.com
	(mail-bl2nam02on0074.outbound.protection.outlook.com [104.47.38.74])
	by mail.openembedded.org (Postfix) with ESMTP id 10C1A77D81
	for <openembedded-core@lists.openembedded.org>;
	Fri, 16 Feb 2018 19:53:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=xilinx.onmicrosoft.com; s=selector1-xilinx-com;
	h=From:Date:Subject:Message-ID:Content-Type:MIME-Version;
	bh=hB36LSd3eh+zGVab992p0jWxxIoMf+ljP0K2q/6i90U=;
	b=Phna5AG4BRqMt4A/fZjAvnJlKzPPKWDaoXDRvMtGIggDPQLo18YT53w3sLyDRFNYHETvMqZHO2V79h4XVctb+0CK9OZg9yP0fG+W9P8l+FOAzShKL2qLfLdm9in4VNWEzdteN2GHapCafwt5WfCou5Si53goyYDkhI03Y89TbBk=
Received: from MWHPR0201CA0020.namprd02.prod.outlook.com (10.167.160.161) by
	BY2PR02MB1331.namprd02.prod.outlook.com (10.162.79.26) with Microsoft
	SMTP Server (version=TLS1_2,
	cipher=TLS_ECDHE_RSA_WITH_AES_256_CBC_SHA384_P256) id
	15.20.485.10; Fri, 16 Feb 2018 19:53:31 +0000
Received: from CY1NAM02FT027.eop-nam02.prod.protection.outlook.com
	(2a01:111:f400:7e45::200) by MWHPR0201CA0020.outlook.office365.com
	(2603:10b6:301:74::33) with Microsoft SMTP Server (version=TLS1_2,
	cipher=TLS_ECDHE_RSA_WITH_AES_256_CBC_SHA384) id 15.20.506.18 via
	Frontend Transport; Fri, 16 Feb 2018 19:53:31 +0000
Authentication-Results: spf=pass (sender IP is 149.199.60.100)
	smtp.mailfrom=xilinx.com; gmail.com; dkim=none (message not signed)
	header.d=none;gmail.com; dmarc=bestguesspass action=none
	header.from=xilinx.com;
Received-SPF: Pass (protection.outlook.com: domain of xilinx.com designates
	149.199.60.100 as permitted sender) receiver=protection.outlook.com;
	client-ip=149.199.60.100; helo=xsj-pvapsmtpgw02;
Received: from xsj-pvapsmtpgw02 (149.199.60.100) by
	CY1NAM02FT027.mail.protection.outlook.com (10.152.75.159) with
	Microsoft SMTP Server (version=TLS1_0,
	cipher=TLS_RSA_WITH_AES_256_CBC_SHA) id 15.20.464.11
	via Frontend Transport; Fri, 16 Feb 2018 19:53:30 +0000
Received: from unknown-38-66.xilinx.com ([149.199.38.66]:44331
	helo=xsj-pvapsmtp01) by xsj-pvapsmtpgw02 with esmtp (Exim 4.63)
	(envelope-from <alistair.francis@xilinx.com>)
	id 1emm4Y-0003Nb-9t; Fri, 16 Feb 2018 11:53:30 -0800
Received: from [127.0.0.1] (helo=localhost)
	by xsj-pvapsmtp01 with smtp (Exim 4.63)
	(envelope-from <alistair.francis@xilinx.com>)
	id 1emm4Y-0000QI-1R; Fri, 16 Feb 2018 11:53:30 -0800
Received: from xsj-pvapsmtp01 (xsj-mail.xilinx.com [149.199.38.66])
	by xsj-smtp-dlp2.xlnx.xilinx.com (8.13.8/8.13.1) with ESMTP id
	w1GJrO1N024205; Fri, 16 Feb 2018 11:53:24 -0800
Received: from [172.19.2.220] (helo=xsjalistai50.xilinx.com)
	by xsj-pvapsmtp01 with esmtp (Exim 4.63)
	(envelope-from <alistair.francis@xilinx.com>)
	id 1emm4S-0000Q4-JB; Fri, 16 Feb 2018 11:53:24 -0800
From: Alistair Francis <alistair.francis@xilinx.com>
To: <openembedded-core@lists.openembedded.org>
Date: Fri, 16 Feb 2018 11:48:41 -0800
Message-ID: <20180216194841.13370-1-alistair.francis@xilinx.com>
X-Mailer: git-send-email 2.14.1
MIME-Version: 1.0
X-RCIS-Action: ALLOW
X-TM-AS-Product-Ver: IMSS-7.1.0.1224-8.2.0.1013-23620.005
X-TM-AS-User-Approved-Sender: Yes;Yes
X-EOPAttributedMessage: 0
X-MS-Office365-Filtering-HT: Tenant
X-Forefront-Antispam-Report: CIP:149.199.60.100; IPV:NLI; CTRY:US; EFV:NLI;
	SFV:NSPM;
	SFS:(10009020)(39380400002)(396003)(346002)(376002)(39860400002)(2980300002)(438002)(189003)(199004)(63266004)(305945005)(107886003)(2906002)(6306002)(356003)(8936002)(53946003)(59450400001)(23676004)(6666003)(6916009)(16200700003)(316002)(478600001)(106466001)(106002)(7696005)(2870700001)(50226002)(8676002)(5660300001)(1076002)(50466002)(4326008)(36756003)(81166006)(77096007)(1857600001)(575784001)(186003)(336011)(26005)(81156014)(39060400002)(2351001)(9786002)(54906003)(5820100001)(47776003)(36386004)(107986001)(5001870100001)(569006);
	DIR:OUT; SFP:1101; SCL:1; SRVR:BY2PR02MB1331; H:xsj-pvapsmtpgw02;
	FPR:; SPF:Pass; PTR:unknown-60-100.xilinx.com,xapps1.xilinx.com;
	MX:1; A:1; LANG:en; 
X-Microsoft-Exchange-Diagnostics: 1; CY1NAM02FT027;
	1:73xzp/eORM6jYM3RsaKNuO6ppr5Ru3wPkr4mATy5gwcEPThO6TQtIfmjKQNO2Abc4sl96eo/SHPte6FFwikr+sGO8a24evjx1Tfa/LTXpPknyl2o/jdw4F9dh1ymQ8+M
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 9d84ff3e-28c8-48ed-5940-08d57576f493
X-Microsoft-Antispam: UriScan:; BCL:0; PCL:0;
	RULEID:(7020095)(4652020)(4534165)(4627221)(201703031133081)(201702281549075)(5600026)(4604075)(4608076)(2017052603307)(7153060);
	SRVR:BY2PR02MB1331; 
X-Microsoft-Exchange-Diagnostics: 1; BY2PR02MB1331;
	3:wyrpHRZRHvnhC8Fl6/RqGVOIkhxFBHt1cVlcmo56mS9XMyu6e0y24pWAa5KzThpbacbmGE+WZXgbeYSkuIcMgR3oxTdI3kKMHz2ntPCYACmdD91ZkKxctKuw5vuoH/28ceAZKzrpmw83YXPkYQo96yuM+051v8fh/NX4zsRYAANp/sBtP0vaQXN+l1N8iYrb8m+n/cyYfKKryeqhvaPZvQg22lpUpsIvdEM9qImDMNpPiZs+Ew1S/VVDWaRfgpHfvmlXldgOk+ip63RSzage83CooobzaPJDGdly6z0X4uLchvmEFWxn57OldCmOP5GtduA0iua9ZdYu5tdQOjCtf4alPiTiNygNK3QUddpEiIU=;
	25:4XtK+kv5mtCc5578DCoxN32OnhVYw9A1kfaehP1kNwcdf0jrFTg2IQn1Ysd1WN0Jv8ESWgYTMdC4BsiL2aVnEZPmRkHAytBlsQZB1DQkAJ/LOOzkQg2SU8PzrCBxXwJ6a9uM7wtCOnNVdI8Z4JozNy+OxM0mgS87lctwhrk1u3b2zKubqJVnAuV9DsAl+5hw0M/bULeL3azYtAOn0OZ4d1l1pqzP4RxHp4JJa+Q2zUYg4lzbyHz9yuYI6O73cKBpltRTQa54quxYRdmTwFKgqjbRAChMsnwSpnjamKkCF+HKzE3cKYSPSYFTKE5idxNvVncVrynXjWJdgFgniPt7jA==
X-MS-TrafficTypeDiagnostic: BY2PR02MB1331:
X-Microsoft-Exchange-Diagnostics: 1; BY2PR02MB1331;
	31:gHeaWV9UyOroijO4M7V7cUWXfykiOs2JSPkrjmu4OtC66o1waLWh21qM2KZ/OZNqbz1nOuMjPNcgKNftoIfnvgNq7HNfmq3MbTdpbA4NJDN7dRz77unnbVA2bxGIrZqPzvAZTXDsuIAlxXCQgltCtQn1EOaqBfmG+5bRrKh/AItwBuOQsJNffNQOOqH+CTQCEDCPosKfxNlASRQ81QwnDuL4QTXrHozVRj0M+4n89GE=;
	20:bpw6ya2+EDDyrLY2DchNx9B5P42ger+JaE3Ko5jbvzmK7GlUA5lE3rRSwaTxVbUikQWT4q41+FBT/9nB6JGltvJJpgmD555LmKQjM+Qu3/13NLekpV+XdaEA5CPgnfyQL3nIk7UN+m/+n9YvSfbHmJS/WA9a5jEub5v/6DMh/0bjgVBrf81qJWsRRVASikKj8VHN4O0nOPGsVreWJfUN9h5sGCwb0+rWAH9LEUnE8UJgRUCGj6cgLZ+CL7M+kA611RNh+1b/0Symmg5htXmezraAdbI73MMMGzLeCRGMxDr/VITHpOYM3RgFZBGtQTUwxGaLamOIIBOPGs05I3aDNHm51icmJ6jE+7USGIxPxHk0ncTYOI0Wg3ggUFnLIEL4Rdtu1m/aHZmd346JdrhHVRUnOIRNTi4/Om9f2uOGru56iUrU6fKHBOQ6EN/uYY6Ph7+GR4vz0HEQKjn43O/fV8Vpu8PR3oJIFjkOeFZQSfyKrSOwt+WuWAkthXGfhLLG
X-Auto-Response-Suppress: DR, RN, NRN, OOF, AutoReply
X-Microsoft-Antispam-PRVS: <BY2PR02MB13318255F18387E03BE5A05BDCCB0@BY2PR02MB1331.namprd02.prod.outlook.com>
X-Exchange-Antispam-Report-Test: UriScan:(158342451672863)(192813158149592)(21532816269658)(146099531331640)(228905959029699);
X-Exchange-Antispam-Report-CFA-Test: BCL:0; PCL:0;
	RULEID:(6040501)(2401047)(5005006)(8121501046)(3002001)(10201501046)(93006095)(93004095)(3231101)(2400082)(944501161)(6055026)(6041288)(20161123562045)(20161123558120)(20161123560045)(20161123564045)(201703131423095)(201702281528075)(20161123555045)(201703061421075)(201703061406153)(6072148)(201708071742011);
	SRVR:BY2PR02MB1331; BCL:0; PCL:0; RULEID:; SRVR:BY2PR02MB1331; 
X-Microsoft-Exchange-Diagnostics: 1; BY2PR02MB1331;
	4:ZzFZbtUkMf5UCIxJPiHS1LK5Gj+J7TmpQh2P/2PzJPi4FjciYGzSLWnRLK0HhUutGhVhMy/XUVRO+QBLkF+VySX9b3nT3QK0ddfGpmCsZ5V+n7GMbNMYt59SOXdytR4xIgoR753jBC0JH5eZL6Phzj06giMuxEFtNSV+TC2QYMX0yfD2Fkf4tI7I0DTyWquOsgGGX2sxochQpL26R8R3h7wuoygLwHnnG4t7YYtChgFGT3LVL1RhkW7kjrJS09iDaTsalvLLKMyg/ndHtAgzilJtJCxlD48HLSQbLZeCKJjYDRuMPgUm0CZ+SPDcfLIPuv/gPQ8/pJMeAX3kGdczlEAB2TXErDAslpJKM2dFxRYqBBX2LZZfxVG+UPZ4ZZggFE1MSGSo9TQGGhnqnGMD5DmEvZVL77SjmxOiv4zgQBht6UHURfXlRueqomvljV8AOSnZgfZyVYaO+l3SDcoyDA==
X-Forefront-PRVS: 0585417D7B
X-Microsoft-Exchange-Diagnostics: =?utf-8?B?MTtCWTJQUjAyTUIxMzMxOzIzOng3OWpRYy96cVQyR0V5UHowREdua2FtNlhm?=
	=?utf-8?B?YU9KYzg1SVRnNGg4Vmc1bldIWHkyblNpd2pqTG1HRHV3cTZ4NVV3TzdvWmxK?=
	=?utf-8?B?MjlyVTdKeW41NzNXSUJlc3BOd0ZPa1phbEc4cVF3dXV3TytZaW05RlBRVXd2?=
	=?utf-8?B?Yy8zREN5alZ4UDlxQkpKSVN3TkNBaVUrbUVFcitGQ0VoajhEM2thZXRMZ0tG?=
	=?utf-8?B?UmpsZlB5eUFpL3N0NTF1YUNaQ2E0SzZpcHdZdlFhZnpMZTUySnh3cVNtU0d3?=
	=?utf-8?B?MDJTMUNqRDBnWHNnS2h4cWN1WlVrNUJTOXk0c1ZWaW00SWFBeGVEY3FueUw2?=
	=?utf-8?B?dStGRUZ2cDRDRlBENWNjcnJrOEd1N1h0a1JyR2lwNEtqM3hVeWZ3UDI5bnho?=
	=?utf-8?B?QmU0N1BQaGNYNHBpOXd3RnVQbVMrRitYZXVhWFFGWTFBY2Mzd3pSZFh3WFMr?=
	=?utf-8?B?OEMxanI4STF2YVU0R0FONDYwUXlDV1ZUSlBaY04zUWFuWldSdWpsT1lTUWpN?=
	=?utf-8?B?TDNBUzU5aDAzUWFvcnR0QTRadk5YeEcrSDJnRStXT05RcTk1ZG9xRTNFRnFO?=
	=?utf-8?B?WEYxVDg4SUpYYi9oMERtdHRiUUdDR0dPMUdrUUd5ZWpjV2Y4UkFkaGxBZjNY?=
	=?utf-8?B?MURRcDVXaGJGWVdJUWdURkl4Vkp0RjVteTdSVFRNOTJVYkcrajN3dk1oeTR1?=
	=?utf-8?B?c0FUVmhYUDVSd1FKdUk2RW1vTk9ZbDUrSFc2YUpGTmJLMy9xQ0pNZDlsaStp?=
	=?utf-8?B?UkwzNTRIYnRrYVowOWdrSTU0cCtKRkNETkIvZCtTVHA1UU12cTdpNTRZSE5m?=
	=?utf-8?B?T1ZGYXVPMXhjWGl2ODJvaGtDWmNNN1p2N1BtZmV5UHh2YnEwL2ZwRndBa2Ir?=
	=?utf-8?B?WnI2TWVrWWhzOUpnaW41cCtQOWZlTzBvaU04KzZPRnZHRE9SMEVTTWtrRmlk?=
	=?utf-8?B?RUl1U210eTVjQzFOUjZ3d0hZKzhPeGFaWUZsQlBqYW9IdGpNT0w1UDFMd3FK?=
	=?utf-8?B?bGFrY1ZqbEpkTWJNYktVZ0hvUnUwN1JCQUNnelkrR0JsRTJ6eTVTc0lJOHdv?=
	=?utf-8?B?SXlxWktMSVZmSUxNc3p5eURrbmNyK3MveWozNHVSVEdKTjhQV1Z1dCszcG1y?=
	=?utf-8?B?YVhmVkJBL0pubHQrOXdYOEU5eXpHMmVEOHdETVlmN0QrOUdjNVZ3RWh5QWZx?=
	=?utf-8?B?RTRHbysyY3ZPK045cXRWYXpGSHdHQWRCRHlmVEFnbVRMaGhnMk9ORWN2a3Vq?=
	=?utf-8?B?TmVqQlNPYkRSWXBlSVpNbDdzbncwRUpYUExiT2lUZG5xcHBYSGp4UGF4aDlo?=
	=?utf-8?B?b1NIeHNZaEl4dFJOWmp0RGpkdXA3a0tKNERzRFZKTHgzTVNnWlV5SE5jeTVS?=
	=?utf-8?B?VnViamF3WmRMWlBmTVh6Q0hOK2YyKzlyOGxxVjl3S3JMMEVsZmFEUGN2TmJO?=
	=?utf-8?B?WmRCSUlvZU82Y2s2M1JFUEFKYVo0WEZsenEwaEk0cml5d2grLzJVdStnVmcr?=
	=?utf-8?B?SkR3VUp2WmxPSTVqdTRVeVBPTC9WUGdhVElRVXd4My9jNEhKRjRoRm5KSnk0?=
	=?utf-8?B?ak9ROUZSZ1ZnOUNVUXRRTkkwZlVpNlVZSUpsQXVubHFRMTFDRmJCRmJGVkVU?=
	=?utf-8?B?VzBRN0VPdHdRN2ExanEwdm03R255dzBibVpNZ0dNUWtiMTFJTC80MWVMNnlN?=
	=?utf-8?Q?fVUpfQWapnismzzaJw=3D?=
X-Microsoft-Exchange-Diagnostics: 1; BY2PR02MB1331;
	6:7OAmmEOW2/EKc8gs9wFhdQnmiYO6dNiUkkGdpxPFqqUL9hnaofCTYrK4myWc5p6Ysf1FJ3Uqj5LKGnxvn6OLTWbAc78b2AB0pP8I+vYCHDzm93V50++bQHfAnXvxcxPGcyXAh/7mEmdmFB4gy1xy3blrKYd8q37nKDgNEliEwKH8P7ahiHHL2OWeS5zr3UMNOSoRg5J3A87mZ0G14hp4/hTXLdaxNPcCrZI+9pBhSmaHK58kEixCtgkFNiijXtQ/7TCD3QTQnzQYzcayWHIv4NgguZhV5c3BY8rntXCBD3HrAjaJ8fYtzKAGfd6aqPYOqeVJhcSA/dKbXewEwNGnMi8ROMr3NDJL2qUG4g1WS7Q=;
	5:jfsqFFWx1rpm3riP9GTgzLupgUQ44r0VzZIlB34xpfOJpch/Os7MyPIPoX5frTTAaeaZBuikikhxMOW/64J2NBmz3FxV94mG5zHiKBjWSHxrLY27SIMkT3nvrpsAEStHwg4SNS8a90PJn8mY/lCRCL0p7HKnGi5dyMI6jjVoCi0=;
	24:w7ZymDCczwVHW81ji7LF8HRiNQa1A9QL4968YPor2u0XFWHg9gHdRgHvjVf0eG0Lpz9YMGgfD/lTu2B2u2c7IMFVzFiB9pB0i4Rmve65+zE=;
	7:1hM22VoKfaynRlLAZEVXmc+GLUR1aGLtf+tNbD6lfNWgNfxsJH2fF6xF5mVPjWXRtU7X775FwEmeiaQKqfX7GUBoHTYR39S4cGGFEp2j/iBHZJ2kIkyf14KjnzGw1Z2a85cubaJR0lR7tzSA81UBvheZNOG316pFOUdu3sQmgvOVk+3t2btTSdbrkKqVU3qkdcEpT52h5Ib17555dgWY6/OvVLWKe5GJJnVQ0OMrtn/1ICG8cVkBX4lVgpyodXeM
SpamDiagnosticOutput: 1:99
SpamDiagnosticMetadata: NSPM
X-OriginatorOrg: xilinx.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 16 Feb 2018 19:53:30.9243 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 9d84ff3e-28c8-48ed-5940-08d57576f493
X-MS-Exchange-CrossTenant-Id: 657af505-d5df-48d0-8300-c31994686c5c
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=657af505-d5df-48d0-8300-c31994686c5c;
	Ip=[149.199.60.100]; Helo=[xsj-pvapsmtpgw02]
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BY2PR02MB1331
Subject: [PATCH] recipes-devtools: Bump QEMU to 2.11.1
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
X-List-Received-Date: Fri, 16 Feb 2018 19:53:34 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit

Bump the QEMU version to the bug fix release of 2.11.1 and remove the
patches that are no longer required.

Signed-off-by: Alistair Francis <alistair.francis@xilinx.com>
---
 .../qemu/qemu/CVE-2017-15124.patch                 | 1476 --------------------
 .../qemu/{qemu_2.11.0.bb => qemu_2.11.1.bb}        |    5 +-
 2 files changed, 2 insertions(+), 1479 deletions(-)
 delete mode 100644 meta/recipes-devtools/qemu/qemu/CVE-2017-15124.patch
 rename meta/recipes-devtools/qemu/{qemu_2.11.0.bb => qemu_2.11.1.bb} (91%)

diff --git a/meta/recipes-devtools/qemu/qemu/CVE-2017-15124.patch b/meta/recipes-devtools/qemu/qemu/CVE-2017-15124.patch
deleted file mode 100644
index a47b6d0510..0000000000
--- a/meta/recipes-devtools/qemu/qemu/CVE-2017-15124.patch
+++ /dev/null
@@ -1,1476 +0,0 @@
-VNC server implementation in Quick Emulator (QEMU) 2.11.0 and older was found to
-be vulnerable to an unbounded memory allocation issue, as it did not throttle
-the framebuffer updates sent to its client. If the client did not consume these
-updates, VNC server allocates growing memory to hold onto this data. A malicious
-remote VNC client could use this flaw to cause DoS to the server host.
-
-CVE: CVE-2017-15124
-Upstream-Status: Backport
-Signed-off-by: Ross Burton <ross.burton@intel.com>
-
-From 090fdc83b0960f68d204624a73c6814780da52d9 Mon Sep 17 00:00:00 2001
-From: =?UTF-8?q?Marc-Andr=C3=A9=20Lureau?= <marcandre.lureau@redhat.com>
-Date: Wed, 20 Dec 2017 15:06:18 +0100
-Subject: [PATCH 01/14] vnc: fix debug spelling
-MIME-Version: 1.0
-Content-Type: text/plain; charset=UTF-8
-Content-Transfer-Encoding: 8bit
-
-Signed-off-by: Marc-André Lureau <marcandre.lureau@redhat.com>
-Message-id: 20171220140618.12701-1-marcandre.lureau@redhat.com
-Signed-off-by: Gerd Hoffmann <kraxel@redhat.com>
----
- ui/vnc.c | 2 +-
- 1 file changed, 1 insertion(+), 1 deletion(-)
-
-diff --git a/ui/vnc.c b/ui/vnc.c
-index 9f8d5a1b1f..7d537b5c6b 100644
---- a/ui/vnc.c
-+++ b/ui/vnc.c
-@@ -2255,7 +2255,7 @@ static int protocol_client_msg(VncState *vs, uint8_t *data, size_t len)
-                 }
-                 vs->as.nchannels = read_u8(data, 5);
-                 if (vs->as.nchannels != 1 && vs->as.nchannels != 2) {
--                    VNC_DEBUG("Invalid audio channel coount %d\n",
-+                    VNC_DEBUG("Invalid audio channel count %d\n",
-                               read_u8(data, 5));
-                     vnc_client_error(vs);
-                     break;
--- 
-2.11.0
-
-
-From 6af998db05aec9af95a06f84ad94f1b96785e667 Mon Sep 17 00:00:00 2001
-From: "Daniel P. Berrange" <berrange@redhat.com>
-Date: Mon, 18 Dec 2017 19:12:16 +0000
-Subject: [PATCH 02/14] ui: remove 'sync' parameter from vnc_update_client
-MIME-Version: 1.0
-Content-Type: text/plain; charset=UTF-8
-Content-Transfer-Encoding: 8bit
-
-There is only one caller of vnc_update_client and that always passes false
-for the 'sync' parameter.
-
-Signed-off-by: Daniel P. Berrange <berrange@redhat.com>
-Reviewed-by: Darren Kenny <darren.kenny@oracle.com>
-Reviewed-by: Marc-André Lureau <marcandre.lureau@redhat.com>
-Message-id: 20171218191228.31018-2-berrange@redhat.com
-Signed-off-by: Gerd Hoffmann <kraxel@redhat.com>
----
- ui/vnc.c | 11 +++--------
- 1 file changed, 3 insertions(+), 8 deletions(-)
-
-diff --git a/ui/vnc.c b/ui/vnc.c
-index 7d537b5c6b..d72a61bde3 100644
---- a/ui/vnc.c
-+++ b/ui/vnc.c
-@@ -596,7 +596,7 @@ VncInfo2List *qmp_query_vnc_servers(Error **errp)
-    3) resolutions > 1024
- */
- 
--static int vnc_update_client(VncState *vs, int has_dirty, bool sync);
-+static int vnc_update_client(VncState *vs, int has_dirty);
- static void vnc_disconnect_start(VncState *vs);
- 
- static void vnc_colordepth(VncState *vs);
-@@ -961,7 +961,7 @@ static int find_and_clear_dirty_height(VncState *vs,
-     return h;
- }
- 
--static int vnc_update_client(VncState *vs, int has_dirty, bool sync)
-+static int vnc_update_client(VncState *vs, int has_dirty)
- {
-     if (vs->disconnecting) {
-         vnc_disconnect_finish(vs);
-@@ -1025,9 +1025,6 @@ static int vnc_update_client(VncState *vs, int has_dirty, bool sync)
-         }
- 
-         vnc_job_push(job);
--        if (sync) {
--            vnc_jobs_join(vs);
--        }
-         vs->force_update = 0;
-         vs->has_dirty = 0;
-         return n;
-@@ -1035,8 +1032,6 @@ static int vnc_update_client(VncState *vs, int has_dirty, bool sync)
- 
-     if (vs->disconnecting) {
-         vnc_disconnect_finish(vs);
--    } else if (sync) {
--        vnc_jobs_join(vs);
-     }
- 
-     return 0;
-@@ -2863,7 +2858,7 @@ static void vnc_refresh(DisplayChangeListener *dcl)
-     vnc_unlock_display(vd);
- 
-     QTAILQ_FOREACH_SAFE(vs, &vd->clients, next, vn) {
--        rects += vnc_update_client(vs, has_dirty, false);
-+        rects += vnc_update_client(vs, has_dirty);
-         /* vs might be free()ed here */
-     }
- 
--- 
-2.11.0
-
-
-From c53df961617736f94731d94b62c2954c261d2bae Mon Sep 17 00:00:00 2001
-From: "Daniel P. Berrange" <berrange@redhat.com>
-Date: Mon, 18 Dec 2017 19:12:17 +0000
-Subject: [PATCH 03/14] ui: remove unreachable code in vnc_update_client
-MIME-Version: 1.0
-Content-Type: text/plain; charset=UTF-8
-Content-Transfer-Encoding: 8bit
-
-A previous commit:
-
-  commit 5a8be0f73d6f60ff08746377eb09ca459f39deab
-  Author: Gerd Hoffmann <kraxel@redhat.com>
-  Date:   Wed Jul 13 12:21:20 2016 +0200
-
-    vnc: make sure we finish disconnect
-
-Added a check for vs->disconnecting at the very start of the
-vnc_update_client method. This means that the very next "if"
-statement check for !vs->disconnecting always evaluates true,
-and is thus redundant. This in turn means the vs->disconnecting
-check at the very end of the method never evaluates true, and
-is thus unreachable code.
-
-Signed-off-by: Daniel P. Berrange <berrange@redhat.com>
-Reviewed-by: Darren Kenny <darren.kenny@oracle.com>
-Reviewed-by: Marc-André Lureau <marcandre.lureau@redhat.com>
-Message-id: 20171218191228.31018-3-berrange@redhat.com
-Signed-off-by: Gerd Hoffmann <kraxel@redhat.com>
----
- ui/vnc.c | 6 +-----
- 1 file changed, 1 insertion(+), 5 deletions(-)
-
-diff --git a/ui/vnc.c b/ui/vnc.c
-index d72a61bde3..29a7208475 100644
---- a/ui/vnc.c
-+++ b/ui/vnc.c
-@@ -969,7 +969,7 @@ static int vnc_update_client(VncState *vs, int has_dirty)
-     }
- 
-     vs->has_dirty += has_dirty;
--    if (vs->need_update && !vs->disconnecting) {
-+    if (vs->need_update) {
-         VncDisplay *vd = vs->vd;
-         VncJob *job;
-         int y;
-@@ -1030,10 +1030,6 @@ static int vnc_update_client(VncState *vs, int has_dirty)
-         return n;
-     }
- 
--    if (vs->disconnecting) {
--        vnc_disconnect_finish(vs);
--    }
--
-     return 0;
- }
- 
--- 
-2.11.0
-
-
-From b939eb89b6f320544a9328fa908d881d0024c1ee Mon Sep 17 00:00:00 2001
-From: "Daniel P. Berrange" <berrange@redhat.com>
-Date: Mon, 18 Dec 2017 19:12:18 +0000
-Subject: [PATCH 04/14] ui: remove redundant indentation in vnc_client_update
-MIME-Version: 1.0
-Content-Type: text/plain; charset=UTF-8
-Content-Transfer-Encoding: 8bit
-
-Now that previous dead / unreachable code has been removed, we can simplify
-the indentation in the vnc_client_update method.
-
-Signed-off-by: Daniel P. Berrange <berrange@redhat.com>
-Reviewed-by: Darren Kenny <darren.kenny@oracle.com>
-Reviewed-by: Marc-André Lureau <marcandre.lureau@redhat.com>
-Message-id: 20171218191228.31018-4-berrange@redhat.com
-Signed-off-by: Gerd Hoffmann <kraxel@redhat.com>
----
- ui/vnc.c | 112 ++++++++++++++++++++++++++++++++-------------------------------
- 1 file changed, 57 insertions(+), 55 deletions(-)
-
-diff --git a/ui/vnc.c b/ui/vnc.c
-index 29a7208475..7582111ca6 100644
---- a/ui/vnc.c
-+++ b/ui/vnc.c
-@@ -963,74 +963,76 @@ static int find_and_clear_dirty_height(VncState *vs,
- 
- static int vnc_update_client(VncState *vs, int has_dirty)
- {
-+    VncDisplay *vd = vs->vd;
-+    VncJob *job;
-+    int y;
-+    int height, width;
-+    int n = 0;
-+
-     if (vs->disconnecting) {
-         vnc_disconnect_finish(vs);
-         return 0;
-     }
- 
-     vs->has_dirty += has_dirty;
--    if (vs->need_update) {
--        VncDisplay *vd = vs->vd;
--        VncJob *job;
--        int y;
--        int height, width;
--        int n = 0;
--
--        if (vs->output.offset && !vs->audio_cap && !vs->force_update)
--            /* kernel send buffers are full -> drop frames to throttle */
--            return 0;
-+    if (!vs->need_update) {
-+        return 0;
-+    }
- 
--        if (!vs->has_dirty && !vs->audio_cap && !vs->force_update)
--            return 0;
-+    if (vs->output.offset && !vs->audio_cap && !vs->force_update) {
-+        /* kernel send buffers are full -> drop frames to throttle */
-+        return 0;
-+    }
- 
--        /*
--         * Send screen updates to the vnc client using the server
--         * surface and server dirty map.  guest surface updates
--         * happening in parallel don't disturb us, the next pass will
--         * send them to the client.
--         */
--        job = vnc_job_new(vs);
--
--        height = pixman_image_get_height(vd->server);
--        width = pixman_image_get_width(vd->server);
--
--        y = 0;
--        for (;;) {
--            int x, h;
--            unsigned long x2;
--            unsigned long offset = find_next_bit((unsigned long *) &vs->dirty,
--                                                 height * VNC_DIRTY_BPL(vs),
--                                                 y * VNC_DIRTY_BPL(vs));
--            if (offset == height * VNC_DIRTY_BPL(vs)) {
--                /* no more dirty bits */
-+    if (!vs->has_dirty && !vs->audio_cap && !vs->force_update) {
-+        return 0;
-+    }
-+
-+    /*
-+     * Send screen updates to the vnc client using the server
-+     * surface and server dirty map.  guest surface updates
-+     * happening in parallel don't disturb us, the next pass will
-+     * send them to the client.
-+     */
-+    job = vnc_job_new(vs);
-+
-+    height = pixman_image_get_height(vd->server);
-+    width = pixman_image_get_width(vd->server);
-+
-+    y = 0;
-+    for (;;) {
-+        int x, h;
-+        unsigned long x2;
-+        unsigned long offset = find_next_bit((unsigned long *) &vs->dirty,
-+                                             height * VNC_DIRTY_BPL(vs),
-+                                             y * VNC_DIRTY_BPL(vs));
-+        if (offset == height * VNC_DIRTY_BPL(vs)) {
-+            /* no more dirty bits */
-+            break;
-+        }
-+        y = offset / VNC_DIRTY_BPL(vs);
-+        x = offset % VNC_DIRTY_BPL(vs);
-+        x2 = find_next_zero_bit((unsigned long *) &vs->dirty[y],
-+                                VNC_DIRTY_BPL(vs), x);
-+        bitmap_clear(vs->dirty[y], x, x2 - x);
-+        h = find_and_clear_dirty_height(vs, y, x, x2, height);
-+        x2 = MIN(x2, width / VNC_DIRTY_PIXELS_PER_BIT);
-+        if (x2 > x) {
-+            n += vnc_job_add_rect(job, x * VNC_DIRTY_PIXELS_PER_BIT, y,
-+                                  (x2 - x) * VNC_DIRTY_PIXELS_PER_BIT, h);
-+        }
-+        if (!x && x2 == width / VNC_DIRTY_PIXELS_PER_BIT) {
-+            y += h;
-+            if (y == height) {
-                 break;
-             }
--            y = offset / VNC_DIRTY_BPL(vs);
--            x = offset % VNC_DIRTY_BPL(vs);
--            x2 = find_next_zero_bit((unsigned long *) &vs->dirty[y],
--                                    VNC_DIRTY_BPL(vs), x);
--            bitmap_clear(vs->dirty[y], x, x2 - x);
--            h = find_and_clear_dirty_height(vs, y, x, x2, height);
--            x2 = MIN(x2, width / VNC_DIRTY_PIXELS_PER_BIT);
--            if (x2 > x) {
--                n += vnc_job_add_rect(job, x * VNC_DIRTY_PIXELS_PER_BIT, y,
--                                      (x2 - x) * VNC_DIRTY_PIXELS_PER_BIT, h);
--            }
--            if (!x && x2 == width / VNC_DIRTY_PIXELS_PER_BIT) {
--                y += h;
--                if (y == height) {
--                    break;
--                }
--            }
-         }
--
--        vnc_job_push(job);
--        vs->force_update = 0;
--        vs->has_dirty = 0;
--        return n;
-     }
- 
--    return 0;
-+    vnc_job_push(job);
-+    vs->force_update = 0;
-+    vs->has_dirty = 0;
-+    return n;
- }
- 
- /* audio */
--- 
-2.11.0
-
-
-From 3541b08475d51bddf8aded36576a0ff5a547a978 Mon Sep 17 00:00:00 2001
-From: "Daniel P. Berrange" <berrange@redhat.com>
-Date: Mon, 18 Dec 2017 19:12:19 +0000
-Subject: [PATCH 05/14] ui: avoid pointless VNC updates if framebuffer isn't
- dirty
-MIME-Version: 1.0
-Content-Type: text/plain; charset=UTF-8
-Content-Transfer-Encoding: 8bit
-
-The vnc_update_client() method checks the 'has_dirty' flag to see if there are
-dirty regions that are pending to send to the client. Regardless of this flag,
-if a forced update is requested, updates must be sent. For unknown reasons
-though, the code also tries to sent updates if audio capture is enabled. This
-makes no sense as audio capture state does not impact framebuffer contents, so
-this check is removed.
-
-Signed-off-by: Daniel P. Berrange <berrange@redhat.com>
-Reviewed-by: Darren Kenny <darren.kenny@oracle.com>
-Reviewed-by: Marc-André Lureau <marcandre.lureau@redhat.com>
-Message-id: 20171218191228.31018-5-berrange@redhat.com
-Signed-off-by: Gerd Hoffmann <kraxel@redhat.com>
----
- ui/vnc.c | 2 +-
- 1 file changed, 1 insertion(+), 1 deletion(-)
-
-diff --git a/ui/vnc.c b/ui/vnc.c
-index 7582111ca6..a79848f083 100644
---- a/ui/vnc.c
-+++ b/ui/vnc.c
-@@ -984,7 +984,7 @@ static int vnc_update_client(VncState *vs, int has_dirty)
-         return 0;
-     }
- 
--    if (!vs->has_dirty && !vs->audio_cap && !vs->force_update) {
-+    if (!vs->has_dirty && !vs->force_update) {
-         return 0;
-     }
- 
--- 
-2.11.0
-
-
-From 8f61f1c5a6bc06438a1172efa80bc7606594fa07 Mon Sep 17 00:00:00 2001
-From: "Daniel P. Berrange" <berrange@redhat.com>
-Date: Mon, 18 Dec 2017 19:12:20 +0000
-Subject: [PATCH 06/14] ui: track how much decoded data we consumed when doing
- SASL encoding
-MIME-Version: 1.0
-Content-Type: text/plain; charset=UTF-8
-Content-Transfer-Encoding: 8bit
-
-When we encode data for writing with SASL, we encode the entire pending output
-buffer. The subsequent write, however, may not be able to send the full encoded
-data in one go though, particularly with a slow network. So we delay setting the
-output buffer offset back to zero until all the SASL encoded data is sent.
-
-Between encoding the data and completing sending of the SASL encoded data,
-however, more data might have been placed on the pending output buffer. So it
-is not valid to set offset back to zero. Instead we must keep track of how much
-data we consumed during encoding and subtract only that amount.
-
-With the current bug we would be throwing away some pending data without having
-sent it at all. By sheer luck this did not previously cause any serious problem
-because appending data to the send buffer is always an atomic action, so we
-only ever throw away complete RFB protocol messages. In the case of frame buffer
-updates we'd catch up fairly quickly, so no obvious problem was visible.
-
-Signed-off-by: Daniel P. Berrange <berrange@redhat.com>
-Reviewed-by: Darren Kenny <darren.kenny@oracle.com>
-Reviewed-by: Marc-André Lureau <marcandre.lureau@redhat.com>
-Message-id: 20171218191228.31018-6-berrange@redhat.com
-Signed-off-by: Gerd Hoffmann <kraxel@redhat.com>
----
- ui/vnc-auth-sasl.c | 3 ++-
- ui/vnc-auth-sasl.h | 1 +
- 2 files changed, 3 insertions(+), 1 deletion(-)
-
-diff --git a/ui/vnc-auth-sasl.c b/ui/vnc-auth-sasl.c
-index 23f28280e7..761493b9b2 100644
---- a/ui/vnc-auth-sasl.c
-+++ b/ui/vnc-auth-sasl.c
-@@ -67,6 +67,7 @@ long vnc_client_write_sasl(VncState *vs)
-         if (err != SASL_OK)
-             return vnc_client_io_error(vs, -1, NULL);
- 
-+        vs->sasl.encodedRawLength = vs->output.offset;
-         vs->sasl.encodedOffset = 0;
-     }
- 
-@@ -78,7 +79,7 @@ long vnc_client_write_sasl(VncState *vs)
- 
-     vs->sasl.encodedOffset += ret;
-     if (vs->sasl.encodedOffset == vs->sasl.encodedLength) {
--        vs->output.offset = 0;
-+        vs->output.offset -= vs->sasl.encodedRawLength;
-         vs->sasl.encoded = NULL;
-         vs->sasl.encodedOffset = vs->sasl.encodedLength = 0;
-     }
-diff --git a/ui/vnc-auth-sasl.h b/ui/vnc-auth-sasl.h
-index cb42745a6b..b9d8de1c10 100644
---- a/ui/vnc-auth-sasl.h
-+++ b/ui/vnc-auth-sasl.h
-@@ -53,6 +53,7 @@ struct VncStateSASL {
-      */
-     const uint8_t *encoded;
-     unsigned int encodedLength;
-+    unsigned int encodedRawLength;
-     unsigned int encodedOffset;
-     char *username;
-     char *mechlist;
--- 
-2.11.0
-
-
-From fef1bbadfb2c3027208eb3d14b43e1bdb51166ca Mon Sep 17 00:00:00 2001
-From: "Daniel P. Berrange" <berrange@redhat.com>
-Date: Mon, 18 Dec 2017 19:12:21 +0000
-Subject: [PATCH 07/14] ui: introduce enum to track VNC client framebuffer
- update request state
-MIME-Version: 1.0
-Content-Type: text/plain; charset=UTF-8
-Content-Transfer-Encoding: 8bit
-
-Currently the VNC servers tracks whether a client has requested an incremental
-or forced update with two boolean flags. There are only really 3 distinct
-states to track, so create an enum to more accurately reflect permitted states.
-
-Signed-off-by: Daniel P. Berrange <berrange@redhat.com>
-Reviewed-by: Darren Kenny <darren.kenny@oracle.com>
-Reviewed-by: Marc-André Lureau <marcandre.lureau@redhat.com>
-Message-id: 20171218191228.31018-7-berrange@redhat.com
-Signed-off-by: Gerd Hoffmann <kraxel@redhat.com>
----
- ui/vnc.c | 21 +++++++++++----------
- ui/vnc.h |  9 +++++++--
- 2 files changed, 18 insertions(+), 12 deletions(-)
-
-diff --git a/ui/vnc.c b/ui/vnc.c
-index a79848f083..30e2feeae3 100644
---- a/ui/vnc.c
-+++ b/ui/vnc.c
-@@ -975,16 +975,17 @@ static int vnc_update_client(VncState *vs, int has_dirty)
-     }
- 
-     vs->has_dirty += has_dirty;
--    if (!vs->need_update) {
-+    if (vs->update == VNC_STATE_UPDATE_NONE) {
-         return 0;
-     }
- 
--    if (vs->output.offset && !vs->audio_cap && !vs->force_update) {
-+    if (vs->output.offset && !vs->audio_cap &&
-+        vs->update != VNC_STATE_UPDATE_FORCE) {
-         /* kernel send buffers are full -> drop frames to throttle */
-         return 0;
-     }
- 
--    if (!vs->has_dirty && !vs->force_update) {
-+    if (!vs->has_dirty && vs->update != VNC_STATE_UPDATE_FORCE) {
-         return 0;
-     }
- 
-@@ -1030,7 +1031,7 @@ static int vnc_update_client(VncState *vs, int has_dirty)
-     }
- 
-     vnc_job_push(job);
--    vs->force_update = 0;
-+    vs->update = VNC_STATE_UPDATE_INCREMENTAL;
-     vs->has_dirty = 0;
-     return n;
- }
-@@ -1869,14 +1870,14 @@ static void ext_key_event(VncState *vs, int down,
- static void framebuffer_update_request(VncState *vs, int incremental,
-                                        int x, int y, int w, int h)
- {
--    vs->need_update = 1;
--
-     if (incremental) {
--        return;
-+        if (vs->update != VNC_STATE_UPDATE_FORCE) {
-+            vs->update = VNC_STATE_UPDATE_INCREMENTAL;
-+        }
-+    } else {
-+        vs->update = VNC_STATE_UPDATE_FORCE;
-+        vnc_set_area_dirty(vs->dirty, vs->vd, x, y, w, h);
-     }
--
--    vs->force_update = 1;
--    vnc_set_area_dirty(vs->dirty, vs->vd, x, y, w, h);
- }
- 
- static void send_ext_key_event_ack(VncState *vs)
-diff --git a/ui/vnc.h b/ui/vnc.h
-index 694cf32ca9..b9d310e640 100644
---- a/ui/vnc.h
-+++ b/ui/vnc.h
-@@ -252,6 +252,12 @@ struct VncJob
-     QTAILQ_ENTRY(VncJob) next;
- };
- 
-+typedef enum {
-+    VNC_STATE_UPDATE_NONE,
-+    VNC_STATE_UPDATE_INCREMENTAL,
-+    VNC_STATE_UPDATE_FORCE,
-+} VncStateUpdate;
-+
- struct VncState
- {
-     QIOChannelSocket *sioc; /* The underlying socket */
-@@ -264,8 +270,7 @@ struct VncState
-                            * vnc-jobs-async.c */
- 
-     VncDisplay *vd;
--    int need_update;
--    int force_update;
-+    VncStateUpdate update; /* Most recent pending request from client */
-     int has_dirty;
-     uint32_t features;
-     int absolute;
--- 
-2.11.0
-
-
-From 728a7ac95484a7ba5e624ccbac4c1326571576b0 Mon Sep 17 00:00:00 2001
-From: "Daniel P. Berrange" <berrange@redhat.com>
-Date: Mon, 18 Dec 2017 19:12:22 +0000
-Subject: [PATCH 08/14] ui: correctly reset framebuffer update state after
- processing dirty regions
-MIME-Version: 1.0
-Content-Type: text/plain; charset=UTF-8
-Content-Transfer-Encoding: 8bit
-
-According to the RFB protocol, a client sends one or more framebuffer update
-requests to the server. The server can reply with a single framebuffer update
-response, that covers all previously received requests. Once the client has
-read this update from the server, it may send further framebuffer update
-requests to monitor future changes. The client is free to delay sending the
-framebuffer update request if it needs to throttle the amount of data it is
-reading from the server.
-
-The QEMU VNC server, however, has never correctly handled the framebuffer
-update requests. Once QEMU has received an update request, it will continue to
-send client updates forever, even if the client hasn't asked for further
-updates. This prevents the client from throttling back data it gets from the
-server. This change fixes the flawed logic such that after a set of updates are
-sent out, QEMU waits for a further update request before sending more data.
-
-Signed-off-by: Daniel P. Berrange <berrange@redhat.com>
-Reviewed-by: Darren Kenny <darren.kenny@oracle.com>
-Reviewed-by: Marc-André Lureau <marcandre.lureau@redhat.com>
-Message-id: 20171218191228.31018-8-berrange@redhat.com
-Signed-off-by: Gerd Hoffmann <kraxel@redhat.com>
----
- ui/vnc.c | 2 +-
- 1 file changed, 1 insertion(+), 1 deletion(-)
-
-diff --git a/ui/vnc.c b/ui/vnc.c
-index 30e2feeae3..243c72be13 100644
---- a/ui/vnc.c
-+++ b/ui/vnc.c
-@@ -1031,7 +1031,7 @@ static int vnc_update_client(VncState *vs, int has_dirty)
-     }
- 
-     vnc_job_push(job);
--    vs->update = VNC_STATE_UPDATE_INCREMENTAL;
-+    vs->update = VNC_STATE_UPDATE_NONE;
-     vs->has_dirty = 0;
-     return n;
- }
--- 
-2.11.0
-
-
-From 0bad834228b9ee63e4239108d02dcb94568254d0 Mon Sep 17 00:00:00 2001
-From: "Daniel P. Berrange" <berrange@redhat.com>
-Date: Mon, 18 Dec 2017 19:12:23 +0000
-Subject: [PATCH 09/14] ui: refactor code for determining if an update should
- be sent to the client
-MIME-Version: 1.0
-Content-Type: text/plain; charset=UTF-8
-Content-Transfer-Encoding: 8bit
-
-The logic for determining if it is possible to send an update to the client
-will become more complicated shortly, so pull it out into a separate method
-for easier extension later.
-
-Signed-off-by: Daniel P. Berrange <berrange@redhat.com>
-Reviewed-by: Darren Kenny <darren.kenny@oracle.com>
-Reviewed-by: Marc-André Lureau <marcandre.lureau@redhat.com>
-Message-id: 20171218191228.31018-9-berrange@redhat.com
-Signed-off-by: Gerd Hoffmann <kraxel@redhat.com>
----
- ui/vnc.c | 27 ++++++++++++++++++++-------
- 1 file changed, 20 insertions(+), 7 deletions(-)
-
-diff --git a/ui/vnc.c b/ui/vnc.c
-index 243c72be13..4ba7fc076a 100644
---- a/ui/vnc.c
-+++ b/ui/vnc.c
-@@ -961,6 +961,25 @@ static int find_and_clear_dirty_height(VncState *vs,
-     return h;
- }
- 
-+static bool vnc_should_update(VncState *vs)
-+{
-+    switch (vs->update) {
-+    case VNC_STATE_UPDATE_NONE:
-+        break;
-+    case VNC_STATE_UPDATE_INCREMENTAL:
-+        /* Only allow incremental updates if the output buffer
-+         * is empty, or if audio capture is enabled.
-+         */
-+        if (!vs->output.offset || vs->audio_cap) {
-+            return true;
-+        }
-+        break;
-+    case VNC_STATE_UPDATE_FORCE:
-+        return true;
-+    }
-+    return false;
-+}
-+
- static int vnc_update_client(VncState *vs, int has_dirty)
- {
-     VncDisplay *vd = vs->vd;
-@@ -975,13 +994,7 @@ static int vnc_update_client(VncState *vs, int has_dirty)
-     }
- 
-     vs->has_dirty += has_dirty;
--    if (vs->update == VNC_STATE_UPDATE_NONE) {
--        return 0;
--    }
--
--    if (vs->output.offset && !vs->audio_cap &&
--        vs->update != VNC_STATE_UPDATE_FORCE) {
--        /* kernel send buffers are full -> drop frames to throttle */
-+    if (!vnc_should_update(vs)) {
-         return 0;
-     }
- 
--- 
-2.11.0
-
-
-From e2b72cb6e0443d90d7ab037858cb6834b6cca852 Mon Sep 17 00:00:00 2001
-From: "Daniel P. Berrange" <berrange@redhat.com>
-Date: Mon, 18 Dec 2017 19:12:24 +0000
-Subject: [PATCH 10/14] ui: fix VNC client throttling when audio capture is
- active
-MIME-Version: 1.0
-Content-Type: text/plain; charset=UTF-8
-Content-Transfer-Encoding: 8bit
-
-The VNC server must throttle data sent to the client to prevent the 'output'
-buffer size growing without bound, if the client stops reading data off the
-socket (either maliciously or due to stalled/slow network connection).
-
-The current throttling is very crude because it simply checks whether the
-output buffer offset is zero. This check must be disabled if audio capture is
-enabled, because when streaming audio the output buffer offset will rarely be
-zero due to queued audio data, and so this would starve framebuffer updates.
-
-As a result, the VNC client can cause QEMU to allocate arbitrary amounts of RAM.
-They can first start something in the guest that triggers lots of framebuffer
-updates eg play a youtube video. Then enable audio capture, and simply never
-read data back from the server. This can easily make QEMU's VNC server send
-buffer consume 100MB of RAM per second, until the OOM killer starts reaping
-processes (hopefully the rogue QEMU process, but it might pick others...).
-
-To address this we make the throttling more intelligent, so we can throttle
-when audio capture is active too. To determine how to throttle incremental
-updates or audio data, we calculate a size threshold. Normally the threshold is
-the approximate number of bytes associated with a single complete framebuffer
-update. ie width * height * bytes per pixel. We'll send incremental updates
-until we hit this threshold, at which point we'll stop sending updates until
-data has been written to the wire, causing the output buffer offset to fall
-back below the threshold.
-
-If audio capture is enabled, we increase the size of the threshold to also
-allow for upto 1 seconds worth of audio data samples. ie nchannels * bytes
-per sample * frequency. This allows the output buffer to have a mixture of
-incremental framebuffer updates and audio data queued, but once the threshold
-is exceeded, audio data will be dropped and incremental updates will be
-throttled.
-
-This unbounded memory growth affects all VNC server configurations supported by
-QEMU, with no workaround possible. The mitigating factor is that it can only be
-triggered by a client that has authenticated with the VNC server, and who is
-able to trigger a large quantity of framebuffer updates or audio samples from
-the guest OS. Mostly they'll just succeed in getting the OOM killer to kill
-their own QEMU process, but its possible other processes can get taken out as
-collateral damage.
-
-This is a more general variant of the similar unbounded memory usage flaw in
-the websockets server, that was previously assigned CVE-2017-15268, and fixed
-in 2.11 by:
-
-  commit a7b20a8efa28e5f22c26c06cd06c2f12bc863493
-  Author: Daniel P. Berrange <berrange@redhat.com>
-  Date:   Mon Oct 9 14:43:42 2017 +0100
-
-    io: monitor encoutput buffer size from websocket GSource
-
-This new general memory usage flaw has been assigned CVE-2017-15124, and is
-partially fixed by this patch.
-
-Signed-off-by: Daniel P. Berrange <berrange@redhat.com>
-Reviewed-by: Darren Kenny <darren.kenny@oracle.com>
-Reviewed-by: Marc-André Lureau <marcandre.lureau@redhat.com>
-Message-id: 20171218191228.31018-10-berrange@redhat.com
-Signed-off-by: Gerd Hoffmann <kraxel@redhat.com>
----
- ui/vnc.c | 72 ++++++++++++++++++++++++++++++++++++++++++++++++++++++++--------
- ui/vnc.h |  6 ++++++
- 2 files changed, 70 insertions(+), 8 deletions(-)
-
-diff --git a/ui/vnc.c b/ui/vnc.c
-index 4ba7fc076a..9e03cc7c01 100644
---- a/ui/vnc.c
-+++ b/ui/vnc.c
-@@ -60,6 +60,7 @@ static QTAILQ_HEAD(, VncDisplay) vnc_displays =
- 
- static int vnc_cursor_define(VncState *vs);
- static void vnc_release_modifiers(VncState *vs);
-+static void vnc_update_throttle_offset(VncState *vs);
- 
- static void vnc_set_share_mode(VncState *vs, VncShareMode mode)
- {
-@@ -766,6 +767,7 @@ static void vnc_dpy_switch(DisplayChangeListener *dcl,
-         vnc_set_area_dirty(vs->dirty, vd, 0, 0,
-                            vnc_width(vd),
-                            vnc_height(vd));
-+        vnc_update_throttle_offset(vs);
-     }
- }
- 
-@@ -961,16 +963,67 @@ static int find_and_clear_dirty_height(VncState *vs,
-     return h;
- }
- 
-+/*
-+ * Figure out how much pending data we should allow in the output
-+ * buffer before we throttle incremental display updates, and/or
-+ * drop audio samples.
-+ *
-+ * We allow for equiv of 1 full display's worth of FB updates,
-+ * and 1 second of audio samples. If audio backlog was larger
-+ * than that the client would already suffering awful audio
-+ * glitches, so dropping samples is no worse really).
-+ */
-+static void vnc_update_throttle_offset(VncState *vs)
-+{
-+    size_t offset =
-+        vs->client_width * vs->client_height * vs->client_pf.bytes_per_pixel;
-+
-+    if (vs->audio_cap) {
-+        int freq = vs->as.freq;
-+        /* We don't limit freq when reading settings from client, so
-+         * it could be upto MAX_INT in size. 48khz is a sensible
-+         * upper bound for trustworthy clients */
-+        int bps;
-+        if (freq > 48000) {
-+            freq = 48000;
-+        }
-+        switch (vs->as.fmt) {
-+        default:
-+        case  AUD_FMT_U8:
-+        case  AUD_FMT_S8:
-+            bps = 1;
-+            break;
-+        case  AUD_FMT_U16:
-+        case  AUD_FMT_S16:
-+            bps = 2;
-+            break;
-+        case  AUD_FMT_U32:
-+        case  AUD_FMT_S32:
-+            bps = 4;
-+            break;
-+        }
-+        offset += freq * bps * vs->as.nchannels;
-+    }
-+
-+    /* Put a floor of 1MB on offset, so that if we have a large pending
-+     * buffer and the display is resized to a small size & back again
-+     * we don't suddenly apply a tiny send limit
-+     */
-+    offset = MAX(offset, 1024 * 1024);
-+
-+    vs->throttle_output_offset = offset;
-+}
-+
- static bool vnc_should_update(VncState *vs)
- {
-     switch (vs->update) {
-     case VNC_STATE_UPDATE_NONE:
-         break;
-     case VNC_STATE_UPDATE_INCREMENTAL:
--        /* Only allow incremental updates if the output buffer
--         * is empty, or if audio capture is enabled.
-+        /* Only allow incremental updates if the pending send queue
-+         * is less than the permitted threshold
-          */
--        if (!vs->output.offset || vs->audio_cap) {
-+        if (vs->output.offset < vs->throttle_output_offset) {
-             return true;
-         }
-         break;
-@@ -1084,11 +1137,13 @@ static void audio_capture(void *opaque, void *buf, int size)
-     VncState *vs = opaque;
- 
-     vnc_lock_output(vs);
--    vnc_write_u8(vs, VNC_MSG_SERVER_QEMU);
--    vnc_write_u8(vs, VNC_MSG_SERVER_QEMU_AUDIO);
--    vnc_write_u16(vs, VNC_MSG_SERVER_QEMU_AUDIO_DATA);
--    vnc_write_u32(vs, size);
--    vnc_write(vs, buf, size);
-+    if (vs->output.offset < vs->throttle_output_offset) {
-+        vnc_write_u8(vs, VNC_MSG_SERVER_QEMU);
-+        vnc_write_u8(vs, VNC_MSG_SERVER_QEMU_AUDIO);
-+        vnc_write_u16(vs, VNC_MSG_SERVER_QEMU_AUDIO_DATA);
-+        vnc_write_u32(vs, size);
-+        vnc_write(vs, buf, size);
-+    }
-     vnc_unlock_output(vs);
-     vnc_flush(vs);
- }
-@@ -2288,6 +2343,7 @@ static int protocol_client_msg(VncState *vs, uint8_t *data, size_t len)
-         break;
-     }
- 
-+    vnc_update_throttle_offset(vs);
-     vnc_read_when(vs, protocol_client_msg, 1);
-     return 0;
- }
-diff --git a/ui/vnc.h b/ui/vnc.h
-index b9d310e640..8fe69595c6 100644
---- a/ui/vnc.h
-+++ b/ui/vnc.h
-@@ -298,6 +298,12 @@ struct VncState
- 
-     VncClientInfo *info;
- 
-+    /* We allow multiple incremental updates or audio capture
-+     * samples to be queued in output buffer, provided the
-+     * buffer size doesn't exceed this threshold. The value
-+     * is calculating dynamically based on framebuffer size
-+     * and audio sample settings in vnc_update_throttle_offset() */
-+    size_t throttle_output_offset;
-     Buffer output;
-     Buffer input;
-     /* current output mode information */
--- 
-2.11.0
-
-
-From ada8d2e4369ea49677d8672ac81bce73eefd5b54 Mon Sep 17 00:00:00 2001
-From: "Daniel P. Berrange" <berrange@redhat.com>
-Date: Mon, 18 Dec 2017 19:12:25 +0000
-Subject: [PATCH 11/14] ui: fix VNC client throttling when forced update is
- requested
-MIME-Version: 1.0
-Content-Type: text/plain; charset=UTF-8
-Content-Transfer-Encoding: 8bit
-
-The VNC server must throttle data sent to the client to prevent the 'output'
-buffer size growing without bound, if the client stops reading data off the
-socket (either maliciously or due to stalled/slow network connection).
-
-The current throttling is very crude because it simply checks whether the
-output buffer offset is zero. This check is disabled if the client has requested
-a forced update, because we want to send these as soon as possible.
-
-As a result, the VNC client can cause QEMU to allocate arbitrary amounts of RAM.
-They can first start something in the guest that triggers lots of framebuffer
-updates eg play a youtube video. Then repeatedly send full framebuffer update
-requests, but never read data back from the server. This can easily make QEMU's
-VNC server send buffer consume 100MB of RAM per second, until the OOM killer
-starts reaping processes (hopefully the rogue QEMU process, but it might pick
-others...).
-
-To address this we make the throttling more intelligent, so we can throttle
-full updates. When we get a forced update request, we keep track of exactly how
-much data we put on the output buffer. We will not process a subsequent forced
-update request until this data has been fully sent on the wire. We always allow
-one forced update request to be in flight, regardless of what data is queued
-for incremental updates or audio data. The slight complication is that we do
-not initially know how much data an update will send, as this is done in the
-background by the VNC job thread. So we must track the fact that the job thread
-has an update pending, and not process any further updates until this job is
-has been completed & put data on the output buffer.
-
-This unbounded memory growth affects all VNC server configurations supported by
-QEMU, with no workaround possible. The mitigating factor is that it can only be
-triggered by a client that has authenticated with the VNC server, and who is
-able to trigger a large quantity of framebuffer updates or audio samples from
-the guest OS. Mostly they'll just succeed in getting the OOM killer to kill
-their own QEMU process, but its possible other processes can get taken out as
-collateral damage.
-
-This is a more general variant of the similar unbounded memory usage flaw in
-the websockets server, that was previously assigned CVE-2017-15268, and fixed
-in 2.11 by:
-
-  commit a7b20a8efa28e5f22c26c06cd06c2f12bc863493
-  Author: Daniel P. Berrange <berrange@redhat.com>
-  Date:   Mon Oct 9 14:43:42 2017 +0100
-
-    io: monitor encoutput buffer size from websocket GSource
-
-This new general memory usage flaw has been assigned CVE-2017-15124, and is
-partially fixed by this patch.
-
-Signed-off-by: Daniel P. Berrange <berrange@redhat.com>
-Reviewed-by: Darren Kenny <darren.kenny@oracle.com>
-Reviewed-by: Marc-André Lureau <marcandre.lureau@redhat.com>
-Message-id: 20171218191228.31018-11-berrange@redhat.com
-Signed-off-by: Gerd Hoffmann <kraxel@redhat.com>
----
- ui/vnc-auth-sasl.c |  5 +++++
- ui/vnc-jobs.c      |  5 +++++
- ui/vnc.c           | 28 ++++++++++++++++++++++++----
- ui/vnc.h           |  7 +++++++
- 4 files changed, 41 insertions(+), 4 deletions(-)
-
-diff --git a/ui/vnc-auth-sasl.c b/ui/vnc-auth-sasl.c
-index 761493b9b2..8c1cdde3db 100644
---- a/ui/vnc-auth-sasl.c
-+++ b/ui/vnc-auth-sasl.c
-@@ -79,6 +79,11 @@ long vnc_client_write_sasl(VncState *vs)
- 
-     vs->sasl.encodedOffset += ret;
-     if (vs->sasl.encodedOffset == vs->sasl.encodedLength) {
-+        if (vs->sasl.encodedRawLength >= vs->force_update_offset) {
-+            vs->force_update_offset = 0;
-+        } else {
-+            vs->force_update_offset -= vs->sasl.encodedRawLength;
-+        }
-         vs->output.offset -= vs->sasl.encodedRawLength;
-         vs->sasl.encoded = NULL;
-         vs->sasl.encodedOffset = vs->sasl.encodedLength = 0;
-diff --git a/ui/vnc-jobs.c b/ui/vnc-jobs.c
-index f7867771ae..e326679dd0 100644
---- a/ui/vnc-jobs.c
-+++ b/ui/vnc-jobs.c
-@@ -152,6 +152,11 @@ void vnc_jobs_consume_buffer(VncState *vs)
-                 vs->ioc, G_IO_IN | G_IO_OUT, vnc_client_io, vs, NULL);
-         }
-         buffer_move(&vs->output, &vs->jobs_buffer);
-+
-+        if (vs->job_update == VNC_STATE_UPDATE_FORCE) {
-+            vs->force_update_offset = vs->output.offset;
-+        }
-+        vs->job_update = VNC_STATE_UPDATE_NONE;
-     }
-     flush = vs->ioc != NULL && vs->abort != true;
-     vnc_unlock_output(vs);
-diff --git a/ui/vnc.c b/ui/vnc.c
-index 9e03cc7c01..4805ac41d0 100644
---- a/ui/vnc.c
-+++ b/ui/vnc.c
-@@ -1021,14 +1021,28 @@ static bool vnc_should_update(VncState *vs)
-         break;
-     case VNC_STATE_UPDATE_INCREMENTAL:
-         /* Only allow incremental updates if the pending send queue
--         * is less than the permitted threshold
-+         * is less than the permitted threshold, and the job worker
-+         * is completely idle.
-          */
--        if (vs->output.offset < vs->throttle_output_offset) {
-+        if (vs->output.offset < vs->throttle_output_offset &&
-+            vs->job_update == VNC_STATE_UPDATE_NONE) {
-             return true;
-         }
-         break;
-     case VNC_STATE_UPDATE_FORCE:
--        return true;
-+        /* Only allow forced updates if the pending send queue
-+         * does not contain a previous forced update, and the
-+         * job worker is completely idle.
-+         *
-+         * Note this means we'll queue a forced update, even if
-+         * the output buffer size is otherwise over the throttle
-+         * output limit.
-+         */
-+        if (vs->force_update_offset == 0 &&
-+            vs->job_update == VNC_STATE_UPDATE_NONE) {
-+            return true;
-+        }
-+        break;
-     }
-     return false;
- }
-@@ -1096,8 +1110,9 @@ static int vnc_update_client(VncState *vs, int has_dirty)
-         }
-     }
- 
--    vnc_job_push(job);
-+    vs->job_update = vs->update;
-     vs->update = VNC_STATE_UPDATE_NONE;
-+    vnc_job_push(job);
-     vs->has_dirty = 0;
-     return n;
- }
-@@ -1332,6 +1347,11 @@ static ssize_t vnc_client_write_plain(VncState *vs)
-     if (!ret)
-         return 0;
- 
-+    if (ret >= vs->force_update_offset) {
-+        vs->force_update_offset = 0;
-+    } else {
-+        vs->force_update_offset -= ret;
-+    }
-     buffer_advance(&vs->output, ret);
- 
-     if (vs->output.offset == 0) {
-diff --git a/ui/vnc.h b/ui/vnc.h
-index 8fe69595c6..3f4cd4d93d 100644
---- a/ui/vnc.h
-+++ b/ui/vnc.h
-@@ -271,6 +271,7 @@ struct VncState
- 
-     VncDisplay *vd;
-     VncStateUpdate update; /* Most recent pending request from client */
-+    VncStateUpdate job_update; /* Currently processed by job thread */
-     int has_dirty;
-     uint32_t features;
-     int absolute;
-@@ -298,6 +299,12 @@ struct VncState
- 
-     VncClientInfo *info;
- 
-+    /* Job thread bottom half has put data for a forced update
-+     * into the output buffer. This offset points to the end of
-+     * the update data in the output buffer. This lets us determine
-+     * when a force update is fully sent to the client, allowing
-+     * us to process further forced updates. */
-+    size_t force_update_offset;
-     /* We allow multiple incremental updates or audio capture
-      * samples to be queued in output buffer, provided the
-      * buffer size doesn't exceed this threshold. The value
--- 
-2.11.0
-
-
-From f887cf165db20f405cb8805c716bd363aaadf815 Mon Sep 17 00:00:00 2001
-From: "Daniel P. Berrange" <berrange@redhat.com>
-Date: Mon, 18 Dec 2017 19:12:26 +0000
-Subject: [PATCH 12/14] ui: place a hard cap on VNC server output buffer size
-MIME-Version: 1.0
-Content-Type: text/plain; charset=UTF-8
-Content-Transfer-Encoding: 8bit
-
-The previous patches fix problems with throttling of forced framebuffer updates
-and audio data capture that would cause the QEMU output buffer size to grow
-without bound. Those fixes are graceful in that once the client catches up with
-reading data from the server, everything continues operating normally.
-
-There is some data which the server sends to the client that is impractical to
-throttle. Specifically there are various pseudo framebuffer update encodings to
-inform the client of things like desktop resizes, pointer changes, audio
-playback start/stop, LED state and so on. These generally only involve sending
-a very small amount of data to the client, but a malicious guest might be able
-to do things that trigger these changes at a very high rate. Throttling them is
-not practical as missed or delayed events would cause broken behaviour for the
-client.
-
-This patch thus takes a more forceful approach of setting an absolute upper
-bound on the amount of data we permit to be present in the output buffer at
-any time. The previous patch set a threshold for throttling the output buffer
-by allowing an amount of data equivalent to one complete framebuffer update and
-one seconds worth of audio data. On top of this it allowed for one further
-forced framebuffer update to be queued.
-
-To be conservative, we thus take that throttling threshold and multiply it by
-5 to form an absolute upper bound. If this bound is hit during vnc_write() we
-forceably disconnect the client, refusing to queue further data. This limit is
-high enough that it should never be hit unless a malicious client is trying to
-exploit the sever, or the network is completely saturated preventing any sending
-of data on the socket.
-
-This completes the fix for CVE-2017-15124 started in the previous patches.
-
-Signed-off-by: Daniel P. Berrange <berrange@redhat.com>
-Reviewed-by: Darren Kenny <darren.kenny@oracle.com>
-Reviewed-by: Marc-André Lureau <marcandre.lureau@redhat.com>
-Message-id: 20171218191228.31018-12-berrange@redhat.com
-Signed-off-by: Gerd Hoffmann <kraxel@redhat.com>
----
- ui/vnc.c | 29 +++++++++++++++++++++++++++++
- 1 file changed, 29 insertions(+)
-
-diff --git a/ui/vnc.c b/ui/vnc.c
-index 4805ac41d0..e53e84587a 100644
---- a/ui/vnc.c
-+++ b/ui/vnc.c
-@@ -1521,8 +1521,37 @@ gboolean vnc_client_io(QIOChannel *ioc G_GNUC_UNUSED,
- }
- 
- 
-+/*
-+ * Scale factor to apply to vs->throttle_output_offset when checking for
-+ * hard limit. Worst case normal usage could be x2, if we have a complete
-+ * incremental update and complete forced update in the output buffer.
-+ * So x3 should be good enough, but we pick x5 to be conservative and thus
-+ * (hopefully) never trigger incorrectly.
-+ */
-+#define VNC_THROTTLE_OUTPUT_LIMIT_SCALE 5
-+
- void vnc_write(VncState *vs, const void *data, size_t len)
- {
-+    if (vs->disconnecting) {
-+        return;
-+    }
-+    /* Protection against malicious client/guest to prevent our output
-+     * buffer growing without bound if client stops reading data. This
-+     * should rarely trigger, because we have earlier throttling code
-+     * which stops issuing framebuffer updates and drops audio data
-+     * if the throttle_output_offset value is exceeded. So we only reach
-+     * this higher level if a huge number of pseudo-encodings get
-+     * triggered while data can't be sent on the socket.
-+     *
-+     * NB throttle_output_offset can be zero during early protocol
-+     * handshake, or from the job thread's VncState clone
-+     */
-+    if (vs->throttle_output_offset != 0 &&
-+        vs->output.offset > (vs->throttle_output_offset *
-+                             VNC_THROTTLE_OUTPUT_LIMIT_SCALE)) {
-+        vnc_disconnect_start(vs);
-+        return;
-+    }
-     buffer_reserve(&vs->output, len);
- 
-     if (vs->ioc != NULL && buffer_empty(&vs->output)) {
--- 
-2.11.0
-
-
-From 6aa22a29187e1908f5db738d27c64a9efc8d0bfa Mon Sep 17 00:00:00 2001
-From: "Daniel P. Berrange" <berrange@redhat.com>
-Date: Mon, 18 Dec 2017 19:12:27 +0000
-Subject: [PATCH 13/14] ui: add trace events related to VNC client throttling
-MIME-Version: 1.0
-Content-Type: text/plain; charset=UTF-8
-Content-Transfer-Encoding: 8bit
-
-The VNC client throttling is quite subtle so will benefit from having trace
-points available for live debugging.
-
-Signed-off-by: Daniel P. Berrange <berrange@redhat.com>
-Reviewed-by: Darren Kenny <darren.kenny@oracle.com>
-Reviewed-by: Marc-André Lureau <marcandre.lureau@redhat.com>
-Message-id: 20171218191228.31018-13-berrange@redhat.com
-Signed-off-by: Gerd Hoffmann <kraxel@redhat.com>
----
- ui/trace-events |  7 +++++++
- ui/vnc.c        | 23 +++++++++++++++++++++++
- 2 files changed, 30 insertions(+)
-
-diff --git a/ui/trace-events b/ui/trace-events
-index 1a9f126330..85f74f948b 100644
---- a/ui/trace-events
-+++ b/ui/trace-events
-@@ -35,6 +35,13 @@ vnc_client_connect(void *state, void *ioc) "VNC client connect state=%p ioc=%p"
- vnc_client_disconnect_start(void *state, void *ioc) "VNC client disconnect start state=%p ioc=%p"
- vnc_client_disconnect_finish(void *state, void *ioc) "VNC client disconnect finish state=%p ioc=%p"
- vnc_client_io_wrap(void *state, void *ioc, const char *type) "VNC client I/O wrap state=%p ioc=%p type=%s"
-+vnc_client_throttle_threshold(void *state, void *ioc, size_t oldoffset, size_t offset, int client_width, int client_height, int bytes_per_pixel, void *audio_cap) "VNC client throttle threshold state=%p ioc=%p oldoffset=%zu newoffset=%zu width=%d height=%d bpp=%d audio=%p"
-+vnc_client_throttle_incremental(void *state, void *ioc, int job_update, size_t offset) "VNC client throttle incremental state=%p ioc=%p job-update=%d offset=%zu"
-+vnc_client_throttle_forced(void *state, void *ioc, int job_update, size_t offset) "VNC client throttle forced state=%p ioc=%p job-update=%d offset=%zu"
-+vnc_client_throttle_audio(void *state, void *ioc, size_t offset) "VNC client throttle audio state=%p ioc=%p offset=%zu"
-+vnc_client_unthrottle_forced(void *state, void *ioc) "VNC client unthrottle forced offset state=%p ioc=%p"
-+vnc_client_unthrottle_incremental(void *state, void *ioc, size_t offset) "VNC client unthrottle incremental state=%p ioc=%p offset=%zu"
-+vnc_client_output_limit(void *state, void *ioc, size_t offset, size_t threshold) "VNC client output limit state=%p ioc=%p offset=%zu threshold=%zu"
- vnc_auth_init(void *display, int websock, int auth, int subauth) "VNC auth init state=%p websock=%d auth=%d subauth=%d"
- vnc_auth_start(void *state, int method) "VNC client auth start state=%p method=%d"
- vnc_auth_pass(void *state, int method) "VNC client auth passed state=%p method=%d"
-diff --git a/ui/vnc.c b/ui/vnc.c
-index e53e84587a..0a5e629d5d 100644
---- a/ui/vnc.c
-+++ b/ui/vnc.c
-@@ -1011,6 +1011,12 @@ static void vnc_update_throttle_offset(VncState *vs)
-      */
-     offset = MAX(offset, 1024 * 1024);
- 
-+    if (vs->throttle_output_offset != offset) {
-+        trace_vnc_client_throttle_threshold(
-+            vs, vs->ioc, vs->throttle_output_offset, offset, vs->client_width,
-+            vs->client_height, vs->client_pf.bytes_per_pixel, vs->audio_cap);
-+    }
-+
-     vs->throttle_output_offset = offset;
- }
- 
-@@ -1028,6 +1034,8 @@ static bool vnc_should_update(VncState *vs)
-             vs->job_update == VNC_STATE_UPDATE_NONE) {
-             return true;
-         }
-+        trace_vnc_client_throttle_incremental(
-+            vs, vs->ioc, vs->job_update, vs->output.offset);
-         break;
-     case VNC_STATE_UPDATE_FORCE:
-         /* Only allow forced updates if the pending send queue
-@@ -1042,6 +1050,8 @@ static bool vnc_should_update(VncState *vs)
-             vs->job_update == VNC_STATE_UPDATE_NONE) {
-             return true;
-         }
-+        trace_vnc_client_throttle_forced(
-+            vs, vs->ioc, vs->job_update, vs->force_update_offset);
-         break;
-     }
-     return false;
-@@ -1158,6 +1168,8 @@ static void audio_capture(void *opaque, void *buf, int size)
-         vnc_write_u16(vs, VNC_MSG_SERVER_QEMU_AUDIO_DATA);
-         vnc_write_u32(vs, size);
-         vnc_write(vs, buf, size);
-+    } else {
-+        trace_vnc_client_throttle_audio(vs, vs->ioc, vs->output.offset);
-     }
-     vnc_unlock_output(vs);
-     vnc_flush(vs);
-@@ -1328,6 +1340,7 @@ ssize_t vnc_client_write_buf(VncState *vs, const uint8_t *data, size_t datalen)
-  */
- static ssize_t vnc_client_write_plain(VncState *vs)
- {
-+    size_t offset;
-     ssize_t ret;
- 
- #ifdef CONFIG_VNC_SASL
-@@ -1348,11 +1361,19 @@ static ssize_t vnc_client_write_plain(VncState *vs)
-         return 0;
- 
-     if (ret >= vs->force_update_offset) {
-+        if (vs->force_update_offset != 0) {
-+            trace_vnc_client_unthrottle_forced(vs, vs->ioc);
-+        }
-         vs->force_update_offset = 0;
-     } else {
-         vs->force_update_offset -= ret;
-     }
-+    offset = vs->output.offset;
-     buffer_advance(&vs->output, ret);
-+    if (offset >= vs->throttle_output_offset &&
-+        vs->output.offset < vs->throttle_output_offset) {
-+        trace_vnc_client_unthrottle_incremental(vs, vs->ioc, vs->output.offset);
-+    }
- 
-     if (vs->output.offset == 0) {
-         if (vs->ioc_tag) {
-@@ -1549,6 +1570,8 @@ void vnc_write(VncState *vs, const void *data, size_t len)
-     if (vs->throttle_output_offset != 0 &&
-         vs->output.offset > (vs->throttle_output_offset *
-                              VNC_THROTTLE_OUTPUT_LIMIT_SCALE)) {
-+        trace_vnc_client_output_limit(vs, vs->ioc, vs->output.offset,
-+                                      vs->throttle_output_offset);
-         vnc_disconnect_start(vs);
-         return;
-     }
--- 
-2.11.0
-
-
-From 30b80fd5269257f55203b7072c505b4ebaab5115 Mon Sep 17 00:00:00 2001
-From: "Daniel P. Berrange" <berrange@redhat.com>
-Date: Mon, 18 Dec 2017 19:12:28 +0000
-Subject: [PATCH 14/14] ui: mix misleading comments & return types of VNC I/O
- helper methods
-MIME-Version: 1.0
-Content-Type: text/plain; charset=UTF-8
-Content-Transfer-Encoding: 8bit
-
-While the QIOChannel APIs for reading/writing data return ssize_t, with negative
-value indicating an error, the VNC code passes this return value through the
-vnc_client_io_error() method. This detects the error condition, disconnects the
-client and returns 0 to indicate error. Thus all the VNC helper methods should
-return size_t (unsigned), and misleading comments which refer to the possibility
-of negative return values need fixing.
-
-Signed-off-by: Daniel P. Berrange <berrange@redhat.com>
-Reviewed-by: Darren Kenny <darren.kenny@oracle.com>
-Reviewed-by: Marc-André Lureau <marcandre.lureau@redhat.com>
-Message-id: 20171218191228.31018-14-berrange@redhat.com
-Signed-off-by: Gerd Hoffmann <kraxel@redhat.com>
----
- ui/vnc-auth-sasl.c |  8 ++++----
- ui/vnc-auth-sasl.h |  4 ++--
- ui/vnc.c           | 29 +++++++++++++++--------------
- ui/vnc.h           |  6 +++---
- 4 files changed, 24 insertions(+), 23 deletions(-)
-
-diff --git a/ui/vnc-auth-sasl.c b/ui/vnc-auth-sasl.c
-index 8c1cdde3db..74a5f513f2 100644
---- a/ui/vnc-auth-sasl.c
-+++ b/ui/vnc-auth-sasl.c
-@@ -48,9 +48,9 @@ void vnc_sasl_client_cleanup(VncState *vs)
- }
- 
- 
--long vnc_client_write_sasl(VncState *vs)
-+size_t vnc_client_write_sasl(VncState *vs)
- {
--    long ret;
-+    size_t ret;
- 
-     VNC_DEBUG("Write SASL: Pending output %p size %zd offset %zd "
-               "Encoded: %p size %d offset %d\n",
-@@ -106,9 +106,9 @@ long vnc_client_write_sasl(VncState *vs)
- }
- 
- 
--long vnc_client_read_sasl(VncState *vs)
-+size_t vnc_client_read_sasl(VncState *vs)
- {
--    long ret;
-+    size_t ret;
-     uint8_t encoded[4096];
-     const char *decoded;
-     unsigned int decodedLen;
-diff --git a/ui/vnc-auth-sasl.h b/ui/vnc-auth-sasl.h
-index b9d8de1c10..2ae224ee3a 100644
---- a/ui/vnc-auth-sasl.h
-+++ b/ui/vnc-auth-sasl.h
-@@ -65,8 +65,8 @@ struct VncDisplaySASL {
- 
- void vnc_sasl_client_cleanup(VncState *vs);
- 
--long vnc_client_read_sasl(VncState *vs);
--long vnc_client_write_sasl(VncState *vs);
-+size_t vnc_client_read_sasl(VncState *vs);
-+size_t vnc_client_write_sasl(VncState *vs);
- 
- void start_auth_sasl(VncState *vs);
- 
-diff --git a/ui/vnc.c b/ui/vnc.c
-index 0a5e629d5d..665a143578 100644
---- a/ui/vnc.c
-+++ b/ui/vnc.c
-@@ -1272,7 +1272,7 @@ void vnc_disconnect_finish(VncState *vs)
-     g_free(vs);
- }
- 
--ssize_t vnc_client_io_error(VncState *vs, ssize_t ret, Error **errp)
-+size_t vnc_client_io_error(VncState *vs, ssize_t ret, Error **errp)
- {
-     if (ret <= 0) {
-         if (ret == 0) {
-@@ -1315,9 +1315,9 @@ void vnc_client_error(VncState *vs)
-  *
-  * Returns the number of bytes written, which may be less than
-  * the requested 'datalen' if the socket would block. Returns
-- * -1 on error, and disconnects the client socket.
-+ * 0 on I/O error, and disconnects the client socket.
-  */
--ssize_t vnc_client_write_buf(VncState *vs, const uint8_t *data, size_t datalen)
-+size_t vnc_client_write_buf(VncState *vs, const uint8_t *data, size_t datalen)
- {
-     Error *err = NULL;
-     ssize_t ret;
-@@ -1335,13 +1335,13 @@ ssize_t vnc_client_write_buf(VncState *vs, const uint8_t *data, size_t datalen)
-  * will switch the FD poll() handler back to read monitoring.
-  *
-  * Returns the number of bytes written, which may be less than
-- * the buffered output data if the socket would block. Returns
-- * -1 on error, and disconnects the client socket.
-+ * the buffered output data if the socket would block.  Returns
-+ * 0 on I/O error, and disconnects the client socket.
-  */
--static ssize_t vnc_client_write_plain(VncState *vs)
-+static size_t vnc_client_write_plain(VncState *vs)
- {
-     size_t offset;
--    ssize_t ret;
-+    size_t ret;
- 
- #ifdef CONFIG_VNC_SASL
-     VNC_DEBUG("Write Plain: Pending output %p size %zd offset %zd. Wait SSF %d\n",
-@@ -1442,9 +1442,9 @@ void vnc_read_when(VncState *vs, VncReadEvent *func, size_t expecting)
-  *
-  * Returns the number of bytes read, which may be less than
-  * the requested 'datalen' if the socket would block. Returns
-- * -1 on error, and disconnects the client socket.
-+ * 0 on I/O error or EOF, and disconnects the client socket.
-  */
--ssize_t vnc_client_read_buf(VncState *vs, uint8_t *data, size_t datalen)
-+size_t vnc_client_read_buf(VncState *vs, uint8_t *data, size_t datalen)
- {
-     ssize_t ret;
-     Error *err = NULL;
-@@ -1460,12 +1460,13 @@ ssize_t vnc_client_read_buf(VncState *vs, uint8_t *data, size_t datalen)
-  * when not using any SASL SSF encryption layers. Will read as much
-  * data as possible without blocking.
-  *
-- * Returns the number of bytes read. Returns -1 on error, and
-- * disconnects the client socket.
-+ * Returns the number of bytes read, which may be less than
-+ * the requested 'datalen' if the socket would block. Returns
-+ * 0 on I/O error or EOF, and disconnects the client socket.
-  */
--static ssize_t vnc_client_read_plain(VncState *vs)
-+static size_t vnc_client_read_plain(VncState *vs)
- {
--    ssize_t ret;
-+    size_t ret;
-     VNC_DEBUG("Read plain %p size %zd offset %zd\n",
-               vs->input.buffer, vs->input.capacity, vs->input.offset);
-     buffer_reserve(&vs->input, 4096);
-@@ -1491,7 +1492,7 @@ static void vnc_jobs_bh(void *opaque)
-  */
- static int vnc_client_read(VncState *vs)
- {
--    ssize_t ret;
-+    size_t ret;
- 
- #ifdef CONFIG_VNC_SASL
-     if (vs->sasl.conn && vs->sasl.runSSF)
-diff --git a/ui/vnc.h b/ui/vnc.h
-index 3f4cd4d93d..0c33a5f7fe 100644
---- a/ui/vnc.h
-+++ b/ui/vnc.h
-@@ -524,8 +524,8 @@ gboolean vnc_client_io(QIOChannel *ioc,
-                        GIOCondition condition,
-                        void *opaque);
- 
--ssize_t vnc_client_read_buf(VncState *vs, uint8_t *data, size_t datalen);
--ssize_t vnc_client_write_buf(VncState *vs, const uint8_t *data, size_t datalen);
-+size_t vnc_client_read_buf(VncState *vs, uint8_t *data, size_t datalen);
-+size_t vnc_client_write_buf(VncState *vs, const uint8_t *data, size_t datalen);
- 
- /* Protocol I/O functions */
- void vnc_write(VncState *vs, const void *data, size_t len);
-@@ -544,7 +544,7 @@ uint32_t read_u32(uint8_t *data, size_t offset);
- 
- /* Protocol stage functions */
- void vnc_client_error(VncState *vs);
--ssize_t vnc_client_io_error(VncState *vs, ssize_t ret, Error **errp);
-+size_t vnc_client_io_error(VncState *vs, ssize_t ret, Error **errp);
- 
- void start_client_init(VncState *vs);
- void start_auth_vnc(VncState *vs);
--- 
-2.11.0
diff --git a/meta/recipes-devtools/qemu/qemu_2.11.0.bb b/meta/recipes-devtools/qemu/qemu_2.11.1.bb
similarity index 91%
rename from meta/recipes-devtools/qemu/qemu_2.11.0.bb
rename to meta/recipes-devtools/qemu/qemu_2.11.1.bb
index 10760dc2db..f0e20cc125 100644
--- a/meta/recipes-devtools/qemu/qemu_2.11.0.bb
+++ b/meta/recipes-devtools/qemu/qemu_2.11.1.bb
@@ -22,7 +22,6 @@ SRC_URI = "http://wiki.qemu-project.org/download/${BP}.tar.bz2 \
            file://apic-fixup-fallthrough-to-PIC.patch \
            file://linux-user-Fix-webkitgtk-hangs-on-32-bit-x86-target.patch \
            file://memfd.patch \
-           file://CVE-2017-15124.patch \
            "
 UPSTREAM_CHECK_REGEX = "qemu-(?P<pver>\d+\..*)\.tar"
 
@@ -32,8 +31,8 @@ SRC_URI_append_class-native = " \
             file://cpus.c-qemu_cpu_kick_thread_debugging.patch \
             "
 
-SRC_URI[md5sum] = "335994a755bc655e88a87aeb36bfc0b9"
-SRC_URI[sha256sum] = "c4f034c7665a84a1c3be72c8da37f3c31ec063475699df062ab646d8b2e17fcb"
+SRC_URI[md5sum] = "61cf862b6007eba4ac98247776af2e27"
+SRC_URI[sha256sum] = "d9df2213ceed32e91dab7bc9dd19c1af83f91ba72c7aeef7605dfaaf81732ccb"
 
 COMPATIBLE_HOST_mipsarchn32 = "null"
 COMPATIBLE_HOST_mipsarchn64 = "null"
-- 
2.14.1


