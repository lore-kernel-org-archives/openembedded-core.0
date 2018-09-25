Return-Path: <jhofstee@victronenergy.com>
Received: from EUR01-DB5-obe.outbound.protection.outlook.com
	(mail-db5eur01on0130.outbound.protection.outlook.com [104.47.2.130])
	by mail.openembedded.org (Postfix) with ESMTP id 33359793FC
	for <openembedded-core@lists.openembedded.org>;
	Wed, 26 Sep 2018 09:21:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=VICTRONENERGY.onmicrosoft.com; s=selector1-victronenergy-com;
	h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
	bh=q8pcMGKC3Uh7LcJq08dx3Iqy8Gnf6S/AZB3zNf9fMio=;
	b=mvyaRQAWULkU09V87hzWp2+tjGoKNhrt33gqBcl42PM6b4c27ru29xQjQ68OqusZx54ORNM94pLNiqi7+3wijrieHY9tX8CaXOuZQAh6afG8OlantxWtAZIzh+16MMC+UmelBksZwCEhGmjzXqBbU8VwnF2s3dshUW1+ZvAeUDg=
Received: from [IPv6:2001:1c01:3b04:4900:3966:5b72:abed:e1c0]
	(2001:1c01:3b04:4900:3966:5b72:abed:e1c0) by
	HE1PR0702MB3643.eurprd07.prod.outlook.com (2603:10a6:7:8c::29) with
	Microsoft SMTP Server (version=TLS1_2,
	cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
	15.20.1164.15; Tue, 25 Sep 2018 19:46:46 +0000
To: Alejandro Hernandez <alejandro.enedino.hernandez-samaniego@xilinx.com>,
	openembedded-core@lists.openembedded.org
References: <1b958e43-01e8-c958-7c5e-1f5f3aca227e@victronenergy.com>
	<b34c562c-b738-4817-8241-f2b02d00827c@xilinx.com>
From: Jeroen Hofstee <jhofstee@victronenergy.com>
Message-ID: <0311dc58-8a9f-4773-abf3-bfa90a3cfc0f@victronenergy.com>
Date: Tue, 25 Sep 2018 21:46:43 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:52.0) Gecko/20100101
	Thunderbird/52.9.1
MIME-Version: 1.0
In-Reply-To: <b34c562c-b738-4817-8241-f2b02d00827c@xilinx.com>
X-Originating-IP: [2001:1c01:3b04:4900:3966:5b72:abed:e1c0]
X-ClientProxiedBy: VI1P194CA0032.EURP194.PROD.OUTLOOK.COM
	(2603:10a6:803:3c::21) To HE1PR0702MB3643.eurprd07.prod.outlook.com
	(2603:10a6:7:8c::29)
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 399e228e-99d2-452b-e851-08d6231fa0be
X-Microsoft-Antispam: BCL:0; PCL:0;
	RULEID:(7020095)(4652040)(8989299)(4534165)(4627221)(201703031133081)(201702281549075)(8990200)(5600074)(711020)(2017052603328)(7153060)(7193020);
	SRVR:HE1PR0702MB3643; 
