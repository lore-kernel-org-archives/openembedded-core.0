Return-Path: <mkelly@xevo.com>
Received: from NAM01-SN1-obe.outbound.protection.outlook.com
	(mail-sn1nam01on0054.outbound.protection.outlook.com [104.47.32.54])
	by mail.openembedded.org (Postfix) with ESMTP id F1F33776A6
	for <openembedded-core@lists.openembedded.org>;
	Fri,  3 Mar 2017 20:35:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=uievolution.onmicrosoft.com; s=selector1-xevo-com;
	h=From:Date:Subject:Message-ID:Content-Type:MIME-Version;
	bh=pd78dUr7BdhLDoDqJpCqjRTqclpoCCLojaKarWUgfkk=;
	b=Ejh7b6Bx+dqsjSeZONCtEoYfdJWNKBmjrnSBQoGO42E7+zEKW504N+luKti2CVuwOyiPyK8p2x4Vvx8jPWmZOreDHqYNCoXjEATDlwSR/B4mVs1c52NHbqYbvSp0mEClsTvS9y7BwF8vf5ykb3pK34WeOo1LBQ9IOr1vjtOhFyA=
Authentication-Results: lists.openembedded.org; dkim=none (message not signed)
	header.d=none; lists.openembedded.org;
	dmarc=none action=none header.from=xevo.com;
Received: from [192.168.1.2] (67.171.33.217) by
	BN3PR01MB1400.prod.exchangelabs.com (10.163.36.155) with Microsoft SMTP
	Server (version=TLS1_2,
	cipher=TLS_ECDHE_RSA_WITH_AES_256_CBC_SHA384_P384) id
	15.1.947.12; Fri, 3 Mar 2017 20:35:55 +0000
To: Khem Raj <raj.khem@gmail.com>
References: <119c985a-4527-9ced-6cfe-46ccdecbba67@xevo.com>
	<CAMKF1spQU9cmk22_Q7VtwKqJ+vVji-YfOHewUr8sz7ykkJaG3Q@mail.gmail.com>
	<7333db9a-fda0-a8e3-6a3f-9d7700e9eda4@xevo.com>
	<CAMKF1sp+pwjdasqJ2P9hg3VgqPPr+XC-GWV0oN8V8vUvE-+yEg@mail.gmail.com>
From: Martin Kelly <mkelly@xevo.com>
Message-ID: <132772b8-699c-ac9d-8ffa-f51ab7ea6947@xevo.com>
Date: Fri, 3 Mar 2017 12:31:00 -0800
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:45.0) Gecko/20100101
	Icedove/45.6.0
MIME-Version: 1.0
In-Reply-To: <CAMKF1sp+pwjdasqJ2P9hg3VgqPPr+XC-GWV0oN8V8vUvE-+yEg@mail.gmail.com>
X-Originating-IP: [67.171.33.217]
X-ClientProxiedBy: MWHPR11CA0003.namprd11.prod.outlook.com (10.172.48.141) To
	BN3PR01MB1400.prod.exchangelabs.com (10.163.36.155)
