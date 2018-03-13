Return-Path: <Martin.Hundeboll@prevas.se>
Received: from EUR01-DB5-obe.outbound.protection.outlook.com
	(mail-db5eur01on0109.outbound.protection.outlook.com [104.47.2.109])
	by mail.openembedded.org (Postfix) with ESMTP id 0C832780AA
	for <openembedded-core@lists.openembedded.org>;
	Tue, 13 Mar 2018 08:31:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=prevasonline.onmicrosoft.com; s=selector1-prevas-se;
	h=From:Date:Subject:Message-ID:Content-Type:MIME-Version;
	bh=aa9wpmDgDLeZL4kVH/jffIhC8CSZB/dRrM0kAYedlck=;
	b=P+pyuteyOwoWnGxA0ppNppSnSLRD4oDclmYxD8/JX48a+BPOPpw6CKbTcDj5kPss3pEnKBgdp3K7TUiNuoApD2dXJ4iyC3r/5EXiRRIBaqlX7EP7uree6yDWNfeY7EEZ9tC1U5h8iEBO6m25cI4tMkLfYq9SEkIuSkNqNvC7qe8=
Authentication-Results: spf=none (sender IP is )
	smtp.mailfrom=Martin.Hundeboll@prevas.se; 
Received: from [10.0.0.220] (85.184.147.232) by
	DB5PR10MB0118.EURPRD10.PROD.OUTLOOK.COM (2603:10a6:0:15::25) with
	Microsoft SMTP Server (version=TLS1_2,
	cipher=TLS_ECDHE_RSA_WITH_AES_256_CBC_SHA384_P256) id 15.20.548.13;
	Tue, 13 Mar 2018 06:58:49 +0000
To: Andre McCurdy <armccurdy@gmail.com>,
	openembedded-core@lists.openembedded.org
References: <1520896748-13037-1-git-send-email-armccurdy@gmail.com>
From: =?UTF-8?Q?Martin_Hundeb=c3=b8ll?= <mnhu@prevas.dk>
Message-ID: <7a30503b-4e0b-b7a7-e0f2-74627db55b37@prevas.dk>
Date: Tue, 13 Mar 2018 07:58:47 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:52.0) Gecko/20100101
	Thunderbird/52.6.0
MIME-Version: 1.0
In-Reply-To: <1520896748-13037-1-git-send-email-armccurdy@gmail.com>
X-Originating-IP: [85.184.147.232]
X-ClientProxiedBy: DB6PR05CA0029.eurprd05.prod.outlook.com
	(2603:10a6:6:14::42) To DB5PR10MB0118.EURPRD10.PROD.OUTLOOK.COM
	(2603:10a6:0:15::25)
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 4d909109-b6a1-4ae5-37e9-08d588afdf98
X-Microsoft-Antispam: UriScan:; BCL:0; PCL:0;
	RULEID:(7020095)(4652020)(5600026)(4604075)(4534165)(4627221)(201703031133081)(201702281549075)(2017052603328)(7153060)(7193020);
	SRVR:DB5PR10MB0118; 
X-Microsoft-Exchange-Diagnostics: 1; DB5PR10MB0118;
	3:vzL8Pt6veqPVqLWfnLWAW5TVmYHHRB2YMCZLCXi8x5N5Hpn2v6RRYSD9WAbnHSDPf4JV698caJ3VXfAKSDG4ELk/LlzXz4InLGKVoKrnXEfVmqn+a/cRcLZVrmS9V0vzeeAoVaY0OwAS6zkSLz9QBKPTQxJ9U4NYBU9Cok1IrZUL/IbmKDGluVimxjdlZ1GJM9MbM70vjlp+wkI4BkdEHjdb3wfjI6sQd3EAbcVXZP6yvyEWnRw55ag7L8U6wF/y;
	25:K9BfG1A/0NQiWoPQjBpGiJuu2RpfjMqUstsYKm50poz02EmyEGzpzezRMt/ud042olTy03F2r6tjo+0IMgRojKoVymBSNwUpyol7kJTHmDBHTm+uCVsNmYw5wFXitnKxVT0xpSuzDYNziGpYnStlAGGaSPdv8duo9Uolz9emsvwGZwn8tuiSd58i3pd3juloaglFeklWVNiUtNF5r5TxST/UAqpOz4cWHnfgsdCec3s+ahkwYeSKk1rq85Mx/13fT7l/871sQfFgOOB9nCHoRmtqnSDZi69bmHKvrH4XJ4koAYrRRHYwQ8aP1soB/dVP5Wv4t4irUdV5hbOU5hY33g==;
	31:lfydg9dOVQRC7sTODH2XKyGGBVGcLLsHn1RaesH4xaj0HoyAKagMRoUImEo+OQuiGVOWfP0BmY2sxpL4nB3oTrpr1gGhhu2Ui7Uvz+6o8zOmZ6M7ODVM7eV9AMiXxZfKr3WV6tTHGienmiheMdaaCfMQ+3RRRu4E4P1YrqCe7+/RBITVdpn+IrUVl0NBo6OJb81LusFaHQP7ymb/zS8ah6KKcwA1hRRAZItoNAmvWQ8=
