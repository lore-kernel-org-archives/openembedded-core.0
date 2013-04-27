Received: from mail-pb0-f46.google.com ([209.85.160.46])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <martin.jansa@gmail.com>)
	id 1UW8qf-00057S-Gw; Sat, 27 Apr 2013 19:23:46 +0200
Received: by mail-pb0-f46.google.com with SMTP id xa7so1468985pbc.5
	for <multiple recipients>; Sat, 27 Apr 2013 10:05:58 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=x-received:date:from:to:cc:subject:message-id:references
	:mime-version:content-type:content-disposition:in-reply-to
	:user-agent; bh=ElS5LKrhLxwWKng2rrLLf8sC7771cSIXY6MBNRWmz74=;
	b=E67EmWqElAEUCgutIOCcFQQIXgwHWrKQo54vY1UKgxrBc4al0l1bjJlTBid7KbdTSU
	6SDLq0F8ger4Lq0pXXt6VAHzLTJpURLcu1/0w4AkHqq14IzsKdib7EQx/Xcl6L6TcVvp
	3Hmrf3L66ryQi8yTAsH1ZxhJrbQVAQFdfKNM+2yqdFNUR2AmgRu1dnwPLNysXyvJFnkQ
	H8Cy4vKX62leQGY+Te5cLwqyZ3yOWUsIoLMSlt5OQu3iBCJXdmOgYZJWslO+Wvk4PiwU
	AswwO656Vg8YbzKZXbaJcdrNvgd39MCSnBR+NYaxnIvSI5IvQe6eBq1QQNihxHEARdsC
	wp5Q==
X-Received: by 10.68.184.132 with SMTP id eu4mr64503563pbc.87.1367082357955;
	Sat, 27 Apr 2013 10:05:57 -0700 (PDT)
Received: from localhost (ip-62-24-80-145.net.upcbroadband.cz. [62.24.80.145])
	by mx.google.com with ESMTPSA id
	fm2sm17926141pab.13.2013.04.27.10.05.54 for <multiple recipients>
	(version=TLSv1.2 cipher=RC4-SHA bits=128/128);
	Sat, 27 Apr 2013 10:05:56 -0700 (PDT)
Date: Sat, 27 Apr 2013 19:06:08 +0200
From: Martin Jansa <martin.jansa@gmail.com>
To: Paul Barker <paul@paulbarker.me.uk>
Message-ID: <20130427170608.GD3199@jama>
References: <20121213174202.GE3356@jama.jama.net>
	<20130415141253.GC10628@jama.dyndns-home.com>
	<20130427105400.GB3199@jama> <1505854.4Uj52mcVBD@helios>
	<20130427113554.GC3199@jama>
	<CANyK_8ehcHZKvEeXAhqBUQ=7sPLu=i067ok9yEBCjF7A7ekqkw@mail.gmail.com>
MIME-Version: 1.0
In-Reply-To: <CANyK_8ehcHZKvEeXAhqBUQ=7sPLu=i067ok9yEBCjF7A7ekqkw@mail.gmail.com>
User-Agent: Mutt/1.5.21 (2010-09-15)
Cc: Paul Eggleton <paul.eggleton@linux.intel.com>,
	openembedded-devel@lists.openembedded.org,
	openembedded-core <openembedded-core@lists.openembedded.org>
Subject: Re: [oe] State of bitbake world
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
X-List-Received-Date: Sat, 27 Apr 2013 17:23:50 -0000
X-Groupsio-MsgNum: 38501
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="GyRA7555PLgSTuth"
Content-Disposition: inline

--GyRA7555PLgSTuth
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Sat, Apr 27, 2013 at 05:27:49PM +0100, Paul Barker wrote:
> On 27 April 2013 12:35, Martin Jansa <martin.jansa@gmail.com> wrote:
> >
> > I was hoping that people who care about them will step up and fix them
> > to build at least in default configuration - that's why I started to
> > send "state of bitbake world" emails.
> >
>=20
> Most of the patches I've sent so far have resulted from running
> 'bitbake world' and seeing what warnings/errors I get. For raspberrypi
> my current BBMASK is:

That's great, I'm glad that I'm not the only one..

