Return-Path: <ting.liu@freescale.com>
X-Greylist: delayed 1130 seconds by postgrey-1.34 at layers.openembedded.org;
	Wed, 21 Oct 2015 10:21:25 UTC
Received: from na01-bn1-obe.outbound.protection.outlook.com
	(mail-bn1bon0113.outbound.protection.outlook.com [157.56.111.113])
	by mail.openembedded.org (Postfix) with ESMTP id CCEB1770A0
	for <openembedded-core@lists.openembedded.org>;
	Wed, 21 Oct 2015 10:21:25 +0000 (UTC)
Received: from BY2PR03CA042.namprd03.prod.outlook.com (10.141.249.15) by
	CY1PR03MB1375.namprd03.prod.outlook.com (10.163.16.29) with Microsoft
	SMTP Server (TLS) id 15.1.300.14; Wed, 21 Oct 2015 09:47:11 +0000
Received: from BN1AFFO11FD053.protection.gbl (2a01:111:f400:7c10::129) by
	BY2PR03CA042.outlook.office365.com (2a01:111:e400:2c5d::15) with
	Microsoft SMTP Server (TLS) id 15.1.300.14 via Frontend Transport;
	Wed, 21 Oct 2015 09:47:11 +0000
Authentication-Results: spf=fail (sender IP is 192.88.168.50)
	smtp.mailfrom=freescale.com; freescale.mail.onmicrosoft.com; dkim=none
	(message not signed) header.d=none; freescale.mail.onmicrosoft.com;
	dmarc=none action=none header.from=freescale.com;
Received-SPF: Fail (protection.outlook.com: domain of freescale.com does not
	designate 192.88.168.50 as permitted sender)
	receiver=protection.outlook.com; 
	client-ip=192.88.168.50; helo=tx30smr01.am.freescale.net;
Received: from tx30smr01.am.freescale.net (192.88.168.50) by
	BN1AFFO11FD053.mail.protection.outlook.com (10.58.53.68) with Microsoft
	SMTP Server (TLS) id 15.1.300.4 via Frontend Transport;
	Wed, 21 Oct 2015 09:47:11 +0000
Received: from b28495.ap.freescale.net (b28495.ap.freescale.net [10.193.20.14])
	by tx30smr01.am.freescale.net (8.14.3/8.14.0) with ESMTP id
	t9L9l8kE029651; Wed, 21 Oct 2015 02:47:09 -0700
From: <b28495@freescale.com>
To: <openembedded-core@lists.openembedded.org>
Date: Wed, 21 Oct 2015 17:47:08 +0800
Message-ID: <1445420828-7756-1-git-send-email-b28495@freescale.com>
X-Mailer: git-send-email 1.9.1
X-EOPAttributedMessage: 0
X-Microsoft-Exchange-Diagnostics: 1; BN1AFFO11FD053;
	1:mflG1cnASMxMgr70MCtaGEdzQpFLLNhRqyQYlXVFvF8HXtEsFY/Oen0pqPUJ4NNZnQmo9jFtB07PREb5FPqRECvfnHkoZxnJu2KN6BLA8mVISI+GepmtF0UhIk6CZXs+qjRAnKYvswaIkIWma5r7wDc1eo9gFpx5TSUt2/qfpKeF44KaRuZvMbZsxO8KSQ5PFWzRvBzbiMeEx5jLjVdfmEaekDMSS4UTwPVSRuC7qlmJF/TULGD9Cdp6ncGy+ElC4sC9269gmQoUW/D+1QIxeM8H1hMU2TXAIolvwQaBuTNc2OLfl/wEGJkfJLGSr4VoMfhN1/colcHpkcJyto9le744eyeBJs98Ea25aitgn4PEBdY4YzjdmARhq86KzzSB70sAAMLNvXhbv8eDwprdWw==
