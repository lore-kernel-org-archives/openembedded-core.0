Return-Path: <martin.jansa@gmail.com>
Received: from mail-wr0-f171.google.com (mail-wr0-f171.google.com
	[209.85.128.171])
	by mail.openembedded.org (Postfix) with ESMTP id 3F1FA78219
	for <openembedded-core@lists.openembedded.org>;
	Tue, 31 Oct 2017 09:31:12 +0000 (UTC)
Received: by mail-wr0-f171.google.com with SMTP id j15so15282549wre.8
	for <openembedded-core@lists.openembedded.org>;
	Tue, 31 Oct 2017 02:31:14 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc; bh=bkm1sEUbx2eby93FLoO6grbBP91MJoFihsdM9IWBli0=;
	b=YR1Wfg9TEfNvW0d7kW99X/bgqPL7oUjkhNaJ8wIA77g8plgNtTNcBpgYyGThK4KabA
	IJoI1N104qnLtEI7B5cZ3ARI8lByyH8ef5IF57VUHsjgkFiXhFAWYpsZihsVptUlcFaH
	87adJN4MTOCQJ2+0zqGZa644ifQkW3soEppBZ95T+oRdXiZq6M70103rFL+J6EM/m/L9
	IVA/dwrnoYwOZxR5oayJEa1UtTQEGP62/FtRggxWti7ue7PYY246dH1Ns3Tpebw4XXKA
	HDnJJw8oM4CxlR18jYKgJDW89kKUtbgr8vgTKY0wtZlxXhDnGiX0yhoQ2YDS7+etb6BV
	oGEA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc;
	bh=bkm1sEUbx2eby93FLoO6grbBP91MJoFihsdM9IWBli0=;
	b=sbX9T9mBl7Eifm9FTJd31pXFmrJvjDAj3nqtpid9e2uqRBGda6v4wRGAj4jjgDgVVu
	icR52Z1/ngp51BCBlcck107L6GbvA5R4po8XA1wa7KJ17cm7couRNH+4cSGSjPSN+0WU
	idZ3G2mN7FkasQmIgLsFxqgiNaH1Pd1+uPwUjyqiRl4lSXUrsZqX1L+qagtP1xjqRw3/
	Zc0RH1vXb0BL5mq2TXhnytJTyunm6Hw5HnHtJz0S9omxT8QQ3YxV6LVmF9Rf7L/2xc5S
	Dhl2AU43IK2mi494dLKvbs68z1HwiWdVLUVX1s6SZccb5idiFVpNOw/q+EVuAH57Bl87
	+kOw==
X-Gm-Message-State: AMCzsaUJXDhCbBqP9/nEVhyT7JNDo+h8X//vFWfsY7tCPzsymkEIjIci
	GgUK95u7HtHppT/sXcCo/brlfa5vWmiaLJDPlEI=
X-Google-Smtp-Source: ABhQp+SBgGaLhCrwvUz1KJFl0/ky+opYtiOxwjzgT0rxK1AzM8KpxXF143BI2uOTqbBeMKWHN+zKy1Rnwx44+N570ik=
X-Received: by 10.223.176.220 with SMTP id j28mr1036372wra.99.1509442273913;
	Tue, 31 Oct 2017 02:31:13 -0700 (PDT)
MIME-Version: 1.0
Received: by 10.28.183.212 with HTTP; Tue, 31 Oct 2017 02:31:13 -0700 (PDT)
In-Reply-To: <1509415962-186373-1-git-send-email-li.zhou@windriver.com>
References: <1509415962-186373-1-git-send-email-li.zhou@windriver.com>
From: Martin Jansa <martin.jansa@gmail.com>
Date: Tue, 31 Oct 2017 10:31:13 +0100
Message-ID: <CA+chaQe9CXqy3ZFVC_yu-Rk6dtviS_Z559RG-ttUWONAkpUFFQ@mail.gmail.com>
To: Li Zhou <li.zhou@windriver.com>
Cc: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH v4] opkg-utils: Change alternatives lib path from /usr/lib/opkg to /var/lib/opkg
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
X-List-Received-Date: Tue, 31 Oct 2017 09:31:13 -0000
Content-Type: multipart/alternative; boundary="001a1144d9ea8bb009055cd46a6c"

