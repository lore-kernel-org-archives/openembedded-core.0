Received: from mail-we0-f175.google.com ([74.125.82.175])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <andrei@gherzan.ro>) id 1T2NDR-0007A2-QG
	for openembedded-core@lists.openembedded.org;
	Fri, 17 Aug 2012 16:07:57 +0200
Received: by weyr6 with SMTP id r6so2570790wey.6
	for <openembedded-core@lists.openembedded.org>;
	Fri, 17 Aug 2012 06:55:59 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=google.com; s=20120113;
	h=mime-version:x-originating-ip:in-reply-to:references:from:date
	:message-id:subject:to:content-type:x-gm-message-state;
	bh=1H7uZL3GB7Z3mrf8+xt2/4V9ifz0cb4KuWrPHq4P/Hs=;
	b=NJKN+bj9357/UoPfRPo9dHkzT6KPbapwKf/MmqT9CypQG0umAozN8glBJhepcdSC9b
	m+q/3rKDghwInFPQ4EP0f58r+0fsojjXlS8AYUdhLLRPs0H4zscKgRiff/Ph15bhQRAn
	+kJj7gdKi9/w9stFHbu72wsELvi8gDNbyv6/HykcOy3Zpj98BbZdQX8olkFc4vtoi3JN
	4Zk0bTXHjn/UxWiV4vPZW/rRsz4zS28Ig5P7QZAEbhenKU82MliQQs3/xFEWLXr/3clO
	42PaUnetm59N1XZSt77IUChICq56LonhH3xdehdGEaL78vkhgKZYANpRp52sQ+qWyULg
	+hTw==
Received: by 10.50.189.167 with SMTP id gj7mr2050386igc.34.1345211758091; Fri,
	17 Aug 2012 06:55:58 -0700 (PDT)
MIME-Version: 1.0
Received: by 10.64.63.50 with HTTP; Fri, 17 Aug 2012 06:55:37 -0700 (PDT)
X-Originating-IP: [89.121.200.106]
In-Reply-To: <20120817130953.GN3625@jama.jama.net>
References: <cover.1345208249.git.andrei.gherzan@windriver.com>
	<f3b626bf0865fc3fbccb898723f162f900aa244f.1345208249.git.andrei.gherzan@windriver.com>
	<20120817130953.GN3625@jama.jama.net>
From: Andrei Gherzan <andrei@gherzan.ro>
Date: Fri, 17 Aug 2012 16:55:37 +0300
Message-ID: <CAK18fxGJrKKCU2yPxD7unsBz7XczWSgg5UbxLfjqf-c=zSK-og@mail.gmail.com>
To: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
X-Gm-Message-State: ALoCoQkCf9Z4Qgs2xaWcoIwOtIhNe9u8rVpNC0HTT/SRWco69geAZK/vq7T4ovgxlsbtcAP78cut
Subject: Re: [PATCH 1/2] python-dbus: Native dbus python module needed for dbus tests
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
X-List-Received-Date: Fri, 17 Aug 2012 14:07:57 -0000
Content-Type: multipart/alternative; boundary=14dae9340efbfd1c8e04c77684f5

--14dae9340efbfd1c8e04c77684f5
Content-Type: text/plain; charset=ISO-8859-1

On Fri, Aug 17, 2012 at 4:09 PM, Martin Jansa <martin.jansa@gmail.com>wrote:

