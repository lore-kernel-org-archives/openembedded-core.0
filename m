Return-Path: <alejandr@xilinx.com>
X-Greylist: delayed 908 seconds by postgrey-1.34 at layers.openembedded.org;
	Fri, 30 Mar 2018 06:43:53 UTC
Received: from NAM01-BY2-obe.outbound.protection.outlook.com
	(mail-by2nam01on0040.outbound.protection.outlook.com [104.47.34.40])
	by mail.openembedded.org (Postfix) with ESMTP id 53BF374626
	for <openembedded-core@lists.openembedded.org>;
	Fri, 30 Mar 2018 06:43:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=xilinx.onmicrosoft.com; s=selector1-xilinx-com;
	h=From:Date:Subject:Message-ID:Content-Type:MIME-Version;
	bh=PL92pPjuPOQv3MKHxa7TyS67vV7oqsVzVGlGd+/nsZo=;
	b=d0MhSvUZdB+5Z8gy/REoaEmpgg9UmlvQVbtInW3aT1fUVQyOjv2Fs5htfExmQkgjyIm1PaNWPoHKt8xSDPe93zZ+XSGYG6ZyHkU/FFa1qtcirqDgkTima1CZaO8SwbFwYT7hL/kSr0NO3Uw4Np7S134S6REVvhei7vGWPic6ZtY=
Received: from BL0PR02CA0069.namprd02.prod.outlook.com (2603:10b6:207:3d::46)
	by CY1PR02MB1303.namprd02.prod.outlook.com (2a01:111:e400:50f0::18)
	with Microsoft SMTP Server (version=TLS1_2,
	cipher=TLS_ECDHE_RSA_WITH_AES_256_CBC_SHA384_P256) id 15.20.609.10;
	Fri, 30 Mar 2018 06:28:43 +0000
Received: from SN1NAM02FT041.eop-nam02.prod.protection.outlook.com
	(2a01:111:f400:7e44::206) by BL0PR02CA0069.outlook.office365.com
	(2603:10b6:207:3d::46) with Microsoft SMTP Server (version=TLS1_2,
	cipher=TLS_ECDHE_RSA_WITH_AES_256_CBC_SHA384) id 15.20.631.10 via
	Frontend Transport; Fri, 30 Mar 2018 06:28:42 +0000
Authentication-Results: spf=pass (sender IP is 149.199.60.83)
	smtp.mailfrom=xilinx.com; intel.com; dkim=none (message not signed)
	header.d=none;intel.com; dmarc=bestguesspass action=none
	header.from=xilinx.com;
Received-SPF: Pass (protection.outlook.com: domain of xilinx.com designates
	149.199.60.83 as permitted sender) receiver=protection.outlook.com;
	client-ip=149.199.60.83; helo=xsj-pvapsmtpgw01;
Received: from xsj-pvapsmtpgw01 (149.199.60.83) by
	SN1NAM02FT041.mail.protection.outlook.com (10.152.72.217) with
	Microsoft SMTP Server (version=TLS1_0,
	cipher=TLS_RSA_WITH_AES_256_CBC_SHA) id 15.20.631.7
	via Frontend Transport; Fri, 30 Mar 2018 06:28:42 +0000
Received: from unknown-38-66.xilinx.com ([149.199.38.66] helo=xsj-pvapsmtp01)
	by xsj-pvapsmtpgw01 with esmtp (Exim 4.63)
	(envelope-from <alejandro.enedino.hernandez-samaniego@xilinx.com>)
	id 1f1nWj-0006MV-OD; Thu, 29 Mar 2018 23:28:41 -0700
Received: from [127.0.0.1] (helo=localhost)
	by xsj-pvapsmtp01 with smtp (Exim 4.63)
	(envelope-from <alejandro.enedino.hernandez-samaniego@xilinx.com>)
	id 1f1nWe-0005Zj-LJ; Thu, 29 Mar 2018 23:28:36 -0700
Received: from xsj-pvapsmtp01 (maildrop.xilinx.com [149.199.38.66])
	by xsj-smtp-dlp1.xlnx.xilinx.com (8.13.8/8.13.1) with ESMTP id
	w2U6SYlU030245; Thu, 29 Mar 2018 23:28:34 -0700
Received: from [172.19.2.8] (helo=xsjalejandr50.xilinx.com)
	by xsj-pvapsmtp01 with esmtp (Exim 4.63)
	(envelope-from <alejandr@xilinx.com>)
	id 1f1nWc-0005ZY-JE; Thu, 29 Mar 2018 23:28:34 -0700
