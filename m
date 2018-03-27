Return-Path: <armccurdy@gmail.com>
Received: from mail-wr0-f170.google.com (mail-wr0-f170.google.com
	[209.85.128.170])
	by mail.openembedded.org (Postfix) with ESMTP id DA1AE71BF2
	for <openembedded-core@lists.openembedded.org>;
	Tue, 27 Mar 2018 01:10:07 +0000 (UTC)
Received: by mail-wr0-f170.google.com with SMTP id u11so8349976wri.12
	for <openembedded-core@lists.openembedded.org>;
	Mon, 26 Mar 2018 18:10:09 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc; bh=FnCUb2g4ZVpi8T+bEYQX57nPQ2ITOSzkIhPVMC4yEjg=;
	b=Uny2xz4qJEyHCDeziGO6NjmTxtCJw1f70f+q5qi95YVZbbcJjO1rVarwgv3dZvYieC
	rrpIjFYexx3/TZj1BGRuTD1mvOX7CC0/hnB9jwvxtPrXTQKY9m96pknZ2Ev+Arkja9lp
	Ck8X1C5oSyHwjxNbwoy3Jm2HLUzL04snX3a994dAH6qo6vJ3LBOPVqJyMc1MzRbmlO63
	ris1IeIIB5tD7azKMkR2OSERbQO4XoU1nc3E8WW4y5e4U03B4KlYNPAvfhYYw2xs1Zc6
	UQPz3WqsXWvmiaf+XSmCz+XJgeaGf1MCCi0vkrrmx3OxDQ1fMFneE2BkWufWRtWt2jir
	OJXA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc;
	bh=FnCUb2g4ZVpi8T+bEYQX57nPQ2ITOSzkIhPVMC4yEjg=;
	b=RnJOAolPtb/HnFTOuSS7aEqcuY8n+4ieagKvGe279WTsB1T2hLoUPdaPwGnBYfEWWE
	roGgsXNSp/qkPERpRx+1r2JNUGzavZHoS+5d6wAIqCMPri8lNfR1IB8SnPp2IZWYu3RP
	0HrcWjgSz5k+Nln6KbNw2miTNdtns9DxPLqW9v4QHLvt39ZFibWVX/3+W6kEs1hJb9Bp
	1LMvmr1hAAeJfWCR//Z+wRRuCO+dpwSFzpXqklNHQitPpVBOjoeUYy5rgNUErSlRKtTz
	w/QfnUpDW2RA3IrQu8439hzuBFtaG1mFzpVbAmbUUdI3NkTQObKf+awqkzhMOcRGiOdq
	fbdg==
X-Gm-Message-State: AElRT7HBqrsGfScrD1DvzIaL+2hBJ7X9NLAgsM0OFPoq8K8cvEyKReDT
	6zRmKYCbtXLCkucy/R1Ku5D43wo1ojxgcfzD/L7xbA==
X-Google-Smtp-Source: AG47ELvaFFxYxLNrKcYVJ6xbBIrZH9djEPeHJrSGjDLWkpfUqCCQmw03sdq3HJGrLcDxz8SktmlKpV2UjraAx7vJHo4=
X-Received: by 10.223.177.213 with SMTP id r21mr28148817wra.89.1522113008324; 
	Mon, 26 Mar 2018 18:10:08 -0700 (PDT)
MIME-Version: 1.0
Received: by 10.223.163.65 with HTTP; Mon, 26 Mar 2018 18:10:07 -0700 (PDT)
In-Reply-To: <20180326160746.1dce7ae9@seebsdell>
References: <lyo9jerelp.fsf@ensc-virt.intern.sigma-chemnitz.de>
	<CAJ86T=Xcee6ivhoSc0adMR2q95ozsMXwSYL41mK7O5PN4CsWqw@mail.gmail.com>
	<20180324132246.28c2f8cd@seebsdell>
	<CAJ86T=VA6bR8v5+g6Y5e5HWQjU5r=E503gNdHCaco4PioPdW=Q@mail.gmail.com>
	<20180324142427.53da953d@seebsdell>
	<CAJ86T=U+0aG2gv6w_fJGCiN-VbO06is6-0gc+0bq+yvjBP=tNA@mail.gmail.com>
	<20180324145044.168f7e3f@seebsdell>
	<alpine.LRH.2.00.1803241306460.40806@sjc-ads-6991.cisco.com>
	<CAJTo0LbCLW+VH+hGz+D9GQZHZ5sb3NEiN6C-FmNBQHzHmddEeQ@mail.gmail.com>
	<alpine.LRH.2.00.1803241637120.40806@sjc-ads-6991.cisco.com>
	<CAJ86T=VB0axF8Lc-fEGuodFOLF_=UexUoGVoHt6+A9+m3bVs4w@mail.gmail.com>
	<alpine.LRH.2.00.1803242204010.40806@sjc-ads-6991.cisco.com>
	<CAJ86T=WBP_Cw133Z1s0LxjL-sgp3YQmuYGx7eBxUFACUJP++nw@mail.gmail.com>
	<CALbNGRREDMPeqY5WXmen77eEDQJwVu_QnkbDFCyPz0BOyUsL4A@mail.gmail.com>
	<20180326143107.48f153a5@seebsdell>
	<CAJ86T=X4u0=82wPCdwngRwQL-==trUDVfuH-4FGC-2G6AmfVgg@mail.gmail.com>
	<20180326160746.1dce7ae9@seebsdell>
