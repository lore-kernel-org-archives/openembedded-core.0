Return-Path: <martin.jansa@gmail.com>
Received: from mail-wr1-f46.google.com (mail-wr1-f46.google.com
	[209.85.221.46])
	by mail.openembedded.org (Postfix) with ESMTP id 258186D242
	for <openembedded-core@lists.openembedded.org>;
	Wed,  5 Dec 2018 14:40:25 +0000 (UTC)
Received: by mail-wr1-f46.google.com with SMTP id 96so19977934wrb.2
	for <openembedded-core@lists.openembedded.org>;
	Wed, 05 Dec 2018 06:40:26 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=mime-version:references:in-reply-to:from:date:message-id:subject:to
	:cc; bh=iqkIQqTuD3XNyCWhKx5OOXjnIdxhdExQORXMkGB0dj8=;
	b=Zn/FXqJ1ZhAFv07Q2dDJ2Fp9Ze+5QRe7L1MNgdKT9gKn/gtiw3aa4gG0loxt0dH/hG
	foCjyIinmL9UZjC5jUoFZ6RUYQoE66ZAoWX5sXBLcfYAGW5IRstEAIEtjStuY7rWHduh
	sTdppPc3i9jOko/fb2IkXX8DT9tFkXhzQqcstGoOJ5QMcFnhk9DoirD21oD+aOcR6ZnW
	YnWgFgwTOSBn4i4QFd7P+JKRt/Bx+05hGWrwVY52QiEwR7JXnInD8tQbVs+vy2RWW1dw
	0E8m80wXJghP7Yi1gkjlygs63OOiSD4PAYWuRrb7pxCwZFnfExLWrc6g+h9Th1f4l3Hp
	6Fcw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:references:in-reply-to:from:date
	:message-id:subject:to:cc;
	bh=iqkIQqTuD3XNyCWhKx5OOXjnIdxhdExQORXMkGB0dj8=;
	b=HoE4HXQygExgL4bEpEKqFa4FDu43gWWZAlPCWKdYVEjvi8xNQ7ALblvvM7/beQIwYt
	q4FIssXWlHxYYCQZepVIO9p5cPMHaH2LGR0kt+6AOp7gZNTeGA8DBml5ZlarsJ58t1hz
	mrSflWWPwEIF8yxzlStBLbpXpbn4KVpqnLa/ChF0eYDGJMKLCj9Yxgzf8gdSYbRE8Aij
	GqlugryESX6PkHORo5YX4jARiPvdYGJmKZEWZ2NcR6J7c4F19QXbks3uCgcQMj57OjEE
	YwWV8O2CBFFGpWnzJ3FD/I0VxobzDFrqj1JQAPCTBqVH4hCylPWrZRDLmZaYDA5EKRT+
	JHvA==
X-Gm-Message-State: AA+aEWbDIUbbKPrrM0e7oeKWRlBBlKDvNqdX6nO8jS/BgSlD7kXCjxxV
	mgJr9j9PFFgicceF7ZY93YR28GPtSSqELmGlM0M=
X-Google-Smtp-Source: AFSGD/XLzQT1K+pFkg4uLDro/M1oGT5hjkHB1oNSgQ+IVUtet2cZSjUP6Odif2dlp5pgwavCLMQeHBzbkz86GqGvXgQ=
X-Received: by 2002:adf:f504:: with SMTP id q4mr23261745wro.321.1544020825848; 
	Wed, 05 Dec 2018 06:40:25 -0800 (PST)
MIME-Version: 1.0
References: <cover.1542971171.git.liezhi.yang@windriver.com>
	<85fe4df7c0ce3e3c8017fbf410d98498669f7363.1542971171.git.liezhi.yang@windriver.com>