> /(rpi-first-run-wizard|qcanobserver|mesa-demos|packagegroup-core-tools|we=
ston|gperftools|gst-plugins-gl|omxplayer|php|luajit|strongswan|mplayer2|net=
-snmp|openmotif|lzip|mg|vlc)

Some of those were already fixed, I've similar list, you can see it in
those directories with world build logs:
http://logs.nslu2-linux.org/buildlogs/oe/oe-shr-core-branches/log.world.201=
30427_044751.log/world_mask.inc

but in some builds I tend to disable this .inc, because sometimes I add
stuff I know is broken to this file and then forget about it.. that's
why libunwind was merged, even when it was broken on qemuarm..

Moving broken recipes to "nonworking" directory instead of adding
PNBLACKLIST in this file is more visible to others (and in some cases it
forces people to really fix that - e.g. koen fixed couple of recipes he
cares about after I've sent removal commits and that's of course better
then (re)moving them.

Maybe we can share this list as some .inc file in meta-openembedded
repository but still looks a bit weird to keep broken recipes and then
exclude them explicitly.

Some recipes aren't broken per se, just pickly about enabled
DISTRO_FEATURES, TARGET_ARCH or kernel config etc.., but those should be
fixed too. Skipping package when required DISTRO_FEATURE is missing is
better then failing do_compile a bit later, comment will also help
someone to find out what he needs to enable to build that, example:
http://git.openembedded.org/openembedded-core/commit/meta/recipes-graphics/=
xorg-driver/xf86-video-omap_git.bb?id=3D4c2434271cfc41e910969266ced9e5f06ee=
0c732

Also when some recipe in given version is known to be broken for some
arch, then imho better to explicitly say so and then maybe remove that
restriction later when newer version fixes that, example:
https://github.com/shr-distribution/meta-smartphone/commit/53271cc6637c759f=
ff04e25cc262d43530a3b0fd

And worst is last group of packages failing because something else was
upgraded or changed and now it fails, e.g. emacs is now failing when
building for x86/x86-64 because qemu-native is segfaulting, but the same
qemu-native works fine when building emacs for arm..
It's not emacs fault, if I mark it as incompatible with x86* then when
qemu is fixed, nobody will notice and change emacs recipe to show it's
working for x86* again.

> Though that includes a few fetch fails which might work now. My notes say:
>=20
> # rpi-first-run-wizard: no provider for zenity
> # qcanobserver: compile error
> # soft66: warning: Includes host paths
> # strongswan: fetch failure
> # lzip: fetch failure
> # mg: can't find term.h
> # zram: warning: systemd unshipped files
> # cloud9: warning: systemd unshipped files
>=20
> I'll be adding more notes and taking another look over this, if
> there's anything in particular that should definitely be working but
> I've had to mask out, let me know and I'll give it another look.
>=20
> (apologies for the noise due to gmail's big send button being so close
> to the bottom of the edit window and needing no confirmation)

I print qa.log at the end of world builds just to see if some new
changes I'm testing are creating new QA issues, now the list is not so
long as it used to be, so there is higher chance I'll notice new
entries, but it has 2 problems

1) QA issues are not listed when something is reused from sstate-cache
-> I'm removing sstate-cache when I can afford to keep jenkins busy for
3 days rebuilding 3 qemu* MACHINEs

2) not all WARNINGs shown when building are considered as QA issues and
not listed in qa.log, especially those about overwriting files in
sysroot are interesting in world builds, there is bug about that
https://bugzilla.yoctoproject.org/show_bug.cgi?id=3D4085

Yes I can grep cooker log for all WARNINGs, but it's quite long in world
build and harder to extract that warning, because it has variable number
of lines and there isn't any closing "tag"=20

--=20
Martin 'JaMa' Jansa     jabber: Martin.Jansa@gmail.com

--GyRA7555PLgSTuth
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: Digital signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v2.0.19 (GNU/Linux)

iEYEARECAAYFAlF8BYAACgkQN1Ujt2V2gByDUACfYm14MUopYsJOkhTDKg3vz678
PJcAn1WVdx20WBFn8y1DEnX42am/Qo2q
=i5TK
-----END PGP SIGNATURE-----

--GyRA7555PLgSTuth--