X-MS-Office365-Filtering-Correlation-Id: a838e3be-538e-4e11-fbee-08d46274e4e5
X-Microsoft-Antispam: UriScan:;BCL:0;PCL:0;RULEID:(22001);SRVR:BN3PR01MB1400;
X-Microsoft-Exchange-Diagnostics: 1; BN3PR01MB1400;
	3:ThvkZetvZFyZyehR6hvOJnUtnrIrE+yn0q4in7NppDnwwRcQj5Ym5jzyGyFfP56+om+RBjMKx0et8jTFsmk9oEFnBTVyxEyUFIsgY/r9C2RCWThEOkar8DFmOK+13mdIqGgwDu5tjfLUtLzTmJqgmZQx+qA+o/dBDHVreHfuGsWXC4Qpwoo7f2/DWN1KzJsJgshRuVWzrU5gRqe6KfEQOkiDyGU70GnRQXYfqCVh7gyS3nmKPGyCsp1Y/YtyopLgPx+JowJk+ALVh5ZSVGFitw==;
	25:8rHM/Lg6DK8TckQBx+gIobXoumPGIDGynBgpJASh6/SNbUsg/KGydf6DYp38QsRvr3mCRKiVWaOSDQc0HlMLI0D8ZDNlhg63enpGDHh8mEFjx//7WJPVpgZQyuDmEqEP1iWO8DVNrlZeo7X0Zzrtu/KgELDyAS4Ncb61bNrExY35PAsaavUpjx0oIgA4bqcHneQHaqlEH6FOLWA9tn09sqN2sZAk7t8XLd+qWwnh3EAd9MIK+wRbrigalevsBYg9HMAGGi/STzMSHdqhqyFEBx2+X6X4MeEM9d9lObsSbK52Satzi1gccJF6IaVY4T8C7avaEW9da6GLlPD9mj3r0QHWc0Bruwgczeu3G79DWXuRD7NJrT+bPanC7pbX+QfC+tij9pQzF6SQBAt4pYdyk/ZAVtS8sRuUVinCry7Hnjqkja9zhufIqgJ9SgQ3yO7QkxVDSmURQfU/TnfXsBvo8g==
X-Microsoft-Exchange-Diagnostics: 1; BN3PR01MB1400;
	31:CWRAl06i0CrNrbn1jq7vjqnzAzjj3JAUzmrfDoIY/5kRIpAWBJQ1nVPKFhfm1yGGKiTL5Vm7exaaiNcpqcVWW1tsHfAc1ue7t/fYFNlTQ6z1hhkD9G0+FMXqN8C497pKVH8UTGKV9N57YyOWJ4kDp8/Tfp35L3Sen5IOzOdHgum4OSYwQa2fRngG/Q1uXP7UaReTde/SVQfvsB5NdHR2KszqlkVo2mJK4KUSsG4momfQC/axIqrG/aDCdl/JEcAoqwWtoTg5PjTrxPtcUbYzFA==;
	20:+xFx9vl/zkXBGrlcFCAgdZfmj0nztrNcDsKVc7xzC7zOqjg/LY96JEe2Za3IFEkRhRrf840smrwsC808/LytbpGpr3IHGK+bKPUW4lohDjgJ8FgI1WpQ8XpcB5tBVQw2JMitr04ilYycpVsmuDe22QRJ2CMAaMKm2Jbp1+2K5TZ+H+0WJakGs+Xenp5IIoXs1UPYW9rKHt/0Blb+8yyvY0bLTmy5vh7oO6AAZVPR7b/YV0ISizyjDWMUfbLrG7lsSjjSF09jfK458eD1Kj4DY/ljxy7LaGKHcEBAX9RtmHqKfctoSarx1I5QsTo9zL85Nqhia9oTpqnNnV+dhCuM6Q==
X-Microsoft-Antispam-PRVS: <BN3PR01MB14001EDBA54A8511560B8636AB2B0@BN3PR01MB1400.prod.exchangelabs.com>
X-Exchange-Antispam-Report-Test: UriScan:;
X-Exchange-Antispam-Report-CFA-Test: BCL:0; PCL:0;
	RULEID:(6040375)(2401047)(8121501046)(5005006)(10201501046)(3002001)(6041248)(20161123558025)(20161123560025)(20161123555025)(20161123564025)(20161123562025)(6072148);
	SRVR:BN3PR01MB1400; BCL:0; PCL:0; RULEID:; SRVR:BN3PR01MB1400; 
