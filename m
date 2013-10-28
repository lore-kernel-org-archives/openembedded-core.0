Return-Path: <raj.khem@gmail.com>
Received: from mail-ie0-f175.google.com (mail-ie0-f175.google.com
	[209.85.223.175])
	by mail.openembedded.org (Postfix) with ESMTP id B9ACD61005
	for <openembedded-core@lists.openembedded.org>;
	Mon, 28 Oct 2013 13:59:35 +0000 (UTC)
Received: by mail-ie0-f175.google.com with SMTP id aq17so11585859iec.34
	for <openembedded-core@lists.openembedded.org>;
	Mon, 28 Oct 2013 06:59:37 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=mime-version:in-reply-to:references:date:message-id:subject:from:to
	:cc:content-type;
	bh=WKwcv2ndiavKaBm0Jt5MA0pejAOI54hSa1hAxk/3Byc=;
	b=PcUEcPHy5lj3zOrY6YjKa3hr4AQw4Pk5RbL9zqb8cChqtnngoWzupIK9QuzRekVdCj
	d066qGTXOr/CXFgj0SLHodBM3RF8zUeOLrAQG4Br2SV6GDojIQkFy05MCUeBpOBG3Ab8
	/iAKjmxOGc6CaLRF2vLVVzvBTJ3B9wu2OwsfGJpVqJ0JUTrDcVEK+uoN9+B/JntV+LT6
	MpOdBAHuDFaKQw5qY6XHiViChO6l+Zssxgf/EGVr9awPSNlosnK54nGHtT/dP/HcLCCw
	u5Abvs7E8Z4ON07gJHH2X/m55A6oL7deF5fEhISjUZCfbHjWvlv32QIexJzFNSkuyASh
	LjsQ==
MIME-Version: 1.0
X-Received: by 10.42.54.132 with SMTP id r4mr13512400icg.19.1382968777431;
	Mon, 28 Oct 2013 06:59:37 -0700 (PDT)
Received: by 10.50.219.195 with HTTP; Mon, 28 Oct 2013 06:59:37 -0700 (PDT)
In-Reply-To: <526E69B5.5050401@emagii.com>
References: <526E69B5.5050401@emagii.com>
Date: Mon, 28 Oct 2013 06:59:37 -0700
Message-ID: <CAMKF1srAbL1UBFOmupE9=XDvwB7_sFmto+vE4wK-RghKnGNsLQ@mail.gmail.com>
From: Khem Raj <raj.khem@gmail.com>
To: Ulf Samuelsson <openembedded-core@emagii.com>
Cc: "openembedded-core@lists.openembedded.org"
	<openembedded-core@lists.openembedded.org>
Subject: Re: elfutils-native-0.148 does not build on Ubuntu-13.10
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
X-List-Received-Date: Mon, 28 Oct 2013 13:59:35 -0000
Content-Type: multipart/alternative; boundary=90e6ba539e94b72a1a04e9cd82fa

--90e6ba539e94b72a1a04e9cd82fa
Content-Type: text/plain; charset=UTF-8

On Monday, October 28, 2013, Ulf Samuelsson wrote:

