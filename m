Return-Path: <kergoth@gmail.com>
Received: from mail-pg1-f194.google.com (mail-pg1-f194.google.com
	[209.85.215.194])
	by mail.openembedded.org (Postfix) with ESMTP id D10FF7F7C1
	for <openembedded-core@lists.openembedded.org>;
	Tue, 26 Nov 2019 17:29:45 +0000 (UTC)
Received: by mail-pg1-f194.google.com with SMTP id 207so9324982pge.8
	for <openembedded-core@lists.openembedded.org>;
	Tue, 26 Nov 2019 09:29:47 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=date:from:to:cc:message-id:in-reply-to:references:subject
	:mime-version; bh=zA6maQYj5H1noU3YXqRHT0Q1MtTTCQ8ngohjC9cRh1M=;
	b=CGmopGmRLx1EoknX1d9ReRr4njsVXgZ94xuo2PL/tfuALpXglSvUl6aI6tNXQiAkLg
	x36WKVwb3i2p9f3/dYsnXDs74kQlExlOZMkgf7zB04o77EdrDk6M9KPFff3jw5uAyq7A
	VBRD1Qry+YDeMJiglCgbo5fsx+uYOxSHLlsPJ57RBK4reSKwoxPAaTtwfKEknlFA/LnS
	r9dCb8E9LGakdr7PVHuOwrZhSKr9YWwSGvaXJxCLuTtIX1L+GwKwvSn9tPFMIbu16ND7
	Kdlzz0LE3GdTCyhhr3sFsVujx9ld7LBSgqtlI1Td88WB3UfhCZ86rj3p9B3lJGFjMbLG
	YIew==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:date:from:to:cc:message-id:in-reply-to
	:references:subject:mime-version;
	bh=zA6maQYj5H1noU3YXqRHT0Q1MtTTCQ8ngohjC9cRh1M=;
	b=qXYD9lR7L3viCNSM66ixCAQhFB8SGNG3xKChzW0ZsB1iHovXEybn3slIf0fKx+qllx
	gkcb5d1zdTo+M9Mfz1RPKqTKANY9T8vYyubnVMpI+kh1rL4TrpuA4DlRBsNrT8amZxoZ
	Es5KfIwJ4hwVxenPp374cTu8K/7oVzFj9KVKdMDcRNdY5/o4+MzeAKh6yT1nD0miqAKE
	elBQPr/+Wend+LigUImGoHJRwYtzK1yNlVy8JpIxKIB5kXraaf0DXRkB6ipeon9Z5wvA
	nc3Qu9TcAoMcKaJ3ZE4aag/aBvxNXsmIIvt/VTGRG6vvV23E/49SWKaYr2TcoxR5o67F
	sAjg==
X-Gm-Message-State: APjAAAV7MENjYH0IFAZkMAF2B9JtZyRIRufBU05o/TgxzVMDkPg0WT13
	r2Lac8pEUHQ0nmgYhB7F32Pr1Pkwf1zLJQ==
X-Google-Smtp-Source: APXvYqyLMbOn15tmHf+c3jwDwDZBzdNCGLvLCzFxDDX5Wm1ctfvcIFVCFi+ZofLy1kFC+1TBXsDUIQ==
X-Received: by 2002:aa7:93ce:: with SMTP id y14mr41400807pff.138.1574789386808;
	Tue, 26 Nov 2019 09:29:46 -0800 (PST)
Received: from [192.168.1.17] (ip70-180-21-74.ph.ph.cox.net. [70.180.21.74])
	by smtp.gmail.com with ESMTPSA id
	v63sm13347012pfb.181.2019.11.26.09.29.44
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Tue, 26 Nov 2019 09:29:45 -0800 (PST)
Date: Tue, 26 Nov 2019 10:29:38 -0700
From: Christopher Larson <kergoth@gmail.com>
To: Christopher Larson <kergoth@gmail.com>, Khem Raj
 <raj.khem@gmail.com>
Message-ID: <ca0ac6d6-2e30-4c68-b9e4-83121bd8b137@Spark>
In-Reply-To: <CAMKF1sos77k28JEJYBf_ox3s-dOJL_-ohHJuyQ15kv=xxP6S4A@mail.gmail.com>
References: <20191125221357.6560-1-kergoth@gmail.com>
	<20191125221357.6560-3-kergoth@gmail.com>
	<CAMKF1sos77k28JEJYBf_ox3s-dOJL_-ohHJuyQ15kv=xxP6S4A@mail.gmail.com>
X-Readdle-Message-ID: ca0ac6d6-2e30-4c68-b9e4-83121bd8b137@Spark
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
X-List-Received-Date: Tue, 26 Nov 2019 17:29:46 -0000
Content-Type: multipart/alternative; boundary="5ddd6107_3352255a_2d9"

--5ddd6107_3352255a_2d9
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: quoted-printable
Content-Disposition: inline

Testing with=C2=A0https://github.com/stevegrubb/libcap-ng/pull/10=C2=A0+ =
HAVE=5FPTHREAD=5FH conditional now. Thanks.
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

--5ddd6107_3352255a_2d9
Content-Type: text/html; charset="utf-8"
Content-Transfer-Encoding: quoted-printable
Content-Disposition: inline

<html xmlns=3D=22http://www.w3.org/1999/xhtml=22>
<head>
<title></title>
</head>
<body>
<div name=3D=22messageBodySection=22>
<div dir=3D=22auto=22>Testing with&=23160;<a href=3D=22https://github.com=
/stevegrubb/libcap-ng/pull/10=22>https://github.com/stevegrubb/libcap-ng/=
pull/10</a>&=23160;+ HAVE=5FPTHREAD=5FH conditional now. Thanks.</div>
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

--5ddd6107_3352255a_2d9--
