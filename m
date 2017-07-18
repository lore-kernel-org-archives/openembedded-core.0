Return-Path: <mkelly@xevo.com>
X-Greylist: delayed 8821 seconds by postgrey-1.34 at layers.openembedded.org;
	Tue, 18 Jul 2017 18:48:17 UTC
Received: from NAM01-BN3-obe.outbound.protection.outlook.com
	(mail-bn3nam01on0073.outbound.protection.outlook.com [104.47.33.73])
	by mail.openembedded.org (Postfix) with ESMTP id 897977808C
	for <openembedded-core@lists.openembedded.org>;
	Tue, 18 Jul 2017 18:48:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=uievolution.onmicrosoft.com; s=selector1-xevo-com;
	h=From:Date:Subject:Message-ID:Content-Type:MIME-Version;
	bh=dRgr0xDFUmH3tUSQyVHFd3w5che+BsAijA7nU5dWJ20=;
	b=fEF+m9u+dtEj7xBNmd2etvaeMyks7LgJBytMLip8aASS1T4TLBaKSecyXT2ofK58Rpfuz0B+3BJv2+/rhAt2VeUwyyiMJ9OO5pmN31D5r/xRHRdzTQRE7xIr0dpiIvKJNTyjV6pEpY/Y13D6M9P/lEYOeXnZ8rvVJTMeDmBjn9A=
Authentication-Results: lists.openembedded.org; dkim=none (message not signed)
	header.d=none; lists.openembedded.org;
	dmarc=none action=none header.from=xevo.com;
Received: from [10.0.1.79] (65.122.179.226) by
	CY4PR0101MB2935.prod.exchangelabs.com (10.171.223.140) with Microsoft
	SMTP Server (version=TLS1_2,
	cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id
	15.1.1261.13; Tue, 18 Jul 2017 18:48:17 +0000
To: Khem Raj <raj.khem@gmail.com>
References: <20170718002129.8704-1-mkelly@xevo.com>
	<CAMKF1spT18TdH6FbS+L0xLrRRxofpUwhLtNQtA3PKxFTRoNCUg@mail.gmail.com>
	<1e22fdac-d41a-ff88-a208-e321b9820e9b@xevo.com>
	<CAMKF1spqOVtRF=LYmnL=NAf6BLB0+HVXO_vdLAZiTNjnDyekDw@mail.gmail.com>
From: Martin Kelly <mkelly@xevo.com>
Message-ID: <8b5155a1-5b89-e1c8-6f3c-dc43181b093c@xevo.com>
Date: Tue, 18 Jul 2017 11:48:09 -0700
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:45.0) Gecko/20100101
	Thunderbird/45.8.0
MIME-Version: 1.0
In-Reply-To: <CAMKF1spqOVtRF=LYmnL=NAf6BLB0+HVXO_vdLAZiTNjnDyekDw@mail.gmail.com>
X-Originating-IP: [65.122.179.226]
X-ClientProxiedBy: BN6PR21CA0023.namprd21.prod.outlook.com (10.173.197.33) To
	CY4PR0101MB2935.prod.exchangelabs.com (10.171.223.140)
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 01c5cc62-02ed-45b6-cc45-08d4ce0d8e00
X-Microsoft-Antispam: UriScan:; BCL:0; PCL:0;
	RULEID:(300000500095)(300135000095)(300000501095)(300135300095)(22001)(300000502095)(300135100095)(300000503095)(300135400095)(201703131423075)(201703031133081)(300000504095)(300135200095)(300000505095)(300135600095)(300000506095)(300135500095);
	SRVR:CY4PR0101MB2935; 
X-Microsoft-Exchange-Diagnostics: 1; CY4PR0101MB2935;
	3:N6pjeCXHBd2gmQzYsOkiQkSrRbNjAfirW+6C/omga+0bf3NcKO41X1Arqe0nGM1fljkwQCUBxQ7a7yGun3Aqp+vRZkXdpEcHhapNoebyCku9LfArSSBpx6uPuKx6XWs2OIWQwCUbpmumN6jgWyCd70RKhZTAiLMzCmCZ+5p1gLBjptSdK42EN8nr7tsduZWn7Mxra2bqLjBsXXqmcisEAXx8P9SlArzOT1N8ts7BHOnbrnWHCCiQgvc7Viyb/TZLLBEZbOSQOeCqgEQh08ysD3JvyJloN0ENd20B0PEWw5PMpdZcq/Kz24kglk9pqjykJs0y1vy8dMy1oW+HOBgLtLvtbFQwGA+b5T9JwfpRDlPccNnrzEfozL0Edw4IdZ02Em3rLGniU9qIZkXpLEqUEWCtMGz/J5LOKdn5IYQ1ck1aCB/nQcxBMUCTfk/zrjl2nldMugoU8CFPilwfjsyn8VyTnNozqPooB/VT8/7bJtsVxTOqc2J/yJQMNijascWTwfvcfVjGEw4NbzXMC67VO9OpdGK4OdlxwedizjbCkD0BBGDsoy4H4/F8zmqlbzDy2MtpEl/EByBugm0zgFs/tRo0+gVIQXHUt0w7l/VoqDT0v0UwvZWWd/7vcSfDhsq3R1n3RU2Zi2YBBIA5bTchyxdzemRIBSAJ9i/OkSgOoNpIlck90tPqGhrwF2yv3S4oyTdH/33MtUyExmSs7oXSue7V/gD0jQYawz331EbDTRg=
