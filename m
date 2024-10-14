Return-Path: <mikko.rapeli@linaro.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 22584D1624A
	for <webhook@archiver.kernel.org>; Mon, 14 Oct 2024 11:39:26 +0000 (UTC)
Received: from mail-lj1-f182.google.com (mail-lj1-f182.google.com [209.85.208.182])
 by mx.groups.io with SMTP id smtpd.web11.52842.1728905962711993695
 for <openembedded-core@lists.openembedded.org>;
 Mon, 14 Oct 2024 04:39:23 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@linaro.org header.s=google header.b=ZG6V1ZBV;
 spf=pass (domain: linaro.org, ip: 209.85.208.182, mailfrom: mikko.rapeli@linaro.org)
Received: by mail-lj1-f182.google.com with SMTP id 38308e7fff4ca-2fb5111747cso7476371fa.2
        for <openembedded-core@lists.openembedded.org>; Mon, 14 Oct 2024 04:39:22 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1728905961; x=1729510761; darn=lists.openembedded.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=OkEt89FPLLj1L4wFVq2JkwY7bS80hLAN1dSl/qCoH5g=;
        b=ZG6V1ZBVDc6nqBpDy998ZhxZa5zK7bMcu1jV9x2uuO0oa5OLo2loEHD5EoAPDCkHuk
         y9liEm6RTQl3EF1yvhHZf9G73CtibWN9d/bRVcsGBNESsxV25C/z4k6myTmnk2AHnF/D
         BJlbWQQxMwttXZECh6bYOWDqA+bYFDgfUqFWrozjZiRjCYkCgCBcpu7afUYHCiKrAni6
         OXrd8kTPFOef/XgLUY8JT4aIBBZE31VAOSAeIwg1/Y/ZtSfMvsxDfB9ozFb03Gc5nq8J
         craNqrIEHS52au1HiQAa+yTUuDf+Qh6XKob9k0XiPr0BMF+g35BXR9THvj5uE/Bz8rLt
         CltA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1728905961; x=1729510761;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=OkEt89FPLLj1L4wFVq2JkwY7bS80hLAN1dSl/qCoH5g=;
        b=Z5S6NsjWnGCwCbzYI5KhnfycSsp9hQ9k74hL+z5ojDCCX0U5CyWMUJkitHo2ufml2d
         JFKD1t3/ANRUdlE/aFye+9p4+SyfCFiR8kaBFxLhKTJcXQ0wYLwu5hNaf56wBimqVXSo
         1nrMRPWjk/c2NN16DoULJEekSPxgTsmsF/fD+qRu27WB/Ev5WlnVUrgiRR+R162CttkG
         A0LTPzOhQbYSLz0kq92xRzhJdESq0nZxROGx4c6YVokp5mnpjFO1hUqmAxshsvx9T7TU
         TNXKRDMvPdgS5LWfFsgq3h8H2jyw1NOnkxulzNCcHOPD8GHKTteQrXdykSOgIV15T7Cf
         7Z5g==
X-Gm-Message-State: AOJu0YzETnOyhrJ08EOoa7YU8oBjpNyRL2qUhTiOUYCPH1MNIxP6wPDz
	xjXDGMP0LwA9jN2GwAfoKI0haltyoMGuBS3xywIQluo0s7oFomr+ycRdeXGD14c=
X-Google-Smtp-Source: AGHT+IHS2zgQRTHk6lpMQVZatMMZc3EEch4+xZ4KAy6GVfJafznUc1JuRqr0bjm0Wk1jFqMTkoBxQw==
X-Received: by 2002:a2e:70a:0:b0:2f7:6653:8046 with SMTP id 38308e7fff4ca-2fb329c2176mr39511411fa.25.1728905960721;
        Mon, 14 Oct 2024 04:39:20 -0700 (PDT)
Received: from nuoska (78-27-76-97.bb.dnainternet.fi. [78.27.76.97])
        by smtp.gmail.com with ESMTPSA id 38308e7fff4ca-2fb4bee6368sm4841771fa.35.2024.10.14.04.39.16
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 14 Oct 2024 04:39:18 -0700 (PDT)
Date: Mon, 14 Oct 2024 14:39:15 +0300
From: Mikko Rapeli <mikko.rapeli@linaro.org>
To: Alexander Kanavin <alex.kanavin@gmail.com>
Cc: openembedded-core@lists.openembedded.org
Subject: Re: [OE-core] [PATCH] ovmf-native: remove .pyc files from install
Message-ID: <Zw0C45RZmAqiS06R@nuoska>
References: <20241014102817.40298-1-mikko.rapeli@linaro.org>
 <CANNYZj84yW7dBNYga4Aq748a_9_RuPi9y-H6kd+yG5Dun4dRKw@mail.gmail.com>
 <Zwz-urTA8Jj69agg@nuoska>
 <CANNYZj8vi7A_BSLTewb_LNLnPxzrmhn5fpxG8_OeOA_k-AhoXQ@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <CANNYZj8vi7A_BSLTewb_LNLnPxzrmhn5fpxG8_OeOA_k-AhoXQ@mail.gmail.com>
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 14 Oct 2024 11:39:26 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/205758

Hi,

On Mon, Oct 14, 2024 at 01:28:07PM +0200, Alexander Kanavin wrote:
> On Mon, 14 Oct 2024 at 13:21, Mikko Rapeli <mikko.rapeli@linaro.org> wrote:
> > I don't know. At this point I'd rather remove all tests in uki
> > support which are causing so many issues.
> >
> > I tried to dig deeper into ovmf native but it looks like a mess.
> > meta-arm edk2 doesn't compile anything for native but just installs
> > the python scripts and gets away with it. Same did not work for ovmf.
> 
> The tests are important.
>
> Were you able to reproduce the issue locally? Ovmf is an awful
> component and a headache to work with, but I could take a look if I
> can get the same error. I'm just worried that deleting .pyc will only
> trigger the same error for the essential installed items.

No, I'm not able to reproduce the problem. Maybe I'd need to share the sstate
to another machine or user to trigger this. Just changing build paths
doesn't trigger the problem on my build machine.

Alternatively I can remove all x86/ovmf using tests and make things
work with u-boot firmware and aarch64, but then I need to test both
qemuarm64 and genericarm64 since details differ between them.

Cheers,

-Mikko

