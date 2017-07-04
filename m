Return-Path: <sorenb@xilinx.com>
Received: from NAM01-SN1-obe.outbound.protection.outlook.com
	(mail-sn1nam01on0064.outbound.protection.outlook.com [104.47.32.64])
	by mail.openembedded.org (Postfix) with ESMTP id 2831F77BCD
	for <openembedded-core@lists.openembedded.org>;
	Tue,  4 Jul 2017 19:02:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=xilinx.onmicrosoft.com; s=selector1-xilinx-com;
	h=From:Date:Subject:Message-ID:Content-Type:MIME-Version;
	bh=Z4m+hcAVwL0kR5GND3PIrG9wEcgDkXYJ7F7VTuSqYGw=;
	b=mdcULcaADcsK/56d9fOvTI7jYsgUbPSiOG3G4aZtcL+kc7PmkTayjQO7PgaxrGNSqPMqISljTMw5mpWJBCOhSMvsCRcdhem1uh1d+OT5CtaJnsG0xTCdSSeThHvcZO6inRUdJHnvAmIS6SWQbK9stAWBEgGj6oxD2G4T7IC6Z8w=
Received: from DM5PR02CA0068.namprd02.prod.outlook.com (10.168.192.30) by
	BLUPR0201MB1588.namprd02.prod.outlook.com (10.163.120.143) with
	Microsoft SMTP Server (version=TLS1_2,
	cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1220.11;
	Tue, 4 Jul 2017 17:29:31 +0000
Received: from CY1NAM02FT041.eop-nam02.prod.protection.outlook.com
	(2a01:111:f400:7e45::208) by DM5PR02CA0068.outlook.office365.com
	(2603:10b6:3:39::30) with Microsoft SMTP Server (version=TLS1_2,
	cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1220.11 via
	Frontend Transport; Tue, 4 Jul 2017 17:29:31 +0000
Authentication-Results: spf=pass (sender IP is 149.199.60.100)
	smtp.mailfrom=xilinx.com; lists.openembedded.org; dkim=none (message not
	signed) header.d=none; lists.openembedded.org;
	dmarc=bestguesspass action=none header.from=xilinx.com;
Received-SPF: Pass (protection.outlook.com: domain of xilinx.com designates
	149.199.60.100 as permitted sender) receiver=protection.outlook.com;
	client-ip=149.199.60.100; helo=xsj-pvapsmtpgw02;
Received: from xsj-pvapsmtpgw02 (149.199.60.100) by
	CY1NAM02FT041.mail.protection.outlook.com (10.152.74.156) with
	Microsoft SMTP Server (version=TLS1_0,
	cipher=TLS_RSA_WITH_AES_256_CBC_SHA) id 15.1.1220.9
	via Frontend Transport; Tue, 4 Jul 2017 17:29:30 +0000
Received: from unknown-38-66.xilinx.com ([149.199.38.66]:55717
	helo=xsj-pvapsmtp01) by xsj-pvapsmtpgw02 with esmtp (Exim 4.63)
	(envelope-from <soren.brinkmann@xilinx.com>) id 1dSRdi-0005Aa-AT
	for openembedded-core@lists.openembedded.org;
	Tue, 04 Jul 2017 10:29:30 -0700
Received: from [127.0.0.1] (helo=localhost)
	by xsj-pvapsmtp01 with smtp (Exim 4.63)
	(envelope-from <soren.brinkmann@xilinx.com>) id 1dSRdi-00087H-6I
	for openembedded-core@lists.openembedded.org;
	Tue, 04 Jul 2017 10:29:30 -0700
Received: from xsj-pvapsmtp01 (xsj-smtp1.xilinx.com [149.199.38.66])
	by xsj-smtp-dlp2.xlnx.xilinx.com (8.13.8/8.13.1) with ESMTP id
	v64HTKKY025846; Tue, 4 Jul 2017 10:29:20 -0700
Received: from [172.19.2.240] (helo=localhost)
	by xsj-pvapsmtp01 with esmtp (Exim 4.63)
	(envelope-from <soren.brinkmann@xilinx.com>)
	id 1dSRdY-00086E-2A; Tue, 04 Jul 2017 10:29:20 -0700
From: Soren Brinkmann <soren.brinkmann@xilinx.com>
To: <openembedded-core@lists.openembedded.org>
Date: Tue, 4 Jul 2017 10:29:08 -0700
Message-ID: <20170704172908.14734-2-soren.brinkmann@xilinx.com>
X-Mailer: git-send-email 2.13.2.3.g44cd85c14.dirty
In-Reply-To: <20170704172908.14734-1-soren.brinkmann@xilinx.com>
References: <20170704172908.14734-1-soren.brinkmann@xilinx.com>
X-RCIS-Action: ALLOW
X-TM-AS-Product-Ver: IMSS-7.1.0.1224-8.1.0.1062-23174.005
X-TM-AS-User-Approved-Sender: Yes;Yes
X-EOPAttributedMessage: 0
X-MS-Office365-Filtering-HT: Tenant
X-Forefront-Antispam-Report: CIP:149.199.60.100; IPV:NLI; CTRY:US; EFV:NLI;
	SFV:NSPM;
	SFS:(10009020)(6009001)(39410400002)(39860400002)(39850400002)(39400400002)(39840400002)(39450400003)(2980300002)(438002)(199003)(189002)(9170700003)(189998001)(356003)(2351001)(305945005)(81166006)(8676002)(76506005)(8936002)(57986006)(63266004)(110136004)(4326008)(106466001)(107886003)(53376002)(2950100002)(6666003)(626005)(6916009)(38730400002)(575784001)(77096006)(33646002)(36756003)(50226002)(47776003)(9786002)(1076002)(50986999)(5003940100001)(48376002)(76176999)(478600001)(5660300001)(2906002)(50466002)(6306002)(36386004)(107986001);
	DIR:OUT; SFP:1101; SCL:1; SRVR:BLUPR0201MB1588;
	H:xsj-pvapsmtpgw02; FPR:; SPF:Pass; MLV:sfv; A:1; MX:1; LANG:en;
X-Microsoft-Exchange-Diagnostics: 1; CY1NAM02FT041;
	1:j3vdHC+OUfBu9BejBKIs8YFwEcNB83KCLgeXES66hLcxbeLJvQQ7tHVTDx66LIONK3NHmFIzaCKWVlwub1VFc5RK5l+JbcdsAJi4RBkTtaMTbTwQYlJYGBCuSd8nEjfPgxLO/OJkkSPqq16VlQWJy4USbYRmydHpTraBFkyEPHsx5YglftmrqPft7uGi43E7naWTrbwvBPr+x18U0AU+k//s/WadRIH1gLERXYzdCVTQbkv+6Cg64T/zHGsUQqTkjWvjlpXFucOrTud/8E7oN3xCgFrIsl+NxGhRZfggHOwBZvdHz8ztvFTClpmGsFPdNtwy10/oLrKYjBJ0X4Gwf+xZGC1ZuPoGhSFoizYyH/FJwxBdSioSyGsBuiL5wsPpmP8tcnXUAPba99yLwAakfur8pXgNKtYmTsxWvjd8ghItdBNSLOzThN9rguEkIH7CakeMtZ6yEs5dRpsKDHK8EIqM3w4LHiBu6FkpQQTG1GlB1RqHk0goqvP+V0bQiwfZQsfMWpl+jWnZA555opM/hPRvmFvuoxwaev1Qf1whnkZjQgMX3495WH6SEgaPymFWy3x/2RMg1UsUZABN3JHZbJaV6kacaYqACJo1qYT2ZBHKDrJ3H2X4fOJ4FGPv9uitZ72946J48lmXp3gGTZiVUVg7sUhfEZvEfW83w3uaLfKmWjPfjwUZXBnlfpDSQmnuTldRQaJCrlT5B5jGYEarn9nFOJmQGj+FsoLyh7oDcF1xkxcJZ8seLkctxDWdWIe25tsAiW+hF9XsC6rBB5rE4BaUztCRQ8jnTbGBx7hZRmA2qkoEcya1ClsBmYmsYff6pIJHjLmqokJVK1qdOzvomYK82vp6teBoE5cYI0NzcqQCX4fR6Jd7VjXijibJUnaT
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: d981b3b5-eb19-415d-a108-08d4c3023af2
X-Microsoft-Antispam: UriScan:; BCL:0; PCL:0;
	RULEID:(300000500095)(300135000095)(300000501095)(300135300095)(22001)(300000502095)(300135100095)(8251501002)(2017030254075)(300000503095)(300135400095)(2017052603031)(201703131423075)(201703031133081)(300000504095)(300135200095)(300000505095)(300135600095)(300000506095)(300135500095);
	SRVR:BLUPR0201MB1588; 
X-Microsoft-Exchange-Diagnostics: 1; BLUPR0201MB1588;
	3:9DxEM23C2WXR2InUUyaJ+sGZAlHp3meaEppC6+PmFuy7mfr/+bvawIVsDl1iuLV9Ucghgq8+3xgIdSsRNKukY3HWaa/cj+pYJXecvo8ErduMKfWp1XqqA3iqzRvBmOzp3UB+X0KFDRtckS1wovZhoFGlstl9+pkjLJ8HJet2m6kJ3747VA5wEeV/i5wVWmXTlQUuf0BVW3pR+grVy2H7UAPawF++O+4jMo55WCAF63h06DqbW43ad3eVa4A3dIzzNzb/31Ccy5QVFjQ6PCuHNzr4FY69YuJWLDpn4GNIBrROxRhLd5gKjkICryLYhSq26FO2JSR26Wqvkc+nQz20eXs4OgMoW9axBUfREqPiUTMJ+vAchgzbS6m0UQgq+IJ1i8QBH5Au45FG7VLRLsDM8qvwVEGBwKfRCydlIaOJ01x19Zas27S83/4sS+JUsGVdYDkcatCw5Jp+KEbBWEdVBosThnYBpcwzZiNL+H7CyaviS3pu6xEaeKV1ilG/xT0w2LRSLuHuy8lhM0naOqJUq4O1EN9lHCByVHftLLzayJn70JtRFu8+ML4j3qCfxlL37uEq8aIxQsMjRMBI1EhsAYkZlFXiPUhiB1VR4agx8j9HA7MElR/QzswhWa4ZLw3Z68xbLti64S6EYtAwqYlzogyS5q3420oVUvxYksZS3hq4ygaDG7BCQQCu/a8bAm3QHpwCZHXc7qlJKRtXim40IuAmJawcDzLxfCgLagt9QtAEemM5SLerjCYmKV0J8pGzuKtMeaV5pHgBO5LV56mjzRsci2AmQnbANZRn6QKCIoCTmAWqjKyRo7OoY3j7XaKD8vfaKw0sW3ZFIB2FmB0Iya8sBiiS8C3IF6pYScs++LG1hjdCMu9HqSE5O7rToTuxd+FJ50cTbs9MGI7wRO+jKjlLAd6lKTRBlHFAXDqFiHaNkNC9Xljc3y/558mEkjgq
X-MS-TrafficTypeDiagnostic: BLUPR0201MB1588:
X-Microsoft-Exchange-Diagnostics: 1; BLUPR0201MB1588;
	25:TNctm/4/dhLZ8Y5u3yvVISkTUHrzJTZbq5WK2gmvaP9BG3yirSARpgk/Dwb3Estv8LN8LOsIEZoWB7+QEeEyWshm27cXKeutu+IUQ2jZiqHbbmFx3BHfUVGer1qiEPCEBA2DTKZ/ZdQ5UbdwgGhabQOUI1D1n95aevziZVnuln75GysFb/X0FzF2uuunsR9Vck38zCopfwm3jnqEwfTts3LglRnwSndn8Ny2bqcxtks58ODwhduc3x4oFe6YyGSU/4V4mlM+YwktCUINOA9VH5OCL/LfvY32xHo3rDChnhKzO91Bx9+F02DTaIqClTNRe8rOunzE+6YDNc3rtq1uunjdmOJaMGeA4ojK0Tmoyfx+bfWJlcDtQYDAS/h8lKBKJaZboJaf0iqI2FH9rth8bIRHmoyWOdDiLjbju3Ol+ezgeFqRNn5xNQt8H67xQq4zFNs9VNRRfArW436eDp07qtuXZMcUGP3lbxU5go7Ys3V6js9zRnQG8vXJxodZnVHsbDJU1ISR2KavLKyUV6p/q5VOHEMHkJ9SYQgdk3kurRZ29oo1aeNxJSOJ6cAqQ7hSFTT0f86Ahw2DaNWQowuo2KC3BJrJm3dxwxBm6CqXUdE3S/JdPCS2FeLCe3n3IHKYUplUYIxMpR2Y/80vgb2otv3fmtpBA6DmkDvde/g8jE30Kf+SNeGJd8gm9MkP5dT2CFeckjRg6hQVZPZ891AQx5OVqO42/qZqRlC5oETk3Clq96KSvTP8tgUbYDA43PqhsWYxxDoke5/dorQn7W8Vn+lyz7sqiD5RtP68v6hIL+GIlIAX1tQ0tojWD71Kr7gudcQUR2jP90baOpphALSRn4IW4glFuqUsWUHJHqQ+k+KWJfLgROWSXKBkHZBYmLTlhL8RZyu/vRBiPuimShsYEaLPzgnIO48qZ0gcFUJit48=
X-Microsoft-Exchange-Diagnostics: 1; BLUPR0201MB1588;
	31:dBOFXnGpDsSMtMmI15lYHMDbeJgMOJu9eeM7biHi+sl+UBmoJP79V2kNz137b1Jn2ntwC7rj4aFm3qskdGIe/OmLm+KgQln3xUjn8Vpp7o8x1gThUev0NjypMBpIfLnhm2P+2ww+ri6sPAWiZI8DJflsKz9E0TecoHBgkPQZKMbvamRA+vvtQNl8+Ptj0uHD6t92hlAkmts4xTUBt9Y2mCetUUPSNhkg4KoTSoF6SKe5q1KkbroGj9vRzSsqWawpGBoaOduFdo0xvXawFKa1X3heza96ziRz8sj/dxH99sSO5tzdJtbLWeANqiyD2gOc0232U8GzbaUsPA4Sz7lXgf0iLwMkDbQaTABZ9nKla8m8nHpUVoEf+IzlPKgkfsQ34qv1VGFt8MNLor9Wlg+IefXpdylcsfgME64H8knqq3kHIXTRuRqVxm97+aKY7BjhvkcApxdfcgJ9rM0/G/nNP0J3Zx0FP9xccziSCLi28qED3/mM6bYOCagNcCiA/pCUvGSeuEPo2J7mWPdbonUJdWaEdsiEB4flbxRqo8h5t1PT105MQ/i9UdpcafBbY4u/hv6+mIURwfqIllfPj8YFOQFv5TrRJnb00yxslrgL/2/olXUBSChDdLIxfewA3Gc6KuYdc3ZL4MipITfgYcC4rBb7gj6XupmkC6Tne+eiEFzpNxn35qI34IMlowKpT7LL1esJwG8smcsSEhqxs1ccSA==
X-Microsoft-Exchange-Diagnostics: 1; BLUPR0201MB1588;
	20:V7eWsw9tmYcMrnpBSlLWgBedHblUR47Z/BCTu8bg+vK1e90B5/GET/RSZL4xGe27S01jUFCuMDYzwg0fGMioeuF8wUtJT/Iu1RcveputY5tbPQl4GBUMzOPlOEHpTU92Tqj8x7QkewbCkW6bFh76cby27HToWxr/q+M/AFNahkcqvsWsSBsKQ22Sc1OL+tCWPIhlHeQpepBwEWOR/tB03+uEOXPWxXptmsaaDEMvsD39NSGeknMux2eQrOMAP6mlmOS6OM6oLjwVP0qc/8udPhh5pSPhhBociy+Fkjmu3OCAU6AbIY3eZk6StSau5s91w8vcSPFjfShKTnruEpJW6WzewtC3JjQQY/eRWRpVsh+Buyhvu5+Hc3hDJN7oTn7XP9BZqa11kaVYig0B74Gbm8jtKSkhDZtdUnvfJxqqThoi0/Dr8jlXYULm12K/IUpkGHtlZcUkw7Ifk2/bTI8wInRbblLs+yYssH1ksEnHwlg/qcVKfWASmQlo2kzzrWed
X-Microsoft-Antispam-PRVS: <BLUPR0201MB1588315CF97E69A9748CC301B0D70@BLUPR0201MB1588.namprd02.prod.outlook.com>
X-Exchange-Antispam-Report-Test: UriScan:(133145235818549)(236129657087228)(192813158149592)(167848164394848)(94056789713001);
X-Exchange-Antispam-Report-CFA-Test: BCL:0; PCL:0;
	RULEID:(100000700101)(100105000095)(100000701101)(100105300095)(100000702101)(100105100095)(6040450)(601004)(2401047)(5005006)(13016025)(8121501046)(13018025)(93006095)(93004095)(3002001)(10201501046)(100000703101)(100105400095)(6055026)(6041248)(20161123560025)(20161123555025)(20161123562025)(20161123558100)(201703131423075)(201702281528075)(201703061421075)(201703061406153)(20161123564025)(6072148)(100000704101)(100105200095)(100000705101)(100105500095);
	SRVR:BLUPR0201MB1588; BCL:0; PCL:0;
	RULEID:(100000800101)(100110000095)(100000801101)(100110300095)(100000802101)(100110100095)(100000803101)(100110400095)(100000804101)(100110200095)(100000805101)(100110500095);
	SRVR:BLUPR0201MB1588; 
X-Microsoft-Exchange-Diagnostics: =?us-ascii?Q?1; BLUPR0201MB1588;
	4:A11eJ4NMzUGPkRtzyR/qIqvlwK0uml1rBe3HOTTL?=
	=?us-ascii?Q?Gm66jxLSwoTUENfyBVTHrj+csBvaqrSd8gt24iXUO5ka6xItm3T2qYDgjtTO?=
	=?us-ascii?Q?rSfSkb6ZfKZtG7IutDYEzKG8l/P7JmDyegxAZ342Nou43sh3M1ah9QNSA4j8?=
	=?us-ascii?Q?ixhxne3FhbiZg++WHgY+Q1Kt2nSRTJF0AfgJbqu20C6vm5zcwJGLiU9Wpgtr?=
	=?us-ascii?Q?GmHrkE5msfkb6K2uK1zUJu0m58i4KvvHWjrZQclEqgl97UYa+yLxyWLSBnDC?=
	=?us-ascii?Q?SWmPUll26mj3mWIC5fzs3ybiucVzw5HiCp/Wb74DMtrsh5h2DQPPrq1UzxR/?=
	=?us-ascii?Q?4E5fq5m3Ia4lC9RhyA9QWeH1rwmpR/09kHvmNltNom3v9k2YocEwVxSz/cBT?=
	=?us-ascii?Q?uUFHwyAnG3ZbyxENFPWYEzB4rOMfrV95Qvnn3fXI5rfT4lr5qZntdSHci8Nk?=
	=?us-ascii?Q?RUwGgLzj4atHtgRt6JOvEihkqOktgc1iBzmywMDuE/6j0wCZXXH3ZzAKliCo?=
	=?us-ascii?Q?FdP2nl+8ZWbbVXt73TjFnTKWYUNt1ZYbMRgsdJH3XYnbGHcgf0bJUA1OfBqt?=
	=?us-ascii?Q?SmCgf1y7TbzJyVF1nq+WhM/kAd/KfTjBiyQVjrLauFqE0RhhpJLOq20xvS0S?=
	=?us-ascii?Q?J+2uQ31eDl2S+Q00+yDhU96sti/rDLiQVPtB581HHYwyEso3Hqc7gv2+Y55R?=
	=?us-ascii?Q?rf0KwlxCbvE2OPN0ftE2GBMX7VlQ2QgZ2yqhntAkNhYhOZyd2Gwwdiq9H2eY?=
	=?us-ascii?Q?SKuEPlC47pCqVM50f6OdQsUWNWU98m+rLhdvOS2XXqzOqPUSPb4C6+a6j2Uz?=
	=?us-ascii?Q?+BjIErb6kKoGmy3UOH497Q0LjPqmwta2USmaf6UTVUsfG4QtJItoJQSve3cz?=
	=?us-ascii?Q?UX+2nQfwlAZyaU9eyv0aMnl2zDAR745fy/0cM1f5/53lAZZYNPMPrUBVfTNW?=
	=?us-ascii?Q?bBaxbrMrHZKiTgJzvcK3K+Xb9fNgeabs/C4AcIvEJogNQyhwClcOn8wLj2bF?=
	=?us-ascii?Q?BVwMdlO1+MXhXb4MuI8x6Hr/0fKfLh3mEC214U15CERtMYzRolwPEAsYDMm0?=
	=?us-ascii?Q?S04KLGjD98ESfQWSfQZ+axZUYx2VpjpVhacSLDmpbYpWX/PQZtOZqT/cfKbd?=
	=?us-ascii?Q?KBJiGz2hCUDkEuivZjVxhpXVr521bgwK02SjhQ9ET7mYDoQ7xlDF+UtY4Elw?=
	=?us-ascii?Q?BuK9LPmagMoq8cLBSpe1vN+2OuARakyns2B0818HNSOoktdpyPssxF3ybW53?=
	=?us-ascii?Q?/BpMIbVdfvsy0wEuNPYlQ2EBYJRqlIzDO8EANv2avKIhfK4F01mQEHkkJIpU?=
	=?us-ascii?Q?C0E9fLiy+9yMxXin1blIrd6OY2d86Wfi/GrRPZCiZ8tFZqWV2nswPe7qXyTQ?=
	=?us-ascii?Q?CzpV1ZqhEcD7KAkROBF3qot/Zas=3D?=
X-Forefront-PRVS: 0358535363
X-Microsoft-Exchange-Diagnostics: =?us-ascii?Q?1; BLUPR0201MB1588;
	23:v44ud8CuqwJbW7JQcZSoxWC09YRdqmxJsuGCPPE?=
	=?us-ascii?Q?ccrD4f2WZEJ1PmAeooo2OuIdhohDAM2+ZFWYKitg/93oV6n/N1TSTjZLoxHc?=
	=?us-ascii?Q?AWGBQA0Lm4h2jMvEnTq5OL88yZ9/EWlVneOccSlTHoakBR34c6p6IseAXpF2?=
	=?us-ascii?Q?b75nRZ+ME3FA+JurFU1gEl5nfe/4nyLnRelzjpZ5pL05/JoAYTfqZlalf9lN?=
	=?us-ascii?Q?5AuXZ4af/ckkPQPfDlOxojf3FpqPjxo3fX35bDD4o+n4Xr5WwLXnUO0unWmH?=
	=?us-ascii?Q?SEIn1KiGs0Am2YuFODTdz5xQhqCwUOVa8OSq6qwRHHcvZRzXdKMWMz3Ok9XQ?=
	=?us-ascii?Q?CwKlKxdIzYGanr2bPtyUNVf+rNpbqGw/6EmY9zc1E1CT4GY+4Vl4hC578OYi?=
	=?us-ascii?Q?aNozHMa8AJLGrsDJIE7EnVv63IpDOO8yMo66Lxdr7vgQbA7mfbYYhLTHI6aF?=
	=?us-ascii?Q?Lx/DpYggRRmHZgzw64zU3T1+bIikh1lAndJNTne2hmjFZXaGoWIGZYbA826A?=
	=?us-ascii?Q?CjE4+qc9XDVj1M8V1lbt4YHtBeG+Tt08hQKiseRwNIk/W4gzcTGgsjuovYyL?=
	=?us-ascii?Q?wTgkdjLoSjaFenOfctdy/Vmf2LUk8hBWVpNojs87VLtXV4BUyRYWcYYQKdWf?=
	=?us-ascii?Q?eYOKe0g5mqf56ezF5qShZ0NtsDtFboivX/GWwlyTHoOSH4x05MQ5PA94YnsK?=
	=?us-ascii?Q?+pgtujnsLVfc8Af/5Tmnz3mSLdl3xp65HygCOpxJUhU8hbWArVQ8ysoxSw3I?=
	=?us-ascii?Q?fZKlnTZ4d5UdEEsIjQ5U+G5R6ET+BCTBdUfPlLysl5vNM6wRu8xn9Lin9UeL?=
	=?us-ascii?Q?Nsjj6Rf0wGHLLjU39WjNnPuGfeUk1hK12GoNZOz5RITiepKWk1XBF7S/rFlN?=
	=?us-ascii?Q?qRso9WyXocejoMmLfanHDtDWtbNATyh5AKsjXTBQ6iGBJhZxvZADdAWI1d1H?=
	=?us-ascii?Q?t41Qnvhe08wcqrT59ZEhdRNx/Agh1kbXdxTH42VICA8hWcJOHC+i5YzEoICk?=
	=?us-ascii?Q?l9dAzMMYn4Zz39zSG3L8Wyqgmdx8SK+YfXxVEqsL+z2nbu08k0h3+X8Tyj6N?=
	=?us-ascii?Q?sFEjIfPlneuYAcV2PDO6uw8ETtPl+ZhVJ7a/f381W9/Q6d1seXU7pZCDmx/+?=
	=?us-ascii?Q?KPQeouG3FvTGJkNxZPXeUEXVTbPI9tzQMT6ral2TugfExW2OCrv4K5XIsDVH?=
	=?us-ascii?Q?+9H3QDY1GDeKRLD3najlrLIUr2aJcGvLJtjahiEAH7p7lZ/b4uP+G0q5oOqg?=
	=?us-ascii?Q?ROYr9IylOAaQfHaYZSEM=3D?=
X-Microsoft-Exchange-Diagnostics: =?us-ascii?Q?1; BLUPR0201MB1588;
	6:zIMK9HwG1EVYex/+2XxPqPuAyewilbW47oON+lUh?=
	=?us-ascii?Q?kC6intcx6KN4mEA/Rc1UeA0cwf8gQn8CiQF85+ztQiD7MtRGiOQNYhMqG+fq?=
	=?us-ascii?Q?Co+Jgo3ZuDhqwRJ9aDaqnIrtN2lHp0VK6tGMw4rXX31XPI/0sFCP8ygtuRPs?=
	=?us-ascii?Q?u5Y6xCyegxzgw2LM/B5TytzCVpx39qs3TI/6Vzv3iqlmM22fiaO5JI69rB6A?=
	=?us-ascii?Q?SATcrnLR3sW7pZEsYG5qOjQMQ6VmpkUamUL3mf+kONWp//2wCijpLn1vAfez?=
	=?us-ascii?Q?NEuzqdBZUAN2My4wAoakP5MG1Bl7xljUT4beyl4rQ6wNeHqswcvyKyDXsApr?=
	=?us-ascii?Q?NZcoV7qz5UZANq1l20VIvv5PnGZYn3zix88kr9dzMvigbpqwBZOvgnzrqcqf?=
	=?us-ascii?Q?x+2Aa1Mr+R4LwMHGg3er065mmfx4G3gbgomFwoQe4CQzZdnc3z7vBhh1Wr2F?=
	=?us-ascii?Q?hOFLnhybX9rhDBGapBuqmOSxPRALD8q6bZxuRwhogFGd0PjvInrTgraTvtl1?=
	=?us-ascii?Q?f/jeIemblm4H3RoNzymsgRg3hCjxGMCNrqy+uRouFuZlqtcyAzUT1BT4lgiI?=
	=?us-ascii?Q?6OcdEm1L85SIfZJ/QBLIgrKu88CZbqqupGUCr+l93aLlm2dw8FtzhHsMTWqr?=
	=?us-ascii?Q?nxWMzX10LsF0CehQ+810zlYvXrKb+NlZxRaNn2R9QiZuGRumnjWbGpCtj7cf?=
	=?us-ascii?Q?El78Gt7bDXnJD+vg13dstCOzb5Czghy51ZT+UFPANzlNl0W3V4t6j6AuRVyG?=
	=?us-ascii?Q?7pfIj9McnUSSlgu3AIOtKnZlua9z/lcvGsFW679nxVZtpQcuQC5qEhgMYUKa?=
	=?us-ascii?Q?5AF4zFxzqSl9piIa/2sbjUAvin4T4BXZmKLF5Xn4Dd+vclO3MFE87aISryyQ?=
	=?us-ascii?Q?80qZr4gcspgPT1EC37EAjG3mwuHscoKiccmYzBSqQJc/EFmUhY8PR+oYUTO5?=
	=?us-ascii?Q?ozi2OttWmAqz/sa+gwwjLsaRnXJTpf7RVj7IfUllt2eAN/ru4ZRtRUuAymZJ?=
	=?us-ascii?Q?kGSSZ2vsECz/5r+knCvuGU1d?=
X-Microsoft-Exchange-Diagnostics: 1; BLUPR0201MB1588;
	5:aRCSp4vc/cgEuXPQYctgIPN4fU/1ld7EtNaJ3LFUaJC4Pkkj9qirx+IPpdnlZQfbnAWNwnciR4EBblnqE8OxSGArcLQHBGwVnkhz3JJ+wToFd7EJ8vzMHTQfLMZa0O835J3z0ZyUi8bFC96oBvJfU8Pb7bX4sflnDb50cvFxyVCIxzVwpd3ywaF82b5fdZddECe6Gi9LzBd9strzGwn1/rsdQmQDeT0lqTrjO2TNwxn/bIR/rftKXpYjaK1/dP385AA+aciBC3uZtXlzwbcRCFyu4q99BLb2FzOlYyv6ZjgjXKtiewoBKf40+8w2xkgw0g6SzoI3qJBcQtolPMTEqFEGCaaxSnpj2Y9x8a+FQzDkiK/NjGXMPXuyEj27xkO0HFeUNWCYXXm4e2INDgOGIVBx/dPDb+cTv8dm6T27VaR0cQKA+azwBDBgdUd8nauM9h41PVU7A3zCPewFtOltCj8Rgf3S/+xDxFDLzHWnbMi+mF2pZIFVATDWh6mPwSvZ;
	24:7wBXxvgrowP60QVoTM8k5xNRTy/7PPHbDbyvrWwwEXbM/2InBf872Jvex1RUt/9HZjTVXSAnDCsNUdHuZa5YrGocRa+ooM1KMDrAer05hWw=
SpamDiagnosticOutput: 1:99
SpamDiagnosticMetadata: NSPM
X-Microsoft-Exchange-Diagnostics: 1; BLUPR0201MB1588;
	7:9+0oVcp70D8qmq0JslW2LislS+8ZwVbkF4LKKomfvXuSj6uExH+A/CYk6Re2n0iuZGz2jIRWfG4LdiC4b3IhgVvOkK19j0T5GQAVAwkL/CXAS4bkNZqL3R6mVWQnDu4/WsBvn5E5oB+TqfD3xLUiIAxBRK8rTHZM49nIu7WSgOH6tgUgczksknO0DZHWgWkQFXivF6ifQbyZPJoWF1xjl7nX3Rv+hGlw6l2LNJajyrsWunafnasTz21qOjtYQ/3x/IdnGH+e3Ecv30VEmry97tFr7WchFM8G9RdohLw5+PSr1/gQzs3fG0WUrcaClDxTFzWTm5SFYXuKJ8UepecUcUcpHc8hF/LDy7TcFHZh3F8axGz+LUVJabSyLOOoSSH7vVnJTN6IOPTku47LgkjYNXxC91muzRd4FEf0U9bRuS97kM5NBCkA42Pd+O15A3sDbe5fjKZbmvUFeBHUY46zChkGK6n5s3R7Uqoh2J89r7WTOgKjT0+skHraqIEiMLa/g+8GYTMDYuFK9Xvu1NIPzAhqFqGFXAtpZmtQiDvSR1oNw+D6Gu8oYFKKcPDE4e/OUo9BsvNCmz4JJRLwhPUMuPOqTQK+jk1aEwFzt/FDKpGVxfSRCiq2Vw3KmrwnqYZr/Ae5WGnv6I+qsBzfMnVkEjfRUmVavdJzAx1iMuUMdyh1x2des1w/zV5FxSMLljTUuwO/iL53p3hM+sjlsUjuuGZERgLo2o4UXe7zZW5JzFW8wUKBYEZLVzQ18oFoBWz5+HM1QefndKiW9M3GqBpiZ6GxmpDJpB5w8DVFH7z/WEc=
X-OriginatorOrg: xilinx.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 04 Jul 2017 17:29:30.9912 (UTC)
X-MS-Exchange-CrossTenant-Id: 657af505-d5df-48d0-8300-c31994686c5c
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=657af505-d5df-48d0-8300-c31994686c5c;
	Ip=[149.199.60.100]; Helo=[xsj-pvapsmtpgw02]
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BLUPR0201MB1588
Subject: [PATCH v2 2/2] valgrind: Update 3.12.0 -> 3.13.0
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
X-List-Received-Date: Tue, 04 Jul 2017 19:02:31 -0000
Content-Type: text/plain

Signed-off-by: Soren Brinkmann <soren.brinkmann@xilinx.com>
---
 .../valgrind/0001-fix-build-for-musl-targets.patch | 69 ----------------------
 .../valgrind/0004-Fix-out-of-tree-builds.patch     | 37 +++++++-----
 .../{valgrind_3.12.0.bb => valgrind_3.13.0.bb}     | 13 ++--
 3 files changed, 27 insertions(+), 92 deletions(-)
 delete mode 100644 meta/recipes-devtools/valgrind/valgrind/0001-fix-build-for-musl-targets.patch
 rename meta/recipes-devtools/valgrind/{valgrind_3.12.0.bb => valgrind_3.13.0.bb} (92%)

diff --git a/meta/recipes-devtools/valgrind/valgrind/0001-fix-build-for-musl-targets.patch b/meta/recipes-devtools/valgrind/valgrind/0001-fix-build-for-musl-targets.patch
deleted file mode 100644
index dc6feff7ffa0..000000000000
--- a/meta/recipes-devtools/valgrind/valgrind/0001-fix-build-for-musl-targets.patch
+++ /dev/null
@@ -1,69 +0,0 @@
-From 1b1a024efd18d44294e184e792c1e039cab02bfe Mon Sep 17 00:00:00 2001
-From: Khem Raj <raj.khem@gmail.com>
-Date: Sun, 14 Feb 2016 09:14:12 +0000
-Subject: [PATCH] fix build for musl targets
-
-Signed-off-by: Khem Raj <raj.khem@gmail.com>
----
-Upstream-Status: Pending
-
- configure.ac             | 2 --
- coregrind/vg_preloaded.c | 2 +-
- include/pub_tool_redir.h | 7 +++++--
- 3 files changed, 6 insertions(+), 5 deletions(-)
-
-diff --git a/configure.ac b/configure.ac
-index 9366dc7..679f514 100644
---- a/configure.ac
-+++ b/configure.ac
-@@ -1066,8 +1066,6 @@ case "${GLIBC_VERSION}" in
- 	;;
-      2.0|2.1|*)
- 	AC_MSG_RESULT([unsupported version ${GLIBC_VERSION}])
--	AC_MSG_ERROR([Valgrind requires glibc version 2.2 or later,])
--	AC_MSG_ERROR([Darwin libc, Bionic libc or Solaris libc])
- 	;;
- esac
- 
-diff --git a/coregrind/vg_preloaded.c b/coregrind/vg_preloaded.c
-index 2ea7a7a..e49c832 100644
---- a/coregrind/vg_preloaded.c
-+++ b/coregrind/vg_preloaded.c
-@@ -56,7 +56,7 @@
- void VG_NOTIFY_ON_LOAD(freeres)( void );
- void VG_NOTIFY_ON_LOAD(freeres)( void )
- {
--#  if !defined(__UCLIBC__) \
-+#  if !defined(__UCLIBC__) && defined(__GLIBC__) \
-       && !defined(VGPV_arm_linux_android) \
-       && !defined(VGPV_x86_linux_android) \
-       && !defined(VGPV_mips32_linux_android) \
-diff --git a/include/pub_tool_redir.h b/include/pub_tool_redir.h
-index bac00d7..fbb2ef2 100644
---- a/include/pub_tool_redir.h
-+++ b/include/pub_tool_redir.h
-@@ -242,8 +242,7 @@
- /* --- Soname of the standard C library. --- */
- 
- #if defined(VGO_linux) || defined(VGO_solaris)
--#  define  VG_Z_LIBC_SONAME  libcZdsoZa              // libc.so*
--
-+#  define  VG_Z_LIBC_SONAME  libcZdZa                // libc.*
- #elif defined(VGO_darwin) && (DARWIN_VERS <= DARWIN_10_6)
- #  define  VG_Z_LIBC_SONAME  libSystemZdZaZddylib    // libSystem.*.dylib
- 
-@@ -274,7 +273,11 @@
- /* --- Soname of the pthreads library. --- */
- 
- #if defined(VGO_linux)
-+# if defined(__GLIBC__) || defined(__UCLIBC__)
- #  define  VG_Z_LIBPTHREAD_SONAME  libpthreadZdsoZd0     // libpthread.so.0
-+# else
-+#  define  VG_Z_LIBPTHREAD_SONAME  libcZdZa              // libc.*
-+#endif
- #elif defined(VGO_darwin)
- #  define  VG_Z_LIBPTHREAD_SONAME  libSystemZdZaZddylib  // libSystem.*.dylib
- #elif defined(VGO_solaris)
--- 
-2.7.1
-
diff --git a/meta/recipes-devtools/valgrind/valgrind/0004-Fix-out-of-tree-builds.patch b/meta/recipes-devtools/valgrind/valgrind/0004-Fix-out-of-tree-builds.patch
index ed313d644441..8885dd1542f4 100644
--- a/meta/recipes-devtools/valgrind/valgrind/0004-Fix-out-of-tree-builds.patch
+++ b/meta/recipes-devtools/valgrind/valgrind/0004-Fix-out-of-tree-builds.patch
@@ -1,7 +1,7 @@
-From 38ae233b6893a4eec7f9ed6d8ad02392bca8eaed Mon Sep 17 00:00:00 2001
+From 739421e253e6eba3eb6438651822f80fa9c0502a Mon Sep 17 00:00:00 2001
 From: Alexander Kanavin <alex.kanavin@gmail.com>
 Date: Tue, 15 Dec 2015 15:31:50 +0200
-Subject: [PATCH 1/2] Fix out of tree builds.
+Subject: [PATCH] Fix out of tree builds.
 
 The paths to these files need to be fully specified in
 the out of tree build case. glibc-2.X.supp is a generated file so the full path
@@ -11,23 +11,22 @@ RP 2013/03/23
 
 Upstream-Status: Pending
 Signed-off-by: Alexander Kanavin <alex.kanavin@gmail.com>
-
 ---
- configure.ac | 64 ++++++++++++++++++++++++++++++------------------------------
- 1 file changed, 32 insertions(+), 32 deletions(-)
+ configure.ac | 68 ++++++++++++++++++++++++++++++------------------------------
+ 1 file changed, 34 insertions(+), 34 deletions(-)
 
 diff --git a/configure.ac b/configure.ac
-index 8ab7f9b..9366dc7 100644
+index 3874296fde0b..7a5ba2c8557e 100644
 --- a/configure.ac
 +++ b/configure.ac
-@@ -377,44 +377,44 @@ case "${host_os}" in
+@@ -373,50 +373,50 @@ case "${host_os}" in
  	     9.*)
  		  AC_MSG_RESULT([Darwin 9.x (${kernel}) / Mac OS X 10.5 Leopard])
  		  AC_DEFINE([DARWIN_VERS], DARWIN_10_5, [Darwin / Mac OS X version])
 -		  DEFAULT_SUPP="darwin9.supp ${DEFAULT_SUPP}"
 -		  DEFAULT_SUPP="darwin9-drd.supp ${DEFAULT_SUPP}"
-+		  DEFAULT_SUPP="$srcdir/darwin9.supp ${DEFAULT_SUPP}"
-+		  DEFAULT_SUPP="$srcdir/darwin9-drd.supp ${DEFAULT_SUPP}"
++ 		  DEFAULT_SUPP="$srcdir/darwin9.supp ${DEFAULT_SUPP}"
++ 		  DEFAULT_SUPP="$srcdir/darwin9-drd.supp ${DEFAULT_SUPP}"
  		  ;;
  	     10.*)
  		  AC_MSG_RESULT([Darwin 10.x (${kernel}) / Mac OS X 10.6 Snow Leopard])
