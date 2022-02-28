Return-Path: <richard.purdie@linuxfoundation.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 49762C433F5
	for <webhook@archiver.kernel.org>; Mon, 28 Feb 2022 14:57:20 +0000 (UTC)
Received: from mail-wr1-f45.google.com (mail-wr1-f45.google.com
 [209.85.221.45])
 by mx.groups.io with SMTP id smtpd.web10.20540.1646060239396225233
 for <openembedded-core@lists.openembedded.org>;
 Mon, 28 Feb 2022 06:57:19 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@linuxfoundation.org header.s=google header.b=EM7NwWUL;
 spf=pass (domain: linuxfoundation.org, ip: 209.85.221.45,
 mailfrom: richard.purdie@linuxfoundation.org)
Received: by mail-wr1-f45.google.com with SMTP id d3so15927057wrf.1
        for <openembedded-core@lists.openembedded.org>;
 Mon, 28 Feb 2022 06:57:19 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linuxfoundation.org; s=google;
        h=message-id:subject:from:to:date:in-reply-to:references:user-agent
         :mime-version:content-transfer-encoding;
        bh=8ccjMQH2IzoBo+UyYfkvil+ynd2IsVtdQnqwlE2S6+4=;
        b=EM7NwWULFRXUZ8pmx3CLx2sBqhpiKRXZaJzfh0ZzSelngGu9KnlAoCaCfCg5Na1HlG
         63pcyQAJdO6opPdK+xIiOGx4ADSA2sbRJDR/4MsuR0Zqv39WaHtf6gBUqi9jImj+wOXc
         zslOakiUHMKlghIfWibR2ZeVXCRuXKSRESl1U=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:message-id:subject:from:to:date:in-reply-to
         :references:user-agent:mime-version:content-transfer-encoding;
        bh=8ccjMQH2IzoBo+UyYfkvil+ynd2IsVtdQnqwlE2S6+4=;
        b=nz1gIosOhz9TFaIImrb+Ar/hM+MMaujM5bzdEqLTbh3gdUdkQla3pvn0d8uQM2mfJv
         m6YNvsLktfeCoFYQGYxhNLLkirZARtFfl/tBNADUO9aCGH2O5a2B7nEhgJFw/DvFUURy
         whqXXmxYLHfpbWsD2efpAj25/ER9m5h8kSlyVX6Cv0gfChTCdnV03XGOWwFepgnKjnsS
         BSv166KuPxsfCGp90jXUkfhdYP5Ydpadd/BCcqEZw+VkCeoNuTrKTU6jc3YSPtyhnHlp
         4KUNfulxh6InVG6kyRIQlPtHd7U95WOFdgkPMQnO/B3cTTvtyI8jc+I71bkpfaCoBfWk
         YqxQ==
X-Gm-Message-State: AOAM532zF9cV23FAG4djg3w2WWxPo7/iOJGTETX+U6HiiivdUlnTxTch
	rGfxcjF3hw8vXezPyCbZKcChUA==
X-Google-Smtp-Source: 
 ABdhPJx7nmRKIzdGV2h+SKCCQBBxwSsF6/fBOH9Et0O66IuR5JwDlkRcNBc7pgL3s1Lyl8hy6ogqbg==
X-Received: by 2002:adf:914f:0:b0:1ed:bb92:d0cc with SMTP id
 j73-20020adf914f000000b001edbb92d0ccmr16234024wrj.297.1646060237863;
        Mon, 28 Feb 2022 06:57:17 -0800 (PST)
Received: from ?IPv6:2001:8b0:aba:5f3c:7be6:4a6f:2d8e:ec86?
 ([2001:8b0:aba:5f3c:7be6:4a6f:2d8e:ec86])
        by smtp.gmail.com with ESMTPSA id
 t9-20020a05600c198900b0037c0342cb62sm17217593wmq.4.2022.02.28.06.57.17
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 28 Feb 2022 06:57:17 -0800 (PST)
Message-ID: 
 <fdd9e9a9d65e5bc5531718ca3d831cf98d15e9c0.camel@linuxfoundation.org>
Subject: Re: [PATCH] bitbake.conf: add BB_NUMBER_THREADS to
 BB_HASHEXCLUDE_COMMON
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: Rasmus Villemoes <rasmus.villemoes@prevas.dk>,
	openembedded-core@lists.openembedded.org
Date: Mon, 28 Feb 2022 14:57:15 +0000
In-Reply-To: <c60f6d60-ff47-d91a-e97b-6a545c878e71@prevas.dk>
References: <20220228084250.3874136-1-rasmus.villemoes@prevas.dk>
	 <eee2ca92c2a0078b9f767737e20445927f7f2f5d.camel@linuxfoundation.org>
	 <c60f6d60-ff47-d91a-e97b-6a545c878e71@prevas.dk>
Content-Type: text/plain; charset="UTF-8"
User-Agent: Evolution 3.40.4-1ubuntu2 
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 28 Feb 2022 14:57:20 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/162505

On Mon, 2022-02-28 at 15:06 +0100, Rasmus Villemoes wrote:
> On 28/02/2022 14.41, Richard Purdie wrote:
> > On Mon, 2022-02-28 at 09:42 +0100, Rasmus Villemoes wrote:
> > > The imx-gpu-sdk recipe in the meta-imx layer references
> > > ${BB_NUMBER_THREADS} in its do_compile function. Changing
> > > BB_NUMBER_THREADS between bitbake invocations leads to the well-known
> > > 
> > >   When reparsing ...meta-imx/meta-sdk/recipes-graphics/imx-gpu-sdk/imx-gpu-sdk_5.8.0.bb:do_compile, the basehash value changed from 69be88cf220840ff2203e11cfe65681880b0bf9b88db67d50c1ba772b883bd18 to 5e6d5029fac8d7856ada4c2eca359568298f82cdb64567d7dd4deda503d9f83a. The metadata is not deterministic and this needs to be fixed.
> > > 
> > > And I'm not the first to hit this problem with that recipe:
> > > https://community.nxp.com/t5/i-MX-Processors/imx-gpu-sdk-compile-error-IMX8MP-IMX8MM-IMX8MQ/td-p/1217864
> > > 
> > > This happens because BB_NUMBER_THREADS is in BB_HASHCONFIG_IGNORE_VARS,
> > > so changing it does not cause the recipe to be reparsed, but it is not
> > > included in BB_HASHEXCLUDE_COMMON and thus
> > > BB_BASEHASH_IGNORE_VARS. This is inconsistent with and in contrast to
> > > both PARALLEL_MAKE and OMP_NUM_THREADS, the latter of which even has
> > > ${BB_NUMBER_THREADS} as default value.
> > 
> > Technically imx-gpu-sdk is incorrect. BB_NUMBER_THREADS is the number of tasks
> > bitbake should run. PARALLEL_MAKE is what is used for parallelism in do_compile.
> > 
> > I appreciate that has -j in but you can use: ${@oe.utils.parallel_make(d)} to
> > obtain the value that recipe needs.
> 
> Oh, I'm not saying that that recipe isn't buggy, but is still seems
> awfully user-unfriendly and inconsistent to treat BB_NUMBER_THREADS
> different from PARALLEL_MAKE wrt. hash computations.

The reasoning is that nothing should be using BB_NUMBER_THREADS like that. Your
patch would just mask it even more :/. Ideally we'd have something to tell
people they were misusing it but that is harder to do.

> But now I've raised the issue, and I don't care much what happens next;
> I now know the root cause of the error I saw and rarely build using
> meta-imx in the first place.

Just to check, are the meta-imx people aware of it and able to fix the real
problem?

Cheers,

Richard



