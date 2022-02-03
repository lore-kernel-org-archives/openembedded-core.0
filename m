Return-Path: <alex.kanavin@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id AA76BC433EF
	for <webhook@archiver.kernel.org>; Thu,  3 Feb 2022 13:28:58 +0000 (UTC)
Received: from mail-ua1-f49.google.com (mail-ua1-f49.google.com
 [209.85.222.49])
 by mx.groups.io with SMTP id smtpd.web09.8945.1643894938027529252
 for <openembedded-core@lists.openembedded.org>;
 Thu, 03 Feb 2022 05:28:58 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20210112 header.b=YBkeCa2N;
 spf=pass (domain: gmail.com, ip: 209.85.222.49,
 mailfrom: alex.kanavin@gmail.com)
Received: by mail-ua1-f49.google.com with SMTP id m90so5193030uam.2
        for <openembedded-core@lists.openembedded.org>;
 Thu, 03 Feb 2022 05:28:57 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=mNKzJv6xG30l8qlp6tT9iLXTYgPimqot3UHIQUOPUU8=;
        b=YBkeCa2NX9V8fJ+jDqr4Q3zo9cjGEkkStL1B5BxPjfHMVWD8/qcOroqLRONATvyc4W
         zZkj3gahI62Tv+9cS/gHShu8cl7pudi3Y8IKV4ilfJSMKG3atxhdU5VJRlKnrPKjxPAK
         kJDdFK3Y6g58BZyRq+HPS5DOzgRADYceGIYtVWFrCyqVhhz1zDPWcAMxlDmL4ZZl1ZWv
         C6CBT0/WSXFlxZMjkc3yQGsYRVspbWiTYr/tKlIBgE1YZQbqt1ruj79hWZlRiudVNQHM
         /YXd6HlzFZXhoDYKX8qpHJLVJZlNBTjfpd4xRDCEISHHdCrWKzd4kpGrf9s6w7ZRLQzZ
         k4lQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=mNKzJv6xG30l8qlp6tT9iLXTYgPimqot3UHIQUOPUU8=;
        b=vBWY9myTmH0WGi5cDuDv/pEz6S0nM/Rvzqm3R8KskW7xueM4WdG9XcO+mfKHy63vbv
         Fh4vhFVN7o9uvdPrIR4GtcR+4f/nqCbI2afGOjK+aeZbaAlk3krxSLBloMuSC8kRvZQ3
         h/CHp9srOho9aDsBHwjET6HiPzyS2co7ryACQ3gLPaYuQYvKfBxhzrEdg0vPdWkQbwTb
         BQmFQADced6RuOIj/fm32/1SuYDNYMNUguSNIUkYOPLmnNpn6unGKBz0QbDy7zsCR17/
         Xd9gQpRrGRzl/FM5qWAD07OiNixN6HY/ohrfQn/IxUeaD187fqdWuX+q6Ch1lQbiXRPH
         jcqw==
X-Gm-Message-State: AOAM533Py8IXzP3ShtNXPMNQGeQdxx/qvzR0ZMPnkufRUjsE+JnnjWhn
	dNZ9tcy183fJBeLVPK0RzmMkfCb6rhPDzLiHAWM=
X-Google-Smtp-Source: 
 ABdhPJz7hEz/SpUAUB3C/bxb6Y1zY7HHURHpSqu0mEqO7DVvlCTMNNvAb/fj2NB7CqwCJIG6TnqFh2gWZcmzGOxEJRg=
X-Received: by 2002:a05:6102:c50:: with SMTP id
 y16mr13596119vss.45.1643894937069;
 Thu, 03 Feb 2022 05:28:57 -0800 (PST)
MIME-Version: 1.0
References: <20220202182758.919991-1-alex@linutronix.de>
 <8f129c19-a070-e1fe-d868-960fee2b77e6@denx.de>
In-Reply-To: <8f129c19-a070-e1fe-d868-960fee2b77e6@denx.de>
From: Alexander Kanavin <alex.kanavin@gmail.com>
Date: Thu, 3 Feb 2022 14:28:45 +0100
Message-ID: 
 <CANNYZj9u_a17B1R+ufNCQe=jao6sExGrGWdAb_5t7_T2y-a4GA@mail.gmail.com>
