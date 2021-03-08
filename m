Received: from NAM10-DM6-obe.outbound.protection.outlook.com (NAM10-DM6-obe.outbound.protection.outlook.com [40.107.93.68])
 by mx.groups.io with SMTP id smtpd.web10.32042.1615183153926771132
 for <openembedded-core@lists.openembedded.org>;
 Sun, 07 Mar 2021 21:59:14 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@windriversystems.onmicrosoft.com header.s=selector2-windriversystems-onmicrosoft-com header.b=kJALbnpJ;
 spf=pass (domain: windriver.com, ip: 40.107.93.68, mailfrom: qi.chen@windriver.com)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=GI+uuP9OM5e465CwzrUVXaMLFNLg5WA6D6Daw0pNOpyJr5FNEsBfNXpI66h0jcr/fzyYW6Z7bPb0AxtL5q+carW2ClfGpf2ayLUZ/w8iWno0S4oEJWmQtg4LnXZJ1c/ycACUaRGbY1DJcKcww9hDLC1mI7+Pk8ePVeD1VTJusBUt/Xfz1BYTeLbM2xBc+EK7CZarRgF4ZrZIncqHGyDc3TXAU3K3l7qm8rouN4stQSPBHkii+WwU2Tv65TqKp+Uw626tJAMXjW53rn2JjTRsh+gWF5dKK1eKqYGb0MzqvlNcZ+4zGEUAOhwife7oSlXGBuefg50gOsz39rSY4K9z6Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=5oVvFOLwCx5T/Mua9gArpp22PXvCGgGePUy3bkR/YMI=;
 b=JyN3rBd5zjb4ryDAWJ0Ilx53yRw1RaA99ErAOmhXVNG3VAS+Mdt3WCeSJH7TD6WyYkGjEelaaZCFJpqzoFuGBDeEYVQAvHfa9zL4C3hTubUSJIIRrBXHjaRHcuNeYfqX4vbSbPoa+NhTAKvcGuZFOzavd3+Qk1taY/JV9BJqArX8LRBWJriAgFnzpFwS4J7IeEvZ2/Hoc9jNiBJlACFY8FLeyucI8q/6Tp4uBwFU/jT8ZbC0Kty2s5o6RUxULDTy+sIyky6pasetw9/2NwJkVM7+ZGFJQ+oEQx1EMK3IxBuIosOxRD2y+jLcWS4d8c3/07mRDaNVpWrR/u+7W3jIfQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=windriver.com; dmarc=pass action=none
 header.from=windriver.com; dkim=pass header.d=windriver.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=windriversystems.onmicrosoft.com;
 s=selector2-windriversystems-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=5oVvFOLwCx5T/Mua9gArpp22PXvCGgGePUy3bkR/YMI=;
 b=kJALbnpJv3PIOFPfP06xEPADzRDGgpamYsi+wZzPWxLgNvzvDo3G1kHahdZyfp3RU8Adg4HvBUOkKuwbVkms0L2UbIMgsfzGHkXnCb5G2CRSLSvcjZgPJH0amgHRZpwtkfsN2qQUNzYpaw+NSRf28OggirXwlz9CWb1LIIUCl3g=
Authentication-Results: lists.openembedded.org; dkim=none (message not signed)
 header.d=none;lists.openembedded.org; dmarc=none action=none
 header.from=windriver.com;
Received: from BYAPR11MB3480.namprd11.prod.outlook.com (2603:10b6:a03:79::27)
 by BYAPR11MB2840.namprd11.prod.outlook.com (2603:10b6:a02:c9::10) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3890.28; Mon, 8 Mar
 2021 05:59:11 +0000
Received: from BYAPR11MB3480.namprd11.prod.outlook.com
 ([fe80::d9b:3f7c:136d:e60]) by BYAPR11MB3480.namprd11.prod.outlook.com
 ([fe80::d9b:3f7c:136d:e60%7]) with mapi id 15.20.3890.037; Mon, 8 Mar 2021
 05:59:11 +0000
Subject: Re: [OE-core][PATCH] populate_sdk_ext: record METADATA_REVISION
To: Richard Purdie <richard.purdie@linuxfoundation.org>,
 openembedded-core@lists.openembedded.org
References: <20210305101040.822-1-Qi.Chen@windriver.com>
 <47f42aa6bef23d8c98ea9cf2a8029f6900dd7d61.camel@linuxfoundation.org>
 <166A3C91F1FD80D0.3944@lists.openembedded.org>
