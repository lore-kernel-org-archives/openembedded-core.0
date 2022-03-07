Return-Path: <richard.purdie@linuxfoundation.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 64C0FC433FE
	for <webhook@archiver.kernel.org>; Mon,  7 Mar 2022 09:45:21 +0000 (UTC)
Received: from mail-wr1-f49.google.com (mail-wr1-f49.google.com
 [209.85.221.49])
 by mx.groups.io with SMTP id smtpd.web10.24538.1646646320421275806
 for <openembedded-core@lists.openembedded.org>;
 Mon, 07 Mar 2022 01:45:20 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@linuxfoundation.org header.s=google header.b=foGiLP0R;
 spf=pass (domain: linuxfoundation.org, ip: 209.85.221.49,
 mailfrom: richard.purdie@linuxfoundation.org)
Received: by mail-wr1-f49.google.com with SMTP id u1so22209044wrg.11
        for <openembedded-core@lists.openembedded.org>;
 Mon, 07 Mar 2022 01:45:20 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linuxfoundation.org; s=google;
        h=message-id:subject:from:to:cc:date:in-reply-to:references
         :user-agent:mime-version:content-transfer-encoding;
        bh=iMwlVqfeFXRSL2gMRqgznEx1YW90xvGT7qSTexKLfB0=;
        b=foGiLP0R231tWQbo2gsCebd2HfAmG7uWBx3bgNyiIE1SNmXDQu7Qa8I9Uszb5WDNhN
         iVqcnBROIw8+dtqJWg13n6b5jGcOIMSWYDU3jGFOieh+GU1hBfiyOO27YFMqdAjMvUo8
         9udGw/+d6B4WLo2GKWH9jnR7q65C1BZVAQEvg=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:message-id:subject:from:to:cc:date:in-reply-to
         :references:user-agent:mime-version:content-transfer-encoding;
        bh=iMwlVqfeFXRSL2gMRqgznEx1YW90xvGT7qSTexKLfB0=;
        b=WdaooiL9HKWrXPwO1ZSfSeHMw75raGpJOtRBOEHTS04lbbfy4BkE0hb/26qmAZGzE0
         hFZDnol3TYE+sDmrpDm6PQnpyv+ICFl0wNV2LgEK9QE49L1vH7tLOOFqMMXFzWLDy1mR
         O2M6NsLuGF9oH80rKM6tcxCNxxy+CIq14JWwLPwaFPfObneXEWRP9BqQRl7j6FOFgcEO
         pWEGQtRHAK6NJeib+9KV9/BA+CNQKkdpcSxdeZ5JxnsAk2bMGbbK2HSaiFy9ag+hkv6j
         mrNzYthJkg1DizstGoCAy/5OISuNLZJTC0xwh2j6GvtyTMvLB+uJbrZ3oBI/4ka8naEe
         Qsew==
X-Gm-Message-State: AOAM532fmLRbOdhl0nJCWkmaARuBFOdoCrrQcIQ4iYekOIuYcv4zkXSb
	B5B3JfjbWZXLcj7uj9WS/reh9A==
X-Google-Smtp-Source: 
 ABdhPJyXBoukXD4wj/WbNVXHOIDZraIUBgd6TVe7PBJei4H7nu4RI1g4kkfb2HgnWDoNtM4I16zlDQ==
X-Received: by 2002:adf:e342:0:b0:1f0:648f:c32b with SMTP id
 n2-20020adfe342000000b001f0648fc32bmr7610481wrj.204.1646646318868;
        Mon, 07 Mar 2022 01:45:18 -0800 (PST)
Received: from ?IPv6:2001:8b0:aba:5f3c:bb31:2700:8490:fdf8?
 ([2001:8b0:aba:5f3c:bb31:2700:8490:fdf8])
        by smtp.gmail.com with ESMTPSA id
 u23-20020a7bcb17000000b0037bdfa1665asm29525697wmj.18.2022.03.07.01.45.18
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 07 Mar 2022 01:45:18 -0800 (PST)
Message-ID: 
 <1a74878218e1d5273b2da707664d1d5fce38c360.camel@linuxfoundation.org>
