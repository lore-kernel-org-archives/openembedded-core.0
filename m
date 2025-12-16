Return-Path: <ankur.tyagi85@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 8B085D5E396
	for <webhook@archiver.kernel.org>; Tue, 16 Dec 2025 14:46:46 +0000 (UTC)
Received: from mail-oa1-f52.google.com (mail-oa1-f52.google.com [209.85.160.52])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.24400.1765896397633644744
 for <openembedded-core@lists.openembedded.org>;
 Tue, 16 Dec 2025 06:46:37 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=Xnttj/rO;
 spf=pass (domain: gmail.com, ip: 209.85.160.52, mailfrom: ankur.tyagi85@gmail.com)
Received: by mail-oa1-f52.google.com with SMTP id 586e51a60fabf-3e898ba2a03so3337552fac.0
        for <openembedded-core@lists.openembedded.org>; Tue, 16 Dec 2025 06:46:37 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1765896397; x=1766501197; darn=lists.openembedded.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=QgetDpivJH1beT1VJV/9emP9CQvwB10tK52CzdRkE3I=;
        b=Xnttj/rOdMhYTHs8hVnAUUcXYfwzL4rmDrmrPGvVaJfiOJArb4bgSx3jPptIj5o2hh
         gVMPyZ7ELNOKArjzaCFFFg2JyYNOxtPJE94G70gh/G6k1Lv2UfizEJgDmixWR+8Yky3d
         IADG8ovgFyNI1mfFIB3MCmOwApBAzB3N+jB4aRjVuQVuuJ6PaTHznpvrzQzlGBsml71W
         JyRWZ5R3HUvJOEPqYE0/K6+fSYIqYFhQO+hJoyQttKY8I1JeLHFA+K4KwuiLQqTAK02S
         SK95uO3tKYD3EoLhOCUdEXfJ77y8xxjEwpdJITZPsgfVn/ygn7HDCwM5ceiYHJ94AsuZ
         OYIQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1765896397; x=1766501197;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=QgetDpivJH1beT1VJV/9emP9CQvwB10tK52CzdRkE3I=;
        b=qrrd0M90IWjNM5/xDshTnA7+in+SsLWDicwyZ2vIJVpwc0cK+EAh22ayD85yGS5K2d
         BlT11k2Fzq3NXLE7vohXgoPZSbYcKkoJFP/7G2Tgx+UPe5UlmziEXsO7PFny5kn+t8hE
         O8pfwRz+Ovhi+sxLTfxulFgeQ5lm4iwfCZO9/lg45Ym1f015oikkB1IiDd16XvhMw9Tc
         5cgYbyKU7Ml8GOrY03Ryt292SiGAdSp/MMk8ZOe8czQLQ8TvKp4UwtF1onwSV665EEG5
         DQhaw/gvO0ITzq9ACNQ6UdJgAKR0bzDesFrcQrZCz2VbpxynEdpYlxbCoOxMrwVmWzBy
         FujQ==
X-Gm-Message-State: AOJu0YyRlOrAf03kR3k4kZev5q/uI8c2rkbu8XkVH0h7tQCQK/3mVuEW
	NFsjB9URmEpeDlk2kfTLYOtHT9+GGAvKUKU5m+SpU1RDrFohFxtKdl/xlbUctSAc/5jjcrxPGIB
	P+NwQdQpUZyh2O65gyyNCQCGiJEdzFLxsqQ==
X-Gm-Gg: AY/fxX5o1vTwstnIKrZI/DgqdiiHiZDajkXXx7RYnmDqYujFelYq8nVjpi9iOJvDnCL
	a8HJh7LvXKwJTvPFhds1SKtktVhlpT+SWRp/lokIFD9QDl922VydJlnYIF7PhwxijuhZplIJPlX
	/tzocsksQMYKIuZRkw66fcnkOatIJ2T+WHotDRhNIYkyzzid6vyfjRnpEPfYZ2BJdn0G0+APgE1
	SFgFghChtlaIM6z6fq30O7bfD+mTsnq3TcMn2V1kFogWKP45fYUdO6gGUIX67SnM+xFOyWxfpFS
	ukVuGyLk
