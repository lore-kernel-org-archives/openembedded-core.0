Return-Path: <raj.khem@gmail.com>
Received: from mail-pl0-f67.google.com (mail-pl0-f67.google.com
	[209.85.160.67])
	by mail.openembedded.org (Postfix) with ESMTP id 414EC789AF
	for <openembedded-core@lists.openembedded.org>;
	Fri,  2 Mar 2018 18:16:46 +0000 (UTC)
Received: by mail-pl0-f67.google.com with SMTP id u13-v6so6142713plq.1
	for <openembedded-core@lists.openembedded.org>;
	Fri, 02 Mar 2018 10:16:48 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc; bh=WxEUUtRkJEuemxq4EJHLQNkQ4ut2KLaaXqHlt5PWZVk=;
	b=eQbqcjTAetJjFosMgmKC4Y/jIHPDGhW6njOfFsXtRDBTEVtm/6akL9juWyVWiWvEN9
	PcSg59NG7ZY0TZ0xXdXbX8LA7SaLZdeKc70PgrVbmT/wum+f04+By6ch4seNWe6vRDUA
	f9XXqIAEyH+beDP7XYasbEOOR+2Y3WN9x2up4JnDgvwM4U4d0bQLXmR4kFUAQVgrmUBR
	V6SqZ3YpVTITIe+TNP/YayreyXkOOnbQfzi3weCEREFNF9rNgzhGPoAKFYYzImr+9+CT
	a2MAfTkinwNkwxYNA+SvN3Jv6zcYBJJ9Z3HwXeazAEq4Dh4IM7kvOxTvx7qq8rw44rd5
	kQCA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc;
	bh=WxEUUtRkJEuemxq4EJHLQNkQ4ut2KLaaXqHlt5PWZVk=;
	b=DQuxwJQL26WIcbidJ5+c5zaz6iwBebXYTKDBG0yzJU27b8laPtopfL2mE5ph4T+Lq+
	I9pHpg7JtFyrV4uPfZ8L2e89xywDX0bbzQ0b3AGAKSBE9eavMxgrVJpXgbKJ5iwTQF0z
	G6bGX7H65aagzePNxZ40S9NzUBNbEDDYwwjhGrzsDcL4/pqyXjMxJZ3HUntz01OnqBek
	X7sWM+vG7/1kVfh/1MYdRfVYURwyznVnsKv9qndWeJzY+9Ec4Vp8//QX78ZCOIlGzc4O
	PExCjREKJLxgJOmA5m9lCb0c1kBk5H7FzhEwTLTgpej4BA+j0p7erg7YZAzJ94L46yuw
	OOmw==
X-Gm-Message-State: APf1xPAC+NTi0DqG1ZZxi7drD4001uq23EMveLo/N8Vhafj0GbTMyg9J
	p/rJ8Sc3z9bOiLCjsgcpTMbAQ6Xjr6ecuxRcW4I=
X-Google-Smtp-Source: AG47ELv+UoNgFbhaZqJWGAI4/N7Mlfh3C7IPITf519tfJzO4lR7I8KhKCuomcqW24MUo3iFJcLdsBDNnjdyK+shHxsY=
X-Received: by 2002:a17:902:aa89:: with SMTP id
	d9-v6mr6024965plr.337.1520014608127; 
	Fri, 02 Mar 2018 10:16:48 -0800 (PST)
MIME-Version: 1.0
Received: by 10.100.170.69 with HTTP; Fri, 2 Mar 2018 10:16:17 -0800 (PST)
In-Reply-To: <CAJTo0LYxPA=4=qQZSm0_AbWHCCG+=0j0+2pzmFrV76nxG7DRww@mail.gmail.com>
References: <1519845645-21713-1-git-send-email-bruce.ashfield@windriver.com>
	<20180301082802.GA16294@mbabyjoh-desk.ger.corp.intel.com>
	<CAJTo0LYxPA=4=qQZSm0_AbWHCCG+=0j0+2pzmFrV76nxG7DRww@mail.gmail.com>
