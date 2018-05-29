Return-Path: <alejandr@xilinx.com>
Received: from NAM01-BN3-obe.outbound.protection.outlook.com
	(mail-bn3nam01on0087.outbound.protection.outlook.com [104.47.33.87])
	by mail.openembedded.org (Postfix) with ESMTP id 8CDE060049
	for <openembedded-core@lists.openembedded.org>;
	Tue, 29 May 2018 22:40:36 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=xilinx.onmicrosoft.com; s=selector1-xilinx-com;
	h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
	bh=pjEhwf+1j3FCY2VrY73kb1qnLTmGObnvYX/y0ImpH5g=;
	b=Wg0cLqWVL3G6lqml0wuQowQJylPfO/KpLrhRD81hMwuL+vOHRkWE1HEPiEDqgcRDoRmkX2DRyHK4AMw5xBN86C2yC7hvECzboUBLuVczqL9ogVyXEEbKlu1G8ciMfBbYXwkGgFZ1yGtfV8cA/dIf9PKHS1CRT42rC6prC7qrZdk=
Received: from MWHPR0201CA0005.namprd02.prod.outlook.com
	(2603:10b6:301:74::18) by SN1PR02MB2112.namprd02.prod.outlook.com
	(2a01:111:e400:7a48::10) with Microsoft SMTP Server (version=TLS1_2,
	cipher=TLS_ECDHE_RSA_WITH_AES_256_CBC_SHA384_P256) id 15.20.797.11;
	Tue, 29 May 2018 22:40:35 +0000
Received: from SN1NAM02FT026.eop-nam02.prod.protection.outlook.com
	(2a01:111:f400:7e44::201) by MWHPR0201CA0005.outlook.office365.com
	(2603:10b6:301:74::18) with Microsoft SMTP Server (version=TLS1_2,
	cipher=TLS_ECDHE_RSA_WITH_AES_256_CBC_SHA384) id 15.20.797.11 via
	Frontend Transport; Tue, 29 May 2018 22:40:35 +0000
Authentication-Results: spf=pass (sender IP is 149.199.60.100)
	smtp.mailfrom=xilinx.com; lists.openembedded.org; dkim=none (message not
	signed) header.d=none; lists.openembedded.org;
	dmarc=bestguesspass action=none header.from=xilinx.com;
Received-SPF: Pass (protection.outlook.com: domain of xilinx.com designates
	149.199.60.100 as permitted sender) receiver=protection.outlook.com;
	client-ip=149.199.60.100; helo=xsj-pvapsmtpgw02;
Received: from xsj-pvapsmtpgw02 (149.199.60.100) by
	SN1NAM02FT026.mail.protection.outlook.com (10.152.72.97) with Microsoft
	SMTP Server (version=TLS1_0,
	cipher=TLS_RSA_WITH_AES_256_CBC_SHA) id 15.20.820.8
	via Frontend Transport; Tue, 29 May 2018 22:40:34 +0000
Received: from unknown-38-66.xilinx.com ([149.199.38.66]:46120
	helo=xsj-pvapsmtp01) by xsj-pvapsmtpgw02 with esmtp (Exim 4.63)
	(envelope-from <alejandro.enedino.hernandez-samaniego@xilinx.com>)
	id 1fNnIA-0003bV-Cj; Tue, 29 May 2018 15:40:34 -0700
Received: from [127.0.0.1] (helo=localhost)
	by xsj-pvapsmtp01 with smtp (Exim 4.63)
	(envelope-from <alejandro.enedino.hernandez-samaniego@xilinx.com>)
	id 1fNnI5-0002vD-A7; Tue, 29 May 2018 15:40:29 -0700
Received: from xsj-pvapsmtp01 (mailhub.xilinx.com [149.199.38.66])
	by xsj-smtp-dlp2.xlnx.xilinx.com (8.13.8/8.13.1) with ESMTP id
	w4TMeJfh032520; Tue, 29 May 2018 15:40:19 -0700
Received: from [172.19.2.8] by xsj-pvapsmtp01 with esmtp (Exim 4.63)
	(envelope-from <alejandr@xilinx.com>)
	id 1fNnHv-0002s8-BU; Tue, 29 May 2018 15:40:19 -0700
