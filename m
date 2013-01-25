Received: from mail-pb0-f50.google.com ([209.85.160.50])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <martin.jansa@gmail.com>) id 1Tym6O-0005vF-1Z
	for openembedded-core@lists.openembedded.org;
	Fri, 25 Jan 2013 17:26:06 +0100
Received: by mail-pb0-f50.google.com with SMTP id wz7so291970pbc.23
	for <openembedded-core@lists.openembedded.org>;
	Fri, 25 Jan 2013 08:10:29 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=x-received:date:from:to:cc:subject:message-id:references
	:mime-version:content-type:content-disposition:in-reply-to
	:user-agent; bh=O8sBG8J5/ro3hpzkSOPHKsNSiPHMrh+RD9v5XDwQ7lw=;
	b=cleraAUIkQpiuYzlM8emGin/NIKUp/2M9kj8fm4Im75P7nUTvKfemQsNiCGBko41Zh
	QWDBy0tCFAMj7OnhdJYbg3gXPG5hwNklhyuJtafigORwNfMwq/JS9PrctGaLxx3oc9hb
	M4SMmwiSXWFpjMwX9Gbbkp4NlEtIaQbxWmiLmQURPvSFEWKM6pQKY40MuN2zPhEdURJv
	sTRzyzhnJVNDYs5FBBp26KPYS/6T7de8rYB3r+nIq1SMZtBnvH/ZL6FjGy0bLeQzuA4S
	9r+pd35lcO2bHIPZQhMmqGY02zc4hIigOL2pzL08rcGa8sEXllDA+syzadNp4BotX73E
	9LGg==
X-Received: by 10.68.254.195 with SMTP id ak3mr15435550pbd.37.1359130229027;
	Fri, 25 Jan 2013 08:10:29 -0800 (PST)
Received: from localhost (ip-62-24-80-7.net.upcbroadband.cz. [62.24.80.7])
	by mx.google.com with ESMTPS id ot3sm902222pbb.38.2013.01.25.08.10.25
	(version=TLSv1.2 cipher=RC4-SHA bits=128/128);
	Fri, 25 Jan 2013 08:10:27 -0800 (PST)
Date: Fri, 25 Jan 2013 17:10:24 +0100
From: Martin Jansa <martin.jansa@gmail.com>
To: Jeremy Stashluk <stashluk@gmail.com>
Message-ID: <20130125161024.GL3200@jama>
References: <1359128238-23401-1-git-send-email-jstashluk@dekaresearch.com>
MIME-Version: 1.0
In-Reply-To: <1359128238-23401-1-git-send-email-jstashluk@dekaresearch.com>
User-Agent: Mutt/1.5.21 (2010-09-15)
Cc: Jeremy Stashluk <jstashluk@dekaresearch.com>,
	openembedded-core@lists.openembedded.org
Subject: Re: [PATCH] gst-plugins-gl: add package recipe
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
X-List-Received-Date: Fri, 25 Jan 2013 16:26:08 -0000
X-Groupsio-MsgNum: 34450
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="SEFvVLxbW/dEDtN8"
Content-Disposition: inline

--SEFvVLxbW/dEDtN8
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Fri, Jan 25, 2013 at 10:37:18AM -0500, Jeremy Stashluk wrote:
> ---
>  .../gstreamer/gst-plugins-gl_0.10.3.bb             |   16 ++++++++++++++=
++
>  1 file changed, 16 insertions(+)
>  create mode 100644 meta/recipes-multimedia/gstreamer/gst-plugins-gl_0.10=
=2E3.bb
>=20
> diff --git a/meta/recipes-multimedia/gstreamer/gst-plugins-gl_0.10.3.bb b=
/meta/recipes-multimedia/gstreamer/gst-plugins-gl_0.10.3.bb
> new file mode 100644
> index 0000000..3bafb7c
> --- /dev/null
> +++ b/meta/recipes-multimedia/gstreamer/gst-plugins-gl_0.10.3.bb
> @@ -0,0 +1,16 @@
> +require recipes-multimedia/gstreamer/gst-plugins.inc
> +
> +LICENSE =3D "GPLv2+ & LGPLv2+ & LGPLv2.1+ "
> +LIC_FILES_CHKSUM =3D "file://COPYING;md5=3D55ca817ccb7d5b5b66355690e9abc=
605"
> +
> +PR =3D "r2"
> +
> +DEPENDS +=3D "gst-plugins-base virtual/libgl"
> +
> +SRC_URI[md5sum] =3D "f066943621e9e18dc4b8e27e869a39cf8893aec9"

^ You need to provide both checksums

> +
> +inherit gettext gconf
> +
> +ARM_INSTRUCTION_SET =3D "arm"

^ why ?

> +
> +FILES_${PN}-gconfelements +=3D "${sysconfdir}/gconf/schemas/gstreamer-0.=
10.schemas"
> --=20
> 1.7.9.5
>=20
>=20
> _______________________________________________
> Openembedded-core mailing list
> Openembedded-core@lists.openembedded.org
> http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-core

--=20
Martin 'JaMa' Jansa     jabber: Martin.Jansa@gmail.com

--SEFvVLxbW/dEDtN8
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: Digital signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v2.0.19 (GNU/Linux)

iEYEARECAAYFAlECrnAACgkQN1Ujt2V2gBxnJgCfcc7038F00GUzzc9stuQNOvJG
lFkAniWxTbzmFU95THd4ynpRFFiKxvcC
=kstp
-----END PGP SIGNATURE-----

--SEFvVLxbW/dEDtN8--
