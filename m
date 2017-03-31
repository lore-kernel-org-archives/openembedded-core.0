Return-Path: <mkelly@xevo.com>
X-Greylist: delayed 1082 seconds by postgrey-1.34 at layers.openembedded.org;
	Fri, 31 Mar 2017 23:21:32 UTC
Received: from NAM03-CO1-obe.outbound.protection.outlook.com
	(mail-co1nam03on0067.outbound.protection.outlook.com [104.47.40.67])
	by mail.openembedded.org (Postfix) with ESMTP id A068A71A8E
	for <openembedded-core@lists.openembedded.org>;
	Fri, 31 Mar 2017 23:21:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=uievolution.onmicrosoft.com; s=selector1-xevo-com;
	h=From:Date:Subject:Message-ID:Content-Type:MIME-Version;
	bh=QOmBmV/vZptEGzMfOquEOCjTvcxBoHMeh+rckamL9o0=;
	b=Ze+SaJrOxITMjPFU0riKJWYtQGis41+ndo2QYu1M0Sn/XAbXM/By5SEY9N/yBsWIMQJopLjwqDI02e4AbGrOS7BFMxZvJRJiKDSj2esm2Ms0Apkb3/8fI2sq+RlQa3rRd+RdTVfvW2V1Ip2QDYc/5pbXIKzD3Chl8a05RWeL2kE=
Authentication-Results: lists.openembedded.org; dkim=none (message not signed)
	header.d=none; lists.openembedded.org;
	dmarc=none action=none header.from=xevo.com;
Received: from [10.0.1.79] (65.122.179.226) by
	BN3PR01MB1399.prod.exchangelabs.com (10.163.36.154) with Microsoft SMTP
	Server (version=TLS1_2,
	cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id
	15.1.1005.10; Fri, 31 Mar 2017 22:48:36 +0000
To: Khem Raj <raj.khem@gmail.com>, <openembedded-core@lists.openembedded.org>
References: <0eeb55ac-a3c8-95c3-a5e6-4cc94f963427@xevo.com>
	<04df66a4-7305-12f9-8398-66bb2a09a796@gmail.com>
	<3b7a87b8-05ac-12d0-5e83-95aed03d7dcd@xevo.com>
From: Martin Kelly <mkelly@xevo.com>
Message-ID: <7c5867be-485b-1d3e-c2bf-ebf4e0fa2da0@xevo.com>
Date: Fri, 31 Mar 2017 15:53:03 -0700
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:45.0) Gecko/20100101
	Icedove/45.6.0
MIME-Version: 1.0
In-Reply-To: <3b7a87b8-05ac-12d0-5e83-95aed03d7dcd@xevo.com>
X-Originating-IP: [65.122.179.226]
X-ClientProxiedBy: DM5PR1601CA0017.namprd16.prod.outlook.com (10.174.111.30)
	To BN3PR01MB1399.prod.exchangelabs.com (10.163.36.154)
X-MS-Office365-Filtering-Correlation-Id: b1211af6-26ad-4e4f-5fb7-08d478881164
X-Microsoft-Antispam: UriScan:; BCL:0; PCL:0;
	RULEID:(22001)(201703131423075)(201703031133081);
	SRVR:BN3PR01MB1399; 
X-Microsoft-Exchange-Diagnostics: 1; BN3PR01MB1399;
	3:qldrzR7b2gLfmli5dS6PbM4XeExk12q9srDKUA0QKnQkGIqDaayWppWY3cEfa9nXIcF8WPAsJRS2RmdYmNJLmbN3rGKjMWK2KkLFRXO0aVp+uW5nuOhn8+mu5zBT5X+KsPYViMAGVyNMdWtQOkw6rI7n9dRaRniHYKYJvC3myGVVQfKagEbzoVlMpU5NvgCNcHFSp0KZAjbbJESMu9iQf0EZOF2xk8+bBOeTRNjjQHFv5F5YGxejy5rhT2mWI/E7QqI8w30UekmFUpkXePVJp7Dj6qdXOfPpk7gmdbZBhbSqVBfuVxmoEuM6OspMdW1PvU6G+ByRyrs1v7HazT1AWw==;
	25:OaGIBMV2RS/PPBz0+KsdbfKl2t/rTmJxat9jCGwWO7RhYUtQe9IESMLqseds+JUY9ZiNHDprVuinoeRbyPLyz3YxbWKvGzoCY8G65W/PtsgFJhZPP9lnUj9yoE8mlsfSJdQ0umWJuX7kZwkWSVFfKeSe1uU1cMaTgZBTNrZmf9r3wBVVjf9THpwEG8b3T+EVVa+C24WikWuf/dqv607jd2Dl9qerICXQlpiKmTnDzl2mSE5UlnEPhT5fSc1zK86v10cI95dsI2PfRk5ZRqh5JHEY2/kyweiSYYKDULNz6LnoS37bjvtgKHARTu1DPMNTL7PEDfU3e+uqkw8VXl5JuT0dP2ual0nrwqg2Tu2y8R+9KsIld7NdjdhhB0k08Ya5ALra8pylkaleD1H3Woq7WTzpwwJuoqKwO0aBgnU1rhGrgh4HLb3O3FfLZg41PiKw8DyEIWQ3DxnWaDsRaCgcgA==
