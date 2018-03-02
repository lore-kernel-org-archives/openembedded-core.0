Return-Path: <matt@madison.systems>
Received: from mail-lf0-f66.google.com (mail-lf0-f66.google.com
	[209.85.215.66])
	by mail.openembedded.org (Postfix) with ESMTP id C3DD371C42
	for <openembedded-core@lists.openembedded.org>;
	Fri,  2 Mar 2018 19:04:19 +0000 (UTC)
Received: by mail-lf0-f66.google.com with SMTP id 37so14776056lfs.7
	for <openembedded-core@lists.openembedded.org>;
	Fri, 02 Mar 2018 11:04:21 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=madison-systems.20150623.gappssmtp.com; s=20150623;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc; bh=oMyoYeJElWq11XmzbjlvO+70q4jiRGj5/j/5aZOIq+c=;
	b=XgMkxWQ0wypTOlf1Rox3NQPgxsq1NvO0KWz6SabokME5FDn5BUnuoE4g4/aHyP6K9j
	dV9nWzmvJVLaeZK5taVT8uji8dG+L8b+dvRE/lM3QHHEtX5yg5rjb2en7i26WV8LyFyk
	QQf/yVMXtT536b/6AlVRqMjnu7JUQjjHYdOtfbIGTNzwxRjYFRgLLxvu0pu8S0S4Jaq4
	LgT3LKyaSthgKnN8B9IqatAnyT4XVTKICpa4jYo3kplogx45N2kVNnCulVxtou1I0rFW
	GgQxpQJ+vjyGtbRINWhHQoYDhlbJBJsE+4MxcXAXNxIeVtC4JlVZDkEQ/UqbHHl93s6r
	DvUw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc;
	bh=oMyoYeJElWq11XmzbjlvO+70q4jiRGj5/j/5aZOIq+c=;
	b=UmpvL5+4JZPEJghX3MsyrcsZDaBpd/lzLPXgfROYfqqZAf7vLw4Ajh1gByDO6W+wUB
	OwiRc48fRawu35bLKmq8ofMntmXw/rBIuhwd/kSF/we8k4dyNODUDlrGQks8vMY3xCN8
	qbRrZ8nQRRneiK1kyPgs0pNk3KffZuJ8sQdLSf8kPUEi+QynALmcL7D55SfTcVYMZCl1
	JupWy8FMqcI+0gMRo7nR9YIdU21SRjRVq72+fwAVdiyx7Ev3gbXGunySMHyY6EnD4AGJ
	iOUToPbgsJUfJ7GUmRq3rU4F5/T61iJFxgEkKricujphWRLTXV2CoJtvt2xzGPERVPNH
	1EiA==
X-Gm-Message-State: AElRT7EYDzXQM/km79fmxWle64uNO/FvNaz1cVtPY8pa8cUhhvIFU2j3
	ueZ4hE0dGrdf/C8L+qj+zIJiIS7YGZdWr5032EM90g==
X-Google-Smtp-Source: AG47ELt/Q88uO3ns1Qi/0CosVxiUh+PnogbWAB4YBea/3VFXf5QeR6KA+L3kKam3ciZFaaQDfeJGVaxeHsrqmqDmjTQ=
X-Received: by 10.25.37.139 with SMTP id l133mr4750754lfl.70.1520017460037;
	Fri, 02 Mar 2018 11:04:20 -0800 (PST)
MIME-Version: 1.0
Received: by 10.25.156.131 with HTTP; Fri, 2 Mar 2018 11:04:19 -0800 (PST)
In-Reply-To: <CAMKF1soDhQ=c3Lj8CZXmDnBLPJQbm6CLmS_GBBrqSmUkH5Czgw@mail.gmail.com>
References: <20180301231654.24018-1-matt@madison.systems>
	<dd2616c3-2032-4ec8-87f5-cfbf598389f4@gmail.com>
	<CAMKF1soDhQ=c3Lj8CZXmDnBLPJQbm6CLmS_GBBrqSmUkH5Czgw@mail.gmail.com>