@@ -77,9 +76,17 @@ index 8ab7f9b..9366dc7 100644
 +		  DEFAULT_SUPP="$srcdir/darwin15.supp ${DEFAULT_SUPP}"
 +		  DEFAULT_SUPP="$srcdir/darwin10-drd.supp ${DEFAULT_SUPP}"
  		  ;;
+ 	     16.*)
+ 		  AC_MSG_RESULT([Darwin 16.x (${kernel}) / macOS 10.12 Sierra])
+ 		  AC_DEFINE([DARWIN_VERS], DARWIN_10_12, [Darwin / Mac OS X version])
+-		  DEFAULT_SUPP="darwin16.supp ${DEFAULT_SUPP}"
+-		  DEFAULT_SUPP="darwin10-drd.supp ${DEFAULT_SUPP}"
++		  DEFAULT_SUPP="$srcdir/darwin16.supp ${DEFAULT_SUPP}"
++		  DEFAULT_SUPP="$srcdir/darwin10-drd.supp ${DEFAULT_SUPP}"
+ 		  ;;
               *) 
  		  AC_MSG_RESULT([unsupported (${kernel})])
-@@ -426,13 +426,13 @@ case "${host_os}" in
+@@ -428,13 +428,13 @@ case "${host_os}" in
       solaris2.11*)
          AC_MSG_RESULT([ok (${host_os})])
          VGCONF_OS="solaris"
