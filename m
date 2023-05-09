Return-Path: <quaresma.jose@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id CDF5EC7EE22
	for <webhook@archiver.kernel.org>; Tue,  9 May 2023 17:09:43 +0000 (UTC)
Received: from mail-vs1-f51.google.com (mail-vs1-f51.google.com [209.85.217.51])
 by mx.groups.io with SMTP id smtpd.web10.38814.1683652181597682184
 for <openembedded-core@lists.openembedded.org>;
 Tue, 09 May 2023 10:09:41 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="signature has expired" header.i=@gmail.com header.s=20221208 header.b=QUhfb/hB;
 spf=pass (domain: gmail.com, ip: 209.85.217.51, mailfrom: quaresma.jose@gmail.com)
Received: by mail-vs1-f51.google.com with SMTP id ada2fe7eead31-43479152cd0so1636897137.1
        for <openembedded-core@lists.openembedded.org>; Tue, 09 May 2023 10:09:41 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20221208; t=1683652180; x=1686244180;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=PeQT+26lJLbbPbCbIWKzze/adQNYPigOnarKyQspzt8=;
        b=QUhfb/hBwsHTP4gjK3Roypo2Ub9oFdtJt1z7agt/efVL3r9Y7RNIQOpNq6Vn82JLQ+
         p03j2Kv1IpVz/WPmJVK3H2PLV/AeyJ9L8hb6JogK6LvTTiGvhN7UmkRzxsc56AYYF0XJ
         G/FyB7ZBVQZNA8js5j44jgi2IvaJYtcNqoRRxiexjgJhHU919jMbjGmgE/do4JBOjMig
         2Pq7TKvXwzhTpEHe8Vstgm0znyXk4XCay7elifI+FxEkBWiAwj35A+BEPIs7+OErb/jF
         YsmvcfrTx6+nkn6spVlJvEsmi60+9tzgQ2z4iLhKROI7qTtz8/js/IQFn4l03ZQ3ez48
         jMhw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1683652180; x=1686244180;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=PeQT+26lJLbbPbCbIWKzze/adQNYPigOnarKyQspzt8=;
        b=RyMxPJw90zEYP/netmzYeo4NTQYn6bVHuPNzjNbTG5apKQb4VJi/1RhztcNvfOq2L5
         RDtTapGFNZmjCVuHgZ8rF1fEw1lLyzjsN8xSvgMEh3RHYxvXzo+8SX1G3vLF3FbP8H1Q
         L2s73S39JG7Qv0rrvo5cDfipNf2ryjVfQFnJOP1HOQFFaUjuWtoweAKYsZU43IrU8swd
         AfkAnzgF06o1s/vTDek6rbAP88vFLOH2XjfnKVNsWHYiYb2jzAK6SKPAPKLYuVMT/f7G
         5WhiK81y3dUWyTkiQzoXXApMthHkZcpSjrqyTEAqlhiGokSX1WYVt9kxfgPLlEhlMfgJ
         yWCw==
X-Gm-Message-State: AC+VfDwnPQgsiS+XIcZchsCpRCA+lp0A8+z5hmHvH30jnw3s6uXctJik
	Q9ggNTSrOVlkYx1evfQTHyFEl8wAp1tdSI4FmjJj04d4dgc=
X-Google-Smtp-Source: ACHHUZ7S9mTgrGBa2MRWTFE9EKd9OOuJ4zrxmdG5nBunObClyRCiRHsndSPqePmeEtKRUi/FIN9Ejgo4XjRyOtDH1e4=
X-Received: by 2002:a67:e205:0:b0:42f:ea57:c8cf with SMTP id
 g5-20020a67e205000000b0042fea57c8cfmr5524220vsa.26.1683652180474; Tue, 09 May
 2023 10:09:40 -0700 (PDT)
MIME-Version: 1.0
References: <20230509161310.3839898-1-max.oss.09@gmail.com> <20230509161310.3839898-2-max.oss.09@gmail.com>
In-Reply-To: <20230509161310.3839898-2-max.oss.09@gmail.com>
From: Jose Quaresma <quaresma.jose@gmail.com>
Date: Tue, 9 May 2023 18:09:29 +0100
Message-ID: <CANPvuR=RD3POyxB1cbYaBG_4Vq3gprCPYQNwZZxRQyuKPGxZbQ@mail.gmail.com>
Subject: Re: [OE-core][Patch v2 1/3] libtraceevent: import from meta-openembedded
To: Max Krummenacher <max.oss.09@gmail.com>
Cc: openembedded-core@lists.openembedded.org, bruce.ashfield@gmail.com, 
	raj.khem@gmail.com, Max Krummenacher <max.krummenacher@toradex.com>
