Return-Path: <martin.jansa@gmail.com>
Received: from mail-wm0-f54.google.com (mail-wm0-f54.google.com [74.125.82.54])
	by mail.openembedded.org (Postfix) with ESMTP id 296E179719
	for <openembedded-core@lists.openembedded.org>;
	Mon, 10 Sep 2018 17:04:23 +0000 (UTC)
Received: by mail-wm0-f54.google.com with SMTP id y139-v6so22158579wmc.2
	for <openembedded-core@lists.openembedded.org>;
	Mon, 10 Sep 2018 10:04:24 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=mime-version:references:in-reply-to:from:date:message-id:subject:to
	:cc; bh=YwpxC8D6wJBVpQhL6KPOqywRhgJ/KAJ3pXbDfZmRhV4=;
	b=h5YPB71uuxTIraA+lI59OhsgBP2nFjMBP2Fze5mcxO9CRl0WwvKZsxH7awQHUnZWQR
	l+3HQQsMUm/myTGJx0n5Nb2G+vGaPc93ax/ERJlN8vB89Yt0UgyPWIEwTsGXfemM1gmy
	1iJMOpW3EdIHS1Tp4kMML2YLk2w8A2Zj0YJHPCYM+e1l1bbxE7PxK/I1Dfgo5hM57v93
	d3ZJOrEEBcM81h+gNoTl9yslWqH7rLcQlbpnWtRShrw2mHYAnOlgbVmg/7NMg2V7uVM1
	UZEN+g4jFnZxq1whN5X7x1o68+GJKuPpM5hzJhG6XqGal4XwKhDi18tCJsE5/Z7anTGA
	sKow==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:references:in-reply-to:from:date
	:message-id:subject:to:cc;
	bh=YwpxC8D6wJBVpQhL6KPOqywRhgJ/KAJ3pXbDfZmRhV4=;
	b=tOgSq3a8JcqoyJdcYPGYG663qBWUPxpV8aPrbKPz9K6T4y7xCBD9S4PZp1PE9BsWOX
	QnRWZNP2H+7XK7Ape5bnCzfm7lrRzjLKT2ebPb95pF1cSngOMRKvGOOPDZ9ZQUQ5BPEg
	WoWAAY72+LRJKG+iENt5HtFeWZlsT8HkJpk/rutMDtBHAYHKKe6pNNWkLqfCnPRFe9bO
	U6lBD2DGsQ41d7I7zIH9RotJ5MorGcsvOChzoeVEgMceKxBpek2XX4b0Mrokgixiwr4b
	YUoBgoSRtJnYo6OSbSxOcEk1idKor/gpI7s9Sx//ye4GC4TuPCpPDNJbK0e7RdUzv1e2
	urPg==
X-Gm-Message-State: APzg51DIuHv+dFJU6HkrNB47nEWVNV8SjYIKgbjUwOs20hfResXirUQs
	FxUBt6Fs2L2L9mK0XyURJNIrFi9l+tWd3wKpH8U=
X-Google-Smtp-Source: ANB0VdY0i9RmvRZ1qleH7qSpzUZzYxmxRrB+j0mRGXxVJNc8xXNRyvb5izgL/yQNqwLRUF6Pfhd3IBuiBn/6oGu30VA=
X-Received: by 2002:a1c:1188:: with SMTP id
	130-v6mr1327283wmr.138.1536599063653; 
	Mon, 10 Sep 2018 10:04:23 -0700 (PDT)
MIME-Version: 1.0
References: <20180910151449.9133-1-baptiste.durand@gmail.com>
	<CAMKF1srQ94o==a-i2mYWaH2-CELJ2gbVVxC=ZbVTrwqqrKvYZw@mail.gmail.com>
