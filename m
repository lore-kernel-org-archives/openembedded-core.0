Received: from mail-ot1-f42.google.com (mail-ot1-f42.google.com [209.85.210.42])
 by mx.groups.io with SMTP id smtpd.web12.5543.1593721745340894897
 for <openembedded-core@lists.openembedded.org>;
 Thu, 02 Jul 2020 13:29:05 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@konsulko.com header.s=google header.b=od34Qy00;
 spf=pass (domain: konsulko.com, ip: 209.85.210.42, mailfrom: paul.barker@konsulko.com)
Received: by mail-ot1-f42.google.com with SMTP id c25so7499327otf.7
        for <openembedded-core@lists.openembedded.org>; Thu, 02 Jul 2020 13:29:05 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=konsulko.com; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=VifspVUnXk/gDaseYi62gEGpIFwyhJ0pwL8D90E0xfY=;
        b=od34Qy00Mj1SxLd4jjXD0/Lqe0Rg86F6DoVuyuIYfwBpuy8UboQKn+8GcL08wPng1/
         s54vrGmUKYBm5Du3A2u78Z7PhWYp2WV/mNNhjwUGLE5mX7QiyL2ZRCNMm9j7Nmx0q2pX
         cy88aJw3yDia44VLZkXi4stKO4/XYYEgCQ2EQ=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=VifspVUnXk/gDaseYi62gEGpIFwyhJ0pwL8D90E0xfY=;
        b=TUxEYPrjLNm64oGZGRfg3u1N1y8D6oloWNnU111XpY43uvb2j5C5gX5sh3jUzeO34q
         JL6Pvrpor7iZpW8V6wcxxz8MZ4h48JxbXv3fJ0uDUKQjGWy7SA0SpzdfcsrelNHQM2jr
         E4NBMT3be+RffQwkYtsjwGb3ldVgY2vOEDsa+ed8gYdjhO7QC4984f/mm/8EcVbOtuX7
         WTpt+/JNlySK0k5urDBiHUI1ZhMKfmRNsEwbjLGiiv7LN6SIDoiQN4MvL4EwFUjBm4RO
         eIuDmcU0tS4JZFUznFC9qdSclZ/Jf+PccTbgTKRkgmGBc76yYO7aPgtn4DFh4298DCyM
         UksA==
X-Gm-Message-State: AOAM531rweD5as3WoWqFK6hhgBcAIXn9ZUAxaaLxeMKH4sl6gPUlG4hG
	hPh+BXWOEvc8Ai0vuZX4wihgzmPjJd9sH9eyQmSqxMub
X-Google-Smtp-Source: ABdhPJyoEj8Fa+lPn7TSdWHmjrKqvMbyLTGwpmqtiv9gNGZUet9jflO0UxhzeYoZqZStCyhPo8uK/qXZ8Nk8lrUi8bU=
X-Received: by 2002:a9d:674a:: with SMTP id w10mr25163618otm.305.1593721744665;
 Thu, 02 Jul 2020 13:29:04 -0700 (PDT)
MIME-Version: 1.0
References: <20200702192906.6301-1-fredrigu@axis.com>
In-Reply-To: <20200702192906.6301-1-fredrigu@axis.com>
From: "Paul Barker" <pbarker@konsulko.com>
Date: Thu, 2 Jul 2020 21:28:53 +0100
Message-ID: <CAM9ZRVtfoy12++04DPYrOk_89n8FsmwRuGWkWFa2O6q4a9Zjnw@mail.gmail.com>
Subject: Re: [OE-core] Add package managers as a plugin
To: Fredrik Gustafsson <fredrik.gustafsson@axis.com>
Cc: openembedded-core <openembedded-core@lists.openembedded.org>, 
	tools-cfpbuild-internal <tools-cfpbuild-internal@axis.com>
Content-Type: text/plain; charset="UTF-8"

On Thu, 2 Jul 2020 at 20:29, Fredrik Gustafsson
<fredrik.gustafsson@axis.com> wrote:
>
> OE-core today has three different package managers, the well-known formats deb
> and rpm is supported as well as ipkg that is good for embedded devices.
>
> When building and having a good cache hit, a significant amount of time is
> spent in the phase of generating a rootfs, which is really about the
> performance of the package manager. To save build time and also get a
> package manager that is suitanle for use on targets where flash memory is a
> concern, support for apk is suggested.
>
> However, it might or might not be what's wanted for OE-core since it increases
> the test matrix. Therefore I will refactor the package management code to
> allow a layer to add a new package manager without editing the meta layer.
>
> This refactor will be divided into multiple patch series to be easier to review,
> this is the second patch series.

Sorry to be a pain but I think this series suffers from the opposite
problem to the previous version - it's only a partial move of some of
the code. I'd much rather review a series which does the complete
refactor of the existing code into separate modules without making any
functional changes. I'll let others give their opinions as well, I'm
happy to review this one if we do want to look at this piecemeal.

-- 
Paul Barker
Konsulko Group
