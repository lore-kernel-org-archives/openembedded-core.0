Return-Path: <Rasmus.Villemoes@prevas.se>
Received: from EUR01-DB5-obe.outbound.protection.outlook.com
	(mail-db5eur01on0106.outbound.protection.outlook.com [104.47.2.106])
	by mail.openembedded.org (Postfix) with ESMTP id EB48A601D4
	for <openembedded-core@lists.openembedded.org>;
	Tue,  1 May 2018 02:51:11 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=prevasonline.onmicrosoft.com; s=selector1-prevas-se;
	h=From:Date:Subject:Message-ID:Content-Type:MIME-Version;
	bh=6vW3whAivPjtGarNPKlE5ONQQo0Qi+5KwBEU2axFzbA=;
	b=evVTpgA0+eaq3kC3PTlzeHDTkTuNg75ET8UdqVkIj2MnSSrb81pgVqCbg7WAN3C/Nbo4Pw58W8ZveaC8Wq5j1+MWpakKF2D8LtmjoOFqqD8ckKxy+fHX82Jvktjf9fevobOGa8NS/dt7XAjowmrevJVDVBVaC5HzPZcx/65DjW8=
Authentication-Results: spf=none (sender IP is )
	smtp.mailfrom=Rasmus.Villemoes@prevas.se; 
Received: from [192.168.0.189] (5.186.126.104) by
	AM5PR10MB0433.EURPRD10.PROD.OUTLOOK.COM (2603:10a6:203:25::19) with
	Microsoft SMTP Server (version=TLS1_2,
	cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
	15.20.715.18; Mon, 30 Apr 2018 20:19:15 +0000
References: <20180322134413.8079-1-rasmus.villemoes@prevas.dk>
To: openembedded-core@lists.openembedded.org
From: Rasmus Villemoes <rasmus.villemoes@prevas.dk>
Message-ID: <c0a97093-f931-2dab-68eb-79ec36808f7e@prevas.dk>
Date: Mon, 30 Apr 2018 22:19:11 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:52.0) Gecko/20100101
	Thunderbird/52.7.0
MIME-Version: 1.0
In-Reply-To: <20180322134413.8079-1-rasmus.villemoes@prevas.dk>
X-Originating-IP: [5.186.126.104]
X-ClientProxiedBy: VI1PR08CA0085.eurprd08.prod.outlook.com
	(2603:10a6:800:d3::11) To AM5PR10MB0433.EURPRD10.PROD.OUTLOOK.COM
	(2603:10a6:203:25::19)
X-MS-PublicTrafficType: Email
X-Microsoft-Antispam: UriScan:; BCL:0; PCL:0;
	RULEID:(7020095)(4652020)(5600026)(4534165)(4627221)(201703031133081)(201702281549075)(2017052603328)(7153060)(7193020);
	SRVR:AM5PR10MB0433; 
X-Microsoft-Exchange-Diagnostics: 1; AM5PR10MB0433;
	3:BBgByR8ZhUICooUHzI528YS5V6GpzrtD8v5F/w/kaLtCKAmgng70DzgUJToOeXbMeOXw90/jOGImtPKMf4U2v8wMOfMIcVWVzbsMVueZlK+My3A2STNZv9CJh2kBidKfJpwWVZxO8FZO0acEkUh1maYFyQ+6dDmOi3J7FtnT9t81UGxZ+xrSldxn+pP0Ho4ApK6hSPQrfqfrYuq2bFPu2a+JxGz4VNzZ2d9ZB1RwtInmM8NkXC7l3tsrlhNMzMdw;
	25:MiAxfKKgLi3HEtF7SFfb7iv0FO9veO9oYbxq2XxxuUzsmnCQ2KACUrmqxoUjuU9Jajuc/Qx2/BWAR3i7lchkKNcirWsKkFz8Hbh735s7U4vNgciCX09piBiwUkXEhpcAJSKkU6UO+IGt2T+z/Tpa4h9ts8RAY1whf6LzU0kZcQcX9k/ZWctBrKByqxDpY5jhv8WzBBhIErQoSsO+vbyqKC2t3P1TkPlO2jVoK+8ABTO+nnzUJsVMOIbsmXFlyKt4R3YmclBR/CAoEmZ30lKXJeSGuWDvgezAMHq8+FJ7fP+gOX1DnXcg8yyVVNhxuj142QcYOsxodcVvz1UspCUyyg==;
	31:x5j9JPkHJQ/AbODn7j1VDT74EsOh5NhHH8+zwJO/Qum+mulh73DoOTsmNk+xSkv4AAO9nYL9VNDiCKxROdYOmQ83aAXKYjseHTkKQ2zMSD9nCB1vkTjrdLQwZ5DemIEnsSr9BWGY8MqllozxttPXBWmWpN8R3wEuf2nkq3P0fGbN0hsDPp9Znm4D+0pm+xg3dThHEXbEayj24RfGDZvxW0kVH2gDvJkWEIWtA/fM2TI=
