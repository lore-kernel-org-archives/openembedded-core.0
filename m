Received: from NAM10-BN7-obe.outbound.protection.outlook.com (NAM10-BN7-obe.outbound.protection.outlook.com [40.107.92.84])
 by mx.groups.io with SMTP id smtpd.web12.6210.1615366902715431054
 for <openembedded-core@lists.openembedded.org>;
 Wed, 10 Mar 2021 01:01:43 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@windriversystems.onmicrosoft.com header.s=selector2-windriversystems-onmicrosoft-com header.b=AoqGSTwk;
 spf=pass (domain: windriver.com, ip: 40.107.92.84, mailfrom: qi.chen@windriver.com)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=ZMosaDsDArxBMa1ApMuSv4g335gQDBJEKiexdfQrAMaYBb+Ytbox2BpnNCbz7NBqJQx5SKB9XTyxYULlblj4oXyGJlL3tJJHSymTHYhxKLbcXNGL0/6b8up4I/CYujnFrKUvQFLEkzYOCjpw1HqL2b9LNE19vccftAJZIglj571Brckho8XIjBuKjeFc1ZvUD6HqpAlPs4junnTVDv0TW6kHNJ1SD2QYWtyEZyiBbTywh2Yw81NcQD/TfFJ/9lAqyCq5PgELe3kfKam6714Woy0XM3EePpgXRyV3YqGLlCK0UC0fooaY1YaLpcyswiYq7Mbzzo8PNCyGTOWGw+G3Ww==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=CAoz9B7CMhezhp5SUOBS458W/UWEO6BEC8jqwF8+jI4=;
 b=YqI3A1n82cSYA3VhG6IhPpEoFw1El4B9kCRTFLBnFfKyK6gNHArZxxAXxZl2SOqaB2wHpzoXHIZnoxseGGBYegzKIAEaOX5fmQRULli2ahyPdg5Z6pEaJaNDaUrqrHxkyQYKhXK4YgObpuD088en/8A1EV/0w0XsjjUjISJy9YvHe2+ZFWydVozlNhl2zckTD561ivjyOVrM8ZH1QhK3iWA+JLYsg/i8prE5MVofVs14LHRP9nK8QAeVy0bFuNQq0fLIlZjaVAMPNEuJkt47rSBCRtv3LEQocN0Y/6CeNqvz9xBLYmRZiOr9Z+njjhmdwD8IbEtXp+w0Dc8n8Iojog==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=windriver.com; dmarc=pass action=none
 header.from=windriver.com; dkim=pass header.d=windriver.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=windriversystems.onmicrosoft.com;
 s=selector2-windriversystems-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=CAoz9B7CMhezhp5SUOBS458W/UWEO6BEC8jqwF8+jI4=;
 b=AoqGSTwkMlKVkgCVDH0RtWqMTlokGZI0IpopSz4s1WEnqKw3incmQHdVFsGJ0gQUZQhZsKkzU0UHOvbEzwnX+WofJQ7kp4IDHSJ7jaoWBGHsnNVcORm4YlpVKZrILTrI3utPCMh7TtZ6N336tklJYbSUIb2kOLkCRuIQSfjFkvA=
Authentication-Results: gmail.com; dkim=none (message not signed)
 header.d=none;gmail.com; dmarc=none action=none header.from=windriver.com;
Received: from BYAPR11MB3480.namprd11.prod.outlook.com (2603:10b6:a03:79::27)
 by BYAPR11MB2904.namprd11.prod.outlook.com (2603:10b6:a03:87::23) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3912.26; Wed, 10 Mar
 2021 09:01:39 +0000
Received: from BYAPR11MB3480.namprd11.prod.outlook.com
 ([fe80::d9b:3f7c:136d:e60]) by BYAPR11MB3480.namprd11.prod.outlook.com
 ([fe80::d9b:3f7c:136d:e60%7]) with mapi id 15.20.3890.038; Wed, 10 Mar 2021
 09:01:39 +0000
