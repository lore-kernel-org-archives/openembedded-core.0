Return-Path: <haris.okanovic@ni.com>
X-Greylist: delayed 2021 seconds by postgrey-1.34 at layers.openembedded.org;
	Tue, 05 Jan 2016 19:37:05 UTC
Received: from na01-bn1-obe.outbound.protection.outlook.com
	(mail-bn1on0111.outbound.protection.outlook.com [157.56.110.111])
	by mail.openembedded.org (Postfix) with ESMTP id 12BC860616
	for <openembedded-core@lists.openembedded.org>;
	Tue,  5 Jan 2016 19:37:05 +0000 (UTC)
Authentication-Results: spf=none (sender IP is )
	smtp.mailfrom=haris.okanovic@ni.com; 
Received: from harisdt.amer.corp.natinst.com (130.164.62.171) by
	BY2PR04MB015.namprd04.prod.outlook.com (10.242.34.21) with Microsoft
	SMTP Server (TLS) id 15.1.365.9; Tue, 5 Jan 2016 19:03:23 +0000
To: "Burton, Ross" <ross.burton@intel.com>
References: <1450914695-19604-1-git-send-email-haris.okanovic@ni.com>
	<CAJTo0LaHTkODDiLfOYDQoFC-VBDD5h4XctAidjzRfyYGgdAfKA@mail.gmail.com>
From: Haris Okanovic <haris.okanovic@ni.com>
Message-ID: <568C1375.6080706@ni.com>
Date: Tue, 5 Jan 2016 13:03:17 -0600
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:38.0) Gecko/20100101
	Thunderbird/38.3.0
MIME-Version: 1.0
In-Reply-To: <CAJTo0LaHTkODDiLfOYDQoFC-VBDD5h4XctAidjzRfyYGgdAfKA@mail.gmail.com>
X-Originating-IP: [130.164.62.171]
X-ClientProxiedBy: SN2PR10CA0001.namprd10.prod.outlook.com (25.160.12.139) To
	BY2PR04MB015.namprd04.prod.outlook.com (10.242.34.21)
X-Microsoft-Exchange-Diagnostics: 1; BY2PR04MB015;
	2:eIDU4iYC+RyaZnYGde5xjHz01yrjSn9eZTsk735LZtxGCEr2pTMYFzorqjVyD0ZIKF64clFkrMmDHlpIC0R0ZAFQzAYSCjn7mol5HHTbYNcu/B468/iMf3Dw6mPACNV9tIuzw08kujbt6N+tegpj9w==;
	3:ahHHXVahZBTXwwBrdaU1RC7chffBhU5ehbIChizaYh1ppazmh0AavheJZ0DEnoi/pIp7gPhZiz/4M8pUa9aDubo2DMO73eLpl0agVH81QMDPS4WGHKzjbvVAC86Mbtal;
	25:Y0Ojdf1dX4E4pAxL/ErfXb8LGFd8ly04Bi/zMQ5NVhhn7Lm62PWKgwsyt78bL5Fn3FVF7W10xzRxnOSKQndXWZ77gScLmc//oMZcGF4naVuM6GTbFXqHOqkblzqIiFn0URf2RxtHjetjlCgJHVhzjBAS8VcU9WU7TNNsGg36etH4fS5H7cV0l5A2EwEBmsbNx1Bq1TPrPVg5iqNGqSqv4d2Ksnh5kttNJzdYJJaUpbO7DdcJktjS8BquwbFAmFwU
X-Microsoft-Antispam: UriScan:;BCL:0;PCL:0;RULEID:;SRVR:BY2PR04MB015;
X-Microsoft-Exchange-Diagnostics: 1; BY2PR04MB015;
	20:Ie28Kdi/SOyiruGaf6lR/M95nAKINNKJU2qa9yZmTsEALKn+c73Vgx6mXdzNTAAm/fafqvvIuasF4mnmmO7mMmtnJCRJRscS1ajAfwBdpjvBpkRY+2mVYExn21RWYyDjC4W873sJbZ1LdPG5HY7YH1MLR1DoUV1d3ZDu/dNOc4w2P8SyRjKMQ5PpVsfXrt0alNzSSYH4PhHB7ST18ONe9FjBnpXcP5V4lseNgag3gfUnddNsmpBBmNwDwgHU/SvxMWTLRyx7aoqn5bMeHs67XRJJasRBx54wEoq3Ylqd5fxAZ8cPxPYeT6yV0uUAWnDOA2I+hAQB9SDHhHAlZeIWsxl7nI68TtUmMcB1phK04FBFWT7oPXpnw1GiSZT5BAsPQabT8EdbUuXLRYByfaNzUUe4RzCUtyOkt18/8N+TIPnLKprQHc3qzGvJvBBy/xrFuhrKK1ZOuaSp8SZF9MiOJJtclKqkyFZOxw5ctvmuUOf3h5CGCRmKm05jrcw0kMD468S+PhS5toby/YAj+XdfG1hUgWBVP2Dyyc8IWfAX0yqtjSugrW690mAmaGDzUi7ajSN1Fpha4PThe5H2ZS3AO0ETeAV45cSfAgamxOACXZQ=
