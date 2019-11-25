Return-Path: <kergoth@gmail.com>
Received: from mail-pj1-f68.google.com (mail-pj1-f68.google.com
	[209.85.216.68])
	by mail.openembedded.org (Postfix) with ESMTP id 90BE87FD25
	for <openembedded-core@lists.openembedded.org>;
	Mon, 25 Nov 2019 22:40:18 +0000 (UTC)
Received: by mail-pj1-f68.google.com with SMTP id o14so7297529pjr.0
	for <openembedded-core@lists.openembedded.org>;
	Mon, 25 Nov 2019 14:40:20 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=date:from:to:cc:message-id:in-reply-to:references:subject
	:mime-version; bh=dO1Qv8IhD+9d27zjC6uu1EQSwIuTSv7f+1IZhoHuIkw=;
	b=ezmVzeq3AGLqD8YNQSJR/BoMcT2KuqV5nd4pA+duRDNMt3x+flyuUnnS93LAEGlU2E
	7ASOWJr8Bgzd/chaa4U+n3h9jttJ+oNuZfHIrrHjKTwUP6UO3ZdxxwKLXa4Xi2+x2Im9
	vIeq/hCMfj1nV64cLKVErPjKETwOVs9tEPiWbyEpriNRnGSqc6RhJL0Vzf/JSl4vNmyK
	nNyAYtPjNzt8qTw9UgwKp2KNueJJ9Ttb1ck7W5ODX9VLp7WrLtmICnl/XTtaKClg3LHj
	nGg7rn0XrC84g1zPig/RnL3inRBeoCIv2Hpbh04rtBubKnas8B7xTNdUtxliYVDg6HCP
	qy+A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:date:from:to:cc:message-id:in-reply-to
	:references:subject:mime-version;
	bh=dO1Qv8IhD+9d27zjC6uu1EQSwIuTSv7f+1IZhoHuIkw=;
	b=H/u80LH/3v8wtq+vA6gdqaGeyGfixoh/P6R7OI53Kvk/5Nz/1T7+McML0d0ip1f8Jk
	bS8L9TLYiFDFb9yh/7BeGZiQYdf9lwTPpFN9O3kxsmvFmpptGG0rPsHeaxAChDxAlizZ
	uFHZgTnqeO3Eiutggemn3d9wUU63Ftl9eGNy2BqfxDtZudPp+zcktlxeSvRGlShi7wZV
	Wn1dBiDQQTBQQU/LYG9zJm5Z9XdIB+FXizy6h841vEyO33hbkUsVlz1YSRewr3Y5xcfk
	fBZ/7zoW+2KgEyj/gCFgPogRXaA5XqYWH4Lf5y59/OQG80j3BgU3fTCcP+gP7d2sF31O
	XFrA==
X-Gm-Message-State: APjAAAVX0ThongV09jM/B/MFlWtu/cuLhbpxrXv2oaqdDFFNM4P/Tm2R
	rC6hEX0xraYxOa9kF1l2Cxg=
X-Google-Smtp-Source: APXvYqyX5rEgmc4071VOkwjddvT41pcYW12y4jvsdDUu3DHvy3G27myt4bSOdJBPRKbIHKevIUJSwA==
X-Received: by 2002:a17:902:4a:: with SMTP id 68mr30937847pla.8.1574721619536; 
	Mon, 25 Nov 2019 14:40:19 -0800 (PST)
Received: from [192.168.1.17] (ip70-180-21-74.ph.ph.cox.net. [70.180.21.74])
	by smtp.gmail.com with ESMTPSA id k4sm9803642pfa.25.2019.11.25.14.40.18
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Mon, 25 Nov 2019 14:40:18 -0800 (PST)
Date: Mon, 25 Nov 2019 15:40:12 -0700
From: Christopher Larson <kergoth@gmail.com>
To: Christopher Larson <kergoth@gmail.com>, Khem Raj
 <raj.khem@gmail.com>