From: "Chen Qi" <Qi.Chen@windriver.com>
Message-ID: <367602e9-4257-7f1d-a040-263017f00a37@windriver.com>
Date: Mon, 8 Mar 2021 14:09:14 +0800
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:45.0) Gecko/20100101
 Thunderbird/45.4.0
In-Reply-To: <166A3C91F1FD80D0.3944@lists.openembedded.org>
X-Originating-IP: [60.247.85.82]
X-ClientProxiedBy: HK2PR0401CA0002.apcprd04.prod.outlook.com
 (2603:1096:202:2::12) To BYAPR11MB3480.namprd11.prod.outlook.com
 (2603:10b6:a03:79::27)
Return-Path: Qi.Chen@windriver.com
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from [128.224.162.161] (60.247.85.82) by HK2PR0401CA0002.apcprd04.prod.outlook.com (2603:1096:202:2::12) with Microsoft SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.20.3912.17 via Frontend Transport; Mon, 8 Mar 2021 05:59:10 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: c93a711f-b824-426c-db78-08d8e1f74b9b
X-MS-TrafficTypeDiagnostic: BYAPR11MB2840:
X-Microsoft-Antispam-PRVS: 
	<BYAPR11MB28408BF4952D7BB2C383975BED939@BYAPR11MB2840.namprd11.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:8882;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 
	PGgw6fXPa9jEQkWyziX/l9N0XI+MpXSC936Quw09ctRwS2rU9ZApF9F64sbJvh0NfxXMLRd01oMWI69PpsA47uUWRBycWs1v9ym5KiqF79liLnGRKaKNM8V4OAXxVafzEe5E05euCpLo+WDDfgMDV23J5NaGgECSyCxausopdd5DYqLusxsK6AgYBYwjNabB1evWrVrbuR26tvOeNPEMCsPiwWQUPZQ4jEQBltpdjcwkvSLN85M0yPsU7cm7O/FmI5gueHek50sbdlrirOY4Z5rIPtPMk3jcBPczV798oH7BZT3SDUHj7AjBIsqODOwu4V3RbUiTM9MITtc8SD0fNVPB1YW/gPMzCoUSE8nEtMvt1ih09+8TYhJTOa0jDOl6T3/2oxaU3FFwZQs/ILgnIfKxHJ47Vo9EXQH5UL/CmA7caJH15OcFJ+oPbTrzfGE0g9E3m1lPaSRbwi7yLeCizOuHml1+87k7AmFZUUFnVLNMHpytxz/wksietwuh8wlB6reBFIYkFTGJvN7vX4nR1wjcv2RsVP0FwS8gX3aWCr3IQb5+gxXwuEsaRaG8V9GS5peT/8YA9WoQhX8OajSi63KRx/Rp5Z/RhaMPErjIbB1g6ME12RDDU8ZQYlbzGh2UkL3dLOSWHGHTyZNuxizP42IpCSBEKHtSs07zxT0AYCOD9/gJq3Pb1i9vgv+aPdMod2QWikm6eXPlwcvbr267rw==
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:BYAPR11MB3480.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(4636009)(136003)(39840400004)(376002)(346002)(396003)(366004)(5660300002)(478600001)(6486002)(8936002)(8676002)(86362001)(16576012)(166002)(36756003)(66946007)(2906002)(66556008)(316002)(66476007)(186003)(6706004)(26005)(16526019)(53546011)(83380400001)(31686004)(966005)(956004)(2616005)(33964004)(52116002)(31696002)(78286007)(43740500002)(45980500001);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData: 
	=?utf-8?B?Qm9HQWRDMTZaOTYxUURiYXcwdGhaRUVQRFQ5Wkl2Szd3V0tNYkVqbWZXRXB4?=
 =?utf-8?B?VlloMVJzdFJJTk5DanJKVUM5WkE5V2RPaDFyU1pMNW1DYnRoZ2hxNDRHL000?=
 =?utf-8?B?UWlXZWRXTXBEM05ZdndaUnpvYzNWbEdxL1NldEl1MHZLU1RwcjB6ekJwT2hE?=
 =?utf-8?B?cUNqMmZnM1JNWm45eVVJaEsyaDk2QWdSOFdycXVkK1lLcnErekJWYWJDYmNw?=
 =?utf-8?B?ODE3bVduRjk5T29DSmdJYVR0NnZYSUxVM3lPOGJQSi93TENvYTEvUkMxT0FN?=
 =?utf-8?B?TnFreitjdCtjaDZVRnN4MG5rS1Z5a01heGQ1c2N4dkNJYjFwZGQ0djI5THhm?=
 =?utf-8?B?Y3pZYjZsMGNBQVNhMGpldEdORHZYVjRrRXNiZ3c4WlBqLzhRdlg1UVhrVzFB?=
 =?utf-8?B?QkRqMkYzRi9Gcm14cU1EK2wrQlNkNm1zV3JyRU54czJWODQrdW91dmRYNnNv?=
 =?utf-8?B?K25FY3FBNTVKRXBCcUJJdXAvV0FvbTdFd29rN09udXpSNEhYdEtTUjNBcXRp?=
 =?utf-8?B?R0ZJSjhRMXNHUnZ1NTRodEZRMlFaQXlkaXltZERJcXV0dHE5S1FncjZVTDRa?=
 =?utf-8?B?QXVhcHNIeGQrRldVSm0yTEU5SGhzdDZnTWZ1eUpUSDVnTUd5WkExMUY1Mmc1?=
 =?utf-8?B?Y2hUR2FHK2VVWmo2d3JaNklWODNKSFc3cDFVT2t3WnFPK0tuQWpTam9lMVBC?=
 =?utf-8?B?Q3VQRXhPaUpYY2NvWmFpMElkMFRhblB0cnl2aGpnK3lzbjkreTNkRW1rZGN4?=
 =?utf-8?B?d2lEcnBqeFJjbnkwQWRyQ0YxTmt2V0xvRElySXNRUU04RWQ2QjJiSWRNbWNq?=
 =?utf-8?B?T0FJKzFUUEpDYWRsMVJBT3V5QXlyL3paQnlvUUorbHlKM21ZdGlranVtdmpZ?=
 =?utf-8?B?N1RSUDBqL0xVckFlQlZPdFgwejFydGVVa0tNTXVPTE8xM25SVlUzWnZMZ0hV?=
 =?utf-8?B?V3MzUjFKT3BidTVycjRkMFFtRFRLNTdsNW82eHdETWM1ZGhzZjd0TXJ0MlhJ?=
 =?utf-8?B?SUIxOTZLWTA0THBsbjFIMm5FZUhSZEE5ZTZYR3EwR3FXTll4czFrbjBDN0s5?=
 =?utf-8?B?TmRIWEE3bndVd1d2Vk1YWkRzTG4vK2c3dmYzRWxDR0NtTmJWRURvbkU0QTRs?=
 =?utf-8?B?eThDQVp6dkE1b0EwcjZlcjRlZlIxL292aktDdktiWVdla3pweEUybUlWR1l3?=
 =?utf-8?B?dkpXN1J6UDdYUjlkVDBCL3NBa3N4em5XdlNCQXJQREdrQ2RYSHgzVFEza3dY?=
 =?utf-8?B?b29EaU84ZlBydTRJMStmUDhOemJ2RzRLVGZ3MHJqU3N2UmNKUE5vdVpla05t?=
 =?utf-8?B?aklkZnN3TEQ0NTlLSHdCTVVTcW9QMmRadU1ncElQNzZiV3I1OVp5NEVqQld2?=
 =?utf-8?B?UDJPQ01nME9sa0FmU0pNYVVhM0JTRVc4SEhhN2ttSHFqYkJsQWo5VWhiVXdG?=
 =?utf-8?B?QU0yRktEd2F1QXIwcnBjNXY2U3BBOWxwYnZ0ZVo1bmJwVkUyb3hTeU5ienhv?=
 =?utf-8?B?UHBpQUNGTERJcElUOWdzR1JPQkRvMGN5REQ1Rm9ESU54ZDU1aFJlczJ3azkr?=
 =?utf-8?B?OXh3cTFBV3k5Z1RhWmN2MXYrZHQ1QU5WeHVTdVdXd1o0QlNieUNaQ08yWWVu?=
 =?utf-8?B?dFo5U0dDeElxOFh2MTMwSXBLZndkb044RXVFejJFVHBSYytnWENYYytuZllL?=
 =?utf-8?B?dXFFQUQxOWtBMnpDS3Z5Z2xJUzNHSlRkaWFTZXdUMm9IM3NXQ3p2U1k1OExi?=
 =?utf-8?Q?jnEvbEg9JA132ue2Ji3lX3Xlg9QSvjI7aVLTJ/8?=