X-Microsoft-Exchange-Diagnostics: 1; BN3PR01MB1399;
	31:W5tP0NgcVtmIgzXMhUldKgdLNW/acw7wRyJobNp0aTlmuSyIIK+xa25vrp+dD1J0nDIzivwtwFe2ex1JWS28gF/1dtL+/7EnHZjIDFO5PiujWU6dgGFZFOPWpa3oFuKmRcmBSSQaCW5RMNxgi9AfmxyEdgqaQJh/1IJ54mWgXYMN2wW3MmpIbPC8rrO1long1b+SKLLwiM18sLzi3yc4Defcd5j60C9c1I5T8JCq/zDL+y2cx8KnBB0eiGU/B71D7Cc2h8HvL7zBnb5kXxG6aA==;
	20:ssA3C922m+CH5Pzit8h/hMidjyCrP7xA1MY0eJJe2AzsMK147rMBZpBu3Cf8nY8PRkc1MwjKV2yZAoybTKfM3fUlHlf7Vvg6HzIFGzhm6CjDdtTC7CNZkKcrcVLDAUmWS9GXmD5krX7yzFBb1Jg+B96h5ZJX9k1EglzaODHPHVwujV0DndCRBj7xsIepCVIp2OCEr8B0zGGlOw6Hzp3tDL/maAtp+Yw3AGSDEcE5QmuyNUt2tDqd02QTLAhM7mFFOprOgjKT+Yb8jQYe9tB+FvuxVlWujmLz2T01TvcVgD0evBFFx/LoYUKeM4hhtLUWknzZwtxOrVy5Z2V/KHD+8A==
X-Microsoft-Antispam-PRVS: <BN3PR01MB1399BFFEBFF86B6E292CF3C3AB370@BN3PR01MB1399.prod.exchangelabs.com>
X-Exchange-Antispam-Report-Test: UriScan:;
X-Exchange-Antispam-Report-CFA-Test: BCL:0; PCL:0;
	RULEID:(6040450)(2401047)(8121501046)(5005006)(10201501046)(93006095)(93001095)(3002001)(6041248)(201703131423075)(201702281528075)(201703061421075)(20161123560025)(20161123555025)(20161123562025)(20161123564025)(6072148);
	SRVR:BN3PR01MB1399; BCL:0; PCL:0; RULEID:; SRVR:BN3PR01MB1399; 