Message-ID: <b059976b-80ca-4f3b-b4a5-da7198b78240@Spark>
In-Reply-To: <CAMKF1sos77k28JEJYBf_ox3s-dOJL_-ohHJuyQ15kv=xxP6S4A@mail.gmail.com>
References: <20191125221357.6560-1-kergoth@gmail.com>
	<20191125221357.6560-3-kergoth@gmail.com>
	<CAMKF1sos77k28JEJYBf_ox3s-dOJL_-ohHJuyQ15kv=xxP6S4A@mail.gmail.com>
X-Readdle-Message-ID: b059976b-80ca-4f3b-b4a5-da7198b78240@Spark
MIME-Version: 1.0
Cc: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH 3/3] libcap-ng: fix built failure with some external toolchains due to missing pthread
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
X-List-Received-Date: Mon, 25 Nov 2019 22:40:18 -0000
Content-Type: multipart/alternative; boundary="5ddc5851_216231b_2d9"

--5ddc5851_216231b_2d9
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: quoted-printable
Content-Disposition: inline

It seems like libcap wants to support use of pthread by the linking appli=
cation without mandating it, so we can=E2=80=99t pass -pthread, and I=E2=80=
=99m not sure a configure check would help, unless it wants to pull in pt=
hread unconditionally. But I may be misunderstanding the libcap commits, =
and am *definitely* not a threading expert :)
On Nov 25, 2019, 3:27 PM -0700, Khem Raj <raj.khem=40gmail.com>, wrote:
> On Mon, Nov 25, 2019 at 2:13 PM Christopher Larson <kergoth=40gmail.com=
> wrote:
> >
> > =46rom: Christopher Larson <chris=5Flarson=40mentor.com>
> >
> > The libcap-ng build doesn't pass -pthread and can fail to link.
> >
>
> perhaps, adding a configure time check for pthread.h would be possible
>
> AC=5FCHECK=5FHEADERS(pthread.h, =5B=5D, =5BAC=5FMSG=5FWARN(pthread.h no=
t found,
> pthread=5Fatfork disabled.)=5D)
>
> then include pthread.h inside conditional like below in source files.
>
> =23ifdef HAVE=5FPTHREAD=5FH
> =23endif
>
>
>
> > Signed-off-by: Christopher Larson <chris=5Flarson=40mentor.com>
> > ---
> > meta/recipes-support/libcap-ng/libcap-ng.inc =7C 1 +
> > .../libcap-ng/revert-pthread=5Fatfork-fix.patch =7C 56 ++++++++++++++=
++++++++
> > 2 files changed, 57 insertions(+)
> > create mode 100644 meta/recipes-support/libcap-ng/libcap-ng/revert-pt=
hread=5Fatfork-fix.patch
> >
> > diff --git a/meta/recipes-support/libcap-ng/libcap-ng.inc b/meta/reci=
pes-support/libcap-ng/libcap-ng.inc
> > index aec83896e4..46d37e6807 100644
> > --- a/meta/recipes-support/libcap-ng/libcap-ng.inc
> > +++ b/meta/recipes-support/libcap-ng/libcap-ng.inc
> > =40=40 -9,6 +9,7 =40=40 LIC=5F=46ILES=5FCHKSUM =3D =22file://COPYING;=
md5=3D94d55d512a9ba36caa9b7df079bae19f =5C
> >
> > SRC=5FURI =3D =22http://people.redhat.com/sgrubb/libcap-ng/libcap-ng-=
=24=7BPV=7D.tar.gz =5C
> > file://python.patch =5C
> > + file://revert-pthread=5Fatfork-fix.patch =5C
> > =22
> >
> > SRC=5FURI=5Bmd5sum=5D =3D =2257dc267e2949cdecb651a929f9206572=22
> > diff --git a/meta/recipes-support/libcap-ng/libcap-ng/revert-pthread=5F=
atfork-fix.patch b/meta/recipes-support/libcap-ng/libcap-ng/revert-pthrea=
d=5Fatfork-fix.patch
> > new file mode 100644
> > index 0000000000..d3f7790b1e
> > --- /dev/null
> > +++ b/meta/recipes-support/libcap-ng/libcap-ng/revert-pthread=5Fatfor=
k-fix.patch
> > =40=40 -0,0 +1,56 =40=40
> > +=46rom 81dc82393fae9851397fa5d94094434aa1d5c3d1 Mon Sep 17 00:00:00 =
2001
> > +=46rom: Christopher Larson <chris=5Flarson=40mentor.com>
> > +Date: Thu, 14 Nov 2019 21:13:24 +0500
> > +Subject: =5BPATCH=5D Revert =22=46ix usage of pthread=5Fatfork a who=
le different way=22
> > +
> > +This reverts commit 08a09cba90f3d960c080a20833fb8c0908f1cea6.
> > +
> > +The fix was breaking builds with some toolchains.
> > +
> > +Signed-off-by: Christopher Larson <chris=5Flarson=40mentor.com>
> > +---
> > + src/Makefile.am =7C 2 +-
> > + src/cap-ng.c =7C 12 +++++++++++-
> > + 2 files changed, 12 insertions(+), 2 deletions(-)
> > +
> > +diff --git a/src/Makefile.am b/src/Makefile.am
> > +index 5a66d4e..d46d02b 100644
> > +--- a/src/Makefile.am
> > ++++ b/src/Makefile.am
> > +=40=40 -34,5 +34,5 =40=40 noinst=5FHEADERS =3D captab.h
> > + libcap=5Fng=5Fla=5FSOURCES =3D cap-ng.c lookup=5Ftable.c
> > + libcap=5Fng=5Fla=5FLIBADD =3D
> > + libcap=5Fng=5Fla=5FDEPENDENCIES =3D =24(libcap=5Fng=5Fla=5FSOURCES)=
 ../config.h
