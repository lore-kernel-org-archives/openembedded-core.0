Return-Path: <mkelly@xevo.com>
Received: from NAM03-DM3-obe.outbound.protection.outlook.com
	(mail-dm3nam03on0081.outbound.protection.outlook.com [104.47.41.81])
	by mail.openembedded.org (Postfix) with ESMTP id BB2007017D
	for <openembedded-core@lists.openembedded.org>;
	Mon,  8 May 2017 23:47:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=uievolution.onmicrosoft.com; s=selector1-xevo-com;
	h=From:Date:Subject:Message-ID:Content-Type:MIME-Version;
	bh=LLFRW7+dj6vLzkW9jKFuBNuNEDLeRNTMchcMRHFdYvQ=;
	b=tamQJEvXAXxb2AioNRP2ahn9WcXccCqfSFchpJXgeP1G40GvBuBo6wQwLp6eWriNvlC/oYgjjRW+a+SxfrLluT4piKFjfQADD7+0ygthooMCpPI+FZhAXAqQDK7ptILzdG5UXyTDBz+geGk8lBJMYZHdpxfXLtNMcmumJ6MXFFI=
Authentication-Results: lists.openembedded.org; dkim=none (message not signed)
	header.d=none; lists.openembedded.org;
	dmarc=none action=none header.from=xevo.com;
