Return-Path: <chunrong.guo@nxp.com>
X-Greylist: delayed 2704 seconds by postgrey-1.34 at layers.openembedded.org;
	Mon, 19 Jun 2017 08:46:39 UTC
Received: from NAM01-BN3-obe.outbound.protection.outlook.com
	(mail-bn3nam01on0110.outbound.protection.outlook.com [104.47.33.110])
	by mail.openembedded.org (Postfix) with ESMTP id CB1A271AB5
	for <openembedded-core@lists.openembedded.org>;
	Mon, 19 Jun 2017 08:46:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=freescale.onmicrosoft.com; s=selector1-freescale-onmicrosoft-com;
	h=From:Date:Subject:Message-ID:Content-Type:MIME-Version;
	bh=74Df6mQ8nZNGzmUfZ6YwAj/c55ELrMEP/QKoUHO9R20=;
	b=AfKtek/uuYru0eGzQHi+onUuisNc2VBYOFZ3NtJiE3FsxrAFuRC8Gv6Bk9VMC3673AbWULlISlpm2nLaUR+zWj7oAjPYxGjXZXH38iOOcLsjX4MRYJrK+jaMF607eAbrPMadnW8UFK+vmESB17vLANNji6kyDHLMNEZek3clnFU=
Received: from BN6PR03CA0041.namprd03.prod.outlook.com (10.175.124.27) by
	BN6PR03MB3171.namprd03.prod.outlook.com (10.174.233.10) with Microsoft
	SMTP Server (version=TLS1_2,
	cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id
	15.1.1178.14; Mon, 19 Jun 2017 08:32:28 +0000
Received: from BY2FFO11FD028.protection.gbl (2a01:111:f400:7c0c::137) by
	BN6PR03CA0041.outlook.office365.com (2603:10b6:404:10c::27) with
	Microsoft SMTP Server (version=TLS1_2,
	cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1178.14 via
	Frontend Transport; Mon, 19 Jun 2017 08:32:28 +0000
Authentication-Results: spf=neutral (sender IP is 192.88.168.50)
	smtp.mailfrom=freescale.com; nxp.com; dkim=none (message not signed)
	header.d=none; nxp.com; dmarc=none action=none header.from=freescale.com;
Received-SPF: Neutral (protection.outlook.com: 192.88.168.50 is neither
	permitted nor denied by domain of freescale.com)
Received: from tx30smr01.am.freescale.net (192.88.168.50) by
	BY2FFO11FD028.mail.protection.outlook.com (10.1.15.217) with Microsoft
	SMTP Server (version=TLS1_0,
	cipher=TLS_RSA_WITH_AES_256_CBC_SHA) id 15.1.1157.12
	via Frontend Transport; Mon, 19 Jun 2017 08:32:27 +0000
Received: from sun.ap.freescale.net (sun.ap.freescale.net [10.192.208.75])
	by tx30smr01.am.freescale.net (8.14.3/8.14.0) with ESMTP id
	v5J8WOHP028076; Mon, 19 Jun 2017 01:32:25 -0700
From: Chunrong Guo <B40290@freescale.com>
To: <openembedded-core@lists.openembedded.org>
Date: Mon, 19 Jun 2017 16:32:14 +0800
Message-ID: <1497861136-27345-1-git-send-email-B40290@freescale.com>
X-Mailer: git-send-email 1.9.0
X-EOPAttributedMessage: 0
X-MS-Office365-Filtering-HT: Tenant
X-Forefront-Antispam-Report: CIP:192.88.168.50; IPV:NLI; CTRY:US; EFV:NLI;
	SFV:NSPM;
	SFS:(10019020)(6009001)(39450400003)(39410400002)(39840400002)(39400400002)(39860400002)(39850400002)(2980300002)(199003)(189002)(9170700003)(42882006)(5003940100001)(53936002)(8936002)(50226002)(81166006)(8676002)(2906002)(6916009)(6666003)(105586002)(106466001)(305945005)(110136004)(107886003)(38730400002)(50986999)(47776003)(8656002)(4326008)(54906002)(2351001)(104016004)(36756003)(356003)(48376002)(77096006)(5660300001)(498600001)(189998001);
	DIR:OUT; SFP:1102; SCL:1; SRVR:BN6PR03MB3171;
	H:tx30smr01.am.freescale.net; FPR:; SPF:Neutral; MLV:sfv; A:1;
	MX:1; LANG:en; 
X-Microsoft-Exchange-Diagnostics: 1; BY2FFO11FD028;
	1:oFHtqm2JeI2oD4+HCvSl3XsnWBKI66jPCds/vd6/dH/GgGwJT2Q3nYY5tAoULzThb6DTURmmbxR3rUqTOJ/alyHR1F2tu7QWHqK3NlOvRysqDCTjd8SIEuXkJdoUou8GMcvpatjF9HLXEXhCRxMP6b8V1/prLDWTP/SPA1lLzEAO+PMqmLTsnuy49eagOpp0Ae+3I9RkZr1Z4tYWS2pxG/LAkvKGn9yKFSSoHUJypo0L8Qphc6zy75UETMzR+E2ZLOVQkcWtKf/KD7HPVggwf8JInQpv4ktslWzfFBncCoB5o4LP9gc5T0+qFyXTa/wSfzGqKM6Qdrq5LdriqPae5/ZsCuUVu377P2S5mlri04D92p625vr0y3sAokfwfK0NCLTVO8zhxDxirgyBq4S88aWCkfMBJVCBtusStLSbSVB4RFOtJjqa4O2okG0wPdhclLXnUskn/V6lNxyJN6X7oEELEisjwqm4pRvWTgO5lgFV2BP+B9MH7kSD9s7KPTsqe4Opxt5MvTjND3BZc27FaUncxvV0z6/I74kHwFb1+kY=
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: ea0f575b-adeb-41b0-d45b-08d4b6edb80b
X-Microsoft-Antispam: UriScan:; BCL:0; PCL:0;
	RULEID:(22001)(2017030254075)(201703131423075)(201703031133081);
	SRVR:BN6PR03MB3171; 
X-Microsoft-Exchange-Diagnostics: 1; BN6PR03MB3171;
	3:yHVWMXd9PykW6NHxDx+0pZvAJBW0aP1TeeyX626oqw5lg5a3Of1j6AmUD5J1R7r0LnDbCk3OoShYID+VANZYt3yUidhk+4nlSwWK9MEn+YYS04ve4BOHcPkBkhNutPKV15QGjgpOeRyCFEJAtJBYjMPq9P420YYEXegczxqwq5a6aNKjHo9Tv0euyxbdxJx15+68XB7+IiB2QYqGvqj+wlicoLKy9hwvZVAuqw3uDAkH4R4DYEfKnKytlvNdnJmk/+DR52P6N4rbg5cPSoR4sHjQDRqx3jxP9475FtNXJpK32QZEXQAGmmBKdAA0HqpJ9Fhog3F74Tj5fvpNnPqHmcZ48ZOcoDbUmtM+25Fb6rKZ8StLVpDx7f5kphoDOkPAz5dfWkAaIng4dhGg6vr8JPJqla7mc6uOspYiXBuPWzQD7ss/3uYuPr7IyAQsJHp9/KAZn24V5IZ2BinAYua1WA==
X-MS-TrafficTypeDiagnostic: BN6PR03MB3171:
X-Microsoft-Exchange-Diagnostics: 1; BN6PR03MB3171;
	25:OX7JXxlfJuPP7cZNtMpRjgtsXrHIolGuFlvwfxOzPbaAsMVuuf3wMS64KuK1SzHPYB1pJwCF6i1lsTSI9o/iw8uxwqDdXzZ215A/AXBvyM09GkaaR9q09mtgcLcWuy37/C7G348YOK/2NlBeBHOVoTyMOS5IBumgdAbwDHFncc4agOqepyxUrgO/jlfg1p4WRIUb7DtTeD/CK5cm8guZYIsYVeuL4sTArAmmO5FqvELb4GgJIFujJJIimJX6db+tZHd5iFdxyjoCI5essPCcWIuhK85LrIVN2jxbkPX/eJVQbzKZm1bSen9R1uudPmqHV5kGjohvF/zxGkwTQu2Y85VyP/MORiN+W4ca9MEFtMhcSTJyfpableBPr++hzk88symsXR6shmET8F+INT1hlMCbeK6JoFB8iBoB53QEmRUCHBHHP8CguYhr7PEZ4YfQNGKXvtsqp6l72pmN8OafS0YOd3DuJGoT3EaJF/jDa3M=;
	31:nrHOLsqPT7Wi3B3WztuYN4VlwN0/d27MQ/z1+GjdT2bVN9vP+ncKE0Ga5DwZQHdabiGA3plWsl/Sfab0CbhGX1m4IfQy+/gsuiuftKn5tPc20DSqEQIESF41ZoUPlio5LfYI5a6AYxOyBc4Kdj5LeYm6u+UEzNZQRCq8sFF67egXXhDdtzyGVLxU56Ltu6tpbN8AJC16Ed1H4I8h7mKD7jWCEZ8xhfLdZfcJDL28SIlX1avNcbPFbRhWcds/ZAZ6BE6wxKs3JC4+ioJfiTueUQ==
X-LD-Processed: 710a03f5-10f6-4d38-9ff4-a80b81da590d,ExtAddr
X-Microsoft-Exchange-Diagnostics: 1; BN6PR03MB3171;
	20:yuWs+Xa3G1kvxr21/yzdE9/X6OHdKmYO9mDyJpB/RhEEqWcd/r4eDjm2oBMgtBcuBCFJnm+CWpfRlqyDs/vFvo53uybNtpimM8saRIXDxvqZNZCVkqUi4HkcS93RYSmBM5vW26Pbu7Sonux1mkY+Ze/zsTtf+jp1Oop9/Z4NzsLwb++aogY+Uqz4UITBd8rnRTESUEpXEPF6goffy7tnamNihnqsG4vqY9Sbza6o1Byj3FAnxoI3yKclusbIS3DtQpppJrO8WQH2WSVI9ibEKwLm0SH3WmOi11T55zsN+2d0WmJBDpfGtq8EKzfNj+Su0LBdju9d1rzD1N84RGQU8bQlLN9n0CqUPq6kazmpVGY2sMXdFPugTXANeWo8EpnHClcvPrsM4ZIJCku+b1ZN2GflijlLchc0TTjxwcS0PUP1tbt9V+ShRA/aOXAb5ER1go21wbw8XU1ue3WpIRCX8tXZ4FDI2awsjnrsLxhU+ZKnInEFDKYWURm2zn/MygpkGfT2ZQtmzCghAgI0/7SBZQ8NxAu10megRTk4UTk7IzH2xwjKNAN/iazw3P5eHSKEtkeTen6IbGtuBAYjlKOahcHW406P2prMKRyZwF64i4w=
X-Microsoft-Antispam-PRVS: <BN6PR03MB3171C5EA12FFE6F607D23ACB84C40@BN6PR03MB3171.namprd03.prod.outlook.com>
X-Exchange-Antispam-Report-Test: UriScan:(101931422205132);
X-Exchange-Antispam-Report-CFA-Test: BCL:0; PCL:0;
	RULEID:(100000700101)(100105000095)(100000701101)(100105300095)(100000702101)(100105100095)(6040450)(601004)(2401047)(13018025)(8121501046)(13016025)(5005006)(100000703101)(100105400095)(10201501046)(93006095)(3002001)(6055026)(6041248)(20161123562025)(20161123555025)(201703131423075)(201702281528075)(201703061421075)(201703061750153)(20161123564025)(20161123558100)(20161123560025)(6072148)(100000704101)(100105200095)(100000705101)(100105500095);
	SRVR:BN6PR03MB3171; BCL:0; PCL:0;
	RULEID:(100000800101)(100110000095)(100000801101)(100110300095)(100000802101)(100110100095)(100000803101)(100110400095)(100000804101)(100110200095)(100000805101)(100110500095);
	SRVR:BN6PR03MB3171; 
X-Microsoft-Exchange-Diagnostics: =?us-ascii?Q?1; BN6PR03MB3171;
	4:EKwzi8wSSRmVxic5ooSAZV08AujauWGkgr8x/4y76X?=
	=?us-ascii?Q?piZEycqal0zh9+/ryjIh7fDCGxxEs3CKqvgtSTxvi3wewbkWWRmBYQilvmHX?=
	=?us-ascii?Q?yzAYQ3mx4/dMUoth7DdaojAupZdC5AD3xcW89hfudZM36NijxsGTLa6LCCiB?=
	=?us-ascii?Q?8+hSjhq9iKXEPAEV7F8/Hcxi9oQtmscatKO50WfTS+OUc8PAkWyUSymKcTPS?=
	=?us-ascii?Q?EEO64SEG/QfRuj/iTK78jrvXsr0npzqmkByC1CUzNls10w7IlDHqGog7X8G1?=
	=?us-ascii?Q?WBMc/HllwniAs2HGICSyI/iiEjWI48DljzUi79WRxfz/4xvdP9YHK5uyA+Wl?=
	=?us-ascii?Q?vdjk4WyXrIt4ALdArPKZb36Ld8uu0kq8sOJoZxFT2f/WoCj0w9mFA5gdA4oE?=
	=?us-ascii?Q?gxctYj5Cu2Y0VhGYBQCr1LfGS1X2j9eF784Y9IevMj81csdhJqufOq0XxVfR?=
	=?us-ascii?Q?W7AaFHLm3vkVH6cOVqgjdoJVcOP2BkeMTXC5sSu7ULszE9qU2cDIot07XtIm?=
	=?us-ascii?Q?CfFuC29fWI3RtWo+/28C65uT6rSt5aWDM9B2sa13XQez+5DWb9aVJH4VIq25?=
	=?us-ascii?Q?iSLXn7/pQMnC9ZXcM9+7L7lgKKrfgjE3/55ZXbue2Ma1YEVpW23nFoTj4iTU?=
	=?us-ascii?Q?HzosNZcekZrTq6xAdTIf8F478vrm4k9ezh8ZPaESW6X9bjEwRi7q5wgslYTm?=
	=?us-ascii?Q?8uijtfhtj83vBHwComyD3wqoCoRcrIRJQGNOtsFEz9GxtDAlyOnjy5g582En?=
	=?us-ascii?Q?Wj+muT0GbZVPPYHOf5+7qH1ANDz7xANlr3HZwEaXNGdDxCVwMjm8VPv0w0M2?=
	=?us-ascii?Q?rlGIHnM15nJin4Nx+GulPBqnNl6qJrAz0Bkm8RNX51NSg/Olfq0E1S5H7BPq?=
	=?us-ascii?Q?1wjuH6FJ5sHyXISCNif6s8tRcvODhwOoqF9UcSv8fKojkiB1jDo1/rvG3tc7?=
	=?us-ascii?Q?6YXEcjaL32xsBCEoh98ZWpP8lwKAHlpFuzKtg9LYmRHw9demQx0XGJDD0L4E?=
	=?us-ascii?Q?EaYE7UCgZQEF6cr0Luqs4nc10gtE4LtQ8eS4/DbZjemPM+BkG9kxgWN63zAo?=
	=?us-ascii?Q?JWcmJXwh+MwZnKBYSQOQFnQt9er59is4yA089GkaIa4jyHzx/4Fz1tmq3JeK?=
	=?us-ascii?Q?hD41aAgTV3Rzo459XrpYUYY7dbWrGZTE7mNWOsj5/TXTjG5tYT+CfILF8KSo?=
	=?us-ascii?Q?JlDQs/YcGvnzyAqAag1kPvFNgl9UxyvW8jE6eHVclVlXkPwmRLiJW7gA=3D?=
	=?us-ascii?Q?=3D?=
X-Forefront-PRVS: 0343AC1D30
X-Microsoft-Exchange-Diagnostics: =?us-ascii?Q?1; BN6PR03MB3171;
	23:4C60DnrI8NPhaf8ruLwct8Q+owXPhsIBOMrru+7Pa?=
	=?us-ascii?Q?JluJAzKQ9iYlerCqznFVxeX5t2EK5RpTnkrlJ1mYRmz3hwjWwQVnAfihqpfk?=
	=?us-ascii?Q?lhmGw3xzDQO7EQBQKHwcKZEh+XIs5bvXTU/cr5xCGwc5x7aiC6BXc8mapn2E?=
	=?us-ascii?Q?/2I6Mjch1I3A62h7FAhuAop/ZtRgoh2R6CDTFTh5Iw92hyP8rk8g8B7G0OND?=
	=?us-ascii?Q?DXq6NJ/iuIKvkEAzYrGSjutbS6YWAlS0DsbyZFVeAYXCqCGp6nsOI/DnVQKj?=
	=?us-ascii?Q?EZIp3fjv3gkCmDseOJ0RRTvyDz+EBfV6rWxbZxMPjzor+BrHejphX4u0eslS?=
	=?us-ascii?Q?OUOK1/S5PMnQctNGHZ1dM53mcFZzYUzWIRyFuwP9E0D2PE0ri8dUnQlqQ+UU?=
	=?us-ascii?Q?+6X7uxV6wbtD6O5vOLXWjeQWk24OhmJr1UPgfnp9Xg3jLmIsh/hP3j7pHRSs?=
	=?us-ascii?Q?3ONckITOzulkGyusB7X8LauEKZrRYkPH2FzQFD7HkO4ovHs4YTjWgtJLMj0T?=
	=?us-ascii?Q?4BOpr/g50gEdj3oyAyS1+SUToW/33wmDg5B44VJPQ+iPxdYQgyMqEmYebslc?=
	=?us-ascii?Q?+UA2sphZJvGTbWr6eK1AZePHzdutJEwM8fzMjS9ZhEVX3ZgDRJaTf8nzV+Hv?=
	=?us-ascii?Q?Q0Hx4uurdInZKVbAsZUdMzlYtd9kb9B3RK+xh9Hqxn6yUAT6qTvHDIHFnHXD?=
	=?us-ascii?Q?ug3/R05NO3bMbheo6GNeJrl6ZOAsewK4OiBAHZrFKujeEXbl5MUp6taJ3kt+?=
	=?us-ascii?Q?dKrT52IzKVMdpneMKFhOkZ6H30uRr0HvCQOggtpRLWJ0BWw3JNaSyGdUyNxZ?=
	=?us-ascii?Q?nsGZqL1wKZCFaQEyCx/Y/lMItncsM4atIO5O0M1oaMvdUqwZ364Ig+0yAHnG?=
	=?us-ascii?Q?U2wh+FPUVtEoMpyVBmFrm7Ywa/G8bDhwFNsgfkCeom1alnEIs3aYYc5hGpGw?=
	=?us-ascii?Q?QZQP6PbqiDKMP9faKjeJou0u9iVK9e5ZxV/7cTa7q0sSCDvTdCxlCEgwIIpC?=
	=?us-ascii?Q?RnBcl7UinSriyoi6SJ3ObbbNxaR2B0WUumSUjPTNp6awFOF9c2VSTPamlZr1?=
	=?us-ascii?Q?7+JFaQ=3D?=
X-Microsoft-Exchange-Diagnostics: =?us-ascii?Q?1; BN6PR03MB3171;
	6:3SecVDgTaRLR4D97h3t/6tlYoJj+Wt8S6hzT1Xbr/5?=
	=?us-ascii?Q?Z33Djvf1IohjqNFfW6dmozSPQo2Mt6EVtmY6ns+vLc+tT/yM6GIpS3PsRzqD?=
	=?us-ascii?Q?coqTo8YcP/hhIl0Y93nWWEVjrR83dMw0h4dXVl5VKz1MzA8ngDbO1AdFAIrV?=
	=?us-ascii?Q?7rrRQcmjdx+AWsUVk0afPcYq6aU5xx4qrk0347OXrutOMspSnHAV6XEjWnZd?=
	=?us-ascii?Q?dNLkYKpgOSjqhVWwNtMErl8z9s7RNHRekiciSgagf34gyvqLYUCpVvLcqTRD?=
	=?us-ascii?Q?SEJGmRKVCDEqmQGLyz9L/F/j1X+fdZhFMaW68Pj6fx2jbwUqlp91/WsTV6vC?=
	=?us-ascii?Q?g4o1JkEeM93xNoljlagfdlnzQXaEynv+26cKvHNtWUxZNt3FszRpQCTj5Zes?=
	=?us-ascii?Q?q0mabgItQa1TLaFBj65L8OO9/paPp3g6Pmhi571cbz66h1EXURITkdkoBWtQ?=
	=?us-ascii?Q?wDNTKaH8rVVLa6L0Iv7T4/J1Y2mtNj6E8pCdgoIkKDRtuDEH+8PeUKHgRCv2?=
	=?us-ascii?Q?eGI6gTPLp1zzBg5Uxu+c5Khw4E8J+PBhbEcpfU3WFYzQ1/JM9V9TXbah98uI?=
	=?us-ascii?Q?pFdYnen0hmVL4VpuiulQm6waOWK10i+b5T1pkMxQPHVBQDPtjy4W8/rjmlo9?=
	=?us-ascii?Q?4yo32EwSZUCq5Q8Kg2vGU70sNUwBf1Phoc2IAy3XEBCIUixAQYPsWx5IDCBJ?=
	=?us-ascii?Q?+nTOXPpH2oVBasorOn3vkkaT0UwDyo+KXkcLScXvNpJb7sCHvpOACOgXQcRu?=
	=?us-ascii?Q?VT30o6bvIIPm57eaXuTwiDik9iHQxp0vFe9mHs46VTf1mw09Xk8o4bXgpORq?=
	=?us-ascii?Q?DCYvWEKeSsl7dzVlYk6SzOU0KfRnt0rMxb1FArY/kwhCNceEHp6apGBTeTsM?=
	=?us-ascii?Q?YJv+PlvS0CfQcil4C8eSsijgHj3jlKNn7+tpq1cMtsDWJspl1+vW6Bgmhg95?=
	=?us-ascii?Q?VG/vdVsxVvgPTMDmq2SjsfkTpR4CGVgi9sSOEsecAy9AX48dOGgVcHjchgtt?=
	=?us-ascii?Q?uZSRJWaGWNhf5lmiYQpcCnwfARlbz20VOXApC5/22ADWACJQ2e7HxNqQKg0L?=
	=?us-ascii?Q?A+7FM=3D?=
X-Microsoft-Exchange-Diagnostics: 1; BN6PR03MB3171;
	5:8GqXcfpaGXGRKnOGSHeml9W7eZ3Sc4hasW7PSYC2fM1RYh4sMkJMCUbIpHlPeo1LYYz3DBQN9Ik8dD6JVKmJ/B0ILtRiZ0bL2Ztr5c4FU8sCwGkmQgseZ7IlXn4osfU8zc8ZSS8qsxmtRatRve/wldZEP5DqEL3cQwv89pjvdNq+qCAYsq7s1Ln90dtTXLVf36RMEhHFvmH2PGMMlp3wMYePc5z5LD8KgcwdWLiueANj3MNeWt3WM1NFLAVzApglMu1NtvTcoz4s/03FQ7RV9rdnuk8EzrI3f2WiSJho5NcxSWluuBawRlNryEkfCruecpbOG/08GojMVedkq19aypACM1wzRu45b+jJOT2O/Hm9VhH25327jENU65k2ARYYJ7zzfRJh0eIUYZ/QOk9fuURsbHEvANqc8HuoEsK4RDiR+X2ASxJXIoaO9Zev1/mSdKN6pr8WDheMrOQg96aCrMEsxYHPIGJPXRbxMUdn7Gq0kzm7CQeEt52qf8+1NYMD;
	24:jOBqC5jXSENI5jW8mnE/Nwjl+DAiWn+3GtgWQHZB2tCxmMB+Qbappz1fcQvjVyLwe7jGlDbGiI+7Ts9c+EScMcB8p6wEPwmhCx9R1PjkGTs=
SpamDiagnosticOutput: 1:99
SpamDiagnosticMetadata: NSPM
X-Microsoft-Exchange-Diagnostics: 1; BN6PR03MB3171;
	7:3EHUP43qcyxGyf6cuniDH6FqIKrxidJrdD3yxBLUUBEH85qXLgfHlAo7WJkvQeeFpUyxwpj4JrY/bl/3iUMlveqYPi7Aa9/WakfzT2eXeCriRMGq6NHq33ePLJELnpbk0z82NaH/pQzAZVEdS++OgxeDmkQQ+plwse3CMaeXWS4V8p3kG+NdZEUDptDRJPdlccSYNEL6OniBO+9Vpzq0sZDx2ACYgpIZeo6u1KWGLRFj0IyJkMAifv3lNSk2mMN8DoDUptajmi6WY4ruJFdYvrNmCwMTvEC12gt/iTHuLsynrsLSawhZtJX2dkqSkDugF4kbUjrlpi6K9eceoHa23Z/IuZdYrY2g6zR5Ysq+VBZOc9zgkxLMrkMemJxhEx4FvGU+CJs3ptlnVNMO9TXto54Ef8xZVHHHGIDpIHAHOTu+pu6cqmibeb6kBDMp4UyHIUuzZ25wZUKX4EZufkMQRStiBhOCbQQVWyLcWuXRT9+c2apSSYyc+8bxWoIXkB/n2fQjanDggs9EcAoExV4xQ0gjVeYE1SDE+ZU57q61J5bojYbzrWYiQYhrPDUnfvyYuiRM+4Kpl4wbdSpmCPE9sLIuqVb6nVVlLETF+1fnEtI09HewjvkmfQh3627uDjTlWHP/eTUsan2m4DaGbjxvZtokFmKNlTI0D2Dq3tJJntMk8l40K7uuAioa5rWyLlSiS1ZX2mTdYeRPBBa/Eb3Isj3UWlM+1P4HxQ9mcaJvK8B/n/2EUwL2Ao5hELzh8wPQ+ZgozDuQhpPx6+KiFudid3wxMGWW5jPlrC/KkTjEdCE=
X-OriginatorOrg: freescale.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 19 Jun 2017 08:32:27.5497 (UTC)
X-MS-Exchange-CrossTenant-Id: 710a03f5-10f6-4d38-9ff4-a80b81da590d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=710a03f5-10f6-4d38-9ff4-a80b81da590d;
	Ip=[192.88.168.50]; Helo=[tx30smr01.am.freescale.net]
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BN6PR03MB3171
Cc: chunrong.guo@nxp.com
Subject: [PATCH v3 1/3] kernel-fitimage: Support ext2.gz filesystems
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
X-List-Received-Date: Mon, 19 Jun 2017 08:46:40 -0000
Content-Type: text/plain

Signed-off-by: Chunrong Guo <B40290@freescale.com>
---
 meta/classes/kernel-fitimage.bbclass | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta/classes/kernel-fitimage.bbclass b/meta/classes/kernel-fitimage.bbclass
index 2630b47..f40fbf3 100644
--- a/meta/classes/kernel-fitimage.bbclass
+++ b/meta/classes/kernel-fitimage.bbclass
@@ -369,7 +369,7 @@ fitimage_assemble() {
 	#
 	if [ "x${ramdiskcount}" = "x1" ] ; then
 		# Find and use the first initramfs image archive type we find
-		for img in cpio.lz4 cpio.lzo cpio.lzma cpio.xz cpio.gz cpio; do
+		for img in cpio.lz4 cpio.lzo cpio.lzma cpio.xz cpio.gz ext2.gz cpio; do
 			initramfs_path="${DEPLOY_DIR_IMAGE}/${INITRAMFS_IMAGE_NAME}.${img}"
 			echo "Using $initramfs_path"
 			if [ -e "${initramfs_path}" ]; then
-- 
1.9.0


