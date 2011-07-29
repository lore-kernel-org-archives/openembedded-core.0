Received: from mail-ey0-f178.google.com ([209.85.215.178])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <koen@dominion.thruhere.net>) id 1QmiPF-0004GN-Ic
	for openembedded-core@lists.openembedded.org;
	Fri, 29 Jul 2011 10:26:53 +0200
Received: by eye4 with SMTP id 4so4378313eye.37
	for <openembedded-core@lists.openembedded.org>;
	Fri, 29 Jul 2011 01:22:37 -0700 (PDT)
Received: by 10.213.20.84 with SMTP id e20mr757704ebb.85.1311927756464;
	Fri, 29 Jul 2011 01:22:36 -0700 (PDT)
Received: from [172.20.1.19] (ip5451781a.direct-adsl.nl [84.81.120.26])
	by mx.google.com with ESMTPS id d44sm777865eeb.22.2011.07.29.01.22.34
	(version=TLSv1/SSLv3 cipher=OTHER);
	Fri, 29 Jul 2011 01:22:35 -0700 (PDT)
References: <cover.1311683981.git.richard.purdie@linuxfoundation.org>
	<346abefc87d21d0cc111ef87a6e48f40c5b6cb0b.1311683981.git.richard.purdie@linuxfoundation.org>
	<4E324C2D.2070201@gmail.com>
	<1311924350.3141.8.camel@lenovo.internal.reciva.com>
In-Reply-To: <1311924350.3141.8.camel@lenovo.internal.reciva.com>
Mime-Version: 1.0 (iPhone Mail 8L1)
Message-Id: <198F4439-AE37-45A4-BB31-55854B6EA68F@dominion.thruhere.net>
Cc: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
X-Mailer: iPhone Mail (8L1)
From: Koen Kooi <koen@dominion.thruhere.net>
Date: Fri, 29 Jul 2011 10:22:29 +0200
To: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH 1/3] Add ARM tune file overhaul based largely on work from Mark Hatle
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
X-List-Received-Date: Fri, 29 Jul 2011 08:26:53 -0000
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain;
	charset=us-ascii



Op 29 jul. 2011 om 09:25 heeft Phil Blundell <philb@gnu.org> het volgende ge=
schreven:

> On Thu, 2011-07-28 at 22:59 -0700, Khem Raj wrote:
>> here I guess we have to say AVAILTUNES +=3D "arm920t arm920"
>> where arm920 is arm mode and 920t is thumb mode. but anyway I would=20
>> prefer that thumb is optionally added provided user asked for it
>> through DISTRO/MACHINE features then we should first make sure
>> that selected machine has thumb feature and if yes for both then we=20
>> should enable -mthumb compiler option which now it enable when thumb=20
>> appears in TUNE_FEATURES
>=20
> I don't think we want to go down the road of inventing CPU names for
> ARM-state variants of Thumb-capable cores.  (In other words, we
> shouldn't start putting things like "arm920" in AVAILTUNES when there
> isn't actually a core named arm920.)
>=20
> Fundamentally I think you're right that the choice between ARM-state and
> Thumb-state (for t1 at least) ought to be under the control of the
> DISTRO and not selected purely on the basis of the hardware
> capabilities.  For t2 it is a bit less of a clear-cut issue but, if
> there are genuinely people making ARMv7 cores with the Thumb decoder
> removed, I guess we need to have that same switch there as well

Another issue is silicon bugs on early a8 revisions, but gcc and linux might=
 have enough workarounds nowadays




>=20
> p.
>=20
>=20
>=20
> _______________________________________________
> Openembedded-core mailing list
> Openembedded-core@lists.openembedded.org
> http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-core


