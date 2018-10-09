Return-Path: <ross.burton@intel.com>
Received: from mail-ot1-f51.google.com (mail-ot1-f51.google.com
	[209.85.210.51])
	by mail.openembedded.org (Postfix) with ESMTP id 15890744B1
	for <openembedded-core@lists.openembedded.org>;
	Tue,  9 Oct 2018 10:51:57 +0000 (UTC)
Received: by mail-ot1-f51.google.com with SMTP id l1so1114668otj.5
	for <openembedded-core@lists.openembedded.org>;
	Tue, 09 Oct 2018 03:51:59 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=intel-com.20150623.gappssmtp.com; s=20150623;
	h=mime-version:references:in-reply-to:from:date:message-id:subject:to
	:cc; bh=6Q3KLkUG9OtPfb+YomwE2fCamZ55DQ1325GDV36hFIM=;
	b=REHBJc9rrsH+KXBMYkqHsGKpTjGRoGDuOZTb2t8Ej7ZLYz5P+ZjgkzJ7L+HBUqu105
	YkWw7cRjCh8/GixxnkiRNCH83a8NAqHsm6a1LCIN0XE3uoti4RuEySLereic1txoGMTe
	wdVAQtXhp4cJg7HjkkaHALxMUT5N5tR1GtBDZELh2sw8ru635gKX7YOJJFcNufCcWEbT
	7zqRLHYcvDH+bHBXFO9gyZxM5QAawG3P4l1EvOi0biOCOu2pLug6LMnbvAM8ai1+/nJs
	7cF+Y7JtmECpfM8+8+JO0BsA3JfihNoHbhm70DLmuNQZ4CcuqG+i79PBB4QN5FqSLoyi
	2F6Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:references:in-reply-to:from:date
	:message-id:subject:to:cc;
	bh=6Q3KLkUG9OtPfb+YomwE2fCamZ55DQ1325GDV36hFIM=;
	b=NjmovNetBb4p/VrUD9uWF3OVoDBs3QG6cjHtZ0ShXZsyaXIyn8M5l2FmTKiP4wxe/4
	H8t/y2lFrS/Oyvxt2G72Q64LKgT6fh03LrEZUpa7Od5Vq8vWT5AMGY7Sx+zahJXJ9Mnm
	wn+jYKrIBEWrYIyixR6aJ22fvs7tUbw3OFgwCO/d/NfmcDk8WP+Pl9FNlF/i4bhv5+g9
	9/FjKDYdRuJifznFNvJ4nZGOPkKj9MuQBiShxfR/Nq4vltGKaSxgnQ+VJgsaZIVZJOTD
	LSEWqRgiJE0fb/KHcEaiLIeygc3Xi9KUJ+8QVs6GAyxSQ8nXsHK5pl1ILyDwd3HrFndS
	yxeg==
X-Gm-Message-State: ABuFfogxGRx4oZgiIRO+YfNTsQaI6NMtIU0698LIs4VqZA5wG6mBxQGQ
	gzPDP4agqCm4fH7oXrhTkLZPsJbwGU3GiG8AGFQrqw==
X-Google-Smtp-Source: ACcGV616pCdz1f+SF7Go+jhI9xqoujJtQPBvDyghkHJ0TtXwRO0qceA2lHVQQGpfoOBtpmcTYN7bmec8c1G5mttSCoQ=
X-Received: by 2002:a9d:3605:: with SMTP id w5-v6mr262139otb.133.1539082318984;
	Tue, 09 Oct 2018 03:51:58 -0700 (PDT)
MIME-Version: 1.0
References: <CAMKF1souez4aWHQx3pgKjoqAuhh0xQ0cyYSPWiwmo4spqB+_mw@mail.gmail.com>
	<20181009073848.8492-1-andrej.valek@siemens.com>
