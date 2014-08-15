Return-Path: <martin.jansa@gmail.com>
Received: from mail-la0-f44.google.com (mail-la0-f44.google.com
	[209.85.215.44])
	by mail.openembedded.org (Postfix) with ESMTP id 0C50965CB2
	for <openembedded-core@lists.openembedded.org>;
	Fri, 15 Aug 2014 14:52:36 +0000 (UTC)
Received: by mail-la0-f44.google.com with SMTP id el20so2395624lab.17
	for <openembedded-core@lists.openembedded.org>;
	Fri, 15 Aug 2014 07:52:37 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=from:date:to:cc:subject:message-id:references:mime-version
	:content-type:content-disposition:in-reply-to:user-agent;
	bh=6kzNFq2PaREaH5H7hNWBd5ol3ACp+YV/PLG/XcYp3aI=;
	b=x3z72Uqra2q6dat2I0QWCB1YDBdB+RAmpyL5t7avg3vd2T9jSfP/OCCA4MeFeBUaGI
	h3c/kT5NKtY+ZEZcgClkQt1zMLenXyHLUBn7D0TvQzEaGOzUGQbVuTJrYxqxnblGYBGa
	WGC/jKNp7W5HdXlkQ6mYrQyZn/5wcpsc3CR+9z20UxrdMRBVqQ8MdPAI0uFA2lxgX5xq
	F3Ll+zpkM5hibnXvcUKwsviY5mvHwu+w/tKz4l7h4FQdoU8tt3INwuyjKLhChulNZHGM
	NYXVPaZlLjsEFUQPNErx3xGCa61OuIJCNcmgc4t7831GecGYF72vUH/DGvqC/zvCkQW6
	G2RQ==
X-Received: by 10.152.10.169 with SMTP id j9mr12633839lab.69.1408114356809;
	Fri, 15 Aug 2014 07:52:36 -0700 (PDT)
Received: from localhost (ip-89-176-104-3.net.upcbroadband.cz. [89.176.104.3])
	by mx.google.com with ESMTPSA id
	o4sm5114235lag.47.2014.08.15.07.52.35 for <multiple recipients>
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Fri, 15 Aug 2014 07:52:35 -0700 (PDT)
From: Martin Jansa <martin.jansa@gmail.com>
X-Google-Original-From: Martin Jansa <Martin.Jansa@gmail.com>
Date: Fri, 15 Aug 2014 16:53:14 +0200
To: Carlos Rafael Giani <dv@pseudoterminal.org>
Message-ID: <20140815145314.GH22747@jama>
References: <53EBD780.9060005@mlbassoc.com>
	<CAP9ODKpND6P-x7ZKE9SuZ6vbfFF8RxoVSL3X9UDzj-WhV9yTpw@mail.gmail.com>
	<CAMKF1soYYaAQ9tY7462=zEgo9urFaaAV-qDk6qhO=8_n0xdDyA@mail.gmail.com>
	<53EC6F53.4070908@pseudoterminal.org>
	<53EC71B1.3000200@pabigot.com>
	<53EC723D.5000807@pseudoterminal.org>
MIME-Version: 1.0
In-Reply-To: <53EC723D.5000807@pseudoterminal.org>
User-Agent: Mutt/1.5.23 (2014-03-12)
Cc: openembedded-core@lists.openembedded.org
Subject: Re: GCC 4.9 considered evil
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
X-List-Received-Date: Fri, 15 Aug 2014 14:52:44 -0000
X-Groupsio-MsgNum: 56593
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="xQmOcGOVkeO43v2v"
Content-Disposition: inline

