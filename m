Return-Path: <alex.kanavin@gmail.com>
Received: from mail-ed1-f68.google.com (mail-ed1-f68.google.com
	[209.85.208.68])
	by mail.openembedded.org (Postfix) with ESMTP id BFBC27FC80
	for <openembedded-core@lists.openembedded.org>;
	Fri, 20 Dec 2019 18:01:43 +0000 (UTC)
Received: by mail-ed1-f68.google.com with SMTP id b8so9104348edx.7
	for <openembedded-core@lists.openembedded.org>;
	Fri, 20 Dec 2019 10:01:45 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=mime-version:subject:from:in-reply-to:date:cc
	:content-transfer-encoding:message-id:references:to;
	bh=X+elJe0y09Kr5WzsToWnJUBj8zwW98RnaXI5+CuWZks=;
	b=RarqjxKjMyoLQduzlMK5HeJW50KU/XkynLg24ySxUiQNGMRmm7sTCeWiz6WYfokCrK
	sCxPKr3RIWDuYapHtvnd6IWjk+1sokbjcRuXbIqHA3lH9gyVq2ja+XYOJTOksLbqk8j8
	czExlKzdibQ1mMn4XCiY6VDAEFcuC80ZpSTxNJs3WWHLy+6eVAQQCdplmmKsQA1i07My
	XFDqSk/P49YHCG/JOdUb5uDCI3K4lnXOl4LciwsPFQ9wT56K4+DO1bldQiGuNzLy76eR
	UOR/Xle9cx1GfdajjbaVaxhuRl2Tw5AFk2RCmPZF+yh5X3QOzjlWQtVTWKOXenm2bX9M
	GarA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:subject:from:in-reply-to:date:cc
	:content-transfer-encoding:message-id:references:to;
	bh=X+elJe0y09Kr5WzsToWnJUBj8zwW98RnaXI5+CuWZks=;
	b=VKeoVFWEXtdhSL/c0cHDgpmJIQMKKxo+iKzHJXVhOaKae9sZSqmJ6nFjv16K67s29D
	e2E9ECwIA6tf6uEOhlpJG64s0jlVAz8eGhq/253Qm80StsHdTAK08/9kmR0JrpZ9osoj
	SEYtpdPcX9fJzCr++Lhosm9L+bwMBKprWZkXzBfagOQPqAhMQPUaxy92qFrCFjPhYA87
	vQo0+6RcUuLSpvwXU8oYfq4XDBgo4v4YfdquEjmEQ9yOHeHIeHniQpavhXjgMVl7on/J
	Y9oFW8Bkwr4eM7NCk8Q0SPPqOnehs2mGv3mH56lCJSKt4xQjMW3a/pA2IwCOT/HwHm/e
	E4MA==
X-Gm-Message-State: APjAAAVbjvOXknMkNnyhXewTXrLbbRxYzIr4RfJnP3eQ3TxtlhrKbp4e
	Zuo+8ujyzyJsTpCtVV/I1jw81YL1
X-Google-Smtp-Source: APXvYqxKVwomAeDF4ajL0l6G4jvRQssIzrNdqOvPFkwzb7y4IPMSeqRpnsP/VlCM1Ra1k2M7Lk8n+w==
X-Received: by 2002:adf:ed83:: with SMTP id c3mr16088331wro.51.1576864903685; 
	Fri, 20 Dec 2019 10:01:43 -0800 (PST)
Received: from ?IPv6:2a01:598:b106:ffe1:4dcb:e786:23df:72bf?
	([2a01:598:b106:ffe1:4dcb:e786:23df:72bf])
	by smtp.gmail.com with ESMTPSA id
	a5sm10301444wmb.37.2019.12.20.10.01.42
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Fri, 20 Dec 2019 10:01:42 -0800 (PST)
Mime-Version: 1.0 (1.0)
From: Alexander Kanavin <alex.kanavin@gmail.com>
X-Mailer: iPhone Mail (16G102)
In-Reply-To: <CAKmqyKOjMrQUjV=a=O_jcu8mRCSvLZ0nDq8kKjSDPi=U2F-Biw@mail.gmail.com>
Date: Fri, 20 Dec 2019 19:01:41 +0100
Message-Id: <F49F9E0F-4CF6-4812-98C9-B3A28CB40546@gmail.com>
References: <20191220041501.19716-1-alistair@alistair23.me>
	<20191220041501.19716-2-alistair@alistair23.me>
	<CANNYZj_0jEV9MoWtaoT7faPKjdvWwHcde1AD9qhGk39V1jLgWQ@mail.gmail.com>
	<CAKmqyKOjMrQUjV=a=O_jcu8mRCSvLZ0nDq8kKjSDPi=U2F-Biw@mail.gmail.com>
