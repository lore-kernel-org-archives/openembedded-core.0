Return-Path: <alejandr@xilinx.com>
Received: from NAM01-BY2-obe.outbound.protection.outlook.com
	(mail-by2nam01on0066.outbound.protection.outlook.com [104.47.34.66])
	by mail.openembedded.org (Postfix) with ESMTP id 16B3872EF7
	for <openembedded-core@lists.openembedded.org>;
	Tue, 17 Apr 2018 19:41:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=xilinx.onmicrosoft.com; s=selector1-xilinx-com;
	h=From:Date:Subject:Message-ID:Content-Type:MIME-Version;
	bh=RWvU9/4lvuaMFr3Cvtk0hW2/0QoNaNT24Od04c3g6MI=;
	b=ZeoozmwYRudBoHuKjWH8k++4gdLiqX4FsY4uK3bAbgSeSxbG6J1404nJZJaRfQxX60MFmZSmqKkw2gl2oRj+ZwFLxOUgT8QAEQ5mDYjgHU4eNJ2WxP5dQ+Af96cP/A/ln+ThGbRmPz/BdWVGEprXjWQMBxGwLvn0n1X8srm5uJk=
Received: from BY2PR02CA0123.namprd02.prod.outlook.com
	(2a01:111:e400:5261::49) by BY1PR02MB1227.namprd02.prod.outlook.com
	(2a01:111:e400:52a6::25) with Microsoft SMTP Server (version=TLS1_2,
	cipher=TLS_ECDHE_RSA_WITH_AES_256_CBC_SHA384_P256) id 15.20.675.14;
	Tue, 17 Apr 2018 19:41:14 +0000
Received: from BL2NAM02FT056.eop-nam02.prod.protection.outlook.com
	(2a01:111:f400:7e46::207) by BY2PR02CA0123.outlook.office365.com
	(2a01:111:e400:5261::49) with Microsoft SMTP Server (version=TLS1_2,
	cipher=TLS_ECDHE_RSA_WITH_AES_256_CBC_SHA384) id 15.20.696.12 via
	Frontend Transport; Tue, 17 Apr 2018 19:41:14 +0000
Authentication-Results: spf=pass (sender IP is 149.199.60.83)
	smtp.mailfrom=xilinx.com; intel.com; dkim=none (message not signed)
	header.d=none;intel.com; dmarc=bestguesspass action=none
	header.from=xilinx.com;
Received-SPF: Pass (protection.outlook.com: domain of xilinx.com designates
	149.199.60.83 as permitted sender) receiver=protection.outlook.com;
	client-ip=149.199.60.83; helo=xsj-pvapsmtpgw01;
Received: from xsj-pvapsmtpgw01 (149.199.60.83) by
	BL2NAM02FT056.mail.protection.outlook.com (10.152.77.221) with
	Microsoft SMTP Server (version=TLS1_0,
	cipher=TLS_RSA_WITH_AES_256_CBC_SHA) id 15.20.675.14
	via Frontend Transport; Tue, 17 Apr 2018 19:41:13 +0000
Received: from unknown-38-66.xilinx.com ([149.199.38.66] helo=xsj-pvapsmtp01)
	by xsj-pvapsmtpgw01 with esmtp (Exim 4.63)
	(envelope-from <alejandro.enedino.hernandez-samaniego@xilinx.com>)
	id 1f8WTY-00075B-Re; Tue, 17 Apr 2018 12:41:12 -0700
Received: from [127.0.0.1] (helo=xsj-smtp-dlp2.xlnx.xilinx.com)
	by xsj-pvapsmtp01 with esmtp (Exim 4.63)
	(envelope-from <alejandro.enedino.hernandez-samaniego@xilinx.com>)
	id 1f8WTT-0003na-Ow; Tue, 17 Apr 2018 12:41:07 -0700
Received: from xsj-pvapsmtp01 (mailhub.xilinx.com [149.199.38.66])
	by xsj-smtp-dlp2.xlnx.xilinx.com (8.13.8/8.13.1) with ESMTP id
	w3HJf74v020298; Tue, 17 Apr 2018 12:41:07 -0700
