Return-Path: <mkelly@xevo.com>
Received: from NAM03-CO1-obe.outbound.protection.outlook.com
	(mail-co1nam03on0080.outbound.protection.outlook.com [104.47.40.80])
	by mail.openembedded.org (Postfix) with ESMTP id 0F837784B8
	for <openembedded-core@lists.openembedded.org>;
	Wed, 15 Nov 2017 19:03:36 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=uievolution.onmicrosoft.com; s=selector1-xevo-com;
	h=From:Date:Subject:Message-ID:Content-Type:MIME-Version;
	bh=tL55WT/pxLcYBK6Py19SvIHYJN+6Ok6xrQFFz2/yCbU=;
	b=LbRzu9z/mzrCIfhXSIaeD/iMFFzSNASBCZJuV5deNzbekGNetv9eBcXiT1+r/FLshh3aXA+Zh6tUfDIbCE1aQT0MK6EKq0TCu8jNVU/sQ2xm9nAPEz9+Ug++VHFUAicpWBhgZ4QUDkYXDBYndokwOX00uQtdks577Qrd8DqXQWA=
Authentication-Results: spf=none (sender IP is )
	smtp.mailfrom=mkelly@xevo.com; 
Received: from [192.168.0.3] (71.35.172.156) by
	MWHPR0101MB2943.prod.exchangelabs.com (10.174.170.14) with Microsoft
	SMTP Server (version=TLS1_2,
	cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id
	15.20.218.12; Wed, 15 Nov 2017 17:29:44 +0000
To: Javier Viguera <javier.viguera@digi.com>,
	openembedded-core@lists.openembedded.org
References: <20171114195619.30923-1-javier.viguera@digi.com>
From: Martin Kelly <mkelly@xevo.com>
Message-ID: <cc366431-431b-6baf-0166-c2e8df37adae@xevo.com>
Date: Wed, 15 Nov 2017 09:29:36 -0800
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:52.0) Gecko/20100101
	Thunderbird/52.4.0
MIME-Version: 1.0
In-Reply-To: <20171114195619.30923-1-javier.viguera@digi.com>
X-Originating-IP: [71.35.172.156]
X-ClientProxiedBy: CY4PR1101CA0016.namprd11.prod.outlook.com (10.172.74.154)
	To MWHPR0101MB2943.prod.exchangelabs.com (10.174.170.14)
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 9e80bb14-5e2a-44a7-701b-08d52c4e76ec
X-Microsoft-Antispam: UriScan:; BCL:0; PCL:0;
	RULEID:(22001)(4534020)(4602075)(4627115)(201703031133081)(201702281549075)(2017052603199);
	SRVR:MWHPR0101MB2943; 
X-Microsoft-Exchange-Diagnostics: 1; MWHPR0101MB2943;
	3:m37F5R12X0tvGGJV8OuctAVVYo5d010/O+BL43skJ6dUjYi2HUixIroayHYNU54mvJr0YJnp5TInftXk8IcyXH5tjH6FxyoDgtu2PMde8RWlZHgmTZICCLX6fsM9zFGDLCA1FUtYjnlMsd9hO1bhzxrdMOzjYIo5WiEqrl8Czz+Up9drnBi/Ayfws2BfSdN4qgifSWSpEr77dJ6/T87SWZIhslP4fHBVBbILyTeU3wCJg7mmbA0uW2ma7NGfLIGa;
	25:YjU5EaDlV1qcuow34MWVZGXSIQm9NQ19C/e/YVYjvyU0p6ZpWRrMyyH0RinqnnLwfLCyP2d+nUjm2D8Y/pJmAEkmcVMHIrlpDlAFGrmLGGPBNMTiYpzhxoZcUpXwZ2YJwDni41Fck6uI+OGfg9/sPdnTc2TgFmjGdw10nPfKJyZ6xRu+fVgG/HCD8Dvzd4/49DDOgZc3o9vjcY+Eun1Mn2YUHEcNvCjRzOquLFp9X9NCiu/7YIw+7UbRaaLXg7GqltWfhFxv1DAVnl6s921SCfLZQGUaEUH3ew8GC77ZJp/egrdDhed500GnKDDi5SOR59oiLMuzNhVpQeErIRiWJQ==;
	31:ksSnD29jR6LyP5IzoFu9+W8B1cSWvkIRlX5KApPNbE8+N5hjYPcDE5GabxuVJUmUQ0yX5BDZizPuJWvdksaJpR1m+I3QWlrZzHBklF/uyLvKT1fFEyyAKn0y1L/giVfrBV9d9fozITjXMpU/VRtb9oqP7hDgPi+vDwyhKmFGKAajwEX5g/rYDZf09rKQal/Qp1JA3iBwFUg4RKdS6xsNIht2N6iEit092xkTGPGCwqw=