--001a1144d9ea8bb009055cd46a6c
Content-Type: text/plain; charset="UTF-8"

Do you realize that this completely break the existing alternatives on
target when upgrading from the binary feed? In oe-classic days I wrote
migration script executed in postinst to recover from the worst breakage,
but it still wasn't ideal.

On Tue, Oct 31, 2017 at 3:12 AM, Li Zhou <li.zhou@windriver.com> wrote:

> When update-alternatives is moved from opkg to opkg-utils, a line in
> the file is changed
> from <ad="$OPKG_OFFLINE_ROOT@opkglibdir@/opkg/alternatives">
> to <ad="$OPKG_OFFLINE_ROOT/usr/lib/opkg/alternatives">.
> But opkglibdir doesn't equal to "/usr/lib" here, but equal to "/var/lib"
>  in oe-core build by configuring --with-opkglibdir.
> opkg-utils can't get the var value in opkg, so here define OPKGLIBDIR to
> set the path.
>
> Signed-off-by: Li Zhou <li.zhou@windriver.com>
> ---
>  meta/recipes-devtools/opkg-utils/opkg-utils_0.3.5.bb | 3 +++
>  1 file changed, 3 insertions(+)
>
> diff --git a/meta/recipes-devtools/opkg-utils/opkg-utils_0.3.5.bb
> b/meta/recipes-devtools/opkg-utils/opkg-utils_0.3.5.bb
> index 646cc8f..ea32246 100644
> --- a/meta/recipes-devtools/opkg-utils/opkg-utils_0.3.5.bb
> +++ b/meta/recipes-devtools/opkg-utils/opkg-utils_0.3.5.bb
> @@ -25,6 +25,8 @@ PACKAGECONFIG = "python update-alternatives"
>  PACKAGECONFIG[python] = ",,,${PYTHONRDEPS}"
>  PACKAGECONFIG[update-alternatives] = ",,,"
>
> +target_localstatedir := "${localstatedir}"
> +OPKGLIBDIR = "${target_localstatedir}/lib"
>  do_install() {
>         oe_runmake PREFIX=${prefix} DESTDIR=${D} install
>         if ! ${@bb.utils.contains('PACKAGECONFIG', 'update-alternatives',
> 'true', 'false', d)}; then
> @@ -34,6 +36,7 @@ do_install() {
>      if ! ${@bb.utils.contains('PACKAGECONFIG', 'python', 'true',
> 'false', d)}; then
>          grep -lZ "/usr/bin/env.*python" ${D}${bindir}/* | xargs -0 rm
>      fi
> +    sed -i s:/usr/lib/opkg:${OPKGLIBDIR}/opkg: ${D}${bindir}/update-
> alternatives
>  }
>
>  do_install_append_class-target() {
> --
> 1.9.1
>
> --
> _______________________________________________
> Openembedded-core mailing list
> Openembedded-core@lists.openembedded.org
> http://lists.openembedded.org/mailman/listinfo/openembedded-core
>

--001a1144d9ea8bb009055cd46a6c
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr">Do you realize that this completely break the existing alt=
ernatives on target when upgrading from the binary feed? In oe-classic days=
 I wrote migration script executed in postinst to recover from the worst br=
eakage, but it still wasn&#39;t ideal.</div><div class=3D"gmail_extra"><br>=
<div class=3D"gmail_quote">On Tue, Oct 31, 2017 at 3:12 AM, Li Zhou <span d=
ir=3D"ltr">&lt;<a href=3D"mailto:li.zhou@windriver.com" target=3D"_blank">l=
i.zhou@windriver.com</a>&gt;</span> wrote:<br><blockquote class=3D"gmail_qu=
ote" style=3D"margin:0 0 0 .8ex;border-left:1px #ccc solid;padding-left:1ex=
">When update-alternatives is moved from opkg to opkg-utils, a line in<br>
the file is changed<br>
from &lt;ad=3D&quot;$OPKG_OFFLINE_ROOT@<wbr>opkglibdir@/opkg/alternatives&q=
uot;<wbr>&gt;<br>
to &lt;ad=3D&quot;$OPKG_OFFLINE_ROOT/usr/<wbr>lib/opkg/alternatives&quot;&g=
t;.<br>
But opkglibdir doesn&#39;t equal to &quot;/usr/lib&quot; here, but equal to=
 &quot;/var/lib&quot;<br>
=C2=A0in oe-core build by configuring --with-opkglibdir.<br>
opkg-utils can&#39;t get the var value in opkg, so here define OPKGLIBDIR t=
o<br>
set the path.<br>
<br>
Signed-off-by: Li Zhou &lt;<a href=3D"mailto:li.zhou@windriver.com">li.zhou=
@windriver.com</a>&gt;<br>
---<br>
=C2=A0meta/recipes-devtools/opkg-<wbr>utils/<a href=3D"http://opkg-utils_0.=
3.5.bb" rel=3D"noreferrer" target=3D"_blank">opkg-utils_0.3.5.bb</a> | 3 ++=
+<br>
=C2=A01 file changed, 3 insertions(+)<br>
<br>
diff --git a/meta/recipes-devtools/opkg-<wbr>utils/<a href=3D"http://opkg-u=
tils_0.3.5.bb" rel=3D"noreferrer" target=3D"_blank">opkg-utils_0.3.5.bb</a>=
 b/meta/recipes-devtools/opkg-<wbr>utils/<a href=3D"http://opkg-utils_0.3.5=
.bb" rel=3D"noreferrer" target=3D"_blank">opkg-utils_0.3.5.bb</a><br>
index 646cc8f..ea32246 100644<br>
--- a/meta/recipes-devtools/opkg-<wbr>utils/<a href=3D"http://opkg-utils_0.=
3.5.bb" rel=3D"noreferrer" target=3D"_blank">opkg-utils_0.3.5.bb</a><br>
+++ b/meta/recipes-devtools/opkg-<wbr>utils/<a href=3D"http://opkg-utils_0.=
3.5.bb" rel=3D"noreferrer" target=3D"_blank">opkg-utils_0.3.5.bb</a><br>
@@ -25,6 +25,8 @@ PACKAGECONFIG =3D &quot;python update-alternatives&quot;<=
br>
=C2=A0PACKAGECONFIG[python] =3D &quot;,,,${PYTHONRDEPS}&quot;<br>
=C2=A0PACKAGECONFIG[update-<wbr>alternatives] =3D &quot;,,,&quot;<br>
<br>
+target_localstatedir :=3D &quot;${localstatedir}&quot;<br>
+OPKGLIBDIR =3D &quot;${target_localstatedir}/lib&quot;<br>
=C2=A0do_install() {<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 oe_runmake PREFIX=3D${prefix} DESTDIR=3D${D} in=
stall<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 if ! ${@bb.utils.contains(&#39;<wbr>PACKAGECONF=
IG&#39;, &#39;update-alternatives&#39;, &#39;true&#39;, &#39;false&#39;, d)=
}; then<br>
@@ -34,6 +36,7 @@ do_install() {<br>
=C2=A0 =C2=A0 =C2=A0if ! ${@bb.utils.contains(&#39;<wbr>PACKAGECONFIG&#39;,=
 &#39;python&#39;, &#39;true&#39;, &#39;false&#39;, d)}; then<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0grep -lZ &quot;/usr/bin/env.*python&quot;=
 ${D}${bindir}/* | xargs -0 rm<br>
=C2=A0 =C2=A0 =C2=A0fi<br>
+=C2=A0 =C2=A0 sed -i s:/usr/lib/opkg:${OPKGLIBDIR}/<wbr>opkg: ${D}${bindir=
}/update-<wbr>alternatives<br>
=C2=A0}<br>
<br>
=C2=A0do_install_append_class-<wbr>target() {<br>
<span class=3D"HOEnZb"><font color=3D"#888888">--<br>
1.9.1<br>
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

--001a1144d9ea8bb009055cd46a6c--