X-Microsoft-Exchange-Diagnostics: 1; HE1PR0702MB3643;
	3:MNk71gO3AE96pnZGEtiTHVmbLydr0NxiTFkLVrRPu9k2YkzNWvxeBRt2ABv80FyecyJD4oIxhEIh/frc0dfZVPlvPxaVSCcwxxZURIvRAz5oyihYS0DLyCEz+YIXtyeKFSzGFXRYxONCk5XYKqDNBPRSnR9ZG/xFF2s5fDq9rgShdZFskcLlTc/AGIAzB8DCaB6IHaSBFeE5MHCitPqHXrxEd3oeiuku6eJHrGAwTxv1MBabuEIUTgsAosfTLrog;
	25:xIKMuDMS+XOtb970bNACISuFp9Jiit68hHrBdpKBZVbSy9mUmuv2JRDFMUU1cKy+gZ9Vo9MObvgo8U3JEsXW/pfbcgOUa2YprmM3JnHYhPsdgTj6G6MsadHEIbgd77i0mMyOiYjpLO18TkK/siNmkax6y7vSkj8qm4L0tUKwI9uOzZ6AvUQ7XLoYDGYDblEzUVIMFwU6hJdUC4Cdiab16CA4aniNwChQXccDR9Ls4dzr8OJciTE3KYaBGrZTDyhRuG5YT9QSGLVJa6gelS0GXlHa3QOa3yukXKfpUOoaiHf+9sxpHguEqqIpsi5G40Y9y6e7PmLj7ZdtiGdZv0PvyA==;
	31:Cayz3hbvooqO3AUKGL3MF2JbgFNr3Xg4k0Le2rQgVJJwsv/J3eF5jq9951JGsZHpZ3OEeeI4F6WmLvzGX4EeA8qlSmpUWK3GiS2Uh8zZu0838gRcyHpTJ20dPN/2mJRUtl5SA9sAEN8k9n0GvxRLmaT65Sm6kwaVZCG8+z56ZTfYJMUjIVLz6kvU0/5kusD2T1cufK1W1qUsrU7UvA7U+kb+BiC0wFc1udybN1zFE9g=
X-MS-TrafficTypeDiagnostic: HE1PR0702MB3643:
X-Microsoft-Exchange-Diagnostics: 1; HE1PR0702MB3643;
	20:yre+FRjOBCqkKvv6wR2VtFGvxycxG+HTYYEw6yF8AZnksNYNRtfwa72w4E9F4e6m0D1IPf09gz32Z5doX6VAXzObCiUoHjNSSsfKdd5JxZgTPjzm0xGsPv3Gy4HlIVSsD7p9vo49tvIXgTFtgzv4s655ThH4l08W1/Bp1TDis5451hDWiLMyeFIyveZa51P6U019JJcfs/kchCsvopbeWTXnmGmQOUpyWvvHoAn68UTz7jtHFfS9FqVTJ0HdorIC;
	4:Ju69goX8SvJcWAJgUaTpL+/Hf3AzAiqULnpJ9iGzW9GOdI3Js1j5FkgnOOt3BjMWdUMX6jIrupzDjbmp07Ni27QGmR682gEV/w2+Q6Z/YdFgwPUtu0dCy3Pt63vBX6GeAZM3K1AB3Iisa5uFz95qauXqJ8LGope5f0BGUvXBWdutPshGdQ5D+4K1EUEzqYali0kwrXcOyqiYKKAuabRtPeQpqhmH9seCoBkh0UApjuL4o1vJbQ3TGcwakSc9GTk79ML+TMKjM+XNlKl129LnHA==
X-Microsoft-Antispam-PRVS: <HE1PR0702MB3643AE844BD7A024E9A3D30CC0160@HE1PR0702MB3643.eurprd07.prod.outlook.com>
X-Exchange-Antispam-Report-Test: UriScan:;
X-MS-Exchange-SenderADCheck: 1
X-Exchange-Antispam-Report-CFA-Test: BCL:0; PCL:0;
	RULEID:(6040522)(2401047)(5005006)(8121501046)(3231355)(944501410)(52105095)(3002001)(93006095)(93001095)(10201501046)(149066)(150027)(6041310)(201703131423095)(201702281528075)(20161123555045)(201703061421075)(201703061406153)(20161123560045)(20161123562045)(20161123564045)(20161123558120)(201708071742011)(7699051)(76991041);
	SRVR:HE1PR0702MB3643; BCL:0; PCL:0; RULEID:;
	SRVR:HE1PR0702MB3643; 
