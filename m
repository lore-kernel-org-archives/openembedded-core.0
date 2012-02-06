Received: from 93-97-173-237.zone5.bethere.co.uk ([93.97.173.237]
	helo=tim.rpsys.net) by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <richard.purdie@linuxfoundation.org>)
	id 1RuL0B-0003mS-EW; Mon, 06 Feb 2012 10:36:48 +0100
Received: from localhost (localhost [127.0.0.1])
	by tim.rpsys.net (8.13.6/8.13.8) with ESMTP id q169Sjt8015434;
	Mon, 6 Feb 2012 09:28:45 GMT
Received: from tim.rpsys.net ([127.0.0.1])
	by localhost (tim.rpsys.net [127.0.0.1]) (amavisd-new,
	port 10024) with LMTP
	id 14404-07; Mon,  6 Feb 2012 09:28:39 +0000 (GMT)
Received: from [192.168.3.10] ([192.168.3.10]) (authenticated bits=0)
	by tim.rpsys.net (8.13.6/8.13.8) with ESMTP id q169SXDX015427
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-SHA bits=256 verify=NO);
	Mon, 6 Feb 2012 09:28:35 GMT
Message-ID: <1328520520.24049.7.camel@ted>
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Date: Mon, 06 Feb 2012 09:28:40 +0000
In-Reply-To: <CALbNGRQ4pvGoiv8DopfhgcujQffqOkPpS2+ON8-ad12GDdfH=w@mail.gmail.com>
References: <CALbNGRSc52k3sqGsh+T93ex2X2+62DCoVq8RB4dk-Ooy-j3qRg@mail.gmail.com>
	<FA3D8228-A311-4588-90C8-0A12F89723AC@dominion.thruhere.net>
	<CALbNGRQ4pvGoiv8DopfhgcujQffqOkPpS2+ON8-ad12GDdfH=w@mail.gmail.com>
X-Mailer: Evolution 3.2.2- 
Mime-Version: 1.0
X-Virus-Scanned: amavisd-new at rpsys.net
X-MIME-Autoconverted: from 8bit to quoted-printable by tim.rpsys.net id
	q169Sjt8015434
Cc: openembedded-devel@lists.openembedded.org
Subject: Re: [oe] Buildhistory, was Re: do rootfs does not create log files
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
X-List-Received-Date: Mon, 06 Feb 2012 09:36:48 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Mon, 2012-02-06 at 10:04 +0100, Andreas M=C3=BCller wrote:
> On Mon, Feb 6, 2012 at 8:46 AM, Koen Kooi <koen@dominion.thruhere.net> =
wrote:
> >
> > Op 5 feb. 2012, om 23:16 heeft Andreas M=C3=BCller het volgende gesch=
reven:
> >
> >> Hi,
> >>
> >> is it a bug or a feature that do_rootfs does not create the package
> >> information (packed_files / packages ..) in a deploy sub-folder did =
I
> >> miss a switch for this?
> >
> > It's this one: http://git.angstrom-distribution.org/cgi-bin/cgit.cgi/=
meta-angstrom/commit/?id=3D370a884b2372b7ddd5f0876119b5f28a2b20074f
> >
> > The matching commit it missing, but you can add something like this t=
o your local.conf:
> >
> > INHERIT +=3D "buildhistory"
> > BUILDHISTORY_COMMIT =3D "1"
> > BUILDHISTORY_DIR =3D "/data/ssd/OE/buildhistory/"
> >
> > That will create a tree that looks like https://github.com/Angstrom-d=
istribution/buildhistory/. It it's missing a feature that you were using =
in testlab, let us know and Paul or I will try to add it to buildhistory.
> >
> > regards,
> >
> > Koen
> Thanks for the info - will give buildhistory a test.
>=20
> Without having experience on buildhistory I have a question: As you
> might know there was a discussion about the order of packages in
> bitbake.conf [1]. I have no idea of the workflow for this issue:
>=20
> 1. Enable buildhistory as said above
> 2. Build from scratch
> 3. change the PACKAGES order in bitbake.conf
> 4. ??
>=20
> If I just rebuild without any PR-bumps I assume buildhistory can do
> nothing for me. Correct?

Do two build from scratch, one with the changed PACKAGES and one
without. Keep the same build history data in both builds. You'll then
see the differences between them recorded.

(Or diff the buildhistory from the two builds).

Cheers,

Richard



