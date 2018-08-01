Return-Path: <alejandr@xilinx.com>
Received: from NAM01-BN3-obe.outbound.protection.outlook.com
	(mail-bn3nam01on0061.outbound.protection.outlook.com [104.47.33.61])
	by mail.openembedded.org (Postfix) with ESMTP id 6135875260
	for <openembedded-core@lists.openembedded.org>;
	Thu,  2 Aug 2018 02:03:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=xilinx.onmicrosoft.com; s=selector1-xilinx-com;
	h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
	bh=hfDBL6K+rfTZ0J3L1dhAfay7J8DoE3jg1Ff6foddpsc=;
	b=C173GLQEtFzo9XZRLQvse+7ZznlJ0j0YDcRP3dCOUgN8ttZTtl+jFzyZ0BIFMQKh0hOUzdH7oEEKuYHlah43FSUM7gV7MjshYuLC7A3+Mw+dRpizFgDp9ySJAEKN97xsrYnr7nM6re/E5GbXN6GUH9xU3Ene5pPDV5O2f5GW/ss=
Received: from BN6PR02CA0036.namprd02.prod.outlook.com (2603:10b6:404:5f::22)
	by SN6PR02MB4462.namprd02.prod.outlook.com (2603:10b6:805:a8::12)
	with Microsoft SMTP Server (version=TLS1_2,
	cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.1017.15;
	Wed, 1 Aug 2018 23:30:29 +0000
Received: from BL2NAM02FT023.eop-nam02.prod.protection.outlook.com
	(2a01:111:f400:7e46::203) by BN6PR02CA0036.outlook.office365.com
	(2603:10b6:404:5f::22) with Microsoft SMTP Server (version=TLS1_2,
	cipher=TLS_ECDHE_RSA_WITH_AES_256_CBC_SHA384) id 15.20.1017.15 via
	Frontend Transport; Wed, 1 Aug 2018 23:30:28 +0000
Received-SPF: Pass (protection.outlook.com: domain of xilinx.com designates
	149.199.60.83 as permitted sender) receiver=protection.outlook.com;
	client-ip=149.199.60.83; helo=xsj-pvapsmtpgw01;
Received: from xsj-pvapsmtpgw01 (149.199.60.83) by
	BL2NAM02FT023.mail.protection.outlook.com (10.152.77.72) with Microsoft
	SMTP Server (version=TLS1_0,
	cipher=TLS_RSA_WITH_AES_256_CBC_SHA) id 15.20.1038.3
	via Frontend Transport; Wed, 1 Aug 2018 23:30:27 +0000
Received: from unknown-38-66.xilinx.com ([149.199.38.66] helo=xsj-pvapsmtp01)
	by xsj-pvapsmtpgw01 with esmtp (Exim 4.63)
	(envelope-from <alejandro.enedino.hernandez-samaniego@xilinx.com>)
	id 1fl0ZX-0004k3-1S for openembedded-core@lists.openembedded.org;
	Wed, 01 Aug 2018 16:30:27 -0700
Received: from localhost ([127.0.0.1] helo=xsj-pvapsmtp01)
	by xsj-pvapsmtp01 with esmtp (Exim 4.63)
	(envelope-from <alejandro.enedino.hernandez-samaniego@xilinx.com>)
	id 1fl0ZR-00022i-RJ for openembedded-core@lists.openembedded.org;
	Wed, 01 Aug 2018 16:30:21 -0700
Received: from [172.19.2.8] by xsj-pvapsmtp01 with esmtp (Exim 4.63)
	(envelope-from <alejandr@xilinx.com>) id 1fl0ZR-00022P-Bz
	for openembedded-core@lists.openembedded.org;
	Wed, 01 Aug 2018 16:30:21 -0700
To: <openembedded-core@lists.openembedded.org>
References: <1532985713-15283-1-git-send-email-jaewon.lee@xilinx.com>
	<ab3cf6da-5f2a-ef98-92ca-8aaa3721df7f@intel.com>
From: Alejandro Enedino Hernandez Samaniego
	<alejandro.enedino.hernandez-samaniego@xilinx.com>
Message-ID: <12364d4c-2863-18da-1d8f-f74a80683447@xilinx.com>
Date: Wed, 1 Aug 2018 16:30:21 -0700
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:52.0) Gecko/20100101
	Thunderbird/52.1.1
