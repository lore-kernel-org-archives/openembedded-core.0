Received: from smtp2-g21.free.fr ([212.27.42.2])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <eric@eukrea.com>) id 1SPx5S-00068g-18
	for openembedded-core@lists.openembedded.org;
	Thu, 03 May 2012 16:32:54 +0200
Received: from eb-e6520 (unknown [82.240.38.71])
	by smtp2-g21.free.fr (Postfix) with ESMTP id 28D9F4B01BF;
	Thu,  3 May 2012 16:23:05 +0200 (CEST)
Date: Thu, 3 May 2012 16:23:04 +0200
From: Eric =?ISO-8859-1?B?QuluYXJk?= <eric@eukrea.com>
To: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Message-ID: <20120503162304.075e2e97@eb-e6520>
In-Reply-To: <1336052928-30764-1-git-send-email-wd@denx.de>
References: <1335693807-17609-1-git-send-email-wd@denx.de>
	<1336052928-30764-1-git-send-email-wd@denx.de>
Organization: =?ISO-8859-1?B?RXVrculh?= Electromatique
X-Mailer: Claws Mail 3.8.0 (GTK+ 2.24.8; x86_64-redhat-linux-gnu)
Mime-Version: 1.0
Subject: Re: [PATCH] Add KERNEL_EXTRA_ARGS parameter
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
X-List-Received-Date: Thu, 03 May 2012 14:32:54 -0000
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: quoted-printable

Le Thu,  3 May 2012 15:48:48 +0200,
Wolfgang Denk <wd@denx.de> a =E9crit :

> With recent kernel versions, some ARM configurations need may fail to
> build with errors like this:
>=20
> 	multiple load addresses: 0x80008000 0x80008000
> 	This is incompatible with uImages
> 	Specify LOADADDR on the commandline to build an uImage
>=20
> We cannot pass this information in EXTRA_OEMAKE, as
> "meta/classes/kernel.bbclass" explicitly ignores all EXTRA_OEMAKE
> settings.  So add KERNEL_EXTRA_ARGS parameter so affected boards
> can add for example
>=20
> 	KERNEL_EXTRA_ARGS =3D "LOADADDR=3D0x80008000"
>=20
> to their configuration.  We make this general enough so other needed
> command line options can be passed as well when compiling the kernel.
>=20
> Signed-off-by: Wolfgang Denk <wd@denx.de>
Acked-by: Eric B=E9nard <eric@eukrea.com>

useful when multiple machines with different LOADADDR are built in the
same kernel.

Eric


