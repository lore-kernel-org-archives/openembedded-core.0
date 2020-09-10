Received: from mail-lj1-f195.google.com (mail-lj1-f195.google.com [209.85.208.195])
 by mx.groups.io with SMTP id smtpd.web11.1302.1599771838654526775
 for <openembedded-core@lists.openembedded.org>;
 Thu, 10 Sep 2020 14:03:59 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@burtonini-com.20150623.gappssmtp.com header.s=20150623 header.b=R3RGoZRM;
 spf=pass (domain: burtonini.com, ip: 209.85.208.195, mailfrom: ross@burtonini.com)
Received: by mail-lj1-f195.google.com with SMTP id w3so10015091ljo.5
        for <openembedded-core@lists.openembedded.org>; Thu, 10 Sep 2020 14:03:58 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=burtonini-com.20150623.gappssmtp.com; s=20150623;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=I3qgggogVgxq/KhdwWD8BsWf0mkYIhShlVM4AfWVekA=;
        b=R3RGoZRMDf9JUiNiAyOeAVWzfLTtxkN4P+0emxLz0BjGBUvFIEzlW9xjVtZGf1/a/Y
         1/CXNiwOxMmu5XsYfkfkc0LrCvni51s+q2iVwHdUKLLkNk+UfSYDtp2RWFfaLS2Xq2fy
         yFOAzwmDjl64UdavlEEQoam3eGWMZhu1OF+lZO334iZLa6qBwCrTL5N2nMLqNkHRjGSF
         2KOP/uQBu4oTtsf7RhTRrJC7B1pZHFFfcY4Lg3/01dRciAv5I6VUBdGSnJIO5Sj2jHkC
         jQL4SxegMCmeFKzy0Yvt71h4vr7TSqWwB0+M64GjqXiiR/tLFIEWeMgALIhMJMjRyEpY
         YdVg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=I3qgggogVgxq/KhdwWD8BsWf0mkYIhShlVM4AfWVekA=;
        b=s8MrlHviDryikNwjhFW3s1EEXEA3+pghEn3osvkEzYHx7PbHyQHpbO7U8XlesMGKmV
         HZSpDiDRIBDMlMjEvQKlCFnVnkh3CSN+i74WXZt4+gZ1hr3HlHuYO3KtNLhevXj4EDkr
         6SWb8bzmatL24MxCvADlk7G7G1XMnEWhsOeStqGo2CyyAfrDPUkD2vit1LwcEVIvlBLA
         fo5z/tCCT0KoSD9pnToczczdm2tYf6X1pbn/a2O7LAQ1iAMD7YGIifVQiZypd255uPf5
         imm5GHDjRDijnB/8GBbaDpw8/DvZBof1pgrIWeLQgbCWz+XqZok8zBp2iAbBdbp1YpU/
         zX3Q==
X-Gm-Message-State: AOAM533MBnTs2wXuW9CuXD62Bhk5J1uHkE0grBmAyLztyR+zfPw6ouCc
	+1KT4SLJN3Q7nujdUdadwuh2xqwcTgvAVhAE7Bo44Q==
X-Google-Smtp-Source: ABdhPJzvFK2QyFl3ddCvItpvvbRvaLbgcnRHQ4Ku7xobX3+fLxQMEioPdg/qU+KdbIlKYjzdkUSDRORATko6+R4rtK0=
X-Received: by 2002:a2e:b386:: with SMTP id f6mr5433592lje.186.1599771836639;
 Thu, 10 Sep 2020 14:03:56 -0700 (PDT)
MIME-Version: 1.0
References: <20200910200128.32995-1-sakib.sajal@windriver.com>
In-Reply-To: <20200910200128.32995-1-sakib.sajal@windriver.com>
From: "Ross Burton" <ross@burtonini.com>
Date: Thu, 10 Sep 2020 22:03:45 +0100
Message-ID: <CAAnfSTtdSF+Ybw0jrTkUH58fGHB9g9qMWnwEP8WnNh1zfjOWUA@mail.gmail.com>
Subject: Re: [OE-core] [PATCH] qemu: fix CVE-2020-14364
To: Sakib Sajal <sakib.sajal@windriver.com>
Cc: OE-core <openembedded-core@lists.openembedded.org>
Content-Type: text/plain; charset="UTF-8"

On Thu, 10 Sep 2020 at 21:01, Sakib Sajal <sakib.sajal@windriver.com> wrote:
> Upstream-Status: Backport [b946434f2659a182afc17e155be6791ebfb302eb]
>
> Signed-off-by: Sakib Sajal <sakib.sajal@windriver.com>

The commit message needs your SOB, but the US and another SOB of yours
need to be in the patch header.

Ross
