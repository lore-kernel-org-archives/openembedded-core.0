Return-Path: <bruce.ashfield@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 309E2C433F5
	for <webhook@archiver.kernel.org>; Fri,  7 Oct 2022 14:00:05 +0000 (UTC)
Received: from mail-oa1-f47.google.com (mail-oa1-f47.google.com
 [209.85.160.47])
 by mx.groups.io with SMTP id smtpd.web08.4736.1665151201227224721
 for <openembedded-core@lists.openembedded.org>;
 Fri, 07 Oct 2022 07:00:01 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20210112 header.b=emyQnmQd;
 spf=pass (domain: gmail.com, ip: 209.85.160.47,
 mailfrom: bruce.ashfield@gmail.com)
Received: by mail-oa1-f47.google.com with SMTP id
 586e51a60fabf-1322d768ba7so5672912fac.5
        for <openembedded-core@lists.openembedded.org>;
 Fri, 07 Oct 2022 07:00:01 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=O+dnF9OZO0fCBRi2XAKlGaAWhEJEXfMSDZTaRz4cIwI=;
        b=emyQnmQd7F4Af67LyUGWeeRNNvjUlsUSX/8WmE8hww2cRlUq1naOxgjeb6nrPVjyqv
         8+DcZ4FDl2ncIlxP9Yyr2J1cRJY+PE/wlw6XDsl3/tNgrzpr2+AVewEtv8sr9UxUJ+tO
         0fEklAgw3lHivh3l1X5MRohVcxASGJejvPQNn/NETct7AbVsdJeFT9TJnPRe74Qy8T1F
         4Yfk0GZsn3zTHjZAwHfCblOTxwgJyuarZfDf7lbk0TKG0fQrsq1UWCkPN26dmZc4/wek
         /k7DuMVjPyHf3X8iokZI1X6CqHAMQaw5UzpQEm3usa3zdNm/B8PLaHEx+PjT5UBfeWeq
         /QTQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=O+dnF9OZO0fCBRi2XAKlGaAWhEJEXfMSDZTaRz4cIwI=;
        b=soBQ+dme1mQ4yK6oVJXgnMD5QTNquqADdMSFG+/YYEMA6UGrmsZpzdYjKYQVfk+eaU
         rg/9oS25lXe3nK0WDZaIAZrofdisnSCavlm7VaAT2D8roxSeR03g+XO0JtqwabJsO/E1
         ewN867W941oWIXyQqje+LS+uuk0nvXcvUpQNHUNyVZNqa0CMabL8ZLTmpo+SK+TyPrEG
         VpItKyGu17GewmBWh2HE/sIzmZGaHhJGXluMSWi6HaI2cVzEmX5ItVAzMR0t2sH9V57D
         Ej7y9IrAaU1ITJINRsPMEfrPUMRY1waXVPC4eSE7M0CN4hnHmynVqPFDQFr2XNY0Tm8a
         OAXA==
X-Gm-Message-State: ACrzQf3FRVEeUeVoou9aHgzFGNzAPkZaGnfWnYCXeL59s2Um3t5P3ytt
	k01hoOTITvinXrESePYRcM8gUtiqYHIR29E6yNU=
X-Google-Smtp-Source: 
 AMsMyM4mqL1xQCfA3lmJTAs/XNgdZSruF7cNMBKsFnHDapd/NClPi/pk0uEGCA1pWtvALAHL+CKgUbJisDQszasmIJ8=
X-Received: by 2002:a05:6870:179a:b0:133:2981:2893 with SMTP id
 r26-20020a056870179a00b0013329812893mr2499979oae.241.1665151200325; Fri, 07
 Oct 2022 07:00:00 -0700 (PDT)
MIME-Version: 1.0
References: <20221006164944.52304-1-bruce.ashfield@gmail.com>
 <20221007124850.1dc035d2@booty>
In-Reply-To: <20221007124850.1dc035d2@booty>
From: Bruce Ashfield <bruce.ashfield@gmail.com>
Date: Fri, 7 Oct 2022 09:59:49 -0400
Message-ID: 
 <CADkTA4OYBSK0C0hhdax_W24v9b0gOd-omGd8zVYQFc5JepNCnQ@mail.gmail.com>
Subject: Re: [OE-core] [PATCH v2] perf: make scripting depend on setuptools3
To: Luca Ceresoli <luca.ceresoli@bootlin.com>
Cc: richard.purdie@linuxfoundation.org,
	openembedded-core@lists.openembedded.org
Content-Type: text/plain; charset="UTF-8"
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Fri, 07 Oct 2022 14:00:05 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/171524

On Fri, Oct 7, 2022 at 6:48 AM Luca Ceresoli <luca.ceresoli@bootlin.com> wrote:
>
> Hi Bruce,
>
> On Thu,  6 Oct 2022 12:49:44 -0400
> "Bruce Ashfield" <bruce.ashfield@gmail.com> wrote:
>
> > From: Bruce Ashfield <bruce.ashfield@gmail.com>
> >
> > It looks like this should have been an error for a while, but it
> > only started showing up in my 6.x linux-yocto-dev testing.
> >
> > Without the inherit of setuptool3, we get a module missing error
> > during configure and the build obviously fails.
> >
> > Tested against 5.x and 6.x kernels.
> >
> > Signed-off-by: Bruce Ashfield <bruce.ashfield@gmail.com>
>
> This patch triggers a warning:
>
> WARNING: perf-1.0-r9 do_package_qa: QA Issue: File /usr/lib/python3.10/site-packages/perf-0.1-py3.10-linux-x86_64.egg/EGG-INFO/SOURCES.txt in package perf-python contains reference to TMPDIR
>
> https://autobuilder.yoctoproject.org/typhoon/#/builders/100/builds/3499/steps/13/logs/stdio

Interesting. I just built both linux-yocto-dev and linux-yocto against
the patch, and no such warning here .. otherwise, I never would have
sent it along.

If v1 was run through the AB and passed, I suggest we go back to it,
and deal with the packaging after. I'd rather have perf building
against 6.x, than wait to sort out why I'm not seeing the QA warnings
here.

Bruce


>
> --
> Luca Ceresoli, Bootlin
> Embedded Linux and Kernel engineering
> https://bootlin.com



--
- Thou shalt not follow the NULL pointer, for chaos and madness await
thee at its end
- "Use the force Harry" - Gandalf, Star Trek II

