Return-Path: <bruce.ashfield@gmail.com>
Received: from mail-lf0-f67.google.com (mail-lf0-f67.google.com
	[209.85.215.67])
	by mail.openembedded.org (Postfix) with ESMTP id AA68C78400
	for <openembedded-core@lists.openembedded.org>;
	Fri, 16 Feb 2018 16:16:01 +0000 (UTC)
Received: by mail-lf0-f67.google.com with SMTP id j193so4770782lfe.0
	for <openembedded-core@lists.openembedded.org>;
	Fri, 16 Feb 2018 08:16:03 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc; bh=G6HR35C+5HcICqCAZ2HGYKKbmX3FX6GTQKAE/xgRDkU=;
	b=aDAJzfqYs6yp6xxYGJ/vRWY4YVjT6GK5SpATK0mwuyBGv5oSqPy6oQ4XvISu1eRPdD
	8u3NvQl4OPxpRoQV8k+HBJ+xxKumXsdnxyrN1GisDy/FgjFd4BPAeSAsl+NDmbz6me4I
	UHOgs15VJpT70GNxXVmTR0VCISnbiNo1VWdJT0Q3yzYUZst2XnXPqjJIAwdPXVw6KX44
	WXE7GKWlIV1OUpVPYjzzyk/x8NdfQjIRRYswEcRzxrx7pYJGxQW27udqx5vE9Se28g58
	6pRl4nnpDlL8/TkfWXXArOfixpp9E3nsB9N0x0UX9Sq1qAOc3oPyyHonFIXhytl64CG2
	Eq3g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc;
	bh=G6HR35C+5HcICqCAZ2HGYKKbmX3FX6GTQKAE/xgRDkU=;
	b=LKspaCjA6d1XlNf6JR6cjL26bilwgr8JfaTt7rz3/jU6rpQBVY03/1qqpO7sLco9C8
	Vm+W8oTM3Ts/7WBG+9G/5Ugyo21M2RKgMFWXHtBUDh+nvMxNFZszb36KzkCsxHWP6Vvn
	LhNr7mvuSkpeBLAVG12sgZUyCvkeW7NGURpGJFOHpJ171EAdiJfUzEeTKb/I6mwTfugd
	oMQj1Lfd0mwqWc6KHZKfiVKPyq6J1aSKQVUM+H0PYrwuYYpc2f/aGgtCbvFI38MvSxw0
	p9KBPniFjsW6lcZCdKdlCZ8z8XpFgsI1bvmg/HGN4dATmM2syhVhWS5eHlMbws89lai/
	US5g==
X-Gm-Message-State: APf1xPCvRSRzzTs8Ix4IWl6B/3QHL3dD6nLyBqWnfqvFvV/x4U455Hiv
	brSygD6uI+nor6HPIp+evZd1CLxjIjPO8MIEMaU=
X-Google-Smtp-Source: AH8x2245Y0tosOneDQY/x/qDwh/8U2v0uAEybNXCswE3uOBWBLSPiYNIzx+i/0dr+jjFb+iMJKi416Z8Qp7pUlkGqDI=
X-Received: by 10.46.17.211 with SMTP id 80mr4394102ljr.87.1518797762058; Fri,
	16 Feb 2018 08:16:02 -0800 (PST)
MIME-Version: 1.0
Received: by 10.46.48.4 with HTTP; Fri, 16 Feb 2018 08:16:01 -0800 (PST)
In-Reply-To: <1cd76e22c50541db9bc2cfdccf5444a8@XBOX02.axis.com>
References: <cover.1516973739.git.bruce.ashfield@windriver.com>
	<f277f872c728ed18709c58e88e26a3fc81f23663.1516973739.git.bruce.ashfield@windriver.com>
	<1cd76e22c50541db9bc2cfdccf5444a8@XBOX02.axis.com>
From: Bruce Ashfield <bruce.ashfield@gmail.com>
Date: Fri, 16 Feb 2018 11:16:01 -0500
Message-ID: <CADkTA4Pscj08V1W2hVCpLrOQ62AbLFAskfKLQ=AYy2XG5rhj_Q@mail.gmail.com>
To: Peter Kjellerstedt <peter.kjellerstedt@axis.com>
Cc: "openembedded-core@lists.openembedded.org"
	<openembedded-core@lists.openembedded.org>
Subject: Re: [RFC][PATCH 12/12] make-mod-scripts: change how some kernel module tools are built
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
X-List-Received-Date: Fri, 16 Feb 2018 16:16:01 -0000
Content-Type: text/plain; charset="UTF-8"

