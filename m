Received: from mail-ea0-f176.google.com ([209.85.215.176])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <martin.jansa@gmail.com>) id 1UQf7h-0003Cn-94
	for openembedded-core@lists.openembedded.org;
	Fri, 12 Apr 2013 16:38:42 +0200
Received: by mail-ea0-f176.google.com with SMTP id h10so1241678eaj.7
	for <openembedded-core@lists.openembedded.org>;
	Fri, 12 Apr 2013 07:21:17 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=x-received:date:from:to:cc:subject:message-id:references
	:mime-version:content-type:content-disposition:in-reply-to
	:user-agent; bh=3NkYrd3lHtyLDBjkzzNcmU0Z/xPYcxYbJsid6Lj76n4=;
	b=Tw1T3yQhWSIjKJKR76thPsmOgmepGnqnJpM+KkxMQhbPyIa+i5y8SxBe59MmWnpMiN
	BPzXJ+OGZ56sa68lDA34y9XzyXXhmQ3XxP0D02gxvo8yvbtr3w5HEUlrTEGvYbEF5pEo
	XqA9w0Q1nIKmz8KO8vuwxQJUOvGvjwV91Ht75hYidB58ZXBUmsdTdf9fheySyquwd/P9
	gy1/GRsObMs44G2YbnwRVIrOcfQQC8nBnFiz7kiWrXBrChEvedQK/DQ6HqYDPnlQnvtN
	qIZodQmuo1CARJ8F8b7wnQgXByR2KW6UENkzH0JeiGoptpdZpd0akE9sm9Dl3+YyozMK
	r5hA==
X-Received: by 10.14.1.130 with SMTP id 2mr28770079eed.15.1365776477050;
	Fri, 12 Apr 2013 07:21:17 -0700 (PDT)
Received: from localhost (ip-62-24-80-7.net.upcbroadband.cz. [62.24.80.7])
	by mx.google.com with ESMTPS id t4sm11442552eel.0.2013.04.12.07.21.16
	(version=TLSv1.2 cipher=RC4-SHA bits=128/128);
	Fri, 12 Apr 2013 07:21:16 -0700 (PDT)
Date: Fri, 12 Apr 2013 16:21:19 +0200
From: Martin Jansa <martin.jansa@gmail.com>
To: "Burton, Ross" <ross.burton@intel.com>
Message-ID: <20130412142119.GQ2477@jama>
References: <20130412142015.GP2477@jama>
MIME-Version: 1.0
In-Reply-To: <20130412142015.GP2477@jama>
User-Agent: Mutt/1.5.21 (2010-09-15)
Cc: openembedded-core@lists.openembedded.org
Subject: Re: wpa-supplicant postinsts failing without sysvinit in DISTRO_FEATURES
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
X-List-Received-Date: Fri, 12 Apr 2013 14:39:12 -0000
X-List-Received-Date: Fri, 12 Apr 2013 14:39:12 -0000
X-Groupsio-MsgNum: 37831
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="dO6Thh8T/cwyDjv9"
Content-Disposition: inline

--dO6Thh8T/cwyDjv9
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Fri, Apr 12, 2013 at 04:20:15PM +0200, Martin Jansa wrote:
> oe-core/meta/recipes-connectivity/wpa-supplicant/wpa-supplicant-2.0.inc

the same is in avahi.inc (pkg_postinst_avahi-daemon)

>=20
> defines pkg_postinst_wpa-supplicant
> with:
>         if [ "x$DBUSPID" !=3D "x" ]; then
>                 /etc/init.d/dbus-1 reload || true
>         fi
>=20
> and /etc/init.d/dbus-1 is missing without sysvinit in DISTRO_FEATURES
>=20
> Thanks to "true" it doesn't fail completely, but if the goal is no
> warnings in images then errors should be fixed too :)
>=20
> Configuring wpa-supplicant.
> //var/lib/opkg/info/wpa-supplicant.postinst: line 9: /etc/init.d/dbus-1:
> //No such file or directory
>=20
> --=20
> Martin 'JaMa' Jansa     jabber: Martin.Jansa@gmail.com



--=20
Martin 'JaMa' Jansa     jabber: Martin.Jansa@gmail.com

--dO6Thh8T/cwyDjv9
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: Digital signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v2.0.19 (GNU/Linux)

iEYEARECAAYFAlFoGF8ACgkQN1Ujt2V2gBwHOwCeMbUlB8L41XhZL0l5FWjhpVES
NZoAn2WwOjuV//HUp+SETC8a12Lgk20y
=+ozf
-----END PGP SIGNATURE-----

--dO6Thh8T/cwyDjv9--
