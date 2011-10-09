Received: from mail-bw0-f47.google.com ([209.85.214.47])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <koen@dominion.thruhere.net>) id 1RCyAF-0001LP-1e
	for openembedded-core@lists.openembedded.org;
	Sun, 09 Oct 2011 20:31:55 +0200
Received: by bke11 with SMTP id 11so7598173bke.6
	for <openembedded-core@lists.openembedded.org>;
	Sun, 09 Oct 2011 11:26:15 -0700 (PDT)
Received: by 10.223.76.11 with SMTP id a11mr21634894fak.1.1318184774571;
	Sun, 09 Oct 2011 11:26:14 -0700 (PDT)
Received: from [172.20.0.96] (ip545070eb.adsl-surfen.hetnet.nl.
	[84.80.112.235])
	by mx.google.com with ESMTPS id n12sm26640271fan.9.2011.10.09.11.26.11
	(version=TLSv1/SSLv3 cipher=OTHER);
	Sun, 09 Oct 2011 11:26:12 -0700 (PDT)
Mime-Version: 1.0 (Apple Message framework v1244.3)
From: Koen Kooi <koen@dominion.thruhere.net>
In-Reply-To: <1317146705.26109.215.camel@ted>
Date: Sun, 9 Oct 2011 20:26:06 +0200
Message-Id: <D58EF702-80C1-4DB6-9AAE-8791F23F505F@dominion.thruhere.net>
References: <4E7A573D.8040207@linux.intel.com> <4E81F113.1050706@intel.com>
	<1317146705.26109.215.camel@ted>
To: Richard Purdie <richard.purdie@linuxfoundation.org>,
	Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
X-Mailer: Apple Mail (2.1244.3)
Cc: Darren Hart <darren.hart@intel.com>,
	Paul Eggleton <paul.eggleton@intel.com>, "Wold,
	Saul" <saul.wold@intel.com>, Yocto Project <yocto@yoctoproject.org>
Subject: Re: [yocto] MACHINE_EXTRA_* and MACHINE_ESSENTIAL_* documentation
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
X-List-Received-Date: Sun, 09 Oct 2011 18:31:55 -0000
Content-Type: text/plain; charset=us-ascii
Content-Transfer-Encoding: quoted-printable


Op 27 sep. 2011, om 20:04 heeft Richard Purdie het volgende geschreven:

[..]

> So if you change MACHINE_EXTRA* you need to rebuild task-base, if you
> change MACHINE_ESSENTIAL_EXTRA* you need to rebuild task-core-boot.
> Confusing and the checksum code we'll enable soon should make this
> automatic.
>=20
> The task-core-boot is included into task-base by task-distro-base
> through DISTRO_EXTRA_RDEPENDS which in meta-yocto is set to
> task-core-boot. Both sets of variables should therefore appear in most
> images except minimal and basic which should only get the essential
> ones.
>=20
> I hope that at least clarifies what should happen...

To combat the confusion I did it slightly different in task-basic:

=
https://github.com/openembedded/meta-oe/blob/master/meta-oe/recipes-core/t=
asks/task-basic.bb

Any var besides *_FEATURES you can poke is prefixed with TASK_BASIC:

TASK_BASIC_SSHDAEMON

I would propose that if the EXTRA and ESSENTIAL stuff is only used a =
single recipe that they should be prefixed to give people a better =
chance at finding out what it impacts.

Right now you'd need to call it =
BUMP_PR_OF_TASK_CORE_RECIPE_IF_YOU_CHANGE_ME_MACHINE_ESSENTIAL_*, but =
that's a different discussion :)

regards,

Koen=


