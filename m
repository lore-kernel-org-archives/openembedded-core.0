Return-Path: <pespin.shar@gmail.com>
Received: from mail-lb0-f175.google.com (mail-lb0-f175.google.com
	[209.85.217.175])
	by mail.openembedded.org (Postfix) with ESMTP id CC062771B4
	for <openembedded-core@lists.openembedded.org>;
	Thu,  4 Feb 2016 21:14:08 +0000 (UTC)
Received: by mail-lb0-f175.google.com with SMTP id dx2so38877766lbd.3
	for <openembedded-core@lists.openembedded.org>;
	Thu, 04 Feb 2016 13:14:09 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=mime-version:in-reply-to:references:date:message-id:subject:from:to
	:cc:content-type;
	bh=wMsTXmi0pTHKuvkS1Ws03s6rke3Q8bf2EaR+2I/muAw=;
	b=NQqVSDg3hgfDoWYpbD9HK7iZc713iggB03TVRoM0yFWUSO3R35/lVyB/x2EGlgMX7K
	H3+dA/JiWHEyLW09OQBTn89cFQW0lnKjZuRnMLORqb/hwfuavFILG2tn6KQu5xgi7DFl
	kIxD7K/soSCuZNAuibBrlg8iwxsOPIq8ZGiJU0DoeNkkPPxUjzcz/D8dwMAecru992F5
	AWySDUTnU+G8ADhE2b/vYLQGioHIEOCRxKCtIMVhjaYSMLVxmDkGQInKB8SQ/C0sHpnw
	B2ybaqHF60AUrfloNsCU7WWHRCUBPJfh9/NxMP++v9saF5yYxoYV4VQPIDBtSzKp+Hpe
	3XaA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:mime-version:in-reply-to:references:date
	:message-id:subject:from:to:cc:content-type;
	bh=wMsTXmi0pTHKuvkS1Ws03s6rke3Q8bf2EaR+2I/muAw=;
	b=JBC9etwuGOVfkE0MKiT0wh0eAF4JKGNJzPKg2cyh6qKPyoQ95GYcRC3vDwA39DrK8n
	4+2Y1L8B9YULSiXSilUBuMSqNMm9uEMsrpcudZAMAUZ7s+UqdeVPxAV4/XIygVl4afsS
	/K+IWAJ817PDVdlBJ3jpWg15YwrsxlkmykPpfV5K1D6CWU4rrSWR26lOPQ7Yn+UIcnjS
	+tIRmipO+8dCBhvFsAJWtkVJdX5/FuzoH2wliAcpbg1GNyZJUIO+FkqfNu9swdc/1Y5N
	eicHa1C4zyFF5Xo5NpeyhJr1P8bzhlWuJ6BYS3Ju7pdNZdtQUBfpG5aTVtvkH6cGODBA
	rlpA==
X-Gm-Message-State: AG10YOQTn2swQc24B1E2wFjeuLzj0itsrfo0Xndzn5T1D611PQPhd0D49apwXjqNIWAEg6zag8oTrhDhXOPKqw==
MIME-Version: 1.0
X-Received: by 10.112.235.71 with SMTP id uk7mr4286315lbc.39.1454620448741;
	Thu, 04 Feb 2016 13:14:08 -0800 (PST)
Received: by 10.25.158.193 with HTTP; Thu, 4 Feb 2016 13:14:08 -0800 (PST)
In-Reply-To: <1454386797-1807-1-git-send-email-lixin.fnst@cn.fujitsu.com>
References: <1454386797-1807-1-git-send-email-lixin.fnst@cn.fujitsu.com>
Date: Thu, 4 Feb 2016 22:14:08 +0100
Message-ID: <CAEGpDuafdyYh84k-Odja=iR0iGna9KSCt6d14ui8DD7Vs_1RvQ@mail.gmail.com>
From: Pau Espin Pedrol <pespin.shar@gmail.com>
To: Li Xin <lixin.fnst@cn.fujitsu.com>
Cc: OE-core <openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH] iptables: Add systemd support
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
X-List-Received-Date: Thu, 04 Feb 2016 21:14:11 -0000
Content-Type: multipart/alternative; boundary=001a11c3c5c2216344052af837a0

--001a11c3c5c2216344052af837a0
Content-Type: text/plain; charset=UTF-8

Please use ${systemd_system_unitdir} instead of ${systemd_unitdir}/system

Pau Espin Pedrol
mail/jabber: pespin.shar@gmail.com
http://blog.espeweb.net

