Return-Path: <Rasmus.Villemoes@prevas.se>
X-Greylist: delayed 14533 seconds by postgrey-1.34 at layers.openembedded.org;
	Wed, 15 Aug 2018 11:30:24 UTC
Received: from EUR01-DB5-obe.outbound.protection.outlook.com
	(mail-db5eur01on0118.outbound.protection.outlook.com [104.47.2.118])
	by mail.openembedded.org (Postfix) with ESMTP id 573A57916C
	for <openembedded-core@lists.openembedded.org>;
	Wed, 15 Aug 2018 11:30:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=prevasonline.onmicrosoft.com; s=selector1-prevas-se;
	h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
	bh=RuII0Gaq7jeL9P5cvfZyRo3BtoO9PIxqdGJZkQKq9wU=;
	b=rL68Amg/8bjKnkV8S8oPBzo3zm90flYtZR0T/b4GrHAGqzAuFQSc/nQfCDsCf/j+B+KjAtrjAekVZ2Nf2BXP9QAKVL8KP0U0me8KTxT5CCygbFdkURW5tPB35Pfve9w9wPNlabnTOT0Yq8UkLTOljbvO/H0eO+/aABQd7iNI4SU=
Authentication-Results: spf=none (sender IP is )
	smtp.mailfrom=Rasmus.Villemoes@prevas.se; 
Received: from [172.16.11.40] (81.216.59.226) by
	VI1PR1001MB1342.EURPRD10.PROD.OUTLOOK.COM (2603:10a6:800:e5::11) with
	Microsoft SMTP Server (version=TLS1_2,
	cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.1038.24;
	Wed, 15 Aug 2018 06:55:14 +0000
To: Rasmus Villemoes <rv@rasmusvillemoes.dk>,
	openembedded-core@lists.openembedded.org
References: <20180711113856.7518-1-rasmus.villemoes@prevas.dk>
	<0e5d44c6-25f9-39dc-2743-db0359ac9eeb@rasmusvillemoes.dk>
From: Rasmus Villemoes <rasmus.villemoes@prevas.dk>
Message-ID: <832f8c53-73fd-227f-faa9-1f3a53bc24db@prevas.dk>
Date: Wed, 15 Aug 2018 08:55:11 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:52.0) Gecko/20100101
	Thunderbird/52.9.1
MIME-Version: 1.0
In-Reply-To: <0e5d44c6-25f9-39dc-2743-db0359ac9eeb@rasmusvillemoes.dk>
X-Originating-IP: [81.216.59.226]
X-ClientProxiedBy: DB7PR03CA0038.eurprd03.prod.outlook.com
	(2603:10a6:5:2a::15) To VI1PR1001MB1342.EURPRD10.PROD.OUTLOOK.COM
	(2603:10a6:800:e5::11)
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: ef039b20-6e8d-4d01-e824-08d6027c0dc0
X-Microsoft-Antispam: BCL:0; PCL:0;
	RULEID:(7020095)(4652040)(8989117)(4534165)(4627221)(201703031133081)(201702281549075)(8990107)(5600074)(711020)(2017052603328)(7153060)(7193020);
	SRVR:VI1PR1001MB1342; 
X-Microsoft-Exchange-Diagnostics: 1; VI1PR1001MB1342;
	3:cT2EUUK7WQIJcI4X/S5nfCXnKpQqPtIMkCNFxy0F8rbvrL9+iLT6i/49ltJP4FSblSmmuzj58DPD74g3BvKohrZlRIKIc7RIGweN+tds1lmanWdqNWvGIdajCl7C5aMcQeS+QdKE5pPlx2ejr7U/4zqnC5EsxXubui9yCXIzYC07KanSTEfmteOiMjJV6yRBXoZ2Elp8IYghKRhQnVN1fXsjFp7YQIifvY1jsLaVCxIatHnnkVFKrebmIxJ/DqJN;
	25:mKZhnTpNmUs3eYqKs1K/72ZlII1qvRc55aIYy/a+xPkREEfot5OA7oLNONk5xsfd4Cykcs+/yRXImhMj+KddoFGpF9/DgaxSBSRhEFjnnaGQAD/JaqT0tgUoThDbpTD+r/9rIluvFrpBLOTiJoZT09Vlzmz0L9NRHiyBgwu8AeJL4JtpiFE5U5tWB17IIhaPkXnZiMbPH1Uq1yrEJuzTweF7d6ZyCNStm1zYkOiPem9qi6VuoI1q9jUpvDv6mrIWeuWgMX+mTsrW+nVSp/8Sjc44naxc1mjTIFvjEDlGMxjNPQwhEo1z2xxwTt+m0+pABFXTJ0d8VbFqLxeXAQpIJQ==;
	31:WdG9j+LSdTY9wV7MNhxc9dlcWJkAb9Cd+J6+eIKZVvyueI8ve2qJf7tbDboIOpstPK2u/HT2fE2xs9XgaoAadeOgQs1+3JPoMSYOgqQaf29q6Sw6wX07D8cjfe8YMiVB3DzXpEX0/i5QuSjqgzg42biDdEBXFsA1ttozgU1h3qwkiKYSG8LHDpB7f86NWnpRGl3Oe8lpSo/gFM3Wa49leI+1TBKEja5qcoNQT8NKVl0=
