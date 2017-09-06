Return-Path: <martin.jansa@gmail.com>
Received: from mail-ua0-f195.google.com (mail-ua0-f195.google.com
	[209.85.217.195])
	by mail.openembedded.org (Postfix) with ESMTP id E2AA470100
	for <openembedded-core@lists.openembedded.org>;
	Wed,  6 Sep 2017 18:35:30 +0000 (UTC)
Received: by mail-ua0-f195.google.com with SMTP id k23so2448533uaf.3
	for <openembedded-core@lists.openembedded.org>;
	Wed, 06 Sep 2017 11:35:32 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc; bh=gCyeO1v6hjCu0iOlK2MRePDZ8Q0ym3pMZHlNlSFCnjw=;
	b=Ywd2pmoQUwg3HV/LJw5UbGnIFNI/GKENhjJc1zJqmV2DgPGAi2/yjl+nXVrlJx6Wb5
	4dIbLkJUBM7mT3Zgte4by5+M172KNDz4FobXS4xLpHWlvgCOE1dg+J+HHqKPbKlJWmCw
	cdJGJbcGNm7yRSH0hQ6jWQZ1Bvxd+Vvmg6sd5XMkhw4AaO2bDefOZ5w2TeakVCTeme5k
	RJEzMYbMKB4FWXomcnPM7OIJj1iEhvIUcZo0QCMqe+DKPKAWq07R2LYeuU9eJaEh1F4u
	kMcmx1HhnLg+SZIkVtt8m5b4ONg0LhDIOoOPJYzhriPbWhFcWGDvbWd/bvscvlL19x2z
	18HA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc;
	bh=gCyeO1v6hjCu0iOlK2MRePDZ8Q0ym3pMZHlNlSFCnjw=;
	b=DXI9ijSenox8ewJijEDeIIb3AcLXOljMtv9gFdbXgW17RdKCc3LfLMZ+5l0c+xcEcu
	GepLTx7ysWuzekWoJOvbNZ0hhvP3lK2HgpD/v6wvAZh/3Fx50dyYhUQ+vccaGpYkOFbg
	lSAdXQVx4grheMtDZMvH2yZhwGEINN/CW6mhfrePQJsPuvtTdBBx7cCuJnw6BVKp86ii
	uraJn5pdWjria4v75H3o6SfIscdwgcwgxa10pf9wEpWJpW0qZmA+BFvSYu4QXa7J9PH4
	ngBEBSCpZSXRAhSDrX8PTbxmlAgCaVTdp77eQ3baF6IPDNOiTWArNE9mUJ96z6lYF5+j
	I6Sw==
X-Gm-Message-State: AHPjjUiT5yOJsq7ZVm4pO27Mg5LrVmtoJKJVIXJLuA2+VSFKL5nWEQ1n
	D1EWXEgg25eddN0oo+ZSXmSlqrSMig==
X-Google-Smtp-Source: ADKCNb5g5OfzaIPk4iiA2Z60vKCWV6FKElVec0MSVoNKRHrcVhWRh+Xjh5q5e8LM4CBkl4eq7iRt7cogYd+ozNWrmzA=
X-Received: by 10.176.2.5 with SMTP id 5mr58040uas.160.1504722931818; Wed, 06
	Sep 2017 11:35:31 -0700 (PDT)
MIME-Version: 1.0
Received: by 10.103.15.69 with HTTP; Wed, 6 Sep 2017 11:35:31 -0700 (PDT)
In-Reply-To: <20170815185534.118522-1-jason.wessel@windriver.com>
References: <20170815185534.118522-1-jason.wessel@windriver.com>
From: Martin Jansa <martin.jansa@gmail.com>
Date: Wed, 6 Sep 2017 20:35:31 +0200
Message-ID: <CA+chaQcVcpkTVPCa7xdpMJZ+dWWdHCZrf66nPsyFOpj+iEos=A@mail.gmail.com>
To: Jason Wessel <jason.wessel@windriver.com>
Cc: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH] systemd: Fix rootfs transaction error when PACKAGECONFIG has polkit
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
X-List-Received-Date: Wed, 06 Sep 2017 18:35:31 -0000
Content-Type: multipart/alternative; boundary="001a113cfa6ad6250c0558899bd6"

--001a113cfa6ad6250c0558899bd6
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Does this work on hosts without polkitd user?

Here it failed with:

| chown: invalid user: =E2=80=98polkitd:root=E2=80=99






On Tue, Aug 15, 2017 at 8:55 PM, Jason Wessel <jason.wessel@windriver.com>
wrote:

