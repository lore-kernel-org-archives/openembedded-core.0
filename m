Return-Path: <chunrong.guo@nxp.com>
X-Greylist: delayed 1972 seconds by postgrey-1.34 at layers.openembedded.org;
	Thu, 25 Jan 2018 06:35:37 UTC
Received: from NAM03-CO1-obe.outbound.protection.outlook.com
	(mail-co1nam03on0113.outbound.protection.outlook.com [104.47.40.113])
	by mail.openembedded.org (Postfix) with ESMTP id E9091785A3
	for <openembedded-core@lists.openembedded.org>;
	Thu, 25 Jan 2018 06:35:37 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=freescale.onmicrosoft.com; s=selector1-freescale-onmicrosoft-com;
	h=From:Date:Subject:Message-ID:Content-Type:MIME-Version;
	bh=rkgkPoga/txih9RGcm5P6LFOOCJC9wzoJA2HErXQUFE=;
	b=aJc1qrQ1GGz4t++SzoYrZtzh2ctzeduQQVAKyTFSbdcQ7fRqn4rCcJuNSLUCo0d8CF3Cn8hmPkGGp6PBZcRkaX6rR1T/uD8G/MTy6843dabgJMT2VaRlK+RXOxNv0bSczTHP89fkCBY1OBCe+uLiz5kYScu57PbUsSEAhj2KbyM=
Received: from MWHPR03CA0053.namprd03.prod.outlook.com (2603:10b6:301:3b::42)
	by BY1PR03MB1353.namprd03.prod.outlook.com (2a01:111:e400:5228::23)
	with Microsoft SMTP Server (version=TLS1_2,
	cipher=TLS_ECDHE_RSA_WITH_AES_256_CBC_SHA384_P256) id 15.20.428.17;
	Thu, 25 Jan 2018 06:02:46 +0000
Received: from BL2FFO11OLC014.protection.gbl (2a01:111:f400:7c09::112) by
	MWHPR03CA0053.outlook.office365.com (2603:10b6:301:3b::42) with
	Microsoft SMTP Server (version=TLS1_2,
	cipher=TLS_ECDHE_RSA_WITH_AES_256_CBC_SHA384) id
	15.20.444.14 via Frontend Transport; Thu, 25 Jan 2018 06:02:45 +0000
Authentication-Results: spf=fail (sender IP is 192.88.168.50)
	smtp.mailfrom=freescale.com; nxp.com; dkim=none (message not signed)
	header.d=none; nxp.com; dmarc=none action=none header.from=freescale.com;
Received-SPF: Fail (protection.outlook.com: domain of freescale.com does not
	designate 192.88.168.50 as permitted sender)
	receiver=protection.outlook.com; 
	client-ip=192.88.168.50; helo=tx30smr01.am.freescale.net;
Received: from tx30smr01.am.freescale.net (192.88.168.50) by
	BL2FFO11OLC014.mail.protection.outlook.com (10.173.160.144) with
	Microsoft
	SMTP Server (version=TLS1_0, cipher=TLS_RSA_WITH_AES_256_CBC_SHA) id
	15.20.428.12 via Frontend Transport; Thu, 25 Jan 2018 06:02:45 +0000
Received: from sun.ap.freescale.net (sun.ap.freescale.net [10.192.208.75])
	by tx30smr01.am.freescale.net (8.14.3/8.14.0) with ESMTP id
	w0P62gJ2032012; Wed, 24 Jan 2018 23:02:43 -0700
