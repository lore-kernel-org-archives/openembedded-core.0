Received: from mail-we0-f175.google.com ([74.125.82.175])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <sra1sandela@gmail.com>) id 1T4bsR-0001aG-Hc
	for openembedded-core@lists.openembedded.org;
	Thu, 23 Aug 2012 20:11:31 +0200
Received: by weyr6 with SMTP id r6so542396wey.6
	for <openembedded-core@lists.openembedded.org>;
	Thu, 23 Aug 2012 10:59:25 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=mime-version:date:message-id:subject:from:to:content-type;
	bh=gPnl3acgC+y6sgkF1UC3gTL4zmqadthRucI2lSIwUJY=;
	b=J3seaN8ZEQgWXVtCWAckVunoHyp7HRhML1EFAEtoNs65HKOEGXB++EUzJNMAL+jwsw
	U0MviGWgik9yWPFgu1qiUiun69IV2n2a7fqzfdaRw/uIQm47g9BPQvMy5Pqz1dhPM6zl
	l86lDUEELpJlDAfd0Jo0Bns1R0CqdLus53QeUwWw2Yu0l8PH5tQgyZHrXhRQURAsSu7H
	W9J/oa7D12nvqXDye3GOn5tCGlyttPdupUw9sod5uX5TCMP4hZyeaQuOs+pF4jsRYFsT
	/KdovssfiiRwyA35Rc0RNGlRcczMBbOIpYRtkyMjIFt8ZdSXu0eIJH90MsGzRlyqV03p
	gXKg==
MIME-Version: 1.0
Received: by 10.180.96.199 with SMTP id du7mr5851462wib.21.1345744765013; Thu,
	23 Aug 2012 10:59:25 -0700 (PDT)
Received: by 10.216.224.35 with HTTP; Thu, 23 Aug 2012 10:59:24 -0700 (PDT)
Date: Thu, 23 Aug 2012 10:59:24 -0700
Message-ID: <CALN+Pg3chDYX-R1+=GiqGbdMf+2uncZhmvU50vvqENkxC2M3+w@mail.gmail.com>
From: Sravan <sra1sandela@gmail.com>
To: openembedded-core@lists.openembedded.org
Subject: Tackling compilation errors in qt5 recipe.
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
X-List-Received-Date: Thu, 23 Aug 2012 18:11:31 -0000
Content-Type: multipart/alternative; boundary=f46d04426b8aad4fd304c7f29e7d

--f46d04426b8aad4fd304c7f29e7d
Content-Type: text/plain; charset=ISO-8859-1

Hello,