Subject: Re: [OE-core] [PATCH 01/33] seatd: add recipe
To: Claudius Heine <ch@denx.de>
Cc: OE-core <openembedded-core@lists.openembedded.org>,
	Alexander Kanavin <alex@linutronix.de>
Content-Type: multipart/alternative; boundary="000000000000c5b13305d71d1de2"
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 03 Feb 2022 13:28:58 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/161279

--000000000000c5b13305d71d1de2
Content-Type: text/plain; charset="UTF-8"

As far as I understand the library is not useful without the daemon, so
there is no point in packaging them separately. -dev stuff is split
automatically.

Alex

On Thu, 3 Feb 2022 at 13:55, Claudius Heine <ch@denx.de> wrote:

> Hi Alexander,
>
> On 2022-02-02 19:27, Alexander Kanavin wrote:
> > This is needed to run weston properly as non-root in the absence
> > of systemd-logind, and other compositors will likely require seatd
> > as well.
> >
> > Signed-off-by: Alexander Kanavin <alex@linutronix.de>
> > ---
> >   meta/conf/distro/include/maintainers.inc |  1 +
> >   meta/recipes-core/seatd/seatd/init       | 45 ++++++++++++++++++++++++
> >   meta/recipes-core/seatd/seatd_0.6.3.bb   | 29 +++++++++++++++
> >   3 files changed, 75 insertions(+)
> >   create mode 100644 meta/recipes-core/seatd/seatd/init
> >   create mode 100644 meta/recipes-core/seatd/seatd_0.6.3.bb
> >
> > diff --git a/meta/conf/distro/include/maintainers.inc
> b/meta/conf/distro/include/maintainers.inc
> > index ae25287c11..cb289a0eee 100644
> > --- a/meta/conf/distro/include/maintainers.inc
> > +++ b/meta/conf/distro/include/maintainers.inc
> > @@ -684,6 +684,7 @@ RECIPE_MAINTAINER:pn-rxvt-unicode = "Unassigned <
> unassigned@yoctoproject.org>"
> >   RECIPE_MAINTAINER:pn-sato-screenshot = "Ross Burton <
> ross.burton@arm.com>"
> >   RECIPE_MAINTAINER:pn-sbc = "Unassigned <unassigned@yoctoproject.org>"
> >   RECIPE_MAINTAINER:pn-screen = "Anuj Mittal <anuj.mittal@intel.com>"
> > +RECIPE_MAINTAINER:pn-seatd = "Alexander Kanavin <alex.kanavin@gmail.com
> >"
> >   RECIPE_MAINTAINER:pn-sed = "Chen Qi <Qi.Chen@windriver.com>"
> >   RECIPE_MAINTAINER:pn-serf = "Anuj Mittal <anuj.mittal@intel.com>"
> >   RECIPE_MAINTAINER:pn-setserial = "Yi Zhao <yi.zhao@windriver.com>"
> > diff --git a/meta/recipes-core/seatd/seatd/init
> b/meta/recipes-core/seatd/seatd/init
> > new file mode 100644
> > index 0000000000..0589c765ac
> > --- /dev/null
> > +++ b/meta/recipes-core/seatd/seatd/init
> > @@ -0,0 +1,45 @@
> > +#!/bin/sh
> > +#
> > +### BEGIN INIT INFO
> > +# Provides: seatd
> > +# Required-Start: $local_fs $remote_fs
> > +# Required-Stop: $local_fs $remote_fs
> > +# Default-Start:     2 3 4 5
> > +# Default-Stop:      0 1 6
> > +### END INIT INFO
> > +
> > +killproc() {
> > +        pid=`/bin/pidof $1`
> > +        [ "$pid" != "" ] && kill $pid
> > +}
> > +
> > +case "$1" in
> > +  start)
> > +        seatd -g video -n 1 > /tmp/seatd-start-notify &
> > +        [ -s /tmp/seatd-start-notify ] && exit 0
> > +        sleep 0.1
> > +        [ -s /tmp/seatd-start-notify ] && exit 0
> > +        sleep 0.5
> > +        [ -s /tmp/seatd-start-notify ] && exit 0
> > +        sleep 5
> > +        [ -s /tmp/seatd-start-notify ] && exit 0
> > +        exit 1
> > +  ;;
> > +
> > +  stop)
> > +        echo "Stopping seatd"
> > +        killproc seatd
> > +  ;;
> > +
> > +  restart)
> > +     $0 stop
> > +        sleep 1
> > +        $0 start
> > +  ;;
> > +
> > +  *)
> > +        echo "usage: $0 { start | stop | restart }"
> > +  ;;
> > +esac
> > +
> > +exit 0
> > diff --git a/meta/recipes-core/seatd/seatd_0.6.3.bb
> b/meta/recipes-core/seatd/seatd_0.6.3.bb
> > new file mode 100644
> > index 0000000000..0e1a79dddf
> > --- /dev/null
> > +++ b/meta/recipes-core/seatd/seatd_0.6.3.bb
> > @@ -0,0 +1,29 @@
> > +SUMMARY = "A minimal seat management daemon, and a universal seat
> management library."
> > +DESCRIPTION = "Seat management takes care of mediating access to shared
> devices (graphics, input), without requiring the applications needing
> access to be root."
> > +HOMEPAGE = "https://git.sr.ht/~kennylevinsen/seatd"
> > +
> > +LICENSE = "MIT"
> > +
> > +LIC_FILES_CHKSUM = "file://LICENSE;md5=715a99d2dd552e6188e74d4ed2914d5a"
> > +
> > +SRC_URI = "git://
> git.sr.ht/~kennylevinsen/seatd;protocol=https;branch=master \
> > +           file://init"
> > +SRCREV = "88db55f6068c1c01d85b61aa6adff0a6b2a8dce8"
> > +S = "${WORKDIR}/git"
> > +
> > +inherit meson pkgconfig update-rc.d
> > +
> > +PACKAGECONFIG ?= "libseat-builtin"
> > +
> > +PACKAGECONFIG[libseat-builtin] =
> "-Dlibseat-builtin=enabled,-Dlibseat-builtin=disabled"
> > +
> > +do_install:append() {
> > +        if [ "${VIRTUAL-RUNTIME_init_manager}" != "systemd" ]; then
> > +                install -Dm755 ${WORKDIR}/init
> ${D}/${sysconfdir}/init.d/seatd
> > +        fi
> > +}
> > +
> > +INITSCRIPT_NAME = "seatd"
> > +INITSCRIPT_PARAMS = "start 9 5 2 . stop 20 0 1 6 ."
> > +INHIBIT_UPDATERCD_BBCLASS =
> "${@oe.utils.conditional('VIRTUAL-RUNTIME_init_manager', 'systemd', '1',
> '', d)}"
> > +
> >
>
> I was looking into seatd as well, in my recipe I split it up a bit:
>
> ```
> PACKAGES =+ "${PN}-launch libseat libseat-dev"
>
> FILES:${PN} = "${bindir}/seatd"
> FILES:${PN}-launch = "${bindir}/seatd-launch"
> FILES:libseat = "${libdir}/lib*${SOLIBS}"
> FILES:libseat-dev = " \
>         ${includedir} ${FILES_SOLIBSDEV} \
>         ${libdir}/pkgconfig"
>
> RDEPENDS:${PN} = "libseat (= ${EXTENDPKGV})"
> RDEPENDS:${PN}-launch = "${PN} (= ${EXTENDPKGV})"
> RDEPENDS:libseat-dev = "libseat (= ${EXTENDPKGV})"
> ```
>
> regards,
> Claudius
>

