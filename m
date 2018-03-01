Return-Path: <bruce.ashfield@gmail.com>
Received: from mail-wr0-f182.google.com (mail-wr0-f182.google.com
	[209.85.128.182])
	by mail.openembedded.org (Postfix) with ESMTP id C87EB78477
	for <openembedded-core@lists.openembedded.org>;
	Thu,  1 Mar 2018 13:52:30 +0000 (UTC)
Received: by mail-wr0-f182.google.com with SMTP id w77so6275470wrc.6
	for <openembedded-core@lists.openembedded.org>;
	Thu, 01 Mar 2018 05:52:32 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc; bh=kgBGbf9ELuMk421sqQzUdxSpO5gI2bXPu20b9q/hPm0=;
	b=u73aOy1B53u1l6c7ilJngHr3vQTx6lITg75AiIzUr/eMKqbLDv6WLkh6N3gqYKCB2y
	pJKAcBRR66cJ5crD8PfZu970YPMtRRg8Hb+UqDWbLeQXOaYPJGLL4lFm9I2ThM1uXuWZ
	6xXQjrzDBlKDpx62ZrmG+al+ycnZEKiC52ktMkg2uHiFvWGRN89J2Aj3PGoB7RH+NkDp
	gGxugOBI5d8vc1cQgGCydhpv9iK3gPrT4cF6NN47gYYLNIZyFI48bZhaL6cSub9PzQse
	MthHDiOU9nngr9JnnLBB4hyt7KoapZEqBW/iTo5HK1790XM3fkJlEf0wFoiw+On20SKp
	O0Ug==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc;
	bh=kgBGbf9ELuMk421sqQzUdxSpO5gI2bXPu20b9q/hPm0=;
	b=rJxNdljy1aqQbd/hwSEl+gOzRL2IJziVGEp/0VMfOqlWocIWxdp5ipJEGWxz4WFPU1
	Wxo3xKETMAW5fWD3mR7rAuzne4Ek+ScbZWw2KqwGXYWDIvU0LWKUFzsO1FN7nHddKewo
	smymYpXxS9QnyZ5ilXq6AenJU2l2QhVuc+wemOZCsDjRabgQHgZlyuCQRg/vAKzhjOVS
	4UpjdcRSTUOsQ9BoPQ6FZUaZMXzHwh4qpfNgf0SxAonhUNO+i8Fy+/Y2cFWFH+cyl3vE
	Fxd+VLiGiiS1Qs0o17LGhETPYur5r2lFtZnXKxpnMhI9MgNSZH23ZNg9/f+cV/ijH2kI
	lzHA==
X-Gm-Message-State: AElRT7FBLdxQ7nLnDpLXFeWWFi2MarjA8CjU37cr3X8wpXRwxEqYeH6M
	O1vyVOjMCtMrlAKS5YogIz4QEfunOu/y4DErXHkgdg==
X-Google-Smtp-Source: AG47ELu8v3XIdfV7XjHSaYcj5mnYN2PIVrrjDueafH4QQrebnZnTjZdiQpjdwDmSYIazYZxH8uNnVBdoLl1eE28vUuM=
X-Received: by 10.25.21.149 with SMTP id 21mr1390824lfv.13.1519909105669; Thu,
	01 Mar 2018 04:58:25 -0800 (PST)
MIME-Version: 1.0
Received: by 10.46.48.4 with HTTP; Thu, 1 Mar 2018 04:58:25 -0800 (PST)
In-Reply-To: <20180301105836.GA14042@mbabyjoh-desk.ger.corp.intel.com>
References: <1519845645-21713-1-git-send-email-bruce.ashfield@windriver.com>
	<20180301082802.GA16294@mbabyjoh-desk.ger.corp.intel.com>
	<CAJTo0LYxPA=4=qQZSm0_AbWHCCG+=0j0+2pzmFrV76nxG7DRww@mail.gmail.com>
	<20180301105836.GA14042@mbabyjoh-desk.ger.corp.intel.com>
