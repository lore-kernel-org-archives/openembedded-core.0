Return-Path: <alistai@xilinx.com>
X-Greylist: delayed 3597 seconds by postgrey-1.34 at layers.openembedded.org;
	Tue, 26 Sep 2017 00:34:32 UTC
Received: from NAM02-SN1-obe.outbound.protection.outlook.com
	(mail-sn1nam02on0087.outbound.protection.outlook.com [104.47.36.87])
	by mail.openembedded.org (Postfix) with ESMTP id 361C677BC9
	for <openembedded-core@lists.openembedded.org>;
	Tue, 26 Sep 2017 00:34:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=xilinx.onmicrosoft.com; s=selector1-xilinx-com;
	h=From:Date:Subject:Message-ID:Content-Type:MIME-Version;
	bh=WLyd9GWHvVis5q17ZOuvBRTKlHpRd9Fl7iU1FeR+59k=;
	b=3Oiwp84LIDiKFwHgIUAa8jt1m51kEIkMRHTBrzYTXj4f7rmvTLugSnxYKK1UQgJuJxvbW5rarBnlNBgaPL/Grg6ORQN8LE5pryww/CvSp9JQFcirRwdtO6fA2B/aWwfnRuhKKuS4s+O3YRM2HoCZlpeaKurdHKoy9v13xS1P2v0=
Received: from BN6PR02CA0102.namprd02.prod.outlook.com (2603:10b6:405:60::43)
	by BY1PR02MB1130.namprd02.prod.outlook.com (2a01:111:e400:52a7::16)
	with Microsoft SMTP Server (version=TLS1_2,
	cipher=TLS_ECDHE_RSA_WITH_AES_256_CBC_SHA384_P256) id 15.20.77.7;
	Mon, 25 Sep 2017 23:01:04 +0000
Received: from SN1NAM02FT035.eop-nam02.prod.protection.outlook.com
	(2a01:111:f400:7e44::206) by BN6PR02CA0102.outlook.office365.com
	(2603:10b6:405:60::43) with Microsoft SMTP Server (version=TLS1_2,
	cipher=TLS_ECDHE_RSA_WITH_AES_256_CBC_SHA384_P256) id 15.20.56.11 via
	Frontend Transport; Mon, 25 Sep 2017 23:01:04 +0000
Authentication-Results: spf=pass (sender IP is 149.199.60.100)
	smtp.mailfrom=xilinx.com; linuxfoundation.org;
	dkim=none (message not signed)
	header.d=none;linuxfoundation.org; dmarc=bestguesspass action=none
	header.from=xilinx.com;
Received-SPF: Pass (protection.outlook.com: domain of xilinx.com designates
	149.199.60.100 as permitted sender) receiver=protection.outlook.com;
	client-ip=149.199.60.100; helo=xsj-pvapsmtpgw02;
Received: from xsj-pvapsmtpgw02 (149.199.60.100) by
	SN1NAM02FT035.mail.protection.outlook.com (10.152.72.145) with
	Microsoft SMTP Server (version=TLS1_0,
	cipher=TLS_RSA_WITH_AES_256_CBC_SHA) id 15.20.35.14
	via Frontend Transport; Mon, 25 Sep 2017 23:01:04 +0000
Received: from unknown-38-66.xilinx.com ([149.199.38.66]:54050
	helo=xsj-pvapsmtp01) by xsj-pvapsmtpgw02 with esmtp (Exim 4.63)
	(envelope-from <alistair.francis@xilinx.com>)
	id 1dwcN5-0001J9-20; Mon, 25 Sep 2017 16:01:03 -0700
Received: from [127.0.0.1] (helo=localhost)
	by xsj-pvapsmtp01 with smtp (Exim 4.63)
	(envelope-from <alistair.francis@xilinx.com>)
	id 1dwcN4-0008Fb-Q9; Mon, 25 Sep 2017 16:01:02 -0700
Received: from xsj-pvapsmtp01 (xsj-mail.xilinx.com [149.199.38.66])
	by xsj-smtp-dlp1.xlnx.xilinx.com (8.13.8/8.13.1) with ESMTP id
	v8PN0pts005263; Mon, 25 Sep 2017 16:00:51 -0700
