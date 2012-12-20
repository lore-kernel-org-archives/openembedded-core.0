Received: from mail-da0-f41.google.com ([209.85.210.41])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <martin.jansa@gmail.com>) id 1Tldof-00066Q-7w
	for openembedded-core@lists.openembedded.org;
	Thu, 20 Dec 2012 11:57:29 +0100
Received: by mail-da0-f41.google.com with SMTP id e20so1459951dak.28
	for <openembedded-core@lists.openembedded.org>;
	Thu, 20 Dec 2012 02:42:44 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=x-received:date:from:to:cc:subject:message-id:references
	:mime-version:content-type:content-disposition:in-reply-to
	:user-agent; bh=IegoE/DGvp4u17XlCqha/NQ3s/vNZ7UhRJqfASViaKg=;
	b=SbtJyJfyFUcE78o+W2UjTb0cNLripmKYUUx8n2Ze+diWbKQ61cWZW5IFWMawiwWJQx
	I2fEZB1qh+wfY40WnDE8dRzepKaacZmtNG5VxHYH27YEmAd0crnGI9f5FUwrdOwo59yR
	pj34jbNaDc2RjdgHx0nkvXNkqNdG7lbYUdvtuwf4WK8IFGP/HTpgIqpKuhWxT1XiqP8J
	BSJ4aYhD3o39+2hdvHva49y7MhBsOI2Qqhjklni0l3ohRhMOUlVFPP9Nfsfs4MGDGlTt
	UjceaQyhCUlNIg7qCBFuWFSjuCWuzCEomITvESBlfIFrrOsd0wUPa1hlJwVdEoEh6JBY
	LiJA==
X-Received: by 10.68.233.201 with SMTP id ty9mr28757587pbc.14.1356000164119;
	Thu, 20 Dec 2012 02:42:44 -0800 (PST)
Received: from localhost (ip-62-24-80-7.net.upcbroadband.cz. [62.24.80.7])
	by mx.google.com with ESMTPS id uk9sm4838441pbc.63.2012.12.20.02.42.41
	(version=TLSv1/SSLv3 cipher=OTHER);
	Thu, 20 Dec 2012 02:42:43 -0800 (PST)
Date: Thu, 20 Dec 2012 11:42:41 +0100
From: Martin Jansa <martin.jansa@gmail.com>
To: Radu Moisan <radu.moisan@intel.com>
Message-ID: <20121220104241.GG14543@jama.palm1.palmone.com>
References: <50D1F76D.4070000@intel.com>
MIME-Version: 1.0
In-Reply-To: <50D1F76D.4070000@intel.com>
User-Agent: Mutt/1.5.21 (2010-09-15)
Cc: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Subject: Re: RFC: systemd integration
X-BeenThere: openembedded-core@lists.openembedded.org
X-Mailman-Version: 2.1.11
Precedence: list
List-Id: Patches and discussions about the oe-core layer
	<openembedded-core.lists.openembedded.org>
List-Unsubscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/options/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.linuxtogo.org/pipermail/openembedded-core>
List-Post: <mailto:openembedded-core@lists.openembedded.org>
List-Help: <mailto:openembedded-core-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Thu, 20 Dec 2012 10:57:29 -0000
X-Groupsio-MsgNum: 32923
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="V32M1hWVjliPHW+c"
Content-Disposition: inline

--V32M1hWVjliPHW+c
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Wed, Dec 19, 2012 at 07:20:45PM +0200, Radu Moisan wrote:
> Hi guys,
>      I have prepared a branch on poky-contrib (rmoisan/systemd) where I=
=20
> pulled systemd from meta-openembedded. The goal is to merge this into=20
> oe-core, so please take a look and give me your feedback on stuff that=20
> needs work or things that I might have done wrong, so that I can prepare=
=20
> it for merge.
>      At this point core-image-minimal and core-image-sato both boot fine=
=20
> with systemd. There still are a few warnings but not critical(at=20
> runtime), at least in my opinion, you may want to take a look at those to=
o.
>      You can activate systemd by *DISTRO_FEATURES_INITMAN =3D "systemd"*

What about upgrade path from meta-systemd?

I've noticed that
http://git.yoctoproject.org/cgit/cgit.cgi/poky-contrib/commit/meta/recipes-=
connectivity/wpa-supplicant?h=3Drmoisan/systemd&id=3D02f4027f7ccddaff3b0316=
962e7a86a04d31abbc
does not increment PR at all while
http://git.openembedded.org/meta-openembedded/tree/meta-systemd/oe-core/rec=
ipes-connectivity/wpa-supplicant/wpa-supplicant_1.0.bbappend
PRINC :=3D "${@int(PRINC) + 2}"

Also I like this commit very much
http://git.yoctoproject.org/cgit/cgit.cgi/poky-contrib/commit/meta/recipes-=
connectivity/wpa-supplicant?h=3Drmoisan/systemd&id=3D216049b154799fc7984c54=
858a386d7318f99ce0
but current styleguide thinks something else about consistent whitespace
usage. So I think this wont be accepted as my change to styleguide
wasn't.

And last thing:
there is few pending patches for meta-systemd:
http://patchwork.openembedded.org/project/oe/list/?q=3Dsystemd
Can you check them and merge them if needed? Or will you update your
systemd* copies if we merge them in meta-oe?

Cheers,

--=20
Martin 'JaMa' Jansa     jabber: Martin.Jansa@gmail.com

--V32M1hWVjliPHW+c
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: Digital signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v2.0.19 (GNU/Linux)

iEYEARECAAYFAlDS66EACgkQN1Ujt2V2gBwnqgCfXiqFTqeq/KbypJm9r2XtVoUk
byMAoIqjeii3kpy3pqMX5zvZ/ZIbKizO
=nDb/
-----END PGP SIGNATURE-----

--V32M1hWVjliPHW+c--