To: Alejandro Enedino Hernandez Samaniego
	<alejandro.enedino.hernandez-samaniego@xilinx.com>,
	<openembedded-core@lists.openembedded.org>
References: <cover.1527633402.git.alejandr@xilinx.com>
	<bfee8b1cb069601b1e0c216a1221174bde2cefaa.1527633402.git.alejandr@xilinx.com>
From: Alejandro Enedino Hernandez Samaniego
	<alejandro.enedino.hernandez-samaniego@xilinx.com>
Message-ID: <ab4c0895-ddc5-a7b0-093b-0b057dbff121@xilinx.com>
Date: Tue, 29 May 2018 15:40:19 -0700
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:52.0) Gecko/20100101
	Thunderbird/52.1.1
MIME-Version: 1.0
In-Reply-To: <bfee8b1cb069601b1e0c216a1221174bde2cefaa.1527633402.git.alejandr@xilinx.com>
X-RCIS-Action: ALLOW
X-TM-AS-Product-Ver: IMSS-7.1.0.1224-8.2.0.1013-23620.005
X-TM-AS-User-Approved-Sender: Yes;Yes
X-EOPAttributedMessage: 0
X-MS-Office365-Filtering-HT: Tenant
X-Forefront-Antispam-Report: CIP:149.199.60.100; IPV:NLI; CTRY:US; EFV:NLI;
	SFV:NSPM;
	SFS:(10009020)(39380400002)(39860400002)(376002)(346002)(396003)(2980300002)(438002)(199004)(189003)(76176011)(2486003)(36386004)(478600001)(305945005)(106002)(65956001)(65806001)(8676002)(230700001)(81166006)(2906002)(186003)(47776003)(8936002)(486006)(11346002)(446003)(77096007)(106466001)(59450400001)(2616005)(126002)(53546011)(63266004)(64126003)(31696002)(336012)(81156014)(31686004)(6246003)(9786002)(5660300001)(229853002)(39060400002)(67846002)(476003)(26005)(65826007)(54906003)(36756003)(4326008)(426003)(356003)(58126008)(23676004)(110136005)(316002)(50466002)(107986001)(5001870100001);
	DIR:OUT; SFP:1101; SCL:1; SRVR:SN1PR02MB2112; H:xsj-pvapsmtpgw02;
	FPR:; SPF:Pass; LANG:en;
	PTR:xapps1.xilinx.com,unknown-60-100.xilinx.com; A:1; MX:1; 
X-Microsoft-Exchange-Diagnostics: 1; SN1NAM02FT026;
	1:LiZ04TWNDJvxwszlFbp39QpuhcqTueGGy0gGjrsCLBSMKDgX4fPhYzBlOmr57H/aB/iK3jpMfos4nq2i6NcmFs5WbBS4AtLSkBvzSjGn1VT3fjZun6VfAlud1AwlmJL2
X-MS-PublicTrafficType: Email
X-Microsoft-Antispam: UriScan:; BCL:0; PCL:0;
	RULEID:(7020095)(4652020)(5600026)(4608076)(4534165)(4627221)(201703031133081)(201702281549075)(2017052603328)(7153060);
	SRVR:SN1PR02MB2112; 
X-Microsoft-Exchange-Diagnostics: 1; SN1PR02MB2112;
	3:FRyhUH3LjWd3YHfI9v4YYy28emruSQmaP2cQ2ugGZs+t5BU5PsbF/S2R5HEsthR02Mrvzt8a3CQvpsOUBoM4QFf54vyFmu2ICg1XCrd309FxGHlDQWwkd7PaCwhVlBebh9Q3jNHVucOLQ+ZRAQGAXlF2h48aWXhIFez7az4CSoOdME56PbwUA6G3vGoKJRdIJh0+SfVCJHex7nwy/lTzY47EQP8Y2KDsdDpDwosVyZjY7Bc2yVeOq4WdeyUOmHAZu/lAg+3uFJAaUUu7hsAcZjpTPn1GN/Ek4VwwyMChDBW8bUs0qQbOKmBdKW6mV5XZUFLkiXXu8CLmJw9mm1nwP/RQKc+1lMDnKT2zp6sQ3Ro=;
	25:xaVo7VbeoDJE9fAz9oTFZiS8SJMFOeidwPsGP5Mw8jO7/0wzuL69X/qWVYTzv1pa1TUoJYHrfCrMo4ZglR+Dw4vIGNMLKesX61AJTf40EIAPMXN6ktMEqejw4NqEW+7NLk2a5bgtwUrLh6OQ5LX+4VW4rtawur6az539h9CCEiw5LZsIk9R307ActeW/WoUHb1NDTQ/H2gBbHEnBtUMdmurUBuZcJEFeU9bFv1r3oaWItgvmsPsyeX9beQZGKpMpTvYxNjjclrrRQyfBXPtNYTUtxnHul114YqM8BuMp5vSyCLMXqxGHEkF6ZuNWvlP/mMZh9dG0ZZdN0dZJYLVTvA==
