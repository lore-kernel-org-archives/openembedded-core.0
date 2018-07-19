Return-Path: <Sean.Nyekjaer@prevas.dk>
X-Greylist: delayed 17814 seconds by postgrey-1.34 at layers.openembedded.org;
	Thu, 19 Jul 2018 13:43:01 UTC
Received: from EUR01-DB5-obe.outbound.protection.outlook.com
	(mail-db5eur01on0103.outbound.protection.outlook.com [104.47.2.103])
	by mail.openembedded.org (Postfix) with ESMTP id C3AB67459D
	for <openembedded-core@lists.openembedded.org>;
	Thu, 19 Jul 2018 13:43:01 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=prevasonline.onmicrosoft.com; s=selector1-prevas-dk;
	h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
	bh=jMMBIlmreQlaqtEo223x00ywVv/ulbcvfLazPkkL5ak=;
	b=aU5caSCMdDuQ5A85nWOPq7UBX0bUdQQ4XLoz7+jkc/6an67SbVeE7FNYWZ97Bp1yppasfg5IxbpxXUbbc+ZpQ7osQPUVtw2LbwJIkFlhjd6tN628lf36k+Cf/phVXz4SpPDX0asZxxyQqG6ldHMaiHEiWPSjpUDMpl2zAswVwEo=
Authentication-Results: spf=none (sender IP is )
	smtp.mailfrom=Sean.Nyekjaer@prevas.dk; 
Received: from [172.16.11.62] (81.216.59.226) by
	AM4PR1001MB1395.EURPRD10.PROD.OUTLOOK.COM (2603:10a6:200:99::20) with
	Microsoft SMTP Server (version=TLS1_2,
	cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.973.16;
	Thu, 19 Jul 2018 07:13:33 +0000
To: Tom Rini <trini@konsulko.com>,
	Richard Purdie <richard.purdie@linuxfoundation.org>,
	Ed Bartosh <ed.bartosh@linux.intel.com>, Ross Burton
	<ross.burton@intel.com>, Khem Raj <raj.khem@gmail.com>
References: <20180322134413.8079-1-rasmus.villemoes@prevas.dk>
	<20180703125414.28470-1-rasmus.villemoes@prevas.dk>
	<0f5db42f-5fc6-cbce-2c60-f869a4f264b4@rasmusvillemoes.dk>
From: =?UTF-8?Q?Sean_Nyekj=c3=a6r?= <sean.nyekjaer@prevas.dk>
Message-ID: <58110146-1064-86d1-07a4-7179a1055b50@prevas.dk>
Date: Thu, 19 Jul 2018 09:13:31 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:52.0) Gecko/20100101
	Thunderbird/52.8.0
MIME-Version: 1.0
In-Reply-To: <0f5db42f-5fc6-cbce-2c60-f869a4f264b4@rasmusvillemoes.dk>
X-Originating-IP: [81.216.59.226]
X-ClientProxiedBy: AM6PR0202CA0005.eurprd02.prod.outlook.com
	(2603:10a6:209:15::18) To AM4PR1001MB1395.EURPRD10.PROD.OUTLOOK.COM
	(2603:10a6:200:99::20)
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: f3d2b9e9-378a-4d7b-a502-08d5ed4723dd
X-Microsoft-Antispam: BCL:0; PCL:0;
	RULEID:(7020095)(4652040)(8989117)(5600067)(711020)(4534165)(4627221)(201703031133081)(201702281549075)(8990107)(2017052603328)(7153060)(7193020);
	SRVR:AM4PR1001MB1395; 
