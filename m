Return-Path: <bruce.ashfield@gmail.com>
Received: from mail-wm0-f54.google.com (mail-wm0-f54.google.com [74.125.82.54])
	by mail.openembedded.org (Postfix) with ESMTP id 667E37881B
	for <openembedded-core@lists.openembedded.org>;
	Thu,  1 Mar 2018 13:48:58 +0000 (UTC)
Received: by mail-wm0-f54.google.com with SMTP id h21so11794674wmd.1
	for <openembedded-core@lists.openembedded.org>;
	Thu, 01 Mar 2018 05:49:00 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc:content-transfer-encoding;
	bh=bmBEm8Ft6EltsDngzlx8RWH8bj8OtnOZ4OJemASbkTM=;
	b=HjUlIqo5SQRBN34KQeXCFJMpEg8nA16vFPS+CDZeBoBQX8rKwVqPjsy1XHhBzOudjc
	vzKmadu/eEd7+VQzCyzN7c+7eEhEFoIVxVkyRkGqd8XlIaA+Goqe7ZRCi/D7YTpCnRGd
	EPtwdtKztA+MmvA4AEA+EiomY049kuwi5cMmtaRY4c7PU2oPKjarC9A+18WOHZTCQl1Y
	1XYKbb+N31EumYVcMJevCJljzPUvTrgl52Kp1m13+LXADAHZwBC4mkV8AHnNBOt793FZ
	7M6aZ/vic8v7xdUwktZrMfGiHirgbj6MsRrWQddYE+6TOb6nxTiVoyL96MyATH/J2QNL
	3UMQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc:content-transfer-encoding;
	bh=bmBEm8Ft6EltsDngzlx8RWH8bj8OtnOZ4OJemASbkTM=;
	b=SHWz/n6/NU1vIUwj0Djm3dHFW1yNCpwb1ZBjs4Batt1Ovah2gEifUHrxxT3v7dddwt
	eKGP8tlRfPY5T6WOIxZiR7+x50umIBB5fNBHosDiU4sIsKIPZb+jBaQ0rGPE+iwH7/ke
	cVB65TwhkKg11WdzfNuPL2v9Yn0K6zqVwmt5AEI1OkHZx2VlqXW62i/zz276ZjxArxu5
	OI5BYG+7yCwk89AMlCbtryIRGzvVGtJLY9rpAHJd65vVrts0xzP7F5euUfRnDYmkPL+a
	PgtzazAI+bHs6V9k5DogezO8RYoLWPzZPRWmOYGreXGTMwbAb1GuwMKZA2a/OSNcRxqo
	qj+Q==
X-Gm-Message-State: APf1xPCT46t4JOBrDXf70E9dTcup1K6T56RmmywORm6QZyEr3wiECbL4
	cG9JWq9MZ1wMiAjfe5KBsv5lI0jLA95mpMxIlwsGCQ==
X-Google-Smtp-Source: AG47ELvMnhvpyuT+3e3y70FgGowyrrL23uM1bSLxdgkFt1p0rliYVnOYSoHWP2luc/BKVvYwpI9PlsbEnfSLSt9FI4Q=
X-Received: by 10.46.80.6 with SMTP id e6mr1364036ljb.129.1519909037122; Thu,
	01 Mar 2018 04:57:17 -0800 (PST)
MIME-Version: 1.0
Received: by 10.46.48.4 with HTTP; Thu, 1 Mar 2018 04:57:16 -0800 (PST)
In-Reply-To: <20180301082802.GA16294@mbabyjoh-desk.ger.corp.intel.com>
References: <1519845645-21713-1-git-send-email-bruce.ashfield@windriver.com>
	<20180301082802.GA16294@mbabyjoh-desk.ger.corp.intel.com>
