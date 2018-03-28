Return-Path: <ross.burton@intel.com>
Received: from mail-oi0-f65.google.com (mail-oi0-f65.google.com
	[209.85.218.65])
	by mail.openembedded.org (Postfix) with ESMTP id D122C78432
	for <openembedded-core@lists.openembedded.org>;
	Wed, 28 Mar 2018 10:32:13 +0000 (UTC)
Received: by mail-oi0-f65.google.com with SMTP id j143-v6so1669335oih.11
	for <openembedded-core@lists.openembedded.org>;
	Wed, 28 Mar 2018 03:32:15 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=intel-com.20150623.gappssmtp.com; s=20150623;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc; bh=RSETLOvGh84Mmk/dzpFWfAy0SCMBZnbuIXihIUpDhBY=;
	b=Z4CEV1+e2k3Yq5NBZmKnVNTcr4gnWBkaQT1v7y46nAX35pXp/ya+QT20CntWP33Qod
	Hiy5H88WipK7ObGov9Hw6X2ljShtkLJ3F7XtrFNhsl4iWzAJfykD1zLeqQ4McfCOxfuI
	SjEsy9jR8GTYX/kO1/9WJ8nXeac7ratePRyf000Ij/PUlSZQnjNqh1RahXXF5o1D1/je
	Z/gra8Jh36qzPG+PST7XwkkGiri3GsF3hkRJawClmGO1SUYaD987wk2W61N8vrCf1ckQ
	IqxMVKvmXSBx/ReehX9KHy3SECxI4+Mwf6J5h4o/57LsNiD/oVKbYRO3ccLcsLCSed3O
	k0XQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc;
	bh=RSETLOvGh84Mmk/dzpFWfAy0SCMBZnbuIXihIUpDhBY=;
	b=X/cBO9CVCKLiu1nC7tNUtdqQdlgaONgVAO0DoVSZ/ybzF3ct47X01vVjWhN5sprbcb
	z6DMGGOWytIKAuvmeJQIQ3e6W/ffPKjVx4iOvi4CkgG2wfws+Z5/46CXu8Vhr5ILxjtd
	G1RLagvKkvO5AL3aJS/ibPwTgqBXyXtS709xLIP/hrRYkUBuXfIbTYOeUgNlGXeGIiek
	GUrVhmkBznC5xde3RTgHA3F1sOq89esTna06Q2dd9Nt3/qVJ3dE625vrR5rYQaVqqTbc
	ukSSrQqfNPBRQBWxf388zoc52baMIOqpd1M0EwAsEg3EJOpcARemoshP54MV/T5Oeh0O
	DKCw==
X-Gm-Message-State: ALQs6tBlMTIL5GWnO4RGd33cH5B0e9dZIVRZJ/iWCVQAJYyFsrmdp+1z
	FHiEAKnFiPeUzHNAy2ta1WmtyLrmfgHgI7PQ5x4Gfg==
X-Google-Smtp-Source: AIpwx4/4ew0/hNIJkH0fqcWG+Ve8nXhaoi2yTeFCPeRd+w0RiX70MU0Vwj9g4+cUSSH+czZiJd6xGUXiNqaAQ2C0Lvc=
X-Received: by 10.202.172.209 with SMTP id v200mr1713313oie.320.1522233134992; 
	Wed, 28 Mar 2018 03:32:14 -0700 (PDT)
MIME-Version: 1.0
Received: by 10.138.17.198 with HTTP; Wed, 28 Mar 2018 03:31:54 -0700 (PDT)
In-Reply-To: <cover.1522162765.git.bruce.ashfield@windriver.com>
References: <cover.1522162765.git.bruce.ashfield@windriver.com>
From: "Burton, Ross" <ross.burton@intel.com>
Date: Wed, 28 Mar 2018 11:31:54 +0100
Message-ID: <CAJTo0Lbv_7wXs1mgoqtBc6zWN_bazjwYpc1FbLzT3-zqUnNUHg@mail.gmail.com>
To: Bruce Ashfield <bruce.ashfield@windriver.com>
Cc: OE-core <openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH 0/7] linux-yocto: consolidated pull request
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
X-List-Received-Date: Wed, 28 Mar 2018 10:32:14 -0000
Content-Type: text/plain; charset="UTF-8"

I think it was this pull but musl builds are now failing like this in selftest:

| NOTE: FAIL: test_kernel_module (kernelmodule.KernelModuleTest)
| NOTE: ----------------------------------------------------------------------
| NOTE: Traceback (most recent call last):
|   File "/home/pokybuild/yocto-autobuilder/yocto-worker/nightly-musl-x86-64/build/meta/lib/oeqa/core/decorator/__init__.py",
line 32, in wrapped_f
|     return func(*args, **kwargs)
|   File "/home/pokybuild/yocto-autobuilder/yocto-worker/nightly-musl-x86-64/build/meta/lib/oeqa/core/decorator/__init__.py",
line 32, in wrapped_f
|     return func(*args, **kwargs)
|   File "/home/pokybuild/yocto-autobuilder/yocto-worker/nightly-musl-x86-64/build/meta/lib/oeqa/core/decorator/__init__.py",
line 32, in wrapped_f
|     return func(*args, **kwargs)
|   File "/home/pokybuild/yocto-autobuilder/yocto-worker/nightly-musl-x86-64/build/meta/lib/oeqa/runtime/cases/kernelmodule.py",
line 40, in test_kernel_module
|     self.assertEqual(status, 0, msg='\n'.join([cmd, output]))
| AssertionError: 2 != 0 : cd /tmp && make
| make -C /usr/src/kernel M=/tmp modules
| make[1]: Entering directory '/usr/src/kernel'
| getconf: LFS_CFLAGS: unknown variable
| getconf: LFS_LDFLAGS: unknown variable
| getconf: LFS_LIBS: unknown variable
| make[2]: *** No rule to make target 'tools/objtool/objtool', needed
by '/tmp/hellomod.o'.  Stop.
| make[1]: Leaving directory '/usr/src/kernel'
| make[1]: *** [Makefile:1519: _module_/tmp] Error 2
| make: *** [Makefile:5: all] Error 2

Ross

On 27 March 2018 at 16:03, Bruce Ashfield <bruce.ashfield@windriver.com> wrote:
> Hi all,
>
> This pull request is a series of -stable updates (more Spectre/meltdown
> included), and some fixes for the fsl_mpc h/w reference board that will
> allow us to update the reference to v4.14+.
>
> We also have a configuration tweak to the wifi fragments, which will
> result in more reuse, but won't impact the default configurations.
>
> Note: I haven't included the re-written kernel-devsrc changes, since
> I've never been able to reproduce the multilib issue with the ssl
> dependency. The devsrc changes will have to be looked at after the
> release.
>
> Cheers,
>
> Bruce
>
> The following changes since commit 80c7ca2c28959d08a59d960d318d8360392bd488:
>
>   kernel-dev: Clean up of "bsp_name" placeholder. (2018-03-25 09:41:13 +0100)
>
> are available in the git repository at:
>
>   git://git.pokylinux.org/poky-contrib zedd/kernel
>   http://git.pokylinux.org/cgit.cgi/poky-contrib/log/?h=zedd/kernel
>
> Bruce Ashfield (7):
>   linux-yocto/4.12: update to v4.12.21
>   mpc8315e-rdb: fix broken ethernet
>   linux-yocto/4.12: add ssl and utils native dependencies
>   linux-yocto/meta: improve wifi driver granularity
>   linux-yocto/4.12: intel-socfpga, intel-pmc-core and ish support for
>     CoffeeLake board
>   linux-yocto/4.14: update to v4.14.30
>   linux-yocto/4.15: update to v4.15.13
>
>  meta/recipes-kernel/linux/linux-yocto-rt_4.12.bb   |  6 +++---
>  meta/recipes-kernel/linux/linux-yocto-rt_4.14.bb   |  6 +++---
>  meta/recipes-kernel/linux/linux-yocto-rt_4.15.bb   |  6 +++---
>  meta/recipes-kernel/linux/linux-yocto-tiny_4.12.bb |  6 +++---
>  meta/recipes-kernel/linux/linux-yocto-tiny_4.14.bb |  6 +++---
>  meta/recipes-kernel/linux/linux-yocto-tiny_4.15.bb |  6 +++---
>  meta/recipes-kernel/linux/linux-yocto_4.12.bb      | 22 ++++++++++++----------
>  meta/recipes-kernel/linux/linux-yocto_4.14.bb      | 20 ++++++++++----------
>  meta/recipes-kernel/linux/linux-yocto_4.15.bb      | 20 ++++++++++----------
>  9 files changed, 50 insertions(+), 48 deletions(-)
>
> --
> 2.5.0
>
> --
> _______________________________________________
> Openembedded-core mailing list
> Openembedded-core@lists.openembedded.org
> http://lists.openembedded.org/mailman/listinfo/openembedded-core