X-MS-TrafficTypeDiagnostic: SN1PR02MB2112:
X-Microsoft-Exchange-Diagnostics: 1; SN1PR02MB2112;
	31:xBmB9hRZNlSr0fo3v+/l7DK6iFL6NhUHnobqrcdvoVIcfVSn9uWqhiA0bgERMZ8LLxm5mr0qKm6hJyl1OH2zANewXdaOsODJOsRh5VOqt0A/emgKcXY+vKwc7Ydh4JECBClmt4cthkCl5n7rjVfSL0PjYAmjBuxdJRm/bta5M4E2qpULbSbBB9wLrRcWgkmafD1+WEWKzbrjWU1XoGowQUWexDeQVUwWkUcN91AKg8k=;
	20:ox2OfS1fdJA/Z2eRTyxlFOQyjMMjvFmBY6SjkpIcss76IMWUZTlHU2WxNHfKAFzqw0Rs8siS/vEisTvosHJKR0dhTu75Z2yEkP+iiJILY2uUdmrLTEDt5K4Ml6tWBuc/JffTEhZ3zKo3sVrsLEdu4Cuuqb/8uMNwznyXSQteTfFeKtIEL5qxov2RC9hSy9iuiO9b9UHLMzqq8p9ic8yeLoQw/drjD/ooXP9Pg20gRsG5BPx/W5ViMRQfBUuIdxCR1DuoCnHsJ/r9OvunXj4moz8t3+LjWhwuxExh93QebY2HbPDya/F4CS84G+3XTeCIpgn7ZnefiPevCYqfsIwBoPSJJ62jKPoTS/EZiZRTw1wXCa8BQKhv5XBSZV0ooZtxR5g7V3u2pu0Lnr1vwRkCMW680yBs8i9PAbwxOTSqlDpJjmzWjPaGPw4xAP2khVY6rPUfo/5RqCEBkkpkjC5OKRlDr0xnY5ltwRXoj+XXTJggAV7PgCb4NAXFEUUGv/sL
X-Auto-Response-Suppress: DR, RN, NRN, OOF, AutoReply
X-Microsoft-Antispam-PRVS: <SN1PR02MB211250C79A3C9EDE33902189AC6D0@SN1PR02MB2112.namprd02.prod.outlook.com>
X-Exchange-Antispam-Report-Test: UriScan:(278428928389397)(192813158149592);
X-MS-Exchange-SenderADCheck: 1
X-Exchange-Antispam-Report-CFA-Test: BCL:0; PCL:0;
	RULEID:(8211001083)(6040522)(2401047)(5005006)(8121501046)(10201501046)(3231254)(944501410)(52105095)(3002001)(93006095)(93004095)(6055026)(149027)(150027)(6041310)(20161123564045)(20161123558120)(20161123562045)(20161123560045)(201703131423095)(201702281528075)(20161123555045)(201703061421075)(201703061406153)(6072148)(201708071742011)(7699016);
	SRVR:SN1PR02MB2112; BCL:0; PCL:0; RULEID:; SRVR:SN1PR02MB2112; 
