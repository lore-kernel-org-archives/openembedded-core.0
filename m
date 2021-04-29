Received: from mail-pf1-f178.google.com (mail-pf1-f178.google.com [209.85.210.178])
 by mx.groups.io with SMTP id smtpd.web11.9946.1619715429317744630
 for <openembedded-core@lists.openembedded.org>;
 Thu, 29 Apr 2021 09:57:09 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20161025 header.b=iOvcaR8O;
 spf=pass (domain: gmail.com, ip: 209.85.210.178, mailfrom: schnitzeltony@gmail.com)
Received: by mail-pf1-f178.google.com with SMTP id j6so7143208pfh.5
        for <openembedded-core@lists.openembedded.org>; Thu, 29 Apr 2021 09:57:09 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=5tG2ex7kUwBPv2pATLTHucEaZmqkgGS48r3NGg7qMtI=;
        b=iOvcaR8O2tMJ+9SNUxI6PXHoJEsNHCoiDgBpzJfWtUDLtRmuqz88yem1lkOA2bKnx8
         vE44lIXK6rqjiREoJqwLbmNWGzH//UcAfh4TFuDTNG+t1BtlyA3KIEGhDrDHDMw4WET0
         4ITAqkBs4+5eCf/yesNliX6u6xhTyhEnwcYy1P3uOqD5Zrqi7ka77oUmKUzZZZ55NpPS
         OkFBdIESkHXbUgQwvD/vUoIKxcTI56ZvOGeaVzKNURe1UC86z88hzDXGTpjHzYo/7+Cb
         pP6gSudu8qlksP6bLyC00jwkFR8q3tPJdi1+7r7CE6ypzH0lYaV0VlHtyyHnHN5JH/qg
         Gkiw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=5tG2ex7kUwBPv2pATLTHucEaZmqkgGS48r3NGg7qMtI=;
        b=bGT+kY0BB/jLORACgHz/WFjR/wmvHL/oxI/JNeLuFQvaOJIcQV6a9mWOQL6spUFmVN
         uhU3dOuOmvzecsrVMFc+yJT0qCmebvDldCgSkfR3SZYvP1Mpf4iw0EiyEtD/cAHUXJQX
         uphmW28OjDs1V+hf9wywR/nQ7i7YC1Q+vAwLTzYf9m2OVLni4eFHWGfX9U5GbEUCHV/r
         ZbIJAFTBTudVak+FYKE0ij78qR1yRr7JVwx0zcNNTCxdJ2uXDga57kyG+Rnjx0V9VCoQ
         y/PJrJ6TPbl/gx8WLfqIgF4OsJRE95z4dUfz2wUFDVe7HWmsCWwsGw5AeZw/Ll2TzOnM
         76yA==
X-Gm-Message-State: AOAM530nXRdaXWmgU3izqzo38KgZE/xfLvtlSy9RmDecaZv2AmiXKFu6
	RL7hDhg4gW0Hexb+50o4ERPCdXTt6PYtN7jTW3k=
X-Google-Smtp-Source: ABdhPJxTEHjOHSaVnYsIxQwHzL0UfqBac8QFWaAUzHzUKgHZld/sbs+ASMnwfFXIeiPxC6IFX5nyn6o7YC7863LoTRU=
X-Received: by 2002:a65:6a50:: with SMTP id o16mr669310pgu.6.1619715428783;
 Thu, 29 Apr 2021 09:57:08 -0700 (PDT)
MIME-Version: 1.0
References: <CAOSpxdbUdiAU4Eq-6Ogzudm70ieGhzuop0_zCiOBYvczYKi+cQ@mail.gmail.com>
In-Reply-To: <CAOSpxdbUdiAU4Eq-6Ogzudm70ieGhzuop0_zCiOBYvczYKi+cQ@mail.gmail.com>
From: =?UTF-8?B?QW5kcmVhcyBNw7xsbGVy?= <schnitzeltony@gmail.com>
Date: Thu, 29 Apr 2021 18:56:57 +0200
Message-ID: <CALbNGRS5TPuj_+prg_jsFyMckyoaFzxFO0g_Lq4QCSZCw+-CJA@mail.gmail.com>
Subject: Re: [OE-core] Dunfell support for Fedora 33
To: Steve Sakoman <steve@sakoman.com>
Cc: Patches and discussions about the oe-core layer <openembedded-core@lists.openembedded.org>
Content-Type: text/plain; charset="UTF-8"

On Thu, Apr 22, 2021 at 6:24 PM Steve Sakoman <steve@sakoman.com> wrote:
>
> I'd like to work toward getting Fedora 33 as a supported distro for
> the next dunfell release (3.1.8).
>
> Initial autobuilder testing looks fairly good, but I'd like to get
> some feedback from people who are already doing dunfell builds on
> Fedora 33.  Have you run into any issues?  If including
> meta-openembedded in your builds, any issues there?
>
> Thanks!
>
> Steve
>
Hi,

FWIW: on my new machine I gave my monster image a build with dunfell /
fedora 33. Ok this is not a world build but I had no issues on oe-core
/ meta-openembedded.

Cheers,

Andreas
