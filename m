Return-Path: <martin.jansa@gmail.com>
Received: from mail-wm0-f67.google.com (mail-wm0-f67.google.com [74.125.82.67])
	by mail.openembedded.org (Postfix) with ESMTP id 51A3C771A3
	for <openembedded-core@lists.openembedded.org>;
	Wed,  1 Jun 2016 10:00:40 +0000 (UTC)
Received: by mail-wm0-f67.google.com with SMTP id a136so5240550wme.0
	for <openembedded-core@lists.openembedded.org>;
	Wed, 01 Jun 2016 03:00:42 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=from:date:to:cc:subject:message-id:references:mime-version
	:content-disposition:in-reply-to:user-agent;
	bh=SsYGXbG/XM8WsOi7Qxb68w+cUWo4xI01HYY6mvUlu6I=;
	b=EZcJXUr2otG5hHgROF1XA4V5ZyeGaEZIcdRXTOpj+HCkifrfGaMBR7ABA8tWkE97R0
	y37QSAKPwNyi+VElVQNWTlbJNk8a09YBSHfGtIf3QiqfFWElhQWaPJ2WpdXS76VKLQGI
	92DbPUdTH8QPKFV8HwI7VO/Pweb2rfbKjwB4FFjbJt4FzDikoG9PPzjhWUHoM0htugkI
	oXbXFMLbHe+iEaUXnaRgLNFen/9teGbbUL5F72QJ0/1mBEasL0FEjASLr3kJT8Ej/5pp
	HMiyu7yUDdS0a7bBguFfs7V5MND5r5eEUmvzvbNzDB1/lqvNxGXg8SR0nzJFQ3Ci/FZd
	tbqA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:from:date:to:cc:subject:message-id:references
	:mime-version:content-disposition:in-reply-to:user-agent;
	bh=SsYGXbG/XM8WsOi7Qxb68w+cUWo4xI01HYY6mvUlu6I=;
	b=Ba63j9Wk3Lsb1wczaYL9sScmnwV6BGyKrprqAsytRrXGAZl1S6v4zy7qRVwHDAJbDd
	OFmMRFzoPGc9gEa1866u7y/5dnTVXh2L4HDj+3vZzU0MC8vSem6MgOej3xlgWynWuZZ4
	BBgdM928HoaNaWv72upQIBDIp7+bZgK68sNspE6iZRzhV7gW4+rRxb8UhRDH4oJ5wnrP
	KB/1nCDpjkl9zs6PNo4qJZw9kJ9Ula0Sg4m9L16T6J5kG8vASPRcGHOSkKc7LrRpyjQX
	u1R5K/cW5PpsE+9s/8GjnHvWAk+iK+BFPL7qDnALuoB6im8nNb6UIeLJSi7HH1vf13Za
	qxSQ==
X-Gm-Message-State: ALyK8tJj2r57H9gF7iuSyDi+kqp4FWLXJ9ZPMpgSQMvKY6NGJ924oo5h6VWhRUIApv2Rfg==
X-Received: by 10.194.123.9 with SMTP id lw9mr3060158wjb.53.1464775241312;
	Wed, 01 Jun 2016 03:00:41 -0700 (PDT)
Received: from localhost (ip-86-49-34-37.net.upcbroadband.cz. [86.49.34.37])
	by smtp.gmail.com with ESMTPSA id
	a63sm33848517wmh.11.2016.06.01.03.00.39
	(version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
	Wed, 01 Jun 2016 03:00:39 -0700 (PDT)
From: Martin Jansa <martin.jansa@gmail.com>
X-Google-Original-From: Martin Jansa <Martin.Jansa@gmail.com>
Date: Wed, 1 Jun 2016 12:00:59 +0200
To: Anders Darander <anders@chargestorm.se>
Message-ID: <20160601100059.GA2600@jama>
References: <1463734861-23862-1-git-send-email-anders@chargestorm.se>
MIME-Version: 1.0
In-Reply-To: <1463734861-23862-1-git-send-email-anders@chargestorm.se>
User-Agent: Mutt/1.6.1 (2016-04-27)
Cc: openembedded-core@lists.openembedded.org
Subject: Re: [PATCH] lib/oe/rootfs: Fix DEBUGFS generation, without openssl
X-BeenThere: openembedded-core@lists.openembedded.org
X-Mailman-Version: 2.1.12
Precedence: list
List-Id: Patches and discussions about the oe-core layer
	<openembedded-core.lists.openembedded.org>
List-Unsubscribe: <http://lists.openembedded.org/mailman/options/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.openembedded.org/pipermail/openembedded-core/>
List-Post: <mailto:openembedded-core@lists.openembedded.org>
List-Help: <mailto:openembedded-core-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.openembedded.org/mailman/listinfo/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Wed, 01 Jun 2016 10:00:42 -0000
X-Groupsio-MsgNum: 82897
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="OXfL5xGRrasGEqWY"
Content-Disposition: inline

--OXfL5xGRrasGEqWY
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Fri, May 20, 2016 at 11:01:01AM +0200, Anders Darander wrote:
> In commit 20ea6d274bb0a9a5addb111f32793de49b907865, debugfs generation
> for images using opkg, which included openssl was fixed.
>=20
> However, that broke the generation of the opkg-based images, that lacks
> openssl. The error is a python stack trace, showing that shutil.copytree
> tries to copy a non-existing directory.
>=20
> This relates to [YOCTO #9040].

Please merge this to krogoth as well, the first part which causes this
issue was already merged as:

commit cd4ad2b8a5bd11e91e854cea6a36c7b92fb7cea8
Author: Anders Darander <anders@chargestorm.se>
Date:   Tue May 3 13:57:16 2016 +0200

    lib/oe/rootfs: Fix DEBUGFS generation for opkg & openssl-cnf

>=20
> Signed-off-by: Anders Darander <anders@chargestorm.se>
> ---
>  meta/lib/oe/rootfs.py | 2 ++
>  1 file changed, 2 insertions(+)
>=20
> diff --git a/meta/lib/oe/rootfs.py b/meta/lib/oe/rootfs.py
> index f5c465f..7087b12 100644
> --- a/meta/lib/oe/rootfs.py
> +++ b/meta/lib/oe/rootfs.py
> @@ -116,6 +116,8 @@ class Rootfs(object):
> =20
>          bb.note("  Copying back package database...")
>          for dir in dirs:
> +            if not os.path.isdir(self.image_rootfs + '-orig' + dir):
> +                continue
>              bb.utils.mkdirhier(self.image_rootfs + os.path.dirname(dir))
>              shutil.copytree(self.image_rootfs + '-orig' + dir, self.imag=
e_rootfs + dir, symlinks=3DTrue)
> =20
> --=20
> 2.8.1
>=20
> --=20
> _______________________________________________
> Openembedded-core mailing list
> Openembedded-core@lists.openembedded.org
> http://lists.openembedded.org/mailman/listinfo/openembedded-core

--=20
Martin 'JaMa' Jansa     jabber: Martin.Jansa@gmail.com

--OXfL5xGRrasGEqWY
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: Digital signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v2

iEYEARECAAYFAldOslEACgkQN1Ujt2V2gBwpjACfTO1lPpYLcpfuefNifw/Dmxz7
W80AoLiQVre8i1UBGZSJNh6g+XgTG1e4
=Whe7
-----END PGP SIGNATURE-----

--OXfL5xGRrasGEqWY--
