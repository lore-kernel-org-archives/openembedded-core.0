Received: from mail-wr1-f45.google.com (mail-wr1-f45.google.com [209.85.221.45])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.2345.1792482986431651601
 for <openembedded-core@lists.openembedded.org>;
 Tue, 20 Oct 2026 00:56:26 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@smile.fr header.s=google header.b=DSh54Z0c;
 spf=pass (domain: smile.fr, ip: 209.85.221.45, mailfrom: yoann.congal@smile.fr)
Received: by mail-wr1-f45.google.com with SMTP id ffacd0b85a97d-48b042c0728so830078f8f.1
        for <openembedded-core@lists.openembedded.org>; Tue, 20 Oct 2026 00:56:26 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=smile.fr; s=google; t=1792482984; x=1793087784; darn=lists.openembedded.org;
        h=in-reply-to:references:subject:to:cc:from:message-id:date
         :content-type:content-transfer-encoding:mime-version:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=JWEzg9QvMH0ayijVs1EAiVF+4udlnNZwR0Bs6CD10MU=;
        b=DSh54Z0c48GUcfdV6j+89tSxF7SIx4DtvfqRPolbVN8h6xf22f5L2ds2J4/wtJii+0
         4MQmlkL6OjfzV31mZX02AogSkT9zDrCrfS8rfYxcw6b0QXalG2j3mCUuGLeslXhqYPIt
         qLMkgF7WIPPzSB/BukNqd8Paq6230CGJov8MA=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792482984; x=1793087784;
        h=in-reply-to:references:subject:to:cc:from:message-id:date
         :content-type:content-transfer-encoding:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=JWEzg9QvMH0ayijVs1EAiVF+4udlnNZwR0Bs6CD10MU=;
        b=ZqmdlCJ6pNSoAqNBHadowXhgDzuI4iCbDUIV7jhSgEP8OVVo38Y5JUPt8YUYGBGK0g
         Lueu38QRrtYJusYcCZoRHA7v1izJPkjDMZAa5SOmdFZmQfTQUKMmaF1R+vuSRNTZ2ofR
         roX9Twb9ZqoNMVZZYUCIujqFzhqw46lusLqiDmMxx8lYs6Yy6jPDgBCsy9l35+39ZWCd
         CtqpZPoKqv1McZEeY3uWOA+SJ6CfMFIl33ZflrgSuuxBOEMbXW13UutHqN186ErnPu/N
         a5LdyhzHTpzoJGdusnI/LTF6qumx6jTjNsaSsHansBJuyJg8i11G5p7GZ4ruGOk8Yla2
         0mww==
X-Forwarded-Encrypted: i=1; AKwUvBzEU13GdaMq7IF/O2xXDy5d0Bk6VIKP5ityR8jSGhtkiU/Ia5nQ7lbyc8s+S1VURhf7gPXqQ8NWw2PCJO32J33Dvg==@lists.openembedded.org
X-Gm-Message-State: AFq9FYIZqct7/usUvjWphyB2NFsAzmlXhg+NjGom9oQ5ZYk/usWcyT/3
	K0aYa3DS9QlkPKMA+AUv/CxClNrltUEYXg+0YVRvayQx83hVkSHtVzu6eHVWVsDdJCA=
X-Gm-Gg: AYBFou3DP8Ofb28fZwBI0k3ExXcgT6c3BtmgVQ41MS+t52mEXcgf3D6LBEWTjBfy14B
	70bHwfYauIfItqB44qdgvxM8RpV6lLBKgzrT3otlFonKDO1HZw7Nv98VampfiprMBk044iqYgHU
	XQyX69jG8kM8f/lVxYLC0XH6FmkU90StU2PaGlKntTWlpbpWrOixAMvBTafThTwJK+oLYAhvwn7
	ypJat7TQK+vUsE4YeLOxx3o1PCesbbinAU5Q9UPChHWbVXRXMmixc0696hAOa2yrFaVNVV6UvQ4
	uD7iGP9MvbypcJhKA9fsjgVuru/rnzWdJ3EGPNvXpXEeUJLXrbu+uN2ye8KVXizdiaFd6PupIRT
	X86luBxzg9DehWjhcaSSnxEczRI/r9wHniYijlpSuJqju51Idr0HHZNBt1zBCeW23eZxbjkR+Bn
	mfDibr6DllilSb/TUKRaTuPiBCUFXLq67ZUCSAzNKrP7/tORW/RKIofon4UyixrkO34ZwZGUsyB
	PfqWzhxfbu6uuj0odlHGI65ySr1TpAdeJLhDaguHlSBfVQ04MAdx0SDA9Mw
X-Received: by 2002:a05:600c:8b6f:b0:4a1:ce33:1536 with SMTP id 5b1f17b1804b1-4a1d75e37ecmr185623845e9.9.1792482984473;
        Tue, 20 Oct 2026 00:56:24 -0700 (PDT)
