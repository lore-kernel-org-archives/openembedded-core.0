Return-Path: <jussi.kukkonen@intel.com>
Received: from mail-oi0-f45.google.com (mail-oi0-f45.google.com
	[209.85.218.45])
	by mail.openembedded.org (Postfix) with ESMTP id 470636E668
	for <openembedded-core@lists.openembedded.org>;
	Tue, 30 Aug 2016 15:15:14 +0000 (UTC)
Received: by mail-oi0-f45.google.com with SMTP id f189so30099183oig.3
	for <openembedded-core@lists.openembedded.org>;
	Tue, 30 Aug 2016 08:15:16 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=intel-com.20150623.gappssmtp.com; s=20150623;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc; bh=1BvtV8KvgxRTr4KSLz/BB0wLmHZoKk725UspeQrA/kM=;
	b=ULaLxOBv4rfzSuxNHPoltsIFmP2gnlwvsRslRGL3RnbJHcWdRqA+qBjVZFHgYTplQU
	LYhlLr9u36eP+KGJtNf0kzxPI4WOANEhNTwxrPn1g0iS76dY6xkbmDIQELSQ2K/oLE6Y
	if3uul1QQ90ANw7twlAJDdY0lC9LgrHCWbhKPdYwthNZrpv6GrJDxtuUfh6n21SXvZNE
	3DGDWq2cBacMrIV0xhuart7NrZLhrYYq/+gZrRK8i92CJ6pD1EMGWRAjZAwGjm19TqMx
	JYjGub9bDJ1REUsRYNs6Ml5+mX2fxiE8yzWM9TvwTA0owGGxSpCNwU12/9AFM9UgNMkD
	pU+Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc;
	bh=1BvtV8KvgxRTr4KSLz/BB0wLmHZoKk725UspeQrA/kM=;
	b=cn0aEw4+GoHiWmEFbCl50rJ/WSHcimWg/nv6lO07F6yhkg51cUbQRfTsvN+ERd79Zv
	76+gMWiS2I8nXXDNCX0d5kYQvksrkYwimzm8O9CYZsL5KS/iGLYK9uLNKKAtqVyvmYf6
	kBnvT8mHIz04TQ5+ajchP/vrsfFDmTwhyBPorQyv2UE7Ufhtc6CB71nja8dyKbs3M6L0
	jsva9BfPjab4M2a+A4gNMvPHtvlmDry76eTAN+iBPhKyd87gpP/IDfWLhuRkb4cRIWjI
	4LqOQyp2mX+678Iu5r0aZlZA4IqIqR2NTaabJqUCvJ72/m6s1TNIGtnnbRz6RZbGaQJt
	XDzw==
X-Gm-Message-State: AE9vXwMTKlmPQkFlhy8ptKlhg4dINGC5YnSEyYCdhB+zWQBQRZoahb2ulcUlSPTuhVS/XmJQtn8Uu8VpMcP3YPZ5
X-Received: by 10.157.30.202 with SMTP id n68mr4755647otn.15.1472570115458;
	Tue, 30 Aug 2016 08:15:15 -0700 (PDT)
MIME-Version: 1.0
Received: by 10.202.241.11 with HTTP; Tue, 30 Aug 2016 08:14:45 -0700 (PDT)
In-Reply-To: <CAHiDW_GGyG+-_xatGAX7taNtM+DpWr-j3=bHdZdCi0LGvUYyNw@mail.gmail.com>
References: <20160830021713.16392-1-edwin.plauchu.camacho@linux.intel.com>
	<CAHiDW_GGyG+-_xatGAX7taNtM+DpWr-j3=bHdZdCi0LGvUYyNw@mail.gmail.com>
From: Jussi Kukkonen <jussi.kukkonen@intel.com>
Date: Tue, 30 Aug 2016 18:14:45 +0300
Message-ID: <CAHiDW_EYdXYYjgFfFOZ9SJnCcyHqQfqOWjB5m1_Sa27xMH4Q4w@mail.gmail.com>
To: Edwin Plauchu <edwin.plauchu.camacho@linux.intel.com>
Cc: Edwin Plauchu <edwin.plauchu.camacho@intel.com>,
	Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH V1] unzip: fixes strange output
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
X-List-Received-Date: Tue, 30 Aug 2016 15:15:15 -0000
Content-Type: multipart/alternative; boundary=001a113ba450a3ea13053b4b7227

--001a113ba450a3ea13053b4b7227
Content-Type: text/plain; charset=UTF-8

On 30 August 2016 at 10:21, Jussi Kukkonen <jussi.kukkonen@intel.com> wrote:

> On 30 August 2016 at 05:17, Edwin Plauchu <edwin.plauchu.camacho@linux.
> intel.com> wrote:
> >
> > From: Edwin Plauchu <edwin.plauchu.camacho@intel.com>
> >
> > This fixes commit 763a3d424bccf559a8d6add3dc1f2746c82f2933
> >
> > Output was strange when using unzip to extract zip file.
> > This patch fixed so.
> >
> > [YOCTO #9551]
> >
> > Signed-off-by: Edwin Plauchu <edwin.plauchu.camacho@intel.com>
> > ---
> >  .../unzip/unzip/fix-security-format.patch          | 198
> ++++++++-------------
> >  1 file changed, 78 insertions(+), 120 deletions(-)
> >
> > diff --git a/meta/recipes-extended/unzip/unzip/fix-security-format.patch
> b/meta/recipes-extended/unzip/unzip/fix-security-format.patch
> > index c82f502..8e9b06c 100644
> > --- a/meta/recipes-extended/unzip/unzip/fix-security-format.patch
> > +++ b/meta/recipes-extended/unzip/unzip/fix-security-format.patch
> > @@ -9,131 +9,89 @@ Upstream-Status: Pending
> >
> >  Signed-off-by: Edwin Plauchu <edwin.plauchu.camacho@intel.com>
> >
> > -diff --git a/unzpriv.h b/unzpriv.h
> > -index c8d3eab..85e693a 100644
> > ---- a/unzpriv.h
> > -+++ b/unzpriv.h
> > -@@ -1006,7 +1006,7 @@
> > - #    define LoadFarStringSmall(x)   Qstrfix(x)
> > - #    define LoadFarStringSmall2(x)  Qstrfix(x)
> > - #  else
> > --#    define LoadFarString(x)        (char *)(x)
> > -+#    define LoadFarString(x)        "%s",(char *)(x)
>
> LoadFarString is used a _lot_ in various different ways, usually as
> argument to another macro or function. This sort of macro change seems
> potentially very dangerous in C, have you checked this is ok in every case?.
>

Edwin just pointed out to me that the patch actually removes this macro
change, and he's correct. My patch-of-patch reading failure.

So I'm fine with this patch, sorry for noise.
  Jussi

--001a113ba450a3ea13053b4b7227
Content-Type: text/html; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div class=3D"gmail_extra"><div class=3D"gmail_quote">On 3=
0 August 2016 at 10:21, Jussi Kukkonen <span dir=3D"ltr">&lt;<a href=3D"mai=
lto:jussi.kukkonen@intel.com" target=3D"_blank">jussi.kukkonen@intel.com</a=
>&gt;</span> wrote:<br><blockquote class=3D"gmail_quote" style=3D"margin:0 =
0 0 .8ex;border-left:1px #ccc solid;padding-left:1ex"><div dir=3D"ltr"><div=
><div class=3D"h5">On 30 August 2016 at 05:17, Edwin Plauchu &lt;<a href=3D=
"mailto:edwin.plauchu.camacho@linux.intel.com" target=3D"_blank">edwin.plau=
chu.camacho@linux.<wbr>intel.com</a>&gt; wrote:<br>&gt;<br>&gt; From: Edwin=
 Plauchu &lt;<a href=3D"mailto:edwin.plauchu.camacho@intel.com" target=3D"_=
blank">edwin.plauchu.camacho@intel.<wbr>com</a>&gt;<br>&gt;<br>&gt; This fi=
xes commit 763a3d424bccf559a8d6add3dc1f27<wbr>46c82f2933<br>&gt;<br>&gt; Ou=
tput was strange when using unzip to extract zip file.<br>&gt; This patch f=
ixed so.<br>&gt;<br>&gt; [YOCTO #9551]<br>&gt;<br>&gt; Signed-off-by: Edwin=
 Plauchu &lt;<a href=3D"mailto:edwin.plauchu.camacho@intel.com" target=3D"_=
blank">edwin.plauchu.camacho@intel.<wbr>com</a>&gt;<br>&gt; ---<br>&gt; =C2=
=A0.../unzip/unzip/fix-security-<wbr>format.patch =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0| 198 ++++++++-------------<br>&gt; =C2=A01 file changed, 78 inse=
rtions(+), 120 deletions(-)<br>&gt;<br>&gt; diff --git a/meta/recipes-exten=
ded/unzip/<wbr>unzip/fix-security-format.<wbr>patch b/meta/recipes-extended=
/unzip/<wbr>unzip/fix-security-format.<wbr>patch<br>&gt; index c82f502..8e9=
b06c 100644<br>&gt; --- a/meta/recipes-extended/unzip/<wbr>unzip/fix-securi=
ty-format.<wbr>patch<br>&gt; +++ b/meta/recipes-extended/unzip/<wbr>unzip/f=
ix-security-format.<wbr>patch<br>&gt; @@ -9,131 +9,89 @@ Upstream-Status: P=
ending<br>&gt;<br>&gt; =C2=A0Signed-off-by: Edwin Plauchu &lt;<a href=3D"ma=
ilto:edwin.plauchu.camacho@intel.com" target=3D"_blank">edwin.plauchu.camac=
ho@intel.<wbr>com</a>&gt;<br>&gt;<br>&gt; -diff --git a/unzpriv.h b/unzpriv=
.h<br>&gt; -index c8d3eab..85e693a 100644<br>&gt; ---- a/unzpriv.h<br>&gt; =
-+++ b/unzpriv.h<br>&gt; -@@ -1006,7 +1006,7 @@<br>&gt; - # =C2=A0 =C2=A0de=
fine LoadFarStringSmall(x) =C2=A0 Qstrfix(x)<br>&gt; - # =C2=A0 =C2=A0defin=
e LoadFarStringSmall2(x) =C2=A0Qstrfix(x)<br>&gt; - # =C2=A0else<br>&gt; --=
# =C2=A0 =C2=A0define LoadFarString(x) =C2=A0 =C2=A0 =C2=A0 =C2=A0(char *)(=
x)<br>&gt; -+# =C2=A0 =C2=A0define LoadFarString(x) =C2=A0 =C2=A0 =C2=A0 =
=C2=A0&quot;%s&quot;,(char *)(x)<br><br></div></div>LoadFarString is used a=
 _lot_ in various different ways, usually as argument to another macro or f=
unction. This sort of macro change seems potentially very dangerous in C, h=
ave you checked this is ok in every case?.<br></div></blockquote><div><br><=
/div><div>Edwin just pointed out to me that the patch actually removes this=
 macro change, and he&#39;s correct. My patch-of-patch reading failure.</di=
v><div><br></div><div>So I&#39;m fine with this patch, sorry for noise.</di=
v><div>=C2=A0=C2=A0Jussi</div><div><br></div></div></div></div>

--001a113ba450a3ea13053b4b7227--