Subject: Re: [OE-core][PATCH] populate_sdk_ext: record METADATA_REVISION
To: Richard Purdie <richard.purdie@linuxfoundation.org>,
 openembedded-core@lists.openembedded.org, seebs@seebs.net, mghatle@gmail.com
References: <20210305101040.822-1-Qi.Chen@windriver.com>
 <47f42aa6bef23d8c98ea9cf2a8029f6900dd7d61.camel@linuxfoundation.org>
 <166A3C91F1FD80D0.3944@lists.openembedded.org>
 <166A488578ED5898.3944@lists.openembedded.org>
 <166AED6BFC056C10.17015@lists.openembedded.org>
From: "Chen Qi" <Qi.Chen@windriver.com>
Message-ID: <13b1761a-205b-b17f-c3e9-5ddf44049267@windriver.com>
Date: Wed, 10 Mar 2021 17:11:42 +0800
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:45.0) Gecko/20100101
 Thunderbird/45.4.0
In-Reply-To: <166AED6BFC056C10.17015@lists.openembedded.org>
X-Originating-IP: [60.247.85.82]
X-ClientProxiedBy: HK2PR0401CA0008.apcprd04.prod.outlook.com
 (2603:1096:202:2::18) To BYAPR11MB3480.namprd11.prod.outlook.com
 (2603:10b6:a03:79::27)