X-Microsoft-Antispam-PRVS: <BY2PR04MB015DF3DE2035726C86C0A87E5F30@BY2PR04MB015.namprd04.prod.outlook.com>
X-Exchange-Antispam-Report-Test: UriScan:;
X-Exchange-Antispam-Report-CFA-Test: BCL:0; PCL:0;
	RULEID:(601004)(2401047)(520078)(8121501046)(5005006)(10201501046)(3002001);
	SRVR:BY2PR04MB015; BCL:0; PCL:0; RULEID:; SRVR:BY2PR04MB015; 
X-Microsoft-Exchange-Diagnostics: 1; BY2PR04MB015;
	4:9gR32bQQTz66O2dYwYGWIOX8X3nn6rRvBnkJeU1cb7ZGcJPapk+6GPQHTH5HRFoaJxABJR/Yqzd/onCJKwY6Nadl2YspXKm2+yjshDBHje05Lm6MjzgeqJvFcLn+/UxuH7Av+lYxC95ARLm7gNKmg1MNwZJjs2NA2k8WgjvrdsXN4bpmhrhwxXmEbCSAq/YwABhmKlRRjeMSTsWYwFZkrxHNa8hFgj/xWK4NCw7LtZQYDaOsMeuZGFHKNfy3rcLonQg0A3+xxur+3VWr+xVdClJuaacaFsQkoqyAvWuWMowFyiI0E4fNCWluiP4oT6QC4xT4AXS5Syk0Sgxp4wi/ovHsdMMiHslC6wmbykpGwWGa1zqUCFbDlHQP72IkV27n
X-Forefront-PRVS: 0812095267
X-Forefront-Antispam-Report: SFV:NSPM;
	SFS:(10019020)(6009001)(377454003)(189002)(52604005)(479174004)(199003)(24454002)(81156007)(87266999)(54356999)(4001350100001)(19580395003)(122386002)(33656002)(59896002)(3846002)(106356001)(189998001)(83506001)(80316001)(87976001)(42186005)(110136002)(40100003)(5001960100002)(65806001)(47776003)(50986999)(76176999)(97736004)(23676002)(64126003)(6116002)(105586002)(5004730100002)(86362001)(65816999)(2950100001)(19580405001)(5008740100001)(92566002)(36756003)(101416001)(65956001)(77096005)(1096002)(230700001)(66066001)(50466002)(586003)(4326007);
	DIR:OUT; SFP:1102; SCL:1; SRVR:BY2PR04MB015;
	H:harisdt.amer.corp.natinst.com; FPR:; SPF:None;
	PTR:InfoNoRecords; MX:1; A:1; LANG:en; 
Received-SPF: None (protection.outlook.com: ni.com does not designate
	permitted sender hosts)
