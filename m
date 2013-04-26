Received: from mail-ea0-f180.google.com ([209.85.215.180])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <martin.jansa@gmail.com>) id 1UVg1k-00079K-Rf
	for openembedded-core@lists.openembedded.org;
	Fri, 26 Apr 2013 12:37:20 +0200
Received: by mail-ea0-f180.google.com with SMTP id q16so1566529ead.39
	for <openembedded-core@lists.openembedded.org>;
	Fri, 26 Apr 2013 03:19:31 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=x-received:date:from:to:cc:subject:message-id:references
	:mime-version:content-type:content-disposition:in-reply-to
	:user-agent; bh=ikxsKn0Zh946QOW61/Nu0QPd+GmMdjoeLeuXGACFH7M=;
	b=FfjPcWdwVIIQun5iQTzjXXvPViUL80p/HHn7XDTatOw60W7TbYk3BaeH+q2HOfPD9l
	jbEFwDicaqixT2DxExBUzVtPFsj1SwvvvKgL/nICqFwHw9fEATE93SnkbvyvJ9X+ESrI
	Wu30AghxVwN+uHA/fiQf8Fn68aQPKQXjwVqiUlMRmMF2YUFmQ5r5Qb1QjWDHri0SbllP
	zbk4QIQeprNGAJYyP2HOXeiihpwwEUjCK7Aio6rM67bPrKVYrQKQt1v3TLzGIVgMDsaF
	qRmlcVB9WlIpmWoNAD8h+7/ugY2pyqxfG1s4MjV4bsTBSe29swias0Owj5sEDUZAImst
	9Y/Q==
X-Received: by 10.14.5.72 with SMTP id 48mr85719103eek.19.1366971571029;
	Fri, 26 Apr 2013 03:19:31 -0700 (PDT)
Received: from localhost (ip-62-24-80-145.net.upcbroadband.cz. [62.24.80.145])
	by mx.google.com with ESMTPSA id
	j44sm15147725eeu.10.2013.04.26.03.19.29 for <multiple recipients>
	(version=TLSv1.2 cipher=RC4-SHA bits=128/128);
	Fri, 26 Apr 2013 03:19:30 -0700 (PDT)
Date: Fri, 26 Apr 2013 12:19:50 +0200
From: Martin Jansa <martin.jansa@gmail.com>
To: "Burton, Ross" <ross.burton@intel.com>
Message-ID: <20130426101950.GN5538@jama.dyndns-home.com>
References: <1366963623-13626-1-git-send-email-B40290@freescale.com>
	<517A49FE.5020702@communistcode.co.uk>
	<CAJTo0LZEd0ZDONxj5-_h6e13VYtDbQPTC+ipcj-=wzDavNUCHw@mail.gmail.com>
	<93E5E91C-DB0D-4057-82AE-4F3B97B7367F@dominion.thruhere.net>
	<CAJTo0LbVtc9g_Ch-n_crSX+5c_n2xcjJKcgwsazXi=rAhxKZmA@mail.gmail.com>
MIME-Version: 1.0
In-Reply-To: <CAJTo0LbVtc9g_Ch-n_crSX+5c_n2xcjJKcgwsazXi=rAhxKZmA@mail.gmail.com>
User-Agent: Mutt/1.5.21 (2010-09-15)
Cc: Koen Kooi <koen@dominion.thruhere.net>,
	openembedded-core@lists.openembedded.org
Subject: Re: [PATCH] connman: tist of connman do not support powerpc64
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
X-List-Received-Date: Fri, 26 Apr 2013 10:37:28 -0000
X-Groupsio-MsgNum: 38438
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="McpcKDxJRrEJVmOH"
Content-Disposition: inline

--McpcKDxJRrEJVmOH
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Fri, Apr 26, 2013 at 11:06:07AM +0100, Burton, Ross wrote:
> On 26 April 2013 10:46, Koen Kooi <koen@dominion.thruhere.net> wrote:
> > Making connman machine specific which means PRSERV will go insane.
>=20
> Why would this cause prserv to go insane?  The only things build-time
> depending on connman should be images so I don't see how it will cause
> crazy rebuilds, so I must be missing something.

I think it was meant as making it machine specific without changing it
to MACHINE_ARCH.

And I would rather build unused (on my MACHINEs) tist, then build it for
each MACHINE.

Using PACKAGECONFIG and enabling it by DISTRO_FEATURES or based on arch
is fine.

--=20
Martin 'JaMa' Jansa     jabber: Martin.Jansa@gmail.com

--McpcKDxJRrEJVmOH
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: Digital signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v2.0.19 (GNU/Linux)

iEYEARECAAYFAlF6VMYACgkQN1Ujt2V2gBw7MACfbl5Cj9LHVLTTmPQCr7xcEvLf
S5EAoJHzxheXI/rSKsQhNDOvN2BcR3cR
=eZn5
-----END PGP SIGNATURE-----

--McpcKDxJRrEJVmOH--
