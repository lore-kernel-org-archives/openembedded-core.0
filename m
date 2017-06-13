Return-Path: <mkelly@xevo.com>
Received: from NAM03-BY2-obe.outbound.protection.outlook.com
	(mail-by2nam03on0044.outbound.protection.outlook.com [104.47.42.44])
	by mail.openembedded.org (Postfix) with ESMTP id D809078307
	for <openembedded-core@lists.openembedded.org>;
	Tue, 13 Jun 2017 17:12:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=uievolution.onmicrosoft.com; s=selector1-xevo-com;
	h=From:Date:Subject:Message-ID:Content-Type:MIME-Version;
	bh=tZJaKnYgIZWcSS3p9x45bSijI+71246Gwdk5idrgEzk=;
	b=gisuh1RfZLnq7KB9w0U15TpMfrVEe6hgGNV0nt6Qs8/rx/0qbXqqZErko1TAx8Pc+CSIgtTvROskp2V29WUMSxU3PJOCrkDBYbaQEVjkQov1sZicC/y04aPa/jYIDp0rI6PxQTZobKsHyn8dj/t7FUoPo4P52CQEdzCU8tVerfM=
Authentication-Results: spf=none (sender IP is )
	smtp.mailfrom=mkelly@xevo.com; 
Received: from [10.0.1.79] (65.122.179.226) by
	BN6PR0101MB2929.prod.exchangelabs.com (10.174.87.138) with Microsoft
	SMTP Server (version=TLS1_2,
	cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id
	15.1.1157.12; Tue, 13 Jun 2017 16:56:24 +0000
To: "Burton, Ross" <ross.burton@intel.com>
References: <3bd366a6-a31c-e4c8-688c-e24e84f1520c@web.de>
	<2af19119-fac3-8ce3-fb36-c4aaf64163b7@xevo.com>
	<4e18dc00-1800-f2dd-797a-7e0a380467c4@xevo.com>
	<b51b0f8b-e21b-087b-5225-38fb8040479f@siemens.com>
	<8098d7e7-b887-4c4f-6dba-db9065c97571@xevo.com>
	<CAJTo0LbrkS8oG1s05KcMu6mREZwd-+h2aGwo7cLXjJc08XrMeA@mail.gmail.com>
	<f64173c1-2746-06cc-d283-6d42c670cb69@xevo.com>
	<CAJTo0LbpaXG07FouMMN5qa7zVUqkgxAG5OciFXQmhCzoSxrrEQ@mail.gmail.com>
	<55c25692-acb4-01d7-5c6d-c180508b8729@xevo.com>
	<CAJTo0Lagk3XBDGYsCb0UpjmYDNWPQwjqnTsAMDPd9DSP5Xq7Uw@mail.gmail.com>
	<2e4ffef7-2375-f9d6-4789-919858b88272@xevo.com>
	<CAJTo0LY-DNCoMce9XEqeVTjUyxbUiiPQ-txoY0LY9Rd+KdjCsg@mail.gmail.com>
From: Martin Kelly <mkelly@xevo.com>
Message-ID: <2e60b576-5832-10ec-4e3e-27c987ed5e75@xevo.com>
Date: Tue, 13 Jun 2017 09:56:07 -0700
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:45.0) Gecko/20100101
	Thunderbird/45.8.0
MIME-Version: 1.0
In-Reply-To: <CAJTo0LY-DNCoMce9XEqeVTjUyxbUiiPQ-txoY0LY9Rd+KdjCsg@mail.gmail.com>
X-Originating-IP: [65.122.179.226]
X-ClientProxiedBy: DM5PR12CA0022.namprd12.prod.outlook.com (10.172.32.160) To
	BN6PR0101MB2929.prod.exchangelabs.com (10.174.87.138)
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BN6PR0101MB2929:
X-MS-Office365-Filtering-Correlation-Id: 0b1bee38-4186-480a-a025-08d4b27d201a
X-Microsoft-Antispam: UriScan:; BCL:0; PCL:0;
	RULEID:(22001)(201703131423075)(201703031133081);
	SRVR:BN6PR0101MB2929; 