X-Microsoft-Exchange-Diagnostics: =?utf-8?B?MTtCWTJQUjA0TUIwMTU7MjM6Y0tOS1pWcDRjUytyUXlSL1gwWlRZbG5KblhT?=
	=?utf-8?B?RVZiWjlQdk54c3VkcFcrRlFEb1BQVnRWTEpiSC9UVCtqQytXaEF4ZlFYbFhR?=
	=?utf-8?B?TkVWMGRpaGF4amxXVmNGYWZack95TlVyNXZEdTJJdUNocTFuRGJ3TEUxWEoz?=
	=?utf-8?B?ak9uOVUxVDBuNkZhbk5UYjFIU2NRSFc2NjBjMVJpaEo4eXFvMm5TWlkya3hE?=
	=?utf-8?B?VFZwSE1sME9GNHk0ZGhja2tOUFlhRXVSd1RZdmZSNTQ2cGcyWDlDSkxHaXNy?=
	=?utf-8?B?YTBHejU1bHJyVXpuUEpjd1grRGJDdGVjSnR1T1FpaEZyMGxXRXdWam5rWnRZ?=
	=?utf-8?B?REl3R2ZBV3ZEaWUzUy9vWFhpUXJ6WHBVK3NYdmU3R0EvcjlmOWFtZGl4bG1t?=
	=?utf-8?B?RW5Iay9NS2R0N1NJSjE0Nk9OWkxjc0RlZUVlSDd6dTBhWDl5bWNFS015cXFQ?=
	=?utf-8?B?ZlB6T1FRZlN2djZtZVdVY2ZWMmRNclV5RVFRMExCdDdXa0hSMVQ2VnR5c0h4?=
	=?utf-8?B?cVZBR2UwSmFVL1BBbkg0ZWdhem9Vc0ZVYjhpNjZzL3hrNWtqUXFRa0dVNnQ0?=
	=?utf-8?B?dzNEZUdCWHdLSkhnR2JLdndZVHBOcGtXYURneitpNFNGci93dnROWis5S3NN?=
	=?utf-8?B?TWtxSVNhcW9kWEhYM2paRXFDbGVwSGZaVDdJK2Q4Y3ErZWswR0d1STVLdEFs?=
	=?utf-8?B?SDI3RE43WGJUWVpILzg1UWZaVlpUejBmcnF2ZWdoVmFIeXppWFlibEN0K0hP?=
	=?utf-8?B?MlBJNEh3UTBHYURhZC9rUEpEUm4yZjVhNm16Z0k4OXBsTHZOVEYrRENlOGpN?=
	=?utf-8?B?OURoMDVzRXdXWFpVcUE1a3pwM0dtZ1lmS1FISU5aZVRNdkE5TXc4SExNS1Nr?=
	=?utf-8?B?NjZSY3pUTFQrLzJWWTQzYWVhYWlCU29sYkd6dDdhclRyd05JajNVOWdxc2F0?=
	=?utf-8?B?bDRuTDZmK1M1VGxMV3JURkNmMERpejJjRTh2dTF0WkVWUWcvNFZIMFhIZmlx?=
	=?utf-8?B?UHZQdks5L2hXSS9NQmNsSUJjZ3lSR3lDUTUyT3ZqZU4zeEE3MkEzSlFPWGdt?=
	=?utf-8?B?OXZtN1I0UGphUnBTc2tMaWtSQlBlWmthNkx2L245dE52emE5a0ZCUTRjeklo?=
	=?utf-8?B?M0h5bWh3UVJxUUwvSHhQck1rejNEVTFwN3RVb2NOUVI3Ym5qOXRtQXdaTDln?=
	=?utf-8?B?bXp2Z0w4RElPM09CYTBlRTdVdDVxZmJRbG01UGJlZzV3OU5UWTV1bFJYWkgr?=
	=?utf-8?B?L1doN0FMUnhiME8wWTdtQXhuYVI3ZjVXMmtZclUxRG5RQXBsUnhkU2wxbWNJ?=
	=?utf-8?B?RWgxdFQ1eEFmUjV5K2RVa1hUeEZTcjZZRnY1ditUMzdXbWJqU3VQanJRL2FF?=
	=?utf-8?B?NEFDTDMrelUyYnIzZkhDL2ZWOXIramNmcGNKUjdyb1crbVpMM2N3cmROd2FY?=
	=?utf-8?B?K1phNXNMOGllT1hPOFpvb3JOR0swZEszR3BzMGpyalhhU2Q1TW1sektvK0ZF?=
	=?utf-8?B?VUN6RXVaMEJsYllFZURSVmNabG0vMGZTT3YrQnhFVnJEblF3OHhWbEhOR2Jk?=
	=?utf-8?B?aU9RVEovZEQxNU9DY3o1M21YNFNjL3hXSUgxNTBkV1IrdGgrbE9ZUjJ5aFc0?=
	=?utf-8?B?Rnl6OGdCVGEwS2lxeW9Wa0dCbjlrZ1AyR2UxY1NTeUtRT1h5YUhETWhUQmZS?=
	=?utf-8?B?U3FlVWNhMUtWRnVMaXNNQVR3elA1eDZSWEUyUUlESko5ZTE4SDhvczB0OVdC?=
	=?utf-8?Q?GTBpjXIdZI8nyyOIk5QIBbNX1aeoRs3WBKlM=3D?=
X-Microsoft-Exchange-Diagnostics: 1; BY2PR04MB015;
	5:yyt/diQl0dVfX5qFkjp0C00L3DGPRcs3Z0qw2BR5JunJxj5s5tKtS8PYr5/1wzPhqmE/Io5Q0oCqfp9LkGKVS9zd0wQCPlLjTzVtAI7OqptV8jLtfhG504Rx3YStUPRiwWVYS6kx3hNZ+4k+8fGw9A==;
	24:DLNQwLT2cW8chfBNoujoidVP9IiP6iUy7YdPwgkCu2vdNqBGIDWjfPizBVwSFmV3LB5yRV4twPv2KWru/Jy6Ng9KFcEOjwYd7IIEG/d09RQ=
SpamDiagnosticOutput: 1:23
SpamDiagnosticMetadata: NSPM
X-OriginatorOrg: ni.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 05 Jan 2016 19:03:23.2514 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BY2PR04MB015
Cc: OE-core <openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH] tzdata: Make /etc/timezone optional
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
X-List-Received-Date: Tue, 05 Jan 2016 19:37:06 -0000
Content-Type: text/plain; charset="utf-8"; format=flowed
Content-Transfer-Encoding: 7bit

On 01/05/2016 07:03 AM, Burton, Ross wrote:
>
> On 23 December 2015 at 23:51, Haris Okanovic <haris.okanovic@ni.com
> <mailto:haris.okanovic@ni.com>> wrote:
>
>     +CONFFILES_${PN} +=
>     "${@['','${sysconfdir}/timezone'][d.getVar('INSTALL_TIMEZONE_FILE',
>     True) == '1']}"
>
>
> This idiom (indexing an array by a coerced boolean) is pretty difficult
> to read and bitbake has a helper function to turn a string into a bool,
> so I find something like this a lot easier to read:
>
> ${@"${sysconfdir}/timezone" if
> bb.utils.to_boolean(d.getVar("INSTALL_TIMEZONE_FILE", True)) else ""}
>
> (untested!)

I agree the alternative is much easier to read, and verified it works as 
expected. Posting V2 shortly.

Thanks for looking into it!

-- Haris

