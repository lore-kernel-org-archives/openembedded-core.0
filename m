Return-Path: <martin.jansa@gmail.com>
Received: from mail-wm0-f67.google.com (mail-wm0-f67.google.com [74.125.82.67])
	by mail.openembedded.org (Postfix) with ESMTP id CB80D770AB
	for <openembedded-core@lists.openembedded.org>;
	Thu,  3 Mar 2016 13:16:21 +0000 (UTC)
Received: by mail-wm0-f67.google.com with SMTP id l68so4005096wml.3
	for <openembedded-core@lists.openembedded.org>;
	Thu, 03 Mar 2016 05:16:23 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=from:date:to:cc:subject:message-id:references:mime-version
	:content-disposition:in-reply-to:user-agent;
	bh=7gF05sQaY6Teu4vNBgmuv6B9tPIgRZIOgSWXOhBr1Ik=;
	b=PPtXCoBvV+hFXSFSpAO5H/jvhW/YGQRh1UBvAxwl8oMBKBBlAhF/lsNK6Z4VQ0y2N6
	pxTAJs5+0+vJw58vetobnzqqleN/VNaabhNS35dTJRHZBmhmgFkg4a1/Di+tzr6MRulW
	vmU2qGMEkPiD33ApGiSsgJdMBHGbXUatAwYia0vU3FUcUf7uwjFFP1LF5vzN8AxBww5i
	Ap9MGadIeG2QbIkH4Ha+YmWWFnqvu4j8UJl7/pB0nMRZ5+TLTVDxtXWkjProa3FtlE2l
	SzBxF6q8i3Qwbc23yZlh0+mOsB9TByVkXusl27raBdpVtBrkiUfdakBzRpjaA0eYCIn3
	QFtQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:from:date:to:cc:subject:message-id:references
	:mime-version:content-disposition:in-reply-to:user-agent;
	bh=7gF05sQaY6Teu4vNBgmuv6B9tPIgRZIOgSWXOhBr1Ik=;
	b=Lk5y91oG28/a8vNsOBJp4SuAOiVdlgxHpf9M+XyxoFtR5A2OVbj1ZJcVbpZ3poK5Sp
	i7PaZQKO5bB7einm+eXjA7jFuNdVoNDj0TQyePTfEilnxzHpFT+lsDpIRrovNd7FzWfK
	qkqGZl6pDwzK3goQsas4dXsF2wGfKbnc9FV5vQjjCr2Z47Ffi3J0uwKEmV2CUepCYp56
	VhtM+ClOosyQCH8Y3zMIkOdM9oO+JHYdTNGs3lIxy7lbpswsLrGpkR8nPqvYKq2PMSMz
	PbjM7F3qnqWbOxQ2lWKCJJ6ZB8M5IIuiPdppgFB/DpM8tdC6YIUyZFRtVVpDDJMqHe15
	iTSg==
X-Gm-Message-State: AD7BkJJNNhwC5erEbnBxfPg2MO41VLtXzfJVEKgcmky9eWVFwZBhiQv+W0tyzR+A/2qtYA==
X-Received: by 10.194.23.37 with SMTP id j5mr2837643wjf.171.1457010982470;
	Thu, 03 Mar 2016 05:16:22 -0800 (PST)
Received: from localhost (ip-86-49-34-37.net.upcbroadband.cz. [86.49.34.37])
	by smtp.gmail.com with ESMTPSA id 202sm8973885wmo.7.2016.03.03.05.16.21
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Thu, 03 Mar 2016 05:16:21 -0800 (PST)
From: Martin Jansa <martin.jansa@gmail.com>
X-Google-Original-From: Martin Jansa <Martin.Jansa@gmail.com>
Date: Thu, 3 Mar 2016 14:18:26 +0100
To: Phil Blundell <pb@pbcl.net>
Message-ID: <20160303131826.GE2569@jama>
References: <1453937316-1311-1-git-send-email-armccurdy@gmail.com>
	<1453937316-1311-4-git-send-email-armccurdy@gmail.com>
	<1457010155.3476.31.camel@pbcl.net>
MIME-Version: 1.0
In-Reply-To: <1457010155.3476.31.camel@pbcl.net>
User-Agent: Mutt/1.5.24 (2015-08-30)
Cc: openembedded-core@lists.openembedded.org
Subject: Re: [PATCH 3/3] glib.inc: limit ARM_INSTRUCTION_SET over-rides to armv4/armv5
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
X-List-Received-Date: Thu, 03 Mar 2016 13:16:24 -0000
X-Groupsio-MsgNum: 79069
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="cYtjc4pxslFTELvY"
Content-Disposition: inline

--cYtjc4pxslFTELvY
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Thu, Mar 03, 2016 at 01:02:35PM +0000, Phil Blundell wrote:
> On Wed, 2016-01-27 at 15:28 -0800, Andre McCurdy wrote:
> > -ARM_INSTRUCTION_SET =3D "arm"
> > +ARM_INSTRUCTION_SET_armv4 =3D "arm"
> > +ARM_INSTRUCTION_SET_armv5 =3D "arm"
>=20
> Although I agree that this is a net improvement over the old code in
> almost all cases, this patch is not quite right. =A0The reason for the
> original override is that there is assembler code in glib which won't
> compile as Thumb-1 (but is ok in Thumb-2). =A0Thumb-2 is only available
> in ARMv6T2 and newer architectures so with your patch it looks like
> compilation on arm1136jf-s (which is ARMv6 not ARMv6T2) would now fail.

If the MACHINE doesn't have thumb in TUNE_FEATURES (for selected
DEFAULTTUNE) won't use -mthumb, so building on ARMv6 shouldn't fail
or I didn't get your point.

> I recommend that we either:
>=20
> 1. Introduce a new, explicit "thumb1" override which can be enabled by
> the appropriate arch-arm*.inc files, and make all the appropriate
> recipes set ARM_INSTRUCTION_SET based on that; or
>=20
> 2. Introduce a new thumb1-compatible.inc file which contains lines like
>=20
> ARM_INSTRUCTION_SET_glib-2.0 =3D "arm"
>=20
> and let distros which want to support older ARMs and enable Thumb
> include that file; or
>=20
> 3. Take the view that it's now nearly fifteen years since Thumb-2 was
> introduced, OE-core no longer needs to pander explicitly to Thumb-1,
> and we should just remove all this scar tissue entirely. =A0Distros that
> do want to target Thumb-1 can still maintain the appropriate
> compatibility stuff (which is probably only a dozen lines or so) for
> themselves.

Except that oe-core still contains qemuarm which is armv5t and almost=20
nobody is building it with thumb enabled in DISTRO config. I'm regularly
asking it to be enabled on autobuilder, but without luck:
https://bugzilla.yoctoproject.org/show_bug.cgi?id=3D7717

> Personally I would favour #3. :-)
>=20
> p.
>=20
> --=20
> _______________________________________________
> Openembedded-core mailing list
> Openembedded-core@lists.openembedded.org
> http://lists.openembedded.org/mailman/listinfo/openembedded-core

--=20
Martin 'JaMa' Jansa     jabber: Martin.Jansa@gmail.com

--cYtjc4pxslFTELvY
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: Digital signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v2

iEYEARECAAYFAlbYOaEACgkQN1Ujt2V2gBwqTACfdNss7fdAwSIDaKye+bA+khK1
aK0An06XFMKSCbEJvpRmGaOYqaFSauLv
=51bq
-----END PGP SIGNATURE-----

--cYtjc4pxslFTELvY--
