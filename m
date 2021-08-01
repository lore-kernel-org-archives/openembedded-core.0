Received: from mx0a-0064b401.pphosted.com (mx0a-0064b401.pphosted.com [205.220.166.238])
 by mx.groups.io with SMTP id smtpd.web08.3830.1627792319540812377
 for <openembedded-core@lists.openembedded.org>;
 Sat, 31 Jul 2021 21:32:00 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="body hash did not verify" header.i=@windriver.com header.s=pps06212021 header.b=Lz3cgtlP;
 spf=pass (domain: windriver.com, ip: 205.220.166.238, mailfrom: prvs=3847f41f60=kai.kang@windriver.com)
Received: from pps.filterd (m0250810.ppops.net [127.0.0.1])
	by mx0a-0064b401.pphosted.com (8.16.1.2/8.16.1.2) with SMTP id 1714PHUW021776
	for <openembedded-core@lists.openembedded.org>; Sat, 31 Jul 2021 21:31:58 -0700
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=windriver.com; h=subject : to : cc
 : references : from : message-id : date : in-reply-to : content-type :
 content-transfer-encoding : mime-version; s=PPS06212021;
 bh=rjJfbW4DOku2CxP/cV9BHjtAtAKEqoIKI4c0xgEqVek=;
 b=Lz3cgtlPly6oygLL1CyzHA3txw4dgZ43DbvjONAQrWehLI1Y5ERviwjUwpV/r825aZt2
 HmmuicWT30+WprFeUzpAPBRxmIWeu6DLYKlsMYJevnG74EERA1FGBGQPfvXOz3dyO1fJ
 5DPqo16bh8+tESiaq4r0SZSA5DnBndkbeczhL6RXqsHn/Ah0MEy6fjSoU2HCDoy9Mg9v
 g9biIMJtcBes1repEPmLifH9xpk7zbjC/72PNJSUOh/7u5hERMBPHbDJ9L7qOxjL3YUD
 95XsCeQcSUWKuwo9+swpZ9rk21oTe4Q93jcCHRQ3ue3HlurArcUjQCphgA+V6c2qzKMV Uw== 
Received: from pps.reinject (localhost [127.0.0.1])
	by mx0a-0064b401.pphosted.com with ESMTP id 3a51t30fae-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT)
	for <openembedded-core@lists.openembedded.org>; Sat, 31 Jul 2021 21:31:58 -0700
Received: from m0250810.ppops.net (m0250810.ppops.net [127.0.0.1])
	by pps.reinject (8.16.0.43/8.16.0.43) with SMTP id 1714Vv1Y030443
	for <openembedded-core@lists.openembedded.org>; Sat, 31 Jul 2021 21:31:57 -0700
Received: from nam11-co1-obe.outbound.protection.outlook.com (mail-co1nam11lp2170.outbound.protection.outlook.com [104.47.56.170])
	by mx0a-0064b401.pphosted.com with ESMTP id 3a51t30fad-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Sat, 31 Jul 2021 21:31:57 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=JUIBJkNAtdLlMKkUH6NAufj78wm/d9Fflw0veUzTsd4WqCV84n2atSL8ezQprHdzXDBSRQIVXF0PlIcAQzcSuoWvkxuerwy3ybTDY3FOa2D6jXGMu6DuL7phteB+9ELmPG/VpIUj47IDbCJwm6cZyamstI+KttUpodBznRBlrgP0tzt3njt/63Xaq6xVrUInoexhl4rEtA87L+bH3Dcv9JsjJm19KfLizE8TUswAd5yypdTknFy3Z1upu51KCNCWqIbXF8o16gUNHaiojJcGJzoQ7e0nxAoR1oLsUVIq71sEa5lrxE/TR0az4ELDmt4aRHFqyDvIpdGEcg9nUEpT4w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=rjJfbW4DOku2CxP/cV9BHjtAtAKEqoIKI4c0xgEqVek=;
 b=nZgLrnTHZ751E5ePza2EYuC5AIcng7jqqVJQMcl6QSy0Y5pvPHZSFF30hagb9O5ts1gu04SX8QziPedfkHhA7uIIMUdswPCQX+nwrh0jQHo/lx+zvnm26YK0aK/pzN06meuc9dLBOm+LNwJjyr2NiSTAF7gW1jYzJ1OTMec3OmTt1BoQOrgdFSm6LSTrZZ7Je4stD7QpjA/7yBOdn1U14u91JUN7upSZkIYf2cZYxrZiz6QJXZkBcxOG9FdS3h8EOuZXoI9YMQvwhFIXgx1IXCZWCk6aD8L48+SnbrTJQHZEAQoGxabshRHAsyz70CTrgGcSDoXTfhjI8YbFgHhP6Q==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=windriver.com; dmarc=pass action=none
 header.from=windriver.com; dkim=pass header.d=windriver.com; arc=none
