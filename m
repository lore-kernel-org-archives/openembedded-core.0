Received: from smtp2-g21.free.fr ([212.27.42.2])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <eric@eukrea.com>) id 1SFOfn-0006CP-64
	for openembedded-core@lists.openembedded.org;
	Wed, 04 Apr 2012 13:46:47 +0200
Received: from eb-e6520 (unknown [82.240.38.71])
	by smtp2-g21.free.fr (Postfix) with ESMTP id CCED54B007E
	for <openembedded-core@lists.openembedded.org>;
	Wed,  4 Apr 2012 13:37:34 +0200 (CEST)
Date: Wed, 4 Apr 2012 13:37:32 +0200
From: Eric =?ISO-8859-1?B?QuluYXJk?= <eric@eukrea.com>
To: openembedded-core@lists.openembedded.org
Message-ID: <20120404133732.16bf66fb@eb-e6520>
In-Reply-To: <1333539066.11559.36.camel@ted>
References: <loom.20120404T082801-1@post.gmane.org>
	<20120404091834.367f9617@eb-e6520>
	<CAGiJk9f_=5pVUurpPT4pO3qPZC=bOn2Qg_1iaaE=A5g+0cG1Vw@mail.gmail.com>
	<20120404094728.01c3ba51@eb-e6520> <1333539066.11559.36.camel@ted>
Organization: =?ISO-8859-1?B?RXVrculh?= Electromatique
X-Mailer: Claws Mail 3.8.0 (GTK+ 2.24.8; x86_64-redhat-linux-gnu)
Mime-Version: 1.0
Subject: Re: How to rebuilt the package after modified the source code in open embedded bitbake ...
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
X-List-Received-Date: Wed, 04 Apr 2012 11:46:47 -0000
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: quoted-printable

Hi Richard,

Le Wed, 04 Apr 2012 12:31:06 +0100,
Richard Purdie <richard.purdie@linuxfoundation.org> a =E9crit :
> Eric: You should probably look at the externalsrc.bbclass since it gives
> you a way to do things like this yet also build and package it with the
> usual build system:
>=20
> http://www.yoctoproject.org/docs/latest/poky-ref-manual/poky-ref-manual.h=
tml#ref-classes-externalsrc
>=20
yes, this can be very usefull when you need packaging, but for
bootloader and kernel development, using the build system during
development doesn't bring any added value IMHO.

Eric


