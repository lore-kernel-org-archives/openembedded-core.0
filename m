Received: from mail-wi0-f171.google.com ([209.85.212.171])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <martin.jansa@gmail.com>) id 1SRJUX-0002Kt-U7
	for openembedded-core@lists.openembedded.org;
	Mon, 07 May 2012 10:40:25 +0200
Received: by wibhj13 with SMTP id hj13so2727022wib.6
	for <openembedded-core@lists.openembedded.org>;
	Mon, 07 May 2012 01:30:36 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=date:from:to:subject:message-id:mime-version:content-type
	:content-disposition:user-agent;
	bh=Ckd6HTVu0QmeEKA5vx7zIAwRKOHqjLAisOGsm/MduRg=;
	b=n0CiME0vIkKr7gQb1hJScfYsBEBYlvyLTkSeSb65OmXMFoaVoyRxTIChNa7MiFH+cA
	67tOIiihYwbGyjecQKSNuq35Yx/VidX52S3SrE3pn2+GxvainV5YRzfHiKLmVZ+tJip/
	Wub6aafDnXcSyNKuxNi7+S0PQqWITTZNXyODo7kE+f9jEMJM1funPQOe/t59QWaRDwoS
	PIeOdbT50Be5V8zMNbo7SbiTHj1LVOYwtt15pvhkEC3zHPOiVo7BNsyltbwyYIlaQh1S
	pqZK+8og9IAcBCMeflNcDGinb8WgXAZp8pkzo2FIsl/SfMkM5gCfF3tCIh3PU734zlHR
	EiCA==
Received: by 10.216.143.146 with SMTP id l18mr9072347wej.56.1336379435784;
	Mon, 07 May 2012 01:30:35 -0700 (PDT)
Received: from localhost ([94.230.152.246])
	by mx.google.com with ESMTPS id bn9sm3241534wib.5.2012.05.07.01.30.34
	(version=TLSv1/SSLv3 cipher=OTHER);
	Mon, 07 May 2012 01:30:34 -0700 (PDT)
Date: Mon, 7 May 2012 10:30:33 +0200
From: Martin Jansa <martin.jansa@gmail.com>
To: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Message-ID: <20120507083033.GA3184@jama.jama.net>
MIME-Version: 1.0
User-Agent: Mutt/1.5.21 (2010-09-15)
Subject: dropping libgdbus from oe-core
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
X-List-Received-Date: Mon, 07 May 2012 08:40:26 -0000
X-Groupsio-MsgNum: 21763
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="k+w/mQv8wyuph6w0"
Content-Disposition: inline

--k+w/mQv8wyuph6w0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

Nothing in oe-core depends on it and gdbus was merged to glib in 2010 so
nothing new will probably depend on it

Cheers,

--=20
Martin 'JaMa' Jansa     jabber: Martin.Jansa@gmail.com

--k+w/mQv8wyuph6w0
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: Digital signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v2.0.19 (GNU/Linux)

iEYEARECAAYFAk+niCkACgkQN1Ujt2V2gBwUzgCcDEg5q8ieKvZvpDpMmWDPGFiR
dj0An0Yf8raIa2Ig0NT+J2e2qwWg4CI6
=/BmJ
-----END PGP SIGNATURE-----

--k+w/mQv8wyuph6w0--