Return-Path: Qi.Chen@windriver.com
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from [128.224.162.161] (60.247.85.82) by HK2PR0401CA0008.apcprd04.prod.outlook.com (2603:1096:202:2::18) with Microsoft SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.20.3912.17 via Frontend Transport; Wed, 10 Mar 2021 09:01:37 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: fba63441-97e9-47b7-7d0d-08d8e3a31dc7
X-MS-TrafficTypeDiagnostic: BYAPR11MB2904:
X-Microsoft-Antispam-PRVS: 
	<BYAPR11MB290463F887D4F7CF4EFACF28ED919@BYAPR11MB2904.namprd11.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:8273;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 
	7h1q4m3B0ENgJ0QX4dxqFiTjIkAxd9djswSzYwoAg57TbVEevZSaWpdUUD17nZ+72/fKB6BlLU4kGO/1C5PKP8iVwPHtk4Wfuu3G6y64qw6CTXw78KNFHrlYI58Z6mOdNdwSplS71APydFi/TKegMZj2E4rVe+xbN26qHf5MnTUp13tpXkeGidaLkFbUdd9+ENusS1Cc5y0sn7YTkDG/E9/ovDXKCknyrCK3FD0yfNPygaH5mIh37ahsVv7THMV4mYz04UqF+UrS2O8wDTMigcozag4oeC3Cfw0Kfh04VS8J2/CWbURkG+XEV2HDMmD0DMfQsmp/UYJf1pSgnSKeHfkjtTEyunRkzDGAxKpRlYtRE+7YSTta35BDJwOlXP/GfyE4gDflHTeMQEX8Pu06S/2i4au6LGF4FQPyKRiLhmQ40vRPbdSdElCCqXR/9+NF/Cw47PkG2UXhVk40mvKzGAKsKeFyVz1LiiITOeTlSxv9lLkf0paFyDAafxWoCkpbG1It/JQBoTEfInoKseZUalGD3aBZI/hc2CaT4ufnQxIKIz1+pn2fUwpg22Yotxj/Y6SMDi8FqPq1nfCefN1FP7ctEID15TGSzkR5aGJ0eHz6UATlEnjK/ApOaYNisqNW2eLyMGeo2OCfZfOgrV2209Hh31Sjzy/tUUwR2UNsOz7No9d4gg3iljc8tWBH1Zhk7J4t/13X04qNIgxSyloe6A==
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:BYAPR11MB3480.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(4636009)(376002)(346002)(396003)(39840400004)(366004)(136003)(66946007)(186003)(16526019)(6486002)(53546011)(66476007)(2616005)(66556008)(478600001)(31696002)(16576012)(31686004)(956004)(8936002)(6666004)(36756003)(83380400001)(52116002)(8676002)(5660300002)(966005)(33964004)(166002)(316002)(2906002)(26005)(86362001)(6706004)(78286007)(43740500002)(45980500001);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData: 
	=?utf-8?B?dEVFNjlnR0RheXRqcG5OSnBFVXJhakFDZE55Q1Z4ZkFRVTVOd0RjZW1WU2Vy?=
 =?utf-8?B?OWM1eC9ramFNTS96SHAzaDNjVStkRXZPRWZ5b3FQN282MG9hUlcycSt4dkpI?=
 =?utf-8?B?S2t4ZFdHTk5iclR6dk1MeTJoQy9oVVhmSmpXZ0VERUFVMXFZTk5sNDVpcW1B?=
 =?utf-8?B?UHMyLzhQRStEMlpnQ2tKc0UvdXJpS0hZajNydnlRNi9yS2NOVFVHWjZkTHYw?=
 =?utf-8?B?c1ZkVlk4ZmZSK3Yrdk03UXRrd25QcE1OOWdJb0tGMnN3SnpNeDNoNTVLQ1lt?=
 =?utf-8?B?RUhrc08zRkl4c0FMMEtTdUF1UEVYRnRHOS9RUmpNbi9Zb2xLOVBRNCtyVlEw?=
 =?utf-8?B?K3JUMHdFVitzaWxSbWJacTBSdzRPWjZFNnd6eFAyWmFjZVBReEh2R0ZsVldh?=
 =?utf-8?B?UzFueFF0WVd4a3I4SkdCM20wTTdYZUx3WGhNZDNMTXBCTEQ0V2RkQjc5Smg5?=
 =?utf-8?B?Z2QrYkt3WXdGYzlKNFBMUEhhUXFpTmtWR01acmFtZHR1UTFzR0lLZlkzenFz?=
 =?utf-8?B?UzBwcy9BRDYwRlJ0a0xZUmJ6cTMxNWNhSG9Zd3FKNU0zdzdMOExXN3RVTkEx?=
 =?utf-8?B?M3k5bWgwSjlGOUpYR3JrajIySCtkYXlxUlBKLzl6KzlKM0c3cnFkS1grQmoy?=
 =?utf-8?B?aXlEOHJLUm9jMkFkNUlHRmU1Rm9yZjRXWHN2dmtNcW5mVi9OV0puYWRRZERL?=
 =?utf-8?B?dG1seVlyN1lEL3luZWZGN3ZXNDN3b0pQbHRucDMycWZvTW1NQ1pBT000eFRN?=
 =?utf-8?B?b1l2c25jN0dhdG9PSmNWZnBTNzdoZ2VHcklQVElTUjZXUEU0VFd3ZlBGakJZ?=
 =?utf-8?B?VWFUVkhnT0pVZlJEQ2VLUDNYVWRYbzRMTGZXWnpPMStRYys4ZWNJRGxFTHNV?=
 =?utf-8?B?KzdOaUpWQWlzNVpaZlFJUkp3UFdPaUViZGpOS3cydDMwcUtuTGswYmFpdS9T?=
 =?utf-8?B?UWVySTh5cXIxekh0eFFrS0FicERQb0hUY1VuMTd4Z2pZb1ZKVTB6N1NENCtM?=
 =?utf-8?B?NzZPSGhReldZRHJOeTQ5VGRiZVhoQUpmcDUxaGFYRUVUQnFVWExNeHhPSjB2?=
 =?utf-8?B?WW5kWkZiT0U1eERaM3VmSVVNT05WYTA2S3oyaGx6Yk94cmRwTS9hT3VjeGt6?=
 =?utf-8?B?MG52TUgwd3pHdS9OUUN3MVgyOXovZHl6aDZudUpWTGdvU242b0hTNHFISk4x?=
 =?utf-8?B?MEpVSFRualg2bzFVVnBpS0tNbFB6bHhxS2kwNFJ4am5rWWI0K3hTYlQ0Vzhz?=
 =?utf-8?B?K21PWWVhMUVRelp4ZVB1MlhWRUVpVFpvS2NFVWxucFFPVTUxOGJNWHhXcWsv?=
 =?utf-8?B?em8xTmpFdG5GVy9BT0NGbUVPS3FZZnFnZmZrVXltbU9KRTl3ZzI0Z0xJTmRr?=
 =?utf-8?B?WXNPSWY3c0dXUllXQ0xHWEoxaHErZGgrbWZMK1l5TkRla1lJZHl1RjdSK2Ra?=
 =?utf-8?B?NkxZRXhNa2JEdzVZL3Q5NFNoM2dhQm80OTM5dlNJUU1BZ2ZiNGZHOEk0TktP?=
 =?utf-8?B?a3FnMGUxbUt3VVkrRU5uNklRQ2dkOU9uN3hlejYya2M3MG1wQzcrUStnOWNn?=
 =?utf-8?B?NkJMRVpaOFZINEE3NmRtdGtoekFJNTdKYjJDbnlINjhKSGh5ci81bDBZWUVm?=
 =?utf-8?B?UjdDRkJpMUFIaCtBY1cwZXNzdEhtQXN0VmNOcGZIdjZ4dUZFRXhOelpIamx4?=
 =?utf-8?B?RWtGZmJQRVZIbFM0Sk5xQnVZSkxGaXZEeHg2MkRCcHYvMFlvMHhWVVYwU25J?=
 =?utf-8?Q?SXhN5cGdq1WgbiJhN5u6J9lglmDoFbM0F/rcl8f?=
