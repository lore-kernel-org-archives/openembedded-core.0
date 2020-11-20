Received: from mail-lf1-f65.google.com (mail-lf1-f65.google.com [209.85.167.65])
 by mx.groups.io with SMTP id smtpd.web12.23680.1605870841896732092
 for <openembedded-core@lists.openembedded.org>;
 Fri, 20 Nov 2020 03:14:02 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@burtonini-com.20150623.gappssmtp.com header.s=20150623 header.b=FN+VFTA3;
 spf=pass (domain: burtonini.com, ip: 209.85.167.65, mailfrom: ross@burtonini.com)
Received: by mail-lf1-f65.google.com with SMTP id d17so12871920lfq.10
        for <openembedded-core@lists.openembedded.org>; Fri, 20 Nov 2020 03:14:01 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=burtonini-com.20150623.gappssmtp.com; s=20150623;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=UapPrS94JdlrTg5YdGcZm4NlqT76Ie2k/IZ8HweDhkE=;
        b=FN+VFTA3JzXMiKAcMdWBx+ysh66dBJuXbgf/lsbMsE0whfi+m7QwCQMAIdV/SwnyOe
         3OroxgUba3tsK4kV6rKGIpm45cAHn+Xlf7hDf69Y0nbn2dKTQQL9MxOICeWxHhSitvqd
         5LUhkskHvLwafe3BLm2iiBjtNP4mWQxlVI0OdKZX08PA/IVyeUVVu9ygoFXrBWE/VZR6
         hRTrtBetb5GBYIwyl3JSwU8GVWquJRZ0YlqZliT+5k1lmMBhNRdI0FSYWIb2j8NeIzqB
         QfH3lhDi++vcXEQxwjIgq3rqfvNtV215LEmKyccVKxgXwAfEhPhEbqL+l3UiAbeL11hd
         ooUw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=UapPrS94JdlrTg5YdGcZm4NlqT76Ie2k/IZ8HweDhkE=;
        b=AQ6oVawzRG8zeV9KK4JA7Ap5yaSsZde7N4GKRHgOi7q0nKqppCaA7cS2PnntmMJ8UY
         951oppXEahUmFic2bgDnvghvkCZM4tDERHC59XGOd/2kWxZMfSoW5I8sxrv1SQZfnvIh
         CPr3XSyvE+ymqHZ7Su3LOq1gx2qrhv5+UCpansS6acKuBT/flkufn593diT427wp5dem
         F1LdVljMCf6UKKj6g0Wc1BXWEx/eZwkzIwO39xFEILNnd06xOn10djdZ9TF7hxMZ3ngQ
         gciBUJN7jrwviZcXeNJWCI+3k3CulT4CcO+y67yDsTo4xPMW8b989H1rMK4/O2IGTLo/
         sErw==
X-Gm-Message-State: AOAM5321Rl/0g18C4yGgrOe8ihS8sKC2aG3YvVT2gGbLcB3cUYM4kMCG
	gHtwm2PwfVJk4B/HaGKotFO3wQc2rcuhSHvV4qlnzRdimzvLYnLBD4c=
X-Google-Smtp-Source: ABdhPJwIuSQQ7M/jpnKYB2cwEa2mbzFKQb4VwhS1ltrzE6sOLnycjaH0pW5AgfutZ/C22ww9+hKOliI24PMLaS/AFY8=
X-Received: by 2002:a19:587:: with SMTP id 129mr7809351lff.189.1605870839947;
 Fri, 20 Nov 2020 03:13:59 -0800 (PST)
MIME-Version: 1.0
References: <20201119103813.2726273-1-ross.burton@arm.com> <20201119103813.2726273-3-ross.burton@arm.com>
 <CAOSpxdYRu4t85FLHB4W-_BFvP8amE2fkcgJ9taqTrvZ=8tRziQ@mail.gmail.com> <20201119164119.GA1246345@korppu>
In-Reply-To: <20201119164119.GA1246345@korppu>
From: "Ross Burton" <ross@burtonini.com>
Date: Fri, 20 Nov 2020 11:13:48 +0000
Message-ID: <CAAnfSTuJndXE5kdSuRGRQf4_Wzan6tSyHmHN4TCvg-FnNUsisg@mail.gmail.com>
Subject: Re: [OE-core] [PATCH 3/5] sqlite3: add CVE-2015-3717 to whitelist
To: Mikko.Rapeli@bmw.de
Cc: Steve Sakoman <steve@sakoman.com>, OE-core <openembedded-core@lists.openembedded.org>
Content-Type: text/plain; charset="UTF-8"

On Thu, 19 Nov 2020 at 16:41, <Mikko.Rapeli@bmw.de> wrote:
> Or is the problem here that sqlite version 3.33 is not listed correctly on
> https://nvd.nist.gov/vuln/detail/CVE-2015-3717#match-3021743
> as I don't see this reported even for older 3.22 version in by yocto CVE checker?

So there's a bug in the CPE parsing that I have a local patch for,
which meant this and 38 other issues were not reported.  I have
reported the findings in that thread to NVD to see if they want to add
a version to the CVE, but considering it's not actually known what the
issue is I suspect they might not want to add it.

In an ideal world Apple would verify that the issue is iOS/macOS
specific, but that's not likely to happen.

Ross