Return-Path: <yoann.congal@smile.fr>
Received: from localhost (2a02-8440-a50d-9979-1d13-70a0-c696-7744.rev.sfr.net. [2a02:8440:a50d:9979:1d13:70a0:c696:7744])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4a1f37f7fc3sm32706105e9.2.2026.10.20.00.56.23
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 20 Oct 2026 00:56:24 -0700 (PDT)
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Tue, 20 Oct 2026 09:56:23 +0200
Message-Id: <DM9I6QNVIGDH.2G5XUUVOLDYY2@smile.fr>
From: "Yoann Congal" <yoann.congal@smile.fr>
Cc: <cheng.jiang@oss.qualcomm.com>, <quic_chezhou@quicinc.com>,
 <wei.deng@oss.qualcomm.com>, <shuai.zhang@oss.qualcomm.com>,
 <mengshi.wu@oss.qualcomm.com>, <xiuzhuo.shang@oss.qualcomm.com>
To: <jinwang.li@oss.qualcomm.com>,
 <openembedded-core@lists.openembedded.org>
Subject: Re: [OE-core] [wrynose][PATCH 3/5] bluez5: Return correct error
 when SEP is inuse
X-Mailer: aerc 0.20.0
References: <20261019082346.3287363-1-jinwang.li@oss.qualcomm.com>
 <20261019082346.3287363-4-jinwang.li@oss.qualcomm.com>
In-Reply-To: <20261019082346.3287363-4-jinwang.li@oss.qualcomm.com>
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by lin-tor-korg-lkml-alma10-1 with HTTPS for <openembedded-core@lists.openembedded.org>; Tue, 20 Oct 2026 07:56:27 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/248242

On Mon Oct 19, 2026 at 10:23 AM CEST, Jinwang Li via lists.openembedded.org=
 wrote:
> Reject AVDTP_SET_CONFIGURATION with SEP_IN_USE when the SEID is
> already bound to an active stream.
>
> Signed-off-by: Jinwang Li <jinwang.li@oss.qualcomm.com>
> ---
>  meta/recipes-connectivity/bluez5/bluez5.inc   |  1 +
>  ...turn-correct-error-when-SEP-is-inuse.patch | 33 +++++++++++++++++++
>  2 files changed, 34 insertions(+)
>  create mode 100644 meta/recipes-connectivity/bluez5/bluez5/0001-avdtp-Re=
turn-correct-error-when-SEP-is-inuse.patch
>
> diff --git a/meta/recipes-connectivity/bluez5/bluez5.inc b/meta/recipes-c=
onnectivity/bluez5/bluez5.inc
> index 7e05bda4f1..de9835e5a7 100644
> --- a/meta/recipes-connectivity/bluez5/bluez5.inc
> +++ b/meta/recipes-connectivity/bluez5/bluez5.inc
> @@ -78,6 +78,7 @@ SRC_URI =3D "${KERNELORG_MIRROR}/linux/bluetooth/bluez-=
${PV}.tar.xz \
>             file://0001-adapter-restrict-delta-0-RSSI-to-proximity-filter=
s.patch \
>             file://0001-avdtp-Fix-error-handling-for-AVDTP_OPEN-cmd.patch=
 \
>             file://0001-avdtp-Fix-GET_CONFIGURATION-cmd.patch \
> +           file://0001-avdtp-Return-correct-error-when-SEP-is-inuse.patc=
h \
>             "
>  S =3D "${UNPACKDIR}/bluez-${PV}"
> =20
> diff --git a/meta/recipes-connectivity/bluez5/bluez5/0001-avdtp-Return-co=
rrect-error-when-SEP-is-inuse.patch b/meta/recipes-connectivity/bluez5/blue=
z5/0001-avdtp-Return-correct-error-when-SEP-is-inuse.patch
> new file mode 100644
> index 0000000000..76121a7eb6
> --- /dev/null
> +++ b/meta/recipes-connectivity/bluez5/bluez5/0001-avdtp-Return-correct-e=
rror-when-SEP-is-inuse.patch
> @@ -0,0 +1,33 @@
> +From f1bbe63447bcc69beb546bc1e26a4e99c529d70e Mon Sep 17 00:00:00 2001
> +From: Simon Mikuda <simon.mikuda@streamunlimited.com>
> +Date: Tue, 9 Jun 2026 23:30:13 +0200
> +Subject: [PATCH] avdtp: Return correct error when SEP is inuse
> +
> +This fixes AVDTP/SNK/ACP/SIG/SMG/BI-08-C
> +Upstream-Status: Backport [https://github.com/bluez/bluez/commit/39ad431=
de60b896a03904887a0f1d0285b719edd]
> +Signed-off-by: Simon Mikuda <simon.mikuda@streamunlimited.com>
> +Signed-off-by: Jinwang Li <jinwang.li@oss.qualcomm.com>
Hello,

Simon Mikuda's SoB is not in the upstream commit.
Please remove it.

Regards,
--=20
Yoann Congal
Smile ECS

