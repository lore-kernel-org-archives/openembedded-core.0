Received: from mail-wr1-f42.google.com (mail-wr1-f42.google.com [209.85.221.42])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.2333.1792482937642389652
 for <openembedded-core@lists.openembedded.org>;
 Tue, 20 Oct 2026 00:55:37 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@smile.fr header.s=google header.b=ykKkTdhu;
 spf=pass (domain: smile.fr, ip: 209.85.221.42, mailfrom: yoann.congal@smile.fr)
Received: by mail-wr1-f42.google.com with SMTP id ffacd0b85a97d-48df8fe8513so2470013f8f.0
        for <openembedded-core@lists.openembedded.org>; Tue, 20 Oct 2026 00:55:37 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=smile.fr; s=google; t=1792482936; x=1793087736; darn=lists.openembedded.org;
        h=in-reply-to:references:cc:from:subject:to:message-id:date
         :content-type:content-transfer-encoding:mime-version:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=htIVBE1Co75Lp30NREttJrY1WeuCVCIW1PIEDOqe3u4=;
        b=ykKkTdhusaLncj2ZI1wUn62aRtMZt1tZRy4A/xffIvHBVGBrQDRXyacDK/OpZFpdjS
         E3HqMrtw3DgtbwS8lqgB76exVbSBv9KDPZ8Sjd46UWMNDBZTxp7eHA8jIgg8r0Nl0X9J
         njnRIEjbJL6PcFOLsBWormGenx5QpJCmKx/NY=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792482936; x=1793087736;
        h=in-reply-to:references:cc:from:subject:to:message-id:date
         :content-type:content-transfer-encoding:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=htIVBE1Co75Lp30NREttJrY1WeuCVCIW1PIEDOqe3u4=;
        b=BHfzIpNPyfPvFM1kJwM4jfVk9L9PmnZ53VK2xS8EKFNmWCfNqpIPWAy91zXCSL+TIB
         xPOeZ7FCwJKECy4wF55zGqTemyCUhtjX/XS3PtGQOb8dz1ZspgRyH+97DFDcaCOh1Ddh
         Zdr/YGld6zmr4BLkt42DJFSxIFP9JRF3cHxGK/vw6QSNtAYUab8+d75M7pCbNbllpd4y
         9wwcVS8nkPUzGYNfXurR1OZb12YsRTcJrixw2NOFjSNaAtD2VGifi3QKYTFeyH8p3hOR
         x+TIO5mJnaRZ+mAt4EBBDqkhI9JbzWHISGsON6ZMRhRJfXWOtBWf/dGq/3ksh6sxRKgU
         BkQw==
X-Forwarded-Encrypted: i=1; AKwUvBxaCPI210Wfy4teJpPAyKhV8ZFjgcnEtXwdEOdJfd9E5aZwi69dK0W4vocVKxDpKVOYlChyy20RmPuuMquKFk6PHQ==@lists.openembedded.org
X-Gm-Message-State: AFq9FYKCcBJfOJCMv/jyEQYSBRHTeqSyKxY+FGhok0RtFwDszupL/DB1
	l0Z7I1sNLtIEDEdVDL/Usp/CW1rrRq0qkH510hzOpz/BlUtOHu9GNn9pULjcWkXmifA=
X-Gm-Gg: AYBFou15c5ufgtWYOsgNsjxUeuUzLsYXB31wG7KWn/BRuDjw9QxoEK8SnM/PivfJlXa
	lYsqmFsZuL+TG7fJoYRRv9FaAwno//04cGiwQDLyY/dj9pZlTkAo4ucVJCl0WqUvqlxOdPJDFV/
	8mk/BhJMAEIb7DAZmbH+H8ye338tURVO4wkt8/9uNzp1cd+bAZP2eAYglWCce3bt0lJn0R1fsl5
	Suy7lhjrZxdKSCJ6mJqPURbeO7YjfMcJSr5URcIGJfXc+alIHGZpk5j7bh5eP7Zk4KJDVYHzSZY
	u+lSLKuq5RUlKl6EzfBBQYBCE0x6YBBvpHkVERnDTXhCm7wZiXZzBSnKNeyd2vGXvrzaPp29i38
	oHBtPJy2DSYBz1hJpzj9KlMLlfm9Dt1LLDZFA/nKwWSWS9FUJKP27ARjiXHzNjy43WPjsIzvFAH
	bP5NyAkiLgE5+DX9uLQAKkHqrmj2+JHfQlUT8hj3yzjmHpDm+axASOwpLJuEPKUYwxjRNx2ukA6
	ZbKayVXA+89KbhWXKrnhoNMB18ej4Vs+aKSjsSpMInrkcHIuHb5NZB7fnA27Ei9MelgsuA=
X-Received: by 2002:a05:6000:41c7:b0:48d:ef0e:b791 with SMTP id ffacd0b85a97d-48e07fad0cemr20540261f8f.54.1792482935842;
        Tue, 20 Oct 2026 00:55:35 -0700 (PDT)