X-Microsoft-Exchange-Diagnostics: 1; BN3PR01MB1400;
	4:w2NgyLdiQoDVAPDoN4Hy7p1tBGQU4+QFSY1rB7AyrQ+7CMK0mnZ2QGBB+cTxxKbkunvVkfGbEf1p1SqzZXqv2jGgoD9CTJFGRZU2bM/1gTuJ1sYnX3T+6MQUcN2UJXVEtM2ZzwMNUa9mSO79SuxtYz8kkFmwfou46lQdbgO/YElUcbsXqca6HzOpdegkuCLoZlSSYsZgdVr4/8ZOKlaWndhj9qsKovE5QHuU0BqLL2yIUoKsAyX0wkrpz2zAra1HSgUOPmmjz/kYDzwxuNkoN6RUrbsAx39IHCuEXnIvXnc7ut4hypwmbISCnndNW4qw7ZIBzoPRJzY+l+dHAR3GrlHFnKInQii8YlAPtyfzy5B0GmRGZ+5dET/fhpvdAoIyADAcZVjcRAbm+Dfh8uIWLPiVziFEn2TobuuAVW+5JNI5iQAo3L6lNKZLoSxRUPWNCK8FJ4NNpGiSWNfksQowXhAwJbMxvM0IP/QfKW2me9EzLGpqGwUeXiL4/gHzQnc1VDyLCLYmBkGkVZFw30GBURh7Nz3OB1T8jhZaKN3UxoFt/M7EP4Io6QVIagWEEtKaojv6erwGM0R922iOFyPX1Q==
X-Forefront-PRVS: 0235CBE7D0
X-Forefront-Antispam-Report: SFV:NSPM;
	SFS:(10009020)(4630300001)(6009001)(6049001)(7916002)(39450400003)(52314003)(24454002)(377454003)(4001350100001)(2950100002)(86362001)(33646002)(23676002)(229853002)(92566002)(5660300001)(36756003)(31696002)(64126003)(6666003)(50466002)(2906002)(8676002)(81166006)(50986999)(53546006)(230700001)(76176999)(93886004)(6916009)(305945005)(4326008)(83506001)(189998001)(6246003)(53936002)(117156001)(25786008)(6486002)(66066001)(77096006)(38730400002)(31686004)(3846002)(6116002)(42186005)(54356999)(7736002)(47776003)(110136004);
	DIR:OUT; SFP:1101; SCL:1; SRVR:BN3PR01MB1400; H:[192.168.1.2];
	FPR:; SPF:None; MLV:sfv; LANG:en; 