MIME-Version: 1.0
In-Reply-To: <ab3cf6da-5f2a-ef98-92ca-8aaa3721df7f@intel.com>
X-TM-AS-Product-Ver: IMSS-7.1.0.1224-8.2.0.1013-23620.005
X-TM-AS-User-Approved-Sender: Yes;Yes
X-EOPAttributedMessage: 0
X-MS-Office365-Filtering-HT: Tenant
X-Forefront-Antispam-Report: CIP:149.199.60.83; IPV:NLI; CTRY:US; EFV:NLI;
	SFV:NSPM;
	SFS:(10009020)(39860400002)(136003)(346002)(376002)(396003)(2980300002)(438002)(189003)(199004)(36756003)(14444005)(2906002)(5660300001)(6246003)(58126008)(2351001)(64126003)(106466001)(31686004)(316002)(31696002)(478600001)(65826007)(106002)(305945005)(6346003)(77096007)(26005)(186003)(47776003)(53546011)(65806001)(65956001)(76176011)(229853002)(230700001)(81156014)(9786002)(8936002)(50466002)(8676002)(2616005)(81166006)(446003)(6916009)(426003)(356003)(126002)(476003)(67846002)(11346002)(486006)(23676004)(336012)(2486003)(107986001);
	DIR:OUT; SFP:1101; SCL:1; SRVR:SN6PR02MB4462; H:xsj-pvapsmtpgw01;
	FPR:; SPF:Pass; LANG:en; PTR:unknown-60-83.xilinx.com; MX:1; A:1;
X-Microsoft-Exchange-Diagnostics: 1; BL2NAM02FT023;
	1:89YFc5rxszGpzRfRxJjE6jj74qk8YVnoYBIAp0RJgrFdAjJ1Q6MZRVe/EIqiMirXN56MP5BS1YFAwIawQhbdo6+963q3Nwk7quljUQuv2KU6ydyNco5BYVXCnt0IbsXa
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: e068743e-4dcc-4b18-d8fe-08d5f806c3ff
X-Microsoft-Antispam: BCL:0; PCL:0;
	RULEID:(7020095)(4652040)(8989117)(5600074)(711020)(4608076)(4534165)(4627221)(201703031133081)(201702281549075)(8990107)(2017052603328)(7153060);
	SRVR:SN6PR02MB4462; 
X-Microsoft-Exchange-Diagnostics: 1; SN6PR02MB4462;
	3:pf7KLSv87Cdh3nZsHs9kH43YpeJp8TeqB1Q5xk5yLkGbl+dDlqwwTEIBGt3sEPMXL07hyZcy4P2kG4o8bj6CMevIRL9nsT4GtUEP0WKd3BIHxvAHbiK7CjOxtlN2vK99V3o7ax5NM2PV8rpULxnOqgan5GVOqnbrXN55rK2LlHQrgpjhWQxJLPIP5rn6p/SO/60EbTXCNrpg58l+7lYTa1ogkG/59Oa1RcJG/WfOgCKWwwSHhwXLMapSF7G6Vy0C/qH65AaZwD3EVbqERs0zM4vpZl6kbD1YqvOS1ZiXRl6jmyqxlF8V6DrU/T1yE9CkUDoQoAQBp0Wtp/nqhsBdo4OQqytnhvAK7HcLQUS83o0=;
	25:3aX8FpWUeGwe05TT+3Jdmq0azanIx2nNkslpXU6TNxbFKZI/oUsU1DZhDYyuM5FbZoE2DIPe8uTxopJ1Brtr5OfitQq2h4R9YI9282ZmvQbKJZAkyWs/JDP6EV6Ijay9CW4wxpzbZYzGKRYrn046U6m5PbiEEdxpLyb68XgQsnIOWpDnLuii8Uzw6fG/7gPiVTR1pzGy0E+uxsG97xj/eyK6D89pCnvI+vcZqk2x+QW+F9VzfVNvJQBMYVFCuX8BwJtuT1YFson7+ZtrRQfLBLIfq8RKM5wtdp97mM7wviKBLfpZtSuiuNnqgNbyV+F4ZLBy35kObTnlxhvm7T9hyA==
