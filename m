Return-Path: <baptiste.durand@gmail.com>
Received: from mail-ua1-f52.google.com (mail-ua1-f52.google.com
	[209.85.222.52])
	by mail.openembedded.org (Postfix) with ESMTP id 602DB79498
	for <openembedded-core@lists.openembedded.org>;
	Tue, 11 Sep 2018 18:12:52 +0000 (UTC)
Received: by mail-ua1-f52.google.com with SMTP id u11-v6so21503092uan.13
	for <openembedded-core@lists.openembedded.org>;
	Tue, 11 Sep 2018 11:12:53 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=mime-version:references:in-reply-to:from:date:message-id:subject:to
	:cc; bh=OuNRSmKqZDHyq14r2aJlNqj7Tw7e/0Gfa/ErtC/Gcmw=;
	b=UFN2hWux/O25fNwFQJ/ov5yUGYkZ7vg2Q46eKK431gTUezUwPy6k2Dtip3QOYDk/K2
	qWoJiA0N9phyfnIxUXyVJXlcG23VAAe8eu6DSdst3h2zN9zSJREFOKrJby8ZsUaVDif7
	FwZlsNazPxnXdAVNj2ltQBrkiVLMxML7o+u5BFJAGABf/AB6fDB4EGCHg8dhAzSrHcMX
	1YhZ2HncCIUAXZOsQGql/qi3fXDnw/ET9B8lD7UblSO7pD1EM/aNXymJGmqYDk9iITM8
	lCK2GEbUzPxEXIwExulOWhWuBSLJ9BXFWJXiseOrQJdyuOfU6v0m1gcypyK4StPdSAEz
	jTPg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:references:in-reply-to:from:date
	:message-id:subject:to:cc;
	bh=OuNRSmKqZDHyq14r2aJlNqj7Tw7e/0Gfa/ErtC/Gcmw=;
	b=VOJqaWAc/6beF4IBtCgZbJI2daT+raqMW8BDU5wJh9VenrKLs/BHt3v+x7+ra+bWEw
	6mG+43ijhZJjKUB3vHYbQOL+c7td12oQ8VYcdDpA8O0NUGS7tdyYQGO3Re6hZFK1m5dH
	s/DihrhySSG8ons+737qm/ckwzd3bK95kk9t9iLhs0ZtuwoP5q2pjdFTX5UZ6h+xFw9u
	eWCTotxyObpJpzFmE2fe9TPfEAluPVB3K3P13dMBceRUDUVlB6k7T4Vx3DTmRkD3H9oA
	YH4VoOyuUUje6jacN6I0IW/ETfR3OwcMjiZRmXiDLInrmqsMb+3X8elGAGdpnEJDMkU6
	c/Dw==
X-Gm-Message-State: APzg51CjxHcsruCX8b8f49jNs0yc8mYg4PGz09bfs9h5BtyzIP4Uq0Jv
	6kGF4ZJ109xq9QUiDsuOoCqf1elfMycdp3SRS/TMFg==
X-Google-Smtp-Source: ANB0VdbA1r7pKAEtG6TJAaqhR3BcekNOgU5G4rL7xc+BfvegxlwHulXCiXw+Tpc51MM/BUNH87VJUQCzxK3c4uMRy+M=
X-Received: by 2002:a9f:2c87:: with SMTP id w7-v6mr9394779uaj.21.1536689572841;
	Tue, 11 Sep 2018 11:12:52 -0700 (PDT)
MIME-Version: 1.0
References: <20180910151449.9133-1-baptiste.durand@gmail.com>
	<CAMKF1srQ94o==a-i2mYWaH2-CELJ2gbVVxC=ZbVTrwqqrKvYZw@mail.gmail.com>
	<CA+chaQfdF=zddkP=6WVj6mtY-uJOYxJ=M5ZRvjrHvQ1W5H9pkA@mail.gmail.com>
In-Reply-To: <CA+chaQfdF=zddkP=6WVj6mtY-uJOYxJ=M5ZRvjrHvQ1W5H9pkA@mail.gmail.com>
From: Baptiste Durand <baptiste.durand@gmail.com>
Date: Tue, 11 Sep 2018 20:12:41 +0200
Message-ID: <CAB0T2v8_dJcQZr_czgPuweJ+dpX8SnhV3Wc4BSmTAqHMBVDgPg@mail.gmail.com>
To: Martin Jansa <martin.jansa@gmail.com>
Cc: OE Core <openembedded-core@lists.openembedded.org>
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
X-List-Received-Date: Tue, 11 Sep 2018 18:12:52 -0000
Content-Type: multipart/alternative; boundary="0000000000001e8ec705759c6c7a"

--0000000000001e8ec705759c6c7a
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Thanks for the review,

I will resend patch with changes according your comments.