Received: from [172.19.2.8] by xsj-pvapsmtp01 with esmtp (Exim 4.63)
	(envelope-from <alejandr@xilinx.com>)
	id 1f8WTT-0003nK-40; Tue, 17 Apr 2018 12:41:07 -0700
To: "Burton, Ross" <ross.burton@intel.com>, "Davis, Michael"
	<michael.davis@essvote.com>
References: <655290B7709079438B7932553958E60DA1475431@ESS-EX01.essvote.corp.local>
	<CY4PR02MB3334C4C5BD7719470CB91CA6ACB70@CY4PR02MB3334.namprd02.prod.outlook.com>
	<655290B7709079438B7932553958E60DA1475972@ESS-EX01.essvote.corp.local>
	<CAJTo0LZZkVyZEwGyffU8GkEev4a8U5eFAXWa_fAhRTBWYaKkqQ@mail.gmail.com>
From: Alejandro Enedino Hernandez Samaniego
	<alejandro.enedino.hernandez-samaniego@xilinx.com>
Message-ID: <ae893466-d904-e9e2-005e-a5c750eaf179@xilinx.com>
Date: Tue, 17 Apr 2018 12:41:07 -0700
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:52.0) Gecko/20100101
	Thunderbird/52.1.1
MIME-Version: 1.0
In-Reply-To: <CAJTo0LZZkVyZEwGyffU8GkEev4a8U5eFAXWa_fAhRTBWYaKkqQ@mail.gmail.com>
X-RCIS-Action: ALLOW
X-TM-AS-Product-Ver: IMSS-7.1.0.1224-8.2.0.1013-23620.005
X-TM-AS-User-Approved-Sender: Yes;Yes
X-EOPAttributedMessage: 0
X-MS-Office365-Filtering-HT: Tenant
X-Forefront-Antispam-Report: CIP:149.199.60.83; IPV:NLI; CTRY:US; EFV:NLI;
	SFV:NSPM;
	SFS:(10009020)(39380400002)(346002)(376002)(396003)(39860400002)(2980300002)(438002)(3190300001)(199004)(189003)(9170700003)(6306002)(305945005)(426003)(2870700001)(446003)(186003)(77096007)(6246003)(26005)(8936002)(8676002)(4326008)(64126003)(31686004)(336012)(81166006)(229853002)(356003)(65826007)(106466001)(316002)(9786002)(67846002)(53546011)(63266004)(59450400001)(93886005)(36756003)(76176011)(2486003)(23676004)(126002)(2906002)(5660300001)(2616005)(476003)(65956001)(1720100001)(478600001)(486006)(106002)(50466002)(110136005)(47776003)(31696002)(65806001)(966005)(58126008)(11346002)(107986001);
	DIR:OUT; SFP:1101; SCL:1; SRVR:BY1PR02MB1227; H:xsj-pvapsmtpgw01;
	FPR:; SPF:Pass; LANG:en; MLV:ovrnspm; A:1; MX:1;
	PTR:unknown-60-83.xilinx.com; 
X-Microsoft-Exchange-Diagnostics: 1; BL2NAM02FT056;
	1:E4lFG80HVRhIc0M2FO+nK2YDdtZUAyrYZl/maxgwIWLDoraZDO7klhk5QYBu7NGKA257grpMoiFHytQiQklaK0os7Fs+jGOShmpBblkAhD3bY8MzkAoExMXsKMZrCOZY
X-MS-PublicTrafficType: Email
X-Microsoft-Antispam: UriScan:; BCL:0; PCL:0;
	RULEID:(7020095)(4652020)(5600026)(4608076)(4534165)(4627221)(201703031133081)(201702281549075)(2017052603328)(7153060);
	SRVR:BY1PR02MB1227; 
