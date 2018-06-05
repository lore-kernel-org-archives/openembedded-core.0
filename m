Return-Path: <kergoth@gmail.com>
Received: from mail-ot0-f180.google.com (mail-ot0-f180.google.com
	[74.125.82.180])
	by mail.openembedded.org (Postfix) with ESMTP id 6B38977FE8
	for <openembedded-core@lists.openembedded.org>;
	Tue,  5 Jun 2018 22:17:40 +0000 (UTC)
Received: by mail-ot0-f180.google.com with SMTP id 101-v6so4789565oth.4
	for <openembedded-core@lists.openembedded.org>;
	Tue, 05 Jun 2018 15:17:41 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=mime-version:references:in-reply-to:from:date:message-id:subject:to
	:cc; bh=89hZo3Yt3zVWqMgsaPv1kVXBBFdqH7EU02cPgRSh2Ug=;
	b=tktB8hOFJlsfyaC35I6NIEYXncsSV7swfwFFVb9oYmvPJSJP5Kq+8wt/skZdBN07Ul
	h52B2mYM8XJ2akeWwDN3CmhaYOqdfbOWiQHfxk/E/2tirGGa8tJZCgFL8Ve7rtp3MdQr
	HC/3wzeEwY9a+nnGIvjHFnI1q6KNCpKEfCj9M6tasUeio/GT6SSu4fD41OUCKnicqcvC
	GDhkJLrCVlpf4Bd60Jw9bZeUkbrSpnnNpIglDzGWC2NpGTu+tHakMb4YzqF5kgU3r2Ig
	CCGXc6/eEbfev4Cww/Z3LCTUzAUVt1uOq6uD7lwPXjf8FxYwRZD5AyecXw+pBGp/VbIW
	Eiyg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:references:in-reply-to:from:date
	:message-id:subject:to:cc;
	bh=89hZo3Yt3zVWqMgsaPv1kVXBBFdqH7EU02cPgRSh2Ug=;
	b=Q7cvl8iGAeYB8vyz2RlgQ/TKN1ce6PhqzSEPMc1Q7+G5qLq8iwThdmKEh2PqeSuooB
	vcL+tRfYA0zwafNRqt5htRsFxxXwNRufW9C8vwLN9NrCOi06Pf4g6DxLntecx8L39wlU
	Mw1R+3vqCXLJKS+fmLnolW9j2in0a0SwYlxjlE6M2GKd8PJiz9GPaDNBDkHJOB0qcqOM
	H4qXzRnfXA7EpYB1NoONRCzS27sfbVBOiu1HRsgtFfP6vP5XdEX3ZXLTFP16QcU5Wk4S
	0gQxn5zQ6y3F0MRS/VnvMBghOVLtZPT5Bk/nVO3ZDEO8A1O7k/zaWziWlGEd9VdXLKp6
	TIqQ==
X-Gm-Message-State: APt69E1M2fcTcOsuKs4C2ADbM2cb1X5eyHppQuogMsu2L1LiH51f7FwS
	VLBIiSj75Km1101XcQhm20Ad7DhmZky0EEgRjik=
X-Google-Smtp-Source: ADUXVKJKbGGWi/DCCeHsT28H944hhgtG/hzTzko+zcDbaJuWJCe+daH0o9IElxCBag7MxDs+6Ztx9A23bl+rFv/G820=
X-Received: by 2002:a9d:2010:: with SMTP id
	n16-v6mr298105ota.275.1528237061367; 
	Tue, 05 Jun 2018 15:17:41 -0700 (PDT)
MIME-Version: 1.0
References: <20180515140451.60660-1-stefan@agner.ch>
	<20180515140451.60660-2-stefan@agner.ch>
In-Reply-To: <20180515140451.60660-2-stefan@agner.ch>
From: Christopher Larson <kergoth@gmail.com>
Date: Tue, 5 Jun 2018 15:17:28 -0700
Message-ID: <CABcZANk+ZSfLy476eazUZeKT-58JA+nJQch1jbzac1HjmG9OqQ@mail.gmail.com>
To: stefan@agner.ch
Cc: "Shakeel, Muhammad" <muhammad_shakeel@mentor.com>, stefan.agner@toradex.com,
	Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH 1/3] opkg: avoid running postinst scripts twice when using systemd
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
X-List-Received-Date: Tue, 05 Jun 2018 22:17:40 -0000
Content-Type: multipart/alternative; boundary="0000000000002cedfc056dec6b4d"

--0000000000002cedfc056dec6b4d
Content-Type: text/plain; charset="UTF-8"

Would love to see this merged, this is a long-standing issue.

On Tue, May 15, 2018 at 7:05 AM Stefan Agner <stefan@agner.ch> wrote:

> From: Stefan Agner <stefan.agner@toradex.com>
>
> OpenEmbedded has a built-in mechanism to run postinst scripts offline
> at build time or, if necessary, on first boot (delayed execution). If
> the latter is the case and systemd is in use, two services end up
> doing the same thing:
> - opkg-configure.service starts "opkg configure" directly.
> - run-postinsts.service starts "/usr/sbin/run-postinsts" which runs
>   postinst scripts stored in /etc/ipk-postinsts/ or "opkg configure"
>   if package management is installed.
>
> Since the run-postinsts.service is also used in cases where no
> package management is in use, it is the primary means of handling
> postinsts.
>
> Get rid of the opkg-configure.service to avoid duplicate opkg
> configure execution.
>
> Signed-off-by: Stefan Agner <stefan.agner@toradex.com>
> ---
>  meta/recipes-devtools/opkg/opkg/opkg-configure.service | 17
> -----------------
>  meta/recipes-devtools/opkg/opkg_0.3.6.bb               | 14
> --------------
>  2 files changed, 31 deletions(-)
>  delete mode 100644 meta/recipes-devtools/opkg/opkg/opkg-configure.service
>
> diff --git a/meta/recipes-devtools/opkg/opkg/opkg-configure.service
> b/meta/recipes-devtools/opkg/opkg/opkg-configure.service
> deleted file mode 100644
> index 432c3ddc28..0000000000
> --- a/meta/recipes-devtools/opkg/opkg/opkg-configure.service
> +++ /dev/null
> @@ -1,17 +0,0 @@
> -[Unit]
> -Description=Opkg first boot configure
> -DefaultDependencies=no
> -After=systemd-remount-fs.service systemd-tmpfiles-setup.service tmp.mount
> -Before=sysinit.target
> -
> -[Service]
> -Type=oneshot
> -EnvironmentFile=-@SYSCONFDIR@/default/postinst
> -ExecStart=-@BASE_BINDIR@/sh -c " if [ $POSTINST_LOGGING = '1' ]; then
> @BINDIR@/opkg configure > $LOGFILE 2>&1; else @BINDIR@/opkg configure; fi"
> -ExecStartPost=@BASE_BINDIR@/systemctl --no-reload disable
> opkg-configure.service
> -StandardOutput=syslog
> -RemainAfterExit=No
> -
> -[Install]
> -WantedBy=basic.target
> -WantedBy=sysinit.target
> diff --git a/meta/recipes-devtools/opkg/opkg_0.3.6.bb
> b/meta/recipes-devtools/opkg/opkg_0.3.6.bb
> index 70f20af739..579b51166c 100644
> --- a/meta/recipes-devtools/opkg/opkg_0.3.6.bb
> +++ b/meta/recipes-devtools/opkg/opkg_0.3.6.bb
> @@ -12,7 +12,6 @@ DEPENDS = "libarchive"
>  PE = "1"
>
>  SRC_URI = "
> http://downloads.yoctoproject.org/releases/${BPN}/${BPN}-${PV}.tar.gz \
> -           file://opkg-configure.service \
>             file://opkg.conf \
>
> file://0001-opkg_conf-create-opkg.lock-in-run-instead-of-var-run.patch \
>  "
> @@ -22,8 +21,6 @@ SRC_URI[sha256sum] =
> "f607f0e61be8cf8a3bbd0d2dccd9ec9e9b6c21dd4307b671c600d6eeaf
>
>  inherit autotools pkgconfig systemd
>
> -SYSTEMD_SERVICE_${PN} = "opkg-configure.service"
> -
>  target_localstatedir := "${localstatedir}"
>  OPKGLIBDIR = "${target_localstatedir}/lib"
>
> @@ -46,16 +43,6 @@ do_install_append () {
>
>         # We need to create the lock directory
>         install -d ${D}${OPKGLIBDIR}/opkg
> -
> -       if
> ${@bb.utils.contains('DISTRO_FEATURES','systemd','true','false',d)};then
> -               install -d ${D}${systemd_unitdir}/system
> -               install -m 0644 ${WORKDIR}/opkg-configure.service
> ${D}${systemd_unitdir}/system/
> -               sed -i -e 's,@BASE_BINDIR@,${base_bindir},g' \
> -                       -e 's,@SYSCONFDIR@,${sysconfdir},g' \
> -                       -e 's,@BINDIR@,${bindir},g' \
> -                       -e 's,@SYSTEMD_UNITDIR@,${systemd_unitdir},g' \
> -
>  ${D}${systemd_unitdir}/system/opkg-configure.service
> -       fi
>  }
>
>  RDEPENDS_${PN} = "${VIRTUAL-RUNTIME_update-alternatives} opkg-arch-config
> libarchive"
> @@ -68,7 +55,6 @@ RPROVIDES_${PN} = "opkg-collateral"
>  PACKAGES =+ "libopkg"
>
>  FILES_libopkg = "${libdir}/*.so.* ${OPKGLIBDIR}/opkg/"
> -FILES_${PN} += "${systemd_unitdir}/system/"
>
>  BBCLASSEXTEND = "native nativesdk"
>
> --
> 2.13.6
>
> --
> _______________________________________________
> Openembedded-core mailing list
> Openembedded-core@lists.openembedded.org
> http://lists.openembedded.org/mailman/listinfo/openembedded-core
>


