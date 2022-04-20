Return-Path: <raj.khem@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 35E9DC63713
	for <webhook@archiver.kernel.org>; Thu, 21 Apr 2022 16:46:09 +0000 (UTC)
Received: from mail-qt1-f179.google.com (mail-qt1-f179.google.com
 [209.85.160.179])
 by mx.groups.io with SMTP id smtpd.web10.9164.1650469008743701075
 for <openembedded-core@lists.openembedded.org>;
 Wed, 20 Apr 2022 08:36:48 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20210112 header.b=PvLqCFRT;
 spf=pass (domain: gmail.com, ip: 209.85.160.179,
 mailfrom: raj.khem@gmail.com)
Received: by mail-qt1-f179.google.com with SMTP id hf18so1248573qtb.0
        for <openembedded-core@lists.openembedded.org>;
 Wed, 20 Apr 2022 08:36:48 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=W7XBJ3wmX3H8hSjBfvjgT9i6wWc3Y+1bMCwdmWzUR3Q=;
        b=PvLqCFRTSjuPV/Bi1gIC6h+S82XKDzSuVuXy0/BbocEgpEHDSnapdzLgvxGTDlyk8Q
         CxECjMUM/it35c6brBbqQ08fDT+Sg8uU47w/DewZR8otoGxLsU6/HZo3pNz3noTagPfg
         vhWHpeBXx3m6rcJysd+vHkEE7/CVH/mblDfOEBHx3r+d+e+riGLh7D4YGNG1phMf4o8H
         41kYmxe/XhR8YVgkwu32i9SU3FZhKfmxXFhyFGi1yBFgAmNWaKf3EWRLflNiwRJgv/Zr
         sbwIzZVK7fe0xu/R0OAFZMXd9dgtjz0CfnbaHjuAFO58wHqRn/p5rnC8Ak95wr6HyEJt
         9ynA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=W7XBJ3wmX3H8hSjBfvjgT9i6wWc3Y+1bMCwdmWzUR3Q=;
        b=jL3v7msKRhZHj1Ckkq0quTRVoEZ5J78ghTT6iiCODfWGZ0wNzfad4HLniqatS1gtcm
         Jqtx9/pB5Sk2z17Xfk1vlJPf9s+4+9C3/+gKLdh9ASkkLNvTS+8z18mYyxeA0mxRm2V9
         q785GjPWSrQPdSQCVkaylWsZnVDdWRdKr164dAo+eMLL3+06QsPk8HaaCOMjJZ1Wi1cS
         /hDRXXfTLe2M51QX5Gvm+G4aMtznuLAL/vgKCzme9XTjJYtuVk1sd+FidEcFCQ0s3VU2
         c41hO3xUBmU1lItS2VSpovyaAOB4yQNz2VEttJgxkGRFujCsgR24vSTS29HJoxSveRYN
         fTQg==
X-Gm-Message-State: AOAM533BiXj/+6+JUXgSxvz3qmZV4FNXkNO+keAna/UPhxJ7brZo5URx
	uxtzNQsYhB+M2A5UmCEySSaWOhbAGUWPO0eqtWk=
X-Google-Smtp-Source: 
 ABdhPJwFGngijnKN6+/X452MRmuTs3/Bl6kOTOMVflx3r4RI2w1v2iE0Tz0oQ1v77Ogc9FLhouBeNttUgXEXrJflc3M=
X-Received: by 2002:ac8:5ad1:0:b0:2f1:f29b:7371 with SMTP id
 d17-20020ac85ad1000000b002f1f29b7371mr14301505qtd.330.1650469007672; Wed, 20
 Apr 2022 08:36:47 -0700 (PDT)
MIME-Version: 1.0
References: <20220420151725.468761-1-andrei@gherzan.com>
In-Reply-To: <20220420151725.468761-1-andrei@gherzan.com>
From: Khem Raj <raj.khem@gmail.com>
Date: Wed, 20 Apr 2022 08:36:21 -0700
Message-ID: 
 <CAMKF1so-iefcUsTqSjLSGjo8oEPr3brLfy=Jm+e2Uj4zC7cjnA@mail.gmail.com>
Subject: Re: [OE-core] [PATCH 1/1] automake: Drop redundant 'u' flag in
 ARFLAGS
To: Andrei Gherzan <andrei@gherzan.com>
Cc: Patches and discussions about the oe-core layer
 <openembedded-core@lists.openembedded.org>,
	Andrei Gherzan <andrei.gherzan@huawei.com>
