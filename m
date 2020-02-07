Return-Path: <martin.jansa@gmail.com>
Received: from mail-ed1-f66.google.com (mail-ed1-f66.google.com
	[209.85.208.66])
	by mail.openembedded.org (Postfix) with ESMTP id 9BACD6061F
	for <openembedded-core@lists.openembedded.org>;
	Fri,  7 Feb 2020 14:46:55 +0000 (UTC)
Received: by mail-ed1-f66.google.com with SMTP id c26so2636438eds.8
	for <openembedded-core@lists.openembedded.org>;
	Fri, 07 Feb 2020 06:46:56 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=mime-version:references:in-reply-to:from:date:message-id:subject:to
	:cc; bh=1JjAaBrUBLeIfXe5vKBE4ruY+sGYraVInFjQqoc5hEQ=;
	b=NynXkoikAvNSOS/92rq67hEss/od4gJKcZUwoZe3ZY6bBgp4wNPjS0Je+2rBr9Oowb
	yDLGVLxCdwgAoZTN/IRL2s+WRNcuuJXJ09Wh0DthVTy1hNRatQhryM/nBWPAat2H8lLE
	men5BEFjKqVziO932VLNMFchjvF7newaBqx8PqgADndzFLLXwubA71mn1rohFSwSXwtv
	25T3BVeWc7vZ76tP/FXzY26ySYep1MN/Met4ddeb/mZxGGhQhp8yxMB2Ua4yeH8+KoH2
	6XXDm7Klxeh34BN9ogep3rCywptdYrQufMg+T9STcEzcHJAgCUx90qyyEBMFiikA/PO+
	fXtA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:references:in-reply-to:from:date
	:message-id:subject:to:cc;
	bh=1JjAaBrUBLeIfXe5vKBE4ruY+sGYraVInFjQqoc5hEQ=;
	b=SNJ97yAmqhMsBfBUbe3tN1RxNh6YF63mLiHEyHngZ8pwy2x463mEnan18aER2YHavD
	mZssb5YynNmzI1gSckAu07oeZYYM5Vzf3GjylajrAlSR6B7Qo+Kwr6D5t5efCrhtWhjT
	bQ9S7GEWtnLFWUBazXJawD8oxl1Opck874KihjBaiKc4j8CWXxEcO34PNnRTvB2zF3K3
	CcDDhv/IOugbtniyEMZc6N1fCZ/nhibPjCo7/CgkL8jKn3jLVmngLaUJFWjyLC7Px49W
	pEt0C5ysGI/5AzZLJ+2Cfw3tbQhaDuoxplJePTQL3o37bD5Y6ZxKxp0/fNf8peyVJQoR
	FafQ==
X-Gm-Message-State: APjAAAWXE6A2XsivZhdjsAQLLGO8UF1ylNOGFBg+hrOScaosqcKgt0Ue
	jyfSlQPCPilRGOmH4rYhXNdbN6hUNeZR7+toH4U=
X-Google-Smtp-Source: APXvYqyaTReKhPxl/NKNopM6Ox/R3iMsa50zojCWv+JIl+F07D9J6hJP7OuQUSScuFUv41xCWcuVmq+H7BKTAU0I5AU=
X-Received: by 2002:aa7:c1d8:: with SMTP id d24mr7809200edp.388.1581086816215; 
	Fri, 07 Feb 2020 06:46:56 -0800 (PST)
MIME-Version: 1.0
References: <cover.1581010425.git.bruce.ashfield@gmail.com>
	<fc9272a1b06a8efeb155b229967eb25ef4dff7c9.1581010425.git.bruce.ashfield@gmail.com>
	<CA+chaQcEQUrMQDb=TZCy5NJnP7wz1J_mxnty68-wOTD4B=1AEQ@mail.gmail.com>
	<CADkTA4NuBR=ZVv-ypvbWd6p=wh0Km5_hrxZ47C-f7JKaz_YDGQ@mail.gmail.com>