-- 
Christopher Larson
kergoth at gmail dot com
Founder - BitBake, OpenEmbedded, OpenZaurus
Senior Software Engineer, Mentor Graphics

--0000000000002cedfc056dec6b4d
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr">Would love to see this merged, this is a long-standing iss=
ue.<br></div><br><div class=3D"gmail_quote"><div dir=3D"ltr">On Tue, May 15=
, 2018 at 7:05 AM Stefan Agner &lt;<a href=3D"mailto:stefan@agner.ch">stefa=
n@agner.ch</a>&gt; wrote:<br></div><blockquote class=3D"gmail_quote" style=
=3D"margin:0 0 0 .8ex;border-left:1px #ccc solid;padding-left:1ex">From: St=
efan Agner &lt;<a href=3D"mailto:stefan.agner@toradex.com" target=3D"_blank=
">stefan.agner@toradex.com</a>&gt;<br>
<br>
OpenEmbedded has a built-in mechanism to run postinst scripts offline<br>
at build time or, if necessary, on first boot (delayed execution). If<br>
the latter is the case and systemd is in use, two services end up<br>
doing the same thing:<br>
- opkg-configure.service starts &quot;opkg configure&quot; directly.<br>
- run-postinsts.service starts &quot;/usr/sbin/run-postinsts&quot; which ru=
ns<br>
=C2=A0 postinst scripts stored in /etc/ipk-postinsts/ or &quot;opkg configu=
re&quot;<br>
=C2=A0 if package management is installed.<br>
<br>
Since the run-postinsts.service is also used in cases where no<br>
package management is in use, it is the primary means of handling<br>
postinsts.<br>
<br>
Get rid of the opkg-configure.service to avoid duplicate opkg<br>
configure execution.<br>
<br>
Signed-off-by: Stefan Agner &lt;<a href=3D"mailto:stefan.agner@toradex.com"=
 target=3D"_blank">stefan.agner@toradex.com</a>&gt;<br>
