Received: from 93-97-173-237.zone5.bethere.co.uk ([93.97.173.237]
	helo=tim.rpsys.net) by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <richard.purdie@linuxfoundation.org>)
	id 1QcmNg-0008KE-2V for openembedded-core@lists.openembedded.org;
	Sat, 02 Jul 2011 00:40:12 +0200
Received: from localhost (localhost [127.0.0.1])
	by tim.rpsys.net (8.13.6/8.13.8) with ESMTP id p61MaOGZ021825;
	Fri, 1 Jul 2011 23:36:24 +0100
Received: from tim.rpsys.net ([127.0.0.1])
	by localhost (tim.rpsys.net [127.0.0.1]) (amavisd-new,
	port 10024) with LMTP
	id 21610-06; Fri,  1 Jul 2011 23:36:20 +0100 (BST)
Received: from [192.168.3.10] ([192.168.3.10]) (authenticated bits=0)
	by tim.rpsys.net (8.13.6/8.13.8) with ESMTP id p61MaGNh021819
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-SHA bits=256 verify=NO);
	Fri, 1 Jul 2011 23:36:16 +0100
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
In-Reply-To: <cover.1309525642.git.anders@chargestorm.se>
References: <cover.1309525642.git.anders@chargestorm.se>
Date: Fri, 01 Jul 2011 23:35:54 +0100
Message-ID: <1309559754.20015.567.camel@rex>
Mime-Version: 1.0
X-Mailer: Evolution 2.32.2 
X-Virus-Scanned: amavisd-new at rpsys.net
X-MIME-Autoconverted: from 8bit to quoted-printable by tim.rpsys.net id
	p61MaOGZ021825
Cc: Anders Darander <anders@chargestorm.se>
Subject: Re: [PATCH v5 0/8] Linux 3.0 build support
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
X-List-Received-Date: Fri, 01 Jul 2011 22:40:12 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Fri, 2011-07-01 at 15:07 +0200, Anders Darander wrote:
> v5: - task-base.bb: Move the RDEPENDS- and RRECOMMENDS_task-base-kernel=
26
>       to *_task-base.
>=20
> v4: Removed the RFC in patch subject.
>     - Merge the patches 2 and 4 from v3.=20
>     - Bump PR in patch 2.
>     - Delete the ignore*.patch from module-init-tools. In v2, the=20
>       patch was just disabled.
>=20
> v3: - task-base.bb: fix a problem that *pcmia26 couldn't be found.
>=20
> v2: Probably some more patches could be squashed together. There might =
also
>     be more places that should be addressed in these patches.
>=20
>     - Whitespace fixes
>     - Updated module-init-tools to 3.16. I'm not applying the ignore*.p=
atch
>     (it didn't apply).
>     - Do not provide virtual/*/depmod-2.6; just provide virtual/*/depmo=
d.
>     - Do only install as depmod.
>     - Rearrange the order of some patches.
>     - Added patches to clean up (partly) task-base, distro_tracking_fie=
lds.
>=20
>     A few of the patches might be ready to pull, but the majority will =
need
>     to be revised.
>=20
> =3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
> This work is unfinished and incomplete...
> It is published in its current form both to get feedback, but also to a=
id
> anyone else who is working on 3.0-support. If some of the patches are f=
ound to
> be OK, it's fine to cherrypick them.
>=20
> The kernel-related classes has been modified to build a 3.0 kernel. The
> patches has been simplified by removing support for the 2.4-series. (Th=
e
> latter was suggested in an older mail thread:
> http://www.mail-archive.com/openembedded-core@lists.openembedded.org/ms=
g02682.html
> ).
>=20
> The patches has been tested on linux-yocto_2.6.37 and a hacked version =
using
> the linux-yocto-dev repository (using a 3.0-rcX). The latest versions h=
as only
> been built for qemuarm, prior iterations has also been built for qemux8=
6.
>=20
> Finally, no work has been done on the libc-linux-headers classes and re=
cipes.
>=20
> /Anders
>=20
> The following changes since commit 40ecaf6a59ba61e72d29d7e677197ef37c99=
8408:
>=20
>   uclibc: Add default uClibc.machine files (2011-07-01 00:40:10 +0100)
>=20
> are available in the git repository at:
>   git://github.com/darander/oe-core kernel-3.0
>   https://github.com/darander/oe-core/tree/kernel-3.0
>=20
> Anders Darander (8):
>   Remove support for building 2.4 kernels
>   image=C2=A1kernel.bblass module-init-tools: do not use depmod-2.6
>   modules-init-tools(-cross): update to 3.16
>   kernel.bblass: remove get_kernelmajorversion
>   modutils-initscripts: move recipe prior to modutils removal
>   modutils: remove modutils
>   task-base: remove modutils reference.
>   distro_tracking_fields: remove modutils.

Thanks for these, I merged them to master.

Cheers,

Richard