From: Alejandro Enedino Hernandez Samaniego
	<alejandro.enedino.hernandez-samaniego@xilinx.com>
To: <openembedded-core@lists.openembedded.org>
Date: Thu, 29 Mar 2018 23:28:31 -0700
Message-ID: <06bed089dd24c880a45198216bbfdf3bf0960d99.1522390968.git.alejandr@xilinx.com>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <cover.1522390968.git.alejandr@xilinx.com>
References: <cover.1522390968.git.alejandr@xilinx.com>
X-RCIS-Action: ALLOW
X-TM-AS-Product-Ver: IMSS-7.1.0.1224-8.2.0.1013-23620.005
X-TM-AS-User-Approved-Sender: Yes;Yes
X-EOPAttributedMessage: 0
X-MS-Office365-Filtering-HT: Tenant
X-Forefront-Antispam-Report: CIP:149.199.60.83; IPV:NLI; CTRY:US; EFV:NLI;
	SFV:NSPM;
	SFS:(10009020)(979002)(39380400002)(346002)(396003)(376002)(39840400004)(2980300002)(438002)(3190300001)(199004)(189003)(336012)(5890100001)(186003)(11346002)(2351001)(2616005)(486005)(476003)(126002)(486005)(47776003)(8746002)(5660300001)(81166006)(6916009)(6666003)(106466001)(107886003)(81156014)(316002)(8676002)(8936002)(59450400001)(76176011)(26005)(50466002)(356003)(63266004)(36756003)(446003)(305945005)(51416003)(7696005)(77096007)(48376002)(9786002)(478600001)(54906003)(36386004)(2906002)(4326008)(50226002)(118296001)(106002)(426003)(107986001)(969003)(989001)(999001)(1009001)(1019001);
	DIR:OUT; SFP:1101; SCL:1; SRVR:CY1PR02MB1303; H:xsj-pvapsmtpgw01;
	FPR:; SPF:Pass; PTR:unknown-60-83.xilinx.com; A:1; MX:1; LANG:en;
X-Microsoft-Exchange-Diagnostics: 1; SN1NAM02FT041;
	1:m2CQb+oiMiRGw4UmgJ+V+DvfOd+msrPprM7/oox1remF0l+ixq0YR7X10b41zwtd+JaOOkjOtjmePXY7RZfOwtE9Utu3vuk8h4FHfn/4srAAjeeRwCMeR0d4RBbPva3H
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 4d708013-066a-4a18-4368-08d596077b78
X-Microsoft-Antispam: UriScan:; BCL:0; PCL:0;
	RULEID:(7020095)(4652020)(5600026)(4604075)(4608076)(4534165)(4627221)(201703031133081)(201702281549075)(2017052603328)(7153060);
	SRVR:CY1PR02MB1303; 
X-Microsoft-Exchange-Diagnostics: 1; CY1PR02MB1303;
	3:YzRHPubYBjsC/tx6ZrqgtYiCIkTk7Eo8HQkNaAteywXu58cOxBprf2uFxYEKU/9+vm2thJANb3sQ/KeGpBjv2jgzW6oXHsw2xrgOxD9i4se7J6SjdpnQ56H6gkZgXvsJnOmxr5YBnnmsqmoQ+8xamWbl4jK3EPp5hkz5EBt6ijXnNkAz9ro8Mil6j6Jz1SZsAMPH7vuxnCPeKdlw5YoBWXanszO1OE3WOSuA/g9rIyZKVg8Pm5s1W48NhFmN7XE6LHOpchiAi/boHKTm7o+JYQ4sFJHtCg7NSBsS57O53uCJGY+bhfhU1glHCx6AKmRSkCsmaLeKb3zThkphQre2kUqhnf4YLAzuUSObglx7wH4=;
	25:kDSjHwirsN0YM01/SlXMhcTTSYoFzLvLVAr+8hLeQPMeLKQjPvPgGmPLcprvUEBJ3gnOhCh5fCBCaXNZRZZoJJxsP8Qq/FdeLDcOtGtj6OPNE7JvrKh8lrnsYN2nI/B528CJKyfRf6BKu7LeREBRykCkEkXwCllAuMBkOfmr5foBc6nDDrIvcvJououYNZMMtyiGQWacGTdRMrpZHJqESdLocbLsNs8x9rZVa4FICP1wTLmoEjN5ddDl28jSQwFV/a7p0MPvntIzfB7JNZK1BYtYQg0vnu+6Gt8IOODfDPAC3sDObmi+CzpFG4SP/C4tBh1ziUeLp0V8pjjSBcRtWg==
