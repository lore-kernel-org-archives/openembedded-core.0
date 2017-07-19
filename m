Return-Path: <raj.khem@gmail.com>
Received: from mail-wm0-f65.google.com (mail-wm0-f65.google.com [74.125.82.65])
	by mail.openembedded.org (Postfix) with ESMTP id 81C86781D3
	for <openembedded-core@lists.openembedded.org>;
	Wed, 19 Jul 2017 00:13:06 +0000 (UTC)
Received: by mail-wm0-f65.google.com with SMTP id 65so1134481wmf.0
	for <openembedded-core@lists.openembedded.org>;
	Tue, 18 Jul 2017 17:13:08 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=mime-version:references:in-reply-to:from:date:message-id:subject:to
	:cc; bh=k31Cm1xjrxs/gEq8vXksTunZ7PfOIDahoUDoj2WyBsg=;
	b=qkl7jHUVRjOY71BMRne5reVkRzN8z4iSmsD3QMvCRbNdf9xvGA9ERhQBzcGl2j2ppS
	EPO1nfixsgg0OUfEosczSq5Kb+gM2mytuc3EYBROO81YJyw6ghDeCHP0hDhs/cHghLQn
	izUeAE+J7LzpVeur71tdvEk+hRUNvL36qNuN7WorWAdK2lxU+BeE7Bw+6jag4/Kttx04
	KNyIdbR6oRTir+tr34ruCKVjMyHwHO6ltLAN6EoRSBhdMmKkKtuUp80H3EWswyG7lqAG
	jFO7L+O2kqGUjGBlEwNLFTWaKPcPUJ+E4FWdgKfiljcY9eIKjLG5f4rMmvPGxgd0NZTA
	VzBw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:references:in-reply-to:from:date
	:message-id:subject:to:cc;
	bh=k31Cm1xjrxs/gEq8vXksTunZ7PfOIDahoUDoj2WyBsg=;
	b=cdWNvKWjA++4h2UfJcPzne1F0bG8PkDE5MoOm/lnN9BdK2enA0RJhxEihc6tpJ8fPD
	uMIzwE5LyccO1XOB8h2apP/NTPejacxotBjXmTt4OIT5EIPfDb7XpzCcEGkYqjVuX5WQ
	/iZHVHSNYTTZJdaPgEhnKS61NAdAe6VZNQjX4SNDKk6FM393v+fSPcEfmL5uiddBE8v4
	hKipdB+TkvO5yBnIjEpqfiLvQgBGhbUvKl3Ee4ONNHYadNraYCUllYKdyvsaAH6xRF1q
	0eXKL9qKd7ezkOhmXIK9jCpbQp7FO7edxu6yr0Cxoztu3bYiSQBgCKk8xybY9GUzAHpj
	Z1WQ==
X-Gm-Message-State: AIVw113s3YA1BPj+Dw69AjzEnX9l8vQZrqty48zsSpicDE+c721NI8XH
	+Dh0hTf6pZIXxrwJhAvsOOcmiKtpOA==
X-Received: by 10.80.145.198 with SMTP id h6mr3775913eda.108.1500423188039;
	Tue, 18 Jul 2017 17:13:08 -0700 (PDT)
MIME-Version: 1.0
References: <1500417901-4667-1-git-send-email-juro.bystricky@intel.com>
In-Reply-To: <1500417901-4667-1-git-send-email-juro.bystricky@intel.com>
From: Khem Raj <raj.khem@gmail.com>
Date: Wed, 19 Jul 2017 00:12:56 +0000
Message-ID: <CAMKF1spivq5cRcMDz-uehbqWRUzXyJf6TQ53sOtmFJu+_i1iqw@mail.gmail.com>
To: Juro Bystricky <juro.bystricky@intel.com>,
	openembedded-core@lists.openembedded.org
Subject: Re: [PATCH] gcc-7.inc: add new warning "Wnot-cross-compiler"
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
X-List-Received-Date: Wed, 19 Jul 2017 00:13:07 -0000
Content-Type: multipart/alternative; boundary="f403045c27fc22ca3f0554a07fdf"

--f403045c27fc22ca3f0554a07fdf
Content-Type: text/plain; charset="UTF-8"

On Tue, Jul 18, 2017 at 6:45 PM Juro Bystricky <juro.bystricky@intel.com>
wrote:

> Suppose we have an autotools project that looks like it is using the cross
> compiler but is actually reaching out to the host compiler instead.
> On an x86-64 build, you may not even notice.
> To be able to prevent this, this patch implements a new gcc warning
> "Wnot-cross-compiler". The intention here is to intentionally break a build
> if we are not using a cross-compiler when one is expected to be used.
>
> Expected usage: " -Wnot-cross-compiler -Werror=not-cross-compiler "will


