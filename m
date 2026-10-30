Received: from mail-wm1-f51.google.com (mail-wm1-f51.google.com [209.85.128.51])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.13600.1793372123722683881
 for <openembedded-core@lists.openembedded.org>;
 Fri, 30 Oct 2026 07:55:24 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@smile.fr header.s=google2 header.b=aypUNPOM;
 spf=pass (domain: smile.fr, ip: 209.85.128.51, mailfrom: yoann.congal@smile.fr)
Received: by mail-wm1-f51.google.com with SMTP id 5b1f17b1804b1-4a20bde60a0so6359035e9.3
        for <openembedded-core@lists.openembedded.org>; Fri, 30 Oct 2026 07:55:23 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=smile.fr; s=google2; t=1793372122; x=1793976922; darn=lists.openembedded.org;
        h=in-reply-to:references:to:from:subject:message-id:date:content-type
         :content-transfer-encoding:mime-version:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=mfQDiek1DDDQbE/K+N82FAeJQ+A8smK/pVlVHvjsGYQ=;
        b=aypUNPOMCwt9T9yHqneg4Nz2P4MxiCTSBS5HFvHB5OJSBvf7hUwWRAscMtdtKUW+dN
         NwlXuiazw9RMndILSrlo0rF2wAN6vO5oZat+6d2XalgErhUZnFlIjU9u9FF6/1LsNwVa
         n3FMXaFhf7BQerHV07MJ9+k40wEEu2Zt7kXNkkBfittTV5ydtgOwn9FHGjsW7sXOzMGu
         H6Nx/T6H4omNHgf4O0W+J4gKdIQpCHWiIhBiXL/exuyQV58xSeF6X8m6u07GqglS1NjX
         5h/OSz3tmgnCmZbE69w2cvgb/u9R2PjD/RkacbNKDvlDrcPz/fNT7/Wpl2ywrTfBbxfp
         Izyg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793372122; x=1793976922;
        h=in-reply-to:references:to:from:subject:message-id:date:content-type
         :content-transfer-encoding:mime-version:x-gm-gg:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=mfQDiek1DDDQbE/K+N82FAeJQ+A8smK/pVlVHvjsGYQ=;
        b=NjcZqAuGLVcpBXGmBCXykP3EjgtZrFxb7dmMEIc+VzZoS4ky76GC8ZhapqVCK1+/Sc
         e8ZfPqxuzrtvmf1iv/knNo9hj+wxhlTaNYZYzSvT+OoS1/VSphBTL0Elb5vP07aNTxeu
         j9g4D+KESPsxUtVebOJK69DXLzdOVK9fcafonIVg4PnB1RtFE9q355ZALcQ9kaxT7VUA
         +WPlXr44D0VPcEMVD89g1jd8+97HHdqndze7lJZbrJwzAPqEeTBIe0GFRMW3kJ1R4Q6E
         hKUc1/Sw7to271R0VmmJ803RIYKVpxWx4H8+lHth8Hjd61NOVUwB3fNOZy91/tx9MKRP
         Qx/g==
X-Forwarded-Encrypted: i=1; AKwUvBxsbicDs8hoYweXL3WHEp9mUJKe2kj/HbqiSRsbudwiboAAbip+P+SRaB+nSbBegXqKt1l3x+tQz1RgWVswHIsWZg==@lists.openembedded.org
X-Gm-Message-State: AFq9FYIxCg5PYLLEDBRSVow974o3hm5r+ZEDXcYV19sj/IgRINZd9bMc
	QlKl7+12ADybp5Fh4AwYWXnwM0HSPh3gH6LPp1BsJslekDnhmop4jz8deSPlqLkoiwU=