X-MS-TrafficTypeDiagnostic: MWHPR0101MB2943:
X-Microsoft-Exchange-Diagnostics: 1; MWHPR0101MB2943;
	20:mzAFtfIiSa3fJFE+eAb8JkiZJQ/FX1/ugMPIqPgaqnzqJfZjzEak/TMhOjYHv9wADh8bA9CO6Nq2XtFbxPtAXET6Bz0K6hjxO+QA8b56iVVVzWKKPih7PSFMvIYo0jwCzaupNZRgSvSlxvIqv0FamTG7PT7PHreDiVGVGpxDKlKAmsOT5qZfecQH24nVUnun+hwlu3hn6wBBm2+3MWF740KZnCA6ugxm1QGdXI/aHvlW8U2GmP4EZvXg31xza9AbXPqrKvA3GDbp6aqhZ5kMUnjQaYE3MGL+BrcvFDjZB8mduk37EipLF7t40vte+z0eFm9a3Vl0YUsz8Iz/pigOYV8oO5uTWrEnBurB5PesS428r8YinCIGxiB1nfoQieVGzc8gzXXQ4ClbvN14HnPQs+QXRVX56mvF2jy+U6tcMhQ=;
	4:0+s7QT2qhJAuNcCXFTtXoXOFqw7EOGGVF+hy3Ry9btvJifH2EsL5zQcwaqo1HLCRGm7aMosL2L5uZVh6j49ReCo5/jbgZh4vPS6Fn0RA+CMc+/7td1kofD7vnUHVEeTKjQFVcuotB6JNh4t5K2+pWbpD5Z0Uy1II2m6njJN9VcaHg45MRGPCbo7NmaQWpRUsZcvlLaPO0FCrT5X1rSXap3oNmVFFQToiOHG3V7sf9hb5HJJ3pwscRU7mfq4LgXnVwXxYmacABKbdJC6ey/B1cw==
X-Microsoft-Antispam-PRVS: <MWHPR0101MB2943CCE4EFC4539A8E99DCD8AB290@MWHPR0101MB2943.prod.exchangelabs.com>
X-Exchange-Antispam-Report-Test: UriScan:;
X-Exchange-Antispam-Report-CFA-Test: BCL:0; PCL:0;
	RULEID:(100000700101)(100105000095)(100000701101)(100105300095)(100000702101)(100105100095)(6040450)(2401047)(8121501046)(5005006)(93006095)(93001095)(100000703101)(100105400095)(3231022)(10201501046)(3002001)(6041248)(20161123560025)(201703131423075)(201702281528075)(201703061421075)(201703061406153)(20161123562025)(20161123564025)(20161123558100)(20161123555025)(6072148)(201708071742011)(100000704101)(100105200095)(100000705101)(100105500095);
	SRVR:MWHPR0101MB2943; BCL:0; PCL:0;
	RULEID:(100000800101)(100110000095)(100000801101)(100110300095)(100000802101)(100110100095)(100000803101)(100110400095)(100000804101)(100110200095)(100000805101)(100110500095);
	SRVR:MWHPR0101MB2943; 
X-Forefront-PRVS: 0492FD61DD
X-Forefront-Antispam-Report: SFV:NSPM;
	SFS:(10009020)(6049001)(6009001)(39830400002)(376002)(346002)(189002)(24454002)(199003)(53754006)(7736002)(86362001)(47776003)(65806001)(66066001)(65956001)(2906002)(6486002)(77096006)(90366009)(68736007)(8676002)(189998001)(81166006)(81156014)(53546010)(54356999)(50986999)(76176999)(305945005)(31696002)(101416001)(97736004)(33646002)(16576012)(36756003)(25786009)(106356001)(478600001)(58126008)(105586002)(316002)(83506002)(2950100002)(23676003)(16526018)(3846002)(50466002)(65826007)(53936002)(6116002)(6246003)(230700001)(8936002)(67846002)(117156002)(64126003)(5660300001)(31686004)(6666003)(229853002);
	DIR:OUT; SFP:1101; SCL:1; SRVR:MWHPR0101MB2943; H:[192.168.0.3];
	FPR:; SPF:None; PTR:InfoNoRecords; MX:1; A:1; LANG:en; 
Received-SPF: None (protection.outlook.com: xevo.com does not designate
	permitted sender hosts)