From: Chunrong Guo <B40290@freescale.com>
To: <openembedded-core@lists.openembedded.org>
Date: Thu, 25 Jan 2018 14:02:37 +0800
Message-ID: <1516860157-24547-1-git-send-email-B40290@freescale.com>
X-Mailer: git-send-email 1.9.0
X-EOPAttributedMessage: 0
X-MS-Office365-Filtering-HT: Tenant
X-Forefront-Antispam-Report: CIP:192.88.168.50; IPV:NLI; CTRY:US; EFV:NLI;
	SFV:NSPM;
	SFS:(10019020)(346002)(39860400002)(376002)(39380400002)(396003)(2980300002)(1110001)(1109001)(339900001)(189003)(199004)(105606002)(48376002)(59450400001)(54906003)(36756003)(5660300001)(106466001)(51416003)(6666003)(16586007)(316002)(77096007)(8656006)(186003)(81166006)(97736004)(81156014)(2351001)(26005)(2906002)(4326008)(305945005)(50226002)(8676002)(356003)(53936002)(85426001)(498600001)(42882006)(336011)(50466002)(8936002)(47776003)(6916009)(104016004)(68736007);
	DIR:OUT; SFP:1102; SCL:1; SRVR:BY1PR03MB1353;
	H:tx30smr01.am.freescale.net; FPR:; SPF:Fail;
	PTR:InfoDomainNonexistent; MX:1; A:1; LANG:en; 
X-Microsoft-Exchange-Diagnostics: 1; BL2FFO11OLC014;
	1:ha2KmGn4cO22STiIrLewSsplKR4HySbNTktl8n0AGB+xUF37U7zEjeUH3RrcMYnWIACWvPlIyr/cVpF9+faZguY99w9RhZmh345r2lQT4DJU3sy2WFM39Yn3YuaEC+3a
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: c63fe41d-0b57-472a-00b6-08d563b9413b
X-Microsoft-Antispam: UriScan:; BCL:0; PCL:0;
	RULEID:(7020095)(4652020)(4534165)(4627221)(201703031133081)(201702281549075)(5600026)(4604075)(2017052603307);
	SRVR:BY1PR03MB1353; 
X-Microsoft-Exchange-Diagnostics: 1; BY1PR03MB1353;
	3:sUKpG0wTcl/wilUxzf4ARLKJGGwsVFnn/USmtQEotVyhbEzG9ZalMwa3oFyn+w04TWgnvrjK7I35Dy32y/zE6TIh//NtganAspDi28I7nWLGcgs/4RKf/8in/iiI/uxybNCmNkMcwGVFDD5NtzmtQTZYKzW1a3sPwAw/0JdwoH5Wr7DULnBve8X6omK46HCSiFQBiI3KAz1ENIZxQILOyklTzhnvhR7YpNaeislSGKgjFYAO2Syno+YztJhwJVdG/VEZyYDcYLvQ9RedniHt2P1TmsEBP74EBcr0kkubzjADANox22Ng6CLtxPIcuhzzY9Q9g1Z4PMWeh9ijiX8q3xxXHkXY5kn5gWxGnLa/Xpg=;
	25:DyTghUCTf/oHUoLH4hSEcHsusY6imcVKb2VHVfzznuQ/pIIfH+RLiUlW4BGstgxa+OjFwYGTotUh2HNKnrJrEnN2xJHgum4yR9keUyw6Kx97r1weeyW9eHqawfw2SAFGUWpW5qpUDsqDg6aoG9Z5CHLzI0zHnpBjG/dkPDBHdLfaAp0AFP+Ha5M3EnbfFWhchWkqRt4JFgOjTCUZHBDD13k4wvkmg82IcTXjLosutfA+RRABbEZCbUU4M/7RgeNW0L6fceD73H0aK2CuRLTGYS2xmEOOih6f1Amzub71kcf7EW/cMN6cN9a/RDTnubS9XrAtixBPcIryO5KFBP/HEw==