> | gcc -D_GNU_SOURCE -DHAVE_CONFIG_H -DLOCALEDIR='"/home2/Angstrom/**
> build/tmp-angstrom_v2012_12-**eglibc/sysroots/i686-linux/**usr/share/locale"'
> -DDEBUGPRED=0 -DSRCDIR=\"/home2/Angstrom/**build/tmp-angstrom_v2012_12-**
> eglibc/work/i686-linux/**elfutils-native-0.148-r11/**elfutils-0.148/src\"
> -DOBJDIR=\"/home2/Angstrom/**build/tmp-angstrom_v2012_12-**
> eglibc/work/i686-linux/**elfutils-native-0.148-r11/**elfutils-0.148/src\"
> -I. -I.. -I. -I. -I../lib -I.. -I./../libelf -I./../libebl -I./../libdw
> -I./../libdwfl -I./../libasm -isystem/home2/Angstrom/build/**
> tmp-angstrom_v2012_12-eglibc/**sysroots/i686-linux/usr/**include
> -std=gnu99 -Wall -Wshadow -Werror -Wunused -Wextra -fgnu89-inline
> -Wformat=2 -isystem/home2/Angstrom/build/**tmp-angstrom_v2012_12-eglibc/**
> sysroots/i686-linux/usr/**include -O2 -pipe -c ranlib.c
> | addr2line.c: In function 'handle_address':
> | addr2line.c:450:7: error: format '%a' expects argument of type 'float
> *', but argument 3 has type 'char **' [-Werror=format=]| gcc -D_GNU_SOURCE
> -DHAVE_CONFIG_H -DLOCALEDIR='"/home2/Angstrom/**
> build/tmp-angstrom_v2012_12-**eglibc/sysroots/i686-linux/**usr/share/locale"'
> -DDEBUGPRED=0 -DSRCDIR=\"/home2/Angstrom/**build/tmp-angstrom_v2012_12-**
> eglibc/work/i686-linux/**elfutils-native-0.148-r11/**elfutils-0.148/src\"
> -DOBJDIR=\"/home2/Angstrom/**build/tmp-angstrom_v2012_12-**
> eglibc/work/i686-linux/**elfutils-native-0.148-r11/**elfutils-0.148/src\"
> -I. -I.. -I. -I. -I../lib -I.. -I./../libelf -I./../libebl -I./../libdw
> -I./../libdwfl -I./../libasm -isystem/home2/Angstrom/build/**
> tmp-angstrom_v2012_12-eglibc/**sysroots/i686-linux/usr/**include
> -std=gnu99 -Wall -Wshadow -Werror -Wunused -Wextra -fgnu89-inline
> -Wformat=2 -isystem/home2/Angstrom/build/**tmp-angstrom_v2012_12-eglibc/**
> sysroots/i686-linux/usr/**include -O2 -pipe -c ranlib.c
> | addr2line.c: In function 'handle_address':
> | addr2line.c:450:7: error: format '%a' expects argument of type 'float
> *', but argument 3 has type 'char **' [-Werror=format=]
> |        if (sscanf (string, "(%a[^)])%" PRIiMAX "%n", &name, &addr, &i)
> == 2
> |        ^
> | addr2line.c:453:7: error: format '%a' expects argument of type 'float
> *', but argument 3 has type 'char **' [-Werror=format=]
> |        switch (sscanf (string, "%a[^-+]%n%" PRIiMAX "%n", &name, &i,
> &addr, &j))
> |        ^
> | cc1: all warnings being treated as errors
> | make[2]: *** [addr2line.o] Error 1
> | make[2]: *** Waiting for unfinished jobs....
> | rm i386_ld.o
> | make[2]: Leaving directory `/home2/Angstrom/build/tmp-**
> angstrom_v2012_12-eglibc/work/**i686-linux/elfutils-native-0.**
> 148-r11/elfutils-0.148/src'
> | make[1]: *** [all-recursive] Error 1
> | make[1]: Leaving directory `/home2/Angstrom/build/tmp-**
> angstrom_v2012_12-eglibc/work/**i686-linux/elfutils-native-0.**
> 148-r11/elfutils-0.148'
> | make: *** [all] Error 2
> | ERROR: oe_runmake failed
> | ERROR: Function failed: do_compile (see /home2/Angstrom/build/tmp-**
> angstrom_v2012_12-eglibc/work/**i686-linux/elfutils-native-0.**
> 148-r11/temp/log.do_compile.**1845 for further information)
>
> |        if (sscanf (string, "(%a[^)])%" PRIiMAX "%n", &name, &addr, &i)
> == 2
> |        ^
> | addr2line.c:453:7: error: format '%a' expects argument of type 'float
> *', but argument 3 has type 'char **' [-Werror=format=]
> |        switch (sscanf (string, "%a[^-+]%n%" PRIiMAX "%n", &name, &i,
> &addr, &j))
> |        ^
> | cc1: all warnings being treated as errors
> | make[2]: *** [addr2line.o] Error 1
> | make[2]: *** Waiting for unfinished jobs....
> | rm i386_ld.o
> | make[2]: Leaving directory `/home2/Angstrom/build/tmp-**
> angstrom_v2012_12-eglibc/work/**i686-linux/elfutils-native-0.**
> 148-r11/elfutils-0.148/src'
> | make[1]: *** [all-recursive] Error 1
> | make[1]: Leaving directory `/home2/Angstrom/build/tmp-**
> angstrom_v2012_12-eglibc/work/**i686-linux/elfutils-native-0.**
> 148-r11/elfutils-0.148'
> | make: *** [all] Error 2
> | ERROR: oe_runmake failed
> | ERROR: Function failed: do_compile (see /home2/Angstrom/build/tmp-**
> angstrom_v2012_12-eglibc/work/**i686-linux/elfutils-native-0.**
> 148-r11/temp/log.do_compile.**1845 for further information)
>
> but this is OK, on Ubuntu-12.10


Apply
http://permalink.gmane.org/gmane.comp.handhelds.openembedded.scm/66625


>
> BR
> Ulf Samuelsson
>
>
> ______________________________**_________________
> Openembedded-core mailing list
> Openembedded-core@lists.openembedded.org
> http://lists.openembedded.org/**mailman/listinfo/openembedded-**core<http://lists.openembedded.org/mailman/listinfo/openembedded-core>
>

--90e6ba539e94b72a1a04e9cd82fa
Content-Type: text/html; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

<br><br>On Monday, October 28, 2013, Ulf Samuelsson  wrote:<br><blockquote =
class=3D"gmail_quote" style=3D"margin:0 0 0 .8ex;border-left:1px #ccc solid=
;padding-left:1ex">| gcc -D_GNU_SOURCE -DHAVE_CONFIG_H -DLOCALEDIR=3D&#39;&=
quot;/home2/Angstrom/<u></u>build/tmp-angstrom_v2012_12-<u></u>eglibc/sysro=
ots/i686-linux/<u></u>usr/share/locale&quot;&#39; -DDEBUGPRED=3D0 -DSRCDIR=
=3D\&quot;/home2/Angstrom/<u></u>build/tmp-angstrom_v2012_12-<u></u>eglibc/=
work/i686-linux/<u></u>elfutils-native-0.148-r11/<u></u>elfutils-0.148/src\=
&quot; -DOBJDIR=3D\&quot;/home2/Angstrom/<u></u>build/tmp-angstrom_v2012_12=
-<u></u>eglibc/work/i686-linux/<u></u>elfutils-native-0.148-r11/<u></u>elfu=
tils-0.148/src\&quot; -I. -I.. -I. -I. -I../lib -I.. -I./../libelf -I./../l=
ibebl -I./../libdw -I./../libdwfl -I./../libasm -isystem/home2/Angstrom/bui=
ld/<u></u>tmp-angstrom_v2012_12-eglibc/<u></u>sysroots/i686-linux/usr/<u></=
u>include -std=3Dgnu99 -Wall -Wshadow -Werror -Wunused -Wextra -fgnu89-inli=
ne -Wformat=3D2 -isystem/home2/Angstrom/build/<u></u>tmp-angstrom_v2012_12-=
eglibc/<u></u>sysroots/i686-linux/usr/<u></u>include -O2 -pipe -c ranlib.c<=
br>

| addr2line.c: In function &#39;handle_address&#39;:<br>
| addr2line.c:450:7: error: format &#39;%a&#39; expects argument of type &#=
39;float *&#39;, but argument 3 has type &#39;char **&#39; [-Werror=3Dforma=
t=3D]| gcc -D_GNU_SOURCE -DHAVE_CONFIG_H -DLOCALEDIR=3D&#39;&quot;/home2/An=
gstrom/<u></u>build/tmp-angstrom_v2012_12-<u></u>eglibc/sysroots/i686-linux=
/<u></u>usr/share/locale&quot;&#39; -DDEBUGPRED=3D0 -DSRCDIR=3D\&quot;/home=
2/Angstrom/<u></u>build/tmp-angstrom_v2012_12-<u></u>eglibc/work/i686-linux=
/<u></u>elfutils-native-0.148-r11/<u></u>elfutils-0.148/src\&quot; -DOBJDIR=
=3D\&quot;/home2/Angstrom/<u></u>build/tmp-angstrom_v2012_12-<u></u>eglibc/=
work/i686-linux/<u></u>elfutils-native-0.148-r11/<u></u>elfutils-0.148/src\=
&quot; -I. -I.. -I. -I. -I../lib -I.. -I./../libelf -I./../libebl -I./../li=
bdw -I./../libdwfl -I./../libasm -isystem/home2/Angstrom/build/<u></u>tmp-a=
ngstrom_v2012_12-eglibc/<u></u>sysroots/i686-linux/usr/<u></u>include -std=
=3Dgnu99 -Wall -Wshadow -Werror -Wunused -Wextra -fgnu89-inline -Wformat=3D=
2 -isystem/home2/Angstrom/build/<u></u>tmp-angstrom_v2012_12-eglibc/<u></u>=
sysroots/i686-linux/usr/<u></u>include -O2 -pipe -c ranlib.c<br>

| addr2line.c: In function &#39;handle_address&#39;:<br>
| addr2line.c:450:7: error: format &#39;%a&#39; expects argument of type &#=
39;float *&#39;, but argument 3 has type &#39;char **&#39; [-Werror=3Dforma=
t=3D]<br>
| =C2=A0 =C2=A0 =C2=A0 =C2=A0if (sscanf (string, &quot;(%a[^)])%&quot; PRIi=
MAX &quot;%n&quot;, &amp;name, &amp;addr, &amp;i) =3D=3D 2<br>
| =C2=A0 =C2=A0 =C2=A0 =C2=A0^<br>
| addr2line.c:453:7: error: format &#39;%a&#39; expects argument of type &#=
39;float *&#39;, but argument 3 has type &#39;char **&#39; [-Werror=3Dforma=
t=3D]<br>
| =C2=A0 =C2=A0 =C2=A0 =C2=A0switch (sscanf (string, &quot;%a[^-+]%n%&quot;=
 PRIiMAX &quot;%n&quot;, &amp;name, &amp;i, &amp;addr, &amp;j))<br>
| =C2=A0 =C2=A0 =C2=A0 =C2=A0^<br>
| cc1: all warnings being treated as errors<br>
| make[2]: *** [addr2line.o] Error 1<br>
| make[2]: *** Waiting for unfinished jobs....<br>
| rm i386_ld.o<br>
| make[2]: Leaving directory `/home2/Angstrom/build/tmp-<u></u>angstrom_v20=
12_12-eglibc/work/<u></u>i686-linux/elfutils-native-0.<u></u>148-r11/elfuti=
ls-0.148/src&#39;<br>
| make[1]: *** [all-recursive] Error 1<br>
| make[1]: Leaving directory `/home2/Angstrom/build/tmp-<u></u>angstrom_v20=
12_12-eglibc/work/<u></u>i686-linux/elfutils-native-0.<u></u>148-r11/elfuti=
ls-0.148&#39;<br>
| make: *** [all] Error 2<br>
| ERROR: oe_runmake failed<br>
| ERROR: Function failed: do_compile (see /home2/Angstrom/build/tmp-<u></u>=
angstrom_v2012_12-eglibc/work/<u></u>i686-linux/elfutils-native-0.<u></u>14=
8-r11/temp/log.do_compile.<u></u>1845 for further information)<br>
<br>
| =C2=A0 =C2=A0 =C2=A0 =C2=A0if (sscanf (string, &quot;(%a[^)])%&quot; PRIi=
MAX &quot;%n&quot;, &amp;name, &amp;addr, &amp;i) =3D=3D 2<br>
| =C2=A0 =C2=A0 =C2=A0 =C2=A0^<br>
| addr2line.c:453:7: error: format &#39;%a&#39; expects argument of type &#=
39;float *&#39;, but argument 3 has type &#39;char **&#39; [-Werror=3Dforma=
t=3D]<br>
| =C2=A0 =C2=A0 =C2=A0 =C2=A0switch (sscanf (string, &quot;%a[^-+]%n%&quot;=
 PRIiMAX &quot;%n&quot;, &amp;name, &amp;i, &amp;addr, &amp;j))<br>
| =C2=A0 =C2=A0 =C2=A0 =C2=A0^<br>
| cc1: all warnings being treated as errors<br>
| make[2]: *** [addr2line.o] Error 1<br>
| make[2]: *** Waiting for unfinished jobs....<br>
| rm i386_ld.o<br>
| make[2]: Leaving directory `/home2/Angstrom/build/tmp-<u></u>angstrom_v20=
12_12-eglibc/work/<u></u>i686-linux/elfutils-native-0.<u></u>148-r11/elfuti=
ls-0.148/src&#39;<br>
| make[1]: *** [all-recursive] Error 1<br>
| make[1]: Leaving directory `/home2/Angstrom/build/tmp-<u></u>angstrom_v20=
12_12-eglibc/work/<u></u>i686-linux/elfutils-native-0.<u></u>148-r11/elfuti=
ls-0.148&#39;<br>
| make: *** [all] Error 2<br>
| ERROR: oe_runmake failed<br>
| ERROR: Function failed: do_compile (see /home2/Angstrom/build/tmp-<u></u>=
angstrom_v2012_12-eglibc/work/<u></u>i686-linux/elfutils-native-0.<u></u>14=
8-r11/temp/log.do_compile.<u></u>1845 for further information)<br>
<br>
but this is OK, on Ubuntu-12.10</blockquote><div><br></div><div>Apply=C2=A0=
=C2=A0<a href=3D"http://permalink.gmane.org/gmane.comp.handhelds.openembedd=
ed.scm/66625">http://permalink.gmane.org/gmane.comp.handhelds.openembedded.=
scm/66625</a></div>
<div><br></div><blockquote class=3D"gmail_quote" style=3D"margin:0 0 0 .8ex=
;border-left:1px #ccc solid;padding-left:1ex">
<br>
<br>
BR<br>
Ulf Samuelsson<br>
<br>
<br>
______________________________<u></u>_________________<br>
Openembedded-core mailing list<br>
<a>Openembedded-core@lists.openembedded.org</a><br>
<a href=3D"http://lists.openembedded.org/mailman/listinfo/openembedded-core=
" target=3D"_blank">http://lists.openembedded.org/<u></u>mailman/listinfo/o=
penembedded-<u></u>core</a><br>
</blockquote>

--90e6ba539e94b72a1a04e9cd82fa--