X-OriginatorOrg: windriver.com
X-MS-Exchange-CrossTenant-Network-Message-Id: fba63441-97e9-47b7-7d0d-08d8e3a31dc7
X-MS-Exchange-CrossTenant-AuthSource: BYAPR11MB3480.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 10 Mar 2021 09:01:39.3621
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 8ddb2873-a1ad-4a18-ae4e-4644631433be
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: Qn6bMSz55d8SuE4DAipt9/0fwdFzTwfZaqIA91s4rX04L5egc5cWTRCh7tCkmQD6lz4wZUjozO4sazL7cmy8GA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BYAPR11MB2904
Content-Type: multipart/alternative;
 boundary="------------087A84353D4F38362526DAAC"

--------------087A84353D4F38362526DAAC
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 7bit

On 03/10/2021 04:31 PM, Chen Qi wrote:
> On 03/08/2021 02:09 PM, Chen Qi wrote:
>> On 03/08/2021 10:30 AM, Chen Qi wrote:
>>> On 03/06/2021 07:29 AM, Richard Purdie wrote:
>>>> On Fri, 2021-03-05 at 18:10 +0800, Chen Qi wrote:
>>>>> As we delete the .git/ directory, it's impossible to get METADATA_REVISION
>>>>> inside eSDK. Because of this, we meet the following warning when installing eSDK.
>>>>>
>>>>>    WARNING: The base-files:do_install sig is computed to be 16b9d96148d45de183cc94667aae016ec7d102d48255456381e718cd4bbd0aa0, \
>>>>>    but the sig is locked to 6eb0dcaed504282becee94662481d79264db920dee1f7deda18230133fff8f36 in SIGGEN_LOCKEDSIGS_t-qemux86-64
>>>>>
>>>>> So we record METADATA_REVISION in eSDK generation time to fix this problem.
>>>>>
>>>>> Signed-off-by: Chen Qi<Qi.Chen@windriver.com>
>>>>> ---
>>>>>   meta/classes/populate_sdk_ext.bbclass | 3 +++
>>>>>   1 file changed, 3 insertions(+)
>>>> I have to wonder why base-files is depending on the metadata-revision? That
>>>> implies that base-files and hence anything that depends upon it would rebuild
>>>> each time you update to a new revision. Is that really what you want?
>>>>
>>>> Cheers,
>>>>
>>>> Richard
>>>>
>>>>
>>>>
>>>>
>>> Hi Richard,
>>>
>>> I tested it on pure yocto project. No extra layer or configuration.
>>> I'm also wondering why base-files do_install depends on 
>>> METADATA_REVISION. The strange thing is that things do not rebuild 
>>> at eSDK installation time. There's only a warning about base-files 
>>> do_install signature.
>>>
>>
>> Just found answer for the above problem.
>> A previous commit changes poky.conf to make DISTRO_VERSION contain 
>> METADATA_REVISION.
>> """
>> poky.conf: do not write current date into distro version, use git hash instead
>>
>> """
>>
>> I also confirmed that merely updating the git revision will result in 
>> a rebuild of base-files.
>> Rebuild of base-files does not result in rebuild of other recipes 
>> because we have 'base-files' in SIGGEN_EXCLUDERECIPES_ABISAFE.
>>
>> For the problem below, I haven't found the root cause, still working 
>> on it.
>>
>> Best Regards,
>> Chen Qi
>>
>>> In fact, this is a problem I found when I was dealing with another 
>>> problem with eSDK.
>>> *Yocto's current eSDK cannot be successfully installed on a 
>>> different distro.* For example, you build esdk on ubunt18 and 
>>> install the esdk on ubuntu20, then you'll get an error of pseudo 
>>> do_fetch task re-run unexpectedly.
>>> I think it might be related to NATIVELSBSTRING, but I haven't found 
>>> out why.
>>> Manually setting NATIVELSBSTRING to some fixed string such as 
>>> 'Linux' will solve the above problem.
>>>
>>> I'm still checking the codes. If you have some idea/suggestion, 
>>> please let me know.
>>>
>
> I think I've found the problem.
>
> """
> commit 3ecf5d9692fec97b37af6a4e6c747a4e2c2ca292
> Author: Richard Purdie <richard.purdie@linuxfoundation.org>
> Date:   Sat Nov 21 16:16:40 2020 +0000
>
>     uninative: Don't use single sstate for pseudo-native
>
>     pseudo-native is a bit special. It conditionally compiles in 
> support for
>     xattr, statx and statvfs amongst other options. If a pseudo-native 
> binary is
>     used on a system where these functions are present but it wasn't 
> compiled in
>     we see hard to debug permissions problems.
> [snip]
> """
>
> This commit effectively says that the pseudo-native's sstate cache 
> should not be shared among hosts with different distros, as it's 
> appending ${ORIGLSBSTRING} to SSTATE_PKGARCH for pseudo-native.
>
> I'm not familiar with the pseudo's codes. But I'm wondering if it's 
> possible for pseudo to always build in attr support and behave 
> differently on different hosts/filesystems.
>


