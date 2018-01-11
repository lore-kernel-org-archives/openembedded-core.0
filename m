Return-Path: <alejandr@xilinx.com>
X-Greylist: delayed 3594 seconds by postgrey-1.34 at layers.openembedded.org;
	Thu, 11 Jan 2018 03:21:21 UTC
Received: from NAM02-BL2-obe.outbound.protection.outlook.com
	(mail-bl2nam02on0078.outbound.protection.outlook.com [104.47.38.78])
	by mail.openembedded.org (Postfix) with ESMTP id DFD5778853
	for <openembedded-core@lists.openembedded.org>;
	Thu, 11 Jan 2018 03:21:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=xilinx.onmicrosoft.com; s=selector1-xilinx-com;
	h=From:Date:Subject:Message-ID:Content-Type:MIME-Version;
	bh=6jTmGiGdGhqsIAO1zG05bZdaMNcU83ANlANW0cj0bXk=;
	b=V4PP48HFzVSCDVXD4pkiHfkz8eku3DSwa6TnvDNg56Mkif6g29Wuh1LdygMGJm39/LxMrb31ZdkjXuGRR7WUO0xzSi8LalXxhd99QXQxP7W8jErg7VJfg/h4QMS3mLlv2zXIy9xfkBQwpXktSAbGUSTrIs4zoxl4g7ZYkuKwIIw=
Received: from MWHPR0201CA0095.namprd02.prod.outlook.com (10.167.161.36) by
	BY2PR02MB1329.namprd02.prod.outlook.com (10.162.79.24) with Microsoft
	SMTP Server (version=TLS1_2,
	cipher=TLS_ECDHE_RSA_WITH_AES_256_CBC_SHA384_P256) id
	15.20.386.5; Thu, 11 Jan 2018 01:49:08 +0000
Received: from BL2NAM02FT008.eop-nam02.prod.protection.outlook.com
	(2a01:111:f400:7e46::201) by MWHPR0201CA0095.outlook.office365.com
	(2603:10b6:301:75::36) with Microsoft SMTP Server (version=TLS1_2,
	cipher=TLS_ECDHE_RSA_WITH_AES_256_CBC_SHA384) id 15.20.386.5 via
	Frontend Transport; Thu, 11 Jan 2018 01:49:07 +0000
Authentication-Results: spf=pass (sender IP is 149.199.60.100)
	smtp.mailfrom=xilinx.com; intel.com; dkim=none (message not signed)
	header.d=none;intel.com; dmarc=bestguesspass action=none
	header.from=xilinx.com;
Received-SPF: Pass (protection.outlook.com: domain of xilinx.com designates
	149.199.60.100 as permitted sender) receiver=protection.outlook.com;
	client-ip=149.199.60.100; helo=xsj-pvapsmtpgw02;
Received: from xsj-pvapsmtpgw02 (149.199.60.100) by
	BL2NAM02FT008.mail.protection.outlook.com (10.152.76.162) with
	Microsoft SMTP Server (version=TLS1_0,
	cipher=TLS_RSA_WITH_AES_256_CBC_SHA) id 15.20.345.12
	via Frontend Transport; Thu, 11 Jan 2018 01:49:07 +0000
Received: from unknown-38-66.xilinx.com ([149.199.38.66]:55315
	helo=xsj-pvapsmtp01) by xsj-pvapsmtpgw02 with esmtp (Exim 4.63)
	(envelope-from <alejandro.enedino.hernandez-samaniego@xilinx.com>)
	id 1eZRzO-0006z2-9Q; Wed, 10 Jan 2018 17:49:06 -0800
Received: from [127.0.0.1] (helo=localhost)
	by xsj-pvapsmtp01 with smtp (Exim 4.63)
	(envelope-from <alejandro.enedino.hernandez-samaniego@xilinx.com>)
	id 1eZRzO-0006iz-6s; Wed, 10 Jan 2018 17:49:06 -0800
Received: from xsj-pvapsmtp01 (mailman.xilinx.com [149.199.38.66])
	by xsj-smtp-dlp1.xlnx.xilinx.com (8.13.8/8.13.1) with ESMTP id
	w0B1mwaT004652; Wed, 10 Jan 2018 17:48:59 -0800
Received: from [172.19.2.8] (helo=xsjalejandr50.xilinx.com)
	by xsj-pvapsmtp01 with esmtp (Exim 4.63)
	(envelope-from <alejandr@xilinx.com>)
	id 1eZRzG-0006d7-Rb; Wed, 10 Jan 2018 17:48:58 -0800
