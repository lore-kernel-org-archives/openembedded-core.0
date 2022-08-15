Return-Path: <bruce.ashfield@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id AC261C00140
	for <webhook@archiver.kernel.org>; Mon, 15 Aug 2022 12:36:40 +0000 (UTC)
Received: from mail-oi1-f176.google.com (mail-oi1-f176.google.com
 [209.85.167.176])
 by mx.groups.io with SMTP id smtpd.web12.1282.1660566990557530508
 for <openembedded-core@lists.openembedded.org>;
 Mon, 15 Aug 2022 05:36:30 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20210112 header.b=Jj8L0095;
 spf=pass (domain: gmail.com, ip: 209.85.167.176,
 mailfrom: bruce.ashfield@gmail.com)
Received: by mail-oi1-f176.google.com with SMTP id s199so8456296oie.3
        for <openembedded-core@lists.openembedded.org>;
 Mon, 15 Aug 2022 05:36:30 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc;
        bh=4eoqTY5YPzhH9EydHeZNrI6EM+0bCPYdgoyC3/OxHD8=;
        b=Jj8L0095+jtVcEGAxoYlOseMgqRdfOZc0wSmmsKlrrCXh3xSbX51vVqzvYtBFUeqn1
         7yb9rS4BzMxZPVhRYDsQwN9RAEZUR3mJErEUgKhKOx13hmkAkZwiQSxfPXK9e9WPeFmS
         Tzk4ZLJ2xXsBW61Mj4bxgvVuqDUl1Epfa8PHeM85DtLDWNK3ydyjQ3ETPyAb2y6SRK0d
         jewvMu4zMGCl4LJBYp6fQxmCXX3X3UEQdOw6PxHD13UEkxwjoF331oQ/8cYCcVmvxfYv
         I4pIQMq8e4niP4RA01YjTiAkYslinp7uuilAp6Cs7qmse/gkgVpCZIheaStb2SxkRCcx
         nUkg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc;
        bh=4eoqTY5YPzhH9EydHeZNrI6EM+0bCPYdgoyC3/OxHD8=;
        b=vidME6bnLD/0s9DOH4eV/L6A1kWNp6yk9a2gRCLmINHtg2ijP2rHXkIMVgq3FSR1tJ
         cbjp2Vbw/N6cJAFsFi0pk27QA7E7UNZhapofbnySdCNhCOSzHXs148/11126/So70wJW
         3HXNDPv+9FUXUtQWlxP3ZfEfnkoMtLirBhV1LmK3udNZe8WdQH7coczNmilJJPRlLbga
         Ew899Cf8gZapIfYl3KQkUWW99G0U2ZHyzQAJg9OkXVZ5eNKiNdClHoo/YcmBtPNLfQM9
         NRuO3mnnmLhRJ7o37yL0RyS0K79BgpxzvwGqimrNPc3rsIzFZaMjFApUC4gS7Y3830fe
         5ymw==
X-Gm-Message-State: ACgBeo2bUU1R4TSofqm6tugRNJ78b9srbCIf+K8c7QDuboePoeH3EKDX
	K5oOr92b7Ggpxhx5YgCEXwQR3EAnrp9HslHMKIQ=
X-Google-Smtp-Source: 
 AA6agR7T94rDxUxm84gIBWI8kcUaeFPZyP+6Ojx8tFyXd1mRwqldqJ8CMywLMBwZslbIxm9GhfMq0CgNRU7DJmWpJ78=
X-Received: by 2002:a05:6808:1313:b0:344:973a:3669 with SMTP id
 y19-20020a056808131300b00344973a3669mr2358822oiv.175.1660566988459; Mon, 15
 Aug 2022 05:36:28 -0700 (PDT)
MIME-Version: 1.0
References: <20220815034846.3459068-1-raj.khem@gmail.com>
In-Reply-To: <20220815034846.3459068-1-raj.khem@gmail.com>
From: Bruce Ashfield <bruce.ashfield@gmail.com>
Date: Mon, 15 Aug 2022 08:36:16 -0400
Message-ID: 
 <CADkTA4Myf7rnH3_ZUvuQ100C2-NEvHhm-8b0UKDs2m-sGeHQMw@mail.gmail.com>
Subject: Re: [PATCH] perf: Add packageconfig for libbfd support and use
 disabled as default
To: Khem Raj <raj.khem@gmail.com>
Cc: openembedded-core@lists.openembedded.org
Content-Type: text/plain; charset="UTF-8"
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 15 Aug 2022 12:36:40 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/169352

On Sun, Aug 14, 2022 at 11:48 PM Khem Raj <raj.khem@gmail.com> wrote:
>
> Disable it by default, libbfd changes with binutils major releases and
> sometimes it creates a dependency to fix it. See [1]
>
> This will help building with binutils 2.39

Ack'd. The change is good with me.

I have linux-yocto changes for the new binutils, but this will help
other kernels until they update.

Bruce

>
> [1] https://lore.kernel.org/lkml/20210910225756.729087-1-irogers@google.com/T/
>
> Signed-off-by: Khem Raj <raj.khem@gmail.com>
> Cc: Bruce Ashfield <bruce.ashfield@gmail.com>
> ---
>  meta/recipes-kernel/perf/perf.bb | 1 +
>  1 file changed, 1 insertion(+)
>
> diff --git a/meta/recipes-kernel/perf/perf.bb b/meta/recipes-kernel/perf/perf.bb
> index 95b4362958b..9f7c300a40e 100644
> --- a/meta/recipes-kernel/perf/perf.bb
> +++ b/meta/recipes-kernel/perf/perf.bb
> @@ -20,6 +20,7 @@ PACKAGECONFIG[scripting] = ",NO_LIBPERL=1 NO_LIBPYTHON=1,perl python3"
>  PACKAGECONFIG[tui] = ",NO_NEWT=1,libnewt slang"
>  PACKAGECONFIG[libunwind] = ",NO_LIBUNWIND=1 NO_LIBDW_DWARF_UNWIND=1,libunwind"
>  PACKAGECONFIG[libnuma] = ",NO_LIBNUMA=1"
> +PACKAGECONFIG[bfd] = ",NO_LIBBFD=1"
>  PACKAGECONFIG[systemtap] = ",NO_SDT=1,systemtap"
>  PACKAGECONFIG[jvmti] = ",NO_JVMTI=1"
>  # libaudit support would need scripting to be enabled
> --
> 2.37.2
>


-- 
- Thou shalt not follow the NULL pointer, for chaos and madness await
thee at its end
- "Use the force Harry" - Gandalf, Star Trek II

