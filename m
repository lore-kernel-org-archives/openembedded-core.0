Return-Path: <raj.khem@gmail.com>
Received: from mail-pd0-f182.google.com (mail-pd0-f182.google.com
	[209.85.192.182])
	by mail.openembedded.org (Postfix) with ESMTP id 8CE7371790
	for <openembedded-core@lists.openembedded.org>;
	Sun, 14 Dec 2014 18:39:41 +0000 (UTC)
Received: by mail-pd0-f182.google.com with SMTP id p10so10177934pdj.41
	for <openembedded-core@lists.openembedded.org>;
	Sun, 14 Dec 2014 10:39:41 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=content-type:mime-version:subject:from:in-reply-to:date:cc
	:message-id:references:to;
	bh=SLitUtYqwLGqBR81MqLg9mi4ssFJeGTB28K+2MQmtu8=;
	b=wjsgZLD44tjd27LJHjT+Xt6+dctKbEXxh1o27mhD1wGjPpou2OLaB0AoV2r4KArYm2
	xQgyoG3OXrylgSobxABFxw7KYj+kmAvAC1wJTlLvY9khsjEZV24jqXCUp/KA7jKneDGe
	sMZhhCZn7Lfqhz+dsjt7GbNP0+nqIEK7dz+SsH2q+Y0IJRtBrqQsSBL3WqzSysIMRHUU
	1xA36j39KDw4NqM+acwRMlLyQ1QQfhvCyZ0AynLySUnUIQhj3WucRZ1HALx2AY1KC2TZ
	LdONw/C2bfMXt/9F0bOC5C8zPopVlBu0fvwZGtBv48sLE6kqiy3omuMMxjuvQ6VaEpfu
	y4zg==
X-Received: by 10.70.102.193 with SMTP id fq1mr45047378pdb.19.1418582381644;
	Sun, 14 Dec 2014 10:39:41 -0800 (PST)
Received: from ?IPv6:2601:9:3580:84c:316f:9d26:da5b:51a7?
	([2601:9:3580:84c:316f:9d26:da5b:51a7])
	by mx.google.com with ESMTPSA id mt3sm2717442pdb.30.2014.12.14.10.39.39
	for <multiple recipients>
	(version=TLSv1 cipher=ECDHE-RSA-RC4-SHA bits=128/128);
	Sun, 14 Dec 2014 10:39:40 -0800 (PST)
Mime-Version: 1.0 (Mac OS X Mail 8.1 \(1993\))
From: Khem Raj <raj.khem@gmail.com>
In-Reply-To: <BAY179-W73C7837C99907817B0A3BBB6E0@phx.gbl>
Date: Sun, 14 Dec 2014 10:39:37 -0800
Message-Id: <4C8CE0C1-D30A-4093-AB4A-85479FC658A4@gmail.com>
References: <BAY179-W94EE5F805A59DEBDCC4035BB650@phx.gbl> <,
	<387ED5C5-E7F1-47EF-8BC9-0D90656BB085@gmail.com> <>>
	<BAY179-W73C7837C99907817B0A3BBB6E0@phx.gbl>
To: Juro Bystricky <jurobystricky@hotmail.com>
X-Mailer: Apple Mail (2.1993)
Cc: "openembedded-core@lists.openembedded.org"
	<openembedded-core@lists.openembedded.org>
Subject: Re: Problems running glibc test suite...
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
X-List-Received-Date: Sun, 14 Dec 2014 18:39:48 -0000
Content-Type: multipart/alternative;
	boundary="Apple-Mail=_36A0D98D-4DF1-43AC-AEEA-497499D375AA"

--Apple-Mail=_36A0D98D-4DF1-43AC-AEEA-497499D375AA
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain;
	charset=iso-8859-1


> On Dec 14, 2014, at 6:25 AM, Juro Bystricky =
<jurobystricky@hotmail.com> wrote:
>=20
> I filed a bug report=20
> https://bugzilla.yoctoproject.org/show_bug.cgi?id=3D7081 =
<https://bugzilla.yoctoproject.org/show_bug.cgi?id=3D7081>
>=20
> I also proposed a fix. The fix is quite safe, it does not affect glibc =
build,
> only modifies the testing script glibc-testing.inc. =20
> Incidentally, I believe there is a tiny bug in glibc-testing.inc:
>=20
> fgrep tcbootstrap ${B}/config.make > ${B}/configparms
>=20
> should be=20
>=20
> fgrep tcbootstrap ${B}/config.make >> ${B}/configparms
>=20
> Otherwise the just entered comments in configparms get immediately =
wiped-out.

