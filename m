Return-Path: <richard.purdie@linuxfoundation.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id B0204C77B7C
	for <webhook@archiver.kernel.org>; Sat, 27 May 2023 08:16:29 +0000 (UTC)
Received: from mail-wm1-f44.google.com (mail-wm1-f44.google.com [209.85.128.44])
 by mx.groups.io with SMTP id smtpd.web10.6644.1685175388721195734
 for <openembedded-core@lists.openembedded.org>;
 Sat, 27 May 2023 01:16:29 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="signature has expired" header.i=@linuxfoundation.org header.s=google header.b=hIiMSmIc;
 spf=pass (domain: linuxfoundation.org, ip: 209.85.128.44, mailfrom: richard.purdie@linuxfoundation.org)
Received: by mail-wm1-f44.google.com with SMTP id 5b1f17b1804b1-3f60dfc6028so15655735e9.1
        for <openembedded-core@lists.openembedded.org>; Sat, 27 May 2023 01:16:28 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linuxfoundation.org; s=google; t=1685175387; x=1687767387;
        h=mime-version:user-agent:content-transfer-encoding:references
         :in-reply-to:date:to:from:subject:message-id:from:to:cc:subject:date
         :message-id:reply-to;
        bh=9AkrpI+dtLZnOI7OsSabHZNKUEJTbN5MDxzE3+IOkcQ=;
        b=hIiMSmIcKvgiT1FWZOs6sI+om1GMMMSEGm1vL7hbwHlEUZS3UhOborSIWzmlRXw7Lj
         jdxZGnBz/9wKP8lLolaaOv1MRnirMgsQu/q99LImzCviV+KJO7dBtrJolBl3yX7FSiMr
         QQI0OGGFmYqQOXn9QNEePU+Vr38FJtDMXCuog=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1685175387; x=1687767387;
        h=mime-version:user-agent:content-transfer-encoding:references
         :in-reply-to:date:to:from:subject:message-id:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=9AkrpI+dtLZnOI7OsSabHZNKUEJTbN5MDxzE3+IOkcQ=;
        b=S/QfClw4f4HwFiTtFOt/Q8pO8DgRisQQ9RgVfFqrNqw6SUcEwMRmsavMlFol6/5lLv
         nqgBIqt6ppnQ9L0knvm/qGSjqb8Y2wDJjLgkMvRq6XzBGQLwgtRvNS4YfFJIjKJLMYKS
         Rs5T2IF6ssaqL6fiekMuZRSZQVzx3F+7jfsgio/NXDHr/CuXuHobakpMtFHjDTIWvR+q
         3wc+y2A88IbPcgunlRcvTaN3qhQdAdHY2TtuW0djTU0J3ipZqk6mpbGvB52h8j0VQZIT
         zMUCk5Sg6x8Jy0G0jh2jgTNkOTpzdWJNEkfyXhEUrZTVGNufR142VPOoWdEpB25/uS1t
         idSA==
X-Gm-Message-State: AC+VfDxG2GrBUqoXDIV2/1wa/4xhN/9ucp9i0xmNsXIOzbaGjLd3f4Sd
	9JTGuOn0x+DFwAhWCle4hL4W9Q==
X-Google-Smtp-Source: ACHHUZ7FFcByYZjvKcVwbOQTW/EG6uSxyDN8KFHG6Db7YaewgHT73Ins1muZtE3SD04gTHyEOUSvng==
X-Received: by 2002:a05:600c:249:b0:3f4:c28b:ec88 with SMTP id 9-20020a05600c024900b003f4c28bec88mr2921965wmj.41.1685175387133;
        Sat, 27 May 2023 01:16:27 -0700 (PDT)
Received: from ?IPv6:2001:8b0:aba:5f3c:7d24:65e6:bc0:7a3? ([2001:8b0:aba:5f3c:7d24:65e6:bc0:7a3])
        by smtp.gmail.com with ESMTPSA id b21-20020a05600c4e1500b003f4283f5c1bsm19142767wmq.2.2023.05.27.01.16.26
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 27 May 2023 01:16:26 -0700 (PDT)
Message-ID: <7e8c188c6dc0061d99f89803892dbcde1e0a4028.camel@linuxfoundation.org>
Subject: Re: [OE-core] [PATCH] bitbake.conf: Add -fcanon-prefix-map to
 DEBUG_PREFIX_MAP
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: Jacob Kroon <jacob.kroon@gmail.com>, Khem Raj <raj.khem@gmail.com>, 
	openembedded-core@lists.openembedded.org
