Received: from mail-wg0-f43.google.com ([74.125.82.43])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <sra1sandela@gmail.com>) id 1T4z8i-0003mo-Hq
	for openembedded-core@lists.openembedded.org;
	Fri, 24 Aug 2012 21:01:52 +0200
Received: by wgbdr1 with SMTP id dr1so1402054wgb.24
	for <openembedded-core@lists.openembedded.org>;
	Fri, 24 Aug 2012 11:49:44 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=mime-version:in-reply-to:references:date:message-id:subject:from:to
	:cc:content-type;
	bh=Td4t1fpV3n8ffHTRDD3hBaROKcj6OQUbdvnnzjYkXrM=;
	b=mg25bLE7XVdTg7yOulgklj5cs41MIuXzCoigjesfuhrCiRAwoLY8cyrLXeBuWZRkKK
	/jngVsxuGbSQaKsb1e6eruR/2JiAauJUppDjosKd1wzWbINy9oD+CdWCYyNTTP/9vzjC
	LODdva/KQtoSVVwAaaldkQrWLVeQ8kQ65BQqfPdtUfCgqy9ymx4kuTtsvrwM20Kt4tpS
	Y510c5MEbcZli3e7cfkWrwgPmiB/+ZxV7eV+7OzxWvfF35yfIzVHnQNusd3ZSzLGdlXI
	FISfYLN+DIgDBZEXp9V9NMpJyfBNh/JsEZzQh+eTpzEKfuerQ2rTnDr2Y6qOyQkv7W+s
	df1A==
MIME-Version: 1.0
Received: by 10.180.96.199 with SMTP id du7mr7480234wib.21.1345834184621; Fri,
	24 Aug 2012 11:49:44 -0700 (PDT)
Received: by 10.216.224.35 with HTTP; Fri, 24 Aug 2012 11:49:44 -0700 (PDT)
In-Reply-To: <503715BB.1090009@cisco.com>
References: <CALN+Pg3chDYX-R1+=GiqGbdMf+2uncZhmvU50vvqENkxC2M3+w@mail.gmail.com>
	<503715BB.1090009@cisco.com>
Date: Fri, 24 Aug 2012 11:49:44 -0700
Message-ID: <CALN+Pg0BBkKg1FYm7gnRJifSUF0zXzLwT7grLx-n=z==dt2iXg@mail.gmail.com>
From: Sravan <sra1sandela@gmail.com>
To: =?ISO-8859-1?Q?Martin_Erts=E5s?= <mertsas@cisco.com>
Cc: openembedded-core@lists.openembedded.org
Subject: Re: Tackling compilation errors in qt5 recipe.
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
X-List-Received-Date: Fri, 24 Aug 2012 19:01:52 -0000
Content-Type: multipart/alternative; boundary=f46d04426b8a803d8f04c80770a4

--f46d04426b8a803d8f04c80770a4
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: quoted-printable

Hi,

Thanks for the reply. Looks like it is still WIP as you pointed out. I just
wanted to know if you were able to figure out if you
were able to fix libGl linking issues with qemu machine.?

-Sravan.

On Thu, Aug 23, 2012 at 10:48 PM, Martin Erts=E5s <mertsas@cisco.com> wrote=
:

>  Hi.
>
> You could have a look at git@github.com:martiert/meta-qt5.git as a
> starting point. Have not tried anything but the qt5-x11-free packages,
> which makes what is needed for rendering, but it is at least a starting
> point.
>
> - Martin
>
>
> On 08/23/12 19:59, Sravan wrote:
>
> Hello,
>
>  I never worked on oe/bitbake before.
> I am trying to write recipes for Qt5(based on
> http://qt-project.org/wiki/Building_Qt_5_from_Git) .
> How ever i am stuck with few compilation errors that am able to slowly fi=
x
> and move forward, by disabling them through "config" options.
>
>  So, far i have used following options in config to get rid of
> compilation errors, is it the right approach? My end goal is to have a
> separate recipe file for Qt5 that is good enough to run webkit.
> Following are the flags that i am using
>
>  QT_CONFIG_FLAGS =3D "-no-avx -no-opengl -no-neon -no-rpath -qconfig full
>             -release -opensource -confirm-license -no-pch \
>
>             -nomake examples -nomake demos  -no-sse2 -no-ssse3 \
>
>             -nomake tests -no-gtkstyle -nomake translations \
>
>             -qt-zlib -qt-libpng -qt-libjpeg -qt-sql-sqlite"
>
>  and my
>
>   Build Configuration:
> BB_VERSION        =3D "1.15.2"
> TARGET_ARCH       =3D "i586"
> TARGET_OS         =3D "linux"
> MACHINE           =3D "qemux86"
>  DISTRO            =3D "webos"
> DISTRO_VERSION    =3D "1.0"
> TUNE_FEATURES     =3D "m32 i586"
> TARGET_FPU        =3D ""
> meta              =3D "(nobranch):1b40dac2c501ae8c8d812cf2866fe7917f144a1=
9"
> meta-oe           =3D "(nobranch):31bb03eba7c2e928cbc069eea61a5ae2a8d9fe5=
1"
> meta-webos        =3D
> "qt5-recipes-qt5:f7df573d4af74b77d8747c9e84c7e8fd2fb70156"
>
>
>  Please suggest how can i be sure that this approach is fine, and wont
> hurt me after building webkit to run with Qt5.
>
>  -Sravan.
>
>
> _______________________________________________
> Openembedded-core mailing listOpenembedded-core@lists.openembedded.orghtt=
p://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-core
>
>
>
> _______________________________________________
> Openembedded-core mailing list
> Openembedded-core@lists.openembedded.org
> http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-core
>
>

--f46d04426b8a803d8f04c80770a4
Content-Type: text/html; charset=ISO-8859-1
Content-Transfer-Encoding: quoted-printable

Hi,<div><br></div><div>Thanks for the reply. Looks like it is still WIP as =
you pointed out. I just wanted to know if you were able to figure out if yo=
u</div><div>were able to fix libGl linking issues with qemu machine.?</div>
<div><br></div><div>-Sravan.</div><div><br><div class=3D"gmail_quote">On Th=
u, Aug 23, 2012 at 10:48 PM, Martin Erts=E5s <span dir=3D"ltr">&lt;<a href=
=3D"mailto:mertsas@cisco.com" target=3D"_blank">mertsas@cisco.com</a>&gt;</=
span> wrote:<br>
<blockquote class=3D"gmail_quote" style=3D"margin:0 0 0 .8ex;border-left:1p=
x #ccc solid;padding-left:1ex">
 =20
   =20
 =20
  <div bgcolor=3D"#FFFFFF" text=3D"#000000">
    Hi.<br>
    <br>
    You could have a look at <a href=3D"mailto:git@github.com:martiert/meta=
-qt5.git" target=3D"_blank">git@github.com:martiert/meta-qt5.git</a> as a
    starting point. Have not tried anything but the qt5-x11-free
    packages, which makes what is needed for rendering, but it is at
    least a starting point.<br>
    <br>
    - Martin<div><div class=3D"h5"><br>
    <br>
    On 08/23/12 19:59, Sravan wrote:
    </div></div><blockquote type=3D"cite"><div><div class=3D"h5">
     =20
      Hello,
      <div><br>
      </div>
      <div>I never worked on oe/bitbake before.=A0</div>
      <div>I am trying to write recipes for Qt5(based on=A0<a href=3D"http:=
//qt-project.org/wiki/Building_Qt_5_from_Git" target=3D"_blank">http://qt-p=
roject.org/wiki/Building_Qt_5_from_Git</a>)
        .</div>
      <div>How ever i am stuck with few compilation errors that am able
        to slowly fix and move forward, by disabling them through
        &quot;config&quot; options.</div>
      <div><br>
      </div>
      <div>So, far i have used following options in config to get rid of
        compilation errors, is it the right approach? My end goal is to
        have a separate recipe file for Qt5 that is good enough to run
        webkit.</div>
      <div>Following are the flags that i am using</div>
      <div><br>
      </div>
      <div>
        <div>QT_CONFIG_FLAGS =3D &quot;-no-avx -no-opengl -no-neon -no-rpat=
h
          -qconfig full=A0</div>
        <div>=A0 =A0 =A0 =A0 =A0 =A0 -release -opensource -confirm-license =
-no-pch \
          =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0</div>
        <div>=A0 =A0 =A0 =A0 =A0 =A0 -nomake examples -nomake demos =A0-no-=
sse2
          -no-ssse3 \ =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0=A0</div>
        <div>=A0 =A0 =A0 =A0 =A0 =A0 -nomake tests -no-gtkstyle -nomake tra=
nslations
          \ =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0</div>
        <div>=A0 =A0 =A0 =A0 =A0 =A0 -qt-zlib -qt-libpng -qt-libjpeg
          -qt-sql-sqlite&quot;=A0</div>
      </div>
      <div><br>
      </div>
      <div>and my=A0</div>
      <div><br>
      </div>
      <div>
        <div>
          Build Configuration:</div>
        <div>BB_VERSION =A0 =A0 =A0 =A0=3D &quot;1.15.2&quot;</div>
        <div>TARGET_ARCH =A0 =A0 =A0 =3D &quot;i586&quot;</div>
        <div>TARGET_OS =A0 =A0 =A0 =A0 =3D &quot;linux&quot;</div>
        <div>MACHINE =A0 =A0 =A0 =A0 =A0 =3D &quot;qemux86&quot;</div>
        <div>
          DISTRO =A0 =A0 =A0 =A0 =A0 =A0=3D &quot;webos&quot;</div>
        <div>DISTRO_VERSION =A0 =A0=3D &quot;1.0&quot;</div>
        <div>TUNE_FEATURES =A0 =A0 =3D &quot;m32 i586&quot;</div>
        <div>TARGET_FPU =A0 =A0 =A0 =A0=3D &quot;&quot;</div>
        <div>meta =A0 =A0 =A0 =A0 =A0 =A0 =A0=3D
          &quot;(nobranch):1b40dac2c501ae8c8d812cf2866fe7917f144a19&quot;</=
div>
        <div>meta-oe =A0 =A0 =A0 =A0 =A0 =3D
          &quot;(nobranch):31bb03eba7c2e928cbc069eea61a5ae2a8d9fe51&quot;</=
div>
        <div>meta-webos =A0 =A0 =A0 =A0=3D
          &quot;qt5-recipes-qt5:f7df573d4af74b77d8747c9e84c7e8fd2fb70156&qu=
ot;</div>
      </div>
      <div><br>
      </div>
      <div><br>
      </div>
      <div>Please suggest how can i be sure that this approach is fine,
        and wont hurt me after building webkit to run with Qt5.</div>
      <div><br>
      </div>
      <div>-Sravan.</div>
      <br>
      <fieldset></fieldset>
      <br>
      </div></div><pre>_______________________________________________
Openembedded-core mailing list
<a href=3D"mailto:Openembedded-core@lists.openembedded.org" target=3D"_blan=
k">Openembedded-core@lists.openembedded.org</a>
<a href=3D"http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded=
-core" target=3D"_blank">http://lists.linuxtogo.org/cgi-bin/mailman/listinf=
o/openembedded-core</a>
</pre>
    </blockquote>
    <br>
  </div>

<br>_______________________________________________<br>
Openembedded-core mailing list<br>
<a href=3D"mailto:Openembedded-core@lists.openembedded.org">Openembedded-co=
re@lists.openembedded.org</a><br>
<a href=3D"http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded=
-core" target=3D"_blank">http://lists.linuxtogo.org/cgi-bin/mailman/listinf=
o/openembedded-core</a><br>
<br></blockquote></div><br></div>

--f46d04426b8a803d8f04c80770a4--
