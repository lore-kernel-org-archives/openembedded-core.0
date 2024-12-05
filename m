Return-Path: <martin.jansa@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 49B86E77170
	for <webhook@archiver.kernel.org>; Thu,  5 Dec 2024 09:43:42 +0000 (UTC)
Received: from mail-lj1-f172.google.com (mail-lj1-f172.google.com [209.85.208.172])
 by mx.groups.io with SMTP id smtpd.web10.6809.1733391812903744587
 for <openembedded-core@lists.openembedded.org>;
 Thu, 05 Dec 2024 01:43:33 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=PUlWhi7x;
 spf=pass (domain: gmail.com, ip: 209.85.208.172, mailfrom: martin.jansa@gmail.com)
Received: by mail-lj1-f172.google.com with SMTP id 38308e7fff4ca-2ffdbc0c103so5931671fa.3
        for <openembedded-core@lists.openembedded.org>; Thu, 05 Dec 2024 01:43:32 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1733391811; x=1733996611; darn=lists.openembedded.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=tjzDJOvqBiWOprH/JdP2LIcXNBKz6fiVvrlYbojdNVo=;
        b=PUlWhi7xxqf1m0gak9DyndZGbrHXOudvTDTzlDHu8+S10ixar5BJ1/o+cWAK2p5cKI
         62YFNp6pDb/lVZLrnPP4gAMexyJqC+om9G4LwKUEnlEjW+IN/I5iVCdMYmi0GyO3c3Ag
         9l1zXBHPTl5E1JevISj7WR0YP9kAkmBIXkoi7O9PPdPyTpOe3vNrpjl9+UyQDHGG8faY
         WRJl3QxRv0cq1KwK44Yj+6jH9U0to4LrnbKNEvPro3emfydjBVZc/T35PdhuzEjzKMGe
         R8pwfVuMalSElcsgYSAXGfmMX4ootA8vYlak/+DKiZheak6CZHjVyOhtg5hCCELU805t
         pGBA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1733391811; x=1733996611;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=tjzDJOvqBiWOprH/JdP2LIcXNBKz6fiVvrlYbojdNVo=;
        b=FF5tNaFFc4cyTmIO0wzHgJKDZxCgq8q5q5AuXRG56nhA8Ec1V2UBo/1gwPsezF3rSm
         mmpq0VXiVsWO3G1uuy7a4AmfHubu4odlHnRvQ6IptxUXb2GkVxbzyyNO/+NXjJ65Ltr3
         Uv/IbBVqwaSRfASsDn7y53L6ERiyui9zE2BgFFw1BOVW5HbCr6u2V3HjmqV/r3FuBAHt
         tQi9tD6v5JIxm3OkzGZgrbBLFz7r7HKQDmtHcgpx6vce2LadW1yUg6HTyeWKk9rRcuDW
         tWGgappOYOsv6QXCMJcWj9m4N6F1ljtAXE80H+7TH5A1Vy7+8HtMeoBOT0QInPkBISV6
         1QKQ==
X-Gm-Message-State: AOJu0Yw+toRDZzsewmdsXh31iOJrtGowmrDZUa6WaFj9mO939synmY23
	Cu9xSIH4D+nJE+b7N1bQSvLhQGfnOByR2djIwc9QJEn5Tzd3mH2ps3L86r6nlsBt2jf4C8EC9ay
	KyQfjZaZo0l1UJB4zYIEGF0ziuHE=
X-Gm-Gg: ASbGncvzRdM0VEABlLfi7STRKi7o3bn5t86k4qpt6WwX4QPLacRAVfldJcL95RLTGBc
	I8aDcln2XQFcJDKpyeXLz5reaw3uJJCEsSw==
X-Google-Smtp-Source: AGHT+IHYgWac5N393euYqmj8bFeZL2uqMyljjCoG+kBO0BLOQGsyHZZnbyzy4U8UIHcKmZKj3WKJEEYGVB286lx25XE=
X-Received: by 2002:a05:651c:2227:b0:2ff:a8dc:6fb8 with SMTP id
 38308e7fff4ca-30009c4aefamr74382771fa.8.1733391810496; Thu, 05 Dec 2024
 01:43:30 -0800 (PST)
