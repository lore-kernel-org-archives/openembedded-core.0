Received: from mail-ee0-f47.google.com ([74.125.83.47])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <martin.jansa@gmail.com>) id 1Scmu9-00061b-7F
	for openembedded-core@lists.openembedded.org;
	Fri, 08 Jun 2012 02:18:17 +0200
Received: by eekd49 with SMTP id d49so629314eek.6
	for <openembedded-core@lists.openembedded.org>;
	Thu, 07 Jun 2012 17:07:48 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=date:from:to:subject:message-id:references:mime-version
	:content-type:content-disposition:in-reply-to:user-agent;
	bh=gpQQKsDg4IwCDxFGas2SZSZNRMwZX0/nHuqOAmoWy7Q=;
	b=FmqjZ4l8wOcCOYq23IHmec8NIawOjoFNWSsLwuDRtUStKOyVffLYvQWnlh11+5Ytse
	A9kYm7wnGe4r8KsKmZtvmkMKhE9dQwBGb64JQ3eo80FEFMem1q60mEzK788wBmzswr7/
	2iwHCzkAcWFtILGsSz+CaYkP7aPgTCgTiGLY+H6bINQXiP2zu+2zRxLxC88MqK28iE4P
	Hx5ZBj9348jK/8Qh26os8RR9mJ5kFKAJ7/DhquDYSztAHYr7INsHtJ5JFyfeZRHAaR/z
	R7uTa81YGVVPakmPriQoEcL/rNRFl5jh3j6BSnvHDquBGOUB38BHl8eu69IunXQIk48m
	y78A==
Received: by 10.14.28.140 with SMTP id g12mr2231202eea.42.1339114068194;
	Thu, 07 Jun 2012 17:07:48 -0700 (PDT)
Received: from localhost ([94.230.152.246])
	by mx.google.com with ESMTPS id dg2sm7044842wib.4.2012.06.07.17.07.46
	(version=TLSv1/SSLv3 cipher=OTHER);
	Thu, 07 Jun 2012 17:07:46 -0700 (PDT)
Date: Fri, 8 Jun 2012 02:08:05 +0200
From: Martin Jansa <martin.jansa@gmail.com>
To: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Message-ID: <20120608000804.GH3140@jama.jama.net>
References: <cover.1339078729.git.ross.burton@intel.com>
	<5afc9f367cc3224e82bbe59fe9bda14f504b45c0.1339078729.git.ross.burton@intel.com>
	<20120607143221.GG3140@jama.jama.net>
	<CAJTo0LaiApvc0oD4VKHPcsoWtEEBcSyPcza9sr=wOs78DNxPLg@mail.gmail.com>
MIME-Version: 1.0
In-Reply-To: <CAJTo0LaiApvc0oD4VKHPcsoWtEEBcSyPcza9sr=wOs78DNxPLg@mail.gmail.com>
User-Agent: Mutt/1.5.21 (2010-09-15)
Subject: Re: [PATCH 1/3] connman: respect the 3g feature and enable/disable ofono support
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
X-List-Received-Date: Fri, 08 Jun 2012 00:18:17 -0000
X-Groupsio-MsgNum: 23280
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="U3BNvdZEnlJXqmh+"
Content-Disposition: inline

--U3BNvdZEnlJXqmh+
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Thu, Jun 07, 2012 at 03:46:54PM +0100, Burton, Ross wrote:
> On 7 June 2012 15:32, Martin Jansa <martin.jansa@gmail.com> wrote:
> > Why not use PACKAGECONFIG for all those?
>=20
> Because this is the first time I've encountered it.  :)  Is there any
> documentation on it, or a comprehensive example?

Git log shows e.g.
http://git.openembedded.org/openembedded-core/commit/?id=3D7a58911f6951abd5=
6db9ebb37f8d6284d91fa514

and git grep PACKAGECONFIG will show couple of examples

Cheers,

--=20
Martin 'JaMa' Jansa     jabber: Martin.Jansa@gmail.com

--U3BNvdZEnlJXqmh+
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: Digital signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v2.0.19 (GNU/Linux)

iEYEARECAAYFAk/RQmQACgkQN1Ujt2V2gBxFjQCfYKIbKViz4RBk+Ctfz9PK9KvM
zm4An36NDar+dSxJDlth5qiwcBXjK661
=YGAe
-----END PGP SIGNATURE-----

--U3BNvdZEnlJXqmh+--
