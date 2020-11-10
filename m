Received: from NAM12-BN8-obe.outbound.protection.outlook.com (NAM12-BN8-obe.outbound.protection.outlook.com [40.107.237.47])
 by mx.groups.io with SMTP id smtpd.web11.22076.1604973215609045400
 for <openembedded-core@lists.openembedded.org>;
 Mon, 09 Nov 2020 17:53:35 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@windriversystems.onmicrosoft.com header.s=selector2-windriversystems-onmicrosoft-com header.b=LQa2BMDe;
 spf=pass (domain: windriver.com, ip: 40.107.237.47, mailfrom: kai.kang@windriver.com)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=R5GljcSkG1TPQFAeinCEYcF/tPokFPEhaI4t9bTDmywyism/KXEoDbkWv3itrE3lmNhx7ZbVRnEd8arWWcw2/JWd/gl3V/Wfn6qVkq4pFEFD/zE8o+9W22uoHs0E5j1qZrrKGB6L4hU3QDbIyKT2CSu8KnV2bZw6sd6QdXxbFckEc2RKbyyI0zAk+oy3WWQiXz4flDG1CUGkxpw7RngG7i+O5iGZdwNqqqjeDW113vMTT7gAdaSy37g5kppY6SWJunU8aDBJsDz7hmGqYhYqDiGMLxmPGJF/dQHEkSTciRpKJ9suRtQPdR0WM4CyIehCFQfKPOKhJPnO5TGPm5i2wQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=AwUrfOqIRRQ/SMpLrOC5aijDQUkGz2HWyEl2og4G9uM=;
 b=cxjQRxxg3fjm1cm0ERIPGaI+ujsThQjphxqo5n0HRMfu2ZE4aEVj95TM6oXEfB027Xbs6EqyWLgIpN5tmezC4WGd4TEsC/dtPNSVLDr8dEPWJBf+MjoFzPU7bbGHORExJDxzk03o62Mz3u7cOQNhBsgGj8fJbW4kK2BIqXS3YdZgV4S6Ln6iFXXlrmE4i45P9La+UZHoCX7Bj2KFRiUcXh0EhGSx1TMWZQOW3iumLHxV1UN35FqKaWPqQwznbs0YwnQ0x3apPKgfPS9diqeth9a8oNwyF9rzfK3RNNoo01O7AESnCUmf7cAZ6R6MoYVg30Qe92PFa0wUNAiYV6OTmQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=windriver.com; dmarc=pass action=none
 header.from=windriver.com; dkim=pass header.d=windriver.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=windriversystems.onmicrosoft.com;
 s=selector2-windriversystems-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=AwUrfOqIRRQ/SMpLrOC5aijDQUkGz2HWyEl2og4G9uM=;
 b=LQa2BMDet4HnJwH58wHHSfAz9fdek3usqXUsn/BZSI1hByVAtdprWW7+VCOcMTrg2e/ndTMrGeAKcGhEjJLifNRAmWmZqG9TV/pKIPMAv10iosjPMEP4AIrB8G2yd5658Z2TFqEoQIDMRgcVfK2wn/Vn/v0WDBkvDA2rqn4HOiw=
Authentication-Results: windriver.com; dkim=none (message not signed)
 header.d=none;windriver.com; dmarc=none action=none
 header.from=windriver.com;
Received: from SN6PR11MB3294.namprd11.prod.outlook.com (2603:10b6:805:c4::33)
 by SN6PR11MB3342.namprd11.prod.outlook.com (2603:10b6:805:b9::17) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3499.19; Tue, 10 Nov
 2020 01:53:33 +0000
Received: from SN6PR11MB3294.namprd11.prod.outlook.com
 ([fe80::b49d:2c09:ddcc:f5e2]) by SN6PR11MB3294.namprd11.prod.outlook.com
 ([fe80::b49d:2c09:ddcc:f5e2%5]) with mapi id 15.20.3541.025; Tue, 10 Nov 2020
 01:53:33 +0000