I never worked on oe/bitbake before.
I am trying to write recipes for Qt5(based on
http://qt-project.org/wiki/Building_Qt_5_from_Git) .
How ever i am stuck with few compilation errors that am able to slowly fix
and move forward, by disabling them through "config" options.

So, far i have used following options in config to get rid of compilation
errors, is it the right approach? My end goal is to have a separate recipe
file for Qt5 that is good enough to run webkit.
Following are the flags that i am using

QT_CONFIG_FLAGS = "-no-avx -no-opengl -no-neon -no-rpath -qconfig full
            -release -opensource -confirm-license -no-pch \

            -nomake examples -nomake demos  -no-sse2 -no-ssse3 \

            -nomake tests -no-gtkstyle -nomake translations \

            -qt-zlib -qt-libpng -qt-libjpeg -qt-sql-sqlite"

and my

Build Configuration:
BB_VERSION        = "1.15.2"
TARGET_ARCH       = "i586"
TARGET_OS         = "linux"
MACHINE           = "qemux86"
DISTRO            = "webos"
DISTRO_VERSION    = "1.0"
TUNE_FEATURES     = "m32 i586"
TARGET_FPU        = ""
meta              = "(nobranch):1b40dac2c501ae8c8d812cf2866fe7917f144a19"
meta-oe           = "(nobranch):31bb03eba7c2e928cbc069eea61a5ae2a8d9fe51"
meta-webos        =
"qt5-recipes-qt5:f7df573d4af74b77d8747c9e84c7e8fd2fb70156"


Please suggest how can i be sure that this approach is fine, and wont hurt
me after building webkit to run with Qt5.

-Sravan.

--f46d04426b8aad4fd304c7f29e7d
Content-Type: text/html; charset=ISO-8859-1
Content-Transfer-Encoding: quoted-printable

Hello,
<div><br></div><div>I never worked on oe/bitbake before.=A0</div><div>I am =
trying to write recipes for Qt5(based on=A0<a href=3D"http://qt-project.org=
/wiki/Building_Qt_5_from_Git" target=3D"_blank">http://qt-project.org/wiki/=
Building_Qt_5_from_Git</a>) .</div>

<div>How ever i am stuck with few compilation errors that am able to slowly=
 fix and move forward, by disabling them through &quot;config&quot; options=
.</div><div><br></div><div>So, far i have used following options in config =
to get rid of compilation errors, is it the right approach? My end goal is =
to have a separate recipe file for Qt5 that is good enough to run webkit.</=
div>
<div>Following are the flags that i am using</div><div><br></div><div><div>=
QT_CONFIG_FLAGS =3D &quot;-no-avx -no-opengl -no-neon -no-rpath -qconfig fu=
ll=A0</div><div>=A0 =A0 =A0 =A0 =A0 =A0 -release -opensource -confirm-licen=
se -no-pch \ =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0</div>
<div>=A0 =A0 =A0 =A0 =A0 =A0 -nomake examples -nomake demos =A0-no-sse2 -no=
-ssse3 \ =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0=A0</div><div>=A0 =A0 =A0 =A0 =
=A0 =A0 -nomake tests -no-gtkstyle -nomake translations \ =A0 =A0 =A0 =A0 =
=A0 =A0 =A0 =A0 =A0 =A0 =A0</div><div>=A0 =A0 =A0 =A0 =A0 =A0 -qt-zlib -qt-=
libpng -qt-libjpeg -qt-sql-sqlite&quot;=A0</div>
</div><div><br></div><div>and my=A0</div><div><br></div><div><div>
Build Configuration:</div><div>BB_VERSION =A0 =A0 =A0 =A0=3D &quot;1.15.2&q=
uot;</div><div>TARGET_ARCH =A0 =A0 =A0 =3D &quot;i586&quot;</div><div>TARGE=
T_OS =A0 =A0 =A0 =A0 =3D &quot;linux&quot;</div><div>MACHINE =A0 =A0 =A0 =
=A0 =A0 =3D &quot;qemux86&quot;</div>
<div>
DISTRO =A0 =A0 =A0 =A0 =A0 =A0=3D &quot;webos&quot;</div><div>DISTRO_VERSIO=
N =A0 =A0=3D &quot;1.0&quot;</div><div>TUNE_FEATURES =A0 =A0 =3D &quot;m32 =
i586&quot;</div><div>TARGET_FPU =A0 =A0 =A0 =A0=3D &quot;&quot;</div><div>m=
eta =A0 =A0 =A0 =A0 =A0 =A0 =A0=3D &quot;(nobranch):1b40dac2c501ae8c8d812cf=
2866fe7917f144a19&quot;</div>

<div>meta-oe =A0 =A0 =A0 =A0 =A0 =3D &quot;(nobranch):31bb03eba7c2e928cbc06=
9eea61a5ae2a8d9fe51&quot;</div><div>meta-webos =A0 =A0 =A0 =A0=3D &quot;qt5=
-recipes-qt5:f7df573d4af74b77d8747c9e84c7e8fd2fb70156&quot;</div></div><div=
><br></div><div><br>
</div><div>Please suggest how can i be sure that this approach is fine, and=
 wont hurt me after building webkit to run with Qt5.</div><div><br></div><d=
iv>-Sravan.</div>

--f46d04426b8aad4fd304c7f29e7d--
