Received: from mx0b-0064b401.pphosted.com (mx0b-0064b401.pphosted.com [205.220.178.238])
 by mx.groups.io with SMTP id smtpd.web11.22502.1627643011859722862
 for <openembedded-core@lists.openembedded.org>;
 Fri, 30 Jul 2021 04:03:32 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="body hash did not verify" header.i=@windriver.com header.s=pps06212021 header.b=mkRsLqUU;
 spf=pass (domain: windriver.com, ip: 205.220.178.238, mailfrom: prvs=38453940d6=kai.kang@windriver.com)
Received: from pps.filterd (m0250812.ppops.net [127.0.0.1])
	by mx0a-0064b401.pphosted.com (8.16.1.2/8.16.1.2) with SMTP id 16UAkmEx029341
	for <openembedded-core@lists.openembedded.org>; Fri, 30 Jul 2021 11:03:31 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=windriver.com; h=subject : to : cc
 : references : from : message-id : date : in-reply-to : content-type :
 content-transfer-encoding : mime-version; s=PPS06212021;
 bh=MJ+t3nJa3PwZxHqvDYjuJSXqOEl/rxwHJ3cPT4Fs9Xw=;
 b=mkRsLqUUhwT6Cf4b2PDpA8uFFIpb2DDPq3lQnsb5EqAdUQWDu76qLz9Q76la8J8KF/Uh
 EJFl69gJzzZQKtPpenWgMsIEshqlVVrnU2o9Pq/xASrAndLdlozuO0mqdwFrBN12AwUs
 hJ2HFwzv7y8o07GlZvsg5ddDsMEzkCG0ljcbGyV1alEWCJEULlJDw1+F3IO2YdYJI1VN
 ywdAUiGZdX+bK9Lnb4PAL8x1bAIo3UEx5KNC3V6ejHv/zJWyK8F9UAE300GIuLHZ4mEI
 Od9+xNxnMQj8b/I3XE6G0J+r8Q1HyQDE41Wt1CwuQ1qmlN8wNxSUCxZ57pgMvfCANU2Y xg== 
Received: from pps.reinject (localhost [127.0.0.1])
	by mx0a-0064b401.pphosted.com with ESMTP id 3a420erjyj-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT)
	for <openembedded-core@lists.openembedded.org>; Fri, 30 Jul 2021 11:03:30 +0000
Received: from m0250812.ppops.net (m0250812.ppops.net [127.0.0.1])
	by pps.reinject (8.16.0.43/8.16.0.43) with SMTP id 16UB3Uh9028411
	for <openembedded-core@lists.openembedded.org>; Fri, 30 Jul 2021 11:03:30 GMT
Received: from nam12-bn8-obe.outbound.protection.outlook.com (mail-bn8nam12lp2176.outbound.protection.outlook.com [104.47.55.176])
	by mx0a-0064b401.pphosted.com with ESMTP id 3a420erjyh-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Fri, 30 Jul 2021 11:03:30 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=RVnO0UGZPKJsY37h0aDgmJ7DiRhdxl3OGW2xlv9yXi26Ngbn081C3L/3LiVgkqgYIhFYdPBn318QA2lWj67SSofonX20+EDh3B3pXustDsoK8btatvM731rq5i4E3Z7aVPSZc0TaLzUDBn8W70OFDhdirfBIeuyByBHh6Drvl+joUqwrRdjL3IiUz4RAzwE+SmqQSDGdPn35N8IgU3ehgggjIN6PwjmxtWnl7KzYvMBtG6K0rzB2MeNfVK87BlPXo6JQ5d19IFtt5xkJOIIgUQozSqdTSdKxjACCTAQ+Tgx5OpAbPLR7IXvRBAgNzoLdsqL50k+imsnVLChsj7hT0w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=MJ+t3nJa3PwZxHqvDYjuJSXqOEl/rxwHJ3cPT4Fs9Xw=;
 b=JBn0bGC496Bxk8nJJ/gEGDdyaQmRqOCdhvw6RKCXRfJN30RSoJgwQYevPSIL2eJo07Paae1/Pq9wU9b2z84chbkRzGNVCne8lqjODe3PWP52uP7d0oNT4yJGboDH8OTc8WDJ+kX521O6zYcigK3DLKskuxrNS0NUkKgBjpPIU6KbsGEOuOElhJo1X1QNoAZKKT2DOUTDbaFZ8Zx6myIdUUAWpjfzWBtkNe6alFeRJecf9Jvjcyt6L0Z1xHWBN+jwpMP8vfQjKzhvu5vmjtP86jyMidAzRAqoCbhiNpSzFdXCt9mGV9n9LVzvnKPspjVVt+GY35h57YPU3ClZBI3E2w==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=windriver.com; dmarc=pass action=none
 header.from=windriver.com; dkim=pass header.d=windriver.com; arc=none