X-MS-TrafficTypeDiagnostic: SN6PR02MB4462:
X-Microsoft-Exchange-Diagnostics: 1; SN6PR02MB4462;
	31:p1BhI+zPKrjPQXeaR88D1Hz886o19KuAGByZNNnyZIArtw91WX6nqngWKH8KQOQn1JTRB+e5opBV0LR0IZ/9FGa5lK8WeTO8R0S9bxLkDRGig382I0b67JEAj9Gcye3wpVnbYoiKxmwkK/X3It01RNt9HYcro/Mb6hVceKB19u7OGpBQR/Erm05W5Xmwf/LOekZsq2ehbOsgxgHCSue49GKs7UW7+J6YrHz/e/Vj1Ac=;
	20:Ncp3FLdS9oKG/QvCyh7p+c2CKEQQQxPSZjCxAfAtds3Opl9p8hQIy2lUYumt87/9vstEL00mvgWvbSFMS6yth59TUh4mhLzzE3lc5xd4QDoO5tAxLvVI74pR21r6lGNPPWVgrHkbvPSVvCvUSUgdzU5gRo5XnF8rKFna5D7lc7BU+YB46wMl/y0wcu/GIZXUBBueOzgSnpu7hmYMulWhTEzTATwcbR4m6KAvj1bO1yh64LQ7iVToDDRAtPMJFBtBSERo8NhDD2DFCkiVRcIg2/1sjaoPNoBYM+KaTMnltNE2sLKcsrTTt2W32fmWHTan4hBMrjzriRXeGQ/Wx//0o1Hx5IXOCwtBpDXrlDzSG+r0RJWA56Og8zt8+rAu+o/M2QSPN/yHr3HEliitL9kSNH4LA66v5Rd6i+IAYu7qZQ+4rBwG2VnoTB/GeFRm6OF9gh1i+mY41+L1xKpXosMdkBeg4r7QZ3n/0XfWrKh2SUzNbiTkcJ2FRSulnLRm2frn
X-Auto-Response-Suppress: DR, RN, NRN, OOF, AutoReply
X-Microsoft-Antispam-PRVS: <SN6PR02MB44622F1F385C57A41600611CAC2D0@SN6PR02MB4462.namprd02.prod.outlook.com>
X-Exchange-Antispam-Report-Test: UriScan:(192813158149592);
X-MS-Exchange-SenderADCheck: 1
X-Exchange-Antispam-Report-CFA-Test: BCL:0; PCL:0;
	RULEID:(8211001083)(6040522)(2401047)(8121501046)(5005006)(3231311)(944501410)(52105095)(93006095)(93004095)(10201501046)(3002001)(6055026)(149027)(150027)(6041310)(20161123562045)(20161123564045)(20161123560045)(201703131423095)(201702281528075)(20161123555045)(201703061421075)(201703061406153)(20161123558120)(6072148)(201708071742011)(7699016);
	SRVR:SN6PR02MB4462; BCL:0; PCL:0; RULEID:; SRVR:SN6PR02MB4462; 
X-Microsoft-Exchange-Diagnostics: 1; SN6PR02MB4462;
	4:cOpDMaYsBdUPisoSNBjNLiPjKWIGZi+B1H1bjHyRc46qLQBBOIu388XlClpO+9Iv16mLjyX6X4DnfOTOcR7qoXpGAZWc3BlUdWmaYQuLPwsbAO9WsIssk6RZj+vsPsy6fHCgsBM+1hBQ07OyN97/FRwBsj18u6CaZve+/69wez5Gq3xo/Ye+Lb7qp9K7p0xgnIwgSmITDiFZ8iMNBMiu7BBzp0pWqnv6PFlJjAKww4tLYdpy2etl8Hl4I0eo4N5c7t6lVHbpKhHo1oGVgRKDmdviVtysISO0uevIAazz4HL5Zu40nR3jTO+OMvyGAWoq
