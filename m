Received: from mail-wr1-f43.google.com (mail-wr1-f43.google.com [209.85.221.43])
 by mx.groups.io with SMTP id smtpd.web10.7707.1608284834539533400
 for <openembedded-core@lists.openembedded.org>;
 Fri, 18 Dec 2020 01:47:14 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20161025 header.b=dSO71WZA;
 spf=pass (domain: gmail.com, ip: 209.85.221.43, mailfrom: luca.boccassi@gmail.com)
Received: by mail-wr1-f43.google.com with SMTP id r3so1455450wrt.2
        for <openembedded-core@lists.openembedded.org>; Fri, 18 Dec 2020 01:47:14 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=message-id:subject:from:to:date:in-reply-to:references:user-agent
         :mime-version;
        bh=5rHi8GY3dFtKRNtzFGja5Zt9sKOcTcPMw5Q4GMNIyUI=;
        b=dSO71WZAd2LvvKbJ9lQXTk33ei3XlEpJn3wUlMs+GwzxdA9Zf2zEtugCf5O83vo1pz
         ZuaEYqwiprZ7Sw70p0kTWTnwrY9NfiDYE7qJIJAusTegbFxnXcwORVTb3cadxaJQIk9A
         lokR7vERzptFD2llU24K1NYPOGnMHMFOTrBCVv/sJRgLc3Hl0mebU/xMyqg6iq5lcSLJ
         oqagyAiQJCIYf5ieHN99flrzPcc7o0OtFcWedcxX8/TnAcU19azux7AD8ScCTK0X2ooI
         qQrcGY6A+o4ldQX13x+/D9q3yQBzPZRCJLFxjrGXVfBti5EIRXLcQJuCh6ou40U8QGvR
         gQVA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:message-id:subject:from:to:date:in-reply-to
         :references:user-agent:mime-version;
        bh=5rHi8GY3dFtKRNtzFGja5Zt9sKOcTcPMw5Q4GMNIyUI=;
        b=QtFPRNozS4hBtXJDTB05wnn+NV2BO9V1yaSoqGk2pvVVeqR5qQN5e86eAMRGfRn5ch
         x4tMzefQsc3jl8QLbPPMS2dYeyt8CY2dJMC1KjMx+/APWR8aZbi0GbAivLFpWGyHEpPP
         oB+Cbolbidr5Bt7suARoWwREbnpXxrSbbGTWg1igkI9sP30ipcHWtYRiZhgCAzN9koW7
         XKYqQmXeLAOppuJFfAbX7E86jSfFwQ4OV/UtwIVafMh4jEvbE8zYC0kcgmlLLupDBQA3
         t784iGFizCVkjCCIu0uta8BLVpPWbTFUramqFQLiUPrtaiJu9xKA5qpne0KrkOZnRzwJ
         bkDg==
X-Gm-Message-State: AOAM530qLj8mwiE+pnaHc9eIHJsphaNg43C80W4YYf33N1mBxZ5N8PEF
	IjlaD4MQY7PJTsqAsMOL+nRX+vfQcTVYnw==
X-Google-Smtp-Source: ABdhPJy9r0pXCzJfBqqvOkujuxVL8gf14LWfaH0d7WZNcRLWsUgizNd7q2hNcjPS5HRHDDVntF8bMQ==
X-Received: by 2002:a5d:43ce:: with SMTP id v14mr3441461wrr.342.1608284833137;
        Fri, 18 Dec 2020 01:47:13 -0800 (PST)
Return-Path: <luca.boccassi@gmail.com>
Received: from bluca-lenovo ([88.98.246.218])
        by smtp.gmail.com with ESMTPSA id v20sm10957002wml.34.2020.12.18.01.47.11
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 18 Dec 2020 01:47:12 -0800 (PST)
Message-ID: <890ce63e873a9c3f8dcfdadde47904a02e2bc155.camel@gmail.com>
Subject: Re: [OE-core] [PATCH v2 1/5] systemd: update 246 -> 247
From: "Luca Bocassi" <luca.boccassi@gmail.com>
To: Richard Purdie <richard.purdie@linuxfoundation.org>, 
	openembedded-core@lists.openembedded.org
Date: Fri, 18 Dec 2020 09:47:11 +0000
In-Reply-To: <3a1f7ea9f46a2d0311eff000d59a92f10dbf42f4.camel@linuxfoundation.org>
References: <20201210125312.3302065-1-luca.boccassi@gmail.com>
	 <20201214123457.122655-1-luca.boccassi@gmail.com>
	 <7d16bf791179cc0e90fd0172e984eeeacb065112.camel@linuxfoundation.org>
	 <68d3174ccafddf0732e553e408e8b1c5c62a095f.camel@gmail.com>
	 <3a1f7ea9f46a2d0311eff000d59a92f10dbf42f4.camel@linuxfoundation.org>
User-Agent: Evolution 3.30.5-1.2 
MIME-Version: 1.0
X-Groupsio-MsgNum: 145856
Content-Type: multipart/signed; micalg="pgp-sha512";
	protocol="application/pgp-signature"; boundary="=-wkW1wPZccWe8I2sgM65l"