Authentication-Results: windriver.com; dkim=none (message not signed)
 header.d=none;windriver.com; dmarc=none action=none
 header.from=windriver.com;
Received: from CO6PR11MB5651.namprd11.prod.outlook.com (2603:10b6:5:356::20)
 by CO6PR11MB5651.namprd11.prod.outlook.com (2603:10b6:5:356::20) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4373.20; Fri, 30 Jul
 2021 11:03:29 +0000
Received: from CO6PR11MB5651.namprd11.prod.outlook.com
 ([fe80::396d:8a2a:b789:55b7]) by CO6PR11MB5651.namprd11.prod.outlook.com
 ([fe80::396d:8a2a:b789:55b7%5]) with mapi id 15.20.4373.025; Fri, 30 Jul 2021
 11:03:28 +0000
Subject: Re: [OE-core] [PATCH] python3-pytest: fix display version info
To: Richard Purdie <richard.purdie@linuxfoundation.org>,
        openembedded-core@lists.openembedded.org
Cc: yuanc.fnst@cn.fujitsu.com
References: <20210730033855.23941-1-kai.kang@windriver.com>
 <4befba5f96824bce16d6d67c4e525b5d5ecd84d3.camel@linuxfoundation.org>
From: "kai" <kai.kang@windriver.com>
Message-ID: <d8f91065-ff81-03bf-13b0-71116b3116c4@windriver.com>
Date: Fri, 30 Jul 2021 19:03:19 +0800
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.8.0
In-Reply-To: <4befba5f96824bce16d6d67c4e525b5d5ecd84d3.camel@linuxfoundation.org>
X-ClientProxiedBy: HK2PR06CA0013.apcprd06.prod.outlook.com
 (2603:1096:202:2e::25) To CO6PR11MB5651.namprd11.prod.outlook.com
 (2603:10b6:5:356::20)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from [128.224.162.151] (60.247.85.82) by HK2PR06CA0013.apcprd06.prod.outlook.com (2603:1096:202:2e::25) with Microsoft SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4373.18 via Frontend Transport; Fri, 30 Jul 2021 11:03:26 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 53a66b4b-e31d-4568-e02a-08d95349a91c
