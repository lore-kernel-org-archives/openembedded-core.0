Return-Path: <manjukumar.harthikote-matha@xilinx.com>
X-Greylist: delayed 84145 seconds by postgrey-1.34 at layers.openembedded.org;
	Thu, 28 Jul 2016 21:46:37 UTC
Received: from NAM02-CY1-obe.outbound.protection.outlook.com
	(mail-cys01nam02on0045.outbound.protection.outlook.com
	[104.47.37.45])
	by mail.openembedded.org (Postfix) with ESMTP id 5B5376072C
	for <openembedded-core@lists.openembedded.org>;
	Thu, 28 Jul 2016 21:46:37 +0000 (UTC)
Received: from BL2NAM02FT021.eop-nam02.prod.protection.outlook.com
	(10.152.76.55) by BL2NAM02HT010.eop-nam02.prod.protection.outlook.com
	(10.152.76.220) with Microsoft SMTP Server (version=TLS1_2,
	cipher=TLS_ECDHE_RSA_WITH_AES_256_CBC_SHA384_P384) id 15.1.549.5;
	Thu, 28 Jul 2016 21:46:37 +0000
Authentication-Results: spf=pass (sender IP is 149.199.60.83)
	smtp.mailfrom=xilinx.com; intel.com; dkim=none (message not signed)
	header.d=none;intel.com; dmarc=bestguesspass action=none
	header.from=xilinx.com;
Received-SPF: Pass (protection.outlook.com: domain of xilinx.com designates
	149.199.60.83 as permitted sender) receiver=protection.outlook.com;
	client-ip=149.199.60.83; helo=xsj-pvapsmtpgw01;
Received: from xsj-pvapsmtpgw01 (149.199.60.83) by
	BL2NAM02FT021.mail.protection.outlook.com (10.152.77.158) with
	Microsoft SMTP Server (version=TLS1_0,
	cipher=TLS_RSA_WITH_AES_256_CBC_SHA) id 15.1.549.5
	via Frontend Transport; Thu, 28 Jul 2016 21:46:36 +0000
Received: from unknown-38-66.xilinx.com ([149.199.38.66] helo=xsj-pvapsmtp01)
	by xsj-pvapsmtpgw01 with esmtp (Exim 4.63)
	(envelope-from <manjukumar.harthikote-matha@xilinx.com>)
	id 1bSt8R-0000pC-9Z; Thu, 28 Jul 2016 14:46:31 -0700
Received: from [127.0.0.1] (helo=xsj-smtp-dlp2.xlnx.xilinx.com)
	by xsj-pvapsmtp01 with esmtp (Exim 4.63)
	(envelope-from <manjukumar.harthikote-matha@xilinx.com>)
	id 1bSt8W-0001c1-0O; Thu, 28 Jul 2016 14:46:36 -0700
Received: from xsj-pvapsmtp01 (mailhost.xilinx.com [149.199.38.66])
	by xsj-smtp-dlp2.xlnx.xilinx.com (8.13.8/8.13.1) with ESMTP id
	u6SLkZ0S001154; Thu, 28 Jul 2016 14:46:35 -0700
Received: from [172.19.74.183] by xsj-pvapsmtp01 with esmtp (Exim 4.63)
	(envelope-from <manjukumar.harthikote-matha@xilinx.com>)
	id 1bSt8V-0001bm-EP; Thu, 28 Jul 2016 14:46:35 -0700
To: "Burton, Ross" <ross.burton@intel.com>
References: <1469658069-20128-1-git-send-email-manjukumar.harthikote-matha@xilinx.com>
	<CAJTo0LYiDZb676r+kC-CupWhAqLFJvNZv+rMXP7tTcGT2jNu_g@mail.gmail.com>
From: Manjukumar Harthikote Matha <manjukumar.harthikote-matha@xilinx.com>
Message-ID: <b1b408b2-cfe4-4090-5d2b-d6749e345fd7@xilinx.com>
Date: Thu, 28 Jul 2016 14:43:38 -0700
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:45.0) Gecko/20100101
	Thunderbird/45.2.0
