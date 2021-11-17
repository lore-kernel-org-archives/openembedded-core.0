Return-Path: <luca.boccassi@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 93A96C433EF
	for <webhook@archiver.kernel.org>; Wed, 17 Nov 2021 18:32:35 +0000 (UTC)
Received: from mail-ed1-f44.google.com (mail-ed1-f44.google.com
 [209.85.208.44])
 by mx.groups.io with SMTP id smtpd.web09.11286.1637173954592055007
 for <openembedded-core@lists.openembedded.org>;
 Wed, 17 Nov 2021 10:32:34 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20210112 header.b=ciXrzGVv;
 spf=pass (domain: gmail.com, ip: 209.85.208.44,
 mailfrom: luca.boccassi@gmail.com)
Received: by mail-ed1-f44.google.com with SMTP id w1so15177376edd.10
        for <openembedded-core@lists.openembedded.org>;
 Wed, 17 Nov 2021 10:32:34 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=message-id:subject:from:to:cc:date:in-reply-to:references
         :user-agent:mime-version;
        bh=RrM+ceZfAmz6fMIEji1Q9AizoREcjRavLk6rbL3vKkw=;
        b=ciXrzGVvAIJhC/2eTRLJha56vEp5U6jDVKV0kqxDUIdMBse8OM4JCNiaF6l2xQD1eH
         1d1b3XHgVb3p8tibb2fgx2zRDpolQhGFV8rSRC5gc0jIEbQBvFkvzOcsYEAyPJPte335
         YAtkqy96xh5Ag5PPal45DOzARNfFJdenCrkFslefQILkOOop11vtoOis1cPBhBKYcP/1
         WQSjNuLmmWRUzGjtK3QdBXhf4e4+7k8ByRBEIbjPiHw4zRWN5waSDohkS5s/cIsk0V84
         O2aM3bmFjdtm+mzsS6/TWN2M7+XRCqftLNfiwoQkWm3C2o0XF34R4Obk0goXtGv5YkXV
         vp6Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:message-id:subject:from:to:cc:date:in-reply-to
         :references:user-agent:mime-version;
        bh=RrM+ceZfAmz6fMIEji1Q9AizoREcjRavLk6rbL3vKkw=;
        b=jTF95h9iRjnuaE4BIBDi8cWFOwerhaVFZRWv+wddiLHR8bDiAsu6nyImgBQIR+ycSC
         A+5LHmDzvYnlPOEwCRr1oBroTel+WFJ2wXopBy/EPW5vcNy1CK/4sdx54K2qHowOAocs
         0QgCK/bCZoloZKdxxeKmJNQm4PUmd+n21BmFHQrQ1zl9sqWvpdZBk+apl/J5ZZL6ZHfx
         ke5Jo1cCY1GGKH98LT2YQcZ2ytgMag8/74QM6SuphptN/bKErBXnfXtyPgCXfx8PqGjk
         3qRB/W6VyhFZXN3A/lWvPB1zy69squeiN5ChQsW5czqynRldxeGl6rJfSsmL0YR4/mQ9
         IZNA==
X-Gm-Message-State: AOAM531s8Jo5CsqRWod7EUiBzN0NQm6A/94bMCIvfZ90Z6pwb9gARmQL
	0F7LC4qusxIK6dEwNx1DWT0=
X-Google-Smtp-Source: 
 ABdhPJyczJEvpzxRtPEWJk2W1zMNL5kTZ2qN9Ff9XwrDYShwCN0hOa1yD8W6eJ4MLlRRE70SykImNg==
X-Received: by 2002:a17:906:8c3:: with SMTP id
 o3mr24741331eje.10.1637173952662;
        Wed, 17 Nov 2021 10:32:32 -0800 (PST)
Received: from [192.168.1.112] ([137.220.125.106])
        by smtp.gmail.com with ESMTPSA id
 hc16sm308544ejc.12.2021.11.17.10.32.31
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 17 Nov 2021 10:32:32 -0800 (PST)
Message-ID: <af3e166f53ff47e4e3d007a06d8c26124dbc91f9.camel@gmail.com>
Subject: Re: [OE-core] [PATCH 1/8] systemd: skip chown when building for
 nativesdk
From: Luca Boccassi <luca.boccassi@gmail.com>
To: Peter Kjellerstedt <peter.kjellerstedt@axis.com>,
	"openembedded-core@lists.openembedded.org"
	 <openembedded-core@lists.openembedded.org>
Cc: "paul.eggleton@microsoft.com" <paul.eggleton@microsoft.com>
Date: Wed, 17 Nov 2021 18:32:30 +0000
In-Reply-To: <9151407a13a544628bf14e106277474d@axis.com>
References: <20211117123201.111905-1-luca.boccassi@gmail.com>
	 <20211117123201.111905-2-luca.boccassi@gmail.com>
	 <9151407a13a544628bf14e106277474d@axis.com>