X-MS-TrafficTypeDiagnostic: CO6PR11MB5651:
X-MS-Exchange-Transport-Forked: True
X-Microsoft-Antispam-PRVS: 
	<CO6PR11MB565166A740CFFFB3E1F647AE95EC9@CO6PR11MB5651.namprd11.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:8882;
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 
	kKXbelmZSTaQViDcM/wlACfctTRShMV+7CtVas8VzLKnK8VSa7Le/jC4sTmDCUUY39+/4scVci42C2UmgAxk0MWgvFrv9JRg4vxOwpvGNGHetfuiwvGjsXflcZ9MABSYfLoNZFZM+lSj5f0mfTXInIDGvnFBwq/KG5Y9loYHYdVp6gExvDPI2Yg0IKCvErGnjiZEkYPOPZBu3+NkJp0qeAFEhQMO39Gri9T7kJGHfaAR3cB0vaMMl1nt3wm/7YqIo3BsB5pvzTU1rGkcgx5YJJEnDlzhzVlLT3RQm1l6/f+GQkE7XyTdpoXa7GZkMejStpZaKesK625dGQunW8S215LbA4bXnPY4+hvy8MSlzau0ZhdXkwrOvPBn7QbGUDAxV8d7QzGfLMO91uWXYtdIHYxU0RWX2achzzh/PJSMN3tdE2LkfIuddv+xfhja0aoFXBaOZg+UwBwWNS6e527MPio5l85++6L8fK/fQ28DO7bai8QdYZgJ0JSRAe9LgssTDsTqZ5xW1Oc8x1ZlXK9HF+96Q8fU5NwOvCQHTemiTKIZSY2Rd/hvqTKvWu0zI8jH/jpvkT+7kzFg0xJgSL8S4sE4rvjySJLM6grgn2JTaJxjEATCjmRXlDqNX9RYfWGWoblYRdpzOA4SCvnc1OJDmriK85Zbe2Nxqr4xG7qwSScG5jN7mz9ySTkLQfe6URMkrgD3sK3rvFDbHONmNOacbg2KTB72dhKfDBomOSvNob4IXvnf2V4Z1l7bpYxinpqqZFzSwh/ZFibHLVEKmucJ+Hp2u3aBtEuFrHHdCRHqLtY=
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:CO6PR11MB5651.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(4636009)(376002)(396003)(39850400004)(366004)(346002)(136003)(38100700002)(6706004)(66946007)(186003)(66556008)(38350700002)(478600001)(6666004)(6486002)(31686004)(16576012)(53546011)(8676002)(2906002)(36756003)(83380400001)(26005)(52116002)(4326008)(316002)(5660300002)(956004)(2616005)(31696002)(66476007)(86362001)(8936002)(78286007)(43740500002)(45980500001);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?utf-8?B?OUlteTkwcVQwZ1V0V2lVVVArZFp4cVRIbmZpNkVWYzMwTmZaOUluNG5ka1lP?=
 =?utf-8?B?ZzN0WEcyMEdNZE5DVWk4TGpyS2p4V2xYZFFobWNsS09tYjl2cnhYa1hRY1BH?=
 =?utf-8?B?OXpNKzdGZUVRakgycVN1SGY5aHY2a0FTN2t5WklBVmZ0WU1SN2c1KzQ5MDE2?=
 =?utf-8?B?SmNPdTYrcDJWWkxqWkRESEg4YndkejR1bVNnSCtuRGEyU0dGT1dOQXVOTnBX?=
 =?utf-8?B?R0tDbWYyN3A0cDRqaUJCYyt4eVJVWnhtU2pOek0wZEtUdmx6UTJxeDFuR0Zi?=
 =?utf-8?B?eG5URWcvbGtvc25GdEZINCtwNGUvSVB5WFN6emJjcjR0dkMwRVh3QlIxNExl?=
 =?utf-8?B?OTBYUzdBbmRYeVZibTdoT3VyVUNJZnBmZWgwK213Y1dXdld6OTdyVVNQWmpW?=
 =?utf-8?B?L0tBdWprQ1g5OS9zWkpyOVZ0S2M1Mm1mRGtzWmtocXFJaHZjMFdQcFNFSVQy?=
 =?utf-8?B?bmp0Rm5WbGU2dEs3YW4zeWVxUnU4U1ZMK2NMdGRURXh0TDRkZElIcnFvYWtl?=
 =?utf-8?B?K00vVEhZdGViSEdRWDFYWDVBTGJQSzAxNzIwRmY1WENtNERFODB4RVRHekZw?=
 =?utf-8?B?ZkhrWXZENjE0RGpXdXNuY2FHTzJlV211d1l3SWVLR2VYeW1kWi9DdTlXTHdh?=
 =?utf-8?B?cFUxYTBrZFB6YjBOejVTNThJaVp6VC9YOXVrTHNXQWsxVUJ4UkM0M0VKSHB2?=
 =?utf-8?B?RlpVT1RuYm5UMGpudzhkNE83Z2NqRzJMUGtZb3c1QmdMR3A2WFdIWXp1N0ZM?=
 =?utf-8?B?aGhjWU5jdkVSdzlqdFRtai9pWmoza2cyYVhOY2trS2M4Sy80dG5QelNVUXBl?=
 =?utf-8?B?M21hbmtLcU8yN0lCaEV2NnF1VVRqa2dIOGp5dVdLSTNpTDkxY2FLVnFMRVo4?=
 =?utf-8?B?dTF0bEdwSU9jQWFVZVNxWG9ucWRqelN4NSsvSGQvdU13M3g0Si8yUCt1TXpO?=
 =?utf-8?B?Q05jc2ZYM25lTnNqbmJRZy9GMjVuWktRZEY3QkVRdWJXYzVTc2ZpV3ZOdXQ2?=
 =?utf-8?B?ZzFrZzhKam9hdC9PUEpqdHNSRmwrbVV1NzFlK1h0ZE84akoxN3pZU3JwOFBm?=
 =?utf-8?B?VEs0em1rd2l2Y2tNeEIwNkNBVU9hTk9FWHM3RjVEMVhzcktQQUN5WVNiOGZk?=
 =?utf-8?B?MDNGRnpBbEJuclFoeUlreUtaU05PQUFkK0s2T2tKS2dCZG1keWxiZGZHdnkv?=
 =?utf-8?B?VmprVE4zZmErMHRWMk51ZExKQ2liMmRtQWxNaEUwaitzdERDL0YwRnpFRE9v?=
 =?utf-8?B?dTkxbmY5NlY5azJ4VCtYN1ZpVzJuOXdHQ2toY1JuaXNHMkRmRzNBK2k5Szdz?=
 =?utf-8?B?Y2VMaW5ERmpraTlYYmp1a2p5TFBveC94UVQyK3Y5RDJRdjFUMlNPbS94ZmNz?=
 =?utf-8?B?dXpib3lrcVgvQkRJSDJ0eWcvbkpkaHVUNkUvKzZxUi9Jc1lQMkJ2N08zcmtZ?=
 =?utf-8?B?QzhQbXkyUFNnYmJPbEVXbko3T1lvdThEVkROdlhYdFI3aXc5Q2d6OWVXbE8x?=
 =?utf-8?B?anVRZU85QkdpSEp1ZXFBSVNNOFlXZ1UvbHI5S2gvdENHZExGWjJ3czRhN0Zz?=
 =?utf-8?B?ckhpbmVzMVRSTnF6dDRXVGxJVndjVkl6OUE5enVFMkFJbzV3endxU1VGck1X?=
 =?utf-8?B?aHlQVVh2TTFweTlMRDZaVW1lUHFFTm9DcmpuVUVJVFVWY0U3WFcxekVFVUxP?=
 =?utf-8?B?Y2lJRFJXdWxXdUpER01PU2htcHgyNEVzU1RyOXdlN0lEYTBlbVM1c0JSaUha?=
 =?utf-8?Q?AxWZP0+ObR/cOmczzfIYQe08irpYpyTLhGohoqA?=