X-Microsoft-Exchange-Diagnostics: 1; BY1PR02MB1227;
	3:DgIke4yyKMoygQMHZFykgELyl6BaVxUDuPvs27AKuTnZhIamJwCfAZbpkI7AQqWsLsdBRs3zJPPBymB6VLYbGPs9ckWpem9RiNbvgBGSLF8wYVeD1kyJEHEhIoGhb12LbelQkUWX7H9EUR9PpgWU4awYk0qYO1uwwaKxF+XRlSWZ5y17sEx86TpaDp21u833cLKIp5yhrxr0uKHsR6j4jY1WfKxy2RaAG7yxKU2zLBYWmcnNWBUwI6zm1D4TBfV4mr9d0E71hMABXKQJ8jDogVd/Bn8engZjX149DbumEBM+nuDP82k/ChO0Q11Ko5ztmG7dWw8EoQmgPEgHETEOl2OiLTVlNvkIdsXGBK7Orm4=;
	25:eNKNSp+VNO/jTiiI+DUpjaex1ur0VP/EEAeTxMZkjQZXcLjaWHdwY9ZektxyoVCw11HsXG7SU3OTV5uI+34DMGx5yElkBagn7t9giSjGoa2+1iO8/grJWP9Zru68sTY8w85mv1/Ua3k/lPFTeDQqC8mTIoQTKvxRWN+urX+t87u3Hj6E9OqwlxAnGudI44kKytI6s6dfRs+70NG1/VDtCGjFlW3FJNfef3+tEUPIPppatTG1YJ+QPRtdU52sGfYXTAbNOWtLeUtmV4/7PK2PEvb8o3RNXa6S6W3CCupYTISJGVJG5hWtpes1H2CGzN5ZrZ/b9nM2FcfUnn9nZu7ThA==
X-MS-TrafficTypeDiagnostic: BY1PR02MB1227:
X-Microsoft-Exchange-Diagnostics: 1; BY1PR02MB1227;
	31:Wnd7Y/1uEQjHF4Pq+cSRNPBKWZSi/mAJwejQMfY5bIFxjnpGmZefNYDklgdXSgagj/2qYP0PG7Hz5/CrSoaGIjN7KBbiENQ9QatVgfylw5irlEuXXqpjHPUozSUANBxYUZxXkUES1+8SUvfQV07o/g+S7TmGCeXhLDcDScMwqvXVH11b/FN8y9mplVfitPoCmVFt80snp8dz+7y7cn6KuEQsIjShR6UJbjZUcCRM0z8=;
	20:5grJ4PvXyKBWAsBWr6F0I7DA1lQo3JCVCY3gLqLbPkmfxoZSD311p7V0xAWS2sOyTXOtXKKwq+mwcJTpW/P+B7y5yRvLtxreNRR0TNwkGGI3LU0imuyF5vlOX/IaT8lqS/f9oZnbd4cMTwUo/n0p1y1gmJNflpJ5sUj7xZ+gKLxez1ELwmP3BMGJJnY+r9dgbcb6V6AKmxmmXidoX7HfqCvSRZlOLxRGdfSQ1ZKMLgvOictQRn/OuHZiqAis4b6QzIolIyrCMEv2INhzzntfl9oygmRh7BriZ7icoI94xLviVhcS6gKJXuxEn5YFGPOrgtK4areNwhJRctKrcCVbB8XA7Ikbpin4+JZ5eMZDcz66vgIhJXuGrnmtXUErYGFl/ujM4KUjkJckvWWal4DMv1H4xrJAYctGFGZU5M+0Cj32YNAwqp9GX8QRjstA2QBvoGOcLyq0yk502VLPO76ZNyQRlzr2RHRZTne35aboDVXSRTlEUrJUij/JjyGfmOBz
X-Auto-Response-Suppress: DR, RN, NRN, OOF, AutoReply
X-Microsoft-Antispam-PRVS: <BY1PR02MB1227476395F0D6D3FD12F080ACB70@BY1PR02MB1227.namprd02.prod.outlook.com>
X-Exchange-Antispam-Report-Test: UriScan:(264703809997249)(192813158149592);
X-Exchange-Antispam-Report-CFA-Test: BCL:0; PCL:0;
	RULEID:(8211001083)(6040522)(2401047)(8121501046)(5005006)(93006095)(93004095)(10201501046)(3231232)(944501327)(52105095)(3002001)(6055026)(6041310)(20161123564045)(20161123560045)(20161123558120)(20161123562045)(201703131423095)(201702281528075)(20161123555045)(201703061421075)(201703061406153)(6072148)(201708071742011);
	SRVR:BY1PR02MB1227; BCL:0; PCL:0; RULEID:; SRVR:BY1PR02MB1227; 