X-Forefront-PRVS: 0751474A44
X-Microsoft-Exchange-Diagnostics: =?utf-8?B?MTtTTjZQUjAyTUI0NDYyOzIzOmVCcnA0aFpKZ0ZZR3loZ3orREJMc3lRSFNU?=
	=?utf-8?B?bGZ5amMyMDVxaWNySGdVSk15Ni95S2F3eDNvMlRJNVc5WmRkVkxqNkl6T1N6?=
	=?utf-8?B?aG44cEUxd2VxOXJFU01LNEcrTWwrdURjQVNjdDV4ZysrRVNmUHc0cjh1K1E3?=
	=?utf-8?B?UWtUTHZBbUJqOGlPeGdUamtEc25oUkRtWTNKS21MYWpZNEJ2NkRMOXc4dDZR?=
	=?utf-8?B?dlB3SHVmdmVpSi9hN2M3bTNUcEc0aUtxdW5OdzE4ODVWUnpmTHBET3Z4ZXJU?=
	=?utf-8?B?cW9aNzhVMitsUHdoOThxRndvc1RvTEd0Q1c1bHJ3TWpLcU9WWFArbEdsMDVp?=
	=?utf-8?B?eS80c0p2RVh5ekxucndoQy82RC9tNGNhaURLVTQ0MEpQcDR0Ly9FL2ZXUnI2?=
	=?utf-8?B?RUhvcStheWc0a2x3MHh5QndYL3h5QXdxdzhBWUx3c3hTaDF2QldNcXRtekln?=
	=?utf-8?B?K3pQcHRhWjROa3pTb2had3ZwMytIRlFMWksrY0FXeVV5djgxcG1DRTJiNGdl?=
	=?utf-8?B?WTlpTzY0a2FLODFNT3ZsYU1RNjFsN0pjVVZCMDBURHI1TzRjM2FDS1YyUDdI?=
	=?utf-8?B?cWUzZUtFRU9nZHdQd2FsLzczV3ROUk02RjhWbGhSRzdHYkVjRkJLUlhERncv?=
	=?utf-8?B?TkVtcW5Bdnk1L28zbFdzdExRalZqRWQvU0R1NGxXZzhyVDc5SWxqVGxnb1B2?=
	=?utf-8?B?Qkw3YmY0TjBxQ0FhTU54U0g4cWNGSW1mQWtWd0lVVWk2c0k1WGgwUStqaTBu?=
	=?utf-8?B?ZVdmTE5Kd1JDZTFPK0R5TkN3ejJsN09lWXZtTXhEQlFaMGRYVDVOdzFMb2N0?=
	=?utf-8?B?V08vU3FudE44UjJTUFBkUGdQWHdLUnA2MWdQTUt1RG54UGQ3Z2VRY3p6akRs?=
	=?utf-8?B?dk0yalBpRSt1ZkRCT0pYWEozUkFvVFJUTVBaVDlxSUVWa2xXRFIrMzBJZEV1?=
	=?utf-8?B?VzJJVHRoUFpMNCt4bVZVWTIvN2lJY0YvK0FPS3oyd0VnVWV6KzFmRFBFZGtS?=
	=?utf-8?B?SUViZXZ4SkdaSVZDbEwrM05jbjFaMmhEZnJZRTFKMStBVjdFUzlnVkQzSlBn?=
	=?utf-8?B?N2RKVHdoR0FEakZ5MGQrMVpMS0V5KzFhMGcyRnZiVmY1ZkVtV29ZVmFVSVhT?=
	=?utf-8?B?YzhwWkt5S3dPcE9rMWZsSXB5R2Jhb2dVNlZ0UjNSUlltbjY1bWorVFQrVExv?=
	=?utf-8?B?MDVXMFlwSVFBNHptQmNLMGEydlhycWtMa3lrUDd0VDJFWEw2UkhhS1ZOdk8v?=
	=?utf-8?B?T3dSZ3hrdm9uWkVqRWpZWlRXOUh0c0IyYXdDSzlpUVA2MG1yeHVDdkJRWkhM?=
	=?utf-8?B?YnVLMHNCQkhUazQvcDB3aTM5R0xKRFhVdVFvRlcxMURidi9NRDhNTkMwaVNN?=
	=?utf-8?B?b1VvU2h0aVovdHpSeUxDOGJ6YlJBT1RvbUJHaGs2TUZReXEra0o0d2FuSEpz?=
	=?utf-8?B?SnA3aERIZ1NtVEFIMFV3ajFzUFBoWG16N01MMHI1M3BFV2NYeUY0TC9TVkN0?=
	=?utf-8?B?WTg1RTAxejViUHZEQlJ1dEo3ckdXc2xvbmhBL0NDamQ2UmZOeGd5RFdJOWNZ?=
	=?utf-8?B?bDVFQXMxYnpQZ0JrTHlTSDQ4Mm9WTzV3Wit6aXN6VGRDeVNWa0tBeU9jMDlN?=
	=?utf-8?B?WHJ3cmRYMkRrOW5MYTgyWmcrbmZ0NkJ5U1RRRUZMSG51eER2d3R2Szd3PT0=?=