Received: from [172.19.2.220] (helo=localhost.localdomain)
	by xsj-pvapsmtp01 with esmtp (Exim 4.63)
	(envelope-from <alistair.francis@xilinx.com>)
	id 1dwcMt-0008Ch-Cx; Mon, 25 Sep 2017 16:00:51 -0700
From: Alistair Francis <alistair.francis@xilinx.com>
To: <openembedded-core@lists.openembedded.org>
Date: Mon, 25 Sep 2017 15:56:55 -0700
Message-ID: <20170925225655.24585-1-alistair.francis@xilinx.com>
X-Mailer: git-send-email 2.11.0
X-RCIS-Action: ALLOW
X-TM-AS-Product-Ver: IMSS-7.1.0.1224-8.1.0.1062-23350.005
X-TM-AS-User-Approved-Sender: Yes;Yes
X-EOPAttributedMessage: 0
X-MS-Office365-Filtering-HT: Tenant
X-Forefront-Antispam-Report: CIP:149.199.60.100; IPV:NLI; CTRY:US; EFV:NLI;
	SFV:NSPM;
	SFS:(10009020)(6009001)(346002)(376002)(2980300002)(438002)(199003)(189002)(39060400002)(47776003)(5003940100001)(77096006)(36386004)(54906003)(16586007)(106466001)(316002)(2351001)(478600001)(33646002)(4326008)(63266004)(6916009)(5660300001)(9786002)(2906002)(189998001)(230783001)(36756003)(1076002)(8936002)(50986999)(50226002)(50466002)(48376002)(305945005)(8676002)(81156014)(356003)(81166006)(107986001)(5001870100001);
	DIR:OUT; SFP:1101; SCL:1; SRVR:BY1PR02MB1130; H:xsj-pvapsmtpgw02;
	FPR:; SPF:Pass; PTR:unknown-60-100.xilinx.com,xapps1.xilinx.com;
	A:1; MX:1; LANG:en; 
X-Microsoft-Exchange-Diagnostics: 1; SN1NAM02FT035;
	1:6yFjln2K9jGWcRHH7zSxEGsE3O0S4ej9D4HkXd6XnboGSpA13vM8sJx9b5kc4xS8bw/Op4kmrLzwUwDquuuzWPDyXs13YxnGbdObHyURUT2a5n0WsFxyG45eOKixB+4V
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 761c2069-ab39-4e0c-d024-08d504694c73
X-Microsoft-Antispam: UriScan:; BCL:0; PCL:0;
	RULEID:(22001)(2017030254152)(8251501002)(2017052603199)(201703131423075)(201703031133081)(201702281549075);
	SRVR:BY1PR02MB1130; 
X-Microsoft-Exchange-Diagnostics: 1; BY1PR02MB1130;
	3:kxdSqPDZixKM3W/uSz1DQzTZXF8725/jlY1vlxznbm5qxdsanBINub7TFa2nIAmWf1fUs6AgjNuv2g27Qd9ZWF8mJ+WA4Wh8T/+ANduMSp4zrFNIjXPvC0m6qGJGavED3/w5mxcuRXx2WwBWMqDVFRMN2+KxCswMZN4x4yczc95mS7fGBYG8Ut8UtRj2UkTgXGXn2jjRpoo/MUX2HtjGuMIMjbFh9KkGI/20zKQm5jOBU1gNhWZJCJKw/e0p8jbcXOMTOfHN7XHimXttnrM8C8Nnmpa3HN8dsuIsRGqXgWQPOD5elspct08Kb7ynBUyQPR9vJ68i63UTgAYktzWRFCP058ODC5eh8lkpliaEDCQ=;
	25:uKw85sifsa08T4m2GY0zsVvHDHhlw4FV7LHOu8y5W3xMR5c8N6Ez5IfuK+g1FomWu9502UVMBeIk67fytuvIycyzIeGnSVwqe9NQXiecreWacgb4rtkVY4xK8fUv6t9z1IqMb+hxk6EgEjMxw+1XfD5EtI0T0jkeyd+p9o7l5O2pdtOONvL5h/Rhx3Ai1iXg/WtJHC59gTUd8ku4nM/Yt1RmEPxgLf0c6XMCyiRR9bcJLOp/q1aCw3NXGfwd+lRn+2Xq2N3+l/ySlMcm5oYi+CgC0YHVbMRgG+vN9Dp+mCFMnopFxCJwJCGag6klEjQudvXW0CViBhKLWmJ3Z8WEqg==
