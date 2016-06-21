Return-Path: <martin.jansa@gmail.com>
Received: from mail-lb0-f172.google.com (mail-lb0-f172.google.com
	[209.85.217.172])
	by mail.openembedded.org (Postfix) with ESMTP id D32FC6FFA4
	for <openembedded-core@lists.openembedded.org>;
	Tue, 21 Jun 2016 14:40:17 +0000 (UTC)
Received: by mail-lb0-f172.google.com with SMTP id ak10so12471476lbc.3
	for <openembedded-core@lists.openembedded.org>;
	Tue, 21 Jun 2016 07:40:18 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=from:date:to:cc:subject:message-id:references:mime-version
	:content-disposition:in-reply-to:user-agent;
	bh=GtY1SJgNZOKTH4c9rX8cuWc3aFgmGFrzYgOjhNeLJ6A=;
	b=TbQ+Flctxiugov/xQCqlqsD0T/a4SlWYk0VRepLyNDAzLGbMKbfjGHQTfnTFf/YF86
	9SuaUyDFZeQwRI28ngerf2ifyQ7AMXkGNkzANgiH3tXzcCt4zVm/43KhsNDWOVNZZU/4
	CvEfVIdNbhhCAzyp2TAC4o9D1+0G4SvffjLbGfFJYQtMlzEQ764kHIBO65d1u7YIScc0
	dwszV/v4kKC9OI3WqgEQNpk6P65rGFWtHWgxmlF2HfKG/7HQ04/CiEbfYZl3pMNVhyAP
	oGyyES2J4qqMUZgyThBGoNpt3bizQ7hAkJMj5v/xKMQaixfbbKUU92wqrnAgxCN8z0GE
	+S0Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:from:date:to:cc:subject:message-id:references
	:mime-version:content-disposition:in-reply-to:user-agent;
	bh=GtY1SJgNZOKTH4c9rX8cuWc3aFgmGFrzYgOjhNeLJ6A=;
	b=SnJfvk9prPyWu5/JekQmbr+qYm03hYbZ52lrCowd0WTrAdUGSNFXkTGZGrQxOasJA3
	msvLEeI1FP2zAz2odNOBUbMojnF+O4aaZNhTF9AIBI7veTddLEqz1k++PzoLOyRrXCaN
	HbpJIME85i6hoe+OIeEqbdEnUjxQbcUtfRkEw8aWPHWwBJYdpyRuTT9zYCO7+yYCEKLe
	ERbwi6UqvBa44VCEP7GIqHblOH0v2c+Ln3bdQaz8SyWefQPYiynBhWbWl1EvFe0QmtE5
	LLX4H+6xZWg6Sl/HaGlzs8j5b7gFkIWvVP3KjJgPHkxwUgKw91LBVdZ3gupmbvU5Oe5B
	Rn+A==
X-Gm-Message-State: ALyK8tJiX5ED1IvA4BlKxST/c71YQVKvIh+KBtMcNx5YSY+nqzdJ88lPElLsKnLJT+XLpg==
X-Received: by 10.194.191.135 with SMTP id gy7mr19972962wjc.125.1466520017386; 
	Tue, 21 Jun 2016 07:40:17 -0700 (PDT)
Received: from localhost (ip-89-176-104-169.net.upcbroadband.cz.
	[89.176.104.169]) by smtp.gmail.com with ESMTPSA id
	p9sm69248992wjv.21.2016.06.21.07.40.15
	(version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
	Tue, 21 Jun 2016 07:40:16 -0700 (PDT)
From: Martin Jansa <martin.jansa@gmail.com>
X-Google-Original-From: Martin Jansa <Martin.Jansa@gmail.com>
Date: Tue, 21 Jun 2016 16:40:29 +0200
To: Pascal Bach <pascal.bach@siemens.com>
Message-ID: <20160621144029.GA14456@jama>
References: <fdf902fc-2f74-e750-7215-bd939cac4518@siemens.com>
MIME-Version: 1.0
In-Reply-To: <fdf902fc-2f74-e750-7215-bd939cac4518@siemens.com>
User-Agent: Mutt/1.6.1 (2016-04-27)
Cc: openembedded-core@lists.openembedded.org
Subject: Re: rebuilding external kernel modules when kernel changed
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
X-List-Received-Date: Tue, 21 Jun 2016 14:40:18 -0000
X-Groupsio-MsgNum: 83681
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="T4sUOijqQbZv57TR"
Content-Disposition: inline

--T4sUOijqQbZv57TR
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Tue, Jun 21, 2016 at 04:36:32PM +0200, Pascal Bach wrote:
> Hello
>=20
> I ran into an issue when working with kernel modules that are not part of=
 the kernel source tree.
>=20
> The issue manifests itself as follows:
>=20
> 1. Build an image containing virtual/kernel and kernel-module-a
>=20
> 2. Do a `bitbake virtual/kernel -c clean`
>=20
> 3. Rebuild the above image again. This causes the kernel do rebuild and i=
t seems that the do_compile task of kernel-module-a is also re-exectued.
> But this causes an error as there is some configuration missing in the ke=
rnel source directory that is created by module.bbclass:do_make_scripts.
> I think that the issue is that the do_make_scripts task is not re-execute=
d prior to the modules do_compile task.
>=20
>=20
> I tried to teach bitbake to execute do_make_scripts too once the kernel w=
as rebuilt, but I didn't find a way.
>=20
> Any hints how this can be done?

What version are you using?

Are you using rm_work?

Check https://bugzilla.yoctoproject.org/show_bug.cgi?id=3D9352=20
>=20
> Regards
> Pascal
>=20
> --=20
> _______________________________________________
> Openembedded-core mailing list
> Openembedded-core@lists.openembedded.org
> http://lists.openembedded.org/mailman/listinfo/openembedded-core

--=20
Martin 'JaMa' Jansa     jabber: Martin.Jansa@gmail.com

--T4sUOijqQbZv57TR
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: Digital signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v2

iEYEARECAAYFAldpUcgACgkQN1Ujt2V2gBwixQCgtg1G+uNYFBBIEGG8bW0KTuto
aoEAniGE/LewhflxMECB2522gNnaBpKx
=0Kxe
-----END PGP SIGNATURE-----

--T4sUOijqQbZv57TR--
