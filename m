Received: from mail-gy0-f175.google.com ([209.85.160.175])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <koen@dominion.thruhere.net>) id 1RDJCq-0004Lp-DZ
	for openembedded-core@lists.openembedded.org;
	Mon, 10 Oct 2011 19:00:00 +0200
Received: by gyg8 with SMTP id 8so5612489gyg.6
	for <openembedded-core@lists.openembedded.org>;
	Mon, 10 Oct 2011 09:54:15 -0700 (PDT)
Received: by 10.223.4.132 with SMTP id 4mr33277233far.12.1318265655200;
	Mon, 10 Oct 2011 09:54:15 -0700 (PDT)
Received: from [172.20.0.96] (ip545070eb.adsl-surfen.hetnet.nl.
	[84.80.112.235])
	by mx.google.com with ESMTPS id r16sm1490516fam.8.2011.10.10.09.54.14
	(version=TLSv1/SSLv3 cipher=OTHER);
	Mon, 10 Oct 2011 09:54:14 -0700 (PDT)
From: Koen Kooi <koen@dominion.thruhere.net>
Date: Mon, 10 Oct 2011 18:54:08 +0200
Message-Id: <5313791D-358D-4280-967E-8F622071C091@dominion.thruhere.net>
To: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Mime-Version: 1.0 (Apple Message framework v1244.3)
X-Mailer: Apple Mail (2.1244.3)
Subject: PREFERRED_PROVIDER weirdness with libltdl-dev
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
X-List-Received-Date: Mon, 10 Oct 2011 17:00:00 -0000
Content-Type: text/plain; charset=us-ascii
Content-Transfer-Encoding: quoted-printable

Hi,

I'm trying to build a toolchain that work on my target and I'm running =
into this:

NOTE: multiple providers are available for runtime libltdl-dev =
(libtool-nativesdk, libtool)
NOTE: consider defining a PREFERRED_PROVIDER entry to match libltdl-dev

So I added that do angstrom:

koen@dominion:/OE/tentacle/sources/meta-angstrom$ git grep libltdl
=
conf/distro/include/angstrom-core-tweaks.inc:PREFERRED_PROVIDER_libltdl-de=
v =3D "libtool"

But the warning remains:

koen@dominion:/OE/tentacle/sources/openembedded-core/meta$ =
MACHINE=3Dbeagleboard bitbake -e task-sdk-target | grep =
PREFERRED_PROVIDER | grep ltdl
NOTE: consider defining a PREFERRED_PROVIDER entry to match libltdl-dev
# PREFERRED_PROVIDER_libltdl-dev=3Dlibtool
PREFERRED_PROVIDER_libltdl-dev=3D"libtool"

And it keeps trying to build -sdk stuff

regards,

Koen=