Authentication-Results: windriver.com; dkim=none (message not signed)
 header.d=none;windriver.com; dmarc=none action=none
 header.from=windriver.com;
Received: from CO6PR11MB5651.namprd11.prod.outlook.com (2603:10b6:5:356::20)
 by CO6PR11MB5588.namprd11.prod.outlook.com (2603:10b6:303:13c::15) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4373.19; Sun, 1 Aug
 2021 04:31:54 +0000
Received: from CO6PR11MB5651.namprd11.prod.outlook.com
 ([fe80::396d:8a2a:b789:55b7]) by CO6PR11MB5651.namprd11.prod.outlook.com
 ([fe80::396d:8a2a:b789:55b7%5]) with mapi id 15.20.4373.026; Sun, 1 Aug 2021
 04:31:54 +0000
Subject: Re: [OE-core] [PATCH] python3-pytest: fix display version info
To: Richard Purdie <richard.purdie@linuxfoundation.org>,
        openembedded-core@lists.openembedded.org
Cc: yuanc.fnst@cn.fujitsu.com
References: <20210730033855.23941-1-kai.kang@windriver.com>
 <4befba5f96824bce16d6d67c4e525b5d5ecd84d3.camel@linuxfoundation.org>
 <d8f91065-ff81-03bf-13b0-71116b3116c4@windriver.com>
 <45cb627bf3384a05b77ccf21889e04fcf6c00ad8.camel@linuxfoundation.org>
From: "kai" <kai.kang@windriver.com>
Message-ID: <89c801b8-7488-9be3-5ae1-3072b078dd78@windriver.com>
Date: Sun, 1 Aug 2021 12:31:43 +0800
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.8.0
In-Reply-To: <45cb627bf3384a05b77ccf21889e04fcf6c00ad8.camel@linuxfoundation.org>
X-ClientProxiedBy: HK2PR0302CA0005.apcprd03.prod.outlook.com
 (2603:1096:202::15) To CO6PR11MB5651.namprd11.prod.outlook.com
 (2603:10b6:5:356::20)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from [128.224.162.151] (60.247.85.82) by HK2PR0302CA0005.apcprd03.prod.outlook.com (2603:1096:202::15) with Microsoft SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4394.8 via Frontend Transport; Sun, 1 Aug 2021 04:31:53 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 6571d9bd-e020-488a-ea76-08d954a54a65
