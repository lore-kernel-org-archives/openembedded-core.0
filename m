Return-Path: <alex.kanavin@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 27172C4345F
	for <webhook@archiver.kernel.org>; Thu, 18 Apr 2024 05:37:21 +0000 (UTC)
Received: from mail-lj1-f176.google.com (mail-lj1-f176.google.com [209.85.208.176])
 by mx.groups.io with SMTP id smtpd.web11.5986.1713418639348966548
 for <openembedded-core@lists.openembedded.org>;
 Wed, 17 Apr 2024 22:37:19 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=he1h6Xwl;
 spf=pass (domain: gmail.com, ip: 209.85.208.176, mailfrom: alex.kanavin@gmail.com)
Received: by mail-lj1-f176.google.com with SMTP id 38308e7fff4ca-2dac77cdf43so6147101fa.2
        for <openembedded-core@lists.openembedded.org>; Wed, 17 Apr 2024 22:37:19 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1713418637; x=1714023437; darn=lists.openembedded.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=z5cjMxYbSFa+8X12RmjVSc/5RKAp0HCydD/OcNoSPpo=;
        b=he1h6Xwlgei467xrKnkOFgywoBCPnN7/4VWV+eJopJNl8RNXzuV7hCJz2tLjsgDska
         DIBPjcv+ZSfoyqn3OCZkcxGQroKep5Ew/ejeg9IcZ7VcDSh5TeWKP+QIhlpWnxcHzpXo
         u46R2iwBgvXS25nZCAOIfB9+FT1zIxslyI44TfB/CAs/wTo+emr1p6E1R+LcmZtCehkK
         TA/Vp/HFHTCA1NyP5J0ASeDcxfDSqePye0yUhVqWE6dTA6lydEk1hfx9Tes1pN9vaTxL
         y9g57NRm8BDhZ1xTgBD5DUAR09sIK+5LlM8F6hB2GZXh21X9dSap5rSFRypbObAdT2Ar
         5I+A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1713418637; x=1714023437;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=z5cjMxYbSFa+8X12RmjVSc/5RKAp0HCydD/OcNoSPpo=;
        b=NBr7pXt56h+YaT7DPjf5ciTwA3S9mAGS1EExVEYms49uY/Q+5fkc3jBzyvuKsIuXqR
         8E4cWPzzGfGdRVyyP/EEL1FfexndA3nU07ntfA+lC/bOhz1CptarU+UHpRPUcqjPxffM
         bATsHmb6zF7DTQp6kl28RI4EYftVjhZougZ3So9tcqvsFwefBYt/9Uc1OTzbuzyGMcR2
         FBOtzOOeIIN4RQ6dAeMpvNheNKgQfr5XGNwQgiPYfZQF1kzyT8JLvIXtK9Rw1xhdy/Iq
         D2tJWsIbd0qicdRukd+ZPPaLW6ZPrKpW5Fj8RfNebGH3nmctll9U1o0NFQZUYcuRKuHP
         qC4g==
X-Gm-Message-State: AOJu0Yxq+Phlv1zvIUSx4pet/TenjndZT/EwSMYwVou5UUColsccrSAR
	Ijs4GqbM5YvdDB50zaNqib0HYkXnT5KZAZ2B+zFbDQWuwqhD7JtJOwMrpe51hyJek2aFFyzTLpo
	UEh0vOfMgeH4SZLZ60qggDoRNrMY=
X-Google-Smtp-Source: AGHT+IGVbNrVx/DFMLE5ErpMtwE1JWE97BMT3BqDVWAuXoSvYsaevTGsVkQlLZ2JFthxW2A6JmPUWfTO1BQAYSDy424=
X-Received: by 2002:a2e:9d86:0:b0:2d8:841:f64b with SMTP id
 c6-20020a2e9d86000000b002d80841f64bmr854222ljj.39.1713418637044; Wed, 17 Apr
 2024 22:37:17 -0700 (PDT)
MIME-Version: 1.0
References: <20240417222826.3549176-1-jdmason@kudzu.us> <20240417222826.3549176-2-jdmason@kudzu.us>
In-Reply-To: <20240417222826.3549176-2-jdmason@kudzu.us>
From: Alexander Kanavin <alex.kanavin@gmail.com>
Date: Thu, 18 Apr 2024 07:37:05 +0200
Message-ID: <CANNYZj9FBaNo4bWB1=1FvQ6Gv9vKemDS4fJQrLm4sEiJJ=chag@mail.gmail.com>
Subject: Re: [OE-core] [PATCH 2/2] liba52: remove UPSTREAM_CHECK_URI
To: jdmason@kudzu.us
Cc: openembedded-core@lists.openembedded.org
Content-Type: text/plain; charset="UTF-8"
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 18 Apr 2024 05:37:21 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/198498

I have actually queued a patch to remove this recipe altogether. It's
a dead project, and superseded by ffmpeg long time ago.

Alex

On Thu, 18 Apr 2024 at 00:28, Jon Mason via lists.openembedded.org
<jdmason=kudzu.us@lists.openembedded.org> wrote:
>
> UPSTREAM_CHECK_URI pointed to a URL that does not exist, causing
> UNKNOWN_BROKEN error when running `devtool check-upgrade-status`.
> There doesn't appear to be a way to check on sourceforge for new
> versions (and there hasn't been a new version in over a decade at this
> point).  There is a way to use CVS, but sourceforge is decommissioning
> CVS (and it doesn't make sense to switch to something that is being
> removed).  So, just doing UPSTREAM_VERSION_UNKNOWN.
>
> Signed-off-by: Jon Mason <jdmason@kudzu.us>
> ---
>  meta/recipes-multimedia/liba52/liba52_0.7.4.bb | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
>
> diff --git a/meta/recipes-multimedia/liba52/liba52_0.7.4.bb b/meta/recipes-multimedia/liba52/liba52_0.7.4.bb
> index 684dd590ca15..d52310b8ca92 100644
> --- a/meta/recipes-multimedia/liba52/liba52_0.7.4.bb
> +++ b/meta/recipes-multimedia/liba52/liba52_0.7.4.bb
> @@ -16,7 +16,7 @@ SRC_URI = "https://sourceforge.net/projects/liba52/files/a52dec-${PV}.tar.gz \
>  SRC_URI[md5sum] = "1a2e77b4f7aacd858961a6b727710551"
>  SRC_URI[sha256sum] = "c1931bc511dc48987fdba6888be577f3035e3f0b6b81d3ea3e766fca8d18e128"
>
> -UPSTREAM_CHECK_URI = "http://liba52.sourceforge.net/downloads.html"
> +UPSTREAM_VERSION_UNKNOWN = "1"
>
>  S = "${WORKDIR}/a52dec-${PV}"
>
> --
> 2.30.2
>
>
> -=-=-=-=-=-=-=-=-=-=-=-
> Links: You receive all messages sent to this group.
> View/Reply Online (#198489): https://lists.openembedded.org/g/openembedded-core/message/198489
> Mute This Topic: https://lists.openembedded.org/mt/105587759/1686489
> Group Owner: openembedded-core+owner@lists.openembedded.org
> Unsubscribe: https://lists.openembedded.org/g/openembedded-core/unsub [alex.kanavin@gmail.com]
> -=-=-=-=-=-=-=-=-=-=-=-
>

