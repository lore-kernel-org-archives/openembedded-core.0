Received: from NAM11-BN8-obe.outbound.protection.outlook.com (NAM11-BN8-obe.outbound.protection.outlook.com [40.107.236.79])
 by mx.groups.io with SMTP id smtpd.web10.3357.1608255515135715073
 for <openembedded-core@lists.openembedded.org>;
 Thu, 17 Dec 2020 17:38:36 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@windriversystems.onmicrosoft.com header.s=selector2-windriversystems-onmicrosoft-com header.b=TnLq6QhO;
 spf=pass (domain: windriver.com, ip: 40.107.236.79, mailfrom: qi.chen@windriver.com)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=Wbi0n/9xpo3Uzh4V8en7ZPAikOPBIsNEkFFjwmvstFpEFBm51mbW1p2muwLNrHsDctagbizlhdjzBNEKCtgowUWQi5xNItaXBg7TJOisjNzqVijZ2H7jvd9nBK7ZCMo2EcVt+YmAybjGYkmgYNo/S3fKlMOEHjCZCDZpw+q2sOcx+/arojmDAHNGW17fygo4z9oZksz8xpuhjM2tvmbUcMJzu0oSpFNo7HatS2Rp0PHK35C+GSlWgaXC/ZVuDVz8zV0wTS0lMO1uQEYuUQWBmr3ja4umwWNvv8EsRDER2WtcMpXSoPIPuhWFQpe1yED0nkNnjH0G84i9Z5Nk+KtOUg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=4bBXaUPNGveDW91hzp8oFDoUOX4uIGWjFn8EKU2I99k=;
 b=HWc763Rrohl2NlxUYs1RMpKNcxrOtyJaWzH7+lqNFUvWC1TWSmFDW3IaECPuKrztJg0WbwuBHpGumFEwHDhRzbrZCMb6nLcSNuzQNf2LqTTngKX9YCXYUNkX1aTQO23QFPe/f1rL912D23s0qHaf1ZssdftNtSa7T04P9me2EQxtgZTVXzD6hyruVMpRS5igJIpg4aj4X4hv79yXR50sA29BaJKFqw7Mh7je5uWPIH3ZVH/jq5Cq2xlvI+ipe0acv1OAXG5Pji4ytImxY3KeHzy75lSj3zBiJQeZkMc69o4Zv4JdwWH/40oIKTujW/TAjnVkJQvgchkZVjS0+rMDtw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=windriver.com; dmarc=pass action=none
 header.from=windriver.com; dkim=pass header.d=windriver.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=windriversystems.onmicrosoft.com;
 s=selector2-windriversystems-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=4bBXaUPNGveDW91hzp8oFDoUOX4uIGWjFn8EKU2I99k=;
 b=TnLq6QhO0kVbjZ+V/mDoNw/Q9GBrTXQn+DOe//v+mxPrJq6sQGoYDr3RIjSP37mjLIejnMwkVz7Bi0B+Nf+rGc0zGxeXWks6at7+EyfJrlqWWmy4nbVRCQjEl7XWYP212T45ySiuJ4MVE4AztBbPgmvONiqtQR7EwRPS/eve+Ek=
Authentication-Results: lists.openembedded.org; dkim=none (message not signed)
 header.d=none;lists.openembedded.org; dmarc=none action=none
 header.from=windriver.com;
Received: from BYAPR11MB3480.namprd11.prod.outlook.com (2603:10b6:a03:79::27)
 by BYAPR11MB2679.namprd11.prod.outlook.com (2603:10b6:a02:c7::17) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3654.26; Fri, 18 Dec
 2020 01:38:32 +0000
Received: from BYAPR11MB3480.namprd11.prod.outlook.com
 ([fe80::3c77:a84f:ae81:1cb7]) by BYAPR11MB3480.namprd11.prod.outlook.com
 ([fe80::3c77:a84f:ae81:1cb7%3]) with mapi id 15.20.3654.025; Fri, 18 Dec 2020
 01:38:32 +0000
Subject: Re: [OE-core] [PATCH v2 1/5] systemd: update 246 -> 247
To: openembedded-core@lists.openembedded.org
References: <20201210125312.3302065-1-luca.boccassi@gmail.com>
 <20201214123457.122655-1-luca.boccassi@gmail.com>
 <7d16bf791179cc0e90fd0172e984eeeacb065112.camel@linuxfoundation.org>
 <68d3174ccafddf0732e553e408e8b1c5c62a095f.camel@gmail.com>