From: Bruce Ashfield <bruce.ashfield@gmail.com>
Date: Thu, 1 Mar 2018 07:57:16 -0500
Message-ID: <CADkTA4MDsONVLP3=6=MJXGjrN3DOGidKNThP38t+RMimR92AhQ@mail.gmail.com>
To: "Maxin B. John" <maxin.john@intel.com>
Cc: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH v2] kernel-devsrc: restructure for out of tree (and on target) module builds
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
X-List-Received-Date: Thu, 01 Mar 2018 13:48:59 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Thu, Mar 1, 2018 at 3:28 AM, Maxin B. John <maxin.john@intel.com> wrote:
> Hi,
>
> On Wed, Feb 28, 2018 at 02:20:45PM -0500, Bruce Ashfield wrote:
>> The existing kernel-devsrc package starts with a full copy of the kernel
>> source and then starts to strip out elements that are not required.
>>
>> This results in extra time (I/O) and extra space being taken up in the
>> final package. The main purpose of the kernel-devsrc package has been to
>> build modules against the running kernel, not to include a full copy of
>> the source code for re-building the kernel. The end result was a
>> 600M kernel-devsrc package.
>>
>> This restructuring of the package uses an approach similar to other
>> distros, where the kernel-devsrc package is for building against the
>> running kernel and uses a curated set of copied infrastructure, versus
>> a mass copy of the entire kernel.
>>
>> The differences in this approach versus other is largely due to the
>> architecture support and the split build/source directory of the
>> kernel.
>>
>> The result is a kernel-devsrc package of about 10M, which is capable
>> of running "make scripts" and compiling kernel modules against the
>> running kernel.
>>
>> Along with the changes to the copying of the infrascture, we also
>> have the following changes:
>>
>>  - a better/more explicit listing of dependencies for on-target
>>    builds of "make scripts" or "make modules_prepare"
>>
>>  - The kernel source is installed into /lib/modules/<version>/build
>>    and a symlink created from /usr/src/kernel to the new location.
>>    This aligns with the standard location for module support
>>    code
>>
>>  - There is also a symlink from /lib/modules/<version>/source -> build
>>    to reserve a spot for a new package that is simply the kernel
>>    source. That package is not part of this update.
>>
>> [YOCTO #12535]
>>
>> Signed-off-by: Bruce Ashfield <bruce.ashfield@windriver.com>
>> ---
>>
>>  v2: fix arch/arm devsrc builds
>
> Noticed one kernel-devsrc build failure in autobuilder (qemuarm) :
>
> https://autobuilder.yocto.io/builders/nightly-arm/builds/876/steps/BuildI=
mages/logs/stdio

This failure actually can't be from v2, it is the v1 issue I fixed.
The offending lines of
code are completely gone.

Bruce

>
> ERROR: kernel-devsrc-1.0-r0 do_install: Function failed: do_install (log =
file is located at /home/pokybuild/yocto-autobuilder/yocto-worker/nightly-a=
rm/build/build/tmp/work/qemuarm-poky-linux-gnueabi/kernel-devsrc/1.0-r0/tem=
p/log.do_install.25822)
> ERROR: Logfile of failure stored in: /home/pokybuild/yocto-autobuilder/yo=
cto-worker/nightly-arm/build/build/tmp/work/qemuarm-poky-linux-gnueabi/kern=
el-devsrc/1.0-r0/temp/log.do_install.25822
> Log data follows:
> | DEBUG: Executing python function extend_recipe_sysroot
> | NOTE: Direct dependencies are ['/home/pokybuild/yocto-autobuilder/yocto=
-worker/nightly-arm/build/meta/recipes-devtools/binutils/binutils-cross_2.3=
0.bb:do_populate_sysroot', 'virtual:native:/home/pokybuild/yocto-autobuilde=
r/yocto-worker/nightly-arm/build/meta/recipes-extended/xz/xz_5.2.3.bb:do_po=
pulate_sysroot', 'virtual:native:/home/pokybuild/yocto-autobuilder/yocto-wo=
rker/nightly-arm/build/meta/recipes-devtools/pkgconfig/pkgconfig_git.bb:do_=
populate_sysroot', 'virtual:native:/home/pokybuild/yocto-autobuilder/yocto-=
worker/nightly-arm/build/meta/recipes-support/lzop/lzop_1.03.bb:do_populate=
_sysroot', '/home/pokybuild/yocto-autobuilder/yocto-worker/nightly-arm/buil=
d/meta/recipes-kernel/kern-tools/kern-tools-native_git.bb:do_populate_sysro=
ot', '/home/pokybuild/yocto-autobuilder/yocto-worker/nightly-arm/build/meta=
/recipes-devtools/gcc/gcc-runtime_7.3.bb:do_populate_sysroot', '/home/pokyb=
uild/yocto-autobuilder/yocto-worker/nightly-arm/build/meta/recipes-devtools=
/gcc/gcc-cross_7.
>  3.bb:do_populate_sysroot', 'virtual:native:/home/pokybuild/yocto-autobui=
lder/yocto-worker/nightly-arm/build/meta/recipes-devtools/bison/bison_3.0.4=
.bb:do_populate_sysroot', 'virtual:native:/home/pokybuild/yocto-autobuilder=
/yocto-worker/nightly-arm/build/meta/recipes-devtools/pseudo/pseudo_1.8.2.b=
b:do_populate_sysroot', '/home/pokybuild/yocto-autobuilder/yocto-worker/nig=
htly-arm/build/meta/recipes-core/glibc/glibc_2.26.bb:do_populate_sysroot', =
'/home/pokybuild/yocto-autobuilder/yocto-worker/nightly-arm/build/meta/reci=
pes-kernel/kmod/kmod-native_git.bb:do_populate_sysroot', 'virtual:native:/h=
ome/pokybuild/yocto-autobuilder/yocto-worker/nightly-arm/build/meta/recipes=
-extended/bc/bc_1.06.bb:do_populate_sysroot', '/home/pokybuild/yocto-autobu=
ilder/yocto-worker/nightly-arm/build/meta/recipes-devtools/quilt/quilt-nati=
ve_0.65.bb:do_populate_sysroot', 'virtual:native:/home/pokybuild/yocto-auto=
builder/yocto-worker/nightly-arm/build/meta/recipes-connectivity/openssl/op=
enssl_1.0.2n.bb:d
>  o_populate_sysroot']
> | NOTE: Installed into sysroot: ['pkgconfig-native', 'lzop-native', 'kern=
-tools-native', 'pseudo-native', 'kmod-native', 'bc-native', 'openssl-nativ=
e', 'gtk-doc-native', 'lzo-native', 'makedepend-native', 'cryptodev-linux-n=
ative', 'util-macros-native', 'xproto-native']
> | NOTE: Skipping as already exists in sysroot: ['binutils-cross-arm', 'xz=
-native', 'gcc-runtime', 'gcc-cross-arm', 'bison-native', 'glibc', 'quilt-n=
ative', 'gettext-minimal-native', 'gnu-config-native', 'automake-native', '=
autoconf-native', 'libtool-native', 'linux-libc-headers', 'libgcc', 'zlib-n=
ative', 'texinfo-dummy-native', 'flex-native', 'libmpc-native', 'gmp-native=
', 'mpfr-native', 'm4-native']
> | DEBUG: sed -e 's:^[^/]*/:/home/pokybuild/yocto-autobuilder/yocto-worker=
/nightly-arm/build/build/tmp/work/qemuarm-poky-linux-gnueabi/kernel-devsrc/=
1.0-r0/recipe-sysroot-native/:g' /home/pokybuild/yocto-autobuilder/yocto-wo=
rker/nightly-arm/build/build/tmp/sysroots-components/x86_64/pkgconfig-nativ=
e/fixmepath /home/pokybuild/yocto-autobuilder/yocto-worker/nightly-arm/buil=
d/build/tmp/sysroots-components/x86_64/openssl-native/fixmepath /home/pokyb=
uild/yocto-autobuilder/yocto-worker/nightly-arm/build/build/tmp/sysroots-co=
mponents/x86_64/gtk-doc-native/fixmepath | xargs sed -i -e 's:FIXMESTAGINGD=
IRTARGET:/home/pokybuild/yocto-autobuilder/yocto-worker/nightly-arm/build/b=
uild/tmp/work/qemuarm-poky-linux-gnueabi/kernel-devsrc/1.0-r0/recipe-sysroo=
t:g; s:FIXMESTAGINGDIRHOST:/home/pokybuild/yocto-autobuilder/yocto-worker/n=
ightly-arm/build/build/tmp/work/qemuarm-poky-linux-gnueabi/kernel-devsrc/1.=
0-r0/recipe-sysroot-native:g' -e 's:FIXME_COMPONENTS_DIR:/home/pokybuild/yo=
cto-autobuilder/y
>  octo-worker/nightly-arm/build/build/tmp/sysroots-components:g' -e 's:FIX=
ME_HOSTTOOLS_DIR:/home/pokybuild/yocto-autobuilder/yocto-worker/nightly-arm=
/build/build/tmp/hosttools:g' -e 's:FIXME_PKGDATA_DIR:/home/pokybuild/yocto=
-autobuilder/yocto-worker/nightly-arm/build/build/tmp/pkgdata/qemuarm:g' -e=
 's:FIXME_PSEUDO_LOCALSTATEDIR:/home/pokybuild/yocto-autobuilder/yocto-work=
er/nightly-arm/build/build/tmp/work/qemuarm-poky-linux-gnueabi/kernel-devsr=
c/1.0-r0/pseudo/:g' -e 's:FIXME_LOGFIFO:/home/pokybuild/yocto-autobuilder/y=
octo-worker/nightly-arm/build/build/tmp/work/qemuarm-poky-linux-gnueabi/ker=
nel-devsrc/1.0-r0/temp/fifo.25822:g'
> | DEBUG: Python function extend_recipe_sysroot finished
> | DEBUG: Executing shell function do_install
> | cp: with --parents, the destination must be a directory
> | Try 'cp --help' for more information.
> | WARNING: /home/pokybuild/yocto-autobuilder/yocto-worker/nightly-arm/bui=
ld/build/tmp/work/qemuarm-poky-linux-gnueabi/kernel-devsrc/1.0-r0/temp/run.=
do_install.25822:1 exit 1 from 'rm -rf $kerneldir/build/include'
> | ERROR: Function failed: do_install (log file is located at /home/pokybu=
ild/yocto-autobuilder/yocto-worker/nightly-arm/build/build/tmp/work/qemuarm=
-poky-linux-gnueabi/kernel-devsrc/1.0-r0/temp/log.do_install.25822)
> NOTE: recipe kernel-devsrc-1.0-r0: task do_install: Failed
> ERROR: Task (/home/pokybuild/yocto-autobuilder/yocto-worker/nightly-arm/b=
uild/meta/recipes-kernel/linux/kernel-devsrc.bb:do_install) failed with exi=
t code '1'
>
> Best Regards,
> Maxin
> --
> _______________________________________________
> Openembedded-core mailing list
> Openembedded-core@lists.openembedded.org
> http://lists.openembedded.org/mailman/listinfo/openembedded-core



--=20
"Thou shalt not follow the NULL pointer, for chaos and madness await
thee at its end"

