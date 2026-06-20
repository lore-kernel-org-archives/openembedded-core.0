Return-Path: <yoann.congal@smile.fr>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 5626FCD4F26
	for <webhook@archiver.kernel.org>; Sat, 20 Jun 2026 23:40:16 +0000 (UTC)
Received: from mail-wr1-f44.google.com (mail-wr1-f44.google.com [209.85.221.44])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.15454.1781998811245689823
 for <openembedded-core@lists.openembedded.org>;
 Sat, 20 Jun 2026 16:40:11 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@smile.fr header.s=google header.b=lmIgqmAe;
 spf=pass (domain: smile.fr, ip: 209.85.221.44, mailfrom: yoann.congal@smile.fr)
Received: by mail-wr1-f44.google.com with SMTP id ffacd0b85a97d-461edb387ddso3043461f8f.3
        for <openembedded-core@lists.openembedded.org>; Sat, 20 Jun 2026 16:40:10 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=smile.fr; s=google; t=1781998809; x=1782603609; darn=lists.openembedded.org;
        h=in-reply-to:references:to:cc:from:subject:message-id:date
         :content-transfer-encoding:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=SOODvu2iWCVsmygTtI700/SSEGgfmHgqac6hbiJt1cI=;
        b=lmIgqmAedUSvkLAZYP87VtVU0p57uG32pLpYcLHfFDPEPX1FFMB03EZj8k3GqTTd5n
         sAxSdyJxub+MjobL1R4iopfTsx9lar7XBrJ8qn8b8VwItn9kllaiX3KcBE0F/tYenfX6
         Frha8S1ker7LfNVeU76AV4g0Q+eYw+rKeb5mo=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1781998809; x=1782603609;
        h=in-reply-to:references:to:cc:from:subject:message-id:date
         :content-transfer-encoding:mime-version:x-gm-gg:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=SOODvu2iWCVsmygTtI700/SSEGgfmHgqac6hbiJt1cI=;
        b=fG1KwLwk2hnxlGDlCwmoJpP8z4kKqWeGcvAqHbO76ibcXZ5aq04IxYJQ4ADcmWr3av
         3v6Ujg1Othb+k6OUCmtfLFOqv5dC20IEPZnqB4550Gnox4YDJEi7eg303U+kTpx76hkQ
         iQudB+iHmp1/EdeAPqNJDCgaSlq1uJmY1PABUCiAJJf4+JrIwBpVY/oJEBqWjaQO5fSQ
         ttki4V19KHvO31oX6vN5HUxQsC6eDmHe31ikQJ6YU0nTSADV5sRW1LWUBA24VvSgESfe
         LXibmx0osuE+4vUfUWhqUJLRhMGVUdy2Dw2vFdhL4inVtjB8VEyj+Iht8bz4IFR7ZJUO
         wg7A==
X-Forwarded-Encrypted: i=1; AHgh+RralzVNek6vfqB8QCQWqnK22wwV5ZGdESZGmn9ZtO8UJAGaPe2epbj2KVzOGlSX3zGFZryRz+H+6Oj+WJf3VUc42Q==@lists.openembedded.org
X-Gm-Message-State: AOJu0YzIweJk4GCzKI7ym6HrbJhmNrOYSiktPNimSmI6Zpn9wewespcA
	0i8OjXKLbFFQas8LrOec7T2PhniHK0/JX+rsGqBBX6KQd9N0rZJhiSsGJHvONamlhdI=
X-Gm-Gg: AfdE7clLqC/z0rhuHNGNdSp7xOHzOtIxytoDDMv5xzg+YlhvEW6K/NNBuc7Qp7VrXJA
	toyCzuz2S/+QSI1quEyJjuzR68wHo0neZGwZq8Jg9ux9Z01ONH6fmq9/YTWjzbzGgZD1EYL228L
	RX5rIQHELdurQMzEXk9nxToP9SBniwoWYHx+U4SNxlpOX2q1BKa/tgcqWy3jOfl9bU9efwOcU7c
	qkrjT3pB+LfpTXNBt9rJ/uyn4tqMQJ+sSf1NS8uAWuoWEkB2AkA5P7GLD5mgWg18kWnYjCxvSg0
	daK9AltQpLBVkWA13Pi0tOf/cyKfqUsxHwznsccjA+TwMBUUP+KDQRgXoGiKmx7ch3nM/pj5Xzu
	ZKZYbqU8cjjHUnf0TQB0SlaOGGxmjM+pDDlYt3I+uz4RcIkn3k6y8Owz1iWfx4CyFTs/FImPJ5d
	yIY3yI9RDpq0z/XnEJEC55mWnV4nssXBOj8DVeabkoVcIhfQsU39g959wiU/9iFYo5mJyhZp2l3
	f5m
