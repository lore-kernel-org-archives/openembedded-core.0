Received: from mail-wr1-f52.google.com (mail-wr1-f52.google.com [209.85.221.52])
 by mx.groups.io with SMTP id smtpd.web11.33748.1613406689643604842
 for <openembedded-core@lists.openembedded.org>;
 Mon, 15 Feb 2021 08:31:30 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@linuxfoundation.org header.s=google header.b=iPc6Mfay;
 spf=pass (domain: linuxfoundation.org, ip: 209.85.221.52, mailfrom: richard.purdie@linuxfoundation.org)
Received: by mail-wr1-f52.google.com with SMTP id b3so9646071wrj.5
        for <openembedded-core@lists.openembedded.org>; Mon, 15 Feb 2021 08:31:29 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linuxfoundation.org; s=google;
        h=message-id:subject:from:to:cc:date:in-reply-to:references
         :user-agent:mime-version:content-transfer-encoding;
        bh=Glw5tTaMVmDeNXbKqGegAuyrclR/R6UxWygBqWRaji0=;
        b=iPc6MfayjsdvRxueZo8PPeu38T1SeSLh/27jdWZkIWOlkvivUt6H2hy7ZYYJeUIh45
         iOumOl5ey9rq151PN1vVF1RKBjJaLXpHLuIq7vUiCSHj8prbcWjbdECHLUbN02wH4N7x
         Mot3tqC7ktT87YapHNxM6l6YQGAvmz++CpesU=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:message-id:subject:from:to:cc:date:in-reply-to
         :references:user-agent:mime-version:content-transfer-encoding;
        bh=Glw5tTaMVmDeNXbKqGegAuyrclR/R6UxWygBqWRaji0=;
        b=SJukVFMh4JDlA3bYTGoNn4bWOG8fVcUrF3VJA31Vk6YRQ9sMbcPdmty5O1UPwRRzxQ
         kXr7hKXtP/HzCffUSf+eofbLMUY8HkthdM8sbmjY1vsR1CA6+kz6z5WNPCJFb4kQJSyb
         hmcy/vIyIuL6W3sYA6SZrXpPikUIlPowvXV+XRVGSPOe09YRJHkKr/Pu2yOpywJiTeut
         28T214Rw8iwBzdYUsC/Msucu1PhaXV+BzRcSYUxwrWzGggsqLb8j2ZBWzWb8TNhL74Tc
         /+KGl3HPou3R2gkOnd3WizlO1CUC0lS32+xO9fmeLpytbtaOOL0+wZVvcb1Z6f5pQtq1
         DtIw==
X-Gm-Message-State: AOAM533X4WW8Y9b2hsuIL1NNpKRnTrIh3ob3vQ/P2U1OYGqoFdD0A9Aq
	3daASz7iFY0GJWlBVKErQ+bqDg==
X-Google-Smtp-Source: ABdhPJynBkoJ82p1ODcRzQVk0B6gYEtYWfpmmYMqvV8aUtr8m9RMSqr7YQEraKI9deE7lzJuYIx3Aw==
X-Received: by 2002:a05:6000:18a:: with SMTP id p10mr8666944wrx.166.1613406688080;
        Mon, 15 Feb 2021 08:31:28 -0800 (PST)
Return-Path: <richard.purdie@linuxfoundation.org>
Received: from ?IPv6:2001:8b0:aba:5f3c:3015:c6e2:686f:34ff? ([2001:8b0:aba:5f3c:3015:c6e2:686f:34ff])
        by smtp.gmail.com with ESMTPSA id g18sm5688093wrw.40.2021.02.15.08.31.27
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 15 Feb 2021 08:31:27 -0800 (PST)
Message-ID: <7a33da6d5bb1c49cc940efeef542d6ab57bc2f90.camel@linuxfoundation.org>
Subject: Re: Autobuilder reproducibility target changes
From: "Richard Purdie" <richard.purdie@linuxfoundation.org>
To: Joshua Watt <jpewhacker@gmail.com>
Cc: openembedded-core <openembedded-core@lists.openembedded.org>, swat
 <swat@lists.yoctoproject.org>, "Mittal, Anuj" <anuj.mittal@intel.com>,
 Steve Sakoman <steve@sakoman.com>, Alexander Kanavin
 <alex.kanavin@gmail.com>
Date: Mon, 15 Feb 2021 16:31:24 +0000
In-Reply-To: <CAJdd5GZ4WyPb+Rc-s1n=mm-PQo3ENcjwdnLxsyH1FMC0YTGB-g@mail.gmail.com>
References: 
	<80c70797943e52fa430d2f9f65bffe7a90730dec.camel@linuxfoundation.org>
	 <CAJdd5GZ4WyPb+Rc-s1n=mm-PQo3ENcjwdnLxsyH1FMC0YTGB-g@mail.gmail.com>
User-Agent: Evolution 3.38.1-1 
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit

On Sun, 2021-02-14 at 13:17 -0600, Joshua Watt wrote:
> On Sun, Feb 14, 2021 at 6:19 AM Richard Purdie
> <richard.purdie@linuxfoundation.org> wrote:
> > 
> > Regular users of the autobuilder will note that I've split the
> > reproducible builds test out of the main oe-selftest build and into its
> > own target build. This is because that test tends to run for a lot
> > longer time period and it helps to see the result separately.
> > 
> > I've only done this for master. If gatesgarth and dunfell want to
> > follow, that should be straight forward with a change to the branch in
> > autobuilder-helper. Obviously we should ensure this is working ok with
> > master first but so far so good.
> > 
> > It has already highlighted the difference between a successful run:
> > 
> > https://autobuilder.yoctoproject.org/typhoon/#/builders/115/builds/2
> > https://autobuilder.yoctoproject.org/typhoon/#/builders/119/builds/2
> > (took 3-4 hours)
> > 
> > and failing two failing runs:
> > 
> > https://autobuilder.yoctoproject.org/typhoon/#/builders/116/builds/2
> > https://autobuilder.yoctoproject.org/typhoon/#/builders/118/builds/2
> > (took 9 hours)
> 
> OK, I read through the code and unfortunately found a bug: when
> attempting to make sure the "B" build doesn't use sstate, I misspelled
> the SSTATE_MIRRORS, which means that the B build could have been
> pulling from the sstate mirror when it was not supposed to. This has a
> few implications:
> 
>  1) It might explain why some of the reproducible results seem intermittent
>  2) It might explain why there is such a time disparity between the tests

The "good" news is that this didn't affect the autobuilder as it sets
SSTATE_DIR to a common directory and doesn't use SSTATE_MIRRORS.

> Unfortunately, while it probably will help the intermittent results,
> it probably means that the tests taking 9 hours is what is "supposed"
> to happen, and they happen to be shorter sometimes because the B build
> is pulling from sstate when it's not supposed to.

I don't think we're to the bottom of this. If its not spending the time
in diffoscope, something seems to cause builds with differences to take
much longer...

Cheers,

Richard





