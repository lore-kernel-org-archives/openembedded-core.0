Return-Path: <ross.burton@intel.com>
Received: from mail-io0-f181.google.com (mail-io0-f181.google.com
	[209.85.223.181])
	by mail.openembedded.org (Postfix) with ESMTP id CC459788B1
	for <openembedded-core@lists.openembedded.org>;
	Tue, 20 Mar 2018 09:02:50 +0000 (UTC)
Received: by mail-io0-f181.google.com with SMTP id e7so1401552iof.2
	for <openembedded-core@lists.openembedded.org>;
	Tue, 20 Mar 2018 02:02:52 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=intel-com.20150623.gappssmtp.com; s=20150623;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc; bh=2J4K4ef/PIQaQFW5CL8gFi964Bk3aQlab758GGMslbs=;
	b=r+y1Zp5d4F2xJ5Ryb5N+E7e4iadxHlKkxfXCaWjF6m18UMFwAbLQdKzp6cE/jSD1hC
	2DW9TWxmmgpBY5QHV8P69gyq9F/Ps7ENGXPGq4QSOgMGuxe6t3ZUyAyo8Pn/3w+rFCbt
	0QGUYoqmS/tsw7H3sVe6vMF2zozpA9+3vBBpEC64YyThnMobPoCzYEVgBORqAySOMqSm
	WXHEPTGl1/rzJpCxuS9Xb2h9e4M/2YA/lWpXRJOBxoC87Bn2fAY4yn03C3ZPcy4RpBoS
	X4EBglmJoYK0+GmyaAdeh2xCnQdK68DQu5zy11UpYweBKkqFB31codBLmS3a6G/0grKF
	jbPQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc;
	bh=2J4K4ef/PIQaQFW5CL8gFi964Bk3aQlab758GGMslbs=;
	b=diUajToDiA9vHflOlWAjI395JxgLC4aJB0+txFxY6Agx06WgHZjgQ4OfENZsnyNWgo
	nIIiBoSShZxRIBrGHdzl3RBNfxtr8Mgdl2VeMSJWO3+s2LTDONl7mcIc3bxalMtLQk1C
	KheE866+2GaCzVoAAWHzzejBXdBJ82H08vMViW90aMsOu7cJRJ60IwaNLf/0Z0duyWdz
	8e9E5FGpIuXZjycf48W1c8e4lmg+0ti9cA8ScYTdiqpVynkZLygpynGs42DzniP+4Qw/
	ChjGlejHLGGmk8TpRzWYIbOj1ncAAhSsVLOIejOMtn7UmsPl6c7N1W2YjoKvocJzNia2
	uKiA==
X-Gm-Message-State: AElRT7GpSjVu4o+LEV4klpyKCkoE9ucK0LSM//ypiXaSQPfYlN9d/ixD
	8VwSsEziKuxJUc15qr/yrIQKwvpV3LEBxNlhXIHQhw==
X-Google-Smtp-Source: AG47ELtzNWWAkH/CVoFv3RrWOsb/ZsGlmZ/CWTVvKjUrKr9QGMSYaYTpEaROhDTgKofTBp7GOFUDofUDRE+kwE7e/Zw=
X-Received: by 10.107.161.200 with SMTP id k191mr14387162ioe.270.1521536571881;
	Tue, 20 Mar 2018 02:02:51 -0700 (PDT)
MIME-Version: 1.0
Received: by 10.107.30.9 with HTTP; Tue, 20 Mar 2018 02:02:31 -0700 (PDT)
In-Reply-To: <20180320041253.24537-1-raj.khem@gmail.com>
References: <20180320041253.24537-1-raj.khem@gmail.com>
From: "Burton, Ross" <ross.burton@intel.com>
Date: Tue, 20 Mar 2018 09:02:31 +0000
Message-ID: <CAJTo0La3zWJu2EgjKV+xv6FDUvX8Xnm9d0OOfQX_FN4k30uJYA@mail.gmail.com>
To: Khem Raj <raj.khem@gmail.com>
Cc: OE-core <openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH V2] site/risc-v: Cache common variables to build libIDL
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
X-List-Received-Date: Tue, 20 Mar 2018 09:02:50 -0000
Content-Type: multipart/alternative; boundary="001a113e9198e158420567d456b6"

--001a113e9198e158420567d456b6
Content-Type: text/plain; charset="UTF-8"

Are the sizeof values actually needed, or are they copy/pasted from another
site?  autoconf hasn't need to run code to do sizeof for a *long* time.

Ross

On 20 March 2018 at 04:12, Khem Raj <raj.khem@gmail.com> wrote:

> These variables force runtime tests during configure
> they are already cached for other architectures
>
> Signed-off-by: Khem Raj <raj.khem@gmail.com>
> ---
> Changes from v1 -> v2:
> - Drop libIDL specific setting since they need to be in meta-gnome
>
>  meta/site/riscv32-linux | 10 ++++++++++
>  meta/site/riscv64-linux |  5 +++++
>  2 files changed, 15 insertions(+)
>
> diff --git a/meta/site/riscv32-linux b/meta/site/riscv32-linux
> index 138aeb0a11..fc5b99d147 100644
> --- a/meta/site/riscv32-linux
> +++ b/meta/site/riscv32-linux
> @@ -1,6 +1,16 @@
> +# general
> +ac_cv_alignof_guint32=4
> +ac_cv_alignof_guint64=8
> +ac_cv_alignof_unsigned_long=4
> +
>  # glib-2.0
>  glib_cv_stack_grows=${glib_cv_stack_grows=no}
>  glib_cv_uscore=${glib_cv_uscore=no}
> +glib_cv_sizeof_gmutex=${glib_cv_sizeof_gmutex=24}
> +glib_cv_sizeof_intmax_t=${glib_cv_sizeof_intmax_t=8}
> +glib_cv_sizeof_ptrdiff_t=${glib_cv_sizeof_ptrdiff_t=4}
> +glib_cv_sizeof_size_t=${glib_cv_sizeof_size_t=4}
> +glib_cv_sizeof_system_thread=${glib_cv_sizeof_system_thread=4}
>
>  # startup-notification
>  lf_cv_sane_realloc=${lf_cv_sane_realloc=yes}
> diff --git a/meta/site/riscv64-linux b/meta/site/riscv64-linux
> index 138aeb0a11..38bc5f044d 100644
> --- a/meta/site/riscv64-linux
> +++ b/meta/site/riscv64-linux
> @@ -1,3 +1,8 @@
> +# general
> +ac_cv_alignof_guint32=4
> +ac_cv_alignof_guint64=8
> +ac_cv_alignof_unsigned_long=8
> +
>  # glib-2.0
>  glib_cv_stack_grows=${glib_cv_stack_grows=no}
>  glib_cv_uscore=${glib_cv_uscore=no}
> --
> 2.16.2
>
> --
> _______________________________________________
> Openembedded-core mailing list
> Openembedded-core@lists.openembedded.org
> http://lists.openembedded.org/mailman/listinfo/openembedded-core
>

--001a113e9198e158420567d456b6
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr">Are the sizeof values actually needed, or are they copy/pa=
sted from another site? =C2=A0autoconf hasn&#39;t need to run code to do si=
zeof for a *long* time.<div><br></div><div>Ross</div></div><div class=3D"gm=
ail_extra"><br><div class=3D"gmail_quote">On 20 March 2018 at 04:12, Khem R=
aj <span dir=3D"ltr">&lt;<a href=3D"mailto:raj.khem@gmail.com" target=3D"_b=
lank">raj.khem@gmail.com</a>&gt;</span> wrote:<br><blockquote class=3D"gmai=
l_quote" style=3D"margin:0 0 0 .8ex;border-left:1px #ccc solid;padding-left=
:1ex">These variables force runtime tests during configure<br>
they are already cached for other architectures<br>
<br>
Signed-off-by: Khem Raj &lt;<a href=3D"mailto:raj.khem@gmail.com">raj.khem@=
gmail.com</a>&gt;<br>
---<br>
Changes from v1 -&gt; v2:<br>
- Drop libIDL specific setting since they need to be in meta-gnome<br>
<br>
=C2=A0meta/site/riscv32-linux | 10 ++++++++++<br>
=C2=A0meta/site/riscv64-linux |=C2=A0 5 +++++<br>
=C2=A02 files changed, 15 insertions(+)<br>
<br>
diff --git a/meta/site/riscv32-linux b/meta/site/riscv32-linux<br>
index 138aeb0a11..fc5b99d147 100644<br>
--- a/meta/site/riscv32-linux<br>
+++ b/meta/site/riscv32-linux<br>
@@ -1,6 +1,16 @@<br>
+# general<br>
+ac_cv_alignof_guint32=3D4<br>
+ac_cv_alignof_guint64=3D8<br>
+ac_cv_alignof_unsigned_long=3D4<br>
+<br>
=C2=A0# glib-2.0<br>
=C2=A0glib_cv_stack_grows=3D${glib_cv_<wbr>stack_grows=3Dno}<br>
=C2=A0glib_cv_uscore=3D${glib_cv_<wbr>uscore=3Dno}<br>
+glib_cv_sizeof_gmutex=3D${glib_<wbr>cv_sizeof_gmutex=3D24}<br>
+glib_cv_sizeof_intmax_t=3D${<wbr>glib_cv_sizeof_intmax_t=3D8}<br>
+glib_cv_sizeof_ptrdiff_t=3D${<wbr>glib_cv_sizeof_ptrdiff_t=3D4}<br>
+glib_cv_sizeof_size_t=3D${glib_<wbr>cv_sizeof_size_t=3D4}<br>
+glib_cv_sizeof_system_thread=3D<wbr>${glib_cv_sizeof_system_<wbr>thread=3D=
4}<br>
<br>
=C2=A0# startup-notification<br>
=C2=A0lf_cv_sane_realloc=3D${lf_cv_<wbr>sane_realloc=3Dyes}<br>
diff --git a/meta/site/riscv64-linux b/meta/site/riscv64-linux<br>
index 138aeb0a11..38bc5f044d 100644<br>
--- a/meta/site/riscv64-linux<br>
+++ b/meta/site/riscv64-linux<br>
@@ -1,3 +1,8 @@<br>
+# general<br>
+ac_cv_alignof_guint32=3D4<br>
+ac_cv_alignof_guint64=3D8<br>
+ac_cv_alignof_unsigned_long=3D8<br>
+<br>
=C2=A0# glib-2.0<br>
=C2=A0glib_cv_stack_grows=3D${glib_cv_<wbr>stack_grows=3Dno}<br>
=C2=A0glib_cv_uscore=3D${glib_cv_<wbr>uscore=3Dno}<br>
<span class=3D"HOEnZb"><font color=3D"#888888">--<br>
2.16.2<br>
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

--001a113e9198e158420567d456b6--
