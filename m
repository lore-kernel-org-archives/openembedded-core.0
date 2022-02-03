Return-Path: <alex.kanavin@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 819EDC433F5
	for <webhook@archiver.kernel.org>; Thu,  3 Feb 2022 13:46:50 +0000 (UTC)
Received: from mail-ua1-f54.google.com (mail-ua1-f54.google.com
 [209.85.222.54])
 by mx.groups.io with SMTP id smtpd.web09.9167.1643896009693257616
 for <openembedded-core@lists.openembedded.org>;
 Thu, 03 Feb 2022 05:46:50 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20210112 header.b=JWJ5qePQ;
 spf=pass (domain: gmail.com, ip: 209.85.222.54,
 mailfrom: alex.kanavin@gmail.com)
Received: by mail-ua1-f54.google.com with SMTP id m90so5287925uam.2
        for <openembedded-core@lists.openembedded.org>;
 Thu, 03 Feb 2022 05:46:49 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=IC5tFs6dkiLxOBqbZVOauzlKfstouiW3Ibk/x0mu9vM=;
        b=JWJ5qePQRyPnJtZFomeEeAEOo2NdvcA7jAorjJIw2eIz6IaFoRo/5VYicX2YNEMM2e
         qexyuCxNBq1x5kS7ZR145Me0KXc7bWlA3rcXlSChejboAE0vS6kRrizPjNrV+RhsdVqH
         N8EeFkeI8fjckKZ+6JsGD8NDpkiPAAsUmfw3Cc7wwsT9lDyC8TVe/m8uk+bWOXPRx68g
         rnBCfK/aYBYvVgeLsGzpjrLd25yi+Idy+3KEr0Q0MGd/dUH6WZpe3SYDZNq1y6+k5mOm
         ldwi0l4pugZPu+8YFAPiMUiCoJbkDBZTfCULbCYde+Cww9ozkBHGRpbwQtV0ftN2J8U2
         tJ5g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=IC5tFs6dkiLxOBqbZVOauzlKfstouiW3Ibk/x0mu9vM=;
        b=zlgvbPdlLw9SkbmPioYnPD/JkGHkA1Jen+Jb3183Ey0baiOZh4OWrGvPADW84HHGz3
         PEoh9+Qehj8WsgavFYE5+FYtNh1NzPUloCsDJN9X2RRYL3qqkix9+TEr1xv7PRWffGt3
         omOFR/3HTM0JK/R+tiXLRHBVIhdl0DtG9Pg2LtAFJcRjbsGfgKSTJO+Fkwhn3T6s1wMz
         Fa5gg/2cI5BnBW3jqlmAAuXDkf/9XmHvNIijukbGiYLGeWQ64v/FaIROZw5v4ECO71pA
         bUMJjNH3TnUPpPmU40ssICEQPsrVcmlIymKwV1H4UzXnmxXTu9CjMs2MLwheu24T7xL2
         0wQw==
X-Gm-Message-State: AOAM5314LwEyZpu7KnmZP/6/52LvM85gqbfmuPFDFDUdkdkNHDl2djpW
	aG1OT8c4X7KmNd2u+568IC443PzGLB0pk3XmzEU=
X-Google-Smtp-Source: 
 ABdhPJycWlm81z5cUxRNgeIEwf60rYA0sc/sT3KSIkRcA0+hzC6cz/Z6AjelngUzQzQkkdpcWdXxkSfsl6irOhqaxfg=
X-Received: by 2002:a05:6102:c50:: with SMTP id
 y16mr13621740vss.45.1643896008670;
 Thu, 03 Feb 2022 05:46:48 -0800 (PST)
MIME-Version: 1.0
References: <20220202182758.919991-1-alex@linutronix.de>
 <8f129c19-a070-e1fe-d868-960fee2b77e6@denx.de>
 <CANNYZj9u_a17B1R+ufNCQe=jao6sExGrGWdAb_5t7_T2y-a4GA@mail.gmail.com>
 <be4748fe-0168-6962-9f74-02b1207dad17@denx.de>
In-Reply-To: <be4748fe-0168-6962-9f74-02b1207dad17@denx.de>
From: Alexander Kanavin <alex.kanavin@gmail.com>
Date: Thu, 3 Feb 2022 14:46:37 +0100
Message-ID: 
 <CANNYZj8tUnuM_rAdiN3G=Eqr-PsT=koHPrJnNJPR_VHfhX+NKw@mail.gmail.com>
Subject: Re: [OE-core] [PATCH 01/33] seatd: add recipe
To: Claudius Heine <ch@denx.de>
Cc: OE-core <openembedded-core@lists.openembedded.org>,
	Alexander Kanavin <alex@linutronix.de>
Content-Type: multipart/alternative; boundary="000000000000a50daa05d71d5de0"
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 03 Feb 2022 13:46:50 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/161281

--000000000000a50daa05d71d5de0
Content-Type: text/plain; charset="UTF-8"

The current recipe doesn't enable (or allow to enable) those alternatives,
so unless someone needs them, and tests that they work, there is still no
point in splitting.

Alex

On Thu, 3 Feb 2022 at 14:36, Claudius Heine <ch@denx.de> wrote:

> On 2022-02-03 14:28, Alexander Kanavin wrote:
> > As far as I understand the library is not useful without the daemon, so
> > there is no point in packaging them separately. -dev stuff is split
> > automatically.
>
> That is not the impression I got from the readme:
>
>  > # libseat
>  >
>  > A seat management library allowing applications to use whatever seat
> management is available.
>  >
>  > Supports:
>  >
>  >     seatd
>  >     (e)logind
>  >     embedded seatd for standalone operation
>  >
>  > Each backend can be compile-time included and is runtime
> auto-detected or manually selected with the LIBSEAT_BACKEND environment
> variable.
>  >
>  > Which backend is in use is transparent to the application, providing
> a simple common interface.
>
> https://sr.ht/~kennylevinsen/seatd/#libseat
>
> I guess the general question is if it makes sense to split them up for OE.
>
> regards,
> Claudius
>
> >
> > Alex
> >
> > On Thu, 3 Feb 2022 at 13:55, Claudius Heine <ch@denx.de
> > <mailto:ch@denx.de>> wrote:
> >
> >     Hi Alexander,
> >
> >     On 2022-02-02 19:27, Alexander Kanavin wrote:
> >      > This is needed to run weston properly as non-root in the absence
> >      > of systemd-logind, and other compositors will likely require seatd
> >      > as well.
> >      >
> >      > Signed-off-by: Alexander Kanavin <alex@linutronix.de
> >     <mailto:alex@linutronix.de>>
> >      > ---
> >      >   meta/conf/distro/include/maintainers.inc |  1 +
> >      >   meta/recipes-core/seatd/seatd/init       | 45
> >     ++++++++++++++++++++++++
> >      >   meta/recipes-core/seatd/seatd_0.6.3.bb <http://seatd_0.6.3.bb>
> >       | 29 +++++++++++++++
> >      >   3 files changed, 75 insertions(+)
> >      >   create mode 100644 meta/recipes-core/seatd/seatd/init
> >      >   create mode 100644 meta/recipes-core/seatd/seatd_0.6.3.bb
> >     <http://seatd_0.6.3.bb>
> >      >
> >      > diff --git a/meta/conf/distro/include/maintainers.inc
> >     b/meta/conf/distro/include/maintainers.inc
> >      > index ae25287c11..cb289a0eee 100644
> >      > --- a/meta/conf/distro/include/maintainers.inc
> >      > +++ b/meta/conf/distro/include/maintainers.inc
> >      > @@ -684,6 +684,7 @@ RECIPE_MAINTAINER:pn-rxvt-unicode =
> >     "Unassigned <unassigned@yoctoproject.org
> >     <mailto:unassigned@yoctoproject.org>>"
> >      >   RECIPE_MAINTAINER:pn-sato-screenshot = "Ross Burton
> >     <ross.burton@arm.com <mailto:ross.burton@arm.com>>"
> >      >   RECIPE_MAINTAINER:pn-sbc = "Unassigned
> >     <unassigned@yoctoproject.org <mailto:unassigned@yoctoproject.org>>"
> >      >   RECIPE_MAINTAINER:pn-screen = "Anuj Mittal
> >     <anuj.mittal@intel.com <mailto:anuj.mittal@intel.com>>"
> >      > +RECIPE_MAINTAINER:pn-seatd = "Alexander Kanavin
> >     <alex.kanavin@gmail.com <mailto:alex.kanavin@gmail.com>>"
> >      >   RECIPE_MAINTAINER:pn-sed = "Chen Qi <Qi.Chen@windriver.com
> >     <mailto:Qi.Chen@windriver.com>>"
> >      >   RECIPE_MAINTAINER:pn-serf = "Anuj Mittal <anuj.mittal@intel.com
> >     <mailto:anuj.mittal@intel.com>>"
> >      >   RECIPE_MAINTAINER:pn-setserial = "Yi Zhao
> >     <yi.zhao@windriver.com <mailto:yi.zhao@windriver.com>>"
> >      > diff --git a/meta/recipes-core/seatd/seatd/init
> >     b/meta/recipes-core/seatd/seatd/init
> >      > new file mode 100644
> >      > index 0000000000..0589c765ac
> >      > --- /dev/null
> >      > +++ b/meta/recipes-core/seatd/seatd/init
> >      > @@ -0,0 +1,45 @@
> >      > +#!/bin/sh
> >      > +#
> >      > +### BEGIN INIT INFO
> >      > +# Provides: seatd
> >      > +# Required-Start: $local_fs $remote_fs
> >      > +# Required-Stop: $local_fs $remote_fs
> >      > +# Default-Start:     2 3 4 5
> >      > +# Default-Stop:      0 1 6
> >      > +### END INIT INFO
> >      > +
> >      > +killproc() {
> >      > +        pid=`/bin/pidof $1`
> >      > +        [ "$pid" != "" ] && kill $pid
> >      > +}
> >      > +
> >      > +case "$1" in
> >      > +  start)
> >      > +        seatd -g video -n 1 > /tmp/seatd-start-notify &
> >      > +        [ -s /tmp/seatd-start-notify ] && exit 0
> >      > +        sleep 0.1
> >      > +        [ -s /tmp/seatd-start-notify ] && exit 0
> >      > +        sleep 0.5
> >      > +        [ -s /tmp/seatd-start-notify ] && exit 0
> >      > +        sleep 5
> >      > +        [ -s /tmp/seatd-start-notify ] && exit 0
> >      > +        exit 1
> >      > +  ;;
> >      > +
> >      > +  stop)
> >      > +        echo "Stopping seatd"
> >      > +        killproc seatd
> >      > +  ;;
> >      > +
> >      > +  restart)
> >      > +     $0 stop
> >      > +        sleep 1
> >      > +        $0 start
> >      > +  ;;
> >      > +
> >      > +  *)
> >      > +        echo "usage: $0 { start | stop | restart }"
> >      > +  ;;
> >      > +esac
> >      > +
> >      > +exit 0
> >      > diff --git a/meta/recipes-core/seatd/seatd_0.6.3.bb
> >     <http://seatd_0.6.3.bb> b/meta/recipes-core/seatd/seatd_0.6.3.bb
> >     <http://seatd_0.6.3.bb>
> >      > new file mode 100644
> >      > index 0000000000..0e1a79dddf
> >      > --- /dev/null
> >      > +++ b/meta/recipes-core/seatd/seatd_0.6.3.bb <
> http://seatd_0.6.3.bb>
> >      > @@ -0,0 +1,29 @@
> >      > +SUMMARY = "A minimal seat management daemon, and a universal
> >     seat management library."
> >      > +DESCRIPTION = "Seat management takes care of mediating access to
> >     shared devices (graphics, input), without requiring the applications
> >     needing access to be root."
> >      > +HOMEPAGE = "https://git.sr.ht/~kennylevinsen/seatd
> >     <https://git.sr.ht/~kennylevinsen/seatd>"
> >      > +
> >      > +LICENSE = "MIT"
> >      > +
> >      > +LIC_FILES_CHKSUM =
> >     "file://LICENSE;md5=715a99d2dd552e6188e74d4ed2914d5a"
> >      > +
> >      > +SRC_URI =
> >     "git://git.sr.ht/~kennylevinsen/seatd;protocol=https;branch=master
> >     <http://git.sr.ht/~kennylevinsen/seatd;protocol=https;branch=master>
> \
> >      > +           file://init"
> >      > +SRCREV = "88db55f6068c1c01d85b61aa6adff0a6b2a8dce8"
> >      > +S = "${WORKDIR}/git"
> >      > +
> >      > +inherit meson pkgconfig update-rc.d
> >      > +
> >      > +PACKAGECONFIG ?= "libseat-builtin"
> >      > +
> >      > +PACKAGECONFIG[libseat-builtin] =
> >     "-Dlibseat-builtin=enabled,-Dlibseat-builtin=disabled"
> >      > +
> >      > +do_install:append() {
> >      > +        if [ "${VIRTUAL-RUNTIME_init_manager}" != "systemd" ];
> then
> >      > +                install -Dm755 ${WORKDIR}/init
> >     ${D}/${sysconfdir}/init.d/seatd
> >      > +        fi
> >      > +}
> >      > +
> >      > +INITSCRIPT_NAME = "seatd"
> >      > +INITSCRIPT_PARAMS = "start 9 5 2 . stop 20 0 1 6 ."
> >      > +INHIBIT_UPDATERCD_BBCLASS =
> >     "${@oe.utils.conditional('VIRTUAL-RUNTIME_init_manager', 'systemd',
> >     '1', '', d)}"
> >      > +
> >      >
> >
> >     I was looking into seatd as well, in my recipe I split it up a bit:
> >
> >     ```
> >     PACKAGES =+ "${PN}-launch libseat libseat-dev"
> >
> >     FILES:${PN} = "${bindir}/seatd"
> >     FILES:${PN}-launch = "${bindir}/seatd-launch"
> >     FILES:libseat = "${libdir}/lib*${SOLIBS}"
> >     FILES:libseat-dev = " \
> >              ${includedir} ${FILES_SOLIBSDEV} \
> >              ${libdir}/pkgconfig"
> >
> >     RDEPENDS:${PN} = "libseat (= ${EXTENDPKGV})"
> >     RDEPENDS:${PN}-launch = "${PN} (= ${EXTENDPKGV})"
> >     RDEPENDS:libseat-dev = "libseat (= ${EXTENDPKGV})"
> >     ```
> >
> >     regards,
> >     Claudius
> >
>
> --
> DENX Software Engineering GmbH,      Managing Director: Wolfgang Denk
> HRB 165235 Munich, Office: Kirchenstr.5, D-82194 Groebenzell, Germany
> Phone: (+49)-8142-66989-54 Fax: (+49)-8142-66989-80 Email: ch@denx.de
>