Just checked the pseudo recipe. It seems that attr is always enabled.
DEPENDS = "sqlite3 attr"
PSEUDO_EXTRA_OPTS ?= "--enable-force-async --without-passwd-fallback 
--enable-epoll --enable-xattr"

I think there should be no circumstances where the xattr support is not 
compiled in, yet the pseudo-native sstate cache is still reused. I'll 
send out a patch to revert the commit.

Best Regards,
Chen Qi


> Best Regards,
> Chen Qi
>
>>> Best Regards,
>>> Chen Qi
>>>
>>>
>>
>>
>>
>>
>
>
>
> 
>


--------------087A84353D4F38362526DAAC
Content-Type: text/html; charset=utf-8
Content-Transfer-Encoding: 8bit

<html><head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8">
  </head>
  <body bgcolor="#FFFFFF" text="#000000">
    <div class="moz-cite-prefix">On 03/10/2021 04:31 PM, Chen Qi wrote:<br>
    </div>
    <blockquote cite="mid:166AED6BFC056C10.17015@lists.openembedded.org" type="cite">
      
      <div class="moz-cite-prefix">On 03/08/2021 02:09 PM, Chen Qi
        wrote:<br>
      </div>
      <blockquote cite="mid:166A488578ED5898.3944@lists.openembedded.org" type="cite">
        <div class="moz-cite-prefix">On 03/08/2021 10:30 AM, Chen Qi
          wrote:<br>
        </div>
        <blockquote cite="mid:166A3C91F1FD80D0.3944@lists.openembedded.org" type="cite">
          <div class="moz-cite-prefix">On 03/06/2021 07:29 AM, Richard
            Purdie wrote:<br>
          </div>
          <blockquote cite="mid:47f42aa6bef23d8c98ea9cf2a8029f6900dd7d61.camel@linuxfoundation.org" type="cite">
            <pre wrap="">On Fri, 2021-03-05 at 18:10 +0800, Chen Qi wrote:
</pre>
            <blockquote type="cite">
              <pre wrap="">As we delete the .git/ directory, it's impossible to get METADATA_REVISION
inside eSDK. Because of this, we meet the following warning when installing eSDK.

&nbsp;&nbsp;WARNING: The base-files:do_install sig is computed to be 16b9d96148d45de183cc94667aae016ec7d102d48255456381e718cd4bbd0aa0, \
&nbsp;&nbsp;but the sig is locked to 6eb0dcaed504282becee94662481d79264db920dee1f7deda18230133fff8f36 in SIGGEN_LOCKEDSIGS_t-qemux86-64

So we record METADATA_REVISION in eSDK generation time to fix this problem.

Signed-off-by: Chen Qi <a moz-do-not-send="true" class="moz-txt-link-rfc2396E" href="mailto:Qi.Chen@windriver.com">&lt;Qi.Chen@windriver.com&gt;</a>
---
&nbsp;meta/classes/populate_sdk_ext.bbclass | 3 +++
&nbsp;1 file changed, 3 insertions(+)
</pre>
            </blockquote>
            <pre wrap="">I have to wonder why base-files is depending on the metadata-revision? That
implies that base-files and hence anything that depends upon it would rebuild
each time you update to a new revision. Is that really what you want?

Cheers,

Richard




