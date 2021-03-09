Received: from mail-wr1-f42.google.com (mail-wr1-f42.google.com [209.85.221.42])
 by mx.groups.io with SMTP id smtpd.web10.8717.1615296419393013329
 for <openembedded-core@lists.openembedded.org>;
 Tue, 09 Mar 2021 05:26:59 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20161025 header.b=LL/+qN56;
 spf=pass (domain: gmail.com, ip: 209.85.221.42, mailfrom: luca.boccassi@gmail.com)
Received: by mail-wr1-f42.google.com with SMTP id h98so15505674wrh.11
        for <openembedded-core@lists.openembedded.org>; Tue, 09 Mar 2021 05:26:58 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=message-id:subject:from:to:cc:date:in-reply-to:references
         :user-agent:mime-version;
        bh=99mCPOJbQoQROfwnP2noD7kuwjPywrqjswZ4fh9UXWc=;
        b=LL/+qN563FbPld0zrGekzBsOqc5I+jmDM7VcwrsMuujem3boVBxZGZMAE905QNHQuS
         cru3RM7JGrB1ABV3oPsKLAkq19t5Nlf/DAk8IG81SDCcxMg6mG8xflZIhgbhgxRK3eFM
         KnpC2QAaMVpsSMBA9avlkpWmmrw0xJUilEbs5gWSHQY7lQW4OM5r9boOaekBGBUspI6q
         m83n3gJq0sOuw+R1VceBduj2p2xWYes2jj9BwmfGexhcH35L5ZkN2XS2o6oildHf/pVx
         YXcXeLcOWVVm6BnsiZ0N9rCODednd1JvVgBK5qeGoduNkyQcRFAWRn10bw7MdGXHPabZ
         mGlQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:message-id:subject:from:to:cc:date:in-reply-to
         :references:user-agent:mime-version;
        bh=99mCPOJbQoQROfwnP2noD7kuwjPywrqjswZ4fh9UXWc=;
        b=Ql0Hjihtg+upBxkTfb6kaap1xw+P4AgGlWI/bhdI3UFyi59jsR/oLJLroYsMHLW3ZJ
         kT5L0n1MRfHVTncQlKuTdnoF/F/QqtqXyVvkxVOYwxnRLb4NSKB3vUtWS1B/QdSjOype
         d+pfKXuvmtbJ6xFX5cNCmm85mB7fzMT8zQhLJ0Hqb+fq8M7T2DOqMsgd/QZ/Xg9mdkSC
         z/Y4igsp9wwiFMCY92wQcdmTTsBFu8E1RNIm3WCR/MeXtZXuXGeqQTrC1n29xVhPYTfn
         VpK9av01+DJkk6jyuaZx2grB91XYqrjlIwVz6PCaboJ7r+zW2E4yGzneAr1PkMzybZwA
         cfPQ==
X-Gm-Message-State: AOAM530NaUHo2367FPMgjVgGH8wqnXgfO9uWCNivSwPq7OZ0o4Bs7sca
	oYdp4Xfa6CLodBdH35W7ezE=
X-Google-Smtp-Source: ABdhPJzNqecwW0KUemsrfzM+8qQFgbDGX8KEGWobV0Tc20NT3ou4xsEfSgMbL9P41pV6O2mUIuMlHQ==
X-Received: by 2002:a05:6000:1107:: with SMTP id z7mr7654919wrw.415.1615296417671;
        Tue, 09 Mar 2021 05:26:57 -0800 (PST)
Return-Path: <luca.boccassi@gmail.com>
Received: from bluca-lenovo ([88.98.246.218])
        by smtp.gmail.com with ESMTPSA id s83sm4175133wmf.26.2021.03.09.05.26.56
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 09 Mar 2021 05:26:56 -0800 (PST)
Message-ID: <c8159284d8980632a111126f61885e401a1eac90.camel@gmail.com>
Subject: Re: [OE-core] [PATCH v7] util-linux: split uuid in separate recipe to allow bootstrapping
From: "Luca Bocassi" <luca.boccassi@gmail.com>
To: =?ISO-8859-1?Q?K=F6ry?= Maincent <kory.maincent@bootlin.com>, 
	openembedded-core@lists.openembedded.org
Cc: Richard Purdie <richard.purdie@linuxfoundation.org>, 
	bluelightning@bluelightning.org, Alexandre Belloni
	 <alexandre.belloni@bootlin.com>