X-OriginatorOrg: windriver.com
X-MS-Exchange-CrossTenant-Network-Message-Id: c93a711f-b824-426c-db78-08d8e1f74b9b
X-MS-Exchange-CrossTenant-AuthSource: BYAPR11MB3480.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 08 Mar 2021 05:59:11.7310
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 8ddb2873-a1ad-4a18-ae4e-4644631433be
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: om135d5ancAznOD+UxXD6E5uh5jj8VIGjVCMF6mFDK3C3xEYCuIIK0mAFX71/L1V+yxPZWXmgKL06V6tV/wiHg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BYAPR11MB2840
Content-Type: multipart/alternative;
 boundary="------------6EE21271F0B558B323C01352"

--------------6EE21271F0B558B323C01352
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 7bit

On 03/08/2021 10:30 AM, Chen Qi wrote:
> On 03/06/2021 07:29 AM, Richard Purdie wrote:
>> On Fri, 2021-03-05 at 18:10 +0800, Chen Qi wrote:
>>> As we delete the .git/ directory, it's impossible to get METADATA_REVISION
>>> inside eSDK. Because of this, we meet the following warning when installing eSDK.
>>>
>>>    WARNING: The base-files:do_install sig is computed to be 16b9d96148d45de183cc94667aae016ec7d102d48255456381e718cd4bbd0aa0, \
>>>    but the sig is locked to 6eb0dcaed504282becee94662481d79264db920dee1f7deda18230133fff8f36 in SIGGEN_LOCKEDSIGS_t-qemux86-64
>>>
>>> So we record METADATA_REVISION in eSDK generation time to fix this problem.
>>>
>>> Signed-off-by: Chen Qi<Qi.Chen@windriver.com>
>>> ---
>>>   meta/classes/populate_sdk_ext.bbclass | 3 +++
>>>   1 file changed, 3 insertions(+)
>> I have to wonder why base-files is depending on the metadata-revision? That
>> implies that base-files and hence anything that depends upon it would rebuild
>> each time you update to a new revision. Is that really what you want?
>>
>> Cheers,
>>
>> Richard
>>
>>
>>
>>
> Hi Richard,
>
> I tested it on pure yocto project. No extra layer or configuration.
> I'm also wondering why base-files do_install depends on 
> METADATA_REVISION. The strange thing is that things do not rebuild at 
> eSDK installation time. There's only a warning about base-files 
> do_install signature.
>