X-Microsoft-Exchange-Diagnostics: 1; BN3PR01MB1399;
	4:NAY0EqvkoCbcA4ioxan2f35Wr3PVNbwjhFTQ0DrJMpC+3BZlemPx0uz4bTIbnsb1hutu9iqJGZTfmzH9Vtdxgt2knUyOUl9q1qISgLf3yeP3Enkg+k1aRQ0Cf1KVqQqkbrxO4bJeQiEcxEuGf0Lvd5l4BknJY4XLOjplgJER8ABEXpX3yWqbbIhwEF6tVZO1R2eKfWdvCZEkNuBbqE5TkHPGIXdwoyozDLHi51fMfUM55VXJO8j7pklLie1OZ4tLsXf+DgsT/HsX3TckmVnaGSSg+Vv8X4n6TxZQyfKDq9zV7WDELeZ+Fu+08UslJCbnXXoe5SDI2fAuhocFLmyTUhzxAGxKHsdpnuYPq/VxgLFwb+qG6GRTib8uqoVF2FYLTGgmlmCUJ+6fcr5u645SQx03Fi4C0tJzM+wg9mAHQ66uz7CYy+QaBdXsiCsgYzYHoi2+nkZi1UcV+qX01eohsYI4lG/EEvW4ngH4qTpbbWSRlKteJTDXnMyctB0N7trciPH8tBMkD72+r96/9g809YkLnH65HOHEGep0JmR5Oe7cGxxnzDAcTFyG91mbA3EAsFeDDb4kunmpkpiTyzf0W+xaSGgf/qqmTAgLW598GrE5ljWtCUar1sx50mXw5ajp57mWvNTJwOZsas4SYJM9WaEJvQDIUyhVfSWcH/RcJhm9cFe1TLQU89hD6oqpkP2PdnMUqjQulEwWq+1tWsyyBA==
X-Forefront-PRVS: 02638D901B
X-Forefront-Antispam-Report: SFV:NSPM;
	SFS:(10009020)(4630300001)(6049001)(6009001)(39400400002)(39410400002)(39450400003)(39830400002)(24454002)(377454003)(2906002)(83506001)(38730400002)(23676002)(189998001)(8676002)(81166006)(66066001)(3846002)(6116002)(31686004)(53546009)(25786009)(42186005)(230700001)(53936002)(6246003)(86362001)(33646002)(50466002)(31696002)(47776003)(7736002)(5660300001)(229853002)(50986999)(305945005)(90366009)(2950100002)(36756003)(6666003)(76176999)(54356999)(6486002)(77096006)(4001350100001);
	DIR:OUT; SFP:1101; SCL:1; SRVR:BN3PR01MB1399; H:[10.0.1.79];
	FPR:; SPF:None; MLV:sfv; LANG:en; 
X-Microsoft-Exchange-Diagnostics: =?utf-8?B?MTtCTjNQUjAxTUIxMzk5OzIzOnM0b0Q3bmpjTUdwM2FlSlhGbnE0U1pUZWNE?=
	=?utf-8?B?eTlodnp5S0h6WG9GOW1uSWM2MTNpdCt1SUNFcFJObnhYQ3dKZVVGM3lWeG5y?=
	=?utf-8?B?aW5ieG1NSG56NkVtSzRodUNYeDEzWndFSlZYd25PTVlMeHd1RnN6WHJya0dI?=
	=?utf-8?B?dmpXWXpJQU1MSVdVT1BOS2JHQ3FMMVpxOEhOT3NvcHF2dTZGYmJlQW0yK1Qy?=
	=?utf-8?B?elJiVlliNC9UR1hzRWhmdExDMEp0ZkFDTkNHYjFNY1F0ZWE4RS9OdERVOG9K?=
	=?utf-8?B?T3JqK25seDRXdWtNUGVsTlBCYmpkZHI3K2tvT0VIT1VJenkrOWFMY244S3o2?=
	=?utf-8?B?anVLZUdnTmRVN2N3THZON2lqU3dCM3puUktHc1hYV2FDZm9sZWdUZkg0MjBK?=
	=?utf-8?B?SjdxcG0wb2ZxZ0FJWmZnYUMwd1MzelZ3MEdPL0YzWlJCWlY0TUYwMVBGazl0?=
	=?utf-8?B?RkJKZlRlYzIrMS9kM3R5bDJLM3U3aldlRzhaWW82Rlpxd3BaU00vU0ozNDUw?=
	=?utf-8?B?TG4zSjBoQVpMTHMwSVBlTmdwUlBINzJLTjRhUHVta1J5Q2I4Q2NOWk1XNFcx?=
	=?utf-8?B?K29rWk5vbGhlOEgyMnhFTGhjaUh6d3ZCcWtiU20yRjZtUlUzdVAwUXNFU0xI?=
	=?utf-8?B?Z3hMNGdjRm1NTFRJNXNXUFMyM1o3bEtQQ1BJTWhsQWhaT2xaRnZiZ1NPWGhu?=
	=?utf-8?B?RlFFUXNpYWo4Q0dCU1hLNFByYm91VW1WL2NRZHFZMFlaV2tUbHppWHBDTk9i?=
	=?utf-8?B?azBjQWErWnFSZGJ2blBaZkxCMlR0TW83aWluM3JNb1grMmdxZUhNNWR1ZE1w?=
	=?utf-8?B?cEJiR0NpSUhsdTFVaU4xUE1mVGNwdUtFWE9zN1hJWXZFVk1CM2IyNWdISlIz?=
	=?utf-8?B?OUNReXlHWHRMNHFlSzR3MEpNV0RkOFQ3RVpCcnRlU0d2SGkwbGFKNVZSY2Rs?=
	=?utf-8?B?Y2pvak9VUHBNYVdleUxFNy9qZ2ltVVkyV3pidlZvN3F4Um1GVjUwUzRvczBI?=
	=?utf-8?B?OWcwUE5NekZPZnF4NkNWL0xUYUV1dlVGSG16QjJmTFlVT3docmVoakNzbGNm?=
	=?utf-8?B?cXdqK3lOb3AwYk5VYkhKMkwxVFFCdE5MN3Y1ZUlJajJHcTJCWDk1VGtqNUZj?=
	=?utf-8?B?bXljbGtMa1k3WEYzem5yL1N5eDNXRElvSWNJMlR5NzJoUDNyL3hYUHpGRlMz?=
	=?utf-8?B?MkJ1LytMOVF5R2RBM2drdkV6dEJ4RjhOMU5Nb1FoNnRueEtNNFluekhwTXpJ?=
	=?utf-8?B?WVVJdExQTzMwVzlkOEVOUG9NbGQrbXpkaWd2RVNuU3BReHVPK3BHcjZMUWFQ?=
	=?utf-8?B?N3U5VzVUbWtjclBpV3FtQ3lybnVVQXBzTXJQMTNUQ3BnUUlzRTFjb1NVTzk0?=
	=?utf-8?B?WjFCcnZkZjgvY0JnQlByYWhudDV0eDhzUHh1UFNnc1g3MXR0RzdTVy83VDdD?=
	=?utf-8?B?SjNzNjJvYTF0Z2k3M0NxM0Q3UkJJeS9UT1Z3eEd3TmNOeXRJVHFXd0ZjT2Fm?=
	=?utf-8?Q?QR091OEDHKf/zUFx3YwRwI6OsRCzAPso8EGd6Wa75V7KJK?=
