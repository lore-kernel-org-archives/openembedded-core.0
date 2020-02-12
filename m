Return-Path: <alex.kanavin@gmail.com>
Received: from mail-vs1-f65.google.com (mail-vs1-f65.google.com
	[209.85.217.65])
	by mail.openembedded.org (Postfix) with ESMTP id C457060AFF
	for <openembedded-core@lists.openembedded.org>;
	Wed, 12 Feb 2020 07:11:21 +0000 (UTC)
Received: by mail-vs1-f65.google.com with SMTP id c18so504780vsq.7
	for <openembedded-core@lists.openembedded.org>;
	Tue, 11 Feb 2020 23:11:23 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=mime-version:references:in-reply-to:from:date:message-id:subject:to
	:cc; bh=Q9tu3ofeRdMCVdpilE8agNW7erIulHg/PD1ajzHnpdU=;
	b=goOOowN3FEhNDYKMIYnVU/2hoWv2qeQZR7NTC/M19d/IwDBl8TFD4537VJz2dwONLa
	RTyAUPU6ZRy3MTdiorcmKe2DWDSBZUWsCUAxJ56jO7JtlpDiyEAaFNUD8m5x2dln442K
	EJsL8/4gSG5H/PZph+XMTQsUSfV+Z9WMDO3phT12jK6zBQerswOwKSiAQa2CiwGA6UJS
	Ak2yPjXPuf++NmuL8mTRel7KOj7acbAAGNmDzmjXrHuS7xs/FRzak65NCnZnbIdKIbZd
	JQyGq9H2KL6Rp2I8Cen8CpoXGWo+GQ+6x8zh47ylkLf88ryA0bhz5Mkixiu+dwSMjkKF
	CqXg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:references:in-reply-to:from:date
	:message-id:subject:to:cc;
	bh=Q9tu3ofeRdMCVdpilE8agNW7erIulHg/PD1ajzHnpdU=;
	b=qJvBeIc/Sn1r5PNdZKSlEYT2ek4kT5/ujNEqxYZtg5YV/Y8cPlrdqRpytcaDXsjZRr
	Jim3mM8gS9Xc9KskbQKy6GuOCpKL39aUMbp0YLCfQtp1Edqh9zF3ljEJVqwcwcDHdDIf
	MYRSbfCKsq1Z+hL/e6BdsoSGcR6GCNkJ+iiYkRmO3My16on9bc25PGpIl53hD5knm3XZ
	u4rN/h15Gwsq6w7gfb9GBabWjrysVGQIXKTFJ+k8bsIjwrWbnwGvFGVA+bnGe6NKhf3m
	bw4wMFwdncOiTHJq4+UbveoPy4iA/+F0Ex9vDzMIbfkLWN4UF528+IHEutXmc7B9XZDN
	MEAw==
X-Gm-Message-State: APjAAAWlpOBPZOgnPduj3wufu2E9cqDyuLmX5qkaHGDve2f5VBz7MoZE
	KP4PA7pOmb1BMH0zu+McrXz5PJFuqGoa+IY4vtI=
X-Google-Smtp-Source: APXvYqxX+Hj29sqMSVEv4Pk9BNGOx2iMO3UVVHTBUGREld1wpLzZwBWXETCGhS1DqprFa2qxv5LjSsD0kRuXW9HvtqI=
X-Received: by 2002:a67:7987:: with SMTP id u129mr11515788vsc.83.1581491482498;
	Tue, 11 Feb 2020 23:11:22 -0800 (PST)
MIME-Version: 1.0
References: <20200212051936.1610922-1-raj.khem@gmail.com>
In-Reply-To: <20200212051936.1610922-1-raj.khem@gmail.com>
From: Alexander Kanavin <alex.kanavin@gmail.com>
Date: Wed, 12 Feb 2020 08:11:11 +0100
Message-ID: <CANNYZj9478oh1cNgK0U5oq8RX=q8VMYZpCnPZ8akgvUtQExFmg@mail.gmail.com>
To: Khem Raj <raj.khem@gmail.com>
Cc: openembedded-core@lists.openembedded.org
Subject: Re: [PATCH] dnf, libdnf: Ignore if PACKAGE_CLASSES does not have rpm
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
X-List-Received-Date: Wed, 12 Feb 2020 07:11:22 -0000
Content-Type: multipart/alternative; boundary="000000000000079a38059e5bae1c"

--000000000000079a38059e5bae1c
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Please let=E2=80=99s try to avoid anonymous python. What problem does this =
solve?
If package_rpm is not enabled, then there should not be a dependency chain
that builds these anyway.

