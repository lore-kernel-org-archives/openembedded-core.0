Received: from mail-ee0-f46.google.com ([74.125.83.46])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <martin.jansa@gmail.com>) id 1TktJe-000727-BW
	for openembedded-core@lists.openembedded.org;
	Tue, 18 Dec 2012 10:18:24 +0100
Received: by mail-ee0-f46.google.com with SMTP id e53so160468eek.19
	for <openembedded-core@lists.openembedded.org>;
	Tue, 18 Dec 2012 01:03:40 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=x-received:date:from:to:cc:subject:message-id:references
	:mime-version:content-type:content-disposition:in-reply-to
	:user-agent; bh=SI9hnu06IIm7T+gv7zdwIjyE58DwP/2T3eJU25jEkNU=;
	b=KbN3ztYyd+QpGvF25a6fBGYh3I3LW0LQbQACx4Tc6qUryS6GKzfGcC7a6Mo/ZoAMuq
	IZP0GT5qtHm5mJkS+tiLRKmjQEfjCDC/kwxJNJj/bQlFiCo08q5mCu8nnnPcNnVE09hS
	C6M12j24lUofrpOH2vHwTnuwcopOqXhqPNhYXHZ4un3/LOyeo5RIKAWALCfWKuuuE4w0
	Ic9WuZZkpC9C+f2vPi5LQvP3DbimwBbspchinzcxYdtd1QieFBAInMy8t3xe6CS76696
	0e5SNR+uownPuzNglObyLqizXQrYC8x8LHavbx3MbUKHaSfZEjVDeOk4ZVo+IYj7ll/G
	q4yQ==
X-Received: by 10.14.2.66 with SMTP id 42mr3988790eee.7.1355821420792;
	Tue, 18 Dec 2012 01:03:40 -0800 (PST)
Received: from localhost (ip-62-24-80-7.net.upcbroadband.cz. [62.24.80.7])
	by mx.google.com with ESMTPS id 44sm2053969eek.0.2012.12.18.01.03.39
	(version=TLSv1/SSLv3 cipher=OTHER);
	Tue, 18 Dec 2012 01:03:40 -0800 (PST)
Date: Tue, 18 Dec 2012 10:03:39 +0100
From: Martin Jansa <martin.jansa@gmail.com>
To: Ciprian Ciubotariu <cheepeero@gmx.net>
Message-ID: <20121218090339.GA3331@jama.palm1.palmone.com>
References: <20121215065958.GA3113@jama.jama.net>
	<1355814255-1946-1-git-send-email-cheepeero@gmx.net>
MIME-Version: 1.0
In-Reply-To: <1355814255-1946-1-git-send-email-cheepeero@gmx.net>
User-Agent: Mutt/1.5.21 (2010-09-15)
Cc: openembedded-core@lists.openembedded.org
Subject: Re: packagegroup-base notes
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
X-List-Received-Date: Tue, 18 Dec 2012 09:18:26 -0000
X-Groupsio-MsgNum: 32814
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="4Ckj6UjgE2iN1+kY"
Content-Disposition: inline

--4Ckj6UjgE2iN1+kY
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Tue, Dec 18, 2012 at 09:04:14AM +0200, Ciprian Ciubotariu wrote:
> Please note that packagegroup-base also contains references to VIRTUAL-RU=
NTIME_apm and VIRTUAL-RUNTIME_alsa-state, which are not defined within the =
same recipe (I did a search to find a good place to add my own weak definit=
ion for keymaps).

Those 2 have default values set in
meta/conf/distro/include/default-providers.inc
VIRTUAL-RUNTIME_keymaps has not.

Cheers,

--=20
Martin 'JaMa' Jansa     jabber: Martin.Jansa@gmail.com

--4Ckj6UjgE2iN1+kY
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: Digital signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v2.0.19 (GNU/Linux)

iEYEARECAAYFAlDQMWsACgkQN1Ujt2V2gBxMhQCeOqifUyOSdLYuSy3sHawouQbE
78MAoIk7GXn0EcWVf46aB0qqR/VrHkD9
=BcK6
-----END PGP SIGNATURE-----

--4Ckj6UjgE2iN1+kY--
