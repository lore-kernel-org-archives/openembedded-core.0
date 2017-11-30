Return-Path: <jkrishnanjanappa@mvista.com>
Received: from mail-it0-f50.google.com (mail-it0-f50.google.com
	[209.85.214.50])
	by mail.openembedded.org (Postfix) with ESMTP id E3D237833E
	for <openembedded-core@lists.openembedded.org>;
	Thu, 30 Nov 2017 07:16:48 +0000 (UTC)
Received: by mail-it0-f50.google.com with SMTP id f190so7267023ita.5
	for <openembedded-core@lists.openembedded.org>;
	Wed, 29 Nov 2017 23:16:50 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=mvista-com.20150623.gappssmtp.com; s=20150623;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc; bh=i39Xut/sHXlXI8rP8cC1OkBso8B+79STMv3mLd/6nA8=;
	b=dYnEm7hf4QFVxitOalMbBhZvWP2d1IHdvTlcpt0ye6gOvGe4zBEjjigk5FAX2hhcq3
	ZrfQm60Q0hUjPju04jwLP1bRA87VWNFxV4dBlYRIEfZ2KeUAE/vHzWdWMJbkgrFh95u6
	DoYGwl/QmVWlMDFrUa4pFiUkNdo21L4HhFa2KYX3qS+wcHhjy2+gL7ee48OSgzSJLtbV
	Qs+v8YB8Wthpb8SU65VTbof2+rXmN8W58R6gRTFL67wrWZ7pgZu3kMnvdQoZ3kqCtkeX
	z1e3/8agahkw9lYA0V3fVK4IZ2zkvIsx4FT087NPGR4nhD+iqf3dvzpehDSChqlRZEnP
	heaQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc;
	bh=i39Xut/sHXlXI8rP8cC1OkBso8B+79STMv3mLd/6nA8=;
	b=cta/fbkXXsyRdBA5it1MmINXqC29WkCAklzne3UbyfZNI5nTpYJh3ZjU6ZG4r4tO7i
	Ot3GOR1QvuiluhAjUeX1rYNsUM6fTNipdwW95ATOWny+SwuZn9T53llg+9AJ8ucCZIYm
	wFAZzNSr4dcyj2yhnQLsNkLBokR/hEd226PPTYfT1FvqhCzlfXLyNgyME3DSb4pszl8+
	9uPQqdyBmKPSVmEAhvXW5c+d4biQeztTV55ND98qYR6uz0fOHVLiwxAaiCr3vtBuQQ7i
	fd4hSv0IqjuRYn5zWN8o0ToiqALhq3tXLJKIGustL2OHyTGYEyFPQ87sG9MPULal3YJJ
	y0eQ==
X-Gm-Message-State: AJaThX7pJ21U5HybFkxW9vgW1kXQ37j89YZJF19YHo4UwqlI+6b9xcTB
	RRxbeMB1+qJbkFpJUfo+QkjiIeNKeE8uRzgCQl87FQ==
X-Google-Smtp-Source: AGs4zMbEYiN0q2tUigYtPtD+nuJAZNeXdnP9nRF3pqOpH20klZAMPaPe3k/CZnkfhWMvL+31xYcb+BPVPWirZ5yVg+Y=
X-Received: by 10.36.86.10 with SMTP id o10mr1828240itb.86.1512026210000; Wed,
	29 Nov 2017 23:16:50 -0800 (PST)
MIME-Version: 1.0
Received: by 10.2.8.1 with HTTP; Wed, 29 Nov 2017 23:16:49 -0800 (PST)
In-Reply-To: <CAMKF1sr+QA-u-7HzECytK_-ejPc_9kwxvbskxr1_PgqecnA-xQ@mail.gmail.com>
References: <1511460302-27041-1-git-send-email-akuster808@gmail.com>
	<CAMKF1sr2ZAM0sH19g0Y0Ewbb7D61x6igA4NBXd0wrXYBx9Wvvw@mail.gmail.com>
	<CAD3vsf7S+QhF5_qQbLVt9DrzGrwZb_HUX3BNL=iMgp8CVtgn6g@mail.gmail.com>
	<CAMKF1sr+QA-u-7HzECytK_-ejPc_9kwxvbskxr1_PgqecnA-xQ@mail.gmail.com>