2016-02-02 5:19 GMT+01:00 Li Xin <lixin.fnst@cn.fujitsu.com>:

> Add iptables.service & ip6tables.service to support systemd systems.
>
> Signed-off-by: Li Xin <lixin.fnst@cn.fujitsu.com>
> ---
>  .../iptables/iptables/ip6tables.service                 | 17
> +++++++++++++++++
>  .../recipes-extended/iptables/iptables/iptables.service | 17
> +++++++++++++++++
>  meta/recipes-extended/iptables/iptables_1.4.21.bb       | 16
> +++++++++++++++-
>  3 files changed, 49 insertions(+), 1 deletion(-)
>  create mode 100644
> meta/recipes-extended/iptables/iptables/ip6tables.service
>  create mode 100644
> meta/recipes-extended/iptables/iptables/iptables.service
>
> diff --git a/meta/recipes-extended/iptables/iptables/ip6tables.service
> b/meta/recipes-extended/iptables/iptables/ip6tables.service
> new file mode 100644
> index 0000000..148a1b9
> --- /dev/null
> +++ b/meta/recipes-extended/iptables/iptables/ip6tables.service
> @@ -0,0 +1,17 @@
> +[Unit]
> +Description=IPv6 firewall with ip6tables
> +After=syslog.target
> +ConditionPathExists=/etc/default/iptables
> +
> +[Service]
> +Type=oneshot
> +RemainAfterExit=yes
> +ExecStart=/usr/libexec/iptables/ip6tables.init start
> +ExecStop=/usr/libexec/iptables/ip6tables.init stop
> +Environment=BOOTUP=serial
> +Environment=CONSOLETYPE=serial
> +StandardOutput=syslog
> +StandardError=syslog
> +
> +[Install]
> +WantedBy=basic.target
> diff --git a/meta/recipes-extended/iptables/iptables/iptables.service
> b/meta/recipes-extended/iptables/iptables/iptables.service
> new file mode 100644
> index 0000000..9745c71
> --- /dev/null
> +++ b/meta/recipes-extended/iptables/iptables/iptables.service
> @@ -0,0 +1,17 @@
> +[Unit]
> +Description=IPv4 firewall with iptables
> +After=syslog.target
> +ConditionPathExists=/etc/default/iptables
> +
> +[Service]
> +Type=oneshot
> +RemainAfterExit=yes
> +ExecStart=/usr/libexec/iptables/iptables.init start
> +ExecStop=/usr/libexec/iptables/iptables.init stop
> +Environment=BOOTUP=serial
> +Environment=CONSOLETYPE=serial
> +StandardOutput=syslog
> +StandardError=syslog
> +
> +[Install]
> +WantedBy=basic.target
> diff --git a/meta/recipes-extended/iptables/iptables_1.4.21.bb
> b/meta/recipes-extended/iptables/iptables_1.4.21.bb
> index deea5e5..84c95ea 100644
> --- a/meta/recipes-extended/iptables/iptables_1.4.21.bb
> +++ b/meta/recipes-extended/iptables/iptables_1.4.21.bb
> @@ -24,12 +24,14 @@ SRC_URI = "
> http://netfilter.org/projects/iptables/files/iptables-${PV}.tar.bz2 \
>
> file://0001-configure-Add-option-to-enable-disable-libnfnetlink.patch \
>             file://0001-fix-build-with-musl.patch \
>
> file://0002-configure.ac-only-check-conntrack-when-libnfnetlink-enabled.patch
> \
> +           file://iptables.service \
> +           file://ip6tables.service \
>            "
>
>  SRC_URI[md5sum] = "536d048c8e8eeebcd9757d0863ebb0c0"
>  SRC_URI[sha256sum] =
> "52004c68021da9a599feed27f65defcfb22128f7da2c0531c0f75de0f479d3e0"
>
> -inherit autotools pkgconfig
> +inherit autotools pkgconfig systemd
>
>  EXTRA_OECONF = "--with-kernel=${STAGING_INCDIR} \
>                 "
> @@ -46,3 +48,15 @@ do_configure_prepend() {
>         # Keep ax_check_linker_flags.m4 which belongs to autoconf-archive.
>         rm -f libtool.m4 lt~obsolete.m4 ltoptions.m4 ltsugar.m4
> ltversion.m4
>  }
> +
> +do_install_append() {
> +    install -d ${D}${systemd_unitdir}/system
> +    install -m 0644 ${WORKDIR}/ip6tables.service
> ${D}${systemd_unitdir}/system/
> +    install -m 0644 ${WORKDIR}/iptables.service
> ${D}${systemd_unitdir}/system/
> +    sed -i -e "s,/usr/libexec/iptables,${libexecdir},g" \
> +               ${D}${systemd_unitdir}/system/iptables.service
> +    sed -i -e "s,/usr/libexec/iptables,${libexecdir},g" \
> +               ${D}${systemd_unitdir}/system/ip6tables.service
> +}
> +
> +SYSTEMD_SERVICE_${PN} = "iptables.service ip6tables.service"
> --
> 1.8.4.2
>
>
>
> --
> _______________________________________________
> Openembedded-core mailing list
> Openembedded-core@lists.openembedded.org
> http://lists.openembedded.org/mailman/listinfo/openembedded-core
>