X-Forefront-PRVS: 08062C429B
X-Forefront-Antispam-Report: SFV:NSPM;
	SFS:(10019020)(6059001)(396003)(136003)(366004)(376002)(346002)(39850400004)(199004)(189003)(386003)(6346003)(106356001)(67846002)(65826007)(65956001)(31686004)(53546011)(65806001)(230700001)(316002)(25786009)(6666003)(7736002)(52146003)(2486003)(305945005)(52396003)(23676004)(47776003)(6246003)(64126003)(476003)(76176011)(6486002)(86362001)(5660300001)(2906002)(68736007)(486006)(11346002)(16526019)(97736004)(1706002)(46003)(186003)(446003)(50466002)(966005)(58126008)(6306002)(229853002)(6116002)(31696002)(2616005)(478600001)(81156014)(52116002)(36756003)(105586002)(81166006)(8676002)(53936002)(8936002)(34290500001);
	DIR:OUT; SFP:1102; SCL:1; SRVR:HE1PR0702MB3643;
	H:[IPv6:2001:1c01:3b04:4900:3966:5b72:abed:e1c0]; FPR:; SPF:None;
	LANG:en; PTR:InfoNoRecords; A:1; MX:1; 
Received-SPF: None (protection.outlook.com: victronenergy.com does not
	designate permitted sender hosts)
Authentication-Results: spf=none (sender IP is )
	smtp.mailfrom=jhofstee@victronenergy.com; 