--xQmOcGOVkeO43v2v
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Thu, Aug 14, 2014 at 10:24:29AM +0200, Carlos Rafael Giani wrote:
> On 08/14/2014 10:22 AM, Peter A. Bigot wrote:
> > On 08/14/2014 03:12 AM, Carlos Rafael Giani wrote:
> >> On 08/14/2014 02:46 AM, Khem Raj wrote:
> >>>
> >>>
> >>> On Wednesday, August 13, 2014, Otavio Salvador=20
> >>> <otavio@ossystems.com.br <mailto:otavio@ossystems.com.br>> wrote:
> >>>
> >>>     On Wed, Aug 13, 2014 at 6:24 PM, Gary Thomas <gary@mlbassoc.com
> >>>     <javascript:;>> wrote:
> >>>     > I've found that the latest GCC doesn't work very well, at
> >>>     > least not on ARM (and obviously other architectures as well [1])
> >>>     > When I build Google Chromium browser for my i.MX boards using
> >>>     > GCC-4.9.x, no pages can be rendered - massive bloodshed and
> >>>     > failures are shown on the console.  If I use the older GCC 4.8.=
2,
> >>>     > everything else the same, all is well.
> >>>     >
> >>>     > Here's my configuration:
> >>>     > BB_VERSION        =3D "1.23.1"
> >>>     > BUILD_SYS         =3D "x86_64-linux"
> >>>     > NATIVELSBSTRING   =3D "Ubuntu-13.10"
> >>>     > TARGET_SYS        =3D "arm-amltd-linux-gnueabi"
> >>>     > MACHINE           =3D "teton-p0382"
> >>>     > DISTRO            =3D "amltd"
> >>>     > DISTRO_VERSION    =3D "1.6+snapshot-20140812"
> >>>     > TUNE_FEATURES     =3D "arm armv7a vfp neon callconvention-hard
> >>>     cortexa9"
> >>>     > TARGET_FPU        =3D "vfp-neon"
> >>>     > meta              =3D
> >>>     "master:86afd7eb7c679eb065706137f28f44248f3fbc5a"
> >>>     > meta-amltd        =3D
> >>>     "master:899529b4184dc9e3e291e7fcdbbf157233db056d"
> >>>     > meta-teton-imx6-p0382 =3D
> >>>     "master:9188e2f8fafd203c95dcd7a3c79cb38a1568e9b5"
> >>>     > meta-fsl-arm      =3D
> >>>     "master:b0cf5c78c5f98c5977ae556d331e7495648f154c"
> >>>     > meta-fsl-arm-extra =3D
> >>>     "master:12e560967b7136222c325d11633295fe3a0c701c"
> >>>     > meta-browser      =3D
> >>>     "master:da93c8e386133a15eff1414d9307c8f2c7a44787"
> >>>     >
> >>>     > Should this be filed as a bug?  I don't have much data other
> >>>     than it
> >>>     > simply breaks (and chrome is not the easiest thing to debug!).
> >>>      Other
> >>>     > applications seem OK, but I am loathe to trust it...
> >>>     >
> >>>     > I'm going to hold onto GCC-4.8.x for my $DISTRO at least (and
> >>>     I hope
> >>>     > it doesn't vanish like 4.7.x did too quickly).
> >>>     >
> >>>     > [1]
> >>>     >
> >>>     http://slashdot.org/story/14/07/27/1838219/linus-torvalds-gcc-490=
-seems-to-be-terminally-broken
> >>>     >
> >>>     > Note: I've also tried this on qemux86 (a totally different
> >>>     > architecture) and chrome bombs just as badly!
> >>>
> >>>     I confirm that GCC 4.9 does NOT work for Chromium 35. At this
> >>>     moment I
> >>>     am not aware of any fix for it.
> >>>
> >>>
> >>> Again Its a broad brush statement. Something concrete is needed if=20
> >>> some.action is to taken
> >>>
> >>>
> >>>     IIRC the Chromium 37 works though.
> >>>
> >>>
> >>> Well then its less chance.that someone will fix 35
> >>>
> >>>     --
> >>>     Otavio Salvador                             O.S. Systems
> >>>     http://www.ossystems.com.br http://code.ossystems.com.br
> >>>     Mobile: +55 (53) 9981-7854            Mobile: +1 (347) 903-9750
> >>>     --
> >>>     _______________________________________________
> >>>     Openembedded-core mailing list
> >>>     Openembedded-core@lists.openembedded.org <javascript:;>
> >>>     http://lists.openembedded.org/mailman/listinfo/openembedded-core
> >>>
> >>>
> >>>
> >>
> >>
> >> The problem is that narrowing down is very difficult, since the=20
> >> problems manifest themselves as seemingly random stack corruptions. I=
=20
> >> have tried to dig into it, but got nowhere. Pointers suddenly became=
=20
> >> null for no apparent reason, or were corrupted, free() calls failed,=
=20
> >> values on the stack suddenly changed without being modified by the=20
> >> code etc.
> >>
> >> I wouldn't rule out that Linus Torvald's find isn't the cause here.=20
> >> Look at this part of his message:
> >>
> >> "The x86-64 ABI specifies a 128-byte red-zone under the stack=20
> >> pointer, and this is ok by that limit. It looks like it's illegal=20
> >> (136 > 128), but the fact is, we've had four "pushq"s to update %rsp=
=20
> >> since loading the frame pointer, so it's just *barely* legal with the=
=20
> >> red-zoning."
> >>
> >> Perhaps gcc is pushing further outside of the red zone bounds, thus=20
> >> causing the problems. No idea how to check for that at the moment thou=
gh.
> >
> > Simplest would be to apply the upstream fix to Yocto's gcc and see if=
=20
> > that helps.  You'd want commit=20
> > 556537c4ad0df4cbebb74197bb2bdea75cf5dd35 from=20
> > git://gcc.gnu.org/git/gcc.git.  (The patch went into gcc-4_9-branch=20
> > one day after 4.9.1 was released.)
> >
> > I'd add it to the current set but ATT Khem and I both have pending=20
> > patches that touch the same gcc files, so it'd just increase the=20
> > conflicts.
> >
> > Peter
> >
> >>
> >>
> >
> >
> >
>=20
>=20
>=20
> To further elaborate, the Chromium developers know about problems with=20
> GCC 4.9. Here is an example:=20
> https://code.google.com/p/chromium/issues/detail?id=3D385729
>=20
> Note that while a build of Chromium 37 works, I've had internal compiler=
=20
> errors happen. I actually had to re-run the run.do_compile script about=
=20
> 30 times until the build finished (the ICE's happen only sometimes, so=20
> repeated attempts at compiling eventually yields a result.)
>=20
> Thanks for the link. I'll try it out when I have the time. Aside from=20
> that, I recommend to keep the GCC 4.8 recipes for the time being. At=20
> least they should not be removed as quickly as the 4.7 ones.