Just found answer for the above problem.
A previous commit changes poky.conf to make DISTRO_VERSION contain 
METADATA_REVISION.
"""

poky.conf: do not write current date into distro version, use git hash instead


"""

I also confirmed that merely updating the git revision will result in a 
rebuild of base-files.
Rebuild of base-files does not result in rebuild of other recipes 
because we have 'base-files' in SIGGEN_EXCLUDERECIPES_ABISAFE.

For the problem below, I haven't found the root cause, still working on it.

Best Regards,
Chen Qi

> In fact, this is a problem I found when I was dealing with another 
> problem with eSDK.
> *Yocto's current eSDK cannot be successfully installed on a different 
> distro.* For example, you build esdk on ubunt18 and install the esdk 
> on ubuntu20, then you'll get an error of pseudo do_fetch task re-run 
> unexpectedly.
> I think it might be related to NATIVELSBSTRING, but I haven't found 
> out why.
> Manually setting NATIVELSBSTRING to some fixed string such as 'Linux' 
> will solve the above problem.
>
> I'm still checking the codes. If you have some idea/suggestion, please 
> let me know.
>
> Best Regards,
> Chen Qi
>
>
> 
>


--------------6EE21271F0B558B323C01352
Content-Type: text/html; charset=utf-8
Content-Transfer-Encoding: 8bit

<html><head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8">
  </head>
  <body bgcolor="#FFFFFF" text="#000000">
    <div class="moz-cite-prefix">On 03/08/2021 10:30 AM, Chen Qi wrote:<br>
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
      METADATA_REVISION. The strange thing is that things do not rebuild
      at eSDK installation time. There's only a warning about base-files
      do_install signature.<br>
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
    For the problem below, I haven't found the root cause, still working
    on it.<br>
    <br>
    Best Regards,<br>
    Chen Qi<br>
    <br>
    <blockquote cite="mid:166A3C91F1FD80D0.3944@lists.openembedded.org" type="cite"> In fact, this is a problem I found when I was dealing
      with another problem with eSDK.<br>
      <b>Yocto's current eSDK cannot be successfully installed on a
        different distro.</b> For example, you build esdk on ubunt18 and
      install the esdk on ubuntu20, then you'll get an error of pseudo
      do_fetch task re-run unexpectedly.<br>
      I think it might be related to NATIVELSBSTRING, but I haven't
      found out why.<br>
      Manually setting NATIVELSBSTRING to some fixed string such as
      'Linux' will solve the above problem.<br>
      <br>
      I'm still checking the codes. If you have some idea/suggestion,
      please let me know.<br>
      <br>
      Best Regards,<br>
      Chen Qi<br>
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

--------------6EE21271F0B558B323C01352--