X-Microsoft-Exchange-Diagnostics: 1; SN1PR02MB2112;
	4:KbTkUlk359iwhx2MoSgCH1StC6ZLegd0yECpjBl61jGLy9MtdUcxJ2dk+iMnfAf/Jf+9rXpMfvDlr0WmYuadpJCnXNCYn6BjqU336Eoj1iWvP+TPp/CttnS7kgDaWaHbSZrtloI7m+QCgKTROq41qV5oKP9rpzfeG6l4kPxwLcMy3c6plq6mfQAyKCxiDfqHfa0SUJXmbJmH05SOJTNas736wKmEeNRjPngYgb98HCXMcSEb1j2pMxzbyzkUFPSQ/3WMhMpW0x3hsVRU8s4OjC0iXlm4+XqLGdBiB3U3j0e1G6Je9qtqQcq1faXmBC5pzH3yzOO+ivdiIXjwAp8rtL5YaZVcSyBPe4pygc3CUm8=
X-Forefront-PRVS: 0687389FB0
X-Microsoft-Exchange-Diagnostics: =?utf-8?B?MTtTTjFQUjAyTUIyMTEyOzIzOnF4UWs4aGtTTXVPdTVKbHBOcE9uaUV4V0hu?=
	=?utf-8?B?ZnA5bkFibUJIZ2lhaExjdUhjRUlrQXdobVFFSUVTT2xaUzBBRmdPUjVRa3V5?=
	=?utf-8?B?UW55ZmxWeTRFdHdFVEZHM2ttZ0o4RHZHUDNLd2NWZlkxQnFoL2VENXpndllt?=
	=?utf-8?B?K1dUK0xNYnpSOEtQUmxMNllGN29DdDRmZ1dwNXZjY2gzaEtGekw3Mmp0Qm5U?=
	=?utf-8?B?QjBoSU5Xbk9sNlduQS9UQnZHMVQxaG9menJhYkVZbmtsTlJGdjFYS0ZER1Jp?=
	=?utf-8?B?UDRkTzZjMXBrWitOSkpiMWlwUzI5N1RoUVhtKzZvLzNxY2JaS2ZUWEZCWVdE?=
	=?utf-8?B?VjlzZ2RwNk9NSlZuYkhZb1FBYVIxRTNFQVBXU2pYdEt5VWQ4SFBHeUlIUTVQ?=
	=?utf-8?B?TVBmK2hJS2Q5ZlJVN0JhUUJnT1dGdVRPd1hsVWxFa3ZDWXlxK25wVGJFTXpU?=
	=?utf-8?B?R0dXQm83bDZ0RTR4NHBUeFBZUE54MXZGWk1vRTBMOVovRjlWRlFBdStjUk52?=
	=?utf-8?B?NTRaKzdLblNjVHlRZTRpdE10SmdqMTZzWllydElQR2pNbUN3c21kZjBrK0ZY?=
	=?utf-8?B?MHo5clhyd3RjcklJekVJMlJKaHF3OXhkUEk5VHV0anI1NTlEMXlMOFc3aGpt?=
	=?utf-8?B?bkNLL2xxWDFNUlhSL012RFJrdWFvYUdYNWFTaGRaenBtVDlWZzVaWnJ6cDFR?=
	=?utf-8?B?MnhtRTFpckllaCtGOVBnejdoK21kTlFhUUV3UmZQRVB5TWROVmlqY0c1bWYx?=
	=?utf-8?B?OUVLS3R3ZWgxcldXY2JQOUJUSHQ4YkJhT3h4SlZhVVdFcVVJZ1ZXY1RmTE5B?=
	=?utf-8?B?VDNiUHBxbVpFNXJaWmczbEVYY2JUK21LZUNTRU9nR2drNjBvemtSYTNUVkZz?=
	=?utf-8?B?a0V4UDJhbGFMOWVQaFd1U2x2ZlV5RUlKRVQ3SERtNi8ySTFJNFdsdnRKckcr?=
	=?utf-8?B?STZYVnBTbHhITmhET2JOSllmR215eFljRUl1ZnByMjdlUzBpbHQ3WE1POUY5?=
	=?utf-8?B?N1ZGcXZ4NkdDZVlJQ3dMTUJTZU1lcVVzQ1RyVm5VYWgzcmlGNmZCa2NjUUdB?=
	=?utf-8?B?U0ZvRHZkSW5nRExQazZ0b3VrYmZ5aGFrTXVlMzErM0t6OTcyTHNZMmMvRU1i?=
	=?utf-8?B?b3FKcDVkcTRLZE15RjNkaS9EWjZDM0xJbjIzcURWRnZDVEoyVEI1aVRwV1Vn?=
	=?utf-8?B?NUh6VTQ2a2RFNW9RZUtWQzlWQnp1K2g1cnpKVkhFK3kxNWJia05IRFlqd0Vv?=
	=?utf-8?B?TVlMTTR3Y0lwK1RvNmwxYWxaV3N2bzRCd0JCUjNEUHFiMzlhbXBTTGQzRWRn?=
	=?utf-8?B?Y1hlNGlIOEV6YWc2ak1tdXVsait6UEdJRkduVXo5czV1RkN0QkI2YVJ0TUxh?=
	=?utf-8?B?RlY2aGNPN1NUS0dvc0pFVjI4OWZ2b1RzcnU3NEpRYnp1VFRDMUFqQ1NnRFpj?=
	=?utf-8?B?ZnoxTklwMlluS1VFbEEvRWNHS21BWjVQSzd0QUNDMWRLTS9RREx6QzNkWVZ1?=
	=?utf-8?B?Q0lWNjExc0tQN05FcUtwdy8zUXh2UjBMUVhjdDlMemVDbEExV1p4cW94MTRJ?=
	=?utf-8?B?MnlZZC8ycElCUW1OSlFsSmt4Y1l0UDJxL00vQVFmS3BlanhMUjFYVzVSNXZU?=
	=?utf-8?B?RmJXSnNyNnEzMUg3Qjc2aVUyYjdRYTVSZHBwQmtBYi9LMzBBKzFtbmpnRU16?=
	=?utf-8?B?QTR6RmgwbFJrN3p3K3hXS3Y0MVZQZkNoTFFNSHlKMGVhTFIwVXMzM0IvUnR6?=
	=?utf-8?B?dHB0eGpkYTY3NUZVMDlwV01iY2pnWEljZVFFcy9zeXp4aGVqeXFya25xWktC?=
	=?utf-8?B?WGsrVGhOQnVVS0M3ZFRWYUI4UFE1ZC9aaUJ3Z2EwVTByYmc9PQ==?=
