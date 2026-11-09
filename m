Received: from mail-wr1-f49.google.com (mail-wr1-f49.google.com [209.85.221.49])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.3613.1794221974996543314
 for <openembedded-core@lists.openembedded.org>;
 Mon, 09 Nov 2026 02:59:35 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@smile.fr header.s=google2 header.b=eW50mHLa;
 spf=pass (domain: smile.fr, ip: 209.85.221.49, mailfrom: yoann.congal@smile.fr)
Received: by mail-wr1-f49.google.com with SMTP id ffacd0b85a97d-492fcbfaa87so448148f8f.3
        for <openembedded-core@lists.openembedded.org>; Mon, 09 Nov 2026 02:59:34 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=smile.fr; s=google2; t=1794221973; x=1794826773; darn=lists.openembedded.org;
        h=in-reply-to:references:subject:to:cc:from:message-id:date
         :content-type:content-transfer-encoding:mime-version:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=hoNmZRDPPp2uS041dvFkzCLh7AdT9Is4e3+MuphbF40=;
        b=eW50mHLaFs7Chk/iOiquqXu1+SsVhojyyjSmELTaE8W/W7+x5jqYw69MMIH6tqjQ9g
         Ci4wF4EkE3ZfhygOX6RkMR2hgbReChTCn7xh4+aSGyRjqdtn3egemOv4pp+MsrcxjNMj
         UhE0U69GEtSTQ7jEDV+S8YBN4jT8324RXtKryAa6EbzthjvD1ErUmMTZVgM9tZwN2rdS
         wj6ONbWxpAORambOi0p49iljT2f2uVlD4vFmkT02xfKcHD/YUS9Plh19SSRzqOtz5z1Z
         GIiX4KxOtFf0KolqOFYItr93uvlHaAcPjearzVM80ADDUJPh+x50limhD7O204chdRjL
         Ylcg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794221973; x=1794826773;
        h=in-reply-to:references:subject:to:cc:from:message-id:date
         :content-type:content-transfer-encoding:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=hoNmZRDPPp2uS041dvFkzCLh7AdT9Is4e3+MuphbF40=;
        b=AFN9EZrvD6Va4qWycuOsnO9lnnfsvGfoC6paUOs45tIwfOCHklAKrGoDwM6vl01tQQ
         vmkawP4fvcbIqIk2Wd/SpSxbq2iqlfXeqrlWo08vPl/OyA9NjZ0yoCztgZEGe+xm/d4a
         fa5N9mzekAbTm+l0X0I3m/9EL5o7c+0vc7qSvq9pUsu805OMrmJkU+IgrSY06ALup9aR
         7fTlNqXAMvZNlKZym1dtwYTEGQTixV8Cizxs/kLCqX1C//AnGqsI6lI1wvzbidndw48e
         +dVQpyEh6UYX8IzXO56+aK4NvYOoUBwYXA1oP3cX34gKIEsETYKrO1AHIl//g0kB5IBm
         UsJA==
X-Forwarded-Encrypted: i=1; AL+hErEa2a/yyzI8UkcO+1nMH1uSzVwUrVYNwcf5Pt5Xidt4EiGvPr17E/oslFc8eCUjS+0viQiSmRLH/P7prRtwvyks1w==@lists.openembedded.org
X-Gm-Message-State: APuU4Z8aPC6NBDbFuiEzWAeY5yTh0IwvrRzE3RwDfgkmzMWVOlbK+/CI
	my0HzkkN4G0+IB4mg0TxT4aPkFblEQQbjQ4J9HcIO1YZgZdbZPR3oed0YowKu4Bu3Rg=
X-Gm-Gg: AYBFou2ZoMp36rn7EYnA52T0U56OtwYqbwBHyrYU9SGVcTifhcVLGUK2mz6ZYOxvbSB
	+QkgkHbKL9LkNHNMTEfeV33fiGsw3GxV5z1bbRtQQ+z6z8cH8lPruLHSwUI09+JKNlNMFGF63Lq
	l4qDXRmIldkx8r4n/ujdFJMY6Lm356I1AnIsUs3IUSH7Zc82dmc1cOGepztR/WMwnh5u5F2nJZ3
	6q3G+hJQSOr0ojavJJnIo8eF7eEkY6caQgWFwKccYxnt9OU9t8IPm4YPNPUOqf6Ae66pT0Fx5r3
	Q45wQ/kkIdQMFZc3aNYrys1QeHvrGdnzm0X/hpa1PUjv+oOy4dzsBZYsNL4tcy5rjXNhgUMoM8t
	rimh7w8xOIKe1BHFtRjVwBvbCZ0cgQad6K8iNOfOLEIxP+x7HzUv3+Ln66M3NG9umzWzrLrZoot
	6t+/UcQjWTMXsmkg2O65VD8Zmo5eiirt+jd7iJdDHJZnFIPkfd15PtykoNb9TTLujbpZaqWHWUy
	qgfWLUU0wI/g7TI4IhgqVEpemYUjHx2O9aePAhHG9l0kr7nR67Y+fH+QMpKN+nNfISOa2dX1pzY
	BzYC6LJmFC2G2oPghpBL5rKzQYm1puFjGaF7NtZDAA502T5rvqAIOi2Wajj0f3s/j5OkZxmaPVg
	hAwR1CkRIuFAy1w==