From: Khem Raj <raj.khem@gmail.com>
Date: Fri, 2 Mar 2018 10:16:17 -0800
Message-ID: <CAMKF1soPjqqARZJdqi1W5Qcq6uCFymyzrGcXh-_HPrvgFgdW1w@mail.gmail.com>
To: "Burton, Ross" <ross.burton@intel.com>
Cc: Bruce Ashfield <bruce.ashfield@windriver.com>,
	OE-core <openembedded-core@lists.openembedded.org>
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
X-List-Received-Date: Fri, 02 Mar 2018 18:16:47 -0000
Content-Type: text/plain; charset="UTF-8"

On Thu, Mar 1, 2018 at 1:37 AM, Burton, Ross <ross.burton@intel.com> wrote:
> Also fails on musl:
>
> ERROR: Nothing RPROVIDES 'glibc-utils' (but
> /home/pokybuild/yocto-autobuilder/yocto-worker/nightly-musl/build/meta/recipes-kernel/linux/kernel-devsrc.bb
> RDEPENDS on or otherwise requires it)
>

I sent patches to add musl-utils which should help this case. Perhaps
adding glibc-utils to
deps unconditionally is not right thing here. We can use libc-glibc
and libc-musl overrides
to select the right utils.

Other idea is to create virtual/libc-utils but that seems like an overkill.