To: Alistair Francis <alistair23@gmail.com>
Cc: OE-core <openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH v3 2/2] mesa: Upgrade to 19.3.1
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
X-List-Received-Date: Fri, 20 Dec 2019 18:01:44 -0000
Content-Type: text/plain;
	charset=utf-8
Content-Transfer-Encoding: quoted-printable

The new regex isn=E2=80=99t quite right either, as it excludes x.y.10 releas=
es or x.y.z.0 releases. I=E2=80=99d suggest you just drop it.

Alex

> On 20 Dec 2019, at 18.45, Alistair Francis <alistair23@gmail.com> wrote:
>=20
> On Thu, Dec 19, 2019 at 11:33 PM Alexander Kanavin
> <alex.kanavin@gmail.com> wrote:
>>=20
>>> On Fri, 20 Dec 2019 at 05:15, Alistair Francis <alistair@alistair23.me> w=
rote:
>>>=20
>>> Upgrade mesa to 19.3 and refresh the patches.
>>>=20
>>> Also change the regex to not look for x.x.0 versions as they are
>>> development versions
>>=20
>>=20
>> Old: mesa-(?P<pver>\d+(\.\d+)+)
>> New: mesa-(?P<pver>\d+(\.^[1-9]\d+)+)
>>=20
>> I'm not sure what you had in mind, but the new regex does not work at all=
, as ^ outside of [] means "beginning of string", and placing [1-9] where it=
 is would mean it would also exclude x.0.x versions.
>=20
> The goal was to skip all x.x.0 versions, the idea being that they are
> test releases.
>=20
>>=20
>> To test, use https://regex101.com/, and you should also run 'devtool late=
st-version mesa'. I actually think it's fine to leave the regex as it is, x.=
x.1 versions are usually quick to follow, and it's good to get an earlier no=
tice of a new release.
>=20
> I did test with devtool check-update-status (I can't remember the name
> exactly) and it seemed to work.
>=20
> Looking at regex101 it seems like this is what I actually want:
>=20
> mesa-(?P<pver>\d+(\.\d)(\.[1-9]+)+)
>=20
> I see your point about seeing the update early, but then we don't want
> to accidentlly update to a test version.
>=20
> Should I update to the regex I mentioned above or just drop the change?
>=20
> Alistair
>=20
>>=20
>> Alex
>>=20
>>>=20
>>> As MESA_EGL_NO_X11_HEADERS was renamed to EGL_NO_X11 in [1] we are going=