X-Microsoft-Exchange-Diagnostics: 1; AM4PR1001MB1395;
	3:b0SLO4hRdxnek1S+UPADsRdnxEyC2AM32JgjvzUmotstszQn+i6CZBo1CmhcS5iS8AYH98gJoseGhWzP1FjVP8UqjF3n+oyNYXCKP9jDp0n2SSqKFkS4QvpBE8LkvOkF/MxV4RR44GbVS7kyUxE2HiLZJejUDCqMZwX25LwQL8fK2Gasme+0wFldXx+SeysiQP8PoEYT/s5lJMwodFnhIacIAtViUDLhIFdVEB/PG9TAJb3UmPm/OzcSEGrAQiof;
	25:peYY/HmtDMqSo08yEvUdfd2FZCwY0jcL9ifSxLkPF/dj4VJUJq0ofmS2A294bewdZjYCxgKuor55v3Jk1jxyOY3glTt+JKwWRdK203eYfXWFpHXadIDulf4lgWST+mWMlcwN7gPTrddhRUC9+dOJ/yqkPsEMmIYW6AkOE1yp0mZXJe84uJ5pL38vBuav69NtACbF7NgeSTDv7Z/xurwloUDTaacVmp9qapSpU+I0W4qqZyjJFdkJXuz813gLYcXH8fdukUvqtSwoG8TzS/B9UAzXqyxIqkXcaYfActSTWsGcQmTmpjHqmFewrjIuEivfSa+CMEYrONx5t2vnM4ts0Q==;
	31:mJuLft3WrOYDAKu4Eu7dzylYkx9PIC+RuN0XV8MjyeEY64onm2dL4DuXkfKGi/7mSVUdG5rMuXp72zioxlCYbzvxySxEeoW59GAevlauLMq2gpNZ0Lvx47twal3ux7OcXDMNqIB/XGoDCmLZHSmNuDhhBWvNpI32IH4ugmB5FMCQ+NXCijkmOMSKn903t89yS+SIGOWf5BcDqR+NBg+zUvH5SGTKWKK2ilkIxxa98h8=
X-MS-TrafficTypeDiagnostic: AM4PR1001MB1395:
X-Microsoft-Antispam-PRVS: <AM4PR1001MB139501ED793F69BE50EE16F6EA520@AM4PR1001MB1395.EURPRD10.PROD.OUTLOOK.COM>
X-Exchange-Antispam-Report-Test: UriScan:;
X-MS-Exchange-SenderADCheck: 1
X-Exchange-Antispam-Report-CFA-Test: BCL:0; PCL:0;
	RULEID:(6040522)(2401047)(5005006)(8121501046)(3231311)(944501410)(52105095)(93006095)(93001095)(3002001)(10201501046)(149027)(150027)(6041310)(201703131423095)(201702281528075)(20161123555045)(201703061421075)(201703061406153)(20161123560045)(20161123558120)(20161123562045)(20161123564045)(6072148)(201708071742011)(7699016);
	SRVR:AM4PR1001MB1395; BCL:0; PCL:0; RULEID:;
	SRVR:AM4PR1001MB1395; 
X-Microsoft-Exchange-Diagnostics: 1; AM4PR1001MB1395;
	4:5BEejKHCKwzsO2yD1Xq5dxZUVqBPNGYzXPOa8XusPIcNDuN1PMdcwxtibICxlVtsI45fOWIKssum/GJAZxbUtjTTiaXpzDghKFjHNBYrOqZZ5sen8xC0Ho/VZ1SxvbZJ0E1D10eWTJ6kvR1BEvmSore8D+pvplQL/48Wte7REZYNMq8Ud3zNk4NnnFPf3u2qHiKkOpo9oK0LY+AgpIqfWB3WtLyzS31+PTr6D6DkIEqeOTgLROjxyMx3ADGCxlyEsFvgNxkSF8DyodAuDwBwyA==