X-MS-TrafficTypeDiagnostic: CY1PR02MB1303:
X-Microsoft-Exchange-Diagnostics: 1; CY1PR02MB1303;
	31:1n0P2LH50K9NeU7dQifIQAFEJ+QcPlJ+rP7ZmqqwGFST5IykxdfzXPm1HGr9TeqEF3snUw1cXXsop4bow6vXXdWKxLet6hvE5rExE3t8ivcudg/BXeztLTvXk8jPQTwSJUl1MAkTX82R/+hgxkzbqP8AjFSu/eKMdpGVWQ8mhnp1nVrAxV6QScus7z97JvI+EQONNc6CQ2OE2cy7OAdWywjahmQhMQqt2lyMpy4t2jY=;
	20:K7DVN9uBEIWQI6Vw1nXn9yyXgy/x6X53Sv/ukP4PHX576mfTZKrssFaxWVlNh3gkzEHZR3sxke754bpHdP9ABScJ55wnNTT+0AIzlu1dG6PxUvaRzBnXNbk7JTYGVfYCQpUj2WgppMhXwWn/LALJG03cb/xXDzKInkXquHOK2dhITA7nSxhUnA9IOGaeVaxBCfBbibSk3W+97P99DQ0Ickjr2VjVAuaLx655yHJJZZLxjLug/Gp6QThpVo7ceP+GvU6JfI84TISUWGJYKkpm7IhZlcdjooyrqQ1JJWVVAIn3lht0/npl3I48CQILHTTpwFuieqWM94rhRKadBzlk/p3x5T9I4ERxiqjJdv6Il5LvyLmHi+PH0DgstiZ0KrWALpRQqANkW8lVr9ZT5kTiZUAUPeu5QfgtioIJE//2C9o+r1hlCZJmhMnIiXrYwtcAkSk57sgUJttdDZbaznmW3BcSZ7N9sPYRm7ojkCcRtk8qjkXKwMKIOJRf8P41Pfxx
X-Auto-Response-Suppress: DR, RN, NRN, OOF, AutoReply
X-Microsoft-Antispam-PRVS: <CY1PR02MB13031EF8E819A4E36407B76CACA10@CY1PR02MB1303.namprd02.prod.outlook.com>
X-Exchange-Antispam-Report-Test: UriScan:(192813158149592);
X-Exchange-Antispam-Report-CFA-Test: BCL:0; PCL:0;
	RULEID:(8211001083)(6040522)(2401047)(5005006)(8121501046)(93006095)(93004095)(10201501046)(3002001)(3231221)(944501327)(52105095)(6055026)(6041310)(20161123558120)(20161123564045)(201703131423095)(201702281528075)(20161123555045)(201703061421075)(201703061406153)(20161123560045)(20161123562045)(6072148)(201708071742011);
	SRVR:CY1PR02MB1303; BCL:0; PCL:0; RULEID:; SRVR:CY1PR02MB1303; 
X-Microsoft-Exchange-Diagnostics: 1; CY1PR02MB1303;
	4:rfRxsrJp3T4G7V1qngBG7KZKMfozzHBcx6QBhchZSEdgM7vw4BaEUgbnIc9/c/V64NQv7Q+HP7+p/8W98ognp72Y70oPq+Sr8j1s8vEnSveV3rnoOzo+kIfuOJbefK8nPMbN3ne9t41EQvHiOiJYTmLPtdhll0Rw7wpK/hrJ6QDoGzTpzR1KbGxBSiQM9/uQFmOd8xs/6YrBdLoCl7YijFtYIFelc1U9rcqBDjDQ7BpoNYmEDsyHMR295vFErjPbYjNOsIwMKzx8gSbmdp9jCa105TcwBGKeWn0s0AE38pSLwpOleyB9RLBhtGULzm6p
