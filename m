Return-Path: <raj.khem@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 962C1C47093
	for <webhook@archiver.kernel.org>; Thu,  7 Apr 2022 20:36:09 +0000 (UTC)
Received: from mail-qk1-f169.google.com (mail-qk1-f169.google.com
 [209.85.222.169])
 by mx.groups.io with SMTP id smtpd.web11.3516.1649362058194391952
 for <openembedded-core@lists.openembedded.org>;
 Thu, 07 Apr 2022 13:07:38 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20210112 header.b=h2ZHlkiA;
 spf=pass (domain: gmail.com, ip: 209.85.222.169,
 mailfrom: raj.khem@gmail.com)
Received: by mail-qk1-f169.google.com with SMTP id bk12so3141841qkb.7
        for <openembedded-core@lists.openembedded.org>;
 Thu, 07 Apr 2022 13:07:38 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc:content-transfer-encoding;
        bh=pWqtT6Mn/0XmuZpqv1kiHAb2f6yJ6c14TIqBEzf3Nik=;
        b=h2ZHlkiAX+tDE3bKAmSJ2+1OWFlk1PfExxsSnq8oYbYWeVE/WK0Fz/t7oY45xegvK3
         j+edQVbaiHMgMCdHL7X5y+F8W3Sz28BXvO9t8xU9YkBEFXGq4c+t9FnLSmykWsZL45UE
         vpKTG3cSn64zhT+NdixHCCmHDHJu8D8e9adymkZ6Vje2EBBXqX6O5SegdgCN+kcyp4E2
         VSJTT4fXh17BCeun4xPnZYJNKgiLhNwAXFqTM8eW/m0qMZs3ZNJmZw/rJ4SZ2zoDQREd
         A8hYCbRqxIx9Pvw5iQKjwhY4HOvFdVcmzleKZyggN9ClyPEqBYy9Gi6BWLgxqlIWngzb
         ZfBQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc:content-transfer-encoding;
        bh=pWqtT6Mn/0XmuZpqv1kiHAb2f6yJ6c14TIqBEzf3Nik=;
        b=3uNsKAAWRMHB3yj6vnRz7zYpZeKIYhE8tBr5hF97bSpNjGskbRezXWyGIYTK5b+aI/
         5wKQVoGpk19MqfJefSQ8Q9Yan4vd96WItXrVm9dZyTwaK45UhMvUlJbpVmydMTflwQmj
         184pFhNOeAaAJvhHgQqCa88KKWDF0xgHbcG7jhgz7fX2RCiXmRAgU0cDy37FvGSckGTg
         /A3LWpZ7obdjLZ64am8iNVoRSWUdWixx2Ivrz204eVZxlI5CLD0mXAttQYo/2I/k35O4
         +LU0dJYlUeaexq6XDWNAFt+aQnWQJRrdlUvazBAV8eWdazM9B7qJclzlQlI+gsSj5p4S
         kgFg==
X-Gm-Message-State: AOAM530iX4JgzI3/md6ZnMM4IhHecUiUarIPGf9XU1pzF3AlABEMXmhq
	qYrchTXbitqio9v0oCqOaAT/WoG//ceBAmjxJkYG0J9M3Sl0Ew==
X-Google-Smtp-Source: 
 ABdhPJxu7vHuamEmZgQ+VDW0RtrCo7TX4jPXpmoEOMoEhSwoNIromdpkyafUexBj+9tuGICnpyBZ4rYGOdYidMQ4+6g=
X-Received: by 2002:a05:620a:2982:b0:67d:6c77:b427 with SMTP id
 r2-20020a05620a298200b0067d6c77b427mr10715397qkp.149.1649362057243; Thu, 07
 Apr 2022 13:07:37 -0700 (PDT)
MIME-Version: 1.0
References: 
 <ab842b2db53d29b11298382f7c94b8ef903ea1f1.camel@linuxfoundation.org>
 <23864.1649338154287208609@lists.openembedded.org>