> The systemd 234 added some files to the polkit directory and the
> directory the files live in must be owned by the polkitd user, else
> you will receive the following error when the rootfs is being
> assembled:
>
> Error: Transaction check error:
>   file /usr/share/polkit-1/rules.d conflicts between attempted installs o=
f
> polkit-0.113-r0.15.core2_64 and systemd-1:234-r0.0.core2_64
>
> The fix similar to other packages such as libvirt where the user must
> exist and the directory must be created with the proper attributes.
>
> Signed-off-by: Jason Wessel <jason.wessel@windriver.com>
> ---
>  meta/recipes-core/systemd/systemd_234.bb | 9 +++++++++
>  1 file changed, 9 insertions(+)
>
> diff --git a/meta/recipes-core/systemd/systemd_234.bb
> b/meta/recipes-core/systemd/systemd_234.bb
> index ad7fc99b90..4560cf4175 100644
> --- a/meta/recipes-core/systemd/systemd_234.bb
> +++ b/meta/recipes-core/systemd/systemd_234.bb
> @@ -245,6 +245,14 @@ do_install() {
>                 ln -s ../run/systemd/resolve/resolv.conf
> ${D}${sysconfdir}/resolv-conf.systemd
>         fi
>         install -Dm 0755 ${S}/src/systemctl/systemd-sysv-install.SKELETON
> ${D}${systemd_unitdir}/systemd-sysv-install
> +
> +       # If polkit is setup fixup permissions and ownership
> +       if [ "${@bb.utils.contains('PACKAGECONFIG', 'polkit', 'polkit',
> '', d)}" =3D "polkit" ] ; then
> +           if [ -d ${D}${datadir}/polkit-1/rules.d ] ; then
> +               chmod 700 ${D}${datadir}/polkit-1/rules.d
> +               chown polkitd:root ${D}${datadir}/polkit-1/rules.d
> +           fi
> +       fi
>  }
>
>  do_install_ptest () {
> @@ -308,6 +316,7 @@ USERADD_PARAM_${PN} +=3D "${@bb.utils.contains('PACKA=
GECONFIG',
> 'timesyncd', '--sy
>  USERADD_PARAM_${PN} +=3D "${@bb.utils.contains('PACKAGECONFIG',
> 'networkd', '--system -d / -M --shell /bin/nologin systemd-network;', '',
> d)}"
>  USERADD_PARAM_${PN} +=3D "${@bb.utils.contains('PACKAGECONFIG',
> 'coredump', '--system -d / -M --shell /bin/nologin systemd-coredump;', ''=
,
> d)}"
>  USERADD_PARAM_${PN} +=3D "${@bb.utils.contains('PACKAGECONFIG',
> 'resolved', '--system -d / -M --shell /bin/nologin systemd-resolve;', '',
> d)}"
> +USERADD_PARAM_${PN} +=3D "${@bb.utils.contains('PACKAGECONFIG', 'polkit'=
,
> '--system --no-create-home --user-group --home-dir ${sysconfdir}/polkit-1
> polkitd;', '', d)}"
>  GROUPADD_PARAM_${PN} =3D "-r lock; -r systemd-journal"
>  USERADD_PARAM_${PN}-extra-utils +=3D "--system -d / -M --shell
> /bin/nologin systemd-bus-proxy;"
>
> --
> 2.11.0
>
> --
> _______________________________________________
> Openembedded-core mailing list
> Openembedded-core@lists.openembedded.org
> http://lists.openembedded.org/mailman/listinfo/openembedded-core
>

--001a113cfa6ad6250c0558899bd6
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr">Does this work on hosts without polkitd user?<div><br></di=
v><div>Here it failed with:</div><div><br></div><div><div>| chown: invalid =
user: =E2=80=98polkitd:root=E2=80=99</div><div><br></div><div><br></div><di=
v><br></div><div><br></div><div><br></div></div></div><div class=3D"gmail_e=
xtra"><br><div class=3D"gmail_quote">On Tue, Aug 15, 2017 at 8:55 PM, Jason=
 Wessel <span dir=3D"ltr">&lt;<a href=3D"mailto:jason.wessel@windriver.com"=
 target=3D"_blank">jason.wessel@windriver.com</a>&gt;</span> wrote:<br><blo=