</pre>
          </blockquote>
          Hi Richard,<br>
          <br>
          I tested it on pure yocto project. No extra layer or
          configuration.<br>
          I'm also wondering why base-files do_install depends on
          METADATA_REVISION. The strange thing is that things do not
          rebuild at eSDK installation time. There's only a warning
          about base-files do_install signature.<br>
          <br>
        </blockquote>
        <br>
        Just found answer for the above problem.<br>
        A previous commit changes poky.conf to make DISTRO_VERSION
        contain METADATA_REVISION.<br>
        &quot;&quot;&quot;<br>
        <pre wrap="">poky.conf: do not write current date into distro version, use git hash instead</pre>
        <br>
        &quot;&quot;&quot;<br>
        <br>
        I also confirmed that merely updating the git revision will
        result in a rebuild of base-files.<br>
        Rebuild of base-files does not result in rebuild of other
        recipes because we have 'base-files' in
        SIGGEN_EXCLUDERECIPES_ABISAFE.<br>
        <br>
        For the problem below, I haven't found the root cause, still
        working on it.<br>
        <br>
        Best Regards,<br>
        Chen Qi<br>
        <br>
        <blockquote cite="mid:166A3C91F1FD80D0.3944@lists.openembedded.org" type="cite"> In fact, this is a problem I found when I was
          dealing with another problem with eSDK.<br>
          <b>Yocto's current eSDK cannot be successfully installed on a
            different distro.</b> For example, you build esdk on ubunt18
          and install the esdk on ubuntu20, then you'll get an error of
          pseudo do_fetch task re-run unexpectedly.<br>
          I think it might be related to NATIVELSBSTRING, but I haven't
          found out why.<br>
          Manually setting NATIVELSBSTRING to some fixed string such as
          'Linux' will solve the above problem.<br>
          <br>
          I'm still checking the codes. If you have some
          idea/suggestion, please let me know.<br>
          <br>
        </blockquote>
      </blockquote>
      <br>
      I think I've found the problem.<br>
      <br>
      &quot;&quot;&quot;<br>
      commit 3ecf5d9692fec97b37af6a4e6c747a4e2c2ca292<br>
      Author: Richard Purdie <a moz-do-not-send="true" class="moz-txt-link-rfc2396E" href="mailto:richard.purdie@linuxfoundation.org">&lt;richard.purdie@linuxfoundation.org&gt;</a><br>
      Date:&nbsp;&nbsp; Sat Nov 21 16:16:40 2020 +0000<br>
      <br>
      &nbsp;&nbsp;&nbsp; uninative: Don't use single sstate for pseudo-native<br>
      &nbsp;&nbsp;&nbsp; <br>
      &nbsp;&nbsp;&nbsp; pseudo-native is a bit special. It conditionally compiles in
      support for<br>
      &nbsp;&nbsp;&nbsp; xattr, statx and statvfs amongst other options. If a
      pseudo-native binary is<br>
      &nbsp;&nbsp;&nbsp; used on a system where these functions are present but it
      wasn't compiled in<br>
      &nbsp;&nbsp;&nbsp; we see hard to debug permissions problems.<br>
      [snip] &nbsp;&nbsp; <br>
      &quot;&quot;&quot;<br>
      <br>
      This commit effectively says that the pseudo-native's sstate cache
      should not be shared among hosts with different distros, as it's
      appending ${ORIGLSBSTRING} to SSTATE_PKGARCH for pseudo-native.<br>
      <br>
      I'm not familiar with the pseudo's codes. But I'm wondering if
      it's possible for pseudo to always build in attr support and
      behave differently on different hosts/filesystems.<br>
      <br>
    </blockquote>
    <br>
    <br>
    Just checked the pseudo recipe. It seems that attr is always
    enabled.<br>
    DEPENDS = &quot;sqlite3 attr&quot;<br>
    PSEUDO_EXTRA_OPTS ?= &quot;--enable-force-async --without-passwd-fallback
    --enable-epoll --enable-xattr&quot;<br>
    <br>
    I think there should be no circumstances where the xattr support is
    not compiled in, yet the pseudo-native sstate cache is still reused.
    I'll send out a patch to revert the commit.<br>
    <br>
    Best Regards,<br>
    Chen Qi<br>
    <br>
    <br>
    <blockquote cite="mid:166AED6BFC056C10.17015@lists.openembedded.org" type="cite"> Best Regards,<br>
      Chen Qi<br>
      <br>
      <blockquote cite="mid:166A488578ED5898.3944@lists.openembedded.org" type="cite">
        <blockquote cite="mid:166A3C91F1FD80D0.3944@lists.openembedded.org" type="cite"> Best Regards,<br>
          Chen Qi<br>
          <br>
          <fieldset class="mimeAttachmentHeader"></fieldset>
          <br>
          <pre wrap="">
</pre>
        </blockquote>
        <p><br>
        </p>
        <br>
        <fieldset class="mimeAttachmentHeader"></fieldset>
        <br>
        <pre wrap="">

</pre>
      </blockquote>
      <p><br>
      </p>
      <br>
      <fieldset class="mimeAttachmentHeader"></fieldset>
      <br>
      <pre wrap="">


</pre>
    </blockquote>
    <p><br>
    </p>
  </body>
</html>

--------------087A84353D4F38362526DAAC--