X-MS-TrafficTypeDiagnostic: DB5PR10MB0118:
X-Microsoft-Antispam-PRVS: <DB5PR10MB0118AFE29128B705713A30FC9DD20@DB5PR10MB0118.EURPRD10.PROD.OUTLOOK.COM>
X-Exchange-Antispam-Report-Test: UriScan:(85827821059158)(788757137089);
X-Exchange-Antispam-Report-CFA-Test: BCL:0; PCL:0;
	RULEID:(6040522)(2401047)(8121501046)(5005006)(3002001)(93006095)(10201501046)(3231221)(944501244)(52105095)(6041310)(20161123564045)(20161123562045)(20161123560045)(201703131423095)(201702281528075)(20161123555045)(201703061421075)(201703061406153)(20161123558120)(6072148)(201708071742011);
	SRVR:DB5PR10MB0118; BCL:0; PCL:0; RULEID:; SRVR:DB5PR10MB0118; 
X-Microsoft-Exchange-Diagnostics: 1; DB5PR10MB0118;
	4:6NTaOZPcQ9hpY79K/4TTmB0IZd0L83Pccm3Uq593nHpU0P5ZqScMfioiqS4p2P2Rpju/a2KlmfNtE1LOC1jVLIS09anoRfr93Z9kJHqbNWdZsy3eYDPKE8fOSXI/jIyQQw61DYDoX2ZBvZBOP95DF2Exp4nillw0rhb5EwoMJmkYK5P3S4RoKFootuGWOmRN9HYWnJB1SgWIhWltaoj4IBl2y/QTgmry6wNomVWiHf/Rif3NU7VubejsUFOnUukMiBK9S0X0FzacEgWrxh/rZWvln1oiu0UKnpnYLp10fZuLEfCQMfS5LWtkV34xG/A1BVMo+bSmqp4apRdQeAqVS8lRp7GLyg6qbJkfCUXztgs=
X-Forefront-PRVS: 0610D16BBE
X-Forefront-Antispam-Report: SFV:NSPM;
	SFS:(10019020)(6049001)(366004)(346002)(376002)(39850400004)(396003)(39380400002)(189003)(377424004)(199004)(25786009)(72206003)(186003)(31696002)(58126008)(8936002)(53936002)(478600001)(8676002)(65826007)(106356001)(23676004)(67846002)(3846002)(6116002)(2486003)(65806001)(65956001)(52116002)(2906002)(66066001)(229853002)(316002)(76176011)(50466002)(52146003)(68736007)(16576012)(105586002)(97736004)(53546011)(16526019)(6486002)(74482002)(386003)(64126003)(7736002)(77096007)(26005)(47776003)(2950100002)(8976002)(81166006)(305945005)(39060400002)(5660300001)(42882007)(31686004)(6246003)(230700001)(81156014)(36756003);
	DIR:OUT; SFP:1102; SCL:1; SRVR:DB5PR10MB0118; H:[10.0.0.220];
	FPR:; SPF:None; PTR:InfoNoRecords; MX:1; A:1; LANG:en; 
Received-SPF: None (protection.outlook.com: prevas.se does not designate
	permitted sender hosts)