X-Microsoft-Exchange-Diagnostics: =?utf-8?B?MTtNV0hQUjAxMDFNQjI5NDM7MjM6OHFBQjNyK2NnSmtsME1NWVlMUHNjUzlR?=
	=?utf-8?B?dmV2aWg1U3hrVHpKK092NG9MdmJqMzZIYmlFZ1dMTUo2aVNiSG42OEV5ZkZ5?=
	=?utf-8?B?bkh5bjhoV09zUVZtbVRlTys0QzY3N3J0elRDWHc4UWVFRnIzUXpwbVBaYW9H?=
	=?utf-8?B?aEtUQnhFUTFHc2xIYUJibzNnOHFzSXZRSGgwRVdQRlhueThZZFRENWM5ZlQz?=
	=?utf-8?B?TmF6Y0hqL2VSdmR2Z2xyNmFjRVp3dXNzWVdWNXpTaFp6cEVhcCtuRkpVdC9v?=
	=?utf-8?B?UGkrUDd6cEYxZkI1K1BQOUU4RmlOSER2ZDFyM0loVVB5aXpvRktlaTB5QU1G?=
	=?utf-8?B?NGRhb3lDV0x6Y2FvM1pYd2hQM0h1TkwwUXM4NXpuV0h1b3Q5T3RydUFXMUw3?=
	=?utf-8?B?aituL25maEZoVlE0ejJxN3J5NDM3RWUrd01PNUo1WUgzdGs5K3lsZno5UDJU?=
	=?utf-8?B?ZDVtZVo5U2hZOTdYeGZ5eTFBbEpxZTlRZDhSRE1DSnVLbXpQaGFUbGMxUlpj?=
	=?utf-8?B?cmdjelgrZUVuOVc4M3pRUXZMR2NYRlRSNWtpdU14eVk3bVRKUDJLdE9SL25O?=
	=?utf-8?B?cG5WUm9tSXIza2NEbGpDWTh1RjhGTkxlQk5yNVZHYWFaMHhTaFJhamg5UUFw?=
	=?utf-8?B?ZXE3aEpXQVQvcDI3YW1hUXVpSDhwNHJwMjVJN292d3pVOVdoYnpKWEp1Ykpv?=
	=?utf-8?B?NzNZTDMwZFpuTUEyaERiRnZzZ25BOHNiRkFKQllacXZDSlFFaHZUVFhtbDNm?=
	=?utf-8?B?WDBMalZlWHZUNTRiaXJVdndxaUhDTFQ4bnQrZ2c4RVRQTktLc0RFUDFERjZI?=
	=?utf-8?B?T3VSdHo1VTVWcDUxQldsanh4ZEVTUFUzODVqaGc3M2lyZmt6ZnJoWlhKWXkr?=
	=?utf-8?B?VUZmVzNiQlMxRmdsSzRDS2hoTUNGVzFpdHhpSG9PMFBPemd6VjBBczNLcmln?=
	=?utf-8?B?SDMwTlJ6dFFqS0dOMVl0U3JhT0RxSWs0b3h0QVNvNTVZbHRLcS9EV1hLMWhD?=
	=?utf-8?B?bk5BNk1NMUtCR1p6QzFBR0Q5cnRBc2xsazNnaHduamJ0TkFScHM0d1ZYMmpJ?=
	=?utf-8?B?UjBZVHBvb2tJZTVxNHlrU1BOSHp3Tk9ZREJNUDMwQU0yNVppalByOUJacHpy?=
	=?utf-8?B?NjJOdHFVNm53Y0U3WnRtZGhHREp1NmI3NlpzZWJqWis4ZU9aS084UklqUEEz?=
	=?utf-8?B?N3JmdTNtUXBraTRJeFAwUnVhK1p0RXZzQXJHRjllUUcyV3NhRXRCK3h2c3h5?=
	=?utf-8?B?ZkRPN0FCM3JXS1VoWmhMdXJ1LzlPbVRkWVBXekc3QnlhL3ZadTFOWWROdWEx?=
	=?utf-8?B?LzZaZXV0VUVWN25hbFQ1VTZmREZjeXBZOHhkb09jYmVmWml3VFc0eE9XeWl3?=
	=?utf-8?B?UXZGbjVNZERiTVhmZElybkZpTXhjOTlJaFBDMGN5NVlTWGJtaXg3NTFhbFBx?=
	=?utf-8?B?b1BXMTd0RHVFd2FtbEJYZVhCSlVoK29Dakx3ZVlNc2ExVmVzZk1LbnZhcmhu?=
	=?utf-8?B?T2hNbnBZdWN2bjZzejZTbktKR29KMnd3aWdMcGxLbzdIdnBFYXZMUTVGRWxw?=
	=?utf-8?B?RkxxSm56ZVI2YTdkOWdDUjhQeTUzZnQ0Z1FIUHlZOThNS1ROWFZ0Z05CeU55?=
	=?utf-8?B?OG9Remk2TmRwOWh1TDNFR283UlpsUFUzcy8wdzhoVXlQNEd6K05oVHFpM0g4?=
	=?utf-8?B?MWJ0YVgvblBZWmJCanVRVUROdG1QR3BYQllzQkp1SzJOeTRlQnJxalQxRnAy?=
	=?utf-8?B?RFNJRDdmYjJiNG12ZFRPTWg2bUYwVEVLR2JFbWIvM1l6bXpjUkc2dUcyYjNC?=
	=?utf-8?B?YzhPdzRTMld5cG5mdGRLNGhlUlJnY2dZNlFSZWNQUWNCa1pmOFByTmN1cDRJ?=
	=?utf-8?Q?Nrk39+aiiMJAo=3D?=