--000000000000c5b13305d71d1de2
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div>As far as I understand the library is not useful with=
out the daemon, so there is no point in packaging them separately. -dev stu=
ff is split automatically.</div><div><br></div><div>Alex<br></div></div><br=
><div class=3D"gmail_quote"><div dir=3D"ltr" class=3D"gmail_attr">On Thu, 3=
 Feb 2022 at 13:55, Claudius Heine &lt;<a href=3D"mailto:ch@denx.de">ch@den=
x.de</a>&gt; wrote:<br></div><blockquote class=3D"gmail_quote" style=3D"mar=
gin:0px 0px 0px 0.8ex;border-left:1px solid rgb(204,204,204);padding-left:1=
ex">Hi Alexander,<br>
<br>
On 2022-02-02 19:27, Alexander Kanavin wrote:<br>
&gt; This is needed to run weston properly as non-root in the absence<br>
&gt; of systemd-logind, and other compositors will likely require seatd<br>
&gt; as well.<br>
&gt; <br>
&gt; Signed-off-by: Alexander Kanavin &lt;<a href=3D"mailto:alex@linutronix=
.de" target=3D"_blank">alex@linutronix.de</a>&gt;<br>
&gt; ---<br>
&gt;=C2=A0 =C2=A0meta/conf/distro/include/maintainers.inc |=C2=A0 1 +<br>
&gt;=C2=A0 =C2=A0meta/recipes-core/seatd/seatd/init=C2=A0 =C2=A0 =C2=A0 =C2=
=A0| 45 ++++++++++++++++++++++++<br>
&gt;=C2=A0 =C2=A0meta/recipes-core/seatd/<a href=3D"http://seatd_0.6.3.bb" =
rel=3D"noreferrer" target=3D"_blank">seatd_0.6.3.bb</a>=C2=A0 =C2=A0| 29 ++=
+++++++++++++<br>
&gt;=C2=A0 =C2=A03 files changed, 75 insertions(+)<br>
&gt;=C2=A0 =C2=A0create mode 100644 meta/recipes-core/seatd/seatd/init<br>
&gt;=C2=A0 =C2=A0create mode 100644 meta/recipes-core/seatd/<a href=3D"http=
://seatd_0.6.3.bb" rel=3D"noreferrer" target=3D"_blank">seatd_0.6.3.bb</a><=
br>
&gt; <br>
&gt; diff --git a/meta/conf/distro/include/maintainers.inc b/meta/conf/dist=
ro/include/maintainers.inc<br>
&gt; index ae25287c11..cb289a0eee 100644<br>
&gt; --- a/meta/conf/distro/include/maintainers.inc<br>
&gt; +++ b/meta/conf/distro/include/maintainers.inc<br>
&gt; @@ -684,6 +684,7 @@ RECIPE_MAINTAINER:pn-rxvt-unicode =3D &quot;Unassi=
gned &lt;<a href=3D"mailto:unassigned@yoctoproject.org" target=3D"_blank">u=
nassigned@yoctoproject.org</a>&gt;&quot;<br>
&gt;=C2=A0 =C2=A0RECIPE_MAINTAINER:pn-sato-screenshot =3D &quot;Ross Burton=
 &lt;<a href=3D"mailto:ross.burton@arm.com" target=3D"_blank">ross.burton@a=