---<br>
=C2=A0meta/recipes-devtools/opkg/opkg/opkg-configure.service | 17 ---------=
--------<br>
=C2=A0meta/recipes-devtools/opkg/<a href=3D"http://opkg_0.3.6.bb" rel=3D"no=
referrer" target=3D"_blank">opkg_0.3.6.bb</a>=C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0| 14 --------------<br>
=C2=A02 files changed, 31 deletions(-)<br>
=C2=A0delete mode 100644 meta/recipes-devtools/opkg/opkg/opkg-configure.ser=
vice<br>
<br>
diff --git a/meta/recipes-devtools/opkg/opkg/opkg-configure.service b/meta/=
recipes-devtools/opkg/opkg/opkg-configure.service<br>
deleted file mode 100644<br>
index 432c3ddc28..0000000000<br>
--- a/meta/recipes-devtools/opkg/opkg/opkg-configure.service<br>
+++ /dev/null<br>
@@ -1,17 +0,0 @@<br>
-[Unit]<br>
-Description=3DOpkg first boot configure<br>
-DefaultDependencies=3Dno<br>
-After=3Dsystemd-remount-fs.service systemd-tmpfiles-setup.service tmp.moun=
t<br>
-Before=3Dsysinit.target<br>
-<br>
-[Service]<br>
-Type=3Doneshot<br>
-EnvironmentFile=3D-@SYSCONFDIR@/default/postinst<br>
-ExecStart=3D-@BASE_BINDIR@/sh -c &quot; if [ $POSTINST_LOGGING =3D &#39;1&=
#39; ]; then @BINDIR@/opkg configure &gt; $LOGFILE 2&gt;&amp;1; else @BINDI=
R@/opkg configure; fi&quot;<br>
-ExecStartPost=3D@BASE_BINDIR@/systemctl --no-reload disable opkg-configure=
.service<br>
-StandardOutput=3Dsyslog<br>
-RemainAfterExit=3DNo<br>
-<br>
-[Install]<br>
-WantedBy=3Dbasic.target<br>
-WantedBy=3Dsysinit.target<br>
diff --git a/meta/recipes-devtools/opkg/<a href=3D"http://opkg_0.3.6.bb" re=
l=3D"noreferrer" target=3D"_blank">opkg_0.3.6.bb</a> b/meta/recipes-devtool=
s/opkg/<a href=3D"http://opkg_0.3.6.bb" rel=3D"noreferrer" target=3D"_blank=
">opkg_0.3.6.bb</a><br>
index 70f20af739..579b51166c 100644<br>
--- a/meta/recipes-devtools/opkg/<a href=3D"http://opkg_0.3.6.bb" rel=3D"no=
referrer" target=3D"_blank">opkg_0.3.6.bb</a><br>
+++ b/meta/recipes-devtools/opkg/<a href=3D"http://opkg_0.3.6.bb" rel=3D"no=
referrer" target=3D"_blank">opkg_0.3.6.bb</a><br>
@@ -12,7 +12,6 @@ DEPENDS =3D &quot;libarchive&quot;<br>
=C2=A0PE =3D &quot;1&quot;<br>
<br>
=C2=A0SRC_URI =3D &quot;<a href=3D"http://downloads.yoctoproject.org/releas=
es/$%7BBPN%7D/$%7BBPN%7D-$%7BPV%7D.tar.gz" rel=3D"noreferrer" target=3D"_bl=
ank">http://downloads.yoctoproject.org/releases/${BPN}/${BPN}-${PV}.tar.gz<=
/a> \<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0file://opkg-configure.service \<b=
r>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 file://opkg.conf \<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 file://0001-opkg_conf-create-opkg=
.lock-in-run-instead-of-var-run.patch \<br>
=C2=A0&quot;<br>
@@ -22,8 +21,6 @@ SRC_URI[sha256sum] =3D &quot;f607f0e61be8cf8a3bbd0d2dccd9=
ec9e9b6c21dd4307b671c600d6eeaf<br>
<br>
=C2=A0inherit autotools pkgconfig systemd<br>
<br>
-SYSTEMD_SERVICE_${PN} =3D &quot;opkg-configure.service&quot;<br>
-<br>
=C2=A0target_localstatedir :=3D &quot;${localstatedir}&quot;<br>
=C2=A0OPKGLIBDIR =3D &quot;${target_localstatedir}/lib&quot;<br>
<br>
@@ -46,16 +43,6 @@ do_install_append () {<br>
<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 # We need to create the lock directory<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 install -d ${D}${OPKGLIBDIR}/opkg<br>
-<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0if ${@bb.utils.contains(&#39;DISTRO_FEATURES&#3=
9;,&#39;systemd&#39;,&#39;true&#39;,&#39;false&#39;,d)};then<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0install -d ${D}${sy=
stemd_unitdir}/system<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0install -m 0644 ${W=
ORKDIR}/opkg-configure.service ${D}${systemd_unitdir}/system/<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0sed -i -e &#39;s,@B=
ASE_BINDIR@,${base_bindir},g&#39; \<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0-e &#39;s,@SYSCONFDIR@,${sysconfdir},g&#39; \<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0-e &#39;s,@BINDIR@,${bindir},g&#39; \<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0-e &#39;s,@SYSTEMD_UNITDIR@,${systemd_unitdir},g&#39; \<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0${D}${systemd_unitdir}/system/opkg-configure.service<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0fi<br>
=C2=A0}<br>
<br>
=C2=A0RDEPENDS_${PN} =3D &quot;${VIRTUAL-RUNTIME_update-alternatives} opkg-=
arch-config libarchive&quot;<br>
@@ -68,7 +55,6 @@ RPROVIDES_${PN} =3D &quot;opkg-collateral&quot;<br>
=C2=A0PACKAGES =3D+ &quot;libopkg&quot;<br>
<br>
=C2=A0FILES_libopkg =3D &quot;${libdir}/*.so.* ${OPKGLIBDIR}/opkg/&quot;<br=
>
-FILES_${PN} +=3D &quot;${systemd_unitdir}/system/&quot;<br>
<br>
=C2=A0BBCLASSEXTEND =3D &quot;native nativesdk&quot;<br>
<br>
-- <br>
2.13.6<br>
<br>
-- <br>
_______________________________________________<br>
Openembedded-core mailing list<br>
<a href=3D"mailto:Openembedded-core@lists.openembedded.org" target=3D"_blan=
k">Openembedded-core@lists.openembedded.org</a><br>
<a href=3D"http://lists.openembedded.org/mailman/listinfo/openembedded-core=
" rel=3D"noreferrer" target=3D"_blank">http://lists.openembedded.org/mailma=
n/listinfo/openembedded-core</a><br>
</blockquote></div><br clear=3D"all"><br>-- <br><div dir=3D"ltr" class=3D"g=
mail_signature" data-smartmail=3D"gmail_signature"><div dir=3D"ltr"><div><d=
iv dir=3D"ltr">Christopher Larson<br>kergoth at gmail dot com<br>Founder - =
BitBake, OpenEmbedded, OpenZaurus<br>Senior Software Engineer, Mentor Graph=
ics</div></div></div></div>

--0000000000002cedfc056dec6b4d--
