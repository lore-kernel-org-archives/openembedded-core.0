Received: from mail-fx0-f47.google.com ([209.85.161.47])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <martin.jansa@gmail.com>) id 1QMYUi-00055q-8w
	for openembedded-core@lists.openembedded.org;
	Wed, 18 May 2011 06:36:24 +0200
Received: by fxm19 with SMTP id 19so1134311fxm.6
	for <openembedded-core@lists.openembedded.org>;
	Tue, 17 May 2011 21:33:30 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=domainkey-signature:date:from:to:subject:message-id:references
	:mime-version:content-type:content-disposition:in-reply-to
	:user-agent; bh=CiFRO1FCMDKhLePh4PI2PkEqJXDXGqwzFYBZM9XBp3U=;
	b=pA3R0wmG8+zVjb2HPkvBTjiMX4Rg0CMJB+bQUq2/prF8ny3/WqAl6jZf/loUHaVnqF
	W6xBgcbVOSezXbfU2nOl6xQ/d2XwOJ/+7s2S9G5GF/x/1ysM5sAONpPDZrQd/ONSqr4S
	0nkN824BBsw5PjvejoBGWpA0QytL8LWJ5j/OM=
DomainKey-Signature: a=rsa-sha1; c=nofws; d=gmail.com; s=gamma;
	h=date:from:to:subject:message-id:references:mime-version
	:content-type:content-disposition:in-reply-to:user-agent;
	b=dcj/JHXr8HIfWmAIZGrnufF4dJLWFiZgtu6zIYOi3fxoLz4EdqPcgRFzj9KvzZrVX/
	pIGoRZxBEstURi9LPmhABvljGwdpSWQpy94IzIiJHkrWfMt+4Pbctv9BAxU5yoUuVMRq
	yq5Of/q/Gyfzx+ibV/A6hpmNeT9mWWih8HFtw=
Received: by 10.223.106.78 with SMTP id w14mr1765473fao.35.1305692771706;
	Tue, 17 May 2011 21:26:11 -0700 (PDT)
Received: from localhost ([94.230.152.115])
	by mx.google.com with ESMTPS id t15sm438645fau.24.2011.05.17.21.26.10
	(version=TLSv1/SSLv3 cipher=OTHER);
	Tue, 17 May 2011 21:26:10 -0700 (PDT)
Date: Wed, 18 May 2011 06:26:04 +0200
From: Martin Jansa <martin.jansa@gmail.com>
To: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Message-ID: <20110518042604.GD11609@jama.jama.net>
References: <46AB3A39-160F-4EB9-B92E-8DE957C1284D@dominion.thruhere.net>
	<20110517071446.GC3509@jama.jama.net>
	<1305625372.3424.216.camel@rex>
	<20110517113716.GA11317@jama.jama.net>
	<1305673842.3424.288.camel@rex>
MIME-Version: 1.0
In-Reply-To: <1305673842.3424.288.camel@rex>
User-Agent: Mutt/1.5.21 (2010-09-15)
X-Content-Filtered-By: Mailman/MimeDel 2.1.11
Subject: Re: sstate breakage with multimachine
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
X-List-Received-Date: Wed, 18 May 2011 04:36:24 -0000
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="+SfteS7bOf3dGlBC"
Content-Disposition: inline

--+SfteS7bOf3dGlBC
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Wed, May 18, 2011 at 12:10:42AM +0100, Richard Purdie wrote:
> On Tue, 2011-05-17 at 13:37 +0200, Martin Jansa wrote:
> > On Tue, May 17, 2011 at 10:42:52AM +0100, Richard Purdie wrote:
> > > On Tue, 2011-05-17 at 09:14 +0200, Martin Jansa wrote:
> > > > there is also another source of many sstate rebuilds. I've discuess=
ed
> > > > this with RP on IRC already and I'll fill bugs as recommended, shar=
ing
> > > > here just because you have opened this topic.
> > > >=20
> > > > If you have package with
> > > > PACKAGE_ARCH =3D "all"
> > > > then the resulting package is created by run.* scripts with differe=
nt
> > > > pathsi, *FLAGS etc even when it produces same output (ie some theme=
).
> > > >=20
> > > > So all packages with such PACKAGE_ARCH are rebuilt after machine sw=
itch
> > > > (if the machine is ie different arch like om-gta02/nokia900).
> > > > Sstate is reused when you go back to om-gta02 after building nokia9=
00,
> > > > so you have ie populate_sysroot only with as many checksums as you'=
re
> > > > building different archs.
> > > >=20
> > > > RP said, that right fix is to introduce something like all.bbclass =
which
> > > > excludes all variables which shouldn't change the output of such pa=
ckage
> > > > and then checksums will be the same.
> > >=20
> > > I think rather then exclude them, we should zero them out or unexport
> > > them and stop them being present in the task environment. We should f=
ile
> > > a bug about this problem in the Yocto bugzilla.
> >=20
> > Already did in morning
> > http://bugzilla.yoctoproject.org/show_bug.cgi?id=3D1075
>=20
> Its not finished but here is a start at this:
>=20
> http://git.yoctoproject.org/cgit.cgi/poky-contrib/commit/?h=3Drpurdie/all=
arch&id=3D0944f7393054a91ce1508ec1a98bd4c612ee90e4