In-Reply-To: <23864.1649338154287208609@lists.openembedded.org>
From: Khem Raj <raj.khem@gmail.com>
Date: Thu, 7 Apr 2022 16:07:11 -0400
Message-ID: 
 <CAMKF1sokARC6AkxCuVCXVnXYOSCiOCgfw_=LCGBn4gh4xy4-CQ@mail.gmail.com>
Subject: Re: [OE-core] [PATCH] gcc: upgrade 11.2 -> current 12 snapshot
To: =?UTF-8?Q?Bernhard_Rosenkr=C3=A4nzer?=
 <bernhard.rosenkraenzer.ext@huawei.com>
Cc: Patches and discussions about the oe-core layer
 <openembedded-core@lists.openembedded.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 07 Apr 2022 20:36:09 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/164145

I carry patches all OE patches in my gcc tree as well here

https://github.com/kraj/gcc/tree/oe/master

which would be good to seed the changes.

On Thu, Apr 7, 2022 at 9:29 AM Bernhard Rosenkr=C3=A4nzer via
lists.openembedded.org
<bernhard.rosenkraenzer.ext=3Dhuawei.com@lists.openembedded.org> wrote:
>
> On Thu, Apr 7, 2022 at 02:32 PM, Richard Purdie wrote:
>
> On Thu, 2022-04-07 at 14:26 +0200, Bernhard Rosenkr=C3=A4nzer via
> lists.openembedded.org wrote:
>
> rename from meta/recipes-devtools/gcc/gcc-cross-canadian_11.2.bb
> rename to meta/recipes-devtools/gcc/gcc-cross-canadian_12.0.bb
> diff --git a/meta/recipes-devtools/gcc/gcc-cross.inc b/meta/recipes-devto=
ols/gcc/gcc-cross.inc
> index 3ffa1f0c46..0e8119384b 100644
> --- a/meta/recipes-devtools/gcc/gcc-cross.inc
> +++ b/meta/recipes-devtools/gcc/gcc-cross.inc
> @@ -47,6 +47,15 @@ ARCH_FLAGS_FOR_TARGET +=3D "-isystem${STAGING_DIR_TARG=
ET}${target_includedir}"
> do_configure:prepend () {
> install -d ${RECIPE_SYSROOT}${target_includedir}
> touch ${RECIPE_SYSROOT}${target_includedir}/limits.h
> +
> + if ! echo ${@d.getVar("TARGET_OS")} | grep -qi linux; then
> + # Building Zephyr with DWARF-5 is problematic because
> + # its kernel tests use pyelftools, which has incomplete
> + # DWARF-5 support (even after applying preliminary
> + # support patches). Use DWARF-4 on Zephyr and FreeRTOS
> + # for the time being.
> + sed -i -e 's,Var(dwarf_version) Init(5),Var(dwarf_version) Init(4),' ${=
S}/gcc/common.opt
> + fi
> }
>
> do_compile () {
>
> Unfortunately you can't do that. The gcc-cross is shared amongst all targ=
ets on
> a given architecture. This will "kind of work" in that other sstate code =
will
> clean it up and rebuild gcc but it isn't as designed and can't merge like=
 that
> I'm afraid.
>
> True, didn't think of that. I've backed out this part and sent a new patc=
h. Will address the zephyr problem with an added -gdwarf-4 flag in zephyr c=
onfigs.
>
> ttyl
> bero
> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
> Links: You receive all messages sent to this group.
> View/Reply Online (#164108): https://lists.openembedded.org/g/openembedde=
d-core/message/164108
> Mute This Topic: https://lists.openembedded.org/mt/90311375/1997914
> Group Owner: openembedded-core+owner@lists.openembedded.org
> Unsubscribe: https://lists.openembedded.org/g/openembedded-core/unsub [ra=
j.khem@gmail.com]
> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
>

