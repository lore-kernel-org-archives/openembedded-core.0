Return-Path: <philip@balister.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id CDE0EC369AB
	for <webhook@archiver.kernel.org>; Thu, 10 Apr 2025 16:51:24 +0000 (UTC)
Received: from mail-yb1-f182.google.com (mail-yb1-f182.google.com [209.85.219.182])
 by mx.groups.io with SMTP id smtpd.web11.33794.1744289726210865813
 for <openembedded-core@lists.openembedded.org>;
 Thu, 10 Apr 2025 05:55:26 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@linaro.org header.s=google header.b=axQ71LDD;
 spf=pass (domain: linaro.org, ip: 209.85.219.182, mailfrom: ilias.apalodimas@linaro.org)
Received: by mail-yb1-f182.google.com with SMTP id 3f1490d57ef6-e455bf1f4d3so566877276.2
        for <openembedded-core@lists.openembedded.org>; Thu, 10 Apr 2025 05:55:26 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1744289725; x=1744894525; darn=lists.openembedded.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=9+KldphE6Mz03Jz40e8FqxNOf4WMEGXpaBW1MXbpOhs=;
        b=axQ71LDD80JJXILObWv1myKIgIMqsoqplwy8Yba54ZzxpcrYwiUqBDlKN5JFxtecvp
         CByNW7s+mWfarltyM0orB2yDoZda/P+qLZ9BjXkRI0FxgfSrSjKJBWjY9pu96cAnuuP5
         Hg2uFsgU7vamapOARzG0iJtEeSP39yzMYrw1sXR2bpAp7zkSUKZ80azHC/2t2KRqB+ND
         hJTz5hvvyhAIM34IbtJzwXgUy8g8tJnFPm7hmCBIZH99Ix7KKqmf21MgsmpBtWB2GNXh
         a1viXSvXNxRVSL7rGT4oQ0CBivAu0ujaYpnrZ4ANXY/j9ib/3HD/iO2PRvfykxxQqxUW
         UjRA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1744289725; x=1744894525;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=9+KldphE6Mz03Jz40e8FqxNOf4WMEGXpaBW1MXbpOhs=;
        b=hKKrobAnyZxnK9aqXkkmhDKq3ApjNWVGc81edOjfCtP6fwJycNcoaSo5DUrWW2rBIV
         c8HfjEJp/pJda/KU2yS/SPFS6qB7LlMU1vdd0HxGtphb4cGo+a64VGBUIiSJDDTD3LWO
         9sJJmRI5J9Fb84oltBWwyqeH50ZdMK9MnViMXIGw87oCwskvH8rQ8LUb8CJCUoTMM8Uv
         LaamkKKXDI55Z0qd4ifrLpU4JTdHV8hb09w6aUabMrKW4bDbjhp1Xcy+nqeXAknJv7YN
         YVk4gSN6kUfxRjcgEc6AwDRleoFtXgKWv+SiF7J0iAjYNmid+n0MOFH6s88Lzpb16Yod
         wn4g==
X-Forwarded-Encrypted: i=1; AJvYcCWYJJdgaDKj5Y8HqHt6Za6/ctCoJNvt62OYr6jnJvvqrumUHbNiqIVkFAGigS0N5J0Kr4kdwNWk7CbfNA9L7GGYAg==@lists.openembedded.org
X-Gm-Message-State: AOJu0YxxEjFWZYhn4TQKkTpIUs7bsxubUw8HQ51iF9gAu3k6ATw6TLqI
	Gn9TGK6Bd4BVx4CZ1aaVnK/9gkBzWGc3ota+GrF/K5sf7lRIudMd6x5E3LNDVDX8QhBZHZTuoYe
	XupvcHEtToJPuXhBEpS3rRQbD285RCjxvyp6fGw==