X-Microsoft-Exchange-Diagnostics: 1; BY1PR02MB1227;
	4:6kE5hrHRXoUCMV7HGLzoBHABPMOHUzt8YXubSI6s2mjSGzBbvmjT3HI1LLe9YC92sRYZ0zWtvXLAuHeIRZ/0WghvP33yGD5Nh8Q9ldvSO1fYh4BIoveylYglMzjRTOBkWGPzYUO/OExYVP4inOyCzwyeV5LNpmo5fXVbc4DTx3ZVue497CtLhccsioYA2C0hH8KGwOlrIjhUoXA4GWhJEF+TWZxFTKiAEnOWJdtXimOerXZMVMGFdyS8Strk8yctwul3Eh48P1tqJZcqo11eVGEDBZvbJSNaWiQU/mbKiFQrExBv4f7nUxcxciMUREfAlm8afTUop6/XR2WJ+mlP/H27LGZb0nmKNMW/W8JJKBI=
X-Forefront-PRVS: 0645BEB7AA
X-Microsoft-Exchange-Diagnostics: =?utf-8?B?MTtCWTFQUjAyTUIxMjI3OzIzOmt4ZHZSbDVQbXhEdGNlZndFUHRiVENDMjNE?=
	=?utf-8?B?YzluRnBQckEzSkxpZ2dDZjd0NTcrUkt2RjM5bGM0MW1uRElvWFlVSmkwUzRQ?=
	=?utf-8?B?RXo2K2h2NlhYMXpNQVNJbTZSZzZpbDlTRVVWSDVmTmRaTVBtRGpodFRGcHpY?=
	=?utf-8?B?anFQdXNEM3NWODA4SW5YL3hnY2xPeTMreDVGUEdheXVuMmVqL3QySXFJOXZq?=
	=?utf-8?B?U3NqSmJiZk5rTjBoZFVqVHkrMXQrTFVkdDhDbGxLZE5oUnJtTnV3S1FlS1Nz?=
	=?utf-8?B?UmFiS3JsN3o5dXVoUHFBRmgvbkJ3NkpZbVBuaGV2YjE2V0RTQUVZMlRDK3kx?=
	=?utf-8?B?RGZvbzlnR3BNU25BUTFwcWpYc3NKaFE2clIrM05haHpYNnFPNVAzbWk4eHlm?=
	=?utf-8?B?aW1lYUlOWXZ4V3pucmpyZnZwVXNFTVdrejVnS09rSEZDMUd5TllOOG5LOGJH?=
	=?utf-8?B?TE40SnV4TmlaKzBwc1ZlUXhud3BvU3A4dWRaVHlkOGJaRmNyV1d4bko4Z1Jh?=
	=?utf-8?B?S05IK1J4M1pMdW5TS0k3QzAzYlVCUDJlaXAxSjZQQjBhUmlsMlhlTVhpMWI0?=
	=?utf-8?B?WVlwVVlHYlVMVlpoNXIrY1pHdC93U1JWUTdKUEVBdThlRDhkTWRDbEZXQkFu?=
	=?utf-8?B?ZFhrdzRzTlpSLzExd1p4R0RJdFAyNFl6QkwxQjlIdU1JMTJHVjh6bGtlS2E2?=
	=?utf-8?B?S0lDbkx3SGgwOGpkS1NId3d0L1Q3aEs2cUpWT1dzbUVSMU9CRkt2TVI0aGRu?=
	=?utf-8?B?SXVDb2s4MSs4VlVzU3pDM1BJRm55eDN1YUQ3SjhZZW9MYkoxM2pBQnZROHI5?=
	=?utf-8?B?L3RZRmdlYVNvcnpqZGFVM3lHNm5wL3JmdGJSMmd0YS9KenVtY0JpT2g1MEpq?=
	=?utf-8?B?UVNuaVB5Z3FOenVNOXJUVGdyaGpldFNTZkJwS3RtOW4ya2FJT2ZmelVTYkhm?=
	=?utf-8?B?dUlpTDZuZ1B6a043a3h5ZW4ycDFDUElObDl3RjdycHpEMWpKTlJ6eEdEMDJt?=
	=?utf-8?B?NElrSGhBN29zVE1BWnFVWGI1cjhsTWZxbzk1eVRhMkovajh2VFJRbDRXWGFJ?=
	=?utf-8?B?OSt6cE00Zmo5dFZ5N0x6ZzlWWHJsdkxpNW1laEs0RW8wWlg2ZHpDYklIR1c1?=
	=?utf-8?B?V3IvcW9yTldNNmtEVHkvVlNiTUpWZGN5UUtlK3FMa0VIbjhVRkRjdVpDeFhS?=
	=?utf-8?B?QnRXaXB6VXRva1YvY2Q3cXJJY3Z6NVRvZnlLTXdPWG5XNnRPa0MySXp2cHFt?=
	=?utf-8?B?dEx5bXpFNnpGWWUvT2plZXZXZzNUSXFTM24zWlVkbXNBTlIyUGFieUdVZ2VN?=
	=?utf-8?B?eG42ZkRlbGlTU3NIZUpNMUFKcWczM0hEQUQyL0hRZ0lmRytLVXp4WHFqeE5N?=
	=?utf-8?B?UWFXb0lCRnA1ZDFDVFloVFJMTUNuTGVmYVRncWZnM1hvVWZZenVZR2dVbU9x?=
	=?utf-8?B?Zk9sY3VkZUwvRFg5bVZDUFFSUWVJaFJsOU1xSEdQempUVDVTNlVzSVJzOXht?=
	=?utf-8?B?WkVQUmlNcnh0NFU1SEk0QnVtSUY0VCtTS1l3N2w3bEJZR0VUWC95L3dHa2xo?=
	=?utf-8?B?bU81SHMzTnk1Z1RTUlc2TUJ1UkdsbVUzVGg3VmhLb1B0YXNSZncxc3dCaXZL?=
	=?utf-8?B?ZElmSzF2OXZ2ZTFjL1RtbFdnOTJheTRZeE1XZStHWkdGNmpGNVViZkM3eGc0?=
	=?utf-8?B?Wml4M2hxeEZJcDM5dXZ3SHR4Z3lWdDJKQkpPbDB3N1R3NnhTUGVMc2NVWHhm?=
	=?utf-8?B?WTlwdWVYVWtmNjl6RUQ1bjYvZlFwRTdFR2htdGRtTWl0TVFOSnNuOGtwNUoz?=
	=?utf-8?B?SExXVnNOMHVDYjhqb1hRWTdPYWtFMFRPcStWVDlzR0FjbEE9PQ==?=
