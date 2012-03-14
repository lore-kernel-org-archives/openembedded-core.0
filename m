Received: from mail-wi0-f171.google.com ([209.85.212.171])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <martin.jansa@gmail.com>) id 1S7j7k-0001jt-Lc
	for openembedded-core@lists.openembedded.org;
	Wed, 14 Mar 2012 08:59:56 +0100
Received: by wibhj13 with SMTP id hj13so5787606wib.6
	for <openembedded-core@lists.openembedded.org>;
	Wed, 14 Mar 2012 00:51:11 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=date:from:to:subject:message-id:references:mime-version
	:content-type:content-disposition:in-reply-to:user-agent;
	bh=t9N7PeDVC7sPfrA9s8GpT6bWF+vkoN/+yeAqIrblA/Y=;
	b=WXZm9NigJIMeVcSd0swo6GsyGc/Xxiilgv8aDPMqWexyc1dZFcMrlClvMp1DdCY5JX
	0DIkVLoQX2hj+tHVyUCOsWEDYXYmj+DWpZjRm/07W02q+GCfKbBIIANQ5qxoZpPluqlb
	42EetoMgDy4nfRh/TwoA5XdKYfFSTfZ84EZ7+ecWDjG8fzuemAIPxsBXm+v3oY1YvxYi
	hOgSU3napmYe61zq5VBNv9E5IT6Af9pWxcpfrCxZJ/LPmmm7gLSpVaojhVGxdOg3CFr5
	9noxU1j9kYUlHlDMwJfEgR7gESsj26rwqs24+hxmqtv1FNWYryMj44jK8BPRlppmJvHQ
	3rHQ==
Received: by 10.180.81.135 with SMTP id a7mr8751359wiy.16.1331711471846;
	Wed, 14 Mar 2012 00:51:11 -0700 (PDT)
Received: from localhost ([94.230.152.246])
	by mx.google.com with ESMTPS id n15sm49888610wiw.6.2012.03.14.00.51.10
	(version=TLSv1/SSLv3 cipher=OTHER);
	Wed, 14 Mar 2012 00:51:10 -0700 (PDT)
Date: Wed, 14 Mar 2012 08:51:08 +0100
From: Martin Jansa <martin.jansa@gmail.com>
To: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Message-ID: <20120314075108.GC3919@jama.jama.net>
References: <cover.1331684953.git.scott.a.garman@intel.com>
MIME-Version: 1.0
In-Reply-To: <cover.1331684953.git.scott.a.garman@intel.com>
User-Agent: Mutt/1.5.21 (2010-09-15)
Subject: Re: [PATCH 0/1] ncurses packaging fix
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
X-List-Received-Date: Wed, 14 Mar 2012 07:59:56 -0000
X-Groupsio-MsgNum: 18763
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="s9fJI615cBHmzTOP"
Content-Disposition: inline

--s9fJI615cBHmzTOP
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Tue, Mar 13, 2012 at 05:31:24PM -0700, Scott Garman wrote:
> Hello,
>=20
> This fixes the ncurses library packaging. Thanks to Andreas Oberritter
> for pointing it out.

Why not use another do_split_packages for base_libdir?

Can it be used only once per recipe? are there any libs left in libdir?

Cheers,

>=20
> Scott
>=20
> The following changes since commit 81379dc141e245307ca391a02b7490b1991289=
91:
>=20
>   dates: Fix unpackaged files warning (2012-03-13 23:18:19 +0000)
>=20
> are available in the git repository at:
>   git://git.pokylinux.org/poky-contrib sgarman/ncurses-pkg-fix-oe
>   http://git.pokylinux.org/cgit.cgi/poky-contrib/log/?h=3Dsgarman/ncurses=
-pkg-fix-oe
>=20
> Scott Garman (1):
>   ncurses: fix packaging of moved libraries
>=20
>  meta/recipes-core/ncurses/ncurses.inc |   18 ++++++++++++++++--
>  1 files changed, 16 insertions(+), 2 deletions(-)
>=20
> --=20
> 1.7.5.4
>=20
>=20
> _______________________________________________
> Openembedded-core mailing list
> Openembedded-core@lists.openembedded.org
> http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-core

--=20
Martin 'JaMa' Jansa     jabber: Martin.Jansa@gmail.com

--s9fJI615cBHmzTOP
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: Digital signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v2.0.18 (GNU/Linux)

iEYEARECAAYFAk9gTewACgkQN1Ujt2V2gBz9SwCfTY2oVlGzHeoFzZz8kV9U4zGF
NVoAn33OvEG4E4I+8EW7igq+umudNY2x
=v5db
-----END PGP SIGNATURE-----

--s9fJI615cBHmzTOP--