X-Forefront-PRVS: 0738AF4208
X-Forefront-Antispam-Report: SFV:NSPM;
	SFS:(10019020)(979002)(6049001)(396003)(376002)(346002)(136003)(39840400004)(366004)(189003)(199004)(11346002)(25786009)(74482002)(230700001)(4326008)(316002)(16576012)(39060400002)(76176011)(52116002)(2486003)(53936002)(86362001)(58126008)(110136005)(31696002)(54906003)(6486002)(53546011)(23676004)(386003)(229853002)(3846002)(6246003)(956004)(6116002)(81156014)(52146003)(81166006)(8976002)(8936002)(8676002)(97736004)(31686004)(305945005)(476003)(65956001)(65806001)(2616005)(106356001)(47776003)(478600001)(105586002)(66066001)(486006)(446003)(36756003)(7736002)(16526019)(186003)(65826007)(77096007)(72206003)(26005)(64126003)(68736007)(5660300001)(67846002)(50466002)(2906002)(969003)(989001)(999001)(1009001)(1019001);
	DIR:OUT; SFP:1102; SCL:1; SRVR:AM4PR1001MB1395; H:[172.16.11.62];
	FPR:; SPF:None; LANG:en; PTR:InfoNoRecords; MX:1; A:1; 
Received-SPF: None (protection.outlook.com: prevas.dk does not designate
	permitted sender hosts)
