Received: from mail-lf1-f46.google.com (mail-lf1-f46.google.com [209.85.167.46])
 by mx.groups.io with SMTP id smtpd.web11.5185.1605091576261173379
 for <openembedded-core@lists.openembedded.org>;
 Wed, 11 Nov 2020 02:46:16 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@burtonini-com.20150623.gappssmtp.com header.s=20150623 header.b=BfJsdb1Y;
 spf=pass (domain: burtonini.com, ip: 209.85.167.46, mailfrom: ross@burtonini.com)
Received: by mail-lf1-f46.google.com with SMTP id z21so2484001lfe.12
        for <openembedded-core@lists.openembedded.org>; Wed, 11 Nov 2020 02:46:15 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=burtonini-com.20150623.gappssmtp.com; s=20150623;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=hqaQdmpq2vjtr/iszXLoJs6lE6ACvlajb2yn0eVo4Pg=;
        b=BfJsdb1YxZ+cXbFQyVxfWRblp9DdgW/bVKxJkmZxi/YXxC67iqSugmx3zrPd7jfwBc
         FBn6p9ndatNZX9UnfKnqN6xisc/xyRkkqe81IYBF7qhL8zCW6H90+L0X7Nr7ciswOXSe
         cA4v7f91r2Q22fWRG19dm8b/YYy87MMgKZOLf27jV8teguEdAAkfNGbWs1w2PlpDOIq0
         XRsXEXLYG0M1kXD+6BsC8G9tj15OfLsrM5ZQnlqwrKNpVPzA+OEdy8uXT+I2nKxURSAv
         hX+Qkj0S23k48T5jZwDTRcXbRejrwUtSObrXBvfL/SW9B92ekdzvi/MJ3jJXsoQ5KOwF
         B6SA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=hqaQdmpq2vjtr/iszXLoJs6lE6ACvlajb2yn0eVo4Pg=;
        b=rbwjx5ZATDHA19KybHc6Id1CkvhQila8eEQvkBw3qXolq3CDCz5ff3jKlwPn2ppUuV
         3uwjy8wOROMiLluawGhmzrHScsfCloiJt22zmBhVAN1eqUkoo5W+OkbRDqEiVMaMNdas
         DDbPzA09lZ4f37Aws3Nul/WDs9e7ED/muExF3zagLSR7Y+topOohFHtuwvhe8QlvHGP7
         qbfAvud5YHGIil9wHjj7UAodONAZrTeqUl8wr6Vq+R3memEk6pYOek7UjSJHgUxPugqO
         E0UXRTJl2rDzUqty52watbafCZ2jids9HwUIcEH731suM68DYBXinovygfEVKBZr1NDv
         HCEA==
X-Gm-Message-State: AOAM531zyJVbndTV/hk3IAQn41f46vMgQa0M+ZsUH7P8aWdxbURnTHUu
	my+tSHoUA2H8Q5vN9tCpzE8kQc5tx3CkcilpaIVIQA==
X-Google-Smtp-Source: ABdhPJzZOFHJVY4f24cu+dXgllVTYHg0QhMi/jzGggc77LO253Kq78jlY5ctUoWrDJI7uOkdpN2a0XdqTpVr6w8WXks=
X-Received: by 2002:a19:4a41:: with SMTP id x62mr8868284lfa.398.1605091574193;
 Wed, 11 Nov 2020 02:46:14 -0800 (PST)
MIME-Version: 1.0
References: <DB6PR0102MB2630314CC44CCB6400F59C4E88E80@DB6PR0102MB2630.eurprd01.prod.exchangelabs.com>
In-Reply-To: <DB6PR0102MB2630314CC44CCB6400F59C4E88E80@DB6PR0102MB2630.eurprd01.prod.exchangelabs.com>
From: "Ross Burton" <ross@burtonini.com>
Date: Wed, 11 Nov 2020 10:46:03 +0000
Message-ID: <CAAnfSTtqCwkWbVYiD5614NW3Z4ch+Xh1KEdPvwAvVCH3SmPUmA@mail.gmail.com>
Subject: Re: [OE-core] FreeType CVE-2020-15999
To: diego.santacruz@spinetix.com
Cc: "openembedded-core@lists.openembedded.org" <openembedded-core@lists.openembedded.org>
Content-Type: text/plain; charset="UTF-8"

On Wed, 11 Nov 2020 at 08:06, Diego Santa Cruz via
lists.openembedded.org
<diego.santacruz=spinetix.com@lists.openembedded.org> wrote:
> Also, how should one report problems in the NVD database?

Email cpe_dictionary <cpe_dictionary@nist.gov> and explain the
situation, matching the CPE vendor/product to existing freetype CVEs
and including the version information.

Ross