X-Forefront-PRVS: 06274D1C43
X-Microsoft-Exchange-Diagnostics: =?us-ascii?Q?1; CY1PR02MB1303;
	23:UnsH9aJW8+xUEOwD1AL6DZD6+t7sTovrVnLi86nyP?=
	=?us-ascii?Q?CjLaIDRrsdMUTPQnwf6mGUcxJV+CtqEjkZCFj5glXBMAh/WpKL7NDlXjtY/w?=
	=?us-ascii?Q?uQJ+ZYwuoPb5y3c14sfsEKWIfgPOc1OuF4WJPT+yP4cLnqxeA2V0FghioWpt?=
	=?us-ascii?Q?av/HHtBeZGVcRHxA3TUw7E/jY7F2wMJ6pUzGdjnIsLJAtPLyy0KEXz+lx7sH?=
	=?us-ascii?Q?pc5hD3xipAB3fujfhUZumzvWRUB0yDOsvCjz0+JmEe1sroCAHRC4X0tqfSci?=
	=?us-ascii?Q?AMzH2Ae3MusEIURKgJo/5OS+rv9EaHpZ/wH33XcAWDKGol7nOjYntjTqcBUi?=
	=?us-ascii?Q?BkuW97woxqUVNg9pK82jMVgZY56S7q05BjVZ6KSx7iwJmV9MpTbW0e3O3eum?=
	=?us-ascii?Q?vXidRgU7CSP8Rcx6pY+pEBBDKizUFZwIQNY3gZNOO9GFWX6YaMg4TPDaoz/E?=
	=?us-ascii?Q?XaxtVoiZ4/kUaVfcbx7+S0/Zt7YkD0ES0Ij2LOx8FElMyLm/+RPfmMdDkSdz?=
	=?us-ascii?Q?nKllLUi+I1bgoEt4tcxpt5e/SORPKu4Ol1MItjkfj+yG5KxN08yuUS+4uo5X?=
	=?us-ascii?Q?d4HVnNjpEqpyukZUWRi1ZcnD6JT6iEgBKVS9ZpgafmZMoaQXhZ60Tj6DxuER?=
	=?us-ascii?Q?XwlbloNPyENTQBj5x87dyHD0j9w3WRimYDnD6cDWsL3RQYr8ky1rFUYLWXfo?=
	=?us-ascii?Q?jnx6MEbCOr8iik2HHlBnerqApmaxBjOGHdo3y6icEb8aFWIfBjE8Y1XWzObI?=
	=?us-ascii?Q?2D/4j6pWA3reB7TlV+tAPX8uHJXiVMnQL1ieINqTPCkO374Ym+DT4S0DwbfL?=
	=?us-ascii?Q?zibG1IuoIJICV7uVS1Rdpz6IMmFnGwQPMbnaX+BUlSFjr7gslk5u89VA7xFJ?=
	=?us-ascii?Q?pRzXDLcv3f/Rg2t2EyT/s3uyp7ZpY9MBhvKUUxUciY4rx1CvnxkSl3KjLdf2?=
	=?us-ascii?Q?hM+cSikQGiDdRQZBxj+xrTlTph+6zhiqtXsROg2v0ji0AFP0+2JQ1vDI32Pq?=
	=?us-ascii?Q?KVxi0rPJZrVoJWRJ0RZWgvwvpuP99M0j7U68JfNbYDhKwnlZ/OdUxNijEf4B?=
	=?us-ascii?Q?8iwqqpdWJf4uc1X1HA0c88hL1mfWnLxFFd6ewQ7cCHdc3quRooDJRMbNtBzh?=
	=?us-ascii?Q?RgDb5yPf7c9N0y914xDBf04aIuyezmnseiCxiP0HHrKkaaxudIsHID28DpNY?=
	=?us-ascii?Q?yR1OcOV8Rzqu56iosTh0ckotG0XPEH0LcQ2QftNWZHHvKv7xeRDiuuCXDXvZ?=
	=?us-ascii?Q?ZiEn/FeMvDhNddwuXN8hP61Dm0f7dFK9K4WqbHjg9gPBlgjwHkPepSx/THJ5?=
	=?us-ascii?Q?nZot2k2bO11XAO1CJv3vsBF1KsDFClQzbr3pQuyiFhy?=
