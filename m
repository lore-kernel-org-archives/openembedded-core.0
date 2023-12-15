Return-Path: <richard.purdie@linuxfoundation.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 4821DC35274
	for <webhook@archiver.kernel.org>; Fri, 15 Dec 2023 22:47:25 +0000 (UTC)
Received: from mail-wr1-f42.google.com (mail-wr1-f42.google.com [209.85.221.42])
 by mx.groups.io with SMTP id smtpd.web11.1170.1702680442125442692
 for <openembedded-core@lists.openembedded.org>;
 Fri, 15 Dec 2023 14:47:22 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@linuxfoundation.org header.s=google header.b=c/P7kNiU;
 spf=pass (domain: linuxfoundation.org, ip: 209.85.221.42, mailfrom: richard.purdie@linuxfoundation.org)
Received: by mail-wr1-f42.google.com with SMTP id ffacd0b85a97d-336447f240cso771070f8f.3
        for <openembedded-core@lists.openembedded.org>; Fri, 15 Dec 2023 14:47:21 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linuxfoundation.org; s=google; t=1702680440; x=1703285240; darn=lists.openembedded.org;
        h=mime-version:user-agent:content-transfer-encoding:references
         :in-reply-to:date:to:from:subject:message-id:from:to:cc:subject:date
         :message-id:reply-to;
        bh=0v4kIec5vn54CM/ovw/o4rNUEttWmR+9SQvSLfXCXHk=;
        b=c/P7kNiUFGNT9Ytiui2Qp3yLEvr8Kcvx1/iwqjprhnSWJzggDogcLiP05pMEO0y/fO
         5TJsGQzerKE5dwnecDkLkP7nU5I01Fu+JnGmvSy308pipofsauO0e0lOvGZRi19M2ylh
         og0VFGVF3ClPSkU8HZ5EREnqitTzNeKSjKldk=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1702680440; x=1703285240;
        h=mime-version:user-agent:content-transfer-encoding:references
         :in-reply-to:date:to:from:subject:message-id:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=0v4kIec5vn54CM/ovw/o4rNUEttWmR+9SQvSLfXCXHk=;
        b=t9rj7crVyZ5o+6FmmywoUVaTl9jT2+jxwPcOWquay9Yps923HJegTXHZ5E6hjcLTLF
         HCXnyhf0HdU6bV5yXBjF4e3VZCT/8bqLSTOu+BPawDjZ3RBHlcww07w//F4FYAXUajoA
         26VUN1cz1sT18h9OhEQIk1j4YupirBlWfsWzMujlJxNLZeBdI+tOboAak9gC9Dksi1S+
         gdNLinUa7OQoe0uV7uIltLaufayWk1N9rYsCfZOiPB3H5g7bOOMN8fPwzzvhpQ5lILB7
         r1ZUcPwQVFGbXmENqoEparL5Wp+GqDpeD9crVJDnC/LxUt0C+pxM2s+MeJI6uxBHI65S
         4Kpw==
X-Gm-Message-State: AOJu0Yz051shTrOS5rs5LLLdMGQ2yAKEraTkrP8Xw9Foh7gw0WKS58aD
	bSKR1/s9U+YsX7ChpOgo8c1aFw==
X-Google-Smtp-Source: AGHT+IFB4vygJZQvBXJCF7pxGM/IGtSpbc94ErlTg+BP5LKpuNb6Uv8C4wl4fdyfVa/0/kePPcHPmg==
X-Received: by 2002:adf:fac7:0:b0:336:4438:e915 with SMTP id a7-20020adffac7000000b003364438e915mr2587759wrs.94.1702680440356;
        Fri, 15 Dec 2023 14:47:20 -0800 (PST)
Received: from ?IPv6:2001:8b0:aba:5f3c:fec1:d6ff:46af:def5? ([2001:8b0:aba:5f3c:fec1:d6ff:46af:def5])
        by smtp.gmail.com with ESMTPSA id a4-20020a056000100400b00333371c7382sm20000707wrx.72.2023.12.15.14.47.19
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 15 Dec 2023 14:47:19 -0800 (PST)
Message-ID: <08d347b60331523717b0d67152913a059b3188dd.camel@linuxfoundation.org>
Subject: Re: [OE-core][PATCH 1/2] bitbake.conf: Add runtimedir
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: Joshua Watt <JPEWhacker@gmail.com>, 
	openembedded-core@lists.openembedded.org
Date: Fri, 15 Dec 2023 22:47:19 +0000
In-Reply-To: <20231215203404.2913433-1-JPEWhacker@gmail.com>
References: <20231215203404.2913433-1-JPEWhacker@gmail.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
User-Agent: Evolution 3.48.1-0ubuntu1 
MIME-Version: 1.0
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Fri, 15 Dec 2023 22:47:25 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/192549

On Fri, 2023-12-15 at 13:34 -0700, Joshua Watt wrote:
> Adds the path to the runtime state directory (/run). In particular,
> systemd units need to have the correct path to the runtime directory
> because RequiresMountsFor doesn't follow symbolic links. This means that
> if a unit calls out a directory in /var/run (a symbolic link to /run),
> it may actually start before /run is mounted. The fix is to have the
> unit specify a directory in /run instead.
>=20
> Signed-off-by: Joshua Watt <JPEWhacker@gmail.com>
> ---
>  meta/conf/bitbake.conf | 1 +
>  1 file changed, 1 insertion(+)
>=20
> diff --git a/meta/conf/bitbake.conf b/meta/conf/bitbake.conf
> index e7826e7af96..55166d01784 100644
> --- a/meta/conf/bitbake.conf
> +++ b/meta/conf/bitbake.conf
> @@ -31,6 +31,7 @@ export sysconfdir =3D "${base_prefix}/etc"
>  export servicedir =3D "${base_prefix}/srv"
>  export sharedstatedir =3D "${base_prefix}/com"
>  export localstatedir =3D "${base_prefix}/var"
> +export runtimedir =3D "${base_prefix}/run"
>  export datadir =3D "${prefix}/share"
>  export infodir =3D "${datadir}/info"
>  export mandir =3D "${datadir}/man"

Is there anything currently using that from the shell environment?

Most of this is historical and in many cases not necessary so I'm not
sure we want to add to it...

Cheers,

Richard