Alex

On Wed 12. Feb 2020 at 6.20, Khem Raj <raj.khem@gmail.com> wrote:

> dnf does not work with opkg or dpkg/apt anyway
>
> Signed-off-by: Khem Raj <raj.khem@gmail.com>
> ---
>  meta/recipes-devtools/dnf/dnf_4.2.2.bb        | 8 ++++++++
>  meta/recipes-devtools/libdnf/libdnf_0.28.1.bb | 7 +++++++
>  2 files changed, 15 insertions(+)
>
> diff --git a/meta/recipes-devtools/dnf/dnf_4.2.2.bb
> b/meta/recipes-devtools/dnf/dnf_4.2.2.bb
> index f38167f1ad..9e6d5741af 100644
> --- a/meta/recipes-devtools/dnf/dnf_4.2.2.bb
> +++ b/meta/recipes-devtools/dnf/dnf_4.2.2.bb
> @@ -84,3 +84,11 @@ SYSTEMD_SERVICE_${PN} =3D "dnf-makecache.service
> dnf-makecache.timer \
>                           dnf-automatic-notifyonly.service
> dnf-automatic-notifyonly.timer \
>  "
>  SYSTEMD_AUTO_ENABLE ?=3D "disable"
> +
> +python () {
> +    pkgb =3D d.getVar("PACKAGE_CLASSES")
> +    pkgn =3D d.getVar("PN")
> +    pkgv =3D d.getVar("PV")
> +    if "package_rpm" not in pkgb:
> +        raise bb.parse.SkipPackage("%s-%s Needs rpmdb support in libsolv=
"
> % (pkgn, pkgv))
> +}
> diff --git a/meta/recipes-devtools/libdnf/libdnf_0.28.1.bb
> b/meta/recipes-devtools/libdnf/libdnf_0.28.1.bb
> index 882c435b32..5c9326ca64 100644
> --- a/meta/recipes-devtools/libdnf/libdnf_0.28.1.bb
> +++ b/meta/recipes-devtools/libdnf/libdnf_0.28.1.bb
> @@ -27,3 +27,10 @@ EXTRA_OECMAKE_append_class-nativesdk =3D " -DWITH_GIR=
=3DOFF"
>
>  BBCLASSEXTEND =3D "native nativesdk"
>
> +python () {
> +    pkgb =3D d.getVar("PACKAGE_CLASSES")
> +    pkgn =3D d.getVar("PN")
> +    pkgv =3D d.getVar("PV")
> +    if "package_rpm" not in pkgb:
> +        raise bb.parse.SkipPackage("%s-%s Needs rpmdb support in libsolv=
"
> % (pkgn, pkgv))
> +}
> --
> 2.25.0
>
> --
> _______________________________________________
> Openembedded-core mailing list
> Openembedded-core@lists.openembedded.org
> http://lists.openembedded.org/mailman/listinfo/openembedded-core
>

--000000000000079a38059e5bae1c
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div><div dir=3D"auto">Please let=E2=80=99s try to avoid anonymous python. =
What problem does this solve? If package_rpm is not enabled, then there sho=
uld not be a dependency chain that builds these anyway.</div></div><div dir=
=3D"auto"><br></div><div><div dir=3D"auto">Alex</div><br><div class=3D"gmai=
l_quote"><div dir=3D"ltr" class=3D"gmail_attr">On Wed 12. Feb 2020 at 6.20,=
 Khem Raj &lt;<a href=3D"mailto:raj.khem@gmail.com">raj.khem@gmail.com</a>&=
gt; wrote:<br></div><blockquote class=3D"gmail_quote" style=3D"margin:0 0 0=
 .8ex;border-left:1px #ccc solid;padding-left:1ex">dnf does not work with o=
