Received: from gate.crashing.org ([63.228.1.57]
	ident=[U2FsdGVkX18ciHpAeiMftoSWa1Pnj3YrOJrhzLDWHNo=])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <galak@kernel.crashing.org>) id 1Qq6cX-0005op-W4
	for openembedded-core@lists.openembedded.org;
	Sun, 07 Aug 2011 18:54:38 +0200
Received: from [IPv6:::1] (localhost.localdomain [127.0.0.1])
	by gate.crashing.org (8.14.1/8.13.8) with ESMTP id p77Go5K0016782;
	Sun, 7 Aug 2011 11:50:06 -0500
Mime-Version: 1.0 (Apple Message framework v1084)
From: Kumar Gala <galak@kernel.crashing.org>
In-Reply-To: <F5D4B029-50F1-47E1-934C-8918DF2624F5@kernel.crashing.org>
Date: Sun, 7 Aug 2011 11:50:08 -0500
Message-Id: <EAE60D3D-2EA6-431D-9075-1C6670B5C35D@kernel.crashing.org>
References: <F5D4B029-50F1-47E1-934C-8918DF2624F5@kernel.crashing.org>
To: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
X-Mailer: Apple Mail (2.1084)
Subject: Re: multilib theory & practice
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
X-List-Received-Date: Sun, 07 Aug 2011 16:54:38 -0000
Content-Type: text/plain; charset=us-ascii
Content-Transfer-Encoding: quoted-printable


On Aug 6, 2011, at 3:56 PM, Kumar Gala wrote:

> I'm looking at trying to get multilib working for powerpc.  However =
I'm a bit lost in how this is suppose to work from a few different =
perspectives:
>=20
> 1. from user perspective (I'm starting with a 64-bit build in /lib64 =
and adding 32-bit that would be in /lib):
>=20
> (i've added in local/conf):
> require conf/multilib.conf
> MULTILIBS =3D "multilib:lib"
> DEFAULTTUNE_virtclass-multilib-lib =3D "powerpc"
>=20
> What should this end up producing?  Do I get a 32-bit set of libs =
built automatically?  What else do I need to do?
>=20
> 2. =46rom a infrastructure point of view:
>=20
> * Do have a single compiler that is multi-arch or 2 compilers? (not =
sure how the x86_64 toolchain works today)
> * what areas should I investigate that might need tweaking that are =
arch specific?
> * should I see different task names for the new multilib builds? (or =
the 32-bit specific builds?)

To add to this I'm wondering how we get proper eglibc for 32-bit, how we =
get proper gcc libs (libgcc, etc).

- k=