rm.com</a>&gt;&quot;<br>
&gt;=C2=A0 =C2=A0RECIPE_MAINTAINER:pn-sbc =3D &quot;Unassigned &lt;<a href=
=3D"mailto:unassigned@yoctoproject.org" target=3D"_blank">unassigned@yoctop=
roject.org</a>&gt;&quot;<br>
&gt;=C2=A0 =C2=A0RECIPE_MAINTAINER:pn-screen =3D &quot;Anuj Mittal &lt;<a h=
ref=3D"mailto:anuj.mittal@intel.com" target=3D"_blank">anuj.mittal@intel.co=
m</a>&gt;&quot;<br>
&gt; +RECIPE_MAINTAINER:pn-seatd =3D &quot;Alexander Kanavin &lt;<a href=3D=
"mailto:alex.kanavin@gmail.com" target=3D"_blank">alex.kanavin@gmail.com</a=
>&gt;&quot;<br>
&gt;=C2=A0 =C2=A0RECIPE_MAINTAINER:pn-sed =3D &quot;Chen Qi &lt;<a href=3D"=
mailto:Qi.Chen@windriver.com" target=3D"_blank">Qi.Chen@windriver.com</a>&g=
t;&quot;<br>
&gt;=C2=A0 =C2=A0RECIPE_MAINTAINER:pn-serf =3D &quot;Anuj Mittal &lt;<a hre=
f=3D"mailto:anuj.mittal@intel.com" target=3D"_blank">anuj.mittal@intel.com<=
/a>&gt;&quot;<br>
&gt;=C2=A0 =C2=A0RECIPE_MAINTAINER:pn-setserial =3D &quot;Yi Zhao &lt;<a hr=
ef=3D"mailto:yi.zhao@windriver.com" target=3D"_blank">yi.zhao@windriver.com=
</a>&gt;&quot;<br>
&gt; diff --git a/meta/recipes-core/seatd/seatd/init b/meta/recipes-core/se=
atd/seatd/init<br>
&gt; new file mode 100644<br>
&gt; index 0000000000..0589c765ac<br>
&gt; --- /dev/null<br>
&gt; +++ b/meta/recipes-core/seatd/seatd/init<br>
&gt; @@ -0,0 +1,45 @@<br>
&gt; +#!/bin/sh<br>
&gt; +#<br>
&gt; +### BEGIN INIT INFO<br>
&gt; +# Provides: seatd<br>
&gt; +# Required-Start: $local_fs $remote_fs<br>
&gt; +# Required-Stop: $local_fs $remote_fs<br>
&gt; +# Default-Start:=C2=A0 =C2=A0 =C2=A02 3 4 5<br>
&gt; +# Default-Stop:=C2=A0 =C2=A0 =C2=A0 0 1 6<br>
&gt; +### END INIT INFO<br>
&gt; +<br>
&gt; +killproc() {<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 pid=3D`/bin/pidof $1`<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 [ &quot;$pid&quot; !=3D &quot;&quot; ] &a=
mp;&amp; kill $pid<br>
&gt; +}<br>
&gt; +<br>
&gt; +case &quot;$1&quot; in<br>
&gt; +=C2=A0 start)<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 seatd -g video -n 1 &gt; /tmp/seatd-start=
-notify &amp;<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 [ -s /tmp/seatd-start-notify ] &amp;&amp;=
 exit 0<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 sleep 0.1<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 [ -s /tmp/seatd-start-notify ] &amp;&amp;=
 exit 0<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 sleep 0.5<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 [ -s /tmp/seatd-start-notify ] &amp;&amp;=
 exit 0<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 sleep 5<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 [ -s /tmp/seatd-start-notify ] &amp;&amp;=
 exit 0<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 exit 1<br>