X-Forefront-Antispam-Report: CIP:192.88.168.50; CTRY:US; IPV:NLI; EFV:NLI;
	SFV:NSPM;
	SFS:(10019020)(6009001)(2980300002)(1109001)(1110001)(339900001)(199003)(189002)(46102003)(36756003)(2351001)(450100001)(5007970100001)(229853001)(6806005)(106466001)(105606002)(92566002)(5008740100001)(77096005)(50226001)(110136002)(33646002)(5001960100002)(107886002)(189998001)(19580395003)(87936001)(64706001)(85426001)(19580405001)(47776003)(81156007)(5003940100001)(11100500001)(97736004)(5001920100001)(104016004)(86152002)(48376002)(50466002)(50986999)(37363001)(4001430100001);
	DIR:OUT; SFP:1102; SCL:1; SRVR:CY1PR03MB1375;
	H:tx30smr01.am.freescale.net; FPR:; SPF:Fail;
	PTR:InfoDomainNonexistent; A:1; MX:1; LANG:en; 
MIME-Version: 1.0
X-Microsoft-Exchange-Diagnostics: 1; CY1PR03MB1375;
	2:YOozE5IhMsxmNfjxP1mqJQMxqoaDjZX58mqzxLHtovUgs7GxprbqHqny0Hj+COabmgxk13/zxyUelLXt7H2eyYWJWAswbQxJipZS9f4nicvc864gniQohgVH12Yky185t2Z4/XkUXHaQIpZvibmACVrQBq82ivJDHK+a5BsUrRg=;
	3:ih8mImWMYV1xOAacWB8Xkxw0vuHo9bzIGpdxEq9jj+KL3v0c9z+R1Gq4XO7TtMK3uU13QlqgsdDK1JP5i7oGKqlxCIdtvCRnB+LLadE46ng0FC0d1qfdzesQT32vriVWiym2ivasUYONT9DEVPHAFrfH52ItuelNeWg+8otV9fWbtreU04XnAPnH0FICjwYGM/cH1hdoraunA37OyYNCUVPXPx1z+BYhcaj++MayAcI=;
	25:Pim/HbtG6dYMAxu5Hqk7+mJczO6cb2oaQmRMEXiycJIsOs6VCcDHpqVK7ncwvQVW33BI5H6zH7InsLc4azMttwpD4628h7DNB01F1WsvR2Zgd44hp7he/hsrfJ7onN8qlYydgBoUK+6L4CeX8eJkqOtQpyvnUGUX+3e981i6Kfj+5hevD5sC27FIRq4H3kNwc4wUo/YWFxULop8x6+S62bPiI1bmXI4yG1cRkWpVWQUcHICYjIMQ3ynaYrowThr8lLXCTuozIdC/URj7jcaTTw==
X-Microsoft-Antispam: UriScan:;BCL:0;PCL:0;RULEID:;SRVR:CY1PR03MB1375;
X-Microsoft-Exchange-Diagnostics: 1; CY1PR03MB1375;
	20:jXuz3CINbj+EGCZp0d4UCMY2oDBXje1DTupVm8pPQaYKJtu0GnxhaUOWWRw99k74TRn2nDKZxuxUNQoUQlYLuQ5+kgn0DRQeSLO8wAHQr6xXBWSFAN/iakMGyOxWwF4wAf1rXJJZdkZoTx/KT6rZvepP8DoUeqf5i5Ub/rca1K5plOHDjfp/L+2SgSDXywkmtJM7k71fX9HyRDYlTa0OYgjyAZKkuCXFW3cDdM/MyNrThDPvxRUIJxhS0BKQ0ZROJtUliM+NpkvaDKg96JkKLZVwJmPLEAJ5E5fcBsLqcFPiz4aPlFIyTAfDZLbprAlGrQOpjmXgvGLhsC958eCbco+F8z5Nf546zYoWxr9SAoo=;
	4:rSsQrmFKxChnI3Cp40xsuIAKzvlFxGUEITvjUePl2DlSQ07BtK13KVoVTXsPQGVn+dIcUcLwfJtcwunPIXXUM1Sun3z+UScqHdP7hHl8NLPqANKyO1sLx5Ezr8nbek5PSuhIWZVyUe6qiMIZkNzv5j3fIQRNTtJeypho06W6js9779/B3c1HpU8e8k2+q0TgCECFMWgrJDLtuK4nkSKuZ/LlJfoLvxh22O0qTcX8jNE8loeH/Iq8vOEC2e5r3nf0UuyJs3utGV3845jTaks+ra6vqgIMwnqLhswsw47oXECAaFNsGo/SMKv0f263xLTSrTAAVjoCHFbVjrmYGQOipyAWcZeFbzuPYLy93l+I+6Lj71y5edWx7XBtnbzVWQ9x