X-MS-TrafficTypeDiagnostic: CO6PR11MB5588:
X-MS-Exchange-Transport-Forked: True
X-Microsoft-Antispam-PRVS: 
	<CO6PR11MB5588702B363607E00FA1288995EE9@CO6PR11MB5588.namprd11.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:9508;
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 
	JmSRfmeXUU3e/pGo6JhfHyMn6bWbcJd4ozNkS+6S1zyx9of84v89MgU0NP2IIae3TeMeJFgF2R7hnKjPIs+1y7Ybh+kt4FrxgJn1uwGeV4Q2+tFeGWe2dTOE+qI4O7s/EekXEXSJfpeV4riPyL+fSJlW+StlfoOkmfLUZHq7vLr20afId6iNvwj062WPKHGCW+9DUkr5peTIode95o6jGl40AfN16aIS9H+CzF26oYrSoPby+blNaJAfIhSoxnORjt1SOCJcc2vF6YoeA2+IuqMnqJT0ATooh1U9A5hNGlBDu9z8Giegg/xp0SAKW9U24Ag6QxSGlzeEeBgnC7OrgFH4D/GDpZP77WT5xYLBGKU11GzcUjNU4JDG4GL5qCF9t8GDrosIMose9CzDgC3zu8VjSGVLSWt6ploqOtWirhfUEDu2jwdzjwUgUi6cdYuflhRq9gy4nDRD2aetCG+Tx8/fApzrqRHWANkHdX8gIPMwdA2t5me3vtqckb5K+sDwtJivSk+OseT/HJfMTLlbwBwgikFovnbJKFWLTc7+UtUhZ9kC2ltyea9t3zG15p0H7AFVHu0y8oDUM0vr8SikiNZyB0/LEuaxjSTlMff9CVeia+T8vm+LtM3/ysoZpg5mTC68nbBZZn0/fxQC3A9FOU/tDnE7QKuMwvxKy4FW+xQiEf3t50u5uiuD1fwwcEbXhPXfI4MeA5I8C20i3W/3e+xJibMRE0HIdelyd4ZZly4ZfKMuBZQ/D4gfZSmp4E8iIQiS5Cb5eJMrgQU9cRA9BVxxnV4eLx3v4mnXWzG2sJg=
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:CO6PR11MB5651.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(4636009)(376002)(366004)(346002)(136003)(38350700002)(38100700002)(52116002)(2906002)(36756003)(8936002)(83380400001)(4326008)(6666004)(8676002)(31696002)(5660300002)(26005)(16576012)(6706004)(66556008)(53546011)(66476007)(508600001)(66946007)(6486002)(186003)(31686004)(956004)(2616005)(86362001)(78286007)(45980500001)(43740500002);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?utf-8?B?eWM0cmhUQ1lscTNrc0RXdnBFUFh0V3Q5OUc1ODhiRUhPR1JGWmtVTUNFUWcz?=
 =?utf-8?B?OExVSnIrR1JZN3R3Ti9XY0FMb2V2d2plZkg4c01iZytuYUNwZVNPdEZtU1Rh?=
 =?utf-8?B?Skg5YldrbVB0dFpPTTFsa2oxQjlHenhMa2dZYVNwRU1YVDFyUDRybmpscDEz?=
 =?utf-8?B?dnkyM2ZXZ3hSTStRM0Q3OERXVENrb3NSUFNKQ0ZDVjdTajQwWk9mQzhZZE03?=
 =?utf-8?B?amU2UkJyTEcvV2Q3MWZUcEltSytLWVhsNlBJbUdPL1lHQ1oyQ2FkYSt1dzVE?=
 =?utf-8?B?Umw5ZWRjVFZuM002SFFkQlZ2ZDlOb2tnS3huM3RsSTRpQVRJTlNCNVo4NCtG?=
 =?utf-8?B?UTJxeTd2eHlnUjl1TUJaTEp1STgyYkdhYkgwaHBFdzBrRHQvTWs2ek1raGxz?=
 =?utf-8?B?QlMyZTY4RkdreUF0VDVoQkJ2WG1pVnhzRHZDZk9Bem5DR1VCZVNwbUJCYTZv?=
 =?utf-8?B?dVZZR0oxSWM1bERLNVVaVFJVbGtjWklSSWJpY01qU1FmZ1lYQnJjZHlGL0N5?=
 =?utf-8?B?MHMxZjd2VS80anpKY0tSQk1IQmRlZjVMVnFyZ1VMaHk3ZU9PR2t6Tm9xc2VF?=
 =?utf-8?B?ZTRidTNGY0RhZGVMQVZyWWtyZ2FLV21iR1lBZkdtc1QyZmdxbjhsdFdUdnJm?=
 =?utf-8?B?b2ZsdEFuZnNNWFB4OW5qWThBOFpHazJOaDVhM1lHU0FhZHJDR1FyaGFMVkdE?=
 =?utf-8?B?bXpCZE5zL3B6Z2tWWEFCUExSZzdLOTNGdTlKTEhCeEUrQksxY0Y3aU9DYnRw?=
 =?utf-8?B?dXJWSnQ1RW40cmN0NlBiZTFtdTNEaUhhb0ZYckY2QnR6RlBFT1VPNTNPTzR1?=
 =?utf-8?B?L1lOL0t4NzhRcGpMVHlRL2Zldzd5NnNwamNhRVN0NHJFaGxTM2FHQ1JWSUJ4?=
 =?utf-8?B?dWdHT00wY2ZGR3JOZjZ6ZFg0TFFXcWtReUNkS05kV3pDQjZJeGl2eGQyY3Zn?=
 =?utf-8?B?TjdOdXcyVlZZT0h5Z2NJamdwSEhtdVFocDArOVVWajFESmtsMVhuaFlSaGE4?=
 =?utf-8?B?RVJ6NzZ4LzZHWlNkV1B6SlNJcUl3enJjSUdqREJvcHdBeWw2MUEvcGFxbGcw?=
 =?utf-8?B?R3RTOXBOZjJmVGxwZ0V0MmluTTZPeWRTdkRXSDhrcmF3U0tEVjNlY3hRRlh4?=
 =?utf-8?B?MzB1RVVWcmNKV0RkV0ZPZzBqVlJMSXZqeWtCRnpDMFJqNlhWZ3hqWHpady9R?=
 =?utf-8?B?bmhhT3JFa0dWbkEzRjFwT1Z0OGRDb3lyUk9KR0xEc1VDMlRYNmZHZDYrSWsz?=
 =?utf-8?B?WXFQbHJKVUhwYVVyODBLSmI5OVhVSTV6ZEFZV2g4MDRCQzltMUl2aUhrMk8y?=
 =?utf-8?B?NytJMGkyejIrSlA2UEhiM3Fic3dWbm92V2RIQTRoZmpnZlFRNkQ1Sm0rcnR0?=
 =?utf-8?B?eVlQcjlhekFYYk9hbk1PNHdEeTVOelBKNTdvLzYxQUxZczhsL3A5OE03Nm1i?=
 =?utf-8?B?YWVHMzBhemZhUytQbnJmdTFtcmRuYkNDamdZa2VhSTF5YStscXZ1YWEzdTg1?=
 =?utf-8?B?cWVnRGVHOGxHUUYrYkZtS1Ezd3Bjem9EajBOcFpaUUxvdHoxOW95OW1BQXg5?=
 =?utf-8?B?cnBMaG4wMFpoYjM4eWgyWFZXSndsL3NrMXlXdms1b0FnQ0FWczVVRlJKVllu?=
 =?utf-8?B?OEhVN2w2UW1sdTAvbzlKVm9qZ3o5Q3RkMHkvRjFZS0l2anBiV0Nub1FCMGxo?=
 =?utf-8?B?cWhhMS9zb0hKL2F6VTI4bk9naTg2NnN4RjRPdGFPdHU1M0JZem1ObXBUNGFh?=
 =?utf-8?Q?2Lo5biQG7gg+8+cpo87MT3Mh1BQlp4/OTsnqwPI?=