> > +-libcap=5Fng=5Fla=5FLD=46LAGS =3D -Wl,-z,relro
> > ++libcap=5Fng=5Fla=5FLD=46LAGS =3D -Wl,-z,relro -Wl,-z,nodelete
> > +
> > +diff --git a/src/cap-ng.c b/src/cap-ng.c
> > +index 35fcd7a..ed31afa 100644
> > +--- a/src/cap-ng.c
> > ++++ b/src/cap-ng.c
> > +=40=40 -155,6 +155,15 =40=40 static =5F=5Fthread struct cap=5Fng m =3D=
 =7B 1,
> > + CAPNG=5FNEW,
> > + =7B0, 0=7D =7D;
> > +
> > ++
> > ++/*
> > ++ * The pthread=5Fatfork function is being made weak so that we can =
use it
> > ++ * if the program is linked with pthreads and not requiring it for
> > ++ * everything that uses libcap-ng.
> > ++ */
> > ++extern int =5F=5Fattribute=5F=5F((weak)) pthread=5Fatfork(void (*pr=
epare)(void),
> > ++ void (*parent)(void), void (*child)(void));
> > ++
> > + /*
> > + * Reset the state so that init gets called to erase everything
> > + */
> > +=40=40 -166,7 +175,8 =40=40 static void deinit(void)
> > + static void init=5Flib(void) =5F=5Fattribute=5F=5F ((constructor));=

> > + static void init=5Flib(void)
> > + =7B
> > +- pthread=5Fatfork(NULL, NULL, deinit);
> > ++ if (pthread=5Fatfork)
> > ++ pthread=5Fatfork(NULL, NULL, deinit);
> > + =7D
> > +
> > + static void init(void)
> > --
> > 2.11.1
> >
> > --
> > =5F=5F=5F=5F=5F=5F=5F=5F=5F=5F=5F=5F=5F=5F=5F=5F=5F=5F=5F=5F=5F=5F=5F=
=5F=5F=5F=5F=5F=5F=5F=5F=5F=5F=5F=5F=5F=5F=5F=5F=5F=5F=5F=5F=5F=5F=5F=5F
> > Openembedded-core mailing list
> > Openembedded-core=40lists.openembedded.org
> > http://lists.openembedded.org/mailman/listinfo/openembedded-core

--5ddc5851_216231b_2d9
Content-Type: text/html; charset="utf-8"
Content-Transfer-Encoding: quoted-printable
Content-Disposition: inline