X-Microsoft-Exchange-Diagnostics: 1; BN3PR01MB1399;
	6:NCJVTt9YzV/lAsFAzwEwaN3VYSdhHW3+5aKpFGGC/lnpzs0Sn8LwDEFpFQ84uSWsk/qQ72HbXXa+wsGzOpra564KiWZO5A47wDTl55umQcKnqCsj+Ecvgrf0bgd4pWNlT7QHBqlOC8MaLnnc59oSV6+x2RzLyEkpxB0ollD2lRP7XkuPm1JZ0ATNvKtek4/3dgFBlv7g6cX9JF4YC9MZM+6mU9DULEYeKdWQJRhkW0gX61IEzGynzYchSDHp1mtaW7hHpfTdI3mRPFJc5T3B6Iedr8QdIzQWMr6OqPfBDLWMLWEGhsZa7DNH0/eszYdoV/YG3sPSOvMNei3PeWlAMnjxpth4KeY9EilI+tbfu781Ceq6JW/7aWTZtE5JIVP4QrVJlJd2IXO1aaTJnJaqNA==;
	5:bfwibp5wazfUib9aikShXooaNQBWxM2gAML7/vL0bTQKslD+n/CcwIT2TmjkfiuLXldvqijyZZNyLuEyX53IK6wjdP6aM8vk3ji+Zoz1O1QLQyKm2+HRjalREzDN+Mu2/ezrc7cqpuqSgzEBnZOJbl71L7NQevBsjTmUWrFSgDE=;
	24:SrOOwkq8gGvScMrPqfK07bFWIsJu4aP0IeLYVWy+zEeOQiXzeV6aJTXEEw71WbkNM/6lKJV3Wgsvu+xTSxcvEoGx7YkhXI6hmEkTMZ/j3FU=
