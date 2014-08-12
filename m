Return-Path: <sujith.h@gmail.com>
Received: from mail-qa0-f44.google.com (mail-qa0-f44.google.com
	[209.85.216.44])
	by mail.openembedded.org (Postfix) with ESMTP id 22D4F70C5D
	for <openembedded-core@lists.openembedded.org>;
	Tue, 12 Aug 2014 13:25:14 +0000 (UTC)
Received: by mail-qa0-f44.google.com with SMTP id f12so8852220qad.17
	for <openembedded-core@lists.openembedded.org>;
	Tue, 12 Aug 2014 06:25:13 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc:content-type;
	bh=uOs0iFKUJYLTxYcIWSbsB6XYUCh3UB9PLqb3IlLyh/8=;
	b=apcO9L+UETjKD/CM/IcWcQ+IZBHQTgoZcTI+VvUhXw585H33NqO2i6YM3IvyMfMFLt
	/p5GtsNAwhJ89vWq9epGgK8VcowZ8r/i3Uhdb+gfjFs2EmWpHb2kVBSUS3YFGhlyRKks
	Jh1DsZOMY0rws48VAzM0k7WLnHDvMwW0JPhE5OWkjf9SaqxTOaJyn0pGVd7LYxZ280Jf
	BI/hpmC0+0PJkDwB1Rx/yQzMohY1peviVLGp4pJFov/W5i3YnIXX43Z0k1g3eVXoUCPy
	Zo9EjLc89V1CVSMD9Ulo5AIi9eGyYPhMFcxRWwwCC5wpeh+GF4VF5TJbia4LBLO1PP/d
	7V4A==
X-Received: by 10.140.51.37 with SMTP id t34mr6374408qga.50.1407849913449;
	Tue, 12 Aug 2014 06:25:13 -0700 (PDT)
MIME-Version: 1.0
Received: by 10.140.41.148 with HTTP; Tue, 12 Aug 2014 06:24:53 -0700 (PDT)
In-Reply-To: <20140812112528.GE14848@jama>
References: <1407834260-22021-1-git-send-email-sujith.h@gmail.com>
	<20140812112528.GE14848@jama>
From: sujith h <sujith.h@gmail.com>
Date: Tue, 12 Aug 2014 18:54:53 +0530
Message-ID: <CADyYWL=JLhLhYd1KhhRKi+mDDd0aDnrTx1oNiwQX5+1XbJ_rvA@mail.gmail.com>
To: Martin Jansa <martin.jansa@gmail.com>
Cc: Sujith H <Sujith_Haridasan@mentor.com>,
	Christopher Larson <chris_larson@mentor.com>,
	openembedded-core@lists.openembedded.org
Subject: Re: [PATCH] pyparted: Add recipe
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
X-List-Received-Date: Tue, 12 Aug 2014 13:25:18 -0000
Content-Type: multipart/alternative; boundary=001a11351a5afd29e105006e9946

--001a11351a5afd29e105006e9946
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

On Tue, Aug 12, 2014 at 4:55 PM, Martin Jansa <martin.jansa@gmail.com>
wrote:

> On Tue, Aug 12, 2014 at 02:34:20PM +0530, Sujith H wrote:
> > From: Sujith H <Sujith_Haridasan@mentor.com>
> >
> > This recipe will provide a set of Python modules that
> > provide Python programmers an interface to libparted,
> > the GNU parted library for disk partitioning and filesystem
> > manipulation.
>
> Why not add it to meta-python?
>
>
Sure. Sending the patch to meta-python for review.

