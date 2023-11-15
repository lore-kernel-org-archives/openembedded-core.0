Return-Path: <quaresma.jose@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 93219C07548
	for <webhook@archiver.kernel.org>; Wed, 15 Nov 2023 12:45:19 +0000 (UTC)
Received: from mail-vs1-f50.google.com (mail-vs1-f50.google.com [209.85.217.50])
 by mx.groups.io with SMTP id smtpd.web11.12018.1700052312978793177
 for <openembedded-core@lists.openembedded.org>;
 Wed, 15 Nov 2023 04:45:13 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=BZdWSmAh;
 spf=pass (domain: gmail.com, ip: 209.85.217.50, mailfrom: quaresma.jose@gmail.com)
Received: by mail-vs1-f50.google.com with SMTP id ada2fe7eead31-45f3b583ce9so529429137.0
        for <openembedded-core@lists.openembedded.org>; Wed, 15 Nov 2023 04:45:12 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1700052312; x=1700657112; darn=lists.openembedded.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=McBJ49KPjTVgF3+vb57enl16nCqieRpx08qrw0szxh4=;
        b=BZdWSmAhHB/G7e2Z5uLFWfPfFMtFVzGi88LafIFyP+2HMsdvz2J472AgUS7S2b0Stx
         Ukeh39NweTolva5cwJ36KUzxuU5H7Gng1657w7HBoisSGtQeuMtfaZKQ3xbV6UNQ3ROO
         utzCfQPSX2D5xZ53cUVQpYxnTNhlz/cCAnWK81Ei9AgJCyTO7729DUN4w//NfflWdycc
         SXo19KwPp5RgjN9Ete5lHnk/FBXXiQn46ayPJcG5jvyJboogWvHX0yqAK+8jbdB3xO7g
         nbcYe7lmKWazV0HuH4CFqjsF6MBAdtWC2AqV0d21fxQr8S7vjCELMPuOgyW8eJmlTDo7
         5o0g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1700052312; x=1700657112;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=McBJ49KPjTVgF3+vb57enl16nCqieRpx08qrw0szxh4=;
        b=tiBnKPAGGkWu9QrG/kuBQDV4iqeAur/4l8V/n420cISRXueeBQDt+4pUlMGxGEZCgI
         xz6PKLNhq0f0EUz0gMWrVIVyGK/j0hAAvLiCwxXL9xBJtFBE1er5cA14D7IZXHSznu2o
         2Dy/M/4HWlr3L+9TV+3N+YsGZw9Ec/+hOpPgzr2+BLFcJPkgKotXDZjb4v2CLU10Qwok
         r6UiFQTIMOadvT8bg0ANQqahhsCrfMmgV847WYzQhkZSavpEP4eJbkRKH4rhgqFhi4gF
         VClFmebJ7hiv+APUavkDg3g2iXbfpcCeBdaK+PgJ/PX3Hqa3lqRn51ghwmsA92Ff6N82
         WDGQ==
X-Gm-Message-State: AOJu0YxZEs+2g9g2wzqLAvRN1j4f1reBHHHJTgUK91GMTY2l/z6U0zEv
	qgZO8ct7RzNnYfOQAlGJohET+SB4uxF89kupAjR2AvXjUtQ=
X-Google-Smtp-Source: AGHT+IHOEc5Zqv+6KYV6xhgHDvhLN+yo3Ffs+UTzzqkNvLPT0q5jL57jf6YY1E6z2/dOBxfMxF8OvK3UCr0bvgJ8mo4=
X-Received: by 2002:a67:ead2:0:b0:452:6478:3e24 with SMTP id
 s18-20020a67ead2000000b0045264783e24mr3697852vso.12.1700052311664; Wed, 15
 Nov 2023 04:45:11 -0800 (PST)
