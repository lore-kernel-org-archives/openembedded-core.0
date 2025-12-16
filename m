Return-Path: <ankur.tyagi85@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id DCE4FD609B1
	for <webhook@archiver.kernel.org>; Tue, 16 Dec 2025 16:09:56 +0000 (UTC)
Received: from mail-oo1-f46.google.com (mail-oo1-f46.google.com [209.85.161.46])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.26394.1765901394919685354
 for <openembedded-core@lists.openembedded.org>;
 Tue, 16 Dec 2025 08:09:55 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=m+gcicOX;
 spf=pass (domain: gmail.com, ip: 209.85.161.46, mailfrom: ankur.tyagi85@gmail.com)
Received: by mail-oo1-f46.google.com with SMTP id 006d021491bc7-6597a87048bso2765206eaf.1
        for <openembedded-core@lists.openembedded.org>; Tue, 16 Dec 2025 08:09:54 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1765901394; x=1766506194; darn=lists.openembedded.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=hhCSqWRmjP5qMiwD3JIQiFfg7GAoTiHnvsWvWvLwA0c=;
        b=m+gcicOXtfwR/2a+fmXUEaT+htL4cadZwTwbb4tZGUt3yXu5LODcdKGmGnkRYMvD6N
         p0Y7WlpiYBfSzImI4oOvf9al6Q6N7hVlCeLreyIjALc6pClnT8rqyoRbUAY3J2eHNRie
         MNnsHOH5WwFXy7LRYLWMxwuyVbWTlLpIrGwOwXTx85RiFcJ/LLiA+4Wa2+ycyoF5b2Pt
         /nhpaEaokRkdX5tCNjQLA5zJHxX+j+9sn0xwu26GlBwyYgv8/Hzt4jRzC7O4dMcpYg0Z
         Z6P3I8KTFegMZL3YD3a1S/Z7BiSGQyUdXkNPTYCLIxUhAJYDZbNck7ohqiHbj3BdZSq3
         wDWQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1765901394; x=1766506194;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=hhCSqWRmjP5qMiwD3JIQiFfg7GAoTiHnvsWvWvLwA0c=;
        b=gk7uIsPAI7734AmVoXfT7wDWU0rPEc6uw1b4Uqr1JHoBfBDsxxE7g8n9EjlvbIUtSW
         dw9qpL1vuw5KxASYNJOUd76DKcDqW5eJRc5pe31OOr/hViKXyBQVSFOWS7N0Tu2SI5/L
         tqetp64adOpGId4ox7BByj2MEmDXl/3lYS/eeXgPyeVpjnmf1D1lruZKkVvAxDFqMZGp
         oXSpZGklAu6tJaLpxsiq/Jz26CVcCS0TRZHXxoVgooR2tV03VGNrW6GWa5aWBXm/nNqg
         qVr1sHN9s07bmEnebu9iQVbftKh74h0MgzK88THOLYbRZFy+toDPtWA0I4Fomqj24KVP
         zj7g==
X-Gm-Message-State: AOJu0YymW/eW435+0sQURZKGPQwJ97J3c1yJiuD2P9Sb6AF58qIUuny/
	/vd9wPlbBe+DyJbtLa2JxKfOF72dAD652RtpsdtScqMwLFz4GjhCjwf/OULehHwJGVsrI+ChYhU
	kbTH3os2QeQL9g/WsAx+QVnUE1Y/UgyfLkhk5KHA=
X-Gm-Gg: AY/fxX4CalI9Laq2qtpMm+HEZy0T/hlEm96Z/mMNm2ES5yKzeQFe/a0X9M2qQo+ia3q
	cRD9QVO1tEYDSmCjuujqHOBKFsXnOfZJcwkM/uRCZoGcGg6KCUB1cBJk8kQi/vuxvNrPQqA6RMF
	mYE8tzPl3xi2Jv0lbE0GEIHQwIqFy1r7vcZMd46L46SUdP4PkFc9mdFcaAdfG9jF9MY1Vp6Ro8P
	a9iDptgjmIN7NEOmKhAOsQc5VcE516AtHds0sePqB72cg57VLjtnNuQ2aMvvjXW2STJBdABNRpl
	gF5uCkDj
X-Google-Smtp-Source: AGHT+IGm0qYiC3F09D5N+JqvAxFsvq9993HjIpuXr7s889MFSewMNxvmh5bZ4toRmkQVMw9stKgUZayCA8b3XjKpm/Y=
X-Received: by 2002:a05:6820:1509:b0:659:9a49:8ee2 with SMTP id
 006d021491bc7-65b4523f966mr8147649eaf.22.1765901392440; Tue, 16 Dec 2025
 08:09:52 -0800 (PST)
MIME-Version: 1.0
References: <20251213095931.2571498-1-ankur.tyagi85@gmail.com> <20251213095931.2571498-10-ankur.tyagi85@gmail.com>
In-Reply-To: <20251213095931.2571498-10-ankur.tyagi85@gmail.com>
From: Ankur Tyagi <ankur.tyagi85@gmail.com>
Date: Tue, 16 Dec 2025 21:39:40 +0530
X-Gm-Features: AQt7F2r4GJIV5JkYwR6JMfdKUYUX0T5VW90x8Wtj0SQIMb2PQTGtxlbP9TYvBMA
Message-ID: <CADySD0FSidmGiiNnStJBhisKGV0Xw4MPuK_X=zngtTswAd=R1A@mail.gmail.com>
Subject: Re: [OE-core][whinlatter][PATCH 10/67] systemd: use "+=" to set PACKAGE_BEFORE_PN
To: openembedded-core@lists.openembedded.org
Cc: Ming Liu <liu.ming50@gmail.com>, 
	Mathieu Dubois-Briand <mathieu.dubois-briand@bootlin.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 16 Dec 2025 16:09:56 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/227976

My recommendation is to include this patch.

On Sat, Dec 13, 2025 at 3:30=E2=80=AFPM <ankur.tyagi85@gmail.com> wrote:
>
> From: Ming Liu <liu.ming50@gmail.com>
>
> This avoid overridding the original PACKAGE_BEFORE_PN value could be
> set in bbclasses.
>
> Signed-off-by: Ming Liu <liu.ming50@gmail.com>
> Signed-off-by: Mathieu Dubois-Briand <mathieu.dubois-briand@bootlin.com>
> (cherry picked from commit 85eb46d62f81a1618b5d16863808a5ddb248fcf3)
> Signed-off-by: Ankur Tyagi <ankur.tyagi85@gmail.com>
> ---
>  meta/recipes-core/systemd/systemd_257.8.bb | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
>
> diff --git a/meta/recipes-core/systemd/systemd_257.8.bb b/meta/recipes-co=
re/systemd/systemd_257.8.bb
> index 549eb7fb29..20fe77fb13 100644
> --- a/meta/recipes-core/systemd/systemd_257.8.bb
> +++ b/meta/recipes-core/systemd/systemd_257.8.bb
> @@ -412,7 +412,7 @@ python populate_packages:prepend (){
>  }
>  PACKAGES_DYNAMIC +=3D "^lib(udev|systemd|nss).*"
>
> -PACKAGE_BEFORE_PN =3D "\
> +PACKAGE_BEFORE_PN +=3D "\
>      ${PN}-analyze \
>      ${PN}-binfmt \
>      ${PN}-container \