X-Microsoft-Exchange-Diagnostics: 1; BN6PR0101MB2929;
	3:VnL7JLF97zSUOvczrV0a5oTmKS352DOKb1DbVYrnQ/v6lJrKzW63cT+WmhrnPBuuFKbtNsgHmhf4Uwn+gTYRTVm1QMXSFZGzlrFQCKiafjs1GRKCzAnhhtOthsbyaeTrVG+7R3D8IbRTCvHbZ382xZ/Y4aTU87UZnvHva6uXIScVgyr+MRI8WOhanQ8CWooNvn3yQk40NN/KrScu1b1ghlg/J7MWZi/uDx6eahd91P+CZ8IXlOTG9Rw/d+rh05pQ1Pa7HYWphVdWnK1OAojyjD+bLNb8rFNgAz352wqLCqaEpuiWRSMS1NJYi+M954IMRVhraI+02F4YnGsJXfBVcg==;
	25:RUo27a1kFutjNrMutwF/iBcmfZoH0ahW//pYQpLHe14KnYXMWMu44bxwboqzA8pP6iM9WXOCCUWqSsyduW1y0endXG00N9gWLxHHmO3F3sduvwD8LcYMSOmidOo3wZMo6/3puiqeOg4kMZncol+xkS7uJkmmUQi42Uzik2WSKgDQ21QZ6C2WZTIFrvhl/Cn8Sy9QXCUvHEl+g+vWaNhVdumtdRq5bZBQ/jW3p4DtZYHElgD3oLsqxTCB7P0rIL9CxmDwcFlK50s/o+VO1J1lh/nm8lLLudHBPa35hcA561F+Db9/Wlc4e1EoxclITnAZVp4ABq3cH1e6FG9MB8em6ET9S+tm5lxxvr3cpz98HnkVNxnO6IO7qg9XsiIZBKq8PuXOCPG88p3wdvfr/WbtonRAL0n9VmRuRO+VMiKIH+Vo+0X3nUDCUB+7NDdwU6Y0ibOB758WpqbchSKjq6bY+6OJqZv1OPDYL4viv+pWM+g=
X-Microsoft-Exchange-Diagnostics: 1; BN6PR0101MB2929;
	31:tEfH0BrTctTK9ZLTq6UtWSsDFiu+WXQY3eKYSXucxDQsZ/owGSka8E0PctueXVDDH+MuUZMlbAaZ56aL02r56MwuOeVL9ihQhJeADdDDWQVK5w+1HcD8cY7QpjZfR8HWnxPr//ApVjHAVF1Jtr9TPvZOpy8ExjP3cQGGs4CZ0jvyzC1hlQ6OGjKbx11wqwFBlf5M5LuvfaWOWleNzIotmx7hwcEbAVLCryPrLnguPq3b3ChM3H9WMaosUVmuHrYwkkOAKg3wTgYF6t2OZlczyQ==;
	20:Lsjx+LM+VECr70I3DJY6yBo4r7lPPEvwfxxeaXHNI8LudO3Z55BUjmeiuIMEOviXLg7tnUymE13sqhImwNhZeFqbN68eJu/d/0ym8QaJLtdM8daYcH3rAEOLAg8+wQUDKGXY/WlQZ9oblbLukiefBfAhpizwKl47tbOy/Sf6k1g6VQvn0xY5ZkJFyLQpd9dD5ZLguCP9Angfd+XuvWDHvLzT/MxrUcuiG3FH2AgBPSNWmqIsmztfrBj0dHp5eXSHGvnZHt0Ax5rptyj/rVmTSoKaSl2jQSsgeCR0iTtI55FEzsy5xZaWGYGbixDmAb4oie0S8wRgu19kGT9KsBRdJA==
X-Microsoft-Antispam-PRVS: <BN6PR0101MB2929FE12AD4CBFFB9A361D2FABC20@BN6PR0101MB2929.prod.exchangelabs.com>
X-Exchange-Antispam-Report-Test: UriScan:;
X-Exchange-Antispam-Report-CFA-Test: BCL:0; PCL:0;
	RULEID:(100000700101)(100105000095)(100000701101)(100105300095)(100000702101)(100105100095)(6040450)(2401047)(8121501046)(5005006)(10201501046)(3002001)(100000703101)(100105400095)(93006095)(93001095)(6041248)(20161123558100)(20161123555025)(201703131423075)(201702281528075)(201703061421075)(201703061406153)(20161123564025)(20161123560025)(20161123562025)(6072148)(100000704101)(100105200095)(100000705101)(100105500095);
	SRVR:BN6PR0101MB2929; BCL:0; PCL:0;
	RULEID:(100000800101)(100110000095)(100000801101)(100110300095)(100000802101)(100110100095)(100000803101)(100110400095)(100000804101)(100110200095)(100000805101)(100110500095);
	SRVR:BN6PR0101MB2929; 