X-Microsoft-Antispam-Message-Info: naMIp1t1lzdznxUqnBESNR5nDiN7MWIeoin6Lh8e9OLpXE1eit93XJrOoLcsXxPJry8bZd5a5B7pJmenFB+50W0oWgu6KlukgvnzfMi8Z4AmUpjQrb7cIZu6dwnEuuZRfDeOEeu9p6WYx0LI1UICJy9Eq8HEOiI9tPdQ+HrLiCrKuGuezxfvSnRUbAe3LXnI
X-Microsoft-Exchange-Diagnostics: 1; CY1PR02MB1303;
	6:1zj4Ke/biEQ17swp2ChE5weBzRHsYh7f9oxx5prV9DKB8zNLknstHoZQNnLWbFikP2U1P6MBSc5yIEMGZj74sT+CuELjGv/aQ2t06o1scIn5iSTYh7h4HnYcw9cPqpwiSq6/JihVhWgS0AWAVrQqED/AcFqDsCvwhO/Z8csC/KPHO5Zr8Q/imNlVH5xCSYpwhllU4MfaavxHZQluXLvYigTBo3s1ULx4F+UPrU8s4lnZ83uq4LXeeS5sGYxeDNYvdwmJsY+JRhE8R3uwDOiKcjqM9RlXES0ydxUKXBOh0hzNvZFyVAmJb9rs3Suy88mUZGtc8Hzeq6gBdfucMaGUqHJec8NV+3j829N9tb4k27d6VodtMJTvx1msFe1MZnQZPGqfE0RpVxNVKkjJ6gdSlVa7HpyMDWvdBbGxD3GpU3bDNorVnmNqCL4g561acyKwCPl6ZcFFXnlte5rmJBLbOQ==;
	5:ibFDhfdpQ6GzAFkKUVgjLfmbvqTQ5Xz+Nh9pc28BonO9PPeqAOMVjcfrF91EGIAKMT8RBaKQhicgNbYSew2ffXprtNYsMcg25NBBqRoi3VRiu/AM6rNMnu9KbyFtPnzTSfe7C7O7ug1uDKmvM2y8zUWd6Iq/VXLvrnm0jwLwHNM=;
	24:o6dET15h1FxtLDQ6X/TveX2BA81jusO/365+S3MHRcUDlfOKjC4rdxPTtQuO0omXJznQA/4LRTpL+oB9ejqf0K9ItPYmgwy2QC9X+E4sB8g=
SpamDiagnosticOutput: 1:99
SpamDiagnosticMetadata: NSPM
X-Microsoft-Exchange-Diagnostics: 1; CY1PR02MB1303;
	7:kfaVTYO6boBJYpQT8f/PmRU3dOBkNY3fbNRJoTgHUu7ALIYRK6AqXK6QyNFHA6YHH5IS7YqjigEURW2j2mA9TJDBV5VEeFINT41zfCCKkqA2w8xcHrTILjgPXu7IlWRZm8+mo1fgilMPlTrUeZIXb8XEf36MoDp9q4ydlY4U4JsozhKnt7LrepU02shAKW660CV4bXbTUQyaZ8+7dpcZVbEYiNm15X9dcgash1CPN5hHa3jCY2nsr520PyoVSz6H
X-OriginatorOrg: xilinx.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 30 Mar 2018 06:28:42.1647 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 4d708013-066a-4a18-4368-08d596077b78
X-MS-Exchange-CrossTenant-Id: 657af505-d5df-48d0-8300-c31994686c5c
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=657af505-d5df-48d0-8300-c31994686c5c;
	Ip=[149.199.60.83]; Helo=[xsj-pvapsmtpgw01]
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CY1PR02MB1303
Subject: [PATCH 2/2] python3: Fix do_create_manifest for python3-sqlite3
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
X-List-Received-Date: Fri, 30 Mar 2018 06:43:54 -0000
Content-Type: text/plain
Content-Transfer-Encoding: quoted-printable

Some of the sqlite3 files ended up in python3-misc incorrectly,
this is caused becuse we couldnt add the whole ${libdir}/python3/sqlite3
folder on the package because we also have another sqlite3-tests
package that needs to include another folder from that directory.

This patch not only fixes the do_create_manifest script to handle this
situation, but also patches the manifest (created using the script)
which also fixes a hiddn runtime dependency that we wouldn't have seen.

Signed-off-by: Alejandro Enedino Hernandez Samaniego <alejandr@xilinx.com>
---
 .../python/python3/create_manifest3.py             | 43 ++++++++++++++----=
----
 .../python/python3/python3-manifest.json           | 15 +++++---
 2 files changed, 37 insertions(+), 21 deletions(-)

diff --git a/meta/recipes-devtools/python/python3/create_manifest3.py b/met=
a/recipes-devtools/python/python3/create_manifest3.py
index 43e95ce..212ddd4 100644
--- a/meta/recipes-devtools/python/python3/create_manifest3.py
+++ b/meta/recipes-devtools/python/python3/create_manifest3.py
@@ -124,7 +124,6 @@ for value in old_manifest['core']['files']:
   # Get module name , shouldnt be affected by libdir/bindir
   value =3D os.path.splitext(os.path.basename(os.path.normpath(value)))[0]

