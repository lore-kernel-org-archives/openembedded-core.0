Received: from NAM11-DM6-obe.outbound.protection.outlook.com (NAM11-DM6-obe.outbound.protection.outlook.com [40.107.223.68])
 by mx.groups.io with SMTP id smtpd.web08.5933.1615364463994763704
 for <openembedded-core@lists.openembedded.org>;
 Wed, 10 Mar 2021 00:21:04 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@windriversystems.onmicrosoft.com header.s=selector2-windriversystems-onmicrosoft-com header.b=e94nw2vu;
 spf=pass (domain: windriver.com, ip: 40.107.223.68, mailfrom: qi.chen@windriver.com)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=cmT5gBDbhrbP3t+GfrAMcVe3PDq1Qi+JPQl183CCnTkTSmCF9FompnOTZ6rFn+u5lieD399iCY+8Hqe/uOqxN4SID3v/4pRqZ9F2MgfWqdi2vXS3uoYw6/26iHp7WCbNF5JqYD75TePn46WgFj/bUAxHjH5QJdGmDWPYiBpyIxOgLoniO6ioDvunFEC+10C+/6ZgcZrM7g/LEv/gtgkUjfdK4B43MW7gZaH/podjJ3KIawJCdNlJfeYfU0hSDCyxSA1bmBAW6tU3Yg/PgGgjq3mh6nY3zDbhOFRhBK5sU+lYLZW7hQbKAqlasy7ywvj8QHWBW43W1jS8Pj+ILF9b1A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=HSfOw4asK2j89KCpF1MxnDGKNWlWj5H7IKMfjfiuzJE=;
 b=DphGIMiOpAHaT25Y7LaoXTFoexKjxt6F7ofrGCKKy/1XPCY6PIqKxea40+55FR6Rko3zU2kRY6NSwz3Nn/GmlkG8jwvyuW/yOrVG4IOIuNYYNwIa8xf5zoG5V/MWafsi8RETiUKI598pfOkEIwJXFey7mEh5gIUSpFKh6jEdXgzdSYn7IBF1NPaB0XS7j6RlI3LucXQK42fTe2xQw0Fpy/qQKX86I8WXsy2Gb7n2uxynzkTflTnjQ0f4Jzmm+cOQjA2ieZlGQWCR3u5lUIJ1bc7VuoXpitW8LYTwLga8VfHPknIysg1jZUOngpE3Z1qXyd/+b0A7nTeDWgh3c3kGUA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=windriver.com; dmarc=pass action=none
 header.from=windriver.com; dkim=pass header.d=windriver.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=windriversystems.onmicrosoft.com;
 s=selector2-windriversystems-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=HSfOw4asK2j89KCpF1MxnDGKNWlWj5H7IKMfjfiuzJE=;
 b=e94nw2vulb94z2aaJPCTzOTuh+z1msmLKusHoeUdolCyfjP/YTK4a5C8lLXgN4WwKpIZdGpYZyRXLUOQzS4rDs/bNF9dQE6nocvwy2slhrgtYsxXCnmeTARLv5WDIKXnlqX8qPtYLdudeL0kjddOjpEJZ01kBAT3ikj3BCHiJwI=
Authentication-Results: gmail.com; dkim=none (message not signed)
 header.d=none;gmail.com; dmarc=none action=none header.from=windriver.com;
Received: from BYAPR11MB3480.namprd11.prod.outlook.com (2603:10b6:a03:79::27)
 by SJ0PR11MB5134.namprd11.prod.outlook.com (2603:10b6:a03:2de::17) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3912.17; Wed, 10 Mar
 2021 08:21:01 +0000
Received: from BYAPR11MB3480.namprd11.prod.outlook.com
 ([fe80::d9b:3f7c:136d:e60]) by BYAPR11MB3480.namprd11.prod.outlook.com
 ([fe80::d9b:3f7c:136d:e60%7]) with mapi id 15.20.3890.038; Wed, 10 Mar 2021
 08:21:01 +0000
Subject: Re: [OE-core][PATCH] populate_sdk_ext: record METADATA_REVISION
To: Richard Purdie <richard.purdie@linuxfoundation.org>,
 openembedded-core@lists.openembedded.org, seebs@seebs.net, mghatle@gmail.com
