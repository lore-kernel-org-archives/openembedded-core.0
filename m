Return-Path: <richard.purdie@linuxfoundation.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 7A701C433F5
	for <webhook@archiver.kernel.org>; Sat, 12 Mar 2022 00:18:27 +0000 (UTC)
Received: from mail-wr1-f48.google.com (mail-wr1-f48.google.com
 [209.85.221.48])
 by mx.groups.io with SMTP id smtpd.web10.148.1647044306701600945
 for <openembedded-core@lists.openembedded.org>;
 Fri, 11 Mar 2022 16:18:27 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@linuxfoundation.org header.s=google header.b=LRaDuerd;
 spf=pass (domain: linuxfoundation.org, ip: 209.85.221.48,
 mailfrom: richard.purdie@linuxfoundation.org)
Received: by mail-wr1-f48.google.com with SMTP id t11so15221553wrm.5
        for <openembedded-core@lists.openembedded.org>;
 Fri, 11 Mar 2022 16:18:26 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linuxfoundation.org; s=google;
        h=message-id:subject:from:to:date:in-reply-to:references:user-agent
         :mime-version:content-transfer-encoding;
        bh=n/YlA7o3crJ0iN0G0HqWVJK/AVg3UWsqz7Me5z+MV2c=;
        b=LRaDuerdrToCzgQkuNvgPg/EJes4SkB54PiVa5YBe+X7S7bvc0pqF3RF1LUQFEqAPD
         m/TFIVLIyoj2+6Cd6MOzvR+zeYeE/1hrjYk+j5y5b6c5TKgFJZ6Tis0qSqBu1paafLXO
         gzD5F7ysDLm38zf/WRuhnsV7lW8bb0JS+ENrc=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:message-id:subject:from:to:date:in-reply-to
         :references:user-agent:mime-version:content-transfer-encoding;
        bh=n/YlA7o3crJ0iN0G0HqWVJK/AVg3UWsqz7Me5z+MV2c=;
        b=mI8oMtg/9P4I4fWZEMcrOpEuTR1mbHj8TT+TlprdqUN4YcTXJa5NHLeD2zFkacqvqx
         HuRb53DB9ugZXvZt2ophsRyoivUUJQ5cYBiL/asVgilzo5HJ7oajxubmvPcecz8xKepA
         64YePRkHiVW9WuEJh3/IyOW7N8mBUuALUTeKniTAEaKbbVE9WQutBN22LauN4oAPt8bT
         crvVFR82ejTYgUPQAkdOWh6upQnHXMoYqwqdbpfkNMkC+23e5kOshSbr14Xs/au4n2b3
         mIfGKNmAAErjxlPgbzFqHICZEm7kaRkyplXDgv1EX00YIBTPfn3KPDwTJsoWKL39sgvE
         7utA==
X-Gm-Message-State: AOAM532pQeoDoHvlAhr0eHSX8UgYmwG28FgHjiDYcGjBwtRQYg9GCHQp
	oa5L5O2lV8uRUyNuuy/TCJ6E9w==
X-Google-Smtp-Source: 
 ABdhPJx39kxbvbbsAdmKI0hvuzjm245ZOqxoWDgolJCH3SWM1yCLuHsLII/CbZd3t5z1MuMHfwI9Zg==
X-Received: by 2002:adf:816e:0:b0:1e4:ad2b:cb24 with SMTP id
 101-20020adf816e000000b001e4ad2bcb24mr9204470wrm.521.1647044305116;
        Fri, 11 Mar 2022 16:18:25 -0800 (PST)
Received: from ?IPv6:2001:8b0:aba:5f3c:fe04:8f35:800e:f4a7?
 ([2001:8b0:aba:5f3c:fe04:8f35:800e:f4a7])
        by smtp.gmail.com with ESMTPSA id
 p26-20020a7bcc9a000000b00389f80668cesm1220146wma.28.2022.03.11.16.18.24
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 11 Mar 2022 16:18:24 -0800 (PST)
Message-ID: 
 <0abd18c8268323c953e66ac12185de8641a37ac0.camel@linuxfoundation.org>
Subject: Re: [OE-core] [meta-oe][PATCHv2] mesa: update to 22.0.0
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: Markus Volk <f_l_k@t-online.de>, openembedded-core@lists.openembedded.org
Date: Sat, 12 Mar 2022 00:18:18 +0000
In-Reply-To: <20220311172010.2490948-1-f_l_k@t-online.de>
References: <20220311172010.2490948-1-f_l_k@t-online.de>
Content-Type: text/plain; charset="UTF-8"
User-Agent: Evolution 3.40.4-1ubuntu2 
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Sat, 12 Mar 2022 00:18:27 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/163079

On Fri, 2022-03-11 at 18:20 +0100, Markus Volk wrote:
> - remove 0001-v3dv-account-for-64bit-time_t-on-32bit-arches.patch that
>   was applied upstream
> 
> - adjust 0002-meson.build-make-TLS-ELF-optional.patch
> 
> - fix patch fuzz
> 
> License-Update: removed references to deleted code.
> 
> Signed-off-by: Markus Volk <f_l_k@t-online.de>

Thanks for the v2, looks good.

I queued this for testing unfortunately it showed:

https://autobuilder.yoctoproject.org/typhoon/#/builders/81/builds/3220/steps/11/logs/stdio

as well as

https://autobuilder.yoctoproject.org/typhoon/#/builders/37/builds/4874/steps/11/logs/stdio
https://autobuilder.yoctoproject.org/typhoon/#/builders/48/builds/4877/steps/12/logs/stdio

I stopped that build since it seemed unlikely it would get anywhere.

Cheers,

Richard