MIME-Version: 1.0
References: <20241205093237.333818-1-mikko.rapeli@linaro.org>
In-Reply-To: <20241205093237.333818-1-mikko.rapeli@linaro.org>
From: Martin Jansa <martin.jansa@gmail.com>
Date: Thu, 5 Dec 2024 10:43:19 +0100
Message-ID: <CA+chaQfkLvTfv5o30LZzuBHJ42Yo_q1MHkg55HJbcZTw+SdqDQ@mail.gmail.com>
Subject: Re: [OE-core] [PATCH 0/3] swig: update from 4.2.1 to 4.3.0
To: mikko.rapeli@linaro.org
Cc: openembedded-core@lists.openembedded.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 05 Dec 2024 09:43:42 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/208371

Does this swig upgrade fix the issue with work around added in:
https://git.openembedded.org/meta-openembedded/commit/?id=3Df9158ce32fffa6f=
18eed4008c3295146c81d55ea
if yes, can you please send revert of this work around to meta-oe?

On Thu, Dec 5, 2024 at 10:33=E2=80=AFAM Mikko Rapeli via
lists.openembedded.org
<mikko.rapeli=3Dlinaro.org@lists.openembedded.org> wrote:
>
> Ran into some issues with swig generated code and python 3.13
> and prepared these but then the issues turned out to be something else.
> Sending these out anyway but there may be something missing
> and/or broken.
>
> Compiled obvious swig users:
>
> $ bitbake dtc swig-native u-boot libdnf python3-dtc lttng-tools gpgme lib=
cap-ng-python
>
> Mikko Rapeli (3):
>   swig: update from 4.2.1 to 4.3.0
>   python3-dtc: update from 1.7.0 to 1.7.2
>   dtc: update from 1.7.0 to 1.7.2
>
>  ...erlay-make-overlay_get_target-public.patch | 132 ------------------
>  ...hon3-dtc_1.7.0.bb =3D> python3-dtc_1.7.2.bb} |   5 +-
>  .../swig/swig/determinism.patch               |   8 +-
>  .../swig/{swig_4.2.1.bb =3D> swig_4.3.0.bb}     |   6 +-
>  ...01-meson.build-bump-version-to-1.7.0.patch |  29 ----
>  ...n-allow-building-from-shallow-clones.patch |  38 -----
>  .../dtc/{dtc_1.7.0.bb =3D> dtc_1.7.2.bb}        |   4 +-
>  7 files changed, 10 insertions(+), 212 deletions(-)
>  delete mode 100644 meta/recipes-devtools/python/python3-dtc/0001-Revert-=
libfdt-overlay-make-overlay_get_target-public.patch
>  rename meta/recipes-devtools/python/{python3-dtc_1.7.0.bb =3D> python3-d=
tc_1.7.2.bb} (84%)
>  rename meta/recipes-devtools/swig/{swig_4.2.1.bb =3D> swig_4.3.0.bb} (87=
%)
>  delete mode 100644 meta/recipes-kernel/dtc/dtc/0001-meson.build-bump-ver=
sion-to-1.7.0.patch
>  delete mode 100644 meta/recipes-kernel/dtc/dtc/0002-meson-allow-building=
-from-shallow-clones.patch
>  rename meta/recipes-kernel/dtc/{dtc_1.7.0.bb =3D> dtc_1.7.2.bb} (86%)
>
> --
> 2.43.0
>
>
> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
> Links: You receive all messages sent to this group.
> View/Reply Online (#208366): https://lists.openembedded.org/g/openembedde=
d-core/message/208366
> Mute This Topic: https://lists.openembedded.org/mt/109936275/3617156
> Group Owner: openembedded-core+owner@lists.openembedded.org
> Unsubscribe: https://lists.openembedded.org/g/openembedded-core/unsub [ma=
rtin.jansa@gmail.com]
> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
>