X-MS-TrafficTypeDiagnostic: AM5PR10MB0433:
X-Microsoft-Antispam-PRVS: <AM5PR10MB043363EE68F8CF5FF2699AAC8A820@AM5PR10MB0433.EURPRD10.PROD.OUTLOOK.COM>
X-Exchange-Antispam-Report-Test: UriScan:;
X-Exchange-Antispam-Report-CFA-Test: BCL:0; PCL:0;
	RULEID:(6040522)(2401047)(8121501046)(5005006)(10201501046)(93006095)(3231254)(944501410)(52105095)(3002001)(6041310)(20161123564045)(20161123558120)(201703131423095)(201702281528075)(20161123555045)(201703061421075)(201703061406153)(20161123562045)(20161123560045)(6072148)(201708071742011);
	SRVR:AM5PR10MB0433; BCL:0; PCL:0; RULEID:; SRVR:AM5PR10MB0433; 
X-Microsoft-Exchange-Diagnostics: 1; AM5PR10MB0433;
	4:Cb+iS1RqlTRM8+CwKZzx+L4q9y44J98HlTvy0wlmEbkMOmXsOgnNkiRgzsTg+DmhnEBvkypC/VKuZuvo82KLQK/4/n9wZAIu4Kt6iaioViG6lkD18l29u1VdwX2Ng83Ce3FKm1IWTqNHGAMKYA9Q5w4tKz81HJVO8Q9eaz4xsv8dt6er2wyyEQWwEnt7wcjDKPqGzytB9BenqD6ioa5sgBkQ/RNkYSmWndGebsTzI3G4EncTb0ILB0841WdO6epmjuvQPdgfhkmbpladia0Iag==
X-Forefront-PRVS: 0658BAF71F
X-Forefront-Antispam-Report: SFV:NSPM;
	SFS:(10019020)(6049001)(39380400002)(39850400004)(366004)(346002)(396003)(376002)(377424004)(189003)(199004)(31686004)(6666003)(956004)(230700001)(3846002)(6116002)(6916009)(105586002)(6486002)(229853002)(68736007)(16526019)(42882007)(64126003)(446003)(50466002)(71446004)(186003)(486006)(26005)(2616005)(97736004)(106356001)(476003)(11346002)(44832011)(77096007)(65806001)(52146003)(2486003)(23676004)(47776003)(65956001)(66066001)(58126008)(316002)(16576012)(52116002)(386003)(74482002)(36756003)(31696002)(76176011)(2361001)(53546011)(2351001)(8936002)(65826007)(81156014)(81166006)(8676002)(7736002)(5660300001)(72206003)(8976002)(53936002)(117156002)(305945005)(25786009)(2906002)(6246003)(478600001);
	DIR:OUT; SFP:1102; SCL:1; SRVR:AM5PR10MB0433; H:[192.168.0.189];
	FPR:; SPF:None; LANG:en; PTR:InfoNoRecords; MX:1; A:1; 
Received-SPF: None (protection.outlook.com: prevas.se does not designate
	permitted sender hosts)