You're not seeing this with 37* chromium builds?

It's repeated in all world builds for some time.

| /home/jenkins/oe/world/shr-core/tmp-eglibc/sysroots/x86_64-linux/usr/bin/=
x86_64-oe-linux/x86_64-oe-linux-ld.gold: warning: hidden symbol 'sqlite3_mp=
rintf' in obj/third_party/sqlite/libsqlite3.a(obj/third_party/sqlite/amalga=
mation/sqlite.sqlite3.o) is referenced by DSO /home/jenkins/oe/world/shr-co=
re/tmp-eglibc/sysroots/qemux86-64/usr/lib/../lib/libsoftokn3.so
| /home/jenkins/oe/world/shr-core/tmp-eglibc/sysroots/x86_64-linux/usr/bin/=
x86_64-oe-linux/x86_64-oe-linux-ld.gold: warning: hidden symbol 'sqlite3_ex=
ec' in obj/third_party/sqlite/libsqlite3.a(obj/third_party/sqlite/amalgamat=
ion/sqlite.sqlite3.o) is referenced by DSO /home/jenkins/oe/world/shr-core/=
tmp-eglibc/sysroots/qemux86-64/usr/lib/../lib/libsoftokn3.so
| /home/jenkins/oe/world/shr-core/tmp-eglibc/sysroots/x86_64-linux/usr/bin/=
x86_64-oe-linux/x86_64-oe-linux-ld.gold: warning: hidden symbol 'sqlite3_fr=
ee' in obj/third_party/sqlite/libsqlite3.a(obj/third_party/sqlite/amalgamat=
ion/sqlite.sqlite3.o) is referenced by DSO /home/jenkins/oe/world/shr-core/=
tmp-eglibc/sysroots/qemux86-64/usr/lib/../lib/libsoftokn3.so
| /home/jenkins/oe/world/shr-core/tmp-eglibc/sysroots/x86_64-linux/usr/bin/=
x86_64-oe-linux/x86_64-oe-linux-ld.gold: warning: hidden symbol 'sqlite3_re=
set' in obj/third_party/sqlite/libsqlite3.a(obj/third_party/sqlite/amalgama=
tion/sqlite.sqlite3.o) is referenced by DSO /home/jenkins/oe/world/shr-core=
/tmp-eglibc/sysroots/qemux86-64/usr/lib/../lib/libsoftokn3.so
| /home/jenkins/oe/world/shr-core/tmp-eglibc/sysroots/x86_64-linux/usr/bin/=
x86_64-oe-linux/x86_64-oe-linux-ld.gold: warning: hidden symbol 'sqlite3_fi=
nalize' in obj/third_party/sqlite/libsqlite3.a(obj/third_party/sqlite/amalg=
amation/sqlite.sqlite3.o) is referenced by DSO /home/jenkins/oe/world/shr-c=
ore/tmp-eglibc/sysroots/qemux86-64/usr/lib/../lib/libsoftokn3.so
| /home/jenkins/oe/world/shr-core/tmp-eglibc/sysroots/x86_64-linux/usr/bin/=
x86_64-oe-linux/x86_64-oe-linux-ld.gold: warning: hidden symbol 'sqlite3_cl=
ose' in obj/third_party/sqlite/libsqlite3.a(obj/third_party/sqlite/amalgama=
tion/sqlite.sqlite3.o) is referenced by DSO /home/jenkins/oe/world/shr-core=
/tmp-eglibc/sysroots/qemux86-64/usr/lib/../lib/libsoftokn3.so
| /home/jenkins/oe/world/shr-core/tmp-eglibc/sysroots/x86_64-linux/usr/bin/=
x86_64-oe-linux/x86_64-oe-linux-ld.gold: warning: hidden symbol 'sqlite3_st=
ep' in obj/third_party/sqlite/libsqlite3.a(obj/third_party/sqlite/amalgamat=
ion/sqlite.sqlite3.o) is referenced by DSO /home/jenkins/oe/world/shr-core/=
tmp-eglibc/sysroots/qemux86-64/usr/lib/../lib/libsoftokn3.so
| /home/jenkins/oe/world/shr-core/tmp-eglibc/sysroots/x86_64-linux/usr/bin/=
x86_64-oe-linux/x86_64-oe-linux-ld.gold: warning: hidden symbol 'sqlite3_co=
lumn_int' in obj/third_party/sqlite/libsqlite3.a(obj/third_party/sqlite/ama=
lgamation/sqlite.sqlite3.o) is referenced by DSO /home/jenkins/oe/world/shr=
-core/tmp-eglibc/sysroots/qemux86-64/usr/lib/../lib/libsoftokn3.so
| /home/jenkins/oe/world/shr-core/tmp-eglibc/sysroots/x86_64-linux/usr/bin/=
x86_64-oe-linux/x86_64-oe-linux-ld.gold: warning: hidden symbol 'sqlite3_pr=
epare_v2' in obj/third_party/sqlite/libsqlite3.a(obj/third_party/sqlite/ama=
lgamation/sqlite.sqlite3.o) is referenced by DSO /home/jenkins/oe/world/shr=
-core/tmp-eglibc/sysroots/qemux86-64/usr/lib/../lib/libsoftokn3.so
| /home/jenkins/oe/world/shr-core/tmp-eglibc/sysroots/x86_64-linux/usr/bin/=
x86_64-oe-linux/x86_64-oe-linux-ld.gold: warning: hidden symbol 'sqlite3_bi=
nd_blob' in obj/third_party/sqlite/libsqlite3.a(obj/third_party/sqlite/amal=
gamation/sqlite.sqlite3.o) is referenced by DSO /home/jenkins/oe/world/shr-=
core/tmp-eglibc/sysroots/qemux86-64/usr/lib/../lib/libsoftokn3.so
| /home/jenkins/oe/world/shr-core/tmp-eglibc/sysroots/x86_64-linux/usr/bin/=
x86_64-oe-linux/x86_64-oe-linux-ld.gold: warning: hidden symbol 'sqlite3_bi=
nd_int' in obj/third_party/sqlite/libsqlite3.a(obj/third_party/sqlite/amalg=
amation/sqlite.sqlite3.o) is referenced by DSO /home/jenkins/oe/world/shr-c=
ore/tmp-eglibc/sysroots/qemux86-64/usr/lib/../lib/libsoftokn3.so
| /home/jenkins/oe/world/shr-core/tmp-eglibc/sysroots/x86_64-linux/usr/bin/=
x86_64-oe-linux/x86_64-oe-linux-ld.gold: warning: hidden symbol 'sqlite3_bi=
nd_text' in obj/third_party/sqlite/libsqlite3.a(obj/third_party/sqlite/amal=
gamation/sqlite.sqlite3.o) is referenced by DSO /home/jenkins/oe/world/shr-=
core/tmp-eglibc/sysroots/qemux86-64/usr/lib/../lib/libsoftokn3.so
| /home/jenkins/oe/world/shr-core/tmp-eglibc/sysroots/x86_64-linux/usr/bin/=
x86_64-oe-linux/x86_64-oe-linux-ld.gold: warning: hidden symbol 'sqlite3_op=
en' in obj/third_party/sqlite/libsqlite3.a(obj/third_party/sqlite/amalgamat=
ion/sqlite.sqlite3.o) is referenced by DSO /home/jenkins/oe/world/shr-core/=
tmp-eglibc/sysroots/qemux86-64/usr/lib/../lib/libsoftokn3.so
| /home/jenkins/oe/world/shr-core/tmp-eglibc/sysroots/x86_64-linux/usr/bin/=
x86_64-oe-linux/x86_64-oe-linux-ld.gold: warning: hidden symbol 'sqlite3_bu=
sy_timeout' in obj/third_party/sqlite/libsqlite3.a(obj/third_party/sqlite/a=
malgamation/sqlite.sqlite3.o) is referenced by DSO /home/jenkins/oe/world/s=
hr-core/tmp-eglibc/sysroots/qemux86-64/usr/lib/../lib/libsoftokn3.so
| /home/jenkins/oe/world/shr-core/tmp-eglibc/sysroots/x86_64-linux/usr/bin/=
x86_64-oe-linux/x86_64-oe-linux-ld.gold: warning: hidden symbol 'sqlite3_co=
lumn_bytes' in obj/third_party/sqlite/libsqlite3.a(obj/third_party/sqlite/a=
malgamation/sqlite.sqlite3.o) is referenced by DSO /home/jenkins/oe/world/s=
hr-core/tmp-eglibc/sysroots/qemux86-64/usr/lib/../lib/libsoftokn3.so
| /home/jenkins/oe/world/shr-core/tmp-eglibc/sysroots/x86_64-linux/usr/bin/=
x86_64-oe-linux/x86_64-oe-linux-ld.gold: warning: hidden symbol 'sqlite3_co=
lumn_blob' in obj/third_party/sqlite/libsqlite3.a(obj/third_party/sqlite/am=
algamation/sqlite.sqlite3.o) is referenced by DSO /home/jenkins/oe/world/sh=
r-core/tmp-eglibc/sysroots/qemux86-64/usr/lib/../lib/libsoftokn3.so
| /home/jenkins/oe/world/shr-core/tmp-eglibc/sysroots/x86_64-linux/usr/bin/=
x86_64-oe-linux/x86_64-oe-linux-ld.gold: warning: hidden symbol 'sqlite3_fi=
le_control' in obj/third_party/sqlite/libsqlite3.a(obj/third_party/sqlite/a=
malgamation/sqlite.sqlite3.o) is referenced by DSO /home/jenkins/oe/world/s=
hr-core/tmp-eglibc/sysroots/qemux86-64/usr/lib/../lib/libsoftokn3.so
| /home/jenkins/oe/world/shr-core/tmp-eglibc/sysroots/x86_64-linux/usr/bin/=
x86_64-oe-linux/x86_64-oe-linux-ld.gold: warning: hidden symbol 'sqlite3_te=
mp_directory' in obj/third_party/sqlite/libsqlite3.a(obj/third_party/sqlite=
/amalgamation/sqlite.sqlite3.o) is referenced by DSO /home/jenkins/oe/world=
/shr-core/tmp-eglibc/sysroots/qemux86-64/usr/lib/../lib/libsoftokn3.so
| /home/jenkins/oe/world/shr-core/tmp-eglibc/sysroots/x86_64-linux/usr/bin/=
x86_64-oe-linux/x86_64-oe-linux-ld.gold: error: treating warnings as errors
| collect2: error: ld returned 1 exit status
| ninja: build stopped: subcommand failed.
| WARNING: exit code 1 from a shell command.
| ERROR: Function failed: do_compile (log file is located at /home/jenkins/=
oe/world/shr-core/tmp-eglibc/work/core2-64-oe-linux/chromium/37.0.2062.0-r0=
/temp/log.do_compile.14955)
NOTE: recipe chromium-37.0.2062.0-r0: task do_compile: Failed

--=20
Martin 'JaMa' Jansa     jabber: Martin.Jansa@gmail.com

--xQmOcGOVkeO43v2v
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: Digital signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v2

iEYEARECAAYFAlPuHtoACgkQN1Ujt2V2gBx0SQCcDoxiC3IMEErNAfbUMIK6/F5t
OV4An3m0gzEiNioLvrN/6odFyv5RcQEn
=Bdy7
-----END PGP SIGNATURE-----

--xQmOcGOVkeO43v2v--