>>> to change the do_install and add a patch to libepoxy to use the new
>>> define.
>>>=20
>>> 1: https://gitlab.freedesktop.org/mesa/mesa/commit/6202a13b71e18dc31ba7e=
2f4ea915b67eacc1ddb
>>>=20
>>> Signed-off-by: Alistair Francis <alistair@alistair23.me>
>>> ---
>>> ...atch_common.h-define-also-EGL_NO_X11.patch | 26 +++++++++++++++++++
>>> .../libepoxy/libepoxy_1.5.4.bb                |  1 +
>>> ...k-for-all-linux-host_os-combinations.patch | 18 ++++++-------
>>> ...02-meson.build-make-TLS-ELF-optional.patch | 18 ++++++-------
>>> ...Allow-enable-DRI-without-DRI-drivers.patch | 10 +++----
>>> ...le-asm-unconditionally-now-that-gen_.patch | 10 +++----
>>> .../{mesa-gl_19.2.4.bb =3D> mesa-gl_19.3.1.bb}  |  0
>>> .../mesa/{mesa_19.2.4.bb =3D> mesa_19.3.1.bb}   |  8 +++---
>>> 8 files changed, 59 insertions(+), 32 deletions(-)
>>> create mode 100644 meta/recipes-graphics/libepoxy/files/0001-dispatch_co=
mmon.h-define-also-EGL_NO_X11.patch
>>> rename meta/recipes-graphics/mesa/{mesa-gl_19.2.4.bb =3D> mesa-gl_19.3.1=
.bb} (100%)
>>> rename meta/recipes-graphics/mesa/{mesa_19.2.4.bb =3D> mesa_19.3.1.bb} (=
60%)
>>>=20
>>> diff --git a/meta/recipes-graphics/libepoxy/files/0001-dispatch_common.h=
-define-also-EGL_NO_X11.patch b/meta/recipes-graphics/libepoxy/files/0001-di=
spatch_common.h-define-also-EGL_NO_X11.patch
>>> new file mode 100644
>>> index 0000000000..7262945181
>>> --- /dev/null
>>> +++ b/meta/recipes-graphics/libepoxy/files/0001-dispatch_common.h-define=
-also-EGL_NO_X11.patch
>>> @@ -0,0 +1,26 @@
>>> +=46rom 6f15cc28d17cfdd86f5974f06ad97b8afedd5627 Mon Sep 17 00:00:00 200=
1
>>> +From: Martin Jansa <Martin.Jansa@gmail.com>
>>> +Date: Fri, 25 Oct 2019 11:09:34 +0000
>>> +Subject: [PATCH] dispatch_common.h: define also EGL_NO_X11
>>> +
>>> +MESA_EGL_NO_X11_HEADERS was renamed to EGL_NO_X11 in:
>>> +https://github.com/mesa3d/mesa/commit/6202a13b71e18dc31ba7e2f4ea915b67e=
acc1ddb
>>> +
>>> +Signed-off-by: Martin Jansa <Martin.Jansa@gmail.com>
>>> +Upstream-Status: Pending
>>> +---
>>> + src/dispatch_common.h | 1 +
>>> + 1 file changed, 1 insertion(+)
>>> +
>>> +diff --git a/src/dispatch_common.h b/src/dispatch_common.h
>>> +index dcb3a35..c206253 100644
>>> +--- a/src/dispatch_common.h
>>> ++++ b/src/dispatch_common.h
>>> +@@ -52,6 +52,7 @@
>>> +  * should do the same
>>> +  */
>>> + #  define MESA_EGL_NO_X11_HEADERS 1
>>> ++#  define EGL_NO_X11 1
>>> + # endif
>>> + #include "epoxy/egl.h"
>>> + #endif
>>> diff --git a/meta/recipes-graphics/libepoxy/libepoxy_1.5.4.bb b/meta/rec=
ipes-graphics/libepoxy/libepoxy_1.5.4.bb
>>> index 4caf672369..af9867407e 100644
>>> --- a/meta/recipes-graphics/libepoxy/libepoxy_1.5.4.bb
>>> +++ b/meta/recipes-graphics/libepoxy/libepoxy_1.5.4.bb
>>> @@ -10,6 +10,7 @@ LICENSE =3D "MIT"
>>> LIC_FILES_CHKSUM =3D "file://COPYING;md5=3D58ef4c80d401e07bd9ee8b6b58cf4=
64b"
>>>=20
>>> SRC_URI =3D "https://github.com/anholt/${BPN}/releases/download/${PV}/${=
BP}.tar.xz \
>>> +           file://0001-dispatch_common.h-define-also-EGL_NO_X11.patch \=