X-Microsoft-Exchange-Diagnostics: =?utf-8?B?MTtEQjVQUjEwTUIwMTE4OzIzOkZ5bFVxU0JwZHo2cExIaW1hSkhWdnllOU5G?=
	=?utf-8?B?Vk1GQUVoS3VzNk5vWmVWdVN3Z1JJVlhSRGNTSmF4bnpqemJwOVBqSWlZUFdP?=
	=?utf-8?B?YVFJUXFRaGhiSEtzWGlsamlaU3grOG1nZXZiWThFUE5WaE5wS2M2VkxLS01z?=
	=?utf-8?B?dG1oSWtUdkpkRGFmVEx6NFF4OTQwUjZjNVFwQUdXdVZVL2xNTXpJK1p6Z2hj?=
	=?utf-8?B?akVzdzVtZjdrTUhsV25zYkEyYU5sQTY0ODM4UUY5NFJjUzNtTU0vTVV4cjZ6?=
	=?utf-8?B?TlBlYjVrTjFQcmJKV2ZycXZGTGQ0UG5kNXRMTFdjSGFzVHlBWjNZbWh3TWc2?=
	=?utf-8?B?Zy8vcGk1WFpMeW1OUkF2amVpeHYyNUVVbTFBTFdORVF6ekZ3UzJ1WUZJcFE5?=
	=?utf-8?B?Q2xXQ04vdHgvQytXZnF2dFFabU9vZE9hRUlyeFJJeWE0cEIrYmZLSHU3N1BF?=
	=?utf-8?B?Rk8zdHJCNjRqdXdCY0NLMEs0SE45VkhwN0Rib3UxQm5ZdGRRRUZ3cHV4SkZ6?=
	=?utf-8?B?emJheTZOdllBVGV2Q0l2bms1aFpJNnp3R0ZraXZWRzI2VmIraTFtcEVGSU9T?=
	=?utf-8?B?UUNqOERIcnpOZkZQSzZBZkZ2KzZsUkdiKzBjUTVtT3phTEZIYTRDdGJCOFp3?=
	=?utf-8?B?ZVNLU2tMSHhzcEtiZk1NcGlrOFc3U25ONGhsWDV0WDdmRU1Kdmhxd1FkT0Zt?=
	=?utf-8?B?UFpBZmpCVVl5NDBjeFc2d21nMm9MOW4zR29CY2p5YjllZ0htcE9sOGo2SUVl?=
	=?utf-8?B?MGd3KzJTK04wdTE3MUllL2VOdFRqZ0JUVllBSW51T2twbHVLcnNVQlNrYVgv?=
	=?utf-8?B?K1FES3htdXdNemJrTlh4ZlEzNHkvZndIaFloTHpnVHZCS0YzN0EwcVZUbTJG?=
	=?utf-8?B?U0xkVVBIZ08rYnVILzYydTFVRURXTlg5dWZyS3ZwSXowa2xYbTJ2dTBkd1o0?=
	=?utf-8?B?NFB4MXBTTkRTbndxNEZ5Qk9WVWxOaTJ0UnJZbWFJNmE2dXladU1HekZoMUYy?=
	=?utf-8?B?MjZBZk1DZGdXL3NLZTNkRjlyL0wzenpzVTNtMWpMeUZQajFGM2hvUVBVSGE0?=
	=?utf-8?B?YlVDcThaSEtmbXVUYW1tRkQ3KzJnR000dDZveVZvM2UvL3BQOGJGamNOcW1K?=
	=?utf-8?B?OTNjRkRnUzd4RjhodWtiY2JNbm1OK1hDdWJmdHVOME1WSk5Dak9FZzJKY0J3?=
	=?utf-8?B?Q003RjJDYitGRUtnVW11b2hYOVZOYlBWU2dxUXQvUGV3Y1pTN2l2M016SzFL?=
	=?utf-8?B?bGorTWQ2bFl3dFVNWHFyc3FLcWUwOEVySE5uYzU4aUp1M25GKzdLWEFsNk05?=
	=?utf-8?B?QkNOQnpEcDZXaFRVNndla0NMSndsbmVYWmNoRWJqN214WVVyVGE2dW1LNFVO?=
	=?utf-8?B?UjFIVUhVTlQ4dFdiQWQ0blkrenYrZmpkR0xvRVMrWTNQQlZkOTdrYnc0eWRm?=
	=?utf-8?B?ajZPUDZKT2xoS1Q1VFAzZlNoQ1hvMnJHMWR4anQ3cXhhVXU0cWovc1BvVjQ3?=
	=?utf-8?B?S3dZYk5aSXYvSzBDd3JGbWQ4eEFvSnhRZ2dhblB3VkNJTG9pUDNmclJGdWdl?=
	=?utf-8?B?cjFmLzJKOTgxUEN3MzY3d3BNRVpsM2lQY2ZnWHViQkpuQ0VBNjJaQmNtVkU2?=
	=?utf-8?B?cS84ZjVvTW1hNWYwalRmSncrL0N4ZHpyVVhicU5tcjhzbDNEang4Q0xqZUFh?=
	=?utf-8?B?OFNkQmtDLzVQeUFtbDdnYllxZzJxWG1xaWNSTFpRaXdVTncwbkFFMXNlWitU?=
	=?utf-8?B?U1JrR3YrS280ZmN3THphU1ViUDh0ams5UmhxN25WZC96MDcxSXRjNnRTemZy?=
	=?utf-8?B?cGxZeDFZUEZLQUlPVjRlU0p0TmhqMDFOb1ZUTTRkVURUV1hsZGtzL2tpZFJK?=
	=?utf-8?B?NWJ3RmRLZnZTMGdLVXpwNW8vMjA2N3NGK3BGSysrNGRFbjZOeUxnMHA0UnY3?=
	=?utf-8?B?enlwdTdrWEFBPT0=?=