On Thu, Feb 15, 2018 at 3:12 PM, Peter Kjellerstedt
<peter.kjellerstedt@axis.com> wrote:
>> -----Original Message-----
>> From: openembedded-core-bounces@lists.openembedded.org
>> [mailto:openembedded-core-bounces@lists.openembedded.org] On Behalf Of
>> Bruce Ashfield
>> Sent: den 26 januari 2018 14:59
>> To: richard.purdie@linuxfoundation.org
>> Cc: openembedded-core@lists.openembedded.org
>> Subject: [OE-core] [RFC][PATCH 12/12] make-mod-scripts: change how some
>> kernel module tools are built
>>
>> From: Joe Slater <jslater@windriver.com>
>>
>> Remove do_make_scripts() from module-base.bbclass and put
>> functionality in a recipe.  This will build the scripts only
>> once instead of each time an external module is built.
>>
>> [YOCTO #12228]
>>
>> Signed-off-by: Joe Slater <jslater@windriver.com>
>> Signed-off-by: Bruce Ashfield <bruce.ashfield@windriver.com>
>> ---
>>  meta/classes/module-base.bbclass                   | 12 +++--------
>>  meta/classes/module.bbclass                        |  4 ----
>>  .../make-mod-scripts/make-mod-scripts_1.0.bb       | 24
>> ++++++++++++++++++++++
>>  3 files changed, 27 insertions(+), 13 deletions(-)
>>  create mode 100644 meta/recipes-kernel/make-mod-scripts/make-mod-
>> scripts_1.0.bb
>>
>> diff --git a/meta/classes/module-base.bbclass b/meta/classes/module-
>> base.bbclass
>> index 6fe77c01b7ed..d6762a7dffd8 100644
>> --- a/meta/classes/module-base.bbclass
>> +++ b/meta/classes/module-base.bbclass
>> @@ -1,7 +1,8 @@
>>  inherit kernel-arch
>>
>> -# This is instead of DEPENDS = "virtual/kernel"
>> -do_configure[depends] += "virtual/kernel:do_compile_kernelmodules"
>> +# We do the dependency this way because the output is not preserved
>> +# in sstate, so we must force do_compile to run (once).
>> +do_configure[depends] += "make-mod-scripts:do_compile"
>>
>>  export OS = "${TARGET_OS}"
>>  export CROSS_COMPILE = "${TARGET_PREFIX}"
>> @@ -18,10 +19,3 @@ KERNEL_OBJECT_SUFFIX = ".ko"
>>  # kernel modules are generally machine specific
>>  PACKAGE_ARCH = "${MACHINE_ARCH}"
>>
>> -# Function to ensure the kernel scripts are created. Expected to
>> -# be called before do_compile. See module.bbclass for an example.
>> -do_make_scripts() {
>> -     unset CFLAGS CPPFLAGS CXXFLAGS LDFLAGS
>> -     make CC="${KERNEL_CC}" LD="${KERNEL_LD}" AR="${KERNEL_AR}" \
>> -                -C ${STAGING_KERNEL_DIR}
>> O=${STAGING_KERNEL_BUILDDIR} scripts
>> -}
>> diff --git a/meta/classes/module.bbclass b/meta/classes/module.bbclass
>> index 78d1b21dbd83..e34496024434 100644
>> --- a/meta/classes/module.bbclass
>> +++ b/meta/classes/module.bbclass
>> @@ -1,9 +1,5 @@
>>  inherit module-base kernel-module-split pkgconfig
>>
>> -addtask make_scripts after do_prepare_recipe_sysroot before
>> do_configure
>> -do_make_scripts[lockfiles] = "${TMPDIR}/kernel-scripts.lock"
>> -do_make_scripts[depends] += "virtual/kernel:do_shared_workdir"
>> -
>>  EXTRA_OEMAKE += "KERNEL_SRC=${STAGING_KERNEL_DIR}"
>>
>>  MODULES_INSTALL_TARGET ?= "modules_install"
>> diff --git a/meta/recipes-kernel/make-mod-scripts/make-mod-
>> scripts_1.0.bb b/meta/recipes-kernel/make-mod-scripts/make-mod-
>> scripts_1.0.bb
>> new file mode 100644
>> index 000000000000..6645c873f015
>> --- /dev/null
>> +++ b/meta/recipes-kernel/make-mod-scripts/make-mod-scripts_1.0.bb
>> @@ -0,0 +1,24 @@
>> +SUMMARY = "Build tools needed by external modules"
>> +LICENSE = "GPLv2"
>> +
>> +inherit kernel-arch
>
> This recipe needs to inherit pkgconfig as well (since pkg-config is used
> when building kconfig as part of the kernel scripts).

Yup.

I've never liked the inherit pkg-config, but prefer to do it as a
DEPENDS directly.
The recipe itself isn't setting any pkg-config options, and it doesn't
really do anything
but tweak dependencies.. but I'll suspend my scorn for the nearly
empty bbclass and just add the inherit directly :D

Cheers,

Bruce

>
>> +
>> +S = "${WORKDIR}"
>> +
>> +do_configure[depends] += "virtual/kernel:do_shared_workdir"
>> +do_compile[depends] += "virtual/kernel:do_compile_kernelmodules"
>> +
>> +# Build some host tools under work-shared.  CC, LD, and AR are probably
>> +# not used, but this is the historical way of invoking "make scripts".
>> +#
>> +do_configure() {
>> +     unset CFLAGS CPPFLAGS CXXFLAGS LDFLAGS
>> +     make CC="${KERNEL_CC}" LD="${KERNEL_LD}" AR="${KERNEL_AR}" \
>> +                -C ${STAGING_KERNEL_DIR} O=${STAGING_KERNEL_BUILDDIR} scripts
>> +}
>> +
>> +
>> +# There is no reason to build this on its own.
>> +#
>> +EXCLUDE_FROM_WORLD = "1"
>> +
>> --
>> 2.5.0
>
> //Peter
> --
> _______________________________________________
> Openembedded-core mailing list
> Openembedded-core@lists.openembedded.org
> http://lists.openembedded.org/mailman/listinfo/openembedded-core



-- 
"Thou shalt not follow the NULL pointer, for chaos and madness await
thee at its end"

