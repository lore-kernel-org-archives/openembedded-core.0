Return-Path: <ross.burton@intel.com>
Received: from mail-ig0-f169.google.com (mail-ig0-f169.google.com
	[209.85.213.169])
	by mail.openembedded.org (Postfix) with ESMTP id F0DC860043
	for <openembedded-core@lists.openembedded.org>;
	Wed, 20 Jan 2016 20:22:47 +0000 (UTC)
Received: by mail-ig0-f169.google.com with SMTP id z14so109008648igp.0
	for <openembedded-core@lists.openembedded.org>;
	Wed, 20 Jan 2016 12:22:48 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=intel-com.20150623.gappssmtp.com; s=20150623;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:content-type; bh=RcS5+oPxogtHSc5RiMidIC6X8A5H+cM2C3uNAEhBwV8=;
	b=gUyen0rRYbdQVeUu/HyC15yMTaXcWk2wQ4iynqbH/Ob9Kpi1KI1BKKWKC97CxGffSh
	WVGsUBd+25IDzE+7ivKERg5wiS5twbpMVSMtyN1a+6xLofhHQqXFon09m46r7GJni7tT
	bvPIXF8VvhcHiBjX1MUnGU/RKAisYPuiN18AygHkl+rC+9g4a+ZP4rrf0dMCx4Nu8C57
	eH0kYyP5xT9JAC0rgqWMuuj5eU+JGjja/vpvMFd74gVsL37V6xcs+TqhPUPM0xPmfl73
	iH2bKusN2B4gj+u2zueZJSct0+eshjwRdvU2yu0iHoWuzro9BtyG53s9eC+hlfEBVjJx
	MjRg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:content-type;
	bh=RcS5+oPxogtHSc5RiMidIC6X8A5H+cM2C3uNAEhBwV8=;
	b=QJy4c8LeSO3jo3qni/OHbEc7ACaA9QKqaEVpn3AxkxW6OHll5WZMv34DSDH10XN/ot
	PbSVXsn7uNeYtgRwHYmJxI1mV/DRC0Bw89qcKDTTlDQkWT2uidHmITFlpSeDUyywxI9+
	Jos6MhXq+Ci2HkoWKuAWzBduC0LTyC7E247EQatQrE7O8KR8OAB9br1uKo7MjKOoW0UD
	nYJidppG8mEtLWJTpiy4N+j4Wd5/vdAKDU44NnrA6UxRWoEHUa9MjaD163JyvXTPTr1W
	r+3j+/CfSUoBDrVVl+PxtsFTFKSEczl59Z0QUfL/thj5eUEC5xUmuFZTwGmHGjJ+rfNB
	tWkg==
X-Gm-Message-State: AG10YOSO1vgD3v3gxCj1u/KN0NjBCWqrdkA85WZNQ5SwiW+ZM2435syTOjLoYRMQzTIvRmi4432mUiyyYIOT8scJ
X-Received: by 10.50.13.100 with SMTP id g4mr5257954igc.64.1453321367909; Wed,
	20 Jan 2016 12:22:47 -0800 (PST)
MIME-Version: 1.0
Received: by 10.107.162.70 with HTTP; Wed, 20 Jan 2016 12:22:28 -0800 (PST)
In-Reply-To: <1453321265-14564-1-git-send-email-ross.burton@intel.com>
References: <1453321265-14564-1-git-send-email-ross.burton@intel.com>
From: "Burton, Ross" <ross.burton@intel.com>
Date: Wed, 20 Jan 2016 20:22:28 +0000
Message-ID: <CAJTo0LYmaqCaGuyQWWVATD9_bXC5dMsipoqrU1cgXYJkGCLwEA@mail.gmail.com>
To: OE-core <openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH] bitbake: set libexecdir to prefix/libexec
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
X-List-Received-Date: Wed, 20 Jan 2016 20:22:48 -0000
Content-Type: multipart/alternative; boundary=089e013c6614e14dea0529c9bf5b

--089e013c6614e14dea0529c9bf5b
Content-Type: text/plain; charset=UTF-8

Erm, sent this a bit early, but it's still something I'd like to see
integrated before M2.  Curious folks can watch the current build of
ross/libexec on the autobuilder to see how it's going!  Obviously I'll
expand on the commit log before sending it in properly.

Ross

On 20 January 2016 at 20:21, Ross Burton <ross.burton@intel.com> wrote:

> Signed-off-by: Ross Burton <ross.burton@intel.com>
> ---
>  meta/conf/bitbake.conf | 4 ++--
>  1 file changed, 2 insertions(+), 2 deletions(-)
>
> diff --git a/meta/conf/bitbake.conf b/meta/conf/bitbake.conf
> index fc57a58..fba4d17 100644
> --- a/meta/conf/bitbake.conf
> +++ b/meta/conf/bitbake.conf
> @@ -41,7 +41,7 @@ export systemd_user_unitdir =
> "${nonarch_libdir}/systemd/user"
>  export bindir = "${exec_prefix}/bin"
>  export sbindir = "${exec_prefix}/sbin"
>  export libdir = "${exec_prefix}/${baselib}"
> -export libexecdir = "${libdir}/${BPN}"
> +export libexecdir = "${exec_prefix}/libexec"
>  export includedir = "${exec_prefix}/include"
>  export oldincludedir = "${exec_prefix}/include"
>  localedir = "${libdir}/locale"
> @@ -55,7 +55,7 @@ bindir_native = "${prefix_native}/bin"
>  sbindir_native = "${prefix_native}/sbin"
>  includedir_native = "${prefix_native}/include"
>  libdir_native = "${prefix_native}/lib"
> -libexecdir_native = "${libdir_native}/${BPN}"
> +libexecdir_native = "${prefix_native}/libexec"
>  base_libdir_native = "/lib"
>  datadir_native = "${prefix_native}/share"
>  bindir_cross = "/bin"
> --
> 2.6.4
>
>

--089e013c6614e14dea0529c9bf5b
Content-Type: text/html; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr">Erm, sent this a bit early, but it&#39;s still something I=
&#39;d like to see integrated before M2.=C2=A0 Curious folks can watch the =
current build of ross/libexec on the autobuilder to see how it&#39;s going!=
=C2=A0 Obviously I&#39;ll expand on the commit log before sending it in pro=
perly.<div><br></div><div>Ross</div></div><div class=3D"gmail_extra"><br><d=
iv class=3D"gmail_quote">On 20 January 2016 at 20:21, Ross Burton <span dir=
=3D"ltr">&lt;<a href=3D"mailto:ross.burton@intel.com" target=3D"_blank">ros=
s.burton@intel.com</a>&gt;</span> wrote:<br><blockquote class=3D"gmail_quot=
e" style=3D"margin:0 0 0 .8ex;border-left:1px #ccc solid;padding-left:1ex">=
Signed-off-by: Ross Burton &lt;<a href=3D"mailto:ross.burton@intel.com">ros=
s.burton@intel.com</a>&gt;<br>
---<br>
=C2=A0meta/conf/bitbake.conf | 4 ++--<br>
=C2=A01 file changed, 2 insertions(+), 2 deletions(-)<br>
<br>
diff --git a/meta/conf/bitbake.conf b/meta/conf/bitbake.conf<br>
index fc57a58..fba4d17 100644<br>
--- a/meta/conf/bitbake.conf<br>
+++ b/meta/conf/bitbake.conf<br>
@@ -41,7 +41,7 @@ export systemd_user_unitdir =3D &quot;${nonarch_libdir}/s=
ystemd/user&quot;<br>
=C2=A0export bindir =3D &quot;${exec_prefix}/bin&quot;<br>
=C2=A0export sbindir =3D &quot;${exec_prefix}/sbin&quot;<br>
=C2=A0export libdir =3D &quot;${exec_prefix}/${baselib}&quot;<br>
-export libexecdir =3D &quot;${libdir}/${BPN}&quot;<br>
+export libexecdir =3D &quot;${exec_prefix}/libexec&quot;<br>
=C2=A0export includedir =3D &quot;${exec_prefix}/include&quot;<br>
=C2=A0export oldincludedir =3D &quot;${exec_prefix}/include&quot;<br>
=C2=A0localedir =3D &quot;${libdir}/locale&quot;<br>
@@ -55,7 +55,7 @@ bindir_native =3D &quot;${prefix_native}/bin&quot;<br>
=C2=A0sbindir_native =3D &quot;${prefix_native}/sbin&quot;<br>
=C2=A0includedir_native =3D &quot;${prefix_native}/include&quot;<br>
=C2=A0libdir_native =3D &quot;${prefix_native}/lib&quot;<br>
-libexecdir_native =3D &quot;${libdir_native}/${BPN}&quot;<br>
+libexecdir_native =3D &quot;${prefix_native}/libexec&quot;<br>
=C2=A0base_libdir_native =3D &quot;/lib&quot;<br>
=C2=A0datadir_native =3D &quot;${prefix_native}/share&quot;<br>
=C2=A0bindir_cross =3D &quot;/bin&quot;<br>
<span class=3D"HOEnZb"><font color=3D"#888888">--<br>
2.6.4<br>
<br>
</font></span></blockquote></div><br></div>

--089e013c6614e14dea0529c9bf5b--
