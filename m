Received: from mail-wr1-f66.google.com (mail-wr1-f66.google.com [209.85.221.66])
 by mx.groups.io with SMTP id smtpd.web10.4566.1603137477475209776
 for <openembedded-core@lists.openembedded.org>;
 Mon, 19 Oct 2020 12:57:57 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@linuxfoundation.org header.s=google header.b=ZvkiY0Qn;
 spf=pass (domain: linuxfoundation.org, ip: 209.85.221.66, mailfrom: richard.purdie@linuxfoundation.org)
Received: by mail-wr1-f66.google.com with SMTP id g12so1052547wrp.10
        for <openembedded-core@lists.openembedded.org>; Mon, 19 Oct 2020 12:57:57 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linuxfoundation.org; s=google;
        h=message-id:subject:from:to:cc:date:in-reply-to:references
         :user-agent:mime-version:content-transfer-encoding;
        bh=L2DTjpc6HmBFJQJFPj00ukSVlfYd/EIIlNIC3K1Y514=;
        b=ZvkiY0QnsCba7gWFbNuTHqtBpCKuLy8dQzocPQfT0NyLXDu+E62I+9KXEtSLuZVLPX
         7Dw30Q+67kGfeIu6+CwHIRzHpQNVxm46iyAYLzlE/OCOIICLg1EC+FiBUNthrxX+mS41
         9uSrRr9ABWG0D5+AeBxvpqFxMRaICkaWEOVDE=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:message-id:subject:from:to:cc:date:in-reply-to
         :references:user-agent:mime-version:content-transfer-encoding;
        bh=L2DTjpc6HmBFJQJFPj00ukSVlfYd/EIIlNIC3K1Y514=;
        b=bCYxssFn5MuTQslWx6UMwPcRbGK27WWrVBXvJugGKh9UfrSkIX5h4wKPSrjB19qa34
         dsBt6GAJ47cFO7mBiCwL/Jif4zWvKNh0D+eRqlQUFPS2xUAjTMlKEPKVnzy0dGSy4H26
         WTu0V7510fWr6T7+te/STuub0pGpElMF89ddQ+s6uHTrIb5fFySfRd8u3VIBBB/SbBcT
         E0ewBizwSRhfKx/TLTwW8E3ospoNrWNIm5Dk2H1SEFp7LipML+B/x8WbFiGW2FhoRqM5
         a82petuEgUCHIuY43JivuWftMAHIh+LKNpJdD2fdBsZJvHEPm8G9xTiPIi3n269YQ4TU
         GlkQ==
X-Gm-Message-State: AOAM530jvZqi+30BHGgUYqvluQndosXwGz6XdGxAfkeVJ6Lo+/vVIoaS
	6Jc6Z30uRBXb0ksrN9vjtWkd5A==
X-Google-Smtp-Source: ABdhPJzN9ketR9RI2VjFhU9Uuag979CF2ulumPeOC63OOXzrx5Pw9sfEmuleQAXsT5GHrg8RaHCLlA==
X-Received: by 2002:adf:f4ca:: with SMTP id h10mr912387wrp.89.1603137475971;
        Mon, 19 Oct 2020 12:57:55 -0700 (PDT)
Return-Path: <richard.purdie@linuxfoundation.org>
Received: from e.c.4.c.b.d.d.d.d.1.e.7.a.1.c.1.c.3.f.5.a.b.a.0.0.b.8.0.1.0.0.2.ip6.arpa (e.c.4.c.b.d.d.d.d.1.e.7.a.1.c.1.c.3.f.5.a.b.a.0.0.b.8.0.1.0.0.2.ip6.arpa. [2001:8b0:aba:5f3c:1c1a:7e1d:dddb:c4ce])
        by smtp.gmail.com with ESMTPSA id z64sm757402wmg.19.2020.10.19.12.57.55
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 19 Oct 2020 12:57:55 -0700 (PDT)
Message-ID: <618b0ed0615813e02e06dbc2068c5398cae15c4d.camel@linuxfoundation.org>
Subject: Re: [OE-core] [PATCH] busybox: add rev and pgrep
From: "Richard Purdie" <richard.purdie@linuxfoundation.org>
To: Andre McCurdy <armccurdy@gmail.com>
Cc: Andrej Valek <andrej.valek@siemens.com>, 
 "openembedded-core@lists.openembedded.org"
 <openembedded-core@lists.openembedded.org>, Diego Sueiro
 <diego.sueiro@arm.com>
Date: Mon, 19 Oct 2020 20:57:54 +0100
In-Reply-To: <CAJ86T=WvteSbKp3W5UvEQDVsUDh=SRvq20kP343PLQZMmQV_uA@mail.gmail.com>
References: <20201015054600.24514-1-akuster808@gmail.com>
	 <27107.1602752871157273119@lists.openembedded.org>
	 <DB8PR10MB39778008487808091759D8AB92030@DB8PR10MB3977.EURPRD10.PROD.OUTLOOK.COM>
	 <9ea47af9eca270bea1b3e468f530dad782023a44.camel@linuxfoundation.org>
	 <CAJ86T=WvteSbKp3W5UvEQDVsUDh=SRvq20kP343PLQZMmQV_uA@mail.gmail.com>
User-Agent: Evolution 3.36.4-0ubuntu1 
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit

On Mon, 2020-10-19 at 12:55 -0700, Andre McCurdy wrote:
> On Mon, Oct 19, 2020 at 6:25 AM Richard Purdie
> <richard.purdie@linuxfoundation.org> wrote:
> > On Fri, 2020-10-16 at 16:48 +0000, Andrej Valek wrote:
> > > Why are you not enabling these configs correctly via defconfig?
> > 
> > I'd wondered about that. I didn't really want to block the fixes on
> > that discussion and am trying to pick the best places for
> > discussion
> > but I'd take patches tweaking this.
> 
> It would be good to clarify this. At one stage the advice was "the
> more fragmented the better". Does that no longer apply?
> 
>   https://lists.openembedded.org/g/openembedded-core/topic/72273944#68672
> 

The fragments need to be useful. We could create a fragment per config
option but that would clearly not be particularly useful/usable. Its a
question of common sense, which is hard to document explicitly :/.

Cheers,

Richard