MIME-Version: 1.0
References: <20231115050507.3572177-1-xiangyu.chen@eng.windriver.com>
In-Reply-To: <20231115050507.3572177-1-xiangyu.chen@eng.windriver.com>
From: Jose Quaresma <quaresma.jose@gmail.com>
Date: Wed, 15 Nov 2023 12:45:00 +0000
Message-ID: <CANPvuRnCTOii5+bECiNCM3C5OnektcHQCRFoZnxP940DbcsCxQ@mail.gmail.com>
Subject: Re: [OE-Core][PATCH v2] openssh: add systemd readiness notification support
To: Xiangyu Chen <xiangyu.chen@eng.windriver.com>
Cc: openembedded-core@lists.openembedded.org
Content-Type: multipart/alternative; boundary="00000000000022f3ad060a3046dd"
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 15 Nov 2023 12:45:19 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/190593

--00000000000022f3ad060a3046dd
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi Xiangyu,

I believe the recipe patch can be shrinking to a new PACKAGECONFIG line,
comments inline.

Jose

Xiangyu Chen <xiangyu.chen@eng.windriver.com> escreveu no dia quarta,
15/11/2023 =C3=A0(s) 04:30:

> From: Xiangyu Chen <xiangyu.chen@windriver.com>
>
> The sshd keeps on terminating and restarting in servel minutes, we can
> observe
> log from journalctl that the sshd was killed by systemd with signal 15:
>
>     systemd[1]: sshd.service start operation timed out. Terminating.
>     sshd[374]: Received signal 15; terminating.
>
> When the sshd as a systemd service, it need to tell systemd with a "READY=
"
> status,
> and when it is restarted, it need to tell systemd with a "RELOADING"
> status, otherwise,
> systemd would treat it as failing service and restart it again.
>
> Taken a patch from openssh upstream PR[1], that after using a signal to
> tell systemd
> it is ready or reload now.
>
> Ref:
> [1]
> https://github.com/openssh/openssh-portable/pull/375/commits/be187435911c=
de6cc3cef6982a508261074f1e56
>
> Signed-off-by: Xiangyu Chen <xiangyu.chen@windriver.com>
> ---
>  ...tional-support-for-systemd-sd_notify.patch | 99 +++++++++++++++++++
>  .../openssh/openssh_9.5p1.bb                  |  5 +-
>  2 files changed, 103 insertions(+), 1 deletion(-)
>  create mode 100644
> meta/recipes-connectivity/openssh/openssh/0001-systemd-Add-optional-suppo=
rt-for-systemd-sd_notify.patch
>
> diff --git
> a/meta/recipes-connectivity/openssh/openssh/0001-systemd-Add-optional-sup=
port-for-systemd-sd_notify.patch
> b/meta/recipes-connectivity/openssh/openssh/0001-systemd-Add-optional-sup=
port-for-systemd-sd_notify.patch
> new file mode 100644
> index 0000000000..acda8f1ce9
> --- /dev/null
> +++
> b/meta/recipes-connectivity/openssh/openssh/0001-systemd-Add-optional-sup=
port-for-systemd-sd_notify.patch
> @@ -0,0 +1,99 @@
> +From be187435911cde6cc3cef6982a508261074f1e56 Mon Sep 17 00:00:00 2001
> +From: Matt Jolly <Matt.Jolly@footclan.ninja>
> +Date: Thu, 2 Feb 2023 21:05:40 +1100
> +Subject: [PATCH] systemd: Add optional support for systemd `sd_notify`
> +
> +This is a rebase of Dennis Lamm's <expeditioneer@gentoo.org>
> +patch based on Jakub Jelen's <jjelen@redhat.com> original patch
> +
> +Upstream-Status: Submitted [
> https://github.com/openssh/openssh-portable/pull/375/commits/be187435911c=
de6cc3cef6982a508261074f1e56
> ]
> +
> +Signed-off-by: Xiangyu Chen <xiangyu.chen@windriver.com>
> +---
> + configure.ac | 24 ++++++++++++++++++++++++
> + sshd.c       | 13 +++++++++++++
> + 2 files changed, 37 insertions(+)
> +
> +diff --git a/configure.ac b/configure.ac
> +index 22fee70f..486c189f 100644
> +--- a/configure.ac
> ++++ b/configure.ac
> +@@ -4835,6 +4835,29 @@ AC_SUBST([GSSLIBS])
> + AC_SUBST([K5LIBS])
> + AC_SUBST([CHANNELLIBS])
> +
> ++# Check whether user wants systemd support
> ++SYSTEMD_MSG=3D"no"
> ++AC_ARG_WITH(systemd,
> ++      [  --with-systemd          Enable systemd support],
> ++      [ if test "x$withval" !=3D "xno" ; then
> ++              AC_PATH_TOOL([PKGCONFIG], [pkg-config], [no])
> ++              if test "$PKGCONFIG" !=3D "no"; then
> ++                      AC_MSG_CHECKING([for libsystemd])
> ++                      if $PKGCONFIG --exists libsystemd; then
> ++                              SYSTEMD_CFLAGS=3D`$PKGCONFIG --cflags
> libsystemd`
> ++                              SYSTEMD_LIBS=3D`$PKGCONFIG --libs libsyst=
emd`
> ++                              CPPFLAGS=3D"$CPPFLAGS $SYSTEMD_CFLAGS"
> ++                              SSHDLIBS=3D"$SSHDLIBS $SYSTEMD_LIBS"
> ++                              AC_MSG_RESULT([yes])
> ++                              AC_DEFINE(HAVE_SYSTEMD, 1, [Define if you
> want systemd support.])
> ++                              SYSTEMD_MSG=3D"yes"
> ++                      else
> ++                              AC_MSG_RESULT([no])
> ++                      fi
> ++              fi
> ++      fi ]
> ++)
> ++
> + # Looking for programs, paths and files
> +
> + PRIVSEP_PATH=3D/var/empty
> +@@ -5634,6 +5657,7 @@ echo "                   libldns support: $LDNS_MS=
G"
> + echo "  Solaris process contract support: $SPC_MSG"
> + echo "           Solaris project support: $SP_MSG"
> + echo "         Solaris privilege support: $SPP_MSG"
> ++echo "                   systemd support: $SYSTEMD_MSG"
> + echo "       IP address in \$DISPLAY hack: $DISPLAY_HACK_MSG"
> + echo "           Translate v4 in v6 hack: $IPV4_IN6_HACK_MSG"
> + echo "                  BSD Auth support: $BSD_AUTH_MSG"
> +diff --git a/sshd.c b/sshd.c
> +index 6321936c..859d6a0b 100644
> +--- a/sshd.c
> ++++ b/sshd.c
> +@@ -88,6 +88,10 @@
> + #include <prot.h>
> + #endif
> +
> ++#ifdef HAVE_SYSTEMD
> ++#include <systemd/sd-daemon.h>
> ++#endif
> ++
> + #include "xmalloc.h"
> + #include "ssh.h"
> + #include "ssh2.h"
> +@@ -310,6 +314,10 @@ static void
> + sighup_restart(void)
> + {
> +       logit("Received SIGHUP; restarting.");
> ++#ifdef HAVE_SYSTEMD
> ++      /* Signal systemd that we are reloading */
> ++      sd_notify(0, "RELOADING=3D1");
> ++#endif
> +       if (options.pid_file !=3D NULL)
> +               unlink(options.pid_file);
> +       platform_pre_restart();
> +@@ -2086,6 +2094,11 @@ main(int ac, char **av)
> +                       }
> +               }
> +
> ++#ifdef HAVE_SYSTEMD
> ++              /* Signal systemd that we are ready to accept connections
> */
> ++              sd_notify(0, "READY=3D1");
> ++#endif
> ++
> +               /* Accept a connection and return in a forked child */
> +               server_accept_loop(&sock_in, &sock_out,
> +                   &newsock, config_s);
> +--
> +2.25.1
> +
> diff --git a/meta/recipes-connectivity/openssh/openssh_9.5p1.bb
> b/meta/recipes-connectivity/openssh/openssh_9.5p1.bb
> index 3a94633cf0..bbb8fb091a 100644
> --- a/meta/recipes-connectivity/openssh/openssh_9.5p1.bb
> +++ b/meta/recipes-connectivity/openssh/openssh_9.5p1.bb
> @@ -26,6 +26,7 @@ SRC_URI =3D "
> http://ftp.openbsd.org/pub/OpenBSD/OpenSSH/portable/openssh-${PV}.tar
>             file://sshd_check_keys \
>             file://add-test-support-for-busybox.patch \
>
> file://0001-regress-banner.sh-log-input-and-output-files-on-erro.patch \
> +
>  file://0001-systemd-Add-optional-support-for-systemd-sd_notify.patch \
>             "
>  SRC_URI[sha256sum] =3D
> "f026e7b79ba7fb540f75182af96dc8a8f1db395f922bbc9f6ca603672686086b"
>
> @@ -51,7 +52,8 @@ INITSCRIPT_PARAMS:${PN}-sshd =3D "defaults 9"
>  SYSTEMD_PACKAGES =3D "${PN}-sshd"
>  SYSTEMD_SERVICE:${PN}-sshd =3D "sshd.socket sshd.service"
>
> -inherit autotools-brokensep ptest
> +inherit autotools-brokensep ptest pkgconfig
> +DEPENDS +=3D "${@bb.utils.contains('DISTRO_FEATURES', 'systemd', 'system=
d',
> '', d)}"
>

