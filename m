Return-Path: <raj.khem@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 7FF2AC25B7E
	for <webhook@archiver.kernel.org>; Thu, 30 May 2024 17:41:56 +0000 (UTC)
Received: from mail-oo1-f47.google.com (mail-oo1-f47.google.com [209.85.161.47])
 by mx.groups.io with SMTP id smtpd.web10.3251.1717090915083209652
 for <openembedded-core@lists.openembedded.org>;
 Thu, 30 May 2024 10:41:55 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=OUehuXLW;
 spf=pass (domain: gmail.com, ip: 209.85.161.47, mailfrom: raj.khem@gmail.com)
Received: by mail-oo1-f47.google.com with SMTP id 006d021491bc7-5b96b249d56so534170eaf.1
        for <openembedded-core@lists.openembedded.org>; Thu, 30 May 2024 10:41:55 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1717090914; x=1717695714; darn=lists.openembedded.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=eNpiOcnOL5lwp4qnmm94zGeyCNNiUB0DgbQWaFJ+KvY=;
        b=OUehuXLWsX3/7bgZzqCZgF3XiFdCdzYcMi3I72Uv/ZpA/xwbQ4OKhEMEvwk4kAIi2d
         JzuYsPIKu+gHyOXFQvBbi2cMK51Qgk4OMke7Bg8EhbZNB3vw0+1HEpv5OWU/ljkg4Obl
         eLyS7c/pE+FAftSj820By6Fg+/megHnOBXyFVJPMU5sfPnshmYboF1wWhULujb6YsCBX
         giThQtjgGsyLriynishAIoTItoFKTaal2YBtAfAT8q6uBp+oQepuTebyzBW1ZpB4t2uM
         v6nH6gojEJ86NqQZbG9fDjmc3/G/dGVGhX/9mVdL+S4J3BXGI1kBPbcy/4UNZfLxr8Sk
         NAbA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1717090914; x=1717695714;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=eNpiOcnOL5lwp4qnmm94zGeyCNNiUB0DgbQWaFJ+KvY=;
        b=YRe+P9i+8xb0ut6aC+7bp/df8JhzV6xNna2q8kanPdvB+lO5XcquPXVl612kZqBkX6
         HDQMLV2peOP4ohCwSJa9OkcE1Mv0Nc7rGyqRTuaO4t9wbyLKg9MocL027bdRlkgi898n
         r1F4vapa+Klq5I/tCIG/PbI3SFq+SNEQRcJNHl9mwtnjAoGtsQc1FZK2GLaqybhoiAmp
         Ab1f4HO/cifDDf7KWy//GqLuQb2CsPRk57N5CEoLVbQTzcTiV5gFt1h7f9pLu83325r1
         dp4ZB+pFo0XGrj+sdqnr4eJhCWXXWc82ncSETN8ntevreeOM9RvEkSBBvcLYgPrB3Qs9
         CpMg==
X-Gm-Message-State: AOJu0YymcIYaYYdX5oNilqaARdYQ1GlIPvpMVvpldzfp0aPnMLgTXMex
	DIAzYTCm62vI/4dL4fzWlokFdyeH5KS52p+pPliDgqJjfDTiPD7UbiBQeQbAqo8rTR7fg6rl1u2
	ve/vLCABgHO+kTZ8XVTaQO6xo0/+OsMJ3NYjCVQ==
X-Google-Smtp-Source: AGHT+IGwzumd6KPyQsOj+EVBMk6Ba6LL2Bv/qvA83ylj7bbG1RA21ICHQgFJb3HJJcckipLpCYAxWoW30CvfXjAaX6g=
X-Received: by 2002:a05:6870:219e:b0:24f:c0da:3d4e with SMTP id
 586e51a60fabf-25065b2248dmr1053656fac.2.1717090914138; Thu, 30 May 2024
 10:41:54 -0700 (PDT)
MIME-Version: 1.0
References: <20240530164355.3294714-1-dmitry.baryshkov@linaro.org>
In-Reply-To: <20240530164355.3294714-1-dmitry.baryshkov@linaro.org>
From: Khem Raj <raj.khem@gmail.com>
Date: Thu, 30 May 2024 10:41:28 -0700
Message-ID: <CAMKF1so3N92kUUnR9HACZYWw3YBq2P+fT5VPaLH_VMO5va-4zA@mail.gmail.com>
Subject: Re: [OE-core] [PATCH] site/x86_64-linux: add ac_cv_func_fnmatch_works
To: dbaryshkov@gmail.com
Cc: openembedded-core@lists.openembedded.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 30 May 2024 17:41:56 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/200037

On Thu, May 30, 2024 at 9:44=E2=80=AFAM Dmitry Baryshkov via
lists.openembedded.org <dbaryshkov=3Dgmail.com@lists.openembedded.org>
wrote:
>
> Other arch-specific caches have ac_cv_func_fnmatch_works. Add it to
> x86_64 cache too, otherwise cabextract fails to build ([1])
>
> [1] https://autobuilder.yoctoproject.org/typhoon/#/builders/88/builds/389=
3/steps/14/logs/stdio
>
> Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
> ---
>  meta/site/x86_64-linux | 3 +++
>  1 file changed, 3 insertions(+)
>
> diff --git a/meta/site/x86_64-linux b/meta/site/x86_64-linux
> index b9ee141fd5c5..ed9c88fa20f7 100644
> --- a/meta/site/x86_64-linux
> +++ b/meta/site/x86_64-linux
> @@ -83,3 +83,6 @@ ac_cv_func__restgpr_14_x=3Dno
>
>  # cvs
>  cvs_cv_func_printf_ptr=3D${cvs_cv_func_printf_ptr=3Dyes}
> +
> +# cabextract
> +ac_cv_func_fnmatch_works=3D${ac_cv_func_fnmatch_works=3Dyes}

I think it will be good to document the underlying reason for this test to
fail during the autoconf run. It seems to trying fnmatch replacement,
but then fails to do
it properly.

> --
> 2.39.2
>
>
> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
> Links: You receive all messages sent to this group.
> View/Reply Online (#200033): https://lists.openembedded.org/g/openembedde=
d-core/message/200033
> Mute This Topic: https://lists.openembedded.org/mt/106392140/1997914
> Group Owner: openembedded-core+owner@lists.openembedded.org
> Unsubscribe: https://lists.openembedded.org/g/openembedded-core/unsub [ra=
j.khem@gmail.com]
> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
>