In-Reply-To: <CAMKF1srQ94o==a-i2mYWaH2-CELJ2gbVVxC=ZbVTrwqqrKvYZw@mail.gmail.com>
From: Martin Jansa <martin.jansa@gmail.com>
Date: Mon, 10 Sep 2018 19:04:16 +0200
Message-ID: <CA+chaQfdF=zddkP=6WVj6mtY-uJOYxJ=M5ZRvjrHvQ1W5H9pkA@mail.gmail.com>
To: Khem Raj <raj.khem@gmail.com>
Cc: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Subject: Re: [meta-oe][PATCH v2] minidlna: restore & fix recipe
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
X-List-Received-Date: Mon, 10 Sep 2018 17:04:23 -0000
Content-Type: multipart/alternative; boundary="00000000000059f13d0575875958"

--00000000000059f13d0575875958
Content-Type: text/plain; charset="UTF-8"

And don't use tag name in SRCREV, use git SHA, so that bitbake fetcher
doesn't need to access the git repository every time it parses the recipe.

On Mon, Sep 10, 2018 at 5:49 PM Khem Raj <raj.khem@gmail.com> wrote:

> this should be in meta-multmedia layer.
> On Mon, Sep 10, 2018 at 8:15 AM Baptiste Durand
> <baptiste.durand@gmail.com> wrote:
> >
> > Restore minidlna recipe and bump it to v1.2.1
> >
> > Signed-off-by: Baptiste Durand <baptiste.durand@gmail.com>
> > ---
> >  .../recipes-multimedia/minidlna/minidlna.inc  | 41 +++++++++++++++++++
> >  .../0001-Update-Gettext-version.patch         | 34 +++++++++++++++
> >  .../minidlna/minidlna_1.2.1.bb                |  4 ++
> >  3 files changed, 79 insertions(+)
> >  create mode 100644 meta-oe/recipes-multimedia/minidlna/minidlna.inc
> >  create mode 100644
> meta-oe/recipes-multimedia/minidlna/minidlna/0001-Update-Gettext-version.patch
> >  create mode 100644 meta-oe/recipes-multimedia/minidlna/
> minidlna_1.2.1.bb
> >
> > diff --git a/meta-oe/recipes-multimedia/minidlna/minidlna.inc
> b/meta-oe/recipes-multimedia/minidlna/minidlna.inc
> > new file mode 100644
> > index 000000000..187ff536a
> > --- /dev/null
> > +++ b/meta-oe/recipes-multimedia/minidlna/minidlna.inc
> > @@ -0,0 +1,41 @@
> > +DESCRIPTION = "MiniDLNA (aka ReadyDLNA) is server software with the aim
> of \
> > +being fully compliant with DLNA/UPnP-AV clients."
> > +LICENSE = "GPL-2.0|BSD"
> > +DEPENDS = "ffmpeg flac libav jpeg sqlite3 libexif libogg libid3tag
> libvorbis"
> > +
> > +# because it depends on libav which has commercial flag
> > +LICENSE_FLAGS = "commercial"
> > +
> > +inherit gettext autotools-brokensep update-rc.d systemd
> > +
> > +SRC_URI = "git://
> git.code.sf.net/p/minidlna/git;branch=master;module=git \
> > +           file://minidlna-daemon.init.d \
> > +           file://minidlna.service \
> > +           file://0001-Update-Gettext-version.patch \
> > +           "
> > +
> > +S = "${WORKDIR}/git"
> > +
> > +# This remove "--exclude=autopoint" option from autoreconf argument to
> avoid
> > +# configure.ac:30: error: required file './ABOUT-NLS' not found
> > +EXTRA_AUTORECONF = ""
> > +
> > +do_install_append(){
> > +    install -d ${D}${sysconfdir}
> > +    install -m 0755 minidlna.conf ${D}${sysconfdir}
> > +
> > +# Systemd script
> > +    install -d ${D}${nonarch_base_libdir}/systemd/system
> > +    install -m 0755 ${WORKDIR}/minidlna.service
> ${D}${nonarch_base_libdir}/systemd/system
> > +
> > +# Sysvinit script
> > +    install -d ${D}${sysconfdir}/init.d
> > +    install -m 0755 ${WORKDIR}/minidlna-daemon.init.d
> ${D}${sysconfdir}/init.d/minidlna
> > +
> > +}
> > +
> > +SYSTEMD_SERVICE_${PN} = "minidlna.service"
> > +
> > +INITSCRIPT_NAME = "minidlna"
> > +INITSCRIPT_PARAMS = "defaults 90"
> > +
> > diff --git
> a/meta-oe/recipes-multimedia/minidlna/minidlna/0001-Update-Gettext-version.patch
> b/meta-oe/recipes-multimedia/minidlna/minidlna/0001-Update-Gettext-version.patch
> > new file mode 100644
> > index 000000000..c18095d42
> > --- /dev/null
> > +++
> b/meta-oe/recipes-multimedia/minidlna/minidlna/0001-Update-Gettext-version.patch
> > @@ -0,0 +1,34 @@
> > +From a4290bf1887f9203288858ca76bdd20b2edf337a Mon Sep 17 00:00:00 2001
> > +From: Baptiste Durand <baptiste.durand@gmail.com>
> > +Date: Sun, 9 Sep 2018 20:50:41 +0200
> > +Subject: [PATCH] Update Gettext version
> > +
> > +Upstream-Status: Inappropriate [oe-core specific]
> > +
> > +Signed-off-by: Baptiste Durand <baptiste.durand@gmail.com>
> > +---
> > + configure.ac | 4 ++--
> > + 1 file changed, 2 insertions(+), 2 deletions(-)
> > +
> > +diff --git a/configure.ac b/configure.ac
> > +index f343d21..a556b33 100644
> > +--- a/configure.ac
> > ++++ b/configure.ac
> > +@@ -14,7 +14,7 @@
> > + # License along with MiniDLNA; if not, write to the Free Software
> > + # Foundation, Inc., 59 Temple Place, Suite 330, Boston, MA 02111-1307
> > + # USA.
> > +-AC_INIT(MiniDLNA,1.1.3,,minidlna)
> > ++AC_INIT(MiniDLNA,1.2.1,,minidlna)
> > + #LT_INIT
> > +
> > + AC_CANONICAL_TARGET
> > +@@ -28,7 +28,7 @@ m4_ifdef([AC_USE_SYSTEM_EXTENSIONS],
> [AC_USE_SYSTEM_EXTENSIONS])
> > +
> > + AM_ICONV
> > + AM_GNU_GETTEXT([external])
> > +-AM_GNU_GETTEXT_VERSION(0.18)
> > ++AM_GNU_GETTEXT_VERSION(0.19)
> > +
> > + # Checks for programs.
> > + AC_PROG_AWK
> > diff --git a/meta-oe/recipes-multimedia/minidlna/minidlna_1.2.1.bb
> b/meta-oe/recipes-multimedia/minidlna/minidlna_1.2.1.bb
> > new file mode 100644
> > index 000000000..fe6bebce2
> > --- /dev/null
> > +++ b/meta-oe/recipes-multimedia/minidlna/minidlna_1.2.1.bb
> > @@ -0,0 +1,4 @@
> > +require ${BPN}.inc
> > +
> > +SRCREV = "v1_2_1"
> > +LIC_FILES_CHKSUM =
> "file://LICENCE.miniupnpd;md5=b0dabf9d8e0f871554e309d62ead8d2b"
> > --
> > 2.17.1
> >
> > --
> > _______________________________________________
> > Openembedded-core mailing list
> > Openembedded-core@lists.openembedded.org
> > http://lists.openembedded.org/mailman/listinfo/openembedded-core
> --
> _______________________________________________
> Openembedded-core mailing list
> Openembedded-core@lists.openembedded.org
> http://lists.openembedded.org/mailman/listinfo/openembedded-core
>