>
> >
> > Signed-off-by: Christopher Larson <chris_larson@mentor.com>
> > Signed-off-by: Sujith H <Sujith_Haridasan@mentor.com>
> > ---
> >  meta/recipes-extended/pyparted/pyparted_3.9.bb | 21
> +++++++++++++++++++++
> >  1 file changed, 21 insertions(+)
> >  create mode 100644 meta/recipes-extended/pyparted/pyparted_3.9.bb
> >
> > diff --git a/meta/recipes-extended/pyparted/pyparted_3.9.bb
> b/meta/recipes-extended/pyparted/pyparted_3.9.bb
> > new file mode 100644
> > index 0000000..7b284cc
> > --- /dev/null
> > +++ b/meta/recipes-extended/pyparted/pyparted_3.9.bb
> > @@ -0,0 +1,21 @@
> > +DESCRIPTION =3D "pyparted is a set of Python modules that provide Pyth=
on
> programmers \
> > +an interface to libparted, the GNU parted library for disk partitionin=
g
> and \
> > +filesystem manipulation."
> > +SUMMARY =3D "Python bindings for libparted"
> > +HOMEPAGE =3D "https://fedorahosted.org/pyparted/"
> > +SCM_URI =3D "git://git.fedorahosted.org/pyparted.git"
> > +LICENSE =3D "GPL-2.0+"
> > +LIC_FILES_CHKSUM =3D "\
> > +    file://COPYING;md5=3D8ca43cbc842c2336e835926c2166c28b \
> > +
>  file://src/_pedmodule.c;startline=3D10;endline=3D22;md5=3D70c62bd73782a0=
3f56a0571a9f08ea46
> \
> > +"
> > +DEPENDS +=3D "parted"
> > +PR =3D "r0"
> ^ drop
> > +
> > +SRC_URI =3D "
> https://fedorahosted.org/releases/p/y/pyparted/pyparted-${PV}.tar.gz"
> > +SRC_URI[md5sum] =3D "f16c7ef7f5fa4a43fcb2a4654b487e39"
> > +SRC_URI[sha256sum] =3D
> "a56712e3d058ce3d859c158236dbbf45224018919efd3d880ea80f9e0d0bebbb"
> > +
> > +inherit distutils
> > +
> > +BBCLASSEXTEND +=3D "native"
> > --
> > 1.8.4
> >
> > --
> > _______________________________________________
> > Openembedded-core mailing list
> > Openembedded-core@lists.openembedded.org
> > http://lists.openembedded.org/mailman/listinfo/openembedded-core
>
> --
> Martin 'JaMa' Jansa     jabber: Martin.Jansa@gmail.com
>



--=20
=E0=B4=B8=E0=B5=81=E0=B4=9C=E0=B4=BF=E0=B4=A4=E0=B5=8D =E0=B4=B9=E0=B4=B0=
=E0=B4=BF=E0=B4=A6=E0=B4=BE=E0=B4=B8=E0=B4=A8=E0=B5=8D
Bangalore
<Project>Contributor to KDE project
http://fci.wikia.com/wiki/Anti-DRM-Campaign
<Blog> http://sujithh.info

--001a11351a5afd29e105006e9946
Content-Type: text/html; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><br><div class=3D"gmail_extra"><br><br><div class=3D"gmail=
_quote">On Tue, Aug 12, 2014 at 4:55 PM, Martin Jansa <span dir=3D"ltr">&lt=
;<a href=3D"mailto:martin.jansa@gmail.com" target=3D"_blank">martin.jansa@g=
mail.com</a>&gt;</span> wrote:<br>

<blockquote class=3D"gmail_quote" style=3D"margin:0 0 0 .8ex;border-left:1p=
x #ccc solid;padding-left:1ex"><div class=3D"">On Tue, Aug 12, 2014 at 02:3=
4:20PM +0530, Sujith H wrote:<br>
&gt; From: Sujith H &lt;<a href=3D"mailto:Sujith_Haridasan@mentor.com">Suji=
th_Haridasan@mentor.com</a>&gt;<br>
&gt;<br>
&gt; This recipe will provide a set of Python modules that<br>
&gt; provide Python programmers an interface to libparted,<br>
&gt; the GNU parted library for disk partitioning and filesystem<br>
&gt; manipulation.<br>
<br>
</div>Why not add it to meta-python?<br>
<div><div class=3D"h5"><br></div></div></blockquote><div><br></div><div>Sur=
e. Sending the patch to meta-python for review. <br></div><blockquote class=
=3D"gmail_quote" style=3D"margin:0 0 0 .8ex;border-left:1px #ccc solid;padd=
ing-left:1ex">

<div><div class=3D"h5">
<br>
&gt;<br>
&gt; Signed-off-by: Christopher Larson &lt;<a href=3D"mailto:chris_larson@m=
entor.com">chris_larson@mentor.com</a>&gt;<br>
&gt; Signed-off-by: Sujith H &lt;<a href=3D"mailto:Sujith_Haridasan@mentor.=
com">Sujith_Haridasan@mentor.com</a>&gt;<br>
&gt; ---<br>
&gt; =C2=A0meta/recipes-extended/pyparted/<a href=3D"http://pyparted_3.9.bb=
" target=3D"_blank">pyparted_3.9.bb</a> | 21 +++++++++++++++++++++<br>
&gt; =C2=A01 file changed, 21 insertions(+)<br>
&gt; =C2=A0create mode 100644 meta/recipes-extended/pyparted/<a href=3D"htt=
p://pyparted_3.9.bb" target=3D"_blank">pyparted_3.9.bb</a><br>
&gt;<br>
&gt; diff --git a/meta/recipes-extended/pyparted/<a href=3D"http://pyparted=
_3.9.bb" target=3D"_blank">pyparted_3.9.bb</a> b/meta/recipes-extended/pypa=
rted/<a href=3D"http://pyparted_3.9.bb" target=3D"_blank">pyparted_3.9.bb</=
a><br>