From: "Chen Qi" <Qi.Chen@windriver.com>
Message-ID: <9b22c5e2-cf8a-84fc-cb74-addcd06a374a@windriver.com>
Date: Fri, 18 Dec 2020 09:46:25 +0800
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:45.0) Gecko/20100101
 Thunderbird/45.4.0
In-Reply-To: <68d3174ccafddf0732e553e408e8b1c5c62a095f.camel@gmail.com>
X-Originating-IP: [60.247.85.82]
X-ClientProxiedBy: HK2PR0401CA0006.apcprd04.prod.outlook.com
 (2603:1096:202:2::16) To BYAPR11MB3480.namprd11.prod.outlook.com
 (2603:10b6:a03:79::27)
Return-Path: Qi.Chen@windriver.com
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from [128.224.162.161] (60.247.85.82) by HK2PR0401CA0006.apcprd04.prod.outlook.com (2603:1096:202:2::16) with Microsoft SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.20.3676.28 via Frontend Transport; Fri, 18 Dec 2020 01:38:31 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: bd37aafd-c83c-4dc0-69c7-08d8a2f5a130
X-MS-TrafficTypeDiagnostic: BYAPR11MB2679:
X-Microsoft-Antispam-PRVS: 
	<BYAPR11MB2679B6DCD5F21B1D88874E7FEDC30@BYAPR11MB2679.namprd11.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:9508;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 
	fZfJCPnD7RzTKAmqFkA+IEiiHDxQGVAgF2NI9+HyISQhdn97DUMFynCT6oq7xvzPl4G2lmwT1v6WCKEIy2FSlJWnHQEMc3q0CUxgLw6tb9mwUy2JtSs0ONg2ojhbsAWYwOHj1Q+reA414H/tYHDxttwc8CPMcJb0YNXQK+L4sQrAf50Jb8YW7o8xbqXY0UcJOIhmZjOXPHhOKz99i3ftMwG4tmU4bjZksSG7OJZNpy1JiMGPgMV3FjlwBHBrl9IXJXxUmoYmZFfP+/qt7+gpyM7NQutOA5trmAoN9NvNsCvRoSAX3VgIId5mhYSNvzN/yPFujIXv6/3TpzMSMgW5P1EB98FfuamTUUd9Njg0ftEKW8TyC1zVBvWyCCffMBvF1OyBYQnTFVAMpllrijQec/+F0h9Zjq4b6FHOIZG+2QF42PWx8j2/gjQRmISRbJSGrAQiLvOnMAmLoKPA5Gf322mofKfTSVe8m/mc+6AW85KDFSmzSmnvxw+UzrZl0XkGlCM1htke8Tnu5rLacMjlIw==
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:BYAPR11MB3480.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(4636009)(376002)(366004)(136003)(39850400004)(396003)(346002)(31686004)(83380400001)(956004)(186003)(16576012)(16526019)(26005)(5660300002)(6486002)(166002)(2906002)(6706004)(53546011)(33964004)(52116002)(478600001)(15650500001)(966005)(66556008)(4001150100001)(66476007)(36756003)(8676002)(86362001)(8936002)(2616005)(66946007)(6666004)(31696002)(316002)(45080400002)(6916009)(78286007)(43740500002)(45980500001);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData: 
	=?utf-8?B?bmc5bFhmcWNwM0NiR05RTnBBU0QwdnFFMS9LZllnNHhKNVZSZVdTeXh0K0RG?=
 =?utf-8?B?YzQwNUhjU3oyUHFGZGMySXpNLzZLY2JtOTNraklBNGpDb3J3d1ZlUU1RaXk5?=
 =?utf-8?B?aVZJR2JtUmJZRGdHeHZXanREVnlwZWtuNW5xdmJTd01SWkN2a1A4SkNVS0xG?=
 =?utf-8?B?VmhOc1ROV1BrQ2Q3ekxzb0lUS1RnV0tWVGY3VW5KZmlVbkNwU2Q0NXU4Y1k2?=
 =?utf-8?B?R2szZVk0dmUwOVpDRERwcHpWYjc5SUl3bWRtWXNydHRjRE8ydUc4RjlCY3RH?=
 =?utf-8?B?bGNtcFZmcE5CNjFyZ2ppNVg1MHB3T0hZdVFueGJrcDZGQ2YvWWkvU1dNZmlX?=
 =?utf-8?B?alRrbnp5aDZEZEtzdXBuay90TUNoSFpCcytsUkxiTXFYUE5ETU9NSTNjR3ZH?=
 =?utf-8?B?MGdFbXgzZndIdlc1WWQxQ2krOXBDcktTaGRLb2w5ZXJzeXI0SlhvODd4VUEw?=
 =?utf-8?B?WXJBMFVsc3ZxNTBXNUlINnkwVDllUUFGNzdlNUJXaG1MNmNZWkJRMUtUOW1R?=
 =?utf-8?B?RGRIS2pvbkJOeE1xaW04VzRRVnFVVnhxNkdBYWZJY1hoaEdSdlI1Q08vUVM3?=
 =?utf-8?B?OWFyd3NwTUQrWVVkV2lZbU8wQlBwTFQybzFEUUxMYWRxc2FRbERiZkJKakp6?=
 =?utf-8?B?V2NRNE0weC9ZdVBKSGRXUEwvd1BDczdHaEVuYlRnclZTRkhpTjNFZGphNTI3?=
 =?utf-8?B?SGJ0cWFuQWs0ZmFJTlRRRFBkN2xsSjVmZHhDYVUwNngyK1FCMHptaGlLamhx?=
 =?utf-8?B?RkJ5UWwyak5YYzJxZmU3N2h2ZFQ3U2tEUmgwVVdyVU1CbHhBSkZaa05QTjJO?=
 =?utf-8?B?eFBpMm9LRUQ5VWFMaVl2ZjU2cGVFNSs1dUZ5alZwR2JWWGJaYThnbTV6N1VY?=
 =?utf-8?B?dmFBSTgraW5ZU1RsZzRWRG42Z0VLRU00anZtZm1XOGZaLzNIY29ENjJCazla?=
 =?utf-8?B?M1R4Y1VYRExhVHptemRGSWFRbnVHV3ZjOHdvdkU3bTRTRWVINnpHVGV4d2U4?=
 =?utf-8?B?NEdyK3Qxc1VHUXA0NXlZZW13UkdmQWtMQURRcXYzcGN4ZnJ2N25YcW0zaGt4?=
 =?utf-8?B?SWdVUURLelZMWXEvQlN5WmtLdk8vRFhyM1Rxc1hMc1hvWXRCL3gzekdzWXhk?=
 =?utf-8?B?b21kSS9nSFA2M0JLOG4yMFdGVDNaSkFURndpYm9xd2lHZWhtTEhRNjFQTVk5?=
 =?utf-8?B?ek5hLzMyWXMrY1Z4ZUp3elpMcGR3UTFzaVpxaVVhODVZeDA0OW9YcmdXNFoz?=
 =?utf-8?B?d0lxSnUxTHVNZzZ0N0F4ckRXbnB0RUdBV3dEVk5BVXF5Nk8wcGRBNUhpd3pp?=
 =?utf-8?Q?5h/f5/1LNrRh3qYdp+lCozZYI3vLDxr2pu?=