just nitpick in meta/recipes-bsp/hostap/hostap-conf_1.0.bb
-PR =3D "r12"
+PR =3D "r142"

but I'll use test allarch when my current build finishes and let you
know, The same for 2nd patch.

Thanks!

Cheers,

> I fixed up encodings to compile (without trying to us a compiler). The
> same kind of fixes are needed for gnome-icon-theme, font-alias and
> possibly others. If they are truly "all" arch, they shouldn't be trying
> to access a compiler at all.
>=20
>=20
> > > > Here is example with gtk-theme-e17lookalike http://paste.pocoo.org/=
show/388032/
> > > >=20
> > > > And as side-note there is small problem when someone tries to hunt =
such
> > > > checksum changes, because some tasks which are not directly using s=
state
> > > > like do_install do not save their run.* scripts in better place then
> > > > ${WORKDIR}/temp=20
> > > >=20
> > > > So if your bitbake-diffsigs shows something like this:
> > > >=20
> > > > Hash for dependent task
> > > > /OE/shr-core/meta-shr/recipes-shr/shr/gtk-theme-e17lookalike_git.bb=
=2Edo_install
> > > > changed from 8a0de44f3f238f645eab9509172c2d8b to
> > > > 9d6bf027c5f435498017a652088d7327
> > > >=20
> > > > You need to find right ${WORKDIR} for that version, and there in te=
mp
> > > > directory right combination of run.do_install._pid_ scripts, but you
> > > > don't know which _pid_ belongs to which sstate checksum and I guess=
 pid
> > > > cannot be stored in .siginfo because it would be always different.
> > >=20
> > > Just for reference, if you want to generate two trees of all tasks
> > > sigdata to compare you can do something like:
> > >=20
> > > MACHINE=3Dqemuarm bitbake console-image -S
> > > MACHINE=3Dqemux86 bitbake console-image -S
> > >=20
> > > and then look at the tmpdir/stamps/*/* files using bitbake-diffsigs on
> > > the files there to try and do this comparison more directly.
> >=20
> > This works for multimachine build when I'm trying to find what's
> > different between qemuarm and qemux86, but wont help if I'm trying to
> > find what's changed in run.do_install from last week when I notice that
> > some package is being rebuilt again.
> >=20
> > Also already in bugzilla
> > http://bugzilla.yoctoproject.org/show_bug.cgi?id=3D1074
> >=20
> > > I'm open to other ideas to improving the way we write out the sigdata
> > > pieces to make this kind of analysis easier...
> >=20
> > I don't know sstate internals as you do, but cannot we store every
> > dependant task used to count checksum in something like=20
> > state-gtk-theme-e17lookalike-all-oe-linux-gnueabi-0.1.1+gitr3+9b92a3d09=
5ef1b53f55026cc292771d1507e6800-r8-all-2-do_install_8a0de44f3f238f645eab950=
9172c2d8b.gz
> > and from second run
> > state-gtk-theme-e17lookalike-all-oe-linux-gnueabi-0.1.1+gitr3+9b92a3d09=
5ef1b53f55026cc292771d1507e6800-r8-all-2-do_install_9d6bf027c5f435498017a65=
2088d7327.gz
> >=20
> > or even flat filename structure like
> > siginfo-do_install_8a0de44f3f238f645eab9509172c2d8b.gz and
> > siginfo-do_install_9d6bf027c5f435498017a652088d7327.gz
> > as hash collision is not very likely to happen and overwrites with same
> > script are ok.
> >=20
> > Then it would be easy to find actuall scripts which caused checksum
> > change without ${WORKDIR}/temp files
>=20
> How about:
>=20
> http://git.yoctoproject.org/cgit.cgi/poky-contrib/commit/?h=3Drpurdie/all=
arch&id=3Daca23a2ab92ad950d44dd45524773591bc7993bc
>=20
> which results in sigdata files in the stamp directory.
>=20
> Cheers,
>=20
> Richard
>=20
>=20
> _______________________________________________
> Openembedded-core mailing list
> Openembedded-core@lists.openembedded.org
> http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-core

--=20
Martin 'JaMa' Jansa     jabber: Martin.Jansa@gmail.com

--+SfteS7bOf3dGlBC--