X-MS-TrafficTypeDiagnostic: CY4PR0101MB2935:
X-Microsoft-Exchange-Diagnostics: 1; CY4PR0101MB2935;
	25:WXpqkMEssPkJp74HrkiXdWNa8Crs9DSoQ/h0wx4EpZ5uoPG4RYgOshWbmMboHxHlHMXES9fG5oaRdPLDyuxoLc31+WQNMAPbxQfeSuchXX/5rR+eHJ9qghnXluiaGcWTcKDlBakrOBp6NTkCQ2F2eTdnyfLaLUCEK2yMJDekpgz8rYsTQzCIqwAXqqrbW/avUYbRNfL6bISwYhtpF3wUpxu2jwavfh5yXgOBkJ1CHOdlGWkl5rr5IJnEh/0mu7NRQHcAJ/D4Kt8jBt7vtj+BLOiPDg9W/4e7adjNYCr655mLuswlOsVviJ8CxjRIY/nLKCQsa1a46NW566Mpu5l2HLrOmO2P9YG1IHKlsVgMCF0qP9hWHA1OwxEJEwypZGztznZVnEhLHyBU5J6BXmGdf37W2VQW7BjFcp8JTcJpgsysWRnbWmIuc/kbIr5hkkoWY4Qrcp95AIfthrj8wtypCrGxJlWrJb+6Ihb7JDbxqpizUkRrSmAfNHGOFJrSelWfGdff9/OtrqZZenOYLWwbSSTvS2ycBy+cdRapktMEwv/Ulq/1PBlJpHqvZlPBUsq2XTsaX+GAIMQKTvl24sVdURmSIolz6Pr3SaJYX5g1PmsM2rLLdRMxEVdeq/qJhhK13NyX9rQJC46gYDSSxWP6TJGkoNW+3yhB4+eb771bvQi9ofo933wcxcX97tJvd9R+oQfoMwWX9W1mbnmridcHg8RxkDNPq76JEFFTcCT3znocAFAKcAGBBD454ZurIbGnGS3vtjWMOU/Q6SXKT20KlRHB5W7LfNOGWMxgL3VS+aA9W/hbz07pb7tyG9DLjDBqRosOoz9DkmmNyoOOPW+KoMWBS4h+02mTilVh2tBLYPbnmQQg7ZeHf58lNpRfyHDC3kYKsalI/Y2PhERHIcGGGv7HIfe+EVwClA6Hv20qrOk=
X-Microsoft-Exchange-Diagnostics: 1; CY4PR0101MB2935;
	31:MHuvEtpBDrWJ5Y/llWFOfBcG4gquFFPS3q7jP0Uw1q4ywlHF7ReImKqvIskox1WpdqhYRVMDAoqLwGtCyzhuIssdWgZydsARDyD1Lcubg9JRGG8f8HWzB7b+nViGg+owOW8lWPA5AIEGe5+4Hwh1UtWTOOHJRs4blgJHAsQIvB+JramE2euv1HjfTlqQLjD11b4mxTylsJB7/4org9Uh273fQCgvOLxlB+Qr2Cgp4HqYWqZAFqEGQLkAf2wqzESwsHBRq//4seZOhyuU0rpN4Su0I0vD8etlzLp3ZgLzMp/AnvW8OPWJqwFeaD+rlFYNBfYqJABTfjj2ZZ16cTcoZtawfkmstSxA/FzH4sqAG3vO9AcusvJ0BXVFaI6ejjY+1jJzbrl2EnPME5R520pZCGAyAeb/RwvFmw+OfGU/X1R9QGEgQiPD9fgFO79U9faetZGohlTa589gTONQpFUMqjlA/X5AnLjZzIAV8rjTyPzXdpTgug0SqdJu2mb5iX28jn6zME2G151PGKOOK9OdtWBmNfY6pdFlHvMQxHcj7st9Sam5KWt6KrBNXrXPYhjpEPkjVh9FAKtc1wa/lHeElfLAP3qh3IALa3BjftxttvkhxvPACf3c0aK0F7yVtCQ470LogO2Ln8GJ3xDn1hggxc/aG1nxKA496oQISRn3dkdhzUgdrzamb5tsi42lbz9K