X-Microsoft-Antispam-Message-Info: rskT1muPBx1mXnlqYyfJBmnJpE6mo95QKPtvAki0NUUEi+DkRRCu1SuMfj9h5EFmu9Rbq702DhwBsTBg+WQHa6vL3a5vadTMs0R1BbkJ/gNivq9MOIhyHzzhJvD8r1ig78ESvfxD6pQN7yQ5Tt2N4WxYaUrNFWoIkcQaWmgaBeF7x4Bckwiio+qQZAf+tCKh
X-Microsoft-Exchange-Diagnostics: 1; DB5PR10MB0118;
	6:K2ubvreBlLMYQ94QwgMYm/sB97YFsdhAW63ZXhJliJ6WLdaFmeDCM6Wj02FIfp5FaXcGtLKeCUsJyEPsTrM3Ef9hLfVeAob6dLiJJiXZe4B2/8SGJwNdlVjBr8upSBT8IeH2qH5WdhtC9dAt9cw16S4dBbHR+/lJ1rckf7xQW/CECNMINoUoyy6+tOGFD6i9gJcQdUyMOYqGBIY/2GL1rYq4QZCQX0DFRIGamZArATLMy/vBfv4sYY1X3Cks/+q6DI0o7hiaOEsNDuLTRoswmkx6J/GxwDkmsA4ufLUAVN4ikVC/PMK0vJtjx7MFBMxCNgnKRmmrmc5l2tIlMHDFnTmqThJ2bXTlkftboAEe/qs=;
	5:HtYkQFZYj5f6cHWkodPWzMd6Lz6uXgQSeg8ct9KBO0mg33CO+Cr5tZnP1dlp6E15C8esdOHchm7yaxNVjbnkjHmLqFcbObxH6IwpI2/Ry122WtbOXTCOjGBQhVNioz4PX9qggxN+UJDZbf3yKIba/xzRAY76IGra2lDPR4aBsrM=;
	24:PzFG41R+RxqGFk5ig0cQ4LymKsmTOHfgJNC3Bldv3cHS8Djmh0XVh5TfVWbYfvDeuYK1QUJid7D37x6VimRDgm/3HxaNYro0P7oBuJwMZYI=;
	7:CTBpkH2zcwFZwUMT2nYlaai3dr9NDst/G7O2lI4GDpyqaeo8E+mFIG82YLAxmbQyjF0aZ4mfLzX6IfoPWcEk4mWpNdyza1CUOuakZDsONd0aJJbqIxqeKtZPZl+9taaXJbYOR5Ayg9Ne79VtWSZqafyuf3q05PFOWCZIIkWhIP/smrENR9ab1nvcmbG4EHi58AgwAV+dvNOZ338mmQbOv28rlIHmD+4+N4z9ocV1trZFDDYt8SXdJjb3bKsQHCws
