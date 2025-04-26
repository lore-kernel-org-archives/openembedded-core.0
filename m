Return-Path: <richard.purdie@linuxfoundation.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 2165FC369CB
	for <webhook@archiver.kernel.org>; Sat, 26 Apr 2025 22:25:14 +0000 (UTC)
Received: from mail-wm1-f53.google.com (mail-wm1-f53.google.com [209.85.128.53])
 by mx.groups.io with SMTP id smtpd.web10.17377.1745706310750245474
 for <openembedded-core@lists.openembedded.org>;
 Sat, 26 Apr 2025 15:25:11 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@linuxfoundation.org header.s=google header.b=ZA/H1aTH;
 spf=pass (domain: linuxfoundation.org, ip: 209.85.128.53, mailfrom: richard.purdie@linuxfoundation.org)
Received: by mail-wm1-f53.google.com with SMTP id 5b1f17b1804b1-4394a0c65fcso34113865e9.1
        for <openembedded-core@lists.openembedded.org>; Sat, 26 Apr 2025 15:25:10 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linuxfoundation.org; s=google; t=1745706309; x=1746311109; darn=lists.openembedded.org;
        h=mime-version:user-agent:content-transfer-encoding:references
         :in-reply-to:date:to:from:subject:message-id:from:to:cc:subject:date
         :message-id:reply-to;
        bh=GsrczmOIX/txYnq8VKuaQWXJuPzsNPj4VfUBa41pS70=;
        b=ZA/H1aTHTO8HiThBu5tbS8Hu9cwMwyjy7eCUF1ROY3ZzwKsHWOor0H89Mtvvgr8/83
         oaoS7C67dwIgrG9FZ72Om/8voShbahXUDSBM13t92P7i7GJ8Od6/iKfw7dw/WgkbtIk+
         /M24uvWbMdvwFg9vOEN90c1AF8thr/CIbzlk8=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1745706309; x=1746311109;
        h=mime-version:user-agent:content-transfer-encoding:references
         :in-reply-to:date:to:from:subject:message-id:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=GsrczmOIX/txYnq8VKuaQWXJuPzsNPj4VfUBa41pS70=;
        b=veZtOUcZ8RtQuI0CGbRRWTx3FpxymhLd57lOJZFSvOwawxrwxHmVcAiDUssWUQfi+u
         hsMAaY6nHplPJniqRAxNSxb507xuHd6SK9TwGAfPm2ewplN3IMXzKvGP5Zs8rkXya/xS
         TmmeK+NIBq1sxTE4+6a0M9Wa8CqNX/yKWfH0pwHtZYtq0cch26aDlQtSRyOOf6MyjMwj
         7upT1uoqjSELQZCOn0ypVUrXfeiIeFkuz/mpjyH8BCUC9V3LQm/YXD5jqyE4hToWeVX5
         HiGbBTRSur+PcvZii+LzlSZi+A8ja/GHeIzSJj2eAfhmieSm5mKoWeOzqgSc2RayDKtD
         K1QA==
X-Forwarded-Encrypted: i=1; AJvYcCVv6SjFAKvi4ObGljZlLoi8yuW1oeUh0Z/W6QaTxSA5jqT9eMq6S3tamtZq0SZWLvSflZrRJQufJlegdT5r1FHvfA==@lists.openembedded.org
X-Gm-Message-State: AOJu0YyrjPEIG0VKUxMoiYwVparx78Bxh30QFAogeDqLvHm5k0TcOuKy
	PYvZyXECozFVCsd2uF5jnr7N6cf2o9cCXUAjfyX6ptJDJciFez3gTfh8pp1XrgE=
X-Gm-Gg: ASbGncsX7RNQfX/GentmrS4qfaoOXkQC72XSyR9tOPSalt6k9ExWpXvbxKwbnhi4qcf
	Od1qwIpYD7ejOeUZqmdF0newy3/4OnBjD3r2L2NkdK3aIKkJ7lUmKUhxaRJIzniB1ZEYkH2qnrX
	sBnFKLnJS5O/Vv974ZFuONHi224NnQAErzeLgdazo6L/uWEu/WMvTUal/IDlvBRjUHqrpdlvOfu
	Cf3DiMN+IeaFpMgy6JkSzB9MddJuxP8c4tiDGRTW90ZPnCZ4vl/TjDek7TkjHLU08iEy/wjOVTw
	xF9yhuQjpUMrmcoUs/oilF47GXHAMyPeQXvCFs5yeQe2nHL/ugD828gKT8Qb6xPUYIib605NoJF
	PAmRRCtRB5Evy85atwgBzIcsLcKz4PQ==
X-Google-Smtp-Source: AGHT+IHan83HNFEGeuxeTp1hSglABvEi7KNgje75P2kzFjoV03wb201FgNd5+Ay23SiQcmhQw0T4Qg==
X-Received: by 2002:a05:600c:1e83:b0:43d:3df:42d8 with SMTP id 5b1f17b1804b1-440ab76ab83mr32827405e9.6.1745706309113;
        Sat, 26 Apr 2025 15:25:09 -0700 (PDT)
Received: from ?IPv6:2001:8b0:aba:5f3c:48f5:d7c5:b2b7:bd12? ([2001:8b0:aba:5f3c:48f5:d7c5:b2b7:bd12])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-440a5369cdasm76211195e9.31.2025.04.26.15.25.07
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 26 Apr 2025 15:25:08 -0700 (PDT)
Message-ID: <559a26a16dd125d9e0ccb48b2b6a8c3e85b778ea.camel@linuxfoundation.org>
Subject: Re: [OE-core] [PATCH] gcc: Upgrade GCC to 15 release
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: raj.khem@gmail.com, openembedded-core@lists.openembedded.org
Date: Sat, 26 Apr 2025 23:25:07 +0100
In-Reply-To: <20250425165030.1367643-1-raj.khem@gmail.com>
References: <20250425165030.1367643-1-raj.khem@gmail.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
User-Agent: Evolution 3.56.0-1 
MIME-Version: 1.0
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Sat, 26 Apr 2025 22:25:14 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/215525

On Fri, 2025-04-25 at 09:50 -0700, Khem Raj via lists.openembedded.org
wrote:
> * Nios2 has been removed and aarch64/ilp32 is deprecated
> * Default C dialect is switched to C23
> * {0} initializer in C or C++ for unions no longer guarantees
> clearing of the whole union
> * Compile speed improvements with LTO
> * Vectorizer can support loops with early exists but it is limited to
> loops
> =C2=A0 with fixed vector lengths
>=20
> This is major release of gcc, the changes are noted [1]
>=20
> [1] https://gcc.gnu.org/gcc-15/changes.html
>=20
> Signed-off-by: Khem Raj <raj.khem@gmail.com>

I did run this through testing and unfortunately there do seem to be
some issues:

https://autobuilder.yoctoproject.org/valkyrie/#/builders/29/builds/1472

In particular:

harfbuzz:
https://autobuilder.yoctoproject.org/valkyrie/#/builders/2/builds/1478=20
https://autobuilder.yoctoproject.org/valkyrie/#/builders/16/builds/1465


selftest:
https://autobuilder.yoctoproject.org/valkyrie/#/builders/35/builds/1428
https://autobuilder.yoctoproject.org/valkyrie/#/builders/23/builds/1531
https://autobuilder.yoctoproject.org/valkyrie/#/builders/48/builds/1377

reproducible/selftest-ed:
https://autobuilder.yoctoproject.org/valkyrie/#/builders/37/builds/1505

Cheers,

Richard