X-MS-TrafficTypeDiagnostic: VI1PR1001MB1342:
X-Microsoft-Antispam-PRVS: <VI1PR1001MB13429B14A338C3E7EC4B9CA88A3F0@VI1PR1001MB1342.EURPRD10.PROD.OUTLOOK.COM>
X-Exchange-Antispam-Report-Test: UriScan:;
X-MS-Exchange-SenderADCheck: 1
X-Exchange-Antispam-Report-CFA-Test: BCL:0; PCL:0;
	RULEID:(6040522)(2401047)(8121501046)(5005006)(10201501046)(3231311)(944501410)(52105095)(3002001)(93006095)(149027)(150027)(6041310)(201703131423095)(201702281528075)(20161123555045)(201703061421075)(201703061406153)(20161123558120)(20161123562045)(20161123564045)(20161123560045)(6072148)(201708071742011)(7699016);
	SRVR:VI1PR1001MB1342; BCL:0; PCL:0; RULEID:;
	SRVR:VI1PR1001MB1342; 
X-Microsoft-Exchange-Diagnostics: 1; VI1PR1001MB1342;
	4:PskO0zKI0aBs8VcUwL/RY9yEVrdSOsIyw8qXYcUhjlT9UfCZgd8NTvuNO4JpqrWyMIDYth6kRHusDl3TMSA751Ytwo3VIqX7FMO32hrdao5bipJB5grhMMtqjZ8Sqzt5ujQR+LqunCZLL2MTlqjAjgLTbsC7RS9vZZsyTuxE/0NLpmiINLprndre/k9rxGx91+yJdJ9n7UtZp/3hJLBPMAgkpy40J6x1DXqga1RTlNvLdRLxjmMP3zX03EFGH/7o7BgbcylGUt6bmaIHhg/v8A==
X-Forefront-PRVS: 07658B8EA3
X-Forefront-Antispam-Report: SFV:NSPM;
	SFS:(10019020)(6049001)(136003)(376002)(346002)(366004)(396003)(39850400004)(189003)(199004)(74482002)(7736002)(305945005)(66066001)(47776003)(65806001)(65956001)(6486002)(36756003)(68736007)(16526019)(478600001)(77096007)(15974865002)(476003)(486006)(2616005)(44832011)(11346002)(446003)(956004)(386003)(53546011)(81156014)(105586002)(81166006)(8676002)(26005)(106356001)(42882007)(14444005)(186003)(31686004)(25786009)(6246003)(23676004)(2486003)(52116002)(4326008)(72206003)(52146003)(53936002)(8936002)(64126003)(97736004)(8976002)(50466002)(76176011)(58126008)(54906003)(316002)(2906002)(229853002)(16576012)(230700001)(31696002)(6116002)(3846002)(6666003)(65826007)(5660300001)(18886075002);
	DIR:OUT; SFP:1102; SCL:1; SRVR:VI1PR1001MB1342; H:[172.16.11.40];
	FPR:; SPF:None; LANG:en; PTR:InfoNoRecords; MX:1; A:1; 
Received-SPF: None (protection.outlook.com: prevas.se does not designate
	permitted sender hosts)