In-Reply-To: <CADkTA4NuBR=ZVv-ypvbWd6p=wh0Km5_hrxZ47C-f7JKaz_YDGQ@mail.gmail.com>
From: Martin Jansa <martin.jansa@gmail.com>
Date: Fri, 7 Feb 2020 15:46:45 +0100
Message-ID: <CA+chaQea8awvFZw-Z47svcw8s8ms5Njm6sKf5tzkFrZfJCMFqg@mail.gmail.com>
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
X-List-Received-Date: Fri, 07 Feb 2020 14:46:55 -0000
Content-Type: multipart/alternative; boundary="0000000000000a2828059dfd769d"

--0000000000000a2828059dfd769d
Content-Type: text/plain; charset="UTF-8"

Awesome, thanks!

On Fri, Feb 7, 2020 at 3:45 PM Bruce Ashfield <bruce.ashfield@gmail.com>
wrote:

> On Fri, Feb 7, 2020 at 9:20 AM Martin Jansa <martin.jansa@gmail.com>
> wrote:
> >
> > With the LD="${KERNEL_LD}" removed here, the build with ld-is-gold
> doesn't work anymore again.
> >
> > Why did you remove it?
>
> I removed it by mistake, and fixed it .. but apparently sent the wrong
> version of the patch.
>
> I'll send a v2 shortly!
>
> Bruce
>
> >
> > On Thu, Feb 6, 2020 at 6:37 PM <bruce.ashfield@gmail.com> wrote:
> >>
> >> From: Bruce Ashfield <bruce.ashfield@gmail.com>
> >>
> >> To ensure that the kernel linker is used when allno/mod/yes config
> >> merge_config steps were executed, the call to make was tweaked to
> >> explicitly pass LD.
> >>
> >> But since the variable wasn't quoted, any parameters to LD (like
> >> the sysroot) were mistakenly passed to make, and hence could trigger
> >> an error on some architectures.
> >>
> >> We also tweak the logging to hightlight errors like this in the
> >> future and avoid losing it in the noise of merge configs sometimes
> >> overly verbose output.
> >>
> >> Signed-off-by: Bruce Ashfield <bruce.ashfield@gmail.com>
> >> ---
> >>  meta/classes/kernel-yocto.bbclass                      | 10 +++++++---
> >>  .../recipes-kernel/kern-tools/kern-tools-native_git.bb |  2 +-
> >>  2 files changed, 8 insertions(+), 4 deletions(-)
> >>
> >> diff --git a/meta/classes/kernel-yocto.bbclass
> b/meta/classes/kernel-yocto.bbclass
> >> index 918d101d3d..31ea42580c 100644
> >> --- a/meta/classes/kernel-yocto.bbclass
> >> +++ b/meta/classes/kernel-yocto.bbclass
> >> @@ -352,10 +352,14 @@ do_kernel_configme() {
> >>                 bbfatal_log "Could not find configuration queue
> (${meta_dir}/config.queue)"
> >>         fi
> >>
> >> -       CFLAGS="${CFLAGS} ${TOOLCHAIN_OPTIONS}" HOSTCC="${BUILD_CC}
> ${BUILD_CFLAGS} ${BUILD_LDFLAGS}" HOSTCPP="${BUILD_CPP}" CC="${KERNEL_CC}"
> LD="${KERNEL_LD}" ARCH=${ARCH} merge_config.sh -O ${B} ${config_flags}
> ${configs}
> >> -
> >> +       CFLAGS="${CFLAGS} ${TOOLCHAIN_OPTIONS}" HOSTCC="${BUILD_CC}
> ${BUILD_CFLAGS} ${BUILD_LDFLAGS}" HOSTCPP="${BUILD_CPP}" CC="${KERNEL_CC}"
> ARCH=${ARCH} merge_config.sh -O ${B} ${config_flags} ${configs} >
> ${meta_dir}/cfg/merge_config_build.log 2>&1
> >>         if [ $? -ne 0 -o ! -f ${B}/.config ]; then
> >> -               bbfatal_log "Could not configure
> ${KMACHINE}-${LINUX_KERNEL_TYPE}"
> >> +               bberror "Could not generate a .config for
> ${KMACHINE}-${LINUX_KERNEL_TYPE}"
> >> +               if [ ${KCONF_AUDIT_LEVEL} -gt 1 ]; then
> >> +                       bbfatal_log "`cat
> ${meta_dir}/cfg/merge_config_build.log`"
> >> +               else
> >> +                       bbfatal_log "Details can be found at:
> ${S}/${meta_dir}/cfg/merge_config_build.log"
> >> +               fi
> >>         fi
> >>
> >>         if [ ! -z "${LINUX_VERSION_EXTENSION}" ]; then
> >> diff --git a/meta/recipes-kernel/kern-tools/kern-tools-native_git.bb
> b/meta/recipes-kernel/kern-tools/kern-tools-native_git.bb
> >> index f263421234..4f1af731d6 100644
> >> --- a/meta/recipes-kernel/kern-tools/kern-tools-native_git.bb
> >> +++ b/meta/recipes-kernel/kern-tools/kern-tools-native_git.bb
> >> @@ -4,7 +4,7 @@ LIC_FILES_CHKSUM =
> "file://tools/kgit;beginline=5;endline=9;md5=9c30e971d435e249
> >>
> >>  DEPENDS = "git-native"
> >>
> >> -SRCREV = "388b67974deb2176c06994a325676cbf23e5fce8"
> >> +SRCREV = "c66833e1caac25279a5052fceb13213f5e4f79f9"
> >>  PR = "r12"
> >>  PV = "0.2+git${SRCPV}"
> >>
> >> --
> >> 2.19.1
> >>
> >> --
> >> _______________________________________________
> >> Openembedded-core mailing list
> >> Openembedded-core@lists.openembedded.org
> >> http://lists.openembedded.org/mailman/listinfo/openembedded-core
>
>
>
> --
> - Thou shalt not follow the NULL pointer, for chaos and madness await
> thee at its end
> - "Use the force Harry" - Gandalf, Star Trek II
>

--0000000000000a2828059dfd769d
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr">Awesome, thanks!=C2=A0<br></div><br><div class=3D"gmail_qu=
ote"><div dir=3D"ltr" class=3D"gmail_attr">On Fri, Feb 7, 2020 at 3:45 PM B=
ruce Ashfield &lt;<a href=3D"mailto:bruce.ashfield@gmail.com">bruce.ashfiel=
d@gmail.com</a>&gt; wrote:<br></div><blockquote class=3D"gmail_quote" style=
=3D"margin:0px 0px 0px 0.8ex;border-left:1px solid rgb(204,204,204);padding=
-left:1ex">On Fri, Feb 7, 2020 at 9:20 AM Martin Jansa &lt;<a href=3D"mailt=
o:martin.jansa@gmail.com" target=3D"_blank">martin.jansa@gmail.com</a>&gt; =
wrote:<br>
&gt;<br>
&gt; With the LD=3D&quot;${KERNEL_LD}&quot; removed here, the build with ld=
-is-gold doesn&#39;t work anymore again.<br>
&gt;<br>
&gt; Why did you remove it?<br>
<br>
I removed it by mistake, and fixed it .. but apparently sent the wrong<br>
version of the patch.<br>
<br>
I&#39;ll send a v2 shortly!<br>
<br>
Bruce<br>
<br>
&gt;<br>
&gt; On Thu, Feb 6, 2020 at 6:37 PM &lt;<a href=3D"mailto:bruce.ashfield@gm=
ail.com" target=3D"_blank">bruce.ashfield@gmail.com</a>&gt; wrote:<br>
&gt;&gt;<br>
&gt;&gt; From: Bruce Ashfield &lt;<a href=3D"mailto:bruce.ashfield@gmail.co=
m" target=3D"_blank">bruce.ashfield@gmail.com</a>&gt;<br>
&gt;&gt;<br>
&gt;&gt; To ensure that the kernel linker is used when allno/mod/yes config=
<br>
&gt;&gt; merge_config steps were executed, the call to make was tweaked to<=
br>
&gt;&gt; explicitly pass LD.<br>
&gt;&gt;<br>
&gt;&gt; But since the variable wasn&#39;t quoted, any parameters to LD (li=
ke<br>
&gt;&gt; the sysroot) were mistakenly passed to make, and hence could trigg=
er<br>
&gt;&gt; an error on some architectures.<br>
&gt;&gt;<br>
&gt;&gt; We also tweak the logging to hightlight errors like this in the<br=
>
&gt;&gt; future and avoid losing it in the noise of merge configs sometimes=
<br>
&gt;&gt; overly verbose output.<br>
&gt;&gt;<br>
&gt;&gt; Signed-off-by: Bruce Ashfield &lt;<a href=3D"mailto:bruce.ashfield=
@gmail.com" target=3D"_blank">bruce.ashfield@gmail.com</a>&gt;<br>
&gt;&gt; ---<br>
&gt;&gt;=C2=A0 meta/classes/kernel-yocto.bbclass=C2=A0 =C2=A0 =C2=A0 =C2=A0=
 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 | 10 +++++++---<br>
&gt;&gt;=C2=A0 .../recipes-kernel/kern-tools/<a href=3D"http://kern-tools-n=
ative_git.bb" rel=3D"noreferrer" target=3D"_blank">kern-tools-native_git.bb=
</a> |=C2=A0 2 +-<br>
&gt;&gt;=C2=A0 2 files changed, 8 insertions(+), 4 deletions(-)<br>
&gt;&gt;<br>
&gt;&gt; diff --git a/meta/classes/kernel-yocto.bbclass b/meta/classes/kern=
el-yocto.bbclass<br>
&gt;&gt; index 918d101d3d..31ea42580c 100644<br>
&gt;&gt; --- a/meta/classes/kernel-yocto.bbclass<br>
&gt;&gt; +++ b/meta/classes/kernel-yocto.bbclass<br>
&gt;&gt; @@ -352,10 +352,14 @@ do_kernel_configme() {<br>
&gt;&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0bbfat=
al_log &quot;Could not find configuration queue (${meta_dir}/config.queue)&=
quot;<br>
&gt;&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0fi<br>
&gt;&gt;<br>
&gt;&gt; -=C2=A0 =C2=A0 =C2=A0 =C2=A0CFLAGS=3D&quot;${CFLAGS} ${TOOLCHAIN_O=
PTIONS}&quot; HOSTCC=3D&quot;${BUILD_CC} ${BUILD_CFLAGS} ${BUILD_LDFLAGS}&q=
uot; HOSTCPP=3D&quot;${BUILD_CPP}&quot; CC=3D&quot;${KERNEL_CC}&quot; LD=3D=
&quot;${KERNEL_LD}&quot; ARCH=3D${ARCH} merge_config.sh -O ${B} ${config_fl=
ags} ${configs}<br>
&gt;&gt; -<br>
&gt;&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0CFLAGS=3D&quot;${CFLAGS} ${TOOLCHAIN_O=
PTIONS}&quot; HOSTCC=3D&quot;${BUILD_CC} ${BUILD_CFLAGS} ${BUILD_LDFLAGS}&q=
uot; HOSTCPP=3D&quot;${BUILD_CPP}&quot; CC=3D&quot;${KERNEL_CC}&quot; ARCH=
=3D${ARCH} merge_config.sh -O ${B} ${config_flags} ${configs} &gt; ${meta_d=
ir}/cfg/merge_config_build.log 2&gt;&amp;1<br>
&gt;&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0if [ $? -ne 0 -o ! -f ${B}/.confi=
g ]; then<br>
&gt;&gt; -=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0bbfatal_lo=
g &quot;Could not configure ${KMACHINE}-${LINUX_KERNEL_TYPE}&quot;<br>
&gt;&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0bberror &q=
uot;Could not generate a .config for ${KMACHINE}-${LINUX_KERNEL_TYPE}&quot;=
<br>
&gt;&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0if [ ${KCO=
NF_AUDIT_LEVEL} -gt 1 ]; then<br>
&gt;&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0bbfatal_log &quot;`cat ${meta_dir}/cfg/merge_config_bui=
ld.log`&quot;<br>
&gt;&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0else<br>
&gt;&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0bbfatal_log &quot;Details can be found at: ${S}/${meta_=
dir}/cfg/merge_config_build.log&quot;<br>
&gt;&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0fi<br>
&gt;&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0fi<br>
&gt;&gt;<br>
&gt;&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0if [ ! -z &quot;${LINUX_VERSION_E=
XTENSION}&quot; ]; then<br>
&gt;&gt; diff --git a/meta/recipes-kernel/kern-tools/<a href=3D"http://kern=
-tools-native_git.bb" rel=3D"noreferrer" target=3D"_blank">kern-tools-nativ=
e_git.bb</a> b/meta/recipes-kernel/kern-tools/<a href=3D"http://kern-tools-=
native_git.bb" rel=3D"noreferrer" target=3D"_blank">kern-tools-native_git.b=
b</a><br>
&gt;&gt; index f263421234..4f1af731d6 100644<br>
&gt;&gt; --- a/meta/recipes-kernel/kern-tools/<a href=3D"http://kern-tools-=
native_git.bb" rel=3D"noreferrer" target=3D"_blank">kern-tools-native_git.b=
b</a><br>
&gt;&gt; +++ b/meta/recipes-kernel/kern-tools/<a href=3D"http://kern-tools-=
native_git.bb" rel=3D"noreferrer" target=3D"_blank">kern-tools-native_git.b=
b</a><br>
&gt;&gt; @@ -4,7 +4,7 @@ LIC_FILES_CHKSUM =3D &quot;file://tools/kgit;begin=
line=3D5;endline=3D9;md5=3D9c30e971d435e249<br>
&gt;&gt;<br>
&gt;&gt;=C2=A0 DEPENDS =3D &quot;git-native&quot;<br>
&gt;&gt;<br>
&gt;&gt; -SRCREV =3D &quot;388b67974deb2176c06994a325676cbf23e5fce8&quot;<b=
r>
&gt;&gt; +SRCREV =3D &quot;c66833e1caac25279a5052fceb13213f5e4f79f9&quot;<b=
r>
&gt;&gt;=C2=A0 PR =3D &quot;r12&quot;<br>
&gt;&gt;=C2=A0 PV =3D &quot;0.2+git${SRCPV}&quot;<br>
&gt;&gt;<br>
&gt;&gt; --<br>
&gt;&gt; 2.19.1<br>
&gt;&gt;<br>
&gt;&gt; --<br>
&gt;&gt; _______________________________________________<br>
&gt;&gt; Openembedded-core mailing list<br>
&gt;&gt; <a href=3D"mailto:Openembedded-core@lists.openembedded.org" target=
=3D"_blank">Openembedded-core@lists.openembedded.org</a><br>
&gt;&gt; <a href=3D"http://lists.openembedded.org/mailman/listinfo/openembe=
dded-core" rel=3D"noreferrer" target=3D"_blank">http://lists.openembedded.o=
rg/mailman/listinfo/openembedded-core</a><br>
<br>
<br>
<br>
-- <br>
- Thou shalt not follow the NULL pointer, for chaos and madness await<br>
thee at its end<br>
- &quot;Use the force Harry&quot; - Gandalf, Star Trek II<br>
</blockquote></div>

--0000000000000a2828059dfd769d--
