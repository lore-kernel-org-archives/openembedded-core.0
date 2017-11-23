Return-Path: <ross.burton@intel.com>
Received: from mail-it0-f68.google.com (mail-it0-f68.google.com
	[209.85.214.68])
	by mail.openembedded.org (Postfix) with ESMTP id 621FC786DA
	for <openembedded-core@lists.openembedded.org>;
	Thu, 23 Nov 2017 12:14:03 +0000 (UTC)
Received: by mail-it0-f68.google.com with SMTP id 187so8159496iti.5
	for <openembedded-core@lists.openembedded.org>;
	Thu, 23 Nov 2017 04:14:05 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=intel-com.20150623.gappssmtp.com; s=20150623;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc; bh=+HVZuAKT+v2of7idjt+bmJv2ckAlOCh5J+DsSjL/97g=;
	b=vmzryl5iv6p6r/G6fJlIW0wHv5XzWH3xZy31dSyZo/qNSrBdBeV6D48ABx4pXvVovK
	pnc9OJYYJsWszFne2dRZM0EiDT6dKZ4je+6e/Ietnd3kJXfGopGQcEiBg5kTccLHiMHy
	ds5W1i8Knqo5Lev8VdiluzzsQVQwr4jtC1dEf4S5EqdfeVUoQrT0b/6Ggvt8kG9sDGJ+
	S9D3EHjbPzYpwx3beMvNXWDsKTqg4ipaandOZNRtY2PCdClHikPDGZ7OeN1bEKPJCO1h
	FySs7ZUoRapuwt+V47G/bqFSvr0GMI1xl4nr/BI4J6sf86yklVJyr1slZIwDz9o0yVSt
	AnvQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc;
	bh=+HVZuAKT+v2of7idjt+bmJv2ckAlOCh5J+DsSjL/97g=;
	b=kDBmoRgX+WSF3/EKyBiB7g8oepH9ZtDOcjWRlnWparRnp2JSzV91duXR5c48BblJzZ
	Mjv1Mwq4oyFOLAQ006hBVh+NXFu1iXE5GFL+9n9lQv2L6q6PM3whxtZnVSNiwP63YGV4
	eO6HkYstqBKFslm8IKVTnuPLABbBwuV8eRRbUWOhEYiMBGs8G8g0AgPyh4lHfaj7xqfn
	ZTd1FQ27uM1ZQOTHOoln/w1KZip6Y5IwGJlb4GN14+sOlaAFhZGeOOzWeo//1n0Ue4d9
	U6Ugp8HNzhC9TZ8hF6VcSLnq7r7ourZY5z1cdC0nAlCzXKae5/SaXVircXbetxS0ALam
	nzDw==
X-Gm-Message-State: AJaThX5NGhbYu6JIDpbBZzOI6OPQexJ1iJztVuhWGAv83k5JO3eDAKHX
	FBihhgJoZzgeUfkvwVEfxtI+3B2/jf2haErW97uA1Q==
X-Google-Smtp-Source: AGs4zMYuwFhISEZ/9HUlQjqst8OW3S548Ug5IIIADMJxI8N8jMxM8NYFNhyfUOD+wjSrXPlHutEcJr0jq80Y0ppuuWU=
X-Received: by 10.36.93.5 with SMTP id w5mr5514295ita.124.1511439241439; Thu,
	23 Nov 2017 04:14:01 -0800 (PST)
MIME-Version: 1.0
Received: by 10.107.171.132 with HTTP; Thu, 23 Nov 2017 04:13:41 -0800 (PST)
In-Reply-To: <1511357440-7368-1-git-send-email-kristian.amlie@northern.tech>
References: <1511357440-7368-1-git-send-email-kristian.amlie@northern.tech>
From: "Burton, Ross" <ross.burton@intel.com>
Date: Thu, 23 Nov 2017 12:13:41 +0000
Message-ID: <CAJTo0LZgkxiUxaz_jZ6wDwW2VumV_Jyd4e6r2Th6ZO9PCx=ZhA@mail.gmail.com>
To: Kristian Amlie <kristian.amlie@northern.tech>
Cc: OE-core <openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH v1] systemd: Avoid fsck because time is out of sync on first boot.
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
X-List-Received-Date: Thu, 23 Nov 2017 12:14:04 -0000
Content-Type: multipart/alternative; boundary="001a1143f14c160ed2055ea55fb7"

--001a1143f14c160ed2055ea55fb7
Content-Type: text/plain; charset="UTF-8"

Doesn't sound like something we want to be always on.  Either keep this in
your customisations, or add it as an optional PACKAGECONFIG that you can
turn on.

Ross

On 22 November 2017 at 13:30, Kristian Amlie <kristian.amlie@northern.tech>
wrote:

> By default, systemd uses its build time as the epoch. When systemd is
> launched on a system without a real time clock, this time will be
> detected as in the future and an fsck will be done.  Setting this to 0
> results in an epoch of January 1, 1970 which is detected as an invalid
> time and the fsck will be skipped.
>
> Signed-off-by: Kristian Amlie <kristian.amlie@northern.tech>
> ---
>  meta/recipes-core/systemd/systemd_234.bb | 1 +
>  1 file changed, 1 insertion(+)
>
> diff --git a/meta/recipes-core/systemd/systemd_234.bb
> b/meta/recipes-core/systemd/systemd_234.bb
> index 6b8745b..86c04fe 100644
> --- a/meta/recipes-core/systemd/systemd_234.bb
> +++ b/meta/recipes-core/systemd/systemd_234.bb
> @@ -170,6 +170,7 @@ EXTRA_OECONF = " --with-rootprefix=${rootprefix} \
>                   --without-python \
>                   --with-sysvrcnd-path=${sysconfdir} \
>                   --with-firmware-path=${nonarch_base_libdir}/firmware \
> +                 --with-time-epoch=0 \
>                 "
>  # per the systemd README, define VALGRIND=1 to run under valgrind
>  CFLAGS .= "${@bb.utils.contains('PACKAGECONFIG', 'valgrind', '
> -DVALGRIND=1', '', d)}"
> --
> 2.7.4
>
> --
> _______________________________________________
> Openembedded-core mailing list
> Openembedded-core@lists.openembedded.org
> http://lists.openembedded.org/mailman/listinfo/openembedded-core
>

--001a1143f14c160ed2055ea55fb7
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr">Doesn&#39;t sound like something we want to be always on.=
=C2=A0 Either keep this in your customisations, or add it as an optional PA=
CKAGECONFIG that you can turn on.<div><br></div><div>Ross</div></div><div c=
lass=3D"gmail_extra"><br><div class=3D"gmail_quote">On 22 November 2017 at =
13:30, Kristian Amlie <span dir=3D"ltr">&lt;<a href=3D"mailto:kristian.amli=
e@northern.tech" target=3D"_blank">kristian.amlie@northern.tech</a>&gt;</sp=
an> wrote:<br><blockquote class=3D"gmail_quote" style=3D"margin:0 0 0 .8ex;=
border-left:1px #ccc solid;padding-left:1ex">By default, systemd uses its b=
uild time as the epoch. When systemd is<br>
launched on a system without a real time clock, this time will be<br>
detected as in the future and an fsck will be done.=C2=A0 Setting this to 0=
<br>
results in an epoch of January 1, 1970 which is detected as an invalid<br>
time and the fsck will be skipped.<br>
<br>
Signed-off-by: Kristian Amlie &lt;kristian.amlie@northern.tech&gt;<br>
---<br>
=C2=A0meta/recipes-core/systemd/<a href=3D"http://systemd_234.bb" rel=3D"no=
referrer" target=3D"_blank">syst<wbr>emd_234.bb</a> | 1 +<br>
=C2=A01 file changed, 1 insertion(+)<br>
<br>
diff --git a/meta/recipes-core/systemd/<a href=3D"http://systemd_234.bb" re=
l=3D"noreferrer" target=3D"_blank">sy<wbr>stemd_234.bb</a> b/meta/recipes-c=
ore/systemd/<a href=3D"http://systemd_234.bb" rel=3D"noreferrer" target=3D"=
_blank">sy<wbr>stemd_234.bb</a><br>
index 6b8745b..86c04fe 100644<br>
--- a/meta/recipes-core/systemd/<a href=3D"http://systemd_234.bb" rel=3D"no=
referrer" target=3D"_blank">sy<wbr>stemd_234.bb</a><br>
+++ b/meta/recipes-core/systemd/<a href=3D"http://systemd_234.bb" rel=3D"no=
referrer" target=3D"_blank">sy<wbr>stemd_234.bb</a><br>
@@ -170,6 +170,7 @@ EXTRA_OECONF =3D &quot; --with-rootprefix=3D${<wbr>root=
prefix} \<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 --without-py=
thon \<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 --with-sysvr=
cnd-path=3D${<wbr>sysconfdir} \<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 --with-firmw=
are-path=3D${<wbr>nonarch_base_libdir}/firmware \<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0--with-time-=
epoch=3D0 \<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 &quot;<br>
=C2=A0# per the systemd README, define VALGRIND=3D1 to run under valgrind<b=
r>
=C2=A0CFLAGS .=3D &quot;${@bb.utils.contains(&#39;<wbr>PACKAGECONFIG&#39;, =
&#39;valgrind&#39;, &#39; -DVALGRIND=3D1&#39;, &#39;&#39;, d)}&quot;<br>
<span class=3D"HOEnZb"><font color=3D"#888888">--<br>
2.7.4<br>
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

--001a1143f14c160ed2055ea55fb7--