Return-Path: <yoann.congal@smile.fr>
Received: from localhost (2a02-8440-a50d-9979-1d13-70a0-c696-7744.rev.sfr.net. [2a02:8440:a50d:9979:1d13:70a0:c696:7744])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-48e1d80fafdsm4518767f8f.9.2026.10.20.00.55.34
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 20 Oct 2026 00:55:35 -0700 (PDT)
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Tue, 20 Oct 2026 09:55:34 +0200
Message-Id: <DM9I6420LTND.2J9OGZ7CQET61@smile.fr>
To: <jinwang.li@oss.qualcomm.com>,
 <openembedded-core@lists.openembedded.org>
Subject: Re: [OE-core] [wrynose][PATCH 2/5] bluez5: Fix GET_CONFIGURATION
 cmd
From: "Yoann Congal" <yoann.congal@smile.fr>
Cc: <cheng.jiang@oss.qualcomm.com>, <quic_chezhou@quicinc.com>,
 <wei.deng@oss.qualcomm.com>, <shuai.zhang@oss.qualcomm.com>,
 <mengshi.wu@oss.qualcomm.com>, <xiuzhuo.shang@oss.qualcomm.com>
X-Mailer: aerc 0.20.0
References: <20261019082346.3287363-1-jinwang.li@oss.qualcomm.com>
 <20261019082346.3287363-3-jinwang.li@oss.qualcomm.com>
In-Reply-To: <20261019082346.3287363-3-jinwang.li@oss.qualcomm.com>
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by lin-tor-korg-lkml-alma10-1 with HTTPS for <openembedded-core@lists.openembedded.org>; Tue, 20 Oct 2026 07:55:47 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/248241

On Mon Oct 19, 2026 at 10:23 AM CEST, Jinwang Li via lists.openembedded.org=
 wrote:
> Check the resolved stream instead of an always-NULL sep pointer
> when testing for BAD_ACP_SEID.
>
> Signed-off-by: Jinwang Li <jinwang.li@oss.qualcomm.com>
> ---
>  meta/recipes-connectivity/bluez5/bluez5.inc   |  1 +
>  ...0001-avdtp-Fix-GET_CONFIGURATION-cmd.patch | 37 +++++++++++++++++++
>  2 files changed, 38 insertions(+)
>  create mode 100644 meta/recipes-connectivity/bluez5/bluez5/0001-avdtp-Fi=
x-GET_CONFIGURATION-cmd.patch
>
> diff --git a/meta/recipes-connectivity/bluez5/bluez5.inc b/meta/recipes-c=
onnectivity/bluez5/bluez5.inc
> index 169269d377..7e05bda4f1 100644
> --- a/meta/recipes-connectivity/bluez5/bluez5.inc
> +++ b/meta/recipes-connectivity/bluez5/bluez5.inc
> @@ -77,6 +77,7 @@ SRC_URI =3D "${KERNELORG_MIRROR}/linux/bluetooth/bluez-=
${PV}.tar.xz \
>             file://0001-profile-Set-L2CAP-IMTU-for-OBEX-profile-listeners=
.patch \
>             file://0001-adapter-restrict-delta-0-RSSI-to-proximity-filter=
s.patch \
>             file://0001-avdtp-Fix-error-handling-for-AVDTP_OPEN-cmd.patch=
 \
> +           file://0001-avdtp-Fix-GET_CONFIGURATION-cmd.patch \
>             "
>  S =3D "${UNPACKDIR}/bluez-${PV}"
> =20
> diff --git a/meta/recipes-connectivity/bluez5/bluez5/0001-avdtp-Fix-GET_C=
ONFIGURATION-cmd.patch b/meta/recipes-connectivity/bluez5/bluez5/0001-avdtp=
-Fix-GET_CONFIGURATION-cmd.patch
> new file mode 100644
> index 0000000000..eb1738f75c
> --- /dev/null
> +++ b/meta/recipes-connectivity/bluez5/bluez5/0001-avdtp-Fix-GET_CONFIGUR=
ATION-cmd.patch
> @@ -0,0 +1,37 @@
> +From 8e5ca68aeee22970e3ccf3bbb30c050938ba09a2 Mon Sep 17 00:00:00 2001
> +From: Simon Mikuda <simon.mikuda@streamunlimited.com>
> +Date: Mon, 8 Jun 2026 13:29:22 +0200
> +Subject: [PATCH] avdtp: Fix GET_CONFIGURATION cmd
> +
> +This fixes AVDTP/SNK/ACP/SIG/SMG/BV-12-C
> +Upstream-Status: Backport [https://github.com/bluez/bluez/commit/60437c0=
6560e46d211aaf99620cc9510dfd8081f]
> +Signed-off-by: Simon Mikuda <simon.mikuda@streamunlimited.com>
> +Signed-off-by: Jinwang Li <jinwang.li@oss.qualcomm.com>

Hello,

Simon Mikuda's SoB is not in the upstream commit.
Please remove it.

Regards,
--=20
Yoann Congal
Smile ECS