From: Alejandro Enedino Hernandez Samaniego
	<alejandro.enedino.hernandez-samaniego@xilinx.com>
To: <openembedded-core@lists.openembedded.org>
Date: Wed, 10 Jan 2018 17:48:48 -0800
Message-ID: <1515635328-8762-2-git-send-email-alejandr@xilinx.com>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <1515635328-8762-1-git-send-email-alejandr@xilinx.com>
References: <1515635328-8762-1-git-send-email-alejandr@xilinx.com>
X-RCIS-Action: ALLOW
X-TM-AS-Product-Ver: IMSS-7.1.0.1224-8.2.0.1013-23586.006
X-TM-AS-User-Approved-Sender: Yes;Yes
X-EOPAttributedMessage: 0
X-MS-Office365-Filtering-HT: Tenant
X-Forefront-Antispam-Report: CIP:149.199.60.100; IPV:NLI; CTRY:US; EFV:NLI;
	SFV:NSPM;
	SFS:(10009020)(39380400002)(396003)(39860400002)(346002)(376002)(2980300002)(438002)(3190300001)(199004)(189003)(8936002)(50226002)(81166006)(8746002)(8676002)(59450400001)(81156014)(2906002)(106466001)(4326008)(2351001)(107886003)(316002)(51416003)(47776003)(7696005)(106002)(76176011)(54906003)(36386004)(63266004)(77096006)(478600001)(5660300001)(50466002)(9786002)(36756003)(305945005)(2950100002)(6666003)(48376002)(6916009)(356003)(5890100001)(107986001)(5001870100001);
	DIR:OUT; SFP:1101; SCL:1; SRVR:BY2PR02MB1329; H:xsj-pvapsmtpgw02;
	FPR:; SPF:Pass; PTR:unknown-60-100.xilinx.com,xapps1.xilinx.com;
	A:1; MX:1; LANG:en; 
X-Microsoft-Exchange-Diagnostics: 1; BL2NAM02FT008;
	1:JaXF4iS4OU13fwCbQpErR2nOS+TrqL7vTk6KjWbyooy4wM/OiItxC3JYLiHu0ifgpdGtBd4n6bUCjgiwsoFyVNLbSGXdWdIgwno8zvtDf/YHnAyAK+spy4k3H90aIToq
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 035782ca-1e56-4721-bf67-08d558958088
X-Microsoft-Antispam: UriScan:; BCL:0; PCL:0;
	RULEID:(7020059)(4652020)(5600026)(4604075)(4608076)(2017052603307)(7153060);
	SRVR:BY2PR02MB1329; 
X-Microsoft-Exchange-Diagnostics: 1; BY2PR02MB1329;
	3:im/MNeSje0N/VBC8JSpZYi+dxsfVCvXQohuie+Wt6qdL5qPmJMqZFD61Qu1uI6Rqjc2+tKjiZ3Q+QoUxymZFwYyhzm3YRapOPVif16txzNAr2MF9X/vVmy82t/mlbBfGOWPVWxS+CX5KUqjhrWpMBlLPRIWWQ9g2Ngd0XDPnefO+WAUVzWnNJFURVhm3nIPlYa0oJsA/DCNbL9OVpdxb1qoZsl03OhodVJuhY69iqID5FnBGH8Q89tvxwIXIxz0OO1YEwjEXb4KPo/2oQQ6rUv6rUAmeXihk/UaEXNIyBJ/LfTl8//v/6QC7ziquktmwajLaJlYCol3hJqquI9fLUc4XGY3KqWiSWiLDw80Du9A=;
	25:PYwzWOUo9l4mDe/I46aJdW9w13eDYnbQyErh8JmfPm99OEWFyD04kWufvolt4FwRBeRpjZnSKdfYkNBeC/eurIXkGdY8Gj4qtkUmriZXo+S4y/7/Nhj+U3ewtVawW9r1HSZveMofSFrXmYeVrOXkUM/6SuvIiTGEf3LpYxMGILInAfcWYBkVUoR4j9i/KIpjKA2h9AHpnKIUCdkE389CzQj/C0mjpIgL/VFGovxWQBJ7PBNr1Futvqzr1EVBlhDjb47FpckFXnZfFP+WvgK3NFAroesI2k9T5yRPOjDsr7uzkRUVJBrOqRxJx6UZwNvR1FFqpj+AJXJ5GqnxOGALmQ==
