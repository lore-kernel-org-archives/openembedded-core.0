Received: from smtpfb2-g21.free.fr ([212.27.42.10])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <eric@eukrea.com>) id 1SAHVH-0005Gi-01
	for openembedded-core@lists.openembedded.org;
	Wed, 21 Mar 2012 10:06:47 +0100
Received: from smtp3-g21.free.fr (smtp3-g21.free.fr [212.27.42.3])
	by smtpfb2-g21.free.fr (Postfix) with ESMTP id 58077D1AFC7
	for <openembedded-core@lists.openembedded.org>;
	Wed, 21 Mar 2012 09:57:54 +0100 (CET)
Received: from eb-e6520 (unknown [82.233.81.124])
	by smtp3-g21.free.fr (Postfix) with ESMTP id BC931A60FD;
	Wed, 21 Mar 2012 09:57:47 +0100 (CET)
Date: Wed, 21 Mar 2012 09:57:46 +0100
From: Eric =?ISO-8859-1?B?QuluYXJk?= <eric@eukrea.com>
To: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Message-ID: <20120321095746.6e3727b9@eb-e6520>
In-Reply-To: <333082295.tACmPZfEAB@helios>
References: <4F6948EC.5050309@windriver.com>
	<333082295.tACmPZfEAB@helios>
Organization: =?ISO-8859-1?B?RXVrculh?= Electromatique
X-Mailer: Claws Mail 3.8.0 (GTK+ 2.24.8; x86_64-redhat-linux-gnu)
Mime-Version: 1.0
Cc: paul.eggleton@linux.intel.com
Subject: Re: runqemu doesn't work with graphics through ssh
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
X-List-Received-Date: Wed, 21 Mar 2012 09:06:47 -0000
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: quoted-printable

Hi,

Le Wed, 21 Mar 2012 08:52:37 +0000,
Paul Eggleton <paul.eggleton@linux.intel.com> a =E9crit :

> On Wednesday 21 March 2012 11:20:12 Robert Yang wrote:
> > The runqemu doesn't work with graphics through ssh, here are the
> > reproduce steps:
> >=20
> > 1) ssh -X (or -Y) to a host
> > 2) runqemu qemux86
> >=20
> > The qemu window would leap and leap, and can't be closed by click
> > the "close" button or "crtl-c".
> >=20
> > the "runqemu nographic qemux86"
> >=20
> > This happens on: Fedora 13 64bit and Ubuntu 11.10 64bit, the ssh connec=
tion
> > is from Ubuntu 11.10 32bit.
>=20
> I regularly do this from my Fedora 14 64-bit my machine to my Ubuntu 11.1=
0 32-
> bit machine and do not have any such problem. Has this just started happe=
ning=20
> for you or had you not tried this configuration until now?
>=20
this also works fine here between 2 Fedora 16 64 bits.

Eric
--=20
http://eukrea.com/en/news/104-2012