X-Microsoft-Exchange-Diagnostics: 1; CY4PR0101MB2935;
	20:jXpPqOnwcIscrFzhn4hFJoc19VVwQdRTGct6J4G/zu5OGW9/WexE8g10GF1IyVqs4XXvVILCZaM/uqvo/25FuZLdcDB4vS7zYTKWZR6HNyIo4+Ip3Y94fQ03qoJ3Xmn9H/R/AAFnQg3jmBwiEgB1LaOdA4nXZ05pL5PTabpi1Sf6DQJxgOdVc2BOmw3EXnCQw1MvB7myVfUN+ONZGzkxicaUqnV7mp1isqq9O3rFUncVaE26/1W28A4HoYn8mpDRVVs2b9zKJvKeOJIl68Nn5KAgjEzdnS50sIrejZq71wxuE2toX7nGE11tbvFarKwK6O8mY6OOUX7XL++T8fUn1ZQOYhlguSum1W+efpp1O8TViyJAYfJXrCq75w/7uiBHoByLB7A6G0DMJyTi0H9HSp0zhGLNpBroxaBWw/CAzzM=
X-Exchange-Antispam-Report-Test: UriScan:(236129657087228)(264703809997249)(148574349560750); 
X-Microsoft-Antispam-PRVS: <CY4PR0101MB2935EA5C3298A6E8911E1474ABA10@CY4PR0101MB2935.prod.exchangelabs.com>
X-Exchange-Antispam-Report-CFA-Test: BCL:0; PCL:0;
	RULEID:(100000700101)(100105000095)(100000701101)(100105300095)(100000702101)(100105100095)(6040450)(2401047)(5005006)(8121501046)(2017060910075)(10201501046)(93006095)(93001095)(3002001)(100000703101)(100105400095)(6041248)(20161123560025)(20161123555025)(20161123562025)(20161123564025)(20161123558100)(201703131423075)(201702281528075)(201703061421075)(201703061406153)(6072148)(100000704101)(100105200095)(100000705101)(100105500095);
	SRVR:CY4PR0101MB2935; BCL:0; PCL:0;
	RULEID:(100000800101)(100110000095)(100000801101)(100110300095)(100000802101)(100110100095)(100000803101)(100110400095)(100000804101)(100110200095)(100000805101)(100110500095);
	SRVR:CY4PR0101MB2935; 