X-OriginatorOrg: windriver.com
X-MS-Exchange-CrossTenant-AuthSource: BYAPR11MB3480.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 18 Dec 2020 01:38:32.7217
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 8ddb2873-a1ad-4a18-ae4e-4644631433be
X-MS-Exchange-CrossTenant-Network-Message-Id: bd37aafd-c83c-4dc0-69c7-08d8a2f5a130
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: SRxDWXRsmvwt/Io+fW3FEdhn/nYN2C3wsMU+nvS5Ww/tx++thHNOrMuDl+cZXUlrsaZdQygSkMIzNjsgbZi7kg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BYAPR11MB2679
Content-Type: multipart/alternative;
 boundary="------------3ADE503AA7B0111EBC73C3AB"

--------------3ADE503AA7B0111EBC73C3AB
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 7bit

On 12/18/2020 01:25 AM, Luca Bocassi wrote:
> On Wed, 2020-12-16 at 18:07 +0000, Richard Purdie wrote:
>> On Mon, 2020-12-14 at 12:34 +0000, Luca Bocassi wrote:
>>> From: Luca Boccassi <luca.boccassi@microsoft.com>
>>>
>>> Update systemd to v247.1.
>>> Add rule for new oomd dbus conf and for new pam.d
>>> conf directory in /usr/lib.
>>> Drop selinux-hook-handling-to-enumerate-nexthop.patch,
>>> merged upstream.
>>> Backport 0001-meson-set-cxx-variable-before-using-it.patch
>>> from v247-stable to fix builds without C++.
>>> Refresh musl patches.
>>>
>>> Signed-off-by: Luca Boccassi <luca.boccassi@microsoft.com>
>>> ---
>>> NOTE: the musl build has only been build-tested, and only on x86_64.
>>> The glibc build has been built and runtime-tested on x86_64 and
>>> arm64.
>> [sorry, hit send early when writing]
>>
>> Unfortunately there is still something not quite right in this patchset
>> as it failed again during testing. There are a few different problems:
>>
>> meta-intel in systemd-boot:
>>
>> https://autobuilder.yoctoproject.org/typhoon/#/builders/100/builds/1016
> Looking into this, thanks
>
>> a reproducibility issue in oe-selftest:
>>
>> https://autobuilder.yoctoproject.org/typhoon/#/builders/79/builds/1651
>> (which did happen last time as well on centos but I don't think was
>> reported on the list, sorry)
>>
>> These urls may help understand why its not reproducible:
>>
>> https://autobuilder.yocto.io/pub/repro-fail/oe-reproducible-20201215-mhq8wl33/packages/diff-html/
>> https://autobuilder.yocto.io/pub/repro-fail/oe-reproducible-20201215-mhq8wl33/
>>
>> (looks like the uid of messagebus is changing at a really quick glance)
> Given your follow-up message about host contamination, is there
> anything I can do here to fix it/mitigate it, or is it a CI issue?
>
>> and a build issue in world-lsb:
>>
>> https://autobuilder.yoctoproject.org/typhoon/#/builders/108/builds/1189
>>
>> At the top of the logs you can see the configuration that is being used
>> for a given build, so for example in the last one, the key difference
>> to some of the other builds might be any one of:
>>
>> DISTRO = "poky-altcfg"
>> DISTRO_FEATURES_append = ' api-documentation'
>> require conf/multilib.conf
>> MULTILIBS = 'multilib:lib32'
>> DEFAULTTUNE_virtclass-multilib-lib32 = 'x86'
>> QEMU_USE_KVM = 'True'
>> INHERIT += 'testimage'
>> SDK_EXT_TYPE = 'minimal'
>> SDK_INCLUDE_TOOLCHAIN = '1'
>>
>> but given its a pam error, I'd strongly suspect the DISTRO = "poky-
>> altcfg" would be the likely trigger.
> ERROR: systemd-1_247.1-r0 do_package: QA Issue: systemd: Files/directories were installed but not shipped in any packa
> ge:
>    /usr/lib/pam.d
>    /usr/lib/pam.d/systemd-user
>
> But the recipe has:
>
> FILES_${PN} = " ${base_bindir}/* \
>                 <...>
>                 ${libdir}/pam.d/ \
>
> Shouldn't that match? Did I use the wrong variable?
>
> Thanks!