ckquote class=3D"gmail_quote" style=3D"margin:0 0 0 .8ex;border-left:1px #c=
cc solid;padding-left:1ex">The systemd 234 added some files to the polkit d=
irectory and the<br>
directory the files live in must be owned by the polkitd user, else<br>
you will receive the following error when the rootfs is being<br>
assembled:<br>
<br>
Error: Transaction check error:<br>
=C2=A0 file /usr/share/polkit-1/rules.d conflicts between attempted install=
s of polkit-0.113-r0.15.core2_64 and systemd-1:234-r0.0.core2_64<br>
<br>
The fix similar to other packages such as libvirt where the user must<br>
exist and the directory must be created with the proper attributes.<br>
<br>
Signed-off-by: Jason Wessel &lt;<a href=3D"mailto:jason.wessel@windriver.co=
m">jason.wessel@windriver.com</a>&gt;<br>
---<br>
=C2=A0meta/recipes-core/systemd/<a href=3D"http://systemd_234.bb" rel=3D"no=
referrer" target=3D"_blank">syst<wbr>emd_234.bb</a> | 9 +++++++++<br>
=C2=A01 file changed, 9 insertions(+)<br>
<br>
diff --git a/meta/recipes-core/systemd/<a href=3D"http://systemd_234.bb" re=
l=3D"noreferrer" target=3D"_blank">sy<wbr>stemd_234.bb</a> b/meta/recipes-c=
ore/systemd/<a href=3D"http://systemd_234.bb" rel=3D"noreferrer" target=3D"=
_blank">sy<wbr>stemd_234.bb</a><br>
index ad7fc99b90..4560cf4175 100644<br>
--- a/meta/recipes-core/systemd/<a href=3D"http://systemd_234.bb" rel=3D"no=
referrer" target=3D"_blank">sy<wbr>stemd_234.bb</a><br>
+++ b/meta/recipes-core/systemd/<a href=3D"http://systemd_234.bb" rel=3D"no=
referrer" target=3D"_blank">sy<wbr>stemd_234.bb</a><br>
@@ -245,6 +245,14 @@ do_install() {<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 ln -s ../run/system=
d/resolve/resolv.<wbr>conf ${D}${sysconfdir}/resolv-conf.<wbr>systemd<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 fi<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 install -Dm 0755 ${S}/src/systemctl/systemd-<wb=
r>sysv-install.SKELETON ${D}${systemd_unitdir}/<wbr>systemd-sysv-install<br=
>
+<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0# If polkit is setup fixup permissions and owne=
rship<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0if [ &quot;${@bb.utils.contains(&#39;<wbr>PACKA=
GECONFIG&#39;, &#39;polkit&#39;, &#39;polkit&#39;, &#39;&#39;, d)}&quot; =
=3D &quot;polkit&quot; ] ; then<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0if [ -d ${D}${datadir}/polkit-1/r=
ules.<wbr>d ] ; then<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0chmod 700 ${D}${dat=
adir}/polkit-1/rules.<wbr>d<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0chown polkitd:root =
${D}${datadir}/polkit-1/rules.<wbr>d<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0fi<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0fi<br>
=C2=A0}<br>
<br>
=C2=A0do_install_ptest () {<br>
@@ -308,6 +316,7 @@ USERADD_PARAM_${PN} +=3D &quot;${@bb.utils.contains(&#3=
9;<wbr>PACKAGECONFIG&#39;, &#39;timesyncd&#39;, &#39;--sy<br>
=C2=A0USERADD_PARAM_${PN} +=3D &quot;${@bb.utils.contains(&#39;<wbr>PACKAGE=
CONFIG&#39;, &#39;networkd&#39;, &#39;--system -d / -M --shell /bin/nologin=
 systemd-network;&#39;, &#39;&#39;, d)}&quot;<br>
=C2=A0USERADD_PARAM_${PN} +=3D &quot;${@bb.utils.contains(&#39;<wbr>PACKAGE=
CONFIG&#39;, &#39;coredump&#39;, &#39;--system -d / -M --shell /bin/nologin=
 systemd-coredump;&#39;, &#39;&#39;, d)}&quot;<br>
=C2=A0USERADD_PARAM_${PN} +=3D &quot;${@bb.utils.contains(&#39;<wbr>PACKAGE=
CONFIG&#39;, &#39;resolved&#39;, &#39;--system -d / -M --shell /bin/nologin=
 systemd-resolve;&#39;, &#39;&#39;, d)}&quot;<br>
+USERADD_PARAM_${PN} +=3D &quot;${@bb.utils.contains(&#39;<wbr>PACKAGECONFI=
G&#39;, &#39;polkit&#39;, &#39;--system --no-create-home --user-group --hom=
e-dir ${sysconfdir}/polkit-1 polkitd;&#39;, &#39;&#39;, d)}&quot;<br>
=C2=A0GROUPADD_PARAM_${PN} =3D &quot;-r lock; -r systemd-journal&quot;<br>
=C2=A0USERADD_PARAM_${PN}-extra-<wbr>utils +=3D &quot;--system -d / -M --sh=
ell /bin/nologin systemd-bus-proxy;&quot;<br>
<span class=3D"HOEnZb"><font color=3D"#888888"><br>
--<br>
2.11.0<br>
<br>
--<br>
______________________________<wbr>_________________<br>
Openembedded-core mailing list<br>
<a href=3D"mailto:Openembedded-core@lists.openembedded.org">Openembedded-co=
re@lists.<wbr>openembedded.org</a><br>
<a href=3D"http://lists.openembedded.org/mailman/listinfo/openembedded-core=
" rel=3D"noreferrer" target=3D"_blank">http://lists.openembedded.org/<wbr>m=
ailman/listinfo/openembedded-<wbr>core</a><br>
</font></span></blockquote></div><br></div>

--001a113cfa6ad6250c0558899bd6--