@@ -95,7 +102,7 @@ index 8ab7f9b..9366dc7 100644
          ;;
  
       *) 
-@@ -1015,29 +1015,29 @@ AC_MSG_CHECKING([the glibc version])
+@@ -982,29 +982,29 @@ AC_MSG_CHECKING([the glibc version])
  case "${GLIBC_VERSION}" in
       2.2)
  	AC_MSG_RESULT(${GLIBC_VERSION} family)
@@ -135,7 +142,7 @@ index 8ab7f9b..9366dc7 100644
  	;;
       2.*)
  	AC_MSG_RESULT(${GLIBC_VERSION} family)
-@@ -1046,8 +1046,8 @@ case "${GLIBC_VERSION}" in
+@@ -1013,8 +1013,8 @@ case "${GLIBC_VERSION}" in
  	AC_DEFINE([GLIBC_MANDATORY_INDEX_AND_STRLEN_REDIRECT], 1,
  		  [Define to 1 if index() and strlen() have been optimized heavily (x86 glibc >= 2.12)])
  	DEFAULT_SUPP="glibc-2.X.supp ${DEFAULT_SUPP}"
@@ -146,7 +153,7 @@ index 8ab7f9b..9366dc7 100644
  	;;
       darwin)
  	AC_MSG_RESULT(Darwin)
