Return-Path: <richard.purdie@linuxfoundation.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 6A3DFC35FED
	for <webhook@archiver.kernel.org>; Tue, 17 Sep 2024 07:32:57 +0000 (UTC)
Received: from mail-wr1-f48.google.com (mail-wr1-f48.google.com [209.85.221.48])
 by mx.groups.io with SMTP id smtpd.web10.15675.1726558373138031539
 for <openembedded-core@lists.openembedded.org>;
 Tue, 17 Sep 2024 00:32:53 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@linuxfoundation.org header.s=google header.b=dqG3gcbg;
 spf=pass (domain: linuxfoundation.org, ip: 209.85.221.48, mailfrom: richard.purdie@linuxfoundation.org)
Received: by mail-wr1-f48.google.com with SMTP id ffacd0b85a97d-374ca65cafdso2709152f8f.2
        for <openembedded-core@lists.openembedded.org>; Tue, 17 Sep 2024 00:32:52 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linuxfoundation.org; s=google; t=1726558371; x=1727163171; darn=lists.openembedded.org;
        h=mime-version:user-agent:content-transfer-encoding:references
         :in-reply-to:date:to:from:subject:message-id:from:to:cc:subject:date
         :message-id:reply-to;
        bh=uWjRS/ZXihBLDz7JLgn//oWMETLFvEBhMaErusF76hk=;
        b=dqG3gcbgzmrygapxs5tKXnxA71EyFfPz1gbLmXz0iyxstkNV+2ZaCMZl2tIyk8BS0z
         lbk/J9qnmf7HOZ2TExBjCTYgjTAEFqLsbxBtYysy6+MznAHxxhaj3DiKgYoQwgZ/R7f/
         MxHqALT+10rkPXKRUxRXk0aRZFhXBHX2Pozk8=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1726558371; x=1727163171;
        h=mime-version:user-agent:content-transfer-encoding:references
         :in-reply-to:date:to:from:subject:message-id:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=uWjRS/ZXihBLDz7JLgn//oWMETLFvEBhMaErusF76hk=;
        b=xBzizaHfGsFLcvt6+x8HzTN9kUi0z3/sjpN94wIrVTjG8Haol7KactUoK35lIjj19a
         XC7RyAlWxgf8LK/WCinpqDKpMQV6s2myimBevs2YI4xEM0Rb2TLSmXBBfiXKGbmYoLC+
         oFEXAK5lCMy3FlcwBgi6q3w0bev6MSon7uUQUM7MLhx+6wZipkmRZZ14ExRTO01YSNM7
         dUKlNsLDPGLfHRRvKBOFMhyKFvQQ53GcZFbwUsJBpmFY8xk0ywhWrd2ZRdvMp6Co9tkO
         j1KJRlU37yFHbI1wn3WYxlRipULW9EGZ2asIaHMXCIEB0M5RZjVmTioGW7smeofAp7V/
         bXpg==
X-Forwarded-Encrypted: i=1; AJvYcCXFs4eENjylYMjtbZcoSqcngrst7bJO4h9/bdycfzXZeVkKAEV3xHgMPGOm9YZCQ6/hZRt7ZDmf6gRkdcumbLtWZw==@lists.openembedded.org
X-Gm-Message-State: AOJu0YzRrwh+8bBAD/YgYbJST60HXm7oMnTbm/GqyeATQiMxK9SV/QPk
	yRsft0EoiUYy3bb3biHvVjnOjYgavQnSGh+5wBuri8cjA+TuhuYMLVFbo9mJwsg=
X-Google-Smtp-Source: AGHT+IGNnO5HK/SvTuq/WkB+gH3K3Auaf1pnH4W2Oy5oSXKEUxH7gmvgEdF2gqCE88hCjeggmkM9cA==
X-Received: by 2002:a05:6000:1841:b0:378:7f65:e13a with SMTP id ffacd0b85a97d-378d61d4fc8mr8960791f8f.2.1726558371408;
        Tue, 17 Sep 2024 00:32:51 -0700 (PDT)