X-Microsoft-Antispam-Message-Info: 2c+hvtRMxJZCBFG4gRFs8aUTbx8pJQsuX1Jl7UcFb8NN4heOUjUTH79gP3bYDrvZrh7vrSZ0EPfbytAgL6UOvfE1eRDFOQ+p9yIcN5WcyRz1zmdJZF2ibY47lc29Vy01Y1Y31OW2RyWNybLH8ffvOX8ZpIUFEkom9ZSe+S9wAFpxucwwspiJ6bR96ZSh8Gp3
X-Microsoft-Exchange-Diagnostics: 1; BY1PR02MB1227;
	6:OcxQSmeotkJWBYfsYpHArfDTOkmlQ8teebZbYWQUxxduIVLqSusutHEgCq0PVPlimEsD4EOmstAupK6WIIsrd0mXn3XoxAeLo8zw94NCoKqOvH7+VAk2xdXwlA0hsGFp1yOoiERyfoa9BUQgi/FHpH2Mh7Xte4e4toASQ0dUBp46D0MeIhCSDEnzxSnP2aZ+sO4BsmIo+Lm9i1/B4X4hRmHpHHfAvw0eF+SQFb3unby87pR3JwQoI898K/jeIRP2Z7pjLsB3mr8NPpLlQxPOgOI7mHdaLKbdBQHmbGI4h3c21IQ2YrAou6biBgdK7294XdSPkE15Dr5giJ6/JI+ZCrGTHR1V9/eXVur0K1DmILzCRVBATlDnqDy26auH8Prchp1zjbzC7YLWB7oCUJM7GjhLFpmxX/3NMRHzjJbU++ivUooW1aoJy2wwi9H/wU3B5wdsSlZ2D+K5T1NSycFM+Q==;
	5:mP+GHfSlZuvWxk9zpXn39+X5bV1uBt+z0U1dc2NK+OXrFNghiEf1bf0dSv+uqb3Lp6tro8l2aR9wEhYlVcTiFioNrogu5T1ALHqKohRkfdP0kTROoyiNOxoNY7CRn7Z3jmMDCtjI9a+nIdy+FyTRXGJ+0jhB0lWrTncbTv6BtD0=;
	24:TX6/VnI1g44Kchmlv3mq84giG5hQPoKVEl/4RUqHKnWtCqglqYf/uC5Ymu7TeZg2t76oRlv6Jrnh6ZyZgzVbA+0yR4BGmr3BycXSn3ENxao=
