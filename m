Received: from mail-yw0-f47.google.com ([209.85.213.47])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <andrei@gherzan.ro>) id 1T28Jn-0004iE-Fv
	for openembedded-core@lists.openembedded.org;
	Fri, 17 Aug 2012 00:13:31 +0200
Received: by yhjj56 with SMTP id j56so3784492yhj.6
	for <openembedded-core@lists.openembedded.org>;
	Thu, 16 Aug 2012 15:01:33 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=google.com; s=20120113;
	h=mime-version:x-originating-ip:in-reply-to:references:from:date
	:message-id:subject:to:content-type:x-gm-message-state;
	bh=CaZVlXdEDjJ/ogDCmOUswm31tmk5uqn/6i3Vmpz99JQ=;
	b=EnT0xZdZah3790cMsZsr9YMPqG1Ghy+YnPmoUrzgVXo5/nYXzLtEmZSeFQHPEop7qi
	EqiNdxlMpOHYAGf9sisnIp4x6TcKEdNvItiBIv9fss7nEsSa0EUSRyPh7DSXzE2tyW+y
	S39Bekc5JXPf9o0PsUOVAJaZxChB+YyjeCij6MYfmulr4xfY6migi596jSikNmh6TYjd
	EilsxMkgAI63FncFGPtMSsaRAZIPumCb0cWBHiWeh6o+/fbab6BHUrX3kFgixk4bT25t
	id0auBH/2JBRr20jmsebkyymW1JCCSy7xo8F9JkjO2B0xA8ESwEJBK7di4NO6fMt9sRS
	TkzQ==
Received: by 10.50.41.195 with SMTP id h3mr3348567igl.34.1345154492808; Thu,
	16 Aug 2012 15:01:32 -0700 (PDT)
MIME-Version: 1.0
Received: by 10.64.63.50 with HTTP; Thu, 16 Aug 2012 15:01:12 -0700 (PDT)
X-Originating-IP: [79.115.110.29]
In-Reply-To: <20120816215744.GB3625@jama.jama.net>
References: <cover.1345152235.git.andrei@gherzan.ro>
	<3f88694096116da408832aad9afd90df386e0a36.1345152235.git.andrei@gherzan.ro>
	<20120816215744.GB3625@jama.jama.net>
From: Andrei Gherzan <andrei@gherzan.ro>
Date: Fri, 17 Aug 2012 01:01:12 +0300
Message-ID: <CAK18fxE-rn5r2Be2J2Px1eb9B2cG3eADbRO4Bf_N1estuAXf5A@mail.gmail.com>
To: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
X-Gm-Message-State: ALoCoQkCr0kwjsL5cEutMhUn3xSb+qMu62TztvCT+zDgNdk4zL5VNjmQwP7G1stRKgyApvHCP2gX
Subject: Re: [PATCH 5/7] subversion: Add gettext to DEPENDS as msgfmt is needed at compile time
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
X-List-Received-Date: Thu, 16 Aug 2012 22:13:31 -0000
Content-Type: multipart/alternative; boundary=14dae934051db63d8a04c7692f99

--14dae934051db63d8a04c7692f99
Content-Type: text/plain; charset=ISO-8859-1

On Fri, Aug 17, 2012 at 12:57 AM, Martin Jansa <martin.jansa@gmail.com>wrote:

> On Fri, Aug 17, 2012 at 12:32:48AM +0300, Andrei Gherzan wrote:
> > Avoid error:
> > | /bin/bash: <path>/tmp/sysroots/i686-linux/usr/bin/msgfmt: No such file
> or
> > directory
>
> shouldn't this be gettext-native or inherit gettext then?
>
> Bad patch - not a lame excuse i just realized this now. This is what
happens if i mix stuff together... sorry.


> > | make: *** [subversion/po/de.mo] Error 127
> > | make: *** Waiting for unfinished jobs....
> > | ERROR: oe_runmake failed
> >
> > Signed-off-by: Andrei Gherzan <andrei@gherzan.ro>
> > ---
> >  .../subversion/subversion_1.7.2.bb                 |    4 +++-
> >  1 file changed, 3 insertions(+), 1 deletion(-)
> >
> > diff --git a/meta/recipes-devtools/subversion/subversion_1.7.2.bbb/meta/recipes-devtools/subversion/
> subversion_1.7.2.bb
> > index 4f71de5..6b72e73 100644
> > --- a/meta/recipes-devtools/subversion/subversion_1.7.2.bb
> > +++ b/meta/recipes-devtools/subversion/subversion_1.7.2.bb
> > @@ -5,9 +5,11 @@ RDEPENDS_${PN} = "neon"
> >  LICENSE = "Apache-2"
> >  HOMEPAGE = "http://subversion.tigris.org"
> >
> > +DEPENDS = "gettext"
> > +
> >  BBCLASSEXTEND = "native"
> >
> > -PR = "r3"
> > +PR = "r4"
> >
> >  SRC_URI = "${APACHE_MIRROR}/${BPN}/${BPN}-${PV}.tar.bz2 \
> >             file://libtool2.patch \
> > --
> > 1.7.9.5
> >
> >
> > _______________________________________________
> > Openembedded-core mailing list
> > Openembedded-core@lists.openembedded.org
> > http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-core
>
> --
> Martin 'JaMa' Jansa     jabber: Martin.Jansa@gmail.com
>
> _______________________________________________
> Openembedded-core mailing list
> Openembedded-core@lists.openembedded.org
> http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-core
>
>

