Received: from mail-wy0-f175.google.com ([74.125.82.175])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <koen@dominion.thruhere.net>) id 1QZ0AW-0002DQ-N7
	for openembedded-core@lists.openembedded.org;
	Tue, 21 Jun 2011 14:35:00 +0200
Received: by wyb34 with SMTP id 34so2236015wyb.6
	for <openembedded-core@lists.openembedded.org>;
	Tue, 21 Jun 2011 05:31:27 -0700 (PDT)
Received: by 10.216.202.40 with SMTP id c40mr1346931weo.58.1308659303393;
	Tue, 21 Jun 2011 05:28:23 -0700 (PDT)
Received: from [172.20.0.96] (ip545070eb.adsl-surfen.hetnet.nl [84.80.112.235])
	by mx.google.com with ESMTPS id b50sm820521wed.22.2011.06.21.05.28.22
	(version=TLSv1/SSLv3 cipher=OTHER);
	Tue, 21 Jun 2011 05:28:22 -0700 (PDT)
Mime-Version: 1.0 (Apple Message framework v1084)
From: Koen Kooi <koen@dominion.thruhere.net>
In-Reply-To: <1308658461.20015.24.camel@rex>
Date: Tue, 21 Jun 2011 14:28:19 +0200
Message-Id: <CADFA591-642E-4377-9531-32646B9BE943@dominion.thruhere.net>
References: <1308658461.20015.24.camel@rex>
To: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
X-Mailer: Apple Mail (2.1084)
Subject: Re: Multilib Development Update
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
X-List-Received-Date: Tue, 21 Jun 2011 12:35:00 -0000
Content-Type: text/plain; charset=us-ascii
Content-Transfer-Encoding: quoted-printable


Op 21 jun 2011, om 14:14 heeft Richard Purdie het volgende geschreven:

> We've been experimenting with multilib and I now feel it right to
> discuss the changes a bit further now there is something to discuss =
:).
> The work so far on this is available on the branch:
>=20
> http://git.yoctoproject.org/cgit.cgi/poky-contrib/log/?h=3Drpurdie/ml
>=20
> There have been a few issues and some lessons to learn. I've also have
> to make some implementation decisions based on the issues we were
> running into. To summarise them:

[..]

> g) I set the TARGET_VENDOR to the horrendously ugly string
> "-pokymllib32". The reason is that any "-" characters in there breaks
> config.sub at present and other separators cause other issues. I =
suspect
> we can fix that going forward but for now it works albeit looking
> horrible.

Angstrom has had some problems with that as well and I think DISTROs =
shouldn't poke TARGET_VENDOR directly, but do something like:

bitbake.conf:

# No hyphens!
DISTROVENDOR ??=3D "oecore"
TARGET_VENDOR =3D "-${DISTROVENDOR}"

DISTRO.conf:

# No hyphens!
DISTROVENDOR =3D "foo"

regards,

Koen=