X-MS-TrafficTypeDiagnostic: BY1PR02MB1130:
X-Microsoft-Exchange-Diagnostics: 1; BY1PR02MB1130;
	31:n9FZ854+lBKf/24HYmbF7GJBF+NuLbfqP3wOvrs0lXnwKtPs9XdgRmPwf29FXY8CNaHEqfsbsyrhd7PBbHnp2XvwZzaWx5AzE4Fwtu29D+QtVr2irXnbeiePu7MeKBW5yFn+coUqF3qMiOuqbhvCfGkHsMWYBHYAaTeoS2zonwuJAQy6upSV7KXbVHcxt0UKyZ8X26eZNBQKj5vUORWJBJ48jGcYIoDEkqWQ+yXoEJw=;
	20:AFp63Pum8QGQuxqLUNxUw+ZEWFIKbSNdfC6QBFmcdoCMvBmtTBQIo+wh1IMxiZ9K2YN1rp7cJpNxHIFnC9iFonxw1bPwcTcJjWlYDuhyxZeX3wIYKYyxF+HebTv/P6/R9+laXk9efZFszDda3mGnWABoT/4sv0+cO/awBGKC+o8v3BXR8SXuDFl4y3RkswFkfX4G2fBykQEi8PkrEbU1IyNVJTh3w4k7wMGZGDGH0EcC9rAE8Lyj5+mXuliR0WfolzN9n9AQR1rv6j3BIN3SuezcBwF6lQ+DbNHBafcwl/uVOSkOH3BnAjeZYRJNu/9FlChk27yCl5+000qqEImUm0i3YQlVLeHD63HNXrgGPO6bNWL6B/oSb9ToEf1VkWCfqkcOV/k0qxrFELLc7wlaeRt1X96urF8+Irhm2Y+8HhemxehmsW6/Pl6H++rCzITSATFEQDYutigDextLSH+h/tuhSEhimQH3qZM4Q9sOfovOr5WC0F178jKxxaOZxeVJ
X-Exchange-Antispam-Report-Test: UriScan:(192813158149592)(228905959029699);
X-Microsoft-Antispam-PRVS: <BY1PR02MB1130FB553518C536119FBFCDDC7A0@BY1PR02MB1130.namprd02.prod.outlook.com>
X-Exchange-Antispam-Report-CFA-Test: BCL:0; PCL:0;
	RULEID:(100000700101)(100105000095)(100000701101)(100105300095)(100000702101)(100105100095)(6040450)(2401047)(5005006)(8121501046)(10201501046)(93006095)(93004095)(3002001)(100000703101)(100105400095)(6055026)(6041248)(20161123564025)(20161123560025)(201703131423075)(201702281528075)(201703061421075)(201703061406153)(20161123558100)(20161123562025)(20161123555025)(6072148)(201708071742011)(100000704101)(100105200095)(100000705101)(100105500095);
	SRVR:BY1PR02MB1130; BCL:0; PCL:0;
	RULEID:(100000800101)(100110000095)(100000801101)(100110300095)(100000802101)(100110100095)(100000803101)(100110400095)(100000804101)(100110200095)(100000805101)(100110500095);
	SRVR:BY1PR02MB1130; 