From: Matt Madison <matt@madison.systems>
Date: Fri, 2 Mar 2018 11:04:19 -0800
Message-ID: <CAGgRHJppHQ-Q8Xv0rososnqsUKFhh8LHYLjiGp9Nwg-KK3TXMA@mail.gmail.com>
To: Khem Raj <raj.khem@gmail.com>
Cc: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH v3 00/13] go1.10 update and misc improvements
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
X-List-Received-Date: Fri, 02 Mar 2018 19:04:20 -0000
Content-Type: text/plain; charset="UTF-8"

On Thu, Mar 1, 2018 at 10:10 PM, Khem Raj <raj.khem@gmail.com> wrote:
> On Thu, Mar 1, 2018 at 9:43 PM, Khem Raj <raj.khem@gmail.com> wrote:
>>
>>
>> On 3/1/18 3:16 PM, Matt Madison wrote:
>>>
>>> New in v3:
>>>      * reduced one of the go source patches,
>>>        eliminating an unneeded change (thanks
>>>        Otavio)
>>>      * Added bbclass and recipe patches to
>>>        handle SECURITY_CFLAGS settings if
>>>        they're enabled
>>>      * Added go-runtime-staticdev to target-side
>>>        SDK, needed for go static builds (fixes
>>>        test case failure in oe-selftest)
>>>      * two more minor cleanups
>>>
>>> New in v2:
>>>      * Fixed Upstream-Status line in go patches
>>>      * Added GOTMPDIR to do_configure[dirs]
>>>
>>> Updates to the go recipes and bbclasses for go1.10, which
>>> moves the bulk of the toolchain bootstrap and build out
>>> of the 'make.bash' script and to the 'dist' tool.  This
>>> required a rework of the patches to the go source.
>>>
>>> go1.10 introduces significant changes to the go build
>>> tool as well, requiring some further patches to make
>>> it work for OE builds.
>>
>>
>> The errors from v2 are gone but here I am seeing another error in
>> meta-influx with this patchset with ptest enabled
>>
>> DISTRO_FEATURES_append = " ptest"
>>
>>
>> bitbake github.com-eapache-go-xerial-snappy
>>
>
> for github.com-alicebob-miniredis you dont even need to ptest enabled
>
>>
>> | DEBUG: Executing shell function do_compile_ptest_base
>> | go build github.com/golang/snappy: missing or invalid GOROOT-resident
>> package
>> | WARNING:
>> /mnt/a/zonit/build/tmp/work/aarch64-bec-linux/github.com-eapache-go-xerial-snappy/1.0-r0/temp/run.do_compile_ptest_base.21897:1
>> exit 1 from 'go_list_package_tests'
>>
>> This error seems to be due to a patch
>> 0007-cmd-go-make-GOROOT-precious-by-default.patch
>>
>> It worked fine with 1.9

Yeah, I think I was erroring out too early in that patch. It worked OK for
the recipes I tested, but there are cases where it won't.  v4 will have an
updated patch that defers the error decision until later, which works better.

Thanks,
-Matt