does it also take care of a case when test are run multiple times from =
same source base ?

>=20
> Juro
> Subject: Re: [OE-core] Problems running glibc test suite...
> From: raj.khem@gmail.com
> Date: Tue, 9 Dec 2014 09:39:55 -0800
> CC: openembedded-core@lists.openembedded.org
> To: jurobystricky@hotmail.com
>=20
>=20
> On Dec 9, 2014, at 9:08 AM, Juro Bystricky <jurobystricky@hotmail.com =
<mailto:jurobystricky@hotmail.com>> wrote:
>=20
> I tried to run the glibc test suite and encountered various problems.
> I build glibc as a part of core-image-minimal with libgcc and =
libstdc++,=20
> both additional libraries are needed by the glibc test suite.
>=20
> By far most tests run just fine, but there are several tests that fail
> to build at all. The offenders are:
>=20
> /elf/tst-unique3cc
> /elf/tst-unique4cc=20
> /elf/tst-unique3lib.cc <http://tst-unique3lib.cc/>=20
> /elf/tst-unique3lib2.cc <http://tst-unique3lib2.cc/>.=20
>=20
> They all fail with an error:
>=20
>  fatal error: cstdio: No such file or directory
>  #include <cstdio>
>=20
> The obvious reason is that the c++ header files were not found by the =
g++.
> g++ was invoked with -nostdinc flag, and in that case the path to =
system include
> files must be specified explicitly.
>=20
> The failed build is a consequence of a series of unfortunate events.
>=20
> First, when building the glibc for the first time, configure cannot =
find g++=20
> compiler at all.  config.log states:
>=20
> line 1594: arm-poky-linux-gnueabi-g++: command not found
> configure:3165: $? =3D 127
>=20
> Secondly, the g++ (which is not found) is then used to determine the =
location of the
> include headers, resulting in
> CXX_SYSINCLUDES=3D''
>=20
> Thirdly, even if g++ is found (it is found when re-building glibc, see =
below),
> the algorithm used to detect the CXX_SYSINCLUDES does not seem to work =
and=20
> the headers are not detected. I "fixed" this  by adding the following =
to git/configure:
>=20
> @@ -5184,6 +5197,14 @@
>        test "x$cxxheaders" !=3D x &&
>        CXX_SYSINCLUDES=3D"$CXX_SYSINCLUDES -isystem $cxxheaders"
>      done
> +    if test -z "$CXX_SYSINCLUDES"; then
> +      cxxversion=3D`$CXX -dumpversion`=20
> +      cxxmachine=3D`$CXX -dumpmachine`=20
> +      CXX_SYSINCLUDES=3D" -isystem $sysheaders/c++/$cxxversion \
> +-isystem $sysheaders/c++/$cxxversion/$cxxmachine"
> +    { $as_echo "$as_me:${as_lineno-$LINENO}: guessing =
CXX_SYSINCLUDES: $CXX_SYSINCLUDES" >&5
> +$as_echo_n "guessing CXX_SYSINCLUDE: $CXX_SYSINCLUDES... " >&6; }
> +    fi
>    fi
>  fi
>=20
> After the core-image-minimal is built, by the time the test suite is =
run, g++ is present,=20
> but CXX_SYSINCLUDES  is still not correct (unless the "fix" above is =
applied). However,=20
> not all c++ tests require c++ headers,  so some will build correctly. =
I tested the "fix"=20
> successfully with qemux86-64, qemumips and qemuarm.=20
> (qemuarm exposed some additional problems though).
>=20
> The "fix" is just a proof of concept: with correct CXX system header =
paths all=20
> the offending programs build correctly. But this "fix" only works when =
re-building=20
> glibc after the core-image-minimal is built.
>=20
> The g++ compiler is not needed for glibc at all, it is only needed to =
build=20
> some of the tests in the testsuite.   =
<https://bugzilla.yoctoproject.org/show_bug.cgi?id=3D7003%29>Probably =
worth noting is that glibc cannot DEPEND on=20
> g++  due to circular dependencies.
>=20
> thats right. glibc is built using a bootstapped cross compiler where =
we disable c++ support. This is to solve the catch-22 that glibc and gcc =
have. hence the reason why you miss most of c++ probes.
>=20
>=20
> The proper way to fix this would be to initialize CXX_SYSINCLUDES =
before building/running the test suite=20
> and not before building the glibc.
> A suitable place for this seems to be =
recipes-core/glibc/glibc-testing.inc
>=20
> yes. Running the test suites should be done after gcc-cross is built =
and staged. I would not prefer to doubly build glibc
> thats just waste of build time.=20
>=20
>=20
> Any thoughts?
>=20
> Thanks
>=20
> Juro
>=20
>=20
> --=20
> _______________________________________________
> Openembedded-core mailing list
> Openembedded-core@lists.openembedded.org =
<mailto:Openembedded-core@lists.openembedded.org>
> http://lists.openembedded.org/mailman/listinfo/openembedded-core =
<http://lists.openembedded.org/mailman/listinfo/openembedded-core>

