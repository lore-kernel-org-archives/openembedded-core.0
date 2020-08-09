Received: from mail-ej1-f67.google.com (mail-ej1-f67.google.com [209.85.218.67])
 by mx.groups.io with SMTP id smtpd.web11.30379.1597001216022893312
 for <openembedded-core@lists.openembedded.org>;
 Sun, 09 Aug 2020 12:26:56 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@sakoman-com.20150623.gappssmtp.com header.s=20150623 header.b=VQ8ojtrL;
 spf=softfail (domain: sakoman.com, ip: 209.85.218.67, mailfrom: steve@sakoman.com)
Received: by mail-ej1-f67.google.com with SMTP id f24so7295544ejx.6
        for <openembedded-core@lists.openembedded.org>; Sun, 09 Aug 2020 12:26:55 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sakoman-com.20150623.gappssmtp.com; s=20150623;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=4jAvEdozqc4k7mxBbCvBIakL00VinFYb56v5nHWKLtM=;
        b=VQ8ojtrLX0BfWKo9g0hgvX0hecAkaqYQQ2UoDBO7mhcYv7jzZ67ipTmCiY/+zs3jJw
         dVUL5trrcXOPy2FdW0VUgDMMbL24xrA4wmB1t/hQzo28IFKP9D3q4uJw5iRTCppMmFp5
         viUA2gbbbjZQUYvYe8V2HBefAy0iB3zJf0ZhnNyqej5QGYHb1i/Q/UzSmD7vIxEGU0oP
         4xow4a8G4S3UzSZTG7GFx3mSzcsvJTv3+XLSWQx86bBMwa6BA+c1+r2ev7jUQQRy0nMt
         CVLv3F0DWgzEbcDX44SNT7zgXu5rJ41LwlnmRpBd4hir6+UWjJkxt0ZvmQcd+TOyY5b3
         JS9Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=4jAvEdozqc4k7mxBbCvBIakL00VinFYb56v5nHWKLtM=;
        b=PAEIGQLD0Gnt0micH8t08dGfgC8R2OwtXmEKqYCkKtx/2McydC2BphnUXxvMyVIULM
         JwNMrT4XgA1ggg4bhEvF/cwL3gm7ykEztZ1AgkvRjMmf8MMJ2H87e6qxFKt1MgKNkYkd
         cn5GqODgRb14yy40gM1m02H4HLJOlBZ+Igu8V9iAtu/2SumgmBUf/3Bro8XPvCED4PnH
         y35aH6OsDKutbJoxue1FGehBp4dygJj708RFMuLsHMNGHdb1ukLGiwzWCrxIa7ui2gUe
         ADhJAon7DW1+7zjdkq8u3MmYQVvRhrbVZj66ZzQAg4lf2Xz0WmrYtue0hqzA3wfwKABs
         SMUA==
X-Gm-Message-State: AOAM530EgKE7+xgMpeQjRwLOovJQ8B9u90PkPq1wKsXpPfMdresJ1kgO
	1HNv83GFKacBTntpl88XveKWCqJVkgFLW4qXExfjFg==
X-Google-Smtp-Source: ABdhPJzwzMqQncQYUqxAmp7mXc9UuwZ6aRG20jL9X1jVM1+A2K6EUj+/KEAEZ1X0YX9YxQ3y95IbIpqXyMwrpwbgWSM=
X-Received: by 2002:a17:906:5612:: with SMTP id f18mr19336423ejq.225.1597001214503;
 Sun, 09 Aug 2020 12:26:54 -0700 (PDT)
MIME-Version: 1.0
References: <20200807202548.753073-1-richard.purdie@linuxfoundation.org>
 <CAOSpxdZrryt+TiLgpei1grJDQwxyqNfi_txg8=D2=4fLFmf8aw@mail.gmail.com> <83ff8e557f8872d5fe8c1bfdc387e1ec7bbfb3ff.camel@linuxfoundation.org>
In-Reply-To: <83ff8e557f8872d5fe8c1bfdc387e1ec7bbfb3ff.camel@linuxfoundation.org>
From: "Steve Sakoman" <steve@sakoman.com>
Date: Sun, 9 Aug 2020 09:26:43 -1000
Message-ID: <CAOSpxdaauMeXgZEH8JH23dzqjvF8HPAxZJn+cAy9Q_65OFh4FQ@mail.gmail.com>
Subject: Re: [OE-core] [PATCH 1/3] populate_sdk_ext: Ensure buildtools doesn't corrupt OECORE_NATIVE_SYSROOT
To: Richard Purdie <richard.purdie@linuxfoundation.org>
Cc: Patches and discussions about the oe-core layer <openembedded-core@lists.openembedded.org>
Content-Type: text/plain; charset="UTF-8"

On Sun, Aug 9, 2020 at 2:19 AM Richard Purdie
<richard.purdie@linuxfoundation.org> wrote:
>
> On Sat, 2020-08-08 at 12:12 -1000, Steve Sakoman wrote:
> > Is this series suitable for dunfell?
>
> The uninative one is probably a good idea. The buildtools one,
> definitely not. This one should be harmless but isn't necessary without
> the buildtools one.

Thanks Richard!

Steve