>>>            "
>>> SRC_URI[md5sum] =3D "00f47ad447321f9dc59f85bc1c9d0467"
>>> SRC_URI[sha256sum] =3D "0bd2cc681dfeffdef739cb29913f8c3caa47a88a451fd2bc=
6e606c02997289d2"
>>> diff --git a/meta/recipes-graphics/mesa/files/0001-meson.build-check-for=
-all-linux-host_os-combinations.patch b/meta/recipes-graphics/mesa/files/000=
1-meson.build-check-for-all-linux-host_os-combinations.patch
>>> index 1869e11059..085254323c 100644
>>> --- a/meta/recipes-graphics/mesa/files/0001-meson.build-check-for-all-li=
nux-host_os-combinations.patch
>>> +++ b/meta/recipes-graphics/mesa/files/0001-meson.build-check-for-all-li=
nux-host_os-combinations.patch
>>> @@ -1,6 +1,6 @@
>>> -=46rom b6d9bc97cb0e8c540a45dba5440b036fb940ff95 Mon Sep 17 00:00:00 200=
1
>>> -From: Alistair Francis <alistair.francis@wdc.com>
>>> -Date: Mon, 11 Nov 2019 09:38:15 -0800
>>> +=46rom 0d9ed002eff176b902da266d89829a9b0cb10946 Mon Sep 17 00:00:00 200=
1
>>> +From: Alistair Francis <alistair@alistair23.me>
>>> +Date: Thu, 14 Nov 2019 13:04:49 -0800
>>> Subject: [PATCH] meson.build: check for all linux host_os combinations
>>>=20
>>> Make sure that we are also looking for our host_os combinations like
>>> @@ -13,30 +13,30 @@ Upstream-Status: Pending
>>> Signed-off-by: Anuj Mittal <anuj.mittal@intel.com>
>>> Signed-off-by: Fabio Berton <fabio.berton@ossystems.com.br>
>>> Signed-off-by: Otavio Salvador <otavio@ossystems.com.br>
>>> -Signed-off-by: Alistair Francis <alistair.francis@wdc.com>
>>> +Signed-off-by: Alistair Francis <alistair@alistair23.me>
>>>=20
>>> ---
>>>  meson.build | 4 ++--
>>>  1 file changed, 2 insertions(+), 2 deletions(-)
>>>=20
>>> diff --git a/meson.build b/meson.build
>>> -index d584152..a1f098c 100644
>>> +index 898d025..09e3759 100644
>>> --- a/meson.build
>>> +++ b/meson.build
>>> -@@ -117,7 +117,7 @@ with_any_opengl =3D with_opengl or with_gles1 or wi=
th_gles2
>>> +@@ -124,7 +124,7 @@ with_any_opengl =3D with_opengl or with_gles1 or wi=
th_gles2
>>>  # Only build shared_glapi if at least one OpenGL API is enabled
>>> - with_shared_glapi =3D get_option('shared-glapi') and with_any_opengl
>>> + with_shared_glapi =3D with_shared_glapi and with_any_opengl
>>>=20
>>> -system_has_kms_drm =3D ['openbsd', 'netbsd', 'freebsd', 'gnu/kfreebsd',=
 'dragonfly', 'linux', 'sunos'].contains(host_machine.system())
