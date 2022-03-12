Return-Path: <raj.khem@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 3607CC433F5
	for <webhook@archiver.kernel.org>; Sat, 12 Mar 2022 16:41:23 +0000 (UTC)
Received: from mail-qk1-f178.google.com (mail-qk1-f178.google.com
 [209.85.222.178])
 by mx.groups.io with SMTP id smtpd.web09.6336.1647103282007898336
 for <openembedded-core@lists.openembedded.org>;
 Sat, 12 Mar 2022 08:41:22 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20210112 header.b=KhM3wd/k;
 spf=pass (domain: gmail.com, ip: 209.85.222.178,
 mailfrom: raj.khem@gmail.com)
Received: by mail-qk1-f178.google.com with SMTP id v13so8961432qkv.3
        for <openembedded-core@lists.openembedded.org>;
 Sat, 12 Mar 2022 08:41:21 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=OlOr+ulAT/NN9Foas6Ki3Jhc/L+6DYC8UqgQ8qWKF8Q=;
        b=KhM3wd/kpVT4C6MTSTkNslWwYHKOmu5OrChp6haq2KKEXHUOKl+ml/QidnHsMOaXxK
         tNuiGdvf5MbEsYci5E4FncBiVDudPcyFNM+llWrzuN2VL9SKyxL3EkvJrP0EtKSBJLq8
         rOYEtxTFOi8kMpDa+DXbDcnAoGIakN5SquZoyjBjEHJY1PUVfMOY0f2DLt7KFdOH+my2
         6Yfvi5FZe2lCChBTktk7xOLe3hcD2bn2df1Gu1trbvBwOJD1jXYa5r6n91pi26OCm82M
         /MpY933aJSpzOVDZhXpD4V0oKM1uedlbEtiOQC1n4rksc1E3W9/X5VD6QMfxkhD3lRS4
         WoIQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=OlOr+ulAT/NN9Foas6Ki3Jhc/L+6DYC8UqgQ8qWKF8Q=;
        b=YOHZQzSCyKGk7Kh1+E5CrxBXARB9UwhPrThyilZCnpFpXs9xKjoPNxk1gaMBn27TQ6
         abeQqwJuxBhbpOiWxl5a2aXNXdbrG1aO8lWhtJlO7bMp+WTsBCdbENGl0y2EeRVpa0Eb
         Hkc2RnZaxnodleju3RT1zO8IQJmstTiia2A2tR7YWblQYL1drE6xnmVLzYaUuEVTJHVe
         4bTw8SVrFYN2TQ83LllCW4mwb+5455iu45/bO88GP4YRc3fhWhXadAFKHba2ptHpVwSH
         9kTN0r7cMF7gLvE8/wwNUdyVr5+xJmi4mdNGVAumtozsVlLOnlZ8BJNsPNy3grNRv9Ji
         xT7w==
X-Gm-Message-State: AOAM5330zKnJ0+W/DloDbqyky/3jILUrTHi5QVZVutE7GozHzw/HHmlW
	HjA9VA22CqR8yXpO2PsEBkFXFVAEssguw0LNQ+0=
X-Google-Smtp-Source: 
 ABdhPJz/XlKfFZcOPFD4q+Bfp7RuC38W1rXHkLjeVPWtYd+JB6BjdJyGeAosXA15GI2RpNA3YogllsXfHYIQ5N8d07U=
X-Received: by 2002:a05:620a:4103:b0:67b:49f4:3ee4 with SMTP id
 j3-20020a05620a410300b0067b49f43ee4mr10261974qko.72.1647103280982; Sat, 12
 Mar 2022 08:41:20 -0800 (PST)
MIME-Version: 1.0
References: <20220311171206.41094-1-ross.burton@arm.com>
In-Reply-To: <20220311171206.41094-1-ross.burton@arm.com>
From: Khem Raj <raj.khem@gmail.com>
Date: Sat, 12 Mar 2022 08:40:55 -0800
Message-ID: 
 <CAMKF1so=5Nf=-trZpcH8XNoFgduw0KGZgO_Z5J6jDs4scWgwnQ@mail.gmail.com>
Subject: Re: [OE-core] [PATCH] python_pep517: move PEP517_SOURCE_PATH to
 python_pep517
To: Ross Burton <ross@burtonini.com>
Cc: Patches and discussions about the oe-core layer
 <openembedded-core@lists.openembedded.org>
Content-Type: text/plain; charset="UTF-8"
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Sat, 12 Mar 2022 16:41:23 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/163095

seeing this

https://autobuilder.yoctoproject.org/typhoon/#/builders/88/builds/1517

On Fri, Mar 11, 2022 at 9:12 AM Ross Burton <ross@burtonini.com> wrote:
>
> Now we have the start of a PEP-517 base class, the PEP517_SOURCE_PATH
> variable can be defined in there instead of the classes that use it.
>
> Signed-off-by: Ross Burton <ross.burton@arm.com>
> ---
>  meta/classes/flit_core.bbclass             | 3 ---
>  meta/classes/python_pep517.bbclass         | 3 +++
>  meta/classes/setuptools_build_meta.bbclass | 3 ---
>  3 files changed, 3 insertions(+), 6 deletions(-)
>
> diff --git a/meta/classes/flit_core.bbclass b/meta/classes/flit_core.bbclass
> index 1ef8ce9429..5a602f54ab 100644
> --- a/meta/classes/flit_core.bbclass
> +++ b/meta/classes/flit_core.bbclass
> @@ -6,9 +6,6 @@ flit_core_do_configure () {
>      :
>  }
>
> -# Where to execute the build process from
> -PEP517_SOURCE_PATH ?= "${S}"
> -
>  # TODO: ideally this uses pypa/build
>  flit_core_do_compile () {
>      cd ${PEP517_SOURCE_PATH}
> diff --git a/meta/classes/python_pep517.bbclass b/meta/classes/python_pep517.bbclass
> index 76660e70f8..756333bcf2 100644
> --- a/meta/classes/python_pep517.bbclass
> +++ b/meta/classes/python_pep517.bbclass
> @@ -3,6 +3,9 @@
>
>  DEPENDS:append = " python3-pip-native"
>
> +# Where to execute the build process from
> +PEP517_SOURCE_PATH ?= "${S}"
> +
>  # The directory where wheels should be written too. Build classes
>  # will ideally [cleandirs] this but we don't do that here in case
>  # a recipe wants to install prebuilt wheels.
> diff --git a/meta/classes/setuptools_build_meta.bbclass b/meta/classes/setuptools_build_meta.bbclass
> index 424be85608..8791a2965f 100644
> --- a/meta/classes/setuptools_build_meta.bbclass
> +++ b/meta/classes/setuptools_build_meta.bbclass
> @@ -2,9 +2,6 @@ inherit setuptools3-base python_pep517
>
>  DEPENDS += "python3-setuptools-native python3-wheel-native"
>
> -# Where to execute the build process from
> -PEP517_SOURCE_PATH ?= "${S}"
> -
>  setuptools_build_meta_do_configure () {
>      :
>  }
> --
> 2.25.1
>
>
> -=-=-=-=-=-=-=-=-=-=-=-
> Links: You receive all messages sent to this group.
> View/Reply Online (#163067): https://lists.openembedded.org/g/openembedded-core/message/163067
> Mute This Topic: https://lists.openembedded.org/mt/89715331/1997914
> Group Owner: openembedded-core+owner@lists.openembedded.org
> Unsubscribe: https://lists.openembedded.org/g/openembedded-core/unsub [raj.khem@gmail.com]
> -=-=-=-=-=-=-=-=-=-=-=-
>

