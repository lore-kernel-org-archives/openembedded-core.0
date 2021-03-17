Received: from NAM04-BN3-obe.outbound.protection.outlook.com (NAM04-BN3-obe.outbound.protection.outlook.com [40.107.68.51])
 by mx.groups.io with SMTP id smtpd.web10.1330.1615946891291164334
 for <openembedded-core@lists.openembedded.org>;
 Tue, 16 Mar 2021 19:08:11 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@windriversystems.onmicrosoft.com header.s=selector2-windriversystems-onmicrosoft-com header.b=EL/I8+Zj;
 spf=pass (domain: windriver.com, ip: 40.107.68.51, mailfrom: li.wang@windriver.com)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=GvQwlyP0Qvr4hlInwJq6r83XJkS23d48PQpez/0zcoogDw6tgyrX7n5UBX16ViAf9KRTwbpOuAvhn8FGBjpBOQfe6S6HKBqfS3orwKhEyDq1xx2oxOdOTYzNBK5lxF4VJoORoDm08NnqawUGxxVIXHoqxHRQ9Y0U0lD2dakF2BvvKaBtNO7Q+8akMxryEW2dacF9BYt4Q0R8m536fWqOLERlId5mLseOUgaJ9Dg/xG2SkrEMQvtkHjZQFkUYt3PSQG0jXQzkav0hNmb6fkvBhrl0sJKUL7cbscMfT8FEyLPIo85jFbaSPMGCM4Q51mRpBv6XqJbnt7rou6UtxPgUrw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=yhz476rw1XRgzp5sl9v5Kr0is0BGoAFnFhznuvtA7qA=;
 b=Klfy1Cs+i7kqcCwk37sEXd7RBH96HMgkPJjeKGyNiJuquPM5khIdsz4MWPXs9MkX+sTLzn8HEbEcLoAc1WrZ+2TFwdhiOWUY1JG0O6RSuvk4ChU2/ZH0aHIXbuaOJ0vyyPCH9Lqp+e6v072VYhz5fhtNRWaZkMZsu4HCRdR8jphrZ6UBqYDmYCOiat2qbVdenALuwB8iDSb26+Atuf7NyZIO/+kPNhxpJWHNaLr+bYpX0N0EW+tODOfIRzOSjuZ+eiIDwEcQF/s7EjcZIKDzlIKbb39Ii0zvq5RacoN5eh6ESUMljOpGO7lCeUWVxQAarzJ+YTcdgNW3+3bf4wExJg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=windriver.com; dmarc=pass action=none
 header.from=windriver.com; dkim=pass header.d=windriver.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=windriversystems.onmicrosoft.com;
 s=selector2-windriversystems-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=yhz476rw1XRgzp5sl9v5Kr0is0BGoAFnFhznuvtA7qA=;
 b=EL/I8+ZjEJs5R0dG4QUNCfywv4ZOwgEL+NBM9itilOqYdE2ru/BubNHUmP2scsSGdy1rwXQXA+a+LglSh/0Nyzf5dZ1f5WcPAEaniAldS2vgwIm4HK3fX8OGZ3O7Cs3kg5jBJ1PunrZ9qj5u5O/hXnY1nbf9sS+lF9SZzjPLLuo=
Authentication-Results: lists.openembedded.org; dkim=none (message not signed)
 header.d=none;lists.openembedded.org; dmarc=none action=none
 header.from=windriver.com;
Received: from DM6PR11MB3595.namprd11.prod.outlook.com (2603:10b6:5:142::16)
 by DM6PR11MB2714.namprd11.prod.outlook.com (2603:10b6:5:ce::14) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3933.31; Wed, 17 Mar
 2021 02:08:09 +0000
Received: from DM6PR11MB3595.namprd11.prod.outlook.com
 ([fe80::f503:3124:d48:ccb1]) by DM6PR11MB3595.namprd11.prod.outlook.com
 ([fe80::f503:3124:d48:ccb1%6]) with mapi id 15.20.3955.018; Wed, 17 Mar 2021
 02:08:09 +0000