Content-Type: multipart/signed; micalg="pgp-sha512";
	protocol="application/pgp-signature"; boundary="=-yiWevsfqaqnHezeiKMaf"
User-Agent: Evolution 3.38.3-1+plugin 
MIME-Version: 1.0
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 17 Nov 2021 18:32:35 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/158454


--=-yiWevsfqaqnHezeiKMaf
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Wed, 2021-11-17 at 18:14 +0000, Peter Kjellerstedt wrote:
> > -----Original Message-----
> > From: openembedded-core@lists.openembedded.org
> > <openembedded-core@lists.openembedded.org> On Behalf Of Luca
> > Bocassi
> > Sent: den 17 november 2021 13:32
> > To: openembedded-core@lists.openembedded.org
> > Cc: paul.eggleton@microsoft.com
> > Subject: [OE-core] [PATCH 1/8] systemd: skip chown when building
> > for nativesdk
> >=20
> > From: Luca Boccassi <luca.boccassi@microsoft.com>
> >=20
> > The useradd class is a no-op in the nativesdk case, so chown will
> > fail.
> > Skip them.
> >=20
> > Signed-off-by: Luca Boccassi <luca.boccassi@microsoft.com>
> > ---
> > =C2=A0meta/recipes-core/systemd/systemd_249.5.bb | 10 ++++++++--
> > =C2=A01 file changed, 8 insertions(+), 2 deletions(-)
> >=20
> > diff --git a/meta/recipes-core/systemd/systemd_249.5.bb
> > b/meta/recipes-core/systemd/systemd_249.5.bb
> > index 8bdc0ca028..2f019a4b1f 100644
> > --- a/meta/recipes-core/systemd/systemd_249.5.bb
> > +++ b/meta/recipes-core/systemd/systemd_249.5.bb
> > @@ -275,7 +275,10 @@ do_install() {
> > =C2=A0		# which is expected to be empty.
> > =C2=A0		rm -rf ${D}${localstatedir}/log
> > =C2=A0	else
> > -		chown root:systemd-journal
> > ${D}${localstatedir}/log/journal
> > +		# The useradd class is a no-op in the nativesdk
> > case, so chown will fail
> > +		if [ "${PN}" !=3D "nativesdk-systemd" ]; then
>=20
> If you change that if statement here and below to:
>=20
> 		if [ "${PN}" =3D "${BPN}" ]; then
>=20
> then it will apply just as well if anyone introduces systemd-native.

Thanks, will test that and send a v2 tomorrow if it is all green.

--=20
Kind regards,
Luca Boccassi

--=-yiWevsfqaqnHezeiKMaf
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: This is a digitally signed message part
Content-Transfer-Encoding: 7bit

-----BEGIN PGP SIGNATURE-----

iQIzBAABCgAdFiEErCSqx93EIPGOymuRKGv37813JB4FAmGVSr4ACgkQKGv37813
JB71/g//VKzVC8HO5SysZHxdDqqJ4/VGoNwJaTgTJ+NYUcfhRA76Nev1cuEtBTnU
Oe+QnUpzK/GkEcjV5tZtNo2w/HR+BmQLgpADvQLlDT4ntB4pXt1XtQd1LPcKaj9d
50ThU1WAHz2AIpsY197cX3SacAMBf8Df6xLB/Pg231b9DgfhCkt4ig0QhaHP5vrB
iUHWIronXtFZRivPQVyHaKaolTX2/N0icNSANgMHvxt7qFBcI8vbB5bX+qW09+WG
kJSZ5WOFvrL5WZG61BkKHmnmfhtfNSz0axn8LpsT3lT0yMBkfsapF0WCOk/LTnG2
wCMKBZ5JpNQ1rgmtCKMShv1Rlazurx6xJvbot/CUX0Ve8bBGLJL4zM4igzRg6uJx
YyOQHlA/TgOYNPpH2Jf3UZljDLABdtZbka/447sYtoMbyIWf+sMF/CXkKcqkzPTr
AsaG2i2XdUauKclrrHBpYghbGF/zx5kdFHb/yTHgrKjBuKPf0cMEttwFNlVmz2Ax
tbsNh8Czsnidx/poCNMv6hVBBEEgVMjLdC0M7LUge9ycxNeZi+NmWe1SsLxzrg1F
f9rfJfgVGksGB7BURt8Pkp9a0vAWRwePVQCTj3ea7p8dT0dmRiVhyxQnm7rVH67b
esB+ZblYl1TPQ0iH/ronO2gOsrbCxbGqUXcMQG5v5EiCwyIWbl0=
=T6Mi
-----END PGP SIGNATURE-----

--=-yiWevsfqaqnHezeiKMaf--