&gt; new file mode 100644<br>
&gt; index 0000000..7b284cc<br>
&gt; --- /dev/null<br>
&gt; +++ b/meta/recipes-extended/pyparted/<a href=3D"http://pyparted_3.9.bb=
" target=3D"_blank">pyparted_3.9.bb</a><br>
&gt; @@ -0,0 +1,21 @@<br>
&gt; +DESCRIPTION =3D &quot;pyparted is a set of Python modules that provid=
e Python programmers \<br>
&gt; +an interface to libparted, the GNU parted library for disk partitioni=
ng and \<br>
&gt; +filesystem manipulation.&quot;<br>
&gt; +SUMMARY =3D &quot;Python bindings for libparted&quot;<br>
&gt; +HOMEPAGE =3D &quot;<a href=3D"https://fedorahosted.org/pyparted/" tar=
get=3D"_blank">https://fedorahosted.org/pyparted/</a>&quot;<br>
&gt; +SCM_URI =3D &quot;git://<a href=3D"http://git.fedorahosted.org/pypart=
ed.git" target=3D"_blank">git.fedorahosted.org/pyparted.git</a>&quot;<br>
&gt; +LICENSE =3D &quot;GPL-2.0+&quot;<br>
&gt; +LIC_FILES_CHKSUM =3D &quot;\<br>
&gt; + =C2=A0 =C2=A0file://COPYING;md5=3D8ca43cbc842c2336e835926c2166c28b \=
<br>
&gt; + =C2=A0 =C2=A0file://src/_pedmodule.c;startline=3D10;endline=3D22;md5=
=3D70c62bd73782a03f56a0571a9f08ea46 \<br>
&gt; +&quot;<br>
&gt; +DEPENDS +=3D &quot;parted&quot;<br>
&gt; +PR =3D &quot;r0&quot;<br>
</div></div>^ drop<br>
<div class=3D"HOEnZb"><div class=3D"h5">&gt; +<br>
&gt; +SRC_URI =3D &quot;<a href=3D"https://fedorahosted.org/releases/p/y/py=
parted/pyparted-${PV}.tar.gz" target=3D"_blank">https://fedorahosted.org/re=
leases/p/y/pyparted/pyparted-${PV}.tar.gz</a>&quot;<br>
&gt; +SRC_URI[md5sum] =3D &quot;f16c7ef7f5fa4a43fcb2a4654b487e39&quot;<br>
&gt; +SRC_URI[sha256sum] =3D &quot;a56712e3d058ce3d859c158236dbbf4522401891=
9efd3d880ea80f9e0d0bebbb&quot;<br>
&gt; +<br>
&gt; +inherit distutils<br>
&gt; +<br>
&gt; +BBCLASSEXTEND +=3D &quot;native&quot;<br>
&gt; --<br>
&gt; 1.8.4<br>
&gt;<br>
</div></div><span class=3D"HOEnZb"><font color=3D"#888888">&gt; --<br>
&gt; _______________________________________________<br>
&gt; Openembedded-core mailing list<br>
&gt; <a href=3D"mailto:Openembedded-core@lists.openembedded.org">Openembedd=
ed-core@lists.openembedded.org</a><br>
&gt; <a href=3D"http://lists.openembedded.org/mailman/listinfo/openembedded=
-core" target=3D"_blank">http://lists.openembedded.org/mailman/listinfo/ope=
nembedded-core</a><br>
<br>
--<br>
Martin &#39;JaMa&#39; Jansa =C2=A0 =C2=A0 jabber: <a href=3D"mailto:Martin.=
Jansa@gmail.com">Martin.Jansa@gmail.com</a><br>
</font></span></blockquote></div><br><br clear=3D"all"><br>-- <br>=E0=B4=B8=
=E0=B5=81=E0=B4=9C=E0=B4=BF=E0=B4=A4=E0=B5=8D =E0=B4=B9=E0=B4=B0=E0=B4=BF=
=E0=B4=A6=E0=B4=BE=E0=B4=B8=E0=B4=A8=E0=B5=8D<br>Bangalore<br>&lt;Project&g=
t;Contributor to KDE project<br><a href=3D"http://fci.wikia.com/wiki/Anti-D=
RM-Campaign" target=3D"_blank">http://fci.wikia.com/wiki/Anti-DRM-Campaign<=
/a><br>

&lt;Blog&gt; <a href=3D"http://sujithh.info" target=3D"_blank">http://sujit=
hh.info</a><br>
</div></div>

--001a11351a5afd29e105006e9946--
