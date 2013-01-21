Received: from 93-97-173-237.zone5.bethere.co.uk ([93.97.173.237]
	helo=tim.rpsys.net) by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <richard.purdie@linuxfoundation.org>)
	id 1TxEge-0008Ea-Qr for openembedded-core@lists.openembedded.org;
	Mon, 21 Jan 2013 11:33:13 +0100
Received: from localhost (localhost [127.0.0.1])
	by tim.rpsys.net (8.13.6/8.13.8) with ESMTP id r0LAF6cW015552;
	Mon, 21 Jan 2013 10:15:06 GMT
Received: from tim.rpsys.net ([127.0.0.1])
	by localhost (tim.rpsys.net [127.0.0.1]) (amavisd-new,
	port 10024) with LMTP
	id 04712-07; Mon, 21 Jan 2013 10:15:02 +0000 (GMT)
Received: from [192.168.3.10] ([192.168.3.10]) (authenticated bits=0)
	by tim.rpsys.net (8.13.6/8.13.8) with ESMTP id r0LAEuXt015538
	(version=TLSv1/SSLv3 cipher=AES256-SHA bits=256 verify=NO);
	Mon, 21 Jan 2013 10:14:57 GMT
Message-ID: <1358763296.14265.43.camel@ted>
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: Eric =?ISO-8859-1?Q?B=E9nard?= <eric@eukrea.com>
Date: Mon, 21 Jan 2013 10:14:56 +0000
In-Reply-To: <20130121091942.5a6c5a82@e6520eb>
References: <cover.1358635193.git.ross.burton@intel.com>
	<50FC3899.5000202@linux.intel.com> <50FCBCB7.8060201@linux.intel.com>
	<CAJTo0LYU0-1EEZfE8LdTDSmGmgprHbmZ-g00O-8+Qv1MmcaQTg@mail.gmail.com>
	<20130121091942.5a6c5a82@e6520eb>
X-Mailer: Evolution 3.2.3-0ubuntu6 
Mime-Version: 1.0
X-Virus-Scanned: amavisd-new at rpsys.net
X-MIME-Autoconverted: from 8bit to quoted-printable by tim.rpsys.net id
	r0LAF6cW015552
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
X-List-Received-Date: Mon, 21 Jan 2013 10:33:16 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Mon, 2013-01-21 at 09:19 +0100, Eric B=C3=A9nard wrote:
> Hi Ross,
>=20
> Le Mon, 21 Jan 2013 08:08:32 +0000,
> "Burton, Ross" <ross.burton@intel.com> a =C3=A9crit :
>=20
> > The autobuilder hit this last night:
> >=20
> > ERROR: Multiple .bb files are due to be built which each provide udev
> > (/srv/home/pokybuild/yocto-autobuilder/yocto-slave/nightly-world/buil=
d/meta/recipes-core/udev/udev_182.bb
> > /srv/home/pokybuild/yocto-autobuilder/yocto-slave/nightly-world/build=
/meta/recipes-core/systemd/systemd_196.bb).
> >=20
> > Which I realised would happen not long after hitting send.   I'll sor=
t this too.
> >=20
> we had the same problem in meta-oe's denzil branch.
>=20
> The workaround is here :
> http://patches.openembedded.org/patch/41669/
> http://patches.openembedded.org/patch/41667/
> http://patches.openembedded.org/patch/41671/
>=20
> What should work in OE-Core when using systemd is :
> PREFERRED_PROVIDER_udev =3D "systemd"

This isn't enough to prevent warnings for "bitbake world". We need to
detect which is enabled and then SkipPackage in the one that isn't
needed, or at least exclude it from the world build.

Cheers,

Richard