SpamDiagnosticOutput: 1:99
SpamDiagnosticMetadata: NSPM
X-Microsoft-Exchange-Diagnostics: 1; BY1PR02MB1227;
	7:ANoxX2dnd4k0vpuAfeTmBhaeRFb91IBBn8BW0rL6vsDVNY9Qs9qlY7eVeFDShx3oqZX0xPJPcWhaNgBJUdG/U+E5G2PeBLSS3s0SGGN98S6v0WUJ6AWxPoMmgMP6Hk0DN8KHOimH2e5U1mh1sqX7OFD02g34ObGkZxEW/IW0OHpUevmxr8DJYJco1xDVON5UTxXKBAsHtXMG/o5WtEPWCsZ7xvfprKLjEmKEsi+3CP8+1PgOxKI/XDF7awwDNmn8
X-MS-Office365-Filtering-Correlation-Id: 411a78eb-6097-45e1-eeb6-08d5a49b2dbb
X-OriginatorOrg: xilinx.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 17 Apr 2018 19:41:13.4470 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 411a78eb-6097-45e1-eeb6-08d5a49b2dbb
X-MS-Exchange-CrossTenant-Id: 657af505-d5df-48d0-8300-c31994686c5c
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=657af505-d5df-48d0-8300-c31994686c5c;
	Ip=[149.199.60.83]; Helo=[xsj-pvapsmtpgw01]
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BY1PR02MB1227
Cc: "openembedded-core@lists.openembedded.org"
	<openembedded-core@lists.openembedded.org>
Subject: Re: [sumo][python3] Generated SDK missing sqlite3
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
X-List-Received-Date: Tue, 17 Apr 2018 19:41:16 -0000
Content-Type: text/plain; charset="utf-8"; format=flowed
Content-Transfer-Encoding: 8bit
Content-Language: en-US

Hey Mike,

It does make a little sense that you're not getting 
"sqlite_version_info" from sqlite3, the python3-sqlite3 is missing the 
__init__.py file (on purpose) for that module, and the only thing that 
does is

from sqlite3.dbapi2 import *

and sqlite_version_info comes from sqilte3.dbapi2, hence why you might 
not be getting it, but I would still like to know the steps you're 
following to reproduce this, since I couldn't do that either.


Alejandro

