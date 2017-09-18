Return-Path: <martin.jansa@gmail.com>
Received: from mail-wr0-f169.google.com (mail-wr0-f169.google.com
	[209.85.128.169])
	by mail.openembedded.org (Postfix) with ESMTP id 5A6A278230
	for <openembedded-core@lists.openembedded.org>;
	Mon, 18 Sep 2017 07:54:39 +0000 (UTC)
Received: by mail-wr0-f169.google.com with SMTP id l39so5448243wrl.12
	for <openembedded-core@lists.openembedded.org>;
	Mon, 18 Sep 2017 00:54:41 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc; bh=7RalLhFo7Dij35MfL1gDkZpiZBLm1uO+o7AbRtDdXrU=;
	b=kRMcvtsNvtEoVc4aDqFRokRr6zqmkN5XkMQLapd/Vo7QB74GGMsbaOtCthz4gn6nM3
	pfAoCa0I7BIakZ66E9C7gkmmOYy+9g5obFQ7GBQ107nzwctxe2vA4sS61dNVnOmVTjFw
	AvrvvqYPzTL96rAqIRLM23H1VK+aBcis5qL+l6TYJXXdMkaSf+DKJLTC2fWq2YiuLRzg
	S2TRoP/7J9ECZrIMCOqCaxYQm2GXPsD3uisG3NEL8Y84+s4NbCjNv36wW0HS6ziJZxpp
	mzhssokO+WX5LP4WQ8HneleOXD/O/JjUdWVxVEsFH0/yjpgXL48WKnIzbd6u3dTvi9BM
	64mA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc;
	bh=7RalLhFo7Dij35MfL1gDkZpiZBLm1uO+o7AbRtDdXrU=;
	b=Kyo4oXcgao0r4dExD4a9lver/it6Lyc+L7bfwSc+OaUJaDUmtoZs4XPCNQTiYD+RD+
	dKiAMJbx3gD/vK2krKN4TJAJ+jCsuLm1K+XE+/zr/htMhnVegWhnMZLe8CLzjGsIH6lG
	Bkq/UztJXC51c25FbG+V0gU8Y9s9kxdjxOb3rAAI5PdC/KXhnRQewJvmZOVfbEhL3sEd
	Ig8NV0tt+wmwvTaSBiykkqfoGZCCZDX8dRqcXC3dYhUcGSMbCL32gmOjfMFKaSFMrNSD
	HGtQAXX7pdM91ngoo0UiiQnpVqlHYn4AIWb6WjMDKH2YQHgGclzu1FovluW9UWN2ecWQ
	JOCQ==
X-Gm-Message-State: AHPjjUi5kqt5wG4Oyib528V3lvv8YQw12Xwdoix9KWR+6UkB3ak2bQ1G
	ESCumMiFijNmpusitU9GmIERPxkMtMXFo3/cfsI=
X-Google-Smtp-Source: ADKCNb7qUsPo4xObaicA2vklFuaF7e/ovQ5xIsNQVlpioAi+m0Kl6brvyfcelhYq/dgAG+uSoartS9yBB96aUiRFv30=
X-Received: by 10.223.133.164 with SMTP id 33mr26783017wrt.179.1505721280292; 
	Mon, 18 Sep 2017 00:54:40 -0700 (PDT)
MIME-Version: 1.0
Received: by 10.28.147.202 with HTTP; Mon, 18 Sep 2017 00:54:39 -0700 (PDT)
In-Reply-To: <5e66c357-fda0-17d8-1d78-5b877fdc47e5@gmail.com>
References: <20170911203056.22156-1-otavio@ossystems.com.br>
	<CA+chaQcUnbBq_f3zkAOxSF_E8M9RUMSaefncSgF6Hdt-j+Q0qg@mail.gmail.com>
	<CA+chaQec-cL6x3i3TfOi7yBhmCQ9Gf=-4jXkXqJ2-yJQmPmcmw@mail.gmail.com>
	<5e66c357-fda0-17d8-1d78-5b877fdc47e5@gmail.com>
