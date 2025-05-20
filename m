Return-Path: <deepesh.varatharajan@windriver.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 3C314C3ABDD
	for <webhook@archiver.kernel.org>; Tue, 20 May 2025 04:41:29 +0000 (UTC)
Received: from mx0a-0064b401.pphosted.com (mx0a-0064b401.pphosted.com [205.220.166.238])
 by mx.groups.io with SMTP id smtpd.web11.13680.1747716080564620089
 for <openembedded-core@lists.openembedded.org>;
 Mon, 19 May 2025 21:41:20 -0700
Authentication-Results: mx.groups.io;
 dkim=none (message not signed); spf=permerror, err=parse error for token &{10 18 %{ir}.%{v}.%{d}.spf.has.pphosted.com}: invalid domain name (domain: windriver.com, ip: 205.220.166.238, mailfrom: prvs=7235d2428f=deepesh.varatharajan@windriver.com)
Received: from pps.filterd (m0250810.ppops.net [127.0.0.1])
	by mx0a-0064b401.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 54K4fJLO007306;
	Mon, 19 May 2025 21:41:19 -0700
Received: from nam10-dm6-obe.outbound.protection.outlook.com (mail-dm6nam10lp2046.outbound.protection.outlook.com [104.47.58.46])
	by mx0a-0064b401.pphosted.com (PPS) with ESMTPS id 46pnr3jmb4-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT)
	for <openembedded-core@lists.openembedded.org>; Mon, 19 May 2025 21:41:19 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=gPSMnCS3GO3XOeWqn9crAZu6eWfwBY5Z5svTEeyQT378BbwP5Bc6OOu+4/HmyNGs4yHdGKhNFspp2pPMKqOZpRRmWpvNCLGNwk5Qtdo7kYJkiNS3x6YYgYEl17qtXmKUCN/0By4djO44oVS4dFMCmfLzcqtHWQn2RqY98wnqlYcMsHGprtBF2wf6GzUl2opT0uYFMgn9BZqGn+4d0XtcKihSrkTgH4505vN2rSwll86mBRkjBSC0puCZdOsar7lXuPXXZEfF4aedIvcdtwsBHjyChOJ9vYXQRbhUgeZemaRhdWOIwRRT3WpGZY7qNoZacEGR7hxBZA9IamL/TUEwXw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=z1PVTb8ZGKT1b65e1Ttqu/uII3JuMDYb0SJZzj+5W8M=;
 b=sS3bRXf7OiLFgzcWrWswKg3v4ZQYGoX9e5lpu+TbcNC1eXKQXem4hdNyHUZY4t42h0//kYafPhKqwhVhEQkZ6l1+5+puNyOUAiUGlcIanTloJe5A7niHvMTRXg91idAHGj18eh34FBNBL6uYQjvjHWV/rfhiJprTPAwrFbECUGrNFPz0Zb6s8l2frE2vniHD2T8/Izk7Iwwif5XxFWQdWHyEHwkKV5VG3ASOoLiTL8c6RKr8miAjFo5q+HSsaSZqY5/PnTCShdquBHeqVqC3eWl2K6G8xdOEU94FJfkybL1g2YlekEYq/vMGhVsmIHAunpiJunfM6SetDJpiJsJ91A==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=windriver.com; dmarc=pass action=none
 header.from=windriver.com; dkim=pass header.d=windriver.com; arc=none
Received: from SJ0PR11MB5648.namprd11.prod.outlook.com (2603:10b6:a03:302::11)
 by CO1PR11MB4945.namprd11.prod.outlook.com (2603:10b6:303:9c::8) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8722.31; Tue, 20 May
 2025 04:41:09 +0000
Received: from SJ0PR11MB5648.namprd11.prod.outlook.com
 ([fe80::c784:dce5:4b7b:54f]) by SJ0PR11MB5648.namprd11.prod.outlook.com
 ([fe80::c784:dce5:4b7b:54f%3]) with mapi id 15.20.8722.027; Tue, 20 May 2025
 04:41:09 +0000