X-Microsoft-Exchange-Diagnostics: 1; BY1PR02MB1130;
	4:1iDQ9gXVUSx4OWkk8+2orPwj9x2HEqJCztYBoyRJKyt0xfXmQbWXWPWfg+B8e8vQZaNzqsXuqI2yfZl3KBdT/QTTRyjatwDujA2rpVMsSOtTj2bJBrXqhkjg0REDIjvrjkb+0IPg6cMO89gDI7Yqbr3A8XpDF6AOHQk9rACFDLbe2nmFqzOw/0hIO81Jk4M2zTCtiHMd1dC2eTuvQPnMhGCMOmZ8TRW8VhMYriTNNNIoC7nXVyqKOB3GdGiGSNA70+trwluvAONW/82p0yrXFXwuhYXU+iSHlTnaqpOUUDjsvmis2COpx6Xd/7Wa8YG0WEQL01pYqAMwUl9bqiLUqA==
X-Forefront-PRVS: 04410E544A
X-Microsoft-Exchange-Diagnostics: =?us-ascii?Q?1; BY1PR02MB1130;
	23:0X9XjP58hcBgYyBNB4UtTC8sM2G/srl73Cbq5yv8d?=
	=?us-ascii?Q?dK6xk/rWEAlOOYEC7TrssaVB7nN/XdXmfIV+eaB8gqkbCWYpOW71eR/jJMrv?=
	=?us-ascii?Q?CWEND53qjIzDgMkC0ggUK0tf2s+UVGdaVo9ZI5caBgu9CcgBUBXkQSCYTkg6?=
	=?us-ascii?Q?1e4jRI4rLs7n9wdt5JG2lqPnCMvwCdRJ44FJS7o8nZIPQPHVxHql1GHhd0hw?=
	=?us-ascii?Q?60ZAcZmgIVE6vjxBSuVgb6yPeqzlrioX0NBpWYumCKBl2X2ZihU4toRhD6S5?=
	=?us-ascii?Q?kDdOjhXfWym7Eq2RkDIgD61s1A2/KVAQCOhCGgL6NAusjr0iFew/t8RhFW+N?=
	=?us-ascii?Q?R/CHhNa1gLaItHLPBiVGdrOmOXlhuRrbW9Coh6rDshFkksduMsXHqEo/WU5d?=
	=?us-ascii?Q?Str+xiOZFQodCq/bmzZMTQOjbcSaC8OXOL4iZKOS2Vnf1yqvKM+nSyxj9sEt?=
	=?us-ascii?Q?P4chQdX4HMienXbae+beaBECnZ8bU+fnlOz+OlNb5yILKhWlfjJ4v423sOKo?=
	=?us-ascii?Q?/aBArR4QuXb/D28s2qtIkUpiqla6zi4pwjC/nV2tUsLCjxyJq2v5MlPYRcmH?=
	=?us-ascii?Q?sHmfkAGNQgkHwYDPEn70nP5T7m8id76ZxSd3xgyqwAAuNcNRHHHC2jHiF91n?=
	=?us-ascii?Q?u+emWFJRe0xdbkz+VzxNtgMtGxSaLOW979lfKO+M3w3vCY3p2qam9XrQPf/U?=
	=?us-ascii?Q?372ckxFGZWbRU7TFrBJgc4bBqA9S+Q0F1T7GLj2i+PK5jGaJKqlPyae5eDh0?=
	=?us-ascii?Q?xE8Ca9TLQqxbIvo6Kly+kc7kHTOsDFEC+WKlrH/BUhaxl301B7DpCZnh7ApT?=
	=?us-ascii?Q?X3xTi5hng9K79L9Q37KG2rODTFFf2P6WY+31du8E6col3OByB3igcDq02F9E?=
	=?us-ascii?Q?0B4FCa+NaGuIWWZSrVx70fk/qTg3GnVkanCUDLLk7mfoY88bfEu+PRQN5KAH?=
	=?us-ascii?Q?xBoiBwJxrEnnqGg9tVNtUlMzpOBXn6RERKc1rbOPp5X4GWus3yKfwc+uj4UT?=
	=?us-ascii?Q?5k=3D?=