X-Gm-Gg: AYBFou110U19QBaPYtwiWze5NZ2c28THrIr26+te8mT9kNkn8e2B2PHVZH8v4ZN78wY
	ArvfqhPGS+t65Idb1CpAxRPbzek9EWA6H5uL5uPjyV9AEeyr2PjsBbWj2ra85/a+tp9W13Tn5iY
	lkN3eS52K0HbR0OT56MsYDEZNhxCpk72rSNcWM8t5avgymvYjxBaWEVqAoo4THwsIDHnHjaZz4m
	Cov1FNjPM/w3pd6A8XkQAxHqyzVb2qEjABcpf9K28XQt18Ms0ZeVP1tvUvvLTbXGbLKVDlbytUK
	l6c5soqGBR4hVn11NVoBlorizs3Dp5xrecqE1KGYRgibj1Fh7Y/f3JmLa29kyD+M4hPYKR91Oe2
	oa8bmwl7zIMeWnlqi8bw1alK6gq4IT+Q0Wld3u5GWSR2xJ2wEou5M+ZGYG1KQKaJZWDdhIvC56v
	aBvQp2yzOEwa155GE1AFUxyEPr1QVWh88GgwktA97DsFDwCUsCjpIlmYAio/aB+RckVDAuWy39o
	TWp6mWjQiPnApnac/ZBuBDp1m0Y6QIS1GxTcFQXhWPwarfg2tUBiC6OgTCrow3ltuOX8rxxr4t6
	2GKBLz6Yf4UeI/2eW0qCgA15Z9yCbyuG1goWSXAmz3Xb0mBkKxjTEJRE/dNdCAdEIxRdT5h45Lq
	uDhrzIwSEhLYwAxbY
X-Received: by 2002:a05:600c:8b63:b0:4a2:40:7f35 with SMTP id 5b1f17b1804b1-4ac18993232mr53928715e9.31.1793372121804;
        Fri, 30 Oct 2026 07:55:21 -0700 (PDT)
Return-Path: <yoann.congal@smile.fr>
Received: from localhost (2a01cb001331aa00a2e4fb7b0d887544.ipv6.abo.wanadoo.fr. [2a01:cb00:1331:aa00:a2e4:fb7b:d88:7544])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4abf396dfdbsm68671915e9.1.2026.10.30.07.55.21
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 30 Oct 2026 07:55:21 -0700 (PDT)
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Fri, 30 Oct 2026 15:55:21 +0100
Message-Id: <DMI9CYTP539M.2XQG8FY4G0IBK@smile.fr>
Subject: Re: [OE-core] [scarthgap][PATCH v2 5/5] libsoup-2.4: fix
 CVE-2026-3633
From: "Yoann Congal" <yoann.congal@smile.fr>
To: <jason.stasiak@gmail.com>, <openembedded-core@lists.openembedded.org>
X-Mailer: aerc 0.20.0
References: <20260929205055.2403390-2-jason.stasiak@gmail.com>
 <20261014161209.2227316-1-jason.stasiak@garmin.com>
 <20261014161209.2227316-5-jason.stasiak@garmin.com>
In-Reply-To: <20261014161209.2227316-5-jason.stasiak@garmin.com>
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by lin-tor-korg-lkml-alma10-1 with HTTPS for <openembedded-core@lists.openembedded.org>; Fri, 30 Oct 2026 14:55:25 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/249052