X-Google-Smtp-Source: AGHT+IHw+kBU58anFU9Sz2JGVn3s2hrZ2UvdCJwHSJYHNOCvwICxsVz/0A8A6TgIhvSEId8y/1x1Trv6fYUO/99nPkI=
X-Received: by 2002:a4a:edc7:0:b0:659:9a49:9087 with SMTP id
 006d021491bc7-65b452c4a22mr5542951eaf.82.1765896396689; Tue, 16 Dec 2025
 06:46:36 -0800 (PST)
MIME-Version: 1.0
References: <20251213095931.2571498-1-ankur.tyagi85@gmail.com> <20251213095931.2571498-2-ankur.tyagi85@gmail.com>
In-Reply-To: <20251213095931.2571498-2-ankur.tyagi85@gmail.com>
From: Ankur Tyagi <ankur.tyagi85@gmail.com>
Date: Tue, 16 Dec 2025 20:16:24 +0530
X-Gm-Features: AQt7F2pCWKazpyzrY7gsNQfeeviNmtKtbQybCkal5nrKzUg1d__g4mMlDandLK0
Message-ID: <CADySD0HOfXfv8oDcwvP_0sEz9UWTi6B6x3Z+Y7KGUzZuD6awWA@mail.gmail.com>
Subject: Re: [OE-core][whinlatter][PATCH 02/67] barebox: upgrade 2025.09.0 -> 2025.11.0
To: openembedded-core@lists.openembedded.org
Cc: =?UTF-8?Q?Enrico_J=C3=B6rns?= <ejo@pengutronix.de>, 
	Mathieu Dubois-Briand <mathieu.dubois-briand@bootlin.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 16 Dec 2025 14:46:46 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/227963

Though not mentioned in the release notes but migration guide mentions
rename in /dev, please drop this patch.

On Sat, Dec 13, 2025 at 3:29=E2=80=AFPM <ankur.tyagi85@gmail.com> wrote:
>
> From: Enrico J=C3=B6rns <ejo@pengutronix.de>
>
> Changes in 2025.11.0
> --------------------
>
> * New boards supported: i.MX93 FRDM, Enclustra Mercury+ SA2.
> * Stricter validation of network data in NFS client code.
> * Enhance 'parted' command: allows creating partitions up to the end of t=
he
>   device.
> * Various fixes and improvements.
>
> Release Notes:
> https://github.com/barebox/barebox/releases/tag/v2025.11.0
>
> Changes in 2025.10.0
> --------------------
>
> * Added support for device mapper and dm-verity.
>   Prepares for secure boot without the need for FIT images.
> * Added security policy support.
>   Kconfig-level decision of operations allowed/forbidden in a specific
>   security mode.
> * New boards supported: Samsung Galaxy S8, Samsung Galaxy S20 5G, Radxa
>   Rock-5T and Protonic PRT8ML.
> * Various fixes and improvements.
>
> Release Notes:
> https://github.com/barebox/barebox/releases/tag/v2025.10.0
>
> Signed-off-by: Enrico J=C3=B6rns <ejo@pengutronix.de>
> Signed-off-by: Mathieu Dubois-Briand <mathieu.dubois-briand@bootlin.com>
> (cherry picked from commit c596157f82ebd8dd3703bf7a5193bd3080743b53)
> Signed-off-by: Ankur Tyagi <ankur.tyagi85@gmail.com>
> ---
>  meta/recipes-bsp/barebox/barebox-common.inc | 4 ++--
>  1 file changed, 2 insertions(+), 2 deletions(-)
>
> diff --git a/meta/recipes-bsp/barebox/barebox-common.inc b/meta/recipes-b=
sp/barebox/barebox-common.inc
> index e41d0858fd..0ad9166aa2 100644
> --- a/meta/recipes-bsp/barebox/barebox-common.inc
> +++ b/meta/recipes-bsp/barebox/barebox-common.inc
> @@ -3,6 +3,6 @@ SECTION =3D "bootloaders"
>
>  LIC_FILES_CHKSUM =3D "file://COPYING;md5=3Df5125d13e000b9ca1f0d3364286c4=
192"
>
> -PV =3D "2025.09.0"
> +PV =3D "2025.11.0"
>  SRC_URI =3D "https://barebox.org/download/barebox-${PV}.tar.bz2"
> -SRC_URI[sha256sum] =3D "7df1aa47bb7bf1763a729137ac773e69a4052812af094475=
d739fc63a9295f0d"
> +SRC_URI[sha256sum] =3D "6a487eb975169ef4ecc912d3e1044fb9ee4aa164c21d4db9=
60a384a60d0914f6"