--14dae934051db63d8a04c7692f99
Content-Type: text/html; charset=ISO-8859-1
Content-Transfer-Encoding: quoted-printable

<div class=3D"gmail_quote">On Fri, Aug 17, 2012 at 12:57 AM, Martin Jansa <=
span dir=3D"ltr">&lt;<a href=3D"mailto:martin.jansa@gmail.com" target=3D"_b=
lank">martin.jansa@gmail.com</a>&gt;</span> wrote:<br><blockquote class=3D"=
gmail_quote" style=3D"margin:0 0 0 .8ex;border-left:1px #ccc solid;padding-=
left:1ex">

On Fri, Aug 17, 2012 at 12:32:48AM +0300, Andrei Gherzan wrote:<br>
&gt; Avoid error:<br>
&gt; | /bin/bash: &lt;path&gt;/tmp/sysroots/i686-linux/usr/bin/msgfmt: No s=
uch file or<br>
&gt; directory<br>
<br>
shouldn&#39;t this be gettext-native or inherit gettext then?<br>
<br></blockquote><div>Bad patch - not a lame excuse i just realized this no=
w. This is what happens if i mix stuff together... sorry.=A0</div><div>=A0<=
/div><blockquote class=3D"gmail_quote" style=3D"margin:0 0 0 .8ex;border-le=
ft:1px #ccc solid;padding-left:1ex">


&gt; | make: *** [subversion/po/de.mo] Error 127<br>
&gt; | make: *** Waiting for unfinished jobs....<br>
&gt; | ERROR: oe_runmake failed<br>
&gt;<br>
&gt; Signed-off-by: Andrei Gherzan &lt;<a href=3D"mailto:andrei@gherzan.ro"=
>andrei@gherzan.ro</a>&gt;<br>
&gt; ---<br>
&gt; =A0.../subversion/<a href=3D"http://subversion_1.7.2.bb" target=3D"_bl=
ank">subversion_1.7.2.bb</a> =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 | =A0 =A04 +++=
-<br>
&gt; =A01 file changed, 3 insertions(+), 1 deletion(-)<br>
&gt;<br>
&gt; diff --git a/meta/recipes-devtools/subversion/<a href=3D"http://subver=
sion_1.7.2.bb" target=3D"_blank">subversion_1.7.2.bb</a> b/meta/recipes-dev=
tools/subversion/<a href=3D"http://subversion_1.7.2.bb" target=3D"_blank">s=
ubversion_1.7.2.bb</a><br>


&gt; index 4f71de5..6b72e73 100644<br>
&gt; --- a/meta/recipes-devtools/subversion/<a href=3D"http://subversion_1.=
7.2.bb" target=3D"_blank">subversion_1.7.2.bb</a><br>
&gt; +++ b/meta/recipes-devtools/subversion/<a href=3D"http://subversion_1.=
7.2.bb" target=3D"_blank">subversion_1.7.2.bb</a><br>
&gt; @@ -5,9 +5,11 @@ RDEPENDS_${PN} =3D &quot;neon&quot;<br>
&gt; =A0LICENSE =3D &quot;Apache-2&quot;<br>
&gt; =A0HOMEPAGE =3D &quot;<a href=3D"http://subversion.tigris.org" target=
=3D"_blank">http://subversion.tigris.org</a>&quot;<br>
&gt;<br>
&gt; +DEPENDS =3D &quot;gettext&quot;<br>
&gt; +<br>
&gt; =A0BBCLASSEXTEND =3D &quot;native&quot;<br>
&gt;<br>
&gt; -PR =3D &quot;r3&quot;<br>
&gt; +PR =3D &quot;r4&quot;<br>
&gt;<br>
&gt; =A0SRC_URI =3D &quot;${APACHE_MIRROR}/${BPN}/${BPN}-${PV}.tar.bz2 \<br=
>
&gt; =A0 =A0 =A0 =A0 =A0 =A0 file://libtool2.patch \<br>
<span class=3D"HOEnZb"><font color=3D"#888888">&gt; --<br>
&gt; 1.7.9.5<br>
&gt;<br>
&gt;<br>
&gt; _______________________________________________<br>
&gt; Openembedded-core mailing list<br>
&gt; <a href=3D"mailto:Openembedded-core@lists.openembedded.org">Openembedd=
ed-core@lists.openembedded.org</a><br>
&gt; <a href=3D"http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openemb=
edded-core" target=3D"_blank">http://lists.linuxtogo.org/cgi-bin/mailman/li=
stinfo/openembedded-core</a><br>
<br>
--<br>
Martin &#39;JaMa&#39; Jansa =A0 =A0 jabber: <a href=3D"mailto:Martin.Jansa@=
gmail.com">Martin.Jansa@gmail.com</a><br>
</font></span><br>_______________________________________________<br>
Openembedded-core mailing list<br>
<a href=3D"mailto:Openembedded-core@lists.openembedded.org">Openembedded-co=
re@lists.openembedded.org</a><br>
<a href=3D"http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded=
-core" target=3D"_blank">http://lists.linuxtogo.org/cgi-bin/mailman/listinf=
o/openembedded-core</a><br>
<br></blockquote></div><br>

--14dae934051db63d8a04c7692f99--
