Return-Path: <raj.khem@gmail.com>
Received: from mail-vk0-f67.google.com (mail-vk0-f67.google.com
	[209.85.213.67])
	by mail.openembedded.org (Postfix) with ESMTP id 307D271B67
	for <openembedded-core@lists.openembedded.org>;
	Tue,  1 Nov 2016 18:33:46 +0000 (UTC)
Received: by mail-vk0-f67.google.com with SMTP id x186so2878664vkd.2
	for <openembedded-core@lists.openembedded.org>;
	Tue, 01 Nov 2016 11:33:48 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc; bh=eU3Y+iCZ1xxffCTESknpzQXXUiIIh/C8VZv7GCc56hw=;
	b=ERBxC4PVboOT3M/LzuKys/YyeMSwm5jfaZjQjs6NW30F9LU0tTIjnOsiKl0DjVmv7g
	m9jE3niBpICUkxsi1hrEqWZP8ulnfbc7/y1dW09R3LeRqUC1922u6DyV9QhTy7SuA6lH
	dF+2CoRSzVtvhe+4/KyrAkAxYIZmBW0LBf8Yt0UO61Bi3WlbXZxm7uubvwmjBgzeRuxT
	COguVPhzhmfrafCe7pdaPeAuZ6XhUbe6TPbbly9huO/LdmUikjYK5g4BwOQ24yJockp4
	Q9CVdWdtRVCQtgbM7nCFsQs07CQwhaeuIwh2Sa74UOHlyjNSZnMdET6EygaBHd5Wt8CP
	1KPw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc;
	bh=eU3Y+iCZ1xxffCTESknpzQXXUiIIh/C8VZv7GCc56hw=;
	b=Wy+iDhXu6sF5BPfY319I16jBUerbIDG2wSUr4495J1eseeYSylhwJa6BYpIiBG41RP
	n87auTZMm9MPzzNQmNe+efDZuRO/w18LIvxkDZNmPGCvX059sopF4aR0gaZKo7qQYY0U
	vFF+apelIAQXHRc1MT60owjbIaw1gL8ApJgbbz9p1eiiHVL0dD+An2AZ6cjBY6MXG6A+
	pUsOR03mn74xOxZ8KVv/e64qHQJb/tEFYwCl9slrOrT/kGOuNHLfKHtkO1lEHbuU0pV2
	ITNHElF0Uf4f4zb5sQua4gTEFwplxKe1564DeQo15Fj0VWTum8HyOHRD4qnNFiMwNgKp
	R1Ug==
X-Gm-Message-State: ABUngveWdR3ZboDR5Fw27YuQjieoy8gvEc5XlNsl8UOoZGdApt5B+Eq9CJwppaKz/yAagiFo/nQqXoqd3D6M3w==
X-Received: by 10.31.153.195 with SMTP id b186mr5363541vke.140.1478025227847; 
	Tue, 01 Nov 2016 11:33:47 -0700 (PDT)
MIME-Version: 1.0
Received: by 10.176.5.136 with HTTP; Tue, 1 Nov 2016 11:33:46 -0700 (PDT)
Received: by 10.176.5.136 with HTTP; Tue, 1 Nov 2016 11:33:46 -0700 (PDT)
In-Reply-To: <CAJ86T=Xw0qavJpud1YSSU94dQgYp=3tueYq59Z-jFatbhTjM0Q@mail.gmail.com>
References: <20161029084707.29652-1-raj.khem@gmail.com>
	<CAJ86T=Xw0qavJpud1YSSU94dQgYp=3tueYq59Z-jFatbhTjM0Q@mail.gmail.com>
From: Khem Raj <raj.khem@gmail.com>
Date: Tue, 1 Nov 2016 11:33:46 -0700
Message-ID: <CAMKF1srDpKb1-+h4Y3X6nttVSCpVTAitt_w1iUPpqPpnfq0Jag@mail.gmail.com>
To: Andre McCurdy <armccurdy@gmail.com>
Cc: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH] cmake.bbclass: Exclude native sysroot from CMAKE_FIND_ROOT_PATH
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
X-List-Received-Date: Tue, 01 Nov 2016 18:33:47 -0000
Content-Type: multipart/alternative; boundary=001a1141d5b8accdcf054041902e

--001a1141d5b8accdcf054041902e
Content-Type: text/plain; charset=UTF-8