X-Microsoft-Exchange-Diagnostics: =?utf-8?B?MTtCTjNQUjAxTUIxNDAwOzIzOmhNYnZTYWhxeDhQQ1dja2FZOVpEdmJhcWtj?=
	=?utf-8?B?cVVjVVhBWUF6MDFRc3lWVndRdWNqYldnRE5zZlMxK3daUm1pTnk1SWZVOUFO?=
	=?utf-8?B?b3I3dzR5QVVieWRoS2pQVEl5MHlFL0E4OWVNR3FYYVRPVHNKUWdsNVk3N0Fa?=
	=?utf-8?B?ZmF5eG9XWk9iM0NPdnZidjhTdDI2bTZhWVFzbEg3UlYvSXNDckxjVXpkSEhF?=
	=?utf-8?B?Z0VjMWFaQnZNODhuTlFGTmFqMU9rTm1SNjJoZTlqUzJLNnVTYkNUNGMxUTBW?=
	=?utf-8?B?THhUbmkzbXYzTkFac1lTcFVFOVEwVG5zdUM5WFdteHVFUjZGVEYwVStqMUkx?=
	=?utf-8?B?am5HclVTVVRuRUNPUUpYa2k5VDhzY3dqdmFaemNGWVZVVHJsS2J0RkxNREdB?=
	=?utf-8?B?djBEM1hBWnRCZkxEZHphUWlCakJJQWhqMVNRRFpRVENnVTl6N2dzbnRZeXhk?=
	=?utf-8?B?RGo2WDZkTjYyUWhpWEpFT2oxYmoycjZjWituTHUraWl3TWMxTHVyUm5nRi84?=
	=?utf-8?B?NXJiYWV5dThDUE5EL1R0UjFqT2R6RU52d0NJR2tvYklKM3ZjelpwS0JRVW5t?=
	=?utf-8?B?alcxam5CbDFkNER2NnluSXpRZ2FtZjhqUnYwNytGYjhPTXJIZ2hnZ1FWMUYx?=
	=?utf-8?B?bGRkdERzTFIybUhLeTlrRWhpb21qc0FOcDVobWs3R0ttajZyWk9tdGxiaHI1?=
	=?utf-8?B?djNZeGFHNlRJWDdkM0pBajRzQzJFY2k5MHgyTDB6VFFIdjkrdlZkYU1LOU1o?=
	=?utf-8?B?MFVENEhRQTNNbG90VzVkZnVCT1lTUi9MazVCcGxGTjFZOUUvSVFBWHc1WTNx?=
	=?utf-8?B?R1oyWVNyN0lrTnJRMTBydS9qdmllMzhySmp4WXlid1ZJS1d6T1IyeHNNaUpn?=
	=?utf-8?B?UGJwaE13Y3F1R2lVM3YyUzlmUU1jTFZtb1FCMk9OL0pGK2hTUm5VVEt4R2Jh?=
	=?utf-8?B?ZTBObWR2blBiZWt6Q21ZazYzb1BRTjNURUtEaitrcjVQRjZ2Um9IMm14S3Nx?=
	=?utf-8?B?eVNWUWNqemEwa2hFWVY0bjR3UjdtNEJsSTBGTm04ajZpWDNRV25yWDFnaWZx?=
	=?utf-8?B?bVdrMHpnU1FOVlgrc0NzdDdMQUJsaTRRaUEraXBsYStnMTl3amE3T1dxNVBq?=
	=?utf-8?B?QmN6Q2VPV2pyaUtMUlJjL0c0UXFPQWFMQU56VytiK0NPb3I1RVF4VUVPeGhJ?=
	=?utf-8?B?NW9SQ3hiZFlMRE5HNVp3dE0xbEJ4MXg3WitiL3VjMVozY3VQRHgvNmVOUHNR?=
	=?utf-8?B?UllIQU9MZWJGWXZTc3FFbXpsOERCcnNCdzU1cjhGZi85SUFQSUVRVnZsQ05Y?=
	=?utf-8?B?aG45c2M3RFN5OFd0M0Q5LzBxbFhUZGRYTjFydWg4NUpHVzVOam5vUTJBM3dL?=
	=?utf-8?B?QlppV253WWtVR0JpQURia2M5RzdJRmk0VGoxUXh3aVFpMUdIdWJNdlBvejRp?=
	=?utf-8?B?MnA2OXVjR0hWTlRzVzlyVGVYaDlRSDE4NWtNbHA5Q0tSRmtGU3ExL3pRc3NF?=
	=?utf-8?B?OVpwMkp5M2lMZHF1MzJnVzA5eThoZ1RYM0xvdDJ1YUZBQW5GUXA4VGVZUEZv?=
	=?utf-8?B?YmI3OFRRMkVLOGQ1N25yOUpIZFJKU3N4ZU8wN2pQOTUyTldYWFZEMm5LeU1O?=
	=?utf-8?B?VDNORWliUTR2R3JDemV0cDBxS3IrZGdkWDZMcDRTV1VUa00wS1ZudzZRPT0=?=