X-Microsoft-Exchange-Diagnostics: =?utf-8?B?MTtBTTRQUjEwMDFNQjEzOTU7MjM6ZnB4UzBheFZ5aVJhejBZZWdwNis4UEZ2?=
	=?utf-8?B?S3g1SzliZGwxMFlNbG1SZE5BTFBibVFxNnQwNlVpYUlPTldPTVJqejZBNTdE?=
	=?utf-8?B?QUNZR1pLQnJqU1BLd1ZuZ3BnVjdTUlU3MVZXU3ZKWEhXMlRmQTdZQTRHRGlP?=
	=?utf-8?B?TjM5OXFXNEVlWlFQbDc3bWZSSFYxcnJPcWFBTlY2UjJ1cEROQWE3OTgya0oz?=
	=?utf-8?B?ZVAzeWcvbk4yVGhzNFUyWVJPajdVWkJRU3hXWGp1eFlFZVdOWTQ4Mjh2TFVG?=
	=?utf-8?B?VkRUc002WHlRa09HRlhyWG0wZzh3Mkw3MmFsd2JRcXIrRWJTd2xHaVZsNDNG?=
	=?utf-8?B?TEU2SzRnTlFMaUtWN3lBRVZ6UHlBekVWVFF3cDhOUDJhWmo4ZjVlR2ZkZ0pZ?=
	=?utf-8?B?QnZoZHNGYmMxSnl0Y0tKQll0OWt1VU5PeFBXR1RYelRPTEp3aXo2bzJHaUMy?=
	=?utf-8?B?RVpzdGJRcFo5OWduSXI5OUZrd2hLVktqTVMvaHJnS3hGVTdjTkJvMEZFV3BG?=
	=?utf-8?B?VTA3aHpTZDN4b2ZrUzY3Mkh4UlJaVEJBeVFDaFNtSlhkYWJzK0pISjNGNTJv?=
	=?utf-8?B?VkhaQzVtK1hiNDhaVGtQY2JQZlVEaUJyR1BVSHdtcHdldU11Z0M2MVdBbVZl?=
	=?utf-8?B?aW5FU3Jsc1dDWGN1ck5DQjVBbHEvcm9Da0p0RTZBeTlBbk5DN08rY092UG9Y?=
	=?utf-8?B?bnlCMHo5TkQ1YzJnSkpSTlkzWHN6d21lRE1VN1ZHODZKVnprNGE3RGVLWEp1?=
	=?utf-8?B?TnR5OU5qZUx2QndzcWxTK3ZtdG50bm5td3N6RlNFMFZMR3RndGp5UjVkMEFm?=
	=?utf-8?B?R0ZTaWRQbG5CalBrOVVpcVlMUzkvbXVNNFBwQmZSbi9JNHc0ZHBvOHVWNk5C?=
	=?utf-8?B?RkRTRzMrUjgwa05JcVJCZVVrZ283WHorNjlIVndpZ09XWlZhZ01saG1CWkp3?=
	=?utf-8?B?d05NSmdzZkhCT2tpZE1DdWwwbmFhWE5CaUtYcjVSc3h1UjZ5Qys3RTNIZWJw?=
	=?utf-8?B?akxFNHBMayt5d2pwUjV2Y2FhcStWWFRSajdWRm9mdzFoRGZWK0tsQk84djJD?=
	=?utf-8?B?bCtRRDJGd1V2TW1nN0lTeldSb1VneE91SVdNUy8xV1VubVQzL3BSWlowYmdr?=
	=?utf-8?B?UmdpVWpMTU5UK01NYzd0WTBjSXc3WFhDM0lzcEYvMGF3eVlUSncwR2trVTRH?=
	=?utf-8?B?Uk1taWRlbHUxM2RQMnhYbnAxSmRpUUs0Z093SkRrRnZzTjVlandvbkxoOXJI?=
	=?utf-8?B?Sm9zTk4vWVcrUkMwc2pOazJOcUs0NmZ2Mm9SYTEzMTdZZkw5Ym8xeVpHamhX?=
	=?utf-8?B?dkU4R21xZE1nYitDTmUxR1lDbGhqTGdnRmp3R1kvWkpCMVpMczZ6eGhNdGpt?=
	=?utf-8?B?c21DV080SDVmSW9YcUVyWVVzUUdrcncyNFUvbDlKYTZNN1h2VktzQ0J3S2ZU?=
	=?utf-8?B?N05vbkQyd050WUR2NktnRll3UWo1cXhuY1V0KyswMG81cUxSQXZJK3QyYnVr?=
	=?utf-8?B?aWVFOTNGSzE2dXJ1QmZYWTBSSkt1NkN0RnliTlFkZDh5Tk9PVFhiZlI0SzNJ?=
	=?utf-8?B?bE95MzV6SzdJYUxxT2RQR2tZU3JxVjRtN3FyNEkyVHFZVkJTNFlMZEsrMjJ6?=
	=?utf-8?B?dzNXdzV5c0paVG5nZm5ES3lxc25xOE9xOW0xMFJKMllnc3BEMHY0VWk1VVgw?=
	=?utf-8?B?Vit6MFVTZm4zb0NNczdya3R0Yi9QajdZYmlYVTZ3SzRUSUVkTUdDRnptVUIy?=
	=?utf-8?B?dGhFckduS0ZuRDhlTFJ3TmFpUEtVZlVUc09JZ1dQcU5kVXpFbnlwdTJoQ2tI?=
	=?utf-8?B?ei8zN2VIR2cwbmN1c0V4UTloMTdGb2ViNXo0NXN2T05yZnliblRrOWc5b0NP?=
	=?utf-8?B?NWJwVlBkZkZ4akhZbnF3SHVEWGdNbFpGU2VSMHZiV254MkNUbjlpV3A3KzhD?=
	=?utf-8?B?c0QraHN2RXhKMVpRTVZPaVl6dVRjN1Y2cUc4MHllSEJKRGR6ZDIwZ3hyUTZp?=
	=?utf-8?B?c2ZrR0xpWDhSNndlci8zdnlWWjQrUkQzNm5nME9FMUhMNVhESzlNM0ptQkUw?=
	=?utf-8?B?OHhoYXZtVU9qYUdmVmNWdSsvWkVwc24vOWRqbmhqS2xpYllUY1JJeHRKdVVB?=
	=?utf-8?B?QVpZelJMdURiZTcxZWhodGdqMzRTbTZSZlUrTUhFRHFIQ3JxenIwOGhDNC9Q?=
	=?utf-8?B?czlKeUFKSjFxeTdTQ25UMHdlOERXWFE9PQ==?=