X-MS-TrafficTypeDiagnostic: BY1PR03MB1353:
X-LD-Processed: 710a03f5-10f6-4d38-9ff4-a80b81da590d,ExtAddr
X-Microsoft-Exchange-Diagnostics: 1; BY1PR03MB1353;
	31:hFBWvqWcjj8QSpzpog5vonxo4WoH64rurpDb9YfRaIkeSn3BvcZ8fqJDw2Gx3iOjvUzUUNpRttxps1QEkCnOLquwccaZeyqIFYqyfNLzq2pXfuf2YpO8ew8Z9Qnrx7WQbVjZEHPaEok4pMjtHdNEjHn0vAsz93Ja9ARS/92kxZT86uVxtn2ymPWEmQCX+JUwi9EICrSclnEilJKabKKVLguOWe5FVa/332e5opY4UOA=;
	20:9DN0j/mGLePqcwTpYqFpsvznZX5sSEIGHMPzTNdTPlHcPP9a3RKuSBS4xVtX4PC6OW5LTnf/oG9U/sZdafzx7yUQ9h3beAQSrJH4SG7pMV1OWfCgDBJ1pIrE5lKC706befKpUcXKND/eQfGQ8cG3Pt6G2B3GBWX1yInqYyupJ9DnnKyNMv1AZ1thJ60xo8mDS1YJOSGN8gFdsMfAoKFYxYU8j92P/1X3/+vjJ/gZLD35s60VM6ZvfgKkZhWrNKCDThJUgUi2YAZGwNQmg0wAzO3SWQ+VLvopTiwgHIx/QX3T4XeM61XvEKPHUkNgkcb+Yzs1ectS0fkHtT2BilPOJj+EjFAhxukEHrESSsjZkklYrWbH/3V0H1MyNLYeeKb77xAs6BWTYjW+zjvrUSFvzb5u5ZsmMMrTx2Kyt8Ay5Sf9PFqwdY0lgMqj8xVdIbzAcROtgTNwGhiKTK0o0gVKrni8vAQZs/ROsg8oRpGEpSiJULg0fOz1fq20yZJwPeqjRMp4hRqN71BTt0cu5M5+a1d8lMYwwgDiZp4CI2svM2zyTdoaHSgQmwzJ4zqUcQowxcdMmSsX+DmWS2llDsdBYC+RyJUn0h7/4yvXZydFYkI=
X-Microsoft-Antispam-PRVS: <BY1PR03MB1353D16E5BBDBCA497AA768984E10@BY1PR03MB1353.namprd03.prod.outlook.com>
X-Exchange-Antispam-Report-Test: UriScan:(185117386973197);
X-Exchange-Antispam-Report-CFA-Test: BCL:0; PCL:0;
	RULEID:(6040501)(2401047)(5005006)(8121501046)(3002001)(10201501046)(3231023)(2400081)(944501161)(93006095)(6055026)(6041288)(20161123558120)(20161123562045)(201703131423095)(201702281528075)(20161123555045)(201703061421075)(201703061750153)(20161123560045)(20161123564045)(6072148)(201708071742011);
	SRVR:BY1PR03MB1353; BCL:0; PCL:0; RULEID:; SRVR:BY1PR03MB1353; 
X-Microsoft-Exchange-Diagnostics: 1; BY1PR03MB1353;
	4:NGTaG051pdGnXtqzkA8wwiKE0eU+FsQguJxgzNpchWT2eK8mNNVJRuloae0Nb78HaTmgcE9yEEf3ZN2pnvOSUjwBXrwMkiVsCreAaIAIbWVEO+YXCKrLWtqkdmygwKX2e128W5e2176ymNAsVBTcGu6A01kLGsPei4d/KQ/WFKw8dfbI+Ux/ea1mZGnQt2cMQeRvxSvLaoV2JX9Dydw7AI5DrezWj5jGDqv0pzfXcn0HSIQRGWektEUdzzZ+kogYP01yUIqXOoM1UWB1J+ObFdthVqLDmoUkmCIf8PQeD+wRtsUTyThNHxM6JOsbMvaL
