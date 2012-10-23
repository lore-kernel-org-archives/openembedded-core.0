Received: from mail-ob0-f175.google.com ([209.85.214.175])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <giuseppe.condorelli@gmail.com>) id 1TQaYe-0001Cm-3q
	for openembedded-core@lists.openembedded.org;
	Tue, 23 Oct 2012 11:13:56 +0200
Received: by mail-ob0-f175.google.com with SMTP id eq6so3295775obc.6
	for <openembedded-core@lists.openembedded.org>;
	Tue, 23 Oct 2012 02:00:29 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=mime-version:in-reply-to:references:date:message-id:subject:from:to
	:cc:content-type;
	bh=1Gl9x3gll5wUIA98WitWQbaqbBEcpEH9unBg1SPQxw4=;
	b=VqaJ4eDLR7ex+IrKN5yQWdNZbt79o4FPPYkDsmOTIc1Sar3q1+c86ABdFswHeMV6lU
	y4IdTo/6+87yJMGBm3DtvobxeaR7dbzBYFBXLsGZEnj+gZ3o1X2NAk9EaEDUsgPb9ANf
	VyK3CsZuT7DU6VqX7MpztldR+3nqAO4LeFL3GWjd7C03rqZkyal7mb7fl4o52vRGz0/w
	rmM8QJwzxZic5Vr05Dc0xx7Kw5WG+fH4TaNaFKR8w0unSXceGLh9bOqqxHyMcDGHMG8w
	aS6wge/shQQz+JejFVzdRqjDcgfGUY61W+r8Sij0ToMqSpWVGmrQwshXYdEL+4egUa4H
	XP1w==
MIME-Version: 1.0
Received: by 10.60.25.136 with SMTP id c8mr10124783oeg.103.1350982829860; Tue,
	23 Oct 2012 02:00:29 -0700 (PDT)
Received: by 10.60.123.47 with HTTP; Tue, 23 Oct 2012 02:00:29 -0700 (PDT)
In-Reply-To: <1350982663.22340.23.camel@ted>
References: <1350974753-519-1-git-send-email-giuseppe.condorelli@st.com>
	<1350982663.22340.23.camel@ted>
Date: Tue, 23 Oct 2012 11:00:29 +0200
Message-ID: <CAOHjBZvuGu+V42YKaJGPHJf=8htJxjVyY7Tnn68Hx8pvt3bBag@mail.gmail.com>
From: Giuseppe Condorelli <giuseppe.condorelli@gmail.com>
To: Richard Purdie <richard.purdie@linuxfoundation.org>
Cc: openembedded-core@lists.openembedded.org
Subject: Re: [PATCH] base-files: do_install_basefilesissue error
X-BeenThere: openembedded-core@lists.openembedded.org
X-Mailman-Version: 2.1.11
Precedence: list
List-Id: Patches and discussions about the oe-core layer
	<openembedded-core.lists.openembedded.org>
List-Unsubscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/options/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.linuxtogo.org/pipermail/openembedded-core>
List-Post: <mailto:openembedded-core@lists.openembedded.org>
List-Help: <mailto:openembedded-core-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Tue, 23 Oct 2012 09:13:57 -0000
Content-Type: multipart/alternative; boundary=e89a8ff1c1aeabe58f04ccb633eb

--e89a8ff1c1aeabe58f04ccb633eb
Content-Type: text/plain; charset=ISO-8859-1

Hi Richard,

indeed this patch was erroneously sent twice and in the other one it was
replied the mistake was solved and it is no more valid.
Please discard it as already suggested in the other thread.
Thanks,
Giuseppe

2012/10/23 Richard Purdie <richard.purdie@linuxfoundation.org>