From: Jagadeesh Krishnanjanappa <jkrishnanjanappa@mvista.com>
Date: Thu, 30 Nov 2017 12:46:49 +0530
Message-ID: <CAD3vsf4ADAauOgHQjVucMAFTraYMLLxEcaMEtAht06yUbGPvRg@mail.gmail.com>
To: Khem Raj <raj.khem@gmail.com>
Cc: akuster <akuster@mvista.com>,
	Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Subject: Re: [Morty][PATCH] binutils: Fix build issue on Centos 6
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
X-List-Received-Date: Thu, 30 Nov 2017 07:16:49 -0000
Content-Type: multipart/alternative; boundary="001a114505e0237857055f2e0905"

--001a114505e0237857055f2e0905
Content-Type: text/plain; charset="UTF-8"

> > The above link points to gcc rpms of v4.8.1/2, but the  "-Wstack-usage"
> > option
> > was introduced in gcc v4.9.x; so I think the problem exists with the
> above
> > rpms.
> > Ref: https://sourceware.org/bugzilla/show_bug.cgi?id=19854
> >
>
> Then you might need to install devtool version 6
>
> https://www.softwarecollections.org/en/scls/rhscl/devtoolset-6/
>
> Basically, we are intentionally building binaries/libraries on
lower versions of distro; in order to make sure they (binaries/libraries)
work on higher/latest distros. Installing this devtoolset can solve the
issue,
but our purpose will not be met.

However, Thank You for the info; it would help someone in future.

Regards,
Jagadeesh