X-Microsoft-Exchange-Diagnostics: =?utf-8?B?MTtWSTFQUjEwMDFNQjEzNDI7MjM6dGc1cGFCb1FzTFdzcElpMTZwSkFtcXdV?=
	=?utf-8?B?ZzNQcUF6M3owUzlUMUhncXdRemNidjh2WTN3MUllWjVBdW41bUlYejFTQW15?=
	=?utf-8?B?Qi9FUkFyeDVNaUtua3hEQmhFWENGT3ZVVXd0NkFzN2d6a3krMVhzVTUwUFdl?=
	=?utf-8?B?MmpwczAvcEx2NUplaDA4VVFPVU0zR1BxM3RWMm5nZUhYUnUxSmRsRmhxMVdJ?=
	=?utf-8?B?SHpwblRsYmdNMzJTRlNtOXVuYldqSjZKczlPdGMxOXF0YXY1ZWdaSHRTQmVq?=
	=?utf-8?B?VVRwNVJ0WHdUNDJuRFdyQjVqbDc4NDdhMnJ6TTRPV2NxR1dhZ1dad2VXbzJW?=
	=?utf-8?B?UmY1N2tRc3k0SlFqc05IN3FMK3pXTXRUQnRJb2JRdkJ6RGRzWEY1RG0vNzVO?=
	=?utf-8?B?RnVlVzZTNGFiaUhUNG8wRTVxZStjOTQ3Z3B3dGxlK3FHU3RYUlU3dGlvR0Ux?=
	=?utf-8?B?RHNtc0drQ0hhby9EN0NzY3llMStuaytFLzdndC9nbE5NcVY2ZTJyYVVLaEhR?=
	=?utf-8?B?NjR1SVpwb3paaEV3cTVMdGVsMEJmb0dzTmpiOUhrMEZoREJLc0hlWTVzOFJB?=
	=?utf-8?B?YjRqY2dZQlpDaW5Ba3p2emhWVjMvdFlSOWxRTkl6bUluK0QyTGRtcS9pZC9G?=
	=?utf-8?B?eEJ4aTJEaVdiRmJlSnIwckF2MlNCNDZiaU1pRTg0RFZETHpwc2lXR0lWbnl1?=
	=?utf-8?B?RU4rOUFKbHFoeDRxY1FrZGxoK01oUndVb2VpZklYemY1bGErc2dTand0TFVK?=
	=?utf-8?B?dUVMSkZKVkF3RDVSVUs4VmUrZU9EYTZadW1yTjIveXFrVTNRb2F6SlZKQzRz?=
	=?utf-8?B?b1FDWXFxWUR6V1FFR1FlQmNZMVJISnJaZXRPai9CNExkdG1HTDZmaWI3UXZ6?=
	=?utf-8?B?dTllR29rYUpCVGpRcGxFU1pTTThkWnNDdUNESXR6bzAvSlgrVEdpemtIbHBE?=
	=?utf-8?B?RkdLQnE5enpuUlMzMFpuVWhwVFpjRW5LK2F3Y1IxTmw3alNTOXlXdWFqM1pB?=
	=?utf-8?B?cDluUVJzbW4wdGpIKzNQWEd0dkY2VkROUE9xY0hGSDBvc3puSXVOckFGWVJQ?=
	=?utf-8?B?NHg2bGFpU1RRTExjcmJrREIzd3VMdmZIck52aDJKOVpmRC85U2J4UmxMSFo1?=
	=?utf-8?B?dkFhRi9UT3BIT3lJQW9Ud3dSYkpXMmNUbGwvMlh2NXAzWkFYV0VoZGtPQ3Zq?=
	=?utf-8?B?WnBMSE5ZQmlrK3pTT3JOd2FkSFYvMVY3anlOVUNjaWl3TXhIRGVyRTJuQ3lT?=
	=?utf-8?B?aTRNQlYxand0WFAxQVNRajNjUHlqVk9LSCtUZkZaUkY0aGQwZmRaUGJTYUVa?=
	=?utf-8?B?KzZCcFRoN3ErcEMxY1BEVVI3STNxU1BRT3FLYTROTmRDNTRMemRsWkg3RCtY?=
	=?utf-8?B?a3lHWmhWYTZnZGNYRkY3ZHRUVDZjZFR3amszeWErY0cwdStManJod1NEUnhs?=
	=?utf-8?B?eTRnZXVTTXF6Z1VUMFNzejR1M1hISE5ETzBTamhIb1pwdlgzTFRPMnBab2xC?=
	=?utf-8?B?MHFSMzByWUZ1NEhraHpYazErTVA0QjZYVGxka2NTVWl4Sy9yYzhHSll1TVpB?=
	=?utf-8?B?MldTWjJxdU95enpFOUpraFVTdDFmOWlTclVPcEtGNUpnS1cwWG8wQm5UK2JR?=
	=?utf-8?B?Y2FWbDlGVGpqNVNzS2J4TCs1Q3hiSmNRbURGZFJKMmRRbi9VcG5pdmlaQ1l6?=
	=?utf-8?B?VU5pM3d5TG9QTG0reXNocTM3a0NhdjZEWHN2N2lVaFRraDFGcWRyRWNFQlhr?=
	=?utf-8?B?NmN5b0tkcjVEQmNRc3lkeFJnTGljZGVLVGc0cFYydzByMHYvaDNUalRCY3Zm?=
	=?utf-8?B?cnpESnNFdlBlMTlNUDlwM2FGTW9qQWhaQ2t4alRMeTllYkw2eVNPYTExalNQ?=
	=?utf-8?B?YStFSktMRW0vcEtVMHIvNU05c1JLdlMxeGdLYXg5K05JUkdQMkhyNlh1MlR1?=
	=?utf-8?B?M3RJYzlzK2x2UFh5SnlTekUveW94cmJvUlFNMi9tSFY5UTFFZ3RVV09uR3RC?=
	=?utf-8?B?c3p0bGpvZDFHYnNkUWFpeDhoSmVqeXZjTW5uQVczMUFWcFNVaGZ3M01xZnBh?=
	=?utf-8?B?djd1S1dPQTVZWkd2TjR2dktxaEhOWjg5cGY0OUhSUEwrcXdRNzlOTTJDdGVC?=
	=?utf-8?B?OGxRUT09?=