Le lun. 10 sept. 2018 =C3=A0 19:04, Martin Jansa <martin.jansa@gmail.com> a
=C3=A9crit :

> And don't use tag name in SRCREV, use git SHA, so that bitbake fetcher
> doesn't need to access the git repository every time it parses the recipe=
.
>
> On Mon, Sep 10, 2018 at 5:49 PM Khem Raj <raj.khem@gmail.com> wrote:
>
>> this should be in meta-multmedia layer.
>> On Mon, Sep 10, 2018 at 8:15 AM Baptiste Durand
>> <baptiste.durand@gmail.com> wrote:
>> >
>> > Restore minidlna recipe and bump it to v1.2.1
>> >
>> > Signed-off-by: Baptiste Durand <baptiste.durand@gmail.com>
>> > ---
>> >  .../recipes-multimedia/minidlna/minidlna.inc  | 41 ++++++++++++++++++=
+
>> >  .../0001-Update-Gettext-version.patch         | 34 +++++++++++++++
>> >  .../minidlna/minidlna_1.2.1.bb                |  4 ++
>> >  3 files changed, 79 insertions(+)
>> >  create mode 100644 meta-oe/recipes-multimedia/minidlna/minidlna.inc
>> >  create mode 100644
>> meta-oe/recipes-multimedia/minidlna/minidlna/0001-Update-Gettext-version=
.patch
>> >  create mode 100644 meta-oe/recipes-multimedia/minidlna/
>> minidlna_1.2.1.bb
>> >
>> > diff --git a/meta-oe/recipes-multimedia/minidlna/minidlna.inc
>> b/meta-oe/recipes-multimedia/minidlna/minidlna.inc
>> > new file mode 100644
>> > index 000000000..187ff536a
>> > --- /dev/null
>> > +++ b/meta-oe/recipes-multimedia/minidlna/minidlna.inc
>> > @@ -0,0 +1,41 @@
>> > +DESCRIPTION =3D "MiniDLNA (aka ReadyDLNA) is server software with the
>> aim of \
>> > +being fully compliant with DLNA/UPnP-AV clients."
>> > +LICENSE =3D "GPL-2.0|BSD"
>> > +DEPENDS =3D "ffmpeg flac libav jpeg sqlite3 libexif libogg libid3tag
>> libvorbis"
>> > +
>> > +# because it depends on libav which has commercial flag
>> > +LICENSE_FLAGS =3D "commercial"
>> > +
>> > +inherit gettext autotools-brokensep update-rc.d systemd
>> > +
>> > +SRC_URI =3D "git://
>> git.code.sf.net/p/minidlna/git;branch=3Dmaster;module=3Dgit \
>> > +           file://minidlna-daemon.init.d \
>> > +           file://minidlna.service \
>> > +           file://0001-Update-Gettext-version.patch \
>> > +           "
>> > +
>> > +S =3D "${WORKDIR}/git"
>> > +
>> > +# This remove "--exclude=3Dautopoint" option from autoreconf argument=
 to