> > Regards,
> > Jagadeesh
> >
> >> > gprof' cc1: error: unrecognized command line option
> >> > "-Wstack-usage=262144"
> >> >
> >> > Signed-off-by: Jagadeesh Krishnanjanappa <jkrishnanjanappa@mvista.com
> >
> >> > Reviewed-by: Jeremy Puhlman <jpuhlman@mvista.com>
> >> > Signed-off-by: Armin Kuster <akuster@mvista.com>
> >> > ---
> >> >  meta/recipes-devtools/binutils/binutils-cross-canadian.inc | 7
> +++++++
> >> >  1 file changed, 7 insertions(+)
> >> >
> >> > diff --git a/meta/recipes-devtools/binutils/binutils-cross-
> canadian.inc
> >> > b/meta/recipes-devtools/binutils/binutils-cross-canadian.inc
> >> > index ae14642..30e3bc6 100644
> >> > --- a/meta/recipes-devtools/binutils/binutils-cross-canadian.inc
> >> > +++ b/meta/recipes-devtools/binutils/binutils-cross-canadian.inc
> >> > @@ -12,6 +12,13 @@ EXTRA_OECONF +=
> >> > "--with-sysroot=${SDKPATH}/sysroots/${TUNE_PKGARCH}${TARGET_VEND
> >> >  # e.g. we switch between different machines with different tunes.
> >> >  EXTRA_OECONF[vardepsexclude] = "TUNE_PKGARCH"
> >> >
> >> > +EXTRA_OEMAKE += "WARN_CFLAGS='-W -Wall -Wstrict-prototypes
> >> > -Wmissing-prototypes -Wshadow'"
> >> > +do_configure_prepend () {
> >> > +       sed -i ${S}/bfd/warning.m4 -e "/Wstack-usage/D"
> >> > +       sed -i ${S}/bfd/configure -e "s/-Wstack-usage=262144//"
> >> > +       sed -i ${S}/binutils/configure -e "s/-Wstack-usage=262144//"
> >> > +}
> >> > +
> >> >  do_install () {
> >> >         autotools_do_install
> >> >
> >> > --
> >> > 2.7.4
> >> >
> >> > --
> >> > _______________________________________________
> >> > Openembedded-core mailing list
> >> > Openembedded-core@lists.openembedded.org
> >> > http://lists.openembedded.org/mailman/listinfo/openembedded-core
> >> --
> >> _______________________________________________
> >> Openembedded-core mailing list
> >> Openembedded-core@lists.openembedded.org
> >> http://lists.openembedded.org/mailman/listinfo/openembedded-core
> >
> >
>

--001a114505e0237857055f2e0905
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><span class=3D"gmail-"></span><br><span class=3D"gmail-"><=
/span><div class=3D"gmail_extra"><div class=3D"gmail_quote"><blockquote cla=
ss=3D"gmail_quote" style=3D"margin:0px 0px 0px 0.8ex;border-left:1px solid =
rgb(204,204,204);padding-left:1ex"><span class=3D"gmail-">
&gt; The above link points to gcc rpms of v4.8.1/2, but the=C2=A0 &quot;-Ws=
tack-usage&quot;<br>
&gt; option<br>
&gt; was introduced in gcc v4.9.x; so I think the problem exists with the a=
bove<br>
&gt; rpms.<br>
&gt; Ref: <a href=3D"https://sourceware.org/bugzilla/show_bug.cgi?id=3D1985=
4" rel=3D"noreferrer" target=3D"_blank">https://sourceware.org/<wbr>bugzill=
a/show_bug.cgi?id=3D19854</a><br>
&gt;<br>
<br>
</span>Then you might need to install devtool version 6<br>
<br>
<a href=3D"https://www.softwarecollections.org/en/scls/rhscl/devtoolset-6/"=
 rel=3D"noreferrer" target=3D"_blank">https://www.<wbr>softwarecollections.=
org/en/<wbr>scls/rhscl/devtoolset-6/</a><br>
<div class=3D"gmail-HOEnZb"><div class=3D"gmail-h5"><br></div></div></block=
quote><div>Basically, we are intentionally building binaries/libraries on</=
div><div>lower versions of distro; in order to make sure they (binaries/lib=
raries) <br></div><div>work on higher/latest distros. Installing this devto=
olset can solve the issue, <br></div><div>but our purpose will not be met.<=
/div><div><br></div><div>However, Thank You for the info; it would help som=
eone in future.</div><div><br></div><div>Regards,</div><div>Jagadeesh</div>=
<div><br></div><blockquote class=3D"gmail_quote" style=3D"margin:0px 0px 0p=
x 0.8ex;border-left:1px solid rgb(204,204,204);padding-left:1ex"><div class=
=3D"gmail-HOEnZb"><div class=3D"gmail-h5">
<br>
&gt; Regards,<br>
&gt; Jagadeesh<br>
&gt;<br>
&gt;&gt; &gt; gprof&#39; cc1: error: unrecognized command line option<br>
&gt;&gt; &gt; &quot;-Wstack-usage=3D262144&quot;<br>
&gt;&gt; &gt;<br>
&gt;&gt; &gt; Signed-off-by: Jagadeesh Krishnanjanappa &lt;<a href=3D"mailt=
o:jkrishnanjanappa@mvista.com">jkrishnanjanappa@mvista.com</a>&gt;<br>
&gt;&gt; &gt; Reviewed-by: Jeremy Puhlman &lt;<a href=3D"mailto:jpuhlman@mv=
ista.com">jpuhlman@mvista.com</a>&gt;<br>
&gt;&gt; &gt; Signed-off-by: Armin Kuster &lt;<a href=3D"mailto:akuster@mvi=
sta.com">akuster@mvista.com</a>&gt;<br>
&gt;&gt; &gt; ---<br>
&gt;&gt; &gt;=C2=A0 meta/recipes-devtools/<wbr>binutils/binutils-cross-<wbr=
>canadian.inc | 7 +++++++<br>
&gt;&gt; &gt;=C2=A0 1 file changed, 7 insertions(+)<br>
&gt;&gt; &gt;<br>
&gt;&gt; &gt; diff --git a/meta/recipes-devtools/<wbr>binutils/binutils-cro=
ss-<wbr>canadian.inc<br>
&gt;&gt; &gt; b/meta/recipes-devtools/<wbr>binutils/binutils-cross-<wbr>can=
adian.inc<br>
&gt;&gt; &gt; index ae14642..30e3bc6 100644<br>
&gt;&gt; &gt; --- a/meta/recipes-devtools/<wbr>binutils/binutils-cross-<wbr=
>canadian.inc<br>
&gt;&gt; &gt; +++ b/meta/recipes-devtools/<wbr>binutils/binutils-cross-<wbr=
>canadian.inc<br>
&gt;&gt; &gt; @@ -12,6 +12,13 @@ EXTRA_OECONF +=3D<br>
&gt;&gt; &gt; &quot;--with-sysroot=3D${SDKPATH}/<wbr>sysroots/${TUNE_PKGARC=
H}${<wbr>TARGET_VEND<br>
&gt;&gt; &gt;=C2=A0 # e.g. we switch between different machines with differ=
ent tunes.<br>
&gt;&gt; &gt;=C2=A0 EXTRA_OECONF[vardepsexclude] =3D &quot;TUNE_PKGARCH&quo=
t;<br>
&gt;&gt; &gt;<br>
&gt;&gt; &gt; +EXTRA_OEMAKE +=3D &quot;WARN_CFLAGS=3D&#39;-W -Wall -Wstrict=
-prototypes<br>
&gt;&gt; &gt; -Wmissing-prototypes -Wshadow&#39;&quot;<br>
&gt;&gt; &gt; +do_configure_prepend () {<br>
&gt;&gt; &gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0sed -i ${S}/bfd/warning.m4 -e &qu=
ot;/Wstack-usage/D&quot;<br>
&gt;&gt; &gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0sed -i ${S}/bfd/configure -e &quo=
t;s/-Wstack-usage=3D262144//&quot;<br>
&gt;&gt; &gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0sed -i ${S}/binutils/configure -e=
 &quot;s/-Wstack-usage=3D262144//&quot;<br>
&gt;&gt; &gt; +}<br>
&gt;&gt; &gt; +<br>
&gt;&gt; &gt;=C2=A0 do_install () {<br>
&gt;&gt; &gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0autotools_do_install<br>
&gt;&gt; &gt;<br>
&gt;&gt; &gt; --<br>
&gt;&gt; &gt; 2.7.4<br>
&gt;&gt; &gt;<br>
&gt;&gt; &gt; --<br>
&gt;&gt; &gt; ______________________________<wbr>_________________<br>
&gt;&gt; &gt; Openembedded-core mailing list<br>
&gt;&gt; &gt; <a href=3D"mailto:Openembedded-core@lists.openembedded.org">O=
penembedded-core@lists.<wbr>openembedded.org</a><br>
&gt;&gt; &gt; <a href=3D"http://lists.openembedded.org/mailman/listinfo/ope=
nembedded-core" rel=3D"noreferrer" target=3D"_blank">http://lists.openembed=
ded.org/<wbr>mailman/listinfo/openembedded-<wbr>core</a><br>
&gt;&gt; --<br>
&gt;&gt; ______________________________<wbr>_________________<br>
&gt;&gt; Openembedded-core mailing list<br>
&gt;&gt; <a href=3D"mailto:Openembedded-core@lists.openembedded.org">Openem=
bedded-core@lists.<wbr>openembedded.org</a><br>
&gt;&gt; <a href=3D"http://lists.openembedded.org/mailman/listinfo/openembe=
dded-core" rel=3D"noreferrer" target=3D"_blank">http://lists.openembedded.o=
rg/<wbr>mailman/listinfo/openembedded-<wbr>core</a><br>
&gt;<br>
&gt;<br>
</div></div></blockquote></div><br></div></div>

--001a114505e0237857055f2e0905--
