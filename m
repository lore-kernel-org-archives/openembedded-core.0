Received: from mail-qt1-f178.google.com (mail-qt1-f178.google.com [209.85.160.178])
 by mx.groups.io with SMTP id smtpd.web10.9927.1615050238018723552
 for <openembedded-core@lists.openembedded.org>;
 Sat, 06 Mar 2021 09:03:58 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20161025 header.b=MqmCVA8L;
 spf=pass (domain: gmail.com, ip: 209.85.160.178, mailfrom: raj.khem@gmail.com)
Received: by mail-qt1-f178.google.com with SMTP id v3so4388203qtw.4
        for <openembedded-core@lists.openembedded.org>; Sat, 06 Mar 2021 09:03:57 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=U2RHd9msq/EBVZhFuB33kQ9vIqBcTtjBxEm9zozqH+g=;
        b=MqmCVA8LpTDiasNcVdTglEgVZTYjsarKDDWKkoPXaevLo/8SUZs83K4HhgWX3ky++Q
         U+Iil48uqDU3Ltt+YztfbfQxrIOEDyfEEOoqy53FFrL5o1vCzgq0BiGIj9zRiAxe1f9P
         a29/w9uCvbQCyCFje+HOGIBBpZBoSqZxSZdjhuXi4Xc9R5CG1gZf4jOV8d8pqO2pf4Qj
         dTwf4UnivdqvnXm41o66jAV8CM6xHzD3WwI24nafscwhR4nLLehnph2J3kEpOtr1IvL4
         MuW+jUeLlx8uNeMd5Yrsiex7wVA/qU8QQznu5nzP5P01nEwJ42VFrieG2wrKbCs2XLBM
         kJGw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=U2RHd9msq/EBVZhFuB33kQ9vIqBcTtjBxEm9zozqH+g=;
        b=TJVr4pAciweVxOf3hZceyLJyaM0P+nd0axy55Na3kKCR0uer4949+niRGT7Rzssyck
         HeejL92NCpL5VUMugPvTg7AcRclDUzvQVj5Ll5TaZ8J0a9kAQv1ixdJAf6tpcI8Xielk
         fTugKI2kkFsEt0X8NuD/CaGpXwmrtiR6MWW5Y8MU0rxUWdy74WYmkNJkuCmdhY0SziwN
         kQWcYLxw2AzD8KKvtN9lICfZThVAsyfAqU8PpS3DUeHkMQbrX5VWHoy18jOLVQwWl5/q
         HVzfuukTt33UZz/CKn67KQ1eTXUOdmK2psiazRQ5xm/Wrqrv0rjjRrqZ97XP+i+sTmro
         vmpA==
X-Gm-Message-State: AOAM530alx0byf7XfHjnYMpwVniGiIBoALp7bEpeqIyLV9ca+nJNzEfM
	p8yl65KOx9aW1Rb3d081oTA07UiY+7rZqv5zqKc=
X-Google-Smtp-Source: ABdhPJw6LkLE2V7hP3qLO1wLiNAPy7ATHHmfll+3/0VMh2vawhKNusjdY5+TIQCCeZDLy0xHWG2KAPPjKyuQZili/vY=
X-Received: by 2002:ac8:d4f:: with SMTP id r15mr14045947qti.289.1615050236964;
 Sat, 06 Mar 2021 09:03:56 -0800 (PST)
MIME-Version: 1.0
References: <1614817826-40571-1-git-send-email-wangmy@cn.fujitsu.com> <CAMKF1sqwAAyw1spRROMWXvW_pQWmTyzB-DiOOFq-rbUPo1k1xg@mail.gmail.com>
In-Reply-To: <CAMKF1sqwAAyw1spRROMWXvW_pQWmTyzB-DiOOFq-rbUPo1k1xg@mail.gmail.com>
From: "Khem Raj" <raj.khem@gmail.com>
Date: Sat, 6 Mar 2021 09:03:29 -0800
Message-ID: <CAMKF1spKzCGewhO06yGJMSi9u3wqs_eyb4m3A7JzYKX-ipa5xQ@mail.gmail.com>
Subject: Re: [OE-core] [PATCH] vala: upgrade 0.50.3 -> 0.50.4
To: Wang Mingyu <wangmy@cn.fujitsu.com>
Cc: Patches and discussions about the oe-core layer <openembedded-core@lists.openembedded.org>
Content-Type: text/plain; charset="UTF-8"

I have sent a fix to dconf-editor
https://lists.openembedded.org/g/openembedded-devel/topic/meta_gnome_patch/81130660?p=,,,20,0,0,0::recentpostdate%2Fsticky,,,20,2,0,81130660

On Sat, Mar 6, 2021 at 7:47 AM Khem Raj <raj.khem@gmail.com> wrote:
>
> this break dconf-editor in meta-openembedded
>
> https://errors.yoctoproject.org/Errors/Details/573677/
>
> On Wed, Mar 3, 2021 at 4:33 PM Wang Mingyu <wangmy@cn.fujitsu.com> wrote:
> >
> > Signed-off-by: Wang Mingyu <wangmy@cn.fujitsu.com>
> > ---
> >  meta/recipes-devtools/vala/{vala_0.50.3.bb => vala_0.50.4.bb} | 2 +-
> >  1 file changed, 1 insertion(+), 1 deletion(-)
> >  rename meta/recipes-devtools/vala/{vala_0.50.3.bb => vala_0.50.4.bb} (50%)
> >
> > diff --git a/meta/recipes-devtools/vala/vala_0.50.3.bb b/meta/recipes-devtools/vala/vala_0.50.4.bb
> > similarity index 50%
> > rename from meta/recipes-devtools/vala/vala_0.50.3.bb
> > rename to meta/recipes-devtools/vala/vala_0.50.4.bb
> > index 302f562549..4381635517 100644
> > --- a/meta/recipes-devtools/vala/vala_0.50.3.bb
> > +++ b/meta/recipes-devtools/vala/vala_0.50.4.bb
> > @@ -2,4 +2,4 @@ require ${BPN}.inc
> >
> >  SRC_URI += " file://0001-vapigen.m4-use-PKG_CONFIG_SYSROOT_DIR.patch"
> >
> > -SRC_URI[sha256sum] = "6165c1b42beca4856e2fb9a31c5e81949d76fa670e2f0cfc8389ce9b95eca5db"
> > +SRC_URI[sha256sum] = "58fc31fa8bf492035b11d1a7d514801710afc65bd458b24c0f8d00280a92a38c"
> > --
> > 2.25.1
> >
> >
> > 
> >
