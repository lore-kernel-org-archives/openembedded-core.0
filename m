Received: from mail-qt1-f196.google.com (mail-qt1-f196.google.com [209.85.160.196])
 by mx.groups.io with SMTP id smtpd.web12.1070.1586795357084323911
 for <openembedded-core@lists.openembedded.org>;
 Mon, 13 Apr 2020 09:29:17 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@ossystems-com-br.20150623.gappssmtp.com header.s=20150623 header.b=Aj4AeOlL;
 spf=pass (domain: ossystems.com.br, ip: 209.85.160.196, mailfrom: otavio.salvador@ossystems.com.br)
Received: by mail-qt1-f196.google.com with SMTP id s30so7608323qth.2
        for <openembedded-core@lists.openembedded.org>; Mon, 13 Apr 2020 09:29:16 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=ossystems-com-br.20150623.gappssmtp.com; s=20150623;
        h=from:mime-version:references:in-reply-to:date:message-id:subject:to
         :cc;
        bh=o39DMwOOn3/fpMS9aclQ8K3FgBDBnQGq0Q3b1xMpHWo=;
        b=Aj4AeOlLT8txJT0O6JgjT4wTjYVUR16u8nkfeHo6zIWI8MnFFghaHbNQxQaRU6YoD6
         x+iVCmwr5vOCwKO99H6dHuRaXmrmbD9HhdAy9UmUPhbhkNt5in9Lbu0RNkyxAUrHO/nx
         E3gGnkKsRPoCGNegoNBLRyPEwFq3Q8OhOWgZZ/Wk0cC0B86kH1HI4K5Twn1ryRJHToFw
         LW7TJmlIE7r4Nn4jB7DCt95g2kObmgljsHGUGmeg8AfJbwxnHPwdHQ6GbjKeFK0TWp7a
         EC8X7adH/jHJoQk9nYl2vfUIP6YSzJScWYCJ68SL9lK7ycsUF9WIx4Q9i6TCHUyeB0nx
         vdfA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:mime-version:references:in-reply-to:date
         :message-id:subject:to:cc;
        bh=o39DMwOOn3/fpMS9aclQ8K3FgBDBnQGq0Q3b1xMpHWo=;
        b=ZgJKbj4M5VrwdnInN3YZ4b+DAcFf11tDKFju57Xs+yX3GBKVan6T3YpW4kqjpq/oq8
         c3O9/MjjTHcw9hrGJxqIC6cENpzgJpXqCHoZw4WEJfwQB0R5/hjXPJMyD1SlKEovZDYz
         Ate1nYdC1iyK69/5MexfDJPjGh5Sc4VPfmtlcExMFrdQtFM08A0n8JXMC1gbrrC3U9xK
         RKRfQLXyvBIv+s9P5QC1zolmd9IzguokMXiLB31nLFftnl5jcgQCFONF/wcofxrJm/QJ
         Z88Til7Az3IbEWSk/aIlLzwuqMwWRjPSNY/t/etgn60ktJyh6/f+V5c+TzrrbM90wMWs
         ONZA==
X-Gm-Message-State: AGi0PuZRAL7wZa/Pjo8uMzAIa4nX8//TZ/I+HPFhP1zSnpt+NQRk2yce
	NXzjqRIdTQmq/km3RNRyXVk1mslXn7s4mg==
X-Google-Smtp-Source: APiQypJMAag4s3MK0zxNYhZDsKFNTkh04kdethPgr6VcSl6kbNdDoZHxSjMUr9riJn2uMDvcxfwdTQ==
X-Received: by 2002:ac8:6987:: with SMTP id o7mr12220866qtq.118.1586795355759;
        Mon, 13 Apr 2020 09:29:15 -0700 (PDT)
Return-Path: <otavio.salvador@ossystems.com.br>
Received: from mail-qk1-f182.google.com (mail-qk1-f182.google.com. [209.85.222.182])
        by smtp.gmail.com with ESMTPSA id a5sm8462207qkn.83.2020.04.13.09.29.14
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 13 Apr 2020 09:29:14 -0700 (PDT)
From: "Otavio Salvador" <otavio.salvador@ossystems.com.br>
X-Google-Original-From: Otavio Salvador <otavio@ossystems.com.br>
Received: by mail-qk1-f182.google.com with SMTP id s63so5859661qke.4
        for <openembedded-core@lists.openembedded.org>; Mon, 13 Apr 2020 09:29:14 -0700 (PDT)
X-Received: by 2002:a37:48c7:: with SMTP id v190mr16737998qka.46.1586795354182;
 Mon, 13 Apr 2020 09:29:14 -0700 (PDT)
MIME-Version: 1.0
References: <1586731357-36079-1-git-send-email-denis@denix.org>
In-Reply-To: <1586731357-36079-1-git-send-email-denis@denix.org>
Date: Mon, 13 Apr 2020 13:29:02 -0300
X-Gmail-Original-Message-ID: <CAP9ODKoVfrkLZ07UiXcKRaY7XhBATm0fi83m+MyUi1Xp5Tf7kg@mail.gmail.com>
Message-ID: <CAP9ODKoVfrkLZ07UiXcKRaY7XhBATm0fi83m+MyUi1Xp5Tf7kg@mail.gmail.com>
Subject: Re: [OE-core] [PATCH] u-boot.inc: install u-boot-initial-env as ${PN}-initial-env in $D and $DEPLOYDIR
To: Denys Dmytriyenko <denis@denix.org>
Cc: Patches and discussions about the oe-core layer <openembedded-core@lists.openembedded.org>, Tom Rini <trini@konsulko.com>, 
	Richard Purdie <richard.purdie@linuxfoundation.org>, Denys Dmytriyenko <denys@ti.com>
Content-Type: text/plain; charset="UTF-8"

On Sun, Apr 12, 2020 at 7:43 PM Denys Dmytriyenko <denis@denix.org> wrote:
> From: Denys Dmytriyenko <denys@ti.com>
>
> The common u-boot.inc can be used by multiple recipes in the same build for
> different cores and/or multiple stages of the bootloader. Naming initial-env
> with ${PN} prefix avoids clashes in deploy and rootfs between those recipes.
>
> This fixes 69b3b093079c2ca2744d6c02747c5d1b5d3e7ecf that unconditionally
> builds, installs and deploys u-boot-initial-env in the common u-boot.inc.
>
> Signed-off-by: Denys Dmytriyenko <denys@ti.com>
> ---

Acked-by: Otavio Salvador <otavio@ossystems.com.br>



-- 
Otavio Salvador                             O.S. Systems
http://www.ossystems.com.br        http://code.ossystems.com.br
Mobile: +55 (53) 9 9981-7854          Mobile: +1 (347) 903-9750
