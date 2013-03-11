Received: from smtpfb1-g21.free.fr ([212.27.42.9])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <eric@eukrea.com>) id 1UFBT9-0002lR-9K
	for openembedded-core@lists.openembedded.org;
	Mon, 11 Mar 2013 23:45:23 +0100
Received: from smtp3-g21.free.fr (smtp3-g21.free.fr [212.27.42.3])
	by smtpfb1-g21.free.fr (Postfix) with ESMTP id 0524A2DD30
	for <openembedded-core@lists.openembedded.org>;
	Mon, 11 Mar 2013 23:28:36 +0100 (CET)
Received: from e6520eb (tal33-3-82-233-81-124.fbx.proxad.net [82.233.81.124])
	(Authenticated sender: eukrea)
	by smtp3-g21.free.fr (Postfix) with ESMTPSA id 4CC72A6297;
	Mon, 11 Mar 2013 23:28:30 +0100 (CET)
Date: Mon, 11 Mar 2013 23:28:28 +0100
From: Eric =?UTF-8?B?QsOpbmFyZA==?= <eric@eukrea.com>
To: Radu Moisan <radu.moisan@intel.com>
Message-ID: <20130311232828.04a46d8a@e6520eb>
In-Reply-To: <1362674739-1647-1-git-send-email-radu.moisan@intel.com>
References: <1362674739-1647-1-git-send-email-radu.moisan@intel.com>
Organization: =?UTF-8?B?RXVrcsOpYQ==?= Electromatique
X-Mailer: Claws Mail 3.9.0 (GTK+ 2.24.13; x86_64-redhat-linux-gnu)
Mime-Version: 1.0
Cc: openembedded-core@lists.openembedded.org
Subject: Re: [PATCH] busybox: Upgrade to v1.21.0
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
X-List-Received-Date: Mon, 11 Mar 2013 22:45:23 -0000
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

Hi Radu,

Le Thu,  7 Mar 2013 18:45:39 +0200,
Radu Moisan <radu.moisan@intel.com> a =C3=A9crit :

> Removed obsolete patches
>=20
> Signed-off-by: Radu Moisan <radu.moisan@intel.com>
> ---
>  .../busybox-1.20.2/busybox-1.20.2-kernel_ver.patch |   28 ------
>  .../busybox-mkfs-minix-tests_bigendian.patch       |   34 -------
>  .../fix-for-spurious-testsuite-failure.patch       |   27 ------
>  .../busybox/busybox-1.20.2/sys_resource.patch      |   99 --------------=
------
>  .../busybox/busybox-1.20.2/wget_dl_dir_fix.patch   |   30 ------
>  .../B921600.patch                                  |    0
>  .../busybox-appletlib-dependency.patch             |    0
>  .../busybox-udhcpc-no_deconfig.patch               |    0
>  .../{busybox-1.20.2 =3D> busybox-1.21.0}/defconfig   |    0
>  .../get_header_tar.patch                           |    0
>  .../run-parts.in.usr-bin.patch                     |    6 +-
>  .../stat-usr-bin.patch                             |    0
>  ...estsuite-du-du-k-works-fix-false-positive.patch |    0
>  .../watch.in.usr-bin.patch                         |    0
>  .../{busybox_1.20.2.bb =3D> busybox_1.21.0.bb}       |   11 +--

1.21.0 is unstable and has some fixes which are not included in your
recipe with patches available here :
http://busybox.net/downloads/fixes-1.21.0/
so maybe is would be better to wait for 1.21.1 or to add the fixes

Eric