In-Reply-To: <20181009073848.8492-1-andrej.valek@siemens.com>
From: "Burton, Ross" <ross.burton@intel.com>
Date: Tue, 9 Oct 2018 11:51:47 +0100
Message-ID: <CAJTo0LafoJckLNPwDDnDzDhPg+B72N3fm65BR4WAuENbkKHD6w@mail.gmail.com>
To: Andrej Valek <andrej.valek@siemens.com>
Cc: OE-core <openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH v2 1/3] busybox: fix conflict with runlevel applet
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
X-List-Received-Date: Tue, 09 Oct 2018 10:51:58 -0000
Content-Type: multipart/alternative; boundary="000000000000e75fa70577c986fc"

--000000000000e75fa70577c986fc
Content-Type: text/plain; charset="UTF-8"

Don't you want to delete runlevel here too?

Ross

On Tue, 9 Oct 2018 at 08:45, Andrej Valek <andrej.valek@siemens.com> wrote:

> - remove OE runlevel script which conflicts with busybox's applet
> - don't install empty directories
>
> Signed-off-by: Andrej Valek <andrej.valek@siemens.com>
> ---
>  meta/recipes-core/busybox/busybox.inc      | 4 +---
>  meta/recipes-core/busybox/busybox/init.cfg | 1 +
>  2 files changed, 2 insertions(+), 3 deletions(-)
>
> diff --git a/meta/recipes-core/busybox/busybox.inc
> b/meta/recipes-core/busybox/busybox.inc
> index e1fba4243a..7b427ab0f7 100644
> --- a/meta/recipes-core/busybox/busybox.inc
> +++ b/meta/recipes-core/busybox/busybox.inc
> @@ -254,8 +254,7 @@ do_install () {
>                         ln -sf busybox ${D}${base_bindir}/busybox.nosuid
>                 fi
>         else
> -               install -d ${D}${base_bindir} ${D}${base_sbindir}
> -               install -d ${D}${libdir} ${D}${bindir} ${D}${sbindir}
> +               install -d ${D}${base_bindir} ${D}${bindir} ${D}${libdir}
>                 cat busybox.links | while read FILE; do
>                         NAME=`basename "$FILE"`
>                         install -m 0755 "0_lib/$NAME" "${D}$FILE.${BPN}"
> @@ -316,7 +315,6 @@ do_install () {
>          if grep "CONFIG_INIT=y" ${B}/.config; then
>                  install -D -m 0777 ${WORKDIR}/rcS
> ${D}${sysconfdir}/init.d/rcS
>                  install -D -m 0777 ${WORKDIR}/rcK
> ${D}${sysconfdir}/init.d/rcK
> -                install -D -m 0755 ${WORKDIR}/runlevel
> ${D}${base_sbindir}/runlevel
>          fi
>
>      if
> ${@bb.utils.contains('DISTRO_FEATURES','systemd','true','false',d)}; then
> diff --git a/meta/recipes-core/busybox/busybox/init.cfg
> b/meta/recipes-core/busybox/busybox/init.cfg
> index 3c1fdd42b6..b69fe0ea9c 100644
> --- a/meta/recipes-core/busybox/busybox/init.cfg
> +++ b/meta/recipes-core/busybox/busybox/init.cfg
> @@ -1,4 +1,5 @@
>  CONFIG_INIT=y
> +CONFIG_RUNLEVEL=y
>  CONFIG_FEATURE_USE_INITTAB=y
>  CONFIG_HALT=y
>  CONFIG_POWEROFF=y
> --
> 2.11.0
>
> --
> _______________________________________________
> Openembedded-core mailing list
> Openembedded-core@lists.openembedded.org
> http://lists.openembedded.org/mailman/listinfo/openembedded-core
>

--000000000000e75fa70577c986fc
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr">Don&#39;t you want to delete runlevel here too?<div><br></=
div><div>Ross</div></div><br><div class=3D"gmail_quote"><div dir=3D"ltr">On=
 Tue, 9 Oct 2018 at 08:45, Andrej Valek &lt;<a href=3D"mailto:andrej.valek@=
siemens.com">andrej.valek@siemens.com</a>&gt; wrote:<br></div><blockquote c=
lass=3D"gmail_quote" style=3D"margin:0 0 0 .8ex;border-left:1px #ccc solid;=
padding-left:1ex">- remove OE runlevel script which conflicts with busybox&=
#39;s applet<br>
- don&#39;t install empty directories<br>
<br>
Signed-off-by: Andrej Valek &lt;<a href=3D"mailto:andrej.valek@siemens.com"=
 target=3D"_blank">andrej.valek@siemens.com</a>&gt;<br>
---<br>
=C2=A0meta/recipes-core/busybox/busybox.inc=C2=A0 =C2=A0 =C2=A0 | 4 +---<br=
>
=C2=A0meta/recipes-core/busybox/busybox/init.cfg | 1 +<br>
=C2=A02 files changed, 2 insertions(+), 3 deletions(-)<br>
<br>
diff --git a/meta/recipes-core/busybox/busybox.inc b/meta/recipes-core/busy=
box/busybox.inc<br>
index e1fba4243a..7b427ab0f7 100644<br>
--- a/meta/recipes-core/busybox/busybox.inc<br>
+++ b/meta/recipes-core/busybox/busybox.inc<br>
@@ -254,8 +254,7 @@ do_install () {<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 ln -sf busybox ${D}${base_bindir}/busybox.nosuid<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 fi<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 else<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0install -d ${D}${ba=
se_bindir} ${D}${base_sbindir}<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0install -d ${D}${li=
bdir} ${D}${bindir} ${D}${sbindir}<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0install -d ${D}${ba=
se_bindir} ${D}${bindir} ${D}${libdir}<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 cat busybox.links |=
 while read FILE; do<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 NAME=3D`basename &quot;$FILE&quot;`<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 install -m 0755 &quot;0_lib/$NAME&quot; &quot;${D}$FILE.${BPN}&q=
uot;<br>
@@ -316,7 +315,6 @@ do_install () {<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0if grep &quot;CONFIG_INIT=3Dy&quot; ${B}/=
.config; then<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0install -D -m=
 0777 ${WORKDIR}/rcS ${D}${sysconfdir}/init.d/rcS<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0install -D -m=
 0777 ${WORKDIR}/rcK ${D}${sysconfdir}/init.d/rcK<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 install -D -m 0755=
 ${WORKDIR}/runlevel ${D}${base_sbindir}/runlevel<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0fi<br>
<br>
=C2=A0 =C2=A0 =C2=A0if ${@bb.utils.contains(&#39;DISTRO_FEATURES&#39;,&#39;=
systemd&#39;,&#39;true&#39;,&#39;false&#39;,d)}; then<br>
diff --git a/meta/recipes-core/busybox/busybox/init.cfg b/meta/recipes-core=
/busybox/busybox/init.cfg<br>
index 3c1fdd42b6..b69fe0ea9c 100644<br>
--- a/meta/recipes-core/busybox/busybox/init.cfg<br>
+++ b/meta/recipes-core/busybox/busybox/init.cfg<br>
@@ -1,4 +1,5 @@<br>
=C2=A0CONFIG_INIT=3Dy<br>
+CONFIG_RUNLEVEL=3Dy<br>
=C2=A0CONFIG_FEATURE_USE_INITTAB=3Dy<br>
=C2=A0CONFIG_HALT=3Dy<br>
=C2=A0CONFIG_POWEROFF=3Dy<br>
-- <br>
2.11.0<br>
<br>
-- <br>
_______________________________________________<br>
Openembedded-core mailing list<br>
<a href=3D"mailto:Openembedded-core@lists.openembedded.org" target=3D"_blan=
k">Openembedded-core@lists.openembedded.org</a><br>
<a href=3D"http://lists.openembedded.org/mailman/listinfo/openembedded-core=
" rel=3D"noreferrer" target=3D"_blank">http://lists.openembedded.org/mailma=
n/listinfo/openembedded-core</a><br>
</blockquote></div>

--000000000000e75fa70577c986fc--
