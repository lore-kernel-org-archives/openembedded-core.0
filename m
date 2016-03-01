Return-Path: <martin.jansa@gmail.com>
Received: from mail-wm0-f46.google.com (mail-wm0-f46.google.com [74.125.82.46])
	by mail.openembedded.org (Postfix) with ESMTP id 3E16573FA3
	for <openembedded-core@lists.openembedded.org>;
	Tue,  1 Mar 2016 08:16:26 +0000 (UTC)
Received: by mail-wm0-f46.google.com with SMTP id p65so23766707wmp.1
	for <openembedded-core@lists.openembedded.org>;
	Tue, 01 Mar 2016 00:16:27 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=from:date:to:cc:subject:message-id:references:mime-version
	:content-disposition:in-reply-to:user-agent;
	bh=ZqZc3WmND5J4AW5OoEWybiOnMmVIYt4lQNNmz08FuAw=;
	b=Lc5e44CKkqvVVoMqC5v7ObwOgrGJTwXqFwLNnqtMNmwN5zRwDv/D+TBY9DHAi/bGAF
	5sVGk9kr4VZdeA18kbcZvQfnq3YsNZ6lcEJoMYLoUi8VcAJMsQAjA4MurOG+f7i3fpQ0
	++GhGWiiB8L/USZN7bQz+5neBHyT8hBIAzDD/ugt1kenbKNFpwLaP8M39nRaDzKFp4HM
	3VOJa8egI59ktRRiH/3xiJA+ypeLbrxF4MXdka8jpKigyxSEVssHKtlZAl6V2Npghhi7
	u26Nbey8dO7h1QwXeUb5DwR3yB7He28PoenvsbjzDf9cMJJLwDJlfSkicYYcNbmdMRjl
	Xz/w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:from:date:to:cc:subject:message-id:references
	:mime-version:content-disposition:in-reply-to:user-agent;
	bh=ZqZc3WmND5J4AW5OoEWybiOnMmVIYt4lQNNmz08FuAw=;
	b=jRDaerpjkAz2mAoLbv0Dm36A2kMt6B7giU7ckMl7zkfkHpQsDYKEL+CIUkx2YBn470
	mUDh5+PahuegKk8HKhbwKEpazMi/VRfF1SxJL7g2J62O0joFP5t0vTiZQlAW6Y/pF7SQ
	G8K/lm7o+hXX8jlmidKTmA9Nq3bVNFI1sO8XlKu2kBhUt/9s4TXFDGmm/lkTpg/wUeHS
	5oqgdtu1dqseiLZlwh0VqQ6AlaQYPuCuIYXUCSlnIQrjqhu/mdDQ1NqoFnnBdY4XFmsP
	WMF3rd/a851uF6pzg5u9sf5a7a07FotVw6C4OjNGDslf/et/YV1FKuH/iiv4pMwKkzGL
	CWoA==
X-Gm-Message-State: AD7BkJIq7gUPuzxnhNt0bis1eUUO1a6Qwk+SUmja+OvYI7m6utheN6OU+mHUMucxSWe4nw==
X-Received: by 10.194.115.8 with SMTP id jk8mr20914412wjb.136.1456820187137;
	Tue, 01 Mar 2016 00:16:27 -0800 (PST)
Received: from localhost (ip-86-49-34-37.net.upcbroadband.cz. [86.49.34.37])
	by smtp.gmail.com with ESMTPSA id
	k124sm19990151wmb.11.2016.03.01.00.16.25
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Tue, 01 Mar 2016 00:16:25 -0800 (PST)
From: Martin Jansa <martin.jansa@gmail.com>
X-Google-Original-From: Martin Jansa <Martin.Jansa@gmail.com>
Date: Tue, 1 Mar 2016 09:18:17 +0100
To: Chris Trobridge <christrobridge@hotmail.com>
Message-ID: <20160301081817.GA16002@jama>
References: <DUB130-W36E2C873DA9A2A4B6B6A73DABB0@phx.gbl>
MIME-Version: 1.0
In-Reply-To: <DUB130-W36E2C873DA9A2A4B6B6A73DABB0@phx.gbl>
User-Agent: Mutt/1.5.24 (2015-08-30)
Cc: "openembedded-core@lists.openembedded.org"
	<openembedded-core@lists.openembedded.org>