Date: Sat, 27 May 2023 09:16:25 +0100
In-Reply-To: <c60b519b-6b54-511c-1cae-65ffca65d35f@gmail.com>
References: <20230428032030.2047920-1-raj.khem@gmail.com>
	 <c60b519b-6b54-511c-1cae-65ffca65d35f@gmail.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
User-Agent: Evolution 3.48.0-1 
MIME-Version: 1.0
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Sat, 27 May 2023 08:16:29 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/181797

On Sat, 2023-05-27 at 07:27 +0200, Jacob Kroon wrote:
> On 4/28/23 05:20, Khem Raj wrote:
> > This should help canonicalize the relative paths and symlinks
> > during cross compile, -fcanon-prefix-map is newly added in gcc-13+ [1]
> >=20
> > [1] https://gcc.gnu.org/bugzilla/show_bug.cgi?id=3D108464#c8
> > Signed-off-by: Khem Raj <raj.khem@gmail.com>
> > ---
> >   meta/conf/bitbake.conf | 3 ++-
> >   1 file changed, 2 insertions(+), 1 deletion(-)
> >=20
> > diff --git a/meta/conf/bitbake.conf b/meta/conf/bitbake.conf
> > index d94ffe1df9..453bef37a9 100644
> > --- a/meta/conf/bitbake.conf
> > +++ b/meta/conf/bitbake.conf
> > @@ -644,7 +644,8 @@ EXTRA_OEMAKE:prepend:task-install =3D "${PARALLEL_M=
AKEINST} "
> >   # Optimization flags.
> >   ##################################################################
> >   # Beware: applied last to first
> > -DEBUG_PREFIX_MAP ?=3D "-fmacro-prefix-map=3D${S}=3D/usr/src/debug/${PN=
}/${EXTENDPE}${PV}-${PR} \
> > +DEBUG_PREFIX_MAP ?=3D "-fcanon-prefix-map \
> > + -fmacro-prefix-map=3D${S}=3D/usr/src/debug/${PN}/${EXTENDPE}${PV}-${P=
R} \
> >    -fdebug-prefix-map=3D${S}=3D/usr/src/debug/${PN}/${EXTENDPE}${PV}-${=
PR} \
> >    -fmacro-prefix-map=3D${B}=3D/usr/src/debug/${PN}/${EXTENDPE}${PV}-${=
PR} \
> >    -fdebug-prefix-map=3D${B}=3D/usr/src/debug/${PN}/${EXTENDPE}${PV}-${=
PR} \
> >=20
>=20
> Maybe we can take the opportunity to also cleanup DEBUG_PREFIX_MAP by=20
> replacing debug/macro/canon with a single -ffile-prefix-map ?
>=20
>  From the gcc 13.1.1 manpage:
>=20
> > -ffile-prefix-map=3Dold=3Dnew
> >            When compiling files residing in directory old, record any r=
eferences to them in the result of the
> >            compilation as if the files resided in directory new instead=
.  Specifying this option is equivalent to
> >            specifying all the individual -f*-prefix-map options.  This =
can be used to make reproducible builds
> >            that are location independent.  Directories referenced by di=
rectives are not affected by these options.
> >            See also -fmacro-prefix-map, -fdebug-prefix-map, -fprofile-p=
refix-map and -fcanon-prefix-map.
>=20

Sadly not, I'd wondered about this too and tried it fairly recently.

From memory, the issue is that there are tools which only accept one of
these (binutils as maybe?) and if we switch, we lose some set of the
prefix mapping which causes build reproducible issues.

I'd love to do it but only once it doesn't break things. It may be
possible to pass in different options to the different tools but at
that point it started looking too complex for the time I had available
to test.

Cheers,

Richard




