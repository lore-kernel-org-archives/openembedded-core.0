Return-Path: <martin.jansa@gmail.com>
Received: from mail-ed1-f66.google.com (mail-ed1-f66.google.com
	[209.85.208.66])
	by mail.openembedded.org (Postfix) with ESMTP id D50E960EA6
	for <openembedded-core@lists.openembedded.org>;
	Fri,  7 Feb 2020 14:20:03 +0000 (UTC)
Received: by mail-ed1-f66.google.com with SMTP id g19so2524466eds.11
	for <openembedded-core@lists.openembedded.org>;
	Fri, 07 Feb 2020 06:20:05 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=mime-version:references:in-reply-to:from:date:message-id:subject:to
	:cc; bh=Z5qJRtx+6uADwWd4gxGKNJ3+hiEqLCpCmVQHr4cSiSs=;
	b=awSAxqrbBD5aA+DahUc25+iM0HIHrJDpUoUiZARddXYxv/VYVG7qnvey3Pzqe0Wr7c
	qN7UHbglras2MoZtJw1tIM4S+CcYBpnf8UrD2EsICBXDfYjQRo/ztUrSDq1kLPb445r6
	AfSKV7kFsLvLROq59P9/MQnxuYhpVug1ABQO2RFKQwP/u9CQ9YMhogWbfNcWfUvUMkAT
	bGVGSc1xbb0Ip0Q6NX5IXg1+Zl3d5HyqezIn72b69Z5Cz90YBpneHKZwln2+eDKNSDAt
	4U6pNEPw0H33MhfYRvS78QYCFJJHB+jWYQoRyRWSLwmwQrAIoV4GcYzoKIlNmF9hTasV
	Q0ZQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:references:in-reply-to:from:date
	:message-id:subject:to:cc;
	bh=Z5qJRtx+6uADwWd4gxGKNJ3+hiEqLCpCmVQHr4cSiSs=;
	b=cJQHRI3Wx83vXtALPGwUujrnrVTC4vwNV5q7BrifKo3Zd8XD01zENo7ianPKAf03j2
	BHN13uRveeNiljr1QtbG1rXFbpu08lsmnHKsv+MDVBtZCZZvEPNixuzD89uTRdnP2rTf
	cCPq/kjH0sENTihlaFGtOk6x8+fFmPmm0AEDZTu84hY1p7ZDQCF7PlOXEOkAfO0eP34s
	KmIKFMKJq/gUfwR7505h9TJJe5tCppxLzGrilr/FO7Q+9sut9ZeAkCH7CNQr/zSO7XeR
	P/KlFhc03oMPgnxjHhtfG6O/HyfPbSVFPa76g89Bhia3txp/X0l2fslkR3VDefjqKhwt
	C5cg==
X-Gm-Message-State: APjAAAVgwJle2LiJZElMj1iHxgBEJ9e2UA533qL36TdjtggUonn2P/To
	wsaCItN0gnS2uVVchTO01l8bMWp5c7OiqJ9VzBM=
X-Google-Smtp-Source: APXvYqyDjImAB7sqV+4E5jsGegbm9LOTLKH/FE0stVnKb7V460z0v19aCT5g1JimnkGtZBfRzTOhqLWLUvJYsy6NaZo=
X-Received: by 2002:a50:fb02:: with SMTP id d2mr7908329edq.270.1581085204526; 
	Fri, 07 Feb 2020 06:20:04 -0800 (PST)
MIME-Version: 1.0
References: <cover.1581010425.git.bruce.ashfield@gmail.com>
	<fc9272a1b06a8efeb155b229967eb25ef4dff7c9.1581010425.git.bruce.ashfield@gmail.com>
In-Reply-To: <fc9272a1b06a8efeb155b229967eb25ef4dff7c9.1581010425.git.bruce.ashfield@gmail.com>
From: Martin Jansa <martin.jansa@gmail.com>
Date: Fri, 7 Feb 2020 15:19:53 +0100
Message-ID: <CA+chaQcEQUrMQDb=TZCy5NJnP7wz1J_mxnty68-wOTD4B=1AEQ@mail.gmail.com>
To: Bruce Ashfield <bruce.ashfield@gmail.com>
Cc: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH 10/10] kern-tools: fix merge_config when LD contains parameters
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
X-List-Received-Date: Fri, 07 Feb 2020 14:20:04 -0000
Content-Type: multipart/alternative; boundary="000000000000f9ba1a059dfd1519"

--000000000000f9ba1a059dfd1519
Content-Type: text/plain; charset="UTF-8"

With the LD="${KERNEL_LD}" removed here, the build with ld-is-gold doesn't
work anymore again.

Why did you remove it?

On Thu, Feb 6, 2020 at 6:37 PM <bruce.ashfield@gmail.com> wrote:

> From: Bruce Ashfield <bruce.ashfield@gmail.com>
>
> To ensure that the kernel linker is used when allno/mod/yes config
> merge_config steps were executed, the call to make was tweaked to
> explicitly pass LD.
>
> But since the variable wasn't quoted, any parameters to LD (like
> the sysroot) were mistakenly passed to make, and hence could trigger
> an error on some architectures.
>
> We also tweak the logging to hightlight errors like this in the
> future and avoid losing it in the noise of merge configs sometimes
> overly verbose output.
>
> Signed-off-by: Bruce Ashfield <bruce.ashfield@gmail.com>
> ---
>  meta/classes/kernel-yocto.bbclass                      | 10 +++++++---
>  .../recipes-kernel/kern-tools/kern-tools-native_git.bb |  2 +-
>  2 files changed, 8 insertions(+), 4 deletions(-)
>
> diff --git a/meta/classes/kernel-yocto.bbclass
> b/meta/classes/kernel-yocto.bbclass
> index 918d101d3d..31ea42580c 100644
> --- a/meta/classes/kernel-yocto.bbclass
> +++ b/meta/classes/kernel-yocto.bbclass
> @@ -352,10 +352,14 @@ do_kernel_configme() {
>                 bbfatal_log "Could not find configuration queue
> (${meta_dir}/config.queue)"
>         fi
>
> -       CFLAGS="${CFLAGS} ${TOOLCHAIN_OPTIONS}" HOSTCC="${BUILD_CC}
> ${BUILD_CFLAGS} ${BUILD_LDFLAGS}" HOSTCPP="${BUILD_CPP}" CC="${KERNEL_CC}"
> LD="${KERNEL_LD}" ARCH=${ARCH} merge_config.sh -O ${B} ${config_flags}
> ${configs}
> -
> +       CFLAGS="${CFLAGS} ${TOOLCHAIN_OPTIONS}" HOSTCC="${BUILD_CC}
> ${BUILD_CFLAGS} ${BUILD_LDFLAGS}" HOSTCPP="${BUILD_CPP}" CC="${KERNEL_CC}"
> ARCH=${ARCH} merge_config.sh -O ${B} ${config_flags} ${configs} >
> ${meta_dir}/cfg/merge_config_build.log 2>&1
>         if [ $? -ne 0 -o ! -f ${B}/.config ]; then
> -               bbfatal_log "Could not configure
> ${KMACHINE}-${LINUX_KERNEL_TYPE}"
> +               bberror "Could not generate a .config for
> ${KMACHINE}-${LINUX_KERNEL_TYPE}"
> +               if [ ${KCONF_AUDIT_LEVEL} -gt 1 ]; then
> +                       bbfatal_log "`cat
> ${meta_dir}/cfg/merge_config_build.log`"
> +               else
> +                       bbfatal_log "Details can be found at:
> ${S}/${meta_dir}/cfg/merge_config_build.log"
> +               fi
>         fi
>
>         if [ ! -z "${LINUX_VERSION_EXTENSION}" ]; then
> diff --git a/meta/recipes-kernel/kern-tools/kern-tools-native_git.bb
> b/meta/recipes-kernel/kern-tools/kern-tools-native_git.bb
> index f263421234..4f1af731d6 100644
> --- a/meta/recipes-kernel/kern-tools/kern-tools-native_git.bb
> +++ b/meta/recipes-kernel/kern-tools/kern-tools-native_git.bb
> @@ -4,7 +4,7 @@ LIC_FILES_CHKSUM =
> "file://tools/kgit;beginline=5;endline=9;md5=9c30e971d435e249
>
>  DEPENDS = "git-native"
>
> -SRCREV = "388b67974deb2176c06994a325676cbf23e5fce8"
> +SRCREV = "c66833e1caac25279a5052fceb13213f5e4f79f9"
>  PR = "r12"
>  PV = "0.2+git${SRCPV}"
>
> --
> 2.19.1
>
> --
> _______________________________________________
> Openembedded-core mailing list
> Openembedded-core@lists.openembedded.org
> http://lists.openembedded.org/mailman/listinfo/openembedded-core
>

--000000000000f9ba1a059dfd1519
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr">With the=C2=A0LD=3D&quot;${KERNEL_LD}&quot; removed here, =
the build with ld-is-gold doesn&#39;t work anymore again.<div><br></div><di=
v>Why did you remove it?</div></div><br><div class=3D"gmail_quote"><div dir=
=3D"ltr" class=3D"gmail_attr">On Thu, Feb 6, 2020 at 6:37 PM &lt;<a href=3D=
"mailto:bruce.ashfield@gmail.com">bruce.ashfield@gmail.com</a>&gt; wrote:<b=
r></div><blockquote class=3D"gmail_quote" style=3D"margin:0px 0px 0px 0.8ex=
;border-left:1px solid rgb(204,204,204);padding-left:1ex">From: Bruce Ashfi=
eld &lt;<a href=3D"mailto:bruce.ashfield@gmail.com" target=3D"_blank">bruce=
.ashfield@gmail.com</a>&gt;<br>
<br>
To ensure that the kernel linker is used when allno/mod/yes config<br>
merge_config steps were executed, the call to make was tweaked to<br>
explicitly pass LD.<br>
<br>
But since the variable wasn&#39;t quoted, any parameters to LD (like<br>
the sysroot) were mistakenly passed to make, and hence could trigger<br>
an error on some architectures.<br>
<br>
We also tweak the logging to hightlight errors like this in the<br>
future and avoid losing it in the noise of merge configs sometimes<br>
overly verbose output.<br>
<br>
Signed-off-by: Bruce Ashfield &lt;<a href=3D"mailto:bruce.ashfield@gmail.co=
m" target=3D"_blank">bruce.ashfield@gmail.com</a>&gt;<br>
---<br>
=C2=A0meta/classes/kernel-yocto.bbclass=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 | 10 +++++++---<br>
=C2=A0.../recipes-kernel/kern-tools/<a href=3D"http://kern-tools-native_git=
.bb" rel=3D"noreferrer" target=3D"_blank">kern-tools-native_git.bb</a> |=C2=
=A0 2 +-<br>
=C2=A02 files changed, 8 insertions(+), 4 deletions(-)<br>
<br>
diff --git a/meta/classes/kernel-yocto.bbclass b/meta/classes/kernel-yocto.=
bbclass<br>
index 918d101d3d..31ea42580c 100644<br>
--- a/meta/classes/kernel-yocto.bbclass<br>
+++ b/meta/classes/kernel-yocto.bbclass<br>
@@ -352,10 +352,14 @@ do_kernel_configme() {<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 bbfatal_log &quot;C=
ould not find configuration queue (${meta_dir}/config.queue)&quot;<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 fi<br>
<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0CFLAGS=3D&quot;${CFLAGS} ${TOOLCHAIN_OPTIONS}&q=
uot; HOSTCC=3D&quot;${BUILD_CC} ${BUILD_CFLAGS} ${BUILD_LDFLAGS}&quot; HOST=
CPP=3D&quot;${BUILD_CPP}&quot; CC=3D&quot;${KERNEL_CC}&quot; LD=3D&quot;${K=
ERNEL_LD}&quot; ARCH=3D${ARCH} merge_config.sh -O ${B} ${config_flags} ${co=
nfigs}<br>
-<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0CFLAGS=3D&quot;${CFLAGS} ${TOOLCHAIN_OPTIONS}&q=
uot; HOSTCC=3D&quot;${BUILD_CC} ${BUILD_CFLAGS} ${BUILD_LDFLAGS}&quot; HOST=
CPP=3D&quot;${BUILD_CPP}&quot; CC=3D&quot;${KERNEL_CC}&quot; ARCH=3D${ARCH}=
 merge_config.sh -O ${B} ${config_flags} ${configs} &gt; ${meta_dir}/cfg/me=
rge_config_build.log 2&gt;&amp;1<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 if [ $? -ne 0 -o ! -f ${B}/.config ]; then<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0bbfatal_log &quot;C=
ould not configure ${KMACHINE}-${LINUX_KERNEL_TYPE}&quot;<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0bberror &quot;Could=
 not generate a .config for ${KMACHINE}-${LINUX_KERNEL_TYPE}&quot;<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0if [ ${KCONF_AUDIT_=
LEVEL} -gt 1 ]; then<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0bbfatal_log &quot;`cat ${meta_dir}/cfg/merge_config_build.log`&qu=
ot;<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0else<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0bbfatal_log &quot;Details can be found at: ${S}/${meta_dir}/cfg/m=
erge_config_build.log&quot;<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0fi<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 fi<br>
<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 if [ ! -z &quot;${LINUX_VERSION_EXTENSION}&quot=
; ]; then<br>
diff --git a/meta/recipes-kernel/kern-tools/<a href=3D"http://kern-tools-na=
tive_git.bb" rel=3D"noreferrer" target=3D"_blank">kern-tools-native_git.bb<=
/a> b/meta/recipes-kernel/kern-tools/<a href=3D"http://kern-tools-native_gi=
t.bb" rel=3D"noreferrer" target=3D"_blank">kern-tools-native_git.bb</a><br>
index f263421234..4f1af731d6 100644<br>
--- a/meta/recipes-kernel/kern-tools/<a href=3D"http://kern-tools-native_gi=
t.bb" rel=3D"noreferrer" target=3D"_blank">kern-tools-native_git.bb</a><br>
+++ b/meta/recipes-kernel/kern-tools/<a href=3D"http://kern-tools-native_gi=
t.bb" rel=3D"noreferrer" target=3D"_blank">kern-tools-native_git.bb</a><br>
@@ -4,7 +4,7 @@ LIC_FILES_CHKSUM =3D &quot;file://tools/kgit;beginline=3D5;=
endline=3D9;md5=3D9c30e971d435e249<br>
<br>
=C2=A0DEPENDS =3D &quot;git-native&quot;<br>
<br>
-SRCREV =3D &quot;388b67974deb2176c06994a325676cbf23e5fce8&quot;<br>
+SRCREV =3D &quot;c66833e1caac25279a5052fceb13213f5e4f79f9&quot;<br>
=C2=A0PR =3D &quot;r12&quot;<br>
=C2=A0PV =3D &quot;0.2+git${SRCPV}&quot;<br>
<br>
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

--000000000000f9ba1a059dfd1519--