Subject: Re: [OE-core][PATCH] linux-dummy: add empty dependent packages
From: "Li Wang" <li.wang@windriver.com>
To: Richard Purdie <richard.purdie@linuxfoundation.org>,
 openembedded-core@lists.openembedded.org
References: <1615542770-26280-1-git-send-email-li.wang@windriver.com>
 <7f61a68faa2e2d14eb41770f7e4973c38abb409d.camel@linuxfoundation.org>
 <166BB6ABA401E063.22828@lists.openembedded.org>
Message-ID: <dcf612da-579c-6242-c440-fecc1e235b6f@windriver.com>
Date: Wed, 17 Mar 2021 10:08:00 +0800
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:78.0) Gecko/20100101
 Thunderbird/78.8.1
In-Reply-To: <166BB6ABA401E063.22828@lists.openembedded.org>
X-Originating-IP: [60.247.85.82]
X-ClientProxiedBy: HK2PR04CA0051.apcprd04.prod.outlook.com
 (2603:1096:202:14::19) To DM6PR11MB3595.namprd11.prod.outlook.com
 (2603:10b6:5:142::16)
Return-Path: li.wang@windriver.com
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from [128.224.155.140] (60.247.85.82) by HK2PR04CA0051.apcprd04.prod.outlook.com (2603:1096:202:14::19) with Microsoft SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3933.31 via Frontend Transport; Wed, 17 Mar 2021 02:08:08 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 08afe15d-6270-4ea2-ebfc-08d8e8e982d0
X-MS-TrafficTypeDiagnostic: DM6PR11MB2714:
X-Microsoft-Antispam-PRVS: 
	<DM6PR11MB2714857B781BBA4A4D11383AEF6A9@DM6PR11MB2714.namprd11.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:5797;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 
	b+WxptJYOkStO8H3ZtsdO4/Yqb3ppjN8U203Uqm/Q+jTVFp6az3lQlBARqyh0TvgvEYGnQ0lkQkvHFCA/E2AFoJGTp0gAHj0lSX/mfF1RsbzORoUA9jx9KDOkBjXG60gI4PEjlTDrXuYKB/Jk1anWkv9PMTHfb6x8+vMj1dpMcVR/9Dy8uJQD85fLD1scH6RViC+U8Qvs1li8NHfZlJWniBFqsp5Xa6kVrydL79tA0aB8oByRghR16DkCxPor0ugw83aodX8f3739ff6cl3fBbBjmuWpJowcMZTIscU6MZUU1lSPyrvOeNRYIffI6SzCeLmpML1fRVbpWwcXMXCsLa0KBxT6HwJYqQ8T8081BXTUUf7RpUkOc3bRqOFDYxapWsA3S9aSTQBaoaXfCSf6pTpYp/LnkXSUIDC7kJvSDGp6qSdong60shDVhclgtVdlMzk5S/DNRc4ghmK+0wxZ3T2+azo6AJddIxDQN1KWWfn0KFLswrki48P7LtvrHn5EoB+e4yJU5+SP/Eo/0knRPDsdpUlIKEcrmK63ByUw46VJ/iNkfbJNCtTc3M2xdLwBj/Azy1k+RNL/QH3usMBpRM382AT+q0Nbkg+qoCtTHg8CHlFEMNDMv8gEJRtBZCyEpNbfiPTJMJQFkxRM1xvFJx8cw7H7iGo/cMS/bqcQBCotDycYTgZna19eV1ok54oBPzu8awm/z7Kg3+Iz3Oz+o4f63ySH/k6lpzXYj5NXAF2wGbby1F2L2pEOeo8EDMM5
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DM6PR11MB3595.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(4636009)(366004)(39850400004)(376002)(136003)(346002)(396003)(8676002)(966005)(5660300002)(6486002)(52116002)(2906002)(956004)(86362001)(26005)(83380400001)(478600001)(36756003)(8936002)(2616005)(33964004)(186003)(66556008)(66476007)(31686004)(316002)(6666004)(16526019)(31696002)(66946007)(6706004)(53546011)(16576012)(166002)(78286007)(43740500002)(45980500001);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData: 
	=?utf-8?B?SGZYQm1Qem8wU1dYMkxlRThwN1Z2ekF3N0V2VUZ1ZzlndnhSZGNGRG1Bcmt3?=
 =?utf-8?B?eEoxR1RDMWJhWEtkSlN5dzhwRTYxdlNmRDVTbGJyZzZoNTdzTGNLMHllREc2?=
 =?utf-8?B?TUJlb2xJdktRM3lRTWVBU29HK09pem1iejA3UFd4ZW5QUmRMbjltQTNobjZw?=
 =?utf-8?B?OHVRZWdsV0VneFFxd1FJV2tiS1FkVVFpRVVzL3dqWiszSWJKVWthM04ycVBU?=
 =?utf-8?B?a1JybDRoZk1xNjZUUHdlakJCeW1uMEswMGltbEkrUWFtVU9oMzB3YnFISXFN?=
 =?utf-8?B?eVRqSFVSTytQZTcwVUxPRzZoN0hQUE9YQjV1d0RkVU5VNkw3QzB0TGx1dnho?=
 =?utf-8?B?VlJDOUU2YjRab1lBZjYyTUJFclBSQ3hFVzVXcWJYL0tid2M0c3k1N1RJWmFC?=
 =?utf-8?B?WnpsZGdoK2xuUlpVY0UxSU0rL0szV2txQ2pTQ3FzVTFrRllZZVlIMnRHVFJ1?=
 =?utf-8?B?cjlpdVlYTmkxVnZIVVAyelIxYUtpekpnMzdEMElsNnAxTjc5UHltQVNhK3FU?=
 =?utf-8?B?Mk1HbGJTelF5N1ZkNFNBU0JOOWNZY3o3Yi9HeDdUYXUwaDlTQlc2bkZQa052?=
 =?utf-8?B?UXBOWm5nQ3FCV01lVmRyeUY2ekRKOTNBNklZL2FVcU1HQnRwTEZ1NzdscTZx?=
 =?utf-8?B?ckQ0bDR1TDA3cW1BZE9Cb3NTQzVtU3BKUDlIMC9uVGNWc2VaZDkvYzFMWG1p?=
 =?utf-8?B?VTNVTjFtTHdLVUl2NnNOaFFNS2RLaWdFM2xqcmY1QWp6eEZ4a0lVemtBc1V2?=
 =?utf-8?B?d3lza2pKdTk2KzJUNGw0b1FDL1hkVEl2N3NQOGd0TnE4ZUZKVE9mNGthQklH?=
 =?utf-8?B?RG1YRTB3YmN5N3MyeUgxWDZacGNwOFM1UkZiVjVSa1VPUEdrUXIrSnBlc3JB?=
 =?utf-8?B?MDJwc2drNThOVkNGYnNxZ2tDN0ZmUnF1dllKSXlBNmhJY2F4M0VwUkJ0aUtY?=
 =?utf-8?B?NHN4MDBPM1g4MGJhbnJFSDRSczJvaDNCd1FSK0kzL2lMbUZzajFSSm5ITUFW?=
 =?utf-8?B?Q1pLWHBIMTZQSVIzb1pqb01iZ1dCdXltL3hOZkdHRkpyTWR3UExUTldySktC?=
 =?utf-8?B?YkM3UmkvZVNBa3hBOWNjRUpTVjVURGxoMkZudUtoVXRWM0U5bE9xRytxazA4?=
 =?utf-8?B?bTd6THRxeExzK3p4ZHV6L05tMm16cGhILzRwNlZoT2k0QUFKdTNpeVJVbk02?=
 =?utf-8?B?WEhDTzliNXVndHNYeFNlcEN1M3BpZ3l0azE4U1Q5d0tIWlQra2J6VmlmVDZJ?=
 =?utf-8?B?cU1uaTE2bER5Y2huWkkweVNwQk4yT1R3NHppenVnUmlKeWs0VnRCVnBGcW1q?=
 =?utf-8?B?bEFYWStheGM0c3BHVWhPc0VlNE9jcXBNM1hIMXVEbHJuZ3dCaTBtUWxSS0Zp?=
 =?utf-8?B?VGJXMVp1WVRCNjdEYzhIclkvVDRFRFQxOFR6THQrdlU3Qmk3UWxvUlovdFQy?=
 =?utf-8?B?cEdvWlZWZ25STDNLcUpiaUN5d3VIK1VIYU1zd21GaVEyYUF2MERackpmUEJ0?=
 =?utf-8?B?NU0wMnpmb0wwdTk2amZOWEk4NlIvT2dUaVJVY2hlQTZEQkpLN29OTzdneHp5?=
 =?utf-8?B?ZzE5dDdhcnVUTVVqZjNRSElFajFyS2NHRnh5cFhKcDdUaFNaK1ljWjg1NHlD?=
 =?utf-8?B?Z2Ntb2lTQzZoa2M2ZnMzbTlrNmRxbjdvbjBDL1dxTkZTbEsxSGlpTEM2MjJQ?=
 =?utf-8?B?ZUJ1VXFQWXNlcW5FR293M1cwTzhHSXBiME1kS1paS203US9Eb0w5cGZMTS9k?=
 =?utf-8?Q?TgmNLACsVQ2UtbwpbPmY1QhcHXGAMAbgKYH1msx?=