--00000000000059f13d0575875958
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr">And don&#39;t use tag name in SRCREV, use git SHA, so that=
 bitbake fetcher doesn&#39;t need to access the git repository every time i=
t parses the recipe.</div><br><div class=3D"gmail_quote"><div dir=3D"ltr">O=
n Mon, Sep 10, 2018 at 5:49 PM Khem Raj &lt;<a href=3D"mailto:raj.khem@gmai=
l.com">raj.khem@gmail.com</a>&gt; wrote:<br></div><blockquote class=3D"gmai=
l_quote" style=3D"margin:0 0 0 .8ex;border-left:1px #ccc solid;padding-left=
:1ex">this should be in meta-multmedia layer.<br>
On Mon, Sep 10, 2018 at 8:15 AM Baptiste Durand<br>
&lt;<a href=3D"mailto:baptiste.durand@gmail.com" target=3D"_blank">baptiste=
.durand@gmail.com</a>&gt; wrote:<br>
&gt;<br>
&gt; Restore minidlna recipe and bump it to v1.2.1<br>
&gt;<br>
&gt; Signed-off-by: Baptiste Durand &lt;<a href=3D"mailto:baptiste.durand@g=
mail.com" target=3D"_blank">baptiste.durand@gmail.com</a>&gt;<br>
&gt; ---<br>
&gt;=C2=A0 .../recipes-multimedia/minidlna/minidlna.inc=C2=A0 | 41 ++++++++=
+++++++++++<br>
&gt;=C2=A0 .../0001-Update-Gettext-version.patch=C2=A0 =C2=A0 =C2=A0 =C2=A0=
 =C2=A0| 34 +++++++++++++++<br>
