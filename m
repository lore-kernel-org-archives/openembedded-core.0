Return-Path: <mkelly@xevo.com>
X-Greylist: delayed 77221 seconds by postgrey-1.34 at layers.openembedded.org;
	Wed, 08 Mar 2017 22:15:49 UTC
Received: from NAM02-CY1-obe.outbound.protection.outlook.com
	(mail-cys01nam02on0064.outbound.protection.outlook.com
	[104.47.37.64])
	by mail.openembedded.org (Postfix) with ESMTP id AA433730F9
	for <openembedded-core@lists.openembedded.org>;
	Wed,  8 Mar 2017 22:15:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=uievolution.onmicrosoft.com; s=selector1-xevo-com;
	h=From:Date:Subject:Message-ID:Content-Type:MIME-Version;
	bh=rtbTjXNQDKQ/tflBVGUkPs5phnpJX7sJrv+ueLv9LFA=;
	b=KYv/snB169TJWffV671AHQO7r9d72e226V7OH6ieqJ1md15YhVEkKshVu2edea1+12H4bg5nNA3VJn/5vpuV7DMJQ93MdqbWdfKzcO0i4AiNyQBTlM+Ra/lP2rXiBNa1uVbnoxSQXyR+LP0vwaNYfAFbLnweyV+DIww2HkmSw7U=
Authentication-Results: linuxfoundation.org; dkim=none (message not signed)
	header.d=none;linuxfoundation.org; dmarc=none action=none
	header.from=xevo.com;
Received: from [10.111.61.107] (66.162.141.202) by
	BLUPR01MB1393.prod.exchangelabs.com (10.163.82.27) with Microsoft SMTP
	Server
	(version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_CBC_SHA384_P384) id
	15.1.947.12; Wed, 8 Mar 2017 22:01:10 +0000
To: Khem Raj <raj.khem@gmail.com>
References: <8f9c4dbb-10b7-25b9-1f38-704645a2eab2@xevo.com>
	<20170308214636.GA17756@haswell>
From: Martin Kelly <mkelly@xevo.com>
Message-ID: <c239faec-410b-99ff-9f0e-8b4c350b460a@xevo.com>
Date: Wed, 8 Mar 2017 13:56:12 -0800
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:45.0) Gecko/20100101
	Icedove/45.6.0
MIME-Version: 1.0
In-Reply-To: <20170308214636.GA17756@haswell>
X-Originating-IP: [66.162.141.202]
X-ClientProxiedBy: DM5PR1601CA0002.namprd16.prod.outlook.com (10.174.111.15)
	To BLUPR01MB1393.prod.exchangelabs.com (10.163.82.27)
X-MS-Office365-Filtering-Correlation-Id: 8092df79-832c-4c20-8b00-08d4666ea1f8
X-Microsoft-Antispam: UriScan:;BCL:0;PCL:0;RULEID:(22001);SRVR:BLUPR01MB1393;
X-Microsoft-Exchange-Diagnostics: 1; BLUPR01MB1393;
	3:WZ1hWcqTFNL+K5T4oXc8hS+r4hNYIsAWRMDWKz4diA377896p8Kpy2sppZOzRl6CSfhuVAvEUNA1GYFah0RlIzxOOJmoCWqroi6meKoEEhSUe/ZfJAHdezkKKGjYMcybHqjvB4C1/Lure4W6pEzjaZQ56qmbz8TuJ95MqmRaS6pUoSuHb6CtDDlJ3jJFURD1bDck08juoBrkbyZak7CLdJiZ/AkoTaD2KeAyt/aEk7UFzBI0GkVlo/FnIpLEEzNvuZ2BYOYxE0rJ7HLmoyZ5QQ==;
	25:FBTYC753QKeCJE0O794s2iceB76J60Yf6kZZgicDdSi/Nk0orqvZPTkyMmCsivmT1aUluESRTI8YSYqST5cxTCFtj6kVE3yIejKunpzkNQfhF58TNvZfB/tq6lWlxObwMey6HERX1TfQ1NRuuQ0cqVutUzCLRGUSCgqlJX3hOfZ7sI0b4/3BkUlpcvWqS+QpRoYBi6/rA+qKL/1zrNJxabRQ3nQPFkJHNyzbVfpORj2Lqe/BaXopcJ7RiTRuk0YYPFUiIZIJJAwVkrBpL9tm+FvtQvF5ptEmwFkhzp9Zt7kraRbEWY7t/20/EKdf5ssAhbhYmFuA/y6UyedRSaI9wvX7NaRnHrFmXMoq7LzviUZLV0eys1aeoEYWlmH9H6G4vUvwjd95ncaNT9uljsYfrUQ0xmYNkwK5QYOn1agkxF7UevRz9hBifjWblqfbPkkK6KdHFygSNyGbHE8KgRafnA==