X-Microsoft-Exchange-Diagnostics: =?utf-8?B?MTtIRTFQUjA3MDJNQjM2NDM7MjM6RFEvWjFaQmtUSkxlbURaME5mWUgyKzhC?=
	=?utf-8?B?OGxTd2dBVU5SVThOTE5mVmlleE56VTAwTnNVRmRrdk5kbjByVGlWREhrVWVw?=
	=?utf-8?B?Zm1aNGRVMDYzTWw5RXJQODA5eElTRi9IZW14bFA0VHBVbnJ5czBiNmJWVGxx?=
	=?utf-8?B?QnkyZVR0ME5CN1oyS1NIbmNPc2V0RUlFZUlVMHNJSkRNQm5lNEY0M3E4SUEv?=
	=?utf-8?B?YzlOLzVCYitHQXNQSGFEdy9UNWJ1NDFiVmVtN0dJSlI2cC8xTVFQMEJtYzJz?=
	=?utf-8?B?cTBlYzhVNmRhTTY1MGJSeGQvREVzK0I3a2tGTUwwbmJmTHVrcU5sNk5sTDNE?=
	=?utf-8?B?a2ErWTNWTHg5UWlVKzhKWlF0QUpnTVBtbzJxQi9VK1lUOC9KVzhlQm42TXVX?=
	=?utf-8?B?dGFyK1lhWHdiVDI2VFdycUY5Q2c2U1VKUjF4azFPMVNlVkhMVC9ybGhJSzB2?=
	=?utf-8?B?Smppejg3NzNxOUhsdVNuU1dGY1M5bGtoWEIweW9mb0ZBcVoyMUx3eEY2Mm1X?=
	=?utf-8?B?TUtGczV3ZC9zNzZZVDdOK2xZUnRMbGtkY0d2RmpIWWhISEVsd3ZaRy9BVjJh?=
	=?utf-8?B?THFCRGJtSjBzWlczdG1xSkdZWEFYSjFEbHduQlcyZEczM0xDWkdZK0dDQmJB?=
	=?utf-8?B?eTZJZVZBalR0S0h2K3JOU2liRS9xbm9PYUFxOGZuYmtVQkx4TFA1TmZDK1RX?=
	=?utf-8?B?bnRxa1FTYTBGSkxGRWtCUllDQkhxcXd1QVI3d2I4MVlDM1MveXRJUFVjcnha?=
	=?utf-8?B?RG14aDFQeC9oUmxjdTZtT2RIa2NmZms5Z2pMeDdDOWhZWlEwOFhucEJPM3NM?=
	=?utf-8?B?RERubmZibTRHV0wvcll2OG5leVArNHVLY2dKWEcxejJybU5wTmd2MjZtZ0U3?=
	=?utf-8?B?NmhwNXM5c2VwUHBCUFo4TmxONTkyMW5jZmI2VlZWdDB5TGVndlg4S3M0U0h2?=
	=?utf-8?B?ZXlRWW5PaWFXRURnR3l2SDdkUWdxbkUwN3pVQjVrQVA5NGZ3aGRSZ0tiSDBx?=
	=?utf-8?B?UkVWR2pROU1aSm9JUGtMZlk5MnJtZXZBUzNVbWxNQkJBQjByY2xaMHk3ajlV?=
	=?utf-8?B?Z2lmRXVselZtWTM0TmRqT2NZWE5TekZuaks2eHpVZkdvNHgrWjRNbCtveWhw?=
	=?utf-8?B?emwrSUVUM3U4UW1ZcDBXeWNwOTlQL0ZUVjF2b0REZGxzUzVLUUpkaC91Tklv?=
	=?utf-8?B?THVhYWFZNlplbmhLWmN1QzMxOFV6Z0dVTTVKaDhaZEpTUm82WXdpallNWlVL?=
	=?utf-8?B?TktOTlZNbUVrY1prRnRlRXBNRzdsT0ZrWkppbDhvNW5qL0h2Q2dEUG8xcWNs?=
	=?utf-8?B?WnF3RDhGYzBPT2pSWWg5cjVqaUVsRDFoSFBZc0VGb3dKYmwxcW5ZUWFDdW53?=
	=?utf-8?B?NXlvL3BTMkJsSmJIOUhSZmF2cUdjT0Y5WXVXc2ZTNVFLeVlqNXRoelMrYTZw?=
	=?utf-8?B?UTJEU0RXZkJWSEhNcEtmVkhvYmN1YXowb09tOEJETU5yMmQzcDMvNk0xb0Nw?=
	=?utf-8?B?UWV2RVQ2V3FnNm5OUWZQdjNNMWdXUWdidVBITFVvY3c3V0thNG1WSVgvSTZR?=
	=?utf-8?B?ZnppWHJDNUJwMVhUa1JHZHA0ZXg0YzFwNUZVSzdseUJnbFExWkE2N1Q4d1ZI?=
	=?utf-8?B?aEJJSDgyaWd4UjZmSVRtbDZSaTY2VVZ6UXUwWnRQZXQwMWp0Mnc1eXZ6QWdr?=
	=?utf-8?B?eXpocDA0VHdiNXYrSUd2UXFrdUc1M3RPMXlWdlNUc1hJUlB6V0ZjYWNDaU5C?=
	=?utf-8?B?N3NDakRjK0hpanQwMnozckx1WGJvZHhEVWI3YlkwSzBKbmVGQjBuN3I1TUlu?=
	=?utf-8?B?WGF6djFmL1ByNHBjZ0VxUFhVT1pobm1SaU1UeUtPQ1NxcXNpTXVCYUxSQ3Zh?=
	=?utf-8?Q?fH4spZkHDv4KkbQYHBHwMQ83lt4gEksyl2?=