<html xmlns=3D=22http://www.w3.org/1999/xhtml=22>
<head>
<title></title>
</head>
<body>
<div name=3D=22messageBodySection=22>
<div dir=3D=22auto=22>It seems like libcap wants to support use of pthrea=
d by the linking application without mandating it, so we can=E2=80=99t pa=
ss -pthread, and I=E2=80=99m not sure a configure check would help, unles=
s it wants to pull in pthread unconditionally. But I may be misunderstand=
ing the libcap commits, and am *definitely* not a threading expert :)</di=
v>
</div>
<div name=3D=22messageReplySection=22>On Nov 25, 2019, 3:27 PM -0700, Khe=
m Raj &lt;raj.khem=40gmail.com&gt;, wrote:<br />
<blockquote type=3D=22cite=22 class=3D=22spark=5Fquote=22 style=3D=22marg=
in: 5px 5px; padding-left: 10px; border-left: thin solid =231abc9c;=22>On=
 Mon, Nov 25, 2019 at 2:13 PM Christopher Larson &lt;kergoth=40gmail.com&=
gt; wrote:<br />
<blockquote type=3D=22cite=22 class=3D=22spark=5Fquote=22 style=3D=22marg=
in: 5px 5px; padding-left: 10px; border-left: thin solid =23e67e22;=22><b=
r />
=46rom: Christopher Larson &lt;chris=5Flarson=40mentor.com&gt;<br />
<br />
The libcap-ng build doesn't pass -pthread and can fail to link.<br />
<br /></blockquote>
<br />
perhaps, adding a configure time check for pthread.h would be possible<br=
 />
<br />
AC=5FCHECK=5FHEADERS(pthread.h, =5B=5D, =5BAC=5FMSG=5FWARN(pthread.h not =
found,<br />
pthread=5Fatfork disabled.)=5D)<br />
<br />
then include pthread.h inside conditional like below in source files.<br =
/>
<br />
=23ifdef HAVE=5FPTHREAD=5FH<br />
=23endif<br />
<br />
<br />
<br />
<blockquote type=3D=22cite=22 class=3D=22spark=5Fquote=22 style=3D=22marg=
in: 5px 5px; padding-left: 10px; border-left: thin solid =23e67e22;=22>Si=
gned-off-by: Christopher Larson &lt;chris=5Flarson=40mentor.com&gt;<br />=

---<br />
meta/recipes-support/libcap-ng/libcap-ng.inc =7C 1 +<br />
.../libcap-ng/revert-pthread=5Fatfork-fix.patch =7C 56 ++++++++++++++++++=
++++<br />
2 files changed, 57 insertions(+)<br />
create mode 100644 meta/recipes-support/libcap-ng/libcap-ng/revert-pthrea=
d=5Fatfork-fix.patch<br />
<br />
diff --git a/meta/recipes-support/libcap-ng/libcap-ng.inc b/meta/recipes-=
support/libcap-ng/libcap-ng.inc<br />
index aec83896e4..46d37e6807 100644<br />
--- a/meta/recipes-support/libcap-ng/libcap-ng.inc<br />
+++ b/meta/recipes-support/libcap-ng/libcap-ng.inc<br />
=40=40 -9,6 +9,7 =40=40 LIC=5F=46ILES=5FCHKSUM =3D =22file://COPYING;md5=3D=
94d55d512a9ba36caa9b7df079bae19f =5C<br />
<br />
SRC=5FURI =3D =22http://people.redhat.com/sgrubb/libcap-ng/libcap-ng-=24=7B=
PV=7D.tar.gz =5C<br />
file://python.patch =5C<br />
+ file://revert-pthread=5Fatfork-fix.patch =5C<br />
=22<br />
<br />
SRC=5FURI=5Bmd5sum=5D =3D =2257dc267e2949cdecb651a929f9206572=22<br />
diff --git a/meta/recipes-support/libcap-ng/libcap-ng/revert-pthread=5Fat=
fork-fix.patch b/meta/recipes-support/libcap-ng/libcap-ng/revert-pthread=5F=
atfork-fix.patch<br />
new file mode 100644<br />
index 0000000000..d3f7790b1e<br />
--- /dev/null<br />
+++ b/meta/recipes-support/libcap-ng/libcap-ng/revert-pthread=5Fatfork-fi=
x.patch<br />
=40=40 -0,0 +1,56 =40=40<br />
+=46rom 81dc82393fae9851397fa5d94094434aa1d5c3d1 Mon Sep 17 00:00:00 2001=
<br />
+=46rom: Christopher Larson &lt;chris=5Flarson=40mentor.com&gt;<br />
+Date: Thu, 14 Nov 2019 21:13:24 +0500<br />
+Subject: =5BPATCH=5D Revert =22=46ix usage of pthread=5Fatfork a whole d=
ifferent way=22<br />
+<br />
+This reverts commit 08a09cba90f3d960c080a20833fb8c0908f1cea6.<br />
+<br />
+The fix was breaking builds with some toolchains.<br />
+<br />
+Signed-off-by: Christopher Larson &lt;chris=5Flarson=40mentor.com&gt;<br=
 />