X-OriginatorOrg: windriver.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 6571d9bd-e020-488a-ea76-08d954a54a65
X-MS-Exchange-CrossTenant-AuthSource: CO6PR11MB5651.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 01 Aug 2021 04:31:54.7929
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 8ddb2873-a1ad-4a18-ae4e-4644631433be
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: n3seCyp3M1cAQkn1JYTk6hm4JNm6Zu08TaY0fsrwWmTsFd7KaxD8T0kjiZs+DQDZwRZXTwFiDljNfLBBXRv4zA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CO6PR11MB5588
X-Proofpoint-GUID: AqzO1OaOHG5b8Z1xrvCimZtJwXGA6Zbn
X-Proofpoint-ORIG-GUID: nbMUhk1VV_aYJFMUU3WT6XEMItJop8Ji
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.182.1,Aquarius:18.0.790,Hydra:6.0.391,FMLib:17.0.607.475
 definitions=2021-07-31_05,2021-07-30_01,2020-04-07_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 impostorscore=0
 suspectscore=0 spamscore=0 priorityscore=1501 mlxscore=0
 lowpriorityscore=0 clxscore=1015 malwarescore=0 mlxlogscore=999
 adultscore=0 bulkscore=0 phishscore=0 classifier=spam adjust=0 reason=mlx
 scancount=1 engine=8.12.0-2107140000 definitions=main-2108010030
X-MIME-Autoconverted: from 8bit to quoted-printable by mx0a-0064b401.pphosted.com id 1714PHUW021776
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: quoted-printable