X-Microsoft-Exchange-Diagnostics: 1; BN3PR01MB1400;
	6:Jpncqc9HHCnENRpd2bJbplQOVQ/+UYGnRr8hO550KEF4W4adsxrq8jRyZ1Hq2OozwWklD9r+QWu+AOjlWKIBCFSluGPtR/mCUheNax72PblrE8mNVuZBD29ipfBFhcZmFbc6X1MIKBRvfw+ijbJL1iVoyMn+PSZZ9dJRUdkzS5+yLRvvfvkPiNZX7k4hf64fVjn03BFy7kBSI/twLRF6GYkSIKW2lLGLTFDZQD0OsosAgaqapeoZqg+MINjO7wo7r4t0hZiC1lAMMCI2JXcdmX6xFCdLUOJxpH1tyDccRzg5wRUZqdelIoBX1kQnX8AZNFv6bz1jqtQ7SoyZne+IaQgB2Mov1AwjUG6lLNLnRFk5HZOMCO00JqjfGhAjCMoc+f+PDqoxTiVqbe5Toh/YUg==;
	5:lu36stTav4vUZBhs/6h4ZSfHeiPRNU+09mSLeaHnpGrEGfJi5MkJvmXZAUDJ2Vt5PDiYdHZm5EhmFZpTLHr103pQ4Ag09bYK860xMlw4+lH1hoPXChxFU7BTfNbtIDW6y9rvJPSEP8BGmZ29NosnRw==;
	24:gfhIaMvQqA4xqyzBqo8uxvi0NtSiYeSECefvmORAPHSgjwe1her+E8bRABe+zSqHXyJxQoi5QL2aaF+QYAZqyHcHhf8mqaV/9gi0FW0mHsk=
SpamDiagnosticOutput: 1:99
SpamDiagnosticMetadata: NSPM
X-Microsoft-Exchange-Diagnostics: 1; BN3PR01MB1400;
	7:2sl/Lm+ECe59DYAFGShNuMpaEzG3VjatwtysU9hcxD44DyudfOPZOJgI21KM3C2hQrReU7xpqmfl2NaFjstbPNIGUcRkHa3WN2EerMmpC1C42rP0sbChDCR93TdylwRlR0jYhb31T9fFIvjC0//i8UtElpc8m8FMqlcg6WaGCGuD+idzoFTaOQcZaQu2mskEABCDDNikoaBUwyXWNPEwDRs/+rRrRPA06jias0hefBYzz+lbmP4dv2Ni7cbkBkJk+5R+kwREoGOQnORRXvOFjIzc95cndy9qPRulrYPrUI1GD7syYCIpx6BI90AdLKJl7/SOVIqGc6Aspdd6/TqnFw==
X-OriginatorOrg: xevo.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 03 Mar 2017 20:35:55.7244 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BN3PR01MB1400
Cc: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Subject: Re: [meta-clang] clang/LLVM versioning
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
X-List-Received-Date: Fri, 03 Mar 2017 20:36:00 -0000
Content-Type: text/plain; charset="utf-8"; format=flowed
Content-Transfer-Encoding: 7bit

On 03/03/2017 12:23 PM, Khem Raj wrote:
> On Fri, Mar 3, 2017 at 12:15 PM, Martin Kelly <mkelly@xevo.com> wrote:
>> On 03/03/2017 12:12 PM, Khem Raj wrote:
>>>
>>> with  meta-clang there is no desire to support multiple versions of
>>> llvm and thats why versioning was dropped however, I would still like
>>> to fix the versioning if that makes it more useful.
>>>
>>
>> OK, keeping a single version is certainly simpler. Could you clarify "I
>> would still like to fix the versioning if that makes it more useful." ?
>>
>
> say if there are other apps which depend on the versioning and
> otherwise would need patching to work with llvm from meta-clang, then
> lets fix it in meta-clang.
>

 From my investigation, it looks like the real (unwrapped) llvm-config 
is in the PATH for any recipe depending on clang-native. This means that 
when an app looks for llvm-config, it will find the real version and 
won't know that the wrapper went anywhere. Of course, if the app truly 
depends on a specific LLVM version -- due to LLVM's unstable ABI -- then 
that app will break when the meta-clang version changes. However, if we 
don't maintain multiple versions of LLVM in meta-clang, that's unavoidable.

So AFAICT we could safely remove the wrapper and have apps that set 
WANT_LLVM_RELEASE still work correctly, if they compile against our 
version of meta-clang. Since it appears the wrapper has been broken for 
for some time anyway, I'm guessing there aren't many such apps anyway.

Does that sound reasonable to you?

