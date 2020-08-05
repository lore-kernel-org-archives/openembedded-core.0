Received: from mail-qt1-f195.google.com (mail-qt1-f195.google.com [209.85.160.195])
 by mx.groups.io with SMTP id smtpd.web11.1031.1596646427727312600
 for <openembedded-core@lists.openembedded.org>;
 Wed, 05 Aug 2020 09:53:47 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20161025 header.b=it15Sz8J;
 spf=pass (domain: gmail.com, ip: 209.85.160.195, mailfrom: raj.khem@gmail.com)
Received: by mail-qt1-f195.google.com with SMTP id t23so31044615qto.3
        for <openembedded-core@lists.openembedded.org>; Wed, 05 Aug 2020 09:53:47 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=uN52GJAF5V8D1y6JIaTiN4M61VU78XwhR4TJMyAYuB0=;
        b=it15Sz8JTXpPegQr2pSUmzl7TGlOZWfrwqFYBK1g0IdXgSKdiLj/6iA4J2yHs6hizb
         1PpnXhmifWwwMpxULJc5YSW523EL9CkwOrxig3OM3ywtxJT14UaWdnNkOvpot/rpdbKt
         9S7hPCrArOevPyaE4FW2LQiJuc2T6w0hejP3QrAd+19jRSTm7zJE4BBeB5QH1zodwwbZ
         rbdVdm7K0rUxKmGzYaHcX6r3a6USuar42ePdQYS5lilXgTT3z56HVYBe7WDnNbBDRVHV
         6M8k8GU2WsXeO0XsHFq0HwPnk3AEuHza1HATdzAGsq+tjfFb+H4GxdOCFzmfhi2o5ZmV
         pSEw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=uN52GJAF5V8D1y6JIaTiN4M61VU78XwhR4TJMyAYuB0=;
        b=JKzTdnNOWONqndJXe6yCGVnXKp3/P6diSYbFc5IAalWcRdUa73dV2K/RxXn8StC/3R
         LTxAdLNtFPBGRvE0bqCdczoUycUSmq3Qcvezq6ORpR82R2CDU8j5lhMy3VyTZhWtMo7T
         pRN1snHtnOaMB5sPVdFGd0W2tT7q5ThezaoXxhBXRqizHefif2a6O9R/QXYeLMJ/fHQV
         ahDA3I+WVt38DrRhRPRu/2keyyWWgZV5QnE4g9TaFp7cM1wvtuOKCTSAtGjqYiycpTGf
         481qBJgv83LfZ7UdXRnb8HScLdqgTVE4Sdns+FlXlEAlE3lrA0V11UivdCLIVvv153bo
         Trbg==
X-Gm-Message-State: AOAM532+KIXL20QTFEayyal35mK/wSOSgm4ANqueozAIM7g8ACtxHakj
	zD6z3xEoCf8aMxOmd27ltFxMvlfv4718MFSgpU5faeKm
X-Google-Smtp-Source: ABdhPJzz80ijqk39vM9tD6U1bzGMI6q1ernl7Aka0mI+qvplKcSJA+0op6MM4ca7wJZSDqcrGrRGM2s8iyXsZ8sMo6Q=
X-Received: by 2002:ac8:22ea:: with SMTP id g39mr4421706qta.146.1596646426702;
 Wed, 05 Aug 2020 09:53:46 -0700 (PDT)
MIME-Version: 1.0
References: <20200805061449.1029166-1-raj.khem@gmail.com> <20200805092610.GA27769@localhost>
In-Reply-To: <20200805092610.GA27769@localhost>
From: "Khem Raj" <raj.khem@gmail.com>
Date: Wed, 5 Aug 2020 09:53:20 -0700
Message-ID: <CAMKF1spo2fcHvj=XD1g4pboMow+kXvWdDkPy_cBhBJzQSmSaUA@mail.gmail.com>
Subject: Re: [OE-core] [PATCH 1/2] libunwind: Use -fcommon option to compile
To: Adrian Bunk <bunk@stusta.de>
Cc: Patches and discussions about the oe-core layer <openembedded-core@lists.openembedded.org>
Content-Type: text/plain; charset="UTF-8"

On Wed, Aug 5, 2020 at 2:26 AM Adrian Bunk <bunk@stusta.de> wrote:
>
> On Tue, Aug 04, 2020 at 11:14:48PM -0700, Khem Raj wrote:
> > defaults for gcc is to use -fno-common this ensures that it keeps using
> > -fcommon until the real issue is fixed
> >
> > Fixes
> > src/arm/Ginit.c:60: multiple definition of `_U_dyn_info_list'; mi/.libs/dyn-info-list.o:/usr/src/debug/libunwind/1.4.0-r0/build/src/../../libunwind-1.4.0/src/mi/dyn-info-list.c:28: first defined here
> >...
>
> The upstream fix is
> https://github.com/libunwind/libunwind/commit/29e17d8d2ccbca07c423e3089a6d5ae8a1c9cb6e
>

Thanks for suggesting this, I have sent a v2

> cu
> Adrian