From: Martin Jansa <martin.jansa@gmail.com>
Date: Mon, 18 Sep 2017 09:54:39 +0200
Message-ID: <CA+chaQfdgGcWAc17f=epK8s3q1=h+voUUc4sNJSLdtu_5SbOfA@mail.gmail.com>
To: Marek Vasut <marek.vasut@gmail.com>
Cc: U-Boot Mailing List <u-boot@lists.denx.de>,
	Otavio Salvador <otavio@ossystems.com.br>, OpenEmbedded Core Mailing List
	<openembedded-core@lists.openembedded.org>
Subject: Re: [U-Boot] [PATCH] u-boot: Upgrade to 2017.09
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
X-List-Received-Date: Mon, 18 Sep 2017 07:54:39 -0000
Content-Type: multipart/alternative; boundary="001a1147d2ec0aec9b0559720e07"

--001a1147d2ec0aec9b0559720e07
Content-Type: text/plain; charset="UTF-8"

u-boot-fw-utils-cross is broken for at least a year, if it breaks a lot of
boards, why nobody complained yet?

On Mon, Sep 18, 2017 at 7:32 AM, Marek Vasut <marek.vasut@gmail.com> wrote:

> On 09/17/2017 01:06 PM, Martin Jansa wrote:
> > I've verified that u-boot-fw-utils builds and installs fw_printenv
> > correctly with 2017.07.
> >
> > And that u-boot-fw-utils-cross was broken even with Yocto 2.3 Pyro
> > and 2017.01 version there, maybe it's time to remove cross version? As
> > nobody is using it and it's not tested?
>
> Nobody apparently even build-tested this patch before submission, gurrr.
>
> Speaking of cross versions of U-Boot fwutils and printenv/setenv , they
> are used by boards for modifying U-Boot environment on the target from
> Linux, so removing them would break a lot of boards -- NAK.
>
> > On Sun, Sep 17, 2017 at 11:18 AM, Martin Jansa <martin.jansa@gmail.com>
> > wrote:
> >
> >> Is anyone seeing u-boot-fw-utils.do_install failure with this?
> >>
> >> u-boot-fw-utils/1_2017.09-r0/git/tools/env/fw_printenv: No such file or
> >> directory
> >>
> >> I've tried u-boot-fw-utils-cross, but it fails as well even sooner in
> >> do_compile:
> >>
> >> Log data follows:
> >> | DEBUG: Executing shell function do_compile
> >> | NOTE: make -j 32 ARCH=arm CC=gcc  -isystemwork/x86_64-linux/u-
> >> boot-fw-utils-cross/1_2017.09-r0/recipe-sysroot-native/usr/include -O2
> >> -pipe -Lwork/x86_64-linux/u-boot-fw-utils-cross/1_2017.09-r0/
> recipe-sysroot-native/usr/lib
> >> -Lwork/x86_64-linux/u-boot-fw-utils-cross/1_2017.09-r0/
> recipe-sysroot-native/lib
> >> -Wl,-rpath-link,work/x86_64-linux/u-boot-fw-utils-cross/1_
> >> 2017.09-r0/recipe-sysroot-native/usr/lib -Wl,-rpath-link,work/x86_64-
> >> linux/u-boot-fw-utils-cross/1_2017.09-r0/recipe-sysroot-native/lib
> >> -Wl,-rpath,work/x86_64-linux/u-boot-fw-utils-cross/1_2017.
> >> 09-r0/recipe-sysroot-native/usr/lib -Wl,-rpath,work/x86_64-linux/
> >> u-boot-fw-utils-cross/1_2017.09-r0/recipe-sysroot-native/lib -Wl,-O1
> V=1
> >> rpi_3_32b_config
> >> | make -f ./scripts/Makefile.build obj=scripts/basic
> >> |   cc -Wp,-MD,scripts/basic/.fixdep.d -Wall -Wstrict-prototypes -O2
> >> -fomit-frame-pointer      -o scripts/basic/fixdep scripts/basic/fixdep.c
> >> | /bin/sh: 1: cc: not found
> >> | make[1]: *** [scripts/basic/fixdep] Error 127
> >> | make: *** [scripts_basic] Error 2
> >> | ERROR: oe_runmake failed
> >> | WARNING: exit code 1 from a shell command.
> >> | ERROR: Function failed: do_compile (log file is located at
> >> work/x86_64-linux/u-boot-fw-utils-cross/1_2017.09-r0/temp/
> >> log.do_compile.12859)
> >> ERROR: Task (virtual:cross:oe-core/meta/recipes-bsp/u-boot/u-boot-fw-
> >> utils_2017.09.bb:do_compile) failed with exit code '1'
> >>
> >>
> >> On Mon, Sep 11, 2017 at 10:30 PM, Otavio Salvador <
> otavio@ossystems.com.br
> >>> wrote:
> >>
> >>> This upgrades the U-Boot to the 2017.09 release.
> >>>
> >>> Signed-off-by: Otavio Salvador <otavio@ossystems.com.br>
> >>> ---
> >>>
> >>>  .../u-boot/{u-boot-common_2017.07.inc => u-boot-common_2017.09.inc}
> >>>  | 2 +-
> >>>  .../u-boot/{u-boot-fw-utils_2017.07.bb => u-boot-fw-utils_2017.09.bb}
> >>>  | 0
> >>>  .../u-boot/{u-boot-mkimage_2017.07.bb => u-boot-mkimage_2017.09.bb}
> >>>  | 0
> >>>  meta/recipes-bsp/u-boot/{u-boot_2017.07.bb => u-boot_2017.09.bb}
> >>> | 0
> >>>  4 files changed, 1 insertion(+), 1 deletion(-)
> >>>  rename meta/recipes-bsp/u-boot/{u-boot-common_2017.07.inc =>
> >>> u-boot-common_2017.09.inc} (89%)
> >>>  rename meta/recipes-bsp/u-boot/{u-boot-fw-utils_2017.07.bb =>
> >>> u-boot-fw-utils_2017.09.bb} (100%)
> >>>  rename meta/recipes-bsp/u-boot/{u-boot-mkimage_2017.07.bb =>
> >>> u-boot-mkimage_2017.09.bb} (100%)
> >>>  rename meta/recipes-bsp/u-boot/{u-boot_2017.07.bb =>
> u-boot_2017.09.bb}
> >>> (100%)
> >>>
> >>> diff --git a/meta/recipes-bsp/u-boot/u-boot-common_2017.07.inc
> >>> b/meta/recipes-bsp/u-boot/u-boot-common_2017.09.inc
> >>> similarity index 89%
> >>> rename from meta/recipes-bsp/u-boot/u-boot-common_2017.07.inc
> >>> rename to meta/recipes-bsp/u-boot/u-boot-common_2017.09.inc
> >>> index e37f5fd409..02e51242cb 100644
> >>> --- a/meta/recipes-bsp/u-boot/u-boot-common_2017.07.inc
> >>> +++ b/meta/recipes-bsp/u-boot/u-boot-common_2017.09.inc
> >>> @@ -7,7 +7,7 @@ PE = "1"
> >>>
> >>>  # We use the revision in order to avoid having to fetch it from the
> >>>  # repo during parse
> >>> -SRCREV = "d85ca029f257b53a96da6c2fb421e78a003a9943"
> >>> +SRCREV = "c98ac3487e413c71e5d36322ef3324b21c6f60f9"
> >>>
> >>>  SRC_URI = "git://git.denx.de/u-boot.git \
> >>>      file://MPC8315ERDB-enable-DHCP.patch \
> >>> diff --git a/meta/recipes-bsp/u-boot/u-boot-fw-utils_2017.07.bb
> >>> b/meta/recipes-bsp/u-boot/u-boot-fw-utils_2017.09.bb
> >>> similarity index 100%
> >>> rename from meta/recipes-bsp/u-boot/u-boot-fw-utils_2017.07.bb
> >>> rename to meta/recipes-bsp/u-boot/u-boot-fw-utils_2017.09.bb
> >>> diff --git a/meta/recipes-bsp/u-boot/u-boot-mkimage_2017.07.bb
> >>> b/meta/recipes-bsp/u-boot/u-boot-mkimage_2017.09.bb
> >>> similarity index 100%
> >>> rename from meta/recipes-bsp/u-boot/u-boot-mkimage_2017.07.bb
> >>> rename to meta/recipes-bsp/u-boot/u-boot-mkimage_2017.09.bb
> >>> diff --git a/meta/recipes-bsp/u-boot/u-boot_2017.07.bb
> >>> b/meta/recipes-bsp/u-boot/u-boot_2017.09.bb
> >>> similarity index 100%
> >>> rename from meta/recipes-bsp/u-boot/u-boot_2017.07.bb
> >>> rename to meta/recipes-bsp/u-boot/u-boot_2017.09.bb
> >>> --
> >>> 2.14.1
> >>>
> >>> --
> >>> _______________________________________________
> >>> Openembedded-core mailing list
> >>> Openembedded-core@lists.openembedded.org
> >>> http://lists.openembedded.org/mailman/listinfo/openembedded-core
> >>>
> >>
> >>
> > _______________________________________________
> > U-Boot mailing list
> > U-Boot@lists.denx.de
> > https://lists.denx.de/listinfo/u-boot
> >
>
>
> --
> Best regards,
> Marek Vasut
>