X-Microsoft-Antispam-Message-Info: cYXRulw65q71kMgKv3v6+Q8+g5WAmifB0agpmKpI6g/SCOSfIFHvrafZ4tkH/CKWsBgEGRcM1s81qQbvE5Hdq6gzHAGupQHG76CgeUZB/bskBfpJWRkPGi1GD0JmrHLvTGMS+wRv7owu+C5WahUV6pz1n30G6+0Uffa+WFPfFWE+2NFvKLk/NFG6mnA1mYrK
X-Microsoft-Exchange-Diagnostics: 1; SN1PR02MB2112;
	6:Ql89yN/6URHBil6g1mmRm7GUQijdxXVogpPuJTbFMkQW56Gl5uR/o18Xk7R2YUiQedQkZB5X4E523aqRqxN6niN5oQ8RkWhzkgroZ7SiM6NKzQs7myyY9Vf6Cz5TEZY9BsPc1UuPq88+xngORWL8h54By3eDvohEu2OavfeJtCnUzlhHcgsxSCWHS1GTCO5y2aPBZPCSumaJV7RPm4b+C54XNkt72S3dTwRvN82atuetsojz2TyoT+Tn6Thj/JU2eWte8CTb+GqrgZPEuCNadUKJz4kcS6gHt5kTTs1SU+xZPY/ueb7P+W06KWb6HuXce1EzG80KvXBDEIhqPMCJqKmc/a0VVe6CBeo4K+VSjmv30nQZG4c3P2CwgspQKBIjDkb46w7fp2XY65hSRPFBtst+nLy8eChmvoUPk1CKR/9QcT7pAr8lFfNXlp9BX+mEIT9OST96PYBm75MzZN4yrg==;
	5:MXEOO7YPuV/C8id/Lakw+O7uVYUErtZ908jy7iU7ZiAuiQoQthDfdvhaCryKeER7GOUd4eUJAiFFURfMxkbR9NW6Ygg/gQN1mEdNfwoQwIw/jiZiOiCG6yt/2sM/juXso5QqQKv3W0dYN5fC5BaarnNsxyCvlow1FYIzDF1twoY=;
	24:mmOUKL2VkVAOzdaLd1w59RpQVAgeFDP/kKQyVCGzYT/Rdam7eJ66Z9ug5D9DCc8IBSvnP8zf1JdlyZovPsDaADPunHqQUohRYX7c4ulfQU0=