X-Microsoft-Exchange-Diagnostics: =?utf-8?B?MTtBTTVQUjEwTUIwNDMzOzIzOjQ1ZGlKRURBMHRiRGRSZDZ5cU53cWhNSXhn?=
	=?utf-8?B?V3ZjcUsvSUF6dW54MGFDcCtBbWY4ZHQxZVlMYndzdFpkcUxHL3BvNXFFK1gw?=
	=?utf-8?B?aDlpVkI1cmN4dXFYNVB3WG50VFpVUGpsTmFubmRzdk5mWkNpRG1sODdqODl5?=
	=?utf-8?B?NmVTSHVrU0dGd1VVOFFIbGFwSjg2NC82WWxUT3RrK1BRRzR1QnRDWGtoUnpq?=
	=?utf-8?B?dG56cW9BRDFydXNFTjc2MHhiRDNneXkyWE1sRkZNOVJIY0J4WmlTd1dsNjh0?=
	=?utf-8?B?dVV5YkJqTjJwSm1oN0tMei9aWlZsQ1lzcDQ0UmdUejlJZFFIOWU1QWxSVmpz?=
	=?utf-8?B?cnc5TkNKSFdtVTJBdHlpV1FiMG5CblNhTmlDMnJBSG1pSnlYNzdDSm1yZlFT?=
	=?utf-8?B?eWpGUE5UNWRjSkx5T292d0FvOEE2aWJheThoNEk2UGJURjVwRklPN1I5VEJR?=
	=?utf-8?B?K0hCekoydkJBQVNVN2ZaZW1IemJ0bUZqdm9NaDN0eTFRVEU3eXNscjhzaHo4?=
	=?utf-8?B?U1ViMkdKcjFtdEQ3RGwrcEIrWXBqcE5IR2VmNCtFbER3NUtNemFlcUNSVjBG?=
	=?utf-8?B?NjFPZk1JNGxUMHZEVjRkWkJTNWN5N0RyM0tnZC9uc0xKQWtVT2RVMWh3Zlc4?=
	=?utf-8?B?akUrbjA0a3poZ1FyUXhLMmhhN3puSGc2cnpKNTJoeGFsdmFKUTlvSFlCcjVX?=
	=?utf-8?B?ZnZUTmdzdUJXM0JzSGtXR1B3YnpWNjR3d3l1QXRIZTQ2cmFtMm81YzVXRmNK?=
	=?utf-8?B?TjBEWlVqdTdVSFJOUVJyZTFiK2t2WG5kOW5IUjZob3YxZ0dtUjV3NllreE9T?=
	=?utf-8?B?Sk1HNGZFSmpYNUtOYVFac1k1eVlKWjNDamRrWDZnSFhOWk9XWHVtWGxhclZK?=
	=?utf-8?B?SGdoQU4rZHh2VjFENENZVTZRdG1LSVdUVm1tVEo0V25iSDRzRmE5em5Dc1Rq?=
	=?utf-8?B?N1M5alFmV1ZQYk5CcGw1emFueGY3MmxwWk5DQ00xeUw2WWhHNE5oOGhaOXd2?=
	=?utf-8?B?SGJudnYwQ2pvNjZvZmJhWk9JYndvbURUMmZhNnA0L1dDNzhiVXZiZjltcWxN?=
	=?utf-8?B?QXY5V2c5SmgvQTBNTWIrUGt1ZERkWnRERHJYRUpCWlNDb0FCdDFpNS9rYTRB?=
	=?utf-8?B?SHBlYXp0VkZhbVYzMFpkQVkxUk45Tk5RTmpuS2lFMEJTV0lDc0w4cFVVWGlN?=
	=?utf-8?B?b29SQ1VVaVpKOXRQRnUxR0wrbm5JdmlkQUJnTlpld01CYW5yejhyV3cwUHhR?=
	=?utf-8?B?V1FDd29QSE9LeU9tMEdPVDhZRysyZFNZSnViMTRCMWlsOXRsNmY0OTA2ZC96?=
	=?utf-8?B?RGo1VE03LzE0Z0VzRE9QOG1XTUU1UENVazNtenpEQWRrL0dENFpkdzFMeVEy?=
	=?utf-8?B?VitHTXRWVGw3Nmx3NERqNWNBZ1pPa1ludFVwTms3L0l5RVU5UDNXeGx0a3Bx?=
	=?utf-8?B?UGcxb0RVelhxZkhlZlV6aGdSTEZVSkQ2VlFsT2I4MWxkZkhhTWNjRnFhcVFT?=
	=?utf-8?B?RHJIN1J5WGxUejl0NjIyVUYwOXpGQlBQSnZDSDJ2M3pBV3N5QXJwTkZXZitz?=
	=?utf-8?B?SGNZL3lpUWxTUXlsZ3BNUW1vRkcxS3hUSm1sVXhOQkUveTBlaWpwV3lzeXZG?=
	=?utf-8?B?M0Y2MkFiZmR5aXAxQnJlN0RQMjZTQlRJVVM2ZTBydXExeWk1eGVrQyszdkVK?=
	=?utf-8?B?QVU5NHhYKzVBVUhid0Y1b2tyQXdXMjV1bHhubG5QRWJxZjJYb2ZvWGw1NURG?=
	=?utf-8?B?Vy9GQmJTeHpOZVEwOUJ4Sno2ekk1Ym1kV3JFdWVRNWhNZWd1NFNQcHRZcG45?=
	=?utf-8?B?Qm1sQU40b21aV2ZsNGlkZlNPM3FSYUNLeFl3MjdBNUo1bmQwd25iQ3JWQk1T?=
	=?utf-8?B?TExTRE5yRjhyb1lPZDh6YkFDYXJ1blNuUGVscUhiS2pHd3M0YXFUdkxPbFBN?=
	=?utf-8?B?V2FSMk1JUmVhRGZLYlZ3STRvNEZ1WDA4cC9yOHNiRjhKVW5nMnhDTkZDZkJV?=
	=?utf-8?B?ZnlQdlppT0lLbXZQMmdsNE9FWS9tUlNlNkhlT1NwREtPWnRzd0VCSGQ2NjRH?=
	=?utf-8?B?cllrdFJSVDUzellMclc0d3pXdEphQzF3RTJhdmlIZWtXSnNpczBGQWs3aU0w?=
	=?utf-8?Q?XmzWqgczwPAdSzqnUOIZFz/ud6vSXOoHsIuXD4nYSxU9?=