MIME-Version: 1.0
In-Reply-To: <CAJTo0LYiDZb676r+kC-CupWhAqLFJvNZv+rMXP7tTcGT2jNu_g@mail.gmail.com>
X-RCIS-Action: ALLOW
X-TM-AS-Product-Ver: IMSS-7.1.0.1224-8.0.0.1202-22478.005
X-TM-AS-User-Approved-Sender: Yes;Yes
X-EOPAttributedMessage: 0
X-MS-Office365-Filtering-HT: Tenant
X-Forefront-Antispam-Report: CIP:149.199.60.83; IPV:NLI; CTRY:US; EFV:NLI;
	SFV:NSPM;
	SFS:(10009020)(6009001)(7916002)(2980300002)(438002)(3190300001)(199003)(377454003)(189002)(24454002)(86362001)(7846002)(77096005)(23676002)(4001350100001)(92566002)(64126003)(33646002)(19580405001)(19580395003)(76176999)(11100500001)(65806001)(63266004)(65956001)(4326007)(81166006)(47776003)(2950100001)(189998001)(81156014)(50986999)(54356999)(106466001)(110136002)(50466002)(36756003)(31686004)(31696002)(8676002)(230700001)(305945005)(9786002)(8936002)(586003)(356003)(2906002)(87936001)(83506001)(65826006)(107986001);
	DIR:OUT; SFP:1101; SCL:1; SRVR:BL2NAM02HT010; H:xsj-pvapsmtpgw01;
	FPR:; SPF:Pass; PTR:unknown-60-83.xilinx.com; A:1; MX:1; LANG:en;
X-Microsoft-Exchange-Diagnostics: 1; BL2NAM02FT021;
	1:zXrGNWiBTi2FmAqvi+cuz+iin6GNM5wRw0i2DyzHL9O9COGLOJ8B+ka8I1So311MdKhT7jcu5d0J+UXdifUbr/5uC0v3u0U+TA7+yUgR51PRY2OW1RKWNmtpkxLZBvy9y8gvuTUj7DHlOl+euxIz0Ry3mjg0a7IDuzLn/eitNTOxTFOoVdtbj0QrwqWBSDwUgdrtpJ4kceRDhap//PnsEKiVfp3Gds7eAEd2aFqCMYsgO4kY6XaeIvJThhenJMzgZpZtLwlteFI6EpeDzA5vS4l7HoRmW3TyE3x75hf8GyTlW7e5qu6RdNHWiukzgJ41Nr6TOCb/79xO1j0hNuuW0K8d+SCOX84u7wZO9dV0uOO6S8oWApMFe0vXs0cavzrqrr8Jk7V8LfMKlyMGBvoXBd6PfT2rWTThBlsYwEKL2a5QWo7QMIidtZuAMu994QzUqhwf1cYOTUqHP29bXJitcCVWfEPRxLUYCry2DJxzC4DzDxmk6RnjHhMzzG9p1kKEC5c4g4JC2e41qvxP1ktqfi8h3VOHMfU1MIJ4DBj8c16f6aqR/wTyE3nE9akz0LZfFdzVrqMlLsh/dcYqz9AD7ka5O/Hliq8Zxa5Pld0oiWWLnstaEjiyPzwPVtGYw/Sw
X-MS-Office365-Filtering-Correlation-Id: 9d4bd487-7def-4b02-f8ee-08d3b730a66b
X-Microsoft-Exchange-Diagnostics: 1; BL2NAM02HT010;
	2:W0+3REqfY3/xLl0+Y2AGreRVy5ji/LqTblYonWYLFpDkBy5o/7x7tkehhqlqHqGlffEsUPYJnvmByiL2gxDwTIXtz2VtTJTWxj/FMzQqllLsf161/VEkPLZzvNwEnUl9VT8ATijQOmyF7jrq4ULObPBkqkuKFrPBKfBbtAib5FGNKu6bCq7QcmLZW63qWYRy;
	3:VC9OPT40A/IGgpQ/zeXKM3gy02T3Mf4DX1GRWgXTouK+2OioEy0SWqZgYgzWIKLwBc42ln2rX8voUDCwjlobfDvSaG/oFtdfCFvfGsZaJa717OY+0iVpC2Ngrkg5Fqo6xOZZPmkm55V4RE46bIK/urX35bk7060vU1FHl7eWZHc6UgoDHoWSdPu/b5MICKc1HzAvJEpm5+4gOD7ZvIqJRNvery3CWAiPtPp8U5uqFMT7aRoxwW0cqfsyZQp+xOiq663jplzHGg974IsvRhInjw==;
	25:9ALpdPgClT2u34ZM9Tmly8Ipf+lv9lxp9W60SK32Z4nZsB9tFErBie1OW4moA2epWqi2EZuNycnpk2bcN+ZmaaloyM50xVGXjqHFWWt0l4BLPc8c+XP7yegiuz5zQjcXQA7cR7Lv4gi9qHC5EWbsDS5tlT5b5jXiS/nab6HyBbZ5H0qtfFrAqTG8ZQuuaOFQudbnf/GnTJOm1ob19juNGQKQbsBlQBCdACiHUjnpLxK0BWD5f5EGuK7fcGc2xXWwUFI75kQ9J72OTiYnHhPRswrBsjsVdWg8Mos0tm2TuTeYXDOfOhY3I89haRaF5GiDu8HXJCV7LlqCbOuzYO1Uk0txjfNhJ3bnIUaX6+Doc0DTAYKRvg6gQFlJzJhhg8xnt2ovAsWj76oxjnU7GW1VUGCjJPsEhQyStvbH2tXqnpw=
