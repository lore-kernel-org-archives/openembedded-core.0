Received: from mail-lpp01m010-f47.google.com ([209.85.215.47])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <raj.khem@gmail.com>) id 1RZRqh-0005r3-Ut
	for openembedded-core@lists.openembedded.org;
	Sat, 10 Dec 2011 19:40:40 +0100
Received: by lahd3 with SMTP id d3so1464119lah.6
	for <openembedded-core@lists.openembedded.org>;
	Sat, 10 Dec 2011 10:33:47 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc:content-type:content-transfer-encoding;
	bh=QUNHXripYOTkBGxkfHYTAYOXOyvfjqIV1f4+P1bkxK4=;
	b=nVKyALqfn/MgtqqmahMQ0RcBvdpxjw7F5zi6AQwj1+irm3KXa463hdXalfHLNtenFg
	r4k1xDxyGh91Ezl75HMy1Zj8vJm+JUO1FThZpmbyAgPTCireCmkKfOgXHE2XqfcqaJBL
	W6nqXng8CDMvPhMtNw8mYgznUVo1Z5Ro+dzBI=
Received: by 10.152.128.103 with SMTP id nn7mr5708217lab.48.1323542016330;
	Sat, 10 Dec 2011 10:33:36 -0800 (PST)
MIME-Version: 1.0
Received: by 10.152.24.36 with HTTP; Sat, 10 Dec 2011 10:33:05 -0800 (PST)
In-Reply-To: <cover.1323458858.git.raj.khem@gmail.com>
References: <cover.1323458858.git.raj.khem@gmail.com>
From: Khem Raj <raj.khem@gmail.com>
Date: Sat, 10 Dec 2011 10:33:05 -0800
Message-ID: <CAMKF1soc65OBQQVnDKpTvQNbBO8UfjH3T1nriiqnS5crJFn4FQ@mail.gmail.com>
To: openembedded-core@lists.openembedded.org
Subject: Re: [PATCH 0/3] Update QEMU and add support for eglibc testing
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
X-List-Received-Date: Sat, 10 Dec 2011 18:40:40 -0000
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

On Fri, Dec 9, 2011 at 11:30 AM, Khem Raj <raj.khem@gmail.com> wrote:
> Minor release 0.15.1 of 0.15 branch is available for QEMU
>
> Generate a testing script to help with eglibc cross testing
>
> Add nfs-utils-client to nfs-server package group so when we
> have server, we can also have client, helps in eglibc cross testing
>
> The following changes since commit 86d174648b0fe770ac0dddbee08ecfd94cc13e=
c8:
>
> =C2=A0eglibc: Generate cross testing script during install (2011-12-09 11=
:24:43 -0800)
>



> are available in the git repository at:
> =C2=A0git://git.openembedded.org/openembedded-core-contrib kraj/eglibc-te=
sting
> =C2=A0http://cgit.openembedded.org/cgit.cgi/openembedded-core-contrib/log=
/?h=3Dkraj/eglibc-testing
>
> Khem Raj (3):
> =C2=A0qemu-0.15.1: Bump recipes from 0.15.0 to 0.15.1
> =C2=A0task-core-nfs: Add nfs-utils-client to RDEPENDS
> =C2=A0eglibc: Generate cross testing script during install
>

I have updated the cross testing patch on the contrib tree. The change
is that I have moved
the cross testing script generation to an .inc file which is then included
by eglibc.inc