--000000000000a50daa05d71d5de0
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div>The current recipe doesn&#39;t enable (or allow to en=
able) those alternatives, so unless someone needs them, and tests that they=
 work, there is still no point in splitting.</div><div><br></div><div>Alex<=
br></div></div><br><div class=3D"gmail_quote"><div dir=3D"ltr" class=3D"gma=
il_attr">On Thu, 3 Feb 2022 at 14:36, Claudius Heine &lt;<a href=3D"mailto:=
ch@denx.de">ch@denx.de</a>&gt; wrote:<br></div><blockquote class=3D"gmail_q=
uote" style=3D"margin:0px 0px 0px 0.8ex;border-left:1px solid rgb(204,204,2=
04);padding-left:1ex">On 2022-02-03 14:28, Alexander Kanavin wrote:<br>
&gt; As far as I understand the library is not useful without the daemon, s=
o <br>
&gt; there is no point in packaging them separately. -dev stuff is split <b=
r>
&gt; automatically.<br>
<br>
That is not the impression I got from the readme:<br>
<br>
=C2=A0&gt; # libseat<br>
=C2=A0&gt;<br>
=C2=A0&gt; A seat management library allowing applications to use whatever =
seat <br>
management is available.<br>
=C2=A0&gt;<br>
=C2=A0&gt; Supports:<br>
=C2=A0&gt;<br>
=C2=A0&gt;=C2=A0 =C2=A0 =C2=A0seatd<br>
=C2=A0&gt;=C2=A0 =C2=A0 =C2=A0(e)logind<br>
=C2=A0&gt;=C2=A0 =C2=A0 =C2=A0embedded seatd for standalone operation<br>
=C2=A0&gt;<br>
=C2=A0&gt; Each backend can be compile-time included and is runtime <br>
auto-detected or manually selected with the LIBSEAT_BACKEND environment <br=
>
variable.<br>
=C2=A0&gt;<br>
=C2=A0&gt; Which backend is in use is transparent to the application, provi=
ding <br>
a simple common interface.<br>
<br>
<a href=3D"https://sr.ht/~kennylevinsen/seatd/#libseat" rel=3D"noreferrer" =
target=3D"_blank">https://sr.ht/~kennylevinsen/seatd/#libseat</a><br>
<br>
I guess the general question is if it makes sense to split them up for OE.<=
br>
<br>
regards,<br>
Claudius<br>
<br>
&gt; <br>
&gt; Alex<br>
&gt; <br>
&gt; On Thu, 3 Feb 2022 at 13:55, Claudius Heine &lt;<a href=3D"mailto:ch@d=
enx.de" target=3D"_blank">ch@denx.de</a> <br>
&gt; &lt;mailto:<a href=3D"mailto:ch@denx.de" target=3D"_blank">ch@denx.de<=
/a>&gt;&gt; wrote:<br>
&gt; <br>
&gt;=C2=A0 =C2=A0 =C2=A0Hi Alexander,<br>
&gt; <br>
&gt;=C2=A0 =C2=A0 =C2=A0On 2022-02-02 19:27, Alexander Kanavin wrote:<br>
&gt;=C2=A0 =C2=A0 =C2=A0 &gt; This is needed to run weston properly as non-=
root in the absence<br>
&gt;=C2=A0 =C2=A0 =C2=A0 &gt; of systemd-logind, and other compositors will=
 likely require seatd<br>