In-Reply-To: <85fe4df7c0ce3e3c8017fbf410d98498669f7363.1542971171.git.liezhi.yang@windriver.com>
From: Martin Jansa <martin.jansa@gmail.com>
Date: Wed, 5 Dec 2018 15:40:13 +0100
Message-ID: <CA+chaQegPbZ05LK3ZMNNHDYdjsi4ba-kp4=m3BBj6EbzbaHf8A@mail.gmail.com>
To: Robert Yang <liezhi.yang@windriver.com>
Cc: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH 1/1] uboot-sign.bbclass: Remove tab indentations in python code
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
X-List-Received-Date: Wed, 05 Dec 2018 14:40:25 -0000
Content-Type: multipart/alternative; boundary="000000000000d9c0ad057c475cd5"

--000000000000d9c0ad057c475cd5
Content-Type: text/plain; charset="UTF-8"

I wish we could have the same warning for shell code as well :).

Can you please take care of meta-gplv2 as well?
WARNING: meta-gplv2/recipes-core/coreutils/coreutils_6.9.bb: python should
use 4 spaces indentation, but found tabs in coreutils_6.9.bb, line 95

I've sent patch for meta-oe issue:
http://lists.openembedded.org/pipermail/openembedded-devel/2018-December/197803.html


On Fri, Nov 23, 2018 at 11:51 AM Robert Yang <liezhi.yang@windriver.com>
wrote:

> Use 4 spaces to replace a tab.
>
> Signed-off-by: Robert Yang <liezhi.yang@windriver.com>
> ---
>  meta/classes/uboot-sign.bbclass | 16 ++++++++--------
>  1 file changed, 8 insertions(+), 8 deletions(-)
>
> diff --git a/meta/classes/uboot-sign.bbclass
> b/meta/classes/uboot-sign.bbclass
> index 0e5e1b1..03100b8 100644
> --- a/meta/classes/uboot-sign.bbclass
> +++ b/meta/classes/uboot-sign.bbclass
> @@ -93,14 +93,14 @@ do_install_append() {
>  }
>
>  python () {
> -       if d.getVar('UBOOT_SIGN_ENABLE') == '1' and d.getVar('PN') ==
> d.getVar('UBOOT_PN'):
> -               kernel_pn = d.getVar('PREFERRED_PROVIDER_virtual/kernel')
> +    if d.getVar('UBOOT_SIGN_ENABLE') == '1' and d.getVar('PN') ==
> d.getVar('UBOOT_PN'):
> +        kernel_pn = d.getVar('PREFERRED_PROVIDER_virtual/kernel')
>
> -               # Make "bitbake u-boot -cdeploy" deploys the signed
> u-boot.dtb
> -               d.appendVarFlag('do_deploy', 'depends', ' %s:do_deploy' %
> kernel_pn)
> +        # Make "bitbake u-boot -cdeploy" deploys the signed u-boot.dtb
> +        d.appendVarFlag('do_deploy', 'depends', ' %s:do_deploy' %
> kernel_pn)
>
> -               # kernerl's do_deploy is a litle special, so we can't use
> -               # do_deploy_append, otherwise it would override
> -               # kernel_do_deploy.
> -               d.appendVarFlag('do_deploy', 'prefuncs', ' concat_dtb')
> +        # kernerl's do_deploy is a litle special, so we can't use
> +        # do_deploy_append, otherwise it would override
> +        # kernel_do_deploy.
> +        d.appendVarFlag('do_deploy', 'prefuncs', ' concat_dtb')
>  }
> --
> 2.7.4
>
> --
> _______________________________________________
> Openembedded-core mailing list
> Openembedded-core@lists.openembedded.org
> http://lists.openembedded.org/mailman/listinfo/openembedded-core
>

