Received: from mail-pa0-f50.google.com ([209.85.220.50])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <martin.jansa@gmail.com>) id 1U0Dmz-0004cS-E3
	for openembedded-core@lists.openembedded.org;
	Tue, 29 Jan 2013 17:12:02 +0100
Received: by mail-pa0-f50.google.com with SMTP id hz10so472288pad.23
	for <openembedded-core@lists.openembedded.org>;
	Tue, 29 Jan 2013 07:56:20 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=x-received:date:from:to:cc:subject:message-id:references
	:mime-version:content-type:content-disposition:in-reply-to
	:user-agent; bh=CyF93a0tN7lQT2w315osQ2IUOtlRGhXFCSicKzxULlA=;
	b=CwKrqLyQ8sigJOLPxA2SHRsLiZNzIkRqUpSBm5ozhvGOGU7C6iu32wMdO4iQNwrxZg
	C4CfudmHHD3v9eYQi5gQClp1OkmEr5uj3/db6p/Isj57X2wxbdnpElHbYRV9y97ADTPR
	h7PIG5A+HjL3QOKNUe1L2fVMFQWXXcSwngvucNX5QG1ZwCAnTF2iLbdVkB1cCQJgLacQ
	Db+mS2/Wdma/tGXJKb1MliiizZs7LDML8mXaAcgARe1FDTIQq/sDUPwwXSg6KPKRBh/l
	ngF1JdDlMg96H7to24jFuwVeX2q7gTB6+SynN6DaTcujuGlXUh70sO50Ss57YsyNTb2z
	PtYw==
X-Received: by 10.68.228.74 with SMTP id sg10mr3503888pbc.162.1359474980713;
	Tue, 29 Jan 2013 07:56:20 -0800 (PST)
Received: from localhost (ip-62-24-80-7.net.upcbroadband.cz. [62.24.80.7])
	by mx.google.com with ESMTPS id v2sm9138271paz.36.2013.01.29.07.56.17
	(version=TLSv1.2 cipher=RC4-SHA bits=128/128);
	Tue, 29 Jan 2013 07:56:19 -0800 (PST)
Date: Tue, 29 Jan 2013 16:56:15 +0100
From: Martin Jansa <martin.jansa@gmail.com>
To: Radu Moisan <radu.moisan@intel.com>
Message-ID: <20130129155615.GP16904@jama.palm1.palmone.com>
References: <1359473084-592-1-git-send-email-radu.moisan@intel.com>
MIME-Version: 1.0
In-Reply-To: <1359473084-592-1-git-send-email-radu.moisan@intel.com>
User-Agent: Mutt/1.5.21 (2010-09-15)
Cc: openembedded-core@lists.openembedded.org
Subject: Re: [PATCH 0/2] Remove -systemd postfix
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
X-List-Received-Date: Tue, 29 Jan 2013 16:12:37 -0000
X-Groupsio-MsgNum: 34654
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="yFtM4vvgVM46ytb2"
Content-Disposition: inline

--yFtM4vvgVM46ytb2
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Tue, Jan 29, 2013 at 05:24:42PM +0200, Radu Moisan wrote:
>=20
> Radu Moisan (2):
>   systemd: Remove -systemd postfix
>   avahi: Remove -systemd postfix
>=20
>  meta/recipes-connectivity/avahi/avahi.inc |    8 ++++----
>  meta/recipes-core/systemd/systemd_196.bb  |    9 ++++-----
>  2 files changed, 8 insertions(+), 9 deletions(-)

No upgrade path for both.

Wasn't systemd already upgraded to 197 in master?

--=20
Martin 'JaMa' Jansa     jabber: Martin.Jansa@gmail.com

--yFtM4vvgVM46ytb2
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: Digital signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v2.0.19 (GNU/Linux)

iEYEARECAAYFAlEH8R8ACgkQN1Ujt2V2gBxUbQCeN9R0/5wWFhIbiQKsOosMlFId
ipUAn0Lo6uQduY0nBDMdUiCJGgsZkvnq
=TRxB
-----END PGP SIGNATURE-----

--yFtM4vvgVM46ytb2--
