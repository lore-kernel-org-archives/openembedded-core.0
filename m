Subject: repo and bitbake
To: openembedded-core@lists.openembedded.org
From: "Mike" <rabarberpie@gmail.com>
X-Originating-Location: Kaevlinge, Skåne County, SE (78.70.86.237)
X-Originating-Platform: Linux Chrome 89
User-Agent: GROUPS.IO Web Poster
MIME-Version: 1.0
Date: Sat, 01 May 2021 09:44:59 -0700
Message-ID: <eKyI.1619887499215737113.OOuc@lists.openembedded.org>
Content-Type: multipart/alternative; boundary="mE13fdAvKhRlUbbgK7kE"

--mE13fdAvKhRlUbbgK7kE
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: quoted-printable

Hi!

I am a beginner to bitbake and openembedded, so please bear with me.

In short, I have a custom system where I want to fetch all=C2=A0source cod=
e from a Gerrit server using the (Google) repo tool.
So, after repo init and sync, all source code is populated in my workspace=
 (thus, bitbake doesn't have to fetch or patch the sources).
The SW modules themselves use regular CMake, make, or autotools for buildi=
ng.
The workspace looks like:
(workdir)/subsystem_A/SW_module_1
(workdir)/subsystem_A/SW_module_2
(workdir)/subsystem_B/...
(workdir)/product_X/meta-...=C2=A0 =C2=A0 =C2=A0(this is were all bitbake =
files are stored in order to build product X)
(workdir)/product_Y/meta-...=C2=A0 =C2=A0 =C2=A0(this is were all bitbake =
files are stored in order to build product Y; common configs/recipes will b=
e a common product layer)
In product_X folder, I also plan to have a script that sets up the build e=
nv (similar to oe-init-build-env), creating folder:
(workdir/build/
and populate it with bblayers.conf and local.conf. bblayers.conf will add =
the layers at (workdir)/product_X/meta-...
From here, the building of the SW modules as well as the final image takes=
 place using bitbake.
The end result of the build is a ext4 file system image, which is flashed =
onto target device.

First basic question:
How do I properly set SRC_URI in the recipes to point to the SW_modules ab=
ove, with no fetching/patching. Can I avoid that bitbake
copy the source files to the build/tmp folder?
I don't want to list the source files in the recipe really, I just want to=
 refer to folder (workdir)/subsystem_A/SW_module_1
as the CMakeLists.txt (for CMake) tells which files to build etc. Thus, "f=
ile:://" doesn't sound a good idea.
I want to use inherit cmake and DEPENDS for managing deps.

Thanks!
Mike

--mE13fdAvKhRlUbbgK7kE
Content-Type: text/html; charset="utf-8"
Content-Transfer-Encoding: quoted-printable

<p>Hi!<br /><br />I am a beginner to bitbake and openembedded, so please be=
ar with me.<br /><br />In short, I have a custom system where I want to fet=
ch all&nbsp;source code from a Gerrit server using the (Google) repo tool.<=
br />So, after repo init and sync, all source code is populated in my works=
pace (thus, bitbake doesn't have to fetch or patch the sources).<br />The S=
W modules themselves use regular CMake, make, or autotools for building.<br=
 />The workspace looks like:<br />(workdir)/subsystem_A/SW_module_1<br />(w=
orkdir)/subsystem_A/SW_module_2<br />(workdir)/subsystem_B/...<br />(workdi=
r)/product_X/meta-...&nbsp; &nbsp; &nbsp;(this is were all bitbake files ar=
e stored in order to build product X)<br />(workdir)/product_Y/meta-...&nbs=
p; &nbsp; &nbsp;(this is were all bitbake files are stored in order to buil=
d product Y; common configs/recipes will be a common product layer)<br />In=
 product_X folder, I also plan to have a script that sets up the build env =
(similar to oe-init-build-env), creating folder:<br />(workdir/build/<br />=
and populate it with bblayers.conf and local.conf. bblayers.conf will add t=
he layers at (workdir)/product_X/meta-...<br />From here, the building of t=
he SW modules as well as the final image takes place using bitbake.<br />Th=
e end result of the build is a ext4 file system image, which is flashed ont=
o target device.<br /><br />First basic question:<br />How do I properly se=
t SRC_URI in the recipes to point to the SW_modules above, with no fetching=
/patching. Can I avoid that bitbake<br />copy the source files to the build=
/tmp folder?<br />I don't want to list the source files in the recipe reall=
y, I just want to refer to folder (workdir)/subsystem_A/SW_module_1<br />as=
 the CMakeLists.txt (for CMake) tells which files to build etc. Thus, "file=
:://" doesn't sound a good idea.<br />I want to use inherit cmake and DEPEN=
DS for managing deps.<br /><br />Thanks!<br />Mike<br /><br /></p>

--mE13fdAvKhRlUbbgK7kE--
