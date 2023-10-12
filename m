Return-Path: <alex.kanavin@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id C632FCDB482
	for <webhook@archiver.kernel.org>; Thu, 12 Oct 2023 15:15:52 +0000 (UTC)
Received: from mail-lj1-f173.google.com (mail-lj1-f173.google.com [209.85.208.173])
 by mx.groups.io with SMTP id smtpd.web10.14682.1697123749189209822
 for <openembedded-core@lists.openembedded.org>;
 Thu, 12 Oct 2023 08:15:49 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=C1iffjUg;
 spf=pass (domain: gmail.com, ip: 209.85.208.173, mailfrom: alex.kanavin@gmail.com)
Received: by mail-lj1-f173.google.com with SMTP id 38308e7fff4ca-2bffc55af02so12792681fa.2
        for <openembedded-core@lists.openembedded.org>; Thu, 12 Oct 2023 08:15:48 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1697123747; x=1697728547; darn=lists.openembedded.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=O42iYFLN5qqos8fbdzzVjiH/7WSrjWi83cmjSNmUXHw=;
        b=C1iffjUgnoXkBn+EY8YG7JBtSvnpM92WoieW4mjGkVSpEUdWXMTDlYYaIS6IavQ9dp
         Qoj1ltxrPRbMwVuz1cX2du1nRzPic8aaBpYmX+MN53lU7teDwy4NwR4jhIOACUO7gXxq
         b+LWbM/dasUg9diXkC73qtFw4fXDTVLGyB4eUApyVCOZsaKkTk9PwQAe9k5yhOO5DF5N
         Gm0B7ln+CJN9oK6FeaNmBNIEgq0uU/aCUXcHHBiIsfunQPjQORvTeQw6bzSfJXimDNLw
         wyqwkYR4kUkaC2cO0lxPKukfsvpZ2czjZvztoMCUDi+O9YgNHaV3i5MpJSZmk4BLspyX
         RLXQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1697123747; x=1697728547;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=O42iYFLN5qqos8fbdzzVjiH/7WSrjWi83cmjSNmUXHw=;
        b=I7+8iWskeX3HMCRNR6+PzkYyUYlvwdiCbyE9MaMZMGLTA55mH0HKUr29yNiV1BDjp7
         5kF2KwnGUv7VAmcnHNsRsIDtwaMjFF8zzkzXVyaB16u3ZONZYIK96/nlz87NrSSCujLR
         P30gmVY1Q7yEbDufqIWcXB6OHyWkEQH4G19TrJLzGZaE5Saz1657jjK5OTHQ8wLHHKJo
         o0e7eWW/OBGcbSDca8S3zwvU0j0xN7kDm9dZh+4U1ebx6jbyPNnErlW5SIGzYmOe1fob
         IO8S7Shq3qTQt6Jq5D2TXvzlaJgjIAPuOnpKlybSCi/VdaLE4AHqpMHYzVZnAzrwjtJN
         VvDw==
X-Gm-Message-State: AOJu0YzDjAtx/2QSzJmfA/Kcg55/I8LfmPgrop3lziXZ2x9gAMLIqEZk
	aqbWYKepoC8rPLMd62fMIVKL+Kr+qiifFCjjfq4=
X-Google-Smtp-Source: AGHT+IEFzRl0bv/SVhwMufqmp1T3gIQTuoWEahAtHoAJ2giluVDRSsRvGrlzoUaadTvCnkcc1YT1o25P6IpGDN7IClE=
X-Received: by 2002:a05:651c:447:b0:2b6:dc55:c3c7 with SMTP id
 g7-20020a05651c044700b002b6dc55c3c7mr23775137ljg.20.1697123746935; Thu, 12
 Oct 2023 08:15:46 -0700 (PDT)
MIME-Version: 1.0
References: <64a7ca1412df4f236a8416ef4d3c0f1dc3208d1d.1697122532.git.joerg.sommer@navimatix.de>
In-Reply-To: <64a7ca1412df4f236a8416ef4d3c0f1dc3208d1d.1697122532.git.joerg.sommer@navimatix.de>
From: Alexander Kanavin <alex.kanavin@gmail.com>
Date: Thu, 12 Oct 2023 17:15:36 +0200
Message-ID: <CANNYZj8VMf1-AJmVQTyUgd2SC0BDPWdw5As0Nw5J0a0swun3mA@mail.gmail.com>
Subject: Re: [OE-core] [PATCH v2] libtirpc: Support ipv6 in DISTRO_FEATURES
To: joerg.sommer@navimatix.de
Cc: openembedded-core@lists.openembedded.org
Content-Type: multipart/alternative; boundary="000000000000137ad00607866a31"
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 12 Oct 2023 15:15:52 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/189005

