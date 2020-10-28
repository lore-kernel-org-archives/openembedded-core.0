Received: from mail-lj1-f175.google.com (mail-lj1-f175.google.com [209.85.208.175])
 by mx.groups.io with SMTP id smtpd.web09.8177.1603888837568760928
 for <openembedded-core@lists.openembedded.org>;
 Wed, 28 Oct 2020 05:40:38 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@burtonini-com.20150623.gappssmtp.com header.s=20150623 header.b=G0V0mULz;
 spf=pass (domain: burtonini.com, ip: 209.85.208.175, mailfrom: ross@burtonini.com)
Received: by mail-lj1-f175.google.com with SMTP id x6so6123735ljd.3
        for <openembedded-core@lists.openembedded.org>; Wed, 28 Oct 2020 05:40:37 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=burtonini-com.20150623.gappssmtp.com; s=20150623;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=y5lXMrgT/OP2AErEngdsODBe2m3z3uSN/He43BuPnB0=;
        b=G0V0mULzXpccyqigeYlBJvkf8WZkjjLnmfQYlWXqPreJ27wxBB9haf43VN0ytzxBGw
         Eqf199P5GfoxaseyPLLSHlLXGujrlHuGPV93+LALoxngqoltlWcPgJzVjn0G+Vtyrw+u
         SSHJVZxfJL6+O8V0heY311HMnOTAmpr+wMTj8sPPX7gC2TL4h6zVZ1tkw8MMCgWKEEWP
         AnYcYLCu8wrje+DVsTRtqLVomhx7VYT5QpoEfMWGJ+KkJBut2+FtV9fae5s8uIYpHKBf
         7lR2JPi93Yqr3F3OjoiAeumTnJXiHD80lfBthOO/xtw5XueWqgFq4uSwU5HABcScAKDI
         CNQw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=y5lXMrgT/OP2AErEngdsODBe2m3z3uSN/He43BuPnB0=;
        b=D103fM3ziXG6Cmyh3LE9xBYeEwT+xd+Qt6LA8uOIYdmAb6DIt/+bzTHzv7EopYV1Sm
         gxpcwe4fz3kueLzQf0VMcfMtxsqwJQO1N4C+I4g77X1zF0Awhgnc3UXxWj0KkbPkTpIb
         ufCdrnHSBN6HmIykVuawdaWyLK6PdCrXyztP7mnA78yXTAC4b92bx4FS68UUFQCEBiAa
         f8hOdHwNcY9H/Hh2tGLHFG3/HMhwNRr4C8KHhB18I+bZ2ZDBHw5EyIvcFCS2DxpW62vL
         znn/tgZF9i3B+AYiBsjSb2QmCkPq22fKrTOmnV3ieeuVkBHk/iXpZWVdbIaDrwmB/ond
         cxog==
X-Gm-Message-State: AOAM531cG3rufeRbqkUvoJc+K13kf3c9qhoxxnc4bZqbl8K5YBXvcDdt
	0m9mLbjBmj7wG2K4R7b7wOwnne9RLM9ZnTK3XABnFg==
X-Google-Smtp-Source: ABdhPJwK0dFoAbP64eDn/IN8DWAR5gd7MRnTTnTjIZzePgXBEvixybFTiJpAUqAsKw2HMb7zRVGnLaSM/sxIABrwVRU=
X-Received: by 2002:a2e:995a:: with SMTP id r26mr2971301ljj.329.1603888835618;
 Wed, 28 Oct 2020 05:40:35 -0700 (PDT)
MIME-Version: 1.0
References: <1600057661-71125-1-git-send-email-jay.shen.teoh@intel.com>
In-Reply-To: <1600057661-71125-1-git-send-email-jay.shen.teoh@intel.com>
From: "Ross Burton" <ross@burtonini.com>
Date: Wed, 28 Oct 2020 12:40:24 +0000
Message-ID: <CAAnfSTumTDg-itUN0n2msZUE3bfsjT8hkgrrUKHkJj0cNiZkNg@mail.gmail.com>
Subject: Re: [OE-core] [PATCH] oeqa/runtime: add test for matchbox-terminal
To: jay.shen.teoh@intel.com
Cc: OE-core <openembedded-core@lists.openembedded.org>
Content-Type: text/plain; charset="UTF-8"

On Mon, 14 Sep 2020 at 05:27, <jay.shen.teoh@intel.com> wrote:
> This test is checking that the terminal application is able to run. The click_terminal_icon_on_X_desktop manual test case from oeqa/manual/bsp-hw can be replace by this runtime test.

This does not test that the terminal actually started.  If it hung,
this test would pass.  The manual test case is "does the terminal
work", which this test does not replicate.

Ross
