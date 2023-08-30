Return-Path: <richard.purdie@linuxfoundation.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 32E1AC83F15
	for <webhook@archiver.kernel.org>; Wed, 30 Aug 2023 14:08:53 +0000 (UTC)
Received: from mail-wr1-f47.google.com (mail-wr1-f47.google.com [209.85.221.47])
 by mx.groups.io with SMTP id smtpd.web11.14748.1693404529093614061
 for <openembedded-core@lists.openembedded.org>;
 Wed, 30 Aug 2023 07:08:49 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@linuxfoundation.org header.s=google header.b=LU2iik5B;
 spf=pass (domain: linuxfoundation.org, ip: 209.85.221.47, mailfrom: richard.purdie@linuxfoundation.org)
Received: by mail-wr1-f47.google.com with SMTP id ffacd0b85a97d-31c93d2a24fso3158229f8f.2
        for <openembedded-core@lists.openembedded.org>; Wed, 30 Aug 2023 07:08:48 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linuxfoundation.org; s=google; t=1693404527; x=1694009327; darn=lists.openembedded.org;
        h=mime-version:user-agent:content-transfer-encoding:references
         :in-reply-to:date:to:from:subject:message-id:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Ulw+pax9UQtjMGGmaW+oBTVr8jTTrCw+z5Q82IsEeJo=;
        b=LU2iik5BCvyfZE0KJaJapZUSjTdOQPDd7vCL3Rnt0KK1m88a/CWUZ7Tj0yPqhCo3zy
         DGqlij5VrMjrjQ5/YU3xBj0X2cmPr0AxM+LgpluBQK7tBFga/Jkaa6Ih0ZbkBOpQpRLb
         vqgpdpHtcgW+qK8Q/d0vN9LH6vbsfkM5ygUHM=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1693404527; x=1694009327;
        h=mime-version:user-agent:content-transfer-encoding:references
         :in-reply-to:date:to:from:subject:message-id:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=Ulw+pax9UQtjMGGmaW+oBTVr8jTTrCw+z5Q82IsEeJo=;
        b=aIXOMG6gP2rKhsXQOsRUl+K+P8H9t9IcNZ3n9M3SCSD0UIjvPK+dSl7rVI20PhYasi
         WSpJAOj2znZm8s6JXsLdDMjWmRkMBLOhwwfkckBf3aP5leejnUGp3j7+ZFsNWWnM/4Lf
         1j6kAbjSrD2O2bnCg32hcCK7eod4nj+yeqbZKUQfQlb6MuhJJISsd79XXX6++XGwPn6f
         Y35x3x20aaN08+cwuh9/BSo+CPQFQN2MRfe+TyaqMW/DVyxIQpOCf5gwrbim0sUjtWIb
         03j0iix3wEa3Cv6GdT9S7EUe3JI7wljE09RdTSBkrfQbVjvSuZi3QKkN2n3QTTr0bToc
         KI7g==
X-Gm-Message-State: AOJu0Yw32V+xlBcBKA0O/wGezq+yAGQhexQ0/z1z3tl/BUbt/Rqvihi8
	pPGuwhB5Og9X0lF3Xi/A7cEYbKpkbMOLrjSFZTM=
X-Google-Smtp-Source: AGHT+IEGrFfhIoI3POwQNpsjM/DMNSk6DUqcoCtv9bOxkz2m+yNZzDZJwTjWL4AqTPIsC6O10Rn/6w==
X-Received: by 2002:a5d:66ca:0:b0:313:e971:53af with SMTP id k10-20020a5d66ca000000b00313e97153afmr1780607wrw.32.1693404527490;
        Wed, 30 Aug 2023 07:08:47 -0700 (PDT)
