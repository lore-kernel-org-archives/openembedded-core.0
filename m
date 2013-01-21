Received: from mo3.mail-out.ovh.net ([178.32.228.3])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <eric@eukrea.com>) id 1TxCyj-0003d0-Dq
	for openembedded-core@lists.openembedded.org;
	Mon, 21 Jan 2013 09:44:07 +0100
Received: from mail176.ha.ovh.net (b6.ovh.net [213.186.33.56])
	by mo3.mail-out.ovh.net (Postfix) with SMTP id 567D4FF8E31
	for <openembedded-core@lists.openembedded.org>;
	Mon, 21 Jan 2013 09:33:27 +0100 (CET)
Received: from b0.ovh.net (HELO queueout) (213.186.33.50)
	by b0.ovh.net with SMTP; 21 Jan 2013 10:19:43 +0200
Received: from pac33-2-82-240-38-71.fbx.proxad.net (HELO e6520eb)
	(eric%eukrea.com@82.240.38.71)
	by ns0.ovh.net with SMTP; 21 Jan 2013 10:19:43 +0200
Date: Mon, 21 Jan 2013 09:19:42 +0100
From: Eric =?UTF-8?B?QsOpbmFyZA==?= <eric@eukrea.com>
To: "Burton, Ross" <ross.burton@intel.com>
X-Ovh-Mailout: 178.32.228.3 (mo3.mail-out.ovh.net)
Message-ID: <20130121091942.5a6c5a82@e6520eb>
In-Reply-To: <CAJTo0LYU0-1EEZfE8LdTDSmGmgprHbmZ-g00O-8+Qv1MmcaQTg@mail.gmail.com>
References: <cover.1358635193.git.ross.burton@intel.com>
	<50FC3899.5000202@linux.intel.com>
	<50FCBCB7.8060201@linux.intel.com>
	<CAJTo0LYU0-1EEZfE8LdTDSmGmgprHbmZ-g00O-8+Qv1MmcaQTg@mail.gmail.com>
Organization: =?UTF-8?B?RXVrcsOpYQ==?= Electromatique
X-Mailer: Claws Mail 3.9.0 (GTK+ 2.24.13; x86_64-redhat-linux-gnu)
Mime-Version: 1.0
X-Ovh-Tracer-Id: 18023124234623298873
X-Ovh-Remote: 82.240.38.71 (pac33-2-82-240-38-71.fbx.proxad.net)
X-Ovh-Local: 213.186.33.20 (ns0.ovh.net)
X-OVH-SPAMSTATE: OK
X-OVH-SPAMSCORE: -100
X-OVH-SPAMCAUSE: gggruggvucftvghtrhhoucdtuddrfeehledrieelucetufdoteggodetrfcurfhrohhfihhlvgemucfqggfjnecuuegrihhlohhuthemuceftddtnecusecvtfgvtghiphhivghnthhsucdlqddutddtmd
X-Spam-Check: DONE|U 0.5/N
X-VR-SPAMSTATE: OK
X-VR-SPAMSCORE: -100
X-VR-SPAMCAUSE: gggruggvucftvghtrhhoucdtuddrfeehledrieelucetufdoteggodetrfcurfhrohhfihhlvgemucfqggfjnecuuegrihhlohhuthemuceftddtnecusecvtfgvtghiphhivghnthhsucdlqddutddtmd
Cc: openembedded-core@lists.openembedded.org
Subject: Re: [PATCH 00/10] Initial systemd integration
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
X-List-Received-Date: Mon, 21 Jan 2013 08:44:09 -0000
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

Hi Ross,

Le Mon, 21 Jan 2013 08:08:32 +0000,
"Burton, Ross" <ross.burton@intel.com> a =C3=A9crit :

> The autobuilder hit this last night:
>=20
> ERROR: Multiple .bb files are due to be built which each provide udev
> (/srv/home/pokybuild/yocto-autobuilder/yocto-slave/nightly-world/build/me=
ta/recipes-core/udev/udev_182.bb
> /srv/home/pokybuild/yocto-autobuilder/yocto-slave/nightly-world/build/met=
a/recipes-core/systemd/systemd_196.bb).
>=20
> Which I realised would happen not long after hitting send.   I'll sort th=
is too.
>=20
we had the same problem in meta-oe's denzil branch.

The workaround is here :
http://patches.openembedded.org/patch/41669/
http://patches.openembedded.org/patch/41667/
http://patches.openembedded.org/patch/41671/

What should work in OE-Core when using systemd is :
PREFERRED_PROVIDER_udev =3D "systemd"

Eric


