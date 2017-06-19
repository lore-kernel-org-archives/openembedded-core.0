Return-Path: <ross.burton@intel.com>
Received: from mail-qk0-f176.google.com (mail-qk0-f176.google.com
	[209.85.220.176])
	by mail.openembedded.org (Postfix) with ESMTP id AFD1A71A84
	for <openembedded-core@lists.openembedded.org>;
	Mon, 19 Jun 2017 14:20:18 +0000 (UTC)
Received: by mail-qk0-f176.google.com with SMTP id d14so34424815qkb.1
	for <openembedded-core@lists.openembedded.org>;
	Mon, 19 Jun 2017 07:20:20 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=intel-com.20150623.gappssmtp.com; s=20150623;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc; bh=nlOK8ns4alwBqYvgHJrtKKszAjqsoT6USHh/uORmK00=;
	b=PEG/gCV0yXE+v2sxn1LQfqI+bA8GTvKWZssVx33j2sP/ewbyiJ4BPmlx4ypufk8zd1
	ny94Z6k+/aYcns3tbvhNdCGmMzRWOEySnRoPCUC7TYECpuZLr94chYgqnjx/d82EbyjH
	qnygTJ0gsvBZDzLigniZuVoAl1MpaLMQ6C47rQGxFouh/Yw1eq24b/0GzIp+s9aZfyFY
	8bwttMQ26O7mzU6fnKOBF4fTN72nynGHFYZg3XJ2be/hZgoajhpFuPPVP2FSGakkzY41
	wsKDLpW0+l2ZJnmZcVY8UD5vFsKwISEmL2V047BBj0X6kXjCWs1Aj56mbK6RdY9E8ss7
	2Reg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc;
	bh=nlOK8ns4alwBqYvgHJrtKKszAjqsoT6USHh/uORmK00=;
	b=jNlNJtJ8Wa4stkaleB9bVe82Sh3tJK20SUQOZobTU3DkYReIT0qTuss7FncMkLtdxm
	n8YHZYzR18/lmHV3SrcQOOZoIeTyyqzqHe4RAGd/IxsSQQ+kpUTW9zVCzwFph6tngMiY
	DMP175UudSuGNFIlAvqL5NbApU0631EYvycWIhcpIatb20jXfxy0OrPF3cTr/SmGVAUp
	ED/MhSLBCi3DEgHqWApfFmj57pci5xsZkn5wRBv9c4DeJkKJ1UnGyjGpsPb9W4BQCjDi
	Z2dMtcnyW6debZymCdOGp8DT+/b0nai6W0iZ75UhXUGatnK/aFymuq16I2HdX+WCy3yb
	Hbog==
X-Gm-Message-State: AKS2vOz5NKn7vNvhrjPG31/2KR+pW9uwfWBixOwqv8COs2oijgbQFeOh
	mmW+CYTRjD/1DJvZ6bqnalnN/JbAHium
X-Received: by 10.55.120.1 with SMTP id t1mr26741178qkc.171.1497882019479;
	Mon, 19 Jun 2017 07:20:19 -0700 (PDT)
MIME-Version: 1.0
Received: by 10.140.35.103 with HTTP; Mon, 19 Jun 2017 07:19:59 -0700 (PDT)
In-Reply-To: <1497872882-15011-1-git-send-email-gabriel.ionescu@enea.com>
References: <1497872882-15011-1-git-send-email-gabriel.ionescu@enea.com>
From: "Burton, Ross" <ross.burton@intel.com>
Date: Mon, 19 Jun 2017 15:19:59 +0100
Message-ID: <CAJTo0LaEb+bZ5fmCqy-CjNb3GyKm_xYem3y_92ziK_N4Ya8K-A@mail.gmail.com>
To: Gabriel Ionescu <gabriel.ionescu@enea.com>
Cc: OE-core <openembedded-core@lists.openembedded.org>
Subject: Re: [pyro][PATCH] autogen-native: Set POSIX_SHELL to /bin/sh
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
X-List-Received-Date: Mon, 19 Jun 2017 14:20:19 -0000
Content-Type: multipart/alternative; boundary="94eb2c06686ab03b49055250d585"

--94eb2c06686ab03b49055250d585
Content-Type: text/plain; charset="UTF-8"

Why pyro and not master?

Ross

On 19 June 2017 at 12:48, Gabriel Ionescu <gabriel.ionescu@enea.com> wrote:

> Setting POSIX_SHELL to "/usr/bin/env sh" fails when tested in
> libopts.m4 with test -x "$POSIX_SHELL", because test -x needs
> a file as an argument (e.g. test -x FILE).
>
> Due to the above failure, the build system will use a shell available
> in tmp/hosttools, which can generate shebang lines longer than 128.
>
> This patch sets the POSIX_SHELL variable to "/bin/sh".
>
> Signed-off-by: Gabriel Ionescu <gabriel.ionescu@enea.com>
> ---
>  meta/recipes-devtools/autogen/autogen-native_5.18.12.bb | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
>
> diff --git a/meta/recipes-devtools/autogen/autogen-native_5.18.12.bb
> b/meta/recipes-devtools/autogen/autogen-native_5.18.12.bb
> index 853477c..9be03fc 100644
> --- a/meta/recipes-devtools/autogen/autogen-native_5.18.12.bb
> +++ b/meta/recipes-devtools/autogen/autogen-native_5.18.12.bb
> @@ -31,7 +31,7 @@ inherit autotools texinfo native pkgconfig
>  export GUILE_LOAD_PATH = "${STAGING_DATADIR_NATIVE}/guile/2.0"
>  export GUILE_LOAD_COMPILED_PATH = "${STAGING_LIBDIR_NATIVE}/
> guile/2.0/ccache"
>
> -export POSIX_SHELL = "/usr/bin/env sh"
> +export POSIX_SHELL = "/bin/sh"
>
>  do_install_append () {
>         create_wrapper ${D}/${bindir}/autogen \
> --
> 2.7.4
>
> --
> _______________________________________________
> Openembedded-core mailing list
> Openembedded-core@lists.openembedded.org
> http://lists.openembedded.org/mailman/listinfo/openembedded-core
>

--94eb2c06686ab03b49055250d585
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr">Why pyro and not master?<div><br></div><div>Ross</div></di=
v><div class=3D"gmail_extra"><br><div class=3D"gmail_quote">On 19 June 2017=
 at 12:48, Gabriel Ionescu <span dir=3D"ltr">&lt;<a href=3D"mailto:gabriel.=
ionescu@enea.com" target=3D"_blank">gabriel.ionescu@enea.com</a>&gt;</span>=
 wrote:<br><blockquote class=3D"gmail_quote" style=3D"margin:0 0 0 .8ex;bor=
der-left:1px #ccc solid;padding-left:1ex">Setting POSIX_SHELL to &quot;/usr=
/bin/env sh&quot; fails when tested in<br>
libopts.m4 with test -x &quot;$POSIX_SHELL&quot;, because test -x needs<br>
a file as an argument (e.g. test -x FILE).<br>
<br>
Due to the above failure, the build system will use a shell available<br>
in tmp/hosttools, which can generate shebang lines longer than 128.<br>
<br>
This patch sets the POSIX_SHELL variable to &quot;/bin/sh&quot;.<br>
<br>
Signed-off-by: Gabriel Ionescu &lt;<a href=3D"mailto:gabriel.ionescu@enea.c=
om">gabriel.ionescu@enea.com</a>&gt;<br>
---<br>
=C2=A0meta/recipes-devtools/autogen/<a href=3D"http://autogen-native_5.18.1=
2.bb" rel=3D"noreferrer" target=3D"_blank"><wbr>autogen-native_5.18.12.bb</=
a> | 2 +-<br>
=C2=A01 file changed, 1 insertion(+), 1 deletion(-)<br>
<br>
diff --git a/meta/recipes-devtools/<wbr>autogen/<a href=3D"http://autogen-n=
ative_5.18.12.bb" rel=3D"noreferrer" target=3D"_blank">autogen-native_5.18.=
<wbr>12.bb</a> b/meta/recipes-devtools/<wbr>autogen/<a href=3D"http://autog=
en-native_5.18.12.bb" rel=3D"noreferrer" target=3D"_blank">autogen-native_5=
.18.<wbr>12.bb</a><br>
index 853477c..9be03fc 100644<br>
--- a/meta/recipes-devtools/<wbr>autogen/<a href=3D"http://autogen-native_5=
.18.12.bb" rel=3D"noreferrer" target=3D"_blank">autogen-native_5.18.<wbr>12=
.bb</a><br>
+++ b/meta/recipes-devtools/<wbr>autogen/<a href=3D"http://autogen-native_5=
.18.12.bb" rel=3D"noreferrer" target=3D"_blank">autogen-native_5.18.<wbr>12=
.bb</a><br>
@@ -31,7 +31,7 @@ inherit autotools texinfo native pkgconfig<br>
=C2=A0export GUILE_LOAD_PATH =3D &quot;${STAGING_DATADIR_NATIVE}/<wbr>guile=
/2.0&quot;<br>
=C2=A0export GUILE_LOAD_COMPILED_PATH =3D &quot;${STAGING_LIBDIR_NATIVE}/<w=
br>guile/2.0/ccache&quot;<br>
<br>
-export POSIX_SHELL =3D &quot;/usr/bin/env sh&quot;<br>
+export POSIX_SHELL =3D &quot;/bin/sh&quot;<br>
<br>
=C2=A0do_install_append () {<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 create_wrapper ${D}/${bindir}/autogen \<br>
--<br>
2.7.4<br>
<span class=3D"HOEnZb"><font color=3D"#888888"><br>
--<br>
______________________________<wbr>_________________<br>
Openembedded-core mailing list<br>
<a href=3D"mailto:Openembedded-core@lists.openembedded.org">Openembedded-co=
re@lists.<wbr>openembedded.org</a><br>
<a href=3D"http://lists.openembedded.org/mailman/listinfo/openembedded-core=
" rel=3D"noreferrer" target=3D"_blank">http://lists.openembedded.org/<wbr>m=
ailman/listinfo/openembedded-<wbr>core</a><br>
</font></span></blockquote></div><br></div>

--94eb2c06686ab03b49055250d585--