X-Gm-Gg: ASbGncuG6V4cb6Kl/+g25RD2RJ4aHwO7ZhUL5gvJUw/j4/4ai4S6CSxpsNCSg0nVyIp
	ni8t1NhxVcuiSlOboLit8xvDVB9LTRv4E1xHIWzR0logL+X/EiCYQ2zsNLOX9mRQF9EYr+6r58t
	6Js4hXamwHo64gYtWHNXIdxCQ=
X-Google-Smtp-Source: AGHT+IHZrP55tM86n6w0V5soYwVmw5mltvlpMZZE6h7GC0GBY3/yDRyHikMhvSH/HIIsgmqNKu8D+unb8npNu9+VCCs=
X-Received: by 2002:a05:6902:1682:b0:e5d:fb92:cb0 with SMTP id
 3f1490d57ef6-e703fb772b2mr3439537276.12.1744289725379; Thu, 10 Apr 2025
 05:55:25 -0700 (PDT)
MIME-Version: 1.0
References: <20250404162932.447699-1-mikko.rapeli@linaro.org>
 <20250404162932.447699-2-mikko.rapeli@linaro.org> <f84af1a6585338787539ee5be5826adbe434e8a9.camel@gmail.com>
 <CAC_iWjKTmSEOe6HUcPFUZLaBuA2+6ZwOYaYiqK0_R8KGNPU1Ug@mail.gmail.com> <CANNYZj_eA4k+pRLG=8-V4WEmsthkh_o75fZKOcoTf+00QW2x2A@mail.gmail.com>
In-Reply-To: <CANNYZj_eA4k+pRLG=8-V4WEmsthkh_o75fZKOcoTf+00QW2x2A@mail.gmail.com>
From: Ilias Apalodimas <ilias.apalodimas@linaro.org>
Date: Thu, 10 Apr 2025 15:54:49 +0300
X-Gm-Features: ATxdqUFWrxLQFcdnjMGKNY_OVO7X9zLHHqC4uxCxzUw8oKX6e5-0GhrflhVWMx8
Message-ID: <CAC_iWj+80LnSOJ=ZeMos4psFwQ4zqt8fo-e13+8sPuBtsmp5Dw@mail.gmail.com>
Subject: Re: [OE-core] [PATCH v3 01/11] systemd: enable efi support by default
To: Alexander Kanavin <alex.kanavin@gmail.com>
Cc: Adrian Freihofer <mikko.rapeli@linaro.org>, openembedded-core@lists.openembedded.org
Content-Type: text/plain; charset="UTF-8"
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 10 Apr 2025 16:51:24 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/214685

Hi Alexander

On Thu, 10 Apr 2025 at 15:13, Alexander Kanavin <alex.kanavin@gmail.com> wrote:
>
> On Thu, 10 Apr 2025 at 13:50, Ilias Apalodimas via
> lists.openembedded.org
> <ilias.apalodimas=linaro.org@lists.openembedded.org> wrote:
> > >  I would therefore like to see the EFI implementation remain
> > > opt-in until it covers at least the most important use cases for robust
> > > embedded systems. What I primarily miss with EFI is a reference
> > > implementation for an A/B update system without having to rely on a FAT
> > > partition without journaling. Please correct me if I'm missing
> > > something!
> >
> > Where does the FAT partition requirement come from?
>
> https://uefi.org/sites/default/files/resources/UEFI%202_5.pdf#page=585
>
> This is what one has to use to store that critical bit of info ('A' or
> 'B'?) and the bootloader code that picks one or the other, reads the
> kernel from it, and hands over the boot process. I'd say these are
> extremely critical things, and yet FAT design as hopefully everyone's
> aware is a 1980s MS DOS relic that is notorious for lack of metadata
> robustness and its frequent corruption.

I think you are misinterpreting that. That paragraph says "The file
system supported by the Extensible Firmware Interface is based on FAT"
 -- IOW your *firmware* must support FAT.
It never dictates that the ESP has to be FAT as well. You are free to
format your ESP to whatever FS your board supports. For example, x86
macs use HFS IIRC.

Thanks
/Ilias
>
> Alex