Content-Type: multipart/alternative; boundary="000000000000247e4b05fb45d2a4"
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 09 May 2023 17:09:43 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/181055

--000000000000247e4b05fb45d2a4
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi Max,

This also needs an entry on meta/conf/distro/include/maintainers.inc

Jose

Max Krummenacher <max.oss.09@gmail.com> escreveu no dia ter=C3=A7a, 9/05/20=
23
=C3=A0(s) 17:13:

> From: Max Krummenacher <max.krummenacher@toradex.com>
>
> Import from meta-openembedded at commit d250a0dc0 ("libtraceevent:
> upgrade 1.7.1 -> 1.7.2").
> Starting with kernel 6.4 libtraceevent is a dependency of perf. While
> one can still build perf without it by opting out one would loose its
> functionality compared with building perf from kernels before 6.4
>
> Signed-off-by: Max Krummenacher <max.krummenacher@toradex.com>
> ---
>  ...not-preserve-ownership-in-cp-command.patch | 40 +++++++++++++++++++
>  .../libtraceevent/libtraceevent_1.7.2.bb      | 25 ++++++++++++
>  2 files changed, 65 insertions(+)
>  create mode 100644
> meta/recipes-kernel/libtraceevent/libtraceevent/0001-makefile-Do-not-pres=
erve-ownership-in-cp-command.patch
>  create mode 100644 meta/recipes-kernel/libtraceevent/
> libtraceevent_1.7.2.bb
>
> diff --git
> a/meta/recipes-kernel/libtraceevent/libtraceevent/0001-makefile-Do-not-pr=
eserve-ownership-in-cp-command.patch
> b/meta/recipes-kernel/libtraceevent/libtraceevent/0001-makefile-Do-not-pr=
eserve-ownership-in-cp-command.patch
> new file mode 100644
> index 0000000000..5e88048817
> --- /dev/null
> +++
> b/meta/recipes-kernel/libtraceevent/libtraceevent/0001-makefile-Do-not-pr=
eserve-ownership-in-cp-command.patch
> @@ -0,0 +1,40 @@
> +From ed0a31000305d937abe47c44d705b5b52bb36f79 Mon Sep 17 00:00:00 2001
> +From: Khem Raj <raj.khem@gmail.com>
> +Date: Thu, 22 Dec 2022 18:32:17 -0800
> +Subject: [PATCH] makefile: Do not preserve ownership in cp command
> +
> +Fixes
> +
> +ERROR: libtraceevent-1.7.0-r0 do_package_qa: QA Issue: libtraceevent:
> /usr/lib/libtraceevent.a is owned by uid 1000, which is the same as the
> user running bitbake. This may be due to host contamination
> [host-user-contaminated]
> +
> +Upstream-Status: Pending
> +Signed-off-by: Khem Raj <raj.khem@gmail.com>
> +---
> + Makefile | 4 ++--
> + 1 file changed, 2 insertions(+), 2 deletions(-)
> +
> +diff --git a/Makefile b/Makefile
> +index 965ff47..0e782cb 100644
> +--- a/Makefile
> ++++ b/Makefile
> +@@ -287,7 +287,7 @@ $(BUILD_PREFIX): force
> +       $(Q)$(call build_prefix,$(prefix))
> +
> + define do_make_pkgconfig_file
> +-      cp -f ${PKG_CONFIG_SOURCE_FILE}.template ${PKG_CONFIG_FILE};    \
> ++      install -m 0644 ${PKG_CONFIG_SOURCE_FILE}.template
> ${PKG_CONFIG_FILE};  \
> +       sed -i "s|INSTALL_PREFIX|${1}|g" ${PKG_CONFIG_FILE};            \
> +       sed -i "s|LIB_VERSION|${EVENT_PARSE_VERSION}|g"
> ${PKG_CONFIG_FILE}; \
> +       sed -i "s|LIB_DIR|${libdir_relative}|g" ${PKG_CONFIG_FILE}; \
> +@@ -335,7 +335,7 @@ install: install_libs install_plugins
> +
> + install_libs: libs install_headers install_pkgconfig
> +       $(Q)$(call do_install,$(LIBTRACEEVENT_SHARED),$(libdir_SQ)); \
> +-              cp -fpR $(LIB_INSTALL) $(DESTDIR)$(libdir_SQ)
> ++              cp --no-preserve=3Downership --recursive $(LIB_INSTALL)
> $(DESTDIR)$(libdir_SQ)
> +       $(Q)$(call install_ld_config)
> +
> + install_pkgconfig: $(PKG_CONFIG_FILE)
> +--
> +2.39.0
> +
> diff --git a/meta/recipes-kernel/libtraceevent/libtraceevent_1.7.2.bb
> b/meta/recipes-kernel/libtraceevent/libtraceevent_1.7.2.bb
> new file mode 100644
> index 0000000000..089b6814c7
> --- /dev/null
> +++ b/meta/recipes-kernel/libtraceevent/libtraceevent_1.7.2.bb
> @@ -0,0 +1,25 @@
> +# Copyright (C) 2022 Khem Raj <raj.khem@gmail.com>
> +# Released under the MIT license (see COPYING.MIT for the terms)
> +
> +SUMMARY =3D "API to access the kernel tracefs directory"
> +HOMEPAGE =3D "https://git.kernel.org/pub/scm/libs/libtrace/libtracefs.gi=
t/"
> +LICENSE =3D "GPL-2.0-or-later & LGPL-2.1-or-later"
> +LIC_FILES_CHKSUM =3D
> "file://LICENSES/GPL-2.0;md5=3De6a75371ba4d16749254a51215d13f97 \
> +
> file://LICENSES/LGPL-2.1;md5=3Db370887980db5dd40659b50909238dbd"
> +SECTION =3D "libs"
> +
> +SRCREV =3D "1c6f0f3b2bb47571fc455dc565dc343152517d98"
> +SRC_URI =3D "git://
> git.kernel.org/pub/scm/libs/libtrace/libtraceevent.git;branch=3D${BPN};pr=
otocol=3Dhttps
> <http://git.kernel.org/pub/scm/libs/libtrace/libtraceevent.git;branch=3D$=
%7BBPN%7D;protocol=3Dhttps>
> \
> +
>  file://0001-makefile-Do-not-preserve-ownership-in-cp-command.patch"
> +
> +S =3D "${WORKDIR}/git"
> +
> +inherit pkgconfig
> +
> +do_install() {
> +    oe_runmake install DESTDIR=3D${D} pkgconfig_dir=3D${libdir}/pkgconfi=
g
> +}
> +
> +PACKAGES +=3D "${PN}-plugins"
> +
> +FILES:${PN}-plugins +=3D "${libdir}/traceevent/plugins"
> --
> 2.35.3
>
>
> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
> Links: You receive all messages sent to this group.
> View/Reply Online (#181050):
> https://lists.openembedded.org/g/openembedded-core/message/181050
> Mute This Topic: https://lists.openembedded.org/mt/98787450/5052612
> Group Owner: openembedded-core+owner@lists.openembedded.org
> Unsubscribe: https://lists.openembedded.org/g/openembedded-core/unsub [
> quaresma.jose@gmail.com]
> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
>
>

--=20
Best regards,

Jos=C3=A9 Quaresma

--000000000000247e4b05fb45d2a4
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div>Hi=C2=A0<span style=3D"color:rgb(0,0,0)">Max,</span><=
/div><div><span style=3D"color:rgb(0,0,0)"><br></span></div><div><span styl=
e=3D"color:rgb(0,0,0)">This also needs an entry on=C2=A0</span>meta/conf/di=
stro/include/maintainers.inc<br><br>Jose</div><br><div class=3D"gmail_quote=
"><div dir=3D"ltr" class=3D"gmail_attr">Max Krummenacher &lt;<a href=3D"mai=
lto:max.oss.09@gmail.com">max.oss.09@gmail.com</a>&gt; escreveu no dia ter=
=C3=A7a, 9/05/2023 =C3=A0(s) 17:13:<br></div><blockquote class=3D"gmail_quo=
te" style=3D"margin:0px 0px 0px 0.8ex;border-left:1px solid rgb(204,204,204=
);padding-left:1ex">From: Max Krummenacher &lt;<a href=3D"mailto:max.krumme=
nacher@toradex.com" target=3D"_blank">max.krummenacher@toradex.com</a>&gt;<=
br>
<br>
Import from meta-openembedded at commit d250a0dc0 (&quot;libtraceevent:<br>
upgrade 1.7.1 -&gt; 1.7.2&quot;).<br>
Starting with kernel 6.4 libtraceevent is a dependency of perf. While<br>
one can still build perf without it by opting out one would loose its<br>
functionality compared with building perf from kernels before 6.4<br>
<br>
Signed-off-by: Max Krummenacher &lt;<a href=3D"mailto:max.krummenacher@tora=
dex.com" target=3D"_blank">max.krummenacher@toradex.com</a>&gt;<br>
---<br>
=C2=A0...not-preserve-ownership-in-cp-command.patch | 40 ++++++++++++++++++=
+<br>
=C2=A0.../libtraceevent/<a href=3D"http://libtraceevent_1.7.2.bb" rel=3D"no=
referrer" target=3D"_blank">libtraceevent_1.7.2.bb</a>=C2=A0 =C2=A0 =C2=A0 =
| 25 ++++++++++++<br>
=C2=A02 files changed, 65 insertions(+)<br>
=C2=A0create mode 100644 meta/recipes-kernel/libtraceevent/libtraceevent/00=
01-makefile-Do-not-preserve-ownership-in-cp-command.patch<br>
=C2=A0create mode 100644 meta/recipes-kernel/libtraceevent/<a href=3D"http:=
//libtraceevent_1.7.2.bb" rel=3D"noreferrer" target=3D"_blank">libtraceeven=
t_1.7.2.bb</a><br>
<br>
diff --git a/meta/recipes-kernel/libtraceevent/libtraceevent/0001-makefile-=
Do-not-preserve-ownership-in-cp-command.patch b/meta/recipes-kernel/libtrac=
eevent/libtraceevent/0001-makefile-Do-not-preserve-ownership-in-cp-command.=
patch<br>
new file mode 100644<br>
index 0000000000..5e88048817<br>
--- /dev/null<br>
+++ b/meta/recipes-kernel/libtraceevent/libtraceevent/0001-makefile-Do-not-=
preserve-ownership-in-cp-command.patch<br>
@@ -0,0 +1,40 @@<br>
+From ed0a31000305d937abe47c44d705b5b52bb36f79 Mon Sep 17 00:00:00 2001<br>
+From: Khem Raj &lt;<a href=3D"mailto:raj.khem@gmail.com" target=3D"_blank"=
>raj.khem@gmail.com</a>&gt;<br>
+Date: Thu, 22 Dec 2022 18:32:17 -0800<br>
+Subject: [PATCH] makefile: Do not preserve ownership in cp command<br>
+<br>
+Fixes<br>
+<br>
+ERROR: libtraceevent-1.7.0-r0 do_package_qa: QA Issue: libtraceevent: /usr=
/lib/libtraceevent.a is owned by uid 1000, which is the same as the user ru=
nning bitbake. This may be due to host contamination [host-user-contaminate=
d]<br>
+<br>
+Upstream-Status: Pending<br>
+Signed-off-by: Khem Raj &lt;<a href=3D"mailto:raj.khem@gmail.com" target=
=3D"_blank">raj.khem@gmail.com</a>&gt;<br>
+---<br>
+ Makefile | 4 ++--<br>
+ 1 file changed, 2 insertions(+), 2 deletions(-)<br>
+<br>
+diff --git a/Makefile b/Makefile<br>
+index 965ff47..0e782cb 100644<br>
+--- a/Makefile<br>
++++ b/Makefile<br>
+@@ -287,7 +287,7 @@ $(BUILD_PREFIX): force<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0$(Q)$(call build_prefix,$(prefix))<br>
+ <br>
+ define do_make_pkgconfig_file<br>
+-=C2=A0 =C2=A0 =C2=A0 cp -f ${PKG_CONFIG_SOURCE_FILE}.template ${PKG_CONFI=
G_FILE};=C2=A0 =C2=A0 \<br>
++=C2=A0 =C2=A0 =C2=A0 install -m 0644 ${PKG_CONFIG_SOURCE_FILE}.template $=
{PKG_CONFIG_FILE};=C2=A0 \<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0sed -i &quot;s|INSTALL_PREFIX|${1}|g&quot; ${PK=
G_CONFIG_FILE};=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 \<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0sed -i &quot;s|LIB_VERSION|${EVENT_PARSE_VERSIO=
N}|g&quot; ${PKG_CONFIG_FILE}; \<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0sed -i &quot;s|LIB_DIR|${libdir_relative}|g&quo=
t; ${PKG_CONFIG_FILE}; \<br>
+@@ -335,7 +335,7 @@ install: install_libs install_plugins<br>
+ <br>
+ install_libs: libs install_headers install_pkgconfig<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0$(Q)$(call do_install,$(LIBTRACEEVENT_SHARED),$=
(libdir_SQ)); \<br>
+-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 cp -fpR $(LIB_INSTALL) $=
(DESTDIR)$(libdir_SQ)<br>
++=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 cp --no-preserve=3Downer=
ship --recursive $(LIB_INSTALL) $(DESTDIR)$(libdir_SQ)<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0$(Q)$(call install_ld_config)<br>
+ <br>
+ install_pkgconfig: $(PKG_CONFIG_FILE)<br>
+-- <br>
+2.39.0<br>
+<br>
diff --git a/meta/recipes-kernel/libtraceevent/<a href=3D"http://libtraceev=
ent_1.7.2.bb" rel=3D"noreferrer" target=3D"_blank">libtraceevent_1.7.2.bb</=
a> b/meta/recipes-kernel/libtraceevent/<a href=3D"http://libtraceevent_1.7.=
2.bb" rel=3D"noreferrer" target=3D"_blank">libtraceevent_1.7.2.bb</a><br>
new file mode 100644<br>
index 0000000000..089b6814c7<br>
--- /dev/null<br>
+++ b/meta/recipes-kernel/libtraceevent/<a href=3D"http://libtraceevent_1.7=
.2.bb" rel=3D"noreferrer" target=3D"_blank">libtraceevent_1.7.2.bb</a><br>
@@ -0,0 +1,25 @@<br>
+# Copyright (C) 2022 Khem Raj &lt;<a href=3D"mailto:raj.khem@gmail.com" ta=
rget=3D"_blank">raj.khem@gmail.com</a>&gt;<br>
+# Released under the MIT license (see COPYING.MIT for the terms)<br>
+<br>
+SUMMARY =3D &quot;API to access the kernel tracefs directory&quot;<br>
+HOMEPAGE =3D &quot;<a href=3D"https://git.kernel.org/pub/scm/libs/libtrace=
/libtracefs.git/" rel=3D"noreferrer" target=3D"_blank">https://git.kernel.o=
rg/pub/scm/libs/libtrace/libtracefs.git/</a>&quot;<br>
+LICENSE =3D &quot;GPL-2.0-or-later &amp; LGPL-2.1-or-later&quot;<br>
+LIC_FILES_CHKSUM =3D &quot;file://LICENSES/GPL-2.0;md5=3De6a75371ba4d16749=
254a51215d13f97 \<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 file=
://LICENSES/LGPL-2.1;md5=3Db370887980db5dd40659b50909238dbd&quot;<br>
+SECTION =3D &quot;libs&quot;<br>
+<br>
+SRCREV =3D &quot;1c6f0f3b2bb47571fc455dc565dc343152517d98&quot;<br>
+SRC_URI =3D &quot;git://<a href=3D"http://git.kernel.org/pub/scm/libs/libt=
race/libtraceevent.git;branch=3D$%7BBPN%7D;protocol=3Dhttps" rel=3D"norefer=
rer" target=3D"_blank">git.kernel.org/pub/scm/libs/libtrace/libtraceevent.g=
it;branch=3D${BPN};protocol=3Dhttps</a> \<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0file://0001-makefile-Do-not-prese=
rve-ownership-in-cp-command.patch&quot;<br>
+<br>
+S =3D &quot;${WORKDIR}/git&quot;<br>
+<br>
+inherit pkgconfig<br>
+<br>
+do_install() {<br>
+=C2=A0 =C2=A0 oe_runmake install DESTDIR=3D${D} pkgconfig_dir=3D${libdir}/=
pkgconfig<br>
+}<br>
+<br>
+PACKAGES +=3D &quot;${PN}-plugins&quot;<br>
+<br>
+FILES:${PN}-plugins +=3D &quot;${libdir}/traceevent/plugins&quot;<br>
-- <br>
2.35.3<br>
<br>
<br>
-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-<br>
Links: You receive all messages sent to this group.<br>
View/Reply Online (#181050): <a href=3D"https://lists.openembedded.org/g/op=
enembedded-core/message/181050" rel=3D"noreferrer" target=3D"_blank">https:=
//lists.openembedded.org/g/openembedded-core/message/181050</a><br>
Mute This Topic: <a href=3D"https://lists.openembedded.org/mt/98787450/5052=
612" rel=3D"noreferrer" target=3D"_blank">https://lists.openembedded.org/mt=
/98787450/5052612</a><br>
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

--000000000000247e4b05fb45d2a4--