On 04/17/2018 09:27 AM, Burton, Ross wrote:
> Work for me with plain oe-core:
>
> $ ./poky-glibc-x86_64-core-image-minimal-corei7-64-toolchain-ext-2.4+snapshot.sh
> Poky (Yocto Project Reference Distro) Extensible SDK installer version
> 2.4+snapshot
> ===================================================================================
> Enter target directory for SDK (default: ~/poky_sdk):
> You are about to install the SDK to "/home/ross/poky_sdk". Proceed[Y/n]? y
> Extracting SDK.......................................................................done
> Setting it up...
> Extracting buildtools...
> Preparing build system...
> Parsing recipes: 100%
> |##############################################################################|
> Time: 0:00:10
> Initialising tasks: 100%
> |###########################################################################|
> Time: 0:00:07
> Checking sstate mirror object availability: 100%
> |###################################################| Time: 0:00:00
> Loading cache: 100%
> |################################################################################|
> Time: 0:00:00
> Initialising tasks: 100%
> |###########################################################################|
> Time: 0:00:00
> done
> SDK has been successfully set up and is ready to be used.
> Each time you wish to use the SDK in a new shell session, you need to
> source the environment setup script e.g.
>   $ . /home/ross/poky_sdk/environment-setup-corei7-64-poky-linux
>
> Obviously something is different, how are you reproducing this?
>
> Ross
>
> On 17 April 2018 at 14:50, Davis, Michael <michael.davis@essvote.com> wrote:
>> I was on the HEAD of sumo(commit d012a9acdc3dce014705224a1261145628e75931)
>> so that commit was already included when I had the issue.  Just generated
>> another test today and the issue was still there.  If I remove
>> native-python3-misc from TOOLCHAIN_HOST_TASK it fails on installing the SDK.
>> With it there it succeeds.
>>
>>
>>
>> Mike
>>
>>
>>
>>
>>
>>
>>
>> From: Alejandro Enedino Hernandez Samaniego [mailto:alejandr@xilinx.com]
>> Sent: Monday, April 16, 2018 8:07 PM
>> To: Davis, Michael; openembedded-core@lists.openembedded.org
>> Subject: RE: [OE-CORE][sumo][python3] Generated SDK missing sqlite3
>>
>>
>>
>> Which commit are you using?
>>
>>
>>
>> https://git.yoctoproject.org/cgit/cgit.cgi/poky/commit/?id=4379b29e7eede727993ee68c9eba2bdebace5108
>>
>>
>>
>> In any case, that one should’ve solved it.
>>
>>
>>
>> Alejandro
>>
>>
>>
>> From: openembedded-core-bounces@lists.openembedded.org
>> [mailto:openembedded-core-bounces@lists.openembedded.org] On Behalf Of
>> Davis, Michael
>> Sent: Monday, April 16, 2018 11:19 AM
>> To: Davis, Michael <michael.davis@essvote.com>;
>> openembedded-core@lists.openembedded.org
>> Subject: Re: [OE-core] [OE-CORE][sumo][python3] Generated SDK missing
>> sqlite3
>>
>>
>>
>> Adding python3-misc to the SDK seems to have solved the issue.
>>
>> I saw some commits about separating the two so perhaps this is a side
>> effect?
>>
>>
>>
>> From: Davis, Michael
>> Sent: Monday, April 16, 2018 11:04 AM
>> To: 'openembedded-core@lists.openembedded.org'
>> Subject: [OE-CORE][sumo][python3] Generated SDK missing sqlite3
>>
>>
>>
>> Testing out the upcoming sumo release and ran into an issue.  Whenever I
>> attempt to generate an sdk-ext with sumo I get a failure about missing
>> sqlite3.
>>
>> Traceback (most recent call last):
>>   File "/home/mdavis/core_sdk/sysroots/x86_64-pokysdk-linux/usr/bin/devtool",
>> line 344, in <module>
>>     ret = main()
>>   File "/home/mdavis/core_sdk/sysroots/x86_64-pokysdk-linux/usr/bin/devtool",
>> line 285, in main
>>     scriptutils.logger_setup_color(logger, global_args.color)
>>   File "/home/mdavis/core_sdk/layers/core/scripts/lib/scriptutils.py", line
>> 38, in logger_setup_color
>>     from bb.msg import BBLogFormatter
>>   File "/home/mdavis/core_sdk/layers/core/bitbake/lib/bb/__init__.py", line
>> 79, in <module>
>>     from bb import fetch2 as fetch
>>   File "/home/mdavis/core_sdk/layers/core/bitbake/lib/bb/fetch2/__init__.py",
>> line 39, in <module>
>>     import bb.persist_data, bb.utils
>>   File "/home/mdavis/core_sdk/layers/core/bitbake/lib/bb/persist_data.py",
>> line 33, in <module>
>>     sqlversion = sqlite3.sqlite_version_info
>> AttributeError: module 'sqlite3' has no attribute 'sqlite_version_info'
>>
>>
>>
>> The issue seems to be isolated only to python3. The sdk partially installs
>> and I am able to source it.  I created a small python sqlite app and was
>> able to run it properly with python2, but not 3.
>>
>>
>>
>>
>> --
>> _______________________________________________
>> Openembedded-core mailing list
>> Openembedded-core@lists.openembedded.org
>> http://lists.openembedded.org/mailman/listinfo/openembedded-core
>>