--Apple-Mail=_36A0D98D-4DF1-43AC-AEEA-497499D375AA
Content-Transfer-Encoding: quoted-printable
Content-Type: text/html;
	charset=iso-8859-1

<html><head><meta http-equiv=3D"Content-Type" content=3D"text/html =
charset=3Diso-8859-1"></head><body style=3D"word-wrap: break-word; =
-webkit-nbsp-mode: space; -webkit-line-break: after-white-space;" =
class=3D""><br class=3D""><div><blockquote type=3D"cite" class=3D""><div =
class=3D"">On Dec 14, 2014, at 6:25 AM, Juro Bystricky &lt;<a =
href=3D"mailto:jurobystricky@hotmail.com" =
class=3D"">jurobystricky@hotmail.com</a>&gt; wrote:</div><br =
class=3D"Apple-interchange-newline"><div class=3D""><div dir=3D"ltr" =
style=3D"font-family: Calibri; font-size: 16px; font-style: normal; =
font-variant: normal; font-weight: normal; letter-spacing: normal; =
line-height: normal; orphans: auto; text-align: start; text-indent: 0px; =
text-transform: none; white-space: normal; widows: auto; word-spacing: =
0px; -webkit-text-stroke-width: 0px;" class=3D"">I filed a bug =
report<span class=3D"Apple-converted-space">&nbsp;</span><br class=3D""><a=
 href=3D"https://bugzilla.yoctoproject.org/show_bug.cgi?id=3D7081" =
target=3D"_blank" =
class=3D"">https://bugzilla.yoctoproject.org/show_bug.cgi?id=3D7081</a><br=
 class=3D""><br class=3D"">I also proposed a fix. The fix is quite safe, =
it does not affect glibc build,<br class=3D"">only modifies the testing =
script glibc-testing.inc.&nbsp;<span =
class=3D"Apple-converted-space">&nbsp;</span><br class=3D"">Incidentally, =
I believe there is a tiny bug in glibc-testing.inc:<br class=3D""><br =
class=3D"">fgrep tcbootstrap ${B}/config.make &gt; ${B}/configparms<br =
class=3D""><br class=3D"">should be<span =
class=3D"Apple-converted-space">&nbsp;</span><br class=3D""><br =
class=3D"">fgrep tcbootstrap ${B}/config.make &gt;&gt; =
${B}/configparms<br class=3D""><br class=3D"">Otherwise the just entered =
comments in configparms get immediately wiped-out.<br =
class=3D""></div></div></blockquote><div><br class=3D""></div><div>does =
it also take care of a case when test are run multiple times from same =
source base ?</div><br class=3D""><blockquote type=3D"cite" =
class=3D""><div class=3D""><div dir=3D"ltr" style=3D"font-family: =
Calibri; font-size: 16px; font-style: normal; font-variant: normal; =
font-weight: normal; letter-spacing: normal; line-height: normal; =
orphans: auto; text-align: start; text-indent: 0px; text-transform: =
none; white-space: normal; widows: auto; word-spacing: 0px; =
-webkit-text-stroke-width: 0px;" class=3D""><br class=3D"">Juro<br =
class=3D""><div class=3D""><hr id=3D"stopSpelling" class=3D"">Subject: =
Re: [OE-core] Problems running glibc test suite...<br class=3D"">From: =
<a href=3D"mailto:raj.khem@gmail.com" class=3D"">raj.khem@gmail.com</a><br=
 class=3D"">Date: Tue, 9 Dec 2014 09:39:55 -0800<br class=3D"">CC: <a =