From: Andre McCurdy <armccurdy@gmail.com>
Date: Mon, 26 Mar 2018 18:10:07 -0700
Message-ID: <CAJ86T=VaJyJYbBTkjR1yUTSJPCFSjgZCZZkYbyGEaTWYCg+u7A@mail.gmail.com>
To: Seebs <seebs@seebs.net>
Cc: OE-core <openembedded-core@lists.openembedded.org>
Subject: Re: pseudo: host user contamination
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
X-List-Received-Date: Tue, 27 Mar 2018 01:10:08 -0000
Content-Type: text/plain; charset="UTF-8"

I've verified that the QA warnings on FC27 can be fixed by preloading
a wrapper for libc syscall(). Just a proof of concept but if anyone
would like to reproduce it my steps are below.


$ cat ../meta/recipes-core/mvtest/mvtest.bb
LICENSE = "CLOSED"

do_compile() {
        echo foo > bar
}

do_install() {
        install -D -p -m 0644 bar ${D}/bin/bar
        install -d -m 0755 ${D}/usr/bin
        mv ${D}/bin/bar ${D}/usr/bin/bar
        ln -s /usr/bin/bar ${D}/bin/bar
}

FILES_${PN} = "/bin/* /usr/bin/*"

$ bitbake mvtest
WARNING: Host distribution "fedora-27" has not been validated with
this version of the build system; you may possibly experience
unexpected failures. It is recommended that you use a tested
distribution.
Parsing recipes: 100%
|#######################################################| Time:
0:00:49
Parsing of 815 .bb files complete (0 cached, 815 parsed). 1282
targets, 45 skipped, 0 masked, 0 errors.
NOTE: Resolving any missing task queue dependencies

Build Configuration:
BB_VERSION           = "1.37.0"
BUILD_SYS            = "x86_64-linux"
NATIVELSBSTRING      = "universal"
TARGET_SYS           = "i586-poky-linux"
MACHINE              = "qemux86"
DISTRO               = "poky"
DISTRO_VERSION       = "2.4+snapshot-20180327"
TUNE_FEATURES        = "m32 i586"
TARGET_FPU           = ""
meta
meta-poky
meta-yocto-bsp       = "master:80c7ca2c28959d08a59d960d318d8360392bd488"

Initialising tasks: 100%
|####################################################| Time: 0:00:00
NOTE: Executing SetScene Tasks
NOTE: Executing RunQueue Tasks
WARNING: mvtest-1.0-r0 do_package_qa: QA Issue: mvtest:
/mvtest/usr/bin/bar is owned by uid 1000, which is the same as the
user running bitbake. This may be due to host contamination
[host-user-contaminated]
NOTE: Tasks Summary: Attempted 470 tasks of which 456 didn't need to
be rerun and all succeeded.

Summary: There were 2 WARNING messages shown.

$ git clone https://github.com/armcc/interposers.git
Cloning into 'interposers'...
remote: Counting objects: 12, done.
remote: Compressing objects: 100% (6/6), done.
remote: Total 12 (delta 0), reused 5 (delta 0), pack-reused 6
Unpacking objects: 100% (12/12), done.
$ make -C interposers/
make: Entering directory '/home/vagrant/poky/build/interposers'
gcc -O2 -Wl,-O1 -Wl,--hash-style=gnu -fPIC -Wall -Werror -std=c99
-shared -o libinterpose_memcpy.so memcpy.c -ldl
gcc -O2 -Wl,-O1 -Wl,--hash-style=gnu -fPIC -Wall -Werror -std=c99
-shared -o libinterpose_syscall.so syscall.c -ldl
make: Leaving directory '/home/vagrant/poky/build/interposers'

$ sudo mkdir /usr/lib/interposers
$ sudo cp interposers/libinterpose_syscall.so /usr/lib/interposers
$ sudo cp interposers/interpose_syscall /usr/local/bin/
$ sudo cp interposers/mv_wrapper /usr/local/bin/mv
$ ln -sf /usr/local/bin/interpose_syscall tmp/hosttools/interpose_syscall
$ ln -sf /usr/local/bin/mv tmp/hosttools/mv

$ bitbake mvtest -c cleanall

$ bitbake mvtest
WARNING: Host distribution "fedora-27" has not been validated with
this version of the build system; you may possibly experience
unexpected failures. It is recommended that you use a tested
distribution.
Loading cache: 100%
|#########################################################| Time:
0:00:00
Loaded 1282 entries from dependency cache.
NOTE: Resolving any missing task queue dependencies

Build Configuration:
BB_VERSION           = "1.37.0"
BUILD_SYS            = "x86_64-linux"
NATIVELSBSTRING      = "universal"
TARGET_SYS           = "i586-poky-linux"
MACHINE              = "qemux86"
DISTRO               = "poky"
DISTRO_VERSION       = "2.4+snapshot-20180327"
TUNE_FEATURES        = "m32 i586"
TARGET_FPU           = ""
meta
meta-poky
meta-yocto-bsp       = "master:80c7ca2c28959d08a59d960d318d8360392bd488"

Initialising tasks: 100%
|####################################################| Time: 0:00:00
NOTE: Executing SetScene Tasks
NOTE: Executing RunQueue Tasks
NOTE: Tasks Summary: Attempted 470 tasks of which 456 didn't need to
be rerun and all succeeded.

Summary: There was 1 WARNING message shown.