X-Microsoft-Exchange-Diagnostics: 1; BY1PR02MB1130;
	6:KafpRZirHnW8zm+ziHJqdpb3ap2erTE+/rP8n8dd5sV2qB4RX1bpMTRa6swfwnqyDwGEvDYqTVC/P0WYRYvtc5V26sVYeyTPTv2/0aQvrp/eGiNoUERwN2Z9I5Aq63HfBywQxWFUq8fye8hL/ouHvTOw/dFO/VwmPKFhRdZhrwthtlioyABTsadGP1aH6P2JSr/QeqjdMwxnKY3Xj/z0j1tn2LDvhRDCKzFoxjUfQtS30uGG9nnxWKl5aTqhaIQBn3ayaOEJn1nEkAIFP0wyqPv4RMkAQdZ7UYn9FVNhwmriQfJneNdh3046ubpTumBRWm1AOaHS7OVjYco6c0uUvg==;
	5:wWOdj9fRPalNsQ0UhRPcJrUoDuV8fCUHCJAXhU/H4yaHvD1VIgM32zNInNEdYJ6IKeDwXhgAyelTRA9qHeEDDF8huLA8nkFpi0ZXLwJHAx7xyWueOVeFd+XO9jOSktzr6YM8auKaUi/VSTt+SKGtyA==;
	24:/g2QHe7nGZKa9ke9dwUBL+kqBSgfZExReMEe+VFEUHap9pkKzQFIo7n81v5UL+/ylAtEtyn65vdbJSqHqQuFrOcIVJji3OlMpJp7At8wG44=;
	7:1HxptsHznwTu1RyexdqtLp/vyGEAkIwNWKRGGA8DIjVTx2MJOz95ELU1g3PQiUqfCFgBwG9gPBenaIDlJmLZrCCL76jmPQBfCwnFimUWLV0peYbkl3hmDtjnY8AagXMYZY8iFS5CyM4a6bLmav/DUnP/oOfeLHy4gyGJMx1gpbGXsgyDOHnD4fzv4yoldQ/rdwTt5sGWpdgwEDW0HQ0pANcSc5Nfz5hGqTV5raZAyAE=
SpamDiagnosticOutput: 1:99
SpamDiagnosticMetadata: NSPM
X-OriginatorOrg: xilinx.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 25 Sep 2017 23:01:04.0872 (UTC)
X-MS-Exchange-CrossTenant-Id: 657af505-d5df-48d0-8300-c31994686c5c
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=657af505-d5df-48d0-8300-c31994686c5c;
	Ip=[149.199.60.100]; Helo=[xsj-pvapsmtpgw02]
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BY1PR02MB1130
Subject: [PATCH] glib-2.0: Remove recommend shared-mime-info for MinGW
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
X-List-Received-Date: Tue, 26 Sep 2017 00:34:33 -0000
Content-Type: text/plain

Commit glib-2.0: recommend shared-mime-info
(51e4f9ca5368af5cefa26f4ca50b282e858982f8) broke compilation when cross
compiling for Windows. This patch removes the recommendation for
shared-mime-info when using MinGW cross compile.

Signed-off-by: Alistair Francis <alistair.francis@xilinx.com>
Cc: Ross Burton <ross.burton@intel.com>
Cc: Richard Purdie <richard.purdie@linuxfoundation.org>
---
 meta/recipes-core/glib-2.0/glib.inc | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/meta/recipes-core/glib-2.0/glib.inc b/meta/recipes-core/glib-2.0/glib.inc
index ce15ccefc3..8434b7dae3 100644
--- a/meta/recipes-core/glib-2.0/glib.inc
+++ b/meta/recipes-core/glib-2.0/glib.inc
@@ -74,6 +74,8 @@ FILES_${PN}-codegen = "${datadir}/glib-2.0/codegen/*.py \
 FILES_${PN}-utils = "${bindir}/*"
 
 RRECOMMENDS_${PN} += "shared-mime-info"
+# When cross compiling for Windows we don't want to include this
+RRECOMMENDS_${PN}_remove_mingw32 = "shared-mime-info"
 
 ARM_INSTRUCTION_SET_armv4 = "arm"
 ARM_INSTRUCTION_SET_armv5 = "arm"
-- 
2.11.0


