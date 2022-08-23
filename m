Return-Path: <raj.khem@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 2468FC32772
	for <webhook@archiver.kernel.org>; Tue, 23 Aug 2022 17:17:27 +0000 (UTC)
Received: from mail-yw1-f170.google.com (mail-yw1-f170.google.com
 [209.85.128.170])
 by mx.groups.io with SMTP id smtpd.web09.610.1661275046065373445
 for <openembedded-core@lists.openembedded.org>;
 Tue, 23 Aug 2022 10:17:26 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20210112 header.b=cSI3R9RK;
 spf=pass (domain: gmail.com, ip: 209.85.128.170,
 mailfrom: raj.khem@gmail.com)
Received: by mail-yw1-f170.google.com with SMTP id
 00721157ae682-3376851fe13so364178927b3.6
        for <openembedded-core@lists.openembedded.org>;
 Tue, 23 Aug 2022 10:17:25 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc;
        bh=it4AO2TqlCPzOjWVa1ZuvK8mqkAIyqvr7TAWcHpx+Kc=;
        b=cSI3R9RKNWbMbh7MlCZJr0LR4qLnbFb8lCfcrFwczCQJOoi8ACw29EzU4HLqzjvZeT
         4LYirgFDRJRXC8rrVLkbhAmopmlKAzpiAo6sT0JazhH2GGF0wlefzUxaqdpD6ghMLI7D
         BbMbVGrh2IVnBznlQBkzfOP9kYRCv6PVFEfGcje+4V0M8ikGT9XWvEyUCTfS4SBSRBO6
         OFcPV81ih1+mKebLZ/3FAd/Mgce2LD9pnjEQBQT/Iklfp/dXwFZWVGhvPxrSCOk0REUs
         JEfHK/8I76rRFVRlW6hd+vEk7O3ah3MUyOEoZu6Mnzin5HlFuEXJVIDIsz0pgVF67J5k
         7WsQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc;
        bh=it4AO2TqlCPzOjWVa1ZuvK8mqkAIyqvr7TAWcHpx+Kc=;
        b=FYuR+Iqt7vZP6phEnN/fDgTi5bBayqzwvtei7TxOn0LFeO4lWIsecWLx5HCmGx1yG+
         l/bbJ/ME5OgeIOXVTl/p5gIAy5OzxgtYMPWxr4WFlXBDIbN5V4pqEh5mAmE446zMrtlC
         iW8OgSRwXudmCrtX8vHlRIbAZ4J2ucKg+xldpVsaMOzDMfHuTEofkSCnXJlkCsG5EY3W
         VkOyd003McsVRgeLZloSFgXU8crVPvMashJkE5cjIkpVmQeIEQKkmq95YMMp3I7B8ai3
         ZBRtoLoteRuOjAehm4XlcjLT3FFWw/PcIE92PyzSoZ52SPPrXKrcgbWHYPnqlu5Jxr0X
         CePw==
X-Gm-Message-State: ACgBeo2EUj97VTF9Ka++FwLlNVaFAToyokgoxbETTX74K4XIdZ9ZwHOr
	JjyTMWtqvN9B432dwYmdn1vHvxA6cB3XK0uQvbs=
X-Google-Smtp-Source: 
 AA6agR5tMfBVxgNHIYqviYkpFHhikUQYBhGwkMIi8RydN/wHBnTwGQ11XMMC3PbrnDrqS2X0hdVWEQdmFr+vqJI42dY=
X-Received: by 2002:a81:b043:0:b0:333:df91:2483 with SMTP id
 x3-20020a81b043000000b00333df912483mr12659283ywk.296.1661275045099; Tue, 23
 Aug 2022 10:17:25 -0700 (PDT)
MIME-Version: 1.0
References: <20220820163903.3462152-1-raj.khem@gmail.com>
 <20220823164944.774719d2@booty>
In-Reply-To: <20220823164944.774719d2@booty>
From: Khem Raj <raj.khem@gmail.com>
Date: Tue, 23 Aug 2022 10:16:58 -0700
Message-ID: 
 <CAMKF1sq14D6vtz-7C3oJHie0YJmXUG6qKODaMjLQ1W_xC7Wwng@mail.gmail.com>
Subject: Re: [OE-core] [PATCH] gcc: Upgrade to 12.2.0
To: Luca Ceresoli <luca.ceresoli@bootlin.com>
Cc: openembedded-core@lists.openembedded.org
Content-Type: text/plain; charset="UTF-8"
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 23 Aug 2022 17:17:27 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/169718

thanks Luca

I will take a look today

On Tue, Aug 23, 2022 at 7:49 AM Luca Ceresoli <luca.ceresoli@bootlin.com> wrote:
>
> Hi Khem,
>
> On Sat, 20 Aug 2022 09:39:03 -0700
> "Khem Raj" <raj.khem@gmail.com> wrote:
>
> > GCC 12.2 is the first bug-fix release from the GCC 12 branch containing
> > important fixes for regressions and serious bugs in GCC 12.1 with more
> > than 71 bugs fixed since the previous release comprising of  a number
> > of libstdc++ and C++ and fortran fixes [1]
> >
> > Remove backported patch to fix libsanitizers with glibc 2.36, its
> > already present in 12.2
> >
> > [1] https://gcc.gnu.org/bugzilla/buglist.cgi?bug_status=RESOLVED&resolution=FIXED&target_milestone=12.2
> >
> > Signed-off-by: Khem Raj <raj.khem@gmail.com>
>
> Building with this patch I had a ccache compile failure on musl builds:
>
>   error: 'time_t' has not been declared
>   error: no declaration matches 'std::string core::Statistics::format_human_readable(const Config&, time_t, uint8_t, bool) const'
>
> https://autobuilder.yoctoproject.org/typhoon/#/builders/64/builds/5735/steps/11/logs/stdio
> https://autobuilder.yoctoproject.org/typhoon/#/builders/45/builds/5752/steps/11/logs/stdio
>
> They disappeared after removing this patch and rebuilding.
>
> --
> Luca Ceresoli, Bootlin
> Embedded Linux and Kernel engineering
> https://bootlin.com

