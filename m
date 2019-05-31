Return-Path: <richard.purdie@linuxfoundation.org>
Received: from mail-wm1-f68.google.com (mail-wm1-f68.google.com
	[209.85.128.68])
	by mail.openembedded.org (Postfix) with ESMTP id D9E9B7E427
	for <openembedded-core@lists.openembedded.org>;
	Fri, 31 May 2019 08:48:11 +0000 (UTC)
Received: by mail-wm1-f68.google.com with SMTP id c6so2465663wml.0
	for <openembedded-core@lists.openembedded.org>;
	Fri, 31 May 2019 01:48:13 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=linuxfoundation.org; s=google;
	h=message-id:subject:from:to:cc:date:in-reply-to:references
	:user-agent:mime-version:content-transfer-encoding;
	bh=ZnLNMSfBxprUYcts47swhn18vvReqaslEvD3gq+nyL8=;
	b=Rrwl+qhv0F2oJaKvWFnNiqsBwrxp/YCOjFfsoGSOznN/58W+RStH5vcdcy+7kp4lmI
	F8nXic0QiGj4t/TmWnW3QE1w+VfQUKO0fiMzkDoMcSexirJY8WJ2nP3ohQ9rZKFmcrJP
	EJNuMaF/lVOyX9or+QBHnwPCji4YuHEKk8MxQ=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:message-id:subject:from:to:cc:date:in-reply-to
	:references:user-agent:mime-version:content-transfer-encoding;
	bh=ZnLNMSfBxprUYcts47swhn18vvReqaslEvD3gq+nyL8=;
	b=avn+1dNrYFioIem+9tJabm/Zy+nNI3LuFpSTfzlGSOYRh1Ue2Oktb1DiKlZ+tK5+S2
	cWKOsSRTni6pi2a6Nvl5YCt6lRyrJ8Y3GGgHmESE8uP3VYoXnfYR9Np83eIS4Uuiomas
	dVDYHMzEeJ/5Q4eTajWhd1xvut45YTHWHzGRe19jLF3szGMMXVYCAHEdq3zQ7PS5Gpb9
	rrFgI6PNvmUSU88mVgkiAfB1F8Hje9r3/6BaGgFbp/dYr9YhhIj/Fpvt0/VhDBsGv+g4
	+o+D/rVZ+plqCESbT0pP/xVTiIRhXKvDn13ba5bPEgWwVaB5rKFjCdsD6hoRbqLqxr8x
	sV4A==
X-Gm-Message-State: APjAAAVNdOtThrF8YrA0VPVCSDWf0vr+qWOc3kUrRA5HxWFOrQhf7zto
	QIDVya0p2ziyx1ezJ8q9SrAE+g==
X-Google-Smtp-Source: APXvYqx2jQHxsfx8iTi49z5kCiQh/ogFw9o7lR65VZcwdv9u3e2lV9Vg+HXBwyy4H1EXDo6iaIJhQw==
X-Received: by 2002:a05:600c:40f:: with SMTP id
	q15mr4826651wmb.157.1559292492444; 
	Fri, 31 May 2019 01:48:12 -0700 (PDT)
Received: from hex (5751f4a1.skybroadband.com. [87.81.244.161])
	by smtp.gmail.com with ESMTPSA id
	a2sm12725168wrg.69.2019.05.31.01.48.11
	(version=TLS1_3 cipher=AEAD-AES256-GCM-SHA384 bits=256/256);
	Fri, 31 May 2019 01:48:11 -0700 (PDT)
Message-ID: <7fe816bf754a5db25ff6dc009308822d10da9cc2.camel@linuxfoundation.org>
From: richard.purdie@linuxfoundation.org
To: "Yu, Mingli" <mingli.yu@windriver.com>, 
	openembedded-core@lists.openembedded.org
Date: Fri, 31 May 2019 09:48:10 +0100
In-Reply-To: <5CF0CC64.2070002@windriver.com>
References: <ba81c9ea11db351bde7fec1c40c2f57495c3fdec.camel@linuxfoundation.org>
	<1559196696-70652-1-git-send-email-mingli.yu@windriver.com>
	<2464053a8ff6ebd77a312cbc70b7ffda2c559345.camel@linuxfoundation.org>
	<5CF0CC64.2070002@windriver.com>
User-Agent: Evolution 3.32.2-1 
MIME-Version: 1.0
Subject: Re: [PATCH v4] elfutils: fix ptest failures
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
X-List-Received-Date: Fri, 31 May 2019 08:48:12 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit

On Fri, 2019-05-31 at 14:40 +0800, Yu, Mingli wrote:
> 
> On 2019年05月31日 04:49, richard.purdie@linuxfoundation.org wrote:
> > On Thu, 2019-05-30 at 14:11 +0800, mingli.yu@windriver.com wrote:
> > > From: Mingli Yu <Mingli.Yu@windriver.com>
> > > 
> > > * Add missing files which needed by ptest test
> > >    to fix the ptest failures such as:
> > >    | sh: ../src/elflint: No such file or directory
> > >    | FAIL: asm-tst4
> > > 
> > > * Rework 0001-skip-the-test-when-gcc-not-deployed.patch
> > >    to skip the tests which depend on gcc
> > > 
> > > * Define INHIBIT_PACKAGE_STRIP_FILES for elfutils to
> > >    avoid stripping some generated binaries otherwise
> > >    some of the tests such as test-nlist, run-strip-reloc.sh,
> > >    run-strip-strmerge.sh and so on will fail
> > > 
> > > Before:
> > > --------------------------------------------
> > > Recipe   | Passed    | Failed   | Skipped
> > > --------------------------------------------
> > > elfutils | 176       | 23       | 4
> > > --------------------------------------------
> > > 
> > > After:
> > > --------------------------------------------
> > > Recipe   | Passed    | Failed   | Skipped
> > > --------------------------------------------
> > > elfutils | 199       | 0       | 4
> > > --------------------------------------------
> > 
> > Thanks, this is better again. We do still have a musl issue:
> > 
> > https://autobuilder.yoctoproject.org/typhoon/#/builders/64/builds/648
> > 
> > Error:
> >   Problem: package packagegroup-core-full-cmdline-extended-1.0-
> > r6.0.noarch requires iproute2, but none of the providers can be
> > installed
> >    - package packagegroup-core-full-cmdline-1.0-r6.0.noarch
> > requires packagegroup-core-full-cmdline-extended, but none of the
> > providers can be installed
> >    - package iproute2-5.1.0-r0.0.core2_32 requires elfutils-ptest
> > >= 0.176, but none of the providers can be installed
> >    - conflicting requests
> >    - nothing provides elfutils-binutils needed by elfutils-ptest-
> > 0.176-r0.0.core2_32
> > (try to add '--skip-broken' to skip uninstallable packages or '
> > --nobest' to use not only best candidate packages)
> 
> I didn't encounter the failure during do_rootfs when "bitbake 
> core-image-sato-sdk" with musl on qemux86.
> 
> Could you help to provide your local.conf?

Its an autobuilder run and you can see the configuration here:

https://autobuilder.yoctoproject.org/typhoon/#/builders/64/builds/648/steps/7/logs/stdio

====================================================================================================
Writing /home/pokybuild/yocto-worker/musl-qemux86/build/build/conf/auto.conf with contents: (1559222710.4)
====================================================================================================
  MACHINE = "qemux86"
  DISTRO = "poky"
  SDKMACHINE = "x86_64"
  PACKAGE_CLASSES = "package_rpm package_deb package_ipk"
  DL_DIR = '/srv/autobuilder/autobuilder.yoctoproject.org/current_sources'
  PRSERV_HOST = 'localhost:0'
  SSTATE_DIR ?= '/srv/autobuilder/autobuilder.yoctoproject.org/pub/sstate'
  TCLIBC = 'musl'
  QEMU_USE_KVM = 'True'
  INHERIT += 'report-error'
  PREMIRRORS = ''
  BB_GENERATE_MIRROR_TARBALLS = '1'
  BB_NUMBER_THREADS = '16'
  PARALLEL_MAKE = '-j 16'
  BB_TASK_NICE_LEVEL = '5'
  BB_TASK_NICE_LEVEL_task-testimage = '0'
  BB_TASK_IONICE_LEVEL = '2.7'
  BB_TASK_IONICE_LEVEL_task-testimage = '2.1'
  INHERIT += 'testimage'
  TEST_QEMUBOOT_TIMEOUT = '1500'
  SANITY_TESTED_DISTROS = ''
  SDK_EXT_TYPE = 'minimal'
  SDK_INCLUDE_TOOLCHAIN = '1'
  BB_DISKMON_DIRS = 'STOPTASKS,${TMPDIR},1G,100K STOPTASKS,${DL_DIR},1G STOPTASKS,${SSTATE_DIR},1G STOPTASKS,/tmp,100M,100K ABORT,${TMPDIR},100M,1K ABORT,${DL_DIR},100M ABORT,${SSTATE_DIR},100M ABORT,/tmp,10M,1K'


then it tells you what it ran:

Running '. ./oe-init-build-env; bitbake core-image-minimal core-image-full-cmdline core-image-sato-sdk world -k' with output to /home/pokybuild/yocto-worker/musl-qemux86/build/build/command.log.1b

with "bitbake core-image-full-cmdline" likely being the thing which
breaks.

Cheers,

Richard