--000000000000137ad00607866a31
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Thanks!

Alex

On Thu 12. Oct 2023 at 16.56, J=C3=B6rg Sommer via lists.openembedded.org
<joerg.sommer=3Dnavimatix.de@lists.openembedded.org> wrote:

> If the ipv6 feature for the distribution is not set, the package should n=
ot
> contain settings for ipv6. This makes rpcbind doesn't try to bind to a IP=
v6
> socket, and complain that this fails.
>
> Signed-off-by: J=C3=B6rg Sommer <joerg.sommer@navimatix.de>
> ---
>  .../libtirpc/libtirpc/ipv6.patch              | 52 +++++++++++++++++++
>  .../libtirpc/libtirpc_1.3.2.bb                |  6 +++
>  2 files changed, 58 insertions(+)
>  create mode 100644 meta/recipes-extended/libtirpc/libtirpc/ipv6.patch
>
> diff --git a/meta/recipes-extended/libtirpc/libtirpc/ipv6.patch
> b/meta/recipes-extended/libtirpc/libtirpc/ipv6.patch
> new file mode 100644
> index 0000000000..f746f986f4
> --- /dev/null
> +++ b/meta/recipes-extended/libtirpc/libtirpc/ipv6.patch
> @@ -0,0 +1,52 @@
> +From 077bbd32e8b7474dc5f153997732e1e6aec7fad6 Mon Sep 17 00:00:00 2001
> +Message-Id: <
> 077bbd32e8b7474dc5f153997732e1e6aec7fad6.1697120796.git.joerg.sommer@navi=
matix.de
> >
> +From: =3D?UTF-8?q?J=3DC3=3DB6rg=3D20Sommer?=3D <joerg.sommer@navimatix.d=
e>
> +Date: Thu, 12 Oct 2023 16:22:59 +0200
> +Subject: [PATCH] netconfig: remove tcp6, udp6 on --disable-ipv6
> +MIME-Version: 1.0
> +Content-Type: text/plain; charset=3DUTF-8
> +Content-Transfer-Encoding: 8bit
> +
> +If the configuration for IPv6 is disabled, the netconfig should not
> contain
> +settings for tcp6 and udp6.
> +
> +The test for the configure option didn't work, because it check the wron=
g
> +variable.
> +
> +Signed-off-by: J=C3=B6rg Sommer <joerg.sommer@navimatix.de>
> +Upstream-Status: Submitted [libtirpc-devel@lists.sourceforge.net]
> +Upstream-Status: Submitted [linux-nfs@vger.kernel.org]
> +---
> + configure.ac    | 2 +-
> + doc/Makefile.am | 5 +++++
> + 2 files changed, 6 insertions(+), 1 deletion(-)
> +
> +diff --git a/configure.ac b/configure.ac
> +index fe6c517..b687f8d 100644
> +--- a/configure.ac
> ++++ b/configure.ac
> +@@ -64,7 +64,7 @@ fi
> + AC_ARG_ENABLE(ipv6,
> +       [AC_HELP_STRING([--disable-ipv6], [Disable IPv6 support
> @<:@default=3Dno@:>@])],
> +       [],[enable_ipv6=3Dyes])
> +-AM_CONDITIONAL(INET6, test "x$disable_ipv6" !=3D xno)
> ++AM_CONDITIONAL(INET6, test "x$enable_ipv6" !=3D xno)
> + if test "x$enable_ipv6" !=3D xno; then
> +       AC_DEFINE(INET6, 1, [Define to 1 if IPv6 is available])
> + fi
> +diff --git a/doc/Makefile.am b/doc/Makefile.am
> +index d42ab90..b9678f6 100644
> +--- a/doc/Makefile.am
> ++++ b/doc/Makefile.am
> +@@ -2,3 +2,8 @@ dist_sysconf_DATA      =3D netconfig bindresvport.blackl=
ist
> +
> + CLEANFILES           =3D cscope.* *~
> + DISTCLEANFILES               =3D Makefile.in
> ++
> ++if ! INET6
> ++install-exec-hook:
> ++      $(SED) -i '/^tcp6\|^udp6/d' "$(DESTDIR)$(sysconfdir)"/netconfig
> ++endif
> +--
> +2.34.1
> +
> diff --git a/meta/recipes-extended/libtirpc/libtirpc_1.3.2.bb
> b/meta/recipes-extended/libtirpc/libtirpc_1.3.2.bb
> index 6980135a92..dca5a964a8 100644
> --- a/meta/recipes-extended/libtirpc/libtirpc_1.3.2.bb
> +++ b/meta/recipes-extended/libtirpc/libtirpc_1.3.2.bb
> @@ -11,6 +11,7 @@ PROVIDES =3D "virtual/librpc"
>
>  SRC_URI =3D "${SOURCEFORGE_MIRROR}/${BPN}/${BP}.tar.bz2 \
>            file://CVE-2021-46828.patch \
> +          file://ipv6.patch \
>           "
>  UPSTREAM_CHECK_URI =3D "
> https://sourceforge.net/projects/libtirpc/files/libtirpc/"
>  UPSTREAM_CHECK_REGEX =3D "(?P<pver>\d+(\.\d+)+)/"
> @@ -20,6 +21,11 @@ inherit autotools pkgconfig
>
>  EXTRA_OECONF =3D "--disable-gssapi"
>
> +PACKAGECONFIG ??=3D " \
> +    ${@bb.utils.filter('DISTRO_FEATURES', 'ipv6', d)} \
> +"
> +PACKAGECONFIG[ipv6] =3D "--enable-ipv6,--disable-ipv6"
> +
>  do_install:append() {
>         test -e ${D}${sysconfdir}/netconfig && chown root:root
> ${D}${sysconfdir}/netconfig
>  }
> --
> 2.34.1
>
>
> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
> Links: You receive all messages sent to this group.
> View/Reply Online (#189004):
> https://lists.openembedded.org/g/openembedded-core/message/189004
> Mute This Topic: https://lists.openembedded.org/mt/101919607/1686489
> Group Owner: openembedded-core+owner@lists.openembedded.org
> Unsubscribe: https://lists.openembedded.org/g/openembedded-core/unsub [
> alex.kanavin@gmail.com]
> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
>
>

