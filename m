Received: from mail-wg0-f52.google.com ([74.125.82.52])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <martin.jansa@gmail.com>) id 1TxRaz-0000k6-5q
	for openembedded-core@lists.openembedded.org;
	Tue, 22 Jan 2013 01:20:19 +0100
Received: by mail-wg0-f52.google.com with SMTP id 12so1685598wgh.31
	for <openembedded-core@lists.openembedded.org>;
	Mon, 21 Jan 2013 16:04:40 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=x-received:date:from:to:cc:subject:message-id:references
	:mime-version:content-type:content-disposition:in-reply-to
	:user-agent; bh=oPKV0fMsMridd6rs4KHUtTLjjd641xYfGmXbKARq0tA=;
	b=NQ7BciaD5RwzyxZ8NSkj/Rg+2n1w0Bfb65AmNKcz+wPbIcjsgpvljrJm6he9DIK/w0
	jAUSycbRpEfi83bcfs1ZQgvuypfSzz27AaygiCPdbPOGddUtf2ZnSyoGytrwhTOZAxDE
	Iued/uRFbWUv2uj8ASRUzl0r3/wDZUFRcuvP1u63BQeD8iqMDfXpGjxXhN0ywAzi7Rgj
	i3BvPt4vJ3pO2pQ7yyocfhO75mFapgFvROJR3My+3k2rSrG/0+zpKuc1Xp/mJ2tLrOxq
	fFO5csAIeqy1Vr5eNmlQKs34X/KzeNHKzRnCWpMzB5QixUVzQQvnt1KwpYlJ4M6ar/l5
	dkeg==
X-Received: by 10.194.236.68 with SMTP id us4mr29318946wjc.11.1358813079986;
	Mon, 21 Jan 2013 16:04:39 -0800 (PST)
Received: from localhost (ip-62-24-80-7.net.upcbroadband.cz. [62.24.80.7])
	by mx.google.com with ESMTPS id p2sm21199955wic.7.2013.01.21.16.04.38
	(version=TLSv1.2 cipher=RC4-SHA bits=128/128);
	Mon, 21 Jan 2013 16:04:39 -0800 (PST)
Date: Tue, 22 Jan 2013 01:04:42 +0100
From: Martin Jansa <martin.jansa@gmail.com>
To: Richard Purdie <richard.purdie@linuxfoundation.org>
Message-ID: <20130122000442.GN29386@jama.palm1.palmone.com>
References: <1358808548.14265.72.camel@ted>
MIME-Version: 1.0
In-Reply-To: <1358808548.14265.72.camel@ted>
User-Agent: Mutt/1.5.21 (2010-09-15)
Cc: openembedded-core <openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH] sanity.bbclass: Ensure tmpdir exists when running the check
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
X-List-Received-Date: Tue, 22 Jan 2013 00:20:22 -0000
X-List-Received-Date: Tue, 22 Jan 2013 00:20:22 -0000
X-Groupsio-MsgNum: 34182
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="+mr2ctTDD1GjnQwB"
Content-Disposition: inline

--+mr2ctTDD1GjnQwB
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Mon, Jan 21, 2013 at 10:49:08PM +0000, Richard Purdie wrote:
> This avoids tracebacks from bitbake if the directory doesn't already
> exist.
>=20
> [YOCTO #3640]
>=20
> Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
> ---
> diff --git a/meta/classes/sanity.bbclass b/meta/classes/sanity.bbclass
> index 0ffa52d..8ca0b68 100644
> --- a/meta/classes/sanity.bbclass
> +++ b/meta/classes/sanity.bbclass
> @@ -571,6 +571,7 @@ def check_sanity(sanity_data):
>              messages =3D messages + "Error, TMPDIR has changed location.
> You need to either move it back to %s or rebuild\n" % saved_tmpdir

^ looks like extra line break here, I had to apply it manually, testing now=
=2E.

>      else:
>          f =3D file(checkfile, "w")
> +        bb.utils.mkdirhier(tmpdir)
>          f.write(tmpdir)
>      f.close()
> =20
>=20
>=20
>=20
> _______________________________________________
> Openembedded-core mailing list
> Openembedded-core@lists.openembedded.org
> http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-core

--=20
Martin 'JaMa' Jansa     jabber: Martin.Jansa@gmail.com

--+mr2ctTDD1GjnQwB
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: Digital signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v2.0.19 (GNU/Linux)

iEYEARECAAYFAlD915oACgkQN1Ujt2V2gBz7PQCdHp1efaq0dmXpYltDnDLAP+Wy
eMAAnifjkEStBus7OCGNGz+95YIObBoa
=e7XR
-----END PGP SIGNATURE-----

--+mr2ctTDD1GjnQwB--
