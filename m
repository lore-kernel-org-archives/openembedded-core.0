Return-Path: <yoann.congal@smile.fr>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 40A8910F6FBF
	for <webhook@archiver.kernel.org>; Wed,  1 Apr 2026 15:21:34 +0000 (UTC)
Received: from mail-wm1-f44.google.com (mail-wm1-f44.google.com [209.85.128.44])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.15953.1775056893193684951
 for <openembedded-core@lists.openembedded.org>;
 Wed, 01 Apr 2026 08:21:33 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@smile.fr header.s=google header.b=yLz5aHBZ;
 spf=pass (domain: smile.fr, ip: 209.85.128.44, mailfrom: yoann.congal@smile.fr)
Received: by mail-wm1-f44.google.com with SMTP id 5b1f17b1804b1-486507134e4so79426385e9.0
        for <openembedded-core@lists.openembedded.org>; Wed, 01 Apr 2026 08:21:32 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=smile.fr; s=google; t=1775056891; x=1775661691; darn=lists.openembedded.org;
        h=in-reply-to:references:to:cc:from:subject:message-id:date
         :content-transfer-encoding:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=gg64IXAWd1n0lc4NY+6OVEcYeszVl3mflWkO5fhct+Q=;
        b=yLz5aHBZkQjnqU7vdqXk4zyoiLIqfYKFE1Gc6dg4/HXhCEsbpYMsG31znGHD+YwiLi
         nJxzIDWAFlAod9LP0FCHKT7lYUhb+6Cw95fVB5Uh+/erbMIDYI7nEREqS5bN9TsZg75d
         Ndl9stgLYbIYD+PFdG5xUebLzl2kvHNcT60Sg=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1775056891; x=1775661691;
        h=in-reply-to:references:to:cc:from:subject:message-id:date
         :content-transfer-encoding:mime-version:x-gm-gg:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=gg64IXAWd1n0lc4NY+6OVEcYeszVl3mflWkO5fhct+Q=;
        b=EObPntQgZDtPaWLiZcD+p3udSwsMA2ixMkYdbdJjZJh8ZcbVoD/nxB5SLYv2FgZPUk
         uoXtLQ2rp28gulQLtDbuOZ9TQEjwnUppj+pvOEdIxbg/mozL9ybWV1+s8lwCUeNeIJTr
         0byZXYNppBCOpcWomS7GbJS/pmoJVONCSWnfP/lxQKOIJyBz5kmKMg8oAYwAOBmj9rk9
         CcVQdm3SKXUPmrE5XqlchGWSNaYlUstrtqYwzjs6xAepfjai79FeTKtJhY0qwTEIh1sB
         OO8EopKI9ANxAkkITc+vnQHse22B4jDfTSrHblHIqhwoszjRWFtRzlNe6HOoHiXPK0iB
         hN/Q==
X-Forwarded-Encrypted: i=1; AJvYcCUlMVHSTUUslDP6GTSPlPKrn0nlpYQP7ewiRdb0rs5wD80SOs16iOyWYvIkY8TmwrKX386C3iRoDAoxhKRZB1oXdQ==@lists.openembedded.org
X-Gm-Message-State: AOJu0YzzOu535GhYTw5YVm505JBj6eZ05+xdfp8jT7DAeizYh9ILor+0
	dC+KHG01S5kM+qVeTtsvgXEiNXy8mJLfvx0Ew6vLxfm5UOHYJ9EClx+xi30lQ47tGsA=
X-Gm-Gg: ATEYQzxELf+mtaL71eJk4LiWqRiVMpE+KOedlpC8Z32zyyDOzNB7u1igjOldmTeY+Kt
	6pLgHJipExqxAHOEBYK+BDTDxdIqO3or7f1EBM++HZN4znMsYlWX4YkhG4azyb+cMDPL+Bm9OrV
	efsUCr/ScuQy4ySsAtyKA1sPv8h6s+yFQoJtGrA3uHC7/I9HOKFVCv8of1tuTxxcLu98c8AHNsy
	lkV7hDQYJtc/QKaiYfsoiov4lKVPiS2uyUGrN9N+4extF2bak2R25U7X5Lx2zVdPCS6OLM6yCqx
	z1h9EaAITDmy5+q3SSVT5L5CarIsDKZ5i6yamPUO4XO50QE0FvCTND4vmqmIk0f+U2j5kMe57re
	/nWXXuJrNa1yvFP38XLzidPfk5vpbnISQNX24nn+/PR/hWPdQ19Zjh3NOretLdq8/3zuW0tL5NE
	7eIqme7E4r5kL6Aum3FCTz3ygXAHbXgTELtQH+tKB93N4e4lQ0j7EtChom0wc3gPGZ1BsLpEt+g
	d3Mm20nMU4=
