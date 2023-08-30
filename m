Return-Path: <richard.purdie@linuxfoundation.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 2876BC83F14
	for <webhook@archiver.kernel.org>; Wed, 30 Aug 2023 20:08:51 +0000 (UTC)
Received: from mail-wm1-f49.google.com (mail-wm1-f49.google.com [209.85.128.49])
 by mx.groups.io with SMTP id smtpd.web11.628.1693426125779227123
 for <openembedded-core@lists.openembedded.org>;
 Wed, 30 Aug 2023 13:08:46 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@linuxfoundation.org header.s=google header.b=ZG/PKjGi;
 spf=pass (domain: linuxfoundation.org, ip: 209.85.128.49, mailfrom: richard.purdie@linuxfoundation.org)
Received: by mail-wm1-f49.google.com with SMTP id 5b1f17b1804b1-401da71b7c5so461055e9.2
        for <openembedded-core@lists.openembedded.org>; Wed, 30 Aug 2023 13:08:45 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linuxfoundation.org; s=google; t=1693426124; x=1694030924; darn=lists.openembedded.org;
        h=mime-version:user-agent:content-transfer-encoding:references
         :in-reply-to:date:to:from:subject:message-id:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Edk5LvFAzBzuoV8EjCd24uc9rsUOTdKAXRNoeCIL/QA=;
        b=ZG/PKjGiMQxOTxQq2ffAbA0oA11HHJc8qrIsyzUBHZMeHdozpLZbt0aH3w4cJ8HoHv
         cukLG22mN4X7cJGMtro+QNkQgukSUwTQKNtA240+/UgAmhojUHPXJlTjTC7mWWpnFTaa
         GBZOdoc4bc8kieEUb0H4B4j360yesIIZz7/k0=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1693426124; x=1694030924;
        h=mime-version:user-agent:content-transfer-encoding:references
         :in-reply-to:date:to:from:subject:message-id:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=Edk5LvFAzBzuoV8EjCd24uc9rsUOTdKAXRNoeCIL/QA=;
        b=GHjJmtwgf7TIIN5/QaPfsOG5/4xthj8Vw4P5RvhQM/3vLc+jvFCod/BzE7ozUfhPYd
         elek1bExeI3VvkJttoQzpB1lcKwfHU/SikuMAVWCuAw7zOsxf3CrhkAatA32l3OkhioP
         qct25mcVu1VIYdHQjFl+DA67aaOJm4K2LyA/CNuTZ8DH6hUhANs/JpuVhglzXq8JcIvl
         vBV69vHjDAXTlw6RnpKFDa/befi+c1cXLYToEOxzOgkWx1jzy/EiH1tpoFLMkaKmP0aA
         ZZ/ix+NXbgNHdixXjPqXmZ856AN3aXLD2zRXgGJRdc734tlc2YsnjXNeFdMenyJqw/Ji
         +HqQ==
X-Gm-Message-State: AOJu0Yxa9kdbwJUCKOPIO/kXwrYm1uUuxK5w3OiWcdXHoRq8UxPhPEf+
	CJqIg9/6o29zwthyP/kxDjvUnw==
X-Google-Smtp-Source: AGHT+IFi/JNHhhbwTDTnIBDX2iMVWBDF1gSqh7LccFizvnXCkvnohsCtsy+7YYLCUCwmVfg7QvLuYQ==
X-Received: by 2002:a5d:62c5:0:b0:31c:65aa:b15a with SMTP id o5-20020a5d62c5000000b0031c65aab15amr2183391wrv.65.1693426123956;
        Wed, 30 Aug 2023 13:08:43 -0700 (PDT)
Received: from ?IPv6:2001:8b0:aba:5f3c:22b:9179:6474:7878? ([2001:8b0:aba:5f3c:22b:9179:6474:7878])
        by smtp.gmail.com with ESMTPSA id p18-20020a5d4e12000000b00317731a6e07sm17428460wrt.62.2023.08.30.13.08.43
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 30 Aug 2023 13:08:43 -0700 (PDT)
Message-ID: <7fe104380d38c678d4a626997a00b6b24866bc56.camel@linuxfoundation.org>
Subject: Re: [OE-core] [PATCH] update_mandb: Point to correct /etc/passwd
 with man
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: =?ISO-8859-1?Q?Eil=EDs?= 'pidge' =?ISO-8859-1?Q?N=ED_Fhlannag=E1in?=
	 <pidge@baylibre.com>, openembedded-core@lists.openembedded.org
Date: Wed, 30 Aug 2023 21:08:41 +0100
In-Reply-To: <66ee8cdb-967d-ced7-8247-53a38416b708@baylibre.com>
References: <20230830123912.2052665-1-pidge@baylibre.com>
	 <6965c5634e674335fcfc02e2540d5c2e0bd1caf3.camel@linuxfoundation.org>
	 <1923dbe0-a0a6-275d-459d-895aecdd2463@baylibre.com>
	 <54cfce0bb884640b5bf1e40bfd7dab5d419fa1be.camel@linuxfoundation.org>
	 <66ee8cdb-967d-ced7-8247-53a38416b708@baylibre.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
