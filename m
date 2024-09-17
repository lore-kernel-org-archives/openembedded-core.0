Return-Path: <richard.purdie@linuxfoundation.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 6B37EC35FED
	for <webhook@archiver.kernel.org>; Tue, 17 Sep 2024 07:35:27 +0000 (UTC)
Received: from mail-wr1-f51.google.com (mail-wr1-f51.google.com [209.85.221.51])
 by mx.groups.io with SMTP id smtpd.web11.15768.1726558519984368533
 for <openembedded-core@lists.openembedded.org>;
 Tue, 17 Sep 2024 00:35:20 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@linuxfoundation.org header.s=google header.b=KhiwcFk1;
 spf=pass (domain: linuxfoundation.org, ip: 209.85.221.51, mailfrom: richard.purdie@linuxfoundation.org)
Received: by mail-wr1-f51.google.com with SMTP id ffacd0b85a97d-378f600e090so1102107f8f.3
        for <openembedded-core@lists.openembedded.org>; Tue, 17 Sep 2024 00:35:19 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linuxfoundation.org; s=google; t=1726558518; x=1727163318; darn=lists.openembedded.org;
        h=mime-version:user-agent:content-transfer-encoding:references
         :in-reply-to:date:cc:to:from:subject:message-id:from:to:cc:subject
         :date:message-id:reply-to;
        bh=43bwpzPJja2kyJVTElu2dePVKKHcMgAV3Y+1bKXqZgI=;
        b=KhiwcFk1qgccXCDx/WX9MLmTxjwnbkGwtKEeR1Neyqs3/AQh2vbjWfqqAEY4C0ez+m
         Ej/fS4tP/G79Dse1E35TlOnNJEAi5bWoQ2lBHQVUquO6lcX4uZ/9+uetHDf6WebOdrOH
         OprEV6k5GGwSwyv4KJFFeFYRPkOJ4GFaNgJuc=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1726558518; x=1727163318;
        h=mime-version:user-agent:content-transfer-encoding:references
         :in-reply-to:date:cc:to:from:subject:message-id:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=43bwpzPJja2kyJVTElu2dePVKKHcMgAV3Y+1bKXqZgI=;
        b=Un61EpRHxMdEhDVnpBbMj5vMURlNQWooKOTgjO6+reX2cqAFiBqiprcTH9LULPzvAf
         jylOgqXfJskNcdRlJXtQvNz+nISK0cVwbokNDIrTXR45wMgDi7ZY91ZiZE6augwQQxVb
         Wv+w/LeAp1i4JRq0vpNBS9jZCdTsgCa+1oBHlgzmUi87V0G1qTG30C5P4owDFz0iIRy4
         nZXtMpzGELQvK3dctsf3amQ6JUMeygvp+8zzsn2PRJfXkHl5+p86bYJvcuTOFkmQAl3m
         6M/6rLksGCkZ3shVa080jypBFOem2+/xNoK4ndjDkQmyD5Zy2rMH/OxtNzOnnXT/2BOF
         a5EQ==
X-Forwarded-Encrypted: i=1; AJvYcCU6YhdEBD3SqQEMywlFK6wGb2UEcUHjJTBDUjqNu96n/uT4rZg2lsvX1HN33ZrT8oj5sNJNlWc8ZHj6c7X0ATtkjg==@lists.openembedded.org
X-Gm-Message-State: AOJu0YzAz+BUYF9G2swU4mR9RE8h9njQyjz8gueblNlKbZlcokE5uPhc
	fjIH/ctdlWUmWwSpwvDmL/MlGJtuhP2Wr3VUsVJ2by8RWyGcuEsdw0A3Jmttuysn6BNcFQFBuq3
	V
X-Google-Smtp-Source: AGHT+IGWHYm38vgxCMs/UuhP/zaQ8AU4U0ZGc8T6p16nAmfj03GS+VQeHeDatD+/HP7ghHVS7keecg==
X-Received: by 2002:a5d:42cb:0:b0:374:d1dd:1cc1 with SMTP id ffacd0b85a97d-378c2cd54ccmr10130595f8f.2.1726558518066;
        Tue, 17 Sep 2024 00:35:18 -0700 (PDT)
