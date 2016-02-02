Return-Path: <pespin.shar@gmail.com>
Received: from mail-lb0-f169.google.com (mail-lb0-f169.google.com
	[209.85.217.169])
	by mail.openembedded.org (Postfix) with ESMTP id 767C4772E7
	for <openembedded-core@lists.openembedded.org>;
	Tue,  2 Feb 2016 22:25:42 +0000 (UTC)
Received: by mail-lb0-f169.google.com with SMTP id x4so1626662lbm.0
	for <openembedded-core@lists.openembedded.org>;
	Tue, 02 Feb 2016 14:25:43 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=mime-version:in-reply-to:references:date:message-id:subject:from:to
	:cc:content-type;
	bh=xxGBL2iRHSt/V2Wo9D2hZB7T8Mdp76j6wGEqSwF3AOo=;
	b=reJon4LdsTmOr1fORILjv6MGDaiQ0MjF2TSthGso8OozK3B5jfq/gmm0jPU8ISavrm
	I6g4sPrZWbbvnS/YqBtpgm6JTvNMIRoM/1Qsa8s1mh/Uzd/W5Vyoo/zUs9G4eb5nYc6l
	Q1WFJMLFY89nFiRg2Bpt5PS4bkWGGf4WaF9+p7ue4bZzJ3Ce338pfTIQE2oKwyFwKgxT
	HFL1MGzCzgml3pouMKpiaCGIiAZ4ruP6ZsdxqV+0YOD9lC9K37Rqjl8yB0Sx2hEoKy3o
	YJSalWD8EGnWkQuSRXvGpFNv1h7M7xfprU1VwAUBdAw9E2RuHTkBComeFGuhAn/0wfBy
	rpqw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:mime-version:in-reply-to:references:date
	:message-id:subject:from:to:cc:content-type;
	bh=xxGBL2iRHSt/V2Wo9D2hZB7T8Mdp76j6wGEqSwF3AOo=;
	b=PeS5K8xvcidoWk7JPYRf+u+tTMf5T1XuxvmavWMFsbTpIG+QCWnAOgOlpMXu7snX/d
	pZXGJQ5LQlFAZVz1HScdwLAaWWwmEAj9Oz84/CJVUso+xQfORNcPGMn/r0slnLGhMHFz
	eaKhUqd8yDbOPt5Oc2rGgYKN59Bo8FNTaSewytzQxcld8A2OK8GSI1Jh9KZ5YSkg1e9Z
	TeKjZbtr83SGBixTcOZeN+rEQ34I/CkoSfxXcRbyQ3euM91i+fABm3TFP8bjxr23SKID
	zcJdtZIJkBxtEPTrZcmr8OnB+cnY9lnNzolHMhYA88AuoKykIE4oInenVsJQ+MAnqBm+
	kviQ==
X-Gm-Message-State: AG10YOSve2qq2BJ97exLAAcsde2CfXpopbE3PPQNBpIaWQAOe30dhzKLrugUEz1/ZhLseN7F3bWEZ2YhJuArcw==
MIME-Version: 1.0
X-Received: by 10.112.172.2 with SMTP id ay2mr2629539lbc.91.1454451942394;
	Tue, 02 Feb 2016 14:25:42 -0800 (PST)
Received: by 10.25.158.193 with HTTP; Tue, 2 Feb 2016 14:25:42 -0800 (PST)
In-Reply-To: <1453690127-24751-1-git-send-email-rongqing.li@windriver.com>
References: <1453690127-24751-1-git-send-email-rongqing.li@windriver.com>
Date: Tue, 2 Feb 2016 23:25:42 +0100
Message-ID: <CAEGpDua-Aur4Xd6AUJv0_9c39dchPNZQWOzk+vEWny3fy2aZFA@mail.gmail.com>
From: Pau Espin Pedrol <pespin.shar@gmail.com>
To: rongqing.li@windriver.com
Cc: OE-core <openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH] [v2] watchdog: enable systemd support
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
X-List-Received-Date: Tue, 02 Feb 2016 22:25:45 -0000
Content-Type: multipart/alternative; boundary=001a11c3452e5e9642052ad0fbe9

--001a11c3452e5e9642052ad0fbe9
Content-Type: text/plain; charset=UTF-8

Hi,
Please could you use ${systemd_system_unitdir} instead of
${systemd_unitdir}/system ?

Pau Espin Pedrol
mail/jabber: pespin.shar@gmail.com
http://blog.espeweb.net

2016-01-25 3:48 GMT+01:00 <rongqing.li@windriver.com>:

> From: Roy Li <rongqing.li@windriver.com>
>
> 1. inherit systemd, and add two unit files which are from Fedora 23
> 2. auto load soft dog kernel module
>
> Signed-off-by: Roy Li <rongqing.li@windriver.com>
> ---
>  .../watchdog/watchdog/watchdog-ping.service             | 12 ++++++++++++
>  .../recipes-extended/watchdog/watchdog/watchdog.service | 12 ++++++++++++
>  meta/recipes-extended/watchdog/watchdog_5.14.bb         | 17
> ++++++++++++++++-
>  3 files changed, 40 insertions(+), 1 deletion(-)
>  create mode 100644
> meta/recipes-extended/watchdog/watchdog/watchdog-ping.service
>  create mode 100644
> meta/recipes-extended/watchdog/watchdog/watchdog.service
>
> diff --git a/meta/recipes-extended/watchdog/watchdog/watchdog-ping.service
> b/meta/recipes-extended/watchdog/watchdog/watchdog-ping.service
> new file mode 100644
> index 0000000..fce6e12
> --- /dev/null
> +++ b/meta/recipes-extended/watchdog/watchdog/watchdog-ping.service
> @@ -0,0 +1,12 @@
> +[Unit]
> +Description=watchdog daemon for use with ping test / network dependency
> +After=network.target
> +Conflicts=watchdog.service
> +
> +[Service]
> +Type=forking
> +ExecStart=@SBINDIR@/watchdog
> +ControlGroup=cpu:/
> +
> +[Install]
> +WantedBy=multi-user.target
> diff --git a/meta/recipes-extended/watchdog/watchdog/watchdog.service
> b/meta/recipes-extended/watchdog/watchdog/watchdog.service
> new file mode 100644
> index 0000000..f945bc9
> --- /dev/null
> +++ b/meta/recipes-extended/watchdog/watchdog/watchdog.service
> @@ -0,0 +1,12 @@
> +[Unit]
> +Description=watchdog daemon
> +# man systemd.special
> +# auto added After=basic.target
> +
> +[Service]
> +Type=forking
> +ExecStart=@SBINDIR@/watchdog
> +ControlGroup=cpu:/
> +
> +[Install]
> +WantedBy=multi-user.target
> diff --git a/meta/recipes-extended/watchdog/watchdog_5.14.bb
> b/meta/recipes-extended/watchdog/watchdog_5.14.bb
> index fc717bc..9e21075 100644
> --- a/meta/recipes-extended/watchdog/watchdog_5.14.bb
> +++ b/meta/recipes-extended/watchdog/watchdog_5.14.bb
> @@ -14,6 +14,8 @@ SRC_URI =
> "${SOURCEFORGE_MIRROR}/watchdog/watchdog-${PV}.tar.gz \
>            file://watchdog-init.patch \
>            file://watchdog-conf.patch \
>
>  file://0001-Fix-build-issues-found-with-non-glibc-C-libraries.patch \
> +          file://watchdog-ping.service \
> +          file://watchdog.service \
>  "
>
>  SRC_URI[md5sum] = "5b2dba0c593942f4acc100bca0d560c4"
> @@ -23,7 +25,7 @@ UPSTREAM_CHECK_URI = "
> http://sourceforge.net/projects/watchdog/files/watchdog/"
>  UPSTREAM_CHECK_REGEX = "/watchdog/(?P<pver>(\d+[\.\-_]*)+)/"
>
>  inherit autotools
> -inherit update-rc.d
> +inherit update-rc.d systemd
>
>  DEPENDS_append_libc-musl = " libtirpc "
>  CFLAGS_append_libc-musl = " -I${STAGING_INCDIR}/tirpc "
> @@ -34,6 +36,19 @@ INITSCRIPT_PARAMS = "start 15 1 2 3 4 5 . stop 85 0 6 ."
>
>  RRECOMMENDS_${PN} = "kernel-module-softdog"
>
> +
> +SYSTEMD_SERVICE_${PN} = "watchdog.service"
> +
>  do_install_append() {
>         install -D ${S}/redhat/watchdog.init
> ${D}/${sysconfdir}/init.d/watchdog.sh
> +       install -d ${D}${systemd_unitdir}/system
> +       install -m 0644 ${WORKDIR}/watchdog*.service
> ${D}${systemd_unitdir}/system
> +
> +       if
> ${@bb.utils.contains('DISTRO_FEATURES','systemd','true','false',d)}; then
> +               install -d ${D}${sysconfdir}/modules-load.d
> +               echo "softdog" >
> ${D}${sysconfdir}/modules-load.d/softdog.conf
> +               sed -i -e 's,@SBINDIR@,${sbindir},g'
> ${D}${systemd_unitdir}/system/*.service
> +       fi
>  }
> +
> +FILES_${PN} += "${systemd_unitdir}/system/*"
> --
> 1.9.1
>
> --
> _______________________________________________
> Openembedded-core mailing list
> Openembedded-core@lists.openembedded.org
> http://lists.openembedded.org/mailman/listinfo/openembedded-core
>

--001a11c3452e5e9642052ad0fbe9
Content-Type: text/html; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div>Hi,<br></div>Please could you use ${systemd_system_un=
itdir} instead of ${systemd_unitdir}/system ?<br></div><div class=3D"gmail_=
extra"><br clear=3D"all"><div><div class=3D"gmail_signature">Pau Espin Pedr=
ol<br>mail/jabber: <a href=3D"mailto:pespin.shar@gmail.com" target=3D"_blan=
k">pespin.shar@gmail.com</a><br><a href=3D"http://blog.espeweb.net" target=
=3D"_blank">http://blog.espeweb.net</a><br></div></div>
<br><div class=3D"gmail_quote">2016-01-25 3:48 GMT+01:00  <span dir=3D"ltr"=
>&lt;<a href=3D"mailto:rongqing.li@windriver.com" target=3D"_blank">rongqin=
g.li@windriver.com</a>&gt;</span>:<br><blockquote class=3D"gmail_quote" sty=
le=3D"margin:0 0 0 .8ex;border-left:1px #ccc solid;padding-left:1ex">From: =
Roy Li &lt;<a href=3D"mailto:rongqing.li@windriver.com">rongqing.li@windriv=
er.com</a>&gt;<br>
<br>
1. inherit systemd, and add two unit files which are from Fedora 23<br>
2. auto load soft dog kernel module<br>
<br>
Signed-off-by: Roy Li &lt;<a href=3D"mailto:rongqing.li@windriver.com">rong=
qing.li@windriver.com</a>&gt;<br>
---<br>
=C2=A0.../watchdog/watchdog/watchdog-ping.service=C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0| 12 ++++++++++++<br>
=C2=A0.../recipes-extended/watchdog/watchdog/watchdog.service | 12 ++++++++=
++++<br>
=C2=A0meta/recipes-extended/watchdog/<a href=3D"http://watchdog_5.14.bb" re=
l=3D"noreferrer" target=3D"_blank">watchdog_5.14.bb</a>=C2=A0 =C2=A0 =C2=A0=
 =C2=A0 =C2=A0| 17 ++++++++++++++++-<br>
=C2=A03 files changed, 40 insertions(+), 1 deletion(-)<br>
=C2=A0create mode 100644 meta/recipes-extended/watchdog/watchdog/watchdog-p=
ing.service<br>
=C2=A0create mode 100644 meta/recipes-extended/watchdog/watchdog/watchdog.s=
ervice<br>
<br>
diff --git a/meta/recipes-extended/watchdog/watchdog/watchdog-ping.service =
b/meta/recipes-extended/watchdog/watchdog/watchdog-ping.service<br>
new file mode 100644<br>
index 0000000..fce6e12<br>
--- /dev/null<br>
+++ b/meta/recipes-extended/watchdog/watchdog/watchdog-ping.service<br>
@@ -0,0 +1,12 @@<br>
+[Unit]<br>
+Description=3Dwatchdog daemon for use with ping test / network dependency<=
br>
+After=3Dnetwork.target<br>
+Conflicts=3Dwatchdog.service<br>
+<br>
+[Service]<br>
+Type=3Dforking<br>
+ExecStart=3D@SBINDIR@/watchdog<br>
+ControlGroup=3Dcpu:/<br>
+<br>
+[Install]<br>
+WantedBy=3Dmulti-user.target<br>
diff --git a/meta/recipes-extended/watchdog/watchdog/watchdog.service b/met=
a/recipes-extended/watchdog/watchdog/watchdog.service<br>
new file mode 100644<br>
index 0000000..f945bc9<br>
--- /dev/null<br>
+++ b/meta/recipes-extended/watchdog/watchdog/watchdog.service<br>
@@ -0,0 +1,12 @@<br>
+[Unit]<br>
+Description=3Dwatchdog daemon<br>
+# man systemd.special<br>
+# auto added After=3Dbasic.target<br>
+<br>
+[Service]<br>
+Type=3Dforking<br>
+ExecStart=3D@SBINDIR@/watchdog<br>
+ControlGroup=3Dcpu:/<br>
+<br>
+[Install]<br>
+WantedBy=3Dmulti-user.target<br>
diff --git a/meta/recipes-extended/watchdog/<a href=3D"http://watchdog_5.14=
.bb" rel=3D"noreferrer" target=3D"_blank">watchdog_5.14.bb</a> b/meta/recip=
es-extended/watchdog/<a href=3D"http://watchdog_5.14.bb" rel=3D"noreferrer"=
 target=3D"_blank">watchdog_5.14.bb</a><br>
index fc717bc..9e21075 100644<br>
--- a/meta/recipes-extended/watchdog/<a href=3D"http://watchdog_5.14.bb" re=
l=3D"noreferrer" target=3D"_blank">watchdog_5.14.bb</a><br>
+++ b/meta/recipes-extended/watchdog/<a href=3D"http://watchdog_5.14.bb" re=
l=3D"noreferrer" target=3D"_blank">watchdog_5.14.bb</a><br>
@@ -14,6 +14,8 @@ SRC_URI =3D &quot;${SOURCEFORGE_MIRROR}/watchdog/watchdog=
-${PV}.tar.gz \<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0file://watchdog-init.patch \<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0file://watchdog-conf.patch \<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0file://0001-Fix-build-issues-found=
-with-non-glibc-C-libraries.patch \<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 file://watchdog-ping.service \<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 file://watchdog.service \<br>
=C2=A0&quot;<br>
<br>
=C2=A0SRC_URI[md5sum] =3D &quot;5b2dba0c593942f4acc100bca0d560c4&quot;<br>
@@ -23,7 +25,7 @@ UPSTREAM_CHECK_URI =3D &quot;<a href=3D"http://sourceforg=
e.net/projects/watchdog/files/watchdog/" rel=3D"noreferrer" target=3D"_blan=
k">http://sourceforge.net/projects/watchdog/files/watchdog/</a>&quot;<br>
=C2=A0UPSTREAM_CHECK_REGEX =3D &quot;/watchdog/(?P&lt;pver&gt;(\d+[\.\-_]*)=
+)/&quot;<br>
<br>
=C2=A0inherit autotools<br>
-inherit update-rc.d<br>
+inherit update-rc.d systemd<br>
<br>
=C2=A0DEPENDS_append_libc-musl =3D &quot; libtirpc &quot;<br>
=C2=A0CFLAGS_append_libc-musl =3D &quot; -I${STAGING_INCDIR}/tirpc &quot;<b=
r>
@@ -34,6 +36,19 @@ INITSCRIPT_PARAMS =3D &quot;start 15 1 2 3 4 5 . stop 85=
 0 6 .&quot;<br>
<br>
=C2=A0RRECOMMENDS_${PN} =3D &quot;kernel-module-softdog&quot;<br>
<br>
+<br>
+SYSTEMD_SERVICE_${PN} =3D &quot;watchdog.service&quot;<br>
+<br>
=C2=A0do_install_append() {<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 install -D ${S}/redhat/watchdog.init ${D}/${sys=
confdir}/init.d/watchdog.sh<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0install -d ${D}${systemd_unitdir}/system<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0install -m 0644 ${WORKDIR}/watchdog*.service ${=
D}${systemd_unitdir}/system<br>
+<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0if ${@bb.utils.contains(&#39;DISTRO_FEATURES&#3=
9;,&#39;systemd&#39;,&#39;true&#39;,&#39;false&#39;,d)}; then<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0install -d ${D}${sy=
sconfdir}/modules-load.d<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0echo &quot;softdog&=
quot; &gt; ${D}${sysconfdir}/modules-load.d/softdog.conf<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0sed -i -e &#39;s,@S=
BINDIR@,${sbindir},g&#39; ${D}${systemd_unitdir}/system/*.service<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0fi<br>
=C2=A0}<br>
+<br>
+FILES_${PN} +=3D &quot;${systemd_unitdir}/system/*&quot;<br>
<span class=3D"HOEnZb"><font color=3D"#888888">--<br>
1.9.1<br>
<br>
--<br>
_______________________________________________<br>
Openembedded-core mailing list<br>
<a href=3D"mailto:Openembedded-core@lists.openembedded.org">Openembedded-co=
re@lists.openembedded.org</a><br>
<a href=3D"http://lists.openembedded.org/mailman/listinfo/openembedded-core=
" rel=3D"noreferrer" target=3D"_blank">http://lists.openembedded.org/mailma=
n/listinfo/openembedded-core</a><br>
</font></span></blockquote></div><br></div>

--001a11c3452e5e9642052ad0fbe9--
