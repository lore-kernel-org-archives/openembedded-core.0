Return-Path: <mkelly@xevo.com>
Received: from NAM01-SN1-obe.outbound.protection.outlook.com
	(mail-sn1nam01on0073.outbound.protection.outlook.com [104.47.32.73])
	by mail.openembedded.org (Postfix) with ESMTP id 929A662135
	for <openembedded-core@lists.openembedded.org>;
	Thu,  9 Mar 2017 00:06:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=uievolution.onmicrosoft.com; s=selector1-xevo-com;
	h=From:Date:Subject:Message-ID:Content-Type:MIME-Version;
	bh=Dkv5Hu/9FeO2Dx65KVfzLidNMcG1f9nVhA25T9L/O1g=;
	b=Q0eoUT2NIGBhPbW1gcbR0uWtIwO24wHNS9lCv8he1ixP51DXn5+kprDjdG3JGdEn/z2KJbLOOt3fGE2jvVfBOXB4Tm5cZ9qnZhqEP+RGuFOfWZ1pVU+1DDdhpl/cVzUaFG/HUIHWORA8BmQApRVixmDTAPj0Y20AuTWEqF0Hzpo=
Authentication-Results: linuxfoundation.org; dkim=none (message not signed)
	header.d=none;linuxfoundation.org; dmarc=none action=none
	header.from=xevo.com;
Received: from [10.111.61.107] (66.162.141.202) by
	BLUPR01MB1394.prod.exchangelabs.com (10.163.82.28) with Microsoft SMTP
	Server
	(version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_CBC_SHA384_P384) id
	15.1.947.12; Thu, 9 Mar 2017 00:06:57 +0000
To: Khem Raj <raj.khem@gmail.com>
References: <8f9c4dbb-10b7-25b9-1f38-704645a2eab2@xevo.com>
	<20170308214636.GA17756@haswell>
	<c239faec-410b-99ff-9f0e-8b4c350b460a@xevo.com>
	<20170308222333.GA2920@haswell>
	<97826fa5-1236-5811-1438-59cae184ba1e@xevo.com>
	<20170309000212.GB24752@haswell>
From: Martin Kelly <mkelly@xevo.com>
Message-ID: <be4e81bf-a255-6b85-25e5-a82b755e6c76@xevo.com>
Date: Wed, 8 Mar 2017 16:01:58 -0800
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:45.0) Gecko/20100101
	Icedove/45.6.0
MIME-Version: 1.0
In-Reply-To: <20170309000212.GB24752@haswell>
X-Originating-IP: [66.162.141.202]
X-ClientProxiedBy: DM5PR16CA0004.namprd16.prod.outlook.com (10.173.216.14) To
	BLUPR01MB1394.prod.exchangelabs.com (10.163.82.28)
X-MS-Office365-Filtering-Correlation-Id: 3b14d6ea-270f-41f6-fff7-08d4668033f9
X-Microsoft-Antispam: UriScan:;BCL:0;PCL:0;RULEID:(22001);SRVR:BLUPR01MB1394;
X-Microsoft-Exchange-Diagnostics: 1; BLUPR01MB1394;
	3:E+pygYpy0YJDl5hIBTb1kRE/BGcZo5UBns0Dk8VgLcP2INg93XG/L4QcQObS7Eab03A/rLhj3USZBcizj0f1lyOpIJP3TXWo64CklCiweNcr/dSMBNt9e4SdwuI99TJLqAirHrpOyspcZcphm6SM8c5q1f0Zg3Oj1rmLlidqTp05H8F1MbEPyE3QsdB2VEG3TWInhJ0zEDTY4RusAoUwfWEoz3gKfsIez/cVq9yTIFOl+SFT29bQo/9ofBaIiXnxbSI9uPei5z6izuzy6eI58Q==;
	25:3Nrdx0pSXyFnHcVgv+s38QRcsWMn8x6XR6tOvjKaXeiMsRyBsoxIB1r97sZTYojzE0ifP2IhbkxJU8zoSys0b2ep/w5+SMtRjaWVeYZISQmn38JxGYFQZG77gULZX4U++XeZejlHtL80707xCJLKE0Tkg1ewUrx/t/NRKUiVKH0bole01ehGv736DRi2iWE+9AFRoucLgGtYjdlAbgQTkRSHow63MzHNPvRsiMc/T/XxNdsQxiO+6RtfdsGNv9EggtgwtKdxg+TAuNqvU2Yq7+Yf5gi4zXsshDwKRm086K3gPTgg79WQaofKReUtJkNC5M+wAgkvmrYQkSoN/HvegiJi2PV74OZoNDODmCdRalxJ9618IbqQo90zel7HKTkr9cnM41Uat07W0rwPN21XAiINgoaDOrtTT/CWrN17yMuqweAz16wmBKztlRmhout6nJebnmNC5Xt5kdPlsCRh5g==