X-Microsoft-Exchange-Diagnostics: =?utf-8?B?MTtCTjZQUjAxMDFNQjI5Mjk7NDphVFc2eWlYVi9hWkpsblRmakh3UlU0Ymo4?=
	=?utf-8?B?aUhlQ3EvcXF4aUJCc1pqUWluai9mZE9BRnYrd3lRYWpoL21jNFlORW1IVmtv?=
	=?utf-8?B?d0xGMWRsbHdCWXB2Y2xFWXljenEvZ2tzclhzeGd5VmYwZE5ONmxvZHBvSkJZ?=
	=?utf-8?B?VVVFa2hZQjhvUmxKc0txa2toTDFRUU8vb0ZvUUdxQ0UvNW0yZ0t6bm1IUm9F?=
	=?utf-8?B?Wm8raTQ1T2FaNm8xVzFtSGV2NWlwVnNhMG9rN1M2NDdIeWxTczFBcWUycVBE?=
	=?utf-8?B?TDJZQ1NKTmkxN1BUaWNuNTcxMGdscFd3WXlhZm9GSVFBT2RFZ2MxdWE4ZXRE?=
	=?utf-8?B?RGx2VkZUVnJKRXNwRzM3K1B3YlpjRVRmc2ZnMGtyNFF3d3hMcFI1cktPbG82?=
	=?utf-8?B?RjgzNW1TOWtvTTlvY0NHejJRVmNDL3VEUmlKai9jRUowcVhVU3JjVmpySmdU?=
	=?utf-8?B?d2RQYzlMV0k3cmpicEUvLzA0SDliV1l3YjFGbTdPMXcwa0VsM0l6Tm16cnpR?=
	=?utf-8?B?Z0NMQTdnQ2tNR2NYK0V2WmNkS201cWY4bjl5OGp5aCtnVGhjZG9JSTV1RVV5?=
	=?utf-8?B?c3E3S3NPK1RlWHpaclhGakZUaC9sdG02K2NTS1ZwUlRKWWNNUHY1SzhMZml4?=
	=?utf-8?B?QU1mcjRQMm94U1g0S0d2dGtJWVNYS2pZaTdQYjU3MWovdGFTVlNZUXRZZ2hG?=
	=?utf-8?B?SHVmYVRmUnE5Nmt1YlB6MjI4bkJOVG1rRDlWeVNVNFloQVRoZFRYV08zV2g3?=
	=?utf-8?B?SkQ5dWxIbVhhakRuS1FmU0FZUWVjNDlIZkJXeitETmhMNU1PK3BsWi9JNEty?=
	=?utf-8?B?Q2t3dy80OHZTdTQzd2VBL0NTaGNURHFMK1JtS0lEMENTZFZpajl0YjdGTDlo?=
	=?utf-8?B?enlKZjJYSzFxYjg0Y09HY1o5YnMzTGhML1FVMzlVTHljRkg0YjMxRUY1c2lX?=
	=?utf-8?B?QnhheTFIMnBOeVM0ci8wQWN5a2laYVg4eE9PWnFmc2d1eWZZNFFqMGxsZEJt?=
	=?utf-8?B?Ylg5Qko5N0h4bG5UTDZNcXExRWsvUHpnc3d1VXdvUW1ocVo4K2pFbjdlZE50?=
	=?utf-8?B?ZjJLRTFLNG5lMHhOWjZJTU9VRE1VeWw5TFg2bGNjZFNFbW5sNXBNN21QSUNV?=
	=?utf-8?B?OHVxbGhCRTlYekg5M1NuejZQOFlwTnl3eEZGRDRNaXEzbTBrTEVWV01VTU1S?=
	=?utf-8?B?WllmejNNY0ZDTHRYQnc3amcxOVBKK0d2MERMZTZlUG1qN09sVkVjYkxVVG1G?=
	=?utf-8?B?eEc1NkM1SytsUWNNZjNPR2xNNGYrNExOQklTTzJGZFlBRGJ3T3RtV2xQeGNC?=
	=?utf-8?B?N0lyMnlqcDFUdjFiVmxueDJQakM5UVRzUkhTWHdjY25EYmdWSk41LzhUVUNL?=
	=?utf-8?B?N3dIYmpRWTlmMTBiTUVpbGpub0ZldW00elVVcVNDRHF0VXJFRUNyL01PRGlQ?=
	=?utf-8?B?RjNPczZaL1dkTkovK2NCclAzNkJSZytFSzY3bG5LeVY4TURzdHQvNEdBalFO?=
	=?utf-8?Q?pX32YrHB0RwTIu9o2PnY1W4XSM=3D?=