X-Microsoft-Exchange-Diagnostics: 1; BLUPR01MB1393;
	31:tYOSZDPytPQEKQVxYtciKAsQ2r7vYGNuXhzKjH0g6cy6rsrILk/AMtlSJCTT0wVWPU+Z6c9JApzuUhaUb/vfDylyJhA6WvvCmGFG/NDsQ9rN/0dPz7i8YcM4PxCSFxFTpKDzUkUBH1odnOSzmJ7zC5YHSQiPRRBuamHtWkSJDV3JWskfN6I1xadBQcaKfN9IZ/xYCv85aHaq11DTxx8BGv+EKiyl3cxHxd4TgPjCU6dpnFgYKfG8TRTy5kwzpo09CUkuPKf43fVWnYJjmhqzaGCuGkF5DjYaPbiOlS0Zkx4=;
	20:/Y6HKl27ufjrnoX+v+I1kzbjt3OXvSYxgpdu87hY3iW0ivUkAWGCTiPRFjRuAa46ec4U5+2p0JZ/7NT18cwiM9uN1eDkgOMCLoiKxd7+FRWoMxsjKL4oTVBTkfGhIf2TXJGAD5Md72GROILBkPfldmdvJQOPGaFS/YgSlqK/b6yTXRI1zbEOhbLBlL4rA/odhi6pZqwgLuoIwP6qpvIFw1g4MpKn5kzgceUhnKef9wpw1hygNn1BctXVra7I6GGymN1quJkuI/VrqHmqmUJPChQyyKiy9Zp63bruUpTfKQmL5wwJh4yobOgARAHO4Aecm1x6xONbwJkFoBZCaaTVdA3Cndd/Sp74gplIH4amz/GY8nO+D9d9teeoVrcTj6rvihnrnq6f2Xq9aoraC1dKPDGXUtHKW06h3cR/WPNFqKA=
X-Microsoft-Antispam-PRVS: <BLUPR01MB1393904990EA4B73A1F4D2A9AB2E0@BLUPR01MB1393.prod.exchangelabs.com>
X-Exchange-Antispam-Report-Test: UriScan:(788757137089);
X-Exchange-Antispam-Report-CFA-Test: BCL:0; PCL:0;
	RULEID:(6040375)(2401047)(5005006)(8121501046)(3002001)(10201501046)(6041248)(20161123562025)(20161123555025)(20161123560025)(20161123564025)(20161123558025)(6072148);
	SRVR:BLUPR01MB1393; BCL:0; PCL:0; RULEID:; SRVR:BLUPR01MB1393; 