href=3D"mailto:openembedded-core@lists.openembedded.org" =
class=3D"">openembedded-core@lists.openembedded.org</a><br class=3D"">To: =
<a href=3D"mailto:jurobystricky@hotmail.com" =
class=3D"">jurobystricky@hotmail.com</a><br class=3D""><br class=3D""><br =
class=3D""><div class=3D""><blockquote class=3D""><div class=3D"">On Dec =
9, 2014, at 9:08 AM, Juro Bystricky &lt;<a =
href=3D"mailto:jurobystricky@hotmail.com" =
class=3D"">jurobystricky@hotmail.com</a>&gt; wrote:</div><br =
class=3D"ecxApple-interchange-newline"><div class=3D""><div dir=3D"ltr" =
style=3D"font-family: Calibri; font-size: 16px; font-style: normal; =
font-variant: normal; font-weight: normal; letter-spacing: normal; =
line-height: normal; text-align: start; text-indent: 0px; =
text-transform: none; white-space: normal; word-spacing: 0px;" =
class=3D""><div dir=3D"ltr" class=3D"">I tried to run the glibc test =
suite and encountered various problems.<br class=3D"">I build glibc as a =
part of core-image-minimal with libgcc and libstdc++,<span =
class=3D"ecxApple-converted-space">&nbsp;</span><br class=3D"">both =
additional libraries are needed by the glibc test suite.<br class=3D""><br=
 class=3D"">By far most tests run just fine, but there are several tests =
that fail<br class=3D"">to build at all. The offenders are:<br =
class=3D""><br class=3D"">/elf/tst-unique3cc<br =
class=3D"">/elf/tst-unique4cc<span =
class=3D"ecxApple-converted-space">&nbsp;</span><br class=3D"">/elf/<a =
href=3D"http://tst-unique3lib.cc/" target=3D"_blank" =
class=3D"">tst-unique3lib.cc</a><span =
class=3D"ecxApple-converted-space">&nbsp;</span><br class=3D"">/elf/<a =
href=3D"http://tst-unique3lib2.cc/" target=3D"_blank" =
class=3D"">tst-unique3lib2.cc</a>.<span =
class=3D"ecxApple-converted-space">&nbsp;</span><br class=3D""><br =
class=3D"">They all fail with an error:<br class=3D""><br =
class=3D"">&nbsp;fatal error: cstdio: No such file or directory<br =
class=3D"">&nbsp;#include &lt;cstdio&gt;<br class=3D""><br class=3D"">The =
obvious reason is that the c++ header files were not found by the =
g++.<br class=3D"">g++ was invoked with -nostdinc flag, and in that case =
the path to system include<br class=3D"">files must be specified =
explicitly.<br class=3D""><br class=3D"">The failed build is a =
consequence of a series of unfortunate events.<br class=3D""><br =
class=3D"">First, when building the glibc for the first time, configure =
cannot find g++<span class=3D"ecxApple-converted-space">&nbsp;</span><br =
class=3D"">compiler at all.&nbsp; config.log states:<br class=3D""><br =
class=3D"">line 1594: arm-poky-linux-gnueabi-g++: command not found<br =
class=3D"">configure:3165: $? =3D 127<br class=3D""><br =
class=3D"">Secondly, the g++ (which is not found) is then used to =
determine the location of the<br class=3D"">include headers, resulting =
in<br class=3D"">CXX_SYSINCLUDES=3D''<br class=3D""><br =
class=3D"">Thirdly, even if g++ is found (it is found when re-building =
glibc, see below),<br class=3D"">the algorithm used to detect the =
CXX_SYSINCLUDES does not seem to work and<span =
class=3D"ecxApple-converted-space">&nbsp;</span><br class=3D"">the =
headers are not detected. I "fixed" this&nbsp; by adding the following =
to git/configure:<br class=3D""><br class=3D"">@@ -5184,6 +5197,14 @@<br =
class=3D"">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; test "x$cxxheaders" !=3D =
x &amp;&amp;<br class=3D"">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; =
CXX_SYSINCLUDES=3D"$CXX_SYSINCLUDES -isystem $cxxheaders"<br =
class=3D"">&nbsp;&nbsp;&nbsp;&nbsp; done<br class=3D"">+&nbsp;&nbsp;&nbsp;=
 if test -z "$CXX_SYSINCLUDES"; then<br =
