Return-Path: <alex.kanavin@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id DD576C5478C
	for <webhook@archiver.kernel.org>; Tue, 27 Feb 2024 09:41:39 +0000 (UTC)
Received: from mail-lj1-f172.google.com (mail-lj1-f172.google.com [209.85.208.172])
 by mx.groups.io with SMTP id smtpd.web10.8954.1709026890800136858
 for <openembedded-core@lists.openembedded.org>;
 Tue, 27 Feb 2024 01:41:31 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=Yev2R6Qi;
 spf=pass (domain: gmail.com, ip: 209.85.208.172, mailfrom: alex.kanavin@gmail.com)
Received: by mail-lj1-f172.google.com with SMTP id 38308e7fff4ca-2d208be133bso62574341fa.2
        for <openembedded-core@lists.openembedded.org>; Tue, 27 Feb 2024 01:41:30 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1709026889; x=1709631689; darn=lists.openembedded.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=bQ4PaFkNennaNVG5pjxNJsBOQBFOcHTygm02c1GZvuc=;
        b=Yev2R6QirTci4GsSH93toXDcXy+iRjWz1Gwb7q/oUmEG11Ha7e7a6m6o6ctPfCNKG6
         lRRtQYCL/Ztc2J7Gd7yirckF3DrKMV8hlYt/0CPJS3bBa4i0Yy7/Pl71waaetKFi2Sx9
         nKSQXcZDUzBw90uYqtr0W1o/1sukiVwuiN4Sqi6i2ardPHyhivFjsu+3u0xtXGQKDzs4
         5R5LDAPZZv3vL3X2ImkiIQwjfJa2P8cLJNUixDtuzvLytoAbkFq5a1OR7IAKJjXD+KG2
         nPtHuxDdWoJj/8Te2RfLYomCxhdcKL3ukvaMdbFzVedMUz33cB5gW5QxlACSC+CoqF7H
         oqww==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1709026889; x=1709631689;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=bQ4PaFkNennaNVG5pjxNJsBOQBFOcHTygm02c1GZvuc=;
        b=PaA6Li6Zic2pMikWj7Eo+XQAoSIidZiCC58I+C9pFPrOQmMbvOtC17+od7ZyEco/UZ
         zZqIub+12qB+1jOVWYrYtN9a0felKNIygaxMfP/7rT95bVol8gHHfj9JhCSiivHt7MeH
         HMsriRL1mC94opZwYLNAXmr5AiNlk48Dnr9kvoVMcww3mCEA4ZgfO0PEg+dB8f6SfsNK
         H/YB2sHgLqeejmdgtHpGvERoKpbOPP31hh+ulK+O7ku+QDImXrlYVwUHcygccNLsP0XW
         oN+QE0wn19P+lEdeyRdqRU/fEykrpagK0hvLdUFmGSIQ/hOeHEX8B007JHa9Q4W9bOZI
         GeYw==
X-Gm-Message-State: AOJu0YyOWzxO60Zpm8mZ7wPmQWUXZf4WejJqgO2xUqIxfFns7slvfajX
	EbhFjJJuBd03V153VGATjFYNlDwyLUGcjjwP3LX4RQS3v07uQN1cmk/sQju8ccN/fxqyXtEqhtg
	shysm1IO5+93JXxZPDoqFEh5zoFE=
X-Google-Smtp-Source: AGHT+IElbEkmAp/2At4piaAshiCBKZBo8EssX3425h+U+Gkw824TKDbRAdsrOayNb58HtT6m2Kx/bOlbn55MZltczuE=
X-Received: by 2002:a2e:b0e6:0:b0:2d2:6d19:75ff with SMTP id
 h6-20020a2eb0e6000000b002d26d1975ffmr5044532ljl.50.1709026888866; Tue, 27 Feb
 2024 01:41:28 -0800 (PST)