On 7/30/21 7:14 PM, Richard Purdie wrote:
> On Fri, 2021-07-30 at 19:03 +0800, kai wrote:
>> On 7/30/21 6:11 PM, Richard Purdie wrote:
>>> On Fri, 2021-07-30 at 11:38 +0800, kai wrote:
>>>> From: Kai Kang <kai.kang@windriver.com>
>>>>
>>>> It does not show correct version info of python3-pytest by:
>>>>
>>>> $ pip3 list | grep pytest
>>>> pytest             0.0.0
>>>>
>>>> Remove 0001-setup.py-remove-the-setup_requires-for-setuptools-scm.pa=
tch
>>>> and depends on python3-setuptools-scm-native to make it right.
>>>>
>>>> Signed-off-by: Kai Kang <kai.kang@windriver.com>
>>>> ---
>>>>  =C2=A0=C2=A0...he-setup_requires-for-setuptools-scm.patch | 36 ----=
---------------
>>>>  =C2=A0=C2=A0.../python/python3-pytest_6.2.4.bb            |  4 +--
>>>>  =C2=A0=C2=A02 files changed, 2 insertions(+), 38 deletions(-)
>>>>  =C2=A0=C2=A0delete mode 100644 meta/recipes-devtools/python/python3=
-pytest/0001-setup.py-remove-the-setup_requires-for-setuptools-scm.patch
>>>>
>>>> diff --git a/meta/recipes-devtools/python/python3-pytest/0001-setup.=
py-remove-the-setup_requires-for-setuptools-scm.patch b/meta/recipes-devt=
ools/python/python3-pytest/0001-setup.py-remove-the-setup_requires-for-se=
tuptools-scm.patch
>>>> deleted file mode 100644
>>>> index 1abd531c62..0000000000
>>>> --- a/meta/recipes-devtools/python/python3-pytest/0001-setup.py-remo=
ve-the-setup_requires-for-setuptools-scm.patch
>>>> +++ /dev/null
>>>> @@ -1,36 +0,0 @@
>>>> -From ead04f2da75efeca3369feff6161ea4a8baecbc9 Mon Sep 17 00:00:00 2=
001
>>>> -From: Yuan Chao <yuanc.fnst@cn.fujitsu.com>
>>>> -Date: Wed, 28 Aug 2019 16:12:27 +0900
>>>> -Subject: [PATCH] setup.py: remove the setup_requires for setuptools=
-scm
>>>> -
>>>> -The setup_requires argument forces the download of the egg file for=
 setuptools-scm
>>>> -during the do_compile phase.  This download is incompatible with th=
e typical fetch
>>>> -and mirror structure.  The only usage of scm is the generation of t=
he _version.py
>>>> -file and in the release tarball it is already correctly created
>>>> -
>>> Recipes should not be downloading during do_compile. We need to fix t=
his in some
>>> other way, we can't just remove the patch.
>>>
>>> Cheers,
>>>
>>> Richard
>>>
>> Hi Richard,
>>
>> It calls pip to download the egg file for setuptools-scm. But pip is n=
ot
>> a dependency and does not exist in sysroot, so it fails when remove th=
e
>> patch and
>> "python3-setuptools-scm-native" is not a dependency:
>>
>>> DEBUG: Executing shell function do_compile
>>> WARNING: The wheel package is not available.
>>>
>> /buildarea6/kkang/Yocto/build-qemux86/tmp/work/core2-64-poky-linux/pyt=
hon3-pytest/6.2.4-r0/recipe-sysroot-native/usr/bin/python3-native/pytho
>> n3: No module named pip
>>> Traceback (most recent call last):
>>>  =C2=A0=C2=A0 File
>> "/buildarea6/kkang/Yocto/build-qemux86/tmp/work/core2-64-poky-linux/py=
thon3-pytest/6.2.4-r0/recipe-sysroot-native/usr/lib/python3.9/si
>> te-packages/setuptools/installer.py", line 75, in fetch_build_egg
>>> subprocess.check_call(cmd)
>>>  =C2=A0=C2=A0 File
>> "/buildarea6/kkang/Yocto/build-qemux86/tmp/work/core2-64-poky-linux/py=
thon3-pytest/6.2.4-r0/recipe-sysroot-native/usr/lib/python3.9/su
>> bprocess.py", line 373, in check_call
>>>  =C2=A0=C2=A0=C2=A0=C2=A0 raise CalledProcessError(retcode, cmd)
>>> subprocess.CalledProcessError: Command
>> '['/buildarea6/kkang/Yocto/build-qemux86/tmp/work/core2-64-poky-linux/=
python3-pytest/6.2.4-r0/recipe-s
>> ysroot-native/usr/bin/python3-native/python3', '-m', 'pip',
>> '--disable-pip-version-check', 'wheel', '--no-deps', '-w',
>> '/tmp/tmpovfcfgaq', '--q
>> uiet', 'setuptools-scm>=3D3.4']' returned non-zero exit status 1.
>>
>> After add=C2=A0 "python3-setuptools-scm-native" to dependency, it meet=
s the
>> requirement in setup.cfg:
>>
>> setuptools-scm>=3D3.4
>>
>> then it does not call pip anymore to download any file.
> That makes more sense, thanks for clarifying. Could you update the comm=
it message
> to make that clearer please?

v2 will be sent.

Regards,
Kai

>
> Thanks,
>
> Richard
>

--=20
Kai Kang
Wind River Linux