Received: from columbia.surround.io (65.122.179.226) by
	BN6PR01MB2674.prod.exchangelabs.com (10.172.195.12) with Microsoft SMTP
	Server (version=TLS1_2,
	cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id
	15.1.1075.11; Mon, 8 May 2017 23:47:08 +0000
From: Martin Kelly <mkelly@xevo.com>
To: <openembedded-core@lists.openembedded.org>
Date: Mon, 8 May 2017 16:52:20 -0700
Message-ID: <1494287540-23101-1-git-send-email-mkelly@xevo.com>
X-Mailer: git-send-email 2.1.4
MIME-Version: 1.0
X-Originating-IP: [65.122.179.226]
X-ClientProxiedBy: MWHPR11CA0005.namprd11.prod.outlook.com (10.172.48.143) To
	BN6PR01MB2674.prod.exchangelabs.com (10.172.195.12)
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 58481a38-79c0-48f7-a045-08d4966c8a39
X-Microsoft-Antispam: UriScan:; BCL:0; PCL:0;
	RULEID:(22001)(201703131423075)(201703031133081);
	SRVR:BN6PR01MB2674; 
X-Microsoft-Exchange-Diagnostics: 1; BN6PR01MB2674;
	3:nfM+x7RAgVzVtfM2tNQ8I5jiPFgdcbr6zOCRLOKTuaryv54d63HYI+PGalG8midGtnzuzCEzRBv7VzNpGU/u/srcJgchblR/zI5bYQaSg9UHp3/DPbJ/42MqknJQ3DPc845ZOZouZE8MnpcDB3p87agF9VXKKFikPgaKn8oixpUNWYR+z2C3eZD4nx+90WAHpPKNnMci9KDVL9dm8G69JzRT4GZBKHK3/Hnl8/jyb7pCAKDW/gwCGfJ3EIzvr84pjGPFShEoOJUvrO5x3ppuQmvC6vul8SZcCY5oC1Ik+uvWnwlq/BDjO94TYoeYXxHkwWVKoTqjDMBsMOREaMHbsA==;
	25:J+pOHbCsv1XX7Y52CTrSRx96xNreDp8ZOsLf8bgVxmZNzOjdcdKS+jJQ9K05Zhlb++Z++yRrXHtm5NGM7M+RiTioDZ7Tv8S9Y0F9e8aTXV6XeruWtxsj5SVvKmfend4i9RT3etMStpsxMqIR2Yd2vp6eO5gRWhW0+iKyUTp8S2s4hU3sjcWlgvydKZtyHQD/tXBlnSNYoLbLYclIMklhQhoQqzgqMrNQx07jP1ngSc0Wv7SsE4IHrWaBnVcD9ljbxoBdhSXTQ5WunMF5C6aRkec1T4fhUBpCV3U2yfCIGiThGiEUATe19puSBIeDHN0JAZH03xOE4C+ewwGowUk3hSCNNRL9+5/9lY1cB0qweXDsN1uWfrQ11xf071+/QDZ9fj+Tnq0OUyI8GBCyNL/0Ni8+eiC39bqkBh3h38Kl1/bQUOrub+U7xwJVxoxSyELPC6JVVlaxPdQ7RYEPEzpae+iUxv0LCtsLV4ZgPMWa4NQ=
X-Microsoft-Exchange-Diagnostics: 1; BN6PR01MB2674;
	31:o0YjHE4L4uaBUHFjmnFIS0t9T+2F3RhLMLLX9QmYQHh1eKYYUKNMqsaTMGW9ADjwFjYyAK7tqkBqWBZgjAukROJ5h5gU93NnlmXekV45D1Vq+3Gwe4Hw86lK4Cu4UQh/sX8JxHSkDMuQTK2hg4d5/nE6C6ywejS2sdybDFHm/LJSAIshqngXBFNl/DYD12+85lw++xqrUzvEgpQYepHyH1ApCWWA0xyWlX9rDDCxoZznYFzF+WFtvvuUbWp+KYJC;
	20:vdIfVCPX+IagXABAU238Q3zhrbveSk5czkaCxClRfcoZ3+Al461r4flqufAkHCdQG/f7nD+zvlp+Px5lMWV78Dlb6cfaHQhymCdZR2N56CHsp+HjIbJjCBctBIad5zZS5kth0CIN4PTnRt44MvWnl3jL1ONjXpaeYezMoBncduIZj98W3UM3/JAGT/3m5Bc10wqIhFXbiQxue2cYyxgZbPCEXdV9ubhZN02eVVZyK+UD0acdJODQQIoM+N1PNGEVTk6er89oNILTqdLQbI71EtpFtj7/qjzpBWwTuaJV+fc7rKet2K15JBqOuADEn1RMSagQ4BN8qi4hwYCW1tDm5A==
X-Microsoft-Antispam-PRVS: <BN6PR01MB26747D13C11647D8C3DF2A85ABEE0@BN6PR01MB2674.prod.exchangelabs.com>
X-Exchange-Antispam-Report-Test: UriScan:(158342451672863);
X-Exchange-Antispam-Report-CFA-Test: BCL:0; PCL:0;
	RULEID:(6040450)(2401047)(5005006)(8121501046)(93006095)(93001095)(10201501046)(3002001)(6041248)(20161123564025)(201703131423075)(201702281528075)(201703061421075)(201703061406153)(20161123555025)(20161123558100)(20161123562025)(20161123560025)(6072148);
	SRVR:BN6PR01MB2674; BCL:0; PCL:0; RULEID:; SRVR:BN6PR01MB2674; 
X-Microsoft-Exchange-Diagnostics: 1; BN6PR01MB2674;
	4:HnfTrAhdDUEXVf74OD+KO4yPjYhlHrL2w6JrkH1i/rfEGf7WPC5xHm/a1Vay+dcZpOT6Zof5FlzirYL4Ova0Jjq5EF3rgibnjzOzHJlLG9cZ+Qmys+gJE0hcFsd6/8CbuKb6DPQ3OHWjXgN/iiFu6mD0fSUP3sA4DbKA3TdGrhOj2SUtXhPFmT4rK1Nl1czZ2arWhfsXeoSKUoEZDZA4ELOd37FnIJH/6i0DxbDo6MW9Er6wnQjORhQyBRve3y1s0KD4FT5Iy+NFD5wCWCxfyQ8vMoB60ecTM0KpAAXkyP+b2yiNgCDfDqZpwwbnSdOIzfdAACPcIeqhWl7DElw95e7buSkPtbmjEco6eSxFWIq1bmCRxfYo7BoaaSfTN3T46/dvW8VGeFlTHvBs+UwsnrqBtK2BiONJIvnWXRsjy/a0/Yb6+7UNoOKtAbQPb0V7OD6t2D4in541sAcB7dySlfnIHUJNE6L7ceXz4KIZcS6us4FzSl3u66qwdYBhlj4fthoYhVinTAVi/43NQXynAPa/CUfPH1sgbs+ugFXVqN63SnyIEv2QOGbfyJWzBpLCPmLAkuOdNhRHx1F/5TGEolDNHmSg60adgMEDz0MbIXw8x7yQpFbf6hezeQPMOxqkWo8oY2977P6tWEXwlBkp4DgIJ5OTV+pvvjjvZi9PabqXYGVwSSN9J02MT2c5L504md2S02bX4wcFfLor5NEm9zclsHjSveOhu10gzgNsIMG2fysSccrr73z2Wx3wCZJpmfP/L9s3d21pgGiXuYSzV+MzjS8ht1IlsDJyNfB4olxF+R8DNAIVSmtG5Ac47rdL
X-Forefront-PRVS: 0301360BF5
X-Forefront-Antispam-Report: SFV:NSPM;
	SFS:(10009020)(4630300001)(6009001)(39400400002)(39410400002)(39450400003)(39830400002)(478600001)(66066001)(50986999)(42186005)(47776003)(53416004)(2351001)(2906002)(81166006)(50466002)(48376002)(4326008)(8676002)(6116002)(7736002)(305945005)(53936002)(6666003)(107886003)(36756003)(33646002)(110136004)(25786009)(38730400002)(189998001)(50226002)(5003940100001)(3846002)(6506006)(6486002)(6916009)(86362001)(5660300001)(6512007);
	DIR:OUT; SFP:1101; SCL:1; SRVR:BN6PR01MB2674;
	H:columbia.surround.io; FPR:; SPF:None; MLV:sfv; LANG:en; 
X-Microsoft-Exchange-Diagnostics: =?us-ascii?Q?1; BN6PR01MB2674;
	23:WH2ouxveofGj5eJdznvCMr/uXLby2uVRT4FQ9lVuB?=
	=?us-ascii?Q?Cj5Pe4jbP8WAFdS0iKcDpF8ykgC1oMsCCSQyzpeAYe6+XDbI/x5Hr4RfosnI?=
	=?us-ascii?Q?F00K1t/vqIgDH+AlLtqLcE1ppHNRDM8w/9+v0Kry83UPINGluJkEl4ewWTvn?=
	=?us-ascii?Q?PSAuvRDTtCLaFUlkEMlnnW15mJNw8u4gz0k64KZpRASNopqyvNGpGA9xjZBi?=
	=?us-ascii?Q?gOOoHO5w9dHbXzCIK77b7qmeGfmC75YnhFAv7YaUuNiqSjoGAQjuHB2KbaUP?=
	=?us-ascii?Q?ZHt8BKMT81e4rfSAtKpAfOSOyFkakLuEYWwxTDYqnkrda1q9Uu8gI/b541Cn?=
	=?us-ascii?Q?WDTIrM5eE3nAzqF4zzBnc2KgWRE8y7X+V0ZlGiuVIcDjBY2XhffE1LNLTnaE?=
	=?us-ascii?Q?Q7ZBmr+Zu2PSlgS8lMCRJLvDYVv5z5iMZFM0cb+iWYaCHp1Ad0IVoZKpxNbL?=
	=?us-ascii?Q?RKQ6DdZDkTM/O0B0iE/aaolKJzOiT/xrGDfT01Zu/P/Fj/n69MbAm7mFJHOH?=
	=?us-ascii?Q?AGZRyLk/nn4MwuzC64u+94Cxd6SYhdTeQGjLR4Q1Z/2P4doMW45WkUjNCuwq?=
	=?us-ascii?Q?6rNPpWsWRbbXz8n2gMeID8UM82W8BOtjfwiRAfAxCz+Qn6eeAJRhCVxGNDoG?=
	=?us-ascii?Q?OwFW0gjdR61S4w4ez8/a8JYTMU3YucsITTANnR2lf3iEJ/xqMApLwJMz8psL?=
	=?us-ascii?Q?99rQ/wLRJDHto/Fe3hu0octjLiivlY1Dj3ZH73uamehTZ5fpSWgZXF0NZrSd?=
	=?us-ascii?Q?dBEGoN6Ya5yP3ZbIeZFUNxt2Mk9cUCPqCkYoJVHN8z4P9gAYt2XSWWXjIkMe?=
	=?us-ascii?Q?Bqwn2uKEoj2yC29n68dZbbUa0wf1n1pZjsNYBvSIH5Rts8VetmUoWqFs48QX?=
	=?us-ascii?Q?X/AMESnfVpCyl/FuiqNHTTCuA+AHhdGHDH3Br37BZReDzPfIsouuA0JQhrBj?=
	=?us-ascii?Q?P5IgwVqSsPSQu7bQSl8GCMh+ln/2DdppVrAxfPUN8wNT7enSOFnE/OtC5oFl?=
	=?us-ascii?Q?Gem1Ls1ggkhMPbCtWcNGCwk?=
X-Microsoft-Exchange-Diagnostics: 1; BN6PR01MB2674;
	6:yCDaHVnzyXrBvhbCuKawnCWKUCO3VXlAng/fLPk1bU0Sup63A1zlp9p9a6XApUbhPOpK1qYvRxhlX9PxUn/0quz7OX+Q8p8MR9RwiKHMXtqOw03lOzHX0neKjeXHBjT2JhpVtnfZopSxb1ieBXtzdagzq83pVctiER5TbLI+y6KQuj7+8IwCavXhacPP27e0O3gz4llWo36hYhH1iJRSWuLRY4fdxfWA5vVRLm9IYmNPx0HqxtCk8ATv4D0Bkq6U0z/b9B7Ftcyxotjhy2p+ewzKNLhprTdPt82B6dbbgSwrvJ5EZCYaDpojYpH/OrhqyRA7a/PsE9VG+RL+MneSiX1HdVal9NgMsNWfVPqS47eYFRo5VOcq0s3j6YwkE+7ohH24ci7L9bC8auVwLFr1XW8foXcoK/XaBOG5kikTD9DyW25UjgZ+rxR25v15wGMRLAzK0fXwEXkn3r3Cwiqpw73QcPAXYzQzDm3zfOwYTJPLVnrqj4pWJpdH6gbwpE9pwgdF21vxuAoyfb/zFWAHpA==;
	5:nM+9CUBa3PFAFgl8oVSj9gxh7w7Syh1nukj4TNQJ1LFNF/Mt0j1P708scyQns7jihCw2K9nXZopAJ/bWl6vL4rzfAU5W454pdkdw/kSnG7C4uaaouBdL5suPjaC9WWABSAGI+BBPsTX8zBerqQOQbw==;
	24:Ai4SV1Ko3t875aSQyN9TkwgbNxaViU09kZ9xiBaF3KlfLHWZgB+81MubdOIvsjpCHTr1i5lDA4B4iS86W/jGfC8YJc1wlbn7ryIRV0paNbI=
SpamDiagnosticOutput: 1:99
SpamDiagnosticMetadata: NSPM
X-Microsoft-Exchange-Diagnostics: 1; BN6PR01MB2674;
	7:Tw6L0DPnwuTKAa6I7M9xIbw3x6psSyg2gqsdGcCpfUy5CIOQHkWiKHxPcVvTSqCKeC8MuvmurDhkDpX97OXKnr9r6kIPG15fF5hDD0BreTfgPMR+Sg1WaOtQdEr9KrPqbY9hJPJVcR4ZIZhzrX2yAe/OhUeGxPgeBB/DGD6mU1CYYA0qG6bgsFISydtX4jX3mQ5IQyxktazXyNgGSL2xFata1qNf1MGOIbL0Qgb7qJ2aQqhgiNmP4VCnk0PY7ZMRPeCIDHrhXn8lpiWMz86lr462StQqCw3uiBAsPzXpwqX64r4FAW5xXUs5FeI1BfYbGetu/VbuyB2pKGaSvEThCQ==
X-OriginatorOrg: xevo.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 08 May 2017 23:47:08.2516 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BN6PR01MB2674
Subject: [PATCH] scripts/runqemu.README: fix typo
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
X-List-Received-Date: Mon, 08 May 2017 23:47:09 -0000
Content-Type: text/plain

Signed-off-by: Martin Kelly <mkelly@xevo.com>
---
 scripts/runqemu.README | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/scripts/runqemu.README b/scripts/runqemu.README
index 5908d83..da9abd7 100644
--- a/scripts/runqemu.README
+++ b/scripts/runqemu.README
@@ -35,7 +35,7 @@ Notes
    run as non root. The runqemu-gen-tapdevs script can also be used by
    root to prepopulate the appropriate network devices.
  - You can access the host computer at 192.168.7.1 within the image.
- - Your qemu system will be accessible as 192.16.7.2.
+ - Your qemu system will be accessible as 192.168.7.2.
  - The script extracts the root filesystem specified under pseudo and sets up a userspace
    NFS server to share the image over by default meaning the filesystem can be accessed by
    both the host and guest systems.
-- 
2.1.4