X-Microsoft-Exchange-Diagnostics: 1; BLUPR01MB1394;
	31:JOYvcBV0+IupA5FeJfeqIfqaG+GCnx0jyrvr2VUHDBt/dCUuA2lmH9PkeV4WV7qhxHYXE4s2CS2UVHfZeWnefXgFWRSK0cQHtAcENj2vAeUyaWWB4pFeQqwH3mW8X832j3A773oWIP4kZO1hcb9nqfWZOstWloAe2N2wycl+MS3To1PCtFHba8RQ9/VdEcz2Z8dCo3Qo8yNeU8PYoyWgf3cbu1/caHhjE+L6LlP19URepKs3gpDjEJxVQQ9IRLKXkJ46BVL+S5GxcudMmgKN3w==;
	20:FB0iy+SuGlAF/nnrxhBhxyb5cd6UJeA0bUdL2xpewJqG45DBBAA18Hl+/96OF72ZNoDRCXIUSzflqxyVyLe4IQedKzs9gV0d67zDqS6sd6p1N8HrSLmyMsKNXpJDkeGzApkXXdwmrVo8M5Mwfe4/M2+ISReh+tBxGMQIrBq/HsVvkHHeS238scFgXbSnUwFotErVMJ8yHHvL1aUtVxoAALXGtVtYo7h/hAKFOqquNKjRsI1WNuP84nGzxR6F8lrMD8zMCpSrp4//sjvQqhj9Vpfe53p9g7IWmxp9sv4lVucInA7ybaBHqbjUgGuDE1UeAicVq/7TE61UgKgp3Oj8+A==
X-Microsoft-Antispam-PRVS: <BLUPR01MB1394A96F0084C5E6584659A5AB210@BLUPR01MB1394.prod.exchangelabs.com>
X-Exchange-Antispam-Report-Test: UriScan:(788757137089);
X-Exchange-Antispam-Report-CFA-Test: BCL:0; PCL:0;
	RULEID:(6040375)(2401047)(5005006)(8121501046)(3002001)(10201501046)(6041248)(20161123558025)(20161123555025)(20161123564025)(20161123560025)(20161123562025)(6072148);
	SRVR:BLUPR01MB1394; BCL:0; PCL:0; RULEID:; SRVR:BLUPR01MB1394; 
X-Microsoft-Exchange-Diagnostics: 1; BLUPR01MB1394;
	4:kqZmaX0xdaVL+QzOmJmP7GLaqa9VOs59npDXkauruaY3DBdBNo7I4ag+FOhMDZoNIEzs2NI2doeFTYQLwI5pK116sCkKEUXVxOtcibVXeJQPUVhZznuPmrlUPSD2WKjFt0Ol/fHOR1S/LuptAbERIGN04e9YahiFP5r7HgYuOuwxct50B0fzo9goAMTEKFuTaIKVH/Xm1t7C56p8sXhWncpAk8xETNExwfWMzL3H6hT4zqHofYJ4rHi5oSOIcyaeDv1uyrYgZHjvvqqRL1JnknEbzdyGlLnxlrcFSwKVLigxMeto9EynWOQRvBbDOMxrncGukAivi1xcJiXIN+4x9r5Ujm9MBeI2N+f2AIIs9FJc/G84O9woUvvxTxM+XOS9iDk1vbd8xVdgwFgDkIuAQf4FqU/jHd7h/8FB1ADoG7jORxXMXJKHckzo7tJdxebONS0ZYY5psEsDJeE/F/7hhq6HPaL+IVASjm+IVaMaOYXFqUGThEMkKphNKjEctvipyuwrc8zDqe1xDFW3pveLWGiMrhOkHFj4+LFI89vw7rh817KDSEwqjDuBUlAGqZNWeJ/Z0k2dqSBawRPLt/Qfp3KMUlKD35mfZrX/MI8bxmrIaXK4vPoiVnWAEXmBk8xd
X-Forefront-PRVS: 0241D5F98C
X-Forefront-Antispam-Report: SFV:NSPM;
	SFS:(10009020)(4630300001)(6009001)(6049001)(39450400003)(377424004)(24454002)(377454003)(7736002)(53936002)(305945005)(6246003)(93886004)(4326008)(31696002)(53546006)(36756003)(2906002)(86362001)(23676002)(110136004)(38730400002)(81166006)(66066001)(8676002)(47776003)(50466002)(6116002)(229853002)(33646002)(76176999)(50986999)(54356999)(3846002)(31686004)(42186005)(54906002)(6486002)(2950100002)(77096006)(83506001)(189998001)(230700001)(25786008)(6916009)(5660300001);
	DIR:OUT; SFP:1101; SCL:1; SRVR:BLUPR01MB1394; H:[10.111.61.107];
	FPR:; SPF:None; MLV:sfv; LANG:en; 
