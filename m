Return-Path: <martin.jansa@gmail.com>
Received: from mail-wr1-f68.google.com (mail-wr1-f68.google.com
	[209.85.221.68])
	by mail.openembedded.org (Postfix) with ESMTP id D74557CF4F
	for <openembedded-core@lists.openembedded.org>;
	Fri,  8 Mar 2019 06:38:12 +0000 (UTC)
Received: by mail-wr1-f68.google.com with SMTP id f14so20092925wrg.1
	for <openembedded-core@lists.openembedded.org>;
	Thu, 07 Mar 2019 22:38:14 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=mime-version:references:in-reply-to:from:date:message-id:subject:to
	:cc; bh=7IMWV4nrWNA8uqORdeS0jDTj5bk+ZrWhGbVW1O7yvVU=;
	b=VP7Tt6vMjwKQN7w4cfxZTlWNSfE4Y+myqo9ynlAdTKQJ0eDsl8zv6cyAqHQoX9LdvH
	lmKkLpw9GRplutIgyJ2zCnfuxnJiv5cFybc5/J/eH2xTIHZFLwM3GZWM3P7xQF0luopb
	M1t+wnAJg+GyOLMmVH9jwLuCzVJ3IOHZwgo3aVArqsC8DT7BRhboNGUapSq/R/2nkVNT
	w2ETeo+axI4MozKONtCzDAyxxIDT0XfJxaWWbcQ/Smi/HeG9pLM/evX1YS0uYeOJtQze
	2CDu4W4QuDsVJr8j6rtf/LLYY2zBq+c4N0QrEGZ57lh2jkMahlNBl7yWLuSxzV05UKPp
	GaoA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:references:in-reply-to:from:date
	:message-id:subject:to:cc;
	bh=7IMWV4nrWNA8uqORdeS0jDTj5bk+ZrWhGbVW1O7yvVU=;
	b=OrAOngySbAkFlx2dhai5e6AF3ZODdNMtj6mpcp2W2b73zgErjLbqXV+59eSs7jstc+
	Hee30kW8M8mJmX3p3h38wMBppy3XzPwR1Nh4vAH19b/pf1qeMZb36IBAK1L+TjbayXz5
	WGyptOQ4rV34qhOIq5hniD8Gl/JqkFHKFNFdGVz2k8Bgwr4k2tQy4wbmi32SMJc7SQXx
	n7vNkjQVa1PiYuX1Fs/3tkg4Qrvk5h2Pb2g/Rjir3tTdfg6BsyycNmzt0Gez7Nskz6lU
	XivOgKlwXimSXLubETi4PEfpGmWZQJu37Um1cQjuc3hQ/MF6KYlk2s2VncM6qK6ITiIf
	Vpkg==
X-Gm-Message-State: APjAAAVfDo70KiX1yFKguQCxds210TqTIyTPitADImVsjLfUMA0746T5
	0dK8uAJTKLZ/u9OPj1LP6twbor7C8knCzhI1CQM=
X-Google-Smtp-Source: APXvYqysmSIkcIbcvLR1i4h/ON+Mq3CpgJowyXiyWRWipBk7hoPAZgrtkUy1OWpjEKjNqm8wwy5fhVckOiNU9c3G+K8=
X-Received: by 2002:a05:6000:1142:: with SMTP id
	d2mr9369948wrx.43.1552027093337; 
	Thu, 07 Mar 2019 22:38:13 -0800 (PST)
MIME-Version: 1.0
References: <20190308063557.3712-1-bruce.ashfield@gmail.com>
In-Reply-To: <20190308063557.3712-1-bruce.ashfield@gmail.com>
From: Martin Jansa <martin.jansa@gmail.com>
Date: Fri, 8 Mar 2019 07:38:02 +0100
Message-ID: <CA+chaQeSYxNfq8VOhiZr5=C2Z0ArzHsdAOuTLVrHV4SqrkZ38w@mail.gmail.com>
To: Bruce Ashfield <bruce.ashfield@gmail.com>
Cc: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH] perf: synchronize unistd.h between libc-headers and perf source
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
X-List-Received-Date: Fri, 08 Mar 2019 06:38:13 -0000
Content-Type: multipart/alternative; boundary="0000000000009489c705838f779d"

--0000000000009489c705838f779d
Content-Type: text/plain; charset="UTF-8"

Why not use STAGING_INCDIR ?

On Fri, Mar 8, 2019 at 7:36 AM <bruce.ashfield@gmail.com> wrote:

> From: Bruce Ashfield <bruce.ashfield@gmail.com>
>
> During the build for some architectures, perf generates a program
> which executes on the host to dump the syscall table.
>
> The generation of that program uses the cross compiler + sysroot
> to expand unistd.h. As such, we are getting the contents of that
> file from linux-libc-headers.
>
> The compilation of that generated program uses the host compiler
> and a restricted include path to the perf source code. In the
> perf source there is a captured unistd.h, as such it will be used
> when compiling the host executable. The perf source code is copied
> from the kernel version that is being built .. so we have a
> mismatch between the generation and the compilation of the host
> program.
>
> Normally this mismatch is fine, but if the libc-headers are
> newer than the kernel, we'll have syscalls (and their syscall
> numbers) that are not defined in the perf source code. This
> leads to a compiler error and a cascading failure of the perf
> build due to a missing generated file.
>
> To fix this, we can copy unistd.h from the recipe-sysroot
> into the perf source code and they will always be in sync.
>
> Signed-off-by: Bruce Ashfield <bruce.ashfield@gmail.com>
> ---
>
> Richard,
>
> This should fix the perf build failure with 4.19 and the 5.0
> libc-headers.
>
> It also builds fine in the other combinations I was able to
> test. No sense sitting on this, it can use some AB combinations
> for more testing.
>
> Bruce
>
>  meta/recipes-kernel/perf/perf.bb | 3 +++
>  1 file changed, 3 insertions(+)
>
> diff --git a/meta/recipes-kernel/perf/perf.bb b/meta/recipes-kernel/perf/
> perf.bb
> index 9120766858..2f85006ee1 100644
> --- a/meta/recipes-kernel/perf/perf.bb
> +++ b/meta/recipes-kernel/perf/perf.bb
> @@ -235,6 +235,9 @@ do_configure_prepend () {
>      for s in `find ${S}/tools/perf/scripts/python/ -name '*.py'`; do
>          sed -i 's,/usr/bin/python2,/usr/bin/env python,' "${s}"
>      done
> +
> +    # cp from the sysroot unistd.h to the perf unistd.h
> +    cp ${RECIPE_SYSROOT}/usr/include/asm-generic/unistd.h
> ${S}/tools/include/uapi/asm-generic/unistd.h
>  }
>
>  python do_package_prepend() {
> --
> 2.19.1
>
> --
> _______________________________________________
> Openembedded-core mailing list
> Openembedded-core@lists.openembedded.org
> http://lists.openembedded.org/mailman/listinfo/openembedded-core
>

--0000000000009489c705838f779d
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div dir=3D"ltr">Why not use=C2=A0STAGING_INCDIR ?</div></=
div><br><div class=3D"gmail_quote"><div dir=3D"ltr" class=3D"gmail_attr">On=
 Fri, Mar 8, 2019 at 7:36 AM &lt;<a href=3D"mailto:bruce.ashfield@gmail.com=
">bruce.ashfield@gmail.com</a>&gt; wrote:<br></div><blockquote class=3D"gma=
il_quote" style=3D"margin:0px 0px 0px 0.8ex;border-left:1px solid rgb(204,2=
04,204);padding-left:1ex">From: Bruce Ashfield &lt;<a href=3D"mailto:bruce.=
ashfield@gmail.com" target=3D"_blank">bruce.ashfield@gmail.com</a>&gt;<br>
<br>
During the build for some architectures, perf generates a program<br>
which executes on the host to dump the syscall table.<br>
<br>
The generation of that program uses the cross compiler + sysroot<br>
to expand unistd.h. As such, we are getting the contents of that<br>
file from linux-libc-headers.<br>
<br>
The compilation of that generated program uses the host compiler<br>
and a restricted include path to the perf source code. In the<br>
perf source there is a captured unistd.h, as such it will be used<br>
when compiling the host executable. The perf source code is copied<br>
from the kernel version that is being built .. so we have a<br>
mismatch between the generation and the compilation of the host<br>
program.<br>
<br>
Normally this mismatch is fine, but if the libc-headers are<br>
newer than the kernel, we&#39;ll have syscalls (and their syscall<br>
numbers) that are not defined in the perf source code. This<br>
leads to a compiler error and a cascading failure of the perf<br>
build due to a missing generated file.<br>
<br>
To fix this, we can copy unistd.h from the recipe-sysroot<br>
into the perf source code and they will always be in sync.<br>
<br>
Signed-off-by: Bruce Ashfield &lt;<a href=3D"mailto:bruce.ashfield@gmail.co=
m" target=3D"_blank">bruce.ashfield@gmail.com</a>&gt;<br>
---<br>
<br>
Richard,<br>
<br>
This should fix the perf build failure with 4.19 and the 5.0<br>
libc-headers.<br>
<br>
It also builds fine in the other combinations I was able to<br>
test. No sense sitting on this, it can use some AB combinations<br>
for more testing.<br>
<br>
Bruce<br>
<br>
=C2=A0meta/recipes-kernel/perf/<a href=3D"http://perf.bb" rel=3D"noreferrer=
" target=3D"_blank">perf.bb</a> | 3 +++<br>
=C2=A01 file changed, 3 insertions(+)<br>
<br>
diff --git a/meta/recipes-kernel/perf/<a href=3D"http://perf.bb" rel=3D"nor=
eferrer" target=3D"_blank">perf.bb</a> b/meta/recipes-kernel/perf/<a href=
=3D"http://perf.bb" rel=3D"noreferrer" target=3D"_blank">perf.bb</a><br>
index 9120766858..2f85006ee1 100644<br>
--- a/meta/recipes-kernel/perf/<a href=3D"http://perf.bb" rel=3D"noreferrer=
" target=3D"_blank">perf.bb</a><br>
+++ b/meta/recipes-kernel/perf/<a href=3D"http://perf.bb" rel=3D"noreferrer=
" target=3D"_blank">perf.bb</a><br>
@@ -235,6 +235,9 @@ do_configure_prepend () {<br>
=C2=A0 =C2=A0 =C2=A0for s in `find ${S}/tools/perf/scripts/python/ -name &#=
39;*.py&#39;`; do<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0sed -i &#39;s,/usr/bin/python2,/usr/bin/e=
nv python,&#39; &quot;${s}&quot;<br>
=C2=A0 =C2=A0 =C2=A0done<br>
+<br>
+=C2=A0 =C2=A0 # cp from the sysroot unistd.h to the perf unistd.h<br>
+=C2=A0 =C2=A0 cp ${RECIPE_SYSROOT}/usr/include/asm-generic/unistd.h ${S}/t=
ools/include/uapi/asm-generic/unistd.h<br>
=C2=A0}<br>
<br>
=C2=A0python do_package_prepend() {<br>
-- <br>
2.19.1<br>
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

--0000000000009489c705838f779d--
