Received: from mail-qt1-f196.google.com (mail-qt1-f196.google.com [209.85.160.196])
 by mx.groups.io with SMTP id smtpd.web10.41954.1591030328510184462
 for <openembedded-core@lists.openembedded.org>;
 Mon, 01 Jun 2020 09:52:08 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20161025 header.b=jx//xwsh;
 spf=pass (domain: gmail.com, ip: 209.85.160.196, mailfrom: raj.khem@gmail.com)
Received: by mail-qt1-f196.google.com with SMTP id k22so8209820qtm.6
        for <openembedded-core@lists.openembedded.org>; Mon, 01 Jun 2020 09:52:08 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=6becdlBNByV5wVBu802zEPJmfjb6ND6WW0+83zfNra8=;
        b=jx//xwshdXLa763rBoKkMCQDjlqBCnxlEHI3S31aRBm/6EIXx5qUGXh9VD18TP/bfV
         oP6VJBO+O8PEe6iHYi1b4xFEdoibbpRNxv7nasBkTRJAh7zaCjsTRdj0Au6I0iMtEhBY
         hjL0dc6S/tDr8zFCH6WT3IGNNk+O8f8kbU0mvCYqV0agKI8dPXzNeXs9a31kjGS8z3Td
         dASwT51cMnfhpZsrN/SeM2tTODYzk5SOWLpYYsKn1PyJasISsde5n5295d5LqhdxA5lP
         HqCqbpXOVHj7eQs7ZWIghiIZ3mnoqTQy3wNZAyFOKVKbaS6LXwrVi5CiDJJIppuQLMQU
         Plkw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=6becdlBNByV5wVBu802zEPJmfjb6ND6WW0+83zfNra8=;
        b=KbY8rrnFuI3ws6liWitQY4rrBHrzK485MPN4mUZpTPM/Aglzq4FU7WI+4ja8Ju3MCo
         FNhv1r/FIF/8vtaaOXvnBFnAegAOL6BU7kCo8El6D8zOzLJRnJue7OCpMfZlSqRK+5ii
         Lrsu4XKIceHhgRmVQOTbkeDFSbSoIhLWTdHQEUcKBhZ9fJnKAhEu5ci2RfiqaiRWnyBl
         p1EB+oPv975a9mnXYdcMWaQfbG/jfbquMlGroQqpcejU1r/lNqcLP54W6FQnxBeTWS7m
         YH0RChO61AT2Bdf8DWPnMziweaIAbNtwBd2At68j87Lv2Pnj1NgBkblC9/h2dtYvpibI
         D/aA==
X-Gm-Message-State: AOAM532zbw3RF2U4gkfxt14i96HYy0LKgPxk1jkpcQyJOBER4k8vxq70
	Q7GlZBL0IXnhUxK2LCa6xVJENX16bjQMYx1Bvpg=
X-Google-Smtp-Source: ABdhPJwv9TFpUpQ7Y3/XTCS93GDSbpQn2n0i8q7ozjLLj0hVICt+h4MKZuBDiY1PF3nxBNoceUEMb14h9LK73c+9G8Q=
X-Received: by 2002:ac8:5148:: with SMTP id h8mr22027834qtn.316.1591030326297;
 Mon, 01 Jun 2020 09:52:06 -0700 (PDT)
MIME-Version: 1.0
References: <20200531155254.10283-1-alex.kanavin@gmail.com> <20200531155254.10283-18-alex.kanavin@gmail.com>
In-Reply-To: <20200531155254.10283-18-alex.kanavin@gmail.com>
From: "Khem Raj" <raj.khem@gmail.com>
Date: Mon, 1 Jun 2020 09:51:40 -0700
Message-ID: <CAMKF1spJJn+ZvGwtau_QzQiJT52_rRkj56Ys4Dt1pp=_rSJ--A@mail.gmail.com>
Subject: Re: [OE-core] [PATCH 18/70] vala: upgrade 0.46.6 -> 0.48.6
To: Alexander Kanavin <alex.kanavin@gmail.com>
Cc: Patches and discussions about the oe-core layer <openembedded-core@lists.openembedded.org>
Content-Type: text/plain; charset="UTF-8"

gnome-calculator fails https://errors.yoctoproject.org/Errors/Details/414868/

On Sun, May 31, 2020 at 8:53 AM Alexander Kanavin
<alex.kanavin@gmail.com> wrote:
>
> Signed-off-by: Alexander Kanavin <alex.kanavin@gmail.com>
> ---
>  meta/recipes-devtools/vala/{vala_0.46.6.bb => vala_0.48.6.bb} | 3 +--
>  1 file changed, 1 insertion(+), 2 deletions(-)
>  rename meta/recipes-devtools/vala/{vala_0.46.6.bb => vala_0.48.6.bb} (57%)
>
> diff --git a/meta/recipes-devtools/vala/vala_0.46.6.bb b/meta/recipes-devtools/vala/vala_0.48.6.bb
> similarity index 57%
> rename from meta/recipes-devtools/vala/vala_0.46.6.bb
> rename to meta/recipes-devtools/vala/vala_0.48.6.bb
> index 66f620384c..9dace1348c 100644
> --- a/meta/recipes-devtools/vala/vala_0.46.6.bb
> +++ b/meta/recipes-devtools/vala/vala_0.48.6.bb
> @@ -4,5 +4,4 @@ SRC_URI += "file://0001-git-version-gen-don-t-append-dirty-if-we-re-not-in-g.pat
>             file://0001-vapigen.m4-use-PKG_CONFIG_SYSROOT_DIR.patch \
>             "
>
> -SRC_URI[md5sum] = "d9af125648505503b139ebc2d2c9eee5"
> -SRC_URI[sha256sum] = "ef31649932872f094971d46453b21c60a41661670f98afa334062425b4aec47a"
> +SRC_URI[sha256sum] = "d18d08ed030ce0e0f044f4c15c9df3c25b15beaf8700e45e43b736a6debf9707"
> --
> 2.26.2
>
> 