Received: from ?IPv6:2001:8b0:aba:5f3c:7c97:abb4:726a:74dd? ([2001:8b0:aba:5f3c:7c97:abb4:726a:74dd])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-378e72e4a30sm8958633f8f.8.2024.09.17.00.32.50
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 17 Sep 2024 00:32:50 -0700 (PDT)
Message-ID: <76e0ab0f6a94dde0ef01bdc7b18af3306f1fc07e.camel@linuxfoundation.org>
Subject: Re: [OE-core][master][PATCH] tzdata : Upgrade to 2024b
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: pdoshi@mvista.com, openembedded-core@lists.openembedded.org
Date: Tue, 17 Sep 2024 08:32:50 +0100
In-Reply-To: <1726222641-9830-1-git-send-email-pdoshi@mvista.com>
References: <1726222641-9830-1-git-send-email-pdoshi@mvista.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
User-Agent: Evolution 3.52.3-0ubuntu1 
MIME-Version: 1.0
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 17 Sep 2024 07:32:57 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/204617

On Fri, 2024-09-13 at 15:47 +0530, Priyal Doshi via lists.openembedded.org =
wrote:
> From: Priyal Doshi <pdoshi@mvista.com>
>=20
> Signed-off-by: Priyal Doshi <pdoshi@mvista.com>
> ---
> =C2=A0meta/recipes-extended/timezone/timezone.inc | 6 +++---
> =C2=A01 file changed, 3 insertions(+), 3 deletions(-)
>=20
> diff --git a/meta/recipes-extended/timezone/timezone.inc b/meta/recipes-e=
xtended/timezone/timezone.inc
> index 4734adc..adf0952 100644
> --- a/meta/recipes-extended/timezone/timezone.inc
> +++ b/meta/recipes-extended/timezone/timezone.inc
> @@ -6,7 +6,7 @@ SECTION =3D "base"
> =C2=A0LICENSE =3D "PD & BSD-3-Clause"
> =C2=A0LIC_FILES_CHKSUM =3D "file://LICENSE;md5=3Dc679c9d6b02bc2757b3eaf8f=
53c43fba"
> =C2=A0
> -PV =3D "2024a"
> +PV =3D "2024b"
> =C2=A0
> =C2=A0SRC_URI =3D" http://www.iana.org/time-zones/repository/releases/tzc=
ode${PV}.tar.gz;name=3Dtzcode;subdir=3Dtz=C2=A0\
> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 http:/=
/www.iana.org/time-zones/repository/releases/tzdata${PV}.tar.gz;name=3Dtzda=
ta;subdir=3Dtz=C2=A0\
> @@ -16,5 +16,5 @@ S =3D "${WORKDIR}/tz"
> =C2=A0
> =C2=A0UPSTREAM_CHECK_URI =3D "http://www.iana.org/time-zones"
> =C2=A0
> -SRC_URI[tzcode.sha256sum] =3D "80072894adff5a458f1d143e16e4ca1d8b2a122c9=
c5399da482cb68cba6a1ff8"
> -SRC_URI[tzdata.sha256sum] =3D "0d0434459acbd2059a7a8da1f3304a84a86591f6e=
d69c6248fffa502b6edffe3"
> +SRC_URI[tzcode.sha256sum] =3D "5e438fc449624906af16a18ff4573739f0cda9862=
e5ec28d3bcb19cbaed0f672"
> +SRC_URI[tzdata.sha256sum] =3D "70e754db126a8d0db3d16d6b4cb5f7ec1e04d5f26=
1255e4558a67fe92d39e550"

I think this breaks a test in the glib-2.0 test suite:

https://valkyrie.yoctoproject.org/#/builders/73/builds/126/steps/12/logs/st=
dio

WARNING: core-image-ptest-glib-2.0-1.0-r0 do_testimage: There were failing =
ptests.
Failed ptests:
{'glib-2.0': ['glib/gdatetime.test']}

Cheers,

Richard