I think it should be ${nonarch_libdir}, as ${libdir} will be expanded to 
'/usr/lib64' in the above multilib config.

Regards,
Chen Qi

>
>
> 
>


--------------3ADE503AA7B0111EBC73C3AB
Content-Type: text/html; charset=utf-8
Content-Transfer-Encoding: 7bit

<html><head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8">
  </head>
  <body bgcolor="#FFFFFF" text="#000000">
    <div class="moz-cite-prefix">On 12/18/2020 01:25 AM, Luca Bocassi
      wrote:<br>
    </div>
    <blockquote cite="mid:68d3174ccafddf0732e553e408e8b1c5c62a095f.camel@gmail.com" type="cite">
      <pre wrap="">On Wed, 2020-12-16 at 18:07 +0000, Richard Purdie wrote:
</pre>
      <blockquote type="cite">
        <pre wrap="">On Mon, 2020-12-14 at 12:34 +0000, Luca Bocassi wrote:
</pre>
        <blockquote type="cite">
          <pre wrap="">From: Luca Boccassi <a class="moz-txt-link-rfc2396E" href="mailto:luca.boccassi@microsoft.com">&lt;luca.boccassi@microsoft.com&gt;</a>

Update systemd to v247.1.
Add rule for new oomd dbus conf and for new pam.d
conf directory in /usr/lib.
Drop selinux-hook-handling-to-enumerate-nexthop.patch,
merged upstream.
Backport 0001-meson-set-cxx-variable-before-using-it.patch
from v247-stable to fix builds without C++.
Refresh musl patches.

