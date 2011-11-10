Received: from mail.gw90.de ([188.40.100.199])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <paulepanter@users.sourceforge.net>)
	id 1ROcii-0003cM-EC for openembedded-core@lists.openembedded.org;
	Thu, 10 Nov 2011 23:03:40 +0100
Received: from g225081174.adsl.alicedsl.de ([92.225.81.174]
	helo=[192.168.178.21])
	by mail.gw90.de with esmtpsa (TLS1.0:RSA_AES_256_CBC_SHA1:32)
	(Exim 4.69) (envelope-from <paulepanter@users.sourceforge.net>)
	id 1ROcco-0003o2-1t for openembedded-core@lists.openembedded.org;
	Thu, 10 Nov 2011 21:57:34 +0000
Message-ID: <1320962244.21414.5.camel@mattotaupa>
From: Paul Menzel <paulepanter@users.sourceforge.net>
To: openembedded-core@lists.openembedded.org
Date: Thu, 10 Nov 2011 22:57:24 +0100
In-Reply-To: <970a806acfb6964c839411164ba0d2613417393a.1320961001.git.otavio@ossystems.com.br>
References: <cover.1320961001.git.otavio@ossystems.com.br>
	<970a806acfb6964c839411164ba0d2613417393a.1320961001.git.otavio@ossystems.com.br>
X-Mailer: Evolution 3.0.3-2 
Mime-Version: 1.0
Subject: Re: [PATCH 2/3] util-linux: split mcookie onto a package
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
X-List-Received-Date: Thu, 10 Nov 2011 22:03:40 -0000
X-Groupsio-MsgNum: 12332
Content-Type: multipart/signed; micalg="pgp-sha1";
	protocol="application/pgp-signature"; 
	boundary="=-9MvvBpW9O9RIrEToCcBI"

--=-9MvvBpW9O9RIrEToCcBI
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Am Donnerstag, den 10.11.2011, 21:37 +0000 schrieb Otavio Salvador:

Sau!, if you take this patch, please correct *i*nto in the commit
summary and add

`mcookie` is needed by `startx` and according to the manual page also by
`xauth` [1].

[1] http://linux.die.net/man/1/mcookie

as the commit message.

> Signed-off-by: Otavio Salvador <otavio@ossystems.com.br>

[=E2=80=A6]

Reviewed-by: Paul Menzel <paulepanter@users.sourceforge.net>


Thanks,

Paul

--=-9MvvBpW9O9RIrEToCcBI
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: This is a digitally signed message part
Content-Transfer-Encoding: 7bit

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.4.11 (GNU/Linux)

iEYEABECAAYFAk68SMQACgkQPX1aK2wOHVi7SwCdHvKLHnV/eiB8XBgoUDs1dgCm
e/4AoIUpbqicioMTZbuwW+tZBz4XB+pd
=81pT
-----END PGP SIGNATURE-----

--=-9MvvBpW9O9RIrEToCcBI--
