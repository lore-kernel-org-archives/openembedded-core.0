Received: from mail-bw0-f47.google.com ([209.85.214.47])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <martin.jansa@gmail.com>) id 1RRVur-0004cN-S2
	for openembedded-core@lists.openembedded.org;
	Fri, 18 Nov 2011 22:24:10 +0100
Received: by bkbzs2 with SMTP id zs2so3896416bkb.6
	for <openembedded-core@lists.openembedded.org>;
	Fri, 18 Nov 2011 13:17:43 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=date:from:to:subject:message-id:references:mime-version
	:content-type:content-disposition:in-reply-to:user-agent;
	bh=ypEzg2idD5kyh9Pty11rS6lj3/nS3iL7uXdk2ko/IGY=;
	b=DE2H9TNTkZZ2Mzc9AUCuvLnbCaLAeNvO8ZhW1iu51PVK39xXfuEF9KWsKo6BMZhadI
	lpG+u1TBk/sPF7hfBXgCeOT+OIXA1bPvmI7vBKs7KZeS8aPWhJGjoysezJLGiQzwhIKv
	u+cpUmpSodIZFXuGZLcZpbPUxkTX9euwsWbUU=
Received: by 10.204.154.7 with SMTP id m7mr4965466bkw.71.1321651063453;
	Fri, 18 Nov 2011 13:17:43 -0800 (PST)
Received: from localhost ([94.230.152.246])
	by mx.google.com with ESMTPS id k26sm6500711fab.8.2011.11.18.13.17.41
	(version=TLSv1/SSLv3 cipher=OTHER);
	Fri, 18 Nov 2011 13:17:42 -0800 (PST)
Date: Fri, 18 Nov 2011 22:17:40 +0100
From: Martin Jansa <martin.jansa@gmail.com>
To: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Message-ID: <20111118211740.GF3549@jama.jama.net>
References: <4EC6B45A.9060107@intel.com>
	<CAMKF1spQ5roygTCMRtZ5nhfhV+S9520tJYdV5Lyt-MB-Je1XZA@mail.gmail.com>
	<4EC6B917.90007@linux.intel.com> <4EC6BEF9.9060205@intel.com>
MIME-Version: 1.0
In-Reply-To: <4EC6BEF9.9060205@intel.com>
User-Agent: Mutt/1.5.21 (2010-09-15)
Subject: Re: qemu needs > 2 GB of RAM to build?
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
X-List-Received-Date: Fri, 18 Nov 2011 21:24:10 -0000
X-Groupsio-MsgNum: 12644
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="fwqqG+mf3f7vyBCB"
Content-Disposition: inline

--fwqqG+mf3f7vyBCB
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Fri, Nov 18, 2011 at 12:24:25PM -0800, Scott Garman wrote:
> On 11/18/2011 11:59 AM, Joshua Lock wrote:
> >
> >
> > On 18/11/11 11:49, Khem Raj wrote:
> >> On Fri, Nov 18, 2011 at 11:39 AM, Scott Garman<scott.a.garman@intel.co=
m>  wrote:
> >>> Hi all,
> >>>
> >>> I'm testing building core-image-minimal in a resource-constrained
> >>> environment (a VirtualBox VM with 2300 MB of RAM allocated to it). Wi=
th
> >>> PARALLEL_MAKE set to -j4 (the VM does have two CPUs allocated), I'm f=
inding
> >>> that the build of qemu-native fails because the OOM killer steps in a=
nd
> >>> kills gcc. This is happening during the linking phase of building qem=
u.
> >
> > What's BB_NUMBER_THREADS set to? I had to reduce to 1 to build
> > qemu-native on a laptop with 2GB RAM. iirc it had a habit of linking
> > something equally large such as eglibc, qt or the kernel at the same ti=
me.
>=20
> I had it set to 2, but I'm able to reproduce the problem when rebuilding=
=20
> *only* qemu-native.
>=20
> >> what distro are you running on guest ? it could be something wrong
> >> with the distro gcc or system
> >
> > I've seen this on F14 (Gnome 2.x) and F15 (Gnome 3) with a laptop with
> > only 2GB RAM.
>=20
> This is a Fedora 14 host running GNOME 2.x
>=20
> > I think BB_NUMBER_THREADS is the key here. And whether you're running
> > much in the way of a desktop environment.
>=20
> I would have thought PARALLEL_MAKE would have been more of the issue - I=
=20
> think I saw two instances of ld running via top when the crash occurred.
>=20
> In any case, the purpose behind this exercise for me is to test the=20
> feasibility of using a VM environment for performing builds. The idea is=
=20
> to get Windows users started with some tutorial screencasts they can=20
> follow along with using the VM until they feel compelled enough to set=20
> up a native Linux development system.
>=20
> It sounds like a system requirement of using this VM will have to be=20
> that the host system have 6 GB or more of RAM (since the VM guest won't=
=20
> be able to use all of that - generally around 50-60%). This pretty much=
=20
> rules out its use on all but the most recent laptops.

Why not enable more swap? It's slow but works for short peaks in mem
usage. I have to extend our swap from 2G to 4G on VM with 2G RAM for
some builds.. also needed during linking unstripped libs :/.

Regards,=20

>=20
> Scott
>=20
> --=20
> Scott Garman
> Embedded Linux Engineer - Yocto Project
> Intel Open Source Technology Center
>=20
> _______________________________________________
> Openembedded-core mailing list
> Openembedded-core@lists.openembedded.org
> http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-core

--=20
Martin 'JaMa' Jansa     jabber: Martin.Jansa@gmail.com

--fwqqG+mf3f7vyBCB
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: Digital signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v2.0.18 (GNU/Linux)

iEYEARECAAYFAk7Gy3QACgkQN1Ujt2V2gBzPvgCeKaa0jVhsZUk99GpYlVfOSVAg
hmsAninpuVGIJ9E3v3Trw87ePmImh09S
=VF0e
-----END PGP SIGNATURE-----

--fwqqG+mf3f7vyBCB--
