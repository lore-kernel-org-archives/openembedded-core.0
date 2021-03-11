Received: from mail-wr1-f43.google.com (mail-wr1-f43.google.com [209.85.221.43])
 by mx.groups.io with SMTP id smtpd.web08.4008.1615457706400936164
 for <openembedded-core@lists.openembedded.org>;
 Thu, 11 Mar 2021 02:15:06 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20161025 header.b=XK4vE3u1;
 spf=pass (domain: gmail.com, ip: 209.85.221.43, mailfrom: luca.boccassi@gmail.com)
Received: by mail-wr1-f43.google.com with SMTP id w11so1159200wrr.10
        for <openembedded-core@lists.openembedded.org>; Thu, 11 Mar 2021 02:15:05 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=message-id:subject:from:to:cc:date:in-reply-to:references
         :user-agent:mime-version;
        bh=tQgf0y4Hg4PYQRZtpJZIkLWoFKEgx4RN5l4nz49U/14=;
        b=XK4vE3u19m67ACZUH4T9/kLtFecCVdJcPXU5pS0G3eqTHGCvO7/0C4JcCw7OZLYHRO
         1Y0ggS8BIcxmpHzrQYNE7o32KltKimVg3c2bfV6ZofRmN0U+6g7qAtB8JMjgYnrEuH7J
         /kxK6kP6IDn9BJfRpKAXLozYLsCPYfY+kP7V9VbTuYqn1+DVmMap4qQ23I0mgOeU3upe
         ByP/TyS/hDIYDUIVuCi3LSCe7gmak7Yr4M1Ds8+H/JbQxoC1Z3AwoRxupHu6uDlk0xcn
         +FSFnPizIO22EpAoIcT/gRvLu70cPwtH4NuDJ3Q13T3lWs51HbBqkb5DcmO2PKwxd1LQ
         gK8A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:message-id:subject:from:to:cc:date:in-reply-to
         :references:user-agent:mime-version;
        bh=tQgf0y4Hg4PYQRZtpJZIkLWoFKEgx4RN5l4nz49U/14=;
        b=MXvS0/h5bW+aakVRpXayQ48tO5ZBWkgpSt3e8hFbzFKMgtb8+iGsWg+OiQO1g26Mk+
         llzvOtlCymJNd38vYqU8Kc10zJ4iZ7MjkhUG7x1d0QT7Sgu++ubI89R74CoZKKTaHEQE
         r9ZYtQli1V38o0/sA5KILsVp3xPgLDgNs7rGJrSIOUbB/Rcew9uJApdB4jmgstfQkURJ
         TLIX/mvSxK8MFCv9TNjQzLL8SWKVkrYvkP6R7F8SZR1cjSiwmXscyit2kbmAUnpQE8A7
         XK1uFFDIB+R2QyesAbeU79K7uUasGCVyVIVPf8XU+XDt5twg4FTn8132o1CKvZc/FR16
         5cVQ==
X-Gm-Message-State: AOAM532shlZjCSAV0eGD+G9PCjGmybmJsTbyx9RFw7dNq2uWf3tjLpyw
	fjdVbFyYdxGGjUi8Fv3HHyc=
X-Google-Smtp-Source: ABdhPJzVeTZCI5j1ckDFip3ILrWf1AYk11BzolBWuFnfmYw4+UPXrjafciul8fLKjZi3l56S/luGOg==
X-Received: by 2002:adf:d20b:: with SMTP id j11mr7818703wrh.397.1615457704658;
        Thu, 11 Mar 2021 02:15:04 -0800 (PST)
Return-Path: <luca.boccassi@gmail.com>
Received: from bluca-lenovo ([88.98.246.218])
        by smtp.gmail.com with ESMTPSA id r11sm3186779wrm.26.2021.03.11.02.15.03
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 11 Mar 2021 02:15:03 -0800 (PST)
Message-ID: <291a86bde929406603821b08b1fe36cfecf19103.camel@gmail.com>
Subject: Re: [PATCH v9] util-linux: split uuid in separate recipe to allow bootstrapping
From: "Luca Bocassi" <luca.boccassi@gmail.com>
To: Richard Purdie <richard.purdie@linuxfoundation.org>, 
	openembedded-core@lists.openembedded.org
Cc: bluelightning@bluelightning.org, Kory Maincent
 <kory.maincent@bootlin.com>
Date: Thu, 11 Mar 2021 10:15:02 +0000
In-Reply-To: <539920c0108d13a48eb63650be96c97435c11dca.camel@gmail.com>
References: <20201210184632.3448265-1-luca.boccassi@gmail.com>
	 <20210309135606.508593-1-luca.boccassi@gmail.com>
	 <681b7ba8baca230a2b95f5c1fc40e1b5108e9a70.camel@linuxfoundation.org>
	 <539920c0108d13a48eb63650be96c97435c11dca.camel@gmail.com>
User-Agent: Evolution 3.30.5-1.2 
MIME-Version: 1.0
X-Groupsio-MsgNum: 149278
Content-Type: multipart/signed; micalg="pgp-sha512";
	protocol="application/pgp-signature"; boundary="=-7cjHn11KuCrUxIxagdcy"