X-MS-TrafficTypeDiagnostic: BY2PR02MB1329:
X-Microsoft-Exchange-Diagnostics: 1; BY2PR02MB1329;
	31:wMjlISXL50RLTBCpd7+0sVLooiicKxe8uM2avoD+rt8vOcEFGzVY60+TBZRui5r9FvQswx84KZy+P6N3/pBd/ismqHf8Ex4NC6zOsN/nMfoacs3DtT8FN67/AIIGhF6CGkJ3neOc2m8km/HshhzKVDlKPmss7Dl7uY/NsTPmAA/4gx4H3lYaBQTWLjcT0eY3Bqjk3WtAAmPUI3OhM+a1VufLhCGv9aw6HzMuSjxNrjE=;
	20:0mx3oS2lhgxyGC2V6dP/tc1MP5t6riCs8bcakS00jsBRhN07TD9FdjEYL1yFlTQBIiW0YxBaMofG5CVmAZR3OW2ME6BnsJWVqzGVXbykKGfgaG4cUPQeG62eyAdeVm8WWnxvchN99LRzPPEywwFovfxgwuT3f4AUJiIlbXPDfixflu+oxuID8sZjnLREeKDwZK48ono3bHZSCnZLbxIiWcbkW1pmnqSAsK8W7zonDskVDDylQjgFLHIMzezs1BvF82+thdSPWg+VRsXi7juQAKh+Wah6SXOmla5LQU3BhSqgj/RIPV/XAm0nt4BW7Kx800+qwJAZbrjJqCWIKsNlt5MLjqZhndqSAuVV4DDB/4Vzd2PlQjRTS7iFnBgxj9ry86xHW0fSBibIbR5z164SGHqrQFNl9DUug6fBweZyHtJu7lQ9hjW6pl66RwnezEscfOXHAMs4BodeqizBEmd2eQiSKwpu30w7uzPPbZGf84Rd/fL9DfNVG7xjhvgYtf1u
X-Auto-Response-Suppress: DR, RN, NRN, OOF, AutoReply
X-Microsoft-Antispam-PRVS: <BY2PR02MB1329F4AC758A6D4191909915AC160@BY2PR02MB1329.namprd02.prod.outlook.com>
X-Exchange-Antispam-Report-Test: UriScan:(192813158149592);
X-Exchange-Antispam-Report-CFA-Test: BCL:0; PCL:0;
	RULEID:(6040470)(2401047)(5005006)(8121501046)(3231023)(944501129)(10201501046)(3002001)(93006095)(93004095)(6055026)(6041268)(20161123564045)(20161123562045)(20161123558120)(201703131423095)(201702281528075)(20161123555045)(201703061421075)(201703061406153)(20161123560045)(6072148)(201708071742011);
	SRVR:BY2PR02MB1329; BCL:0; PCL:0;
	RULEID:(100000803101)(100110400095); SRVR:BY2PR02MB1329; 
X-Microsoft-Exchange-Diagnostics: 1; BY2PR02MB1329;
	4:o4a8awFAZ7zJnuzvCbldkmTHjtZN3zF9oK16ISbdk1rDhp0srRu90T+7xfQKRRluSZaBLBmqbF/c8KnSQNrJXaZ+3+CXct6hH+yaj2Uj66riAw1g+UHtFjgb7gmRAeL2n1Gd4W8Kz8qteSL3R/zUnaCT0+IGIBPzqwvKg+BsuEAQX0ovG+3hez4f3HHYPbfQrVfPGqABvNVVPhVcVpThAcGXROd37upgsvDiQHGrWVP6TKpU0/BRyM7SM2zaaqVqoGMZloLvh44Te7ScbyP/j3EQOOsRQjZS+KYC9WwST/uBIkw0xw2HzKrqVAcRdaZz
