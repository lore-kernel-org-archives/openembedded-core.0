Received: from mail.gw90.de ([188.40.100.199])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <paulepanter@users.sourceforge.net>)
	id 1ROdsK-00064r-TP for openembedded-core@lists.openembedded.org;
	Fri, 11 Nov 2011 00:17:40 +0100
Received: from g225081174.adsl.alicedsl.de ([92.225.81.174]
	helo=[192.168.178.21])
	by mail.gw90.de with esmtpsa (TLS1.0:RSA_AES_256_CBC_SHA1:32)
	(Exim 4.69) (envelope-from <paulepanter@users.sourceforge.net>)
	id 1ROdmQ-0003yd-TE for openembedded-core@lists.openembedded.org;
	Thu, 10 Nov 2011 23:11:35 +0000
Message-ID: <1320966685.21414.12.camel@mattotaupa>
From: Paul Menzel <paulepanter@users.sourceforge.net>
To: openembedded-core@lists.openembedded.org
Date: Fri, 11 Nov 2011 00:11:25 +0100
In-Reply-To: <d2cc2964dc67b5d428e53f6580b282ded72cc701.1320961001.git.otavio@ossystems.com.br>
References: <cover.1320961001.git.otavio@ossystems.com.br>
	<d2cc2964dc67b5d428e53f6580b282ded72cc701.1320961001.git.otavio@ossystems.com.br>
X-Mailer: Evolution 3.0.3-2 
Mime-Version: 1.0
Subject: Re: [PATCH 3/3] xinit: rdepends on util-linux-mcookie to avoid brining whole util-linux
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
X-List-Received-Date: Thu, 10 Nov 2011 23:17:41 -0000
X-Groupsio-MsgNum: 12334
Content-Type: multipart/signed; micalg="pgp-sha1";
	protocol="application/pgp-signature"; 
	boundary="=-Q6M6zR2+Fz1RQhVcx0np"

--=-Q6M6zR2+Fz1RQhVcx0np
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Am Donnerstag, den 10.11.2011, 21:37 +0000 schrieb Otavio Salvador:

s/brining/bringing in/

Commit message body:

With=20

        commit 1053a6a8e15851ef139d8aa4683849fc2fc277e1
        Author: Paul Menzel <paulepanter@users.sourceforge.net>
        Date:   Tue Nov 8 13:00:32 2011 +0100
       =20
            xinit: Fix `startx` looking for `mcookie` in sysroot

`util-linux` was added as a run time dependency because it includes
`/usr/bin/mcookie` needed for `startx`. This dragged in 10 packages to
images using `startx`. Packaging `mcookie` separately in the previous
patch and only run time depending on `util-linux-mcookie` solves this
problem.

> Signed-off-by: Otavio Salvador <otavio@ossystems.com.br>
Reviewed-by: Paul Menzel <paulepanter@users.sourceforge.net>

> ---
>  meta/recipes-graphics/xorg-app/xinit_1.3.0.bb |    4 ++--
>  1 files changed, 2 insertions(+), 2 deletions(-)

[=E2=80=A6]


Thanks,

Paul

--=-Q6M6zR2+Fz1RQhVcx0np
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: This is a digitally signed message part
Content-Transfer-Encoding: 7bit

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.4.11 (GNU/Linux)

iEYEABECAAYFAk68Wh0ACgkQPX1aK2wOHVjqMgCfX7A8OVTB1niwb9bOxUaBMspt
v0MAnjyQuAk6KExEVch+NCYTxvpYcGio
=FJMy
-----END PGP SIGNATURE-----

--=-Q6M6zR2+Fz1RQhVcx0np--
