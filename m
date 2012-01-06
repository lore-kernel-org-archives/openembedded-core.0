Received: from mail-ee0-f47.google.com ([74.125.83.47])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <martin.jansa@gmail.com>) id 1Rj6rK-0004MO-Uj
	for openembedded-core@lists.openembedded.org;
	Fri, 06 Jan 2012 11:17:16 +0100
Received: by eeit10 with SMTP id t10so829920eei.6
	for <openembedded-core@lists.openembedded.org>;
	Fri, 06 Jan 2012 02:09:47 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=date:from:to:subject:message-id:mime-version:content-type
	:content-disposition:user-agent;
	bh=DM2+/FARadMjjpUr1XoU8hhw18epU2j9jOZoGTb9xBY=;
	b=XhZh3fzzDhvv8KN2FQdvlHCeGVrOLyMShTrQqOrpuNFL1Eopy3Yu7xwsNmmBt3G1By
	wvNsFBg633TQjCAYHCvAD0uKbj+XIiEge9A2pVcwsbcx+IYk0EEkMeSLCVzdxWcyIJzL
	4cwneYW4EtrNrXwiOl3bnzTZvbvJk4+FszONA=
Received: by 10.213.17.210 with SMTP id t18mr1145155eba.7.1325844587767;
	Fri, 06 Jan 2012 02:09:47 -0800 (PST)
Received: from localhost ([94.230.152.246])
	by mx.google.com with ESMTPS id u53sm197707928eeu.6.2012.01.06.02.09.46
	(version=TLSv1/SSLv3 cipher=OTHER);
	Fri, 06 Jan 2012 02:09:46 -0800 (PST)
Date: Fri, 6 Jan 2012 11:09:34 +0100
From: Martin Jansa <martin.jansa@gmail.com>
To: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Message-ID: <20120106100934.GA3879@jama.jama.net>
MIME-Version: 1.0
User-Agent: Mutt/1.5.21 (2010-09-15)
Subject: Re: libs transition /usr/lib -> /lib questions
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
X-List-Received-Date: Fri, 06 Jan 2012 10:17:16 -0000
X-Groupsio-MsgNum: 15512
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="IJpNTDwzlM2Ie8A6"
Content-Disposition: inline

--IJpNTDwzlM2Ie8A6
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

FWIW today I've noticed that systemd is going other way around
http://www.freedesktop.org/wiki/Software/systemd/separate-usr-is-broken

--IJpNTDwzlM2Ie8A6
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: Digital signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v2.0.18 (GNU/Linux)

iEYEARECAAYFAk8GyF4ACgkQN1Ujt2V2gByadQCeMxw/FWx2TActRb+yGMPn7RIt
DRsAoLpWgan/GLyiUFd5XYFoptPHjenX
=XD6U
-----END PGP SIGNATURE-----

--IJpNTDwzlM2Ie8A6--