X-Forefront-PRVS: 0549E6FD50
X-Microsoft-Exchange-Diagnostics: =?us-ascii?Q?1; BY2PR02MB1329;
	23:LA+okoI7gLpUv7KLXtbuRX9B0GS9j9f0+EKLBXfza?=
	=?us-ascii?Q?FBupEK0LPXX+Qe56kIXKVY27o96k381I81V7STGQl+jOB1W0CGzYWNhi8FcM?=
	=?us-ascii?Q?Faj3/agY6tkU1Dmo+mgyFlCcbng9r6JUmSMQJhwA1e7+wqwk8Sa7bx7xjQHs?=
	=?us-ascii?Q?V7iFEeXjXfcCs5TOMSVKXpWJY0tHGBs1DwK4Y48pLIjCWRWj6k+aGzBKBy4J?=
	=?us-ascii?Q?qQ/yEpa4dH2AlwsrUKJVq/Z3wZKdChL+pGhN+WbVOmoZub3h3YmKJEpvsy36?=
	=?us-ascii?Q?aieWuad+NwjDPohqdzxKcVYLByfvU4XB1bQChmr67tIP2YBUJLBcLSdG5Bzq?=
	=?us-ascii?Q?uD6gAuQ/0wKyz0E1OWv5YRfR+aycxWNOjD17hnjT+DF4cnUSolhiGYmXVT4O?=
	=?us-ascii?Q?da0ZABosgRPCH5riR5oG7E2IvAoVViCOYeVBsb+eEaCSDYF+bj+kB/xy5/5M?=
	=?us-ascii?Q?WJ75bbFDnIon6bykllCNd7aYh/EyUMjEQD7MPjW0FJaFOkpwIUjc1tTUTqjh?=
	=?us-ascii?Q?PBzjTNT7kFDUTS0gXrYXNTCnlj/qPOch+f1K5slhm9ZTnrrQmvGUzcMCv2rd?=
	=?us-ascii?Q?U4Onw0u2vBIlZAfmv+Fl15jW0lyJ9hmXadI5ppM47Dch1JMO8PmjOOpidlGX?=
	=?us-ascii?Q?WSSM3u73P7Ala5Lkqd3iP5f8rakpXkSvZSFYvNZr37okSN43pfSqWmRc1dWZ?=
	=?us-ascii?Q?FCgjL5+V8L1PqszZGSihUih9NV8k7knEG7T/D5T3CClN3RxnL5kSpRlcl+hd?=
	=?us-ascii?Q?vSXy2yiJUFs9zixD/cM77MyD3+xefUMBOTXEVvp+RI++FWyWbmkMlDsmjENj?=
	=?us-ascii?Q?eB3RwnYbZwD3h8SmvDUw8wXStLyOrAbznsDLyJfBkqOou4Lx0Pf4sc0AnF8n?=
	=?us-ascii?Q?Yrakhmk4u+6rRQ3qt9k6mb79q/UD/V/49Jj//vMTTOFzjrjf59rzX+0VH6Jl?=
	=?us-ascii?Q?IRJKfPTdY84HVwwR8w1F2afn/+kkzyyuLwsRVYptEEoOkxk/OPRkZDK8pPcx?=
	=?us-ascii?Q?M388xa7gepYJj0g8O8rceQDFxQDL7yPHaaGoZPZEQA3vwRALlxqU9hjEAEAu?=
	=?us-ascii?Q?pmhX9k/WaOGGuFvoYO1rpLGxQcR/d8KJwO2vZsUIIcSWvtrxA=3D=3D?=
X-Microsoft-Exchange-Diagnostics: 1; BY2PR02MB1329;
	6:66uGzM6N+5w/pGQM9NglgOgmFd2bYnU9wYY8aKryer2Ri25T0Kik5jFsAva7qcBxwwaR3Zl8V/zPU4A0mSXvrqqCBc24tgMzTqhmVI8PydOQDfzGmYBoM8zkrC0nzcxgHF7gaX63vPhTYEHimP/3OPQjB4If6VHWoQAIdigMQsn9bN5gMe0xKbUz5W3CRMciQzIS3fIrTjED0j/iCVUA490BQEUfMXjkZ5hquIxP5FdK4KgRPSZ6Ch5XbOEh6lqAIoLXh9bv1bNFSjqlvRYTr9rcxTda7rBD2LIv6lFbQFOOgiwK+Whks76cGlnJ0Y1C6OG1gHZhs8YSZdF5OG3NBWnApRZdMkrvIIhjMZNDVFg=;
	5:jL5rfssSrHKaMkMxuWQx7L0QICunk2VneiG/2U4tfM7NCfHQ1ZmmVKK9JNeVbac0iu1DxBq/TOAJbIBkCHxGyXPLxyiI8n2f8vJZx6EqIAeFES1/J7qYLMgaLcwgdFUaQ5tWDm7ZGsGGYHPYVSPgP9g/tcpjK9hvLS7erep2wqc=;
	24:8ruK6wJOdF56I42fCJ/VpBa9+hw7kXQF8jRCgHX11BaqmVO7qsU63n/ig7FAEfohpkKfOw6QKT04JnWGkniMOBXWD7n7y5lyKacDshD1BWc=;
	7:esMIgD/sWM+Y1UD+bFFRTEuXUNCU1zBbDAF/bR/bvHRllt9LNYne6vwRe4k2b+bqn4qhW/6+o+Un8yQ1QK293PqftmFGtFXYLJIFjj2fh00f7zcf4ClEM7JX7O9duq1mSMWGRn7jZDBtiEfWWPHbWIoZSz9psP8GVaEF8scvv4tDJ6j3EoqKxerS8lZAMJWOm+Xg1ECokoQPX7PF8jLVpCusgNHUYVZDMpiQcoxMZ6OQv5EETy7fZXM2UhNN9+8t