User-Agent: Evolution 3.48.1-0ubuntu1 
MIME-Version: 1.0
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 30 Aug 2023 20:08:51 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/186924

On Wed, 2023-08-30 at 18:07 +0100, Eil=C3=ADs 'pidge' N=C3=AD Fhlannag=C3=
=A1in wrote:
> On 30/08/2023 15:08, Richard Purdie wrote:
> > On Wed, 2023-08-30 at 15:04 +0100, Eil=C3=ADs 'pidge' N=C3=AD Fhlannag=
=C3=A1in wrote:
> > > On 30/08/2023 14:19, Richard Purdie wrote:
> > > > On Wed, 2023-08-30 at 12:39 +0000, Eil=C3=ADs 'pidge' N=C3=AD Fhlan=
nag=C3=A1in wrote:
> > > > > [YOCTO #15023]
> > > > >=20
> > > > > In this instance (do_populate_sdk with api-documentation turned o=
n),
> > > > > pseudo is going to end up finding the passwd/groups files in
> > > > > recipe-sysroot-native which is incorrect and does not have man. T=
he
> > > > > solution here should be to ensure that pseudo points to the passw=
d/groups
> > > > > files in recipe-sysroot (which does have man:man).
> > > > >=20
> > > > > Signed-off-by: Eil=C3=ADs 'pidge' N=C3=AD Fhlannag=C3=A1in <pidge=
@baylibre.com>
> > > > > ---
> > > > >    scripts/postinst-intercepts/update_mandb | 2 +-
> > > > >    1 file changed, 1 insertion(+), 1 deletion(-)
> > > > >=20
> > > > > diff --git a/scripts/postinst-intercepts/update_mandb b/scripts/p=
ostinst-intercepts/update_mandb
> > > > > index a061bb426a6..6bc073bfff5 100644
> > > > > --- a/scripts/postinst-intercepts/update_mandb
> > > > > +++ b/scripts/postinst-intercepts/update_mandb
> > > > > @@ -13,4 +13,4 @@ PSEUDO_UNLOAD=3D1 ${binprefix}qemuwrapper -L $D=
 $D${bindir}/mandb --config-file $C
> > > > >   =20
> > > > >    rm -f $CONFIG
> > > > >   =20
> > > > > -chown -R man:man $D${localstatedir}/cache/man/
> > > > > +PSEUDO_PASSWD=3D$D chown -R man:man $D${localstatedir}/cache/man=
/
> > > >=20
> > > > Is there a more general problem here? Wouldn't this issue apply to
> > > > other postinst scripts too?
> > >=20
> > > Yes and No. The other postinst scripts if they do attempt to chown, a=
re
> > > trying to do it for root:root (which recipe-native-sysroot's passwd a=
nd
> > > groups obviously have). We could add this to the others as well, just=
 to
> > > maintain consistency.
> > >=20
> > > This is all because in image.bbclass, we're setting PSEUDO_PASSWD to
> > > STAGING_DIR_NATIVE which I believe normally should be correct, except=
 in
> > > an instance like this.
> >=20
> > image.bbclass sets it to:
> >=20
> > meta/classes-recipe/image.bbclass:PSEUDO_PASSWD =3D "${IMAGE_ROOTFS}:${=
STAGING_DIR_NATIVE}"
> >=20
> > so it should look at IMAGE_ROOTFS first, which I think is the same as
> > $D here?
> >=20
> > Something isn't quite adding up...
>=20
> In this case, IMAGE_ROOTFS and D are not the same, either at the start=
=20
> of do_populate_sdk or when the postinst script runs:
>=20
> bitbake -e yields:
>=20
> IMAGE_ROOTFS=3D"/home/pidge/poky/build/tmp/work/qemux86_64-poky-linux/cor=
e-image-base/1.0/rootfs"
>=20
> Passing IMAGE_ROOTFS into the update-mandb postinst scripts yields this:
>=20
> D=3D"/home/pidge/poky/build/tmp/work/qemux86_64-poky-linux/core-image-bas=
e/1.0/sdk/image/usr/local/oe-sdk-hardcoded-buildpath/sysroots/core2-64-poky=
-linux"
> IMAGE_ROOTFS=3D"/home/pidge/poky/build/tmp/work/core2-64-poky-linux/eudev=
/3.2.12/rootfs"
>=20
> Even if we were relying on an IMAGE_ROOTFS that pointed to what we=20
> expected, it is probably the wrong option here because there is no=20
> assurance it's populated with a passwd file when we run bitbake=20
> core-image-base -f -c do_populate_sdk. I've checked on my setup and have=
=20
> verified that it doesn't contain anything at that stage.
>=20
> In my patch $D is actually set to ${SDK_OUTPUT}/${SDKPATHNATIVE} (not=20
> recipe-sysroot, I'll correct this in the log) which incidentally is also=
=20
> the same place we're running mandb from.

This might hint at the real issue :)

If this is during do_populate_sdk, it is worth noting that the SDK
doesn't have file ownership, either for the nativesdk components or the
target ones. This therefore shouldn't be running in that context at
all!

Cheers,

Richard