X-Microsoft-Exchange-Diagnostics: 1; BLUPR01MB1393;
	4:pK44g/Bsuci21c6HUaIEjv2vj14GShPWb9B8oouRiP6e1x2yK2DizSWY/gLOyFnjFDxW0rm2lO+v4ZCHCZ8vfmb3MacIl06Ux/v3HErQRbTfwNns8BzeoAD1c46olff1zd883NXT+GJEFNkCQa5MQW/sb2uiirSkDkWwmlrXWxwc7pa4j7AvUeU2riBl6piecaA1RkA2VffO9WDXA30/Lt2Ef6iSreWMUB9ipzgsDyEW24a8aw1rRSRQ/s0SdZSZFLlsSXZ2n4so6h9njABWcWdJdjwOw0bLavuQ8JMv9oNJHkZYseN7qhIekGn/tUhNlNLXQwojRrnTIjVCC5bWp7HFgqCWrayScLitgIe0T55OLi9NFQVKQ83fCZL15JTIrbcQuKi6Rx0wCqvYvipi6LuPue5vWgg+L6l4z9Htp0PDi3lTHy9LsZwechf7KenibnQWzruRe3D77KdzrWqB3JxcAN7Kw85pKhwJpafAsUy6ZDoFI2KO9YT32sMc03LbWpqAFzPRVhXyDC6ctVx5NwUwti06PGlFE4IpnpVUAoFaf5NHd4AKUaRR+H9bZIedhrTvQ8dZv1X4F4vo4j+ioBth+JEPAU/tapPf5KzcJzIE+xLO1Hu1xM0Yh2aAq5N7
X-Forefront-PRVS: 02408926C4
X-Forefront-Antispam-Report: SFV:NSPM;
	SFS:(10009020)(4630300001)(6049001)(6009001)(39450400003)(377454003)(377424004)(24454002)(31696002)(6486002)(6116002)(5660300001)(229853002)(86362001)(83506001)(90366009)(25786008)(33646002)(50986999)(230700001)(54356999)(8676002)(53936002)(53546006)(76176999)(66066001)(50466002)(36756003)(6246003)(77096006)(3846002)(38730400002)(42186005)(23676002)(54906002)(189998001)(31686004)(6916009)(4326008)(81166006)(2950100002)(47776003)(2906002)(7736002)(110136004)(305945005);
	DIR:OUT; SFP:1101; SCL:1; SRVR:BLUPR01MB1393; H:[10.111.61.107];
	FPR:; SPF:None; MLV:sfv; LANG:en; 