&gt;=C2=A0 =C2=A0 =C2=A0 &gt; as well.<br>
&gt;=C2=A0 =C2=A0 =C2=A0 &gt;<br>
&gt;=C2=A0 =C2=A0 =C2=A0 &gt; Signed-off-by: Alexander Kanavin &lt;<a href=
=3D"mailto:alex@linutronix.de" target=3D"_blank">alex@linutronix.de</a><br>
&gt;=C2=A0 =C2=A0 =C2=A0&lt;mailto:<a href=3D"mailto:alex@linutronix.de" ta=
rget=3D"_blank">alex@linutronix.de</a>&gt;&gt;<br>
&gt;=C2=A0 =C2=A0 =C2=A0 &gt; ---<br>
&gt;=C2=A0 =C2=A0 =C2=A0 &gt;=C2=A0 =C2=A0meta/conf/distro/include/maintain=
ers.inc |=C2=A0 1 +<br>
&gt;=C2=A0 =C2=A0 =C2=A0 &gt;=C2=A0 =C2=A0meta/recipes-core/seatd/seatd/ini=
t=C2=A0 =C2=A0 =C2=A0 =C2=A0| 45<br>
&gt;=C2=A0 =C2=A0 =C2=A0++++++++++++++++++++++++<br>
&gt;=C2=A0 =C2=A0 =C2=A0 &gt;=C2=A0 =C2=A0meta/recipes-core/seatd/<a href=
=3D"http://seatd_0.6.3.bb" rel=3D"noreferrer" target=3D"_blank">seatd_0.6.3=
.bb</a> &lt;<a href=3D"http://seatd_0.6.3.bb" rel=3D"noreferrer" target=3D"=
_blank">http://seatd_0.6.3.bb</a>&gt; <br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0| 29 +++++++++++++++<br>
&gt;=C2=A0 =C2=A0 =C2=A0 &gt;=C2=A0 =C2=A03 files changed, 75 insertions(+)=
<br>
&gt;=C2=A0 =C2=A0 =C2=A0 &gt;=C2=A0 =C2=A0create mode 100644 meta/recipes-c=
ore/seatd/seatd/init<br>
&gt;=C2=A0 =C2=A0 =C2=A0 &gt;=C2=A0 =C2=A0create mode 100644 meta/recipes-c=
ore/seatd/<a href=3D"http://seatd_0.6.3.bb" rel=3D"noreferrer" target=3D"_b=
lank">seatd_0.6.3.bb</a><br>
&gt;=C2=A0 =C2=A0 =C2=A0&lt;<a href=3D"http://seatd_0.6.3.bb" rel=3D"norefe=
rrer" target=3D"_blank">http://seatd_0.6.3.bb</a>&gt;<br>
&gt;=C2=A0 =C2=A0 =C2=A0 &gt;<br>
&gt;=C2=A0 =C2=A0 =C2=A0 &gt; diff --git a/meta/conf/distro/include/maintai=
ners.inc<br>
&gt;=C2=A0 =C2=A0 =C2=A0b/meta/conf/distro/include/maintainers.inc<br>
&gt;=C2=A0 =C2=A0 =C2=A0 &gt; index ae25287c11..cb289a0eee 100644<br>
&gt;=C2=A0 =C2=A0 =C2=A0 &gt; --- a/meta/conf/distro/include/maintainers.in=
c<br>
&gt;=C2=A0 =C2=A0 =C2=A0 &gt; +++ b/meta/conf/distro/include/maintainers.in=
c<br>
&gt;=C2=A0 =C2=A0 =C2=A0 &gt; @@ -684,6 +684,7 @@ RECIPE_MAINTAINER:pn-rxvt=
-unicode =3D<br>
&gt;=C2=A0 =C2=A0 =C2=A0&quot;Unassigned &lt;<a href=3D"mailto:unassigned@y=
octoproject.org" target=3D"_blank">unassigned@yoctoproject.org</a><br>
&gt;=C2=A0 =C2=A0 =C2=A0&lt;mailto:<a href=3D"mailto:unassigned@yoctoprojec=
t.org" target=3D"_blank">unassigned@yoctoproject.org</a>&gt;&gt;&quot;<br>
&gt;=C2=A0 =C2=A0 =C2=A0 &gt;=C2=A0 =C2=A0RECIPE_MAINTAINER:pn-sato-screens=
hot =3D &quot;Ross Burton<br>
&gt;=C2=A0 =C2=A0 =C2=A0&lt;<a href=3D"mailto:ross.burton@arm.com" target=
=3D"_blank">ross.burton@arm.com</a> &lt;mailto:<a href=3D"mailto:ross.burto=
n@arm.com" target=3D"_blank">ross.burton@arm.com</a>&gt;&gt;&quot;<br>
&gt;=C2=A0 =C2=A0 =C2=A0 &gt;=C2=A0 =C2=A0RECIPE_MAINTAINER:pn-sbc =3D &quo=
t;Unassigned<br>
&gt;=C2=A0 =C2=A0 =C2=A0&lt;<a href=3D"mailto:unassigned@yoctoproject.org" =
target=3D"_blank">unassigned@yoctoproject.org</a> &lt;mailto:<a href=3D"mai=
lto:unassigned@yoctoproject.org" target=3D"_blank">unassigned@yoctoproject.=
org</a>&gt;&gt;&quot;<br>
&gt;=C2=A0 =C2=A0 =C2=A0 &gt;=C2=A0 =C2=A0RECIPE_MAINTAINER:pn-screen =3D &=
quot;Anuj Mittal<br>
&gt;=C2=A0 =C2=A0 =C2=A0&lt;<a href=3D"mailto:anuj.mittal@intel.com" target=
=3D"_blank">anuj.mittal@intel.com</a> &lt;mailto:<a href=3D"mailto:anuj.mit=
tal@intel.com" target=3D"_blank">anuj.mittal@intel.com</a>&gt;&gt;&quot;<br=
>
&gt;=C2=A0 =C2=A0 =C2=A0 &gt; +RECIPE_MAINTAINER:pn-seatd =3D &quot;Alexand=
er Kanavin<br>
&gt;=C2=A0 =C2=A0 =C2=A0&lt;<a href=3D"mailto:alex.kanavin@gmail.com" targe=
t=3D"_blank">alex.kanavin@gmail.com</a> &lt;mailto:<a href=3D"mailto:alex.k=
anavin@gmail.com" target=3D"_blank">alex.kanavin@gmail.com</a>&gt;&gt;&quot=
;<br>
&gt;=C2=A0 =C2=A0 =C2=A0 &gt;=C2=A0 =C2=A0RECIPE_MAINTAINER:pn-sed =3D &quo=
t;Chen Qi &lt;<a href=3D"mailto:Qi.Chen@windriver.com" target=3D"_blank">Qi=
.Chen@windriver.com</a><br>
&gt;=C2=A0 =C2=A0 =C2=A0&lt;mailto:<a href=3D"mailto:Qi.Chen@windriver.com"=
 target=3D"_blank">Qi.Chen@windriver.com</a>&gt;&gt;&quot;<br>