-
   # Launch separate task for each module for deterministic behavior
   # Each module will only import what is necessary for it to work in speci=
fic
   print ('Getting dependencies for module: %s' % value)
@@ -203,8 +202,20 @@ for key in old_manifest:
             if value not in new_manifest[key]['files']:
                 new_manifest[key]['files'].append(value)
             continue
+
         # Get module name , shouldnt be affected by libdir/bindir
-        value =3D os.path.splitext(os.path.basename(os.path.normpath(value=
)))[0]
+        # We need to check if the imported module comes from another (e.g.=
 sqlite3.dump)
+        path,value =3D os.path.split(value)
+        path =3D os.path.basename(path)
+        value =3D os.path.splitext(os.path.basename(value))[0]
+
+        # If this condition is met, it means we need to import it from ano=
ther module
+        # or its the folder itself (e.g. unittest)
+        if path =3D=3D key:
+          if value:
+            value =3D path + '.' + value
+          else:
+            value =3D path

         # Launch separate task for each module for deterministic behavior
         # Each module will only import what is necessary for it to work in=
 specific
@@ -292,19 +303,20 @@ for key in old_manifest:
                                        new_manifest[key]['rdepends'].appen=
d(newkey)
                                     break
                     else:
-                      # Debug
-                      print('Adding %s to %s FILES' % (item, key))
-                      # Since it wasnt found on another package, its not a=
n RDEP, so add it to FILES for this package
-                      if isCached(item):
-                          new_manifest[key]['cached'].append(item)
-                      else:
-                          new_manifest[key]['files'].append(item)
-                      if item.endswith('*'):
-                          wildcards.append(item)
-                      if item not in allfiles:
-                          allfiles.append(item)
-                      else:
-                          repeated.append(item)
+                      # A module shouldn't contain itself (${libdir}/pytho=
n3/sqlite3 shouldnt be on sqlite3 files)
+                      if os.path.basename(item) !=3D key:
+                        print('Adding %s to %s FILES' % (item, key))
+                        # Since it wasnt found on another package, its not=
 an RDEP, so add it to FILES for this package
+                        if isCached(item):
+                            new_manifest[key]['cached'].append(item)
+                        else:
+                            new_manifest[key]['files'].append(item)
+                        if item.endswith('*'):
+                            wildcards.append(item)
+                        if item not in allfiles:
+                            allfiles.append(item)
+                        else:
+                            repeated.append(item)

 print ('The following files are repeated (contained in more than one packa=
ge), please check which package should get it:')
 print (repeated)
@@ -322,3 +334,4 @@ for key in new_manifest:
 # Create the manifest from the data structure that was built
 with open('python3-manifest.json.new','w') as outfile:
     json.dump(new_manifest,outfile,sort_keys=3DTrue, indent=3D4)
+    outfile.write("\n")
diff --git a/meta/recipes-devtools/python/python3/python3-manifest.json b/m=
eta/recipes-devtools/python/python3/python3-manifest.json
index 911be8e..26fa613 100644
--- a/meta/recipes-devtools/python/python3/python3-manifest.json
+++ b/meta/recipes-devtools/python/python3/python3-manifest.json
@@ -591,8 +591,7 @@
         ],
         "rdepends": [
             "core",
-            "stringold",
-            "netserver"
+            "stringold"
         ],
         "summary": "Python logging support"
     },
@@ -978,14 +977,18 @@
     },
     "sqlite3": {
         "cached": [
-            "${libdir}/python3.5/sqlite3/__pycache__/*.pyc"
+            "${libdir}/python3.5/sqlite3/__pycache__",
+            "${libdir}/python3.5/sqlite3/__pycache__/dbapi2.*.pyc",
+            "${libdir}/python3.5/sqlite3/__pycache__/dump.*.pyc"
         ],
         "files": [
             "${libdir}/python3.5/lib-dynload/_sqlite3.*.so",
-            "${libdir}/python3.5/sqlite3/*.py"
+            "${libdir}/python3.5/sqlite3/dbapi2.py",
+            "${libdir}/python3.5/sqlite3/dump.py"
         ],
         "rdepends": [
-            "core"
+            "core",
+            "datetime"
         ],
         "summary": "Python Sqlite3 database support"
     },
@@ -1145,4 +1148,4 @@
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