>> avoid
>> > +# configure.ac:30: error: required file './ABOUT-NLS' not found
>> > +EXTRA_AUTORECONF =3D ""
>> > +
>> > +do_install_append(){
>> > +    install -d ${D}${sysconfdir}
>> > +    install -m 0755 minidlna.conf ${D}${sysconfdir}
>> > +
>> > +# Systemd script
>> > +    install -d ${D}${nonarch_base_libdir}/systemd/system
>> > +    install -m 0755 ${WORKDIR}/minidlna.service
>> ${D}${nonarch_base_libdir}/systemd/system
>> > +
>> > +# Sysvinit script
>> > +    install -d ${D}${sysconfdir}/init.d
>> > +    install -m 0755 ${WORKDIR}/minidlna-daemon.init.d
>> ${D}${sysconfdir}/init.d/minidlna
>> > +
>> > +}
>> > +
>> > +SYSTEMD_SERVICE_${PN} =3D "minidlna.service"
>> > +
>> > +INITSCRIPT_NAME =3D "minidlna"
>> > +INITSCRIPT_PARAMS =3D "defaults 90"
>> > +
>> > diff --git
>> a/meta-oe/recipes-multimedia/minidlna/minidlna/0001-Update-Gettext-versi=
on.patch
>> b/meta-oe/recipes-multimedia/minidlna/minidlna/0001-Update-Gettext-versi=
on.patch
>> > new file mode 100644
>> > index 000000000..c18095d42
>> > --- /dev/null
>> > +++
>> b/meta-oe/recipes-multimedia/minidlna/minidlna/0001-Update-Gettext-versi=
on.patch
>> > @@ -0,0 +1,34 @@
>> > +From a4290bf1887f9203288858ca76bdd20b2edf337a Mon Sep 17 00:00:00 200=
1
>> > +From: Baptiste Durand <baptiste.durand@gmail.com>
>> > +Date: Sun, 9 Sep 2018 20:50:41 +0200
>> > +Subject: [PATCH] Update Gettext version
>> > +
>> > +Upstream-Status: Inappropriate [oe-core specific]
>> > +
>> > +Signed-off-by: Baptiste Durand <baptiste.durand@gmail.com>
>> > +---
>> > + configure.ac | 4 ++--
>> > + 1 file changed, 2 insertions(+), 2 deletions(-)
>> > +
>> > +diff --git a/configure.ac b/configure.ac
>> > +index f343d21..a556b33 100644
>> > +--- a/configure.ac
>> > ++++ b/configure.ac
>> > +@@ -14,7 +14,7 @@
>> > + # License along with MiniDLNA; if not, write to the Free Software
>> > + # Foundation, Inc., 59 Temple Place, Suite 330, Boston, MA 02111-130=
7
>> > + # USA.
>> > +-AC_INIT(MiniDLNA,1.1.3,,minidlna)
>> > ++AC_INIT(MiniDLNA,1.2.1,,minidlna)
>> > + #LT_INIT
>> > +
>> > + AC_CANONICAL_TARGET
>> > +@@ -28,7 +28,7 @@ m4_ifdef([AC_USE_SYSTEM_EXTENSIONS],
>> [AC_USE_SYSTEM_EXTENSIONS])
>> > +
>> > + AM_ICONV
>> > + AM_GNU_GETTEXT([external])
>> > +-AM_GNU_GETTEXT_VERSION(0.18)
>> > ++AM_GNU_GETTEXT_VERSION(0.19)
>> > +
>> > + # Checks for programs.
>> > + AC_PROG_AWK
>> > diff --git a/meta-oe/recipes-multimedia/minidlna/minidlna_1.2.1.bb
>> b/meta-oe/recipes-multimedia/minidlna/minidlna_1.2.1.bb
>> > new file mode 100644
>> > index 000000000..fe6bebce2
>> > --- /dev/null
>> > +++ b/meta-oe/recipes-multimedia/minidlna/minidlna_1.2.1.bb
>> > @@ -0,0 +1,4 @@
>> > +require ${BPN}.inc
>> > +
>> > +SRCREV =3D "v1_2_1"
>> > +LIC_FILES_CHKSUM =3D
>> "file://LICENCE.miniupnpd;md5=3Db0dabf9d8e0f871554e309d62ead8d2b"
>> > --
>> > 2.17.1
>> >
>> > --
>> > _______________________________________________
>> > Openembedded-core mailing list
>> > Openembedded-core@lists.openembedded.org
>> > http://lists.openembedded.org/mailman/listinfo/openembedded-core
>> --
>> _______________________________________________
>> Openembedded-core mailing list
>> Openembedded-core@lists.openembedded.org
>> http://lists.openembedded.org/mailman/listinfo/openembedded-core
>>
>

--=20
Baptiste DURAND

--0000000000001e8ec705759c6c7a
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div>Thanks for the review,</div><div><br></div><div>I wil=
l resend patch with changes according your comments.<br></div></div><br><di=
v class=3D"gmail_quote"><div dir=3D"ltr">Le=C2=A0lun. 10 sept. 2018 =C3=A0=
=C2=A019:04, Martin Jansa &lt;<a href=3D"mailto:martin.jansa@gmail.com">mar=
tin.jansa@gmail.com</a>&gt; a =C3=A9crit=C2=A0:<br></div><blockquote class=
=3D"gmail_quote" style=3D"margin:0 0 0 .8ex;border-left:1px #ccc solid;padd=
ing-left:1ex"><div dir=3D"ltr">And don&#39;t use tag name in SRCREV, use gi=
t SHA, so that bitbake fetcher doesn&#39;t need to access the git repositor=
y every time it parses the recipe.</div><br><div class=3D"gmail_quote"><div=
 dir=3D"ltr">On Mon, Sep 10, 2018 at 5:49 PM Khem Raj &lt;<a href=3D"mailto=
:raj.khem@gmail.com" target=3D"_blank">raj.khem@gmail.com</a>&gt; wrote:<br=
></div><blockquote class=3D"gmail_quote" style=3D"margin:0 0 0 .8ex;border-=
left:1px #ccc solid;padding-left:1ex">this should be in meta-multmedia laye=
r.<br>
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
</blockquote></div><br clear=3D"all"><br>-- <br><div dir=3D"ltr" class=3D"g=
mail_signature" data-smartmail=3D"gmail_signature"><div dir=3D"ltr"><div><d=
iv><span><font color=3D"#888888">Baptiste DURAND<br></font></span></div><di=
v><span><font color=3D"#888888"><br></font></span></div></div></div></div>

--0000000000001e8ec705759c6c7a--