-@@ -1057,7 +1057,7 @@ case "${GLIBC_VERSION}" in
+@@ -1024,7 +1024,7 @@ case "${GLIBC_VERSION}" in
       bionic)
  	AC_MSG_RESULT(Bionic)
  	AC_DEFINE([BIONIC_LIBC], 1, [Define to 1 if you're using Bionic])
@@ -155,7 +162,7 @@ index 8ab7f9b..9366dc7 100644
  	;;
       solaris)
  	AC_MSG_RESULT(Solaris)
-@@ -1079,11 +1079,11 @@ if test "$VGCONF_OS" != "solaris"; then
+@@ -1051,11 +1051,11 @@ if test "$VGCONF_OS" != "solaris"; then
      # attempt to detect whether such libraries are installed on the
      # build machine (or even if any X facilities are present); just
      # add the suppressions antidisirregardless.
@@ -171,5 +178,5 @@ index 8ab7f9b..9366dc7 100644
  
  
 -- 
-2.6.2
+2.13.2.3.g44cd85c14
 
diff --git a/meta/recipes-devtools/valgrind/valgrind_3.12.0.bb b/meta/recipes-devtools/valgrind/valgrind_3.13.0.bb
similarity index 92%
rename from meta/recipes-devtools/valgrind/valgrind_3.12.0.bb
rename to meta/recipes-devtools/valgrind/valgrind_3.13.0.bb
index a81adc31d67b..2f760d30359f 100644
--- a/meta/recipes-devtools/valgrind/valgrind_3.12.0.bb
+++ b/meta/recipes-devtools/valgrind/valgrind_3.13.0.bb
@@ -3,8 +3,8 @@ HOMEPAGE = "http://valgrind.org/"
 BUGTRACKER = "http://valgrind.org/support/bug_reports.html"
 LICENSE = "GPLv2 & GPLv2+ & BSD"
 LIC_FILES_CHKSUM = "file://COPYING;md5=b234ee4d69f5fce4486a80fdaf4a4263 \
-                    file://include/pub_tool_basics.h;beginline=1;endline=29;md5=ebb8e640ef633f940c425686c873f9fa \
-                    file://include/valgrind.h;beginline=1;endline=56;md5=4b5e24908e53016ea561c45f4234a327 \
+                    file://include/pub_tool_basics.h;beginline=6;endline=29;md5=d4de0407239381463cf01dd276d7c22e \
+                    file://include/valgrind.h;beginline=1;endline=56;md5=ad3b317f3286b6b704575d9efe6ca5df \
                     file://COPYING.DOCS;md5=24ea4c7092233849b4394699333b5c56"
 
 X11DEPENDS = "virtual/libx11"
@@ -12,7 +12,7 @@ DEPENDS = "${@bb.utils.contains('DISTRO_FEATURES', 'x11', '${X11DEPENDS}', '', d
            ${@bb.utils.contains('DISTRO_FEATURES', 'ptest', 'boost', '', d)} \
         "
 
-SRC_URI = "http://www.valgrind.org/downloads/valgrind-${PV}.tar.bz2 \
+SRC_URI = "ftp://sourceware.org/pub/valgrind/valgrind-${PV}.tar.bz2 \
            file://fixed-perl-path.patch \
            file://Added-support-for-PPC-instructions-mfatbu-mfatbl.patch \
            file://run-ptest \
@@ -32,11 +32,8 @@ SRC_URI = "http://www.valgrind.org/downloads/valgrind-${PV}.tar.bz2 \
            file://0005-tc20_verifywrap.c-Fake-__GLIBC_PREREQ-with-musl.patch \
            file://0006-pth_detached3.c-Dereference-pthread_t-before-adding-.patch \
            "
-SRC_URI_append_libc-musl = "\
-           file://0001-fix-build-for-musl-targets.patch \
-"
-SRC_URI[md5sum] = "6eb03c0c10ea917013a7622e483d61bb"
-SRC_URI[sha256sum] = "67ca4395b2527247780f36148b084f5743a68ab0c850cb43e4a5b4b012cf76a1"
+SRC_URI[md5sum] = "817dd08f1e8a66336b9ff206400a5369"
+SRC_URI[sha256sum] = "d76680ef03f00cd5e970bbdcd4e57fb1f6df7d2e2c071635ef2be74790190c3b"
 
 COMPATIBLE_HOST = '(i.86|x86_64|arm|aarch64|mips|powerpc|powerpc64).*-linux'
 
-- 
2.13.2.3.g44cd85c14.dirty


