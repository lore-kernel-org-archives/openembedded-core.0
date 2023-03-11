Return-Path: <richard.purdie@linuxfoundation.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id D745DC61DA4
	for <webhook@archiver.kernel.org>; Sat, 11 Mar 2023 07:42:34 +0000 (UTC)
Received: from mail-wr1-f52.google.com (mail-wr1-f52.google.com [209.85.221.52])
 by mx.groups.io with SMTP id smtpd.web10.41018.1678520545109731173
 for <openembedded-core@lists.openembedded.org>;
 Fri, 10 Mar 2023 23:42:25 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@linuxfoundation.org header.s=google header.b=Ick8LQXU;
 spf=pass (domain: linuxfoundation.org, ip: 209.85.221.52, mailfrom: richard.purdie@linuxfoundation.org)
Received: by mail-wr1-f52.google.com with SMTP id p4so843236wre.11
        for <openembedded-core@lists.openembedded.org>; Fri, 10 Mar 2023 23:42:24 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linuxfoundation.org; s=google; t=1678520543;
        h=mime-version:user-agent:content-transfer-encoding:references
         :in-reply-to:date:cc:to:from:subject:message-id:from:to:cc:subject
         :date:message-id:reply-to;
        bh=lSfe+39gh/QpxVb66HnLwjCujQtXWFosODuX/nEo4EQ=;
        b=Ick8LQXURkk0tp1EvUuAr4F+YejZ69gcD4unqmyVLOM2DvjO3qT6e0XKVLK3vgBq+z
         ZzGTmQwPHEsjhu0R3AMghSxYYeGWiBoUz11pbFr4Z20FATUJvJhpa3Ymo2HlKCB7qO3s
         NF8Nqi+MOzROHaRWPsP0tS4fqPlWz8V7KOytg=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112; t=1678520543;
        h=mime-version:user-agent:content-transfer-encoding:references
         :in-reply-to:date:cc:to:from:subject:message-id:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=lSfe+39gh/QpxVb66HnLwjCujQtXWFosODuX/nEo4EQ=;
        b=B0r5CYyyOA03nQ7OVOlSVoaEzNd/AuZNDVG5wLyuRhniMsYYXmxlE4UJehrBHmnntq
         mUD30lnSjA4CY3owqVo5hHMnj1mEJWrbu6doNGK6bfgiX6zDVkxNPZatAbNKxrLKjV0C
         MJEMF9lBwPlUCNnQoYZcrj6pC0tMIeL/C3grkG0Dd0nMN1RqR8DkGEbSa/2I5zD9SxQ4
         eG++VyxlpshYRBGscIV7aZ62rxW4A48qKujYdmaVuTszmy5q2rWfC3B17vynD6gdYW1J
         MqS5Btz7za1YDCb5S9m3/RoWjFE8dEpSOrNGnRhKGdAXN2cOq7exqDqaDq99ui7kYmvW
         JXEQ==
X-Gm-Message-State: AO0yUKUUY/5JnpJizr2/eO1ipYtl465bB3G8wmUyReA+LjlGiQrlGkeu
	20KjhGQiPkQJ6ZcsMt4UGGkB5w==
X-Google-Smtp-Source: AK7set89cvKFFOGqHW4V57j8sCjrDUiHLazFi4Mi6R3rM1xg8ea/7IDEB56AQlgA109D+RzM7wwstg==
X-Received: by 2002:adf:fd04:0:b0:2c5:8c56:42d3 with SMTP id e4-20020adffd04000000b002c58c5642d3mr18660492wrr.23.1678520543310;
        Fri, 10 Mar 2023 23:42:23 -0800 (PST)
Received: from ?IPv6:2001:8b0:aba:5f3c:9dd5:bdbf:ef9d:c118? ([2001:8b0:aba:5f3c:9dd5:bdbf:ef9d:c118])
        by smtp.gmail.com with ESMTPSA id s14-20020a5d424e000000b002c569acab1esm1727949wrr.73.2023.03.10.23.42.22
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 10 Mar 2023 23:42:22 -0800 (PST)
Message-ID: <46350afc98d464bdd4f1de983fbc7d329c54149f.camel@linuxfoundation.org>
Subject: Re: [OE-core] [PATCH 10/16] gawk: Fix ptest dependency
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: Khem Raj <raj.khem@gmail.com>
Cc: openembedded-core@lists.openembedded.org
Date: Sat, 11 Mar 2023 07:42:22 +0000
In-Reply-To: <CAMKF1spi4ZPAS2uqmvRezKPm9mi6TQfeRefoWn4MFH0==EKdqA@mail.gmail.com>
References: <20230311002722.3211118-1-richard.purdie@linuxfoundation.org>
	 <20230311002722.3211118-10-richard.purdie@linuxfoundation.org>
	 <CAMKF1spi4ZPAS2uqmvRezKPm9mi6TQfeRefoWn4MFH0==EKdqA@mail.gmail.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
User-Agent: Evolution 3.46.3-1 
MIME-Version: 1.0
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Sat, 11 Mar 2023 07:42:34 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/178362

On Fri, 2023-03-10 at 17:40 -0800, Khem Raj wrote:
> On Fri, Mar 10, 2023 at 4:27=E2=80=AFPM Richard Purdie
> <richard.purdie@linuxfoundation.org> wrote:
> >=20
> > The gawk ptests need some locale information, add the missing dependenc=
y
> > so tests work in minimal images.
> >=20
> > Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
> > ---
> >  meta/recipes-extended/gawk/gawk_5.2.1.bb | 2 +-
> >  1 file changed, 1 insertion(+), 1 deletion(-)
> >=20
> > diff --git a/meta/recipes-extended/gawk/gawk_5.2.1.bb b/meta/recipes-ex=
tended/gawk/gawk_5.2.1.bb
> > index fbe6e7040b0..d13110ddbec 100644
> > --- a/meta/recipes-extended/gawk/gawk_5.2.1.bb
> > +++ b/meta/recipes-extended/gawk/gawk_5.2.1.bb
> > @@ -62,7 +62,7 @@ do_install_ptest() {
> >         rm -f ${D}${PTEST_PATH}/test/timeout.*
> >  }
> >=20
> > -RDEPENDS:${PN}-ptest +=3D "make"
> > +RDEPENDS:${PN}-ptest +=3D "make locale-base-en-us"
> >=20
>=20
> I think it should be added below so it does not break musl builds.

Interestingly, musl builds didn't break but I'll tweak the patch, well
spotted!

Cheers,

Richard

