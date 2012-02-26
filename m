Received: from 93-97-173-237.zone5.bethere.co.uk ([93.97.173.237]
	helo=tim.rpsys.net) by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <richard.purdie@linuxfoundation.org>)
	id 1S1dKC-0003mm-DA for openembedded-core@lists.openembedded.org;
	Sun, 26 Feb 2012 13:35:36 +0100
Received: from localhost (localhost [127.0.0.1])
	by tim.rpsys.net (8.13.6/8.13.8) with ESMTP id q1QCRBuq012782
	for <openembedded-core@lists.openembedded.org>;
	Sun, 26 Feb 2012 12:27:11 GMT
Received: from tim.rpsys.net ([127.0.0.1])
	by localhost (tim.rpsys.net [127.0.0.1]) (amavisd-new,
	port 10024) with LMTP
	id 12449-03 for <openembedded-core@lists.openembedded.org>;
	Sun, 26 Feb 2012 12:27:05 +0000 (GMT)
Received: from [192.168.3.10] ([192.168.3.10]) (authenticated bits=0)
	by tim.rpsys.net (8.13.6/8.13.8) with ESMTP id q1QCR2WO012774
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-SHA bits=256 verify=NO)
	for <openembedded-core@lists.openembedded.org>;
	Sun, 26 Feb 2012 12:27:03 GMT
Message-ID: <1330259224.31855.1.camel@ted>
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Date: Sun, 26 Feb 2012 12:27:04 +0000
In-Reply-To: <20120223163032.0822e104@eb-e6520>
References: <CAMvUbCwy5UL3YWXS=2SkeKff2WDQE9EX7-CGUv9s5SH+9uSK1g@mail.gmail.com>
	<1329828974.15011.7.camel@ted> <20120223163032.0822e104@eb-e6520>
X-Mailer: Evolution 3.2.2- 
Mime-Version: 1.0
X-Virus-Scanned: amavisd-new at rpsys.net
X-MIME-Autoconverted: from 8bit to quoted-printable by tim.rpsys.net id
	q1QCRBuq012782
Subject: Re: bitbake parsing of IMAGE_INSTALL += # tslib mtd-utils" extremely user unfriendly.
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
X-List-Received-Date: Sun, 26 Feb 2012 12:35:36 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Thu, 2012-02-23 at 16:30 +0100, Eric B=C3=A9nard wrote:
> Hi Richard,
>=20
> Le Tue, 21 Feb 2012 12:56:14 +0000,
> Richard Purdie <richard.purdie@linuxfoundation.org> a =C3=A9crit :
> >=20
> > What was the output? (I realise I can find out)
> >=20
> > With usability issues like this, opening a bug in
> > bugzilla.yoctoproject.org is a good idea, particularly as we've been
> > focusing on cleaning up this kind of problem. Reporting them with a
> > known reproducible test case helps a lot as when you're looking to tr=
y
> > and fix these things, you need a good set of reproducers.=20
> >=20
> > As a quick plug for the work that's been done already, we've now work=
ed
> > through many of the issues that were reported so it is worth taking t=
he
> > time to report them! :)
> >=20
> I had also a bitbake failure after an error in an image and bitbake
> exited without any information concerning the error (even when running
> with -DDD I didn't managed to see a log - but I must admit I didn't
> search in the whole history).
>=20
> Basically I had :
> XSERVER +=3D "    <=3D=3D=3D=3D missing \
> 	xf86-input-tslib \
> 	"
> and bitbake exit with :
> ERROR: Command execution failed: Exited with 1
> et nothing more.

This think this one has been fixed now. Leon's original error is more
problematic though...

Cheers,

Richard



