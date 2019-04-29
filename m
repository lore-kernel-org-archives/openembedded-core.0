Return-Path: <bruce.ashfield@gmail.com>
Received: from mail-lj1-f194.google.com (mail-lj1-f194.google.com
	[209.85.208.194])
	by mail.openembedded.org (Postfix) with ESMTP id 82AE47DBBE
	for <openembedded-core@lists.openembedded.org>;
	Mon, 29 Apr 2019 14:16:57 +0000 (UTC)
Received: by mail-lj1-f194.google.com with SMTP id z26so9541057ljj.2
	for <openembedded-core@lists.openembedded.org>;
	Mon, 29 Apr 2019 07:16:58 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=mime-version:references:in-reply-to:from:date:message-id:subject:to
	:cc; bh=gIaEfFLNhQSr+RPw+nVaUYjzB1hV2wuYN4fu31f8nCQ=;
	b=lbmspzjZAB5T9pKJOWoBuR6Ew6kGCPwLG83bzEKLEh40kE74K20iSMQ1vzBGNPy5Xu
	FzB+w7hz9TJl1F5Hfsqimc6dOls1MYhvcHsLQmO04c6e2AwM5x91yS9vOR1UNB7V2+NK
	hxjHcw5N7coQNVxSpzU5U0lOgY7UE8UDz8AHuxQJLihLVX4zvCqV3DpPFaDKxIVCbY6n
	/8vfE4j7J9X9w6Z/M0RByjg/AQSamxRZDLUsSpS/uSQ/8c20MO6bZpAi/fBjWspNPtj7
	uH5P3F9+jSPw2OLfLI+XnqOfh4GNIjkXP0NbHN5d0ZFg5eO8e9/68tDKrc9TTu/kQKf2
	VE8A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:references:in-reply-to:from:date
	:message-id:subject:to:cc;
	bh=gIaEfFLNhQSr+RPw+nVaUYjzB1hV2wuYN4fu31f8nCQ=;
	b=B2AXrVsVE/g2/j6EmXeNpjgdTGIzDoZOGO1eI7zE3ZCC7uYw8SEte7eKHACaPQ2lah
	V2Qq8gZiKEIpRyQyZJQq/8ApVW/6WKPlLgHcRJ2TeqUjA4Tqok0B+iWo5dSJYUEf2fw2
	Ocq7Q+H2pElzeMYH4SFM1KUBvEjgRLiajw9+ADrpw38D44W2WTFoD/l6GwTsNwluS6cn
	jPDN1JoZYtY4rB4G8hKzKbHiHutITg1hUPsD5WiOgbjikcoBXRGvyQ4Z8iEX4hw02SKr
	OW5SrjQgXzLwYnKoKOrTvhq6CSCjahbTJsvcr0ndr2607df1fWNGlo1DXxBMkyJ2Bq2M
	1foQ==
X-Gm-Message-State: APjAAAU2+Ay4nr7JlFpQ6b1feBA7uTPjbELdgOQs1eI+mO20TUKe7edo
	YDX5DtGNIglX1HjUGz8u460aVwSjfxvo6Zz7lhg=
X-Google-Smtp-Source: APXvYqwYltqFfhMesO6o9c860ZBCRlJFrefAjZNXtOtxkzc1aEb7ceTNFmLJ3AkwZshPNQXa1KkfSb4EgTiEAeXMcVY=
X-Received: by 2002:a2e:9d99:: with SMTP id c25mr971612ljj.29.1556547417791;
	Mon, 29 Apr 2019 07:16:57 -0700 (PDT)
MIME-Version: 1.0
References: <1556546164-28522-1-git-send-email-f.suligoi@asem.it>
In-Reply-To: <1556546164-28522-1-git-send-email-f.suligoi@asem.it>
From: Bruce Ashfield <bruce.ashfield@gmail.com>
Date: Mon, 29 Apr 2019 10:16:45 -0400
Message-ID: <CADkTA4OGumcEbwQzO9CP_20NhYHWz-tMJ5VCHWuV6VVnQuj8PA@mail.gmail.com>
To: Flavio Suligoi <f.suligoi@asem.it>
Cc: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH 1/2] kernel: redirect merge_config.sh error output to file
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
X-List-Received-Date: Mon, 29 Apr 2019 14:16:57 -0000
Content-Type: multipart/alternative; boundary="000000000000e9e0c00587abef58"