X-Microsoft-Antispam-PRVS: <CY1PR03MB13754EFC63BD274FEDDB520B93380@CY1PR03MB1375.namprd03.prod.outlook.com>
X-Exchange-Antispam-Report-Test: UriScan:(101931422205132);
X-Exchange-Antispam-Report-CFA-Test: BCL:0; PCL:0;
	RULEID:(601004)(2401047)(5005006)(8121501046)(520078)(3002001)(102115026);
	SRVR:CY1PR03MB1375; BCL:0; PCL:0; RULEID:; SRVR:CY1PR03MB1375; 
X-Forefront-PRVS: 073631BD3D
X-Microsoft-Exchange-Diagnostics: =?us-ascii?Q?1; CY1PR03MB1375;
	23:33sCufFOC20muHdCvVsiW0yV57nrJTw2xxhaGs0Kn?=
	=?us-ascii?Q?tiO7f28s41eeG96hsDo8r3FDYyZbXDKGRmSO0Wjt/2t0nb3UmagR0vjDyGKD?=
	=?us-ascii?Q?T0tzojF+EFzbOuwFlUdVR6CV9bGGjL/kkSyQQp4Vwr8fiszL+Zcqg3wYPgnE?=
	=?us-ascii?Q?Y9PFxf9w7v39bLERfnwoy0q1somw+WU9q4neaMC4XQoc4fLJW2rvM+PY+qsa?=
	=?us-ascii?Q?zicrs//M2SjOzoVXp1YvDibf+YRw8X+lhcfX9NRve00l2/2AprXaQlM0NzUr?=
	=?us-ascii?Q?mezyx3/aKkJv3rWgXPUPjyRVAaV16Mg8FWUEQlfWlGJ0ABrSNnbFt2Br+D/o?=
	=?us-ascii?Q?9FptE1TB4HjHFWt+fbWhwW6BIzGk/xweXp9vhd3we4HxmjktLT+BfNZEjlqZ?=
	=?us-ascii?Q?CRFyaN1pa+NmlLbpTuLBSExfbmsYsmpAWB35cREAMyOh4JUL36RtG4luapeA?=
	=?us-ascii?Q?WyXFzuAAgukbjNNGV0oKnrL8EXeWsXdAICvKuJbi9BGyzYwGUOveEqYJ516N?=
	=?us-ascii?Q?PmCLU546TC4RxihFBdATksMbxIb1jogBxK4+kjDz1/UHniCpYzSi4LSdrbZx?=
	=?us-ascii?Q?FMODNzi3kRQVdy/QTNukOwZ33tAc76dJRT2GaCW65/ZDAR11YciKZ2YhAvct?=
	=?us-ascii?Q?1ma18oe0Nhpcn6yacUUXlFRPgyiw/Zx+C2i9qcoxbj19RmN0IytjD4UXXAhc?=
	=?us-ascii?Q?QUPk25EFJ0G3NVJwYELtrYQFlRpaDV8gpcIHEBS+dET34sTLwrP3patc3XK8?=
	=?us-ascii?Q?9QdMT32rCowK6QJtBGiDol0mJpjQUYy8oilwiprb4aFA9SbRJznYLkDlHTOK?=
	=?us-ascii?Q?iqjEnHf+6JSVeAYnvAD5DyETFlhdoz9Jnpsk7cj/POrEOgiJrnHL8SJFFTl8?=
	=?us-ascii?Q?ljfB2ufDpdjCs+5/OQz/Fgfpq3VPdg1FUULuSksieqr9ubIRjc5K01TXtVVR?=
	=?us-ascii?Q?dgJmGWX82zpWBSy82+24fKfE8O5/i3tLSgMZGRfmdaRJhq4aG1Y5E9oxuKAu?=
	=?us-ascii?Q?zHooe1dFG3I3it/jclZohB+K2TX8PWJ9GvNcqOIGivnYnc2jKw5RBL+eXCXZ?=
	=?us-ascii?Q?ZEW+688Kmcj2cq6WMH0Cb8LYnsi38RmTsGOrpqeFdVtQUV+VtumYqyYmerkF?=
	=?us-ascii?Q?0Myuz/rrVyeClYG8ygatdCW4aPqhJFzaaRRrXKB/nTFcjJCWpTcyg=3D=3D?=