X-Microsoft-Antispam-Message-Info: CgSaJGO9OhLOovaCJb3+F0r8HMe07DUWFyiuyqUwXdpEkSThSn4JSkVWVKY/RbhS7So8iW9OkeXy3XHQhYXF/lv1gTvlTJW1a8Fr2k1FPQzNaCencvj+Do3Y/w2wPDH5ImjOZ1Pp5FCWvM0CuScePQ39DLzFVZ6Izauft1SN19+yB4keiwYlHpfvvVckOvpp+jFmZ6ox6eMPS1KXBtlWuy7Ddz5LZMTzBG9yw5NthXTV2cRUYiMGVKNR07+XSs2WKEusC1D7dxml9U9YGTW959/n+ByUsypJBgH6Wv+aToV63bsPKTOO+8vVn6pRUnwMmjaDytmyISStQKHA5q4EV7XWmdFZdGzIdJSId/Iy/WA=
X-Microsoft-Exchange-Diagnostics: 1; SN6PR02MB4462;
	6:cb7Zvpufjk0FwQAZhlvKhPvZGMSEfqVcq5mHyKJCjjml72dcxqKAbbyA8uuuJlUoZMrt+NlJY9WfXuWE/o3tJjr8sIe4bmDGTlXdM4iHLHgPtgRfmrugJwX4V5YjNG6Ofic+v/7YGpWK9R4OG6kivttOOb70HCCaLfEfM4NHOskXun0+GodOCZEmuTGtgVXpAuXoVzijmLWtr/eBTfgheOiYp/Hi2bZy4oW5pgUAcHNgrqRFxPV0xnXJphYdwZd4H2iOHdU++eWEQ7FxrqVS1VOniU6sRrM9jHeRBYOePd5iMH+b3tKB5VcIpNMuYL52jRhTXV4l4aeYoDt8z+l0lo5IqKRK8v2thgoehzpb0U42fsgPIx8SndvJpIt2AWMeICf/TLC/10TaM+T3q2lDlUJBjavdYaXH1S4eRugK/DBEidJxcwpUl/DvK0w99Hf1YinB2AkT15AY3EB1NHfyNw==;
	5:KMmfw9paTRkBa2TDdbZ8ar0z48jPk394Hfad++56g6DSTU7dMi7TD+ud7CIHhcamvIj+qJqfETAcyJkYHVQnQqtrrTFKxbqsCnMr5+qqdOlnMCrMI34E4sRvwFEmPVYSb6jNY9pmyiZANc7xMj+RuZt/i+4HAtOwB9IbPPDxJl8=;
	7:V9BvmJBFaflSyFVp69LlYb9ahOhBI/G5aneFLWBGlVkm6miuI48gSnh0Fk9WPFT1tuQnzSyF7cXeSQFBo3P8+GtlrJ8sCd381jmBvdqUcE2PolyJF1JDuDscxsQ/yJGjJ9jw2m0oTwvqyOHGGm9jUmvGPuILwdsnxwCjN1VVguxCZV5o2BzNm65OhZ2GbnTK8tUXVIBQ2dKitO7ez7hhNf/vUBOfq8OdhX/XKJuwpV4dNQuVjc4zkavI0CTNhe6m
