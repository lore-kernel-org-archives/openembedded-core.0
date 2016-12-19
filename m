Return-Path: <twoerner@gmail.com>
Received: from mail-it0-f65.google.com (mail-it0-f65.google.com
	[209.85.214.65])
	by mail.openembedded.org (Postfix) with ESMTP id A5CB3772AE
	for <openembedded-core@lists.openembedded.org>;
	Mon, 19 Dec 2016 21:42:59 +0000 (UTC)
Received: by mail-it0-f65.google.com with SMTP id n68so11820575itn.3
	for <openembedded-core@lists.openembedded.org>;
	Mon, 19 Dec 2016 13:43:01 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=date:from:to:cc:subject:message-id:references:mime-version
	:content-disposition:in-reply-to:user-agent;
	bh=ch8m82Gz8/RvqrpbYZQ7It+qMziHyEDirs4+hULwqYw=;
	b=LC9EkMoiILPq3PcHm2s4+jg6r7wfTsyeiX4BDiZT7OIlp/JPURBT1fnRA74yrBGnrU
	xKTGNamZlqgUA51Xeco7tMwxJxvm7BKdXRVENTr9VtYN9mTKW7HhaYjgYdTmfux+utIO
	BBQ6Oy5f94avCRc9e59qrk6LoJBdXNAQADToDX6V7QivQO79ehMaYyUfQ75jshqSVBgN
	dCx/40LZBiOgS6uryHgpkr0FbchMlTIaGao7FzTD3kNUPUgXIsfeXb51ZlJr8aaRlqT6
	d0Xh9j/M81CSeBj2cD6LZUSKtmVqCnvgY1o4XnoyxiQmh3AerdCSoDvvPGCu+oB4TqYX
	5THQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:date:from:to:cc:subject:message-id:references
	:mime-version:content-disposition:in-reply-to:user-agent;
	bh=ch8m82Gz8/RvqrpbYZQ7It+qMziHyEDirs4+hULwqYw=;
	b=mqTIKpd8XKwlG1uASPJA3vhwWq+s8y01bE3lPe6pA38nl8naKsT0tDWuN2rCKX8DfK
	QVy0rqjC5UnI8RMhMqJfQe8M+u8BNAHawvj21zIDPRm8k3/NK1Hfo197qNS/BG5KejfN
	TFw5t3mDM1Bn7xtIJ9KgMYdeu54z3BCeJ5Y088DvACGIvGfOAAN7lih6Ew+LYV+9Q9f6
	nE2jZkU/oHFc7ctwuLwB0y9yEBxUswnjdUq9giMaCKJl2hSbv8jJXIMo1bu6DIR3bnwE
	9MlY2lkNbFpZiy306xsE42gqvcCw3pgIfgAV9sYORAaKSJ7CGFJQCQe0MTdOfdNlESxV
	Ns9g==
X-Gm-Message-State: AKaTC01iSFf0Mfv8ghSfgQu1X1jkR9DcBEv9VcSgN1YohGEAbMwfWfCLl779+SJ3Ot8BJw==
X-Received: by 10.36.215.197 with SMTP id y188mr18702141itg.71.1482183780795; 
	Mon, 19 Dec 2016 13:43:00 -0800 (PST)
Received: from openSUSE-i7.site (dsl-67-55-28-109.acanac.net. [67.55.28.109])
	by smtp.gmail.com with ESMTPSA id
	m9sm8954155ioa.12.2016.12.19.13.42.59
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Mon, 19 Dec 2016 13:43:00 -0800 (PST)
Date: Mon, 19 Dec 2016 16:42:58 -0500
From: Trevor Woerner <twoerner@gmail.com>
To: "Burton, Ross" <ross.burton@intel.com>
Message-ID: <20161219214258.GA16333@openSUSE-i7.site>
References: <1481599839-114211-1-git-send-email-zhengrq.fnst@cn.fujitsu.com>
	<20161219152324.GA1056@openSUSE-i7.site>
	<CAJTo0LYV2qMTBVpm8ASDb7BdwwezWfysAn6fJbM7Xwh6FXCcyg@mail.gmail.com>
MIME-Version: 1.0
In-Reply-To: <CAJTo0LYV2qMTBVpm8ASDb7BdwwezWfysAn6fJbM7Xwh6FXCcyg@mail.gmail.com>
User-Agent: Mutt/1.6.0 (2016-04-01)
Cc: OE-core <openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH] util-linux: 2.28.1 -> 2.29
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
X-List-Received-Date: Mon, 19 Dec 2016 21:42:59 -0000
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline

On Mon 2016-12-19 @ 08:31:25 PM, Burton, Ross wrote:
> On 19 December 2016 at 15:23, Trevor Woerner <twoerner@gmail.com> wrote:
> 
> > Is anyone else seeing build failures as a result of this commit?
> >
> 
> Can you reproduce this on demand?

Yes. Last night's raspi2 and minnow/turbot builds failed, and trying with qemu
(x86-64 and x86) all failed.

A fresh build in a new directory fails readily:

$ git clone git://git.openembedded.org/openembedded-core.git
(e82a7f879419828b42b5cc71e6229c8235090f21)
$ git clone git://git.openembedded.org/bitbake.git
(50633012a64a3b5f0662145e29ff426374fb7683)
$ . openembedded-core/oe-init-build-env build bitbake
$ bitbake util-linux-native


Build Configuration:
BB_VERSION        = "1.32.0"
BUILD_SYS         = "x86_64-linux"
NATIVELSBSTRING   = "opensuse-42.2"
TARGET_SYS        = "i586-oe-linux"
MACHINE           = "qemux86"
DISTRO            = "nodistro"
DISTRO_VERSION    = "nodistro.0"
TUNE_FEATURES     = "m32 i586"
TARGET_FPU        = ""
meta              = "master:e82a7f879419828b42b5cc71e6229c8235090f21"

*BOOM!* ;-)

| disk-utils/cfdisk-cfdisk.o:cfdisk.c:(.text.startup+0x8fd): more undefined references to `_nc_stdscr' follow
| collect2: error: ld returned 1 exit status
| Makefile:5737: recipe for target 'cfdisk' failed
| make[2]: *** [cfdisk] Error 1
| make[2]: Leaving directory '/z/qemu/build/tmp-glibc/work/x86_64-linux/util-linux-native/2.29-r0/build'
| Makefile:11450: recipe for target 'all-recursive' failed
| make[1]: *** [all-recursive] Error 1
| make[1]: Leaving directory '/z/qemu/build/tmp-glibc/work/x86_64-linux/util-linux-native/2.29-r0/build'
| Makefile:4781: recipe for target 'all' failed
| make: *** [all] Error 2
| ERROR: Function failed: do_compile (log file is located at /z/qemu/build/tmp-glibc/work/x86_64-linux/util-linux-native/2.29-r0/temp/log.do_compile.28460)
ERROR: Task (virtual:native:/z/qemu/openembedded-core/meta/recipes-core/util-linux/util-linux_2.29.bb:do_compile) failed with exit code '1'

