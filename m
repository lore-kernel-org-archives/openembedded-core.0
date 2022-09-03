Return-Path: <raj.khem@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 0AEBDECAAA1
	for <webhook@archiver.kernel.org>; Sat,  3 Sep 2022 00:11:59 +0000 (UTC)
Received: from mail-yw1-f174.google.com (mail-yw1-f174.google.com
 [209.85.128.174])
 by mx.groups.io with SMTP id smtpd.web10.5446.1662163908405923110
 for <openembedded-core@lists.openembedded.org>;
 Fri, 02 Sep 2022 17:11:48 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20210112 header.b=LxsKj00G;
 spf=pass (domain: gmail.com, ip: 209.85.128.174,
 mailfrom: raj.khem@gmail.com)
Received: by mail-yw1-f174.google.com with SMTP id
 00721157ae682-3321c2a8d4cso29817747b3.5
        for <openembedded-core@lists.openembedded.org>;
 Fri, 02 Sep 2022 17:11:48 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date;
        bh=Asf5FBDCVQoQ0lKWTsnErK+skvs0ZVFwwr9LdUBXwe8=;
        b=LxsKj00Gm7Oc1mgJtppC8ehPM8YThBKtxt4Nao06/K9AitFLuQpKZeu/CQVBGIIdP/
         AAd/2CoRIMTpqveYmMHFegSZrMNSjVjTyyMhiLuvnRprYcm3jLsAGmvJmLpjfePMNiEv
         zYoDo6c6sSWULqLAgE3BjqGKny0Y19mqPbM3L3lIH/6HymfZAA8oHbmw7oqDYHWX5s4O
         HdG2vbIe9OGI565x1sqXHafez0NNv2I7p4nEBHheYnyj8T73J3hM3LxfgSkRL2HoO/CJ
         wh0G7hC3kB8qSJ8rFpYuJ52FwWr9vysl3f29L6PPdp472ecOZf6lyd736MzOXAzitJuu
         EVcQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date;
        bh=Asf5FBDCVQoQ0lKWTsnErK+skvs0ZVFwwr9LdUBXwe8=;
        b=wVZla6rGH/gluE8ovH93bt16gkKrtMxIgPuXZMdSK/QedSym6QGUsX1I0ni9tdXeWM
         vJ9aqQmOnwxzfrJHWqdTsrO/M6DMMDHuvFfg/tUlvs82DUcPpMcN8b0Q90cWLWHiVqOA
         UTYF/frqQI+I6tVPSomeDVlTnczjz5rHgPI0b/JqDK2r/OUnQMYX45maQgYYQNkMdmAd
         4/wkiobiXzoPcWA2gp5PlOtM7i2RKyN2FjjhIAfbpbqfb4kGNVioqKvpIMR9jj3izvxJ
         +kzxGOYNZ0yiqT7xeXD5DPIRGQ7ttbtMYUdIxCyzHDBgyHW86pCU3wltKFSxxNVMgrZN
         3EFg==
X-Gm-Message-State: ACgBeo0P4cNAeTT3N3H2BlRPRnfeeYUZE8YEFKJznwZSj2RObOOtCTXZ
	ftFSaVVzEWjZ0JnXC92kqBl0E09Ugycle638fzU=
X-Google-Smtp-Source: 
 AA6agR6zHBQM9s+VJI0CbYqPCMeOOMU3BRqEXv2Jd7+5xfe1O/S5yJCvfBGradKiNUf/tbMkLLxYRTDqmRA/6E9rMR8=
X-Received: by 2002:a81:5945:0:b0:345:9c0:434e with SMTP id
 n66-20020a815945000000b0034509c0434emr504803ywb.162.1662163907520; Fri, 02
 Sep 2022 17:11:47 -0700 (PDT)
MIME-Version: 1.0
References: <20220902223112.972210-1-pevik@seznam.cz>
In-Reply-To: <20220902223112.972210-1-pevik@seznam.cz>
From: Khem Raj <raj.khem@gmail.com>
Date: Fri, 2 Sep 2022 17:11:21 -0700
Message-ID: 
 <CAMKF1spSQRx5zws9sMQ2S_qsR32=CRajgp01by6ZJBwpT7feQQ@mail.gmail.com>
Subject: Re: [PATCH 1/1] ltp: Update list of tests not buildable on musl
To: Petr Vorel <pevik@seznam.cz>
Cc: openembedded-core@lists.openembedded.org,
	Petr Vorel <petr.vorel@gmail.com>,
 Richard Purdie <richard.purdie@linuxfoundation.org>,
	=?UTF-8?B?RGFuaWVsIETDrWF6?= <daniel.diaz@linaro.org>
Content-Type: text/plain; charset="UTF-8"
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Sat, 03 Sep 2022 00:11:59 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/170265

On Fri, Sep 2, 2022 at 3:31 PM Petr Vorel <pevik@seznam.cz> wrote:
>
> From: Petr Vorel <petr.vorel@gmail.com>
>
> These tests are working on musl, thus not deleted:
>
> * getcontext01.c
> fixed for musl during conversion to the new API in 20220527
> (commit 0f519d0da)
>
> * ebizzy-0.3
> fixed in 20200930 (commit 967612c45)
>


lgtm

> Signed-off-by: Petr Vorel <petr.vorel@gmail.com>
> ---
>  meta/recipes-extended/ltp/ltp_20220527.bb | 4 +---
>  1 file changed, 1 insertion(+), 3 deletions(-)
>
> diff --git a/meta/recipes-extended/ltp/ltp_20220527.bb b/meta/recipes-extended/ltp/ltp_20220527.bb
> index 00ff906ded..b657a6adb1 100644
> --- a/meta/recipes-extended/ltp/ltp_20220527.bb
> +++ b/meta/recipes-extended/ltp/ltp_20220527.bb
> @@ -150,13 +150,11 @@ remove_broken_musl_sources() {
>         # sync with upstream
>         # https://github.com/linux-test-project/ltp/blob/master/ci/alpine.sh#L33
>         rm -rfv \
> -               testcases/kernel/syscalls/confstr/confstr01.c \
>                 testcases/kernel/syscalls/fmtmsg/fmtmsg01.c \
>                 testcases/kernel/syscalls/getcontext/getcontext01.c \
>                 testcases/kernel/syscalls/rt_tgsigqueueinfo/rt_tgsigqueueinfo01.c \
>                 testcases/kernel/syscalls/timer_create/timer_create01.c \
> -               testcases/kernel/syscalls/timer_create/timer_create03.c \
> -               utils/benchmark/ebizzy-0.3
> +               testcases/kernel/syscalls/timer_create/timer_create03.c
>  }
>  do_patch[postfuncs] += "remove_broken_musl_sources"
>
> --
> 2.37.2
>