X-OriginatorOrg: windriver.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 53a66b4b-e31d-4568-e02a-08d95349a91c
X-MS-Exchange-CrossTenant-AuthSource: CO6PR11MB5651.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 30 Jul 2021 11:03:28.6806
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 8ddb2873-a1ad-4a18-ae4e-4644631433be
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: tJtFHPf6FSPSs+SSR9DESUXaWGHF5H9xWQAm/a8ttLqY9V5i3/upnNWQz+4sislLsejldyKxVoUAcUhn3T4R8Q==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CO6PR11MB5651
X-Proofpoint-ORIG-GUID: fN7ryrPNwEuz1r-wYriwiZg9JFvZ7Edx
X-Proofpoint-GUID: eCA9j-7kMT79ZuKtM-0SACEmogxkyxWS
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.182.1,Aquarius:18.0.790,Hydra:6.0.391,FMLib:17.0.607.475
 definitions=2021-07-30_05,2021-07-30_01,2020-04-07_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 impostorscore=0
 malwarescore=0 adultscore=0 phishscore=0 suspectscore=0 bulkscore=0
 priorityscore=1501 mlxlogscore=999 mlxscore=0 lowpriorityscore=0
 spamscore=0 clxscore=1011 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2107140000 definitions=main-2107300069
X-MIME-Autoconverted: from 8bit to quoted-printable by mx0a-0064b401.pphosted.com id 16UAkmEx029341
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: quoted-printable