X-Forefront-PRVS: 0337AFFE9A
X-Forefront-Antispam-Report: SFV:NSPM;
	SFS:(10009020)(4630300001)(6049001)(6009001)(39400400002)(39410400002)(39830400002)(39450400003)(24454002)(377454003)(199003)(189002)(25786009)(110136004)(38730400002)(33646002)(229853002)(105586002)(36756003)(106356001)(6916009)(2950100002)(50986999)(54356999)(305945005)(53936002)(76176999)(31686004)(50466002)(42186005)(90366009)(54906002)(77096006)(6666003)(6486002)(101416001)(53546009)(6246003)(7736002)(3846002)(5660300001)(68736007)(81166006)(81156014)(8676002)(93886004)(2906002)(47776003)(6116002)(230700001)(65956001)(83506001)(65806001)(64126003)(4326008)(65826007)(66066001)(4001350100001)(23676002)(97736004)(189998001)(478600001)(31696002)(86362001);
	DIR:OUT; SFP:1101; SCL:1; SRVR:BN6PR0101MB2929; H:[10.0.1.79];
	FPR:; SPF:None; PTR:InfoNoRecords; A:1; MX:1; LANG:en; 
Received-SPF: None (protection.outlook.com: xevo.com does not designate
	permitted sender hosts)