Subject: Re: [OE-core] [PATCH] webkitgtk: remove '-fno-omit-frame-pointer' for x86
To: Khem Raj <raj.khem@gmail.com>
Cc: Alexander Kanavin <alex.kanavin@gmail.com>,
 OE-core <openembedded-core@lists.openembedded.org>
References: <20201109003123.31494-1-kai.kang@windriver.com>
 <CANNYZj9dT6GBpFCkfGobL1tJ8K1GRLe9VuJJPaNR4Ubnyr0cCg@mail.gmail.com>
 <15a325ef-c583-1afa-ae19-750a0927f2f9@windriver.com>
 <CANNYZj_ku_fWOyn_pkTsC0ygCRXT7QrTS8AedH-VEhvAcr+t4Q@mail.gmail.com>
 <8b13424d-115a-037b-cdd8-16c264a48ff7@windriver.com>
 <CAMKF1sqjqtN0BcoVg8xM5SrXLmZS_RNTCYG6iVLtWuHQ+VY58Q@mail.gmail.com>
From: "kai" <kai.kang@windriver.com>
Message-ID: <7ccfb0c8-bea9-f511-aee4-bc931f7b7472@windriver.com>
Date: Tue, 10 Nov 2020 09:53:04 +0800
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.10.0
In-Reply-To: <CAMKF1sqjqtN0BcoVg8xM5SrXLmZS_RNTCYG6iVLtWuHQ+VY58Q@mail.gmail.com>
X-Originating-IP: [60.247.85.82]
X-ClientProxiedBy: HKAPR03CA0009.apcprd03.prod.outlook.com
 (2603:1096:203:c8::14) To SN6PR11MB3294.namprd11.prod.outlook.com
 (2603:10b6:805:c4::33)
Return-Path: kai.kang@windriver.com
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from [128.224.162.141] (60.247.85.82) by HKAPR03CA0009.apcprd03.prod.outlook.com (2603:1096:203:c8::14) with Microsoft SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3564.13 via Frontend Transport; Tue, 10 Nov 2020 01:53:31 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 11175039-c83a-460f-744a-08d8851b6dea
X-MS-TrafficTypeDiagnostic: SN6PR11MB3342:
X-MS-Exchange-Transport-Forked: True
X-Microsoft-Antispam-PRVS: 
	<SN6PR11MB3342F2B8644599D884A985BC95E90@SN6PR11MB3342.namprd11.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:5516;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 
	DO27V8RqIHXOSVlzJ5eOIeR0m7wmAbXwv0nmIxAcACnNj9lJF6jcPmYV/6Cbb7xBZmRk34KRKiNRiBI/Xkgxz6Lp+Hg8Fw90+iTQI/vVv8YvdDoA0qE64JT+Qh7MgRgtjPwMipujljsHuMo0qaGzg/4SLh7nMYUZyYZ44ZkBcFXe5WsL4eF1+/leFb8Bt+i2qjFEkRss7q7yDN+B4sBRFYmYy1rAVrGgzF9yNEKHCJrfXaI3Q5noZabzXG02VBwvxOe05m35TRK0iHoU8C6081luFywfR9JvYecHDKeJ+m6jpoo/Vv82ORw6kc0uqGiT31G/ByoIyXpaUHZJMVAF44RdgXRSseGIcHv3yCbub4XQ1BD9mRL8saNKrDOJq5kIiUS97CMlr42sbDgL26abEeyrbdC7g2qDtQpy4GuiJto7O8CAff5COy1MriRPXB73wBMlgYgZTyBLBuGN2aur9lCOLnmdBfDPxtMlvnbaSPM=
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:SN6PR11MB3294.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(4636009)(346002)(366004)(396003)(39850400004)(376002)(136003)(31696002)(66556008)(66946007)(33964004)(5660300002)(8676002)(52116002)(6666004)(16576012)(6916009)(66476007)(6706004)(316002)(86362001)(54906003)(8936002)(2906002)(956004)(2616005)(4326008)(36756003)(966005)(53546011)(478600001)(31686004)(83380400001)(6486002)(166002)(16526019)(186003)(26005)(78286007)(43740500002);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData: 
	2fcBDpHlA5rMFAjTvSPFAQuX6KWIwRZDKF/yYXOC3RO0dzKNsV/iBYfWk5yV/x1/fweDUjdH9o5LysrC3m2iVx0jBlYdMnjSexi+9Hbszx1EABOlrv9F9eLhNv0lrHNz0li8viQ3xZghMTnDViPI9TtJB6w64aD5GsrISNY/Yj4h9Cj34JDHKlcLj1fNcDKIHL9OkLRJ9hIxP7757cryYXOPuSa27MSyiK1nbZ6FSRswhEyKfqd08HcexEP5awAhULoRWxEM7FfuywHuUwYPDxIVr5qEOpQsBcwhDCMugn09McsNQSFBzkErJ4ML4pY6AbdR9eAoVv9yzpbTAWjMx3zqIW2cz2Od4hg4Y2PCVzcR2XqUDS3dPUPsFzXxP71/4kTVejIfs5byzXUGUaoBkZUk0Bh2Tb35tvGyySGxiDLpFvBZ6xDV6HIPL9idbwAUEsE5Lj0RI+nOzCNO7gIrJ5A8x4YyZFgi60WDHLVFEDFZQbGFrhVHdE4hUYG4vSJIxEYA8uiCEZrGoOrlEMA0hOD9QLAqOy2dK3h3V8fBf5GCOrU2gnVZi3NpjkX/xhtjJsoGQ3xWVoiemOto6V+OI2jjVuT97D7N+x9hJFEdkkjZb6KkVlkZGGx5t2+X05DVbaPfROR/IO8Cp7jw3IdPlg==