--=-wkW1wPZccWe8I2sgM65l
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Thu, 2020-12-17 at 17:46 +0000, Richard Purdie wrote:
> On Thu, 2020-12-17 at 17:25 +0000, Luca Boccassi wrote:
> > On Wed, 2020-12-16 at 18:07 +0000, Richard Purdie wrote:
> > > On Mon, 2020-12-14 at 12:34 +0000, Luca Bocassi wrote:
> > > > From: Luca Boccassi <luca.boccassi@microsoft.com>
> > > >=20
> > > > Update systemd to v247.1.
> > > > Add rule for new oomd dbus conf and for new pam.d
> > > > conf directory in /usr/lib.
> > > > Drop selinux-hook-handling-to-enumerate-nexthop.patch,
> > > > merged upstream.
> > > > Backport 0001-meson-set-cxx-variable-before-using-it.patch
> > > > from v247-stable to fix builds without C++.
> > > > Refresh musl patches.
> > > >=20
> > > > Signed-off-by: Luca Boccassi <luca.boccassi@microsoft.com>
> > > > ---
> > > > NOTE: the musl build has only been build-tested, and only on x86_64=
.
> > > > The glibc build has been built and runtime-tested on x86_64 and
> > > > arm64.
> > >=20
> > > [sorry, hit send early when writing]
> > >=20
> > > Unfortunately there is still something not quite right in this patchs=
et
> > > as it failed again during testing. There are a few different problems=
:
> > >=20
> > > meta-intel in systemd-boot:
> > >=20
> > > https://autobuilder.yoctoproject.org/typhoon/#/builders/100/builds/10=
16
> >=20
> > Looking into this, thanks

Looks like it was an issue in meta-intel, which was fixed there as per
email from Anuj

> > > a reproducibility issue in oe-selftest:
> > >=20
> > > https://autobuilder.yoctoproject.org/typhoon/#/builders/79/builds/165=
1
> > > (which did happen last time as well on centos but I don't think was
> > > reported on the list, sorry)
> > >=20
> > > These urls may help understand why its not reproducible:
> > >=20
> > > https://autobuilder.yocto.io/pub/repro-fail/oe-reproducible-20201215-=
mhq8wl33/packages/diff-html/
> > > https://autobuilder.yocto.io/pub/repro-fail/oe-reproducible-20201215-=
mhq8wl33/
> > >=20
> > > (looks like the uid of messagebus is changing at a really quick glanc=
e)
> >=20
> > Given your follow-up message about host contamination, is there
> > anything I can do here to fix it/mitigate it, or is it a CI issue?
>=20
> We'll have to look into why building it on a centos system seems to
> result in a different binary from building it on other distros. Its not
> a CI problem, our multi distro setup is just exposing the problem (as
> its intended to).

I'm afraid this is a bit beyond my capabilities at the moment - I don't
have a CentOS system available, nor the time to set it up right now.
As far as I can see there should be nothing in the changes I'm doing to
the recipe causing this - if the root cause is in the package, it must
be from the upstream sources.

> > > and a build issue in world-lsb:
> > >=20
> > > https://autobuilder.yoctoproject.org/typhoon/#/builders/108/builds/11=
89
> > >=20
> > > At the top of the logs you can see the configuration that is being us=
ed
> > > for a given build, so for example in the last one, the key difference
> > > to some of the other builds might be any one of:
> > >=20
> > > DISTRO =3D "poky-altcfg"
> > > DISTRO_FEATURES_append =3D ' api-documentation'
> > > require conf/multilib.conf
> > > MULTILIBS =3D 'multilib:lib32'
> > > DEFAULTTUNE_virtclass-multilib-lib32 =3D 'x86'
> > > QEMU_USE_KVM =3D 'True'
> > > INHERIT +=3D 'testimage'
> > > SDK_EXT_TYPE =3D 'minimal'
> > > SDK_INCLUDE_TOOLCHAIN =3D '1'
> > >=20
> > > but given its a pam error, I'd strongly suspect the DISTRO =3D "poky-
> > > altcfg" would be the likely trigger.
> >=20
> > ERROR: systemd-1_247.1-r0 do_package: QA Issue: systemd: Files/director=
ies were installed but not shipped in any packa
> > ge:
> >   /usr/lib/pam.d
> >   /usr/lib/pam.d/systemd-user
> >=20
> > But the recipe has:
> >=20
> > FILES_${PN} =3D " ${base_bindir}/* \
> >                <...>
> >                ${libdir}/pam.d/ \
> >=20
> > Shouldn't that match? Did I use the wrong variable?
>=20
> I think the trailing slash may make it match the directory only? I'm
> going from memory though...

Paul figured this one out: we need to also match
${nonarch_libdir}/pam.d - fixed in v3

--=20
Kind regards,
Luca Boccassi

--=-wkW1wPZccWe8I2sgM65l
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: This is a digitally signed message part
Content-Transfer-Encoding: 7bit

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEE6g0RLAGYhL9yp9G8SylmgFB4UWIFAl/cep8ACgkQSylmgFB4
UWL+zAf/QaBsYSoR4xQQzgZtdGBTvdWv5wg9IojrS6bpFLakvyg1CPGyzTwPqG1N
4uruQ9zXuZLv95lrZMvyXv0C1SeA4fwakHZzxTb4tifrJZCBA+J88GnwJ4RSJ7wV
7e9Uqgw8E2bDflbofWH8o9iTZ/C+BGUex/dWOum8MZ7NKAob7Exa73gZ6rpzr5hB
hnL/EoTLaWGlHqSMkM/GbnQfKUBPhK91BgR5JTfqspK3Gm4nYJqmRGNT3+ZO/Ii8
mbmft3vq1yLb+0dnX/vTpSB49quKpF+1QYSC86XKzQ87w9CqUtQXpfyGEl/qV5y8
UGQpLGoM37RREiKGgfrBqumJo/71Aw==
=a0SU
-----END PGP SIGNATURE-----

--=-wkW1wPZccWe8I2sgM65l--