X-OriginatorOrg: windriver.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 08afe15d-6270-4ea2-ebfc-08d8e8e982d0
X-MS-Exchange-CrossTenant-AuthSource: DM6PR11MB3595.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 17 Mar 2021 02:08:09.4178
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 8ddb2873-a1ad-4a18-ae4e-4644631433be
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: vpQfzt/Fuh//jPkwcc15ehyi3Oi3u+rB1W5SdquJQim2gSHjoPw84RZHbTUZrrHhuyAsJKXrm42RAEHfo2z7hA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM6PR11MB2714
Content-Type: multipart/alternative;
 boundary="------------82829B436DD636C8A74D55DF"
Content-Language: en-US

--------------82829B436DD636C8A74D55DF
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 8bit

ping!

Thanks,
LiWang.

On 3/13/2021 05:48, Li Wang wrote:
>
> On 3/12/2021 20:44, Richard Purdie wrote:
>> On Fri, 2021-03-12 at 17:52 +0800, Li Wang wrote:
>>> some kernel includes kernel-image-image and kernel-devicetree packages.
>>> these patckages are defined in kernel.bbclass
>>> but, when use linux-dummy, these packages are not defined.
>>> so, define them as empty packages for avoiding compile error:
>>>
>>> ERROR: Nothing RPROVIDES 'kernel-devicetree'
>>>
>>> Signed-off-by: Li Wang <li.wang@windriver.com>
>>> ---
>>>   meta/classes/linux-dummy.bbclass         | 26 
>>> ++++++++++++++++++++++++++
>>>   meta/recipes-kernel/linux/linux-dummy.bb |  2 +-
>>>   2 files changed, 27 insertions(+), 1 deletion(-)
>>>   create mode 100644 meta/classes/linux-dummy.bbclass
>>>
>>> diff --git a/meta/classes/linux-dummy.bbclass 
>>> b/meta/classes/linux-dummy.bbclass
>>> new file mode 100644
>>> index 0000000..cd87915
>>> --- /dev/null
>>> +++ b/meta/classes/linux-dummy.bbclass
>>> @@ -0,0 +1,26 @@
>>> +
>>> +python __anonymous () {
>>> +    if d.getVar('PREFERRED_PROVIDER_virtual/kernel') == 'linux-dummy':
>>> +        # copy part codes from kernel.bbclass
>>> +        kname = d.getVar('KERNEL_PACKAGE_NAME') or "kernel"
>>> +
>>> +        # set an empty package of kernel-devicetree
>>> +        d.appendVar('PACKAGES', ' %s-devicetree' % kname)
>>> +        d.setVar('ALLOW_EMPTY_%s-devicetree' % kname, '1')
>>> +
>>> +        # Merge KERNEL_IMAGETYPE and KERNEL_ALT_IMAGETYPE into 
>>> KERNEL_IMAGETYPES
>>> +        type = d.getVar('KERNEL_IMAGETYPE') or ""
>>> +        alttype = d.getVar('KERNEL_ALT_IMAGETYPE') or ""
>>> +        types = d.getVar('KERNEL_IMAGETYPES') or ""
>>> +        if type not in types.split():
>>> +            types = (type + ' ' + types).strip()
>>> +        if alttype not in types.split():
>>> +            types = (alttype + ' ' + types).strip()
>>> +
>>> +        # set empty packages of kernel-image-*
>>> +        for type in types.split():
>>> +            typelower = type.lower()
>>> +            d.appendVar('PACKAGES', ' %s-image-%s' % (kname, 
>>> typelower))
>>> +            d.setVar('ALLOW_EMPTY_%s-image-%s' % (kname, 
>>> typelower), '1')
>>> +}
>>> +
>> Rather than generating broken empty packages, why not just set 
>> RPROVIDES_${PN}
>> with the appropriate things?
>
> linux-dummy is just an empty package, what does it PROVIDE the 
> appropriate things?
>
> linux-dummy has the similar codes:
>
> =====
>
> oe-core/meta/recipes-kernel/linux/linux-dummy.bb
>
> PACKAGES += "kernel-modules kernel-vmlinux"
> FILES_kernel-modules = ""
> ALLOW_EMPTY_kernel-modules = "1"
> DESCRIPTION_kernel-modules = "Kernel modules meta package"
> FILES_kernel-vmlinux = ""
> ALLOW_EMPTY_kernel-vmlinux = "1"
> DESCRIPTION_kernel-vmlinux = "Kernel vmlinux meta package"
>
> =====
>
> I can offer a more complete empty package as above sample.(FILES_* 
> DESCRIPTION_*)
>
> please give me some suggest about it.
>
> Thanks,
> LiWang.
>
>>
>> Cheers,
>>
>> Richard
>>
>
> 
>