On Wed Oct 14, 2026 at 6:12 PM CEST, Jason Stasiak via lists.openembedded.o=
rg wrote:
> Backport fix for CVE-2026-3633 [1] and additional supporting patches
> [2][3][4] from the upstream libsoup 3 repo.
>
> [1] https://gitlab.gnome.org/GNOME/libsoup/-/commit/7f2013d874f005035f224=
5e382ec82823a439926
> [2] https://gitlab.gnome.org/GNOME/libsoup/-/commit/0120f183ca2b74abeee84=
39f73abc8ab504fbccf
> [3] https://gitlab.gnome.org/GNOME/libsoup/-/commit/05910f8cb577682d444b0=
abaef670b4eb028e2fa
> [4] https://gitlab.gnome.org/GNOME/libsoup/-/commit/a90c442df5f980dd9a810=
8c9def3b06607662fc8
>
> Signed-off-by: Jason Stasiak <jason.stasiak@gmail.com>
> ---
>  .../libsoup/libsoup-2.4/CVE-2026-3633-1.patch |  51 ++++++++
>  .../libsoup/libsoup-2.4/CVE-2026-3633-2.patch |  53 ++++++++
>  .../libsoup/libsoup-2.4/CVE-2026-3633-3.patch |  49 ++++++++
>  .../libsoup/libsoup-2.4/CVE-2026-3633-4.patch | 113 ++++++++++++++++++
>  .../libsoup/libsoup-2.4_2.74.3.bb             |   4 +
>  5 files changed, 270 insertions(+)
>  create mode 100644 meta/recipes-support/libsoup/libsoup-2.4/CVE-2026-363=
3-1.patch
>  create mode 100644 meta/recipes-support/libsoup/libsoup-2.4/CVE-2026-363=
3-2.patch
>  create mode 100644 meta/recipes-support/libsoup/libsoup-2.4/CVE-2026-363=
3-3.patch
>  create mode 100644 meta/recipes-support/libsoup/libsoup-2.4/CVE-2026-363=
3-4.patch
>
> diff --git a/meta/recipes-support/libsoup/libsoup-2.4/CVE-2026-3633-1.pat=
ch b/meta/recipes-support/libsoup/libsoup-2.4/CVE-2026-3633-1.patch
> new file mode 100644
> index 0000000000..37eeb24409
> --- /dev/null
> +++ b/meta/recipes-support/libsoup/libsoup-2.4/CVE-2026-3633-1.patch
> @@ -0,0 +1,51 @@
> +From 5d61da4e261fab02d07dc74bb3049bbd13535247 Mon Sep 17 00:00:00 2001
> +From: Jason Stasiak <jason.stasiak@garmin.com>
> +Date: Fri, 25 Sep 2026 10:17:05 -0700
> +Subject: [PATCH 1/4] CVE-2026-3633: Make SoupMessage a private and final=
 type

Please keep upstream authorship info and title.

> +
> +CVE: CVE-2026-3633
> +Upstream-Status: Backport [ https://gitlab.gnome.org/GNOME/libsoup/-/com=
mit/0120f183ca2b74abeee8439f73abc8ab504fbccf ]
> +
> +Backport the introduction of soup_message_set_method() from upstream
> +libsoup 3 patch to begin alignment of libsoup 2.4 code with that needed
> +to address CVE-2026-3633.
> +
> +Signed-off-by: Jason Stasiak <jason.stasiak@gmail.com>
> +---
> + libsoup/soup-message-private.h |  2 ++
> + libsoup/soup-message.c         | 10 ++++++++++
> + 2 files changed, 12 insertions(+)
> +
> +diff --git a/libsoup/soup-message-private.h b/libsoup/soup-message-priva=
te.h
> +index c30361c0..ee73112f 100644
> +--- a/libsoup/soup-message-private.h
> ++++ b/libsoup/soup-message-private.h
> +@@ -179,4 +179,6 @@ gboolean    soup_message_has_chunk_allocator (SoupMe=
ssage *msg);
> + SoupBuffer *soup_message_allocate_chunk      (SoupMessage *msg,
> + 					      goffset      read_length);
> +=20
> ++void	soup_message_set_method (SoupMessage        *msg,
> ++		                         const char         *method);
> + #endif /* __SOUP_MESSAGE_PRIVATE_H__ */
> +diff --git a/libsoup/soup-message.c b/libsoup/soup-message.c
> +index cc4f22b6..eae11eea 100644
> +--- a/libsoup/soup-message.c
> ++++ b/libsoup/soup-message.c
> +@@ -2394,3 +2394,13 @@ soup_message_allocate_chunk (SoupMessage *msg,
> +=20
> + 	return priv->chunk_allocator (msg, read_length, priv->chunk_allocator_=
data);
> + }
> ++
> ++
> ++void
> ++soup_message_set_method (SoupMessage *msg,
> ++                         const char  *method)
> ++{
> ++	g_return_if_fail (method !=3D NULL);
> ++
> ++	msg->method =3D g_intern_string (method);

Same idea, please don't reindent upstream code.
Also, upstream, that function uses soup_message_get_instance_private()
that your don't, can you explain why?

(I'll stop my review here, please apply the above reviews and from the
previous patches of the series to the next patches)

Thanks!
--=20
Yoann Congal
Smile ECS