The DEPENDS is not need as it was added by the PACKAGECONFIG[systemd]


>
>  PACKAGECONFIG ??=3D ""
>  PACKAGECONFIG[kerberos] =3D "--with-kerberos5,--without-kerberos5,krb5"
>

PACKAGECONFIG ??=3D "${@bb.utils.filter('DISTRO_FEATURES', 'systemd', d)}"
PACKAGECONFIG[systemd] =3D "--with-systemd,--without-systemd,systemd"

@@ -69,6 +71,7 @@ EXTRA_OECONF =3D "'LOGIN_PROGRAM=3D${base_bindir}/login' =
\
>                  --sysconfdir=3D${sysconfdir}/ssh \
>                  --with-xauth=3D${bindir}/xauth \
>                  --disable-strip \
> +                ${@bb.utils.contains('DISTRO_FEATURES', 'systemd',
> '--with-systemd', '--without-systemd', d)} \
>

This is not need as it was added by the PACKAGECONFIG[systemd]

                 "
>
>  # musl doesn't implement wtmp/utmp and logwtmp
> --
> 2.25.1
>
>
> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
> Links: You receive all messages sent to this group.
> View/Reply Online (#190553):
> https://lists.openembedded.org/g/openembedded-core/message/190553
> Mute This Topic: https://lists.openembedded.org/mt/102599570/5052612
> Group Owner: openembedded-core+owner@lists.openembedded.org
> Unsubscribe: https://lists.openembedded.org/g/openembedded-core/unsub [
> quaresma.jose@gmail.com]
> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
>
>