X-Microsoft-Exchange-Diagnostics: 1; MWHPR0101MB2943;
	6:EvawPcd117F2l8fJOVIx2y+id5GgHie1Rg/nuv+Is3RCH+nlmmWvKDf2vqVXDbEU+9YrpTVHHjhlGU/6kAizEQ3FUpc1dXOJE0bs1rHn+Jr2o92ldCIWSbh6liUZPYjQUWbFzrvsr+jI44Eb9i+bE54+gTESKSSKG5oXx0gvEf7+7XSMuE6sMcIue2Eh+vGLhWJKtaZuQ/t6WWd4qjdnK5rpHURdw2JEraxgBR8el5W2TTQBU+THY4hRvBRLYOi8INBDC7G7yrv8Xcr1/sMuqknzlqyJqYI1i9UumOkP4EeIA/TvLbooqyzTz6HiiaD1bZ99a0mZPJm/HBEHbqSFoNdAfgmBi/xDsFQNsqGTRCY=;
	5:x4wc/lIb6M2n1vS/hgjg1IECDA+UvbhuivqS3Dtqm50bwUOGTFuxN8EUeTUKH1xQ6mLyxhximq/N0WH/IzguwLQ1Or4bcdO4TVkRcBv9w1fv9wVLBdqreDEbtUtN86aZZ5p83Z/X7SoWkXnLhAx+b69kVLGde/HsHL4Oz5s70H4=;
	24:/LLHQdZkWK9XS7b5B/eOirDNtMdxZBfxJ7yMQrIQqmtTGwuLXHNCKek1LHge1ZMhr3m5ghTSbPUguFrfQmtXxe7mdy4K7GB34BdDgPLjBoc=;
	7:2ZmiBJCXA2Xr2pmSXneCNvOsZeECtCOACgEBOeVvCBhHQitORhz+jP6atK1zmMjfAIf3CZngVaZN9cUXvmyM4kholvqOndpv3PnEFThiBnwDXmlPwtXMrOWJiet0WN5DvGYNmJTRJTzPeu2gh5oYBYMhwL3vebig47mul1woo7wq+OLVu7WJgxzumi2ThrfZLJlXL0WbzX0gefw5/t5k7QDNdnPlXkxfz2YeIX7pxhyN/nSnxPzsWwPtA1Zcb9J7
SpamDiagnosticOutput: 1:99
SpamDiagnosticMetadata: NSPM
X-OriginatorOrg: xevo.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 15 Nov 2017 17:29:44.5352 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 9e80bb14-5e2a-44a7-701b-08d52c4e76ec
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: e0a7ca1f-2458-4cd6-a7c7-d733c07495ab
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MWHPR0101MB2943
Subject: Re: [morty backport][PATCH 0/2] tcf-agent fixes
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
X-List-Received-Date: Wed, 15 Nov 2017 19:03:37 -0000
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit

I'm not a maintainer, but both of these look good to me, thanks!

On 11/14/2017 11:56 AM, Javier Viguera wrote:
> Hi all,
> 
> There are a couple of commits in master fixing the tcf-agent bootscript and systemd service files so the daemon is properly kill on reboot/shutdown.
> 
> These patches backport the fixes to Morty.
> 
> Regards,
> 
> Javier Viguera
> 
> 
> 
> --
> Jan Kiszka (1):
>    tcf-agent: Fix daemon termination
> 
> Martin Kelly (1):
>    tcf-agent: kill with USR2 in systemd stop
> 
>   meta/recipes-devtools/tcf-agent/tcf-agent/tcf-agent.init    | 12 +-----------
>   meta/recipes-devtools/tcf-agent/tcf-agent/tcf-agent.service |  2 ++
>   2 files changed, 3 insertions(+), 11 deletions(-)
> 

