Received: from 93-97-173-237.zone5.bethere.co.uk ([93.97.173.237]
	helo=tim.rpsys.net) by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <richard.purdie@linuxfoundation.org>)
	id 1T8qSc-0003zq-Bm for openembedded-core@lists.openembedded.org;
	Tue, 04 Sep 2012 12:34:22 +0200
Received: from localhost (localhost [127.0.0.1])
	by tim.rpsys.net (8.13.6/8.13.8) with ESMTP id q84ALx1b016002;
	Tue, 4 Sep 2012 11:21:59 +0100
Received: from tim.rpsys.net ([127.0.0.1])
	by localhost (tim.rpsys.net [127.0.0.1]) (amavisd-new,
	port 10024) with LMTP
	id 15207-07; Tue,  4 Sep 2012 11:21:55 +0100 (BST)
Received: from [192.168.3.10] ([192.168.3.10]) (authenticated bits=0)
	by tim.rpsys.net (8.13.6/8.13.8) with ESMTP id q84ALoBG015995
	(version=TLSv1/SSLv3 cipher=AES256-SHA bits=256 verify=NO);
	Tue, 4 Sep 2012 11:21:51 +0100
Message-ID: <1346754109.30964.21.camel@ted>
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: Andreas =?ISO-8859-1?Q?M=FCller?= <schnitzeltony@googlemail.com>
Date: Tue, 04 Sep 2012 11:21:49 +0100
In-Reply-To: <CALbNGRRvPK7HZN08-QnyEoC61jyjQ_JRcXrk1+aFacy4RsinZg@mail.gmail.com>
References: <CALbNGRTHoEqc5FBuNDCiOogU+xker62u3ue4paTTvwr3EFfgvA@mail.gmail.com>
	<CALbNGRRvPK7HZN08-QnyEoC61jyjQ_JRcXrk1+aFacy4RsinZg@mail.gmail.com>
X-Mailer: Evolution 3.2.3-0ubuntu6 
Mime-Version: 1.0
X-Virus-Scanned: amavisd-new at rpsys.net
X-MIME-Autoconverted: from 8bit to quoted-printable by tim.rpsys.net id
	q84ALx1b016002
Cc: openembedded-core@lists.openembedded.org
Subject: Re: checksums linux-libc-headers
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
X-List-Received-Date: Tue, 04 Sep 2012 10:34:22 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Tue, 2012-09-04 at 11:45 +0200, Andreas M=C3=BCller wrote:
> On Tue, Sep 4, 2012 at 11:35 AM, Andreas M=C3=BCller
> <schnitzeltony@googlemail.com> wrote:
> > Hi,
> >
> > checksums changed upstream?
> >
> > | File: '/home/andreas/data/Downloads/packets/dl/linux-3.4.3.tar.bz2'
> > has md5 checksum 635c7c2376b9eda4c0ccc67d34205e73 when
> > 3aefa02db55715d627ed23a01667057d was expected
> > | File: '/home/andreas/data/Downloads/packets/dl/linux-3.4.3.tar.bz2'
> > has sha256 checksum
> > 2fbce991cae0c9f1f363ad1386e35c2095c6cce1b43e74ed5a96186578074ae0 when
> > 17f1256daa289dde1a0a587c9753556d37a52770f7c4efcf2666fd4796a6eacc was
> > expected
> > | Your checksums:
> > | SRC_URI[md5sum] =3D "635c7c2376b9eda4c0ccc67d34205e73"
> > | SRC_URI[sha256sum] =3D
> > "2fbce991cae0c9f1f363ad1386e35c2095c6cce1b43e74ed5a96186578074ae0"
> >
> > Andreas
>=20
> Sorry for noise - I tried twice before sending out this email. Seems
> my network is causing this I get every time different checksums and
> unpacking fails.

At least it validates that they *are* useful :)

[I get complaints about them being a pain when upgrading recipes but
this illustrates they do help in some cases]

Cheers,

Richard



