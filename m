Return-Path: <raj.khem@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 32C35C433EF
	for <webhook@archiver.kernel.org>; Thu, 25 Nov 2021 17:53:22 +0000 (UTC)
Received: from mail-pg1-f179.google.com (mail-pg1-f179.google.com
 [209.85.215.179])
 by mx.groups.io with SMTP id smtpd.web09.14959.1637862801268800042
 for <openembedded-core@lists.openembedded.org>;
 Thu, 25 Nov 2021 09:53:21 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20210112 header.b=bvbcs032;
 spf=pass (domain: gmail.com, ip: 209.85.215.179,
 mailfrom: raj.khem@gmail.com)
Received: by mail-pg1-f179.google.com with SMTP id t4so5869721pgn.9
        for <openembedded-core@lists.openembedded.org>;
 Thu, 25 Nov 2021 09:53:21 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=message-id:date:mime-version:user-agent:subject:content-language:to
         :cc:references:from:organization:in-reply-to
         :content-transfer-encoding;
        bh=83Dx9XuncxWZz9dsO0ATwaTqiA3eFZj/+dCJODyO1jg=;
        b=bvbcs032P5YEHuGY0S8uL0AIkO9J6iv86LCyovsdNgt6fqLtK+h/UrtWV2f/x7EBQA
         yOvho4tp0PWVRrfUlr8xQkOOgpBQnxuy/GHtCvj456XEx00YRNWpVgjaOzXPkbVWQrWr
         6LrA5+gCPuQk43/uT1Dyo5snyoz3X7j/WbKtrKzjzSK65JKfOrpKVuVjWKXS14lHOUh/
         7NOpIE5pF+FOUPiKJU84yOdwlAOSqA/u6g1NYUyxFn+FBna5v4LOX8b8ARoHehWsw0zO
         LjhQFiZHri5dC+zLQCBKb9GpbcIDZFYgv98DODA9OKZRVvq8OOu7sMyNbvAXOChtdOUX
         6zxQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
         :content-language:to:cc:references:from:organization:in-reply-to
         :content-transfer-encoding;
        bh=83Dx9XuncxWZz9dsO0ATwaTqiA3eFZj/+dCJODyO1jg=;
        b=CZqU9Ufesi587M1g8hZFqaVZGTaR1AWxg6uqclZuRV4oKew7MUak6MmagIAwXKNfn5
         Sn+DVncMduHWkAQqsKDRmVYuWtXvJaCv6aTuwhd/wrtmYdSWoW+QHoDiUwQprgGPcWjk
         zA+J6bylTSv2VVPumMhTXRoJ+E5QlqEKeW0PEA4JfdhhD7w1TX9Nu0O1K2vrJv1drsUw
         TdIfJ3j3LafjG0AH+VeY8575y11xXoB6Txyi7fXfKpl/0zReHnNLxNFMZz9UGHxax6GP
         pJcGCtXIK4ZW20DQYvnUsiBsz0sP6aTpz3f+Cv51XUv3f4MWePdTVcODx8zxJ8r/2Vz+
         NU8g==
X-Gm-Message-State: AOAM532mr6KGR31ZaECE1EW+QnEPKmGwYph4WXr6pcmNrMYo+GVRBh/8
	bVrQM0/qC7cVeD+JujQoG/9d89K7/BuwDg==
X-Google-Smtp-Source: 
 ABdhPJyKC4lZNqreRZiaaLXlcOr6DrnwCHWiPQdNRZp47fALPQJ2fXVRNg6qzRsNbO0xZOGqYrD2+g==
X-Received: by 2002:a05:6a00:1482:b0:49f:d9af:27dc with SMTP id
 v2-20020a056a00148200b0049fd9af27dcmr15906361pfu.9.1637862800289;
        Thu, 25 Nov 2021 09:53:20 -0800 (PST)
Received: from ?IPV6:2601:646:9200:a0f0:dde5:a4ce:7ead:fc8c?
 ([2601:646:9200:a0f0:dde5:a4ce:7ead:fc8c])
        by smtp.gmail.com with ESMTPSA id
 t8sm3025013pgk.66.2021.11.25.09.53.19
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 25 Nov 2021 09:53:19 -0800 (PST)
Message-ID: <a31990ed-7583-e8d5-efe9-a22172aa5d0d@gmail.com>
Date: Thu, 25 Nov 2021 09:53:18 -0800
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:91.0)
 Gecko/20100101 Thunderbird/91.3.2
Subject: Re: [OE-core] [PATCH 03/20] python: introduce python3-dtschema
Content-Language: en-US
To: Bruce Ashfield <bruce.ashfield@gmail.com>
Cc: Richard Purdie <richard.purdie@linuxfoundation.org>,
 Patches and discussions about the oe-core layer
 <openembedded-core@lists.openembedded.org>, Tim Orling <TicoTimo@gmail.com>,
 Trevor Gamblin <trevor.gamblin@windriver.com>
