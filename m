Received: from mail-yw0-f47.google.com ([209.85.213.47])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <andrei@gherzan.ro>) id 1SRNTn-00023h-Qg
	for openembedded-core@lists.openembedded.org;
	Mon, 07 May 2012 14:55:56 +0200
Received: by yhjj56 with SMTP id j56so4222994yhj.6
	for <openembedded-core@lists.openembedded.org>;
	Mon, 07 May 2012 05:46:04 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=google.com; s=20120113;
	h=mime-version:x-originating-ip:in-reply-to:references:from:date
	:message-id:subject:to:content-type:x-gm-message-state;
	bh=CbChizm8/0aF9PdokxhuSc85vpMUOnnvYazmcsk8SOo=;
	b=l7FTIxeuqOeEQpkjzyZ1FE8uEcor8PJlyQLt19bV1LKTnFebHIaDwdnzvUmmVeMjfB
	b079Lhw3h5dr0woCwMtvC+ZJQkj+9B5YSSFc2KPt0y/3yC1kQ/LHCXrhWODrhN+EyRvZ
	yFPBe2djeHzFR5kgceBnrY9j8v5VUlRJ3zhVlrVFdQ9F+at17whKAWhCK38iQSvpqhfT
	SvXvybWaE6+fdzmH/YREbnE2aWvbvhocI0o44bQLq/cpPDa5L0Q8KSsgj9pABm7YwysD
	HNYo4vJ0AVats2WkEF6OEbPdyleGC9sFvMQDQRYtVjdiJPEOgbS3OT4iI7mhYBk5FE/l
	CuGA==
Received: by 10.50.45.202 with SMTP id p10mr8009363igm.52.1336394764215; Mon,
	07 May 2012 05:46:04 -0700 (PDT)
MIME-Version: 1.0
Received: by 10.64.25.18 with HTTP; Mon, 7 May 2012 05:45:44 -0700 (PDT)
X-Originating-IP: [79.115.103.32]
In-Reply-To: <1336393053.20211.0.camel@ted>
References: <1336389953-19123-1-git-send-email-andrei@gherzan.ro>
	<1336393053.20211.0.camel@ted>
From: Andrei Gherzan <andrei@gherzan.ro>
Date: Mon, 7 May 2012 15:45:44 +0300
Message-ID: <CAK18fxGejAcBMzh1t0dNUMobBQ69g2hovsOR7jFRGyGW_6VH3Q@mail.gmail.com>
To: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
X-Gm-Message-State: ALoCoQn9zdI5Caxj14iOt7jS3WTYHHJuJTynHdWYlkmvNCysS2iKV8BhB6S8QoqTmDg4johCwyqE
Subject: Re: [PATCH] fotowall: Add patch which adds ui_wizard.h as a make dependency to ExportWizard.o
X-BeenThere: openembedded-core@lists.openembedded.org
X-Mailman-Version: 2.1.11
Precedence: list
Reply-To: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
List-Id: Patches and discussions about the oe-core layer
	<openembedded-core.lists.openembedded.org>
List-Unsubscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/options/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.linuxtogo.org/pipermail/openembedded-core>
List-Post: <mailto:openembedded-core@lists.openembedded.org>
List-Help: <mailto:openembedded-core-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Mon, 07 May 2012 12:55:56 -0000
Content-Type: multipart/alternative; boundary=14dae93406053364ea04bf71a76e

--14dae93406053364ea04bf71a76e
Content-Type: text/plain; charset=ISO-8859-1

Slap. My bad. Brb with the real fix.

*@g*


On Mon, May 7, 2012 at 3:17 PM, Richard Purdie <
richard.purdie@linuxfoundation.org> wrote:

> On Mon, 2012-05-07 at 14:25 +0300, Andrei Gherzan wrote:
> > App/ExportWizard.cpp depends on wizard.h which depends on ui_wizard. The
> last one
> > should be already generated before compiling ExportWizard.cpp.
> >
> > [YOCTO #2297]
> >
> > Signed-off-by: Andrei Gherzan <andrei@gherzan.ro>
> > ---
> >  meta/recipes-qt/qt-apps/fotowall_0.9.bb            |    6 ++++--
> >  .../ExportWizard-depends-on-ui_wizard.patch        |   20
> ++++++++++++++++++++
> >  2 files changed, 24 insertions(+), 2 deletions(-)
> >  create mode 100644
> meta/recipes-qt/qt-apps/fotowall_0.9/ExportWizard-depends-on-ui_wizard.patch
> >
> > diff --git a/meta/recipes-qt/qt-apps/fotowall_0.9.bbb/meta/recipes-qt/qt-apps/
> fotowall_0.9.bb
> > index 52dd727..04580ff 100644
> > --- a/meta/recipes-qt/qt-apps/fotowall_0.9.bb
> > +++ b/meta/recipes-qt/qt-apps/fotowall_0.9.bb
> > @@ -7,12 +7,14 @@ LIC_FILES_CHKSUM =
> "file://GPL_V2;md5=79808397c3355f163c012616125c9e26 \
> >
>  file://main.cpp;beginline=6;endline=11;md5=b569acc2bf8974a3082b58fc53b9d8dc"
> >  SECTION = "x11/apps"
> >
> > -PR = "r2"
> > +PR = "r3"
> >
> >  DEPENDS = "qt4-x11-free"
> >  RRECOMMENDS_${PN} += "qt4-plugin-imageformat-gif
> qt4-plugin-imageformat-jpeg qt4-plugin-imageformat-tiff"
> >
> > -SRC_URI = "
> http://qt-apps.org/CONTENT/content-files/71316-Fotowall-0.9.tar.bz2"
> > +SRC_URI = "
> http://qt-apps.org/CONTENT/content-files/71316-Fotowall-0.9.tar.bz2 \
> > +        file://ExportWizard-depends-on-ui_wizard.patch \
> > +        "
> >
> >  SRC_URI[md5sum] = "142ef697332e0777c6d22c5bc96cc438"
> >  SRC_URI[sha256sum] =
> "e4d0c005d2cb1d7c09438bfc3098eadebc08946e4fbc0655b7fc8b046de3810d"
> > diff --git
> a/meta/recipes-qt/qt-apps/fotowall_0.9/ExportWizard-depends-on-ui_wizard.patch
> b/meta/recipes-qt/qt-apps/fotowall_0.9/ExportWizard-depends-on-ui_wizard.patch
> > new file mode 100644
> > index 0000000..4101e28
> > --- /dev/null
> > +++
> b/meta/recipes-qt/qt-apps/fotowall_0.9/ExportWizard-depends-on-ui_wizard.patch
> > @@ -0,0 +1,20 @@
> > +App/ExportWizard.cpp depends on wizard.h which depends on ui_wizard.
> The last one
> > +should be already generated before compiling ExportWizard.cpp.
> > +
> > +Signed-off-by: Andrei Gherzan <andrei@gherzan.ro>
> > +Upstream-Status: Pending
> > +
> > +Index: Fotowall-0.9/Makefile
> > +===================================================================
> > +--- Fotowall-0.9.orig/Makefile       2012-05-06 16:54:26.991254818 +0300
> > ++++ Fotowall-0.9/Makefile    2012-05-06 16:52:57.000000000 +0300
> > +@@ -1074,7 +1074,8 @@
> > +             Canvas/CanvasModeInfo.h \
> > +             App/App.h \
> > +             App/Settings.h \
> > +-            .build/ui_ExportWizard.h
> > ++            .build/ui_ExportWizard.h \
> > ++            .build/ui_wizard.h
> > +     $(CXX) -c $(CXXFLAGS) $(INCPATH) -o .build/ExportWizard.o
> App/ExportWizard.cpp
> > +
> > + .build/FotowallFile.o: App/FotowallFile.cpp App/FotowallFile.h \
>
>
> Isn't this Makefile autogenerated?
>
> Cheers,
>
> Richard
>
>
>
> _______________________________________________
> Openembedded-core mailing list
> Openembedded-core@lists.openembedded.org
> http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-core
>

--14dae93406053364ea04bf71a76e
Content-Type: text/html; charset=ISO-8859-1
Content-Transfer-Encoding: quoted-printable

Slap. My bad. Brb with the real fix.=A0<br clear=3D"all"><div style=3D"text=
-align:center"></div><div style=3D"text-align:center"><div align=3D"left" s=
tyle=3D"font-family:&#39;Times New Roman&#39;;font-size:medium"><font face=
=3D"Arial" color=3D"#333333" size=3D"-1"><br>

<b>@g</b></font></div></div>
<br><br><div class=3D"gmail_quote">On Mon, May 7, 2012 at 3:17 PM, Richard =
Purdie <span dir=3D"ltr">&lt;<a href=3D"mailto:richard.purdie@linuxfoundati=
on.org" target=3D"_blank">richard.purdie@linuxfoundation.org</a>&gt;</span>=
 wrote:<br>

<blockquote class=3D"gmail_quote" style=3D"margin:0 0 0 .8ex;border-left:1p=
x #ccc solid;padding-left:1ex"><div class=3D"HOEnZb"><div class=3D"h5">On M=
on, 2012-05-07 at 14:25 +0300, Andrei Gherzan wrote:<br>
&gt; App/ExportWizard.cpp depends on wizard.h which depends on ui_wizard. T=
he last one<br>
&gt; should be already generated before compiling ExportWizard.cpp.<br>
&gt;<br>
&gt; [YOCTO #2297]<br>
&gt;<br>
&gt; Signed-off-by: Andrei Gherzan &lt;<a href=3D"mailto:andrei@gherzan.ro"=
>andrei@gherzan.ro</a>&gt;<br>
&gt; ---<br>
&gt; =A0meta/recipes-qt/qt-apps/<a href=3D"http://fotowall_0.9.bb" target=
=3D"_blank">fotowall_0.9.bb</a> =A0 =A0 =A0 =A0 =A0 =A0| =A0 =A06 ++++--<br=
>
&gt; =A0.../ExportWizard-depends-on-ui_wizard.patch =A0 =A0 =A0 =A0| =A0 20=
 ++++++++++++++++++++<br>
&gt; =A02 files changed, 24 insertions(+), 2 deletions(-)<br>
&gt; =A0create mode 100644 meta/recipes-qt/qt-apps/fotowall_0.9/ExportWizar=
d-depends-on-ui_wizard.patch<br>
&gt;<br>
&gt; diff --git a/meta/recipes-qt/qt-apps/<a href=3D"http://fotowall_0.9.bb=
" target=3D"_blank">fotowall_0.9.bb</a> b/meta/recipes-qt/qt-apps/<a href=
=3D"http://fotowall_0.9.bb" target=3D"_blank">fotowall_0.9.bb</a><br>
&gt; index 52dd727..04580ff 100644<br>
&gt; --- a/meta/recipes-qt/qt-apps/<a href=3D"http://fotowall_0.9.bb" targe=
t=3D"_blank">fotowall_0.9.bb</a><br>
&gt; +++ b/meta/recipes-qt/qt-apps/<a href=3D"http://fotowall_0.9.bb" targe=
t=3D"_blank">fotowall_0.9.bb</a><br>
&gt; @@ -7,12 +7,14 @@ LIC_FILES_CHKSUM =3D &quot;file://GPL_V2;md5=3D79808=
397c3355f163c012616125c9e26 \<br>
&gt; =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0file://main.cpp;beginline=
=3D6;endline=3D11;md5=3Db569acc2bf8974a3082b58fc53b9d8dc&quot;<br>
&gt; =A0SECTION =3D &quot;x11/apps&quot;<br>
&gt;<br>
&gt; -PR =3D &quot;r2&quot;<br>
&gt; +PR =3D &quot;r3&quot;<br>
&gt;<br>
&gt; =A0DEPENDS =3D &quot;qt4-x11-free&quot;<br>
&gt; =A0RRECOMMENDS_${PN} +=3D &quot;qt4-plugin-imageformat-gif qt4-plugin-=
imageformat-jpeg qt4-plugin-imageformat-tiff&quot;<br>
&gt;<br>
&gt; -SRC_URI =3D &quot;<a href=3D"http://qt-apps.org/CONTENT/content-files=
/71316-Fotowall-0.9.tar.bz2" target=3D"_blank">http://qt-apps.org/CONTENT/c=
ontent-files/71316-Fotowall-0.9.tar.bz2</a>&quot;<br>
&gt; +SRC_URI =3D &quot;<a href=3D"http://qt-apps.org/CONTENT/content-files=
/71316-Fotowall-0.9.tar.bz2" target=3D"_blank">http://qt-apps.org/CONTENT/c=
ontent-files/71316-Fotowall-0.9.tar.bz2</a> \<br>
&gt; + =A0 =A0 =A0 =A0file://ExportWizard-depends-on-ui_wizard.patch \<br>
&gt; + =A0 =A0 =A0 =A0&quot;<br>
&gt;<br>
&gt; =A0SRC_URI[md5sum] =3D &quot;142ef697332e0777c6d22c5bc96cc438&quot;<br=
>
&gt; =A0SRC_URI[sha256sum] =3D &quot;e4d0c005d2cb1d7c09438bfc3098eadebc0894=
6e4fbc0655b7fc8b046de3810d&quot;<br>
&gt; diff --git a/meta/recipes-qt/qt-apps/fotowall_0.9/ExportWizard-depends=
-on-ui_wizard.patch b/meta/recipes-qt/qt-apps/fotowall_0.9/ExportWizard-dep=
ends-on-ui_wizard.patch<br>
&gt; new file mode 100644<br>
&gt; index 0000000..4101e28<br>
&gt; --- /dev/null<br>
&gt; +++ b/meta/recipes-qt/qt-apps/fotowall_0.9/ExportWizard-depends-on-ui_=
wizard.patch<br>
&gt; @@ -0,0 +1,20 @@<br>
&gt; +App/ExportWizard.cpp depends on wizard.h which depends on ui_wizard. =
The last one<br>
&gt; +should be already generated before compiling ExportWizard.cpp.<br>
&gt; +<br>
&gt; +Signed-off-by: Andrei Gherzan &lt;<a href=3D"mailto:andrei@gherzan.ro=
">andrei@gherzan.ro</a>&gt;<br>
&gt; +Upstream-Status: Pending<br>
&gt; +<br>
&gt; +Index: Fotowall-0.9/Makefile<br>
&gt; +=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D<br>
&gt; +--- Fotowall-0.9.orig/Makefile =A0 =A0 =A0 2012-05-06 16:54:26.991254=
818 +0300<br>
&gt; ++++ Fotowall-0.9/Makefile =A0 =A02012-05-06 16:52:57.000000000 +0300<=
br>
&gt; +@@ -1074,7 +1074,8 @@<br>
&gt; + =A0 =A0 =A0 =A0 =A0 =A0 Canvas/CanvasModeInfo.h \<br>
&gt; + =A0 =A0 =A0 =A0 =A0 =A0 App/App.h \<br>
&gt; + =A0 =A0 =A0 =A0 =A0 =A0 App/Settings.h \<br>
&gt; +- =A0 =A0 =A0 =A0 =A0 =A0.build/ui_ExportWizard.h<br>
&gt; ++ =A0 =A0 =A0 =A0 =A0 =A0.build/ui_ExportWizard.h \<br>
&gt; ++ =A0 =A0 =A0 =A0 =A0 =A0.build/ui_wizard.h<br>
&gt; + =A0 =A0 $(CXX) -c $(CXXFLAGS) $(INCPATH) -o .build/ExportWizard.o Ap=
p/ExportWizard.cpp<br>
&gt; +<br>
&gt; + .build/FotowallFile.o: App/FotowallFile.cpp App/FotowallFile.h \<br>
<br>
<br>
</div></div>Isn&#39;t this Makefile autogenerated?<br>
<br>
Cheers,<br>
<br>
Richard<br>
<br>
<br>
<br>
_______________________________________________<br>
Openembedded-core mailing list<br>
<a href=3D"mailto:Openembedded-core@lists.openembedded.org">Openembedded-co=
re@lists.openembedded.org</a><br>
<a href=3D"http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded=
-core" target=3D"_blank">http://lists.linuxtogo.org/cgi-bin/mailman/listinf=
o/openembedded-core</a><br>
</blockquote></div><br>

--14dae93406053364ea04bf71a76e--