X-Forefront-PRVS: 0563F2E8B7
X-Microsoft-Exchange-Diagnostics: =?us-ascii?Q?1; BY1PR03MB1353;
	23:TgADWfkf/cxdFbniXv+k0B885VI/qYUQZC/NeRA3Q?=
	=?us-ascii?Q?gb1rw43i4WO5A+0CAmF6l//LrJEhLQLQsrlIHPESnveJJg8rLgDopyeCnxb0?=
	=?us-ascii?Q?5T8NHV9Cwu/rBIB4hwR1R1+fgOGP8Xo1spBDd4aqPwDH13tQDoWGRoeUptqu?=
	=?us-ascii?Q?Qz1lNS9fq/DlHyDnJi0HdsPe3ejikaPWwTVayLEIcDiTnodWIBzSUY3gcrF0?=
	=?us-ascii?Q?sanljs0pLm3xYwNBDWPwZQmZq/Lv1s86Ra9Hh9o4wzN31okSoz+tVqygnh4v?=
	=?us-ascii?Q?WzxHd707hLeWRzBwBJfCAZej2OYfPD9YswZ/cActgG/Oeu+4KxTlsTrABsPM?=
	=?us-ascii?Q?GxmWwHTEdth6cw4DExqpJomCKw81v7pJEsvsy08Phdc38/zuJQp7lrzxk2G3?=
	=?us-ascii?Q?5ds+1mCjQqKXoUU/wV+/2B7r4XlOJkhI/Qk/00PdwSJ98HP+g3W9RUeto5/r?=
	=?us-ascii?Q?FqQCTGPu8qmrfnWr2VLxsanX3EXghiueQS9aP4IUJtqKkZk1ccG+cq46jZwH?=
	=?us-ascii?Q?sztf3xO57RKxKCFN2unmEVDgxVbJ8GMmsr3iF+RpJnfWbutju9EZcE2qKoVL?=
	=?us-ascii?Q?Z0OnjGYuoK2Aabp5Nv9FHm9zZwZZUqjguH3BplNoAWC2X1foUW1DNc7PUGgb?=
	=?us-ascii?Q?dardCDT3I4igLZ2C0x6ad0lyoAvhwBLJ7MC4QpTEwmiXCmGhCmtaBC05/9t3?=
	=?us-ascii?Q?Udj92UVGnJ7Jzqe6UjhId3nSXgnsxof9SCQrNlqJSteVXY7wKsdhgJZyfHBm?=
	=?us-ascii?Q?aBbFYJZ9n2+tN6CdB8QGcWcBYbZzRvvCaqUanBXjz5ghulVhBJ/e+He/zdEi?=
	=?us-ascii?Q?UyGIFClVUZbfiK1sVIsepCvqqhgPlmBnuWgzevDgZ1N2eC08VZeQ32XtnCiD?=
	=?us-ascii?Q?czqvV31q9MkoiNUce4Mccu7+Fkpyae4FgflkEH5+apXjIqXCBh1cIX/xuw8L?=
	=?us-ascii?Q?yUFnFwYOawo+fyG+j8gDFg0ZNncZI6vMGhargn9p6Fp2BI6/hhhWD/FPeBiJ?=
	=?us-ascii?Q?xkdxeyMrj6kinuic2Blh5Ee/Xzle1PhZUADGhLNFRBbClTAQysIc/a6IrWEE?=
	=?us-ascii?Q?75OX39xvaFoYzyNcFdV36KB/6uMxnbirBLxOi5ey728uwbQJQ=3D=3D?=