Received: from ?IPv6:2001:8b0:aba:5f3c:7c97:abb4:726a:74dd? ([2001:8b0:aba:5f3c:7c97:abb4:726a:74dd])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-378e78002afsm8805800f8f.75.2024.09.17.00.35.17
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 17 Sep 2024 00:35:17 -0700 (PDT)
Message-ID: <c6e2f9d76bbf41452ef49fdba9f4ea633a369c4b.camel@linuxfoundation.org>
Subject: Re: [OE-core][master][PATCH] tzdata : Upgrade to 2024b
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: pdoshi@mvista.com, openembedded-core@lists.openembedded.org
Cc: Ross Burton <ross.burton@arm.com>
Date: Tue, 17 Sep 2024 08:35:17 +0100
In-Reply-To: <17F5F7B181D2BB8F.13829@lists.openembedded.org>
References: <1726222641-9830-1-git-send-email-pdoshi@mvista.com>
	 <17F5F7B181D2BB8F.13829@lists.openembedded.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
User-Agent: Evolution 3.52.3-0ubuntu1 
MIME-Version: 1.0
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 17 Sep 2024 07:35:27 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/204618

On Tue, 2024-09-17 at 08:32 +0100, Richard Purdie via
lists.openembedded.org wrote:
> On Fri, 2024-09-13 at 15:47 +0530, Priyal Doshi via
> lists.openembedded.org wrote:
> > From: Priyal Doshi <pdoshi@mvista.com>
> >=20
> > Signed-off-by: Priyal Doshi <pdoshi@mvista.com>
> > ---
> > =C2=A0meta/recipes-extended/timezone/timezone.inc | 6 +++---
> > =C2=A01 file changed, 3 insertions(+), 3 deletions(-)
> >=20
> > diff --git a/meta/recipes-extended/timezone/timezone.inc
> > b/meta/recipes-extended/timezone/timezone.inc
> > index 4734adc..adf0952 100644
> > --- a/meta/recipes-extended/timezone/timezone.inc
> > +++ b/meta/recipes-extended/timezone/timezone.inc
> > @@ -6,7 +6,7 @@ SECTION =3D "base"
> > =C2=A0LICENSE =3D "PD & BSD-3-Clause"
> > =C2=A0LIC_FILES_CHKSUM =3D
> > "file://LICENSE;md5=3Dc679c9d6b02bc2757b3eaf8f53c43fba"
> > =C2=A0
> > -PV =3D "2024a"
> > +PV =3D "2024b"
> > =C2=A0
> > =C2=A0SRC_URI =3D"
> > http://www.iana.org/time-zones/repository/releases/tzcode${PV}.tar.gz;n=
ame=3Dtzcode;subdir=3Dtz
> > =C2=A0\
> > =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0
> > http://www.iana.org/time-zones/repository/releases/tzdata${PV}.tar.gz;n=
ame=3Dtzdata;subdir=3Dtz
> > =C2=A0\
> > @@ -16,5 +16,5 @@ S =3D "${WORKDIR}/tz"
> > =C2=A0
> > =C2=A0UPSTREAM_CHECK_URI =3D "http://www.iana.org/time-zones"
> > =C2=A0
> > -SRC_URI[tzcode.sha256sum] =3D
> > "80072894adff5a458f1d143e16e4ca1d8b2a122c9c5399da482cb68cba6a1ff8"
> > -SRC_URI[tzdata.sha256sum] =3D
> > "0d0434459acbd2059a7a8da1f3304a84a86591f6ed69c6248fffa502b6edffe3"
> > +SRC_URI[tzcode.sha256sum] =3D
> > "5e438fc449624906af16a18ff4573739f0cda9862e5ec28d3bcb19cbaed0f672"
> > +SRC_URI[tzdata.sha256sum] =3D
> > "70e754db126a8d0db3d16d6b4cb5f7ec1e04d5f261255e4558a67fe92d39e550"
>=20
> I think this breaks a test in the glib-2.0 test suite:
>=20
> https://valkyrie.yoctoproject.org/#/builders/73/builds/126/steps/12/logs/=
stdio
>=20
> WARNING: core-image-ptest-glib-2.0-1.0-r0 do_testimage: There were
> failing ptests.
> Failed ptests:
> {'glib-2.0': ['glib/gdatetime.test']}
>=20


I managed to find ptest logs for this:



ok 62 /GTimeZone/no-header-identifier
**
GLib:ERROR:/usr/src/debug/glib-2.0/2.80.4/glib/tests/gdatetime.c:2960:test_=
posix_parse: assertion failed (g_time_zone_get_abbreviation (tz, 0) =3D=3D =
"PST"): ("LMT" =3D=3D "PST")
not ok /GTimeZone/posix-parse - GLib:ERROR:/usr/src/debug/glib-2.0/2.80.4/g=
lib/tests/gdatetime.c:2960:test_posix_parse: assertion failed (g_time_zone_=
get_abbreviation (tz, 0) =3D=3D "PST"): ("LMT" =3D=3D "PST")
Bail out!
FAIL: glib/gdatetime.test (Child process killed by signal 6)
Running test: glib/bitlock.test

Cheers,

Richard


