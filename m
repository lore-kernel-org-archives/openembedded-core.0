Return-Path: <richard.purdie@linuxfoundation.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 074A3ECAAD3
	for <webhook@archiver.kernel.org>; Fri,  9 Sep 2022 15:16:44 +0000 (UTC)
Received: from mail-wm1-f44.google.com (mail-wm1-f44.google.com
 [209.85.128.44])
 by mx.groups.io with SMTP id smtpd.web08.187.1662736602287259859
 for <openembedded-core@lists.openembedded.org>;
 Fri, 09 Sep 2022 08:16:42 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@linuxfoundation.org header.s=google header.b=Qx2yK3SB;
 spf=pass (domain: linuxfoundation.org, ip: 209.85.128.44,
 mailfrom: richard.purdie@linuxfoundation.org)
Received: by mail-wm1-f44.google.com with SMTP id h1so1637742wmd.3
        for <openembedded-core@lists.openembedded.org>;
 Fri, 09 Sep 2022 08:16:42 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linuxfoundation.org; s=google;
        h=mime-version:user-agent:content-transfer-encoding:references
         :in-reply-to:date:to:from:subject:message-id:from:to:cc:subject:date;
        bh=uT5sl5bgqmu86F0TypZi5HiIOSsCtADbkMavIURmOHY=;
        b=Qx2yK3SBqW2WocCH9wpuAkfdg17fCWhdhtl0QgOsQU5KeJNxW8Rm1F2Ekk0cxoxedy
         Roh3F3IITYtC3/k8vPkgmBHwGnQTJjXR8kEEEhIdEYAdcYDSZ/7DGjcdrRVCvDxZ7avg
         kQphM2lr6+JQtKhLMakBkx80009ve0wvSngWs=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=mime-version:user-agent:content-transfer-encoding:references
         :in-reply-to:date:to:from:subject:message-id:x-gm-message-state:from
         :to:cc:subject:date;
        bh=uT5sl5bgqmu86F0TypZi5HiIOSsCtADbkMavIURmOHY=;
        b=0MyWqwkeMm3XF/Yf28hzcfojXEJsC0hxIPheBq61lGzPrbpa3DMBgZcIJjzlMcxuCy
         1VYhmyit2jWkHkX+bvzJZzLs2NvcsbGkhfC9XzqBXUTIznJdY+vNZI7bk/+HlJYE0Rkl
         rRGCpa1Z9Aa4b7aJtr7LGZO6KGLFmg0WDIyw1ybPTtjB9/eSIBQEKshGzNmJMbXEyvB3
         4bdLVRwDDVt5y7mhIkI9nByZgO/pRzlf5pSStMzikDftD4SRfy2X7Gpcv+oa+VmXFk5w
         U70GVubTQHYOU7/tLGWAO3nBAzrkG+IlWGfMI94OdrVAwX+XsPL6yJvX4NAz4SqIkxCW
         vXkQ==
X-Gm-Message-State: ACgBeo3AIb3qi3bb8OxYnIyQcNcRwxL5lUOr2rn7wn1G9ysalvf6Bluz
	Irpp1DjUVuS7iWSaqmNeLHtZVg==
X-Google-Smtp-Source: 
 AA6agR5xPOKWDt65mpVdl92X16/lUkIjww82H4LsV3sFVma4qZqP7lgawfk1LTY2wSxdX1c3qb48Rg==
X-Received: by 2002:a05:600c:22cd:b0:3a6:7b62:3778 with SMTP id
 13-20020a05600c22cd00b003a67b623778mr5896513wmg.45.1662736600775;
        Fri, 09 Sep 2022 08:16:40 -0700 (PDT)
Received: from ?IPv6:2001:8b0:aba:5f3c:52ef:c9b0:71c9:e992?
 ([2001:8b0:aba:5f3c:52ef:c9b0:71c9:e992])
        by smtp.gmail.com with ESMTPSA id
 t6-20020adfeb86000000b0021f0ff1bc6csm809554wrn.41.2022.09.09.08.16.40
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 09 Sep 2022 08:16:40 -0700 (PDT)
Message-ID: 
 <f1f703776907dd518e83f15cc333c99094241cac.camel@linuxfoundation.org>
Subject: Re: [OE-core] [PATCH v2] rust-hello-world: move to recipes-extended
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: Otavio Salvador <otavio@ossystems.com.br>,
	openembedded-core@lists.openembedded.org
Date: Fri, 09 Sep 2022 16:16:39 +0100
In-Reply-To: <20220909151221.434124-1-otavio@ossystems.com.br>
References: <20220909151221.434124-1-otavio@ossystems.com.br>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
User-Agent: Evolution 3.44.1-0ubuntu1 
MIME-Version: 1.0
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Fri, 09 Sep 2022 15:16:44 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/170492

On Fri, 2022-09-09 at 12:12 -0300, Otavio Salvador wrote:
> There is no need to have a single recipe in recipes-example; moving it
> to recipes-extended allow it being use inside QA tests.

I'm a bit puzzled why it doesn't work from it's current location?

Cheers,

Richard