SpamDiagnosticOutput: 1:99
SpamDiagnosticMetadata: NSPM
X-Microsoft-Exchange-Diagnostics: 1; SN1PR02MB2112;
	7:Wi4cgNDZDnK/s4AzbIc9nVtflxW5KisJP1wT1kkSo8JgpQ8swe7g/kXPHE985SgAZOSKzIuCKMBCrvCnuj30GgyvjQ6TS1WCD4kGQAU9ku5AIqAa2/c/8jlzV7B/lbGof0qGA6ORtyCQtNsG+WSWIswFY0pVNzWoZDmzjZ60VuG9gvKgIVADakuoSDAhWAqXWx9Imnnmlbedw96CTuW+ckQbJuFe/P4wnmWMlcEnvIua0f/bb5B0FiOpIT64eylx
X-MS-Office365-Filtering-Correlation-Id: 951662cc-6ea4-418e-1621-08d5c5b53154
X-OriginatorOrg: xilinx.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 29 May 2018 22:40:34.8108 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 951662cc-6ea4-418e-1621-08d5c5b53154
X-MS-Exchange-CrossTenant-Id: 657af505-d5df-48d0-8300-c31994686c5c
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=657af505-d5df-48d0-8300-c31994686c5c;
	Ip=[149.199.60.100]; Helo=[xsj-pvapsmtpgw02]
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SN1PR02MB2112
Subject: Re: [PATCH v2 3/3] tclibc-newlib: Adds a new TCLIBC variant to build with newlib as C library
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
X-List-Received-Date: Tue, 29 May 2018 22:40:36 -0000
Content-Type: text/plain; charset="utf-8"; format=flowed
Content-Transfer-Encoding: 7bit
Content-Language: en-US

I was unable to reply to the thread, this is the updated patch, the 
contrib branch aehs29/newilb has also been rebased to latest master.


Cheers,

Alejandro