MIME-Version: 1.0
References: <20240227085722.2025994-1-xiangyu.chen@eng.windriver.com>
In-Reply-To: <20240227085722.2025994-1-xiangyu.chen@eng.windriver.com>
From: Alexander Kanavin <alex.kanavin@gmail.com>
Date: Tue, 27 Feb 2024 10:41:17 +0100
Message-ID: <CANNYZj_uUATQFE54rkXaCiUqPRyaRvRWDJdhH0gGwBd9WHiLjA@mail.gmail.com>
Subject: Re: [OE-core][PATCH 1/2] bash: add locale alias for ja_JP shiftjis in run-ptest
To: Xiangyu Chen <xiangyu.chen@eng.windriver.com>
Cc: openembedded-core@lists.openembedded.org
Content-Type: text/plain; charset="UTF-8"
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 27 Feb 2024 09:41:39 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/196249

Wait. Why is the correct locale not generated? How do other systems do
it? There's an issue elsewhere, possibly in glibc-locale, and this
works around that, instead of fixing the original problem.

Alex

On Tue, 27 Feb 2024 at 09:57, Xiangyu Chen
<xiangyu.chen@eng.windriver.com> wrote:
>
> From: Xiangyu Chen <xiangyu.chen@windriver.com>
>
> Bash has a test case that needs ja_JP shift jis locale.
>
> It will check current system has ja_JP.SJIS locale or not, but in yocto,
> this locale named ja_JP.shiftjis, they are the same.
> So create a locale alias, making ja_JP.SJIS link to ja_JP.shiftjis.
>
> Also add warning message if current system doesn't contain shift jis locale.
>
> Signed-off-by: Xiangyu Chen <xiangyu.chen@windriver.com>
> ---
>  meta/recipes-extended/bash/bash/run-ptest | 21 +++++++++++++++++++++
>  1 file changed, 21 insertions(+)
>
> diff --git a/meta/recipes-extended/bash/bash/run-ptest b/meta/recipes-extended/bash/bash/run-ptest
> index 738ad3c42c..3cafb5e2ea 100644
> --- a/meta/recipes-extended/bash/bash/run-ptest
> +++ b/meta/recipes-extended/bash/bash/run-ptest
> @@ -3,6 +3,7 @@
>  en_US=`locale -a | grep en_US*`
>  fr_FR=`locale -a | grep fr_FR*`
>  de_DE=`locale -a | grep de_DE*`
> +ja_JP_SJIS=`locale -a | grep ja_JP.shiftjis`
>
>  if [ -z "$en_US" ]
>  then
> @@ -19,8 +20,28 @@ then
>          echo "Warning: The de_DE* locales is needed to run the intl.tests, please add it."
>  fi
>
> +if [ -z "$ja_JP_SJIS" ]
> +then
> +        echo "Warning: The ja_JP.shiftjis locales is needed to run the intl.tests, please add it."
> +else
> +# Yocto generated shiftjis locale named ja_JP.shiftjis, but bash's test script using ja_JP.SJIS
> +# They are the same one, so add an alias in locale.alias
> +        if [ -f /usr/share/locale/locale.alias ]
> +        then
> +                cp /usr/share/locale/locale.alias /usr/share/locale/locale.alias.bak
> +        fi
> +
> +        echo "ja_JP.SJIS        ja_JP.shiftjis" >> /usr/share/locale/locale.alias
> +fi
> +
> +
>  useradd bashtest
>  chown -R bashtest:bashtest tests
>  setpriv --reuid bashtest --rgid bashtest --clear-groups --reset-env $(dirname "$0")/run-bash-ptests
>  chown -R root:root tests
>  userdel -r bashtest
> +
> +if [ -f /usr/share/locale/locale.alias.bak ]
> +then
> +        mv /usr/share/locale/locale.alias.bak /usr/share/locale/locale.alias
> +fi
> --
> 2.34.1
>
>
> -=-=-=-=-=-=-=-=-=-=-=-
> Links: You receive all messages sent to this group.
> View/Reply Online (#196244): https://lists.openembedded.org/g/openembedded-core/message/196244
> Mute This Topic: https://lists.openembedded.org/mt/104599698/1686489
> Group Owner: openembedded-core+owner@lists.openembedded.org
> Unsubscribe: https://lists.openembedded.org/g/openembedded-core/unsub [alex.kanavin@gmail.com]
> -=-=-=-=-=-=-=-=-=-=-=-
>