class=3D"">+&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; cxxversion=3D`$CXX =
-dumpversion`<span class=3D"ecxApple-converted-space">&nbsp;</span><br =
class=3D"">+&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; cxxmachine=3D`$CXX =
-dumpmachine`<span class=3D"ecxApple-converted-space">&nbsp;</span><br =
class=3D"">+&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; CXX_SYSINCLUDES=3D" -isystem =
$sysheaders/c++/$cxxversion \<br class=3D"">+-isystem =
$sysheaders/c++/$cxxversion/$cxxmachine"<br class=3D"">+&nbsp;&nbsp;&nbsp;=
 { $as_echo "$as_me:${as_lineno-$LINENO}: guessing CXX_SYSINCLUDES: =
$CXX_SYSINCLUDES" &gt;&amp;5<br class=3D"">+$as_echo_n "guessing =
CXX_SYSINCLUDE: $CXX_SYSINCLUDES... " &gt;&amp;6; }<br =
class=3D"">+&nbsp;&nbsp;&nbsp; fi<br class=3D"">&nbsp;&nbsp; fi<br =
class=3D"">&nbsp;fi<br class=3D""><br class=3D"">After the =
core-image-minimal is built, by the time the test suite is run, g++ is =
present,<span class=3D"ecxApple-converted-space">&nbsp;</span><br =
class=3D"">but CXX_SYSINCLUDES&nbsp; is still not correct (unless the =
"fix" above is applied). However,<span =
class=3D"ecxApple-converted-space">&nbsp;</span><br class=3D"">not all =
c++ tests require c++ headers,&nbsp; so some will build correctly. I =
tested the "fix"<span class=3D"ecxApple-converted-space">&nbsp;</span><br =
class=3D"">successfully with qemux86-64, qemumips and qemuarm.<span =
class=3D"ecxApple-converted-space">&nbsp;</span><br class=3D"">(qemuarm =
exposed some additional problems though).<br class=3D""><br class=3D"">The=
 "fix" is just a proof of concept: with correct CXX system header paths =
all<span class=3D"ecxApple-converted-space">&nbsp;</span><br =
class=3D"">the offending programs build correctly. But this "fix" only =
works when re-building<span =
class=3D"ecxApple-converted-space">&nbsp;</span><br class=3D"">glibc =
after the core-image-minimal is built.<br class=3D""><br class=3D"">The =
g++ compiler is not needed for glibc at all, it is only needed to =
build<span class=3D"ecxApple-converted-space">&nbsp;</span><br =
class=3D"">some of the tests in the testsuite.&nbsp;<span =
class=3D"ecxApple-converted-space">&nbsp;</span><a =
href=3D"https://bugzilla.yoctoproject.org/show_bug.cgi?id=3D7003%29" =
target=3D"_blank" class=3D""></a>Probably worth noting is that glibc =
cannot DEPEND on<span class=3D"ecxApple-converted-space">&nbsp;</span><br =
class=3D"">g++&nbsp; due to circular dependencies.<br =
class=3D""></div></div></div></blockquote><div class=3D""><br =
class=3D""></div><div class=3D"">thats right. glibc is built using a =
bootstapped cross compiler where we disable c++ support. This is to =
solve the catch-22 that glibc and gcc have. hence the reason why you =
miss most of c++ probes.</div><br class=3D""><blockquote class=3D""><div =
class=3D""><div dir=3D"ltr" style=3D"font-family: Calibri; font-size: =
16px; font-style: normal; font-variant: normal; font-weight: normal; =
letter-spacing: normal; line-height: normal; text-align: start; =
text-indent: 0px; text-transform: none; white-space: normal; =
word-spacing: 0px;" class=3D""><div dir=3D"ltr" class=3D""><br =
class=3D"">The proper way to fix this would be to initialize =
CXX_SYSINCLUDES before building/running the test suite<span =
class=3D"ecxApple-converted-space">&nbsp;</span><br class=3D"">and not =
before building the glibc.<br class=3D"">A suitable place for this seems =
to be recipes-core/glibc/glibc-testing.inc<br =
class=3D""></div></div></div></blockquote><div class=3D""><br =
class=3D""></div><div class=3D"">yes. Running the test suites should be =
done after gcc-cross is built and staged. I would not prefer to doubly =
build glibc</div><div class=3D"">thats just waste of build =
time.&nbsp;</div><br class=3D""><blockquote class=3D""><div =
class=3D""><div dir=3D"ltr" style=3D"font-family: Calibri; font-size: =
16px; font-style: normal; font-variant: normal; font-weight: normal; =
letter-spacing: normal; line-height: normal; text-align: start; =
text-indent: 0px; text-transform: none; white-space: normal; =
word-spacing: 0px;" class=3D""><div dir=3D"ltr" class=3D""><br =
class=3D"">Any thoughts?<br class=3D""><br class=3D"">Thanks<br =
class=3D""><br class=3D"">Juro<br class=3D""><br class=3D""><br =
class=3D""></div></div><span style=3D"font-family: Calibri; font-size: =
16px; font-style: normal; font-variant: normal; font-weight: normal; =
letter-spacing: normal; line-height: normal; text-align: start; =
text-indent: 0px; text-transform: none; white-space: normal; =
word-spacing: 0px; display: inline !important;" class=3D"">--<span =
class=3D"ecxApple-converted-space">&nbsp;</span></span><br =
style=3D"font-family: Calibri; font-size: 16px; font-style: normal; =
font-variant: normal; font-weight: normal; letter-spacing: normal; =
line-height: normal; text-align: start; text-indent: 0px; =
text-transform: none; white-space: normal; word-spacing: 0px;" =
class=3D""><span style=3D"font-family: Calibri; font-size: 16px; =
font-style: normal; font-variant: normal; font-weight: normal; =
letter-spacing: normal; line-height: normal; text-align: start; =
text-indent: 0px; text-transform: none; white-space: normal; =
word-spacing: 0px; display: inline !important;" =
class=3D"">_______________________________________________</span><br =
style=3D"font-family: Calibri; font-size: 16px; font-style: normal; =
font-variant: normal; font-weight: normal; letter-spacing: normal; =
line-height: normal; text-align: start; text-indent: 0px; =
text-transform: none; white-space: normal; word-spacing: 0px;" =
class=3D""><span style=3D"font-family: Calibri; font-size: 16px; =
font-style: normal; font-variant: normal; font-weight: normal; =
letter-spacing: normal; line-height: normal; text-align: start; =
text-indent: 0px; text-transform: none; white-space: normal; =
word-spacing: 0px; display: inline !important;" =
class=3D"">Openembedded-core mailing list</span><br style=3D"font-family: =
Calibri; font-size: 16px; font-style: normal; font-variant: normal; =
font-weight: normal; letter-spacing: normal; line-height: normal; =
text-align: start; text-indent: 0px; text-transform: none; white-space: =
normal; word-spacing: 0px;" class=3D""><a =
href=3D"mailto:Openembedded-core@lists.openembedded.org" =
style=3D"font-family: Calibri; font-size: 16px; font-style: normal; =
font-variant: normal; font-weight: normal; letter-spacing: normal; =
line-height: normal; text-align: start; text-indent: 0px; =
text-transform: none; white-space: normal; word-spacing: 0px;" =
class=3D"">Openembedded-core@lists.openembedded.org</a><br =
style=3D"font-family: Calibri; font-size: 16px; font-style: normal; =
font-variant: normal; font-weight: normal; letter-spacing: normal; =
line-height: normal; text-align: start; text-indent: 0px; =
text-transform: none; white-space: normal; word-spacing: 0px;" =
class=3D""><a =
href=3D"http://lists.openembedded.org/mailman/listinfo/openembedded-core" =
target=3D"_blank" style=3D"font-family: Calibri; font-size: 16px; =
font-style: normal; font-variant: normal; font-weight: normal; =
letter-spacing: normal; line-height: normal; text-align: start; =
text-indent: 0px; text-transform: none; white-space: normal; =
word-spacing: 0px;" =
class=3D"">http://lists.openembedded.org/mailman/listinfo/openembedded-cor=
e</a></div></blockquote></div></div></div></div></blockquote></div><br =
class=3D""></body></html>=

--Apple-Mail=_36A0D98D-4DF1-43AC-AEEA-497499D375AA--
