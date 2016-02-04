Return-Path: <pespin.shar@gmail.com>
Received: from mail-lb0-f182.google.com (mail-lb0-f182.google.com
	[209.85.217.182])
	by mail.openembedded.org (Postfix) with ESMTP id 56671771B4
	for <openembedded-core@lists.openembedded.org>;
	Thu,  4 Feb 2016 21:12:02 +0000 (UTC)
Received: by mail-lb0-f182.google.com with SMTP id dx2so38849730lbd.3
	for <openembedded-core@lists.openembedded.org>;
	Thu, 04 Feb 2016 13:12:03 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=mime-version:in-reply-to:references:date:message-id:subject:from:to
	:cc:content-type;
	bh=3/WxuAXfIKsApZbkuBrJ296r0yWIx+X334s9QA/pkPE=;
	b=p/ZSU3FIlETSIzyA+vdZH5SaTgy0Jqc4t1LNCCUH/f+YDAZFB3hP4VG84xLf3O/ia3
	LlxCQSXtywFrCtsxu1NpFa+G3lpkchgXmPo+QnJqdptthCsrpX4ARBzjGT/CG5N7s+Dd
	tNOetHpbO9Aq33vOEQd7dTMqtXiBrYwrKpSU1GACXIIyy5UE+X8dvHyrRopG8JnyFo5w
	szTH4LIFh7cMlHfbphDDKzYrbd+uz8dLA8NknJiAEeYopSKGEvRXgQAFyVxwvSwqNSLQ
	KV2/e/i9C9zvv6619YW2vqPcRIZKT5CvDVKbHTtVJFUJ3xF+qBZF5TxON+709nwEuuTw
	i3MQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:mime-version:in-reply-to:references:date
	:message-id:subject:from:to:cc:content-type;
	bh=3/WxuAXfIKsApZbkuBrJ296r0yWIx+X334s9QA/pkPE=;
	b=BlsLWBEi9Wk08i4Ekx5tLijiQfNdn3QALkMsFxDSmw6az+ov+YFi5MUZGBlI79Pl0a
	lD/sjo+9MjUyM0pD/1cBoOPxVR66RrNns6qhdUkf/TtYcbzupr4FyTiZTw+mDb0vqnIX
	vmyf6C32I3OUnbW6km5X6viOFpeS5BKlqGmXBElb0s5k6zpTtO9g0zPo1cuDQIrhXN/C
	QdP28jiejRZ4/aypR3iEhOCdkdQQoVvrJIrQoEkL74r3DElVT5ujTS+mIDL9EixeGjf0
	SrXqexv5C3SlOdD9a85LtRqBRGoklaYY2Hj37M36wQCuUJNNJ6za7MfjtlGQFKgPBeLQ
	XsVw==
X-Gm-Message-State: AG10YOSY7dSM8xlVmrkZV7mBxHPiGlDrRqeHkyjsRKYPJuVqj6gFZBzbrIDUhnIc0SjLNyMEAUBCifj03/J3+g==
MIME-Version: 1.0
X-Received: by 10.112.134.165 with SMTP id pl5mr4429212lbb.126.1454620322929; 
	Thu, 04 Feb 2016 13:12:02 -0800 (PST)
Received: by 10.25.158.193 with HTTP; Thu, 4 Feb 2016 13:12:02 -0800 (PST)
In-Reply-To: <1454379755-1799-1-git-send-email-lixin.fnst@cn.fujitsu.com>
References: <1454379755-1799-1-git-send-email-lixin.fnst@cn.fujitsu.com>
Date: Thu, 4 Feb 2016 22:12:02 +0100
Message-ID: <CAEGpDuZdDjKoWa3oDGUjmYSDEnKX=T+9CKd4dGG7xXiDnNOyfg@mail.gmail.com>
From: Pau Espin Pedrol <pespin.shar@gmail.com>
To: Li Xin <lixin.fnst@cn.fujitsu.com>
Cc: OE-core <openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH] mdadm: Add systemd support
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
X-List-Received-Date: Thu, 04 Feb 2016 21:12:03 -0000
Content-Type: multipart/alternative; boundary=089e0122976ea1aa79052af82f65

--089e0122976ea1aa79052af82f65
Content-Type: text/plain; charset=UTF-8

Please use ${systemd_system_unitdir} instead of ${systemd_unitdir}/system

Pau Espin Pedrol
mail/jabber: pespin.shar@gmail.com
http://blog.espeweb.net

2016-02-02 3:22 GMT+01:00 Li Xin <lixin.fnst@cn.fujitsu.com>:

> Add mdadm.service to support systemd systems and add configuration
> file.
>
> Signed-off-by: Li Xin <lixin.fnst@cn.fujitsu.com>
> ---
>  meta/recipes-extended/mdadm/files/mdadm.service | 13 +++++++++++++
>  meta/recipes-extended/mdadm/mdadm_3.3.4.bb      | 12 +++++++++++-
>  2 files changed, 24 insertions(+), 1 deletion(-)
>  create mode 100644 meta/recipes-extended/mdadm/files/mdadm.service
>
> diff --git a/meta/recipes-extended/mdadm/files/mdadm.service
> b/meta/recipes-extended/mdadm/files/mdadm.service
> new file mode 100644
> index 0000000..3664ceb
> --- /dev/null
> +++ b/meta/recipes-extended/mdadm/files/mdadm.service
> @@ -0,0 +1,13 @@
> +[Unit]
> +Description=Software RAID monitoring and management
> +After=syslog.target
> +ConditionPathExists=@sysconfdir@/mdadm.conf
> +
> +[Service]
> +Type=forking
> +PIDFile=@localstatedir@/run/mdadm/mdadm.pid
> +EnvironmentFile=-@sysconfdir@/sysconfig/mdmonitor
> +ExecStart=@basesbindir@/mdadm --monitor --scan -f
> --pid-file=@localstatedir@/run/mdadm/mdadm.pid
> +
> +[Install]
> +WantedBy=multi-user.target
> diff --git a/meta/recipes-extended/mdadm/mdadm_3.3.4.bb
> b/meta/recipes-extended/mdadm/mdadm_3.3.4.bb
> index 1198167..e27f384 100644
> --- a/meta/recipes-extended/mdadm/mdadm_3.3.4.bb
> +++ b/meta/recipes-extended/mdadm/mdadm_3.3.4.bb
> @@ -14,13 +14,14 @@ SRC_URI =
> "${KERNELORG_MIRROR}/linux/utils/raid/mdadm/${BPN}-${PV}.tar.xz \
>             file://mdadm-3.3.2_x32_abi_time_t.patch \
>             file://0001-Fix-typo-in-comparision.patch \
>             file://run-ptest \
> +           file://mdadm.service \
>           "
>  SRC_URI[md5sum] = "7ca8b114710f98f53f20c5787b674a09"
>  SRC_URI[sha256sum] =
> "8ae5f45306b873190e91f410709b00e51997b633c072b33f8efd9f7df022ca68"
>
>  CFLAGS += "-fno-strict-aliasing"
>
> -inherit autotools-brokensep
> +inherit autotools-brokensep systemd
>
>  EXTRA_OEMAKE = "CHECK_RUN_DIR=0"
>  # PPC64 and MIPS64 uses long long for u64 in the kernel, but powerpc's
> asm/types.h
> @@ -38,8 +39,17 @@ do_compile() {
>  do_install() {
>         export STRIP=""
>         autotools_do_install
> +        install -d ${D}/${sysconfdir}/
> +        install -m 644 ${S}/mdadm.conf-example ${D}${sysconfdir}/
> +        install -d ${D}${systemd_unitdir}/system
> +        install -m 644 ${WORKDIR}/mdadm.service
> ${D}${systemd_unitdir}/system/
> +        sed -i -e 's,@basesbindir@,${base_sbindir},g' \
> +               -e 's,@localstatedir@,${localstatedir},g' \
> +               -e 's,@sysconfdir@,${sysconfdir},g' \
> +               ${D}${systemd_unitdir}/system/mdadm.service
>  }
>
> +SYSTEMD_SERVICE_${PN} = "mdadm.service"
>  FILES_${PN} += "${base_libdir}/udev/rules.d/*.rules"
>
>  inherit ptest
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

--089e0122976ea1aa79052af82f65
Content-Type: text/html; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr">Please use ${systemd_system_unitdir} instead of ${systemd_=
unitdir}/system<br></div><div class=3D"gmail_extra"><br clear=3D"all"><div>=
<div class=3D"gmail_signature">Pau Espin Pedrol<br>mail/jabber: <a href=3D"=
mailto:pespin.shar@gmail.com" target=3D"_blank">pespin.shar@gmail.com</a><b=
r><a href=3D"http://blog.espeweb.net" target=3D"_blank">http://blog.espeweb=
.net</a><br></div></div>
<br><div class=3D"gmail_quote">2016-02-02 3:22 GMT+01:00 Li Xin <span dir=
=3D"ltr">&lt;<a href=3D"mailto:lixin.fnst@cn.fujitsu.com" target=3D"_blank"=
>lixin.fnst@cn.fujitsu.com</a>&gt;</span>:<br><blockquote class=3D"gmail_qu=
ote" style=3D"margin:0 0 0 .8ex;border-left:1px #ccc solid;padding-left:1ex=
">Add mdadm.service to support systemd systems and add configuration<br>
file.<br>
<br>
Signed-off-by: Li Xin &lt;<a href=3D"mailto:lixin.fnst@cn.fujitsu.com">lixi=
n.fnst@cn.fujitsu.com</a>&gt;<br>
---<br>
=C2=A0meta/recipes-extended/mdadm/files/mdadm.service | 13 +++++++++++++<br=
>
=C2=A0meta/recipes-extended/mdadm/<a href=3D"http://mdadm_3.3.4.bb" rel=3D"=
noreferrer" target=3D"_blank">mdadm_3.3.4.bb</a>=C2=A0 =C2=A0 =C2=A0 | 12 +=
++++++++++-<br>
=C2=A02 files changed, 24 insertions(+), 1 deletion(-)<br>
=C2=A0create mode 100644 meta/recipes-extended/mdadm/files/mdadm.service<br=
>
<br>
diff --git a/meta/recipes-extended/mdadm/files/mdadm.service b/meta/recipes=
-extended/mdadm/files/mdadm.service<br>
new file mode 100644<br>
index 0000000..3664ceb<br>
--- /dev/null<br>
+++ b/meta/recipes-extended/mdadm/files/mdadm.service<br>
@@ -0,0 +1,13 @@<br>
+[Unit]<br>
+Description=3DSoftware RAID monitoring and management<br>
+After=3Dsyslog.target<br>
+ConditionPathExists=3D@sysconfdir@/mdadm.conf<br>
+<br>
+[Service]<br>
+Type=3Dforking<br>
+PIDFile=3D@localstatedir@/run/mdadm/mdadm.pid<br>
+EnvironmentFile=3D-@sysconfdir@/sysconfig/mdmonitor<br>
+ExecStart=3D@basesbindir@/mdadm --monitor --scan -f --pid-file=3D@localsta=
tedir@/run/mdadm/mdadm.pid<br>
+<br>
+[Install]<br>
+WantedBy=3Dmulti-user.target<br>
diff --git a/meta/recipes-extended/mdadm/<a href=3D"http://mdadm_3.3.4.bb" =
rel=3D"noreferrer" target=3D"_blank">mdadm_3.3.4.bb</a> b/meta/recipes-exte=
nded/mdadm/<a href=3D"http://mdadm_3.3.4.bb" rel=3D"noreferrer" target=3D"_=
blank">mdadm_3.3.4.bb</a><br>
index 1198167..e27f384 100644<br>
--- a/meta/recipes-extended/mdadm/<a href=3D"http://mdadm_3.3.4.bb" rel=3D"=
noreferrer" target=3D"_blank">mdadm_3.3.4.bb</a><br>
+++ b/meta/recipes-extended/mdadm/<a href=3D"http://mdadm_3.3.4.bb" rel=3D"=
noreferrer" target=3D"_blank">mdadm_3.3.4.bb</a><br>
@@ -14,13 +14,14 @@ SRC_URI =3D &quot;${KERNELORG_MIRROR}/linux/utils/raid/=
mdadm/${BPN}-${PV}.tar.xz \<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 file://mdadm-3.3.2_x32_abi_time_t=
.patch \<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 file://0001-Fix-typo-in-comparisi=
on.patch \<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 file://run-ptest \<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0file://mdadm.service \<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 &quot;<br>
=C2=A0SRC_URI[md5sum] =3D &quot;7ca8b114710f98f53f20c5787b674a09&quot;<br>
=C2=A0SRC_URI[sha256sum] =3D &quot;8ae5f45306b873190e91f410709b00e51997b633=
c072b33f8efd9f7df022ca68&quot;<br>
<br>
=C2=A0CFLAGS +=3D &quot;-fno-strict-aliasing&quot;<br>
<br>
-inherit autotools-brokensep<br>
+inherit autotools-brokensep systemd<br>
<br>
=C2=A0EXTRA_OEMAKE =3D &quot;CHECK_RUN_DIR=3D0&quot;<br>
=C2=A0# PPC64 and MIPS64 uses long long for u64 in the kernel, but powerpc&=
#39;s asm/types.h<br>
@@ -38,8 +39,17 @@ do_compile() {<br>
=C2=A0do_install() {<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 export STRIP=3D&quot;&quot;<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 autotools_do_install<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 install -d ${D}/${sysconfdir}/<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 install -m 644 ${S}/mdadm.conf-example ${D}${s=
ysconfdir}/<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 install -d ${D}${systemd_unitdir}/system<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 install -m 644 ${WORKDIR}/mdadm.service ${D}${=
systemd_unitdir}/system/<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 sed -i -e &#39;s,@basesbindir@,${base_sbindir}=
,g&#39; \<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0-e &#39;s,@localsta=
tedir@,${localstatedir},g&#39; \<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0-e &#39;s,@sysconfd=
ir@,${sysconfdir},g&#39; \<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0${D}${systemd_unitd=
ir}/system/mdadm.service<br>
=C2=A0}<br>
<br>
+SYSTEMD_SERVICE_${PN} =3D &quot;mdadm.service&quot;<br>
=C2=A0FILES_${PN} +=3D &quot;${base_libdir}/udev/rules.d/*.rules&quot;<br>
<br>
=C2=A0inherit ptest<br>
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

--089e0122976ea1aa79052af82f65--