--001a1147d2ec0aec9b0559720e07
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><span style=3D"color:rgb(80,0,80);font-size:12.8px">u-boot=
-fw-utils-cross is broken for at least a year, if it breaks a lot of boards=
, why nobody complained yet?</span><br></div><div class=3D"gmail_extra"><br=
><div class=3D"gmail_quote">On Mon, Sep 18, 2017 at 7:32 AM, Marek Vasut <s=
pan dir=3D"ltr">&lt;<a href=3D"mailto:marek.vasut@gmail.com" target=3D"_bla=
nk">marek.vasut@gmail.com</a>&gt;</span> wrote:<br><blockquote class=3D"gma=
il_quote" style=3D"margin:0 0 0 .8ex;border-left:1px #ccc solid;padding-lef=
t:1ex"><span class=3D"">On 09/17/2017 01:06 PM, Martin Jansa wrote:<br>
&gt; I&#39;ve verified that u-boot-fw-utils builds and installs fw_printenv=
<br>
&gt; correctly with 2017.07.<br>
&gt;<br>
&gt; And that u-boot-fw-utils-cross was broken even with Yocto 2.3 Pyro<br>
&gt; and 2017.01 version there, maybe it&#39;s time to remove cross version=
? As<br>
&gt; nobody is using it and it&#39;s not tested?<br>
<br>
</span>Nobody apparently even build-tested this patch before submission, gu=
rrr.<br>
<br>
Speaking of cross versions of U-Boot fwutils and printenv/setenv , they<br>
are used by boards for modifying U-Boot environment on the target from<br>
Linux, so removing them would break a lot of boards -- NAK.<br>
<div><div class=3D"h5"><br>
&gt; On Sun, Sep 17, 2017 at 11:18 AM, Martin Jansa &lt;<a href=3D"mailto:m=
artin.jansa@gmail.com">martin.jansa@gmail.com</a>&gt;<br>
&gt; wrote:<br>
&gt;<br>
&gt;&gt; Is anyone seeing u-boot-fw-utils.do_install failure with this?<br>
&gt;&gt;<br>
&gt;&gt; u-boot-fw-utils/1_2017.09-r0/<wbr>git/tools/env/fw_printenv: No su=
ch file or<br>
&gt;&gt; directory<br>
&gt;&gt;<br>
&gt;&gt; I&#39;ve tried u-boot-fw-utils-cross, but it fails as well even so=
oner in<br>
&gt;&gt; do_compile:<br>
&gt;&gt;<br>
&gt;&gt; Log data follows:<br>
&gt;&gt; | DEBUG: Executing shell function do_compile<br>
&gt;&gt; | NOTE: make -j 32 ARCH=3Darm CC=3Dgcc=C2=A0 -isystemwork/x86_64-l=
inux/u-<br>
&gt;&gt; boot-fw-utils-cross/1_2017.09-<wbr>r0/recipe-sysroot-native/usr/<w=
br>include -O2<br>
&gt;&gt; -pipe -Lwork/x86_64-linux/u-boot-fw-<wbr>utils-cross/1_2017.09-r0/=
<wbr>recipe-sysroot-native/usr/lib<br>
&gt;&gt; -Lwork/x86_64-linux/u-boot-fw-<wbr>utils-cross/1_2017.09-r0/<wbr>r=
ecipe-sysroot-native/lib<br>
&gt;&gt; -Wl,-rpath-link,work/x86_64-<wbr>linux/u-boot-fw-utils-cross/1_<br=
>
&gt;&gt; 2017.09-r0/recipe-sysroot-<wbr>native/usr/lib -Wl,-rpath-link,work=
/x86_64-<br>
&gt;&gt; linux/u-boot-fw-utils-cross/1_<wbr>2017.09-r0/recipe-sysroot-<wbr>=
native/lib<br>
&gt;&gt; -Wl,-rpath,work/x86_64-linux/<wbr>u-boot-fw-utils-cross/1_2017.<br=
>
&gt;&gt; 09-r0/recipe-sysroot-native/<wbr>usr/lib -Wl,-rpath,work/x86_64-li=
nux/<br>
&gt;&gt; u-boot-fw-utils-cross/1_2017.<wbr>09-r0/recipe-sysroot-native/<wbr=
>lib -Wl,-O1 V=3D1<br>
&gt;&gt; rpi_3_32b_config<br>
&gt;&gt; | make -f ./scripts/Makefile.build obj=3Dscripts/basic<br>
&gt;&gt; |=C2=A0 =C2=A0cc -Wp,-MD,scripts/basic/.fixdep.<wbr>d -Wall -Wstri=
ct-prototypes -O2<br>
&gt;&gt; -fomit-frame-pointer=C2=A0 =C2=A0 =C2=A0 -o scripts/basic/fixdep s=
cripts/basic/fixdep.c<br>
&gt;&gt; | /bin/sh: 1: cc: not found<br>
&gt;&gt; | make[1]: *** [scripts/basic/fixdep] Error 127<br>
&gt;&gt; | make: *** [scripts_basic] Error 2<br>
&gt;&gt; | ERROR: oe_runmake failed<br>
&gt;&gt; | WARNING: exit code 1 from a shell command.<br>
&gt;&gt; | ERROR: Function failed: do_compile (log file is located at<br>
&gt;&gt; work/x86_64-linux/u-boot-fw-<wbr>utils-cross/1_2017.09-r0/temp/<br=
>
&gt;&gt; log.do_compile.12859)<br>
&gt;&gt; ERROR: Task (virtual:cross:oe-core/meta/<wbr>recipes-bsp/u-boot/u-=
boot-fw-<br>
&gt;&gt; utils_2017.09.bb:do_compile) failed with exit code &#39;1&#39;<br>
&gt;&gt;<br>
&gt;&gt;<br>
&gt;&gt; On Mon, Sep 11, 2017 at 10:30 PM, Otavio Salvador &lt;<a href=3D"m=
ailto:otavio@ossystems.com.br">otavio@ossystems.com.br</a><br>
&gt;&gt;&gt; wrote:<br>
&gt;&gt;<br>
&gt;&gt;&gt; This upgrades the U-Boot to the 2017.09 release.<br>
&gt;&gt;&gt;<br>
&gt;&gt;&gt; Signed-off-by: Otavio Salvador &lt;<a href=3D"mailto:otavio@os=
systems.com.br">otavio@ossystems.com.br</a>&gt;<br>
&gt;&gt;&gt; ---<br>
&gt;&gt;&gt;<br>
&gt;&gt;&gt;=C2=A0 .../u-boot/{u-boot-common_<wbr>2017.07.inc =3D&gt; u-boo=
t-common_2017.09.inc}<br>
&gt;&gt;&gt;=C2=A0 | 2 +-<br>
&gt;&gt;&gt;=C2=A0 .../u-boot/{<a href=3D"http://u-boot-fw-utils_2017.07.bb=
" rel=3D"noreferrer" target=3D"_blank">u-boot-fw-utils_<wbr>2017.07.bb</a> =
=3D&gt; <a href=3D"http://u-boot-fw-utils_2017.09.bb" rel=3D"noreferrer" ta=
rget=3D"_blank">u-boot-fw-utils_2017.09.bb</a>}<br>
&gt;&gt;&gt;=C2=A0 | 0<br>
&gt;&gt;&gt;=C2=A0 .../u-boot/{<a href=3D"http://u-boot-mkimage_2017.07.bb"=
 rel=3D"noreferrer" target=3D"_blank">u-boot-mkimage_<wbr>2017.07.bb</a> =
=3D&gt; <a href=3D"http://u-boot-mkimage_2017.09.bb" rel=3D"noreferrer" tar=
get=3D"_blank">u-boot-mkimage_2017.09.bb</a>}<br>
&gt;&gt;&gt;=C2=A0 | 0<br>
&gt;&gt;&gt;=C2=A0 meta/recipes-bsp/u-boot/{<a href=3D"http://u-boot_2017.0=
7.bb" rel=3D"noreferrer" target=3D"_blank">u-<wbr>boot_2017.07.bb</a> =3D&g=
t; <a href=3D"http://u-boot_2017.09.bb" rel=3D"noreferrer" target=3D"_blank=
">u-boot_2017.09.bb</a>}<br>
&gt;&gt;&gt; | 0<br>
&gt;&gt;&gt;=C2=A0 4 files changed, 1 insertion(+), 1 deletion(-)<br>
&gt;&gt;&gt;=C2=A0 rename meta/recipes-bsp/u-boot/{u-<wbr>boot-common_2017.=
07.inc =3D&gt;<br>
&gt;&gt;&gt; u-boot-common_2017.09.inc} (89%)<br>
&gt;&gt;&gt;=C2=A0 rename meta/recipes-bsp/u-boot/{<a href=3D"http://u-boot=
-fw-utils_2017.07.bb" rel=3D"noreferrer" target=3D"_blank">u-<wbr>boot-fw-u=
tils_2017.07.bb</a> =3D&gt;<br>
&gt;&gt;&gt; <a href=3D"http://u-boot-fw-utils_2017.09.bb" rel=3D"noreferre=
r" target=3D"_blank">u-boot-fw-utils_2017.09.bb</a>} (100%)<br>
&gt;&gt;&gt;=C2=A0 rename meta/recipes-bsp/u-boot/{<a href=3D"http://u-boot=
-mkimage_2017.07.bb" rel=3D"noreferrer" target=3D"_blank">u-<wbr>boot-mkima=
ge_2017.07.bb</a> =3D&gt;<br>
&gt;&gt;&gt; <a href=3D"http://u-boot-mkimage_2017.09.bb" rel=3D"noreferrer=
" target=3D"_blank">u-boot-mkimage_2017.09.bb</a>} (100%)<br>
&gt;&gt;&gt;=C2=A0 rename meta/recipes-bsp/u-boot/{<a href=3D"http://u-boot=
_2017.07.bb" rel=3D"noreferrer" target=3D"_blank">u-<wbr>boot_2017.07.bb</a=
> =3D&gt; <a href=3D"http://u-boot_2017.09.bb" rel=3D"noreferrer" target=3D=
"_blank">u-boot_2017.09.bb</a>}<br>
&gt;&gt;&gt; (100%)<br>
&gt;&gt;&gt;<br>
&gt;&gt;&gt; diff --git a/meta/recipes-bsp/u-boot/u-<wbr>boot-common_2017.0=
7.inc<br>
&gt;&gt;&gt; b/meta/recipes-bsp/u-boot/u-<wbr>boot-common_2017.09.inc<br>
&gt;&gt;&gt; similarity index 89%<br>
&gt;&gt;&gt; rename from meta/recipes-bsp/u-boot/u-<wbr>boot-common_2017.07=
.inc<br>
&gt;&gt;&gt; rename to meta/recipes-bsp/u-boot/u-<wbr>boot-common_2017.09.i=
nc<br>
&gt;&gt;&gt; index e37f5fd409..02e51242cb 100644<br>
&gt;&gt;&gt; --- a/meta/recipes-bsp/u-boot/u-<wbr>boot-common_2017.07.inc<b=
r>
&gt;&gt;&gt; +++ b/meta/recipes-bsp/u-boot/u-<wbr>boot-common_2017.09.inc<b=
r>
&gt;&gt;&gt; @@ -7,7 +7,7 @@ PE =3D &quot;1&quot;<br>
&gt;&gt;&gt;<br>
&gt;&gt;&gt;=C2=A0 # We use the revision in order to avoid having to fetch =
it from the<br>
&gt;&gt;&gt;=C2=A0 # repo during parse<br>
&gt;&gt;&gt; -SRCREV =3D &quot;<wbr>d85ca029f257b53a96da6c2fb421e7<wbr>8a00=
3a9943&quot;<br>
&gt;&gt;&gt; +SRCREV =3D &quot;<wbr>c98ac3487e413c71e5d36322ef3324<wbr>b21c=
6f60f9&quot;<br>
&gt;&gt;&gt;<br>
&gt;&gt;&gt;=C2=A0 SRC_URI =3D &quot;git://<a href=3D"http://git.denx.de/u-=
boot.git" rel=3D"noreferrer" target=3D"_blank">git.denx.de/u-boot.git</a> \=
<br>
&gt;&gt;&gt;=C2=A0 =C2=A0 =C2=A0 file://MPC8315ERDB-enable-<wbr>DHCP.patch =
\<br>
&gt;&gt;&gt; diff --git a/meta/recipes-bsp/u-boot/<a href=3D"http://u-boot-=
fw-utils_2017.07.bb" rel=3D"noreferrer" target=3D"_blank">u-<wbr>boot-fw-ut=
ils_2017.07.bb</a><br>
&gt;&gt;&gt; b/meta/recipes-bsp/u-boot/<a href=3D"http://u-boot-fw-utils_20=
17.09.bb" rel=3D"noreferrer" target=3D"_blank">u-<wbr>boot-fw-utils_2017.09=
.bb</a><br>
&gt;&gt;&gt; similarity index 100%<br>
&gt;&gt;&gt; rename from meta/recipes-bsp/u-boot/<a href=3D"http://u-boot-f=
w-utils_2017.07.bb" rel=3D"noreferrer" target=3D"_blank">u-<wbr>boot-fw-uti=
ls_2017.07.bb</a><br>
&gt;&gt;&gt; rename to meta/recipes-bsp/u-boot/<a href=3D"http://u-boot-fw-=
utils_2017.09.bb" rel=3D"noreferrer" target=3D"_blank">u-<wbr>boot-fw-utils=
_2017.09.bb</a><br>
&gt;&gt;&gt; diff --git a/meta/recipes-bsp/u-boot/<a href=3D"http://u-boot-=
mkimage_2017.07.bb" rel=3D"noreferrer" target=3D"_blank">u-<wbr>boot-mkimag=
e_2017.07.bb</a><br>
&gt;&gt;&gt; b/meta/recipes-bsp/u-boot/<a href=3D"http://u-boot-mkimage_201=
7.09.bb" rel=3D"noreferrer" target=3D"_blank">u-<wbr>boot-mkimage_2017.09.b=
b</a><br>
&gt;&gt;&gt; similarity index 100%<br>
&gt;&gt;&gt; rename from meta/recipes-bsp/u-boot/<a href=3D"http://u-boot-m=
kimage_2017.07.bb" rel=3D"noreferrer" target=3D"_blank">u-<wbr>boot-mkimage=
_2017.07.bb</a><br>
&gt;&gt;&gt; rename to meta/recipes-bsp/u-boot/<a href=3D"http://u-boot-mki=
mage_2017.09.bb" rel=3D"noreferrer" target=3D"_blank">u-<wbr>boot-mkimage_2=
017.09.bb</a><br>
&gt;&gt;&gt; diff --git a/meta/recipes-bsp/u-boot/<a href=3D"http://u-boot_=
2017.07.bb" rel=3D"noreferrer" target=3D"_blank">u-<wbr>boot_2017.07.bb</a>=
<br>
&gt;&gt;&gt; b/meta/recipes-bsp/u-boot/<a href=3D"http://u-boot_2017.09.bb"=
 rel=3D"noreferrer" target=3D"_blank">u-<wbr>boot_2017.09.bb</a><br>
&gt;&gt;&gt; similarity index 100%<br>
&gt;&gt;&gt; rename from meta/recipes-bsp/u-boot/<a href=3D"http://u-boot_2=
017.07.bb" rel=3D"noreferrer" target=3D"_blank">u-<wbr>boot_2017.07.bb</a><=
br>
&gt;&gt;&gt; rename to meta/recipes-bsp/u-boot/<a href=3D"http://u-boot_201=
7.09.bb" rel=3D"noreferrer" target=3D"_blank">u-<wbr>boot_2017.09.bb</a><br=
>
&gt;&gt;&gt; --<br>
&gt;&gt;&gt; 2.14.1<br>
&gt;&gt;&gt;<br>
&gt;&gt;&gt; --<br>
&gt;&gt;&gt; ______________________________<wbr>_________________<br>
&gt;&gt;&gt; Openembedded-core mailing list<br>
&gt;&gt;&gt; <a href=3D"mailto:Openembedded-core@lists.openembedded.org">Op=
enembedded-core@lists.<wbr>openembedded.org</a><br>
&gt;&gt;&gt; <a href=3D"http://lists.openembedded.org/mailman/listinfo/open=
embedded-core" rel=3D"noreferrer" target=3D"_blank">http://lists.openembedd=
ed.org/<wbr>mailman/listinfo/openembedded-<wbr>core</a><br>
&gt;&gt;&gt;<br>
&gt;&gt;<br>
&gt;&gt;<br>
</div></div>&gt; ______________________________<wbr>_________________<br>
&gt; U-Boot mailing list<br>
&gt; <a href=3D"mailto:U-Boot@lists.denx.de">U-Boot@lists.denx.de</a><br>
&gt; <a href=3D"https://lists.denx.de/listinfo/u-boot" rel=3D"noreferrer" t=
arget=3D"_blank">https://lists.denx.de/<wbr>listinfo/u-boot</a><br>
&gt;<br>
<span class=3D"HOEnZb"><font color=3D"#888888"><br>
<br>
--<br>
Best regards,<br>
Marek Vasut<br>
</font></span></blockquote></div><br></div>

--001a1147d2ec0aec9b0559720e07--