> Ross
>
> On 1 March 2018 at 08:28, Maxin B. John <maxin.john@intel.com> wrote:
>>
>> Hi,
>>
>> On Wed, Feb 28, 2018 at 02:20:45PM -0500, Bruce Ashfield wrote:
>> > The existing kernel-devsrc package starts with a full copy of the kernel
>> > source and then starts to strip out elements that are not required.
>> >
>> > This results in extra time (I/O) and extra space being taken up in the
>> > final package. The main purpose of the kernel-devsrc package has been to
>> > build modules against the running kernel, not to include a full copy of
>> > the source code for re-building the kernel. The end result was a
>> > 600M kernel-devsrc package.
>> >
>> > This restructuring of the package uses an approach similar to other
>> > distros, where the kernel-devsrc package is for building against the
>> > running kernel and uses a curated set of copied infrastructure, versus
>> > a mass copy of the entire kernel.
>> >
>> > The differences in this approach versus other is largely due to the
>> > architecture support and the split build/source directory of the
>> > kernel.
>> >
>> > The result is a kernel-devsrc package of about 10M, which is capable
>> > of running "make scripts" and compiling kernel modules against the
>> > running kernel.
>> >
>> > Along with the changes to the copying of the infrascture, we also
>> > have the following changes:
>> >
>> >  - a better/more explicit listing of dependencies for on-target
>> >    builds of "make scripts" or "make modules_prepare"
>> >
>> >  - The kernel source is installed into /lib/modules/<version>/build
>> >    and a symlink created from /usr/src/kernel to the new location.
>> >    This aligns with the standard location for module support
>> >    code
>> >
>> >  - There is also a symlink from /lib/modules/<version>/source -> build
>> >    to reserve a spot for a new package that is simply the kernel
>> >    source. That package is not part of this update.
>> >
>> > [YOCTO #12535]
>> >
>> > Signed-off-by: Bruce Ashfield <bruce.ashfield@windriver.com>
>> > ---
>> >
>> >  v2: fix arch/arm devsrc builds
>>
>> Noticed one kernel-devsrc build failure in autobuilder (qemuarm) :
>>
>>
>> https://autobuilder.yocto.io/builders/nightly-arm/builds/876/steps/BuildImages/logs/stdio
>>
>> ERROR: kernel-devsrc-1.0-r0 do_install: Function failed: do_install (log
>> file is located at
>> /home/pokybuild/yocto-autobuilder/yocto-worker/nightly-arm/build/build/tmp/work/qemuarm-poky-linux-gnueabi/kernel-devsrc/1.0-r0/temp/log.do_install.25822)
>> ERROR: Logfile of failure stored in:
>> /home/pokybuild/yocto-autobuilder/yocto-worker/nightly-arm/build/build/tmp/work/qemuarm-poky-linux-gnueabi/kernel-devsrc/1.0-r0/temp/log.do_install.25822
>> Log data follows:
>> | DEBUG: Executing python function extend_recipe_sysroot
>> | NOTE: Direct dependencies are
>> ['/home/pokybuild/yocto-autobuilder/yocto-worker/nightly-arm/build/meta/recipes-devtools/binutils/binutils-cross_2.30.bb:do_populate_sysroot',
>> 'virtual:native:/home/pokybuild/yocto-autobuilder/yocto-worker/nightly-arm/build/meta/recipes-extended/xz/xz_5.2.3.bb:do_populate_sysroot',
>> 'virtual:native:/home/pokybuild/yocto-autobuilder/yocto-worker/nightly-arm/build/meta/recipes-devtools/pkgconfig/pkgconfig_git.bb:do_populate_sysroot',
>> 'virtual:native:/home/pokybuild/yocto-autobuilder/yocto-worker/nightly-arm/build/meta/recipes-support/lzop/lzop_1.03.bb:do_populate_sysroot',
>> '/home/pokybuild/yocto-autobuilder/yocto-worker/nightly-arm/build/meta/recipes-kernel/kern-tools/kern-tools-native_git.bb:do_populate_sysroot',
>> '/home/pokybuild/yocto-autobuilder/yocto-worker/nightly-arm/build/meta/recipes-devtools/gcc/gcc-runtime_7.3.bb:do_populate_sysroot',
>> '/home/pokybuild/yocto-autobuilder/yocto-worker/nightly-arm/build/meta/recipes-devtools/gcc/gcc-cross_7.
>>  3.bb:do_populate_sysroot',
>> 'virtual:native:/home/pokybuild/yocto-autobuilder/yocto-worker/nightly-arm/build/meta/recipes-devtools/bison/bison_3.0.4.bb:do_populate_sysroot',
>> 'virtual:native:/home/pokybuild/yocto-autobuilder/yocto-worker/nightly-arm/build/meta/recipes-devtools/pseudo/pseudo_1.8.2.bb:do_populate_sysroot',
>> '/home/pokybuild/yocto-autobuilder/yocto-worker/nightly-arm/build/meta/recipes-core/glibc/glibc_2.26.bb:do_populate_sysroot',
>> '/home/pokybuild/yocto-autobuilder/yocto-worker/nightly-arm/build/meta/recipes-kernel/kmod/kmod-native_git.bb:do_populate_sysroot',
>> 'virtual:native:/home/pokybuild/yocto-autobuilder/yocto-worker/nightly-arm/build/meta/recipes-extended/bc/bc_1.06.bb:do_populate_sysroot',
>> '/home/pokybuild/yocto-autobuilder/yocto-worker/nightly-arm/build/meta/recipes-devtools/quilt/quilt-native_0.65.bb:do_populate_sysroot',
>> 'virtual:native:/home/pokybuild/yocto-autobuilder/yocto-worker/nightly-arm/build/meta/recipes-connectivity/openssl/openssl_1.0.2n.bb:d
>>  o_populate_sysroot']
>> | NOTE: Installed into sysroot: ['pkgconfig-native', 'lzop-native',
>> 'kern-tools-native', 'pseudo-native', 'kmod-native', 'bc-native',
>> 'openssl-native', 'gtk-doc-native', 'lzo-native', 'makedepend-native',
>> 'cryptodev-linux-native', 'util-macros-native', 'xproto-native']
>> | NOTE: Skipping as already exists in sysroot: ['binutils-cross-arm',
>> 'xz-native', 'gcc-runtime', 'gcc-cross-arm', 'bison-native', 'glibc',
>> 'quilt-native', 'gettext-minimal-native', 'gnu-config-native',
>> 'automake-native', 'autoconf-native', 'libtool-native',
>> 'linux-libc-headers', 'libgcc', 'zlib-native', 'texinfo-dummy-native',
>> 'flex-native', 'libmpc-native', 'gmp-native', 'mpfr-native', 'm4-native']
>> | DEBUG: sed -e
>> 's:^[^/]*/:/home/pokybuild/yocto-autobuilder/yocto-worker/nightly-arm/build/build/tmp/work/qemuarm-poky-linux-gnueabi/kernel-devsrc/1.0-r0/recipe-sysroot-native/:g'
>> /home/pokybuild/yocto-autobuilder/yocto-worker/nightly-arm/build/build/tmp/sysroots-components/x86_64/pkgconfig-native/fixmepath
>> /home/pokybuild/yocto-autobuilder/yocto-worker/nightly-arm/build/build/tmp/sysroots-components/x86_64/openssl-native/fixmepath
>> /home/pokybuild/yocto-autobuilder/yocto-worker/nightly-arm/build/build/tmp/sysroots-components/x86_64/gtk-doc-native/fixmepath
>> | xargs sed -i -e
>> 's:FIXMESTAGINGDIRTARGET:/home/pokybuild/yocto-autobuilder/yocto-worker/nightly-arm/build/build/tmp/work/qemuarm-poky-linux-gnueabi/kernel-devsrc/1.0-r0/recipe-sysroot:g;
>> s:FIXMESTAGINGDIRHOST:/home/pokybuild/yocto-autobuilder/yocto-worker/nightly-arm/build/build/tmp/work/qemuarm-poky-linux-gnueabi/kernel-devsrc/1.0-r0/recipe-sysroot-native:g'
>> -e 's:FIXME_COMPONENTS_DIR:/home/pokybuild/yocto-autobuilder/y
>>  octo-worker/nightly-arm/build/build/tmp/sysroots-components:g' -e
>> 's:FIXME_HOSTTOOLS_DIR:/home/pokybuild/yocto-autobuilder/yocto-worker/nightly-arm/build/build/tmp/hosttools:g'
>> -e
>> 's:FIXME_PKGDATA_DIR:/home/pokybuild/yocto-autobuilder/yocto-worker/nightly-arm/build/build/tmp/pkgdata/qemuarm:g'
>> -e
>> 's:FIXME_PSEUDO_LOCALSTATEDIR:/home/pokybuild/yocto-autobuilder/yocto-worker/nightly-arm/build/build/tmp/work/qemuarm-poky-linux-gnueabi/kernel-devsrc/1.0-r0/pseudo/:g'
>> -e
>> 's:FIXME_LOGFIFO:/home/pokybuild/yocto-autobuilder/yocto-worker/nightly-arm/build/build/tmp/work/qemuarm-poky-linux-gnueabi/kernel-devsrc/1.0-r0/temp/fifo.25822:g'
>> | DEBUG: Python function extend_recipe_sysroot finished
>> | DEBUG: Executing shell function do_install
>> | cp: with --parents, the destination must be a directory
>> | Try 'cp --help' for more information.
>> | WARNING:
>> /home/pokybuild/yocto-autobuilder/yocto-worker/nightly-arm/build/build/tmp/work/qemuarm-poky-linux-gnueabi/kernel-devsrc/1.0-r0/temp/run.do_install.25822:1
>> exit 1 from 'rm -rf $kerneldir/build/include'
>> | ERROR: Function failed: do_install (log file is located at
>> /home/pokybuild/yocto-autobuilder/yocto-worker/nightly-arm/build/build/tmp/work/qemuarm-poky-linux-gnueabi/kernel-devsrc/1.0-r0/temp/log.do_install.25822)
>> NOTE: recipe kernel-devsrc-1.0-r0: task do_install: Failed
>> ERROR: Task
>> (/home/pokybuild/yocto-autobuilder/yocto-worker/nightly-arm/build/meta/recipes-kernel/linux/kernel-devsrc.bb:do_install)
>> failed with exit code '1'
>>
>> Best Regards,
>> Maxin
>> --
>> _______________________________________________
>> Openembedded-core mailing list
>> Openembedded-core@lists.openembedded.org
>> http://lists.openembedded.org/mailman/listinfo/openembedded-core
>
>
>
> --
> _______________________________________________
> Openembedded-core mailing list
> Openembedded-core@lists.openembedded.org
> http://lists.openembedded.org/mailman/listinfo/openembedded-core
>