X-Microsoft-Exchange-Diagnostics: 1; CY1PR03MB1375;
	5:kQjFUGVOEsmdmV43CBN4TYei1j0+Z5z+8KpmBIHJyXKnmBR2iEGBmcO4+7y3e+cZ93esGccQa2UDsCE+AvKfq5AOoPqFzv4td6C5/FHZ/IVeEbNysp2oYc0A1WqLVHKKhLxoWblSLYylGtRTU5lcSA==;
	24:2Gl2RYKXhczVSMnv6JE7OljnIzlQQxIq647tPHB2PYd0yIEo1xYAMcWzpjRWXEg2/tYK4kShWV7PE20+q37DAiMOA6BAZbrj5bjbY+Kgfts=;
	20:Su7yRKKDYo0pEjBVh2RtB0EV86HsOoPZf0rOOpaDQzrPkV8dAMqEUWBUTq/QePg+ymJdnVQ5WoT7PQ1Nvu9VzQ==
X-OriginatorOrg: freescale.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 21 Oct 2015 09:47:11.1223 (UTC)
X-MS-Exchange-CrossTenant-Id: 710a03f5-10f6-4d38-9ff4-a80b81da590d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=710a03f5-10f6-4d38-9ff4-a80b81da590d;
	Ip=[192.88.168.50]; Helo=[tx30smr01.am.freescale.net]
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CY1PR03MB1375
Subject: [fido][PATCH] oprofile: update --with-kernel option to find perf_event.h
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
X-List-Received-Date: Wed, 21 Oct 2015 10:21:26 -0000
Content-Type: text/plain

From: Ting Liu <ting.liu@freescale.com>

Update --with-kernel=${STAGING_DIR_HOST}/${prefix} to find kernel
headers (linux/*.h) to fix the error:
| checking kernel supports perf_events... unknown -- perf_event.h not found
| ERROR: You requested to build oprofile with '--with-kernel=/buildarea/lyang1/test_f2/tmp/work-shared/qemux86/kernel-source',
| but headers were not accessible at the given location.
| Be sure you have run the following command from within your kernel source tree:
|      make headers_install INSTALL_HDR_PATH=<kernel-hdrs-install-dir>
| Then pass <kernel-hdrs-install-dir> to oprofile's '--with-kernel' configure option.
| configure: error: Unable to build oprofile. Exiting.

This is part of the commit b5b3085d9d6a351a1de86f95d5c8ba28dbfbddbb which
already applied in poky master branch.

Signed-off-by: Ting Liu <ting.liu@freescale.com>
---
 meta/recipes-kernel/oprofile/oprofile.inc | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta/recipes-kernel/oprofile/oprofile.inc b/meta/recipes-kernel/oprofile/oprofile.inc
index 49e6b16..435e4ed 100644
--- a/meta/recipes-kernel/oprofile/oprofile.inc
+++ b/meta/recipes-kernel/oprofile/oprofile.inc
@@ -27,7 +27,7 @@ SRC_URI = "file://filemode-fix.patch \
 
 inherit autotools pkgconfig ptest
 
-EXTRA_OECONF = "--with-kernel=${STAGING_KERNEL_DIR}  --without-x ac_cv_prog_XSLTPROC="
+EXTRA_OECONF = "--with-kernel=${STAGING_DIR_HOST}${prefix}  --without-x ac_cv_prog_XSLTPROC="
 do_configure () {
 	cp ${WORKDIR}/acinclude.m4 ${S}/
 	autotools_do_configure
-- 
1.9.1