X-Microsoft-Exchange-Diagnostics: =?utf-8?B?MTtCTjZQUjAxMDFNQjI5Mjk7MjM6KytROEkyZ0x4QWJwUnJDSzErYURvclh6?=
	=?utf-8?B?ZkhYenBuMC9pNmprRWFzczJrd0tVMjlxY2VnTTJ5VndjeXk5dzl6Q092UHFm?=
	=?utf-8?B?OVRCaVNoUzZhMkRoYnltaXA4d1BVYUM2UFJ5UmRlTnVUNzlrK21oNkN2aXVK?=
	=?utf-8?B?RlRLcXNTQW1oamh4VVdYb0VXamhoNE80Z0NGdXV5dU9VcUYwNWVIRTZjcFhn?=
	=?utf-8?B?UXpTNFR3SXpDSjFDRTFUc0gzVHVkRE1OZVJNZEZPYjFVdkdKSENsLzJqOTJJ?=
	=?utf-8?B?d3dRSXZ6L09RaGg5dElrbFFEOTVKWW9UWmlCbE9tT2h0a2ZCTzJyOXlVT2Fa?=
	=?utf-8?B?ejFKTnowaWx1SHA5VmRBdkU0QzZSYU16V1VkS0JWU2NkNmVsTktsK2RUVlQy?=
	=?utf-8?B?TFpsd0Q2UkRJZVJOaXdLMThRTmE0MytjUks2c2RGSmNGTU9KK01hZ1hDNk1E?=
	=?utf-8?B?VkpzbkYxaWVvbmdMWjhIaG10a1RXbkJOQ0I4SUNyVEpmWFI2dmVJbENIT3Iv?=
	=?utf-8?B?aFNMMzBEY2hRL00wcnl0SkJvVGdCTnVWVU82eE9Ld2lXbURzc0ZMUHFCSDhn?=
	=?utf-8?B?N0FTYkJwRkJ4Y3JjUXNWemxwZnFyZ0NkSE03SWZDSFF0QzNub3lvaGljVFdB?=
	=?utf-8?B?S0cvTndkSi9iaCs4b29UOVVDYUQrVjhFQnlsa3FOME5yNTV1ckR3bmhhYjM4?=
	=?utf-8?B?UE54V0xKN3pIVmdPQmtZMmY4RVhyRUN3by9WMDhGMGs4a2pSaGZtYWg2eVlT?=
	=?utf-8?B?UjNwUlA3ZitGaEtXcGNveW8zMWNjaFo5RVk2TEVrNGFQY3FJZFRoUkFyQnl6?=
	=?utf-8?B?RHl1UUZHamF3TCtUNXpGUVZLZU5yaENCSGRvaUZhM2RXQ1hITHZDbEhDS0Mr?=
	=?utf-8?B?dHdRUjVyNGRzUzkwNXpqSjlBMzhhV0NGMUx6KzZGWVgvNXZvK2JXTkdUS3p4?=
	=?utf-8?B?NEJaWjNJZy9oc1Y1Ung2YVBCK1B4d1hRRmhWSHEyamxsWUtobUhMUHVzSzNq?=
	=?utf-8?B?K2F5dE16dzZHcWJZR3g5QS9jeWJwc3V6eUNYdVpNQWdnR2dkT01VaG53RDVq?=
	=?utf-8?B?cFpickNDTzMrbTM4M0pQQzZBUXVWd0cra0ViSElyUEEwa2pXM2xYWXFVc3dV?=
	=?utf-8?B?K0xkTlBYM3pGQkFSdW5mcjBSVnRoTmdROHBKY1pzWWpneXYyWmp0MGhCMW1w?=
	=?utf-8?B?RldwUHFvN0lUQ3dLZExoY1JpdnlhODRRcTZISUxVR2tZRENtZ2k3STRFZmhP?=
	=?utf-8?B?OVZaOHlMaGViNFJGV29IT3NBeFhsWE1WUXJPekNOSFlFMUliTlpidkV1Nkp3?=
	=?utf-8?B?SDNoLzRCZldSS05BdUpSRFlnaldRM3V3N2xPZHFtSEpEdkVROWVMU1NMUlF1?=
	=?utf-8?B?ckZLUVQwSkMramVOeklpWEFvOW1idS9EdXI3RHpBUE16ZUhFakIzclR0SXlO?=
	=?utf-8?B?SEppRzl0SUM5NE9rMzdwVEs3ZThLWVNJMnRHOEtHN3pYT3RUaDk1RjhqMEMy?=
	=?utf-8?B?M3B4Z01jY3B6TmY0VjBIZlV4OHl5dzBGejJqaFRzeVpKc2NzUCtKSEUrdHBh?=
	=?utf-8?B?QnBKeFVTeUF1bndMYTRFVTFzOVlqN0tzVXZ0TWhnR01CY3hHUVppaTNTVEZk?=
	=?utf-8?B?ak5CeDY5TGJOd1NkcjhWeTAzTk9Nd1JKeWdOYWJKMkY4NUNlbmFWenYvakM3?=
	=?utf-8?B?S2xJeWZadzByTnNzTlN0N1JrWVErdGhVb1locHlyQUhMT1UrQWc1czZWMEg5?=
	=?utf-8?B?TEJkWWJzVVJtZ2YySFJnbVY0Um8vaTVwaTlSNkV6cEdhcm5pcWxFMzZSa1ho?=
	=?utf-8?B?N0lXeGYxVWNZWlBNUjF1VHpKZHpmV2t5UDVmSHZjSFZ2VnNvUm9uU29OalZQ?=
	=?utf-8?B?VHZBZUdtUGI5WVNYTzUrQ0NaVC9iUzZDRHBLMnI5R0J2dFhacDR2VGhwRkt3?=
	=?utf-8?B?b3c0LzFnNTZxamlCdVp4R3J4cWp6UnlsSjdQVVNFZXd4dVRzV0tsdFdFSStm?=
	=?utf-8?B?SUVZOHJ2WjdXakpMOHc0dENrQjRKcm93am5wRkJoZEJRUWg1SkszMmdHbFZ2?=
	=?utf-8?Q?maNTV0=3D?=
