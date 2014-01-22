Return-Path: <martin.jansa@gmail.com>
Received: from mail-ee0-f51.google.com (mail-ee0-f51.google.com [74.125.83.51])
	by mail.openembedded.org (Postfix) with ESMTP id B0BC66C921
	for <openembedded-core@lists.openembedded.org>;
	Wed, 22 Jan 2014 12:57:24 +0000 (UTC)
Received: by mail-ee0-f51.google.com with SMTP id b57so4885847eek.10
	for <openembedded-core@lists.openembedded.org>;
	Wed, 22 Jan 2014 04:57:25 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=date:from:to:cc:subject:message-id:references:mime-version
	:content-type:content-disposition:in-reply-to:user-agent;
	bh=Xoo9nFVPKt4kGR12KQQJ2bfc0huqefa5ex+vOGXyOhY=;
	b=CicUAzPKkyHlXfmPxq5sLde5aDAGok1otKR982II7tXV8tRVqqXkPqTHfMzXmhZHk7
	FvgvIypr0rf3kIcL6jxWGrPfelC2qs0kzf5+azDkLx3PVFNqILxJ6MyJ7h8u6Ym9hro/
	2/aoI3upzsCQHh9AHk8A04qaQoyWkzohEUxQCbYnvT9txCMKFxEX/BNtlyxW5Ol9LMq/
	xv/HA3YnXkU5BNLrwVpfqAZeB1ybXU9e+QMS76kllCwJfJS/mj3VdHwYXQCL/q6EFioq
	34KGDEQPW8PrNEv4PcB8G1SXMrljK6iANs9nB0eKWh4RZ09Jg1Y+ubUN0JQALr5h1mwz
	q2EA==
X-Received: by 10.15.49.193 with SMTP id j41mr1429934eew.10.1390395445375;
	Wed, 22 Jan 2014 04:57:25 -0800 (PST)
Received: from localhost (ip-89-176-104-107.net.upcbroadband.cz.
	[89.176.104.107])
	by mx.google.com with ESMTPSA id z42sm19087893eel.3.2014.01.22.04.57.23
	for <multiple recipients>
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Wed, 22 Jan 2014 04:57:23 -0800 (PST)
Date: Wed, 22 Jan 2014 13:57:24 +0100
From: Martin Jansa <martin.jansa@gmail.com>
To: Valentin Popa <valentin.popa@intel.com>
Message-ID: <20140122125724.GU4100@jama>
References: <20140108173801.GB3709@jama> <52DFB95F.5080206@intel.com>
	<52DFBE2C.2080209@intel.com>
MIME-Version: 1.0
In-Reply-To: <52DFBE2C.2080209@intel.com>
User-Agent: Mutt/1.5.22 (2013-10-16)
Cc: openembedded-core@lists.openembedded.org
Subject: Re: [PATCH] Mesa: upgrade to 9.2.2
X-BeenThere: openembedded-core@lists.openembedded.org
X-Mailman-Version: 2.1.12
Precedence: list
List-Id: Patches and discussions about the oe-core layer
	<openembedded-core.lists.openembedded.org>
List-Unsubscribe: <http://lists.openembedded.org/mailman/options/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.openembedded.org/pipermail/openembedded-core/>
List-Post: <mailto:openembedded-core@lists.openembedded.org>
List-Help: <mailto:openembedded-core-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.openembedded.org/mailman/listinfo/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Wed, 22 Jan 2014 12:57:25 -0000
X-Groupsio-MsgNum: 49374
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="CYcXvPfqKSDi0QhV"
Content-Disposition: inline

