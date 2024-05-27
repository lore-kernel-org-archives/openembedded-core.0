Return-Path: <alex.kanavin@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 7F08AC25B74
	for <webhook@archiver.kernel.org>; Mon, 27 May 2024 14:40:53 +0000 (UTC)
Received: from mail-lj1-f176.google.com (mail-lj1-f176.google.com [209.85.208.176])
 by mx.groups.io with SMTP id smtpd.web11.29479.1716820847147569332
 for <openembedded-core@lists.openembedded.org>;
 Mon, 27 May 2024 07:40:47 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=aEZg07v6;
 spf=pass (domain: gmail.com, ip: 209.85.208.176, mailfrom: alex.kanavin@gmail.com)
Received: by mail-lj1-f176.google.com with SMTP id 38308e7fff4ca-2e9684e0288so30186901fa.1
        for <openembedded-core@lists.openembedded.org>; Mon, 27 May 2024 07:40:46 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1716820845; x=1717425645; darn=lists.openembedded.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=3VRoqhvDpcEFTD3fqGtMEKkTE5FprTtseWZTxFXQwQA=;
        b=aEZg07v6rKRodMudFPqOWKuDuB99R6Nyye6o2EdbhTTmCv0OW9piiZSCDNOIW03Sz/
         MDU3fOM5j0kkCo0/HC5hRYLGB0cGSup7dpKYTDcsNO5+zvoDCsJF7gcIGu7F+ves2SHd
         rMBaUkcHQzSmmK7rv9LsslNeGBx+7BDApq5OCIv5NX6hloIsHcLJqNKIG2T8yy/1BdVT
         Xqt2d8ydL4ZBMwPqjwIZC4vHVu5xrsMaSBjxN3PKYIpAaEIDP2Uscd7rzKv6dULTDYzp
         PbgIa5e3tES0rlvgRpShzOVRDNchud5wLKz8Wp04DZz4KFmQmqnHpHirBtiHIkpiTZL+
         aMdw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1716820845; x=1717425645;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=3VRoqhvDpcEFTD3fqGtMEKkTE5FprTtseWZTxFXQwQA=;
        b=Rloq1aPlBxXIah+9Sx0jdo+b1vcz12HfOsN4B6KKAWfQYuAo+p21cJaoDuciVC0dKR
         xGmQ7yJ3E083t//euyVjzkwXZmofC/7EvSyU9PjClYAbiCEHIhL4fPExI7nwbzSW2+ZB
         3vr/myXHnfddepZiUXcEQesidIi3WxO6/z+4ZL0NxaFLnxfbQUktU3OA46PgOjz/9OAj
         0+g1eGOosElMoxyDvmXGMLzOTSrmagLpJ8qGdvCPRE40BYoZ/Gg+jrQHl73kokS/Igm5
         o0Ja9Er+FokKBf6cEMxRJc/1H8A4YdHuQ7cY8dnWl5tcazn0qk7mtLZNKxmVYMYUsVEH
         eS2A==
X-Gm-Message-State: AOJu0YyFNhri7bvQTIOv1MfekH4oR8vj0iEW7KhZQCoOVDvhVBc4T7ZD
	AVNqhK2EsN4cSF76i3AmLHrq8W0BIAlnWwDN7Kd0jFdE5btSIj9GaEHNWaLIGJdjMkSj/NtFUl9
	U7a9opgiCXpacqXHtMK9QwzY3ey0=
X-Google-Smtp-Source: AGHT+IGK73lXK8ZRyd5oTStncYiKB04hxGE5e3oAwGZjAqOKyFcU2ddMpEaQ8hh5NGVrTi7Eve3W8xSwrFRxD5J7D50=
X-Received: by 2002:a2e:3308:0:b0:2d9:fb60:9afa with SMTP id
 38308e7fff4ca-2e95b25556dmr99222961fa.40.1716820845023; Mon, 27 May 2024
 07:40:45 -0700 (PDT)
MIME-Version: 1.0
References: <20240527134416.10699-1-jaekyu.lee@lge.com>
In-Reply-To: <20240527134416.10699-1-jaekyu.lee@lge.com>
From: Alexander Kanavin <alex.kanavin@gmail.com>
Date: Mon, 27 May 2024 16:40:33 +0200
Message-ID: <CANNYZj9yFM1zNjVum=sPaHXE4ZGbvB4ubkMnmt1gEPpHwz=X2w@mail.gmail.com>
Subject: Re: [PATCH] [OE-core][scarthgap] rust: remove unnecessary git signature
To: jaekyu.lee@lge.com
Cc: openembedded-core@lists.openembedded.org
Content-Type: text/plain; charset="UTF-8"
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 27 May 2024 14:40:53 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/199903

Hello,

there are lots of patches in oe-core with git signatures at the end,
why does it need to be removed from here in particular?

Alex

On Mon, 27 May 2024 at 16:25, Jaekyu Lee via lists.openembedded.org
<jaekyu.lee=lge.com@lists.openembedded.org> wrote:
>
> From: "jaekyu.lee" <jaekyu.lee@lge.com>
>
> Remove useless git signature
>
> Signed-off-by: jaekyu.lee <jaekyu.lee@lge.com>
> ---
>  .../0001-Handle-vendored-sources-when-remapping-paths.patch     | 2 --
>  1 file changed, 2 deletions(-)
>
> diff --git a/meta/recipes-devtools/rust/files/0001-Handle-vendored-sources-when-remapping-paths.patch b/meta/recipes-devtools/rust/files/0001-Handle-vendored-sources-when-remapping-paths.patch
> index a46ee14402..10ca1c2530 100644
> --- a/meta/recipes-devtools/rust/files/0001-Handle-vendored-sources-when-remapping-paths.patch
> +++ b/meta/recipes-devtools/rust/files/0001-Handle-vendored-sources-when-remapping-paths.patch
> @@ -41,6 +41,4 @@ index cd276674dee6..48fdb2c7f7b7 100644
>               }
>               cargo.env("RUSTC_CARGO_REGISTRY_SRC_TO_REMAP", env_var);
>           }
> ---
> -2.39.0
>
>
> -=-=-=-=-=-=-=-=-=-=-=-
> Links: You receive all messages sent to this group.
> View/Reply Online (#199902): https://lists.openembedded.org/g/openembedded-core/message/199902
> Mute This Topic: https://lists.openembedded.org/mt/106323318/1686489
> Group Owner: openembedded-core+owner@lists.openembedded.org
> Unsubscribe: https://lists.openembedded.org/g/openembedded-core/unsub [alex.kanavin@gmail.com]
> -=-=-=-=-=-=-=-=-=-=-=-
>

