Received: from mail-fx0-f47.google.com ([209.85.161.47])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <martin.jansa@gmail.com>) id 1QrmGF-0004FU-B4
	for openembedded-core@lists.openembedded.org;
	Fri, 12 Aug 2011 09:34:31 +0200
Received: by fxg11 with SMTP id 11so2396922fxg.6
	for <openembedded-core@lists.openembedded.org>;
	Fri, 12 Aug 2011 00:29:59 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=date:from:to:cc:subject:message-id:references:mime-version
	:content-type:content-disposition:in-reply-to:user-agent;
	bh=LHuzPqKuR1r2qV+J9i1T9zqHac9eQWSl+WOuEE4YcsM=;
	b=UEYy6+TEnxAJLc7h/zHW/gi9suWEXl7cG22sw4jC7Mry8rJ5OdOPBpgh7wmkzoqaiT
	i+Vi5mn8SzQiQho29sRcN2T7rKX4dVXBQxp3oXKjOS17PpUx5g6C5sDcZd2rc2HDWqEE
	XdMbCAeDPPfMuRw0y28Cz5cdTYDV0K9ij1W1o=
Received: by 10.223.85.145 with SMTP id o17mr874620fal.16.1313134199054;
	Fri, 12 Aug 2011 00:29:59 -0700 (PDT)
Received: from localhost ([94.230.152.246])
	by mx.google.com with ESMTPS id b14sm2189514fab.43.2011.08.12.00.29.57
	(version=TLSv1/SSLv3 cipher=OTHER);
	Fri, 12 Aug 2011 00:29:57 -0700 (PDT)
Date: Fri, 12 Aug 2011 09:29:50 +0200
From: Martin Jansa <martin.jansa@gmail.com>
To: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Message-ID: <20110812072950.GH2214@jama.jama.net>
References: <1313078412-6872-1-git-send-email-noor_ahsan@mentor.com>
	<1313078529.6733.138.camel@phil-desktop>
	<4E443ADB.7010103@linux.intel.com>
	<989A078976CDAD4CB2DC976EEF70E2A5068A4EA5@eu2-mail.mgc.mentorg.com>
MIME-Version: 1.0
In-Reply-To: <989A078976CDAD4CB2DC976EEF70E2A5068A4EA5@eu2-mail.mgc.mentorg.com>
User-Agent: Mutt/1.5.21 (2010-09-15)
Subject: Re: [PATCH] bluez4: Added new recipe version 4.96
X-BeenThere: openembedded-core@lists.openembedded.org
X-Mailman-Version: 2.1.11
Precedence: list
Reply-To: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
List-Id: Patches and discussions about the oe-core layer
	<openembedded-core.lists.openembedded.org>
List-Unsubscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/options/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.linuxtogo.org/pipermail/openembedded-core>
List-Post: <mailto:openembedded-core@lists.openembedded.org>
List-Help: <mailto:openembedded-core-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Fri, 12 Aug 2011 07:34:31 -0000
X-Groupsio-MsgNum: 8055
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="N8ia4yKhAKKETby7"
Content-Disposition: inline

--N8ia4yKhAKKETby7
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Fri, Aug 12, 2011 at 09:18:29AM +0200, Ahsan, Noor wrote:
> Hi,
>=20
> I noticed that meta-oe version of bluez was using Bluetooth.conf file fro=
m 4.82's directory=20
>=20
> FILESPATH =3D. "${COREBASE}/meta/recipes-connectivity/bluez/bluez4-4.82/:"
>=20
> and meta-oe bluez 4.95 version recipe did not have Bluetooth.conf file in=
 its dir. So that is why I did not touch that recipe otherwise meta-oe reci=
pe will start complaining.

I think that's expected with layers.. and someone will update it in
meta-oe as soon as it starts complaining..

otherwise you cannot upgrade any recipe where we have .bbappend for it
in meta-oe

Regards,

--=20
Martin 'JaMa' Jansa     jabber: Martin.Jansa@gmail.com

--N8ia4yKhAKKETby7
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: Digital signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v2.0.18 (GNU/Linux)

iEYEARECAAYFAk5E1m4ACgkQN1Ujt2V2gBx10gCguG2RFS249USA+rzSm35Lt6Wu
PcQAmgLsAaMl7hpmns65zxJOTXPVHm7m
=bIA2
-----END PGP SIGNATURE-----

--N8ia4yKhAKKETby7--