X-Microsoft-Exchange-Diagnostics: =?utf-8?B?MTtCTFVQUjAxTUIxMzk0OzIzOms5cXR2bXFoNFFVRmRXTnd2MjErRmViWHVZ?=
	=?utf-8?B?K2NmQnBqL2wrZisxaG5CZjB5cDJUMU0xMkRZSWtqMTNENEdtdTA5NkFocUNO?=
	=?utf-8?B?TVk5TFZPWG55ck9ka0VDTnF2Z0VOQXRjU2l0UWV0STRSN0tRd0tYdGg0N01C?=
	=?utf-8?B?YnNlVW5Bc0YwcFJSZldueDlWWTYzaStuMUkyN3ZMazdXOWNXRG5mdzU5NVR0?=
	=?utf-8?B?R0puaG9va1pZTlpsVm0xcXJGeUo1K0t2M3NXV0cvdkVKN2ZWeWUzMFFjeUc4?=
	=?utf-8?B?RmFjcjFzWDFLUDNwYjNtQU13dVBXNXQxdlc1QWhmM25oMmFEUGtBcVhOK2wv?=
	=?utf-8?B?YmhOaTFvaDVyNEM5QW5RNEVQa0M1SlJuMnNyYVNPYVpleUQ2VUl6OGhFNjh0?=
	=?utf-8?B?RFMrQkR1SHB0OU9lamVRekxyMG5VRUdWVXUxVy9ITllyS3hZZTBRd25ySWVz?=
	=?utf-8?B?cjU4Mk9nTEZmai9kcURNdjdoNUJhbVVTNS93bThxZlhRanlOZW5QcEFLYzlh?=
	=?utf-8?B?ZDdOWnZ3cE1IMmw2Z204MHA0SnoxaDhqTUNnSXNEbGRJaEpSV0VHQWs5SDM2?=
	=?utf-8?B?eEgwN2hzd0o5MFpPUU5kald4L2pLWWtNYzdhcFE4UXZLYlo5QXQ5Rit0VDlG?=
	=?utf-8?B?ekprZ3h3VjRlZG9BTzNmTWQxR0JLckV6UndmRXpFY2JMSmZYRUxvcjBjd2NL?=
	=?utf-8?B?cnVDMmNvNlhNRVEyRVpONDA5RmpNVG56VHorakdYYktaSXVTcFk0TUgzNEF6?=
	=?utf-8?B?TENybVVydUl6MEw3ZHFGcGMxZ3VIOFVpTFo4U3dzUDk4MjVQUTB2OWFnTmtr?=
	=?utf-8?B?THRCaTBKVnlHRjFJWW90Ukd2ekxXZUR0Rm85a05vL2tUekZlejUxd3JLaWxZ?=
	=?utf-8?B?TXEvWTNidVMxUU1YZHJPV09SWTZZeFUxc0d4L1NOdUdLck5zTFBaUmZlWFg4?=
	=?utf-8?B?V3lobmdjMHBVZTBSaDdoNUd2V2NUbFBKZCtKaTBIREg0WmJnMFJJOGFjeDlX?=
	=?utf-8?B?MnZ4YlVzT2QvbUVKNDdSUHlrQ1hHNDFrdXJXS3oyd3F2aVZEZldUZzBUaDlz?=
	=?utf-8?B?RmxJdHh2QndJWkJCTUt6YmZia3JHT01Ed3JXUGRiN3Q5aGNYV2N1dFVYRGVO?=
	=?utf-8?B?SVQ1alRwVjhEeXNsMEpxVUhsb1ZwUXQ5aFdTL1QwcTIxS2NKeThKbzFPaUxa?=
	=?utf-8?B?VklHaExMb25jOG5vZ1JJbE1nVlBQSkxRTnVoNTlIeUtnMVUydytDd0RUNDZz?=
	=?utf-8?B?V0lBcXczTkV3bEZ4Q0w0TE5uNkNaSGpsMmN0SWM0TzJXaGZUSU5HTWlrbUZ5?=
	=?utf-8?B?YTNSR08zV1NZSkhjSnA2STVqbFFnaytXSHpIdHp3K3IwbGI4aUc5SWl6TXRv?=
	=?utf-8?B?LyttdUEvcUthRVVaZ1E0a3A3dy9ianpwMkVvUG9yU3NnRVF4TXNYUFFXYkYz?=
	=?utf-8?B?SDNSaWZpc0tGSGhrMlZNSE5BQ0czYkFqY2dzU1lPYmFJZGptT0VsZWMrYnRm?=
	=?utf-8?B?clhLUT09?=
