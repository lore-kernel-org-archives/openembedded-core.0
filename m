Return-Path: <raj.khem@gmail.com>
Received: from mail-wm0-f68.google.com (mail-wm0-f68.google.com [74.125.82.68])
	by mail.openembedded.org (Postfix) with ESMTP id 083AC60603
	for <openembedded-core@lists.openembedded.org>;
	Thu, 16 Mar 2017 02:06:31 +0000 (UTC)
Received: by mail-wm0-f68.google.com with SMTP id x124so1740522wmf.3
	for <openembedded-core@lists.openembedded.org>;
	Wed, 15 Mar 2017 19:06:33 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=mime-version:references:in-reply-to:from:date:message-id:subject:to; 
	bh=ZhyCvx6XTDJ7YKvyBw9U5srhLYiR3VuixidBuv5IxxA=;
	b=KOswBHvq6kcIvJ9itoAujJ9ptPbB1GsRupL7dfNO7eN9ID/ttcmRbwIcnLeYaUjXim
	ElzIpnnHElpE0bCxRSXBtL+D8NSAjdWjLNwIeozyzl/0tnmKQeseDXFJ6PqUTyJ/TiQp
	4Xca80jOq+6UzRxf2EwVeDX5R+gMqsFpqfuix8ttLJQEZRx14H2Cq3MAexibxwGlX7sa
	nL799soaP4fvMYROtl3vTcoLA1sWcYSs1SUtkD2vzPvzHw34V5qFgD4SwnpkbFqaspiG
	h22DwEhSys22DtCgY0lUnK5sNetqfQD7HjfrLlYhsKORRK4rCx4KkY/uZTBGUvhW+Hts
	AOkA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:references:in-reply-to:from:date
	:message-id:subject:to;
	bh=ZhyCvx6XTDJ7YKvyBw9U5srhLYiR3VuixidBuv5IxxA=;
	b=eslZJFhVjwiIsIXJQ4bfgjVV/jh02lxKFZi5Qd2B+x1NEa3JO1iq89OevVy4Ipzd9e
	znEXOOYrEYFe8Z0zyJCGLT30wx6g9vtF0RDdAAVUWJUZH9eDwmyDm2+UYS8Y37cFfpUc
	6pJCk2YervfXLySzmp7SqBJXCmwpQ3cVO8ccQhwz9Qe4Ak9ao2yKONbjLdnmb075BxCD
	N4w1eZ+DEdP9VoDiN4kTTw/medjFUtuKNCuTExUPIQY1xBL4Uf2bMQAV8nRTTVPFvQ27
	bzVXFzBS8ljBGbRbhC8UuqXwr27MveI2h9hRuPrioCg5pgqgAmlQSKGmBK2VBAMSxtbd
	0PyA==
X-Gm-Message-State: AFeK/H2ln21yFrqCMSF/p0f1vMJXFdrNZZC/5moYnXkKmMweutVjHme17sfI5ihNM+1IuAVyGTfWMsYjZJ+PtA==
X-Received: by 10.28.165.145 with SMTP id o139mr1433450wme.13.1489629992700;
	Wed, 15 Mar 2017 19:06:32 -0700 (PDT)
MIME-Version: 1.0
References: <1489602937-9554-1-git-send-email-zhengrq.fnst@cn.fujitsu.com>
In-Reply-To: <1489602937-9554-1-git-send-email-zhengrq.fnst@cn.fujitsu.com>
From: Khem Raj <raj.khem@gmail.com>
Date: Thu, 16 Mar 2017 02:06:21 +0000
Message-ID: <CAMKF1soFMJSW3mbErsr6wiLj+sRCDfxwGNmKL2x4hUOGRZO-6w@mail.gmail.com>
To: openembedded-core@lists.openembedded.org, 
	zhengrq <zhengrq.fnst@cn.fujitsu.com>
Subject: Re: [jethro][PATCH] gcc-multilib-config: make aarch64 support multilib
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
X-List-Received-Date: Thu, 16 Mar 2017 02:06:32 -0000
Content-Type: multipart/alternative; boundary=001a114b41088fd1dc054acf8236

--001a114b41088fd1dc054acf8236
Content-Type: text/plain; charset=UTF-8