Shouldn't this patch get applied to native gcc on build hosts ?

And I would suggest to sent it to gcc mailing lists before we apply it to
oe

>
>
> [YOCTO #11587]
>
> Signed-off-by: Juro Bystricky <juro.bystricky@intel.com>
> ---
>  meta/recipes-devtools/gcc/gcc-7.1.inc              |  1 +
>  .../gcc/gcc-7.1/0051-warn-not-cross-compiler.patch | 39
> ++++++++++++++++++++++
>  2 files changed, 40 insertions(+)
>  create mode 100644
> meta/recipes-devtools/gcc/gcc-7.1/0051-warn-not-cross-compiler.patch
>
> diff --git a/meta/recipes-devtools/gcc/gcc-7.1.inc
> b/meta/recipes-devtools/gcc/gcc-7.1.inc
> index 3f1c06d..e9b1f21 100644
> --- a/meta/recipes-devtools/gcc/gcc-7.1.inc
> +++ b/meta/recipes-devtools/gcc/gcc-7.1.inc
> @@ -75,6 +75,7 @@ SRC_URI = "\
>             file://0048-gcc-Enable-static-PIE.patch \
>
> file://0049-libsanitizer-Use-stack_t-instead-of-struct-sigaltsta.patch \
>             file://0050-replace-struct-ucontext-with-ucontext_t.patch \
> +           file://0051-warn-not-cross-compiler.patch \
>             ${BACKPORTS} \
>  "
>  BACKPORTS = "\
> diff --git
> a/meta/recipes-devtools/gcc/gcc-7.1/0051-warn-not-cross-compiler.patch
> b/meta/recipes-devtools/gcc/gcc-7.1/0051-warn-not-cross-compiler.patch
> new file mode 100644
> index 0000000..78671ed
> --- /dev/null
> +++ b/meta/recipes-devtools/gcc/gcc-7.1/0051-warn-not-cross-compiler.patch
> @@ -0,0 +1,39 @@
> +
> +This patch implements an additional gcc command line option warning
> +"Wnot-cross-compiler". The option (if specified) will simply generate
> +a warning if gcc being used is not a cross-compiler.
> +
> +Upstream-Status: Pending
> +Signed-off-by: Juro Bystricky <juro.bystricky@intel.com>
> +
> +
> +diff --git a/gcc/common.opt b/gcc/common.opt
> +--- a/gcc/common.opt
> ++++ b/gcc/common.opt
> +@@ -801,6 +801,10 @@
> + Common Var(warn_vector_operation_performance) Warning
> + Warn when a vector operation is compiled outside the SIMD.
> +
> ++Wnot-cross-compiler
> ++Common Warning
> ++Warn when not-cross-compiling.
> ++
> + Xassembler
> + Driver Separate
> +
> +diff --git a/gcc/opts.c b/gcc/opts.c
> +--- a/gcc/opts.c
> ++++ b/gcc/opts.c
> +@@ -2334,6 +2334,12 @@
> +       opts->x_flag_ipa_icf_variables = value;
> +       break;
> +
> ++    case OPT_Wnot_cross_compiler:
> ++#ifndef CROSS_DIRECTORY_STRUCTURE
> ++      warning (OPT_Wnot_cross_compiler, "Not using cross-compiler!");
> ++#endif
> ++      break;
> ++
> +     default:
> +       /* If the flag was handled in a standard way, assume the lack of
> +        processing here is intentional.  */
> --
> 2.7.4
>
>

--f403045c27fc22ca3f0554a07fdf
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div><br><div class=3D"gmail_quote"><div dir=3D"auto">On Tue, Jul 18, 2017 =
at 6:45 PM Juro Bystricky &lt;<a href=3D"mailto:juro.bystricky@intel.com">j=
uro.bystricky@intel.com</a>&gt; wrote:<br></div><blockquote class=3D"gmail_=
quote" style=3D"margin:0 0 0 .8ex;border-left:1px #ccc solid;padding-left:1=
ex">Suppose we have an autotools project that looks like it is using the cr=
oss<br>
compiler but is actually reaching out to the host compiler instead.<br>
On an x86-64 build, you may not even notice.<br>
To be able to prevent this, this patch implements a new gcc warning<br>
&quot;Wnot-cross-compiler&quot;. The intention here is to intentionally bre=
ak a build<br>
if we are not using a cross-compiler when one is expected to be used.<br>
<br>
Expected usage: &quot; -Wnot-cross-compiler -Werror=3Dnot-cross-compiler &q=
uot;will=C2=A0</blockquote><div dir=3D"auto"><br></div><div dir=3D"auto">Sh=
ouldn&#39;t this patch get applied to native gcc on build hosts ?</div><div=
 dir=3D"auto"><br></div><div dir=3D"auto">And I would suggest to sent it to=
 gcc mailing lists before we apply it to oe=C2=A0</div><blockquote class=3D=
"gmail_quote" style=3D"margin:0 0 0 .8ex;border-left:1px #ccc solid;padding=
-left:1ex"><br>
<br>
[YOCTO #11587]<br>
<br>
Signed-off-by: Juro Bystricky &lt;<a href=3D"mailto:juro.bystricky@intel.co=
m" target=3D"_blank">juro.bystricky@intel.com</a>&gt;<br>
---<br>
=C2=A0meta/recipes-devtools/gcc/gcc-7.1.inc=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 |=C2=A0 1 +<br>
=C2=A0.../gcc/gcc-7.1/0051-warn-not-cross-compiler.patch | 39 +++++++++++++=
+++++++++<br>
=C2=A02 files changed, 40 insertions(+)<br>
=C2=A0create mode 100644 meta/recipes-devtools/gcc/gcc-7.1/0051-warn-not-cr=
oss-compiler.patch<br>
<br>
diff --git a/meta/recipes-devtools/gcc/gcc-7.1.inc b/meta/recipes-devtools/=
gcc/gcc-7.1.inc<br>
index 3f1c06d..e9b1f21 100644<br>
--- a/meta/recipes-devtools/gcc/gcc-7.1.inc<br>
+++ b/meta/recipes-devtools/gcc/gcc-7.1.inc<br>
@@ -75,6 +75,7 @@ SRC_URI =3D &quot;\<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 file://0048-gcc-Enable-static-PIE=
.patch \<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 file://0049-libsanitizer-Use-stac=
k_t-instead-of-struct-sigaltsta.patch \<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 file://0050-replace-struct-uconte=
xt-with-ucontext_t.patch \<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0file://0051-warn-not-cross-compil=
er.patch \<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 ${BACKPORTS} \<br>
=C2=A0&quot;<br>
=C2=A0BACKPORTS =3D &quot;\<br>
diff --git a/meta/recipes-devtools/gcc/gcc-7.1/0051-warn-not-cross-compiler=
.patch b/meta/recipes-devtools/gcc/gcc-7.1/0051-warn-not-cross-compiler.pat=
ch<br>
new file mode 100644<br>
index 0000000..78671ed<br>
--- /dev/null<br>
+++ b/meta/recipes-devtools/gcc/gcc-7.1/0051-warn-not-cross-compiler.patch<=
br>
@@ -0,0 +1,39 @@<br>
+<br>
+This patch implements an additional gcc command line option warning<br>
+&quot;Wnot-cross-compiler&quot;. The option (if specified) will simply gen=
erate<br>
+a warning if gcc being used is not a cross-compiler.<br>
+<br>
+Upstream-Status: Pending<br>
+Signed-off-by: Juro Bystricky &lt;<a href=3D"mailto:juro.bystricky@intel.c=
om" target=3D"_blank">juro.bystricky@intel.com</a>&gt;<br>
+<br>
+<br>
+diff --git a/gcc/common.opt b/gcc/common.opt<br>
+--- a/gcc/common.opt<br>
++++ b/gcc/common.opt<br>
+@@ -801,6 +801,10 @@<br>
+ Common Var(warn_vector_operation_performance) Warning<br>
+ Warn when a vector operation is compiled outside the SIMD.<br>
+<br>
++Wnot-cross-compiler<br>
++Common Warning<br>
++Warn when not-cross-compiling.<br>
++<br>
+ Xassembler<br>
+ Driver Separate<br>
+<br>
+diff --git a/gcc/opts.c b/gcc/opts.c<br>
+--- a/gcc/opts.c<br>
++++ b/gcc/opts.c<br>
+@@ -2334,6 +2334,12 @@<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0opts-&gt;x_flag_ipa_icf_variables =3D value;<br=
>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0break;<br>
+<br>
++=C2=A0 =C2=A0 case OPT_Wnot_cross_compiler:<br>
++#ifndef CROSS_DIRECTORY_STRUCTURE<br>
++=C2=A0 =C2=A0 =C2=A0 warning (OPT_Wnot_cross_compiler, &quot;Not using cr=
oss-compiler!&quot;);<br>
++#endif<br>
++=C2=A0 =C2=A0 =C2=A0 break;<br>
++<br>
+=C2=A0 =C2=A0 =C2=A0default:<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0/* If the flag was handled in a standard way, a=
ssume the lack of<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 processing here is intentional.=C2=A0 */<br>
--<br>
2.7.4<br>
<br>
</blockquote></div></div>

--f403045c27fc22ca3f0554a07fdf--