SpamDiagnosticOutput: 1:99
SpamDiagnosticMetadata: NSPM
X-OriginatorOrg: prevas.dk
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 13 Mar 2018 06:58:49.2711 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 4d909109-b6a1-4ae5-37e9-08d588afdf98
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: d350cf71-778d-4780-88f5-071a4cb1ed61
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DB5PR10MB0118
Subject: Re: [PATCH] kernel.bbclass: avoid duplicates in KERNEL_IMAGETYPE_FOR_MAKE
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
X-List-Received-Date: Tue, 13 Mar 2018 08:31:54 -0000
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit

Hi Andre,

On 2018-03-13 00:19, Andre McCurdy wrote:
> Currently if KERNEL_IMAGETYPES contains both vmlinux and vmlinux.gz,
> KERNEL_IMAGETYPE_FOR_MAKE will end up containing two copies of
> vmlinux, which will result in two calls to "make vmlinux" from
> kernel_do_compile().
> 
> Avoid duplicating vmlinux in KERNEL_IMAGETYPE_FOR_MAKE plus some
> minor non-functional updates to formatting and comments.
> 
> Signed-off-by: Andre McCurdy<armccurdy@gmail.com>
> ---
>   meta/classes/kernel.bbclass | 28 +++++++++++++++++-----------
>   1 file changed, 17 insertions(+), 11 deletions(-)
> 
> diff --git a/meta/classes/kernel.bbclass b/meta/classes/kernel.bbclass
> index dc0152f..4bcaa61 100644
> --- a/meta/classes/kernel.bbclass
> +++ b/meta/classes/kernel.bbclass
> @@ -62,31 +62,37 @@ python __anonymous () {
>       type = d.getVar('KERNEL_IMAGETYPE') or ""
>       alttype = d.getVar('KERNEL_ALT_IMAGETYPE') or ""
>       types = d.getVar('KERNEL_IMAGETYPES') or ""
> -    kname = d.getVar('KERNEL_PACKAGE_NAME') or "kernel"
>       if type not in types.split():
>           types = (type + ' ' + types).strip()
>       if alttype not in types.split():
>           types = (alttype + ' ' + types).strip()
>       d.setVar('KERNEL_IMAGETYPES', types)
>   
> -    # some commonly used kernel images aren't generated by the kernel build system, such as vmlinux.gz
> -    # typeformake lists only valid kernel make targets, and post processing can be done after the kernel
> -    # is built (such as using gzip to compress vmlinux)
> -    typeformake = types.replace('vmlinux.gz', 'vmlinux')
> +    # KERNEL_IMAGETYPES may contain a mixture of image types supported directly
> +    # by the kernel build system and others which are created by post-processing
> +    # (e.g. compressing vmlinux -> vmlinux.gz in kernel_do_compile()).
> +    # KERNEL_IMAGETYPE_FOR_MAKE should contain only image types supported
> +    # directly by the kernel build system.
> +
> +    typeformake = ""
> +    for type in types.split():
> +        if type == 'vmlinux.gz':
> +            type = 'vmlinux'
> +            if type in types.split():
> +                continue
> +        typeformake = (typeformake + ' ' + type).strip()
> +
>       d.setVar('KERNEL_IMAGETYPE_FOR_MAKE', typeformake)

I think this hunk go be better implemented using a python set(), e.g. 
something like this (untested) piece:

 > typeformake = set()
 > post_extensions = ('gz', 'xz', 'bz2')
 > for type in types.split():
 >     extsplit = type.rsplit('.', 1)
 >     if len(extsplit) == 2 and extsplit[1] in post_extensions:
 >         typeformake.add(extsplit[0])
 >     else:
 >         typeformake.add(type)
 >
 > d.setVar('KERNEL_IMAGETYPE_FOR_MAKE', " ".join(typeformake))

This should allow easier addition of other OE-supported extensions...

// Martin