--001a11c3c5c2216344052af837a0
Content-Type: text/html; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr">Please use ${systemd_system_unitdir} instead of ${systemd_=
unitdir}/system</div><div class=3D"gmail_extra"><br clear=3D"all"><div><div=
 class=3D"gmail_signature">Pau Espin Pedrol<br>mail/jabber: <a href=3D"mail=
to:pespin.shar@gmail.com" target=3D"_blank">pespin.shar@gmail.com</a><br><a=
 href=3D"http://blog.espeweb.net" target=3D"_blank">http://blog.espeweb.net=
</a><br></div></div>
<br><div class=3D"gmail_quote">2016-02-02 5:19 GMT+01:00 Li Xin <span dir=
=3D"ltr">&lt;<a href=3D"mailto:lixin.fnst@cn.fujitsu.com" target=3D"_blank"=
>lixin.fnst@cn.fujitsu.com</a>&gt;</span>:<br><blockquote class=3D"gmail_qu=
ote" style=3D"margin:0 0 0 .8ex;border-left:1px #ccc solid;padding-left:1ex=
">Add iptables.service &amp; ip6tables.service to support systemd systems.<=
br>
<br>
Signed-off-by: Li Xin &lt;<a href=3D"mailto:lixin.fnst@cn.fujitsu.com">lixi=
n.fnst@cn.fujitsu.com</a>&gt;<br>
---<br>
=C2=A0.../iptables/iptables/ip6tables.service=C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0| 17 +++++++++++++++++<br>
=C2=A0.../recipes-extended/iptables/iptables/iptables.service | 17 ++++++++=
+++++++++<br>
=C2=A0meta/recipes-extended/iptables/<a href=3D"http://iptables_1.4.21.bb" =
rel=3D"noreferrer" target=3D"_blank">iptables_1.4.21.bb</a>=C2=A0 =C2=A0 =
=C2=A0 =C2=A0| 16 +++++++++++++++-<br>
=C2=A03 files changed, 49 insertions(+), 1 deletion(-)<br>
=C2=A0create mode 100644 meta/recipes-extended/iptables/iptables/ip6tables.=
service<br>
=C2=A0create mode 100644 meta/recipes-extended/iptables/iptables/iptables.s=
ervice<br>
<br>
diff --git a/meta/recipes-extended/iptables/iptables/ip6tables.service b/me=
ta/recipes-extended/iptables/iptables/ip6tables.service<br>
new file mode 100644<br>
index 0000000..148a1b9<br>
--- /dev/null<br>
+++ b/meta/recipes-extended/iptables/iptables/ip6tables.service<br>
@@ -0,0 +1,17 @@<br>
+[Unit]<br>
+Description=3DIPv6 firewall with ip6tables<br>
+After=3Dsyslog.target<br>
+ConditionPathExists=3D/etc/default/iptables<br>
+<br>
+[Service]<br>
+Type=3Doneshot<br>
+RemainAfterExit=3Dyes<br>
+ExecStart=3D/usr/libexec/iptables/ip6tables.init start<br>
+ExecStop=3D/usr/libexec/iptables/ip6tables.init stop<br>
+Environment=3DBOOTUP=3Dserial<br>
+Environment=3DCONSOLETYPE=3Dserial<br>
+StandardOutput=3Dsyslog<br>
+StandardError=3Dsyslog<br>
+<br>
+[Install]<br>
+WantedBy=3Dbasic.target<br>
diff --git a/meta/recipes-extended/iptables/iptables/iptables.service b/met=
a/recipes-extended/iptables/iptables/iptables.service<br>
new file mode 100644<br>
index 0000000..9745c71<br>
--- /dev/null<br>
+++ b/meta/recipes-extended/iptables/iptables/iptables.service<br>
@@ -0,0 +1,17 @@<br>
+[Unit]<br>
+Description=3DIPv4 firewall with iptables<br>
+After=3Dsyslog.target<br>
+ConditionPathExists=3D/etc/default/iptables<br>
+<br>
+[Service]<br>
+Type=3Doneshot<br>
+RemainAfterExit=3Dyes<br>
+ExecStart=3D/usr/libexec/iptables/iptables.init start<br>
+ExecStop=3D/usr/libexec/iptables/iptables.init stop<br>
+Environment=3DBOOTUP=3Dserial<br>
+Environment=3DCONSOLETYPE=3Dserial<br>
+StandardOutput=3Dsyslog<br>
+StandardError=3Dsyslog<br>
+<br>
+[Install]<br>
+WantedBy=3Dbasic.target<br>
diff --git a/meta/recipes-extended/iptables/<a href=3D"http://iptables_1.4.=
21.bb" rel=3D"noreferrer" target=3D"_blank">iptables_1.4.21.bb</a> b/meta/r=
ecipes-extended/iptables/<a href=3D"http://iptables_1.4.21.bb" rel=3D"noref=
errer" target=3D"_blank">iptables_1.4.21.bb</a><br>
index deea5e5..84c95ea 100644<br>
--- a/meta/recipes-extended/iptables/<a href=3D"http://iptables_1.4.21.bb" =
rel=3D"noreferrer" target=3D"_blank">iptables_1.4.21.bb</a><br>
+++ b/meta/recipes-extended/iptables/<a href=3D"http://iptables_1.4.21.bb" =
rel=3D"noreferrer" target=3D"_blank">iptables_1.4.21.bb</a><br>
@@ -24,12 +24,14 @@ SRC_URI =3D &quot;<a href=3D"http://netfilter.org/proje=
cts/iptables/files/iptables-${PV}.tar.bz2" rel=3D"noreferrer" target=3D"_bl=
ank">http://netfilter.org/projects/iptables/files/iptables-${PV}.tar.bz2</a=
> \<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 file://0001-configure-Add-option-=
to-enable-disable-libnfnetlink.patch \<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 file://0001-fix-build-with-musl.p=
atch \<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 file://0002-configure.ac-only-che=
ck-conntrack-when-libnfnetlink-enabled.patch \<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0file://iptables.service \<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0file://ip6tables.service \<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0&quot;<br>
<br>
=C2=A0SRC_URI[md5sum] =3D &quot;536d048c8e8eeebcd9757d0863ebb0c0&quot;<br>
=C2=A0SRC_URI[sha256sum] =3D &quot;52004c68021da9a599feed27f65defcfb22128f7=
da2c0531c0f75de0f479d3e0&quot;<br>
<br>
-inherit autotools pkgconfig<br>
+inherit autotools pkgconfig systemd<br>
<br>
=C2=A0EXTRA_OECONF =3D &quot;--with-kernel=3D${STAGING_INCDIR} \<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 &quot;<br>
@@ -46,3 +48,15 @@ do_configure_prepend() {<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 # Keep ax_check_linker_flags.m4 which belongs t=
o autoconf-archive.<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 rm -f libtool.m4 lt~obsolete.m4 ltoptions.m4 lt=
sugar.m4 ltversion.m4<br>
=C2=A0}<br>
+<br>
+do_install_append() {<br>
+=C2=A0 =C2=A0 install -d ${D}${systemd_unitdir}/system<br>
+=C2=A0 =C2=A0 install -m 0644 ${WORKDIR}/ip6tables.service ${D}${systemd_u=
nitdir}/system/<br>
+=C2=A0 =C2=A0 install -m 0644 ${WORKDIR}/iptables.service ${D}${systemd_un=
itdir}/system/<br>
+=C2=A0 =C2=A0 sed -i -e &quot;s,/usr/libexec/iptables,${libexecdir},g&quot=
; \<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0${D}${systemd_unitd=
ir}/system/iptables.service<br>
+=C2=A0 =C2=A0 sed -i -e &quot;s,/usr/libexec/iptables,${libexecdir},g&quot=
; \<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0${D}${systemd_unitd=
ir}/system/ip6tables.service<br>
+}<br>
+<br>
+SYSTEMD_SERVICE_${PN} =3D &quot;iptables.service ip6tables.service&quot;<b=
r>
<span class=3D"HOEnZb"><font color=3D"#888888">--<br>
1.8.4.2<br>
<br>
<br>
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

--001a11c3c5c2216344052af837a0--
