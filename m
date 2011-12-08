Received: from 93-97-173-237.zone5.bethere.co.uk ([93.97.173.237]
	helo=tim.rpsys.net) by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <richard.purdie@linuxfoundation.org>)
	id 1RYfzH-0007Bt-Ss; Thu, 08 Dec 2011 16:34:20 +0100
Received: from localhost (localhost [127.0.0.1])
	by tim.rpsys.net (8.13.6/8.13.8) with ESMTP id pB8FRU2a029652;
	Thu, 8 Dec 2011 15:27:30 GMT
Received: from tim.rpsys.net ([127.0.0.1])
	by localhost (tim.rpsys.net [127.0.0.1]) (amavisd-new,
	port 10024) with LMTP
	id 29151-08; Thu,  8 Dec 2011 15:27:25 +0000 (GMT)
Received: from [192.168.3.10] ([192.168.3.10]) (authenticated bits=0)
	by tim.rpsys.net (8.13.6/8.13.8) with ESMTP id pB8FRMnk029646
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-SHA bits=256 verify=NO);
	Thu, 8 Dec 2011 15:27:23 GMT
Message-ID: <1323358053.5309.28.camel@ted>
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Date: Thu, 08 Dec 2011 15:27:33 +0000
In-Reply-To: <cover.1323333676.git.sgw@linux.intel.com>
References: <cover.1323333676.git.sgw@linux.intel.com>
X-Mailer: Evolution 3.2.1- 
Mime-Version: 1.0
X-Virus-Scanned: amavisd-new at rpsys.net
X-MIME-Autoconverted: from 8bit to quoted-printable by tim.rpsys.net id
	pB8FRU2a029652
Cc: openembedded-core@openembedded.org
Subject: Re: [CONSOLIDATED PULL 00/17] Master Fixes & Self-Hosted Fixes
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
X-List-Received-Date: Thu, 08 Dec 2011 15:34:20 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Thu, 2011-12-08 at 00:44 -0800, Saul Wold wrote:
> Andrea Adami (2):
>   image_types.bbclass: implement jffs2 summary images (sum.jffs2)
>   image_types.bbclass: disable cleanmarkers for jffs2 images
>=20
> Eric B=C3=A9nard (1):
>   rootfs_ipk: implement FEED_DEPLOYDIR_BASE_URI support
>=20
> Martin Jansa (1):
>   sysstat: don't run populate-volatile.sh update in do_rootfs or
>     without populate-volatile.sh
>=20
> Mei Lei (2):
>   dropbear: Upgrade from 0.53.1 to 2011.54
>   distro_tracking_fields.inc: Update dropbear,iproute2,net-tools
>     tracking information.
>=20
> Otavio Salvador (1):
>   initramfs-framework: provides a modular initramfs
>=20
> Paul Eggleton (2):
>   qt4: fix debug symbol stripping
>   qt4: various tidy-ups
>=20
> Richard Purdie (2):
>   dpkg: Fix preinst execution
>   bitbake.conf/image.bbclass: Ensure images use the correct
>     passwd/group files
>=20
> Saul Wold (6):
>   grub: Create /etc/grub.d
>   initrdscripts: add sleep to avoid kernel messages before install
>     message
>   self-hosted-image: remove extra space since we use additional disk
>     instead
>   wget: enable https and openssl

I've taken the above although I did take v2 of the systate patch from
Martin and not the one in this series.

>   self-hosted: Add ext2 utilites and perl-pod for building

This one doesn't look right to me. What ext2 utitilitis are we relying
upon during a build? They're not in ASSUME_PROVIDED...

>   ncurses: libcurses.so should link to libncurses.so

Phil had some feedback on this, it doesn't look well tested.

Cheers,

Richard