> On Tue, 2012-10-23 at 08:45 +0200, Giuseppe CONDORELLI wrote:
> > Fixed error in do_install_basefilesissue, printf is now replaced by echo.
>
> What kind of error?
>
> Doesn't this change have issues about how newlines are handled?
>
> Cheers,
>
> Richard
>
>
> > Signed-off-by: Giuseppe Condorelli <giuseppe.condorelli@st.com>
> > ---
> >  meta/recipes-core/base-files/base-files_3.0.14.bb |    8 ++++----
> >  1 files changed, 4 insertions(+), 4 deletions(-)
> >
> > diff --git a/meta/recipes-core/base-files/base-files_3.0.14.bbb/meta/recipes-core/base-files/
> base-files_3.0.14.bb
> > index ba355ee..766b0e5 100644
> > --- a/meta/recipes-core/base-files/base-files_3.0.14.bb
> > +++ b/meta/recipes-core/base-files/base-files_3.0.14.bb
> > @@ -117,11 +117,11 @@ do_install_basefilesissue () {
> >
> >       install -m 644 ${WORKDIR}/issue*  ${D}${sysconfdir}
> >          if [ -n "${DISTRO_NAME}" ]; then
> > -             printf "${DISTRO_NAME} " >> ${D}${sysconfdir}/issue
> > -             printf "${DISTRO_NAME} " >> ${D}${sysconfdir}/issue.net
> > +             echo "${DISTRO_NAME} " >> ${D}${sysconfdir}/issue
> > +             echo "${DISTRO_NAME} " >> ${D}${sysconfdir}/issue.net
> >               if [ -n "${DISTRO_VERSION}" ]; then
> > -                     printf "${DISTRO_VERSION} " >>
> ${D}${sysconfdir}/issue
> > -                     printf "${DISTRO_VERSION} " >> ${D}${sysconfdir}/
> issue.net
> > +                     echo "${DISTRO_VERSION} " >>
> ${D}${sysconfdir}/issue
> > +                     echo "${DISTRO_VERSION} " >> ${D}${sysconfdir}/
> issue.net
> >               fi
> >               echo "\n \l" >> ${D}${sysconfdir}/issue
> >               echo >> ${D}${sysconfdir}/issue
>
>
>
> _______________________________________________
> Openembedded-core mailing list
> Openembedded-core@lists.openembedded.org
> http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-core
>

--e89a8ff1c1aeabe58f04ccb633eb
Content-Type: text/html; charset=ISO-8859-1
Content-Transfer-Encoding: quoted-printable

<div>Hi Richard,</div><div>=A0</div><div>indeed this patch was erroneously =
sent twice and in the other one it was replied the mistake was solved and i=
t is no more valid.</div><div>Please discard it as already suggested in the=
 other thread.</div>
<div>Thanks,</div><div>Giuseppe<br><br></div><div class=3D"gmail_quote">201=
2/10/23 Richard Purdie <span dir=3D"ltr">&lt;<a href=3D"mailto:richard.purd=
ie@linuxfoundation.org" target=3D"_blank">richard.purdie@linuxfoundation.or=
g</a>&gt;</span><br>
<blockquote style=3D"margin:0px 0px 0px 0.8ex;padding-left:1ex;border-left-=
color:rgb(204,204,204);border-left-width:1px;border-left-style:solid" class=
=3D"gmail_quote"><div class=3D"im">On Tue, 2012-10-23 at 08:45 +0200, Giuse=
ppe CONDORELLI wrote:<br>

&gt; Fixed error in do_install_basefilesissue, printf is now replaced by ec=
ho.<br>
<br>
</div>What kind of error?<br>
<br>
Doesn&#39;t this change have issues about how newlines are handled?<br>
<br>
Cheers,<br>
<br>
Richard<br>
<div class=3D"im HOEnZb"><br>
<br>
&gt; Signed-off-by: Giuseppe Condorelli &lt;<a href=3D"mailto:giuseppe.cond=
orelli@st.com">giuseppe.condorelli@st.com</a>&gt;<br>
&gt; ---<br>
&gt; =A0meta/recipes-core/base-files/<a href=3D"http://base-files_3.0.14.bb=
" target=3D"_blank">base-files_3.0.14.bb</a> | =A0 =A08 ++++----<br>
&gt; =A01 files changed, 4 insertions(+), 4 deletions(-)<br>
&gt;<br>
&gt; diff --git a/meta/recipes-core/base-files/<a href=3D"http://base-files=
_3.0.14.bb" target=3D"_blank">base-files_3.0.14.bb</a> b/meta/recipes-core/=
base-files/<a href=3D"http://base-files_3.0.14.bb" target=3D"_blank">base-f=
iles_3.0.14.bb</a><br>

&gt; index ba355ee..766b0e5 100644<br>
&gt; --- a/meta/recipes-core/base-files/<a href=3D"http://base-files_3.0.14=
.bb" target=3D"_blank">base-files_3.0.14.bb</a><br>
&gt; +++ b/meta/recipes-core/base-files/<a href=3D"http://base-files_3.0.14=
.bb" target=3D"_blank">base-files_3.0.14.bb</a><br>
&gt; @@ -117,11 +117,11 @@ do_install_basefilesissue () {<br>
&gt;<br>
&gt; =A0 =A0 =A0 install -m 644 ${WORKDIR}/issue* =A0${D}${sysconfdir}<br>
&gt; =A0 =A0 =A0 =A0 =A0if [ -n &quot;${DISTRO_NAME}&quot; ]; then<br>
&gt; - =A0 =A0 =A0 =A0 =A0 =A0 printf &quot;${DISTRO_NAME} &quot; &gt;&gt; =
${D}${sysconfdir}/issue<br>
&gt; - =A0 =A0 =A0 =A0 =A0 =A0 printf &quot;${DISTRO_NAME} &quot; &gt;&gt; =
${D}${sysconfdir}/<a href=3D"http://issue.net" target=3D"_blank">issue.net<=
/a><br>
&gt; + =A0 =A0 =A0 =A0 =A0 =A0 echo &quot;${DISTRO_NAME} &quot; &gt;&gt; ${=
D}${sysconfdir}/issue<br>
&gt; + =A0 =A0 =A0 =A0 =A0 =A0 echo &quot;${DISTRO_NAME} &quot; &gt;&gt; ${=
D}${sysconfdir}/<a href=3D"http://issue.net" target=3D"_blank">issue.net</a=
><br>
&gt; =A0 =A0 =A0 =A0 =A0 =A0 =A0 if [ -n &quot;${DISTRO_VERSION}&quot; ]; t=
hen<br>
&gt; - =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 printf &quot;${DISTRO_VERSIO=
N} &quot; &gt;&gt; ${D}${sysconfdir}/issue<br>
&gt; - =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 printf &quot;${DISTRO_VERSIO=
N} &quot; &gt;&gt; ${D}${sysconfdir}/<a href=3D"http://issue.net" target=3D=
"_blank">issue.net</a><br>
&gt; + =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 echo &quot;${DISTRO_VERSION}=
 &quot; &gt;&gt; ${D}${sysconfdir}/issue<br>
&gt; + =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 echo &quot;${DISTRO_VERSION}=
 &quot; &gt;&gt; ${D}${sysconfdir}/<a href=3D"http://issue.net" target=3D"_=
blank">issue.net</a><br>
&gt; =A0 =A0 =A0 =A0 =A0 =A0 =A0 fi<br>
&gt; =A0 =A0 =A0 =A0 =A0 =A0 =A0 echo &quot;\n \l&quot; &gt;&gt; ${D}${sysc=
onfdir}/issue<br>
&gt; =A0 =A0 =A0 =A0 =A0 =A0 =A0 echo &gt;&gt; ${D}${sysconfdir}/issue<br>
<br>
<br>
<br>
</div><div class=3D"HOEnZb"><div class=3D"h5">_____________________________=
__________________<br>
Openembedded-core mailing list<br>
<a href=3D"mailto:Openembedded-core@lists.openembedded.org">Openembedded-co=
re@lists.openembedded.org</a><br>
<a href=3D"http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded=
-core" target=3D"_blank">http://lists.linuxtogo.org/cgi-bin/mailman/listinf=
o/openembedded-core</a><br>
</div></div></blockquote></div><br>

--e89a8ff1c1aeabe58f04ccb633eb--