--000000000000e9e0c00587abef58
Content-Type: text/plain; charset="UTF-8"

On Mon, Apr 29, 2019 at 10:01 AM Flavio Suligoi <f.suligoi@asem.it> wrote:

> In the task:
>
> do_kernel_configme
>
> the errors during execution of the "merge_config.sh" script are
> currently lost.
> But these errors are very useful for debugging, when there are
> problems during the kernel configuration fragments assembly.
>
> This is the reason to save also the error log, in addition to the
> existing log.
>

Errors are picked up in a separate task. What errors were you triggering
that the existing audit wasn't seeing ?

Bruce


>
> Signed-off-by: Flavio Suligoi <f.suligoi@asem.it>
> ---
>  meta/classes/kernel-yocto.bbclass | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
>
> diff --git a/meta/classes/kernel-yocto.bbclass
> b/meta/classes/kernel-yocto.bbclass
> index ed9bcfa..243f8d6 100644
> --- a/meta/classes/kernel-yocto.bbclass
> +++ b/meta/classes/kernel-yocto.bbclass
> @@ -330,7 +330,7 @@ do_kernel_configme() {
>                 bbfatal_log "Could not find configuration queue
> (${meta_dir}/config.queue)"
>         fi
>
> -       CFLAGS="${CFLAGS} ${TOOLCHAIN_OPTIONS}" HOSTCC="${BUILD_CC}
> ${BUILD_CFLAGS} ${BUILD_LDFLAGS}" HOSTCPP="${BUILD_CPP}" CC="${KERNEL_CC}"
> ARCH=${ARCH} merge_config.sh -O ${B} ${config_flags} ${configs} >
> ${meta_dir}/cfg/merge_config_build.log 2>&1
> +       CFLAGS="${CFLAGS} ${TOOLCHAIN_OPTIONS}" HOSTCC="${BUILD_CC}
> ${BUILD_CFLAGS} ${BUILD_LDFLAGS}" HOSTCPP="${BUILD_CPP}" CC="${KERNEL_CC}"
> ARCH=${ARCH} merge_config.sh -O ${B} ${config_flags} ${configs} >
> ${meta_dir}/cfg/merge_config_build.log 2>
> ${meta_dir}/cfg/merge_config_build-errors.log
>         if [ $? -ne 0 ]; then
>                 bbfatal_log "Could not configure
> ${KMACHINE}-${LINUX_KERNEL_TYPE}"
>         fi
> --
> 2.7.4
>
> --
> _______________________________________________
> Openembedded-core mailing list
> Openembedded-core@lists.openembedded.org
> http://lists.openembedded.org/mailman/listinfo/openembedded-core
>


-- 
- Thou shalt not follow the NULL pointer, for chaos and madness await thee
at its end
- "Use the force Harry" - Gandalf, Star Trek II

--000000000000e9e0c00587abef58
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div dir=3D"ltr"><div class=3D"gmail_default" style=3D"fon=
t-size:small"><br></div></div><br><div class=3D"gmail_quote"><div dir=3D"lt=
r" class=3D"gmail_attr">On Mon, Apr 29, 2019 at 10:01 AM Flavio Suligoi &lt=
;<a href=3D"mailto:f.suligoi@asem.it" target=3D"_blank">f.suligoi@asem.it</=
a>&gt; wrote:<br></div><blockquote class=3D"gmail_quote" style=3D"margin:0p=
x 0px 0px 0.8ex;border-left:1px solid rgb(204,204,204);padding-left:1ex">In=
 the task:<br>
<br>
do_kernel_configme<br>
<br>
the errors during execution of the &quot;merge_config.sh&quot; script are<b=
r>
currently lost.<br>
But these errors are very useful for debugging, when there are<br>
problems during the kernel configuration fragments assembly.<br>
<br>
This is the reason to save also the error log, in addition to the<br>
existing log.<br></blockquote><div><br></div><div><div class=3D"gmail_defau=
lt" style=3D"font-size:small">Errors are picked up in a separate task. What=
 errors were you triggering that the existing audit wasn&#39;t seeing ?</di=
v></div><div class=3D"gmail_default" style=3D"font-size:small"><br></div><d=
iv class=3D"gmail_default" style=3D"font-size:small">Bruce</div><div>=C2=A0=
</div><blockquote class=3D"gmail_quote" style=3D"margin:0px 0px 0px 0.8ex;b=
order-left:1px solid rgb(204,204,204);padding-left:1ex">
<br>
Signed-off-by: Flavio Suligoi &lt;<a href=3D"mailto:f.suligoi@asem.it" targ=
et=3D"_blank">f.suligoi@asem.it</a>&gt;<br>
---<br>
=C2=A0meta/classes/kernel-yocto.bbclass | 2 +-<br>
=C2=A01 file changed, 1 insertion(+), 1 deletion(-)<br>
<br>
diff --git a/meta/classes/kernel-yocto.bbclass b/meta/classes/kernel-yocto.=
bbclass<br>
index ed9bcfa..243f8d6 100644<br>
--- a/meta/classes/kernel-yocto.bbclass<br>
+++ b/meta/classes/kernel-yocto.bbclass<br>
@@ -330,7 +330,7 @@ do_kernel_configme() {<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 bbfatal_log &quot;C=
ould not find configuration queue (${meta_dir}/config.queue)&quot;<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 fi<br>
<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0CFLAGS=3D&quot;${CFLAGS} ${TOOLCHAIN_OPTIONS}&q=
uot; HOSTCC=3D&quot;${BUILD_CC} ${BUILD_CFLAGS} ${BUILD_LDFLAGS}&quot; HOST=
CPP=3D&quot;${BUILD_CPP}&quot; CC=3D&quot;${KERNEL_CC}&quot; ARCH=3D${ARCH}=
 merge_config.sh -O ${B} ${config_flags} ${configs} &gt; ${meta_dir}/cfg/me=
rge_config_build.log 2&gt;&amp;1<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0CFLAGS=3D&quot;${CFLAGS} ${TOOLCHAIN_OPTIONS}&q=
uot; HOSTCC=3D&quot;${BUILD_CC} ${BUILD_CFLAGS} ${BUILD_LDFLAGS}&quot; HOST=
CPP=3D&quot;${BUILD_CPP}&quot; CC=3D&quot;${KERNEL_CC}&quot; ARCH=3D${ARCH}=
 merge_config.sh -O ${B} ${config_flags} ${configs} &gt; ${meta_dir}/cfg/me=
rge_config_build.log 2&gt; ${meta_dir}/cfg/merge_config_build-errors.log<br=
>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 if [ $? -ne 0 ]; then<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 bbfatal_log &quot;C=
ould not configure ${KMACHINE}-${LINUX_KERNEL_TYPE}&quot;<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 fi<br>
-- <br>
2.7.4<br>
<br>
-- <br>
_______________________________________________<br>
Openembedded-core mailing list<br>
<a href=3D"mailto:Openembedded-core@lists.openembedded.org" target=3D"_blan=
k">Openembedded-core@lists.openembedded.org</a><br>
<a href=3D"http://lists.openembedded.org/mailman/listinfo/openembedded-core=
" rel=3D"noreferrer" target=3D"_blank">http://lists.openembedded.org/mailma=
n/listinfo/openembedded-core</a><br>
</blockquote></div><br clear=3D"all"><div><br></div>-- <br><div dir=3D"ltr"=
 class=3D"m_-1828679734692823180gmail_signature">- Thou shalt not follow th=
e NULL pointer, for chaos and madness await thee at its end<br>- &quot;Use =
the force Harry&quot; - Gandalf, Star Trek II<br><br></div></div>

--000000000000e9e0c00587abef58--
