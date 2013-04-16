Received: from mail-wi0-f182.google.com ([209.85.212.182])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <martin.jansa@gmail.com>) id 1US7s1-0006ZH-0S
	for openembedded-core@lists.openembedded.org;
	Tue, 16 Apr 2013 17:32:33 +0200
Received: by mail-wi0-f182.google.com with SMTP id m6so577391wiv.15
	for <openembedded-core@lists.openembedded.org>;
	Tue, 16 Apr 2013 08:15:02 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=x-received:date:from:to:cc:subject:message-id:references
	:mime-version:content-type:content-disposition:in-reply-to
	:user-agent; bh=3zkaqW3XlpoEdiXeD5VkWotVJVfIJtQX/ZJ3Ts/G85E=;
	b=xegL9+1E0UnW8wOhejFHatinFwtA7+uEaSO9u0ofg6OOaGyFVD48WB8JD1gR3li7xg
	LoGJxoWMTtB/Qi5c+hPjgPkD0KpuKAp8cPqPaZYTjg4F5eAAEuESVDBesCXUb0Ysm4Yh
	xPFiFIH3M0Tdr7QRSBfPKB66R2+KxaLRzNTl+5s0Fg2J6gSWLxo7KnVI7+dJcnKz0prR
	RpFAWNYzEByCzHZtq2sToa1L2PziZQVHUYcoYHikHhRz+m6TyUdSB0orQEni8aFnzb6m
	/wEruNORYJKlI8Ai0arFnoGizB0LSWPGYQjkik8d2BuEP59X6yxV1DYhaPpKmsClYBGb
	wfRA==
X-Received: by 10.194.58.202 with SMTP id t10mr4848859wjq.4.1366125302410;
	Tue, 16 Apr 2013 08:15:02 -0700 (PDT)
Received: from localhost (ip-62-24-80-7.net.upcbroadband.cz. [62.24.80.7])
	by mx.google.com with ESMTPS id s2sm3623052wib.4.2013.04.16.08.15.00
	(version=TLSv1.2 cipher=RC4-SHA bits=128/128);
	Tue, 16 Apr 2013 08:15:01 -0700 (PDT)
Date: Tue, 16 Apr 2013 17:15:08 +0200
From: Martin Jansa <martin.jansa@gmail.com>
To: Paul Eggleton <paul.eggleton@linux.intel.com>
Message-ID: <20130416151508.GQ10628@jama.dyndns-home.com>
References: <cover.1366124347.git.paul.eggleton@linux.intel.com>
	<0fe78c978006e4ddb8f25fd23176162e69a8309b.1366124347.git.paul.eggleton@linux.intel.com>
MIME-Version: 1.0
In-Reply-To: <0fe78c978006e4ddb8f25fd23176162e69a8309b.1366124347.git.paul.eggleton@linux.intel.com>
User-Agent: Mutt/1.5.21 (2010-09-15)
Cc: openembedded-core@lists.openembedded.org
Subject: Re: [PATCH 2/3] qt4-embedded: bump PR to allow removal of meta-oe bbappend
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
X-List-Received-Date: Tue, 16 Apr 2013 15:32:34 -0000
X-Groupsio-MsgNum: 38023
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="vIXBmblrD40XNCy4"
Content-Disposition: inline

--vIXBmblrD40XNCy4
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Tue, Apr 16, 2013 at 04:01:23PM +0100, Paul Eggleton wrote:
> The meta-oe bbappend only increments PR, if we bump PR here we can
> remove that.
>=20
> Signed-off-by: Paul Eggleton <paul.eggleton@linux.intel.com>
> ---
>  meta/recipes-qt/qt4/qt4-embedded_4.8.4.bb |    2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
>=20
> diff --git a/meta/recipes-qt/qt4/qt4-embedded_4.8.4.bb b/meta/recipes-qt/=
qt4/qt4-embedded_4.8.4.bb
> index 286da95..c08927e 100644
> --- a/meta/recipes-qt/qt4/qt4-embedded_4.8.4.bb
> +++ b/meta/recipes-qt/qt4/qt4-embedded_4.8.4.bb
> @@ -1,7 +1,7 @@
>  require qt4-${PV}.inc
>  require qt4-embedded.inc
> =20
> -PR =3D "${INC_PR}.3"
> +PR =3D "${INC_PR}.4"

You need to bump INC_PR to replace PRINC

--=20
Martin 'JaMa' Jansa     jabber: Martin.Jansa@gmail.com

--vIXBmblrD40XNCy4
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: Digital signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v2.0.19 (GNU/Linux)

iEYEARECAAYFAlFtavwACgkQN1Ujt2V2gBxsgQCdEaRnKCQkhrljp1LDTeBFqESL
X30An17zpL0A+NIdf1F1FfE1nHD4KBBX
=BHyJ
-----END PGP SIGNATURE-----

--vIXBmblrD40XNCy4--