--------------82829B436DD636C8A74D55DF
Content-Type: text/html; charset=utf-8
Content-Transfer-Encoding: 8bit

<html><head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8">
  </head>
  <body>
    <p>ping!</p>
    <p>Thanks,<br>
      LiWang.<br>
    </p>
    <div class="moz-cite-prefix">On 3/13/2021 05:48, Li Wang wrote:<br>
    </div>
    <blockquote type="cite" cite="mid:166BB6ABA401E063.22828@lists.openembedded.org">
      <br>
      On 3/12/2021 20:44, Richard Purdie wrote:
      <br>
      <blockquote type="cite">On Fri, 2021-03-12 at 17:52 +0800, Li Wang
        wrote:
        <br>
        <blockquote type="cite">some kernel includes kernel-image-image
          and kernel-devicetree packages.
          <br>
          these patckages are defined in kernel.bbclass
          <br>
          but, when use linux-dummy, these packages are not defined.
          <br>
          so, define them as empty packages for avoiding compile error:
          <br>
          <br>
          ERROR: Nothing RPROVIDES 'kernel-devicetree'
          <br>
          <br>
          Signed-off-by: Li Wang <a class="moz-txt-link-rfc2396E" href="mailto:li.wang@windriver.com">&lt;li.wang@windriver.com&gt;</a>
          <br>
          ---
          <br>
          &nbsp;&nbsp;meta/classes/linux-dummy.bbclass&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; | 26
          ++++++++++++++++++++++++++
          <br>
          &nbsp;&nbsp;meta/recipes-kernel/linux/linux-dummy.bb |&nbsp; 2 +-
          <br>
          &nbsp;&nbsp;2 files changed, 27 insertions(+), 1 deletion(-)
          <br>
          &nbsp;&nbsp;create mode 100644 meta/classes/linux-dummy.bbclass
          <br>
          <br>
          diff --git a/meta/classes/linux-dummy.bbclass
          b/meta/classes/linux-dummy.bbclass
          <br>
          new file mode 100644
          <br>
          index 0000000..cd87915
          <br>
          --- /dev/null
          <br>
          +++ b/meta/classes/linux-dummy.bbclass
          <br>
          @@ -0,0 +1,26 @@
          <br>
          +
          <br>
          +python __anonymous () {
          <br>
          +&nbsp;&nbsp;&nbsp; if d.getVar('PREFERRED_PROVIDER_virtual/kernel') ==
          'linux-dummy':
          <br>
          +&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; # copy part codes from kernel.bbclass
          <br>
          +&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; kname = d.getVar('KERNEL_PACKAGE_NAME') or &quot;kernel&quot;
          <br>
          +
          <br>
          +&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; # set an empty package of kernel-devicetree
          <br>
          +&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; d.appendVar('PACKAGES', ' %s-devicetree' % kname)
          <br>
          +&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; d.setVar('ALLOW_EMPTY_%s-devicetree' % kname, '1')
          <br>
          +
          <br>
          +&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; # Merge KERNEL_IMAGETYPE and KERNEL_ALT_IMAGETYPE
          into KERNEL_IMAGETYPES
          <br>
          +&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; type = d.getVar('KERNEL_IMAGETYPE') or &quot;&quot;
          <br>
          +&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; alttype = d.getVar('KERNEL_ALT_IMAGETYPE') or &quot;&quot;
          <br>
          +&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; types = d.getVar('KERNEL_IMAGETYPES') or &quot;&quot;
          <br>
          +&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; if type not in types.split():
          <br>
          +&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; types = (type + ' ' + types).strip()
          <br>
          +&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; if alttype not in types.split():
          <br>
          +&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; types = (alttype + ' ' + types).strip()
          <br>
          +
          <br>
          +&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; # set empty packages of kernel-image-*
          <br>
          +&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; for type in types.split():
          <br>
          +&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; typelower = type.lower()
          <br>
          +&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; d.appendVar('PACKAGES', ' %s-image-%s' % (kname,
          typelower))
          <br>
          +&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; d.setVar('ALLOW_EMPTY_%s-image-%s' % (kname,
          typelower), '1')
          <br>
          +}
          <br>
          +
          <br>
        </blockquote>
        Rather than generating broken empty packages, why not just set
        RPROVIDES_${PN}
        <br>
        with the appropriate things?
        <br>
      </blockquote>
      <br>
      linux-dummy is just an empty package, what does it PROVIDE the
      appropriate things?
      <br>
      <br>
      linux-dummy has the similar codes:
      <br>
      <br>
      =====
      <br>
      <br>
      oe-core/meta/recipes-kernel/linux/linux-dummy.bb
      <br>
      <br>
      PACKAGES += &quot;kernel-modules kernel-vmlinux&quot;
      <br>
      FILES_kernel-modules = &quot;&quot;
      <br>
      ALLOW_EMPTY_kernel-modules = &quot;1&quot;
      <br>
      DESCRIPTION_kernel-modules = &quot;Kernel modules meta package&quot;
      <br>
      FILES_kernel-vmlinux = &quot;&quot;
      <br>
      ALLOW_EMPTY_kernel-vmlinux = &quot;1&quot;
      <br>
      DESCRIPTION_kernel-vmlinux = &quot;Kernel vmlinux meta package&quot;
      <br>
      <br>
      =====
      <br>
      <br>
      I can offer a more complete empty package as above sample.(FILES_*
      DESCRIPTION_*)
      <br>
      <br>
      please give me some suggest about it.
      <br>
      <br>
      Thanks,
      <br>
      LiWang.
      <br>
      <br>
      <blockquote type="cite">
        <br>
        Cheers,
        <br>
        <br>
        Richard
        <br>
        <br>
      </blockquote>
      <br>
      <fieldset class="mimeAttachmentHeader"></fieldset>
      <pre class="moz-quote-pre" wrap="">


</pre>
    </blockquote>
  </body>
</html>

--------------82829B436DD636C8A74D55DF--