X-Microsoft-Exchange-Diagnostics: =?utf-8?B?MTtDWTRQUjAxMDFNQjI5MzU7NDpxcUl5VGNwUnRrNllaVHRYM0JhK3hSb1gx?=
	=?utf-8?B?Z2xPSkRJRmJrbzhRcDBoTXc0R2pIUGVFNDZLOWFXbkZrV0o0QS9pdFlLZEdv?=
	=?utf-8?B?Y2dRbkUraGVCbG95bTlyMHBFTXMzSndRRzdncXkxVDdMTytHc3EyWnpYY2hK?=
	=?utf-8?B?aUZtZ09ZWGhRY2VsNjY4Y0wzU3Y2VEJlMEFqZFRRdTUxVUFVM0tFa3E3UlRi?=
	=?utf-8?B?bXUybjVtRWt2clBXSjV2NUZXSEVMUS9GTkdzMU9CVVNIQlZRaDU3WHMzSTZH?=
	=?utf-8?B?Q0RudEg3ZHk2dmMzbEtqczBVVXFJSVR6M2YxajhEQnlJN2lNeWMyMjRjVmx3?=
	=?utf-8?B?NUY5QWdwdWhFOEJwYVJHeUlEdi9VQ3N1SEp5YnN4b3ZmUEJYWHlQZWYzcW5k?=
	=?utf-8?B?RkhuTlpDRXYzK2VyUEZFbFY2TkNlSVpXWlNCN2hiUlhjYnJrRTZDUk44QjJi?=
	=?utf-8?B?UXNTK090dzNlUkVHNkZIV0hHQ0gzTVF5UEVJN1AyZW4rbHRxTVoxR0dacUJD?=
	=?utf-8?B?Sm1sUFl4eWt3bGkyb2VablFqZVkrUHc2LzRsWm5EVk5ibzZGRmRKcnBQcFVH?=
	=?utf-8?B?aWhqVjFEdW0rVStRY09EbW4vRmdsMXRGV3hxak9BTWxXVTdNZkpsYXcvZW5I?=
	=?utf-8?B?ZDBhYnc2eGJPemhyaU5WNUg3WjVBVDczUFc3MDBzRmpPcWtTbXRFK0M3bDF3?=
	=?utf-8?B?Wk9DK3VnWmNMbVlFWG5SRjA1Qm8vYnZxeXVTb2puZG9oRjVLallyYUl3VFkv?=
	=?utf-8?B?ZWNLcFp6TExTUGY5eXBjSkh3V3J0UHNLSkVLSnhsQUpTQ0dvWjhwTlFjVEg0?=
	=?utf-8?B?VXJkMGp5U3ZuRENhYkFVdUQ3cnFNcmt4UlBiV3lhNkpzNmtXV3B0TjFYS2hC?=
	=?utf-8?B?U2VFNGoxQ283Mll5eUpBcUNGZW03UXRwd3kyd05RbnNxY1Z5VTMvWEtZY3By?=
	=?utf-8?B?clA3bTQyUExKdUpHd0V2VG9OSVdsR1VYRCtaajljaTJseldKb1F0cTh3Tm5P?=
	=?utf-8?B?SmZZQmhkeUQ2ZzQ0TnRZY0tuRG5ZVXJuaUhwQ1dMM0hCRnZJN3V0dlFxc05J?=
	=?utf-8?B?ZEtKZVZoR0FZNXZaRkFhK2N1ZzBhUXhuWDNQUzg3YUh2bGhLNWFwVWFlQ3NM?=
	=?utf-8?B?WWJKcVRmOHRYQ3NnZ2dqME1yMlF0VnVDTXBIdzlFSTRkVFRNWWxxZUNDaERU?=
	=?utf-8?B?cGVWbDdKbVBoUUlPTXlhemEwSjkyZFVibjhKZk5WY0NOeUVGR0FZbzQxMGZl?=
	=?utf-8?B?b3UxMzZybi9lemRNQUJURWowQ0pDNTNoNENrVEVsZUVLOEdYWm5lb0tHc2pt?=
	=?utf-8?B?Wmo5dXgwcFhxYzZBZXRUU1ZMMjlCdHZBVXg2Q2pRSUR0dTF1c2pXYUJTaHhP?=
	=?utf-8?B?MU5WY2ZqUWdXSUFmTy9ETGZqOEFBb2JaUFRGbGVxMW9SbXNEdTRXQkhvbkJC?=
	=?utf-8?B?bzl0N1pIYmlOendNZnQ3ZnhjOTVyRy9aZW4rSnJ1dUUzVEEwTGRlZ0JmZjd4?=
	=?utf-8?B?NWh0czNYMzRJVEVNYkd5ZHptMTk4VUVWeSsxZUZES1hqeHkxMlVDUWlIQ1Z0?=
	=?utf-8?B?NjNub2ExZkFGVm9CaDhxODk4S3pyVnpIb242UW1IbDZTcDluaFNCZGVneEwz?=
	=?utf-8?B?T01LckxaQnllNm0yZXZNSVhIMlpjQTNEczJiZjJMUU12eFV3OXFob3NFLzkw?=
	=?utf-8?Q?y5duUAteJFSB/KNxsZAYGMTngP6PZdLA3d+MvqIp?=
X-Forefront-PRVS: 037291602B
X-Forefront-Antispam-Report: SFV:NSPM;
	SFS:(10009020)(4630300001)(7370300001)(6049001)(6009001)(39830400002)(39410400002)(39400400002)(39450400003)(24454002)(377454003)(2906002)(2950100002)(6916009)(6666003)(31686004)(6116002)(3846002)(5660300001)(23676002)(65826007)(575784001)(4001350100001)(86362001)(31696002)(76176999)(966005)(54356999)(50986999)(93886004)(229853002)(77096006)(6486002)(42186005)(90366009)(53546010)(6306002)(4326008)(1720100001)(189998001)(25786009)(478600001)(33646002)(36756003)(305945005)(7736002)(7350300001)(230700001)(6246003)(110136004)(53936002)(8676002)(81166006)(64126003)(66066001)(47776003)(38730400002)(50466002)(83506001)(65806001);
	DIR:OUT; SFP:1101; SCL:1; SRVR:CY4PR0101MB2935; H:[10.0.1.79];
	FPR:; SPF:None; MLV:sfv; LANG:en; 