X-OriginatorOrg: windriver.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 11175039-c83a-460f-744a-08d8851b6dea
X-MS-Exchange-CrossTenant-AuthSource: SN6PR11MB3294.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 10 Nov 2020 01:53:33.1036
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 8ddb2873-a1ad-4a18-ae4e-4644631433be
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: xMAk4MiAJf4QETfcRc8FzGl8wzwxj6vzuAHbu7KvVv5fkhBbEjCFBoaHU0b9I2vuzrDTzhWX8Px0ah2g4KGotQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SN6PR11MB3342
Content-Type: multipart/alternative;
 boundary="------------420C3C2B412078F1590A5C6C"
Content-Language: en-US

--------------420C3C2B412078F1590A5C6C
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 7bit

On 11/10/20 2:58 AM, Khem Raj wrote:
> On Mon, Nov 9, 2020 at 12:18 AM kai <kai.kang@windriver.com> wrote:
>> On 11/9/20 4:07 PM, Alexander Kanavin wrote:
>>
>> Right, but then adding _remove to the upstream recipe doesn't seem right - rather you should use _pn-webkitgtk override in your custom config.
>>
>> I suppose '-fomit-frame-pointer' is common compile flag that other people may also meet this error.
>>
>> Regards,
>> Kai
>>
>>
>> Alex
>>
>> On Mon, 9 Nov 2020 at 08:52, kai <kai.kang@windriver.com> wrote:
>>> On 11/9/20 3:32 PM, Alexander Kanavin wrote:
>>>
>>> This is not seen on the autobuilder, which does world builds on qemux86. Something might be wrong on your side?
>>>
>>> Just the option '-fno-omit-frame-pointer' which is not set by default. We have a build with an extra config in local.conf:
>>>
>>> SELECTED_OPTIMIZATION = "${PROFILING_OPTIMIZATION}"
>>>
>>> which expands to
>>>
>>> SELECTED_OPTIMIZATION = "${FULL_OPTIMIZATION} -fno-omit-frame-pointer -fvisibility=default"
>>>
>>> then it fails to compile webkitgtk. It could be reproduced with upper config line.
>>>
> since we do not have global file to control this its fine if you alter
> PROFILING_OPTIMIZATION inside this recipe
> something like PROFILING_OPTIMIZATION_remove = "..."

OK. I'll follow the snippet such as:

recipes-devtools/binutils/binutils_2.35.bb:SELECTED_OPTIMIZATION_remove_mipsarch 
= "-O2"

Thanks,
Kai