--=20
Best regards,

Jos=C3=A9 Quaresma

--00000000000022f3ad060a3046dd
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div>Hi Xiangyu,<br><br>I believe=C2=A0the recipe patch ca=
n be shrinking=C2=A0to a new PACKAGECONFIG line,</div><div>comments=C2=A0in=
line.<br><br>Jose</div><br><div class=3D"gmail_quote"><div dir=3D"ltr" clas=
s=3D"gmail_attr">Xiangyu Chen &lt;<a href=3D"mailto:xiangyu.chen@eng.windri=
ver.com">xiangyu.chen@eng.windriver.com</a>&gt; escreveu no dia quarta, 15/=
11/2023 =C3=A0(s) 04:30:<br></div><blockquote class=3D"gmail_quote" style=
=3D"margin:0px 0px 0px 0.8ex;border-left:1px solid rgb(204,204,204);padding=
-left:1ex">From: Xiangyu Chen &lt;<a href=3D"mailto:xiangyu.chen@windriver.=
com" target=3D"_blank">xiangyu.chen@windriver.com</a>&gt;<br>
<br>
The sshd keeps on terminating and restarting in servel minutes, we can obse=
rve<br>
log from journalctl that the sshd was killed by systemd with signal 15:<br>
<br>
=C2=A0 =C2=A0 systemd[1]: sshd.service start operation timed out. Terminati=
ng.<br>
=C2=A0 =C2=A0 sshd[374]: Received signal 15; terminating.<br>
<br>
When the sshd as a systemd service, it need to tell systemd with a &quot;RE=
ADY&quot; status,<br>
and when it is restarted, it need to tell systemd with a &quot;RELOADING&qu=
ot; status, otherwise,<br>
systemd would treat it as failing service and restart it again.<br>
<br>
Taken a patch from openssh upstream PR[1], that after using a signal to tel=
l systemd<br>
it is ready or reload now.<br>
<br>
Ref:<br>
[1] <a href=3D"https://github.com/openssh/openssh-portable/pull/375/commits=
/be187435911cde6cc3cef6982a508261074f1e56" rel=3D"noreferrer" target=3D"_bl=
ank">https://github.com/openssh/openssh-portable/pull/375/commits/be1874359=
11cde6cc3cef6982a508261074f1e56</a><br>
<br>
Signed-off-by: Xiangyu Chen &lt;<a href=3D"mailto:xiangyu.chen@windriver.co=
m" target=3D"_blank">xiangyu.chen@windriver.com</a>&gt;<br>
---<br>
=C2=A0...tional-support-for-systemd-sd_notify.patch | 99 ++++++++++++++++++=
+<br>
=C2=A0.../openssh/<a href=3D"http://openssh_9.5p1.bb" rel=3D"noreferrer" ta=
rget=3D"_blank">openssh_9.5p1.bb</a>=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 |=C2=A0 5 +-<br>
=C2=A02 files changed, 103 insertions(+), 1 deletion(-)<br>
=C2=A0create mode 100644 meta/recipes-connectivity/openssh/openssh/0001-sys=
temd-Add-optional-support-for-systemd-sd_notify.patch<br>
<br>
diff --git a/meta/recipes-connectivity/openssh/openssh/0001-systemd-Add-opt=
ional-support-for-systemd-sd_notify.patch b/meta/recipes-connectivity/opens=
sh/openssh/0001-systemd-Add-optional-support-for-systemd-sd_notify.patch<br=
>
new file mode 100644<br>
index 0000000000..acda8f1ce9<br>
--- /dev/null<br>
+++ b/meta/recipes-connectivity/openssh/openssh/0001-systemd-Add-optional-s=
upport-for-systemd-sd_notify.patch<br>
@@ -0,0 +1,99 @@<br>
+From be187435911cde6cc3cef6982a508261074f1e56 Mon Sep 17 00:00:00 2001<br>
+From: Matt Jolly &lt;Matt.Jolly@footclan.ninja&gt;<br>
+Date: Thu, 2 Feb 2023 21:05:40 +1100<br>
+Subject: [PATCH] systemd: Add optional support for systemd `sd_notify`<br>
+<br>
+This is a rebase of Dennis Lamm&#39;s &lt;<a href=3D"mailto:expeditioneer@=
gentoo.org" target=3D"_blank">expeditioneer@gentoo.org</a>&gt;<br>
+patch based on Jakub Jelen&#39;s &lt;<a href=3D"mailto:jjelen@redhat.com" =
target=3D"_blank">jjelen@redhat.com</a>&gt; original patch<br>
+<br>
+Upstream-Status: Submitted [<a href=3D"https://github.com/openssh/openssh-=
portable/pull/375/commits/be187435911cde6cc3cef6982a508261074f1e56" rel=3D"=
noreferrer" target=3D"_blank">https://github.com/openssh/openssh-portable/p=
ull/375/commits/be187435911cde6cc3cef6982a508261074f1e56</a>]<br>
+<br>
+Signed-off-by: Xiangyu Chen &lt;<a href=3D"mailto:xiangyu.chen@windriver.c=
om" target=3D"_blank">xiangyu.chen@windriver.com</a>&gt;<br>
+---<br>
+ <a href=3D"http://configure.ac" rel=3D"noreferrer" target=3D"_blank">conf=
igure.ac</a> | 24 ++++++++++++++++++++++++<br>
+ sshd.c=C2=A0 =C2=A0 =C2=A0 =C2=A0| 13 +++++++++++++<br>
+ 2 files changed, 37 insertions(+)<br>
+<br>
+diff --git a/<a href=3D"http://configure.ac" rel=3D"noreferrer" target=3D"=
_blank">configure.ac</a> b/<a href=3D"http://configure.ac" rel=3D"noreferre=
r" target=3D"_blank">configure.ac</a><br>
+index 22fee70f..486c189f 100644<br>
+--- a/<a href=3D"http://configure.ac" rel=3D"noreferrer" target=3D"_blank"=
>configure.ac</a><br>
++++ b/<a href=3D"http://configure.ac" rel=3D"noreferrer" target=3D"_blank"=
>configure.ac</a><br>
+@@ -4835,6 +4835,29 @@ AC_SUBST([GSSLIBS])<br>
+ AC_SUBST([K5LIBS])<br>
+ AC_SUBST([CHANNELLIBS])<br>
+ <br>
++# Check whether user wants systemd support<br>
++SYSTEMD_MSG=3D&quot;no&quot;<br>
++AC_ARG_WITH(systemd,<br>
++=C2=A0 =C2=A0 =C2=A0 [=C2=A0 --with-systemd=C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 Enable systemd support],<br>
++=C2=A0 =C2=A0 =C2=A0 [ if test &quot;x$withval&quot; !=3D &quot;xno&quot;=
 ; then<br>
++=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 AC_PATH_TOOL([PKGCONFIG]=
, [pkg-config], [no])<br>
++=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 if test &quot;$PKGCONFIG=
&quot; !=3D &quot;no&quot;; then<br>
++=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 AC_MSG_CHECKING([for libsystemd])<br>
++=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 if $PKGCONFIG --exists libsystemd; then<br>
++=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 SYSTEMD_CFLAGS=3D`$PKGCONFIG --cflags libsy=
stemd`<br>
++=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 SYSTEMD_LIBS=3D`$PKGCONFIG --libs libsystem=
d`<br>
++=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 CPPFLAGS=3D&quot;$CPPFLAGS $SYSTEMD_CFLAGS&=
quot;<br>
++=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 SSHDLIBS=3D&quot;$SSHDLIBS $SYSTEMD_LIBS&qu=
ot;<br>
++=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 AC_MSG_RESULT([yes])<br>
++=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 AC_DEFINE(HAVE_SYSTEMD, 1, [Define if you w=
ant systemd support.])<br>
++=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 SYSTEMD_MSG=3D&quot;yes&quot;<br>
++=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 else<br>
++=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 AC_MSG_RESULT([no])<br>
++=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 fi<br>
++=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 fi<br>
++=C2=A0 =C2=A0 =C2=A0 fi ]<br>
++)<br>
++<br>
+ # Looking for programs, paths and files<br>
+ <br>
+ PRIVSEP_PATH=3D/var/empty<br>
+@@ -5634,6 +5657,7 @@ echo &quot;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 =C2=A0 =C2=A0 =C2=A0 =C2=A0libldns support: $LDNS_MSG&quot;<br>
+ echo &quot;=C2=A0 Solaris process contract support: $SPC_MSG&quot;<br>
+ echo &quot;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0Solaris project suppo=
rt: $SP_MSG&quot;<br>
+ echo &quot;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0Solaris privilege support: $=
SPP_MSG&quot;<br>
++echo &quot;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 =C2=A0systemd support: $SYSTEMD_MSG&quot;<br>
+ echo &quot;=C2=A0 =C2=A0 =C2=A0 =C2=A0IP address in \$DISPLAY hack: $DISP=
LAY_HACK_MSG&quot;<br>
+ echo &quot;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0Translate v4 in v6 ha=
ck: $IPV4_IN6_HACK_MSG&quot;<br>
+ echo &quot;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 BSD Auth support: $BSD_AUTH_MSG&quot;<br>
+diff --git a/sshd.c b/sshd.c<br>
+index 6321936c..859d6a0b 100644<br>
+--- a/sshd.c<br>
++++ b/sshd.c<br>
+@@ -88,6 +88,10 @@<br>
+ #include &lt;prot.h&gt;<br>
+ #endif<br>
+ <br>
++#ifdef HAVE_SYSTEMD<br>
++#include &lt;systemd/sd-daemon.h&gt;<br>
++#endif<br>
++<br>
+ #include &quot;xmalloc.h&quot;<br>
+ #include &quot;ssh.h&quot;<br>
+ #include &quot;ssh2.h&quot;<br>
+@@ -310,6 +314,10 @@ static void<br>
+ sighup_restart(void)<br>
+ {<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0logit(&quot;Received SIGHUP; restarting.&quot;)=
;<br>
++#ifdef HAVE_SYSTEMD<br>
++=C2=A0 =C2=A0 =C2=A0 /* Signal systemd that we are reloading */<br>
++=C2=A0 =C2=A0 =C2=A0 sd_notify(0, &quot;RELOADING=3D1&quot;);<br>
++#endif<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0if (options.pid_file !=3D NULL)<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0unlink(options.pid_=
file);<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0platform_pre_restart();<br>
+@@ -2086,6 +2094,11 @@ main(int ac, char **av)<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0}<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0}<br>
+ <br>
++#ifdef HAVE_SYSTEMD<br>
++=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 /* Signal systemd that w=
e are ready to accept connections */<br>
++=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 sd_notify(0, &quot;READY=
=3D1&quot;);<br>
++#endif<br>
++<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0/* Accept a connect=
ion and return in a forked child */<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0server_accept_loop(=
&amp;sock_in, &amp;sock_out,<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0&amp;=
newsock, config_s);<br>
+-- <br>
+2.25.1<br>
+<br>
diff --git a/meta/recipes-connectivity/openssh/<a href=3D"http://openssh_9.=
5p1.bb" rel=3D"noreferrer" target=3D"_blank">openssh_9.5p1.bb</a> b/meta/re=
cipes-connectivity/openssh/<a href=3D"http://openssh_9.5p1.bb" rel=3D"noref=
errer" target=3D"_blank">openssh_9.5p1.bb</a><br>
index 3a94633cf0..bbb8fb091a 100644<br>
--- a/meta/recipes-connectivity/openssh/<a href=3D"http://openssh_9.5p1.bb"=
 rel=3D"noreferrer" target=3D"_blank">openssh_9.5p1.bb</a><br>
