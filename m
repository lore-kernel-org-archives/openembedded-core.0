Return-Path: <alex.kanavin@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id AA419ECE57B
	for <webhook@archiver.kernel.org>; Mon,  9 Sep 2024 08:41:02 +0000 (UTC)
Received: from mail-lj1-f171.google.com (mail-lj1-f171.google.com [209.85.208.171])
 by mx.groups.io with SMTP id smtpd.web10.48391.1725871257806933359
 for <openembedded-core@lists.openembedded.org>;
 Mon, 09 Sep 2024 01:40:58 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=LtJMLSwB;
 spf=pass (domain: gmail.com, ip: 209.85.208.171, mailfrom: alex.kanavin@gmail.com)
Received: by mail-lj1-f171.google.com with SMTP id 38308e7fff4ca-2f754d4a6e4so28035151fa.3
        for <openembedded-core@lists.openembedded.org>; Mon, 09 Sep 2024 01:40:57 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1725871255; x=1726476055; darn=lists.openembedded.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=5zKkFaMmdclaNHuOtjB6tV1tNcbxQ6Vv6fAxHQ1NWTQ=;
        b=LtJMLSwBpIXkj9oMbher+DCZvnzxeBXNCADfl5HaqNsxR+6VEFQjaa6MBwYnLmH5Tv
         17e4K6AiO9hwYlBsLXJjHj49FGj2QtKGvMLqHRbzmbAKpuTxtrXZHaYgi7My50ZfyuAk
         MrI7JFYPdWX2bD826PMMfkqmHMeXzhwhhuTwTQI2nIc2FxTwXK91AWjmHUYvpcGz5CU6
         kJ0gU2QFAcpHwEPvuTxhsZmQVwGG+icvAYpKJLsApGdQVsACF8JWDTFntXBj9GzjSlmM
         v2hlznzmElSDRP4R2ir7Su+4YlhjCncxcMiMrvFtiLg4u4lCgP+b8wmpl0RfgxZA8Yxo
         fXaw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1725871255; x=1726476055;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=5zKkFaMmdclaNHuOtjB6tV1tNcbxQ6Vv6fAxHQ1NWTQ=;
        b=KzmFe2ang+XaJB8g0K7l2wSAAPYns5uwJVj4b7zOkJ+1zNbTPOxZRJ5dBMzG/akDOJ
         6dZ1la8PtBj0hDhssnsIrLXcAlyvTBPVy4G+w4XGnfO1GP2g9Gie3tCHVk+u1ktl0bJT
         W+4tC/66bY63hMyMS27QNzgV/37XT9UMvgDlIgQwLjfXo70w6WGrzT0hKN4TCb7EMRNg
         Aw5PQMwYuThF0QXENLBMpVL9EpSy1cIwDwsg1IUQLyCANIzCAglwwKzSIwcBURnh9uNt
         9KQ9nMx9iQtYPAzRza0CXi3+RUVierf9309MGBb4E2Bu6nSxTkfjrT4UKi7YG3MHVHmP
         qjNg==
X-Gm-Message-State: AOJu0YwQdGS+EZNlRaos3rIUD1cIW14LAsJr9nRQ+G9gxXeLwajDADuW
	NK46Nxui6XokVmJuv5qdjQo/6NXebpOKLOj+97jnqWV3C7Jn/4LihOYlMKhITMxuTDyYBQ3zBFb
	GF7R5AxNHju0CHpDwUD+S7mWY8AE=
X-Google-Smtp-Source: AGHT+IGo78TGNWFEooub4/nJqF0iOasgWENdQih03K3PpdX4aj2KBXGiYmWah2/GQjZwjGVcwS6sF1fliC6B8nTahgc=
X-Received: by 2002:a05:6512:33c8:b0:533:484a:7bf5 with SMTP id
 2adb3069b0e04-536587fc1e8mr5518424e87.44.1725871254420; Mon, 09 Sep 2024
 01:40:54 -0700 (PDT)
MIME-Version: 1.0
References: <20240906165842.2327272-1-richard.purdie@linuxfoundation.org>
In-Reply-To: <20240906165842.2327272-1-richard.purdie@linuxfoundation.org>
From: Alexander Kanavin <alex.kanavin@gmail.com>
Date: Mon, 9 Sep 2024 10:40:43 +0200
Message-ID: <CANNYZj-niyPeX1k0QutWpgUrjD21ATRV-ChJSSJhNM86Dq7L=Q@mail.gmail.com>
Subject: Re: [OE-core] [PATCH] Revert "python3-setuptools: upgrade 72.1.0 -> 72.2.0"
To: richard.purdie@linuxfoundation.org, Martin Jansa <martin.jansa@gmail.com>
Cc: openembedded-core@lists.openembedded.org
Content-Type: text/plain; charset="UTF-8"
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 09 Sep 2024 08:41:02 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/204317

It would help to include specific steps to reproduce the problem in
the commit message here, otherwise there's going to be unneeded
friction when someone submits an update again without being aware of
the issue.

Alex

On Fri, 6 Sept 2024 at 18:58, Richard Purdie via
lists.openembedded.org
<richard.purdie=linuxfoundation.org@lists.openembedded.org> wrote:
>
> This reverts commit 8fccef7a731f44e5d27653e06becb54cf770e5e5.
>
> The patch causes problems for systems using ccache. Revert until this is fixed.
>
> Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
> ---
>  ...ython3-setuptools_72.2.0.bb => python3-setuptools_72.1.0.bb} | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
>  rename meta/recipes-devtools/python/{python3-setuptools_72.2.0.bb => python3-setuptools_72.1.0.bb} (94%)
>
> diff --git a/meta/recipes-devtools/python/python3-setuptools_72.2.0.bb b/meta/recipes-devtools/python/python3-setuptools_72.1.0.bb
> similarity index 94%
> rename from meta/recipes-devtools/python/python3-setuptools_72.2.0.bb
> rename to meta/recipes-devtools/python/python3-setuptools_72.1.0.bb
> index 63ea999960b..945d443affc 100644
> --- a/meta/recipes-devtools/python/python3-setuptools_72.2.0.bb
> +++ b/meta/recipes-devtools/python/python3-setuptools_72.1.0.bb
> @@ -11,7 +11,7 @@ SRC_URI:append:class-native = " file://0001-conditionally-do-not-fetch-code-by-e
>  SRC_URI += " \
>              file://0001-_distutils-sysconfig.py-make-it-possible-to-substite.patch"
>
> -SRC_URI[sha256sum] = "80aacbf633704e9c8bfa1d99fa5dd4dc59573efcf9e4042c13d3bcef91ac2ef9"
> +SRC_URI[sha256sum] = "8d243eff56d095e5817f796ede6ae32941278f542e0f941867cc05ae52b162ec"
>
>  DEPENDS += "python3"
>
>
> -=-=-=-=-=-=-=-=-=-=-=-
> Links: You receive all messages sent to this group.
> View/Reply Online (#204279): https://lists.openembedded.org/g/openembedded-core/message/204279
> Mute This Topic: https://lists.openembedded.org/mt/108308394/1686489
> Group Owner: openembedded-core+owner@lists.openembedded.org
> Unsubscribe: https://lists.openembedded.org/g/openembedded-core/unsub [alex.kanavin@gmail.com]
> -=-=-=-=-=-=-=-=-=-=-=-
>