&gt;=C2=A0 =C2=A0 =C2=A0 &gt;=C2=A0 =C2=A0RECIPE_MAINTAINER:pn-serf =3D &qu=
ot;Anuj Mittal &lt;<a href=3D"mailto:anuj.mittal@intel.com" target=3D"_blan=
k">anuj.mittal@intel.com</a><br>
&gt;=C2=A0 =C2=A0 =C2=A0&lt;mailto:<a href=3D"mailto:anuj.mittal@intel.com"=
 target=3D"_blank">anuj.mittal@intel.com</a>&gt;&gt;&quot;<br>
&gt;=C2=A0 =C2=A0 =C2=A0 &gt;=C2=A0 =C2=A0RECIPE_MAINTAINER:pn-setserial =
=3D &quot;Yi Zhao<br>
&gt;=C2=A0 =C2=A0 =C2=A0&lt;<a href=3D"mailto:yi.zhao@windriver.com" target=
=3D"_blank">yi.zhao@windriver.com</a> &lt;mailto:<a href=3D"mailto:yi.zhao@=
windriver.com" target=3D"_blank">yi.zhao@windriver.com</a>&gt;&gt;&quot;<br=
>
&gt;=C2=A0 =C2=A0 =C2=A0 &gt; diff --git a/meta/recipes-core/seatd/seatd/in=
it<br>
&gt;=C2=A0 =C2=A0 =C2=A0b/meta/recipes-core/seatd/seatd/init<br>
&gt;=C2=A0 =C2=A0 =C2=A0 &gt; new file mode 100644<br>
&gt;=C2=A0 =C2=A0 =C2=A0 &gt; index 0000000000..0589c765ac<br>
&gt;=C2=A0 =C2=A0 =C2=A0 &gt; --- /dev/null<br>
&gt;=C2=A0 =C2=A0 =C2=A0 &gt; +++ b/meta/recipes-core/seatd/seatd/init<br>
&gt;=C2=A0 =C2=A0 =C2=A0 &gt; @@ -0,0 +1,45 @@<br>
&gt;=C2=A0 =C2=A0 =C2=A0 &gt; +#!/bin/sh<br>
&gt;=C2=A0 =C2=A0 =C2=A0 &gt; +#<br>
&gt;=C2=A0 =C2=A0 =C2=A0 &gt; +### BEGIN INIT INFO<br>
&gt;=C2=A0 =C2=A0 =C2=A0 &gt; +# Provides: seatd<br>
&gt;=C2=A0 =C2=A0 =C2=A0 &gt; +# Required-Start: $local_fs $remote_fs<br>
&gt;=C2=A0 =C2=A0 =C2=A0 &gt; +# Required-Stop: $local_fs $remote_fs<br>
&gt;=C2=A0 =C2=A0 =C2=A0 &gt; +# Default-Start:=C2=A0 =C2=A0 =C2=A02 3 4 5<=
br>
&gt;=C2=A0 =C2=A0 =C2=A0 &gt; +# Default-Stop:=C2=A0 =C2=A0 =C2=A0 0 1 6<br=
>
&gt;=C2=A0 =C2=A0 =C2=A0 &gt; +### END INIT INFO<br>
&gt;=C2=A0 =C2=A0 =C2=A0 &gt; +<br>
&gt;=C2=A0 =C2=A0 =C2=A0 &gt; +killproc() {<br>
&gt;=C2=A0 =C2=A0 =C2=A0 &gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 pid=3D`/bin/pido=
f $1`<br>
&gt;=C2=A0 =C2=A0 =C2=A0 &gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 [ &quot;$pid&quo=
t; !=3D &quot;&quot; ] &amp;&amp; kill $pid<br>
&gt;=C2=A0 =C2=A0 =C2=A0 &gt; +}<br>
&gt;=C2=A0 =C2=A0 =C2=A0 &gt; +<br>
&gt;=C2=A0 =C2=A0 =C2=A0 &gt; +case &quot;$1&quot; in<br>
&gt;=C2=A0 =C2=A0 =C2=A0 &gt; +=C2=A0 start)<br>
&gt;=C2=A0 =C2=A0 =C2=A0 &gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 seatd -g video -=
n 1 &gt; /tmp/seatd-start-notify &amp;<br>
&gt;=C2=A0 =C2=A0 =C2=A0 &gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 [ -s /tmp/seatd-=
start-notify ] &amp;&amp; exit 0<br>
&gt;=C2=A0 =C2=A0 =C2=A0 &gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 sleep 0.1<br>
&gt;=C2=A0 =C2=A0 =C2=A0 &gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 [ -s /tmp/seatd-=
start-notify ] &amp;&amp; exit 0<br>
&gt;=C2=A0 =C2=A0 =C2=A0 &gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 sleep 0.5<br>
&gt;=C2=A0 =C2=A0 =C2=A0 &gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 [ -s /tmp/seatd-=
start-notify ] &amp;&amp; exit 0<br>
&gt;=C2=A0 =C2=A0 =C2=A0 &gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 sleep 5<br>
&gt;=C2=A0 =C2=A0 =C2=A0 &gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 [ -s /tmp/seatd-=
start-notify ] &amp;&amp; exit 0<br>
&gt;=C2=A0 =C2=A0 =C2=A0 &gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 exit 1<br>
&gt;=C2=A0 =C2=A0 =C2=A0 &gt; +=C2=A0 ;;<br>
&gt;=C2=A0 =C2=A0 =C2=A0 &gt; +<br>
&gt;=C2=A0 =C2=A0 =C2=A0 &gt; +=C2=A0 stop)<br>
&gt;=C2=A0 =C2=A0 =C2=A0 &gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 echo &quot;Stopp=
ing seatd&quot;<br>
&gt;=C2=A0 =C2=A0 =C2=A0 &gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 killproc seatd<b=
r>
&gt;=C2=A0 =C2=A0 =C2=A0 &gt; +=C2=A0 ;;<br>
&gt;=C2=A0 =C2=A0 =C2=A0 &gt; +<br>
&gt;=C2=A0 =C2=A0 =C2=A0 &gt; +=C2=A0 restart)<br>
&gt;=C2=A0 =C2=A0 =C2=A0 &gt; +=C2=A0 =C2=A0 =C2=A0$0 stop<br>
&gt;=C2=A0 =C2=A0 =C2=A0 &gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 sleep 1<br>
&gt;=C2=A0 =C2=A0 =C2=A0 &gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 $0 start<br>
&gt;=C2=A0 =C2=A0 =C2=A0 &gt; +=C2=A0 ;;<br>
&gt;=C2=A0 =C2=A0 =C2=A0 &gt; +<br>
&gt;=C2=A0 =C2=A0 =C2=A0 &gt; +=C2=A0 *)<br>
&gt;=C2=A0 =C2=A0 =C2=A0 &gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 echo &quot;usage=
: $0 { start | stop | restart }&quot;<br>
&gt;=C2=A0 =C2=A0 =C2=A0 &gt; +=C2=A0 ;;<br>
&gt;=C2=A0 =C2=A0 =C2=A0 &gt; +esac<br>
&gt;=C2=A0 =C2=A0 =C2=A0 &gt; +<br>
&gt;=C2=A0 =C2=A0 =C2=A0 &gt; +exit 0<br>
&gt;=C2=A0 =C2=A0 =C2=A0 &gt; diff --git a/meta/recipes-core/seatd/<a href=
=3D"http://seatd_0.6.3.bb" rel=3D"noreferrer" target=3D"_blank">seatd_0.6.3=
.bb</a><br>
&gt;=C2=A0 =C2=A0 =C2=A0&lt;<a href=3D"http://seatd_0.6.3.bb" rel=3D"norefe=
rrer" target=3D"_blank">http://seatd_0.6.3.bb</a>&gt; b/meta/recipes-core/s=
eatd/<a href=3D"http://seatd_0.6.3.bb" rel=3D"noreferrer" target=3D"_blank"=
>seatd_0.6.3.bb</a><br>
&gt;=C2=A0 =C2=A0 =C2=A0&lt;<a href=3D"http://seatd_0.6.3.bb" rel=3D"norefe=
rrer" target=3D"_blank">http://seatd_0.6.3.bb</a>&gt;<br>
&gt;=C2=A0 =C2=A0 =C2=A0 &gt; new file mode 100644<br>
&gt;=C2=A0 =C2=A0 =C2=A0 &gt; index 0000000000..0e1a79dddf<br>
&gt;=C2=A0 =C2=A0 =C2=A0 &gt; --- /dev/null<br>
&gt;=C2=A0 =C2=A0 =C2=A0 &gt; +++ b/meta/recipes-core/seatd/<a href=3D"http=
://seatd_0.6.3.bb" rel=3D"noreferrer" target=3D"_blank">seatd_0.6.3.bb</a> =
&lt;<a href=3D"http://seatd_0.6.3.bb" rel=3D"noreferrer" target=3D"_blank">=
http://seatd_0.6.3.bb</a>&gt;<br>
&gt;=C2=A0 =C2=A0 =C2=A0 &gt; @@ -0,0 +1,29 @@<br>
&gt;=C2=A0 =C2=A0 =C2=A0 &gt; +SUMMARY =3D &quot;A minimal seat management =
daemon, and a universal<br>
&gt;=C2=A0 =C2=A0 =C2=A0seat management library.&quot;<br>
&gt;=C2=A0 =C2=A0 =C2=A0 &gt; +DESCRIPTION =3D &quot;Seat management takes =
care of mediating access to<br>
&gt;=C2=A0 =C2=A0 =C2=A0shared devices (graphics, input), without requiring=
 the applications<br>