+++ b/meta/recipes-connectivity/openssh/<a href=3D"http://openssh_9.5p1.bb"=
 rel=3D"noreferrer" target=3D"_blank">openssh_9.5p1.bb</a><br>
@@ -26,6 +26,7 @@ SRC_URI =3D &quot;<a href=3D"http://ftp.openbsd.org/pub/O=
penBSD/OpenSSH/portable/openssh-$%7BPV%7D.tar" rel=3D"noreferrer" target=3D=
"_blank">http://ftp.openbsd.org/pub/OpenBSD/OpenSSH/portable/openssh-${PV}.=
tar</a><br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 file://sshd_check_keys \<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 file://add-test-support-for-busyb=
ox.patch \<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 file://0001-regress-banner.sh-log=
-input-and-output-files-on-erro.patch \<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0file://0001-systemd-Add-optional-=
support-for-systemd-sd_notify.patch \<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 &quot;<br>
=C2=A0SRC_URI[sha256sum] =3D &quot;f026e7b79ba7fb540f75182af96dc8a8f1db395f=
922bbc9f6ca603672686086b&quot;<br>
<br>
@@ -51,7 +52,8 @@ INITSCRIPT_PARAMS:${PN}-sshd =3D &quot;defaults 9&quot;<b=
r>
=C2=A0SYSTEMD_PACKAGES =3D &quot;${PN}-sshd&quot;<br>
=C2=A0SYSTEMD_SERVICE:${PN}-sshd =3D &quot;sshd.socket sshd.service&quot;<b=
r>
<br>
-inherit autotools-brokensep ptest<br>
+inherit autotools-brokensep ptest pkgconfig<br>
+DEPENDS +=3D &quot;${@bb.utils.contains(&#39;DISTRO_FEATURES&#39;, &#39;sy=
stemd&#39;, &#39;systemd&#39;, &#39;&#39;, d)}&quot;<br></blockquote><div><=
br>The DEPENDS is not need as it was added by the PACKAGECONFIG[systemd]<br=
>=C2=A0</div><blockquote class=3D"gmail_quote" style=3D"margin:0px 0px 0px =
0.8ex;border-left:1px solid rgb(204,204,204);padding-left:1ex">
<br>
=C2=A0PACKAGECONFIG ??=3D &quot;&quot;<br>
=C2=A0PACKAGECONFIG[kerberos] =3D &quot;--with-kerberos5,--without-kerberos=
5,krb5&quot;<br></blockquote><div>=C2=A0<br>PACKAGECONFIG ??=3D &quot;${@bb=
.utils.filter(&#39;DISTRO_FEATURES&#39;, &#39;systemd&#39;, d)}&quot;<br>PA=
CKAGECONFIG[systemd] =3D &quot;--with-systemd,--without-systemd,systemd&quo=
t;<br><br></div><blockquote class=3D"gmail_quote" style=3D"margin:0px 0px 0=
px 0.8ex;border-left:1px solid rgb(204,204,204);padding-left:1ex">
@@ -69,6 +71,7 @@ EXTRA_OECONF =3D &quot;&#39;LOGIN_PROGRAM=3D${base_bindir=
}/login&#39; \<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0--sysconfdir=
=3D${sysconfdir}/ssh \<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0--with-xauth=
=3D${bindir}/xauth \<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0--disable-str=
ip \<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 ${@bb.utils.contai=
ns(&#39;DISTRO_FEATURES&#39;, &#39;systemd&#39;, &#39;--with-systemd&#39;, =
&#39;--without-systemd&#39;, d)} \<br></blockquote><div><br>This is not nee=
d as it was added by the PACKAGECONFIG[systemd]<br><br></div><blockquote cl=
ass=3D"gmail_quote" style=3D"margin:0px 0px 0px 0.8ex;border-left:1px solid=
 rgb(204,204,204);padding-left:1ex">
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0&quot;<br>
<br>
=C2=A0# musl doesn&#39;t implement wtmp/utmp and logwtmp<br>
-- <br>
2.25.1<br>
<br>
<br>
-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-<br>
Links: You receive all messages sent to this group.<br>
View/Reply Online (#190553): <a href=3D"https://lists.openembedded.org/g/op=
enembedded-core/message/190553" rel=3D"noreferrer" target=3D"_blank">https:=
//lists.openembedded.org/g/openembedded-core/message/190553</a><br>
Mute This Topic: <a href=3D"https://lists.openembedded.org/mt/102599570/505=
2612" rel=3D"noreferrer" target=3D"_blank">https://lists.openembedded.org/m=
t/102599570/5052612</a><br>
Group Owner: <a href=3D"mailto:openembedded-core%2Bowner@lists.openembedded=
.org" target=3D"_blank">openembedded-core+owner@lists.openembedded.org</a><=
br>
Unsubscribe: <a href=3D"https://lists.openembedded.org/g/openembedded-core/=
unsub" rel=3D"noreferrer" target=3D"_blank">https://lists.openembedded.org/=
g/openembedded-core/unsub</a> [<a href=3D"mailto:quaresma.jose@gmail.com" t=
arget=3D"_blank">quaresma.jose@gmail.com</a>]<br>
-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-<br>
<br>
</blockquote></div><br clear=3D"all"><div><br></div><span class=3D"gmail_si=
gnature_prefix">-- </span><br><div dir=3D"ltr" class=3D"gmail_signature"><d=
iv dir=3D"ltr">Best regards,<div><br>Jos=C3=A9 Quaresma</div></div></div></=
div>

--00000000000022f3ad060a3046dd--

