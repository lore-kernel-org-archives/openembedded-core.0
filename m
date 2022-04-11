Return-Path: <raj.khem@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id CCACFC48BCF
	for <webhook@archiver.kernel.org>; Mon, 11 Apr 2022 17:17:59 +0000 (UTC)
Received: from mail-qt1-f173.google.com (mail-qt1-f173.google.com
 [209.85.160.173])
 by mx.groups.io with SMTP id smtpd.web10.25807.1649657776483365084
 for <openembedded-core@lists.openembedded.org>;
 Sun, 10 Apr 2022 23:16:16 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20210112 header.b=oHHc69Rd;
 spf=pass (domain: gmail.com, ip: 209.85.160.173,
 mailfrom: raj.khem@gmail.com)
Received: by mail-qt1-f173.google.com with SMTP id t2so15463863qtw.9
        for <openembedded-core@lists.openembedded.org>;
 Sun, 10 Apr 2022 23:16:16 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=30FyZZR93/ON6ctGVD5DYiGxXHThYRoqAm3ldk5Nd68=;
        b=oHHc69Rd5SZc3OJ3iquI3wCb3YjzW9GHDu1fsUI/01ti6pSV9e09en/I8UFb6dsfPK
         RVvADwgD1WjQ+SerG/YsRITxi/3b1sx9SP2KZZnWM33c0YUIim1n+PD4Pp4Phi42ibNb
         WWba8U9BzEakqY28mrPoIOxR/2eJ9Y90w5CzXchDvaISXFn5+2/tVXeSjUo/ZKzBD7Yh
         221NNjRogozWmi/SCiHc/LdHPR9muXG5BPsk8avs+x1fd22Mkks06DwI5exrYOwqi30R
         cMXm5wZVB9GK24RqYwK7TYpujS1db45v4uWB7XaeXyn/vC4G4rcEgu3rvng93c1IQExu
         9aiw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=30FyZZR93/ON6ctGVD5DYiGxXHThYRoqAm3ldk5Nd68=;
        b=xvOePNjGemL4TL1m7MvDLNviWoaM3kBTRb+atXJ+CQ60kW7c5m5U8W7uyFwMe26cUO
         bb9tf2d8kByGoFiGWnnoQWPhqI33cGNenGVc+KxQslDYKWz/ksnpBZLcYCySlON4zFs7
         gemtq3b5uW5eGz/ylIgvuFGCR+ww+Esd3RAcdn2eB/onRHuEKvTXYkdZfF7icdC8GqOs
         DZDurJUZN66Gx8AUCAQRjQkOS6TA/DiB7S5jCjULKQb56PaR4M0ZtYgTBdQTYAVKDXKT
         rCjHJ4lJzHWW8sC/sVjcb9+/MNjBLPq/Avk3lwZIyjmH0eSymw48Ir0MbjvOuaXanQyF
         M2yw==
X-Gm-Message-State: AOAM531OykGQ5F98qTw711UNr2n1fNwnfBvOdRQ7P+Z+NHk6WpaQNIE/
	4EoQzdIKBKNs2oLU8FZzBVoabWgHbEfA6BTU+rc=
X-Google-Smtp-Source: 
 ABdhPJzZDpKUuwu9+2UqGmb4Zkff+/NOi9Ax2KGk3NqGR54kPQ510+iLr4W4hGKoUqtP423UKxfFjmGbgoFjD2AEVv0=
X-Received: by 2002:ac8:5743:0:b0:2e1:cee6:f15 with SMTP id
 3-20020ac85743000000b002e1cee60f15mr24487369qtx.634.1649657775508; Sun, 10
 Apr 2022 23:16:15 -0700 (PDT)
MIME-Version: 1.0
References: <20220410172852.4136-1-f_l_k@t-online.de>
 <CAJ86T=Vojo4Y1sTzHtDca79WQXuWdE6VS0r=P7wpvHHE3nBrQQ@mail.gmail.com>
 <b06ab65f-b328-6b96-fe0d-cd124641f0ca@t-online.de>
In-Reply-To: <b06ab65f-b328-6b96-fe0d-cd124641f0ca@t-online.de>
From: Khem Raj <raj.khem@gmail.com>
Date: Sun, 10 Apr 2022 23:15:49 -0700
Message-ID: 
 <CAMKF1srnQ8JTjnAN9dy9QwqdqgFxbawiTqQUcZnpwbu_0acgwA@mail.gmail.com>