+---<br />
+ src/Makefile.am =7C 2 +-<br />
+ src/cap-ng.c =7C 12 +++++++++++-<br />
+ 2 files changed, 12 insertions(+), 2 deletions(-)<br />
+<br />
+diff --git a/src/Makefile.am b/src/Makefile.am<br />
+index 5a66d4e..d46d02b 100644<br />
+--- a/src/Makefile.am<br />
++++ b/src/Makefile.am<br />
+=40=40 -34,5 +34,5 =40=40 noinst=5FHEADERS =3D captab.h<br />
+ libcap=5Fng=5Fla=5FSOURCES =3D cap-ng.c lookup=5Ftable.c<br />
+ libcap=5Fng=5Fla=5FLIBADD =3D<br />
+ libcap=5Fng=5Fla=5FDEPENDENCIES =3D =24(libcap=5Fng=5Fla=5FSOURCES) ../=
config.h<br />
+-libcap=5Fng=5Fla=5FLD=46LAGS =3D -Wl,-z,relro<br />
++libcap=5Fng=5Fla=5FLD=46LAGS =3D -Wl,-z,relro -Wl,-z,nodelete<br />
+<br />
+diff --git a/src/cap-ng.c b/src/cap-ng.c<br />
+index 35fcd7a..ed31afa 100644<br />
+--- a/src/cap-ng.c<br />
++++ b/src/cap-ng.c<br />
+=40=40 -155,6 +155,15 =40=40 static =5F=5Fthread struct cap=5Fng m =3D =7B=
 1,<br />
+ CAPNG=5FNEW,<br />
+ =7B0, 0=7D =7D;<br />
+<br />
++<br />
++/*<br />
++ * The pthread=5Fatfork function is being made weak so that we can use =
it<br />
++ * if the program is linked with pthreads and not requiring it for<br /=
>
++ * everything that uses libcap-ng.<br />
++ */<br />
++extern int =5F=5Fattribute=5F=5F((weak)) pthread=5Fatfork(void (*prepar=
e)(void),<br />
++ void (*parent)(void), void (*child)(void));<br />
++<br />
+ /*<br />
+ * Reset the state so that init gets called to erase everything<br />
+ */<br />
+=40=40 -166,7 +175,8 =40=40 static void deinit(void)<br />
+ static void init=5Flib(void) =5F=5Fattribute=5F=5F ((constructor));<br =
/>
+ static void init=5Flib(void)<br />
+ =7B<br />
+- pthread=5Fatfork(NULL, NULL, deinit);<br />
++ if (pthread=5Fatfork)<br />
++ pthread=5Fatfork(NULL, NULL, deinit);<br />
+ =7D<br />
+<br />
+ static void init(void)<br />
--<br />
2.11.1<br />
<br />
--<br />
=5F=5F=5F=5F=5F=5F=5F=5F=5F=5F=5F=5F=5F=5F=5F=5F=5F=5F=5F=5F=5F=5F=5F=5F=5F=
=5F=5F=5F=5F=5F=5F=5F=5F=5F=5F=5F=5F=5F=5F=5F=5F=5F=5F=5F=5F=5F=5F<br />
Openembedded-core mailing list<br />
Openembedded-core=40lists.openembedded.org<br />
http://lists.openembedded.org/mailman/listinfo/openembedded-core<br /></b=
lockquote>
</blockquote>
</div>
</body>
</html>

--5ddc5851_216231b_2d9--