X-Microsoft-Antispam: UriScan:; BCL:0; PCL:0; RULEID:(8251501002);
	SRVR:BL2NAM02HT010; 
X-Microsoft-Exchange-Diagnostics: 1; BL2NAM02HT010;
	31:ffen2KziezSE74QT7/lp3Iiu+gelHjhsGX2911NA7njhT1VdJAxdgovPzZJIx7UiNTgJvd9CnVO3vTeM6EzJNuylgWomi1SoDPhs0JNxj1L+/PVXaPYywbhp1KRm7Qg8/CkgjfsmJrHu62gw7rX1T6i+3ZEM9WGr6twAHxzQq9IdrJWwK3CjjcZpWNZIS4fexUUT0qpLwBq8s8eoOkdcdvM1LOjVOHM9lcwNwALOefQ=;
	20:UxzxriSBPyXtSrpV3OACc52bGJsz88hec/wjsRRLKQnV2Q++cbK9E0OEIsvmIxByoYNO5fmzPA4WWR+GhMWssvHHWIt1qr4Io0FxXgILmLM/ZNRwkqzsjnhc7RPahoDZ0x+wkXnbbCWVHlPa+dhGUK9rO6ma5ENe8UeCLGR+kTJDQnOzAeSIXoKOLII892ZUrRtywy/eyHPkoqQWlsgu+ADgYXOAB/LLdVqm/YbhojlQ/TpPVcI/fHm9eFzrOGteQeRHHPmJZ2cVzu2Yvy+KrUPbouX5kNr7A0T7Jz9MDBiwokYLf/CQEfENkfEeDUAXCKSa2D+6kyP6DUQwiptRhHwhJhNSUW/uxmquZbm/m6EEafb8fu4e+m8U7allNmRW2GHaVFvW9hp6eLHxGIk/Ct02UU4xFoFur8Q+6aVzz+V6AU240jc4Ww+PCcekZAemYTFtSliPo8pmV4kCPz8+i7goGfbicaFC/i5YnzitVkf1vEcyMjtZWdUyYbAlVSj5
X-Microsoft-Antispam-PRVS: <d9c1a5c25e1446519513a8dab6d23af3@BL2NAM02HT010.eop-nam02.prod.protection.outlook.com>
X-Exchange-Antispam-Report-Test: UriScan:(192813158149592);
X-Exchange-Antispam-Report-CFA-Test: BCL:0; PCL:0;
	RULEID:(601004)(2401047)(13023025)(13024025)(13015025)(13017025)(13018025)(8121501046)(5005006)(3002001)(10201501046)(6055026);
	SRVR:BL2NAM02HT010; BCL:0; PCL:0; RULEID:; SRVR:BL2NAM02HT010; 
X-Microsoft-Exchange-Diagnostics: 1; BL2NAM02HT010;
	4:8v3Cg7CRrkwbbtjyts9hrJMLW1a5XGs34hCnFq1Mysdm8FDatnLQbwG4OfEKfjg8sLNZlofIxpOGf2NEhFeOJxSbh05Y90rW6nay5jqVnOC/MbdAnUon06xFZGowFW2sXjk1LpN+y6dJVvoh3QXQtFdxJgqdl1NgEZwmpKSN21Col6uv5hevuxA5wQj2eGLzr9IoS1tEL6hmLPRvFj7MiaPx+KomfDbfS40OQKx8TTwb7bNHPANQOfP/O8B8Bs+aky715A2m4gX2sV0kTy25mk3MsRTWCL9IBz7upDfc3CkN5hHxL7h5SoqbgC02KOrKjor66Haz/L1I3zh5hzmX8yDlp8EdpHM2Gd4CrKafRZTX4IVntAIpTVwTpqjeui+TIfYv3rONYMN0wJZvMSg0NYgd/44KAEw6qLIr8/52u4FXFtxXKMIpwgj6QxWsv3IeLx/DzZesgT9hEn476GK4d4PH+wgyF5yQUUriJW5yvJcfI33jlGPvl/l0roG22TcyS4oqJw9DeWs/y9WmQ6e2lQ==