SpamDiagnosticOutput: 1:99
SpamDiagnosticMetadata: NSPM
X-Microsoft-Exchange-Diagnostics: 1; BN3PR01MB1399;
	7:O23+0WMA/vU9eRSPTtwD4h0imFqKC54m4EG/OheJJCpfsshpXD5JWlzLwcxIDM40o3TY8GJUsJl4nPPsGiE4GXrhKcuJwj2tQCrYlymIkWsrM/mP8XlDViboUZykmDglFliNiR+rMyQwb9x/yy9fMMCZrlWo4JXbSCi8BBKacIoqSfVnlCJBbZsnwDHZYzl3R0ap8s8ZezcYZevxE2VuiffGtCi6XTtYGSTDo+HdOf6j8RciuvoYrufZG8+21wzUo931uYXyECHwJZSQzCeJLTkUu3r07FbpL1DcEgSpGPRipnBfsvd35kLt5WX6yglwm9gCAoZZXD3P4/8ZFoFxbA==
X-OriginatorOrg: xevo.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 31 Mar 2017 22:48:36.5321 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BN3PR01MB1399
Subject: Re: [meta-clang] oe-core and meta-clang llvm coexsting?
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
X-List-Received-Date: Fri, 31 Mar 2017 23:21:33 -0000
Content-Type: text/plain; charset="utf-8"; format=flowed
Content-Transfer-Encoding: 7bit

On 03/30/2017 04:58 PM, Martin Kelly wrote:
> On 03/30/2017 12:31 PM, Khem Raj wrote:
>>
>>
>> On 3/30/17 12:20 PM, Martin Kelly wrote:
>>> Hi,
>>>
>>> I'm trying to integrate the meta-clang version of LLVM 4.0 (used for
>>> recipes that need a newer LLVM version) alongside the oe-core version of
>>> LLVM 3.3 (used for mesa). I'd like some recipes to use LLVM 4.0 and some
>>> to use LLVM 3.3 and for them not to collide with each other.
>>>
>>> Right now, once the meta-clang layer is enabled, the recipes collide
>>> because they both provide llvm-common.bb. I tried explicitly versioning
>>> llvm-common, which makes them no longer collide. However, mesa then
>>> fails to build because the meta-clang version of LLVM installs
>>> llvm-config into the native common sysroot in
>>
>> merging all llvm-common into a single recipe might be good
>

I thought more about this issue. Absent some clever solution that allows 
us to unify the wrappers (which is difficult due to the issues I 
mentioned in the last mail), I think we have three routes that could 
work to at least allow meta-clang and meta-oe to exist in the same Yocto 
workspace without breakage:

(a) Instead of installing llvm-config into 
${SYSROOT_DESTDIR}${bindir_crossscripts} -- which causes collisions when 
meta-clang and meta-oe both try to overwrite the same shared file -- 
install into ${D}{bindir}llvm-config, and install the binary llvm-config 
into ${D}${bindir}/llvm-config${PV}. Recipes requiring LLVM will then 
need to depend on either llvm-common3.3 or llvm-common4.0, but at least 
there will be no collision or ambiguity which one gets used.

(b) Use a common wrapper in 
${SYSROOT_DESTDIR}${bindir_crossscripts}/llvm-config that does what the 
meta-oe current version does; just exec 
${SYSROOT_DESTDIR}${bindir_crossscripts}/llvm-config${WANT_LLVM_RELEASE}. 
Let the meta-oe LLVM 3.3 install the binary llvm-config into 
${SYSROOT_DESTDIR}${bindir_crossscripts}/llvm-config3.3 and let the 
meta-clang LLVM 4.0 install its wrapper llvm-config into 
${SYSROOT_DESTDIR}${bindir_crossscripts}/llvm-config4.0. meta-clang will 
have to use the second wrapper script because it needs to edit 
TARGET_CFLAGS and similar to avoid compiling target binaries using 
native flags (due to the CMake LLVM build which appears not to respect 
cross-compile).

(c) Use a common llvm-config wrapper in 
${SYSROOT_DESTDIR}${bindir_crossscripts}/llvm-config that does a 
hardcoded check for WANT_LLVM_RELEASE. If the version is 4.0 or greater, 
then edit the TARGET_CFLAGS and similar, otherwise don't.

It seems to me that all these options are undesireable, but (a) is 
probably least so.

Khem and others: which option would you like me to pursue, or do you 
have an alternate suggestion?

Thanks,
Martin

