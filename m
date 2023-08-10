Return-Path: <richard.purdie@linuxfoundation.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 740DAC04A6A
	for <webhook@archiver.kernel.org>; Thu, 10 Aug 2023 16:39:47 +0000 (UTC)
Received: from mail-wm1-f43.google.com (mail-wm1-f43.google.com [209.85.128.43])
 by mx.groups.io with SMTP id smtpd.web11.22348.1691685583187363069
 for <openembedded-core@lists.openembedded.org>;
 Thu, 10 Aug 2023 09:39:43 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@linuxfoundation.org header.s=google header.b=Cjrz79c+;
 spf=pass (domain: linuxfoundation.org, ip: 209.85.128.43, mailfrom: richard.purdie@linuxfoundation.org)
Received: by mail-wm1-f43.google.com with SMTP id 5b1f17b1804b1-3fe32016bc8so9575945e9.1
        for <openembedded-core@lists.openembedded.org>; Thu, 10 Aug 2023 09:39:42 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linuxfoundation.org; s=google; t=1691685581; x=1692290381;
        h=mime-version:user-agent:content-transfer-encoding:references
         :in-reply-to:date:cc:to:from:subject:message-id:from:to:cc:subject
         :date:message-id:reply-to;
        bh=2h9Ge/Ja2M/OMAXY1lIQjOpUC2twBF5i2idzu8pVNL4=;
        b=Cjrz79c+arPb3j5qckd5/wV/QeW9TonwsWPeMGrbaGE/J6jpayKG/0bGgLbbqeD3aS
         zPJ/J6Agli8Qyfr54KcS1M8kx0KrfeDuAcEq133RK1v5OuFgexL9RMpyG+QlJGxcE+8k
         6HImqyfS4X2GRUrv7QiPc1ksw8hs4NwghgPAQ=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1691685581; x=1692290381;
        h=mime-version:user-agent:content-transfer-encoding:references
         :in-reply-to:date:cc:to:from:subject:message-id:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=2h9Ge/Ja2M/OMAXY1lIQjOpUC2twBF5i2idzu8pVNL4=;
        b=jW4q6Aj0dwSJE+Gn6c2r1wsWWZjIeNINZLrVYul/cuQwkJV7iQQ5g/en9eB5EzVv7q
         ZruV0bpNeApydSsdkWHDrqpPRnmnC2AavIC3NFwEc7qGw31yBpRXGratqRACVjp/bLIX
         SpOkq3HL+ycdA6FnyRhepkSw2uATbYVf7CEZz1oPEZwxDdR7mtOff5BDZrLhKVpRKDhI
         BKxDOTV5lEepI7eeR40WeKq+oDD0OXfhu/KCFTo8J8zzWqBOlubX1pbhym9G5Zfi8G6k
         9IF+iKHMBCPwI68WCAXRXyz24BRRWFY0h6eDoOb43+Xl1XtVYKArn0KI/CPlpo1mrtJf
         5MUw==
X-Gm-Message-State: AOJu0YwQ0/tqxy9tD3ujmXjERSI3g06TRkgXFodog5Phv5dmbY3GlrHp
	p+PFci6UJUR3/3J2DNEcv/BcpA==
X-Google-Smtp-Source: AGHT+IHX6VCd7um1ix/5TeVhVGMUCw+xBaQLHhRUaSp4zoTxUyUVpl8soZan6TinqgYoH7nnjYsfeg==
X-Received: by 2002:a05:600c:ad2:b0:3fe:159d:422b with SMTP id c18-20020a05600c0ad200b003fe159d422bmr2351181wmr.32.1691685581501;
        Thu, 10 Aug 2023 09:39:41 -0700 (PDT)
Received: from ?IPv6:2001:8b0:aba:5f3c:8ad4:8961:8732:8a5a? ([2001:8b0:aba:5f3c:8ad4:8961:8732:8a5a])
        by smtp.gmail.com with ESMTPSA id v2-20020adfe282000000b00317ab75748bsm2624379wri.49.2023.08.10.09.39.40
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 10 Aug 2023 09:39:40 -0700 (PDT)
Message-ID: <4dac2eacd924bd5f422abd37f29b3ede94c6bdda.camel@linuxfoundation.org>
Subject: Re: [OE-core] [PATCH] selftest/reproducible: Update config to match
 ongoing changes
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: Alexander Kanavin <alex.kanavin@gmail.com>
Cc: openembedded-core@lists.openembedded.org
Date: Thu, 10 Aug 2023 17:39:40 +0100
In-Reply-To: <CANNYZj8oojCWS-rV0tOfOGYN4fCqAAX793U0nbX_y1ZSOk3ohQ@mail.gmail.com>
References: <20230810133450.237127-1-richard.purdie@linuxfoundation.org>
	 <CANNYZj9AacW-XB2G-6sHQobui1LGBHUMQTxV5EU=7ordJayWQw@mail.gmail.com>
	 <eb94b91c02dbade5945a8883a95ed04d2ee31961.camel@linuxfoundation.org>
	 <CANNYZj-L2P96Ev=xbr5LWoL7OvyVU6hGkCajksgMgxPNF4ZQ2w@mail.gmail.com>
	 <bff014f2950bfbd1f3027a85992eb7c0f4e108b4.camel@linuxfoundation.org>
	 <CANNYZj8oojCWS-rV0tOfOGYN4fCqAAX793U0nbX_y1ZSOk3ohQ@mail.gmail.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
User-Agent: Evolution 3.48.1-0ubuntu1 
MIME-Version: 1.0
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 10 Aug 2023 16:39:47 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/185816

On Thu, 2023-08-10 at 18:32 +0200, Alexander Kanavin wrote:
> On Thu, 10 Aug 2023 at 18:24, Richard Purdie
> <richard.purdie@linuxfoundation.org> wrote:
> > I'm thinking having usrmerge disabled makes it more likely we'd notice
> > a "bad" tool path creeping into builds rather than the case where the
> > host and target share the same paths. That isn't a reproducibility
> > case, more a general one.
>=20
> But then should we really drop usrmerge/systemd from reproducibility
> as the bad path wouldn't be noticed until runtime (or maybe in
> package_qa), and that is tested elsewhere?

We do build systemd configurations in multiple places and package_qa
checks are run.

> FWIW, I'm not particularly happy that systemd is nowadays de facto
> dictating filesystem layouts. Or that you can use any libc you like,
> as long as it's glibc. And that all/most key developers are employed
> by Microsoft. Monocultures are not good, even if source code is
> available.

I am also a bit worried about that and I don't really want to tie
ourselves to that in our test matrix.

Whilst removing systemd from there looks fairly drastic, it isn't as
bad as it seems. From the reproducibility work, we've now much tighter
QA checks in general so the reprodcubility issues appearing now are
much reduced and usually toolchain level rather than random path issues
which the QA checks now find much earlier. As such, I doubt overall
reproducibility will suffer regressions.

Cheers,

Richard