From: Bruce Ashfield <bruce.ashfield@gmail.com>
Date: Thu, 1 Mar 2018 07:58:25 -0500
Message-ID: <CADkTA4P=6iwPw5xQGbb8nOrigoxkuMdWfTuHd25V4NKpH8VNpg@mail.gmail.com>
To: "Maxin B. John" <maxin.john@intel.com>
Cc: OE-core <openembedded-core@lists.openembedded.org>
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
X-List-Received-Date: Thu, 01 Mar 2018 13:52:31 -0000
Content-Type: text/plain; charset="UTF-8"

Interesting. I'll look at the errors and send a v3 next week.

I unfortunately have no capability to run the oe-selftests on my
builder, so I can only fix these
by inspection.

Cheers,

Bruce

On Thu, Mar 1, 2018 at 5:58 AM, Maxin B. John <maxin.john@intel.com> wrote:
>
>>Also fails on musl:
>>
>>ERROR: Nothing RPROVIDES 'glibc-utils' (but /home/pokybuild/yocto-autobuilder/yocto-worker/nightly-musl/build/meta/recipes-kernel/linux/kernel-devsrc.bb RDEPENDS on or otherwise requires it)
>>
>>Ross
>>
>>On 1 March 2018 at 08:28, Maxin B. John <maxin.john@intel.com> wrote:
>
>  >On Wed, Feb 28, 2018 at 02:20:45PM -0500, Bruce Ashfield wrote:
>  >> The existing kernel-devsrc package starts with a full copy of the kernel
>  >> source and then starts to strip out elements that are not required.
>  >>
>  >> This results in extra time (I/O) and extra space being taken up in the
>  >> final package. The main purpose of the kernel-devsrc package has been to
>  >> build modules against the running kernel, not to include a full copy of
>  >> the source code for re-building the kernel. The end result was a
>  >> 600M kernel-devsrc package.
>
>  Other failures are listed below:
>
>  arm64:
>  https://autobuilder.yocto.io/builders/nightly-arm64/builds/790/steps/Running%20Sanity%20Tests/logs/stdio
>
>  RESULTS - kernelmodule.KernelModuleTest.test_kernel_module - Testcase 1541: FAILED
>
> HOSTCC  scripts/sortextable
>  scripts/sortextable.c:31:10: fatal error: tools/be_byteshift.h: No such file or directory
> #include <tools/be_byteshift.h>
>   ^~~~~~~~~~~~~~~~~~~~~~
> compilation terminated.
> make[1]: *** [scripts/Makefile.host:102: scripts/sortextable] Error 1
> make: *** [Makefile:557: scripts] Error 2
> ----------------------------------------------------------------------
>
> Similar on qemuarm - poky-lsb :
>
> https://autobuilder.yocto.io/builders/nightly-arm-lsb/builds/812/steps/Running%20Sanity%20Tests/logs/stdio
>
> HOSTCC  scripts/recordmcount
> HOSTCC  scripts/sortextable
> scripts/sortextable.c:31:10: fatal error: tools/be_byteshift.h: No such file or directory
>     #include <tools/be_byteshift.h>
>               ^~~~~~~~~~~~~~~~~~~~~~
>               compilation terminated.
>               make[1]: *** [scripts/Makefile.host:102: scripts/sortextable] Error 1
>               make: *** [Makefile:557: scripts] Error 2
> -------------------------------------------------------------------------
>
> Also on PowerPC:
>
> https://autobuilder.yocto.io/builders/nightly-ppc-lsb/builds/814/steps/Running%20Sanity%20Tests/logs/stdio
>
> scripts/sortextable.c:31:10: fatal error: tools/be_byteshift.h: No such file or directory
>  #include <tools/be_byteshift.h>
>            ^~~~~~~~~~~~~~~~~~~~~~
> compilation terminated.
> make[1]: *** [scripts/Makefile.host:102: scripts/sortextable] Error 1
> make: *** [Makefile:557: scripts] Error 2
>
> Best Regards,
> Maxin
> --
> _______________________________________________
> Openembedded-core mailing list
> Openembedded-core@lists.openembedded.org
> http://lists.openembedded.org/mailman/listinfo/openembedded-core



-- 
"Thou shalt not follow the NULL pointer, for chaos and madness await
thee at its end"