X-Received: by 2002:a05:600c:c09c:b0:479:1b0f:dfff with SMTP id 5b1f17b1804b1-48883572459mr54451205e9.10.1775056891526;
        Wed, 01 Apr 2026 08:21:31 -0700 (PDT)
Received: from localhost (static-css-ccs-204145.business.bouyguestelecom.com. [176.157.204.145])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-48885553118sm21539815e9.14.2026.04.01.08.21.30
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 01 Apr 2026 08:21:30 -0700 (PDT)
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Wed, 01 Apr 2026 17:21:30 +0200
Message-Id: <DHHX5HYC3V4J.2G66IHM8JCKNT@smile.fr>
Subject: Re: [OE-core][whinlatter][PATCH 12/12] libinput: upgrade 1.29.1 ->
 1.29.2
From: "Yoann Congal" <yoann.congal@smile.fr>
Cc: "Mathieu Dubois-Briand" <mathieu.dubois-briand@bootlin.com>, "Richard
 Purdie" <richard.purdie@linuxfoundation.org>
To: <ankur.tyagi85@gmail.com>, <openembedded-core@lists.openembedded.org>
X-Mailer: aerc 0.20.0
References: <20260325021856.4053666-1-ankur.tyagi85@gmail.com>
 <20260325021856.4053666-12-ankur.tyagi85@gmail.com>
In-Reply-To: <20260325021856.4053666-12-ankur.tyagi85@gmail.com>
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 01 Apr 2026 15:21:34 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/234444

On Wed Mar 25, 2026 at 3:18 AM CET, Ankur Tyagi via lists.openembedded.org =
wrote:
> From: Ankur Tyagi <ankur.tyagi85@gmail.com>
>
> Release Notes:
> https://gitlab.freedesktop.org/libinput/libinput/-/releases/1.29.2
>
> Signed-off-by: Ankur Tyagi <ankur.tyagi85@gmail.com>
> Signed-off-by: Mathieu Dubois-Briand <mathieu.dubois-briand@bootlin.com>
> Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
> (cherry picked from commit 4cd78e63cbf4edaeac1fc9f46fb737e1356e3f1b)
> Signed-off-by: Ankur Tyagi <ankur.tyagi85@gmail.com>
> ---

Hello,

I'm sorry but this upgrade contains feature change and, because of that
is not eligible for stable merge:
* All those added/removed/reverted quirks
* libinput: Add libinput_event_gesture forward declaration

Regards,


>  .../wayland/{libinput_1.29.1.bb =3D> libinput_1.29.2.bb}          | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
>  rename meta/recipes-graphics/wayland/{libinput_1.29.1.bb =3D> libinput_1=
.29.2.bb} (97%)
>
> diff --git a/meta/recipes-graphics/wayland/libinput_1.29.1.bb b/meta/reci=
pes-graphics/wayland/libinput_1.29.2.bb
> similarity index 97%
> rename from meta/recipes-graphics/wayland/libinput_1.29.1.bb
> rename to meta/recipes-graphics/wayland/libinput_1.29.2.bb
> index 809c291e23..f771085388 100644
> --- a/meta/recipes-graphics/wayland/libinput_1.29.1.bb
> +++ b/meta/recipes-graphics/wayland/libinput_1.29.2.bb
> @@ -15,7 +15,7 @@ DEPENDS =3D "libevdev udev mtdev"
>  SRC_URI =3D "git://gitlab.freedesktop.org/libinput/libinput.git;protocol=
=3Dhttps;branch=3D1.29-branch;tag=3D${PV} \
>             file://run-ptest \
>             "
> -SRCREV =3D "dc2c1ad181be88e1487468f7ca6f9d320981f133"
> +SRCREV =3D "917783150a5bab7d55eedc5714f1b49b192426ac"
> =20
>  UPSTREAM_CHECK_GITTAGREGEX =3D "(?P<pver>\d+\.\d+\.(?!9\d+)\d+)"
> =20


--=20
Yoann Congal
Smile ECS


