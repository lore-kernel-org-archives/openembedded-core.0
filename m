Received: from mga01.intel.com ([192.55.52.88])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <paul.eggleton@linux.intel.com>) id 1S0anS-0003bR-E9
	for openembedded-core@lists.openembedded.org;
	Thu, 23 Feb 2012 16:41:30 +0100
Received: from fmsmga002.fm.intel.com ([10.253.24.26])
	by fmsmga101.fm.intel.com with ESMTP; 23 Feb 2012 07:32:49 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.71,315,1320652800"; d="scan'208";a="128644935"
Received: from unknown (HELO helios.localnet) ([10.252.123.61])
	by fmsmga002.fm.intel.com with ESMTP; 23 Feb 2012 07:32:48 -0800
From: Paul Eggleton <paul.eggleton@linux.intel.com>
To: openembedded-core@lists.openembedded.org
Date: Thu, 23 Feb 2012 15:32:47 +0000
Message-ID: <2217377.xs2ypPJBB4@helios>
Organization: Intel Corporation
User-Agent: KMail/4.8.0 (Linux/3.0.0-16-generic-pae; KDE/4.8.0; i686; ; )
In-Reply-To: <20120223163032.0822e104@eb-e6520>
References: <CAMvUbCwy5UL3YWXS=2SkeKff2WDQE9EX7-CGUv9s5SH+9uSK1g@mail.gmail.com>
	<1329828974.15011.7.camel@ted> <20120223163032.0822e104@eb-e6520>
MIME-Version: 1.0
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
X-List-Received-Date: Thu, 23 Feb 2012 15:41:30 -0000
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset="iso-8859-1"

On Thursday 23 February 2012 16:30:32 Eric B=E9nard wrote:
> Richard Purdie <richard.purdie@linuxfoundation.org> a =E9crit :
> > What was the output? (I realise I can find out)
> >=20
> > With usability issues like this, opening a bug in
> > bugzilla.yoctoproject.org is a good idea, particularly as we've bee=
n
> > focusing on cleaning up this kind of problem. Reporting them with a=

> > known reproducible test case helps a lot as when you're looking to =
try
> > and fix these things, you need a good set of reproducers.
> >=20
> > As a quick plug for the work that's been done already, we've now wo=
rked
> > through many of the issues that were reported so it is worth taking=
 the
> > time to report them! :)
>=20
> I had also a bitbake failure after an error in an image and bitbake
> exited without any information concerning the error (even when runnin=
g
> with -DDD I didn't managed to see a log - but I must admit I didn't
> search in the whole history).
>=20
> Basically I had :
> XSERVER +=3D "    <=3D=3D=3D=3D missing \
> =09xf86-input-tslib \
> =09"
> and bitbake exit with :
> ERROR: Command execution failed: Exited with 1
> et nothing more.

This got broken last night and fixed last night, so if you update you s=
hould=20
have the fix.

Cheers,
Paul

--=20

Paul Eggleton
Intel Open Source Technology Centre