Received: from ?IPv6:2001:8b0:aba:5f3c:15ec:a052:9304:60a5? ([2001:8b0:aba:5f3c:15ec:a052:9304:60a5])
        by smtp.gmail.com with ESMTPSA id y3-20020adfe6c3000000b0031c5ce91ad6sm16727289wrm.97.2023.08.30.07.08.46
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 30 Aug 2023 07:08:46 -0700 (PDT)
Message-ID: <54cfce0bb884640b5bf1e40bfd7dab5d419fa1be.camel@linuxfoundation.org>
Subject: Re: [OE-core] [PATCH] update_mandb: Point to correct /etc/passwd
 with man
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: =?ISO-8859-1?Q?Eil=EDs?= 'pidge' =?ISO-8859-1?Q?N=ED_Fhlannag=E1in?=
	 <pidge@baylibre.com>, openembedded-core@lists.openembedded.org
Date: Wed, 30 Aug 2023 15:08:46 +0100
In-Reply-To: <1923dbe0-a0a6-275d-459d-895aecdd2463@baylibre.com>
References: <20230830123912.2052665-1-pidge@baylibre.com>
	 <6965c5634e674335fcfc02e2540d5c2e0bd1caf3.camel@linuxfoundation.org>
	 <1923dbe0-a0a6-275d-459d-895aecdd2463@baylibre.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
User-Agent: Evolution 3.48.1-0ubuntu1 
MIME-Version: 1.0
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 30 Aug 2023 14:08:53 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/186890

On Wed, 2023-08-30 at 15:04 +0100, Eil=C3=ADs 'pidge' N=C3=AD Fhlannag=C3=
=A1in wrote:
> On 30/08/2023 14:19, Richard Purdie wrote:
> > On Wed, 2023-08-30 at 12:39 +0000, Eil=C3=ADs 'pidge' N=C3=AD Fhlannag=
=C3=A1in wrote:
> > > [YOCTO #15023]
> > >=20
> > > In this instance (do_populate_sdk with api-documentation turned on),
> > > pseudo is going to end up finding the passwd/groups files in
> > > recipe-sysroot-native which is incorrect and does not have man. The
> > > solution here should be to ensure that pseudo points to the passwd/gr=
oups
> > > files in recipe-sysroot (which does have man:man).
> > >=20
> > > Signed-off-by: Eil=C3=ADs 'pidge' N=C3=AD Fhlannag=C3=A1in <pidge@bay=
libre.com>
> > > ---
> > >   scripts/postinst-intercepts/update_mandb | 2 +-
> > >   1 file changed, 1 insertion(+), 1 deletion(-)
> > >=20
> > > diff --git a/scripts/postinst-intercepts/update_mandb b/scripts/posti=
nst-intercepts/update_mandb
> > > index a061bb426a6..6bc073bfff5 100644
> > > --- a/scripts/postinst-intercepts/update_mandb
> > > +++ b/scripts/postinst-intercepts/update_mandb
> > > @@ -13,4 +13,4 @@ PSEUDO_UNLOAD=3D1 ${binprefix}qemuwrapper -L $D $D$=
{bindir}/mandb --config-file $C
> > >  =20
> > >   rm -f $CONFIG
> > >  =20
> > > -chown -R man:man $D${localstatedir}/cache/man/
> > > +PSEUDO_PASSWD=3D$D chown -R man:man $D${localstatedir}/cache/man/
> >=20
> > Is there a more general problem here? Wouldn't this issue apply to
> > other postinst scripts too?
>=20
> Yes and No. The other postinst scripts if they do attempt to chown, are=
=20
> trying to do it for root:root (which recipe-native-sysroot's passwd and=
=20
> groups obviously have). We could add this to the others as well, just to=
=20
> maintain consistency.
>=20
> This is all because in image.bbclass, we're setting PSEUDO_PASSWD to=20
> STAGING_DIR_NATIVE which I believe normally should be correct, except in=
=20
> an instance like this.

image.bbclass sets it to:

meta/classes-recipe/image.bbclass:PSEUDO_PASSWD =3D "${IMAGE_ROOTFS}:${STAG=
ING_DIR_NATIVE}"

so it should look at IMAGE_ROOTFS first, which I think is the same as
$D here?

Something isn't quite adding up...

Cheers,

Richard