X-Microsoft-Antispam-Message-Info: OQwIJwatq8ypiUxdLmckS8jZ+7bAOg0RwlOoCBnzcLK9+yrp8xclOp3ZraiMh9MPWxHKRfdLhznyxuVUtNNikggQ0subM/fAWtvdwcGmoVBOLVDREC5USbG5z+L2fXACY3nzfXTOpIAG483JJvnGz9fzeHQVyYWsrPh7f2Yjtlqcphu4n/Fz/bAofLyQExSn+JoclNIa1w24wsnbDHXXdwrYVn8d1yktNTHffyEl73O/hFTSgx3W6NbB7RcFiD4AutuouK4XYTaGPB1zFLDncKyQU65L09MQ8gGE7fEW0kVyhmr6tdV89VXeHKgbVshmymbNjhrTpXtrQtArQs572a2wqa+bLE5c+/edlMQA8kY=
X-Microsoft-Exchange-Diagnostics: 1; AM4PR1001MB1395;
	6:3YjJShe+buBqTHhkgVrQdlPRtKU5UuDr7obshMprDMSQ/kuWoe1nT+cUKokz9tzQrj/wAwd8/AMYAcksbys47Y/vgT9gt7LV297uv8Ief+ciidlfnJpHLT31yZeJlR0n7jfNUGA7bEEpNxk50seRvisgpeDSXGt1F7W0frmygQQZfUu9O/DgZA/Q5ucpBoXEOVLM5bMG3J2yOIboOFrNcl657rZDoMWJruSqOhANYgfIS3YoFmyrVprEvFB9FTTV+Ou+5KCGTZUC+93i+vluCwkdxC1rKuNjLCN10kk/F7lCnNNLOSDIyqzdRIVrJ9bKhlT8dAl+UAuFjuuq0UjnnZQnW153EWBO+bOCA595MnY5aez1rNqNqlAiOrJyGtrBWlz0AaUCO0ycdst3MYChwoHzdudCgiZEp+gLB8zfk8/96QdY9ab5KKxBq+ZYWnRGeTwrjhLrgByFaz4ROANvhw==;
	5:pcA6ZZH//Goj5WD6mnsvUsvWOoaJQn7+wf82av/Iza4D6rzK4nfMLSv4fkT5MesleUlX6U9bTzpxPm6qrWEwq5lzAGQ5ev4BzJ2cRuCxEKGbZGvRKMhwyHuT+figW9kXs9a5ZslfkKjomnr9dlp93Wrpu6VP7TMbZMPHGOFKVnM=;
	7:zFFuMt5vPHidSNuhRvrJHlD/ZIB/CPwJ4pPHSx3pfH7zISuD7Ss1SmBhybOrw2Hy/MwEViV9lenskbDoaAiuAjcBNYPRVEP7/Nq6O8WUzZhDFATfQsM2FxmH7V4UTXke2TypQxxdmlhtCNVVmT2sooxHHo9ixYHHfvNjgD22zlsxq3vuRklg4nIvVBoQacJdgHdfe1Cds7G89Ka+9RyNGd8ftWBLcddaDKKh8vY4QDFd9V0REe2Ob4DviDf1BiQC
SpamDiagnosticOutput: 1:99
SpamDiagnosticMetadata: NSPM
X-OriginatorOrg: prevas.dk
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 19 Jul 2018 07:13:33.8628 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: f3d2b9e9-378a-4d7b-a502-08d5ed4723dd
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: d350cf71-778d-4780-88f5-071a4cb1ed61
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM4PR1001MB1395
Cc: openembedded-core@lists.openembedded.org
Subject: Re: [PATCH resend] wic: allow bitbake variables in kickstarter files
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
X-List-Received-Date: Thu, 19 Jul 2018 13:43:02 -0000
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit



On 2018-07-17 10:14, Rasmus Villemoes wrote:
> On 2018-07-03 14:54, Rasmus Villemoes wrote:
>> image_types_wic.bbclass has a mechanism for doing variable substitution
>> on .wks files by simply letting the input file be called
>> .wks.in. However, that doesn't allow using variables in files included
>> via the include directive. This is unfortunate, because lacking either
>> the ability to include other files or variable substitution leads to
>> fragile and error-prone duplication between kickstarter files and
>> recipes/configuration files used for various boards.
>>
>> This adds (somewhat naive) support for variable substitution in all
>> files parsed by wic. The user should add all required variables to
>> WICVARS to get them exported appropriately.
> 
> ping^n
> 
ping^5

Hi can you please take a look at this :-) Please...

/Sean