pkg or dpkg/apt anyway<br>
<br>
Signed-off-by: Khem Raj &lt;<a href=3D"mailto:raj.khem@gmail.com" target=3D=
"_blank">raj.khem@gmail.com</a>&gt;<br>
---<br>
=C2=A0meta/recipes-devtools/dnf/<a href=3D"http://dnf_4.2.2.bb" rel=3D"nore=
ferrer" target=3D"_blank">dnf_4.2.2.bb</a>=C2=A0 =C2=A0 =C2=A0 =C2=A0 | 8 +=
+++++++<br>
=C2=A0meta/recipes-devtools/libdnf/<a href=3D"http://libdnf_0.28.1.bb" rel=
=3D"noreferrer" target=3D"_blank">libdnf_0.28.1.bb</a> | 7 +++++++<br>
=C2=A02 files changed, 15 insertions(+)<br>
<br>
diff --git a/meta/recipes-devtools/dnf/<a href=3D"http://dnf_4.2.2.bb" rel=
=3D"noreferrer" target=3D"_blank">dnf_4.2.2.bb</a> b/meta/recipes-devtools/=
dnf/<a href=3D"http://dnf_4.2.2.bb" rel=3D"noreferrer" target=3D"_blank">dn=
f_4.2.2.bb</a><br>
index f38167f1ad..9e6d5741af 100644<br>
--- a/meta/recipes-devtools/dnf/<a href=3D"http://dnf_4.2.2.bb" rel=3D"nore=
ferrer" target=3D"_blank">dnf_4.2.2.bb</a><br>
+++ b/meta/recipes-devtools/dnf/<a href=3D"http://dnf_4.2.2.bb" rel=3D"nore=
ferrer" target=3D"_blank">dnf_4.2.2.bb</a><br>
@@ -84,3 +84,11 @@ SYSTEMD_SERVICE_${PN} =3D &quot;dnf-makecache.service dn=
f-makecache.timer \<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 dnf-automatic-notifyonly.service dnf-automatic-notifyonly=
.timer \<br>
=C2=A0&quot;<br>
=C2=A0SYSTEMD_AUTO_ENABLE ?=3D &quot;disable&quot;<br>
+<br>
+python () {<br>
+=C2=A0 =C2=A0 pkgb =3D d.getVar(&quot;PACKAGE_CLASSES&quot;)<br>
+=C2=A0 =C2=A0 pkgn =3D d.getVar(&quot;PN&quot;)<br>
+=C2=A0 =C2=A0 pkgv =3D d.getVar(&quot;PV&quot;)<br>
+=C2=A0 =C2=A0 if &quot;package_rpm&quot; not in pkgb:<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 raise bb.parse.SkipPackage(&quot;%s-%s Needs r=
pmdb support in libsolv&quot; % (pkgn, pkgv))<br>
+}<br>
diff --git a/meta/recipes-devtools/libdnf/<a href=3D"http://libdnf_0.28.1.b=
b" rel=3D"noreferrer" target=3D"_blank">libdnf_0.28.1.bb</a> b/meta/recipes=
-devtools/libdnf/<a href=3D"http://libdnf_0.28.1.bb" rel=3D"noreferrer" tar=
get=3D"_blank">libdnf_0.28.1.bb</a><br>
index 882c435b32..5c9326ca64 100644<br>
--- a/meta/recipes-devtools/libdnf/<a href=3D"http://libdnf_0.28.1.bb" rel=
=3D"noreferrer" target=3D"_blank">libdnf_0.28.1.bb</a><br>
+++ b/meta/recipes-devtools/libdnf/<a href=3D"http://libdnf_0.28.1.bb" rel=
=3D"noreferrer" target=3D"_blank">libdnf_0.28.1.bb</a><br>
@@ -27,3 +27,10 @@ EXTRA_OECMAKE_append_class-nativesdk =3D &quot; -DWITH_G=
IR=3DOFF&quot;<br>
<br>
=C2=A0BBCLASSEXTEND =3D &quot;native nativesdk&quot;<br>
<br>
+python () {<br>
+=C2=A0 =C2=A0 pkgb =3D d.getVar(&quot;PACKAGE_CLASSES&quot;)<br>
+=C2=A0 =C2=A0 pkgn =3D d.getVar(&quot;PN&quot;)<br>
+=C2=A0 =C2=A0 pkgv =3D d.getVar(&quot;PV&quot;)<br>
+=C2=A0 =C2=A0 if &quot;package_rpm&quot; not in pkgb:<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 raise bb.parse.SkipPackage(&quot;%s-%s Needs r=
pmdb support in libsolv&quot; % (pkgn, pkgv))<br>
+}<br>
-- <br>
2.25.0<br>
<br>
-- <br>
_______________________________________________<br>
Openembedded-core mailing list<br>
<a href=3D"mailto:Openembedded-core@lists.openembedded.org" target=3D"_blan=
k">Openembedded-core@lists.openembedded.org</a><br>
<a href=3D"http://lists.openembedded.org/mailman/listinfo/openembedded-core=
" rel=3D"noreferrer" target=3D"_blank">http://lists.openembedded.org/mailma=
n/listinfo/openembedded-core</a><br>
</blockquote></div></div>

--000000000000079a38059e5bae1c--