X-Microsoft-Exchange-Diagnostics: =?utf-8?B?MTtDWTRQUjAxMDFNQjI5MzU7MjM6SUNMbzdGTEoyR3c1ZFNINHVVQStSUXFD?=
	=?utf-8?B?ZHo3TmNCaFBvUmxQdVUwL0FzRlRPcWZwZkNyUFRId0dpaUdrVVk1djhZZnVo?=
	=?utf-8?B?SlRPTjVKMFNEVytHZDljcGNVR2svQVp5Q1BMSGZVcW1BLzBhemRyZlM0QXVZ?=
	=?utf-8?B?Z01BcVpWWlk2MkVhanRUODNtNEEvM25vdVZDTnp1NzJ4b0V1cm5WUnJOZ042?=
	=?utf-8?B?emJtSjQzcU1hSHU4UjFLbWtFWksvTy9UVStZa1ppMlJjbnhWcXhvZlVlVkta?=
	=?utf-8?B?UlUrOEp2aU8xQzFmNlY4L0dCbVkvSDVickdJUkIzZm12ZlVkWHV1c3VGb2JL?=
	=?utf-8?B?Q3Z6RXErME1rWkZpNzk5UW1WR0EyY1dEbU9ySy9GeWhCc2hzZkZiREx5MHIw?=
	=?utf-8?B?S09kdHJXUWdPSzB4TjRjaWpKbjNVNHpFMzJMN0p6MytEN0xEY3FGY2djbXVQ?=
	=?utf-8?B?WXF1b2M2SzlDcmFHQ1U2cHVhODV3NVVHa1pSSGp1WElsQlZFT05jajkvcEQx?=
	=?utf-8?B?Y2lSY29uUmFuRUtwemFsWFJKUXNlQ2QwdXJwcVkzY1VaSGlQSXlPOUJucW5n?=
	=?utf-8?B?bmJTQnRsUHBrZVhPdnVzaG1xNTM5YXR2UmQ3b3B1NEdKSEZCSUM0ZFlJVTRZ?=
	=?utf-8?B?WUxIS1VRNGpocFEyVUVJa20yN0s3Z2tjb2JKWXRtR3JPSnRidzNVRThlMlZk?=
	=?utf-8?B?di82bHdEVWUxTFI3T242KzhkeWkyUVA2VmZoTXNteHJ1U2JldjU4NEE4NGFx?=
	=?utf-8?B?Rzl0SDRrbTVCQVdYQ2VQRGYwUGFMRnhXSFlhdW8yR1VuS3ZHVW5GOTBROUdZ?=
	=?utf-8?B?VStuYytWai9vU0NvU2xtUWZXQ1RUbndYUk1PaU1BbDVTQndxelp0SFl1aTRu?=
	=?utf-8?B?VzZaVUZJQXFjOTN1RFBSMzFieS9SK21lemlXUmQvSmhGeGdNUXZtRktNOEJN?=
	=?utf-8?B?SWduak56Y0I1V29vaXA1NUxSTk5JNlU5Q1RFWEdyZmY0cmFLeXdYZUxHQnBm?=
	=?utf-8?B?SndLUC9keUkyaFloaVJBUHFCUkdnblU3YmxBQmEyVUVYR0ZLUGR6eG9KK2I1?=
	=?utf-8?B?QnpqTlRxZW5VdE83RE1QdWszc1Btcko2UEJ4R3FhU2NNRlhIMXlVZ3dvWE5R?=
	=?utf-8?B?NEtzYTJEM0h6aFVPOXBNQXNLSkxaRXJsaU5JVjRtdkxaeEhBcWNBUnRaMDRB?=
	=?utf-8?B?TDlFYmdFanlsWDBTNVRocldIM3ZOR1I0RllRNERVNWxBVXVVamtHNzlyY0ZS?=
	=?utf-8?B?M05CbUc2Z0RrY3ZXN25sZnA3ZXM0c2NQU0F1SkFpK0U5bWdTNDVmZmhSZnpk?=
	=?utf-8?B?ZFRjZkxtRUdDcGJvNEF1aWJGQzZ6azBqUWRWalJDSUNrTVlQTHJuL1o5bTlk?=
	=?utf-8?B?azdTVmpVdnUxRytDNGk2NlVJNFlWWWNmaCtlekpzNVdIdDkyTW9ydVlCay9w?=
	=?utf-8?B?SlFxSldPR3VKOVc4N2V6VHBmTi91YUE0ekxYUm5tRjZBOXl5RFowaHMxaWlv?=
	=?utf-8?B?akZSWkpYZGw3ZHFkcW9KZ25yejA5NGxwVFRkQTZlYmY4Mjh1UWFvczJkTHMx?=
	=?utf-8?B?SENhRGtjSXBzQnVVNjI2YUN3RU1hNHc1RG82Mk95MklWUnNNL2RuUXlKbVVR?=
	=?utf-8?B?YVdjd0txT3pPbk5RT29WN1BEVStjSXQyWjg1bGcvd3BpNFdqM0w2Nm1GVDg3?=
	=?utf-8?B?YStBbDlCWGtqYThrWmVYcDkrWW9zaWYxUHFRZWJ0YTlKUTgvaTdqYmtoU1JW?=
	=?utf-8?B?MnZHNFpJRDA4OEQwb2t5MTN5U1h1VWdwQ3MwMXlPUlB4MEk0dnB1VnpHRllm?=
	=?utf-8?B?UEM5ZGUyNjh5L1RBQnBrS3ZtWFVGTTVrSVV2Ukl6R0hCK3A4bHlxUkIyN0RQ?=
	=?utf-8?B?NkVqeklBWk9VNWcrclBhYzRNbThpK1lYQ2p5dktHVSt2Z0wyOWw5bnByem42?=
	=?utf-8?Q?tKyKMMR5IArGeVcvaYMGJM8v6nkxx5kQ=3D?=