X-Microsoft-Antispam-Message-Info: Vp167MD198roJQFlCayGPNlPQf5rpDbk7stw7A2maJu+G+q1IA37aB1o6QLJ8GaVzYiUeTf8/syn08eDN1zBdSb3tc8YKc1HIKRhO3ul4ob/LXjz/8UbELzDtBtbe8ChPfUZQqnrGMIq+pDKF6Y9LeTADfG1DbTVO0kvUq8qQTcsxjM2eEDdLbR05GjvKn0g
X-Microsoft-Exchange-Diagnostics: 1; AM5PR10MB0433;
	6:fNsqt8TAgw3Tzpmdwqhy5jclZQrQTDg5wJ3Uv6qhZufb/TbrMAovxhvsUTDt4aifWjnKmgzT649TsRyYFw1jw57Xict1ZjlzqDhE0olNZ5r0uQ6Myf4ReiVJwHR6E48LsmmyTfort3iNr3jvUvj1jPymHbpQT5Mdb9w2l9UoO1e1UkHxBpdapjMCkcjjNLx08n3ITJnu3AGBsi9fbGPg5AGmrvZZYr4q5UTN2AqgFRNIBKEIbvyV+Lb4APDehEpsPk1QkvAe6tH3kQaiZEcqUMk4W+EctO+jJYTRICWF1HtUSpGtVayqOJmvWYi4zRGufONVES23MuRB5lsnQjj4229hAPDCKQHEyBxu44xad65U9cBYLiI//VpyauIOBJBM9VypoAPwT+swtKb0M7zdkxZqKDciooBBDfcpjWM8YkwYk+/djHztonYWIktmNhcGd5ZwKjaWZe7dHqEKpMXOPQ==;
	5:HkutX4NyFxP0llMiHMi/0ikJ0CH14L6eyMmB6mNi5Go+tTJfP3+oBcpJBqL0oS3S6FqVl4YkcN8PjAFhsgwY+e6YIyS6YVHuRRXjvuXbjm9fZ4m/WnqdQk7SGkB1AKZEErEoho0hjyrvNZbKmvcqpLc8Tz3Bdq6+OLg2iz1iLkE=;
	24:LRuce4tDOXgDCphLu/j+EVnPAlsscVId9WYu3hP2TFLZuKhr97i6cgc5Sefdu4kZcRJOlYcTl6h3OmBdi+0kXkLqteg6MVFIBANubpR9F1k=
SpamDiagnosticOutput: 1:99
SpamDiagnosticMetadata: NSPM
X-Microsoft-Exchange-Diagnostics: 1; AM5PR10MB0433;
	7:v9hxigNhmhVBOIn5qFlbvEaVRjtzzYgHdo7XlfDSDiGKEAM0bZrsrJQC7E2YH6PybnVmfNNcLdzhHlCJiaVYrBSle2qxDioSzQPDvwHVCq6tKqn11h4D+zMhZJXwle8WUD7M2IgV606ae25f9qmA9Tb4ZlJK0J5AvpRA3pV9uXhASMcUYrUwnREAC1Ib8ByjgqT4ktOzpjGsdPJFqkFrDvIoMVMhC5fwCVYhX1AnYcS5yVkLU4kQeSsfqWJenh5a
X-MS-Office365-Filtering-Correlation-Id: 7aaa529b-5e6e-4cc6-9959-08d5aed7a576
X-OriginatorOrg: prevas.dk
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 30 Apr 2018 20:19:15.7664 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 7aaa529b-5e6e-4cc6-9959-08d5aed7a576
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: d350cf71-778d-4780-88f5-071a4cb1ed61
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM5PR10MB0433
Subject: Re: [PATCH] wic: allow bitbake variables in kickstarter files
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
X-List-Received-Date: Tue, 01 May 2018 02:51:12 -0000
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit

On 2018-03-22 14:44, Rasmus Villemoes wrote:
> image_types_wic.bbclass has a mechanism for doing variable substitution
> on .wks files by simply letting the input file be called
> .wks.in. However, that doesn't allow using variables in files included
> via the include directive.
> 
> This adds (somewhat naive) support for variable substitution in all
> files parsed by wic. The user should add all required variables to
> WICVARS to get them exported appropriately.
> 
> Signed-off-by: Rasmus Villemoes <rasmus.villemoes@prevas.dk>

ping^2