Subject: Re: [oe-core][PATCH] glib-networking: build with gnutls support
To: Markus Volk <f_l_k@t-online.de>
Cc: Andre McCurdy <armccurdy@gmail.com>,
	OE Core mailing list <openembedded-core@lists.openembedded.org>
Content-Type: text/plain; charset="UTF-8"
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 11 Apr 2022 17:17:59 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/164216

On Sun, Apr 10, 2022 at 10:46 PM Markus Volk <f_l_k@t-online.de> wrote:
>
>
> Am 11.04.22 um 06:25 schrieb Andre McCurdy:
>
> On Sun, Apr 10, 2022 at 10:29 AM Markus Volk <f_l_k@t-online.de> wrote:
>
> this fixes authentication issues with geary and tls connection
>
> Signed-off-by: Markus Volk <f_l_k@t-online.de>
> ---
>  meta/recipes-core/glib-networking/glib-networking_2.72.0.bb | 2 +-
>  meta/recipes-support/gnutls/gnutls_3.7.4.bb                 | 2 +-
>  meta/recipes-support/p11-kit/p11-kit_0.24.1.bb              | 4 ++--
>  3 files changed, 4 insertions(+), 4 deletions(-)
>
> diff --git a/meta/recipes-core/glib-networking/glib-networking_2.72.0.bb b/meta/recipes-core/glib-networking/glib-networking_2.72.0.bb
> index d578f17aa5..73827b0a85 100644
> --- a/meta/recipes-core/glib-networking/glib-networking_2.72.0.bb
> +++ b/meta/recipes-core/glib-networking/glib-networking_2.72.0.bb
> @@ -11,7 +11,7 @@ DEPENDS = "glib-2.0"
>
>  SRC_URI[archive.sha256sum] = "100aaebb369285041de52da422b6b716789d5e4d7549a3a71ba587b932e0823b"
>
> -PACKAGECONFIG ??= "openssl ${@bb.utils.contains('PTEST_ENABLED', '1', 'tests', '', d)}"
> +PACKAGECONFIG ??= "openssl gnutls ${@bb.utils.contains('PTEST_ENABLED', '1', 'tests', '', d)}"
>
> This should either be gnutls or openssl, not both. But aside from
> that, gnutls brings (L)GPLv3 issues and therefore should not be
> enabled by default.
>
> In a perfect world, I would say you are right. There should not even exist more than one implementation.
>
> In reality, at least for now, geary is broken with openssl.
>
> As for your concern about gplv3 issues. As far as I know, the core of gnutls is under LGPL-2.1. Only installation of gnutls-bin or gnutls-openssl should introduce GPL-3.0.
>

It's the dependencies that you have to count as well in order to link
with libgnutls in a program.
libgnutls requires nettle which requires GMP. GMP (>= 6.0.0) is dual licensed
LGPLv3+ or GPLv2+. Starting with 3.5.7 libunistring is required too. It also
is dual licensed LGPLv3+ or GPLv2+

> I'm more like thinking "better to have more mainstays, so you dont fall if you loose one". But  i'm not strict with my opinion. This change can also be done with bbappends.
>
> Are you saying that some glib-networking functionality works when
> using gnutls but does not work when using openssl? If so, is it a
> known limitation? Or a bug? If a bug, has it been reported upstream?
> The commit message should explain those kinds of details.
>
> It completely stopped working with openssl. This happened about two weeks ago, possibly because of the latest openssl update.

I think it would be nice to check with upstream if that's intentional
or perhaps open a bug with upstream to report the problem.

>
>
>
>
> -=-=-=-=-=-=-=-=-=-=-=-
> Links: You receive all messages sent to this group.
> View/Reply Online (#164214): https://lists.openembedded.org/g/openembedded-core/message/164214
> Mute This Topic: https://lists.openembedded.org/mt/90378285/1997914
> Group Owner: openembedded-core+owner@lists.openembedded.org
> Unsubscribe: https://lists.openembedded.org/g/openembedded-core/unsub [raj.khem@gmail.com]
> -=-=-=-=-=-=-=-=-=-=-=-
>