X-Forefront-PRVS: 00179089FD
X-Microsoft-Exchange-Diagnostics: =?utf-8?B?MTtCTDJOQU0wMkhUMDEwOzIzOmlkdmxVQWNlOU9rcm15SHpDUnFMWDZ0enla?=
	=?utf-8?B?c2FaUjJKWjQ1MFBhZWhqbCtBZW5CdnFhVWxDeEdlYURrR2xRYmdoQ2xtMVo4?=
	=?utf-8?B?aGs1cElUNWFhYTMxVlBiWXhLK1NjZnpXRUN3dHd0TDMxTng5UWpKS0kwYzNs?=
	=?utf-8?B?bDlMRDRFOFhhek5VNlNPTGRVbmw0aGs2b0hSUXNJaDRuQzZMQUJKSzFqbHUv?=
	=?utf-8?B?anduMWFNMVhGK05KZ3R2b2hvaHJobDNGUnFYa20rNXc2KzJ3d0tKQnMyKzlF?=
	=?utf-8?B?bUlpbUkwT1JnTEtrZUNvQ0RiUVRkSS82T3hYdTBvZVpQSlVubnlpSkpXVk51?=
	=?utf-8?B?b3JHZzEyVVk0RjN0c3puY0xXckNvd0FyMFRtYUwxbW9RZjYxSGphSzZUdGYr?=
	=?utf-8?B?V1hmZEp6U1FUVEU2Q0k2Si8vSjhOWWcxU1dkUm5vZG1Ud3BLZlRIUUdFODFl?=
	=?utf-8?B?UkFqYmZTUW9LekRQR0o3N00xSVdqazBFQXE3V0daS1ZMQllSUEN0bXZDamty?=
	=?utf-8?B?cU14T1BMUjRoUmY5c3ZLZTBXczBCUEFoQldkUU1lemxXTm5xLzMzZ3NtdFNJ?=
	=?utf-8?B?UFlRa3pXV1pCRlNhbzk0TVRhRzhRaTN0WkZIVEE5VExCcXdDKzdVYWEya2dM?=
	=?utf-8?B?R2duYnA3c1ZtVkN3Yk0yY2J0YkZlTVEwcGpvVmxyUUdvd2l0RGkrWjBSWUdl?=
	=?utf-8?B?ck5kN2dkclF1b0VzNk5tRlVOYTQ1OE9pN0pPVi9tZkRDTHAra0x6cDZFYkJG?=
	=?utf-8?B?TTZrczJIWlZyd3pVeXJRU1JqaG1hUS94bmxFRXBMK295ZEhaaW11bnZCRmV4?=
	=?utf-8?B?aUR0Z2djZHMrZzRObGQwUitBYllZTVpRdFovNXdPZHBWQjVzZEhIb1E2WEtk?=
	=?utf-8?B?L04xeTQ4VXNOYmlUVTlvdHlTNys3ZnFDeERwbW1WandUcG9kZzZmTk5HOFEv?=
	=?utf-8?B?SGpGQS9jQVVFTDJTUk5nbElvbHEwdTB4R01ENEZkWXh2Sk50TE1qZ21aMi9y?=
	=?utf-8?B?ZmgwVUV4TmtkT1VjbUtoRlpKWVlCdTNzWVpWRGxLRUZ1cWxDbitBSnZvbDZM?=
	=?utf-8?B?U0FxcUdncm9lSzNZcXJjSGVhR2V4Q1VRb1hDU1p0UDdPTGhBMnJzT0ltYjJY?=
	=?utf-8?B?bG5XT3F1aDR5ODQvbW1KTDFlMkRtQTAwRmVmQm9OM0o3cVBab3dhcUdFanBV?=
	=?utf-8?B?Z0tUdVQxVWNrZGJmbFB5QXVEVU1OelBwZ1BXakozSnlyUUtHNldLdEpOZy9S?=
	=?utf-8?B?WHQxSmUyalVjamdCemxZYVVuTWJOTExKeGx2VkpoeEc1a2VLdWRvN2o1NnN5?=
	=?utf-8?B?eWZnNVBsOTMydi9BOXIvUWtkSitTQ1lyU2xpbVpWdkczQlRlUXlqRll0K3di?=
	=?utf-8?B?N204UWhWaXh6UXhwSTFscVhjTlBjNGVSY3FOYUJBeUxKaUtKT0VUZ1hFQUxD?=
	=?utf-8?B?dG1vV1dFM0lqSDc1UFh1bDgrV1BGSHNGV2ovZG1MVk1OT2tXS2l3WDBHRUsy?=
	=?utf-8?B?RlhseVlROVBmTE80UDByTGlEZmY5QUVNME90NEI0WEs2MkVCNDBCbWdJQ2Qy?=
	=?utf-8?B?TEl2dm5kUkpWNjQxbStoVi9VK3N0RGtpMmdqN3BYZUxSSHRUVXNMUERZQmUy?=
	=?utf-8?B?TDFMZE1oaHdqME52SDhUYW9rY2RSZDRDaG5ZUHZmOE0wTjNxbUNpSVRVMWlz?=
	=?utf-8?Q?sL2zVtHCaZcATwhbMs=3D?=