&gt; +=C2=A0 ;;<br>
&gt; +<br>
&gt; +=C2=A0 stop)<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 echo &quot;Stopping seatd&quot;<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 killproc seatd<br>
&gt; +=C2=A0 ;;<br>
&gt; +<br>
&gt; +=C2=A0 restart)<br>
&gt; +=C2=A0 =C2=A0 =C2=A0$0 stop<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 sleep 1<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 $0 start<br>
&gt; +=C2=A0 ;;<br>
&gt; +<br>
&gt; +=C2=A0 *)<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 echo &quot;usage: $0 { start | stop | res=
tart }&quot;<br>
&gt; +=C2=A0 ;;<br>
&gt; +esac<br>
&gt; +<br>
&gt; +exit 0<br>
&gt; diff --git a/meta/recipes-core/seatd/<a href=3D"http://seatd_0.6.3.bb"=
 rel=3D"noreferrer" target=3D"_blank">seatd_0.6.3.bb</a> b/meta/recipes-cor=
e/seatd/<a href=3D"http://seatd_0.6.3.bb" rel=3D"noreferrer" target=3D"_bla=
nk">seatd_0.6.3.bb</a><br>
&gt; new file mode 100644<br>
&gt; index 0000000000..0e1a79dddf<br>
&gt; --- /dev/null<br>
&gt; +++ b/meta/recipes-core/seatd/<a href=3D"http://seatd_0.6.3.bb" rel=3D=
"noreferrer" target=3D"_blank">seatd_0.6.3.bb</a><br>
&gt; @@ -0,0 +1,29 @@<br>
&gt; +SUMMARY =3D &quot;A minimal seat management daemon, and a universal s=
eat management library.&quot;<br>
&gt; +DESCRIPTION =3D &quot;Seat management takes care of mediating access =
to shared devices (graphics, input), without requiring the applications nee=
ding access to be root.&quot;<br>
&gt; +HOMEPAGE =3D &quot;<a href=3D"https://git.sr.ht/~kennylevinsen/seatd"=
 rel=3D"noreferrer" target=3D"_blank">https://git.sr.ht/~kennylevinsen/seat=