References: <20210305101040.822-1-Qi.Chen@windriver.com>
 <47f42aa6bef23d8c98ea9cf2a8029f6900dd7d61.camel@linuxfoundation.org>
 <166A3C91F1FD80D0.3944@lists.openembedded.org>
 <166A488578ED5898.3944@lists.openembedded.org>
From: "Chen Qi" <Qi.Chen@windriver.com>
Message-ID: <089597c0-e61a-f775-5ab8-992b3942b185@windriver.com>
Date: Wed, 10 Mar 2021 16:31:07 +0800
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:45.0) Gecko/20100101
 Thunderbird/45.4.0
In-Reply-To: <166A488578ED5898.3944@lists.openembedded.org>
X-Originating-IP: [60.247.85.82]
X-ClientProxiedBy: HKAPR03CA0011.apcprd03.prod.outlook.com
 (2603:1096:203:c8::16) To BYAPR11MB3480.namprd11.prod.outlook.com
 (2603:10b6:a03:79::27)
Return-Path: Qi.Chen@windriver.com
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from [128.224.162.161] (60.247.85.82) by HKAPR03CA0011.apcprd03.prod.outlook.com (2603:1096:203:c8::16) with Microsoft SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.20.3933.23 via Frontend Transport; Wed, 10 Mar 2021 08:20:59 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 42085f9b-8699-4e97-5a9c-08d8e39d70a3
X-MS-TrafficTypeDiagnostic: SJ0PR11MB5134:
X-Microsoft-Antispam-PRVS: 
	<SJ0PR11MB513418400E9303880C4F4EE6ED919@SJ0PR11MB5134.namprd11.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:7691;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 
	g+ZbvXiWGB3iPZgNB1CjXjOx7EuhtyOG4Cb0kSfzW9oS/Xy+PL+WNyJ/Vboqc6hjAuVYSZGLd0vIw+iSaKPJHroACNCbhKsB0MTy/sJ1gAXsE3bgcSWBdaFlncXtMv03wBveFO6iPaLzoBQihZmEITu7fMZQJ/754wq3AkghUD7NyOmDnWiVIbaY7i+5ngiuzwdHYawnssFB8Q8V6B+sB6nPW0QCmxzwWMhNU9rX5daaSHusc3NZVMZIcgH+qzNGZ4IXaXlL39yJh2Zx1olgSscTlEaK/ml8iTy67NTkKbVM1I9GbJcdeMIj8QiIPpIt7QwbrYCO2GnJ2rCWa0dLAE+Z5stMshrzKT+w0rraFnI5cZyD+MEefGHfoUODccBHUCuMFrXRz61xtqBIDmQfzmFDPDPAZj0oOJXl7LWJInMiyAuXfl6JNZRBgotwOirFF2sTr7BCYvZofGzpxY/4CmX0FNu4Tf4clg4zs6YlTgAd+lV8os1LjLeD3cKylsXfvaXJwiTUM7lW3kWxR6NUBVbHcazE8zLemN7IEepIOBacSH4AhiDTRDempMkEjquWrmfhDEL5EpoUB7Fuwh/qHopNEdab7FxJzCxZM+xg0i1HkP+G+0coAsrZAR2j5GlQ4lfdeGw8lICRV61G9rWKvwIjjD4ffKtpbG9Dh7uhvsqQpGtlCpjM7JSqXve+nH6ChWETBk1KU2NGg9LbNhK3lw==
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:BYAPR11MB3480.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(4636009)(366004)(346002)(39840400004)(396003)(376002)(136003)(16526019)(33964004)(186003)(6486002)(36756003)(53546011)(5660300002)(6706004)(478600001)(966005)(26005)(52116002)(166002)(31696002)(86362001)(66556008)(316002)(83380400001)(66476007)(66946007)(8936002)(6666004)(31686004)(956004)(8676002)(2616005)(16576012)(2906002)(78286007)(45980500001)(43740500002);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData: 
	=?utf-8?B?d2VTU2tZMEZYMlV3MkJtdHB0UGRzN3phdjM2TDdaSUNkVURnMmZSMXBDaXhj?=
 =?utf-8?B?L2JRNHZMODRXcHVOL0xlZTh2MFZaTElYVzBSeU9FN1EwNnNSTlQyOW54N2g1?=
 =?utf-8?B?eUx1NktGK05velJZK0ZvZUM3VTJRQWM4SjdaYVZ4elp0eDlTVHkySkpFUWRp?=
 =?utf-8?B?Q2tVNkl0RUJoNHJZbVJYN2NQN0RpS09oNnpLYjM4RE9wcmVSd0xzWnJpWENN?=
 =?utf-8?B?QkFWb2dkcUVxeURJRk4vc1pUQS83WjkwSHFaY3NoRWx4NjN4UHU4Zk8wU1JS?=
 =?utf-8?B?ZjJCcXVxWk9jTGo1YW8rUXA3MmNYektNazF3VllSUWgyOFFVRWhKSWYrUkto?=
 =?utf-8?B?M256aW5GMGhtUC9ZVlRTRFE2TEhyT0p1djhwVnRISTI4bnlRZ25zMU9adkFJ?=
 =?utf-8?B?WlBzSENmTHFBQXFUcnBtY1djdVNQNjRnLzF6SG9UNEIrdk5xSlVwdE0vU1Rr?=
 =?utf-8?B?V285bVE0UHJMZnZRNzdTaFhTWm9xVTVMUE9GdktSSEw2V3BpRU9EOXAwUVVn?=
 =?utf-8?B?WXdycnhCN0NMWURQL2w0aXVuV2lRTHpLYndRMTFPWHd2dk5sL3ZUN2QzamJt?=
 =?utf-8?B?NzZQY21VVS9QUEVmVytFOFZXeUtraDVlbHU0Y2UraXhQS3VHSkJoeXMzV3BR?=
 =?utf-8?B?dEhxTVM1S1UzR3g5UDlpcmo3Nnp6NEp0R09wSHJTQVFtbkxqRVMrY2dLcFJj?=
 =?utf-8?B?K0xDUTVPL2dlTnd1akUwYUFJYkdGeHFjdndaako3WVUrMVJ6OGo5bzZBZkFj?=
 =?utf-8?B?Y1huME4xelFVYmVMbTdyaklQVERXY2JwT3F5RDRxdmtnU0FwZjk3bk9Jam4y?=
 =?utf-8?B?VEFGVFhJdExEUWlrUGYzTjhLQmJNdmsyODAzVjFzU2Yybi9Ta1Q2TWlxRjVk?=
 =?utf-8?B?aFFMZ3RyQXRWeVVIazVSMDJXWXVXZXNuWVFxbm9wd253aUpKOWhEcUxtKzVU?=
 =?utf-8?B?ZC83dG4vTUNhRlVac2kxckVRaXlyV0NNNWpXV2tZRndZT0pFWDVxM015TmJ4?=
 =?utf-8?B?eXo1L1VCUmlsU1JUQnZoVVp2VnZ2aGwrREJrVXlrYVFKcWNQdE1WU1NwV2xQ?=
 =?utf-8?B?ZnNkR3BNbFpJNGFQTzZmRDBFeEFwZlhLWWZxNVRlaTBidUlCYWRDMElrWi8w?=
 =?utf-8?B?NzFQSFlyUlpNVktlYXlvSFA5RVdjS3JqTy94OGxuNDVEL3RKZTM1T08vNC9r?=
 =?utf-8?B?UVJkQ3JXTThiTG0xakFhRVBYYzlrQXRrWTFkSUtTNnpYNk1mL2x0bVA1K1Z1?=
 =?utf-8?B?Z3I5dzhualFkTzY3RUI5MFI1QmVUT0U0d3BuZnlnNlBzVVlyc2NVTUFvZnNv?=
 =?utf-8?B?NTdUUkJEZFU2MWlQRUlYdlZTK211Mjd4WmMxYU9MbFJiZUx5ZUtheldKOStz?=
 =?utf-8?B?RnBCUWtzUW5XOEhmMlJaYVV2ZjU4QVdpMUszWnBsN2swUEpIVTkwUks5WFV6?=
 =?utf-8?B?ZG0vWHlmdUVRam5TKys5Qy9yendkTy9rcVlkRFZ4NmlUY3FtSUlneTlQRmY3?=
 =?utf-8?B?SVhjVlgvL2xOWVd2ZEpRMmpmNTk2MjhwbjZGRXVnUXNKaXVIaHFnSGxIaWJu?=
 =?utf-8?B?aHYvVXNsUzYrSHRIeEFPc0U4WTEzOERYbXcwc1N4NW9yc25ZRzJDSGpoY0FP?=
 =?utf-8?B?NS9pbk5HSWVQN1hoa0RzS2ZmTm9NdWpZWWU4RjNjTXNWaGNFck5TTUhQZzFY?=
 =?utf-8?B?c1lCTnVEYXl0M2hlYXphRjg2a3ZDR2tDTUJPaGpxRVNzeEZPUXowckN5YUpQ?=
 =?utf-8?Q?r/tLy+VkLDSmeLdsOYNvvEDQFUmTYgeopClhy4g?=