References: <cover.1637788184.git.bruce.ashfield@gmail.com>
 <c653e0c3cd0edd038b3c3a2d9df442d2fe5ea745.1637788184.git.bruce.ashfield@gmail.com>
 <CAMKF1sqXFdQCtOHcc36CZgfoxwL0ASFeU2PyWW7LiD22drJVLA@mail.gmail.com>
 <CADkTA4PpHJJ_QRq=5PC_fctLGt5yyLANwiP9bKcJz1T_OtqH-g@mail.gmail.com>
From: Khem Raj <raj.khem@gmail.com>
Organization: HIMVIS LLC
In-Reply-To: 
 <CADkTA4PpHJJ_QRq=5PC_fctLGt5yyLANwiP9bKcJz1T_OtqH-g@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 25 Nov 2021 17:53:22 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/158793



On 11/25/21 9:51 AM, Bruce Ashfield wrote:
> On Thu, Nov 25, 2021 at 12:36 PM Khem Raj <raj.khem@gmail.com> wrote:
>>
>> fails to build for me
>>
>> https://errors.yoctoproject.org/Errors/Details/618010/
> 
> It was updated in-branch with fixups.  The version in this patch is
> known to break on a target build.

thanks, my grinder runs slowly since it builds a lot of stuff, so it 
gets to errors a bit late :). Are these fixes already in master-next now ?

> 
> Bruce
> 
>>
>> On Wed, Nov 24, 2021 at 1:14 PM Bruce Ashfield <bruce.ashfield@gmail.com> wrote:
>>>
>>> From: Bruce Ashfield <bruce.ashfield@gmail.com>
>>>
>>> kernel commit 53182e81f47d [kbuild: Enable DT schema checks for %.dtb
>>> targets], which is part of v5.16+, makes the checking of dtb schemas
>>> manditory.
>>>
>>> To support the checking, we introduce this new recipe dtschema.
>>>
>>> Dependencies will be imported in subsequent commits, so we can
>>> track the dependency need on a per-import basis.
>>>
>>> Signed-off-by: Bruce Ashfield <bruce.ashfield@gmail.com>
>>> ---
>>>   .../python/python3-dtschema_2021.10.bb           | 16 ++++++++++++++++
>>>   1 file changed, 16 insertions(+)
>>>   create mode 100644 meta/recipes-devtools/python/python3-dtschema_2021.10.bb
>>>
>>> diff --git a/meta/recipes-devtools/python/python3-dtschema_2021.10.bb b/meta/recipes-devtools/python/python3-dtschema_2021.10.bb
>>> new file mode 100644
>>> index 0000000000..f16232d610
>>> --- /dev/null
>>> +++ b/meta/recipes-devtools/python/python3-dtschema_2021.10.bb
>>> @@ -0,0 +1,16 @@
>>> +DESCRIPTION = "Tooling for devicetree validation using YAML and jsonschema"
>>> +HOMEPAGE = "https://github.com/devicetree-org/dt-schema"
>>> +LICENSE = "BSD-2-Clause"
>>> +LIC_FILES_CHKSUM = "file://LICENSE.txt;md5=457495c8fa03540db4a576bf7869e811"
>>> +
>>> +inherit pypi setuptools3
>>> +
>>> +PYPI_PACKAGE = "dtschema"
>>> +
>>> +SRC_URI[md5sum] = "d2f0d847ba2ad4d223317ef7304342b0"
>>> +SRC_URI[sha256sum] = "d09c94d13f46e6674ba11ff31220651ad1b02dae860f5a87905dfac6b8d768d9"
>>> +
>>> +DEPENDS += "python3-setuptools-scm"
>>> +RDEPENDS:${PN} += "python3-ruamel-yaml python3-jsonschema python3-rfc3987"
>>> +
>>> +BBCLASSEXTEND = "native nativesdk"
>>> --
>>> 2.19.1
>>>
>>>
>>> -=-=-=-=-=-=-=-=-=-=-=-
>>> Links: You receive all messages sent to this group.
>>> View/Reply Online (#158749): https://lists.openembedded.org/g/openembedded-core/message/158749
>>> Mute This Topic: https://lists.openembedded.org/mt/87290455/1997914
>>> Group Owner: openembedded-core+owner@lists.openembedded.org
>>> Unsubscribe: https://lists.openembedded.org/g/openembedded-core/unsub [raj.khem@gmail.com]
>>> -=-=-=-=-=-=-=-=-=-=-=-
>>>
> 
> 
> 