On 7/30/21 6:11 PM, Richard Purdie wrote:
> On Fri, 2021-07-30 at 11:38 +0800, kai wrote:
>> From: Kai Kang <kai.kang@windriver.com>
>>
>> It does not show correct version info of python3-pytest by:
>>
>> $ pip3 list | grep pytest
>> pytest             0.0.0
>>
>> Remove 0001-setup.py-remove-the-setup_requires-for-setuptools-scm.patc=
h
>> and depends on python3-setuptools-scm-native to make it right.
>>
>> Signed-off-by: Kai Kang <kai.kang@windriver.com>
>> ---
>>  =C2=A0...he-setup_requires-for-setuptools-scm.patch | 36 ------------=
-------
>>  =C2=A0.../python/python3-pytest_6.2.4.bb            |  4 +--
>>  =C2=A02 files changed, 2 insertions(+), 38 deletions(-)
>>  =C2=A0delete mode 100644 meta/recipes-devtools/python/python3-pytest/=
0001-setup.py-remove-the-setup_requires-for-setuptools-scm.patch
>>
>> diff --git a/meta/recipes-devtools/python/python3-pytest/0001-setup.py=
-remove-the-setup_requires-for-setuptools-scm.patch b/meta/recipes-devtoo=
ls/python/python3-pytest/0001-setup.py-remove-the-setup_requires-for-setu=
ptools-scm.patch
>> deleted file mode 100644
>> index 1abd531c62..0000000000
>> --- a/meta/recipes-devtools/python/python3-pytest/0001-setup.py-remove=
-the-setup_requires-for-setuptools-scm.patch
>> +++ /dev/null
>> @@ -1,36 +0,0 @@
>> -From ead04f2da75efeca3369feff6161ea4a8baecbc9 Mon Sep 17 00:00:00 200=
1
>> -From: Yuan Chao <yuanc.fnst@cn.fujitsu.com>
>> -Date: Wed, 28 Aug 2019 16:12:27 +0900
>> -Subject: [PATCH] setup.py: remove the setup_requires for setuptools-s=
cm
>> -
>> -The setup_requires argument forces the download of the egg file for s=
etuptools-scm
>> -during the do_compile phase.  This download is incompatible with the =
typical fetch
>> -and mirror structure.  The only usage of scm is the generation of the=
 _version.py
>> -file and in the release tarball it is already correctly created
>> -
> Recipes should not be downloading during do_compile. We need to fix thi=
s in some
> other way, we can't just remove the patch.
>
> Cheers,
>
> Richard
>
Hi Richard,

It calls pip to download the egg file for setuptools-scm. But pip is not=20
a dependency and does not exist in sysroot, so it fails when remove the=20
patch and
"python3-setuptools-scm-native" is not a dependency:

| DEBUG: Executing shell function do_compile
| WARNING: The wheel package is not available.
|=20
/buildarea6/kkang/Yocto/build-qemux86/tmp/work/core2-64-poky-linux/python=
3-pytest/6.2.4-r0/recipe-sysroot-native/usr/bin/python3-native/pytho
n3: No module named pip
| Traceback (most recent call last):
|=C2=A0=C2=A0 File=20
"/buildarea6/kkang/Yocto/build-qemux86/tmp/work/core2-64-poky-linux/pytho=
n3-pytest/6.2.4-r0/recipe-sysroot-native/usr/lib/python3.9/si
te-packages/setuptools/installer.py", line 75, in fetch_build_egg
| subprocess.check_call(cmd)
|=C2=A0=C2=A0 File=20
"/buildarea6/kkang/Yocto/build-qemux86/tmp/work/core2-64-poky-linux/pytho=
n3-pytest/6.2.4-r0/recipe-sysroot-native/usr/lib/python3.9/su
bprocess.py", line 373, in check_call
|=C2=A0=C2=A0=C2=A0=C2=A0 raise CalledProcessError(retcode, cmd)
| subprocess.CalledProcessError: Command=20
'['/buildarea6/kkang/Yocto/build-qemux86/tmp/work/core2-64-poky-linux/pyt=
hon3-pytest/6.2.4-r0/recipe-s
ysroot-native/usr/bin/python3-native/python3', '-m', 'pip',=20
'--disable-pip-version-check', 'wheel', '--no-deps', '-w',=20
'/tmp/tmpovfcfgaq', '--q
uiet', 'setuptools-scm>=3D3.4']' returned non-zero exit status 1.

After add=C2=A0 "python3-setuptools-scm-native" to dependency, it meets t=
he=20
requirement in setup.cfg:

setuptools-scm>=3D3.4

then it does not call pip anymore to download any file.

Regards,

--=20
Kai Kang
Wind River Linux

