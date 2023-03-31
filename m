Return-Path: <richard.purdie@linuxfoundation.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id B4B00C76196
	for <webhook@archiver.kernel.org>; Fri, 31 Mar 2023 12:06:48 +0000 (UTC)
Received: from mail-wm1-f52.google.com (mail-wm1-f52.google.com [209.85.128.52])
 by mx.groups.io with SMTP id smtpd.web11.52807.1680264407954940104
 for <openembedded-core@lists.openembedded.org>;
 Fri, 31 Mar 2023 05:06:48 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@linuxfoundation.org header.s=google header.b=gzWZrNiS;
 spf=pass (domain: linuxfoundation.org, ip: 209.85.128.52, mailfrom: richard.purdie@linuxfoundation.org)
Received: by mail-wm1-f52.google.com with SMTP id v6-20020a05600c470600b003f034269c96so3461460wmo.4
        for <openembedded-core@lists.openembedded.org>; Fri, 31 Mar 2023 05:06:47 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linuxfoundation.org; s=google; t=1680264406;
        h=mime-version:user-agent:content-transfer-encoding:references
         :in-reply-to:date:to:from:subject:message-id:from:to:cc:subject:date
         :message-id:reply-to;
        bh=4Ymkx0rm0iuaZiSxduRk/c6kEgyF+Y2KUdYAw99kRAY=;
        b=gzWZrNiSJR8cPEJVTFKObip0MnUu1FZNxXZhahDRRwTX85Xq0puQPsedavw9g8I9fy
         YNYw1295Txc6EEwoicOKiQXHxjGRSUMP8kjfO6XjKGLhIg2aLoScG3Oz3uKF39L06x5x
         N3B7sDOl7nZpoASML3LSZaUrtJOb7KvXdhzQQ=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112; t=1680264406;
        h=mime-version:user-agent:content-transfer-encoding:references
         :in-reply-to:date:to:from:subject:message-id:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=4Ymkx0rm0iuaZiSxduRk/c6kEgyF+Y2KUdYAw99kRAY=;
        b=u98jRCdGkdpS4rvtU9L926rXkU0RaLxzkJvxlw4se0MYUp6F8T6XAHjOjVp87W4bzm
         yXpHKVJaOjMD/FGmf7wklR39Q0YMbzzmOZOWIkSs6ak+r3wSDnlkqCBYkHFGG2WuId0/
         BVIVe2TI6nwDo6OR7FgC1vKoyDXpg+jZrfj5+55w+vFapwmD/KuqQBnCS3NlNQpkHvkP
         GvycJSAeyb62UxG6HB0I6q7YpcOjTlZomr7nbY4iK8orTzRLJXEuuMLwjVGuxXbQmiQf
         PAjLbzxSd0EtWWrlEuPK88sJpELdMEsEqt4+KCVeKhjDR65dysh/vNLYa/vgg/2lFBNV
         ysng==
X-Gm-Message-State: AO0yUKWpsKx+IK5ZC6ST+Bm+7FRp4WGzMHU+lMtQHj4d46cOxdnjIe65
	h8ESzuMiyaqmy9rQv3vG6RlMgA==
X-Google-Smtp-Source: AK7set8NHzDk/xBjCBDO1wgh8sztLylndS2agwzF2B3Y87mpa5VnmugEB6M1JDLVHXQMvnGHbzuFSQ==
X-Received: by 2002:a7b:c5c1:0:b0:3ee:5bd8:d537 with SMTP id n1-20020a7bc5c1000000b003ee5bd8d537mr20528283wmk.5.1680264406317;
        Fri, 31 Mar 2023 05:06:46 -0700 (PDT)
Received: from ?IPv6:2001:8b0:aba:5f3c:18b7:bfe:d74b:7341? ([2001:8b0:aba:5f3c:18b7:bfe:d74b:7341])
        by smtp.gmail.com with ESMTPSA id g16-20020a5d5550000000b002c5598c14acsm2084379wrw.6.2023.03.31.05.06.45
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 31 Mar 2023 05:06:45 -0700 (PDT)
Message-ID: <e1408db180e41666a38260a9f45f6edf7f725192.camel@linuxfoundation.org>
Subject: Re: [OE-core][PATCH v4 06/10] webkitgtk: add missing dependencies
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: Petr =?UTF-8?Q?Kubiz=C5=88=C3=A1k?= <kubiznak@2n.com>, 
	openembedded-core@lists.openembedded.org
Date: Fri, 31 Mar 2023 13:06:45 +0100
In-Reply-To: <20230331114634.3578244-6-kubiznak@2n.com>
References: <20230331114634.3578244-1-kubiznak@2n.com>
	 <20230331114634.3578244-6-kubiznak@2n.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
User-Agent: Evolution 3.47.3-1 
MIME-Version: 1.0
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Fri, 31 Mar 2023 12:06:48 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/179439

On Fri, 2023-03-31 at 13:46 +0200, Petr Kubiz=C5=88=C3=A1k wrote:
> When gobject-introspection feature is disabled, gettext and
> glib-2.0-native dependencies are not pulled in, which causes failures
> in do_compile due to missing xgettext and gdbus-codegen.
>=20
> Signed-off-by: Petr Kubiz=C5=88=C3=A1k <kubiznak@2n.com>
> ---
>  meta/recipes-sato/webkit/webkitgtk_2.38.5.bb | 3 ++-
>  1 file changed, 2 insertions(+), 1 deletion(-)
>=20
> diff --git a/meta/recipes-sato/webkit/webkitgtk_2.38.5.bb b/meta/recipes-=
sato/webkit/webkitgtk_2.38.5.bb
> index e52920883a..b49ecf2a31 100644
> --- a/meta/recipes-sato/webkit/webkitgtk_2.38.5.bb
> +++ b/meta/recipes-sato/webkit/webkitgtk_2.38.5.bb
> @@ -17,7 +17,7 @@ SRC_URI =3D "https://www.webkitgtk.org/releases/${BPN}-=
${PV}.tar.xz \
>             "
>  SRC_URI[sha256sum] =3D "40c20c43022274df5893f22b1054fa894c3eea057389bb08=
aee08c5b0bb0c1a7"
> =20
> -inherit cmake pkgconfig gobject-introspection perlnative features_check =
upstream-version-is-even gi-docgen
> +inherit cmake pkgconfig gobject-introspection perlnative features_check =
upstream-version-is-even gi-docgen gettext
> =20
>  ANY_OF_DISTRO_FEATURES =3D "${GTK3DISTROFEATURES}"
>  REQUIRED_DISTRO_FEATURES =3D "${@bb.utils.contains('DISTRO_FEATURES', 'w=
ayland', 'opengl', '', d)}"
> @@ -38,6 +38,7 @@ DEPENDS +=3D " \
>            libnotify \
>            gstreamer1.0 \
>            gstreamer1.0-plugins-base \
> +          glib-2.0-native \
>            "
> =20
>  PACKAGECONFIG_SOUP ?=3D "soup3"

If the dependency is just xgettext then it may just be a DEPENDS +=3D
"gettext-native"  which is a lower requirement than the full gettext
target code?

Cheers,

Richard