X-Microsoft-Exchange-Diagnostics: 1; BY1PR03MB1353;
	6:Jxs5RqJaPTtbStQjQategDMruG40U/0pNgVWEGhFBAVX0CTMeFwV4vjn2b9j4CknOKIobLyJwY8r9zygcv51J/ZNnKXnEJAh4Lg/Xx0eEl78l/NjQV7gdNdGbbNWNRTKncZ2PjKJwbkw8DUi49F75oPCm9w/UOQeS4a29jTFsPg0J7TPURxUfIVNMUJdTClARvRuMQWSpbRk7wq5iJr4HFvihGad3d8J8CRWwzxBRDW8NNO77RZzUSgEnR+ik5povv1OBFRLwn+vFVQfojJJMo5bItiQWz5cywYlwM0hLgwUmp8ATYgBnRqo3kup0gOnQLwldCxoKryQGDGSyVa0Wgf8D2O9A1T7kSGQlYR8XFk=;
	5:pqlTltTrUePFVY7s4j1ou9E87K0+quX4y+vs+PyPjMLyKcTZ5U6zQF0oWCkSArw/Z2TcWrwf9BFJzTCLaNgx01SRtde3GJIdgDx04mM9b2hQn9JnpivywX22ANVt2h/Lov0corbxsP4V1SwgrTYFDRHHQ1pCorUpknC/NT0vuok=;
	24:Y5gO2mOtc7y2ZUAyqLyvPvmwe+B0Va8g0WPuvbdljWHTyGGNFMw3MR4vB00gJEtSN20LX/rKcl0uIknJr8aZMBRNlfLt1+Tvv1s5HIqWa4Y=;
	7:lohzVhuuiSqIMLgXzgybGpeFpgvWXFUsJM89YWJffx+/Z2XvRGnl4gVi323pa1MPjI8oA9RVC42A/KMV9igB6DZI3bUO3T3qGRq66o4zoMcRYyFZhi0DdJjKn4Hm+6wF2HaYvWCuBk7q57sexQkB2itlVlj19ciEtbEaN+c2l2JoLwHtMUPwU9sdjDAs2NnOFHrdh6yDKXc7raEuINW8vJHzi6PqIKyNsDwjfHIrYspr/ISynMWXlrKKaQImnqbp
SpamDiagnosticOutput: 1:99
SpamDiagnosticMetadata: NSPM
X-OriginatorOrg: freescale.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 25 Jan 2018 06:02:45.5718 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: c63fe41d-0b57-472a-00b6-08d563b9413b
X-MS-Exchange-CrossTenant-Id: 710a03f5-10f6-4d38-9ff4-a80b81da590d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=710a03f5-10f6-4d38-9ff4-a80b81da590d;
	Ip=[192.88.168.50]; Helo=[tx30smr01.am.freescale.net]
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BY1PR03MB1353
Cc: chunrong.guo@nxp.com
Subject: [PATCH] tcf-agent: update machine setting for aarch64 bigendian build
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
X-List-Received-Date: Thu, 25 Jan 2018 06:35:38 -0000
Content-Type: text/plain

From: Chunrong Guo <chunrong.guo@nxp.com>

Signed-off-by: Chunrong Guo <chunrong.guo@nxp.com>
---
 meta/recipes-devtools/tcf-agent/tcf-agent_git.bb | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta/recipes-devtools/tcf-agent/tcf-agent_git.bb b/meta/recipes-devtools/tcf-agent/tcf-agent_git.bb
index 6d6ba76..ba14c42 100644
--- a/meta/recipes-devtools/tcf-agent/tcf-agent_git.bb
+++ b/meta/recipes-devtools/tcf-agent/tcf-agent_git.bb
@@ -30,7 +30,7 @@ INITSCRIPT_NAME = "tcf-agent"
 INITSCRIPT_PARAMS = "start 99 3 5 . stop 20 0 1 2 6 ."
 
 # mangling needed for make
-MAKE_ARCH = "`echo ${TARGET_ARCH} | sed s,i.86,i686, | sed s,aarch64,a64,`"
+MAKE_ARCH = "`echo ${TARGET_ARCH} | sed s,i.86,i686, | sed s,aarch64.*,a64,`"
 MAKE_OS = "`echo ${TARGET_OS} | sed s,^linux.*,GNU/Linux,`"
 
 EXTRA_OEMAKE = "MACHINE=${MAKE_ARCH} OPSYS=${MAKE_OS} 'CC=${CC}' 'AR=${AR}'"
-- 
1.9.0


