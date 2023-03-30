Return-Path: <richard.purdie@linuxfoundation.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 6E944C6FD1D
	for <webhook@archiver.kernel.org>; Thu, 30 Mar 2023 11:35:31 +0000 (UTC)
Received: from mail-wr1-f48.google.com (mail-wr1-f48.google.com [209.85.221.48])
 by mx.groups.io with SMTP id smtpd.web11.22669.1680176126186687654
 for <openembedded-core@lists.openembedded.org>;
 Thu, 30 Mar 2023 04:35:26 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@linuxfoundation.org header.s=google header.b=OCasv77l;
 spf=pass (domain: linuxfoundation.org, ip: 209.85.221.48, mailfrom: richard.purdie@linuxfoundation.org)
Received: by mail-wr1-f48.google.com with SMTP id r11so18714890wrr.12
        for <openembedded-core@lists.openembedded.org>; Thu, 30 Mar 2023 04:35:25 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linuxfoundation.org; s=google; t=1680176124;
        h=mime-version:user-agent:content-transfer-encoding:references
         :in-reply-to:date:cc:to:from:subject:message-id:from:to:cc:subject
         :date:message-id:reply-to;
        bh=bHbp9KwqURWxMrD2p2/XjwJYH818edd9hFcU6IFnV0w=;
        b=OCasv77lgQGQniyd4r5LA7emQUBmEcyUW2/SE+D+1J4S0jko2KM0ieJQcIEp3T/AAP
         lKuEg0sEoyc/1peUuHeDxp9UTXJMCAxcTBezoPMLjJviq1tIL+3p/gWRVPmuwHtsV+PA
         o4RskvuTNKpQFtK50UjW9MF2D1W7c6pCfbmsg=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112; t=1680176124;
        h=mime-version:user-agent:content-transfer-encoding:references
         :in-reply-to:date:cc:to:from:subject:message-id:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=bHbp9KwqURWxMrD2p2/XjwJYH818edd9hFcU6IFnV0w=;
        b=bFZV4P8hpnNlJF1wNvAjwSveT3x7b/24utvtqc+VsfuVKWWNOT37w2g6OezekvfwNz
         Tzd7wO/wqP3IeDwfTNoUVGXvC8pZhwCUUYVvL3YvJKN3rILyFOJyjzdnlfu+IO/5cIK9
         n8g01n7xEInzAolOmBMeYeBEGJU73gl+CjiFQPYaRFDbXB34OEms6D/VM77U2Ud27mYH
         jsUr4usiOpVxIPk4uTjC7LLyrFzpo3Vm2taovBC2Y36WDQ6YHN+ES966evv/50xVyT5I
         15v789ubM9h44HUpBNYGjLRfxxsnj9w6hyyfzo9CIWl5PAZAVtfCA9AbHEsAZQGrEzBC
         vbfg==
X-Gm-Message-State: AAQBX9d8FMbrnBof5yqC4J2HljnAgidXVcdw2GpyMRaNcnLOOnsz/Zq6
	3DFe+EPZB1r16r0w2dHZyup6sA==
X-Google-Smtp-Source: AKy350Yr82FP3nZXNZl0mhc94u2HNAUh4BQo5r95iRGVHjRs9vV8adyIRU7Ipe9gk/qgGkCyQ4enZg==
X-Received: by 2002:adf:db92:0:b0:2e2:4d65:e8c7 with SMTP id u18-20020adfdb92000000b002e24d65e8c7mr7175593wri.35.1680176124425;
        Thu, 30 Mar 2023 04:35:24 -0700 (PDT)
Received: from ?IPv6:2001:8b0:aba:5f3c:77e0:6cb9:7d92:358e? ([2001:8b0:aba:5f3c:77e0:6cb9:7d92:358e])
        by smtp.gmail.com with ESMTPSA id z20-20020a7bc7d4000000b003eeb1d6a470sm5578378wmk.13.2023.03.30.04.35.23
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 30 Mar 2023 04:35:24 -0700 (PDT)
Message-ID: <d83c8058e83e33d02e4650c2d29c1a03a6db739f.camel@linuxfoundation.org>
Subject: Re: [OE-core] [PATCH V4 5/5] meta-selftest: provide a recipe for
 zvariant
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: Frederic Martinsons <frederic.martinsons@gmail.com>, Alexandre Belloni
	 <alexandre.belloni@bootlin.com>
Cc: openembedded-core@lists.openembedded.org, alex.kiernan@gmail.com
Date: Thu, 30 Mar 2023 12:35:23 +0100
In-Reply-To: <CA+cAker5pJUBoOSEVZtk++394xGgXqcDDD9eFJpu07+Ai5PaWg@mail.gmail.com>
References: <cover.1680103647.git.frederic.martinsons@gmail.com>
	 <8d69fe1e3f390a7e8fa568abdc20e5d0ee634fc1.1680103647.git.frederic.martinsons@gmail.com>
	 <20230330090324705e693e@mail.local> <2023033009145701b67168@mail.local>
	 <CA+cAker5pJUBoOSEVZtk++394xGgXqcDDD9eFJpu07+Ai5PaWg@mail.gmail.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
User-Agent: Evolution 3.47.3-1 
MIME-Version: 1.0
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 30 Mar 2023 11:35:31 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/179315

On Thu, 2023-03-30 at 11:47 +0200, Frederic Martinsons wrote:
> What version of bitbake you had pulled ?
> Because "mandatory checksum on crates" is a patch I submitted two
> weeks ago
> (https://patchwork.yoctoproject.org/project/bitbake/patch/20230317081
> 916.1857201-2-frederic.martinsons@gmail.com/))
> and it is not yet merged in bitbake master nor in poky master.
>=20
> So I construct the present series without these patches in mind since
> it is not related.
> I you plan to merge the previous series, I can update the zvariant
> for this recipe of course
> it can be done by issuing "bitbake -c update_crates zvariant" if this
> patch
> (https://patchwork.yoctoproject.org/project/bitbake/patch/20230316121
> 249.28209-1-frederic.martinsons@gmail.com/) is present
>=20
> I'm sorry, I must admit that I'm kinda lost with the patch submission
> process when it impacts multiple different
> projects.
> Can you advise on the way of doing this?

I've merged the other series now so could you rebase this one on master
please?

Usually if there are two related series you'd base one on the other and
note it in the 0/X of the series. We'd work on the assumption the
earlier patches would merge first.

The holdup was that I wanted to check something in the bitbake patch,
which turned out to be fine, I just needed to do it as part of review
due diligence.

Cheers,

Richard