Subject: Re: [OE-core] [PATCH 1/2] python3-native: Remove all pyc files
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: Konrad Weihmann <kweihmann@outlook.com>
Cc: openembedded-core@lists.openembedded.org
Date: Mon, 07 Mar 2022 09:45:15 +0000
In-Reply-To: 
 <AS8PR09MB4645D5427DCEE1D6F488EF73A8089@AS8PR09MB4645.eurprd09.prod.outlook.com>
References: <20220303163451.336518-1-richard.purdie@linuxfoundation.org>
	 <CAAnfSTu78H+UG34pykED6G8M939LLmupEghxaUaz8_mToAwwFg@mail.gmail.com>
	 <6d880923351fe7e16d4c44d25dd8f43d1de390c6.camel@linuxfoundation.org>
	 <CANx9H-Cn8e6-5q-6YJurv0TkTDvFnVd=9Kd5qFs5geP7i8YXGQ@mail.gmail.com>
	 <d4f51c5770e4ffa626acffe9042aadd9d6e6ba92.camel@linuxfoundation.org>
	 <AS8PR09MB4645D5427DCEE1D6F488EF73A8089@AS8PR09MB4645.eurprd09.prod.outlook.com>
Content-Type: text/plain; charset="UTF-8"
User-Agent: Evolution 3.40.4-1ubuntu2 
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 07 Mar 2022 09:45:21 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/162803

On Mon, 2022-03-07 at 08:36 +0100, Konrad Weihmann wrote:
> 
> On 04.03.22 00:46, Richard Purdie wrote:
> > On Thu, 2022-03-03 at 15:28 -0800, Tim Orling wrote:
> > > 
> > > 
> > > On Thu, Mar 3, 2022 at 9:16 AM Richard Purdie
> > > <richard.purdie@linuxfoundation.org> wrote:
> > > > On Thu, 2022-03-03 at 17:14 +0000, Ross Burton wrote:
> > > > > On Thu, 3 Mar 2022 at 16:34, Richard Purdie
> > > > > <richard.purdie@linuxfoundation.org> wrote:
> > > > > > This removes a further 1600 files from sstate handling and lets python
> > > > > > create the ones it wants at runtime which is likely much better overall
> > > > > > for performance.
> > > > > 
> > > > > Playing devil's advocate: doesn't having them in sstate mean they're
> > > > > generated once and hardlinked, instead of needing to be generated for
> > > > > every recipe which runs pythonnative?
> > > > > 
> > > > > Whilst I can't disagree that 1600 files being dropped from sstate is
> > > > > good, we're just punting the recompile step to every recipe when it
> > > > > runs python code.
> > > > > 
> > > > > I guess the question here is how long does the Python library take to
> > > > recompile.
> > > > 
> > > 
> > > 
> > > At runtime it should only generate pyc for modules actually used?
> > 
> > Yes.
> > 
> > > > Another consideration is that there are many sysroots pulling in python3-
> > > > native
> > > > which don't run python and they're only there as there are python scripts
> > > > being
> > > > added which means python has to come too.
> > > > 
> > > > I suspect for that reason it could be a net win but it is a tough call.
> > > > 
> > > 
> > > I tend to be in favor of the reduced number of files moving around. I suppose
> > > we could do some timing comparisons if we really care. It will be a trade-off
> > > of network/io vs compute/io, correct?
> > 
> > Yes. I suspect the compile cost is tiny compared to the io/network cost of
> > chucking so many small files around when I suspect they're not used that often.
> > 
> > Cheers,
> > 
> > Richard
> 
> Now as this is in master and works reasonably well, could we extent the 
> removal of pyc for native recipes to *all* python packages.
> I'm still seeing occasional staging issues on random native python 
> recipes as described in 
> https://bugzilla.yoctoproject.org/show_bug.cgi?id=13868.
> And as the common understanding here seems to be that the additional 
> compile costs are negligible compared to the staging costs of additional 
> files, I would propose to add
> 
> do_install:append:class-native() {
> 	find ${D} -name *.pyc -delete
> }
> 
> to setuptools3.bbclass (as this looks like the one piece of code that 
> almost all python packages have in common)
> 
> Any thoughts?

I don't really like working around errors like the above bug where we haven't
understood the underlying issue :/

I suspect those pyc files are nowhere near as large an issue as the ones in the
python recipe itself either, there are likely only small numbers of them.

Cheers,

Richard


