Return-Path: <ricardo.ribalda@gmail.com>
Received: from mail-lj1-f179.google.com (mail-lj1-f179.google.com
	[209.85.208.179])
	by mail.openembedded.org (Postfix) with ESMTP id 198327C124
	for <openembedded-core@lists.openembedded.org>;
	Wed,  3 Jul 2019 15:55:49 +0000 (UTC)
Received: by mail-lj1-f179.google.com with SMTP id 205so3003225ljj.8
	for <openembedded-core@lists.openembedded.org>;
	Wed, 03 Jul 2019 08:55:51 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:references:in-reply-to:from:date
	:message-id:subject:to;
	bh=UVDS0RyiDFG3GAeoGngSbBi1MGBalQrmj+75UrNuhlU=;
	b=lRBfg+GK00lfIT6AlXm228UZ55E7MKPYPcFMJTZLBaXGEUVq7FK5uYvVDam4MtnkGj
	slKDSmCxBkbBU/Ot1jeDTo+1ru5IuKZwdF0Al96P8qq6emamKTajuOSug7C3C7/zD3K2
	rZ8tt3gUAY7RSqR4y1YZtRAaIjV19dUn5DkTyPiIBcxQNy9ZVrP1nVOLqEfbAMxGL0LA
	yrqPlyFywvAUmgTwD2vyhDIvkKSvtC9hhyHBZXupBvIWmaiLvbc89ELFhZZYHjVX4AkK
	pXduUzSKFHSFDlJkeLJxgIXbVQW6KiILVRizBaqr8PIxlmFiReQtqfmf044CTCBxVO7Y
	OzTw==
X-Gm-Message-State: APjAAAXdao6kHPzxqzBV2f7YIzAPNq6SWrP6XyzFUHlGkW3znSs2DNMT
	+yrt+0KhyeIHOFp/2hNd2sIqcGJORNjwnr/+8U+8CRkd
X-Google-Smtp-Source: APXvYqyY1aHhJ063rEG+CweJhodazPJZ5LpioCTxHISc4IYlWk0xAROklwAm89bpPlTzlKOfgW1G3KpgL38zuzt6iok=
X-Received: by 2002:a2e:3013:: with SMTP id w19mr21811710ljw.73.1562169350161; 
	Wed, 03 Jul 2019 08:55:50 -0700 (PDT)
MIME-Version: 1.0
References: <20190625071442.5228-1-ricardo@ribalda.com>
In-Reply-To: <20190625071442.5228-1-ricardo@ribalda.com>
From: Ricardo Ribalda Delgado <ricardo@ribalda.com>
Date: Wed, 3 Jul 2019 17:55:37 +0200
Message-ID: <CAPybu_1U12im-j5qidqPoYOD7E3ur7XS5iEdhBsKK3JK1cS8bg@mail.gmail.com>
To: openembedded-core <openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH] systemd-bootconf: Make is machine specific
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
X-List-Received-Date: Wed, 03 Jul 2019 15:55:50 -0000
Content-Type: multipart/alternative; boundary="0000000000003208e5058cc8e54d"

--0000000000003208e5058cc8e54d
Content-Type: text/plain; charset="UTF-8"

Ping?

On Tue, 25 Jun 2019, 09:14 Ricardo Ribalda Delgado, <ricardo@ribalda.com>
wrote:

> APPEND is usually attached to a machine. This patch avoids multiconfig
> errors such as:
>
> | NOTE: Direct dependencies are
> ['multiconfig:qt5022:/workdir/repo/poky/meta/recipes-core/glibc/glibc_2.29.bb:do_populate_sysroot',
> 'multiconfig:qt5022:virtual:native:/workdir/repo/poky/meta/recipes-devtools/pseudo/pseudo_git.bb:do_populate_sysroot',
> 'multiconfig:qt5022:/workdir/repo/poky/meta/recipes-devtools/quilt/quilt-native_0.65.bb:do_populate_sysroot',
> 'multiconfig:qt5022:/workdir/repo/poky/meta/recipes-devtools/gcc/
> gcc-cross_8.3.bb:do_populate_sysroot',
> 'multiconfig:qt5022:/workdir/repo/poky/meta/recipes-devtools/gcc/gcc-runtime_8.3.bb:
> do_populate_sysroot']
> | NOTE: Installed into sysroot: []
> | NOTE: Skipping as already exists in sysroot: ['glibc', 'pseudo-native',
> 'quilt-native', 'gcc-cross-x86_64', 'gcc-runtime', 'libgcc',
> 'linux-libc-headers', 'libtool-native', 'texinfo-dummy-native',
> 'libmpc-native', 'flex-native', 'automake-native', 'zlib-native',
> 'mpfr-native', 'gmp-native', 'binutils-cross-x86_64', 'xz-native',
> 'autoconf-native', 'gnu-config-native', 'gettext-minimal-native',
> 'm4-native']
> | DEBUG: Python function extend_recipe_sysroot finished
> | DEBUG: Executing shell function do_install
> | install: cannot stat 'loader.conf': No such file or directory
> | WARNING: exit code 1 from a shell command.
> | ERROR: Function failed: do_install (log file is located at
> /workdir/build/tmp/work/bobcat-poky-linux/systemd-bootconf/1.00-r0/temp/log.do_install.737)
> NOTE: recipe systemd-bootconf-1.00-r0: task do_install: Failed
> ERROR: Task
> (multiconfig:qt5022:/workdir/repo/poky/meta/recipes-core/systemd/systemd-bootconf_1.00.bb:do_install)
> failed with exit code '1'
>
> Signed-off-by: Ricardo Ribalda Delgado <ricardo@ribalda.com>
> ---
>  meta/recipes-core/systemd/systemd-bootconf_1.00.bb | 1 +
>  1 file changed, 1 insertion(+)
>
> diff --git a/meta/recipes-core/systemd/systemd-bootconf_1.00.bb
> b/meta/recipes-core/systemd/systemd-bootconf_1.00.bb
> index e9c2466456..d13b8c518f 100644
> --- a/meta/recipes-core/systemd/systemd-bootconf_1.00.bb
> +++ b/meta/recipes-core/systemd/systemd-bootconf_1.00.bb
> @@ -3,6 +3,7 @@ LIC_FILES_CHKSUM =
> "file://${COREBASE}/meta/COPYING.MIT;md5=3da9cfbcb788c80a0384
>  SUMMARY = "Basic systemd-boot configuration files"
>
>  RPROVIDES_${PN} += "virtual/systemd-bootconf"
> +PACKAGE_ARCH = "${MACHINE_ARCH}"
>
>  inherit systemd-boot-cfg
>
> --
> 2.20.1
>
>

--0000000000003208e5058cc8e54d
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"auto">Ping?</div><br><div class=3D"gmail_quote"><div dir=3D"ltr=
" class=3D"gmail_attr">On Tue, 25 Jun 2019, 09:14 Ricardo Ribalda Delgado, =
&lt;<a href=3D"mailto:ricardo@ribalda.com">ricardo@ribalda.com</a>&gt; wrot=
e:<br></div><blockquote class=3D"gmail_quote" style=3D"margin:0 0 0 .8ex;bo=
rder-left:1px #ccc solid;padding-left:1ex">APPEND is usually attached to a =
machine. This patch avoids multiconfig<br>
errors such as:<br>
<br>
| NOTE: Direct dependencies are [&#39;multiconfig:qt5022:/workdir/repo/poky=
/meta/recipes-core/glibc/glibc_2.29.bb:do_populate_sysroot&#39;, &#39;multi=
config:qt5022:virtual:native:/workdir/repo/poky/meta/recipes-devtools/pseud=
o/pseudo_git.bb:do_populate_sysroot&#39;, &#39;multiconfig:qt5022:/workdir/=
repo/poky/meta/recipes-devtools/quilt/quilt-native_0.65.bb:do_populate_sysr=
oot&#39;, &#39;multiconfig:qt5022:/workdir/repo/poky/meta/recipes-devtools/=
gcc/<a href=3D"http://gcc-cross_8.3.bb" target=3D"_blank" rel=3D"noreferrer=
">gcc-cross_8.3.bb</a>:do_populate_sysroot&#39;, &#39;multiconfig:qt5022:/w=
orkdir/repo/poky/meta/recipes-devtools/gcc/gcc-runtime_8.3.bb:do_populate_s=
ysroot&#39;]<br>
| NOTE: Installed into sysroot: []<br>
| NOTE: Skipping as already exists in sysroot: [&#39;glibc&#39;, &#39;pseud=
o-native&#39;, &#39;quilt-native&#39;, &#39;gcc-cross-x86_64&#39;, &#39;gcc=
-runtime&#39;, &#39;libgcc&#39;, &#39;linux-libc-headers&#39;, &#39;libtool=
-native&#39;, &#39;texinfo-dummy-native&#39;, &#39;libmpc-native&#39;, &#39=
;flex-native&#39;, &#39;automake-native&#39;, &#39;zlib-native&#39;, &#39;m=
pfr-native&#39;, &#39;gmp-native&#39;, &#39;binutils-cross-x86_64&#39;, &#3=
9;xz-native&#39;, &#39;autoconf-native&#39;, &#39;gnu-config-native&#39;, &=
#39;gettext-minimal-native&#39;, &#39;m4-native&#39;]<br>
| DEBUG: Python function extend_recipe_sysroot finished<br>
| DEBUG: Executing shell function do_install<br>
| install: cannot stat &#39;loader.conf&#39;: No such file or directory<br>
| WARNING: exit code 1 from a shell command.<br>
| ERROR: Function failed: do_install (log file is located at /workdir/build=
/tmp/work/bobcat-poky-linux/systemd-bootconf/1.00-r0/temp/log.do_install.73=
7)<br>
NOTE: recipe systemd-bootconf-1.00-r0: task do_install: Failed<br>
ERROR: Task (multiconfig:qt5022:/workdir/repo/poky/meta/recipes-core/system=
d/systemd-bootconf_1.00.bb:do_install) failed with exit code &#39;1&#39;<br=
>
<br>
Signed-off-by: Ricardo Ribalda Delgado &lt;<a href=3D"mailto:ricardo@ribald=
a.com" target=3D"_blank" rel=3D"noreferrer">ricardo@ribalda.com</a>&gt;<br>
---<br>
=C2=A0meta/recipes-core/systemd/<a href=3D"http://systemd-bootconf_1.00.bb"=
 rel=3D"noreferrer noreferrer" target=3D"_blank">systemd-bootconf_1.00.bb</=
a> | 1 +<br>
=C2=A01 file changed, 1 insertion(+)<br>
<br>
diff --git a/meta/recipes-core/systemd/<a href=3D"http://systemd-bootconf_1=
.00.bb" rel=3D"noreferrer noreferrer" target=3D"_blank">systemd-bootconf_1.=
00.bb</a> b/meta/recipes-core/systemd/<a href=3D"http://systemd-bootconf_1.=
00.bb" rel=3D"noreferrer noreferrer" target=3D"_blank">systemd-bootconf_1.0=
0.bb</a><br>
index e9c2466456..d13b8c518f 100644<br>
--- a/meta/recipes-core/systemd/<a href=3D"http://systemd-bootconf_1.00.bb"=
 rel=3D"noreferrer noreferrer" target=3D"_blank">systemd-bootconf_1.00.bb</=
a><br>
+++ b/meta/recipes-core/systemd/<a href=3D"http://systemd-bootconf_1.00.bb"=
 rel=3D"noreferrer noreferrer" target=3D"_blank">systemd-bootconf_1.00.bb</=
a><br>
@@ -3,6 +3,7 @@ LIC_FILES_CHKSUM =3D &quot;file://${COREBASE}/meta/COPYING.=
MIT;md5=3D3da9cfbcb788c80a0384<br>
=C2=A0SUMMARY =3D &quot;Basic systemd-boot configuration files&quot;<br>
<br>
=C2=A0RPROVIDES_${PN} +=3D &quot;virtual/systemd-bootconf&quot;<br>
+PACKAGE_ARCH =3D &quot;${MACHINE_ARCH}&quot;<br>
<br>
=C2=A0inherit systemd-boot-cfg<br>
<br>
-- <br>
2.20.1<br>
<br>
</blockquote></div>

--0000000000003208e5058cc8e54d--