X-Microsoft-Exchange-Diagnostics: =?utf-8?B?MTtDWTRQUjAxMDFNQjI5MzU7NjpWNmdhTUVTSmVWUzdGa01RQ2NFaTlKT3VO?=
	=?utf-8?B?KzRTeEs0dHZrWUVuS1ZlQnErUTJzbEZGWXZoMUtXVmZnakxPamI5Y0tLNkda?=
	=?utf-8?B?ZGY5amNMUlZKTFlISTFGdzM4Z3Y1ZE9rNGN1dDdDeld6Q00xTGMwZE5FNnc1?=
	=?utf-8?B?QkswZ0dXeFJmN1AwZEdlRnFxVVAyaFRzNlZmeFo5aUVxRDNvVS9sTGZEWDVw?=
	=?utf-8?B?dlowemc5eFJnMEFpRjVZYUdOUnBEZ00xeWhtL1pmZFQwSEl2SHBhVC9UQS81?=
	=?utf-8?B?TlY1aXl2RDhraEZyMk5yTWpYbzZxUnVMdDQwWWg3UTFOWG1va1F5eDMzcEZ3?=
	=?utf-8?B?K1JLQWs1TmgvM2xZUTBVb2NUaEh1RkltY25lTVZmNkpYLzhTbG1CU2tRektY?=
	=?utf-8?B?YWtyTUtrRzJJZk84VmcvanBibWZ5NjduZDY1M0dJV1RVVzYxNDRMaXpBcy9Y?=
	=?utf-8?B?MU5uMkFtSTFxZVMzQ3dIRk5IMHdFUDhSaHE4b0I5YngrLzJRNWxiczlrdCtL?=
	=?utf-8?B?dVFjSTEzUkhJSXBoU2JHb09rMU94emg0NWxPY293cERuQnpEUVZySTJUcmtu?=
	=?utf-8?B?bmRLdjNIanZWN09sMm9BZWZHbGF3UTVaTENtMkZiUStGclNYTDZOcDdRa2Y1?=
	=?utf-8?B?aDI4ODBWU25SaDBqcWZrMm1YaUtpaXhubExqM2Y0MC95d0dwdFNnRTZRZjJ5?=
	=?utf-8?B?OVJzQXplUWt4Y3RNNWtZRTNjUE9ralFKdnNaSGJudTBydTVwNHNuOFQxY216?=
	=?utf-8?B?L1lWdWhXOVJWQ3p5RFBoeCtZd0U4VU1rSlQ1enczQXdjbDB1S0wyWG5CZWNF?=
	=?utf-8?B?QUYySUU2MmhlM3NrUHBjazJnOGNvdm1tRW00M25VL21jc1BXQWZuaXRoOTYz?=
	=?utf-8?B?MXkrRG9ocG9reS93VXkwREpvQU9TK0xLdCtoNzVPN1pNaW9VYXJUWFREOGNP?=
	=?utf-8?B?UWp0TGd1TzJXR2RpWGtIQ0NjR2FHUjByWUlhcjdpdUZsUy9BTlVsN0U3ZGw0?=
	=?utf-8?B?aFZudUNFaUtycjlhMzh2L0cxNSsvSWJzYVRmSTR4dHdVVDU1RkN1Wll0cFRO?=
	=?utf-8?B?WHV1QmNrTTFwaEdxUVZOcmQrRkYwUVIxcXNxd1FmYjFRUnQrOVFrdzRTWWEx?=
	=?utf-8?B?T0tRb1FQQ2xwK1N0cXNFVEw4L0FuSU4ySnJHK0REUFlBeDhlUEtzTDJiNXBm?=
	=?utf-8?B?ZnRaYlo0eEF3b1JOTmgxWlQ1M1haTVpLd3F3b3RzazlKK214OEoxeXFXdkRV?=
	=?utf-8?B?SDZuTWpsYkRFazNDanAreDluMTdQSHFvYWNKWGhmajJXeTJNL08vdTVnVFVT?=
	=?utf-8?Q?gH/xjZ++2aTFE8SsB9QOwbe7I4AJuudO4=3D?=
