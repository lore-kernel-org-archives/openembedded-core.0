Return-Path: <anibal.limon@linaro.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id D3D8BC433EF
	for <webhook@archiver.kernel.org>; Thu, 25 Nov 2021 14:35:25 +0000 (UTC)
Received: from mail-wr1-f46.google.com (mail-wr1-f46.google.com
 [209.85.221.46])
 by mx.groups.io with SMTP id smtpd.web09.12590.1637850924356358116
 for <openembedded-core@lists.openembedded.org>;
 Thu, 25 Nov 2021 06:35:24 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@linaro.org header.s=google header.b=uGbuVlb3;
 spf=pass (domain: linaro.org, ip: 209.85.221.46,
 mailfrom: anibal.limon@linaro.org)
Received: by mail-wr1-f46.google.com with SMTP id a9so12091588wrr.8
        for <openembedded-core@lists.openembedded.org>;
 Thu, 25 Nov 2021 06:35:24 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=fnJty6PKPqJC5LKkyItQ8/SYeGYH1KAqxqWPL7ix3IA=;
        b=uGbuVlb3YExANRRRT5xm/zOSmJSszFIrav4BPzQCrKeIJ/m7mjzfXlRk6Sg4aqaVM/
         ASC9vqoFTrtZzrQ7kNCLyc+Hx2qbT02XrEtGuokXjAbJP6CMZaeFm32ILynj4AD4aa7p
         d1BjxXGK95ALnykMKWjashm/2Pu3kBCfXh4RQ0YKNR7qQfB+WG1ENXhUEa/iPgAfxDx/
         TqE9Ff3BmrfLHH09/WizsVIGkNUxST/EAvAuoGqDi5g+FC0Jw7xlbanjly2dnLy/LISt
         yIGEn57fKv8nJKB9HNVS2wWl5c83gGAIVxwt5a6jJ9NDpKuFhuw75IV/ec0J+IVEZKVc
         08lg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=fnJty6PKPqJC5LKkyItQ8/SYeGYH1KAqxqWPL7ix3IA=;
        b=aKWbgU/BrQuqtqn7Y98L/n5w/7EsNRKDDV+el5t0PgKCfYrmo6V37VvfEqXCL0syuE
         r3IaZXl0LTAF6lS/GE8R00W471LiW3c0q/L62WAmMOGraX00Gz3Spn36PgTkE/q8NZMe
         LRuS/l4Hh8a5eQ4oGR3bWYV5hDCROmRZpAxAw8A3scsu5XmGJstH9VKx81GSSXYwrp2h
         hyENfWOKWBMkhTZtfh5FWRctco/zS2ypqXP1jKY/+bL3DFoV4iPb9lwQ/lmJ6V873nRG
         YpTuRyoCwwU28Iu04BOwaZtojM+YWd3/D7Ek9c4eBUmjKqSVOuvguGqpqub85N34F7km
         RhgQ==
X-Gm-Message-State: AOAM532l444Cjv0/KDHHItNQad2vVMqmJjXKrlXC0ozxWuDgSTueC9Xd
	+lfIb4nb5YWfQzzbZBKhgHq9CAA47yru3YyWEg7PAg==
X-Google-Smtp-Source: 
 ABdhPJzhkspC77cJ2VqPefzknegKz8z4RuMZ7ZfW2rPUZyjveow06G3EYaKi/1TURLPF1s7IaqMsfG5KVF+omll+HzM=
X-Received: by 2002:adf:e3c3:: with SMTP id k3mr6747598wrm.599.1637850922587;
 Thu, 25 Nov 2021 06:35:22 -0800 (PST)
MIME-Version: 1.0
References: <16B7C59052251915.18463@lists.openembedded.org>
 <CA+_AqiuXK9Sd0EpcdWX32dj3G4ZmxJxO+PmiR3W8erPkKXTChw@mail.gmail.com>
 <82e623096c8435851e548c63ed6f25b95d093fa7.camel@linuxfoundation.org>
In-Reply-To: 
 <82e623096c8435851e548c63ed6f25b95d093fa7.camel@linuxfoundation.org>
From: Anibal Limon <anibal.limon@linaro.org>
Date: Thu, 25 Nov 2021 08:35:11 -0600
Message-ID: 
 <CA+_AqivR9tx9y4RO-BAwK9f1hmgvM3RZuoFxNT9p3NOoEjx_sA@mail.gmail.com>
Subject: Re: [OE-core] [PATCHv3] waffle: add explicit dependency to
 cmake-native
To: Richard Purdie <richard.purdie@linuxfoundation.org>
Cc: openembedded-core@lists.openembedded.org, ross@burtonini.com
Content-Type: multipart/alternative; boundary="0000000000006fb11205d19de26c"
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 25 Nov 2021 14:35:25 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/158779

--0000000000006fb11205d19de26c
Content-Type: text/plain; charset="UTF-8"

On Tue, 23 Nov 2021 at 16:40, Richard Purdie <
richard.purdie@linuxfoundation.org> wrote:

> On Tue, 2021-11-23 at 12:00 -0600, Anibal Limon wrote:
> > Hi,
> >
> > Is this patch good enough? or need another change.
>
> There was feedback about the commit message needing work. Someone else
> also sent
> a similar patch with a commit message with the right explanation in it so
> that
> was merged in preference but the issue should be fixed.
>
>
> http://git.yoctoproject.org/cgit.cgi/poky/commit/?id=50e0aed0684526c74072ceaf8fa52964c9cc0d19


Great!,

Regards,
Anibal

>
>
> Cheers,
>
> Richard
>
>

--0000000000006fb11205d19de26c
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div dir=3D"ltr"><br></div><br><div class=3D"gmail_quote">=
<div dir=3D"ltr" class=3D"gmail_attr">On Tue, 23 Nov 2021 at 16:40, Richard=
 Purdie &lt;<a href=3D"mailto:richard.purdie@linuxfoundation.org">richard.p=
urdie@linuxfoundation.org</a>&gt; wrote:<br></div><blockquote class=3D"gmai=
l_quote" style=3D"margin:0px 0px 0px 0.8ex;border-left:1px solid rgb(204,20=
4,204);padding-left:1ex">On Tue, 2021-11-23 at 12:00 -0600, Anibal Limon wr=
ote:<br>
&gt; Hi,<br>
&gt; <br>
&gt; Is this patch good enough? or need another change.<br>
<br>
There was feedback about the commit message needing work. Someone else also=
 sent<br>
a similar patch with a commit message with the right explanation in it so t=
hat<br>
was merged in preference but the issue should be fixed.<br>
<br>
<a href=3D"http://git.yoctoproject.org/cgit.cgi/poky/commit/?id=3D50e0aed06=
84526c74072ceaf8fa52964c9cc0d19" rel=3D"noreferrer" target=3D"_blank">http:=
//git.yoctoproject.org/cgit.cgi/poky/commit/?id=3D50e0aed0684526c74072ceaf8=
fa52964c9cc0d19</a></blockquote><div><br></div><div>Great!,</div><div><br><=
/div><div>Regards,</div><div>Anibal=C2=A0</div><blockquote class=3D"gmail_q=
uote" style=3D"margin:0px 0px 0px 0.8ex;border-left:1px solid rgb(204,204,2=
04);padding-left:1ex"><br>
<br>
Cheers,<br>
<br>
Richard<br>
<br>
</blockquote></div></div>

--0000000000006fb11205d19de26c--

