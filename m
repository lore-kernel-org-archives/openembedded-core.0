Received: from mail-bw0-f47.google.com ([209.85.214.47])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <martin.jansa@gmail.com>) id 1ROu3M-0005Uk-LD
	for openembedded-core@lists.openembedded.org;
	Fri, 11 Nov 2011 17:34:08 +0100
Received: by bkbzs2 with SMTP id zs2so3542817bkb.6
	for <openembedded-core@lists.openembedded.org>;
	Fri, 11 Nov 2011 08:27:50 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=date:from:to:subject:message-id:references:mime-version
	:content-type:content-disposition:in-reply-to:user-agent;
	bh=gW3WruBqzLBLyc/XftqlaQjc1oqSF15UWgrYSnShoGA=;
	b=F8xVg1Mgjo159x95noOwXP6AyIsemH7zwlDW5WWJ1h2T7qDxXh8U7ugS+oJM79hW4t
	i0xs9Rf+jfedWz+gbF9Kvl6kCC6DDzAF+aWld0Tk+WsP7y14Q9l3QjGs8sXUz8/zYrSa
	Z503ukcOsI8+bJJZ9KoxDTY5GkruyktSVudGs=
Received: by 10.205.138.17 with SMTP id iq17mr1201282bkc.118.1321028870733;
	Fri, 11 Nov 2011 08:27:50 -0800 (PST)
Received: from localhost ([94.230.152.246])
	by mx.google.com with ESMTPS id m12sm1756289bkg.14.2011.11.11.08.27.48
	(version=TLSv1/SSLv3 cipher=OTHER);
	Fri, 11 Nov 2011 08:27:49 -0800 (PST)
Date: Fri, 11 Nov 2011 17:27:47 +0100
From: Martin Jansa <martin.jansa@gmail.com>
To: openembedded-core@lists.openembedded.org
Message-ID: <20111111162747.GD3574@jama.jama.net>
References: <cover.1321027644.git.Martin.Jansa@gmail.com>
MIME-Version: 1.0
In-Reply-To: <cover.1321027644.git.Martin.Jansa@gmail.com>
User-Agent: Mutt/1.5.21 (2010-09-15)
Subject: Re: [PATCH][oe-core 00/22] QT4, thumb, subversion, mesa, libsdl, time, util-linux, kbd changes
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
X-List-Received-Date: Fri, 11 Nov 2011 16:34:08 -0000
X-Groupsio-MsgNum: 12360
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="eheScQNz3K90DVRs"
Content-Disposition: inline

--eheScQNz3K90DVRs
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Fri, Nov 11, 2011 at 05:12:53PM +0100, Martin Jansa wrote:
> Hi,
>=20
> please merge following changes or at least some of them :).
>=20
> qt4: change is resent because nobody commented more after Simon explained=
 why it's needed
> thumb: changes have now improved commit messages and PR bumps
> subversion: RP said that bitbake fetcher should be improved but having 1.=
7.0
>   available now with negative D_P won't hurt anybody and will make testin=
g of=20
>   newer fetcher code easier
> mesa: just as reminder
> libsdl: resent with extra patch alsa-nativesdk
> time, util-linux, kbd: added u-a calls, because of conflicts with default=
 busybox config

Sorry about this and following e-mail without patches..=20
send-pull-request script doesn't handle this:

=2E. sending cover letter ..
Result: OK
fatal: pull-14313/0003-pulseaudio-0.9.23-force-ARM-mode.patch: 12: patch
contains a line longer than 998 characters
warning: no patches were sent


--eheScQNz3K90DVRs
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: Digital signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v2.0.18 (GNU/Linux)

iEYEARECAAYFAk69TQMACgkQN1Ujt2V2gBxyBQCfc0tCvWT5EuKYH+u4WNbKVwUz
944An1z2SV2PHTwWv1mPPIgkjxkcAocD
=etUH
-----END PGP SIGNATURE-----

--eheScQNz3K90DVRs--