X-Received: by 2002:a05:6000:290a:b0:460:70ae:f1a2 with SMTP id ffacd0b85a97d-465076ca3f9mr16658510f8f.17.1781998809424;
        Sat, 20 Jun 2026 16:40:09 -0700 (PDT)
Received: from localhost (2a01cb001331aa00a2e4fb7b0d887544.ipv6.abo.wanadoo.fr. [2a01:cb00:1331:aa00:a2e4:fb7b:d88:7544])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-46666c57afasm12522071f8f.29.2026.06.20.16.40.08
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sat, 20 Jun 2026 16:40:08 -0700 (PDT)
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Sun, 21 Jun 2026 01:40:08 +0200
Message-Id: <DJE9UV5D5WKL.2GI2K1GSIHM73@smile.fr>
Subject: Re: [OE-core] [scarthgap][PATCH 1/1] wic: Fix updating fstab for
 nvme devices
From: "Yoann Congal" <yoann.congal@smile.fr>
Cc: "Aleksandar Nikolic" <aleksandar.nikolic@zeiss.com>
To: <aleksandar.nikolic010@gmail.com>,
 <openembedded-core@lists.openembedded.org>
X-Mailer: aerc 0.20.0
References: <20260620205741.175107-1-aleksandar.nikolic22@pm.me>
 <20260620205741.175107-2-aleksandar.nikolic22@pm.me>
In-Reply-To: <20260620205741.175107-2-aleksandar.nikolic22@pm.me>
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Sat, 20 Jun 2026 23:40:16 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/239250

On Sat Jun 20, 2026 at 10:57 PM CEST, Aleksandar Nikolic via lists.openembe=
dded.org wrote:
> From: Aleksandar Nikolic <aleksandar.nikolic@zeiss.com>
>
> In case wks file references nvme, update_fstab() function will not add
> prefix 'p' before the partition number, as the if condition only takes
> mmcblk into consideration.
>
> In case of nvme0n1 this leads that following entries are added to fstab:
>
>     /dev/nvme0n11
>     /dev/nvme0n13
>
> instead of:
>
>     /dev/nvme0n1p1
>     /dev/nvme0n1p3
>
> The patch fixes this as it extends the if condition and adds prefix 'p' f=
or
> both mmcblk and nvme.
>
> Upstream-Status: Submitted [https://lists.yoctoproject.org/g/yocto-patche=
s/topic/119439838]

That patch seem to have been merged here : https://git.yoctoproject.org/wic=
/commit/?id=3Df20cda73b495b75ef399c331f59b0e2401a3e76a
If that is the case, can you send a v2 patch with
Upstream-Status: Backport [https://git.yoctoproject.org/wic/commit/?id=3Df2=
0cda73b495b75ef399c331f59b0e2401a3e76a]

Thanks!

> Signed-off-by: Aleksandar Nikolic <aleksandar.nikolic@zeiss.com>
> ---
>  scripts/lib/wic/plugins/imager/direct.py | 6 +++---
>  1 file changed, 3 insertions(+), 3 deletions(-)
>
> diff --git a/scripts/lib/wic/plugins/imager/direct.py b/scripts/lib/wic/p=
lugins/imager/direct.py
> index a1d152659b..b06e6a8f23 100644
> --- a/scripts/lib/wic/plugins/imager/direct.py
> +++ b/scripts/lib/wic/plugins/imager/direct.py
> @@ -133,8 +133,8 @@ class DirectPlugin(ImagerPlugin):
>              elif part.use_label:
>                  device_name =3D "LABEL=3D%s" % part.label
>              else:
> -                # mmc device partitions are named mmcblk0p1, mmcblk0p2..
> -                prefix =3D 'p' if  part.disk.startswith('mmcblk') else '=
'
> +                # mmc and nvme device partitions start with prefix 'p'
> +                prefix =3D 'p' if part.disk.startswith(('mmcblk', 'nvme'=
)) else ''
>                  device_name =3D "/dev/%s%s%d" % (part.disk, prefix, part=
.realnum)
> =20
>              opts =3D part.fsopts if part.fsopts else "defaults"
> @@ -266,7 +266,7 @@ class DirectPlugin(ImagerPlugin):
>                  elif part.label and self.ptable_format !=3D 'msdos':
>                      return "PARTLABEL=3D%s" % part.label
>                  else:
> -                    suffix =3D 'p' if part.disk.startswith('mmcblk') els=
e ''
> +                    suffix =3D 'p' if part.disk.startswith(('mmcblk', 'n=
vme')) else ''
>                      return "/dev/%s%s%-d" % (part.disk, suffix, part.rea=
lnum)
> =20
>      def cleanup(self):


--=20
Yoann Congal
Smile ECS