X-Microsoft-Exchange-Diagnostics: 1; CY4PR0101MB2935;
	5:6EvDhRkRyd+VZVQkeeSP+R3k6f5ty8JQaf7q0DTGVDW/AtrEuit2k/yhmPn9no0+fuA2E15WGZ6BKAeY9KdT29ZmZ2QuDvr4WcuPlnA2rQlvf2rDNYPKqiD1Jug3DRyWeDAklKAli8qK0Lj0sQLlfYhOTAlkMBmEklIq6Spm77nXqpAQ4Gac9Nk9TfcFwgzT6eJAfBq/g6kYF4GwIDmFDlKF9pCjeqq8RYXg/SCJ9oUSF00Cw4ggiNJ6Uvhmn9JcSi+jjHQfvhHLVHESR+yNaaGf3m2mw0Md1bJTvAY9xJtOiHpAv+Hxbn7USYZ5s2iLqPvhemHrafVzhEj+rSJjhy8CaZO+1CIpcZPPR4LJYqxZaV9JraWaW4LpRGsFQqYDWL76L+ApMR5BfPp103FLZ+SrwY0DUpUF6WykycUdf0h88OvxUQ6hm7o2Ckl1tS7vkh5i5UFA+zd3jJ/aHhZNyz3WJWF+oP4WxvHBPA6dOHiWyDD4KH/OsVtIi2Or/uaQ;
	24:pMtKab3V5RhTTZvyaG4rRMFfTRmoCpYY8KHM2AxUUJRcBKdZkHVm+Cis92pC9HY4hAoQ3OyWu+0M+T7WlelYbsISxer5wo5wfenRMc/VRd8=
SpamDiagnosticOutput: 1:99
SpamDiagnosticMetadata: NSPM
X-Microsoft-Exchange-Diagnostics: 1; CY4PR0101MB2935;
	7:DyZcllmbFhxX/ltJQ++Cn7Tg1mQO+g9vBilBF7mSnB4QbVDXQEYkJvTnLRbkuzKXrGt5L/5N1lIA9J3MRo7TEROknD+JYNGUoiXIBhu8qu4/6sDYsAzMD6329NG2my35ZjEVaOFjQ9ZaqbGz9q0By4LgIfin6kBr02nnuly3lA8rRSUC4A3045vI6jOcqF1VE8iVXeApvqVeknfBLCTkh6RVTUFr5yHFquFxZqs9Zg4rN4o8rECVTbe81b5q1l1M9+9Uquzjx2nQOhUOYp7y6HTdV58BDMcsxo/1PXGQFZFC+Gloe2ZdFqroooyAk0gUZexMNQVRMONj9hdMOs3NcQZlU3IOopb+mnI35cfxXtIRyeoUfVZzvkphgruh61feC7KipnMNr+vGWbfEolKEUzPM6or2PAOR2YlKUGSsJ5aV8DC5uIq7cwXpcnYQmSTdBP3nyo5aiPnDEseZ/hwObjB4MfbdkehuSocQoRFzjz+599J0Wmurq8V/EGObz9Y3oNAcI9aofS+N7saEwNKGjSUIZUofyvoHND0kk/kYvrKXe7NoUXsiZMahr9uaEkmxDoH3LRoB18rTnSK3Q8INxHYBp16wkqma41aU92Ms61L7s3Wy2Fo139Udh9ZHrhIr6qyzr88vPhXDUoELWBzb6sU9DgZOiJiWKYDTGbnoVqRoB+0T8ggVCoQ80yJGnuRwuigDEtdYVjJH3ZQf7JAqQQmGEmg3t5sVJ6g1GXX7WMahm6Fqn633J7xeLIF8gOslNiA/cOMBWooQjmzg7caV18xxgbw15tB/ptQlLUM17WE=
X-OriginatorOrg: xevo.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 18 Jul 2017 18:48:17.3552 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CY4PR0101MB2935
Cc: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH] gstreamer1.0-python: add new recipe
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
X-List-Received-Date: Tue, 18 Jul 2017 18:48:18 -0000
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 7bit

On 07/18/2017 11:37 AM, Khem Raj wrote:
> On Tue, Jul 18, 2017 at 12:21 PM, Martin Kelly <mkelly@xevo.com> wrote:
>> On 07/17/2017 07:47 PM, Khem Raj wrote:
>>>
>>> On Mon, Jul 17, 2017 at 8:21 PM, Martin Kelly <mkelly@xevo.com> wrote:
>>>>
>>>> Previously, we had a gst-python recipe, but it supported only GStreamer
>>>> 0.1. After GStreamer switched the Python bindings to use GObject
>>>> introspection, we were no longer able to build the bindings, and they
>>>> were dropped in this patch:
>>>>
>>>> https://patchwork.openembedded.org/patch/93793/
>>>>
>>>> However, at this point, we have a gobject-introspection class, so we can
>>>> use the bindings again, this time with GStreamer 1.0.
>>>>
>>>> Signed-off-by: Martin Kelly <mkelly@xevo.com>
>>>> ---
>>>>  .../gstreamer/gstreamer1.0-python.inc              | 35
>>>> ++++++++++++++++++++++
>>>>  .../gstreamer/gstreamer1.0-python_1.10.4.bb        |  7 +++++
>>>>  2 files changed, 42 insertions(+)
>>>>  create mode 100644
>>>> meta/recipes-multimedia/gstreamer/gstreamer1.0-python.inc
>>>>  create mode 100644
>>>> meta/recipes-multimedia/gstreamer/gstreamer1.0-python_1.10.4.bb
>>>
>>>
>>> I think everything in single file would be better
>>>
>>
>> I'm fine with that, but I was just following the convention that the rest of
>> the gstreamer packaging uses; all the recipes in
>> meta/recipes-multimedia/gstreamer use the same convention. I figured it's
>> cleaner to keep all of it consistent. Would you prefer I diverge anyway?
>>
>
> I dont have strong preference here.
>