X-Microsoft-Antispam-Message-Info: +oGWfDYrOpktRh1YzsvceiPg/FlM0xyWxABShIED6VaQtee8Xi3bnyDjr8lwc19N9MlZPK+Gd3onMjwy+nIx/EWc3oZfjRUDHykcZD1qCtF3AeEQKj8SFhTEFGQxllq3UMf7W5bWX9IPXTkZGis9spEx9Q73U4PuZ0ETfkt7jLY40PTaaT5tamhNw/2vnpt5yIYA6VVbm8Mh8vKSjLoRhGTD+PMuiWHVshEnku9UwM2DKBtuBkHJwVcjrmVMLZelVrroi+WjFZAdk3M3SyjQ9jybQ4He3OGd07DGpeacNmSMUaM/2U883euA705RL4FUyqSwE7NhPudggs12fpp8Jb8onB86lDBCxz2kjyEiafM=
X-Microsoft-Exchange-Diagnostics: 1; HE1PR0702MB3643;
	6:bZVByDoEXlDWjBvz3xTrazSxur1j/d0M7qsGP5GwaA9Gtuq1ehrwwybqVy+XObaKJLVBjpQ7ItxUz4fzP1oi7t8mQkJkT97ifHYwRUwNfT23Q3h35qZJIbjxpqMw/I/+fkVF4F4p843I7eiIEuXk2EWC9ZryMLn0cuTzRmNm0qxG4OUiDAu3sbYy9DdJeYckjINEiqUdtHNf0+HnIk/O3Nhi4Ywc8+a3TPOST2wPcf1c4oFPi6bkH+9mBMgw/5JfhA3Z7v3LUSoO7eNo2cJgowwJ5ibATXulv4MORepIIVVo2fGVAxPpJlv3GuU1sbuB628bkwtshqZmgsVwlHYuCrXze1XSNKs3NGLyZbRG8USHbXXlqtPbGcSrLp+7nVa7chjQ60zGG5lEMdxgD0AOUmpWaFkDRc/Fw+tlgs6ZMEy7Nj7RazxT5Nx/d2fzI2iM2p2HaTqvR1/IssT6ZxjiBA==;
	5:GkU1M6acZLknrQlqfqfQZ9q1rkty4kuLezXARBz3rHgDRF4C57W+oByeqdXiKALjDYlspzdpfOSA5AYYL2wCT6KZVaOGqt/D9ZzFmbUNEoeaAyNxu5PtLEiX+nR/cS/MbxJOvaYY+AFXAD0Bj6nvW6P0ScpNYXEgyoL5vjoPQRQ=;
	7:AlF8PdpUIruhixH9OA+BW5d1c7EV1E/kaz79s2h9rVdMwCvO3j5qzWyN+icbiX9FbHW4cuPjaVhx8PNb8t9P3TgCHS9iA8ElWb5ZDxqvYPRHZaSNvA5TtCzne7IdlenNdspPd6m3w2Y2V3Nw19TKE1FkgjnJaKjFjmI9MMnroKy10RT+qnzFfdehCXMkSVud44Eva4AT42mjCTNbyCEix9nacOpcMB3hG8aouzxueNyltavgwprtqrnI/dZsBoSh
SpamDiagnosticOutput: 1:99
SpamDiagnosticMetadata: NSPM
X-OriginatorOrg: victronenergy.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 25 Sep 2018 19:46:46.4203 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 399e228e-99d2-452b-e851-08d6231fa0be
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 60b95f08-3558-4e94-b0f8-d690c498e225
X-MS-Exchange-Transport-CrossTenantHeadersStamped: HE1PR0702MB3643
Subject: Re: python-sqlite3 packaging
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
X-List-Received-Date: Wed, 26 Sep 2018 09:21:31 -0000
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 7bit
Content-Language: en-US

Hello Alejandro,


On 09/25/2018 05:08 PM, Alejandro Hernandez wrote:
> Hey Jeroen,
>
> On 9/24/2018 12:22 PM, Jeroen Hofstee wrote:
>> Hello,
>>
>> Not sure where to report this, so trying here. It seems the
>> /usr/lib/python2.7/sqlite3 ends up in the python-misc and not
>> in python-sqlite3.
>>
>> This causes statements like:
>>
>> import sqlite3
>>
>> To error with ImportError: No module named sqlite3, when
>> python-misc is not installed.
>>
>> It looks like the python2-manifest should at least include the
>> __init__.py, but the logs suggest the manifest is generated.
>>
>> Perhaps it is easier if someone who knows more about this
>> looks into it..
>
> Yes, this sure looks like a bug, can you please file it on 
> https://bugzilla.yoctoproject.org/enter_bug.cgi?product=OE-Core so we 
> can keep track of it?

Thanks, done https://bugzilla.yoctoproject.org/show_bug.cgi?id=12933

Regards,
Jeroen