>>> +system_has_kms_drm =3D ['openbsd', 'netbsd', 'freebsd', 'dragonfly'].co=
ntains(host_machine.system()) or host_machine.system().startswith('linux')
>>>=20
>>>  dri_drivers =3D get_option('dri-drivers')
>>>  if dri_drivers.contains('auto')
>>> -@@ -856,7 +856,7 @@ if cc.compiles('__uint128_t foo(void) { return 0; }=
',
>>> +@@ -884,7 +884,7 @@ if cc.compiles('__uint128_t foo(void) { return 0; }=
',
>>>  endif
>>>=20
>>>  # TODO: this is very incomplete
>>> --if ['linux', 'cygwin', 'gnu', 'gnu/kfreebsd'].contains(host_machine.sy=
stem())
>>> +-if ['linux', 'cygwin', 'gnu', 'freebsd', 'gnu/kfreebsd'].contains(host=
_machine.system())
>>> +if ['cygwin', 'gnu', 'gnu/kfreebsd'].contains(host_machine.system()) or=
 host_machine.system().startswith('linux')
>>>    pre_args +=3D '-D_GNU_SOURCE'
>>>  elif host_machine.system() =3D=3D 'sunos'
>>> diff --git a/meta/recipes-graphics/mesa/files/0002-meson.build-make-TLS-=
ELF-optional.patch b/meta/recipes-graphics/mesa/files/0002-meson.build-make-=
TLS-ELF-optional.patch
>>> index 199ed572d5..cd35a1f850 100644
>>> --- a/meta/recipes-graphics/mesa/files/0002-meson.build-make-TLS-ELF-opt=
ional.patch
>>> +++ b/meta/recipes-graphics/mesa/files/0002-meson.build-make-TLS-ELF-opt=
ional.patch
>>> @@ -1,13 +1,13 @@
>>> -=46rom af6923544de02ded648a736e07b9bd8b7c52dba9 Mon Sep 17 00:00:00 200=
1
>>> -From: Alistair Francis <alistair.francis@wdc.com>
>>> -Date: Wed, 23 Oct 2019 09:46:28 -0700
>>> +=46rom df835389699b32bb6610b39972502e323f8e09e5 Mon Sep 17 00:00:00 200=
1
>>> +From: Alistair Francis <alistair@alistair23.me>
>>> +Date: Thu, 14 Nov 2019 13:08:31 -0800
>>> Subject: [PATCH] meson.build: make TLS ELF optional
>>>=20
>>> USE_ELF_TLS has replaced GLX_USE_TLS so this patch is the original "make=

>>> TLS GLX optional again" patch updated to the latest mesa.
>>>=20
>>> Upstream-Status: Inappropriate [configuration]
>>> -Signed-off-by: Alistair Francis <alistair.francis@wdc.com>
>>> +Signed-off-by: Alistair Francis <alistair@alistair23.me>
>>>=20
>>> ---
>>>  meson.build       | 2 +-
>>> @@ -15,23 +15,23 @@ Signed-off-by: Alistair Francis <alistair.francis@wd=
c.com>
>>>  2 files changed, 7 insertions(+), 1 deletion(-)
>>>=20
>>> diff --git a/meson.build b/meson.build
>>> -index a1f098c..1e31eb4 100644
>>> +index 09e3759..a954118 100644
>>> --- a/meson.build
>>> +++ b/meson.build
>>> -@@ -378,7 +378,7 @@ if with_egl and not (with_platform_drm or with_plat=
form_surfaceless or with_plat
>>> +@@ -387,7 +387,7 @@ if with_egl and not (with_platform_drm or with_plat=
form_surfaceless or with_plat
>>>  endif
>>>=20
>>>  # Android uses emutls for versions <=3D P/28. For USE_ELF_TLS we need E=
LF TLS.
>>> --if not with_platform_android or get_option('platform-sdk-version') >=3D=
 29
>>> +-if host_machine.system() !=3D 'windows' and (not with_platform_android=
 or get_option('platform-sdk-version') >=3D 29)
>>> +if (not with_platform_android or get_option('platform-sdk-version') >=3D=
 29) and get_option('elf-tls')
>>>    pre_args +=3D '-DUSE_ELF_TLS'
>>>  endif
>>>=20
>>> diff --git a/meson_options.txt b/meson_options.txt
>>> -index b768c15..76cef24 100644
>>> +index 626baf3..637ff14 100644
>>> --- a/meson_options.txt
>>> +++ b/meson_options.txt
>>> -@@ -333,6 +333,12 @@ option(
>>> +@@ -341,6 +341,12 @@ option(
>>>    value : true,
>>>    description : 'Enable direct rendering in GLX and EGL for DRI',
>>>  )
>>> diff --git a/meta/recipes-graphics/mesa/files/0003-Allow-enable-DRI-with=
out-DRI-drivers.patch b/meta/recipes-graphics/mesa/files/0003-Allow-enable-D=
RI-without-DRI-drivers.patch
>>> index c20a1f7c52..a0536c87ac 100644
>>> --- a/meta/recipes-graphics/mesa/files/0003-Allow-enable-DRI-without-DRI=
-drivers.patch
>>> +++ b/meta/recipes-graphics/mesa/files/0003-Allow-enable-DRI-without-DRI=
-drivers.patch
>>> @@ -1,4 +1,4 @@
>>> -=46rom 5ad6515238bc042cccf9959abad44fdee9aeb07f Mon Sep 17 00:00:00 200=
1
>>> +=46rom 7eaa21a79ce6d6e92f6bf98c28b68e3fcb4d7874 Mon Sep 17 00:00:00 200=
1
>>> From: Fabio Berton <fabio.berton@ossystems.com.br>
>>> Date: Wed, 12 Jun 2019 14:18:31 -0300
>>> Subject: [PATCH] Allow enable DRI without DRI drivers
>>> @@ -15,10 +15,10 @@ Signed-off-by: Otavio Salvador <otavio@ossystems.com=
.br>
>>>  2 files changed, 7 insertions(+), 1 deletion(-)
>>>=20
>>> diff --git a/meson.build b/meson.build
>>> -index 1e31eb4..512eec6 100644
>>> +index a954118..62864c6 100644
>>> --- a/meson.build
>>> +++ b/meson.build
>>> -@@ -147,7 +147,7 @@ with_dri_r200 =3D dri_drivers.contains('r200')
>>> +@@ -154,7 +154,7 @@ with_dri_r200 =3D dri_drivers.contains('r200')
>>>  with_dri_nouveau =3D dri_drivers.contains('nouveau')
>>>  with_dri_swrast =3D dri_drivers.contains('swrast')
>>>=20
>>> @@ -28,10 +28,10 @@ index 1e31eb4..512eec6 100644
>>>  gallium_drivers =3D get_option('gallium-drivers')
>>>  if gallium_drivers.contains('auto')
>>> diff --git a/meson_options.txt b/meson_options.txt
>>> -index 76cef24..a8abd04 100644
>>> +index 637ff14..700c34c 100644
>>> --- a/meson_options.txt
>>> +++ b/meson_options.txt
>>> -@@ -34,6 +34,12 @@ option(
>>> +@@ -35,6 +35,12 @@ option(
>>>    choices : ['auto', 'true', 'false'],
>>>    description : 'enable support for dri3'
>>>  )
>>> diff --git a/meta/recipes-graphics/mesa/files/0004-Revert-mesa-Enable-as=
m-unconditionally-now-that-gen_.patch b/meta/recipes-graphics/mesa/files/000=
4-Revert-mesa-Enable-asm-unconditionally-now-that-gen_.patch
>>> index b5658d0c9d..8d614e571a 100644
>>> --- a/meta/recipes-graphics/mesa/files/0004-Revert-mesa-Enable-asm-uncon=
ditionally-now-that-gen_.patch
>>> +++ b/meta/recipes-graphics/mesa/files/0004-Revert-mesa-Enable-asm-uncon=
ditionally-now-that-gen_.patch
>>> @@ -1,4 +1,4 @@
>>> -=46rom 1b1cb6e5ea25eaa98573328b9565728a08245997 Mon Sep 17 00:00:00 200=
1
>>> +=46rom 41cd8836d785c79381764e7de59319f87959a5cf Mon Sep 17 00:00:00 200=
1
>>> From: Alistair Francis <alistair@alistair23.me>
>>> Date: Thu, 14 Nov 2019 09:06:02 -0800
>>> Subject: [PATCH] Revert "mesa: Enable asm unconditionally, now that
>>> @@ -15,7 +15,7 @@ Signed-off-by: Alistair Francis <alistair@alistair23.m=
e>
>>>  2 files changed, 67 insertions(+), 33 deletions(-)
>>>=20
>>> diff --git a/meson.build b/meson.build
>>> -index 512eec6..a2bcc3a 100644
>>> +index 62864c6..b53be8d 100644
>>> --- a/meson.build
>>> +++ b/meson.build
>>> @@ -49,6 +49,7 @@ with_vulkan_icd_dir =3D get_option('vulkan-icd-dir')
>>> @@ -26,7 +26,7 @@ index 512eec6..a2bcc3a 100644
>>>  with_glx_read_only_text =3D get_option('glx-read-only-text')
>>>  with_glx_direct =3D get_option('glx-direct')
>>>  with_osmesa =3D get_option('osmesa')
>>> -@@ -985,41 +986,68 @@ endif
>>> +@@ -1093,41 +1094,68 @@ dep_ws2_32 =3D cc.find_library('ws2_32', requir=
ed : with_platform_windows)
>>>=20
>>>  # TODO: shared/static? Is this even worth doing?
>>>=20
>>> @@ -129,10 +129,10 @@ index 512eec6..a2bcc3a 100644
>>>  endif
>>>=20
>>> diff --git a/meson_options.txt b/meson_options.txt
>>> -index a8abd04..0f4bd80 100644
>>> +index 700c34c..62e8472 100644
>>> --- a/meson_options.txt
>>> +++ b/meson_options.txt
>>> -@@ -233,6 +233,12 @@ option(
>>> +@@ -241,6 +241,12 @@ option(
>>>    value : false,
>>>    description : 'Enable GLVND support.'
>>>  )
>>> diff --git a/meta/recipes-graphics/mesa/mesa-gl_19.2.4.bb b/meta/recipes=
-graphics/mesa/mesa-gl_19.3.1.bb
>>> similarity index 100%
>>> rename from meta/recipes-graphics/mesa/mesa-gl_19.2.4.bb
>>> rename to meta/recipes-graphics/mesa/mesa-gl_19.3.1.bb
>>> diff --git a/meta/recipes-graphics/mesa/mesa_19.2.4.bb b/meta/recipes-gr=
aphics/mesa/mesa_19.3.1.bb
>>> similarity index 60%
>>> rename from meta/recipes-graphics/mesa/mesa_19.2.4.bb
>>> rename to meta/recipes-graphics/mesa/mesa_19.3.1.bb
>>> index f4b33df227..d105fec4df 100644
>>> --- a/meta/recipes-graphics/mesa/mesa_19.2.4.bb
>>> +++ b/meta/recipes-graphics/mesa/mesa_19.3.1.bb
>>> @@ -7,15 +7,15 @@ SRC_URI =3D "https://mesa.freedesktop.org/archive/mesa=
-${PV}.tar.xz \
>>>            file://0004-Revert-mesa-Enable-asm-unconditionally-now-that-g=
en_.patch \
>>>            "
>>>=20
>>> -SRC_URI[md5sum] =3D "5c047732b81651ddb341597528b4b096"
>>> -SRC_URI[sha256sum] =3D "09000a0f7dbbd82e193b81a8f1bf0c118eab7ca975c0329=
181968596e548e30f"
>>> +SRC_URI[md5sum] =3D "5c5965db31993af47fee82c9a7ccba5e"
>>> +SRC_URI[sha256sum] =3D "cd951db69c56a97ff0570a7ab2c0e39e6c5323f4cd8f4eb=
8274723e033beae59"
>>>=20
>>> -UPSTREAM_CHECK_GITTAGREGEX =3D "mesa-(?P<pver>\d+(\.\d+)+)"
>>> +UPSTREAM_CHECK_GITTAGREGEX =3D "mesa-(?P<pver>\d+(\.^[1-9]\d+)+)"
>>>=20
>>> #because we cannot rely on the fact that all apps will use pkgconfig,
>>> #make eglplatform.h independent of MESA_EGL_NO_X11_HEADER
>>> do_install_append() {
>>>     if ${@bb.utils.contains('PACKAGECONFIG', 'egl', 'true', 'false', d)}=
; then
>>> -        sed -i -e 's/^#if defined(MESA_EGL_NO_X11_HEADERS)$/#if defined=
(MESA_EGL_NO_X11_HEADERS) || ${@bb.utils.contains('PACKAGECONFIG', 'x11', '0=
', '1', d)}/' ${D}${includedir}/EGL/eglplatform.h
>>> +        sed -i -e 's/^#elif defined(__unix__) && defined(EGL_NO_X11)$/#=
elif defined(__unix__) \&\& defined(EGL_NO_X11) || ${@bb.utils.contains('PAC=
KAGECONFIG', 'x11', '0', '1', d)}/' ${D}${includedir}/EGL/eglplatform.h
>>>     fi
>>> }
>>> --
>>> 2.24.0
>>>=20
>>> --
>>> _______________________________________________
>>> Openembedded-core mailing list
>>> Openembedded-core@lists.openembedded.org
>>> http://lists.openembedded.org/mailman/listinfo/openembedded-core
>>=20
>> --
>> _______________________________________________
>> Openembedded-core mailing list
>> Openembedded-core@lists.openembedded.org
>> http://lists.openembedded.org/mailman/listinfo/openembedded-core

