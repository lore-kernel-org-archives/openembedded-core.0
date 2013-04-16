Received: from mail-da0-f54.google.com ([209.85.210.54])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <martin.jansa@gmail.com>) id 1USDtj-000134-RV
	for openembedded-core@lists.openembedded.org;
	Tue, 16 Apr 2013 23:58:46 +0200
Received: by mail-da0-f54.google.com with SMTP id p1so433247dad.41
	for <openembedded-core@lists.openembedded.org>;
	Tue, 16 Apr 2013 14:41:12 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=x-received:date:from:to:cc:subject:message-id:references
	:mime-version:content-type:content-disposition:in-reply-to
	:user-agent; bh=ojJt0egjP3qOfogUtg2g7kLCaXCOBiEVU1x58cedw00=;
	b=ohCbRvDkwmOKD5Il3bTZ6Q6a4io8NvvdF+M02XCIp8SWXS37KjNsyBi4xNxQky9ZED
	Ly7XyYjPKroL8MFoHGmsGDsuMF03djac5R63yC5IPQtHLGkHqHalHA5XsDqfOIAgTFxl
	I+F+sGqPv5uUHT1idXI+zBE5pOBMatnZoboDRCN3oiBIfsxqADIWAdiIj8HFxSz8srTT
	ktWMV4lS3yz6jlAe8LCTzuIHXsh5PGabGU+QCx3HsoMqVUgI4edewFdsQ9KSC8iomn5W
	upywKjUIyBpT9PautipTKtDe2XkCP3rbZLdTmrrSVAFrywkOKfFC7EV4TySdp1VPqozu
	OGyg==
X-Received: by 10.66.81.2 with SMTP id v2mr5296976pax.204.1366148471929;
	Tue, 16 Apr 2013 14:41:11 -0700 (PDT)
Received: from localhost (ip-62-24-80-7.net.upcbroadband.cz. [62.24.80.7])
	by mx.google.com with ESMTPS id lo7sm4120953pab.19.2013.04.16.14.41.08
	(version=TLSv1.2 cipher=RC4-SHA bits=128/128);
	Tue, 16 Apr 2013 14:41:10 -0700 (PDT)
Date: Tue, 16 Apr 2013 23:41:08 +0200
From: Martin Jansa <martin.jansa@gmail.com>
To: Richard Purdie <richard.purdie@linuxfoundation.org>
Message-ID: <20130416214108.GD29302@jama.dyndns-home.com>
References: <cover.1365797632.git.paul.eggleton@linux.intel.com>
	<30edf2f0744b6ce209455d2c5c63015e06f09265.1365797632.git.paul.eggleton@linux.intel.com>
	<20130412211005.GY2477@jama> <1365802242.16702.71.camel@ted>
	<20130416170909.GR10628@jama.dyndns-home.com>
	<1366146366.8670.102.camel@ted>
MIME-Version: 1.0
In-Reply-To: <1366146366.8670.102.camel@ted>
User-Agent: Mutt/1.5.21 (2010-09-15)
Cc: Paul Eggleton <paul.eggleton@linux.intel.com>,
	openembedded-core@lists.openembedded.org
Subject: Re: [PATCH 1/1] classes/sanity: fix handling of bblayers.conf updating
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
X-List-Received-Date: Tue, 16 Apr 2013 21:59:12 -0000
X-Groupsio-MsgNum: 38037
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="ILuaRSyQpoVaJ1HG"
Content-Disposition: inline

--ILuaRSyQpoVaJ1HG
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Tue, Apr 16, 2013 at 10:06:06PM +0100, Richard Purdie wrote:
> On Tue, 2013-04-16 at 19:09 +0200, Martin Jansa wrote:
> > OK, so it's different than hangs I'm seeing here, because I'm still see=
ing them with latest oe-core
>=20
> Yes, that was almost certainly a different issue.
>=20
> > $ . ./oe-init-bitbake-build-env && bitbake my-image
> > Altered environment for machine@distro development (this is from oe-ini=
t-bitbake-build-env)
> > # and nothing else is shown after that
>=20
> So just to ensure I understand this, it never prints any messages at
> all?

yes nothing at all from bitbake, only that echo from setup script
(oe-init-bitbake-build-env)

> > ps auxf (shortened paths and ascii tree)
> >=20
> > bitbake  17625  0.0  0.0   4396   612 pts/18   S+   18:31   0:00  \_ /b=
in/sh -c . ./oe-init-bitbake-build-env && bitbake  my-image
> > bitbake  17626  0.0  0.0   4396   700 pts/18   S+   18:31   0:00     \_=
 /bin/sh /OE/build/oe-core/scripts/bitbake my-image
> > bitbake  17656  0.2  1.0 219356 168120 pts/18  S+   18:31   0:02       =
 \_ python /OE/build/bitbake/bin/bitbake my-image
> > bitbake  18504  0.0  1.0 289044 166556 pts/18  Sl+  18:31   0:00       =
    \_ python /OE/build/bitbake/bin/bitbake my-image