Subject: Re: [oe] [PATCH] gpsd: Fix build when static libs disabled
X-BeenThere: openembedded-core@lists.openembedded.org
X-Mailman-Version: 2.1.12
Precedence: list
List-Id: Patches and discussions about the oe-core layer
	<openembedded-core.lists.openembedded.org>
List-Unsubscribe: <http://lists.openembedded.org/mailman/options/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.openembedded.org/pipermail/openembedded-core/>
List-Post: <mailto:openembedded-core@lists.openembedded.org>
List-Help: <mailto:openembedded-core-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.openembedded.org/mailman/listinfo/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Tue, 01 Mar 2016 08:16:29 -0000
X-Groupsio-MsgNum: 78977
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="7AUc2qLy4jB3hD7Z"
Content-Disposition: inline

--7AUc2qLy4jB3hD7Z
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Tue, Mar 01, 2016 at 07:58:14AM +0000, Chris Trobridge wrote:
> http://lists.openembedded.org/pipermail/openembedded-devel/2016-February/=
106230.html
>=20
> > Fix this build error:
> >=A0SCons Error: no such option: --disable-static
> >=A0Signed-off-by: Maxin B. John <maxin.john at intel.com>
> >=A0---
> >=A0=A0meta-oe/recipes-navigation/gpsd/gpsd_3.14.bb | 1 +
> >=A0=A01 file changed, 1 insertion(+)
> >=A0diff --git a/meta-oe/recipes-navigation/gpsd/gpsd_3.14.bb b/meta-oe/r=
ecipes-navigation/gpsd/gpsd_3.14.bb
> >=A0index ff268b3..a300595 100644
> >=A0--- a/meta-oe/recipes-navigation/gpsd/gpsd_3.14.bb
> >=A0+++ b/meta-oe/recipes-navigation/gpsd/gpsd_3.14.bb
> >=A0@@ -47,6 +47,7 @@ EXTRA_OESCONS =3D " \
> >=A0=A0 =A0 =A0systemd=3D'${SYSTEMD_OESCONS}' \
> >=A0=A0 =A0 =A0${EXTRA_OECONF} \
> >=A0=A0"
> >=A0+DISABLE_STATIC =3D ""
> >=A0=A0& this cannot be used, because then chrpath is not found and only =
static lib is built
> >=A0=A0& target=3D${HOST_SYS}
> >=A0=A0
> >=A0--=A0
> >=A02.4.0
>=20
> While this fixes the build, is it just fixing the symptom?
>=20
> I have a patch that copies the fix in:
>=20
> http://lists.openembedded.org/pipermail/openembedded-devel/2016-February/=
106251.html
>=20
> That is: use=A0EXTRA_CONF_PACKAGECONFIG instead of EXTRA_OECONF, as menti=
oned the above diff.
>=20
> This prevents the option being pulled in in the first place, which ought =
to be a more general solution.

Both changes depend on RFC patch from me:
http://patchwork.openembedded.org/patch/116719/
which wasn't commented on yet or merged to at least master-next.

Regards,

--=20
Martin 'JaMa' Jansa     jabber: Martin.Jansa@gmail.com

--7AUc2qLy4jB3hD7Z
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: Digital signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v2

iEYEARECAAYFAlbVUEgACgkQN1Ujt2V2gBxshACghnphfIcZvqeDSD5S3mLgrcGb
x+oAnAtEzogHtkPu2vuCL8aHJk4mBmsq
=vBUD
-----END PGP SIGNATURE-----

--7AUc2qLy4jB3hD7Z--
