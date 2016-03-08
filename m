Return-Path: <kergoth@gmail.com>
Received: from mail-io0-f178.google.com (mail-io0-f178.google.com
	[209.85.223.178])
	by mail.openembedded.org (Postfix) with ESMTP id AAEC160017
	for <openembedded-core@lists.openembedded.org>;
	Tue,  8 Mar 2016 16:57:53 +0000 (UTC)
Received: by mail-io0-f178.google.com with SMTP id n190so33590054iof.0
	for <openembedded-core@lists.openembedded.org>;
	Tue, 08 Mar 2016 08:57:54 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=kergoth-com.20150623.gappssmtp.com; s=20150623;
	h=mime-version:references:in-reply-to:from:date:message-id:subject:to; 
	bh=Zzr5+5qqbMXAKb0Nw6B9SleahWciMTt+jPOMxh+/Tu0=;
	b=DVzFeZsA/lzmiawKHIIRq1l6zhzKS6Vt6Jgn/I+e/auJJ4OTmIPAOzbCG54frbPgRm
	UdoUSpBGyCgupRCj4ki/CFBb/rt7YpFk3nOVsDTgQODzeDmVe6+aVV6h5SuJ0OUlSMmT
	sP7YoL97QuWZkjbE9xWSwDy19G2+NVc0nw8o8yXIWG2d7t/j5AURTl+GwxDbTMGpbpwY
	1hU1ZcnBpBlKXEAoMFrsCt6vgsq02g4hfkdzeRqz+oeI5ByI0DK9DkzwXwDCSvnQqUeG
	uswAXyXpD6X1r3W6/Vcttf+7XpC9T5gsR5+Tyvv7o9FR5KgzR4PF9bBCZ2zehIwhmiTq
	96/Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:mime-version:references:in-reply-to:from:date
	:message-id:subject:to;
	bh=Zzr5+5qqbMXAKb0Nw6B9SleahWciMTt+jPOMxh+/Tu0=;
	b=AwuCUh9kgeH/wVudwEub+iQAEq2rd4XoMcX8tIyLlTChaR7CW9dFhwQnzXulmVWRkX
	P1CO/NQozNFo4Tacm8BwPFXdsPBScJulsTt9/EOVFvECSl8DAcFvJL72SgzCwaesyF7W
	0IOFsh+IYXgZb9yOAytXGhf6eIyPxZBSVJ+YUDmcxo0vI8xNtbW8AO/bJElWc2ntmXKr
	a4KlzbZgp/cPvyEPTWOD7BpKbfoZh6qBTyppnhVaFaJh6w9Mig6LZIJBU21NCTbfP9KY
	L/t4bzKE5+3u0gHNakcObTR6DEzNinaE9TQEvCIBBKLgNTvtl3OKCNf/4v+gUNRJnTc/
	1sWw==
X-Gm-Message-State: AD7BkJIef3kqmncnAVbNut3mY/r584g/M1UxWUu9JPEJBwllK4nLRf8ODas/s2xnzaafhkXeawzRK1+Rf+7dzA==
X-Received: by 10.107.15.153 with SMTP id 25mr18447710iop.3.1457456274129;
	Tue, 08 Mar 2016 08:57:54 -0800 (PST)
MIME-Version: 1.0
References: <1457392718-14397-1-git-send-email-sgw@linux.intel.com>
In-Reply-To: <1457392718-14397-1-git-send-email-sgw@linux.intel.com>
From: Christopher Larson <clarson@kergoth.com>
Date: Tue, 08 Mar 2016 16:57:44 +0000
Message-ID: <CABcZANnVfCAK3dXoGjbhYXs+=qJw9C1WcD3tZA76=TA+eOiTpA@mail.gmail.com>
To: Saul Wold <sgw@linux.intel.com>, openembedded-core@lists.openembedded.org, 
	richard.purdie@linuxfoundation.org
Subject: Re: [PATCH v2] no-static-libs: Ensure correct whitespace is set for _append
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
X-List-Received-Date: Tue, 08 Mar 2016 16:57:53 -0000
Content-Type: multipart/alternative; boundary=001a113ee4fc7ecd3c052d8c7bb8

--001a113ee4fc7ecd3c052d8c7bb8
Content-Type: text/plain; charset=UTF-8

Just a note that doing it this way will result in do_configure checksums
changing for everything when no-static-libs gets included, even if
DISABLE_STATIC is explicitly set to the empty string, as there'll be a
trailing space always added to EXTRA_OECONF. If that's okay, so be it, but
I wanted to make sure it was considered.

On Mon, Mar 7, 2016 at 4:19 PM Saul Wold <sgw@linux.intel.com> wrote:

> Adjusted white space in the DISABLE_STATIC to make output of the -e
> option more readable.
>
> Before:
>  " --enable-opt1 --with_opt1=${libdir}${DISABLE_STATIC}
> After
>  " --enable-opt1 --with_opt1=${libdir} ${DISABLE_STATIC}
>
> Signed-off-by: Saul Wold <sgw@linux.intel.com>
> ---
> v2: Fixed commit message to show what was getting fixed
>
>  meta/conf/distro/include/no-static-libs.inc | 6 +++---
>  1 file changed, 3 insertions(+), 3 deletions(-)
>
> diff --git a/meta/conf/distro/include/no-static-libs.inc
> b/meta/conf/distro/include/no-static-libs.inc
> index 6c0f859..0ab99c0 100644
> --- a/meta/conf/distro/include/no-static-libs.inc
> +++ b/meta/conf/distro/include/no-static-libs.inc
> @@ -1,4 +1,4 @@
> -DISABLE_STATIC = " --disable-static"
> +DISABLE_STATIC = "--disable-static"
>
>  # qemu aborts on unrecognised option
>  DISABLE_STATIC_pn-qemu = ""
> @@ -27,6 +27,6 @@ DISABLE_STATIC_pn-nativesdk-openssl = ""
>  # libssp-static-dev included in build-appliance
>  DISABLE_STATIC_pn-gcc-runtime = ""
>
> -EXTRA_OECONF_append = "${DISABLE_STATIC}"
> +EXTRA_OECONF_append = " ${DISABLE_STATIC}"
>
> -EXTRA_OECMAKE_append_pn-libical = "-DSHARED_ONLY=True"
> +EXTRA_OECMAKE_append_pn-libical = " -DSHARED_ONLY=True"
> --
> 2.5.0
>
> --
> _______________________________________________
> Openembedded-core mailing list
> Openembedded-core@lists.openembedded.org
> http://lists.openembedded.org/mailman/listinfo/openembedded-core
>

--001a113ee4fc7ecd3c052d8c7bb8
Content-Type: text/html; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr">Just a note that doing it this way will result in do_confi=
gure checksums changing for everything when no-static-libs gets included, e=
ven if DISABLE_STATIC is explicitly set to the empty string, as there&#39;l=
l be a trailing space always added to EXTRA_OECONF. If that&#39;s okay, so =
be it, but I wanted to make sure it was considered.<br><br><div class=3D"gm=
ail_quote"><div dir=3D"ltr">On Mon, Mar 7, 2016 at 4:19 PM Saul Wold &lt;<a=
 href=3D"mailto:sgw@linux.intel.com">sgw@linux.intel.com</a>&gt; wrote:<br>=
</div><blockquote class=3D"gmail_quote" style=3D"margin:0 0 0 .8ex;border-l=
eft:1px #ccc solid;padding-left:1ex">Adjusted white space in the DISABLE_ST=
ATIC to make output of the -e<br>
option more readable.<br>
<br>
Before:<br>
=C2=A0&quot; --enable-opt1 --with_opt1=3D${libdir}${DISABLE_STATIC}<br>
After<br>
=C2=A0&quot; --enable-opt1 --with_opt1=3D${libdir} ${DISABLE_STATIC}<br>
<br>
Signed-off-by: Saul Wold &lt;<a href=3D"mailto:sgw@linux.intel.com" target=
=3D"_blank">sgw@linux.intel.com</a>&gt;<br>
---<br>
v2: Fixed commit message to show what was getting fixed<br>
<br>
=C2=A0meta/conf/distro/include/no-static-libs.inc | 6 +++---<br>
=C2=A01 file changed, 3 insertions(+), 3 deletions(-)<br>
<br>
diff --git a/meta/conf/distro/include/no-static-libs.inc b/meta/conf/distro=
/include/no-static-libs.inc<br>
index 6c0f859..0ab99c0 100644<br>
--- a/meta/conf/distro/include/no-static-libs.inc<br>
+++ b/meta/conf/distro/include/no-static-libs.inc<br>
@@ -1,4 +1,4 @@<br>
-DISABLE_STATIC =3D &quot; --disable-static&quot;<br>
+DISABLE_STATIC =3D &quot;--disable-static&quot;<br>
<br>
=C2=A0# qemu aborts on unrecognised option<br>
=C2=A0DISABLE_STATIC_pn-qemu =3D &quot;&quot;<br>
@@ -27,6 +27,6 @@ DISABLE_STATIC_pn-nativesdk-openssl =3D &quot;&quot;<br>
=C2=A0# libssp-static-dev included in build-appliance<br>
=C2=A0DISABLE_STATIC_pn-gcc-runtime =3D &quot;&quot;<br>
<br>
-EXTRA_OECONF_append =3D &quot;${DISABLE_STATIC}&quot;<br>
+EXTRA_OECONF_append =3D &quot; ${DISABLE_STATIC}&quot;<br>
<br>
-EXTRA_OECMAKE_append_pn-libical =3D &quot;-DSHARED_ONLY=3DTrue&quot;<br>
+EXTRA_OECMAKE_append_pn-libical =3D &quot; -DSHARED_ONLY=3DTrue&quot;<br>
--<br>
2.5.0<br>
<br>
--<br>
_______________________________________________<br>
Openembedded-core mailing list<br>
<a href=3D"mailto:Openembedded-core@lists.openembedded.org" target=3D"_blan=
k">Openembedded-core@lists.openembedded.org</a><br>
<a href=3D"http://lists.openembedded.org/mailman/listinfo/openembedded-core=
" rel=3D"noreferrer" target=3D"_blank">http://lists.openembedded.org/mailma=
n/listinfo/openembedded-core</a><br>
</blockquote></div></div>

--001a113ee4fc7ecd3c052d8c7bb8--