--000000000000d9c0ad057c475cd5
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div dir=3D"ltr"><div dir=3D"ltr"><div>I wish we could hav=
e the same warning for shell code as well :).</div><div><br></div><div>Can =
you please take care of meta-gplv2 as well?</div><div>WARNING: meta-gplv2/r=
ecipes-core/coreutils/<a href=3D"http://coreutils_6.9.bb">coreutils_6.9.bb<=
/a>: python should use 4 spaces indentation, but found tabs in <a href=3D"h=
ttp://coreutils_6.9.bb">coreutils_6.9.bb</a>, line 95<br></div><div><br></d=
iv><div>I&#39;ve sent patch for meta-oe issue:</div><div><a href=3D"http://=
lists.openembedded.org/pipermail/openembedded-devel/2018-December/197803.ht=
ml">http://lists.openembedded.org/pipermail/openembedded-devel/2018-Decembe=
r/197803.html</a><br></div><div><br></div></div></div></div><br><div class=
=3D"gmail_quote"><div dir=3D"ltr">On Fri, Nov 23, 2018 at 11:51 AM Robert Y=
ang &lt;<a href=3D"mailto:liezhi.yang@windriver.com">liezhi.yang@windriver.=
com</a>&gt; wrote:<br></div><blockquote class=3D"gmail_quote" style=3D"marg=
in:0 0 0 .8ex;border-left:1px #ccc solid;padding-left:1ex">Use 4 spaces to =
replace a tab.<br>
<br>
Signed-off-by: Robert Yang &lt;<a href=3D"mailto:liezhi.yang@windriver.com"=
 target=3D"_blank">liezhi.yang@windriver.com</a>&gt;<br>
---<br>
=C2=A0meta/classes/uboot-sign.bbclass | 16 ++++++++--------<br>
=C2=A01 file changed, 8 insertions(+), 8 deletions(-)<br>
<br>
diff --git a/meta/classes/uboot-sign.bbclass b/meta/classes/uboot-sign.bbcl=
ass<br>
index 0e5e1b1..03100b8 100644<br>
--- a/meta/classes/uboot-sign.bbclass<br>
+++ b/meta/classes/uboot-sign.bbclass<br>
@@ -93,14 +93,14 @@ do_install_append() {<br>
=C2=A0}<br>
<br>
=C2=A0python () {<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0if d.getVar(&#39;UBOOT_SIGN_ENABLE&#39;) =3D=3D=
 &#39;1&#39; and d.getVar(&#39;PN&#39;) =3D=3D d.getVar(&#39;UBOOT_PN&#39;)=
:<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0kernel_pn =3D d.get=
Var(&#39;PREFERRED_PROVIDER_virtual/kernel&#39;)<br>
+=C2=A0 =C2=A0 if d.getVar(&#39;UBOOT_SIGN_ENABLE&#39;) =3D=3D &#39;1&#39; =
and d.getVar(&#39;PN&#39;) =3D=3D d.getVar(&#39;UBOOT_PN&#39;):<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 kernel_pn =3D d.getVar(&#39;PREFERRED_PROVIDER=
_virtual/kernel&#39;)<br>
<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0# Make &quot;bitbak=
e u-boot -cdeploy&quot; deploys the signed u-boot.dtb<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0d.appendVarFlag(&#3=
9;do_deploy&#39;, &#39;depends&#39;, &#39; %s:do_deploy&#39; % kernel_pn)<b=
r>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 # Make &quot;bitbake u-boot -cdeploy&quot; dep=
loys the signed u-boot.dtb<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 d.appendVarFlag(&#39;do_deploy&#39;, &#39;depe=
nds&#39;, &#39; %s:do_deploy&#39; % kernel_pn)<br>
<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0# kernerl&#39;s do_=
deploy is a litle special, so we can&#39;t use<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0# do_deploy_append,=
 otherwise it would override<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0# kernel_do_deploy.=
<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0d.appendVarFlag(&#3=
9;do_deploy&#39;, &#39;prefuncs&#39;, &#39; concat_dtb&#39;)<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 # kernerl&#39;s do_deploy is a litle special, =
so we can&#39;t use<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 # do_deploy_append, otherwise it would overrid=
e<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 # kernel_do_deploy.<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 d.appendVarFlag(&#39;do_deploy&#39;, &#39;pref=
uncs&#39;, &#39; concat_dtb&#39;)<br>
=C2=A0}<br>
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
</blockquote></div>

--000000000000d9c0ad057c475cd5--