Date: Tue, 09 Mar 2021 13:26:55 +0000
In-Reply-To: <20210309121859.053dbeb1@kmaincent-XPS-13-7390>
References: <20201210184632.3448265-1-luca.boccassi@gmail.com>
	 <20210305110218.24635-1-luca.boccassi@gmail.com>
	 <58bcb66c9e15d4121defef93cb6b34266fd89037.camel@linuxfoundation.org>
	 <20210309121859.053dbeb1@kmaincent-XPS-13-7390>
User-Agent: Evolution 3.30.5-1.2 
MIME-Version: 1.0
X-Groupsio-MsgNum: 149160
Content-Type: multipart/signed; micalg="pgp-sha512";
	protocol="application/pgp-signature"; boundary="=-TafbuaRm7mDGg37JFGUe"

--=-TafbuaRm7mDGg37JFGUe
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Tue, 2021-03-09 at 12:18 +0100, K=C3=B6ry Maincent wrote:
> On Mon, 08 Mar 2021 19:29:20 +0000
> "Richard Purdie" <richard.purdie@linuxfoundation.org> wrote:
>=20
> > On Fri, 2021-03-05 at 11:02 +0000, luca.boccassi@gmail.com wrote:
> > > From: Luca Boccassi <luca.boccassi@microsoft.com>
> > >=20
> > > Recently util-linux gained an (optional) build dependency on libcrypt=
setup.
> > > But libcryptsetup build-depends on util-linux for blkid (optional, ca=
n be
> > > disabled) and uuid (mandatory).
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
> > > v2: changed packages names to reflect old ones (eg: libuuid1 ->
> > > util-linux-libuuid) and leave uuid build enable in main recipe to all=
ow for
> > > uuidgen build to happen, as it does not have its own autoconf switch.
> > > Delete the library manualy from the main recipe after build instead, =
and
> > > add dependency. Might help to break loop python3 -> util-linux ->
> > > libselinux -> python3, as it's only libuuid that is needed, see
> > > https://lists.yoctoproject.org/g/yocto/message/47570 v3: rebased and
> > > refactored to have a common util-linux.inc file v4: added RDEPENDS on
> > > util-linux-libuuid on various packages to fix QA warnings v5: remove
> > > RDEPENDS and instead have util-linux RDEPEND on util-linux-uuid. Remo=
ved
> > > PACKAGES_remove and instead filter out libuuid via the package genera=
tion
> > > regex. Rebased on util-linux 2.36.2.
> > > v6: install libuuid.a in libuuid-dev
> > >     change rdepends on uuid to use binary package rather than source
> > >     add rdepends on uuid-dev to libuuid-dev
> > >     remove rprovides of libuuid-dev from uuid-dev
> > > v7: do not use '_append' for RDEPENDS, as it is not supported by
> > > BBCLASSEXTEND, use simply '+=3D' =20
> >=20
> > This is looking closer but not there yet I'm afraid. Testing showed:
> >=20
> > https://autobuilder.yoctoproject.org/typhoon/#/builders/57/builds/3152
> > https://autobuilder.yoctoproject.org/typhoon/#/builders/47/builds/3188
> >=20
>=20
> It miss also the Maintainer description for linux-util-uuid recipe:
> https://autobuilder.yoctoproject.org/typhoon/#/builders/86/builds/1901/st=
eps/14/logs/stdio
>=20
> Regards,=20
>=20
> K=C3=B6ry

Hi,

The DESCRIPTION field is in the util-linux.inc which is included by the
recipe. Or is that something else entirely? What is it, precisely?

--=20
Kind regards,
Luca Boccassi

--=-TafbuaRm7mDGg37JFGUe
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: This is a digitally signed message part
Content-Transfer-Encoding: 7bit

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEE6g0RLAGYhL9yp9G8SylmgFB4UWIFAmBHd58ACgkQSylmgFB4
UWKxjQf/Xou9zYR/fKUt9NdFplNaawXnmJmv6eOQCixfGSP6casTE9btb07zoWCy
cy2P8bKL68HFkAQ/cPtw38PNjJURJIGnSgEX7jyGUHK+XEyVmeeKz2jaoN26nqJu
UgFklZh5YowmzhbV0eIg9ySK/5ECQ6CIaUSwhNqrSmjPNih6hgwia3U6BG+MXCJ2
n1yI2/ic0LfWk/N12bDcyxa6TFjE1qsdFXbEtg8s/RC2BdSD1tpkef9PXpgWr+pG
Jjl5WCSNhatfmLHAMUe23N14klCtW5jQjzunzdlTMjQfWW9zlaGvkobTTTJ8OWYq
/k0dquLGNc2H6mfeo9KBR/Da2LmDhw==
=Gqo3
-----END PGP SIGNATURE-----

--=-TafbuaRm7mDGg37JFGUe--
