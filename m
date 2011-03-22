Received: from mail-ww0-f41.google.com ([74.125.82.41])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <koen@dominion.thruhere.net>) id 1Q26Yu-00069y-Px
	for openembedded-core@lists.openembedded.org;
	Tue, 22 Mar 2011 19:44:12 +0100
Received: by wwi18 with SMTP id 18so4804117wwi.0
	for <openembedded-core@lists.openembedded.org>;
	Tue, 22 Mar 2011 11:42:22 -0700 (PDT)
Received: by 10.227.10.131 with SMTP id p3mr2178148wbp.125.1300819342510;
	Tue, 22 Mar 2011 11:42:22 -0700 (PDT)
Received: from [172.20.1.5] (ip545070eb.adsl-surfen.hetnet.nl [84.80.112.235])
	by mx.google.com with ESMTPS id o6sm3411227wbo.37.2011.03.22.11.42.20
	(version=TLSv1/SSLv3 cipher=OTHER);
	Tue, 22 Mar 2011 11:42:21 -0700 (PDT)
Mime-Version: 1.0 (Apple Message framework v1082)
From: Koen Kooi <koen@dominion.thruhere.net>
In-Reply-To: <20110322181037.GA26336@sakrah.homelinux.org>
Date: Tue, 22 Mar 2011 19:42:19 +0100
Message-Id: <8E4968F0-D069-4BB2-89C3-FD93167597E9@dominion.thruhere.net>
References: <20110322181037.GA26336@sakrah.homelinux.org>
To: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
X-Mailer: Apple Mail (2.1082)
Subject: Re: MIPS rootfs creation failure
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
X-List-Received-Date: Tue, 22 Mar 2011 18:44:12 -0000
Content-Type: text/plain; charset=us-ascii
Content-Transfer-Encoding: quoted-printable


Op 22 mrt 2011, om 19:10 heeft Khem Raj het volgende geschreven:

> Hi
>=20
> I did an update of oe-core yesterday and now mips is failing with this
> error. It was not there 2 days back.
>=20
> | Configuring sysvinit.
> | Collected errors:
> |  * satisfy_dependencies_for: Cannot satisfy the following =
dependencies
> for task-base:
> |  *    kernel-misc *
> |  * opkg_install_cmd: Cannot install package task-base.
> NOTE: package console-image-1.0-r0: task do_rootfs: Failed
>=20
> I have not bisected but if anyone else is seeing it I would like to =
know

I think thats fallout from the kernel.bbclass change:

meta/classes/kernel.bbclass:FILES_kernel-misc =3D =
"/kernel/include/config /kernel/scripts /kernel/drivers/crypto /kernel

I don't know what purpose that package has, but try rebuilding the =
kernel and see what happens. We might need to blacklist it from being =
included in the kernel-modules meta-package.

regards,

Koen=