> On Fri, Aug 17, 2012 at 04:05:00PM +0300, Andrei Gherzan wrote:
> > Signed-off-by: Andrei Gherzan <andrei.gherzan@windriver.com>
> > ---
> >  meta/recipes-devtools/python/python-dbus_1.1.1.bb |    5 ++++-
> >  1 files changed, 4 insertions(+), 1 deletions(-)
> >
> > diff --git a/meta/recipes-devtools/python/python-dbus_1.1.1.bbb/meta/recipes-devtools/python/
> python-dbus_1.1.1.bb
> > index 51d5bc2..35149a0 100644
> > --- a/meta/recipes-devtools/python/python-dbus_1.1.1.bb
> > +++ b/meta/recipes-devtools/python/python-dbus_1.1.1.bb
> > @@ -4,7 +4,7 @@ HOMEPAGE = "http://www.freedesktop.org/Software/dbus"
> >  LICENSE = "MIT"
> >  LIC_FILES_CHKSUM = "file://COPYING;md5=f5612614133e9a2f2dad527d97554670"
> >  DEPENDS = "expat dbus dbus-glib virtual/libintl python-pyrex-native"
> > -PR = "r0"
> > +PR = "r1"
> >
> >  SRC_URI = "
> http://dbus.freedesktop.org/releases/dbus-python/dbus-python-${PV}.tar.gz"
> >
> > @@ -23,3 +23,6 @@ export STAGING_INCDIR
> >  RDEPENDS_${PN} = "python-io python-logging python-stringold
> python-threading python-xml"
> >
> >  FILES_${PN}-dev += "${libdir}/pkgconfig"
> > +
> > +RDEPENDS_${PN}_virtclass-native = "python"
>
> Does RDEPENDS_${PN} work for native recipes? I thought that R* vars are
> for runtime packages and native builds doesn't provide them imho.
>
> And if they do, why not explicitly ask for python-native, because target
> python wont help I guess.
>
>
The idea here was that rdepends should be overwritten as - python-io
python-logging python-stringold python-threading python-xml - are not
native packages. While compiling (python-dbus-native) build-system is
looking for python-io-native for example which wrong and fails:
ERROR: Nothing RPROVIDES 'python-io-native'

Do you think of a better solution?

Thank you


>  > +BBCLASSEXTEND = "native"
> > --
> > 1.7.5.4
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

--14dae9340efbfd1c8e04c77684f5
Content-Type: text/html; charset=ISO-8859-1
Content-Transfer-Encoding: quoted-printable

<div class=3D"gmail_quote">On Fri, Aug 17, 2012 at 4:09 PM, Martin Jansa <s=
pan dir=3D"ltr">&lt;<a href=3D"mailto:martin.jansa@gmail.com" target=3D"_bl=
ank">martin.jansa@gmail.com</a>&gt;</span> wrote:<br><blockquote class=3D"g=
mail_quote" style=3D"margin:0 0 0 .8ex;border-left:1px #ccc solid;padding-l=
eft:1ex">


<div>On Fri, Aug 17, 2012 at 04:05:00PM +0300, Andrei Gherzan wrote:<br>
&gt; Signed-off-by: Andrei Gherzan &lt;<a href=3D"mailto:andrei.gherzan@win=
driver.com" target=3D"_blank">andrei.gherzan@windriver.com</a>&gt;<br>
&gt; ---<br>
&gt; =A0meta/recipes-devtools/python/<a href=3D"http://python-dbus_1.1.1.bb=
" target=3D"_blank">python-dbus_1.1.1.bb</a> | =A0 =A05 ++++-<br>
&gt; =A01 files changed, 4 insertions(+), 1 deletions(-)<br>
&gt;<br>
&gt; diff --git a/meta/recipes-devtools/python/<a href=3D"http://python-dbu=
s_1.1.1.bb" target=3D"_blank">python-dbus_1.1.1.bb</a> b/meta/recipes-devto=
ols/python/<a href=3D"http://python-dbus_1.1.1.bb" target=3D"_blank">python=
-dbus_1.1.1.bb</a><br>