SpamDiagnosticOutput: 1:99
SpamDiagnosticMetadata: NSPM
X-OriginatorOrg: xilinx.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 11 Jan 2018 01:49:07.0735 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 035782ca-1e56-4721-bf67-08d558958088
X-MS-Exchange-CrossTenant-Id: 657af505-d5df-48d0-8300-c31994686c5c
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=657af505-d5df-48d0-8300-c31994686c5c;
	Ip=[149.199.60.100]; Helo=[xsj-pvapsmtpgw02]
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BY2PR02MB1329
Subject: [PATCH 2/2] python3: Fix native compilation of gdbm module and manifest
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
X-List-Received-Date: Thu, 11 Jan 2018 03:21:22 -0000
Content-Type: text/plain
Content-Transfer-Encoding: quoted-printable

From: Alejandro Hernandez <alejandr@xilinx.com>

The gdbm module wasnt being built on python3-native showing the following
error during compilation:

Failed to build these modules:
_gdbm

This patch adds the required dependency to fix the compilation problem.

This issue on python3-native caused the manifest creation script to be
unaware of the gdbm library, so this patch also fixes the create_manifest
task for target python, and the manifest file to reflect the changes on
target python as well.

Signed-off-by: Alejandro Hernandez <alejandr@xilinx.com>
---
 meta/recipes-devtools/python/python3-native_3.5.3.bb      |  2 +-
 .../recipes-devtools/python/python3/python3-manifest.json | 15 +++++++++++=
++--
 2 files changed, 14 insertions(+), 3 deletions(-)

diff --git a/meta/recipes-devtools/python/python3-native_3.5.3.bb b/meta/re=
cipes-devtools/python/python3-native_3.5.3.bb
index 3053c4b..12f9f24 100644
--- a/meta/recipes-devtools/python/python3-native_3.5.3.bb
+++ b/meta/recipes-devtools/python/python3-native_3.5.3.bb
@@ -38,7 +38,7 @@ UPSTREAM_CHECK_REGEX =3D "[Pp]ython-(?P<pver>\d+(\.\d+)+)=
.tar"
 S =3D "${WORKDIR}/Python-${PV}"

 EXTRANATIVEPATH +=3D "bzip2-native"
-DEPENDS =3D "openssl-native bzip2-replacement-native zlib-native readline-=
native sqlite3-native"
+DEPENDS =3D "openssl-native bzip2-replacement-native zlib-native readline-=
native sqlite3-native gdbm-native"

 inherit native

diff --git a/meta/recipes-devtools/python/python3/python3-manifest.json b/m=
eta/recipes-devtools/python/python3/python3-manifest.json
index 031745c..be020f8 100644
--- a/meta/recipes-devtools/python/python3/python3-manifest.json
+++ b/meta/recipes-devtools/python/python3/python3-manifest.json
@@ -366,7 +366,8 @@
     "db": {
         "cached": [],
         "files": [
-            "${libdir}/python3.5/dbm"
+            "${libdir}/python3.5/dbm",
+            "${libdir}/python3.5/lib-dynload/_dbm.*.so"
         ],
         "rdepends": [
             "core"
@@ -493,6 +494,16 @@
         ],
         "summary": "Python's fcntl interface"
     },
+    "gdbm": {
+        "cached": [],
+        "files": [
+            "${libdir}/python3.5/lib-dynload/_gdbm.*.so"
+        ],
+        "rdepends": [
+            "core"
+        ],
+        "summary": "Python GNU database support"
+    },
     "html": {
         "cached": [
             "${libdir}/python3.5/__pycache__/formatter.*.pyc"
@@ -1128,4 +1139,4 @@
         ],
         "summary": "Python XML-RPC support"
     }
-}
+}
\ No newline at end of file
--
2.7.4

This email and any attachments are intended for the sole use of the named r=
ecipient(s) and contain(s) confidential information that may be proprietary=
, privileged or copyrighted under applicable law. If you are not the intend=
ed recipient, do not read, copy, or forward this email message or any attac=
hments. Delete this email message and any attachments immediately.