>>
>>
>>>
>>> See https://golang.org/doc/go1.10 for a complete list
>>> of new features and changes.
>>>
>>> Following the update are some cleanup/improvement
>>> patches.
>>>
>>> Matt Madison (13):
>>>    go: update go 1.9 -> go 1.10
>>>    go: set GOMIPS envrionment variable
>>>    go.bbclass: rename GO_TMPDIR -> GOTMPDIR
>>>    go.bbclass: remove debug-related commands
>>>    go.bbclass: don't stage test data with sources
>>>    go.bbclass: ptest cleanup and improvements
>>>    goarch.bbclass: disable shared runtime for nativesdk builds
>>>    go: move common settings to go-common.inc
>>>    go.bbclass, goarch.bbclass: update SECURITY_CFLAGS
>>>    go: disable PIE CFLAGS for nativesdk and cross-canadian builds
>>>    packagegroup-go-sdk-target: add go-runtime-staticdev
>>>    go-runtime: remove unneeded nativesdk override, rename variable
>>>    go-cross-canadian: remove verbosity setting from GO_LDFLAGS
>>>
>>>   meta/classes/go.bbclass                            | 108 ++++----
>>>   meta/classes/goarch.bbclass                        |  13 +
>>>   .../packagegroups/packagegroup-go-sdk-target.bb    |   1 +
>>>   meta/recipes-devtools/go/go-1.10.inc               |  21 ++
>>>   ...1-allow-CC-and-CXX-to-have-multiple-words.patch |  33 +++
>>>   ...-content-based-hash-generation-less-pedan.patch | 220
>>> ++++++++++++++++
>>>   ...OLDIR-to-be-overridden-in-the-environment.patch |  64 +++++
>>>   .../0004-ld-add-soname-to-shareable-objects.patch  |  47 ++++
>>>   ...verride-CC-when-building-dist-and-go_boot.patch |  40 +++
>>>   ...-cmd-dist-separate-host-and-target-builds.patch | 277
>>> +++++++++++++++++++++
>>>   ...07-cmd-go-make-GOROOT-precious-by-default.patch |  97 ++++++++
>>>   ...ld-replace-glibc-dynamic-linker-with-musl.patch | 130 ++++++++++
>>>   meta/recipes-devtools/go/go-1.9.inc                |  26 --
>>>   .../0001-make.bash-quote-CC_FOR_TARGET.patch       |  32 ---
>>>   ...CC-and-CXX-environment-variable-construct.patch |  67 -----
>>>   ...sh-better-separate-host-and-target-builds.patch |  92 -------
>>>   ...w-GOTOOLDIR-to-be-overridden-in-the-envir.patch |  68 -----
>>>   ...05-cmd-go-make-GOROOT-precious-by-default.patch |  41 ---
>>>   ...dd-GOTOOLDIR_BOOTSTRAP-environment-variab.patch |  36 ---
>>>   .../0007-ld-add-soname-to-shareable-objects.patch  |  46 ----
>>>   ...dd-GOHOSTxx-indirection-for-cross-canadia.patch |  33 ---
>>>   ...dmode-pie-forces-external-linking-mode-on.patch |  47 ----
>>>   ...verride-CC-when-building-dist-and-go_boot.patch |  43 ----
>>>   .../go/go-1.9/set-external-linker.patch            | 111 ---------
>>>   meta/recipes-devtools/go/go-common.inc             |   6 +
>>>   meta/recipes-devtools/go/go-cross-canadian.inc     |  26 +-
>>>   ...s-canadian_1.9.bb => go-cross-canadian_1.10.bb} |   0
>>>   meta/recipes-devtools/go/go-cross.inc              |  56 ++---
>>>   .../go/{go-cross_1.9.bb => go-cross_1.10.bb}       |   0
>>>   meta/recipes-devtools/go/go-crosssdk.inc           |  14 +-
>>>   .../go/{go-crosssdk_1.9.bb => go-crosssdk_1.10.bb} |   0
>>>   meta/recipes-devtools/go/go-native.inc             |  25 +-
>>>   .../go/{go-native_1.9.bb => go-native_1.10.bb}     |   0
>>>   meta/recipes-devtools/go/go-runtime.inc            |  56 ++---
>>>   .../go/{go-runtime_1.9.bb => go-runtime_1.10.bb}   |   0
>>>   meta/recipes-devtools/go/go-target.inc             |  24 +-
>>>   meta/recipes-devtools/go/{go_1.9.bb => go_1.10.bb} |   0
>>>   37 files changed, 1095 insertions(+), 805 deletions(-)
>>>   create mode 100644 meta/recipes-devtools/go/go-1.10.inc
>>>   create mode 100644
>>> meta/recipes-devtools/go/go-1.10/0001-allow-CC-and-CXX-to-have-multiple-words.patch
>>>   create mode 100644
>>> meta/recipes-devtools/go/go-1.10/0002-cmd-go-make-content-based-hash-generation-less-pedan.patch
>>>   create mode 100644
>>> meta/recipes-devtools/go/go-1.10/0003-allow-GOTOOLDIR-to-be-overridden-in-the-environment.patch
>>>   create mode 100644
>>> meta/recipes-devtools/go/go-1.10/0004-ld-add-soname-to-shareable-objects.patch
>>>   create mode 100644
>>> meta/recipes-devtools/go/go-1.10/0005-make.bash-override-CC-when-building-dist-and-go_boot.patch
>>>   create mode 100644
>>> meta/recipes-devtools/go/go-1.10/0006-cmd-dist-separate-host-and-target-builds.patch
>>>   create mode 100644
>>> meta/recipes-devtools/go/go-1.10/0007-cmd-go-make-GOROOT-precious-by-default.patch
>>>   create mode 100644
>>> meta/recipes-devtools/go/go-1.10/0008-ld-replace-glibc-dynamic-linker-with-musl.patch
>>>   delete mode 100644 meta/recipes-devtools/go/go-1.9.inc
>>>   delete mode 100644
>>> meta/recipes-devtools/go/go-1.9/0001-make.bash-quote-CC_FOR_TARGET.patch
>>>   delete mode 100644
>>> meta/recipes-devtools/go/go-1.9/0002-cmd-go-fix-CC-and-CXX-environment-variable-construct.patch
>>>   delete mode 100644
>>> meta/recipes-devtools/go/go-1.9/0003-make.bash-better-separate-host-and-target-builds.patch
>>>   delete mode 100644
>>> meta/recipes-devtools/go/go-1.9/0004-cmd-go-allow-GOTOOLDIR-to-be-overridden-in-the-envir.patch
>>>   delete mode 100644
>>> meta/recipes-devtools/go/go-1.9/0005-cmd-go-make-GOROOT-precious-by-default.patch
>>>   delete mode 100644
>>> meta/recipes-devtools/go/go-1.9/0006-make.bash-add-GOTOOLDIR_BOOTSTRAP-environment-variab.patch
>>>   delete mode 100644
>>> meta/recipes-devtools/go/go-1.9/0007-ld-add-soname-to-shareable-objects.patch
>>>   delete mode 100644
>>> meta/recipes-devtools/go/go-1.9/0008-make.bash-add-GOHOSTxx-indirection-for-cross-canadia.patch
>>>   delete mode 100644
>>> meta/recipes-devtools/go/go-1.9/0009-cmd-go-buildmode-pie-forces-external-linking-mode-on.patch
>>>   delete mode 100644
>>> meta/recipes-devtools/go/go-1.9/0010-make.bash-override-CC-when-building-dist-and-go_boot.patch
>>>   delete mode 100644
>>> meta/recipes-devtools/go/go-1.9/set-external-linker.patch
>>>   rename meta/recipes-devtools/go/{go-cross-canadian_1.9.bb =>
>>> go-cross-canadian_1.10.bb} (100%)
>>>   rename meta/recipes-devtools/go/{go-cross_1.9.bb => go-cross_1.10.bb}
>>> (100%)
>>>   rename meta/recipes-devtools/go/{go-crosssdk_1.9.bb =>
>>> go-crosssdk_1.10.bb} (100%)
>>>   rename meta/recipes-devtools/go/{go-native_1.9.bb => go-native_1.10.bb}
>>> (100%)
>>>   rename meta/recipes-devtools/go/{go-runtime_1.9.bb =>
>>> go-runtime_1.10.bb} (100%)
>>>   rename meta/recipes-devtools/go/{go_1.9.bb => go_1.10.bb} (100%)
>>>
>>