--CYcXvPfqKSDi0QhV
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Wed, Jan 22, 2014 at 02:48:44PM +0200, Valentin Popa wrote:
> On 01/22/2014 02:28 PM, Valentin Popa wrote:
> > On 01/08/2014 07:38 PM, Martin Jansa wrote:
> >> Hi,
> >>
> >> since this patch:
> >> commit 263e654e5d28fa7f6b0c8cc23f57a31448e88a40
> >> Author: Valentin Popa <valentin.popa@intel.com>
> >> Date:   Wed Oct 30 12:27:39 2013 +0200
> >>
> >>      Mesa: upgrade to 9.2.2
> >>
> >>      * License is still MIT
> >>      * removed patches were already merged or
> >>        another solution was backported.
> >>
> >> I have to define MESA_EGL_NO_X11_HEADERS in qtbase and qtwebkit again =
to
> >> build them without xlib.h available (DISTRO without x11 in
> >> DISTRO_FEATURES).
> >>
> >> Are you sure that
> >> meta/recipes-graphics/mesa/mesa-9.1.6/0003-EGL-Mutate-NativeDisplayTyp=
e-depending-on-config.patch=20
> >>
> >> was resolved in upstream?
> >>
> >> Regards,
> > Hi,
> > Sorry for this late response,
> > I removed that patch after testing wayland without X and worked.
> > I've tried yesterday to build qtbase  (meta-qt5) to see exactly what's=
=20
> > the problem and determine if indeed part of that patch has to be=20
> > upstream, but it was failing for not finding libGL (which of course,=20
> > we don't build with mesa when=20
> I meant: libGL is not built together with the other mesa libraries when=
=20
> DISTRO_FEATURES_remove=3D"x11" .
> > DISTRO_FEATURES_remove=3D"x11". Just not having X11 in DISTRO_FEATURES=
=20
> > doesn't mean you'll not have it).
> > Can you please give me some info about your config vars or your=20
> > environment so I find out what's the problem!? (I'm trying to=20
> > reproduce the issue).

Hi,

I don't see how building libGL relates to this problem, which is more
about mesa headers trying to include xlib.h which isn't available in
sysroot for DISTRO without x11 DISTRO_FEATURE.

Here is part of my discussion with Ross about this problem, let me know
if it's enough for you to see what the problem is:

18:33 < JaMa> rburton: do you still maintain mesa in oe-core?
18:47 < rburton> JaMa: i guess :)
18:47 < JaMa> rburton: http://lists.openembedded.org/pipermail/openembedded=
-core/2014-January/088072.html
18:48 < JaMa> rburton: I know you were working with upstream on this, so ma=
ybe you have better info than Valentin
18:54 < RP> JaMa: you'd be better addressing your email to ross as valentin=
  is away for a few weeks
18:55 < JaMa> ah OK, I've used valentin as author of that commit
20:43 < rburton> JaMa:  oh, *that*.  noted, will re-open that can of worms =
tomorrow.
20:43 < rburton> the upstream solution was effectively "use pkgconfig"
20:59 < JaMa> hmm checking if .pc really has that flag :)
21:00 < JaMa> rburton: it's there for gl.pc, but not in gles*.pc, but that =
doesn't mean it has to be there
21:01 < JaMa> I need to check what that failing build was using in qtbase/q=
twebkit
21:04 < rburton> JaMa: if you can mail the build log of what failed, that w=
ould be great
21:05 < JaMa> I'll have to simulate that with public layers first :)
21:05 < rburton> heh, yes :)
21:07 < JaMa> looking at qtbase/config.tests/x11/opengl/opengl.pro it just =
doesn't use pkg-config at all to read gl.pc
21:08 < JaMa> so as soon as  -DMESA_EGL_NO_X11_HEADERS was removed from mes=
a header it can try to load xlib.h
21:09 < rburton> that entire platform thing is mostly arse
21:10 < JaMa> somewhere in ./src/platformsupport/glxconvenience it loads so=
me mesa header which in turn loads xlib.h and fails
21:10 < JaMa> http://patchwork.openembedded.org/patch/60673/ this is basica=
lly the same

The conclusion is that if we cannot fix all apps to use pkgconfig when
searching for mesa, can we restore rebased
meta/recipes-graphics/mesa/mesa-9.1.6/0003-EGL-Mutate-NativeDisplayType-dep=
ending-on-config.patch
to fix them automatically?

--=20
Martin 'JaMa' Jansa     jabber: Martin.Jansa@gmail.com

--CYcXvPfqKSDi0QhV
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: Digital signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v2.0.22 (GNU/Linux)

iEYEARECAAYFAlLfwDQACgkQN1Ujt2V2gByYAwCgpLLS7R0FF94zz56HqTbcfStD
adMAoJ0+j4rmVze8MIBG/X6vgksCzwyz
=kbzx
-----END PGP SIGNATURE-----

--CYcXvPfqKSDi0QhV--