On Nov 1, 2016 11:28 AM, "Andre McCurdy" <armccurdy@gmail.com> wrote:
>
> On Sat, Oct 29, 2016 at 1:47 AM, Khem Raj <raj.khem@gmail.com> wrote:
> > This has been cause of issue where we were getting both usr/include
> > dirs ( from target as well as native sysroot) added to compiler
> > flags.
> >
> > CXX_INCLUDES in final flags.cmake would include
> > -I<target-sysroot>/usr/include -I<native-sysroot>/usr/include
> > most of the time it would work since headers are mostly
> > common but netflix package failed to compile since one of
> > the headers was including curl headers which it could not
> > find in target sysroot and it went to next include path
> > and found it in native sysroot which is not what we want
> > when doing cross compile.
> >
> > As per https://cmake.org/Wiki/CMake_Cross_Compiling
> > never search for programs in target sysroot but search
> > for packages,libs,includes only.
> >
> > Signed-off-by: Khem Raj <raj.khem@gmail.com>
> > ---
> >  meta/classes/cmake.bbclass | 3 ++-
> >  1 file changed, 2 insertions(+), 1 deletion(-)
> >
> > diff --git a/meta/classes/cmake.bbclass b/meta/classes/cmake.bbclass
> > index 3e762de..3e8df37 100644
> > --- a/meta/classes/cmake.bbclass
> > +++ b/meta/classes/cmake.bbclass
> > @@ -25,6 +25,7 @@ OECMAKE_PERLNATIVE_DIR ??= ""
> >  OECMAKE_EXTRA_ROOT_PATH ?= ""
> >
> >  OECMAKE_FIND_ROOT_PATH_MODE_PROGRAM = "ONLY"
> > +OECMAKE_FIND_ROOT_PATH_MODE_PROGRAM_class-target = "NEVER"
>
> Using the _class-target over-ride looks odd. Perhaps making "NEVER"
> the default and adding over-rides for the classes which need "ONLY"
> (if there are any?) would make this clearer?
>

Yeah I plan to rework this a bit in that direction
> >  OECMAKE_FIND_ROOT_PATH_MODE_PROGRAM_class-native = "BOTH"
> >
> >  EXTRA_OECMAKE_append = " ${PACKAGECONFIG_CONFARGS}"
> > @@ -60,7 +61,7 @@ set( CMAKE_CXX_LINK_FLAGS "${OECMAKE_CXX_LINK_FLAGS}"
CACHE STRING "LDFLAGS" )
> >
> >  # only search in the paths provided so cmake doesnt pick
> >  # up libraries and tools from the native build machine
> > -set( CMAKE_FIND_ROOT_PATH ${STAGING_DIR_HOST} ${STAGING_DIR_NATIVE}
${CROSS_DIR} ${OECMAKE_PERLNATIVE_DIR} ${OECMAKE_EXTRA_ROOT_PATH}
${EXTERNAL_TOOLCHAIN})
> > +set( CMAKE_FIND_ROOT_PATH ${STAGING_DIR_HOST} ${CROSS_DIR}
${OECMAKE_PERLNATIVE_DIR} ${OECMAKE_EXTRA_ROOT_PATH} ${EXTERNAL_TOOLCHAIN})
> >  set( CMAKE_FIND_ROOT_PATH_MODE_PACKAGE ONLY )
> >  set( CMAKE_FIND_ROOT_PATH_MODE_PROGRAM
${OECMAKE_FIND_ROOT_PATH_MODE_PROGRAM} )
> >  set( CMAKE_FIND_ROOT_PATH_MODE_LIBRARY ONLY )
> > --
> > 2.10.1
> >
> > --
> > _______________________________________________
> > Openembedded-core mailing list
> > Openembedded-core@lists.openembedded.org
> > http://lists.openembedded.org/mailman/listinfo/openembedded-core

--001a1141d5b8accdcf054041902e
Content-Type: text/html; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