X-OriginatorOrg: windriver.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 42085f9b-8699-4e97-5a9c-08d8e39d70a3
X-MS-Exchange-CrossTenant-AuthSource: BYAPR11MB3480.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 10 Mar 2021 08:21:01.4708
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 8ddb2873-a1ad-4a18-ae4e-4644631433be
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 0oDgsV2za9sFmaOYYHjmuH/t6s6786qgSH1ypDBlyuRbIJqPEQjptAqDN7PDi/51UcglaqICwF/F4UIIkWpRww==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SJ0PR11MB5134
Content-Type: multipart/alternative;
 boundary="------------D7D9A7C443145FFF3AE385EA"

--------------D7D9A7C443145FFF3AE385EA
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 7bit

On 03/08/2021 02:09 PM, Chen Qi wrote:
> On 03/08/2021 10:30 AM, Chen Qi wrote:
>> On 03/06/2021 07:29 AM, Richard Purdie wrote:
>>> On Fri, 2021-03-05 at 18:10 +0800, Chen Qi wrote:
>>>> As we delete the .git/ directory, it's impossible to get METADATA_REVISION
>>>> inside eSDK. Because of this, we meet the following warning when installing eSDK.
>>>>
>>>>    WARNING: The base-files:do_install sig is computed to be 16b9d96148d45de183cc94667aae016ec7d102d48255456381e718cd4bbd0aa0, \
>>>>    but the sig is locked to 6eb0dcaed504282becee94662481d79264db920dee1f7deda18230133fff8f36 in SIGGEN_LOCKEDSIGS_t-qemux86-64
>>>>
>>>> So we record METADATA_REVISION in eSDK generation time to fix this problem.
>>>>
>>>> Signed-off-by: Chen Qi<Qi.Chen@windriver.com>
>>>> ---
>>>>   meta/classes/populate_sdk_ext.bbclass | 3 +++
>>>>   1 file changed, 3 insertions(+)
>>> I have to wonder why base-files is depending on the metadata-revision? That
>>> implies that base-files and hence anything that depends upon it would rebuild
>>> each time you update to a new revision. Is that really what you want?
>>>
>>> Cheers,
>>>
>>> Richard
>>>
>>>
>>>
>>>
>> Hi Richard,
>>
>> I tested it on pure yocto project. No extra layer or configuration.
>> I'm also wondering why base-files do_install depends on 
>> METADATA_REVISION. The strange thing is that things do not rebuild at 
>> eSDK installation time. There's only a warning about base-files 
>> do_install signature.
>>
>
> Just found answer for the above problem.
> A previous commit changes poky.conf to make DISTRO_VERSION contain 
> METADATA_REVISION.
> """
> poky.conf: do not write current date into distro version, use git hash instead
>
> """
>
> I also confirmed that merely updating the git revision will result in 
> a rebuild of base-files.
> Rebuild of base-files does not result in rebuild of other recipes 
> because we have 'base-files' in SIGGEN_EXCLUDERECIPES_ABISAFE.
>
> For the problem below, I haven't found the root cause, still working 
> on it.
>
> Best Regards,
> Chen Qi
>
>> In fact, this is a problem I found when I was dealing with another 
>> problem with eSDK.
>> *Yocto's current eSDK cannot be successfully installed on a different 
>> distro.* For example, you build esdk on ubunt18 and install the esdk 
>> on ubuntu20, then you'll get an error of pseudo do_fetch task re-run 
>> unexpectedly.
>> I think it might be related to NATIVELSBSTRING, but I haven't found 
>> out why.
>> Manually setting NATIVELSBSTRING to some fixed string such as 'Linux' 
>> will solve the above problem.
>>
>> I'm still checking the codes. If you have some idea/suggestion, 
>> please let me know.
>>