X-Microsoft-Exchange-Diagnostics: =?utf-8?B?MTtCTFVQUjAxTUIxMzkzOzIzOldEaE1uUDFPYWJiaU5Ia1ZVYnhIZ3A4SDBV?=
	=?utf-8?B?OVZ5MEx1ZGtoVTVvbU1jWlo4V0VZcEt2YlBOVFdWNjllSGEvcTY4N0VQM1Mw?=
	=?utf-8?B?YnpOd0gveEJ4YkNKVjRuZEkxZlNHVlBDdXZsNC9Yam5kL2pYQjBpZzhRVUNU?=
	=?utf-8?B?VjBKVkVMdUszVmt3aStXdWFtSTlOc1NHaVhXcnBjT2tCL0xEM2NicUIvejM1?=
	=?utf-8?B?RUlHTTB1b0VJckFGSUFsMjk4aFVkYUJqTXRHMWpQN0Y2d202V3N3M3QrT2Vl?=
	=?utf-8?B?aCtNQVBidUdKcHdYSUQ0TUpkekNPaGxnUzVGNjlyb2JnWDJaZldhbTdNQ0Ra?=
	=?utf-8?B?TzlwZjdwNkhSNG1BR0VwZm84OWtDWU56K3ozSXQzb3h6K0tKSTFKYTR5empW?=
	=?utf-8?B?ZGY5T29BN1RUbFlKcndYS25iT3VTNFRrTm1PUVVZb0xZeUg5YmxYcUhTYnBy?=
	=?utf-8?B?bjVuYXQrczRoamxINmkxSTRpSnBHQjAyYS8yQjRKKy9rc0N1RHIyNXNDamFP?=
	=?utf-8?B?NnR4VThaUklLc2p3SVJTNVVLclk5YU95TzFSaUZDVlZMYitmdXJxWWplc1g1?=
	=?utf-8?B?bDlQYlVuZVBoWTBOSHZQRFBQUC9heDdYdHBwV2Z5a0lEYUk0UTI2WVMyekVj?=
	=?utf-8?B?MzRINFdMNkFQUXlhMnRtWGQrc0FiWWxNMFphcW9EbS9MS1lmWDdXdzM5dDU3?=
	=?utf-8?B?aml1ZDVoYTAzN05GeUNxbmtTc1FQbys2QVJqL3krN2VTOCtFWWRHYXVLczZS?=
	=?utf-8?B?bTVDVEIrNkRhcFpoaThnRDFMeUNTR21UKy9lZ1BKY0c0R29raDR2ZWtSRGt6?=
	=?utf-8?B?Q1FWMzlDSXd1QVFMWmJVK3NldHBSS3IyL0E5L25TTG40d013U0VxeC9PREZR?=
	=?utf-8?B?anVzandwTXBpL2JEUzYzVkp4R1dXblFocTRFeGxDREdpaW1NOVk0OWhaS3Jr?=
	=?utf-8?B?ZVl5NUNPYjRCeEpuUzVHY2I0Q05ZUG9Ob0k5UTNrbi9aTVVCYUhFQVQ4Rnlp?=
	=?utf-8?B?aXkxc3dkWjdOTGZMUmNRYzROWk9HVEt0VFBQd091ZkI2MnJwQmJKMk5mTmZj?=
	=?utf-8?B?VEVnbnJDWU9NcVF1dVROdkZZRm1TYStsKzRTK202WE0yZU1ORG5PdUUvTk5U?=
	=?utf-8?B?czM4dXd4ZUx1VFpxOWdMZDN5NzFXZ09aTHdULzQyL1BpNnBmWWcxY1ZXa3pF?=
	=?utf-8?B?Ky9hU0tuQjJRaTJnLzZqMEFEcWtTdXJYVDFlbnVpUGNqcm5WTGhNemhpdEdD?=
	=?utf-8?B?b1ZBQXZHUVhCQVRHeGFCcU9JbTB4aGF1ME43bHdkek1MVWpBdnJwZFNDQ1Zl?=
	=?utf-8?B?OFZERy9YRHZwbm4wUnpXV3k3YU5HZU5wSDVON3hjNVBkS3RhaTRFUlFhbXpJ?=
	=?utf-8?B?MU5uY0V1UUlXZGdoZFBvUGNQemkzOVRmWWRJaVNQbmJHLzRCbGtucWpxNy9N?=
	=?utf-8?B?Sm9wb01QUWVtdjBjWk85Y2Zsd3lnYjJ2Qzdwa09DUzNwRDVNaUFxTFlvMktF?=
	=?utf-8?B?Q25XQT09?=
X-Microsoft-Exchange-Diagnostics: 1; BLUPR01MB1393;
	6:j70KRwmUFOIJ0HHH9XfJOGLiz3uN5BiiWz6zLHRxivUWToMdLOfcSP+zM/8+XGI2F1MeUdHN0iTcKkWJlo5Yq361XzKfAh2hsg4Q2rlBFCYsX0gDUDaIsMV1kY9wDeMOYksHoJoWhok/bVKKu8+FvVuG4wiCMG39hiQdWnx4vJBC5LX2rZsxcZaUlzh7no1SKWCIonujxcIFirgLTvq26DiR9LZx6zosJalaAUky2G92C5QCsA/GARumCbw48UmSVMTDD9Pz9yX034z51k/EIyKppMvfB7zBZ42c0SaxsK/Pq3Mig+kVoB6/qR24YtK6TyuKAdA8Zx7xykKJcay+rKyKBFFmy86jwVHwSHkTTcgeB05J1OoAZ/sKUz4znDjFydOMGI6Ar/F2Q3pLK5yBXA==;
	5:aeJ9EY7GUzJgJZJNxHr7Mo+k5LMx2sbAlBpIY/YZVOVCIsjfeeM0Pxe38QH8BaKK1PBBL+Y15eizhZipsSCtObw2f8eQCL7x+KUyKntXaRXgVQEMpOiYPGXqHRrolwiXJMphdohsgtgcfCd8b6cR0A==;
	24:N0onj5HNTLWgnn0TbaPfMEu2ygRcUJGlySOO7y2bOv5ByHaLr2cppGUCO/aVAarNLVLdC+frj9WolfiVVg8NPch7wvHHse0Xa2DD8kGDl7Y=