--000000000000137ad00607866a31
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"auto">Thanks!</div><div dir=3D"auto"><br></div><div dir=3D"auto=
">Alex</div><div><br><div class=3D"gmail_quote"><div dir=3D"ltr" class=3D"g=
mail_attr">On Thu 12. Oct 2023 at 16.56, J=C3=B6rg Sommer via <a href=3D"ht=
tp://lists.openembedded.org">lists.openembedded.org</a> &lt;joerg.sommer=3D=
<a href=3D"mailto:navimatix.de@lists.openembedded.org">navimatix.de@lists.o=
penembedded.org</a>&gt; wrote:<br></div><blockquote class=3D"gmail_quote" s=
tyle=3D"margin:0px 0px 0px 0.8ex;border-left-width:1px;border-left-style:so=
lid;padding-left:1ex;border-left-color:rgb(204,204,204)">If the ipv6 featur=
e for the distribution is not set, the package should not<br>
contain settings for ipv6. This makes rpcbind doesn&#39;t try to bind to a =
IPv6<br>
socket, and complain that this fails.<br>
<br>
Signed-off-by: J=C3=B6rg Sommer &lt;<a href=3D"mailto:joerg.sommer@navimati=
x.de" target=3D"_blank">joerg.sommer@navimatix.de</a>&gt;<br>
---<br>
=C2=A0.../libtirpc/libtirpc/ipv6.patch=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 | 52 +++++++++++++++++++<br>
=C2=A0.../libtirpc/<a href=3D"http://libtirpc_1.3.2.bb" rel=3D"noreferrer" =
target=3D"_blank">libtirpc_1.3.2.bb</a>=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 |=C2=A0 6 +++<br>
=C2=A02 files changed, 58 insertions(+)<br>
=C2=A0create mode 100644 meta/recipes-extended/libtirpc/libtirpc/ipv6.patch=
<br>
<br>
diff --git a/meta/recipes-extended/libtirpc/libtirpc/ipv6.patch b/meta/reci=
pes-extended/libtirpc/libtirpc/ipv6.patch<br>
new file mode 100644<br>
index 0000000000..f746f986f4<br>
--- /dev/null<br>
+++ b/meta/recipes-extended/libtirpc/libtirpc/ipv6.patch<br>
@@ -0,0 +1,52 @@<br>
+From 077bbd32e8b7474dc5f153997732e1e6aec7fad6 Mon Sep 17 00:00:00 2001<br>
+Message-Id: &lt;<a href=3D"mailto:077bbd32e8b7474dc5f153997732e1e6aec7fad6=
.1697120796.git.joerg.sommer@navimatix.de" target=3D"_blank">077bbd32e8b747=
4dc5f153997732e1e6aec7fad6.1697120796.git.joerg.sommer@navimatix.de</a>&gt;=
<br>
+From: =3D?UTF-8?q?J=3DC3=3DB6rg=3D20Sommer?=3D &lt;<a href=3D"mailto:joerg=
.sommer@navimatix.de" target=3D"_blank">joerg.sommer@navimatix.de</a>&gt;<b=
r>
+Date: Thu, 12 Oct 2023 16:22:59 +0200<br>
+Subject: [PATCH] netconfig: remove tcp6, udp6 on --disable-ipv6<br>
+MIME-Version: 1.0<br>
+Content-Type: text/plain; charset=3DUTF-8<br>
+Content-Transfer-Encoding: 8bit<br>
+<br>
+If the configuration for IPv6 is disabled, the netconfig should not contai=
n<br>
+settings for tcp6 and udp6.<br>
+<br>
+The test for the configure option didn&#39;t work, because it check the wr=
ong<br>
+variable.<br>
+<br>
+Signed-off-by: J=C3=B6rg Sommer &lt;<a href=3D"mailto:joerg.sommer@navimat=
ix.de" target=3D"_blank">joerg.sommer@navimatix.de</a>&gt;<br>
+Upstream-Status: Submitted [<a href=3D"mailto:libtirpc-devel@lists.sourcef=
orge.net" target=3D"_blank">libtirpc-devel@lists.sourceforge.net</a>]<br>
+Upstream-Status: Submitted [<a href=3D"mailto:linux-nfs@vger.kernel.org" t=
arget=3D"_blank">linux-nfs@vger.kernel.org</a>]<br>
+---<br>
+ <a href=3D"http://configure.ac" rel=3D"noreferrer" target=3D"_blank">conf=
igure.ac</a>=C2=A0 =C2=A0 | 2 +-<br>
+ doc/Makefile.am | 5 +++++<br>
+ 2 files changed, 6 insertions(+), 1 deletion(-)<br>
+<br>
+diff --git a/<a href=3D"http://configure.ac" rel=3D"noreferrer" target=3D"=
_blank">configure.ac</a> b/<a href=3D"http://configure.ac" rel=3D"noreferre=
r" target=3D"_blank">configure.ac</a><br>
+index fe6c517..b687f8d 100644<br>
+--- a/<a href=3D"http://configure.ac" rel=3D"noreferrer" target=3D"_blank"=
>configure.ac</a><br>
++++ b/<a href=3D"http://configure.ac" rel=3D"noreferrer" target=3D"_blank"=
>configure.ac</a><br>
+@@ -64,7 +64,7 @@ fi<br>
+ AC_ARG_ENABLE(ipv6,<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0[AC_HELP_STRING([--disable-ipv6], [Disable IPv6=
 support @&lt;:@default=3Dno@:&gt;@])],<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0[],[enable_ipv6=3Dyes])<br>
+-AM_CONDITIONAL(INET6, test &quot;x$disable_ipv6&quot; !=3D xno)<br>
++AM_CONDITIONAL(INET6, test &quot;x$enable_ipv6&quot; !=3D xno)<br>
+ if test &quot;x$enable_ipv6&quot; !=3D xno; then<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0AC_DEFINE(INET6, 1, [Define to 1 if IPv6 is ava=
ilable])<br>
+ fi<br>
+diff --git a/doc/Makefile.am b/doc/Makefile.am<br>
+index d42ab90..b9678f6 100644<br>
+--- a/doc/Makefile.am<br>
++++ b/doc/Makefile.am<br>
+@@ -2,3 +2,8 @@ dist_sysconf_DATA=C2=A0 =C2=A0 =C2=A0 =3D netconfig bindre=
svport.blacklist<br>
+ <br>
+ CLEANFILES=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=3D cscope.* *~<br>
+ DISTCLEANFILES=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=3D =
Makefile.in<br>
++<br>
++if ! INET6<br>
++install-exec-hook:<br>
++=C2=A0 =C2=A0 =C2=A0 $(SED) -i &#39;/^tcp6\|^udp6/d&#39; &quot;$(DESTDIR)=
$(sysconfdir)&quot;/netconfig<br>
++endif<br>
+-- <br>
+2.34.1<br>
+<br>
diff --git a/meta/recipes-extended/libtirpc/<a href=3D"http://libtirpc_1.3.=
2.bb" rel=3D"noreferrer" target=3D"_blank">libtirpc_1.3.2.bb</a> b/meta/rec=
ipes-extended/libtirpc/<a href=3D"http://libtirpc_1.3.2.bb" rel=3D"noreferr=
er" target=3D"_blank">libtirpc_1.3.2.bb</a><br>
index 6980135a92..dca5a964a8 100644<br>
--- a/meta/recipes-extended/libtirpc/<a href=3D"http://libtirpc_1.3.2.bb" r=
el=3D"noreferrer" target=3D"_blank">libtirpc_1.3.2.bb</a><br>
+++ b/meta/recipes-extended/libtirpc/<a href=3D"http://libtirpc_1.3.2.bb" r=
el=3D"noreferrer" target=3D"_blank">libtirpc_1.3.2.bb</a><br>
@@ -11,6 +11,7 @@ PROVIDES =3D &quot;virtual/librpc&quot;<br>
<br>
=C2=A0SRC_URI =3D &quot;${SOURCEFORGE_MIRROR}/${BPN}/${BP}.tar.bz2 \<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0file://CVE-2021-46828.patch \<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 file://ipv6.patch \<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 &quot;<br>
=C2=A0UPSTREAM_CHECK_URI =3D &quot;<a href=3D"https://sourceforge.net/proje=
cts/libtirpc/files/libtirpc/" rel=3D"noreferrer" target=3D"_blank">https://=
sourceforge.net/projects/libtirpc/files/libtirpc/</a>&quot;<br>
=C2=A0UPSTREAM_CHECK_REGEX =3D &quot;(?P&lt;pver&gt;\d+(\.\d+)+)/&quot;<br>
@@ -20,6 +21,11 @@ inherit autotools pkgconfig<br>
<br>
=C2=A0EXTRA_OECONF =3D &quot;--disable-gssapi&quot;<br>
<br>
+PACKAGECONFIG ??=3D &quot; \<br>
+=C2=A0 =C2=A0 ${@bb.utils.filter(&#39;DISTRO_FEATURES&#39;, &#39;ipv6&#39;=
, d)} \<br>
+&quot;<br>
+PACKAGECONFIG[ipv6] =3D &quot;--enable-ipv6,--disable-ipv6&quot;<br>
+<br>
=C2=A0do_install:append() {<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 test -e ${D}${sysconfdir}/netconfig &amp;&amp; =
chown root:root ${D}${sysconfdir}/netconfig<br>
=C2=A0}<br>
-- <br>
2.34.1<br>
<br>
<br>
-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-<br>
Links: You receive all messages sent to this group.<br>
View/Reply Online (#189004): <a href=3D"https://lists.openembedded.org/g/op=
enembedded-core/message/189004" rel=3D"noreferrer" target=3D"_blank">https:=
//lists.openembedded.org/g/openembedded-core/message/189004</a><br>
Mute This Topic: <a href=3D"https://lists.openembedded.org/mt/101919607/168=
6489" rel=3D"noreferrer" target=3D"_blank">https://lists.openembedded.org/m=
t/101919607/1686489</a><br>
Group Owner: <a href=3D"mailto:openembedded-core%2Bowner@lists.openembedded=
.org" target=3D"_blank">openembedded-core+owner@lists.openembedded.org</a><=
br>
Unsubscribe: <a href=3D"https://lists.openembedded.org/g/openembedded-core/=
unsub" rel=3D"noreferrer" target=3D"_blank">https://lists.openembedded.org/=
g/openembedded-core/unsub</a> [<a href=3D"mailto:alex.kanavin@gmail.com" ta=
rget=3D"_blank">alex.kanavin@gmail.com</a>]<br>
-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-<br>
<br>
</blockquote></div></div>

--000000000000137ad00607866a31--