On Wed, Mar 15, 2017 at 2:36 AM zhengrq <zhengrq.fnst@cn.fujitsu.com> wrote:

>   Fixed:
>   MACHINE = qemuarm64
>   require conf/multilib.conf
>   MULTILIBS = "multilib:lib32"
>   DEFAULTTUNE_virtclass-multilib-lib32 = "armv7at-neon"
>
>   $ bitbake core-image-minimal -cpopulate_sdk
>
>   WARNING: gcc multilib setup is not supported for TARGET_ARCH=aarch64
>   WARNING: gcc multilib setup is not supported for TARGET_ARCH=aarch64
>
>   [YOCTO #8638]


Gcc backend for aarch64 is separate from arm targets how have you tested
the generated compiler sdk

>
>
>   (From OE-Core rev: 0ae52c8b2c1d7d7cdbcfeeae6ff42e64f16bc41d)
>
> Signed-off-by: Robert Yang <liezhi.yang@windriver.com>
> Signed-off-by: Ross Burton <ross.burton@intel.com>
> Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
> Signed-off-by: Zheng Ruoqin <zhengrq.fnst@cn.fujitsu.com>
> ---
>  meta/recipes-devtools/gcc/gcc-multilib-config.inc | 7 +++++++
>  1 file changed, 7 insertions(+)
>
> diff --git a/meta/recipes-devtools/gcc/gcc-multilib-config.inc
> b/meta/recipes-devtools/gcc/gcc-multilib-config.inc
> index 1c0a45a..a0a2ac0 100644
> --- a/meta/recipes-devtools/gcc/gcc-multilib-config.inc
> +++ b/meta/recipes-devtools/gcc/gcc-multilib-config.inc
> @@ -29,6 +29,9 @@ python gcc_multilib_setup() {
>      bb.utils.remove(build_conf_dir, True)
>      ml_globs = ('%s/*/t-linux64' % src_conf_dir,
>                  '%s/*/linux64.h' % src_conf_dir,
> +                '%s/aarch64/t-aarch64' % src_conf_dir,
> +                '%s/aarch64/aarch64.h' % src_conf_dir,
> +                '%s/aarch64/aarch64-cores.def' % src_conf_dir,
>                  '%s/*/linux.h' % src_conf_dir,
>                  '%s/linux.h' % src_conf_dir)
>
> @@ -130,6 +133,8 @@ python gcc_multilib_setup() {
>          'mips64'    : ['gcc/config/mips/t-linux64'],
>          'powerpc'   : ['gcc/config/rs6000/t-linux64'],
>          'powerpc64' : ['gcc/config/rs6000/t-linux64'],
> +        'aarch64'   : ['gcc/config/aarch64/t-aarch64'],
> +        'arm'       : ['gcc/config/aarch64/t-aarch64'],
>      }
>
>      gcc_header_config_files = {
> @@ -140,6 +145,8 @@ python gcc_multilib_setup() {
>          'mips64'    : ['gcc/config/mips/linux.h',
> 'gcc/config/mips/linux64.h'],
>          'powerpc'   : ['gcc/config/rs6000/linux64.h'],
>          'powerpc64' : ['gcc/config/rs6000/linux64.h'],
> +        'aarch64'   : ['gcc/config/aarch64/aarch64.h'],
> +        'arm'       : ['gcc/config/aarch64/aarch64.h'],
>      }
>
>      libdir32 = 'SYSTEMLIBS_DIR'
> --
> 2.7.4
>
>
>
> --
> _______________________________________________
> Openembedded-core mailing list
> Openembedded-core@lists.openembedded.org
> http://lists.openembedded.org/mailman/listinfo/openembedded-core
>

--001a114b41088fd1dc054acf8236
Content-Type: text/html; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

<div><br><div class=3D"gmail_quote"><div>On Wed, Mar 15, 2017 at 2:36 AM zh=
engrq &lt;<a href=3D"mailto:zhengrq.fnst@cn.fujitsu.com">zhengrq.fnst@cn.fu=
jitsu.com</a>&gt; wrote:<br></div><blockquote class=3D"gmail_quote" style=
=3D"margin:0 0 0 .8ex;border-left:1px #ccc solid;padding-left:1ex">=C2=A0 F=
ixed:<br class=3D"gmail_msg">
=C2=A0 MACHINE =3D qemuarm64<br class=3D"gmail_msg">
=C2=A0 require conf/multilib.conf<br class=3D"gmail_msg">
=C2=A0 MULTILIBS =3D &quot;multilib:lib32&quot;<br class=3D"gmail_msg">
=C2=A0 DEFAULTTUNE_virtclass-multilib-lib32 =3D &quot;armv7at-neon&quot;<br=
 class=3D"gmail_msg">
<br class=3D"gmail_msg">
=C2=A0 $ bitbake core-image-minimal -cpopulate_sdk<br class=3D"gmail_msg">
<br class=3D"gmail_msg">
=C2=A0 WARNING: gcc multilib setup is not supported for TARGET_ARCH=3Daarch=
64<br class=3D"gmail_msg">
=C2=A0 WARNING: gcc multilib setup is not supported for TARGET_ARCH=3Daarch=
64<br class=3D"gmail_msg">
<br class=3D"gmail_msg">
=C2=A0 [YOCTO #8638]</blockquote><div><br></div><div>Gcc backend for aarch6=
4 is separate from arm targets how have you tested the generated compiler s=
dk</div><blockquote class=3D"gmail_quote" style=3D"margin:0 0 0 .8ex;border=
-left:1px #ccc solid;padding-left:1ex"><br class=3D"gmail_msg">
<br class=3D"gmail_msg">
=C2=A0 (From OE-Core rev: 0ae52c8b2c1d7d7cdbcfeeae6ff42e64f16bc41d)<br clas=
s=3D"gmail_msg">
<br class=3D"gmail_msg">
Signed-off-by: Robert Yang &lt;<a href=3D"mailto:liezhi.yang@windriver.com"=
 class=3D"gmail_msg" target=3D"_blank">liezhi.yang@windriver.com</a>&gt;<br=
 class=3D"gmail_msg">
Signed-off-by: Ross Burton &lt;<a href=3D"mailto:ross.burton@intel.com" cla=
ss=3D"gmail_msg" target=3D"_blank">ross.burton@intel.com</a>&gt;<br class=
=3D"gmail_msg">
Signed-off-by: Richard Purdie &lt;<a href=3D"mailto:richard.purdie@linuxfou=
ndation.org" class=3D"gmail_msg" target=3D"_blank">richard.purdie@linuxfoun=
dation.org</a>&gt;<br class=3D"gmail_msg">
Signed-off-by: Zheng Ruoqin &lt;<a href=3D"mailto:zhengrq.fnst@cn.fujitsu.c=
om" class=3D"gmail_msg" target=3D"_blank">zhengrq.fnst@cn.fujitsu.com</a>&g=
t;<br class=3D"gmail_msg">
---<br class=3D"gmail_msg">
=C2=A0meta/recipes-devtools/gcc/gcc-multilib-config.inc | 7 +++++++<br clas=
s=3D"gmail_msg">
=C2=A01 file changed, 7 insertions(+)<br class=3D"gmail_msg">
<br class=3D"gmail_msg">
diff --git a/meta/recipes-devtools/gcc/gcc-multilib-config.inc b/meta/recip=
es-devtools/gcc/gcc-multilib-config.inc<br class=3D"gmail_msg">
index 1c0a45a..a0a2ac0 100644<br class=3D"gmail_msg">
--- a/meta/recipes-devtools/gcc/gcc-multilib-config.inc<br class=3D"gmail_m=
sg">
+++ b/meta/recipes-devtools/gcc/gcc-multilib-config.inc<br class=3D"gmail_m=
sg">
@@ -29,6 +29,9 @@ python gcc_multilib_setup() {<br class=3D"gmail_msg">
=C2=A0 =C2=A0 =C2=A0bb.utils.remove(build_conf_dir, True)<br class=3D"gmail=
_msg">
=C2=A0 =C2=A0 =C2=A0ml_globs =3D (&#39;%s/*/t-linux64&#39; % src_conf_dir,<=
br class=3D"gmail_msg">
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0&#39;%s/*/lin=
ux64.h&#39; % src_conf_dir,<br class=3D"gmail_msg">
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 &#39;%s/aarch64/t-=
aarch64&#39; % src_conf_dir,<br class=3D"gmail_msg">
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 &#39;%s/aarch64/aa=
rch64.h&#39; % src_conf_dir,<br class=3D"gmail_msg">
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 &#39;%s/aarch64/aa=
rch64-cores.def&#39; % src_conf_dir,<br class=3D"gmail_msg">
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0&#39;%s/*/lin=
ux.h&#39; % src_conf_dir,<br class=3D"gmail_msg">
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0&#39;%s/linux=
.h&#39; % src_conf_dir)<br class=3D"gmail_msg">
<br class=3D"gmail_msg">
@@ -130,6 +133,8 @@ python gcc_multilib_setup() {<br class=3D"gmail_msg">
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0&#39;mips64&#39;=C2=A0 =C2=A0 : [&#39;gcc=
/config/mips/t-linux64&#39;],<br class=3D"gmail_msg">
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0&#39;powerpc&#39;=C2=A0 =C2=A0: [&#39;gcc=
/config/rs6000/t-linux64&#39;],<br class=3D"gmail_msg">
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0&#39;powerpc64&#39; : [&#39;gcc/config/rs=
6000/t-linux64&#39;],<br class=3D"gmail_msg">
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 &#39;aarch64&#39;=C2=A0 =C2=A0: [&#39;gcc/conf=
ig/aarch64/t-aarch64&#39;],<br class=3D"gmail_msg">
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 &#39;arm&#39;=C2=A0 =C2=A0 =C2=A0 =C2=A0: [&#3=
9;gcc/config/aarch64/t-aarch64&#39;],<br class=3D"gmail_msg">
=C2=A0 =C2=A0 =C2=A0}<br class=3D"gmail_msg">
<br class=3D"gmail_msg">
=C2=A0 =C2=A0 =C2=A0gcc_header_config_files =3D {<br class=3D"gmail_msg">
@@ -140,6 +145,8 @@ python gcc_multilib_setup() {<br class=3D"gmail_msg">
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0&#39;mips64&#39;=C2=A0 =C2=A0 : [&#39;gcc=
/config/mips/linux.h&#39;, &#39;gcc/config/mips/linux64.h&#39;],<br class=
=3D"gmail_msg">
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0&#39;powerpc&#39;=C2=A0 =C2=A0: [&#39;gcc=
/config/rs6000/linux64.h&#39;],<br class=3D"gmail_msg">
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0&#39;powerpc64&#39; : [&#39;gcc/config/rs=
6000/linux64.h&#39;],<br class=3D"gmail_msg">
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 &#39;aarch64&#39;=C2=A0 =C2=A0: [&#39;gcc/conf=
ig/aarch64/aarch64.h&#39;],<br class=3D"gmail_msg">
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 &#39;arm&#39;=C2=A0 =C2=A0 =C2=A0 =C2=A0: [&#3=
9;gcc/config/aarch64/aarch64.h&#39;],<br class=3D"gmail_msg">
=C2=A0 =C2=A0 =C2=A0}<br class=3D"gmail_msg">
<br class=3D"gmail_msg">
=C2=A0 =C2=A0 =C2=A0libdir32 =3D &#39;SYSTEMLIBS_DIR&#39;<br class=3D"gmail=
_msg">
--<br class=3D"gmail_msg">
2.7.4<br class=3D"gmail_msg">
<br class=3D"gmail_msg">
<br class=3D"gmail_msg">
<br class=3D"gmail_msg">
--<br class=3D"gmail_msg">
_______________________________________________<br class=3D"gmail_msg">
Openembedded-core mailing list<br class=3D"gmail_msg">
<a href=3D"mailto:Openembedded-core@lists.openembedded.org" class=3D"gmail_=
msg" target=3D"_blank">Openembedded-core@lists.openembedded.org</a><br clas=
s=3D"gmail_msg">
<a href=3D"http://lists.openembedded.org/mailman/listinfo/openembedded-core=
" rel=3D"noreferrer" class=3D"gmail_msg" target=3D"_blank">http://lists.ope=
nembedded.org/mailman/listinfo/openembedded-core</a><br class=3D"gmail_msg"=
>
</blockquote></div></div>

--001a114b41088fd1dc054acf8236--
