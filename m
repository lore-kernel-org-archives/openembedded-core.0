Return-Path: <ross.burton@intel.com>
Received: from mail-io0-f176.google.com (mail-io0-f176.google.com
	[209.85.223.176])
	by mail.openembedded.org (Postfix) with ESMTP id 807D474912
	for <openembedded-core@lists.openembedded.org>;
	Thu,  3 May 2018 10:12:36 +0000 (UTC)
Received: by mail-io0-f176.google.com with SMTP id c9-v6so14606624iob.12
	for <openembedded-core@lists.openembedded.org>;
	Thu, 03 May 2018 03:12:37 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=intel-com.20150623.gappssmtp.com; s=20150623;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc; bh=OJPk7Fj5W1x5ffl9YRe3BVHEROkq+vwt3Udzf/2U0HQ=;
	b=x/l2gqjsRT4l4iZZTNp/FLGHs4minF7afeXRxlHzAOC6QxIVPooPsoY2PMcZHzR3zl
	xbBqDY2Kxdqv+Sr6GirIqqTsxY3YGg2bMPHgUGtIie3vR0PaRVzJzxWI0z6Om29aE0mv
	3gJtdcNMQuoLaDUv2oTpBP7EMgOqNol+RXZsvb1Z9SHKNIgHFx6aYMANKBwei+36TeeV
	qNJFuDB9oyq/SChWplUS+b9uJjvtGrK8cg8AV+rpznypcmS9LoywF8O+y1fPGOYiM5OG
	r3pd7QZOREZLe2rzEw/wA8UM+88QYLBrXLOeSENP9CHJT4WWy8onRg8FtulG3c/5IQqN
	uHRw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc;
	bh=OJPk7Fj5W1x5ffl9YRe3BVHEROkq+vwt3Udzf/2U0HQ=;
	b=T9EQXEY/vwYREnMfI5vh3uXj+uMx44okR4PJXfVaeApyXEaK/ZxD/AHLpSrzyejJpu
	pjJLA8tnwtz3gVFHbajO3xYOFH6YOCwiKVGT69sN6urbRcw9QAsw0Lwk58/BdkLy8DSk
	uPsQb/IobEjpTGY73qGuSv7GWXKXu01pMBonoG2d9o/4UBCx6sEcAZAl4sTiv0z38p/T
	ZIjmEIDUoIHLV2I/B9OT/ttUpFLt/H7AM1idujIvtTel0vV0APtIZsrZ6yN4C2GMjWCg
	BvTlJjuSaP89ymIFB6vv+pN7ZQy23jiRYbzXFx8AY3pJd8e880qvLex4WeSQLLYBiqr1
	D0tg==
X-Gm-Message-State: ALQs6tBZ0a3x5gy0iezj54JEnsrA5i0Ei0QEi/M39wLQ87ydEb+yQv/E
	WaIgYQK+mW2sbmajHfKlNmSSh5N/craSzcQs5MqcPA==
X-Google-Smtp-Source: AB8JxZoVG0ihgm07MjDYziygEJ0jnKbRrqKtPEzGYMsG5f3tynmPoZos5e0ariF61XaEK76fO0JH1FxKsIp4UHxazy8=
X-Received: by 2002:a6b:248e:: with SMTP id
	k136-v6mr22940139iok.270.1525342357402; 
	Thu, 03 May 2018 03:12:37 -0700 (PDT)
MIME-Version: 1.0
Received: by 10.107.29.203 with HTTP; Thu, 3 May 2018 03:12:17 -0700 (PDT)
In-Reply-To: <20180503100326.32797-1-raj.khem@gmail.com>
References: <20180503100326.32797-1-raj.khem@gmail.com>
From: "Burton, Ross" <ross.burton@intel.com>
Date: Thu, 3 May 2018 11:12:17 +0100
Message-ID: <CAJTo0LZCas_oVQ0z75OVJVuoHWsQuQ4p-4VbK3CGk6y2_JO5oQ@mail.gmail.com>
To: Khem Raj <raj.khem@gmail.com>
Cc: OE-core <openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH] mesa: Define PYTHON2
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
X-List-Received-Date: Thu, 03 May 2018 10:12:36 -0000
Content-Type: multipart/alternative; boundary="0000000000005fd471056b4a71ad"

--0000000000005fd471056b4a71ad
Content-Type: text/plain; charset="UTF-8"

Do you know what scripts those are?  It would be good to get them to have a
python2 hashbang upstream, I've a sideline in quietly migrating upstreams
to python3 so this is an important first step.

Ross

On 3 May 2018 at 11:03, Khem Raj <raj.khem@gmail.com> wrote:

> Ensure that python2 is not assumed to be python which can
> point to python3 in some cases, when building gallium-llvm
> there are scripts which are requiring python2 and wont work
> with python3
>
> Signed-off-by: Khem Raj <raj.khem@gmail.com>
> ---
>  meta/recipes-graphics/mesa/mesa.inc | 1 +
>  1 file changed, 1 insertion(+)
>
> diff --git a/meta/recipes-graphics/mesa/mesa.inc
> b/meta/recipes-graphics/mesa/mesa.inc
> index 0a4cfc25a5..9bddb7acef 100644
> --- a/meta/recipes-graphics/mesa/mesa.inc
> +++ b/meta/recipes-graphics/mesa/mesa.inc
> @@ -35,6 +35,7 @@ export LLVM_CONFIG = "${STAGING_BINDIR_NATIVE}/
> llvm-config${MESA_LLVM_RELEASE}"
>  export YOCTO_ALTERNATE_EXE_PATH = "${STAGING_LIBDIR}/llvm${MESA_
> LLVM_RELEASE}/llvm-config"
>  EXTRA_OECONF = "--enable-shared-glapi \
>                  --disable-opencl \
> +                PYTHON2=python2 \
>                  --with-llvm-prefix=${STAGING_LIBDIR}/llvm${MESA_LLVM_RELEASE}
> \
>                  --with-platforms='${PLATFORMS}'"
>
> --
> 2.17.0
>
> --
> _______________________________________________
> Openembedded-core mailing list
> Openembedded-core@lists.openembedded.org
> http://lists.openembedded.org/mailman/listinfo/openembedded-core
>

--0000000000005fd471056b4a71ad
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr">Do you know what scripts those are?=C2=A0 It would be good=
 to get them to have a python2 hashbang upstream, I&#39;ve a sideline in qu=
ietly migrating upstreams to python3 so this is an important first step.<di=
v><br></div><div>Ross</div></div><div class=3D"gmail_extra"><br><div class=
=3D"gmail_quote">On 3 May 2018 at 11:03, Khem Raj <span dir=3D"ltr">&lt;<a =
href=3D"mailto:raj.khem@gmail.com" target=3D"_blank">raj.khem@gmail.com</a>=
&gt;</span> wrote:<br><blockquote class=3D"gmail_quote" style=3D"margin:0 0=
 0 .8ex;border-left:1px #ccc solid;padding-left:1ex">Ensure that python2 is=
 not assumed to be python which can<br>
point to python3 in some cases, when building gallium-llvm<br>
there are scripts which are requiring python2 and wont work<br>
with python3<br>
<br>
Signed-off-by: Khem Raj &lt;<a href=3D"mailto:raj.khem@gmail.com">raj.khem@=
gmail.com</a>&gt;<br>
---<br>
=C2=A0meta/recipes-graphics/mesa/<wbr>mesa.inc | 1 +<br>
=C2=A01 file changed, 1 insertion(+)<br>
<br>
diff --git a/meta/recipes-graphics/mesa/<wbr>mesa.inc b/meta/recipes-graphi=
cs/mesa/<wbr>mesa.inc<br>
index 0a4cfc25a5..9bddb7acef 100644<br>
--- a/meta/recipes-graphics/mesa/<wbr>mesa.inc<br>
+++ b/meta/recipes-graphics/mesa/<wbr>mesa.inc<br>
@@ -35,6 +35,7 @@ export LLVM_CONFIG =3D &quot;${STAGING_BINDIR_NATIVE}/<wb=
r>llvm-config${MESA_LLVM_<wbr>RELEASE}&quot;<br>
=C2=A0export YOCTO_ALTERNATE_EXE_PATH =3D &quot;${STAGING_LIBDIR}/llvm${MES=
A_<wbr>LLVM_RELEASE}/llvm-config&quot;<br>
=C2=A0EXTRA_OECONF =3D &quot;--enable-shared-glapi \<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0--disable-ope=
ncl \<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 PYTHON2=3Dpython2 =
\<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0--with-llvm-p=
refix=3D${STAGING_<wbr>LIBDIR}/llvm${MESA_LLVM_<wbr>RELEASE} \<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0--with-platfo=
rms=3D&#39;${PLATFORMS}<wbr>&#39;&quot;<br>
<span class=3D"HOEnZb"><font color=3D"#888888">=C2=A0<br>
-- <br>
2.17.0<br>
<br>
-- <br>
______________________________<wbr>_________________<br>
Openembedded-core mailing list<br>
<a href=3D"mailto:Openembedded-core@lists.openembedded.org">Openembedded-co=
re@lists.<wbr>openembedded.org</a><br>
<a href=3D"http://lists.openembedded.org/mailman/listinfo/openembedded-core=
" rel=3D"noreferrer" target=3D"_blank">http://lists.openembedded.org/<wbr>m=
ailman/listinfo/openembedded-<wbr>core</a><br>
</font></span></blockquote></div><br></div>

--0000000000005fd471056b4a71ad--