On 05/29/2018 03:38 PM, Alejandro Enedino Hernandez Samaniego wrote:
> This patch adds the posibility to build using TCLIBC=newlib.
>
> It allows users to build baremetal applications with the use of a
> C library.
>
> Newlib is a lightweight C library meant to be used on embedded systems,
> it is meant to be easily portable for new platforms and to provide
> basic functionality on them, by design, it provides stubs for some of
> these core functions declared as weak, so they can be built correctly
> and then linked against some other library which provides specifics
> about the platform being used if need be, libgloss takes care of these
> in some cases, but it can also be extended, this patch also allows the
> user to easily add other libraries to it by adding them to
> NEWLIB_EXTENDED for this specific reason.
>
> Signed-off-by: Alejandro Enedino Hernandez Samaniego <alejandr@xilinx.com>
> ---
>   meta/classes/cross-canadian.bbclass         |  2 +-
>   meta/conf/distro/include/tclibc-newlib.inc  | 44 +++++++++++++++++++++++++++++
>   meta/recipes-core/newlib/newlib_3.0.0.bb    |  3 ++
>   meta/recipes-devtools/gcc/libgcc-common.inc |  5 ++++
>   4 files changed, 53 insertions(+), 1 deletion(-)
>   create mode 100644 meta/conf/distro/include/tclibc-newlib.inc
>
> diff --git a/meta/classes/cross-canadian.bbclass b/meta/classes/cross-canadian.bbclass
> index ee8aa61..acde331 100644
> --- a/meta/classes/cross-canadian.bbclass
> +++ b/meta/classes/cross-canadian.bbclass
> @@ -30,7 +30,7 @@ python () {
>       if d.getVar("MODIFYTOS") != "1":
>           return
>   
> -    if d.getVar("TCLIBC") == "baremetal":
> +    if d.getVar("TCLIBC") in [ 'baremetal', 'newlib' ]:
>           return
>   
>       tos = d.getVar("TARGET_OS")
> diff --git a/meta/conf/distro/include/tclibc-newlib.inc b/meta/conf/distro/include/tclibc-newlib.inc
> new file mode 100644
> index 0000000..dc631d8
> --- /dev/null
> +++ b/meta/conf/distro/include/tclibc-newlib.inc
> @@ -0,0 +1,44 @@
> +#
> +# Newlib configuration
> +#
> +
> +LIBCEXTENSION = "-newlib"
> +LIBCOVERRIDE = ":libc-newlib"
> +
> +PREFERRED_PROVIDER_virtual/libc ?= "newlib"
> +PREFERRED_PROVIDER_virtual/libiconv ?= "newlib"
> +PREFERRED_PROVIDER_virtual/libintl ?= "newlib"
> +PREFERRED_PROVIDER_virtual/nativesdk-libintl ?= "nativesdk-glibc"
> +PREFERRED_PROVIDER_virtual/nativesdk-libiconv ?= "nativesdk-glibc"
> +
> +DISTRO_FEATURES_BACKFILL_CONSIDERED += "ldconfig"
> +
> +#USE_NLS ?= "no"
> +
> +IMAGE_LINGUAS = ""
> +
> +LIBC_DEPENDENCIES = "\
> +    newlib-dbg \
> +    newlib-dev \
> +    libgloss \
> +    libgloss-dev \
> +    libgloss-dbg \
> +    libgcc-dev \
> +    libgcc-dbg \
> +    "
> +
> +# compilerlibs defaults to gcc-runtime, but we get runtime from libgloss
> +# we set ASSUME_PROVIDED because we cant set PREFERRED_PROVIDER
> +# for compilerlibs since its overridden by tcmode-default
> +ASSUME_PROVIDED += "virtual/${TARGET_PREFIX}compilerlibs virtual/crypt"
> +
> +# Its useful to be able to extend newlib, but we dont provide a native variant of libgloss
> +NEWLIB_EXTENDED ?=  "libgloss libgcc"
> +BASE_DEFAULT_DEPS_append_class-target = " ${NEWLIB_EXTENDED}"
> +
> +TARGET_OS = "elf"
> +TARGET_OS_arm = "eabi"
> +
> +TOOLCHAIN_HOST_TASK ?= "packagegroup-cross-canadian-${MACHINE}"
> +TOOLCHAIN_TARGET_TASK ?= "${LIBC_DEPENDENCIES}"
> +TOOLCHAIN_NEED_CONFIGSITE_CACHE_remove = "zlib ncurses"
> diff --git a/meta/recipes-core/newlib/newlib_3.0.0.bb b/meta/recipes-core/newlib/newlib_3.0.0.bb
> index 3380576..09238fe 100644
> --- a/meta/recipes-core/newlib/newlib_3.0.0.bb
> +++ b/meta/recipes-core/newlib/newlib_3.0.0.bb
> @@ -14,3 +14,6 @@ do_install_append() {
>   	# Remove original directory
>   	rmdir ${D}${prefix}/${TARGET_SYS}
>   }
> +
> +# No rpm package is actually created but -dev depends on it, avoid dnf error
> +RDEPENDS_${PN}-dev_libc-newlib = ""
> diff --git a/meta/recipes-devtools/gcc/libgcc-common.inc b/meta/recipes-devtools/gcc/libgcc-common.inc
> index 848a476..d959566 100644
> --- a/meta/recipes-devtools/gcc/libgcc-common.inc
> +++ b/meta/recipes-devtools/gcc/libgcc-common.inc
> @@ -47,8 +47,13 @@ do_install () {
>   do_install_append_libc-baremetal () {
>   	rmdir ${D}${base_libdir}
>   }
> +do_install_append_libc-newlib () {
> +	rmdir ${D}${base_libdir}
> +}
>   
> +# No rpm package is actually created but -dev depends on it, avoid dnf error
>   RDEPENDS_${PN}-dev_libc-baremetal = ""
> +RDEPENDS_${PN}-dev_libc-newlib = ""
>   
>   BBCLASSEXTEND = "nativesdk"
>   


