Return-Path: <arnout.vandecappelle@essensium.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 6A24AC433F5
	for <webhook@archiver.kernel.org>; Tue, 15 Mar 2022 14:33:56 +0000 (UTC)
Received: from mail-ed1-f52.google.com (mail-ed1-f52.google.com
 [209.85.208.52])
 by mx.groups.io with SMTP id smtpd.web10.11712.1647354833913229908
 for <openembedded-core@lists.openembedded.org>;
 Tue, 15 Mar 2022 07:33:55 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@mind.be header.s=google header.b=fVcWXyCx;
 spf=pass (domain: essensium.com, ip: 209.85.208.52,
 mailfrom: arnout.vandecappelle@essensium.com)
Received: by mail-ed1-f52.google.com with SMTP id w25so829263edi.11
        for <openembedded-core@lists.openembedded.org>;
 Tue, 15 Mar 2022 07:33:53 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=mind.be; s=google;
        h=message-id:date:mime-version:user-agent:subject:content-language:to
         :references:from:organization:in-reply-to:content-transfer-encoding;
        bh=BjWQDiCRpJhToVYF5oLvQphzsLXH+KSXumdelVsdxTw=;
        b=fVcWXyCxLuLa1Gd7aa0ZMsh5rF1ATIkQpQZBd+kKYvqZ/R2Xe+yWMrt5lWo7cX+aAu
         YzXlxqiT7kWYt2fipLrLwM1sdzXsk0GatO1fYeZoUTP5DoqFuSCtHvvqCztopbTWWcLe
         u1q+jAMsxW1Wlhlr/ZBX2ucgIdxgRbSk5jFd/CFRz9b1eE2wct4E7tbC4gGqZZT5o3y7
         gN4Ijn5Km2C476sPFMhrBLdcDbR8L5u0MHXeiHfPRGRiJ4IU+sEs2QLPES3HE0DQ712L
         Xl9au2XhHTuskH6qI64Jci1a+iRDYd5PQIahwCRb9shKAHHsEs7h4KGscRA2YOeGX3K2
         K3lw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
         :content-language:to:references:from:organization:in-reply-to
         :content-transfer-encoding;
        bh=BjWQDiCRpJhToVYF5oLvQphzsLXH+KSXumdelVsdxTw=;
        b=4+O2eL+14j1iE0aw7LL5WxNTzvHZN6clDC1X9SGT3Nddsgf9K1EYm6ddcEp/biMRdQ
         MgmNOOaBHT/6Dbu5/04UZpOybSZiTWhAknZgxSANEphPloikWScNmSSVNGajKgTVZ7r4
         OkvLtGF6HhO7F6Zgh60HiLxrd6cKblvVRYJ38wC9uD9Qx5A3YsFbiKTr7xrRacX19d4m
         oCa+oHfGq6Znh/jSZ51T3oAu+XLNq9dqL0RXljzpDv8Rg2A8xb7ufRyMGkUnvdFoLeH+
         0G2cySPl8tchTfXCGvPM7CDwYsRAcDVI4SJ/obfyW1lOQYmBSLExqqH9/1OxCCcZzhID
         2EiQ==
X-Gm-Message-State: AOAM531EbEy/XEs168fciNabgpEPRgrAzMe3FbT3XK4GTkSgkuUc0Gxv
	vFBzLQcTeLt1iJnKjGye9U1Jxw==
X-Google-Smtp-Source: 
 ABdhPJxVgcT8sfrg/SLOVmWMvb/3jWU9H5Ii+yOMeYIJ9ESkanxNIfL21sOh2fELVkP5GL6EXajWMg==
X-Received: by 2002:a05:6402:5243:b0:417:3a3:c6e with SMTP id
 t3-20020a056402524300b0041703a30c6emr19385919edd.211.1647354831698;
        Tue, 15 Mar 2022 07:33:51 -0700 (PDT)
Received: from ?IPV6:2a02:1811:3a7e:7b00:1400:24ea:cbca:e681?
 (ptr-9fplejn4os7m3x31ny9.18120a2.ip6.access.telenet.be.
 [2a02:1811:3a7e:7b00:1400:24ea:cbca:e681])
        by smtp.gmail.com with ESMTPSA id
 l24-20020a170906231800b006d69a771a34sm8230766eja.93.2022.03.15.07.33.50
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 15 Mar 2022 07:33:50 -0700 (PDT)
Message-ID: <71916ed0-8dff-b968-6572-a071617b9ba3@mind.be>
Date: Tue, 15 Mar 2022 15:33:49 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.6.2
Subject: Re: [PATCH] sdk: support uppercase characters in MACHINE
Content-Language: en-GB
To: Richard Purdie <richard.purdie@linuxfoundation.org>,
 openembedded-core@lists.openembedded.org
References: <20220315135646.3687446-1-arnout@mind.be>
 <302bf585847f2f9c9e10300d3be291179c90e465.camel@linuxfoundation.org>
From: Arnout Vandecappelle <arnout@mind.be>
Organization: Essensium/Mind
In-Reply-To: 
 <302bf585847f2f9c9e10300d3be291179c90e465.camel@linuxfoundation.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 15 Mar 2022 14:33:56 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/163290



On 15/03/2022 15:07, Richard Purdie wrote:
> On Tue, 2022-03-15 at 14:56 +0100, Arnout Vandecappelle (Essensium/Mind) wrote:
>> There are no real constraints on the values that MACHINE can take, it's
>> perfectly possible to define a machine with uppercase letters, and
>> building for that machine works fine.
>>
>> However, the (extensible) SDK targets include packages and packagegroups
>> that have MACHINE in their name, and uppercase letters are not allowed
>> in package names.
>>
>> Therefore, convert the machine name to lowercase when it's used as a
>> package name: for meta-environment, meta-environment-extsdk,
>> packagegroup-cross-canadian, packagegroup-go-cross-canadian and
>> packagegroup-rust-cross-canadian. Propagate this change to other places
>> where those packages are referred to.
>>
>> Alternatively, it would be possible to outright disallow uppercase
>> letters in MACHINE. However, this would affect any existing
>> configuration that currently works fine except for building the SDK.
>>
>> Signed-off-by: Arnout Vandecappelle (Essensium/Mind) <arnout@mind.be>
>> ---
>> I have only tested this with the base SDK, not with the extensible SDK.
>> I also haven't tested the changes to tclibc-baremetal, tclibc-newlib,
>> packagegroup-go-cross-canadian, packagegroup-rust-cross-canadian and
>> maintainers.inc. packagegroup-rust-cross-canadian doesn't even seem to
>> be used anywhere, so I guess this change would need to be propagated
>> somewhere externally.
>>
>> Ideally in addition to lowercasing, any other illegal package name
>> variables should also be removed or converted. It's less likely though
>> that other invalid characters would be used, since that will easily
>> break existing recipes. Also I couldn't find a conventient function to
>> make such a conversion.
> 
> MACHINE is used in OVERRIDES and we only allow lower case overrides. The reasons
> for that are becoming more historical however the code still does require that
> and I'm not sure I see a pressing need to support mixed case or uppercase
> letters in MACHINE and complicate the code like this.
> 
> Which version of the project allows MACHINE to have uppercase characters? Are
> you on a very old release?

  On dunfell. We have (received from someone else) two boards that have 
uppercase characters in MACHINE. And now I notice that the other board (for 
which I haven't tried generating the SDK yet) even has underscores in its name, 
which is also illegal in PN...

  I guess neither of these boards require overrides. I guess I better ask our 
supplier to change the name to lowercase and without underscores.

  Regards,
  Arnout