X-Microsoft-Exchange-Diagnostics: 1; BN6PR0101MB2929;
	6:cti5hgk/4ZsIQ8L8M7OwzLAAfgReCICKhxeFStoRgrx3wFVHVbGslpXVFEnU3DJO0g72ytppeT0JUrDzshfX+G4AZcfVFNvSLxtnwLMQQIIliPfApREIPONZixUxgT1TXC7gfT8SbAru9BeV5puwLfBvG3oQ5nPhh7Nl4a/6wEBPqIsTcyJy4NnW9VNVS+59MHcmSsEjkk06anjhg1kef24qPxXu5I3b/96IHZ2X/ribaPb82iVUfSBKUg08+5KbCaH439kV+FUPmApFX9xL88Ddxv/H5/OuCRz4KC9O9xBM2L0lXFfBiUlcBFJD1MJ+ucxG/1UiYAC1k2wkxRzNEaF1bG1MbivmOl1fQOjeKnNoVa8/vben14jlJHKjX1P9Zks2rKef8dru561f2HHmRgFvwu4l4gyya64O58coJgMLOsbR7kYPjKfAhaUAK1zM6NPGHoNSiAFpJhRronV4sYrb2cNvyAV1n4Iyk9rKd9pl7tdeM6/icVvuNxUJ7qPjAgcBIHh42pxWPAcuntcXzQ==
X-Microsoft-Exchange-Diagnostics: 1; BN6PR0101MB2929;
	5:N8q6Km9XE3zIaDgTJcu4iQ9e6n/sNt4nHE23tN+OhDOABllOA4dibHT5Wr/xLQKztSlDiEMlsPjBjbgfrNrhglgSB0Npu/Q0MyS7uFDUwm9mQ3FhX6AdRJ/1iaK6r0ybQnkS6+RnLnd91eGYtrR0BkuWwYCEu1GAQf+oIFsNPevHZ7iYTa59LRhiPwMC/gG12Ds6p/0F9VAS2zlpNydCiSXKjYo88VdbC6Cfsbrsd+/U13MWUhGbQWBayk5Qg9v9IWlIH1YnFxcDX4FRwv0vkRT+9E9Td7wHhzzAM23kaqZiOU5sJi4BVHwUsH5mgzWKuWv7FqgBJwnx8b/alkU51E7RPY21dYN3DAYNvO94x4c5KVxMRzJbA8sVOJ3358UYy58fMllMrgLmZ3FsLRj2XhL+0MBzqW/QnjNQa0Z0hJfflk+6nq4jagFjK4ojKXBEYJFy0BU5C2ROASG6BO+y26rSyX7gGZulq3YtkhYYYXu0fmdsbrwf+tO1xWsIIus3;
	24:Det+omuKiwvKAJ09vSQJEiI1BkSrUq7Q05tuZECsgEaoKyiBPiKXuHcgfW7Ta++qEShsTVRIwaPA6W5QENXpjMJSuRWGKYgWyzqv/3+wPRk=
SpamDiagnosticOutput: 1:99
SpamDiagnosticMetadata: NSPM
X-Microsoft-Exchange-Diagnostics: 1; BN6PR0101MB2929;
	7:ts4I8qn/J7zFyRTvjHNyX1ooYwYPUJR0uW/2227Tsh40qOaMYjxkT53p8c1FuKrd6FoJ+SKFvMKYy0kApHTMx393BiZPcfeKNOd/ISfcFoXNVNHRaJ+M9q2fqRajQI33t0lRx7//QezTVIujL9Vb3YyBc7zR4qGoCjhRRNG6xqCZaQj4+Vsk4barIs73eA9MeBDMwhHePBwbW2Rc9GffLYwtJgyCp6y56WgBFF/bJyeQ24Zf4uKn76Tcvuh6gkx4wx8Ksn+rS/Und/N3a8IUUsbvTkc6NFSwRVK7Ns4X9hUk/uEEO5WjVUdTlWH+dKwL0B8NMjjFBD8rwxBRAhNpmg==
X-OriginatorOrg: xevo.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 13 Jun 2017 16:56:24.0979 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BN6PR0101MB2929
Cc: Jan Kiszka <jan.kiszka@siemens.com>,
	OE-core <openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH] tcf-agent: Fix daemon termination
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
X-List-Received-Date: Tue, 13 Jun 2017 17:12:26 -0000
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 7bit

On 06/13/2017 09:52 AM, Burton, Ross wrote:
>
> On 13 June 2017 at 17:46, Martin Kelly <mkelly@xevo.com
> <mailto:mkelly@xevo.com>> wrote:
>
>     Ah, I was checking meta-openembedded by mistake. Thanks.
>
>
> The Best Known Method is to have a oe-core clone that you use for
> pushing stuff upstream, and then you can just rebase to see what has
> been merged or what hasn't yet merged and needs rebasing.
>

Yep, I normally do that, but I have a few patches in flight between 
OE-core and meta-oe and I had forgotten which went where :).