<p dir=3D"ltr"></p>
<p dir=3D"ltr">On Nov 1, 2016 11:28 AM, &quot;Andre McCurdy&quot; &lt;<a hr=
ef=3D"mailto:armccurdy@gmail.com">armccurdy@gmail.com</a>&gt; wrote:<br>
&gt;<br>
&gt; On Sat, Oct 29, 2016 at 1:47 AM, Khem Raj &lt;<a href=3D"mailto:raj.kh=
em@gmail.com">raj.khem@gmail.com</a>&gt; wrote:<br>
&gt; &gt; This has been cause of issue where we were getting both usr/inclu=
de<br>
&gt; &gt; dirs ( from target as well as native sysroot) added to compiler<b=
r>
&gt; &gt; flags.<br>
&gt; &gt;<br>
&gt; &gt; CXX_INCLUDES in final flags.cmake would include<br>
&gt; &gt; -I&lt;target-sysroot&gt;/usr/include -I&lt;native-sysroot&gt;/usr=
/include<br>
&gt; &gt; most of the time it would work since headers are mostly<br>
&gt; &gt; common but netflix package failed to compile since one of<br>
&gt; &gt; the headers was including curl headers which it could not<br>
&gt; &gt; find in target sysroot and it went to next include path<br>
&gt; &gt; and found it in native sysroot which is not what we want<br>
&gt; &gt; when doing cross compile.<br>
&gt; &gt;<br>
&gt; &gt; As per <a href=3D"https://cmake.org/Wiki/CMake_Cross_Compiling">h=
ttps://cmake.org/Wiki/CMake_Cross_Compiling</a><br>
&gt; &gt; never search for programs in target sysroot but search<br>
&gt; &gt; for packages,libs,includes only.<br>
&gt; &gt;<br>
&gt; &gt; Signed-off-by: Khem Raj &lt;<a href=3D"mailto:raj.khem@gmail.com"=
>raj.khem@gmail.com</a>&gt;<br>
&gt; &gt; ---<br>
&gt; &gt;=C2=A0 meta/classes/cmake.bbclass | 3 ++-<br>
&gt; &gt;=C2=A0 1 file changed, 2 insertions(+), 1 deletion(-)<br>
&gt; &gt;<br>
&gt; &gt; diff --git a/meta/classes/cmake.bbclass b/meta/classes/cmake.bbcl=
ass<br>
&gt; &gt; index 3e762de..3e8df37 100644<br>
&gt; &gt; --- a/meta/classes/cmake.bbclass<br>
&gt; &gt; +++ b/meta/classes/cmake.bbclass<br>
&gt; &gt; @@ -25,6 +25,7 @@ OECMAKE_PERLNATIVE_DIR ??=3D &quot;&quot;<br>
&gt; &gt;=C2=A0 OECMAKE_EXTRA_ROOT_PATH ?=3D &quot;&quot;<br>
&gt; &gt;<br>
&gt; &gt;=C2=A0 OECMAKE_FIND_ROOT_PATH_MODE_PROGRAM =3D &quot;ONLY&quot;<br=
>
&gt; &gt; +OECMAKE_FIND_ROOT_PATH_MODE_PROGRAM_class-target =3D &quot;NEVER=
&quot;<br>
&gt;<br>
&gt; Using the _class-target over-ride looks odd. Perhaps making &quot;NEVE=
R&quot;<br>
&gt; the default and adding over-rides for the classes which need &quot;ONL=
Y&quot;<br>
&gt; (if there are any?) would make this clearer?<br>
&gt;</p>
<p dir=3D"ltr">Yeah I plan to rework this a bit in that direction<br>
&gt; &gt;=C2=A0 OECMAKE_FIND_ROOT_PATH_MODE_PROGRAM_class-native =3D &quot;=
BOTH&quot;<br>
&gt; &gt;<br>
&gt; &gt;=C2=A0 EXTRA_OECMAKE_append =3D &quot; ${PACKAGECONFIG_CONFARGS}&q=
uot;<br>
&gt; &gt; @@ -60,7 +61,7 @@ set( CMAKE_CXX_LINK_FLAGS &quot;${OECMAKE_CXX_L=
INK_FLAGS}&quot; CACHE STRING &quot;LDFLAGS&quot; )<br>
&gt; &gt;<br>
&gt; &gt;=C2=A0 # only search in the paths provided so cmake doesnt pick<br=
>
&gt; &gt;=C2=A0 # up libraries and tools from the native build machine<br>
&gt; &gt; -set( CMAKE_FIND_ROOT_PATH ${STAGING_DIR_HOST} ${STAGING_DIR_NATI=
VE} ${CROSS_DIR} ${OECMAKE_PERLNATIVE_DIR} ${OECMAKE_EXTRA_ROOT_PATH} ${EXT=
ERNAL_TOOLCHAIN})<br>
&gt; &gt; +set( CMAKE_FIND_ROOT_PATH ${STAGING_DIR_HOST} ${CROSS_DIR} ${OEC=
MAKE_PERLNATIVE_DIR} ${OECMAKE_EXTRA_ROOT_PATH} ${EXTERNAL_TOOLCHAIN})<br>
&gt; &gt;=C2=A0 set( CMAKE_FIND_ROOT_PATH_MODE_PACKAGE ONLY )<br>
&gt; &gt;=C2=A0 set( CMAKE_FIND_ROOT_PATH_MODE_PROGRAM ${OECMAKE_FIND_ROOT_=
PATH_MODE_PROGRAM} )<br>
&gt; &gt;=C2=A0 set( CMAKE_FIND_ROOT_PATH_MODE_LIBRARY ONLY )<br>
&gt; &gt; --<br>
&gt; &gt; 2.10.1<br>
&gt; &gt;<br>
&gt; &gt; --<br>
&gt; &gt; _______________________________________________<br>
&gt; &gt; Openembedded-core mailing list<br>
&gt; &gt; <a href=3D"mailto:Openembedded-core@lists.openembedded.org">Opene=
mbedded-core@lists.openembedded.org</a><br>
&gt; &gt; <a href=3D"http://lists.openembedded.org/mailman/listinfo/openemb=
edded-core">http://lists.openembedded.org/mailman/listinfo/openembedded-cor=
e</a><br></p>

--001a1141d5b8accdcf054041902e--