OK, I sent a new version with just the license change.

>>>>
>>>> diff --git a/meta/recipes-multimedia/gstreamer/gstreamer1.0-python.inc
>>>> b/meta/recipes-multimedia/gstreamer/gstreamer1.0-python.inc
>>>> new file mode 100644
>>>> index 0000000000..3299b89daa
>>>> --- /dev/null
>>>> +++ b/meta/recipes-multimedia/gstreamer/gstreamer1.0-python.inc
>>>> @@ -0,0 +1,35 @@
>>>> +SUMMARY = "Python bindings for GStreamer 1.0"
>>>> +HOMEPAGE = "http://cgit.freedesktop.org/gstreamer/gst-python/"
>>>> +SECTION = "multimedia"
>>>> +LICENSE = "LGPLv2"
>>>> +
>>>
>>>
>>> this should be 2.1 most probably
>>>
>>
>> Yes you're right, I'll change it.
>>
>>
>>>> +DEPENDS = "gstreamer1.0 python3-pygobject"
>>>> +RDEPENDS_${PN} += "gstreamer1.0 python3-pygobject"
>>>> +
>>>> +PNREAL = "gst-python"
>>>> +
>>>> +SRC_URI =
>>>> "http://gstreamer.freedesktop.org/src/${PNREAL}/${PNREAL}-${PV}.tar.xz"
>>>> +
>>>> +S = "${WORKDIR}/${PNREAL}-${PV}"
>>>> +
>>>> +inherit autotools pkgconfig distutils3-base upstream-version-is-even
>>>> gobject-introspection
>>>> +
>>>> +do_install_append() {
>>>> +    # gstpythonplugin hardcodes the location of the libpython from the
>>>> build
>>>> +    # workspace and then fails at runtime. We can override it using
>>>> +    # --with-libpython-dir=${libdir}, but it still fails because it
>>>> looks for a
>>>> +    # symlinked library ending in .so instead of the actually library
>>>> with
>>>> +    # LIBNAME.so.MAJOR.MINOR. Although we could patch the code to use
>>>> the path
>>>> +    # we want, it will break again if the library version ever changes.
>>>> We need
>>>> +    # to think about the best way of handling this and possibly consult
>>>> +    # upstream.
>>>> +    #
>>>> +    # Note that this particular find line is taken from the Debian
>>>> packaging for
>>>> +    # gst-python1.0.
>>>> +    find "${D}" \
>>>> +        -name '*.pyc' -o \
>>>> +        -name '*.pyo' -o \
>>>> +        -name '*.la' -o \
>>>> +        -name 'libgstpythonplugin*' \
>>>> +        -delete
>>>> +}
>>>> diff --git
>>>> a/meta/recipes-multimedia/gstreamer/gstreamer1.0-python_1.10.4.bb
>>>> b/meta/recipes-multimedia/gstreamer/gstreamer1.0-python_1.10.4.bb
>>>> new file mode 100644
>>>> index 0000000000..1365f7c6dd
>>>> --- /dev/null
>>>> +++ b/meta/recipes-multimedia/gstreamer/gstreamer1.0-python_1.10.4.bb
>>>> @@ -0,0 +1,7 @@
>>>> +require gstreamer1.0-python.inc
>>>> +
>>>> +SRC_URI =
>>>> "http://gstreamer.freedesktop.org/src/${PNREAL}/${PNREAL}-${PV}.tar.xz"
>>>> +SRC_URI[md5sum] = "adcdb74f713e28d0b22a0a1e4f831573"
>>>> +SRC_URI[sha256sum] =
>>>> "59508174b8bc86c05290aa9a7c5d480ac556a6f36306ddbc1d0eacf4f7868212"
>>>> +
>>>> +LIC_FILES_CHKSUM = "file://COPYING;md5=c34deae4e395ca07e725ab0076a5f740"
>>>> --
>>>> 2.11.0
>>>>
>>>> --
>>>> _______________________________________________
>>>> Openembedded-core mailing list
>>>> Openembedded-core@lists.openembedded.org
>>>> http://lists.openembedded.org/mailman/listinfo/openembedded-core

