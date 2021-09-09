Received: from mail-qt1-f178.google.com (mail-qt1-f178.google.com [209.85.160.178])
 by mx.groups.io with SMTP id smtpd.web08.3454.1631164006264173610
 for <openembedded-core@lists.openembedded.org>;
 Wed, 08 Sep 2021 22:06:46 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20210112 header.b=aD7wiDjS;
 spf=pass (domain: gmail.com, ip: 209.85.160.178, mailfrom: raj.khem@gmail.com)
Received: by mail-qt1-f178.google.com with SMTP id t35so435553qtc.6
        for <openembedded-core@lists.openembedded.org>; Wed, 08 Sep 2021 22:06:46 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=isQazaeDN3EqRUl4KlHmK+6KUoBkrnnYnZYIeT8aZCs=;
        b=aD7wiDjS3OEGMiNO03eqHgDbo1cxJ19bYP+S/HgAmjunsVQmOumsK0+3pPnBnWJrS1
         BkKKptlHABg+rekFTqts+l6MhhyhvTy30JNE0vNi5Hv8QD5MP/EeW7P2rFv8z+M6Jth4
         /HnEFwWrvrXSKjPRzVNV9fBE48pIHTPoYnZA9O7IZisoxbw4862GRO1f+/KsABjmpPbP
         WtCz704PyGCk0w8QaY/gORSgvalaRIx7x6dhXqnm/CHg6BnQlsafu+beVf1fOHXFO20/
         pEIgGjKZg1kphk7hcDs2ecXYMwjOZ62uMKsYbrF/SvX40KgvIabrjxVRa35FgQHnkbXf
         jAmw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=isQazaeDN3EqRUl4KlHmK+6KUoBkrnnYnZYIeT8aZCs=;
        b=MpZUhguBAm4wAvHyuQO37pLzyeG4lWfnMswFTeQ+ieVHqeyX1HDWDjZEZAEqkyJO5r
         0cc6vbIsBBjX6YW6ci/D2C+qZ0QQPA5lqxqOTzsqALgMqiVVAEUAnI2grR17twa4KS03
         1m7mLyPOoaLAFhTUskm0iAkxhKr/PBovV5Z+VzGqm8bTTfZ74hlI76FvNHLbprJP1TnV
         lmBe/h1v7Bh9N4b0bRMJJzeN2QD92JdabBLUbFggRxMeW31kxLSzlMrGgSx3nU8YZ+8A
         UPqTVSVLJLH3Hf2y+JBfJHa0aTG9Bk+PJ8GsW2XLvF0mqIrNWqSlEy9lKloENni3akyW
         kRDQ==
X-Gm-Message-State: AOAM532QaP/Wd59gvuK1c4gwosUNkIPqkrPmDPlnfa3Bb8O5Cor1SbBt
	dkjX4ujbsrWo/fh6MgYuestwKxW7z+5+xfneZIPa6eYloR0ttg==
X-Google-Smtp-Source: ABdhPJyTEJwXb2TPfJDXkVN1y1rQGHLUDkzZTuNLLhEb/iOXVtrmimYRtAEeVZ/K0xWGMCAiBJCdsB8wv/1uoYnhm8U=
X-Received: by 2002:ac8:67d7:: with SMTP id r23mr1149794qtp.227.1631164005372;
 Wed, 08 Sep 2021 22:06:45 -0700 (PDT)
MIME-Version: 1.0
References: <cover.1631006167.git.liezhi.yang@windriver.com>
In-Reply-To: <cover.1631006167.git.liezhi.yang@windriver.com>
From: "Khem Raj" <raj.khem@gmail.com>
Date: Wed, 8 Sep 2021 22:06:19 -0700
Message-ID: <CAMKF1soGYd6t=1NaTTnD0482JOZWBx=M2HxDUnmHY8MX-j4aWw@mail.gmail.com>
Subject: Re: [OE-core] [PATCH 0/1] assimp: Remove it
To: Robert Yang <liezhi.yang@windriver.com>
Cc: Patches and discussions about the oe-core layer <openembedded-core@lists.openembedded.org>
Content-Type: text/plain; charset="UTF-8"

also delete meta/lib/oeqa/sdk/cases/assimp.py

On Tue, Sep 7, 2021 at 1:46 AM Robert Yang <liezhi.yang@windriver.com> wrote:
>
> The following changes since commit 70de1dbb660461bdf0613494f53ec4c78738ae2a:
>
>   vim: Add packageconfig for sound notification support (2021-09-06 09:49:13 +0100)
>
> are available in the Git repository at:
>
>   git://git.openembedded.org/openembedded-core-contrib rbt/assimp
>   http://cgit.openembedded.org/openembedded-core-contrib/log/?h=rbt/assimp
>
> Robert Yang (1):
>   assimp: Remove it
>
>  meta/conf/distro/include/maintainers.inc      |    1 -
>  ...hared-lib-from-_IMPORT_CHECK_TARGETS.patch |   32 -
>  ...hub.com-assimp-assimp-issues-2733-up.patch | 1664 -----------------
>  .../use-GNUInstallDirs-where-possible.patch   |  257 ---
>  meta/recipes-graphics/vulkan/assimp_5.0.1.bb  |   26 -
>  5 files changed, 1980 deletions(-)
>  delete mode 100644 meta/recipes-graphics/vulkan/assimp/0001-assimp-remove-shared-lib-from-_IMPORT_CHECK_TARGETS.patch
>  delete mode 100644 meta/recipes-graphics/vulkan/assimp/0001-closes-https-github.com-assimp-assimp-issues-2733-up.patch
>  delete mode 100644 meta/recipes-graphics/vulkan/assimp/use-GNUInstallDirs-where-possible.patch
>  delete mode 100644 meta/recipes-graphics/vulkan/assimp_5.0.1.bb
>
> --
> 2.17.1
>
>
> 
>