--=-7cjHn11KuCrUxIxagdcy
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Wed, 2021-03-10 at 18:28 +0000, Luca Boccassi wrote:
> On Tue, 2021-03-09 at 23:43 +0000, Richard Purdie wrote:
> > On Tue, 2021-03-09 at 13:56 +0000, luca.boccassi@gmail.com wrote:
> > > From: Luca Boccassi <luca.boccassi@microsoft.com>
> > >=20
> > > Recently util-linux gained an (optional) build dependency on libcrypt=
setup.
> > > But libcryptsetup build-depends on util-linux for blkid (optional, ca=
n be disabled)
> > > and uuid (mandatory).
> > > Split out util-linux-uuid in a different recipe to break the cycle.
> > >=20
> > > https://github.com/karelzak/util-linux/pull/898
> > >=20
> > > Signed-off-by: Luca Boccassi <luca.boccassi@microsoft.com>
> > > ---
> > > v1: util-linux 2.35 is not out yet, but I'd like to get the preparato=
ry work
> > >     underway as I'm not sure if this is the best approach or if there=
 are
> > >     alternatives. Suggestions and comments very welcome. Thanks!
> > > v2: changed packages names to reflect old ones (eg: libuuid1 -> util-=
linux-libuuid)
> > >     and leave uuid build enable in main recipe to allow for uuidgen b=
uild to happen,
> > >     as it does not have its own autoconf switch. Delete the library m=
anualy from
> > >     the main recipe after build instead, and add dependency.
> > >     Might help to break loop python3 -> util-linux -> libselinux -> p=
ython3, as it's
> > >     only libuuid that is needed, see https://lists.yoctoproject.org/g=
/yocto/message/47570
> > > v3: rebased and refactored to have a common util-linux.inc file
> > > v4: added RDEPENDS on util-linux-libuuid on various packages to fix Q=
A warnings
> > > v5: remove RDEPENDS and instead have util-linux RDEPEND on util-linux=
-uuid.
> > >     Removed PACKAGES_remove and instead filter out libuuid via the pa=
ckage generation
> > >     regex.
> > >     Rebased on util-linux 2.36.2.
> > > v6: install libuuid.a in libuuid-dev
> > >     change rdepends on uuid to use binary package rather than source
> > >     add rdepends on uuid-dev to libuuid-dev
> > >     remove rprovides of libuuid-dev from uuid-dev
> > > v7: do not use '_append' for RDEPENDS, as it is not supported by BBCL=
ASSEXTEND, use
> > >     simply '+=3D'
> > > v8: added missing libuuid-staticdev package
> > >     remove libx32/libuuid* too
> > > v9: set RECIPE_MAINTAINER_pn-util-linux-uuid, same value as RECIPE_MA=
INTAINER_pn-util-linux
> >=20
> > Sorry, there are still issues:
> >=20
> > https://autobuilder.yoctoproject.org/typhoon/#/builders/44/builds/3207
> > https://autobuilder.yoctoproject.org/typhoon/#/builders/82/builds/1608
> > https://autobuilder.yoctoproject.org/typhoon/#/builders/52/builds/3159
> >=20
> > :(
> >=20
> > I really want to get this into the release but we're past feature freez=
e and
> > running out of opportunity as each broken test run is delaying other pa=
tches.
>=20
> No problem at all, it's absolutely fine to postpone, I am in no
> immediate rush as I have local backports in use. As long as we get
> things sorted at some point it's all good for me, so please don't delay
> other patches because of this.
>=20
> > I'm a little unclear if debian renaming was allowed before the split an=
d if
> > so, why it is disabled in the split version. I suspect there is a missi=
ng
> > MLPREFIX somewhere causing the multilib issue too.
>=20
> I do not remember why the DEBIAN_NOAUTONAME was added at this point.
> I'll try to send a new version tomorrow.

So without DEBIAN_NOAUTONAME these are the package names:

libuuid1-2.36.2-r0.core2_64.rpm
libuuid-dbg-2.36.2-r0.core2_64.rpm
libuuid-dev-2.36.2-r0.core2_64.rpm
util-linux-uuid-src-2.36.2-r0.core2_64.rpm

that's going to be a problem as they don't match anymore, right? Since
they used to be util-linux-libuuid, etc. Although the poky image build
completed just fine...

--=20
Kind regards,
Luca Boccassi

--=-7cjHn11KuCrUxIxagdcy
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: This is a digitally signed message part
Content-Transfer-Encoding: 7bit

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEE6g0RLAGYhL9yp9G8SylmgFB4UWIFAmBJ7aYACgkQSylmgFB4
UWJlfwf+O0Neavzo+fC/B5xmbMs+lCFoE7n5exrw7Zobzg+bFV6VuOD1eaRHJu5F
nieDfEEOcdbKUP0rSsuwNbrtVgzX3cJ7Xg1/kO6XJA35CPuz1+qoa6ir5lN4c4w3
aRqdC9T4g8FUYNNf3IdVGQ+OC/Sld4I+jB6BgOTOVt49afkFFyCXW9iXB0v6zJIk
e6rDl8NxjhRyixrQULnNCjIdoR8EpaiG74HWbjkHauRHmixMvxcVjtEE4K/sy9ZB
ap6AgeOHxYion6xdu/XHQPFZ4OZ4vbr5+iYrAswBvHqJD8oSrobv/LIsnQwd1lMI
8WwLlEYDDFVAnCs0br35DE+CdnGuNA==
=pl2W
-----END PGP SIGNATURE-----

--=-7cjHn11KuCrUxIxagdcy--