X-Microsoft-Exchange-Diagnostics: 1; BLUPR01MB1394;
	6:7ylaQcqyrFp1uBEHsBFFrLpv3p1Zn54Zk95E8JjUv7BmndZKPKshaStNAPpz3MS9d+UAL06Nli/jwxgOnCkPuiJ3vcQPO4KG8L842R31YFwR/GQ/kMUUL30jr4kdWhFu9NHGLc+5VBpksFqM9pAM4h+2Jq0XYouV6aCKG1tV8jD7ow9E0ZJlXt/DTt5n4n5nOvGZOgqnw1A5TWXkKgzSNLM/duZMmEas7ATAyyNJy2RP9lQ9f+7Fd+iOlEKBSIwYCvCbGK3q+R3a8stoMyT1T4iUCBl+M/P1wpqHhWva9ZgX1kaKAugMO8YQWFIAGqFVEzZ8ziyHObM1vMff5BNUp4YLEODu1qu3XbWEA2My9Wwq48xI6mONfJYmZe4iZOYB93OHvdcgWxbvBG3b3f3pVw==;
	5:em063BtQ+Lm6e4vH0vLmpldaCqMRv7hi7e4pYv7iTANojNqal5g9wf5mtBLdOqrweyq4R9XGYaqbLyAE5waev2JImWqZOFVMEZCfQgRGhcuyhC/jqgmztvw0usEP19G249HsSxsbMF2BBab8QopSHk3DhXsnNac3dBoxp1vTRSU=;
	24:H2HQ+A9PMRyy85s+2naXBHioMoh2SbTVnYq7noNYc7t+vuA/KWniGHFHlu+h4CZRIj9F3fxT5YvekrfuhBjkctRVBc9f5RfEFFgD9wGoIWM=
SpamDiagnosticOutput: 1:99
SpamDiagnosticMetadata: NSPM
X-Microsoft-Exchange-Diagnostics: 1; BLUPR01MB1394;
	7:SwFl+mDXgNeFKVzumICV5mOF3/c5Gpz7x4Gera0qX0ttBarIu68Q5JkcR1RqCb8M2X2030RG41iU3a+YI20FskSeRJJnmZDXFZosfckfXgTnpjFFeuifCtGC7cJIvFDXKfLkDPIslTXjRfS9WEhdM/iV3eDYDQb8FjbtTH36L/sQujzWKlqX0Vhx88zzk6Zt4c+D+1CRZOUpokNk+kG/9v9Kw9tZ5bu4MtRCuTmLavgLla0YI7iCmuYFOAM/INTU/xtMDzozZA5fiD4W/s4tAqI99oU+wbAosIgKoq/Hv9NEcxOydknZmzTQjA6tRt5XebMIwS9phof9FXn3R64BRw==
X-OriginatorOrg: xevo.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 09 Mar 2017 00:06:57.3701 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BLUPR01MB1394
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
X-List-Received-Date: Thu, 09 Mar 2017 00:06:59 -0000
Content-Type: text/plain; charset="utf-8"; format=flowed
Content-Transfer-Encoding: 7bit

On 03/08/2017 04:02 PM, Khem Raj wrote:
> On 17-03-08 15:44:52, Martin Kelly wrote:
>> On 03/08/2017 02:23 PM, Khem Raj wrote:
>>> On 17-03-08 13:56:12, Martin Kelly wrote:
>>>> On 03/08/2017 01:46 PM, Khem Raj wrote:
>>>>
>>>> I agree we should not need them. Of course I can run a sed line to remove
>>>> the rpaths from LLVM_LDFLAGS from tools/llvm-config/BuildVariables.inc (and
>>>> this works just fine). However, I think there's a deeper issue here: All the
>>>> build-time flags that llvm-config spits out (--cppflags, --cflags,
>>>> --cxxflags) probably need to be replaced with target versions of those
>>>> variables.
>>>
>>> Its fine to sed it out, we are trying to use llvm-confing in a cross env
>>> and this seems to be less treaded path for it, it assumes you would use
>>> it for building packages natively generally.
>>>
>>>>
>>>> Do you agree with replacing all of those, or do you think we should replace
>>>> only the rpaths?
>>>
>>> yes please
>>>
>>
>> Sorry, just to clarify, do you mean "yes, replace all of them", or "yes,
>> replace only the rpaths" ? :).
>
> Infact we should not use any part of BUILD_CFLAGS in determining target CFLAGS
> intead may be you can replace it with content of TARGET_CFLAGS
>

Thanks, agreed; I will replace all the relevant build paths with TARGET 
versions of them.

