Received: from mail-ww0-f43.google.com ([74.125.82.43])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <koen@dominion.thruhere.net>) id 1QcHXf-0001cR-Sa
	for openembedded-core@lists.openembedded.org;
	Thu, 30 Jun 2011 15:44:27 +0200
Received: by wwi18 with SMTP id 18so1928064wwi.24
	for <openembedded-core@lists.openembedded.org>;
	Thu, 30 Jun 2011 06:40:44 -0700 (PDT)
Received: by 10.216.69.77 with SMTP id m55mr1811397wed.11.1309441244093;
	Thu, 30 Jun 2011 06:40:44 -0700 (PDT)
Received: from [172.20.0.96] (ip545070eb.adsl-surfen.hetnet.nl [84.80.112.235])
	by mx.google.com with ESMTPS id b70sm1145839wek.20.2011.06.30.06.40.42
	(version=TLSv1/SSLv3 cipher=OTHER);
	Thu, 30 Jun 2011 06:40:42 -0700 (PDT)
Mime-Version: 1.0 (Apple Message framework v1084)
From: Koen Kooi <koen@dominion.thruhere.net>
In-Reply-To: <1309439074.2551.135.camel@phil-desktop>
Date: Thu, 30 Jun 2011 15:40:36 +0200
Message-Id: <D8CC6DE0-FC4D-443A-8155-B06E8FF03FD6@dominion.thruhere.net>
References: <1309275023-2626-1-git-send-email-koen@dominion.thruhere.net>
	<1309277475.20015.320.camel@rex>
	<AE12D97B-A9AF-4516-93D2-7A5655B46844@dominion.thruhere.net>
	<1309354589.2551.40.camel@phil-desktop>
	<1309355375.20015.383.camel@rex>
	<1309432642.2551.131.camel@phil-desktop>
	<BF22A833-DD0C-41FB-B9AF-CB871B8A1E7A@dominion.thruhere.net>
	<1309439074.2551.135.camel@phil-desktop>
To: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
X-Mailer: Apple Mail (2.1084)
Subject: Re: [PATCH] eglibc-locale: fix localedef packaging
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
X-List-Received-Date: Thu, 30 Jun 2011 13:44:28 -0000
Content-Type: text/plain; charset=us-ascii
Content-Transfer-Encoding: quoted-printable


Op 30 jun 2011, om 15:04 heeft Phil Blundell het volgende geschreven:

> On Thu, 2011-06-30 at 13:24 +0200, Koen Kooi wrote:
>> Does it whitelist recipes that inherit task.bbclass? I have tasks =
used for beagleboard workshops that drag in the native toolchain and =
headers for the things we need to build against (e.g. opencv, qt).
>=20
> No.  The existing logic for -dbg packages, which I just reused for =
this
> case, does:
>=20
>    if not "-dbg" in pkg and not "task-" in pkg and not "-image" in =
pkg:
>=20
> but it doesn't have a check for inheritance as such.  If you can =
suggest
> a good way to identify recipes that have inherited task then I'd be
> happy to adjust the patch accordingly.

The current logic seems to do what I want, but I remember something =
about being able to do 'if inherits(task)', but that was about 5 years =
:)=