Signed-off-by: Luca Boccassi <a class="moz-txt-link-rfc2396E" href="mailto:luca.boccassi@microsoft.com">&lt;luca.boccassi@microsoft.com&gt;</a>
---
NOTE: the musl build has only been build-tested, and only on x86_64.
The glibc build has been built and runtime-tested on x86_64 and
arm64.
</pre>
        </blockquote>
        <pre wrap="">
[sorry, hit send early when writing]

Unfortunately there is still something not quite right in this patchset
as it failed again during testing. There are a few different problems:

meta-intel in systemd-boot:

<a class="moz-txt-link-freetext" href="https://autobuilder.yoctoproject.org/typhoon/#/builders/100/builds/1016">https://autobuilder.yoctoproject.org/typhoon/#/builders/100/builds/1016</a>
</pre>
      </blockquote>
      <pre wrap="">
Looking into this, thanks

</pre>
      <blockquote type="cite">
        <pre wrap="">a reproducibility issue in oe-selftest:

<a class="moz-txt-link-freetext" href="https://autobuilder.yoctoproject.org/typhoon/#/builders/79/builds/1651">https://autobuilder.yoctoproject.org/typhoon/#/builders/79/builds/1651</a>
(which did happen last time as well on centos but I don't think was
reported on the list, sorry)

These urls may help understand why its not reproducible:

<a class="moz-txt-link-freetext" href="https://autobuilder.yocto.io/pub/repro-fail/oe-reproducible-20201215-mhq8wl33/packages/diff-html/">https://autobuilder.yocto.io/pub/repro-fail/oe-reproducible-20201215-mhq8wl33/packages/diff-html/</a>
<a class="moz-txt-link-freetext" href="https://autobuilder.yocto.io/pub/repro-fail/oe-reproducible-20201215-mhq8wl33/">https://autobuilder.yocto.io/pub/repro-fail/oe-reproducible-20201215-mhq8wl33/</a>

(looks like the uid of messagebus is changing at a really quick glance)
</pre>
      </blockquote>
      <pre wrap="">
Given your follow-up message about host contamination, is there
anything I can do here to fix it/mitigate it, or is it a CI issue?

</pre>
      <blockquote type="cite">
        <pre wrap="">and a build issue in world-lsb:

<a class="moz-txt-link-freetext" href="https://autobuilder.yoctoproject.org/typhoon/#/builders/108/builds/1189">https://autobuilder.yoctoproject.org/typhoon/#/builders/108/builds/1189</a>

At the top of the logs you can see the configuration that is being used
for a given build, so for example in the last one, the key difference
to some of the other builds might be any one of:

DISTRO = &quot;poky-altcfg&quot;
DISTRO_FEATURES_append = ' api-documentation'
require conf/multilib.conf
MULTILIBS = 'multilib:lib32'
DEFAULTTUNE_virtclass-multilib-lib32 = 'x86'
QEMU_USE_KVM = 'True'
INHERIT += 'testimage'
SDK_EXT_TYPE = 'minimal'
SDK_INCLUDE_TOOLCHAIN = '1'

but given its a pam error, I'd strongly suspect the DISTRO = &quot;poky-
altcfg&quot; would be the likely trigger.
</pre>
      </blockquote>
      <pre wrap="">
ERROR: systemd-1_247.1-r0 do_package: QA Issue: systemd: Files/directories were installed but not shipped in any packa
ge:
  /usr/lib/pam.d
  /usr/lib/pam.d/systemd-user

But the recipe has:

FILES_${PN} = &quot; ${base_bindir}/* \
               &lt;...&gt;
               ${libdir}/pam.d/ \

Shouldn't that match? Did I use the wrong variable?

Thanks!
</pre>
    </blockquote>
    <br>
    I think it should be ${nonarch_libdir}, as ${libdir} will be
    expanded to '/usr/lib64' in the above multilib config.<br>
    <br>
    Regards,<br>
    Chen Qi<br>
    <br>
    <blockquote cite="mid:68d3174ccafddf0732e553e408e8b1c5c62a095f.camel@gmail.com" type="cite">
      <pre wrap="">
</pre>
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

--------------3ADE503AA7B0111EBC73C3AB--