SpamDiagnosticOutput: 1:99
SpamDiagnosticMetadata: NSPM
X-OriginatorOrg: xilinx.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 01 Aug 2018 23:30:27.8984 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: e068743e-4dcc-4b18-d8fe-08d5f806c3ff
X-MS-Exchange-CrossTenant-Id: 657af505-d5df-48d0-8300-c31994686c5c
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=657af505-d5df-48d0-8300-c31994686c5c;
	Ip=[149.199.60.83]; Helo=[xsj-pvapsmtpgw01]
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SN6PR02MB4462
Subject: Re: [PATCH] devtool-source.bbclass: Support kernel fragments not in SRC_URI
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
X-List-Received-Date: Thu, 02 Aug 2018 02:03:46 -0000
Content-Type: text/plain; charset="utf-8"; format=flowed
Content-Transfer-Encoding: 7bit
Content-Language: en-US

Hey Anuj,


On 08/01/2018 04:25 AM, Anuj Mittal wrote:
> On 07/31/2018 05:21 AM, Jaewon Lee wrote:
>> When using a recipe space kernel-meta, scc files are added through
>> SRC_URI, but they may include corresponding kernel fragments that are
>> not necessarily in SRC_URI.
>>
>> For bitbake, this is not a problem because the kernel-yocto class adds
>> the path where the .scc file was found to includes which consequentially
>> makes the .cfg file available to the kernel build.
>>
>> However, when using devtool, only files specified in SRC_URI are copied
>> to oe-local-files in devtool's workspace. So if the cfg file is not in
>> SRC_URI, it won't be copied, causing a kernel build failure when trying
>> to find it.
>>
>> This fix parses local .scc files in SRC_URI, copies the corresponding .cfg
>> file to devtool's workdir, and also adds it to local_files so it is
>> available when doing a devtool build for the kernel.
>>
>> [YOCTO #12858]
>>
>> Signed-off-by: Jaewon Lee <jaewon.lee@xilinx.com>
>> Signed-off-by: Alejandro Enedino Hernandez Samaniego <alejandr@xilinx.com>
>> ---
>>   meta/classes/devtool-source.bbclass | 12 ++++++++++++
>>   1 file changed, 12 insertions(+)
>>
>> diff --git a/meta/classes/devtool-source.bbclass b/meta/classes/devtool-source.bbclass
>> index 56882a4..c70fea2 100644
>> --- a/meta/classes/devtool-source.bbclass
>> +++ b/meta/classes/devtool-source.bbclass
>> @@ -90,11 +90,23 @@ python devtool_post_unpack() {
>>                           fname in files])
>>           return ret
>>   
>> +    is_kernel_yocto = bb.data.inherits_class('kernel-yocto', d)
>>       # Move local source files into separate subdir
>>       recipe_patches = [os.path.basename(patch) for patch in
>>                           oe.recipeutils.get_recipe_patches(d)]
>>       local_files = oe.recipeutils.get_recipe_local_files(d)
>>   
>> +    if is_kernel_yocto:
>> +      for key in local_files.copy():
>> +        if key.endswith('scc'):
>> +          sccfile = open(local_files[key], 'r')
>> +          for l in sccfile:
>> +            line = l.split()
>> +            if line and line[0] == 'kconf' and line[-1].endswith('.cfg'):
>> +              local_files[line[-1]] = os.path.join(os.path.dirname(local_files[key]), line[-1])
>> +              shutil.copy2(os.path.join(os.path.dirname(local_files[key]), line[-1]), workdir)
>> +          sccfile.close()
>> +
> Would the patches included in these .scc files also need to be handled
> in the same way? Would this also work if there are other scc files
> included in a scc file?
Yes, I believe that the same mechanism should be used for patch files as 
well,
basically anything that may be needed to build but that its not necessarily
explicitly listed on SRC_URI.

I believe it will work for other scc files and it doesnt have to be 
recursive,
because while cfg files arent required to be in SRC_URI , scc files ARE 
required
to be SRC_URI, which means that this will eventually find the other scc 
file on the list

Cheers,

Alejandro

>
> Thanks,
>
> Anuj