Content-Type: text/plain; charset="UTF-8"
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 21 Apr 2022 16:46:09 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/164705

On Wed, Apr 20, 2022 at 8:17 AM Andrei Gherzan <andrei@gherzan.com> wrote:
>
> From: Andrei Gherzan <andrei.gherzan@huawei.com>
>
> Signed-off-by: Andrei Gherzan <andrei.gherzan@huawei.com>
> ---
>  .../automake/0001-Drop-ar-u-argument.patch    | 32 +++++++++++++++++++
>  .../automake/automake_1.16.5.bb               |  1 +
>  2 files changed, 33 insertions(+)
>  create mode 100644 meta/recipes-devtools/automake/automake/0001-Drop-ar-u-argument.patch
>
> diff --git a/meta/recipes-devtools/automake/automake/0001-Drop-ar-u-argument.patch b/meta/recipes-devtools/automake/automake/0001-Drop-ar-u-argument.patch
> new file mode 100644
> index 0000000000..260c51f517
> --- /dev/null
> +++ b/meta/recipes-devtools/automake/automake/0001-Drop-ar-u-argument.patch
> @@ -0,0 +1,32 @@
> +From bed646918bc67e9e2151ccbda03aae34717821fe Mon Sep 17 00:00:00 2001
> +From: Andrei Gherzan <andrei.gherzan@huawei.com>
> +Date: Wed, 20 Apr 2022 14:57:14 +0200
> +Subject: [PATCH] Drop ar 'u' argument
> +
> +binutils/ar is configured in deterministic mode by default making the
> +'u' argument irrelevant while leading to warning massages similar to:
> +
> +| ar: `u' modifier ignored since `D' is the default (see `U')
> +

this is perhaps due to the way we build binutils and I am fine with
removing -u here but
I think the patch is OE specific. While you are here can you add -D
explicitly, because we
do have option to use llvm ar and it would help those distributions to
create reproducible archives too.

> +Upstream-Status: Pending
> +Signed-off-by: Andrei Gherzan <andrei.gherzan@huawei.com>
> +---
> + bin/automake.in | 2 +-
> + 1 file changed, 1 insertion(+), 1 deletion(-)
> +
> +diff --git a/bin/automake.in b/bin/automake.in
> +index 92bcebe..0f2b84b 100644
> +--- a/bin/automake.in
> ++++ b/bin/automake.in
> +@@ -2678,7 +2678,7 @@ sub handle_libraries ()
> +     }
> +
> +   define_variable ('AR', 'ar', INTERNAL);
> +-  define_variable ('ARFLAGS', 'cru', INTERNAL);
> ++  define_variable ('ARFLAGS', 'cr', INTERNAL);
> +   define_verbose_tagvar ('AR');
> +
> +   foreach my $pair (@liblist)
> +--
> +2.25.1
> +
> diff --git a/meta/recipes-devtools/automake/automake_1.16.5.bb b/meta/recipes-devtools/automake/automake_1.16.5.bb
> index ba5ce7b9bb..469fcd69f7 100644
> --- a/meta/recipes-devtools/automake/automake_1.16.5.bb
> +++ b/meta/recipes-devtools/automake/automake_1.16.5.bb
> @@ -25,6 +25,7 @@ SRC_URI += "\
>             file://new_rt_path_for_test-driver.patch \
>             file://0001-automake-Add-default-libtool_tag-to-cppasm.patch \
>             file://0001-build-fix-race-in-parallel-builds.patch \
> +           file://0001-Drop-ar-u-argument.patch \
>             "
>
>  SRC_URI[sha256sum] = "07bd24ad08a64bc17250ce09ec56e921d6343903943e99ccf63bbf0705e34605"
> --
> 2.25.1
>
>
> -=-=-=-=-=-=-=-=-=-=-=-
> Links: You receive all messages sent to this group.
> View/Reply Online (#164702): https://lists.openembedded.org/g/openembedded-core/message/164702
> Mute This Topic: https://lists.openembedded.org/mt/90586101/1997914
> Group Owner: openembedded-core+owner@lists.openembedded.org
> Unsubscribe: https://lists.openembedded.org/g/openembedded-core/unsub [raj.khem@gmail.com]
> -=-=-=-=-=-=-=-=-=-=-=-
>