I think I've found the problem.

"""
commit 3ecf5d9692fec97b37af6a4e6c747a4e2c2ca292
Author: Richard Purdie <richard.purdie@linuxfoundation.org>
Date:   Sat Nov 21 16:16:40 2020 +0000

     uninative: Don't use single sstate for pseudo-native

     pseudo-native is a bit special. It conditionally compiles in 
support for
     xattr, statx and statvfs amongst other options. If a pseudo-native 
binary is
     used on a system where these functions are present but it wasn't 
compiled in
     we see hard to debug permissions problems.
[snip]
"""

This commit effectively says that the pseudo-native's sstate cache 
should not be shared among hosts with different distros, as it's 
appending ${ORIGLSBSTRING} to SSTATE_PKGARCH for pseudo-native.

I'm not familiar with the pseudo's codes. But I'm wondering if it's 
possible for pseudo to always build in attr support and behave 
differently on different hosts/filesystems.

Best Regards,
Chen Qi

>> Best Regards,
>> Chen Qi
>>
>>
>>
>
>
>
> 
>


--------------D7D9A7C443145FFF3AE385EA
Content-Type: text/html; charset=utf-8
Content-Transfer-Encoding: 8bit

<html><head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8">
  </head>
  <body bgcolor="#FFFFFF" text="#000000">
    <div class="moz-cite-prefix">On 03/08/2021 02:09 PM, Chen Qi wrote:<br>
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
        rebuild at eSDK installation time. There's only a warning about
        base-files do_install signature.<br>
        <br>
      </blockquote>
      <br>
      Just found answer for the above problem.<br>
      A previous commit changes poky.conf to make DISTRO_VERSION contain
      METADATA_REVISION.<br>
      &quot;&quot;&quot;<br>
      <pre wrap="">poky.conf: do not write current date into distro version, use git hash instead</pre>
      <br>
      &quot;&quot;&quot;<br>
      <br>
      I also confirmed that merely updating the git revision will result
      in a rebuild of base-files.<br>
      Rebuild of base-files does not result in rebuild of other recipes
      because we have 'base-files' in SIGGEN_EXCLUDERECIPES_ABISAFE.<br>
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
        I'm still checking the codes. If you have some idea/suggestion,
        please let me know.<br>
        <br>
      </blockquote>
    </blockquote>
    <br>
    I think I've found the problem.<br>
    <br>
    &quot;&quot;&quot;<br>
    commit 3ecf5d9692fec97b37af6a4e6c747a4e2c2ca292<br>
    Author: Richard Purdie <a class="moz-txt-link-rfc2396E" href="mailto:richard.purdie@linuxfoundation.org">&lt;richard.purdie@linuxfoundation.org&gt;</a><br>
    Date:&nbsp;&nbsp; Sat Nov 21 16:16:40 2020 +0000<br>
    <br>
    &nbsp;&nbsp;&nbsp; uninative: Don't use single sstate for pseudo-native<br>
    &nbsp;&nbsp;&nbsp; <br>
    &nbsp;&nbsp;&nbsp; pseudo-native is a bit special. It conditionally compiles in
    support for<br>
    &nbsp;&nbsp;&nbsp; xattr, statx and statvfs amongst other options. If a
    pseudo-native binary is<br>
    &nbsp;&nbsp;&nbsp; used on a system where these functions are present but it wasn't
    compiled in<br>
    &nbsp;&nbsp;&nbsp; we see hard to debug permissions problems.<br>
    [snip] &nbsp;&nbsp; <br>
    &quot;&quot;&quot;<br>
    <br>
    This commit effectively says that the pseudo-native's sstate cache
    should not be shared among hosts with different distros, as it's
    appending ${ORIGLSBSTRING} to SSTATE_PKGARCH for pseudo-native.<br>
    <br>
    I'm not familiar with the pseudo's codes. But I'm wondering if it's
    possible for pseudo to always build in attr support and behave
    differently on different hosts/filesystems.<br>
    <br>
    Best Regards,<br>
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
  </body>
</html>

--------------D7D9A7C443145FFF3AE385EA--