> >=20
> > Not sure if there is better way to see what's going on in those python =
processes, here is strace:
> >=20
> > # strace -p 17656
> > Process 17656 attached
> > wait4(18504,=20
> >=20
> > # strace -p 18504
> > Process 18504 attached
> > recvfrom(12,=20
> >=20
> > Hitting Ctrl+C with strace still running:
> > # strace -p 17656
> > Process 17656 attached
> > wait4(18504, 0x7fffd2abdf80, 0, NULL)   =3D ? ERESTARTSYS (To be restar=
ted if SA_RESTART is set)
> > --- SIGINT {si_signo=3DSIGINT, si_code=3DSI_KERNEL, si_value=3D{int=3D1=
2337, ptr=3D0x3031}} ---
> > wait4(18504,
> >=20
> > Process 18504 attached
> > recvfrom(12, 0xb773684, 8192, 0, 0, 0)  =3D ? ERESTARTSYS (To be restar=
ted if SA_RESTART is set)
> > --- SIGINT {si_signo=3DSIGINT, si_code=3DSI_KERNEL, si_value=3D{int=3D1=
2337, ptr=3D0x3031}} ---
> > rt_sigreturn()                          =3D -1 EINTR (Interrupted syste=
m call)
> > futex(0xb16e5a0, FUTEX_WAIT_PRIVATE, 0, NULL
> >=20
> > More Ctrl+C only repeats it in both processes but bitbake does not quit
> >=20
> > One more python process is created and disowned by parent and becames c=
hild of init and dies later
> > bitbake  18524  0.0  1.0 289044 165128 ?       S    18:31   0:00 python=
 /OE/build/bitbake/bin/bitbake my-image
> > but bitbake is still hanging until I send kill 18504 from another termi=
nal
> >=20
> > Process 18504:
> > futex(0xb16e5a0, FUTEX_WAIT_PRIVATE, 0, NULL) =3D ? ERESTARTSYS (To be =
restarted if SA_RESTART is set)
> > --- SIGINT {si_signo=3DSIGINT, si_code=3DSI_KERNEL, si_value=3D{int=3D1=
2337, ptr=3D0x3031}} ---
> > rt_sigreturn()                          =3D -1 EINTR (Interrupted syste=
m call)
> > futex(0xb16e5a0, FUTEX_WAIT_PRIVATE, 0, NULL) =3D ? ERESTARTSYS (To be =
restarted if SA_RESTART is set)
> > --- SIGTERM {si_signo=3DSIGTERM, si_code=3DSI_USER, si_pid=3D23837, si_=
uid=3D1026} ---
> > +++ killed by SIGTERM +++
> >=20
> > Process 17656: (iirc you said that python-logging module is not safe wi=
th multiple processes and it looks like logging something)
> > # strace -p 17656
> > Process 17656 attached
> > wait4(18504, 0x7fffd2abdf80, 0, NULL)   =3D ? ERESTARTSYS (To be restar=
ted if SA_RESTART is set)
> > --- SIGINT {si_signo=3DSIGINT, si_code=3DSI_KERNEL, si_value=3D{int=3D1=
2337, ptr=3D0x3031}} ---
> > wait4(18504, 0x7fffd2abdf80, 0, NULL)   =3D ? ERESTARTSYS (To be restar=
ted if SA_RESTART is set)
> > --- SIGINT {si_signo=3DSIGINT, si_code=3DSI_KERNEL, si_value=3D{int=3D1=
2337, ptr=3D0x3031}} ---
> >=20
> > read(4, "\200\2clogging\nLogRecord\nq\1)\201q\2}q\3(U"..., 554) =3D 554
> > select(5, [4], NULL, NULL, {0, 0})      =3D 1 (in [4], left {0, 0})
> > read(4, "\0\0\2\34", 4)                 =3D 4
>=20
> These look like pickled python LogRecord objects being passed between
> the processes. If this happens again, pass the -s 8912 option to strace
> (increases the size of the string dumped) and lets see if we can get the
> complete log record. We should be able to unpickle them and get some
> idea what log messages it was passing around at least...

OK will do

> > I'll put this in bug report later, but if you see what other informatio=
n could be useful,
> > I'll add it next time I see bitbake hanging like this (it doesn't happe=
n every time, probably more
> > with machine under higher load).
>=20
> Ideally we need to turn this into a 100% reproducer somehow. Failing
> that, perhaps more of the LogRecord can give us some clue what is going
> on. I'm struggling for other ideas...

I would say it's not depending on metadata, because build works fine if
I kill bitbake and start it again. I've also seen it in very different
layer setups (including different DISTROs and IIRC also with distro-less
oe-core only).

Thinking about it it maybe happens more often when tmp-eglibc is empty,
I'll try couple of builds with tmp-eglibc removed to see if I can
reproduce it faster then every 10th build or so.

--=20
Martin 'JaMa' Jansa     jabber: Martin.Jansa@gmail.com

--ILuaRSyQpoVaJ1HG
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: Digital signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v2.0.19 (GNU/Linux)

iEYEARECAAYFAlFtxXQACgkQN1Ujt2V2gBwPUwCfQKgLD8FcPG6D08dInXoC6df6
DU8AoJjlAm0zYFKnH8o5qYSenjNoI0wK
=YlBH
-----END PGP SIGNATURE-----

--ILuaRSyQpoVaJ1HG--