>
>>> Regards,
>>> Kai
>>>
>>>
>>>
>>>
>>> Alex
>>>
>>> On Mon, 9 Nov 2020 at 01:32, kai <kai.kang@windriver.com> wrote:
>>>> From: Kai Kang <kai.kang@windriver.com>
>>>>
>>>> It fails to compile webkitgtk for qemux86 if compile option
>>>> '-fno-omit-frame-pointer' is applied:
>>>>
>>>> | TOPDIR/tmp-glibc/work/core2-32-wrsmllib32-linux/lib32-webkitgtk/2.30.1-r0/webkitgtk-2.30.1/
>>>>      Source/JavaScriptCore/runtime/JSFinalizationRegistry.cpp:47:1:
>>>> | internal compiler error: in find_oldest_value_reg, at regcprop.c:438
>>>> |    47 | }
>>>>
>>>> Signed-off-by: Kai Kang <kai.kang@windriver.com>
>>>> ---
>>>>   meta/recipes-sato/webkit/webkitgtk_2.30.2.bb | 1 +
>>>>   1 file changed, 1 insertion(+)
>>>>
>>>> diff --git a/meta/recipes-sato/webkit/webkitgtk_2.30.2.bb b/meta/recipes-sato/webkit/webkitgtk_2.30.2.bb
>>>> index 1acba6be1d..11fdb59034 100644
>>>> --- a/meta/recipes-sato/webkit/webkitgtk_2.30.2.bb
>>>> +++ b/meta/recipes-sato/webkit/webkitgtk_2.30.2.bb
>>>> @@ -79,6 +79,7 @@ EXTRA_OECMAKE_append_arc = " -DENABLE_JIT=OFF "
>>>>   # which is not enough for binaries larger than 32 MiB
>>>>   CFLAGS_append_arc = " -mlong-calls"
>>>>   CXXFLAGS_append_arc = " -mlong-calls"
>>>> +CXXFLAGS_remove_x86 = "-fno-omit-frame-pointer"
>>>>
>>>>   # Javascript JIT is not supported on powerpc
>>>>   EXTRA_OECMAKE_append_powerpc = " -DENABLE_JIT=OFF "
>>>> --
>>>> 2.17.1
>>>>
>>>>
>>>>
>>>>
>>>
>>>
>>>
>>>
>>
>>
>>
>>
>> 
>>


--------------420C3C2B412078F1590A5C6C
Content-Type: text/html; charset=utf-8
Content-Transfer-Encoding: 7bit

<html><head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8">
  </head>
  <body>
    <div class="moz-cite-prefix">On 11/10/20 2:58 AM, Khem Raj wrote:<br>
    </div>
    <blockquote type="cite" cite="mid:CAMKF1sqjqtN0BcoVg8xM5SrXLmZS_RNTCYG6iVLtWuHQ+VY58Q@mail.gmail.com">
      <pre class="moz-quote-pre" wrap="">On Mon, Nov 9, 2020 at 12:18 AM kai <a class="moz-txt-link-rfc2396E" href="mailto:kai.kang@windriver.com">&lt;kai.kang@windriver.com&gt;</a> wrote:
</pre>
      <blockquote type="cite">
        <pre class="moz-quote-pre" wrap="">
On 11/9/20 4:07 PM, Alexander Kanavin wrote:

Right, but then adding _remove to the upstream recipe doesn't seem right - rather you should use _pn-webkitgtk override in your custom config.

I suppose '-fomit-frame-pointer' is common compile flag that other people may also meet this error.

Regards,
Kai


Alex

On Mon, 9 Nov 2020 at 08:52, kai <a class="moz-txt-link-rfc2396E" href="mailto:kai.kang@windriver.com">&lt;kai.kang@windriver.com&gt;</a> wrote:
</pre>
        <blockquote type="cite">
          <pre class="moz-quote-pre" wrap="">
On 11/9/20 3:32 PM, Alexander Kanavin wrote:

This is not seen on the autobuilder, which does world builds on qemux86. Something might be wrong on your side?

Just the option '-fno-omit-frame-pointer' which is not set by default. We have a build with an extra config in local.conf:

SELECTED_OPTIMIZATION = &quot;${PROFILING_OPTIMIZATION}&quot;

which expands to

SELECTED_OPTIMIZATION = &quot;${FULL_OPTIMIZATION} -fno-omit-frame-pointer -fvisibility=default&quot;

then it fails to compile webkitgtk. It could be reproduced with upper config line.

</pre>
        </blockquote>
      </blockquote>
      <pre class="moz-quote-pre" wrap="">
since we do not have global file to control this its fine if you alter
PROFILING_OPTIMIZATION inside this recipe
something like PROFILING_OPTIMIZATION_remove = &quot;...&quot;</pre>
    </blockquote>
    <p>OK. I'll follow the snippet such as:</p>
    <p>recipes-devtools/binutils/binutils_2.35.bb:SELECTED_OPTIMIZATION_remove_mipsarch
      = &quot;-O2&quot;</p>
    <p>Thanks,<br>
      Kai</p>
    <p><br>
    </p>
    <blockquote type="cite" cite="mid:CAMKF1sqjqtN0BcoVg8xM5SrXLmZS_RNTCYG6iVLtWuHQ+VY58Q@mail.gmail.com">
      <pre class="moz-quote-pre" wrap="">

</pre>
      <blockquote type="cite">
        <blockquote type="cite">
          <pre class="moz-quote-pre" wrap="">Regards,
Kai




Alex

On Mon, 9 Nov 2020 at 01:32, kai <a class="moz-txt-link-rfc2396E" href="mailto:kai.kang@windriver.com">&lt;kai.kang@windriver.com&gt;</a> wrote:
</pre>
          <blockquote type="cite">
            <pre class="moz-quote-pre" wrap="">
From: Kai Kang <a class="moz-txt-link-rfc2396E" href="mailto:kai.kang@windriver.com">&lt;kai.kang@windriver.com&gt;</a>

It fails to compile webkitgtk for qemux86 if compile option
'-fno-omit-frame-pointer' is applied:

| TOPDIR/tmp-glibc/work/core2-32-wrsmllib32-linux/lib32-webkitgtk/2.30.1-r0/webkitgtk-2.30.1/
    Source/JavaScriptCore/runtime/JSFinalizationRegistry.cpp:47:1:
| internal compiler error: in find_oldest_value_reg, at regcprop.c:438
|    47 | }

Signed-off-by: Kai Kang <a class="moz-txt-link-rfc2396E" href="mailto:kai.kang@windriver.com">&lt;kai.kang@windriver.com&gt;</a>
---
 meta/recipes-sato/webkit/webkitgtk_2.30.2.bb | 1 +
 1 file changed, 1 insertion(+)

diff --git a/meta/recipes-sato/webkit/webkitgtk_2.30.2.bb b/meta/recipes-sato/webkit/webkitgtk_2.30.2.bb
index 1acba6be1d..11fdb59034 100644
--- a/meta/recipes-sato/webkit/webkitgtk_2.30.2.bb
+++ b/meta/recipes-sato/webkit/webkitgtk_2.30.2.bb
@@ -79,6 +79,7 @@ EXTRA_OECMAKE_append_arc = &quot; -DENABLE_JIT=OFF &quot;
 # which is not enough for binaries larger than 32 MiB
 CFLAGS_append_arc = &quot; -mlong-calls&quot;
 CXXFLAGS_append_arc = &quot; -mlong-calls&quot;
+CXXFLAGS_remove_x86 = &quot;-fno-omit-frame-pointer&quot;

 # Javascript JIT is not supported on powerpc
 EXTRA_OECMAKE_append_powerpc = &quot; -DENABLE_JIT=OFF &quot;
--
2.17.1




</pre>
          </blockquote>
          <pre class="moz-quote-pre" wrap="">




</pre>
        </blockquote>
        <pre class="moz-quote-pre" wrap="">



</pre>
        <br>
        <fieldset class="mimeAttachmentHeader"></fieldset>
        <pre class="moz-quote-pre" wrap="">


</pre>
      </blockquote>
    </blockquote>
    <p><br>
    </p>
  </body>
</html>

--------------420C3C2B412078F1590A5C6C--
