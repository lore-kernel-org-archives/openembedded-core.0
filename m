Received: from mail-wr1-f49.google.com (mail-wr1-f49.google.com [209.85.221.49])
 by mx.groups.io with SMTP id smtpd.web09.5604.1605605084308240056
 for <openembedded-core@lists.openembedded.org>;
 Tue, 17 Nov 2020 01:24:44 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@linuxfoundation.org header.s=google header.b=dcTtb+7L;
 spf=pass (domain: linuxfoundation.org, ip: 209.85.221.49, mailfrom: richard.purdie@linuxfoundation.org)
Received: by mail-wr1-f49.google.com with SMTP id u12so15202050wrt.0
        for <openembedded-core@lists.openembedded.org>; Tue, 17 Nov 2020 01:24:44 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linuxfoundation.org; s=google;
        h=message-id:subject:from:to:cc:date:in-reply-to:references
         :user-agent:mime-version:content-transfer-encoding;
        bh=gcluGgQ1Ime/SlWfKrACCPPgkxl08HZzcv9U0RSuR58=;
        b=dcTtb+7LJWVhI1mK1U4XN8KKXiZRsxVbAbeMEwgp6dU6HwIWK3TijsC4pPzp5m8UWh
         23FeWdyO/BH2F0ga8pR9HIMy1nz8SPOZyak4lCzY6pTujGkqW29Q4vLQzyn9ytJHs2+U
         4gBvuJ+TR6JL1OlXDAZfau1WZVdLuScxeFPD0=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:message-id:subject:from:to:cc:date:in-reply-to
         :references:user-agent:mime-version:content-transfer-encoding;
        bh=gcluGgQ1Ime/SlWfKrACCPPgkxl08HZzcv9U0RSuR58=;
        b=diCwDYKz4+JQOlFWb0yQFtZ+aKfxfYaQqufoQutguYaMkqkufYxgtByEJTRz1/FL4F
         oeK6yMk7YmKm6NxEZSvzsBSwBvFKeDJrchqkFbSdyD0Vj4Mc2lW6dlJbH8ymo/xhl6XI
         /cAZmVibgoGrZTqKJM32dEwUEToagWNu9D5YtEjJQA9I8yl3Mr9aGYe0y7C7TOZbG14S
         W/O4zCLdzwXvS4nl6XDOpblTwsoQBwNtqAzG9rQ2ebAUIlHtpjsmuYvfQqqZoySnOXP6
         eDuNmvXOi2hiMlbxY+1yDUwYah27rVbvbdVaZ83yMkJOAlrB0S8dLdaNO9sDPINWmP/Y
         Vfxw==
X-Gm-Message-State: AOAM533Re2RuVu86LmahZ6abSzyHzi0YVodEQALUrYHyWjS7z+vY7OzT
	J/9Jmg3c4nzdmx6izR8euwXRTA==
X-Google-Smtp-Source: ABdhPJxqTs/gtTJHOWCz/at72h1CaroF+SlU9IOImata5whkl73uuD9uFK2VBBeMk5S5bAN6aRbx2Q==
X-Received: by 2002:adf:b358:: with SMTP id k24mr21804552wrd.388.1605605082770;
        Tue, 17 Nov 2020 01:24:42 -0800 (PST)
Return-Path: <richard.purdie@linuxfoundation.org>
Received: from 2.2.2.0.7.3.f.1.3.6.f.f.7.9.4.9.c.3.f.5.a.b.a.0.0.b.8.0.1.0.0.2.ip6.arpa (2.2.2.0.7.3.f.1.3.6.f.f.7.9.4.9.c.3.f.5.a.b.a.0.0.b.8.0.1.0.0.2.ip6.arpa. [2001:8b0:aba:5f3c:9497:ff63:1f37:222])
        by smtp.gmail.com with ESMTPSA id a12sm26142239wrr.31.2020.11.17.01.24.42
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 17 Nov 2020 01:24:42 -0800 (PST)
Message-ID: <a4cd002d204f0365ccbbe83b76727a3a7d41929a.camel@linuxfoundation.org>
Subject: Re: [OE-core] [PATCH v2 0/5] systemtap improvements
From: "Richard Purdie" <richard.purdie@linuxfoundation.org>
To: Victor Kamensky <victor.kamensky7@gmail.com>, Yann Dirson
	 <yann.dirson@blade-group.com>
Cc: openembedded-core@lists.openembedded.org, kamensky@cisco.com, Zang
 Ruochen <zangrc.fnst@cn.fujitsu.com>
Date: Tue, 17 Nov 2020 09:24:40 +0000
In-Reply-To: <CAHSqoWvtKw25wkT0a9Hpvp4T1Umg6OBB7fGrYq1SR+i_6b1Bpg@mail.gmail.com>
References: <20201112172616.784945-1-yann@blade-group.com>
	 <CAHSqoWsCZbE03tuDsfEnwxSCGddUuti_GAAF_ga6e-ozKXK3Ew@mail.gmail.com>
	 <CA+4=imb5WUKYxKg1qwy-k0dUGApzCYwEskddGhVfyovGnSePew@mail.gmail.com>
	 <CA+4=imZPuimbfuxLGnjYyy=sWoX3qWbavMk3+vnEqbJXizQWXQ@mail.gmail.com>
	 <CAHSqoWvtKw25wkT0a9Hpvp4T1Umg6OBB7fGrYq1SR+i_6b1Bpg@mail.gmail.com>
User-Agent: Evolution 3.36.4-0ubuntu1 
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit

On Mon, 2020-11-16 at 20:34 -0800, Victor Kamensky wrote:
> Hi Yann and Richard,
> 
> On Fri, Nov 13, 2020 at 5:59 AM Yann Dirson <
> yann.dirson@blade-group.com> wrote:
> >
> > Oh I did not notice, shouldn't we be discussing this on-list ?
> 
> Very sorry about this. I did not notice that I've unintentionally
> removed the mailing list.
> Added it back.
> 
> I see that Richard added your patches to master-next. But I don't
> think they should be
> merged "as is". IMO we need to work more on them.
> 
> Richard, could you please hold off merging them?

Sorry, they did merge already around a day ago. Yann had proposed them
a while ago and spent quite a bit of time sorting out the automated
testing failures so it felt like we should merge them since there was
no feedback otherwise and they looked basically reasonable to me.

Obviously we can follow up with other improvements to build upon them
though.

Cheers,

Richard