SpamDiagnosticOutput: 1:99
SpamDiagnosticMetadata: NSPM
X-Microsoft-Exchange-Diagnostics: 1; BLUPR01MB1393;
	7:+nrwPRFczv+YsHsUtN3gxEKhtcP+RdiacuNyeGI0NzuHplPBf5EMDn1QzFIsYCrHQWs9jo9g0h1lBkvE4+A9SFLOHjKGJLiq5gUEVm9N3VUcqPXfp7ikkO87c2qZxsVoOpDiWL4V6UNp2n5KlB/3OKlkCQeT4gEiohqUjjje4vjyh/wn0ZDXDwVwRORIPOzWg9usFIgyHyuOK6aak+k6YfLaiVYN3FSTgOfQUN7B04R0OMAUGvZjwXUkBav97LxckItb2UdnfL2Qi284bbYrroCfRMI9kyrEYGHUxFXkfOd89EJm4Olvvc/cckSRE+dYbsD6w6r8TH7u6GY1CDYWVg==
X-OriginatorOrg: xevo.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 08 Mar 2017 22:01:10.9375 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BLUPR01MB1393
Cc: Enrico Scholz <enrico.scholz@sigma-chemnitz.de>,
	Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Subject: Re: Default rpaths in BUILD_LDFLAGS
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
X-List-Received-Date: Wed, 08 Mar 2017 22:15:50 -0000
Content-Type: text/plain; charset="utf-8"; format=flowed
Content-Transfer-Encoding: 7bit

On 03/08/2017 01:46 PM, Khem Raj wrote:
> On 17-03-07 16:43:47, Martin Kelly wrote:
>> Hi,
>>
>> While debugging an issue with a package that uses llvm-config to compile
>> with clang, I started hitting [rpaths] QA warnings because some output
>> executables contained absolute rpaths pointing into my build directory.
>> After tracing through the issue, I determined the rpaths to eventually be
>> originating from the setting of BUILD_LDFLAGS in meta/conf/bitbake.conf. The
>> rpath part of this was added in commit 35759f97 to the poky repo.
>
> thats for native packages alone.
>

You're right, it is for native packages only. That means this issue is 
really specific to clang or other toolchains with similar issues rather 
than being a general issue, which is good.

In this case, because llvm-config is built natively (as it needs to be 
run on the build host), and because llvm-config populates its --ldflags 
argument with the contents of BUILD_LDFLAGS, then the target build ends 
up inheriting all these flags.

>>
>> In case you're curious about the background of the issue, my project is
>> using the output of llvm-config --ldflags to set its linker flags.
>> llvm-config is populating the output --ldflags with whatever it is given for
>> CXX_LINK_FLAGS. CXX_LINK_FLAGS is being populated by the generic cmake logic
>> in cmake.bbclass, which is getting its flags from BUILD_LDFLAGS in
>> meta/conf/bitbake.conf.
>
> I think we shoud not need rpaths for target recipes. We should see if we
> can just remove it atleast for /lib /usr/lib
>

I agree we should not need them. Of course I can run a sed line to 
remove the rpaths from LLVM_LDFLAGS from 
tools/llvm-config/BuildVariables.inc (and this works just fine). 
However, I think there's a deeper issue here: All the build-time flags 
that llvm-config spits out (--cppflags, --cflags, --cxxflags) probably 
need to be replaced with target versions of those variables.

Do you agree with replacing all of those, or do you think we should 
replace only the rpaths?