&gt;=C2=A0 =C2=A0 =C2=A0needing access to be root.&quot;<br>
&gt;=C2=A0 =C2=A0 =C2=A0 &gt; +HOMEPAGE =3D &quot;<a href=3D"https://git.sr=
.ht/~kennylevinsen/seatd" rel=3D"noreferrer" target=3D"_blank">https://git.=
sr.ht/~kennylevinsen/seatd</a><br>
&gt;=C2=A0 =C2=A0 =C2=A0&lt;<a href=3D"https://git.sr.ht/~kennylevinsen/sea=
td" rel=3D"noreferrer" target=3D"_blank">https://git.sr.ht/~kennylevinsen/s=
eatd</a>&gt;&quot;<br>
&gt;=C2=A0 =C2=A0 =C2=A0 &gt; +<br>
&gt;=C2=A0 =C2=A0 =C2=A0 &gt; +LICENSE =3D &quot;MIT&quot;<br>
&gt;=C2=A0 =C2=A0 =C2=A0 &gt; +<br>
&gt;=C2=A0 =C2=A0 =C2=A0 &gt; +LIC_FILES_CHKSUM =3D<br>
&gt;=C2=A0 =C2=A0 =C2=A0&quot;file://LICENSE;md5=3D715a99d2dd552e6188e74d4e=
d2914d5a&quot;<br>
&gt;=C2=A0 =C2=A0 =C2=A0 &gt; +<br>
&gt;=C2=A0 =C2=A0 =C2=A0 &gt; +SRC_URI =3D<br>
&gt;=C2=A0 =C2=A0 =C2=A0&quot;git://<a href=3D"http://git.sr.ht/~kennylevin=
sen/seatd;protocol=3Dhttps;branch=3Dmaster" rel=3D"noreferrer" target=3D"_b=
lank">git.sr.ht/~kennylevinsen/seatd;protocol=3Dhttps;branch=3Dmaster</a><b=
r>
&gt;=C2=A0 =C2=A0 =C2=A0&lt;<a href=3D"http://git.sr.ht/~kennylevinsen/seat=
d;protocol=3Dhttps;branch=3Dmaster" rel=3D"noreferrer" target=3D"_blank">ht=
tp://git.sr.ht/~kennylevinsen/seatd;protocol=3Dhttps;branch=3Dmaster</a>&gt=
; \<br>
&gt;=C2=A0 =C2=A0 =C2=A0 &gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0fil=
e://init&quot;<br>
&gt;=C2=A0 =C2=A0 =C2=A0 &gt; +SRCREV =3D &quot;88db55f6068c1c01d85b61aa6ad=
ff0a6b2a8dce8&quot;<br>
&gt;=C2=A0 =C2=A0 =C2=A0 &gt; +S =3D &quot;${WORKDIR}/git&quot;<br>
&gt;=C2=A0 =C2=A0 =C2=A0 &gt; +<br>
&gt;=C2=A0 =C2=A0 =C2=A0 &gt; +inherit meson pkgconfig update-rc.d<br>
&gt;=C2=A0 =C2=A0 =C2=A0 &gt; +<br>
&gt;=C2=A0 =C2=A0 =C2=A0 &gt; +PACKAGECONFIG ?=3D &quot;libseat-builtin&quo=
t;<br>
&gt;=C2=A0 =C2=A0 =C2=A0 &gt; +<br>
&gt;=C2=A0 =C2=A0 =C2=A0 &gt; +PACKAGECONFIG[libseat-builtin] =3D<br>
&gt;=C2=A0 =C2=A0 =C2=A0&quot;-Dlibseat-builtin=3Denabled,-Dlibseat-builtin=
=3Ddisabled&quot;<br>
&gt;=C2=A0 =C2=A0 =C2=A0 &gt; +<br>
&gt;=C2=A0 =C2=A0 =C2=A0 &gt; +do_install:append() {<br>
&gt;=C2=A0 =C2=A0 =C2=A0 &gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 if [ &quot;${VIR=
TUAL-RUNTIME_init_manager}&quot; !=3D &quot;systemd&quot; ]; then<br>
&gt;=C2=A0 =C2=A0 =C2=A0 &gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 install -Dm755 ${WORKDIR}/init<br>
&gt;=C2=A0 =C2=A0 =C2=A0${D}/${sysconfdir}/init.d/seatd<br>
&gt;=C2=A0 =C2=A0 =C2=A0 &gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 fi<br>
&gt;=C2=A0 =C2=A0 =C2=A0 &gt; +}<br>
&gt;=C2=A0 =C2=A0 =C2=A0 &gt; +<br>
&gt;=C2=A0 =C2=A0 =C2=A0 &gt; +INITSCRIPT_NAME =3D &quot;seatd&quot;<br>
&gt;=C2=A0 =C2=A0 =C2=A0 &gt; +INITSCRIPT_PARAMS =3D &quot;start 9 5 2 . st=
op 20 0 1 6 .&quot;<br>
&gt;=C2=A0 =C2=A0 =C2=A0 &gt; +INHIBIT_UPDATERCD_BBCLASS =3D<br>
&gt;=C2=A0 =C2=A0 =C2=A0&quot;${@oe.utils.conditional(&#39;VIRTUAL-RUNTIME_=
init_manager&#39;, &#39;systemd&#39;,<br>
&gt;=C2=A0 =C2=A0 =C2=A0&#39;1&#39;, &#39;&#39;, d)}&quot;<br>
&gt;=C2=A0 =C2=A0 =C2=A0 &gt; +<br>
&gt;=C2=A0 =C2=A0 =C2=A0 &gt;<br>
&gt; <br>
&gt;=C2=A0 =C2=A0 =C2=A0I was looking into seatd as well, in my recipe I sp=
lit it up a bit:<br>
&gt; <br>
&gt;=C2=A0 =C2=A0 =C2=A0```<br>
&gt;=C2=A0 =C2=A0 =C2=A0PACKAGES =3D+ &quot;${PN}-launch libseat libseat-de=
v&quot;<br>
&gt; <br>
&gt;=C2=A0 =C2=A0 =C2=A0FILES:${PN} =3D &quot;${bindir}/seatd&quot;<br>
&gt;=C2=A0 =C2=A0 =C2=A0FILES:${PN}-launch =3D &quot;${bindir}/seatd-launch=
&quot;<br>
&gt;=C2=A0 =C2=A0 =C2=A0FILES:libseat =3D &quot;${libdir}/lib*${SOLIBS}&quo=
t;<br>
&gt;=C2=A0 =C2=A0 =C2=A0FILES:libseat-dev =3D &quot; \<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 ${includedir} ${FILES_=
SOLIBSDEV} \<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 ${libdir}/pkgconfig&qu=
ot;<br>
&gt; <br>
&gt;=C2=A0 =C2=A0 =C2=A0RDEPENDS:${PN} =3D &quot;libseat (=3D ${EXTENDPKGV}=
)&quot;<br>
&gt;=C2=A0 =C2=A0 =C2=A0RDEPENDS:${PN}-launch =3D &quot;${PN} (=3D ${EXTEND=
PKGV})&quot;<br>
&gt;=C2=A0 =C2=A0 =C2=A0RDEPENDS:libseat-dev =3D &quot;libseat (=3D ${EXTEN=
DPKGV})&quot;<br>
&gt;=C2=A0 =C2=A0 =C2=A0```<br>
&gt; <br>
&gt;=C2=A0 =C2=A0 =C2=A0regards,<br>
&gt;=C2=A0 =C2=A0 =C2=A0Claudius<br>
&gt; <br>
<br>
-- <br>
DENX Software Engineering GmbH,=C2=A0 =C2=A0 =C2=A0 Managing Director: Wolf=
gang Denk<br>
HRB 165235 Munich, Office: Kirchenstr.5, D-82194 Groebenzell, Germany<br>
Phone: (+49)-8142-66989-54 Fax: (+49)-8142-66989-80 Email: <a href=3D"mailt=
o:ch@denx.de" target=3D"_blank">ch@denx.de</a><br>
</blockquote></div>

--000000000000a50daa05d71d5de0--