d</a>&quot;<br>
&gt; +<br>
&gt; +LICENSE =3D &quot;MIT&quot;<br>
&gt; +<br>
&gt; +LIC_FILES_CHKSUM =3D &quot;file://LICENSE;md5=3D715a99d2dd552e6188e74=
d4ed2914d5a&quot;<br>
&gt; +<br>
&gt; +SRC_URI =3D &quot;git://<a href=3D"http://git.sr.ht/~kennylevinsen/se=
atd;protocol=3Dhttps;branch=3Dmaster" rel=3D"noreferrer" target=3D"_blank">=
git.sr.ht/~kennylevinsen/seatd;protocol=3Dhttps;branch=3Dmaster</a> \<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0file://init&quot;<br>
&gt; +SRCREV =3D &quot;88db55f6068c1c01d85b61aa6adff0a6b2a8dce8&quot;<br>
&gt; +S =3D &quot;${WORKDIR}/git&quot;<br>
&gt; +<br>
&gt; +inherit meson pkgconfig update-rc.d<br>
&gt; +<br>
&gt; +PACKAGECONFIG ?=3D &quot;libseat-builtin&quot;<br>
&gt; +<br>
&gt; +PACKAGECONFIG[libseat-builtin] =3D &quot;-Dlibseat-builtin=3Denabled,=
-Dlibseat-builtin=3Ddisabled&quot;<br>
&gt; +<br>
&gt; +do_install:append() {<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 if [ &quot;${VIRTUAL-RUNTIME_init_manager=
}&quot; !=3D &quot;systemd&quot; ]; then<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 install -Dm75=
5 ${WORKDIR}/init ${D}/${sysconfdir}/init.d/seatd<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 fi<br>
&gt; +}<br>
&gt; +<br>
&gt; +INITSCRIPT_NAME =3D &quot;seatd&quot;<br>
&gt; +INITSCRIPT_PARAMS =3D &quot;start 9 5 2 . stop 20 0 1 6 .&quot;<br>
&gt; +INHIBIT_UPDATERCD_BBCLASS =3D &quot;${@oe.utils.conditional(&#39;VIRT=
UAL-RUNTIME_init_manager&#39;, &#39;systemd&#39;, &#39;1&#39;, &#39;&#39;, =
d)}&quot;<br>
&gt; +<br>
&gt; <br>
<br>
I was looking into seatd as well, in my recipe I split it up a bit:<br>
<br>
```<br>
PACKAGES =3D+ &quot;${PN}-launch libseat libseat-dev&quot;<br>
<br>
FILES:${PN} =3D &quot;${bindir}/seatd&quot;<br>
FILES:${PN}-launch =3D &quot;${bindir}/seatd-launch&quot;<br>
FILES:libseat =3D &quot;${libdir}/lib*${SOLIBS}&quot;<br>
FILES:libseat-dev =3D &quot; \<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 ${includedir} ${FILES_SOLIBSDEV} \<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 ${libdir}/pkgconfig&quot;<br>
<br>
RDEPENDS:${PN} =3D &quot;libseat (=3D ${EXTENDPKGV})&quot;<br>
RDEPENDS:${PN}-launch =3D &quot;${PN} (=3D ${EXTENDPKGV})&quot;<br>
RDEPENDS:libseat-dev =3D &quot;libseat (=3D ${EXTENDPKGV})&quot;<br>
```<br>
<br>
regards,<br>
Claudius<br>
</blockquote></div>

--000000000000c5b13305d71d1de2--