> =C2=A0meta/recipes-core/eglibc/eglibc-common.inc =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 | =C2=A0 =C2=A01 -
> =C2=A0meta/recipes-core/eglibc/eglibc-package.inc =C2=A0 =C2=A0 =C2=A0 =
=C2=A0| =C2=A0 46 ++++++++++++++++++++
> =C2=A0meta/recipes-core/eglibc/eglibc_2.13.bb =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 =C2=A0 =C2=A0| =C2=A0 =C2=A02 +-
> =C2=A0meta/recipes-core/eglibc/eglibc_2.14.bb =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 =C2=A0 =C2=A0| =C2=A0 =C2=A02 +-
> =C2=A0meta/recipes-core/tasks/task-core-nfs.bb =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 | =C2=A0 =C2=A06 ++-
> =C2=A0.../{qemu-0.15.0 =3D> qemu-0.15.1}/arm-bgr.patch =C2=A0 =C2=A0 | =
=C2=A0 =C2=A00
> =C2=A0.../enable-i386-linux-user.patch =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 =C2=A0 =C2=A0 =C2=A0 =C2=A0 | =C2=A0 =C2=A00
> =C2=A0.../fallback-to-safe-mmap_min_addr.patch =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 | =C2=A0 =C2=A00
> =C2=A0.../fix-configure-checks.patch =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 | =C2=A0 =C2=A00
> =C2=A0.../{qemu-0.15.0 =3D> qemu-0.15.1}/fix-nogl.patch =C2=A0 =C2=A0| =
=C2=A0 =C2=A00
> =C2=A0.../{qemu-0.15.0 =3D> qemu-0.15.1}/glflags.patch =C2=A0 =C2=A0 | =
=C2=A0 =C2=A00
> =C2=A0.../{qemu-0.15.0 =3D> qemu-0.15.1}/init-info.patch =C2=A0 | =C2=A0 =
=C2=A00
> =C2=A0.../larger_default_ram_size.patch =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0| =C2=A0 =C2=A00
> =C2=A0.../linker-flags.patch =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 | =C2=A0 =C2=A00
> =C2=A0.../{qemu-0.15.0 =3D> qemu-0.15.1}/no-strip.patch =C2=A0 =C2=A0| =
=C2=A0 =C2=A00
> =C2=A0.../opengl-sdl-fix.patch =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 | =C2=A0 =C2=A00
> =C2=A0.../{qemu-0.15.0 =3D> qemu-0.15.1}/powerpc_rom.bin =C2=A0 | =C2=A0B=
in 4096 -> 4096 bytes
> =C2=A0.../qemu-git-qemugl-host.patch =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 | =C2=A0 =C2=A00
> =C2=A0.../qemu-vmware-vga-depth.patch =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0| =C2=A0 =C2=A00
> =C2=A0.../qemugl-allow-glxcontext-release.patch =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0| =C2=A0 =C2=A00
> =C2=A0.../{qemu-0.15.0 =3D> qemu-0.15.1}/qemugl-fix.patch =C2=A0| =C2=A0 =
=C2=A00
> =C2=A0.../qemu/{qemu_0.15.0.bb =3D> qemu_0.15.1.bb} =C2=A0 =C2=A0 =C2=A0 =
=C2=A0| =C2=A0 =C2=A06 +--
> =C2=A022 files changed, 54 insertions(+), 9 deletions(-)
> =C2=A0rename meta/recipes-devtools/qemu/{qemu-0.15.0 =3D> qemu-0.15.1}/ar=
m-bgr.patch (100%)
> =C2=A0rename meta/recipes-devtools/qemu/{qemu-0.15.0 =3D> qemu-0.15.1}/en=
able-i386-linux-user.patch (100%)
> =C2=A0rename meta/recipes-devtools/qemu/{qemu-0.15.0 =3D> qemu-0.15.1}/fa=
llback-to-safe-mmap_min_addr.patch (100%)
> =C2=A0rename meta/recipes-devtools/qemu/{qemu-0.15.0 =3D> qemu-0.15.1}/fi=
x-configure-checks.patch (100%)
> =C2=A0rename meta/recipes-devtools/qemu/{qemu-0.15.0 =3D> qemu-0.15.1}/fi=
x-nogl.patch (100%)
> =C2=A0rename meta/recipes-devtools/qemu/{qemu-0.15.0 =3D> qemu-0.15.1}/gl=
flags.patch (100%)
> =C2=A0rename meta/recipes-devtools/qemu/{qemu-0.15.0 =3D> qemu-0.15.1}/in=
it-info.patch (100%)
> =C2=A0rename meta/recipes-devtools/qemu/{qemu-0.15.0 =3D> qemu-0.15.1}/la=
rger_default_ram_size.patch (100%)
> =C2=A0rename meta/recipes-devtools/qemu/{qemu-0.15.0 =3D> qemu-0.15.1}/li=
nker-flags.patch (100%)
> =C2=A0rename meta/recipes-devtools/qemu/{qemu-0.15.0 =3D> qemu-0.15.1}/no=
-strip.patch (100%)
> =C2=A0rename meta/recipes-devtools/qemu/{qemu-0.15.0 =3D> qemu-0.15.1}/op=
engl-sdl-fix.patch (100%)
> =C2=A0rename meta/recipes-devtools/qemu/{qemu-0.15.0 =3D> qemu-0.15.1}/po=
werpc_rom.bin (100%)
> =C2=A0rename meta/recipes-devtools/qemu/{qemu-0.15.0 =3D> qemu-0.15.1}/qe=
mu-git-qemugl-host.patch (100%)
> =C2=A0rename meta/recipes-devtools/qemu/{qemu-0.15.0 =3D> qemu-0.15.1}/qe=
mu-vmware-vga-depth.patch (100%)
> =C2=A0rename meta/recipes-devtools/qemu/{qemu-0.15.0 =3D> qemu-0.15.1}/qe=
mugl-allow-glxcontext-release.patch (100%)
> =C2=A0rename meta/recipes-devtools/qemu/{qemu-0.15.0 =3D> qemu-0.15.1}/qe=
mugl-fix.patch (100%)
> =C2=A0rename meta/recipes-devtools/qemu/{qemu_0.15.0.bb =3D> qemu_0.15.1.=
bb} (88%)
>
> --
> 1.7.5.4
>