X-Received: by 2002:a05:6000:22c5:b0:493:f3f2:223b with SMTP id ffacd0b85a97d-49582e8deecmr8407804f8f.12.1794221973051;
        Mon, 09 Nov 2026 02:59:33 -0800 (PST)
Return-Path: <yoann.congal@smile.fr>
Received: from localhost (static-css-ccs-204145.business.bouyguestelecom.com. [176.157.204.145])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-49592f38e2bsm9655718f8f.8.2026.11.09.02.59.32
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 09 Nov 2026 02:59:32 -0800 (PST)
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Mon, 09 Nov 2026 11:59:32 +0100
Message-Id: <DMQMLV305GEM.1SFJXBWCASXVH@smile.fr>
From: "Yoann Congal" <yoann.congal@smile.fr>
Cc: <cheng.jiang@oss.qualcomm.com>, <quic_chezhou@quicinc.com>,
 <wei.deng@oss.qualcomm.com>, <shuai.zhang@oss.qualcomm.com>,
 <mengshi.wu@oss.qualcomm.com>, <xiuzhuo.shang@oss.qualcomm.com>
To: "Jinwang Li" <jinwang.li@oss.qualcomm.com>,
 <openembedded-core@lists.openembedded.org>
Subject: Re: [wrynose][PATCH v2 5/5] bluez5: Fix u128_to_string skipping
 data[4]
X-Mailer: aerc 0.20.0
References: <20261021100829.2460593-1-jinwang.li@oss.qualcomm.com>
 <20261021100829.2460593-6-jinwang.li@oss.qualcomm.com>
In-Reply-To: <20261021100829.2460593-6-jinwang.li@oss.qualcomm.com>
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by lin-tor-korg-lkml-alma10-1 with HTTPS for <openembedded-core@lists.openembedded.org>; Mon, 09 Nov 2026 10:59:42 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/249802

On Wed Oct 21, 2026 at 12:08 PM CEST, Jinwang Li wrote:
> data[3] was used twice, skipping data[4] in the output string.
>
> Signed-off-by: Jinwang Li <jinwang.li@oss.qualcomm.com>
> ---
>  meta/recipes-connectivity/bluez5/bluez5.inc   |  1 +
>  ...p-Fix-u128_to_string-skipping-data-4.patch | 33 +++++++++++++++++++
>  2 files changed, 34 insertions(+)
>  create mode 100644 meta/recipes-connectivity/bluez5/bluez5/0001-obexd-pb=
ap-Fix-u128_to_string-skipping-data-4.patch
>
> diff --git a/meta/recipes-connectivity/bluez5/bluez5.inc b/meta/recipes-c=
onnectivity/bluez5/bluez5.inc
> index db650acdd0..75d76cf96d 100644
> --- a/meta/recipes-connectivity/bluez5/bluez5.inc
> +++ b/meta/recipes-connectivity/bluez5/bluez5.inc
> @@ -80,6 +80,7 @@ SRC_URI =3D "${KERNELORG_MIRROR}/linux/bluetooth/bluez-=
${PV}.tar.xz \
>             file://0001-avdtp-Fix-GET_CONFIGURATION-cmd.patch \
>             file://0001-avdtp-Return-correct-error-when-SEP-is-inuse.patc=
h \
>             file://0001-gobex-Fix-ABORT-response-being-discarded.patch \
> +           file://0001-obexd-pbap-Fix-u128_to_string-skipping-data-4.pat=
ch \
>             "
>  S =3D "${UNPACKDIR}/bluez-${PV}"

Hello,

Nit: Review is easier if the stable commit title matches the commit on
master.
No need to make a new version for this though.

Thanks!
--=20
Yoann Congal
Smile ECS

