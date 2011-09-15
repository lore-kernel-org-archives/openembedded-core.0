Received: from dan.rpsys.net ([93.97.175.187])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <richard.purdie@linuxfoundation.org>)
	id 1R49GL-0000u5-AV for openembedded-core@lists.openembedded.org;
	Thu, 15 Sep 2011 12:33:45 +0200
Received: from localhost (dan.rpsys.net [127.0.0.1])
	by dan.rpsys.net (8.14.2/8.14.2/Debian-2build1) with ESMTP id
	p8FAYecP026164 for <openembedded-core@lists.openembedded.org>;
	Thu, 15 Sep 2011 11:34:40 +0100
X-Virus-Scanned: Debian amavisd-new at dan.rpsys.net
Received: from dan.rpsys.net ([127.0.0.1])
	by localhost (dan.rpsys.net [127.0.0.1]) (amavisd-new, port 10024)
	with LMTP id vnuvTIlwgD-A
	for <openembedded-core@lists.openembedded.org>;
	Thu, 15 Sep 2011 11:34:39 +0100 (BST)
Received: from [192.168.1.36] (tim [93.97.173.237]) (authenticated bits=0)
	by dan.rpsys.net (8.14.2/8.14.2/Debian-2build1) with ESMTP id
	p8FAYYOq026160
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-SHA bits=256 verify=NOT)
	for <openembedded-core@lists.openembedded.org>;
	Thu, 15 Sep 2011 11:34:36 +0100
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Date: Thu, 15 Sep 2011 11:28:23 +0100
In-Reply-To: <cover.1316056194.git.sgw@linux.intel.com>
References: <cover.1316056194.git.sgw@linux.intel.com>
X-Mailer: Evolution 3.1.91- 
Message-ID: <1316082511.25993.13.camel@ted>
Mime-Version: 1.0
X-MIME-Autoconverted: from 8bit to quoted-printable by dan.rpsys.net id
	p8FAYecP026164
Subject: Re: [RC2 PULL 00/13] Prelinker, Kernel and distro tracking
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
X-List-Received-Date: Thu, 15 Sep 2011 10:33:45 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Wed, 2011-09-14 at 20:14 -0700, Saul Wold wrote:
> Richard,
>=20
> Please pull this first before pulling any other changes, so that=20
> we can tag / branch this for RC2.
>=20
> These changes are all reviewed.  There is a kernel update, deb packagin=
g
> fix, prelinker and distro tracking updates.
>=20
> I also included Paul's core-console change, Tom's Grub2 move and=20
> the blacklisting of diginotar certs.
>=20
> This is what was built on the Autobuilder for RC2 with no failures in
> the build.
>=20
> Thanks
> 	Sau!
>=20
>=20
> The following changes since commit 8df322abfd3fa8c460fd73c83c1ef0b5e419=
dc11:
>=20
>   core-image-minimal: Add missing POKY_EXTRA_IMAGE variable (2011-09-14=
 01:27:08 +0100)
>=20
> are available in the git repository at:
>   git://git.yoctoproject.org/poky-contrib sgw/stage
>   http://git.yoctoproject.org/cgit.cgi/poky-contrib/log/?h=3Dsgw/stage
>=20
> Bruce Ashfield (3):
>   linux-yocto: move common tasks to a common location
>   linux-yocto: split e100 and e1000 support
>   linux-yocto-rt: correct 3.0.3->3.0.4 mismerge for, stop_machine.c
>=20
> Dexuan Cui (1):
>   package_deb.bbclass, populate_sdk_deb.bbclass: fix
>     meta-toolchain-gmae build
>=20
> Dongxiao Xu (1):
>   distro_tracking: update package alias
>=20
> Eric B=C3=A9nard (1):
>   qt4: add blacklist-diginotar-certs patch
>=20
> Mark Hatle (1):
>   Uprev to latest version of prelink_git, fixing TLS issues
>=20
> Paul Eggleton (1):
>   task-core: split into task-core-console and task-core-x11
>=20
> Saul Wold (1):
>   task-core-sdk: change task-core -> task-core-console
>=20
> Tom Zanussi (2):
>   initramfs-live-install: add support for grub2
>   grub2: new recipe
>=20
> Yu Ke (1):
>   distro_tracking_field: add distro checking field
>=20
> Zhai Edwin (1):
>   distro-tracking: Update alias

Merged to master, thanks.

Richard