X-Microsoft-Exchange-Diagnostics: 1; BL2NAM02HT010;
	6:CCABYlfbzTk+6fy8CALzY1S7DxyadxQdDL+UKHgbdi2zJDo8SCK2o7draUlewX8MFJlRmiGmMBFfU6WXxN9zuOY/AFC6WQg1W9bOKhgHMFkYF4BmRaotWvNBas2yWOEIHQ12qd9fnrk+wTLfeY45PKsOxT0WkWk3fbHoUKn+qbjzdvBiw+OoKgg9UnobX6Dt4nQJw2O535kFLxDqdvi4sziN/bUnre2lKSmTyKi2WELLyIoa9jmWTgKKbfX4/6PUybsDqMKmDFvFL84ASIVDmcK++Qufo/9IHBvNgSZna2IIqJFSjwWwxaa2Odt4CtHvjwuPJ1QEv3lfzL/J0dQcQA==;
	5:/V9miwFHRut08U7j6wvQCx1Nc5tWDM5JtfzdPauJ+bq4D1b6ZbGDN+iZ1kIRIysXOMFzMmWDI7Pk4/dOFR6fT3Q3X4kpzOmpSYGr05sgrQjJWmoAogyHMVqFtKHfK6404Lwr//Z7mHHak5OWcIvTvg==;
	24:B51LD2ofiVMphmy4dh0byHvEhSI+EuCPdjq3l8lLfzto8WrvIyFLMF6I/vJswYAFnXZXGb4Nofs6f7g11eBgNmz2syqEqUTZ9+s3IXHY5oQ=;
	7:M9mYx9F7tTeb/0ff20zb1oxDINgD1pnbt8Y+FHiktJcS4ZPsWtR0n2CVTTW6IGV4oieuqdkNJlcvAp8/O/gMLU6h6ZjFs4MQhxpxxY1ff5wrntDMy2cEhTTqYO505dBHcTqG+6uegc/LMoqJyJLYFc9u+dUqIqsE78hlnc2WkVvS19JuanjH0M+ahvewS2ee4CMD6AsOb3tRf4GjMralzKuaFi02+2f6d/rczjPKSKwJbcuIf1bib0Ophes/v5cl
SpamDiagnosticOutput: 1:99
SpamDiagnosticMetadata: NSPM
X-OriginatorOrg: xilinx.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 28 Jul 2016 21:46:36.5747 (UTC)
X-MS-Exchange-CrossTenant-Id: 657af505-d5df-48d0-8300-c31994686c5c
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=657af505-d5df-48d0-8300-c31994686c5c;
	Ip=[149.199.60.83]; Helo=[xsj-pvapsmtpgw01]
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BL2NAM02HT010
Cc: OE-core <openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH] u-boot.inc: Enable EXTERNALSRC build
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
X-List-Received-Date: Thu, 28 Jul 2016 21:46:39 -0000
Content-Type: text/plain; charset="utf-8"; format=flowed
Content-Transfer-Encoding: 7bit

Hi Ross,

On 07/28/2016 06:02 AM, Burton, Ross wrote:
>
> On 27 July 2016 at 23:21, Manjukumar Matha
> <manjukumar.harthikote-matha@xilinx.com
> <mailto:manjukumar.harthikote-matha@xilinx.com>> wrote:
>
>     This patch enables building u-boot using externalsrc
>
>
> The commit summary should mention that it's enabling out-of-tree builds,
> of which supporting externalsrc is a side effect.
>
Will send PATCH v2
> However this doesn't work for me with beaglebone:
>
I had tested it with meta-xilinx layer for a zybo board. Will try to 
replicate the error you are seeing.

Thanks
Manju