&gt;=C2=A0 .../minidlna/<a href=3D"http://minidlna_1.2.1.bb" rel=3D"norefer=
rer" target=3D"_blank">minidlna_1.2.1.bb</a>=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 |=C2=A0 4 ++<br>
&gt;=C2=A0 3 files changed, 79 insertions(+)<br>
&gt;=C2=A0 create mode 100644 meta-oe/recipes-multimedia/minidlna/minidlna.=
inc<br>
&gt;=C2=A0 create mode 100644 meta-oe/recipes-multimedia/minidlna/minidlna/=
0001-Update-Gettext-version.patch<br>
&gt;=C2=A0 create mode 100644 meta-oe/recipes-multimedia/minidlna/<a href=
=3D"http://minidlna_1.2.1.bb" rel=3D"noreferrer" target=3D"_blank">minidlna=
_1.2.1.bb</a><br>
&gt;<br>
&gt; diff --git a/meta-oe/recipes-multimedia/minidlna/minidlna.inc b/meta-o=
e/recipes-multimedia/minidlna/minidlna.inc<br>
&gt; new file mode 100644<br>
&gt; index 000000000..187ff536a<br>
&gt; --- /dev/null<br>
&gt; +++ b/meta-oe/recipes-multimedia/minidlna/minidlna.inc<br>
&gt; @@ -0,0 +1,41 @@<br>
&gt; +DESCRIPTION =3D &quot;MiniDLNA (aka ReadyDLNA) is server software wit=
h the aim of \<br>
&gt; +being fully compliant with DLNA/UPnP-AV clients.&quot;<br>
&gt; +LICENSE =3D &quot;GPL-2.0|BSD&quot;<br>
&gt; +DEPENDS =3D &quot;ffmpeg flac libav jpeg sqlite3 libexif libogg libid=
3tag libvorbis&quot;<br>
&gt; +<br>
&gt; +# because it depends on libav which has commercial flag<br>
&gt; +LICENSE_FLAGS =3D &quot;commercial&quot;<br>
&gt; +<br>
&gt; +inherit gettext autotools-brokensep update-rc.d systemd<br>
&gt; +<br>
&gt; +SRC_URI =3D &quot;git://<a href=3D"http://git.code.sf.net/p/minidlna/=
git;branch=3Dmaster;module=3Dgit" rel=3D"noreferrer" target=3D"_blank">git.=
code.sf.net/p/minidlna/git;branch=3Dmaster;module=3Dgit</a> \<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0file://minidlna-daemon.init.=
d \<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0file://minidlna.service \<br=
>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0file://0001-Update-Gettext-v=
ersion.patch \<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0&quot;<br>
&gt; +<br>
&gt; +S =3D &quot;${WORKDIR}/git&quot;<br>
&gt; +<br>
&gt; +# This remove &quot;--exclude=3Dautopoint&quot; option from autorecon=
f argument to avoid<br>
&gt; +# <a href=3D"http://configure.ac:30" rel=3D"noreferrer" target=3D"_bl=
ank">configure.ac:30</a>: error: required file &#39;./ABOUT-NLS&#39; not fo=
und<br>
&gt; +EXTRA_AUTORECONF =3D &quot;&quot;<br>
&gt; +<br>
&gt; +do_install_append(){<br>
&gt; +=C2=A0 =C2=A0 install -d ${D}${sysconfdir}<br>
&gt; +=C2=A0 =C2=A0 install -m 0755 minidlna.conf ${D}${sysconfdir}<br>
&gt; +<br>
&gt; +# Systemd script<br>
&gt; +=C2=A0 =C2=A0 install -d ${D}${nonarch_base_libdir}/systemd/system<br=
>
&gt; +=C2=A0 =C2=A0 install -m 0755 ${WORKDIR}/minidlna.service ${D}${nonar=
ch_base_libdir}/systemd/system<br>
&gt; +<br>
&gt; +# Sysvinit script<br>
&gt; +=C2=A0 =C2=A0 install -d ${D}${sysconfdir}/init.d<br>
&gt; +=C2=A0 =C2=A0 install -m 0755 ${WORKDIR}/minidlna-daemon.init.d ${D}$=
{sysconfdir}/init.d/minidlna<br>
&gt; +<br>
&gt; +}<br>
&gt; +<br>
&gt; +SYSTEMD_SERVICE_${PN} =3D &quot;minidlna.service&quot;<br>
&gt; +<br>
&gt; +INITSCRIPT_NAME =3D &quot;minidlna&quot;<br>
&gt; +INITSCRIPT_PARAMS =3D &quot;defaults 90&quot;<br>
&gt; +<br>
&gt; diff --git a/meta-oe/recipes-multimedia/minidlna/minidlna/0001-Update-=
Gettext-version.patch b/meta-oe/recipes-multimedia/minidlna/minidlna/0001-U=
pdate-Gettext-version.patch<br>
&gt; new file mode 100644<br>
&gt; index 000000000..c18095d42<br>
&gt; --- /dev/null<br>
&gt; +++ b/meta-oe/recipes-multimedia/minidlna/minidlna/0001-Update-Gettext=
-version.patch<br>
&gt; @@ -0,0 +1,34 @@<br>
&gt; +From a4290bf1887f9203288858ca76bdd20b2edf337a Mon Sep 17 00:00:00 200=
1<br>
&gt; +From: Baptiste Durand &lt;<a href=3D"mailto:baptiste.durand@gmail.com=
" target=3D"_blank">baptiste.durand@gmail.com</a>&gt;<br>
&gt; +Date: Sun, 9 Sep 2018 20:50:41 +0200<br>
&gt; +Subject: [PATCH] Update Gettext version<br>
&gt; +<br>
&gt; +Upstream-Status: Inappropriate [oe-core specific]<br>
&gt; +<br>
&gt; +Signed-off-by: Baptiste Durand &lt;<a href=3D"mailto:baptiste.durand@=
gmail.com" target=3D"_blank">baptiste.durand@gmail.com</a>&gt;<br>
&gt; +---<br>
&gt; + <a href=3D"http://configure.ac" rel=3D"noreferrer" target=3D"_blank"=
>configure.ac</a> | 4 ++--<br>
&gt; + 1 file changed, 2 insertions(+), 2 deletions(-)<br>
&gt; +<br>
&gt; +diff --git a/<a href=3D"http://configure.ac" rel=3D"noreferrer" targe=
t=3D"_blank">configure.ac</a> b/<a href=3D"http://configure.ac" rel=3D"nore=
ferrer" target=3D"_blank">configure.ac</a><br>
&gt; +index f343d21..a556b33 100644<br>
&gt; +--- a/<a href=3D"http://configure.ac" rel=3D"noreferrer" target=3D"_b=
lank">configure.ac</a><br>
&gt; ++++ b/<a href=3D"http://configure.ac" rel=3D"noreferrer" target=3D"_b=
lank">configure.ac</a><br>
&gt; +@@ -14,7 +14,7 @@<br>
&gt; + # License along with MiniDLNA; if not, write to the Free Software<br=
>
&gt; + # Foundation, Inc., 59 Temple Place, Suite 330, Boston, MA 02111-130=
7<br>
&gt; + # USA.<br>
&gt; +-AC_INIT(MiniDLNA,1.1.3,,minidlna)<br>
&gt; ++AC_INIT(MiniDLNA,1.2.1,,minidlna)<br>
&gt; + #LT_INIT<br>
&gt; +<br>
&gt; + AC_CANONICAL_TARGET<br>
&gt; +@@ -28,7 +28,7 @@ m4_ifdef([AC_USE_SYSTEM_EXTENSIONS], [AC_USE_SYSTEM=
_EXTENSIONS])<br>
&gt; +<br>
&gt; + AM_ICONV<br>
&gt; + AM_GNU_GETTEXT([external])<br>
&gt; +-AM_GNU_GETTEXT_VERSION(0.18)<br>
&gt; ++AM_GNU_GETTEXT_VERSION(0.19)<br>
&gt; +<br>
&gt; + # Checks for programs.<br>
&gt; + AC_PROG_AWK<br>
&gt; diff --git a/meta-oe/recipes-multimedia/minidlna/<a href=3D"http://min=
idlna_1.2.1.bb" rel=3D"noreferrer" target=3D"_blank">minidlna_1.2.1.bb</a> =
b/meta-oe/recipes-multimedia/minidlna/<a href=3D"http://minidlna_1.2.1.bb" =
rel=3D"noreferrer" target=3D"_blank">minidlna_1.2.1.bb</a><br>
&gt; new file mode 100644<br>
&gt; index 000000000..fe6bebce2<br>
&gt; --- /dev/null<br>
&gt; +++ b/meta-oe/recipes-multimedia/minidlna/<a href=3D"http://minidlna_1=
.2.1.bb" rel=3D"noreferrer" target=3D"_blank">minidlna_1.2.1.bb</a><br>
&gt; @@ -0,0 +1,4 @@<br>
&gt; +require ${BPN}.inc<br>
&gt; +<br>
&gt; +SRCREV =3D &quot;v1_2_1&quot;<br>
&gt; +LIC_FILES_CHKSUM =3D &quot;file://LICENCE.miniupnpd;md5=3Db0dabf9d8e0=
f871554e309d62ead8d2b&quot;<br>
&gt; --<br>
&gt; 2.17.1<br>
&gt;<br>
&gt; --<br>
&gt; _______________________________________________<br>
&gt; Openembedded-core mailing list<br>
&gt; <a href=3D"mailto:Openembedded-core@lists.openembedded.org" target=3D"=
_blank">Openembedded-core@lists.openembedded.org</a><br>
&gt; <a href=3D"http://lists.openembedded.org/mailman/listinfo/openembedded=
-core" rel=3D"noreferrer" target=3D"_blank">http://lists.openembedded.org/m=
ailman/listinfo/openembedded-core</a><br>
-- <br>
_______________________________________________<br>
Openembedded-core mailing list<br>
<a href=3D"mailto:Openembedded-core@lists.openembedded.org" target=3D"_blan=
k">Openembedded-core@lists.openembedded.org</a><br>
<a href=3D"http://lists.openembedded.org/mailman/listinfo/openembedded-core=
" rel=3D"noreferrer" target=3D"_blank">http://lists.openembedded.org/mailma=
n/listinfo/openembedded-core</a><br>
</blockquote></div>

--00000000000059f13d0575875958--