&gt; index 51d5bc2..35149a0 100644<br>
&gt; --- a/meta/recipes-devtools/python/<a href=3D"http://python-dbus_1.1.1=
.bb" target=3D"_blank">python-dbus_1.1.1.bb</a><br>
&gt; +++ b/meta/recipes-devtools/python/<a href=3D"http://python-dbus_1.1.1=
.bb" target=3D"_blank">python-dbus_1.1.1.bb</a><br>
&gt; @@ -4,7 +4,7 @@ HOMEPAGE =3D &quot;<a href=3D"http://www.freedesktop.o=
rg/Software/dbus" target=3D"_blank">http://www.freedesktop.org/Software/dbu=
s</a>&quot;<br>
&gt; =A0LICENSE =3D &quot;MIT&quot;<br>
&gt; =A0LIC_FILES_CHKSUM =3D &quot;file://COPYING;md5=3Df5612614133e9a2f2da=
d527d97554670&quot;<br>
&gt; =A0DEPENDS =3D &quot;expat dbus dbus-glib virtual/libintl python-pyrex=
-native&quot;<br>
&gt; -PR =3D &quot;r0&quot;<br>
&gt; +PR =3D &quot;r1&quot;<br>
&gt;<br>
&gt; =A0SRC_URI =3D &quot;<a href=3D"http://dbus.freedesktop.org/releases/d=
bus-python/dbus-python-$%7BPV%7D.tar.gz" target=3D"_blank">http://dbus.free=
desktop.org/releases/dbus-python/dbus-python-${PV}.tar.gz</a>&quot;<br>
&gt;<br>
&gt; @@ -23,3 +23,6 @@ export STAGING_INCDIR<br>
&gt; =A0RDEPENDS_${PN} =3D &quot;python-io python-logging python-stringold =
python-threading python-xml&quot;<br>
&gt;<br>
&gt; =A0FILES_${PN}-dev +=3D &quot;${libdir}/pkgconfig&quot;<br>
&gt; +<br>
&gt; +RDEPENDS_${PN}_virtclass-native =3D &quot;python&quot;<br>
<br>
</div>Does RDEPENDS_${PN} work for native recipes? I thought that R* vars a=
re<br>
for runtime packages and native builds doesn&#39;t provide them imho.<br>
<br>
And if they do, why not explicitly ask for python-native, because target py=
thon wont help I guess.<br>
<div><div><br></div></div></blockquote><div>=A0</div><div>The idea here was=
 that rdepends should be overwritten as -=A0python-io python-logging python=
-stringold python-threading python-xml - are not native packages. While com=
piling (python-dbus-native) build-system is looking for=A0python-io-native =
for example which wrong and fails:</div>

<div>ERROR: Nothing RPROVIDES &#39;python-io-native&#39;</div><div><br></di=
v><div>Do you think of a better=A0solution?</div><div><br></div><div>Thank =
you</div><div>=A0</div><blockquote class=3D"gmail_quote" style=3D"margin:0 =
0 0 .8ex;border-left:1px #ccc solid;padding-left:1ex">

<div><div>
&gt; +BBCLASSEXTEND =3D &quot;native&quot;<br>
&gt; --<br>
&gt; 1.7.5.4<br>
&gt;<br>
&gt;<br>
&gt; _______________________________________________<br>
&gt; Openembedded-core mailing list<br>
&gt; <a href=3D"mailto:Openembedded-core@lists.openembedded.org" target=3D"=
_blank">Openembedded-core@lists.openembedded.org</a><br>
&gt; <a href=3D"http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openemb=
edded-core" target=3D"_blank">http://lists.linuxtogo.org/cgi-bin/mailman/li=
stinfo/openembedded-core</a><br>
<br>
</div></div><span><font color=3D"#888888">--<br>
Martin &#39;JaMa&#39; Jansa =A0 =A0 jabber: <a href=3D"mailto:Martin.Jansa@=
gmail.com" target=3D"_blank">Martin.Jansa@gmail.com</a><br>
</font></span><br>_______________________________________________<br>
Openembedded-core mailing list<br>
<a href=3D"mailto:Openembedded-core@lists.openembedded.org" target=3D"_blan=
k">Openembedded-core@lists.openembedded.org</a><br>
<a href=3D"http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded=
-core" target=3D"_blank">http://lists.linuxtogo.org/cgi-bin/mailman/listinf=
o/openembedded-core</a><br>
<br></blockquote></div><br>

--14dae9340efbfd1c8e04c77684f5--