From: Deepesh.Varatharajan@windriver.com
To: openembedded-core@lists.openembedded.org
Cc: Shivaprasad.Moodalappa@windriver.com, Sundeep.Kokkonda@windriver.com,
        Deepesh.Varatharajan@windriver.com
Subject: [walnascar][PATCH] glibc: stable 2.41 branch update
Date: Mon, 19 May 2025 21:40:56 -0700
Message-ID: <20250520044056.3593389-1-Deepesh.Varatharajan@windriver.com>
X-Mailer: git-send-email 2.49.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: SJ0PR13CA0118.namprd13.prod.outlook.com
 (2603:10b6:a03:2c5::33) To SJ0PR11MB5648.namprd11.prod.outlook.com
 (2603:10b6:a03:302::11)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SJ0PR11MB5648:EE_|CO1PR11MB4945:EE_
X-MS-Office365-Filtering-Correlation-Id: 5e7c1394-13e3-434c-983e-08dd97588a23
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: 
	BCL:0;ARA:13230040|366016|376014|52116014|1800799024|38350700014;
X-Microsoft-Antispam-Message-Info: 
	=?us-ascii?Q?+P21WFXSV/OZCIWOneodH0Nhg1Nl4FyFxZVUJ/74ET3S4PsIz/gU+P86fBYV?=
 =?us-ascii?Q?v986qsAvgwGID01h7nzJ/ft3ehdj5UKJMh0WiHUPsn9MUF2UaluFpF0EwY2N?=
 =?us-ascii?Q?+amZ78do9tsdyW2LSebQTOO3SY++3BEKjJ3gkWmDV/sG+o4c+fxk7QirfkRS?=
 =?us-ascii?Q?oQ5riTanHErgToTtihtcPXIcIh9pRHv99uS0iFiPcLfsESlDHgilTIXx6rLa?=
 =?us-ascii?Q?8UAVNzRvjgtyrxachNJpkQTBSHafrZmoH1XqdQBLfwlvgwOG2wZmmcXAoOZC?=
 =?us-ascii?Q?iW7JHfh8dmky73dlSVublzdCLUq6TuRPNGqXtM0yKIy82HmR/vcurgflVcsV?=
 =?us-ascii?Q?1rt146HteJZxIQ/4uXGG1Q9w9tbWczmlfMvYyXPn+WAVBXTK868m71hmrmLL?=
 =?us-ascii?Q?h1iXAwXC8++iV866IKO1RDvR46S86Jh+y7dyXbWelCIIgh+AY3JLyUBusIi8?=
 =?us-ascii?Q?otMIeChXTljV0tdflthLnn2gYDwYZiEgE07W2juUzN8RbV9Nl9y38Q8W/dKo?=
 =?us-ascii?Q?PPb9Kw3NZ9jH/EYwu8X/tUkiQ/564PXHyuwmBXdpFivVKExsmitnfNWcZDzA?=
 =?us-ascii?Q?Qg8BHYVWQjhoHFvlnHHqMOO5WC33hlw2jmSa90im2xwH65jM32mdkiA+f4Eo?=
 =?us-ascii?Q?R76F07LVMXi1Xs/JHuY18KLqgUKq/Vn3BmpSWZJl32XMlDcEAOCWBgGtdbFd?=
 =?us-ascii?Q?SX0aiW+OA/5cdF87Zt3UKezsI/6Zg4eC1rpWjIIfBr4pMsQ+ZuWva3OKiOAl?=
 =?us-ascii?Q?Npse1s2708o7/xjzlHrbT/m7LqGcakV17XpyMMjn0/akwwa4LwaCxdflZYlo?=
 =?us-ascii?Q?xfriPpCehSR3yQeMkozP9zwGgX07nQjJfNNbJsSj/O+mFE2A6kFsh/x4+hjV?=
 =?us-ascii?Q?Pxm7K5CaaLDGdPtbbATyOUVB7g9fPYew290aujXH+vRmwo2vjsKtbw3IuhO4?=
 =?us-ascii?Q?FBJgWPU1KDX2Aw5lWAVGRv4HfBmMFnSzMOhrDh+iDUxCXFZfLxDw31Mi2e65?=
 =?us-ascii?Q?hBx6Oy1BN0r/JwXSSvZi74dvnbZB7elT8m2Oyp7Oq6dTejJiWRltrAr64+PA?=
 =?us-ascii?Q?me+qAsslcbNGyZt6vk276oFnfGQ+5u3UyUuIa3c4wabnXr1+dmqy2EzIIiwA?=
 =?us-ascii?Q?GUFDCtisjrT1NMKEIynjehItQfH2Zo3q72Z/bLSWUyCxRo7nBt6pnDr+hj/H?=
 =?us-ascii?Q?yHQhLV3qIT7GNlZ6NfXfE0C1Ab5NyipsbOWNJVkuvVlZdKJD1wATlHV+SCH1?=
 =?us-ascii?Q?ysdTweduudE39Y7LT79wgiG+mf0nq+31Id1vX88dag0ZeB54WChjCUqgGher?=
 =?us-ascii?Q?BDGFIEOQO5TxKOgLVhQ3muPAtdo1q/9tDjf2go38I0Z6hAiZiSMHWJDegF93?=
 =?us-ascii?Q?A+qQUVounouSKOnwK/11CyTkJSI4dMc5Dh1c7AZ6tHJmcqOeRQcnGWNfcrwO?=
 =?us-ascii?Q?uDjiu1SduQfY7vOb3YC8GitU2kQjTRrPK1Nu/awfg10nzL6DcnAYY9j0Oqpk?=
 =?us-ascii?Q?Ml7/pWEnok496Q0=3D?=
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:SJ0PR11MB5648.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(376014)(52116014)(1800799024)(38350700014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?us-ascii?Q?M9c85Wl7szcKPvcEL134xQVLMCVfKnsClzkG+zLjrgf+btmWZzux1XiFzbPX?=
 =?us-ascii?Q?Y/pWYEZlbOM4npRyhsdrATtJ+bQzkxpA7OliUCQRYJceB4m2ZiqvvVBWQW6N?=
 =?us-ascii?Q?lWo8KDpTdNXu7MLVHg1SoPRCBQWfBOVDKWxFVKu1J7l6vHmyBQKDmNgnDVkz?=
 =?us-ascii?Q?BSUcAiKo1Jv95ghV55uJsyZoHkCMGwzaVttMSh6LL1Xyu5mSYiG9OIwudHph?=
 =?us-ascii?Q?0qI1UUNp5gQUF2ZaSSXXtljxOL+BlEzGnPrVpMzBujXPZe3VgndSWYcj2TxB?=
 =?us-ascii?Q?0QuPpow8/LnlI0QC72hspK+BLgY5sMcuF/aWuGUkmQ7XdhKRQYD+qpi8kc3K?=
 =?us-ascii?Q?N4+ujjqDr+lTyY4iaaTDcrmBGSyTbFcxWUX4jP27P6H2C6U0lsBcyIgvHRYp?=
 =?us-ascii?Q?1xV3K1f1ILOAQ9zbBtm16myRY9aPm518n2O6s0OpeaM5SP9ZhlgdcSHVJ44p?=
 =?us-ascii?Q?oafL0BreqjJcEq/gqdwWJkok+UeJHkBOX4NlTHW5PEOZqQi6fphN/rEYBvq+?=
 =?us-ascii?Q?sMOHAYOETUmmp+i1y8GHfu94RtiBWykDPma/9KAVWkv+elIt4wqvOmdBlVSa?=
 =?us-ascii?Q?Vw0cKAiiwTGtpvLxMMZvxN+CVwwbeYFbotM4/z/jwwAnuPVCizjLXXqaf5+E?=
 =?us-ascii?Q?HIgnrJCvrAkgFtAp7gv0P0zVbbHPXNctZhK1iawp+6Ir4EaqKE5dOeQ/o2it?=
 =?us-ascii?Q?31sTk6awmV9aSRGNfxjODYUIKGjemTmmg3Qh8OcHK5gjvI44BebbvW4t3N5w?=
 =?us-ascii?Q?l0IMy8ti3SxyxoLIjnfyVPRgYj0+13l7nix3j2b33+7jHQYXuWqw8Zcg1ndt?=
 =?us-ascii?Q?tfk4cMhhaElhpcbY57+LZ/F3uIdS4fAaPz/S3EfgfqL8gM1TRDUQCSX6jlg5?=
 =?us-ascii?Q?4tvjxMjsX1l8cpvYEQX7X0/mJPY8QnmiAMhXB338bBs+BUnKi+teXL6uukZM?=
 =?us-ascii?Q?1HZ3KxOd/RsNVcxlNcs/44ERIkUyZ+A8gahgwwkfYbYR8OgLPAf/d8It/Twy?=
 =?us-ascii?Q?PuRItre1WpaYCssvsmPqED48M7Yv8qBIFzTscExktYPznxgttiBPXEWdXPme?=
 =?us-ascii?Q?b1HW5i81C0gCkBmuUzkcY40+U8jsTiF3Gw7dgNiltVjneJTu4ZgL6hUi2atm?=
 =?us-ascii?Q?pwAIp4Zbyj62QLIyvqU8adtOC8+uC2LbcKoWc8O/g1Kh7Ii2dcBMedLyRL9b?=
 =?us-ascii?Q?gQAjryY2gcQ23549Srps2+hhq9d1tgo9gZCERSz06/O/Bxe8ep5Hqzwp0vS4?=
 =?us-ascii?Q?uB7q0rOD1y7gztv0m5J7C0nAFlXzFEYmRMLENsozZQopTNjF04dep6ptD+tb?=
 =?us-ascii?Q?8UubiSRxr9QgHHHZmI2y86YvP5H20Upp6wK6aVqVxROd4hNtZwg1ot6YcLk1?=
 =?us-ascii?Q?4eZuCFH1ZV256hWttPOuK+G+416ferO1ftsDzxvfF9peFaOX7QdJoO74P9B6?=
 =?us-ascii?Q?HhUMLpP8v8o52tIh89buKgMUwsAvPLlF9Us48En8beypk4i/6QWMye/fHYEw?=
 =?us-ascii?Q?c1SVNl+iOb6LbzK7LgK3MCBBE0ANbdPFteZ/t/YR9+oHhk4EONqxU8pl8qYO?=
 =?us-ascii?Q?37c7y0CPyEQlqI/exUbfaznUSY/g5ny0RrD1QE80mm7RVqAj3ejbKlHWV81h?=
 =?us-ascii?Q?W0dJdIg/TYAY2NMWD626BgM=3D?=
X-OriginatorOrg: windriver.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 5e7c1394-13e3-434c-983e-08dd97588a23
X-MS-Exchange-CrossTenant-AuthSource: SJ0PR11MB5648.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 20 May 2025 04:41:08.8385
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 8ddb2873-a1ad-4a18-ae4e-4644631433be
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 5Zt2bBGecgksg27MmsJh2G4pOT0WI0B2M4du6GVgZAM6jX6dpoPf8Am7bqLtoNSPkYhsEqkTB3uy9Wm3H+BPfjJzSMFKzQrVC0rW63PpxPad2MnxiyyeQRwgNUCCspE1
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CO1PR11MB4945
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNTIwMDAzNiBTYWx0ZWRfXzKIPL6XbX47L Neg6U9HAmBQs1MSq4N2hl/CKiyB8PFwtXrDwlqG0JjzEHLFqncyb/YOfjJAMqjBWXDAgXvGodlB GqMis9NAT7WSp7VjGFyPpNS6oRel4Tc2hOEarfUiqbm4+uz/MfmxH6xPCYg38JG/ldhRdZZtbak
 q6mKmdTJn9NSzJzENmVVc2WLsfVCr3KNlshyNYabQJwzMhj4YGTDacaMs7/5C2oAey8wUMBDW/5 AodDj1icDdTFvYad45GwH6yER+vX1HD86k3S5PgScU2tuDyrfzFAISIlkONvTE+c2FZoQ1rlOl1 hNiGTdN62k6/iYnaSMpfchLVVQXF5sYZ8EGcUynOykXVhvJBvgIQoa7OgAMdouLChPGhNZiHfmx
 yvBSzY71eGAGZuEmrlgFUQFmUuD3Uk/56hgbg4dPKRS0ewIQyWdSrlCvJYeQ1AW8LUX+dytJ
X-Authority-Analysis: v=2.4 cv=Z8XsHGRA c=1 sm=1 tr=0 ts=682c07ef cx=c_pps a=ur2hu7Zt/Tb0cWAHmjvzJg==:117 a=lCpzRmAYbLLaTzLvsPZ7Mbvzbb8=:19 a=wKuvFiaSGQ0qltdbU6+NXLB8nM8=:19 a=Ol13hO9ccFRV9qXi2t6ftBPywas=:19 a=xqWC_Br6kY4A:10 a=dt9VzEwgFbYA:10
 a=t7CeM3EgAAAA:8 a=CCpqsmhAAAAA:8 a=LC3zVhqhmS6NOWviN5wA:9 a=FdTzh2GWekK77mhwV6Dw:22 a=ul9cdbp4aOFLsgKbc677:22
X-Proofpoint-ORIG-GUID: BJzDxtdysw8wFJS9o-83AIrEiO8UkXIt
X-Proofpoint-GUID: BJzDxtdysw8wFJS9o-83AIrEiO8UkXIt
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.0.736,FMLib:17.12.80.40
 definitions=2025-05-20_02,2025-05-16_03,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 lowpriorityscore=0 mlxscore=0
 bulkscore=0 spamscore=0 suspectscore=0 phishscore=0 clxscore=1015
 adultscore=0 mlxlogscore=999 priorityscore=1501 impostorscore=0
 malwarescore=0 classifier=spam authscore=0 authtc=n/a authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.21.0-2505070000
 definitions=main-2505200036
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 20 May 2025 04:41:29 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/216881

From: Deepesh Varatharajan <Deepesh.Varatharajan@windriver.com>

Below commits on glibc-2.41 stable branch are updated.
5cb575ca9a elf: tst-audit10: split AVX512F code into dedicated functions [BZ #32882]
046b33800c x86: Detect Intel Diamond Rapids
a53e764657 x86: Handle unknown Intel processor with default tuning
aca31d2712 x86: Add ARL/PTL/CWF model detection support
f68b407d4b x86: Optimize xstate size calculation
d6d56af6e7 elf: Fix arm-linux-gnueabihf build break from b861755a84
b861755a84 elf: Extend glibc.rtld.execstack tunable to force executable stack (BZ 32653)
200d20123c x86: Link tst-gnu2-tls2-x86-noxsave{,c,xsavec} with libpthread
80cd656649 x86: Use separate variable for TLSDESC XSAVE/XSAVEC state size (bug 32810)
a282e2c0ae x86: Skip XSAVE state size reset if ISA level requires XSAVE
bcd4cf9d5f x86_64: Add atanh with FMA
7e72fa7577 x86_64: Add sinh with FMA
6a3a4a5e58 x86_64: Add tanh with FMA
ce9b765522 nptl: Check if thread is already terminated in sigcancel_handler (BZ 32782)
98c712855d nptl: PTHREAD_COND_INITIALIZER compatibility with pre-2.41 versions (bug 32786)
e22c132484 nptl: clear the whole rseq area before registration
33bfd9020f Linux: Remove attribute access from sched_getattr (bug 32781)
66fc3bd758 math: Remove an extra semicolon in math function declarations
1a3083b999 posix: Move environ helper variables next to environ definition (bug 32541)
91f8cff2c4 configure: Fix spelling of -Wl,--no-error-execstack option
fd202462c5 elf: Check if __attribute__ ((aligned (65536))) is supported
746ef8e939 static-pie: Skip the empty PT_LOAD segment at offset 0 [BZ #32763]
56609f8df1 Pass -Wl,--no-error-execstack for tests where -Wl,-z,execstack is used [PR32717]
89be78704e AArch64: Use prefer_sve_ifuncs for SVE memset
c47c3890f1 AArch64: Add SVE memset
e0bc5f64ea math: Improve layout of exp/exp10 data
009c5a2dca aarch64: Add GCS test with signal handler
8d98ee8d70 aarch64: Add GCS tests for dlopen
61ba3cdfa9 aarch64: Add GCS tests for transitive dependencies
fda5730898 aarch64: Add tests for Guarded Control Stack
6d1f97bb06 aarch64: Add configure checks for GCS support
7774a9d07a AArch64: Improve codegen for SVE powf
2025e27a81 AArch64: Improve codegen for SVE pow
f3d9c116cb AArch64: Improve codegen for SVE erfcf
94859e8680 Aarch64: Improve codegen in SVE exp and users, and update expf_inline
7c9a086807 Aarch64: Improve codegen in SVE asinh
30992cb5e9 RISC-V: Fix IFUNC resolver cannot access gp pointer
07288c7445 math: Add optimization barrier to ensure a1 + u.d is not reused [BZ #30664]
2cb04444b9 math: Fix `unknown type name '__float128'` for clang 3.4 to 3.8.1 (bug 32694)
a900dbaf70 x86 (__HAVE_FLOAT128): Defined to 0 for Intel SYCL compiler [BZ #32723]
1e0e33e1b1 Fix tst-aarch64-pkey to handle ENOSPC as not supported
69fda28279 assert: Add test for CVE-2025-0395
cf88351b68 math: Fix tanf for some inputs (BZ 32630)
cb7f206537 nptl: Correct stack size attribute when stack grows up [BZ #32574]
d85a771953 math: Fix sinhf for some inputs (BZ 32627)
bdccbfbc52 math: Fix log10p1f internal table value (BZ 32626)

Testresults:
Before update	|After update	 |Difference
PASS:  5816	|PASS:  5826	 |PASS: +10
FAIL:  239	|FAIL:  239	 |FAIL:  0
XPASS: 4	|XPASS: 4	 |XPASS: 0
XFAIL: 16	|XFAIL: 16	 |XFAIL: 0
UNSUPPORTED: 164|UNSUPPORTED: 164|UNSUPPORTED: 0

Signed-off-by: Deepesh Varatharajan <Deepesh.Varatharajan@windriver.com>
---
 meta/recipes-core/glibc/glibc-version.inc | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta/recipes-core/glibc/glibc-version.inc b/meta/recipes-core/glibc/glibc-version.inc
index 4d28affed9..d84106fb95 100644
--- a/meta/recipes-core/glibc/glibc-version.inc
+++ b/meta/recipes-core/glibc/glibc-version.inc
@@ -1,6 +1,6 @@
 SRCBRANCH ?= "release/2.41/master"
 PV = "2.41+git"
-SRCREV_glibc ?= "0a7c7a3e283a55d1bfaa48fdef063a32a4689a2b"
+SRCREV_glibc ?= "5b4c4617016d28569106549dff6f9fec73eed5ce"
 SRCREV_localedef ?= "fab74f31b3811df543e24b6de47efdf45b538abc"
 
 GLIBC_GIT_URI ?= "git://sourceware.org/git/glibc.git;protocol=https"
-- 
2.49.0