X-Microsoft-Antispam-Message-Info: pysFdvPRsG4E2Dt/i9PUZ09ndSnLGeSkNqS1VcDDrkF9LXwFwHn8loz8rdZJCFupr6iDHZqFGxhXydQFomzhLg7Kl4PBS3EvYq1MSVY6qqgpAGj0+U73JVfM6uy3fTE4vknHOHIuueqzakvkX5jT2Fi3YIQtpm9bfCi+16EJ5GH3MBR3VyskgSUNu6dW1BX/UomAe0xvP7lyXSpcgP4KmurtDgYzLna48/upOPXiqNepo20uFwcC6L89M+VkpQXaFz7C1XJE78e0nZQjmmvICm54JwXgjOWPVtnpiELMvgTcUze3YBecLp2gqvkl0cYz67GIe+q++5kHtVbQ2GkpUZPdbDOa1UQYSRvzbERDe+Q=
X-Microsoft-Exchange-Diagnostics: 1; VI1PR1001MB1342;
	6:J5fzWyimLPkHHESuu17ML5arvtHcSaDkxrM/s3A/WUbqY+mgV/yXwO4qNlsJcxtJFsJzqD/VDefgiDHXJl9ejUv27pciXtfSKVz0bVZN0HMMJBGzRVPvat9Bi4L8KfgWhOVHKqtKgSsFnLWvknHCspvwfdlkDZ3tCgxJh9t/X2j1S1RUxkzXI9Bzhv1lUFkgh796J/B8l2tj3JTXblI4HVNGDZR3lbuqN+70TK3RdB0P6HHewiDpLwV2QMpM9OwzWj5owvtPZ682eiFQlo0haYkrBBPk6o2eQEpoduxZwUSqrtF1tyUl9ANsKEn6Cz1zDcLtwBl2GwqEbtQwY+IZaealOKBWSViIQ5cMiE+ouVBtATbv2PnWFWDo35ASnnt4VWL0R056JHIJt66jQ8TrTCtUKPpmMXE2Fpnk5a+Knsx/gqGLFUS9pKjoRso++BhE8dLarxi3uTiHVakAIbC0vw==;
	5:p4Fn76O/8kPCT5SryVqX8cxGRp+wbT4QnLGqmF9ziMQHDa4YZYNx3/fwPuo/q7/LWUhuEsy0MHCwnYggptsU3NfQ42InTDh6ZVJsmMkO5KhIKapztjoZtnKRXPBVBdiDWUWoT5xScil/EPHXBwHlLqYM7Ha6TgirckOrlEca/Nk=;
	7:4dNB00BKtAI50JHUN+Pujn2VXPKUaR3dYkIYwrfbevIssH3SvWj3o89m/SBexOsXdZicUz6OePrn94u2WpxTKJlqy6yn8fmdXL2G6lyoe+21bbrDmsBJd8RfNl+R5Yg4T/hcfsXtO85g/RGppEHNiHklEMSYU5oVVXA9jPtAbC3D63rwfvrPjiT7zerWoLQ29Ok0SOc6EU7y+7gZXtXrLCk65VVqYvtZBcBPD43M6QN5ImmJCb0EQQoLpJN+d1Ya
SpamDiagnosticOutput: 1:99
SpamDiagnosticMetadata: NSPM
X-OriginatorOrg: prevas.dk
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 15 Aug 2018 06:55:14.3835 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: ef039b20-6e8d-4d01-e824-08d6027c0dc0
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: d350cf71-778d-4780-88f5-071a4cb1ed61
X-MS-Exchange-Transport-CrossTenantHeadersStamped: VI1PR1001MB1342
Cc: Juan M Cruz Alcaraz <juan.m.cruz.alcaraz@linux.intel.com>
Subject: Re: [RFC PATCH] package.bbclass: improve -dbg and -src package ordering
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
X-List-Received-Date: Wed, 15 Aug 2018 11:30:26 -0000
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit

On 2018-07-17 10:13, Rasmus Villemoes wrote:
> ping...
> 

ping2

> On 2018-07-11 13:38, Rasmus Villemoes wrote:
>> nativesdk-gpgme fails package_qa when setting PACKAGE_DEBUG_SPLIT_STYLE
>> = "debug-with-srcpkg".
>>
>> ERROR: nativesdk-gpgme-1.10.0-r0 do_package_qa: QA Issue: non debug package contains .debug directory: nativesdk-python3-gpg path /work/x86_64-nativesdk-oesdk-linux/nativesdk-gpgme/1.10.0-r0/packages-split/nativesdk-python3-gpg/usr/local/oecore-x86_64/sysroots/x86_64-oesdk-linux/usr/lib/python3.5/site-packages/gpg/.debug/_gpgme.cpython-35m-x86_64-linux-gnu.so [debug-files]
>>
>> This turns out to be because the automatic moving of the -dbg package to
>> the beginning of the package list is disabled in that case, so the
>> python3-gpg packages that the recipe prepends to PACKAGES ends up before
>> the -dbg package.
>>
>> It's not clear why the "and not split_source_package" was added when
>> debug-with-srcpkg was introduced. Presumably the intention was to
>> prevent the -dbg package to end up before the -src package, which we of
>> course need to. But at the same time, we still need -dbg packages to end
>> up before all other packages.
>>
>> Using list.insert(0, ...) also means that if there happens to more than
>> one -dbg package, their relative ordering gets inverted in the new list.
>>
>> This tries to fix these issues by sorting the packages by (priority,
>> original position), where priority is 10 for -src, 30 for -dbg and 50
>> for everything else. That guarantees that packages of the same "type"
>> preserve their relative ordering, while also ensuring that -dbg always
>> preceed other packages. This scheme is also quite extensible, and,
>> should the need arise, one could even expose the priorities as a knob
>> the recipe author could use to ensure specific orderings of packages
>> instead of the somewhat fragile and coarse-grained method of "prepend or
>> append, and ensure you do that in a proper order".
>>
>> Probably the autodebug condition needs to stay, but I think the
>> split_source_package condition in the preceding elif should be removed,
>> so that that logic applies to all packages called -src, not just the one
>> we might have created a few lines above.
>>
>> Signed-off-by: Rasmus Villemoes <rasmus.villemoes@prevas.dk>
>> ---
>>  meta/classes/package.bbclass | 15 ++++++++-------
>>  1 file changed, 8 insertions(+), 7 deletions(-)
>>
>> diff --git a/meta/classes/package.bbclass b/meta/classes/package.bbclass
>> index 8276046369..72b9c66c3b 100644
>> --- a/meta/classes/package.bbclass
>> +++ b/meta/classes/package.bbclass
>> @@ -1151,21 +1151,22 @@ python populate_packages () {
>>  
>>      # Sanity check PACKAGES for duplicates
>>      # Sanity should be moved to sanity.bbclass once we have the infrastructure
>> -    package_list = []
>> +    package_dict = {}
>>  
>> -    for pkg in packages.split():
>> -        if pkg in package_list:
>> +    for i, pkg in enumerate(packages.split()):
>> +        if pkg in package_dict:
>>              msg = "%s is listed in PACKAGES multiple times, this leads to packaging errors." % pkg
>>              package_qa_handle_error("packages-list", msg, d)
>>          # If debug-with-srcpkg mode is enabled then the src package will have
>>          # priority over dbg package when assigning the files.
>>          # This allows src package to include source files and remove them from dbg.
>>          elif split_source_package and pkg.endswith("-src"):
>> -            package_list.insert(0, pkg)
>> -        elif autodebug and pkg.endswith("-dbg") and not split_source_package:
>> -            package_list.insert(0, pkg)
>> +            package_dict[pkg] = (10, i)
>> +        elif autodebug and pkg.endswith("-dbg"):
>> +            package_dict[pkg] = (30, i)
>>          else:
>> -            package_list.append(pkg)
>> +            package_dict[pkg] = (50, i)
>> +    package_list = sorted(package_dict.keys(), key=package_dict.get)
>>      d.setVar('PACKAGES', ' '.join(package_list))
>>      pkgdest = d.getVar('PKGDEST')
>>  
>>
> 


-- 
Rasmus Villemoes
Software Developer
Prevas A/S
Hedeager 3
DK-8200 Aarhus N
+45 51210274
rasmus.villemoes@prevas.dk
www.prevas.dk

