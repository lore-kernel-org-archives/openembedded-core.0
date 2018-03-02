Return-Path: <raj.khem@gmail.com>
Received: from mail-pg0-f68.google.com (mail-pg0-f68.google.com [74.125.83.68])
	by mail.openembedded.org (Postfix) with ESMTP id E34AD77CF6
	for <openembedded-core@lists.openembedded.org>;
	Fri,  2 Mar 2018 05:43:20 +0000 (UTC)
Received: by mail-pg0-f68.google.com with SMTP id g12so3344025pgs.0
	for <openembedded-core@lists.openembedded.org>;
	Thu, 01 Mar 2018 21:43:22 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=subject:to:references:from:organization:message-id:date:user-agent
	:mime-version:in-reply-to:content-language:content-transfer-encoding;
	bh=gVfjgNzl70JtIwHtEQ3Gbyrl1oTktKeQj6pA1/g4a9c=;
	b=gU7xeStxBa9AYy0r3SBlE+ebe9dODxUfWWOS4yImh0NJ6Ex8nPR3eWxpjkIkAi/FKF
	S+AAY86nmPIPnTi4uEmuc1l2bQwc9/IuuKPwChFeZPa08+Xov01j/8L4Tikr5TbnWlyZ
	nW00+bq3C+Sv68TUfL0vWk6SpWQEnJQNsfOeprMsN2lhKilqrTYFIrrmSFKfxWW+zDoj
	GbHZpwknpKSEqblRKMQFH+4HrflSQXSg+UO0Q+w6EoR35EHXlvRCd1TM/IRmmgjao41D
	F+gB+oPJWfZMjomlkQiZCgTD5aA9AwlOJUK72J5PchKgY1A7i5Ex3tyCOWLkUdyCAId/
	QVSw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:subject:to:references:from:organization
	:message-id:date:user-agent:mime-version:in-reply-to
	:content-language:content-transfer-encoding;
	bh=gVfjgNzl70JtIwHtEQ3Gbyrl1oTktKeQj6pA1/g4a9c=;
	b=Hwr/9GSe+O8kivVCGGtZxugdUBlGwtW/zWFFJjpvkYdjn9gj2+A6Y0aHpNY4tVZhDJ
	nLNawUpCVJ04fDrOwlaX59GvkBVHrXLy5FMl1Bg86AwOQiWPc2lMD8Pj0a8ZUDJSYc7A
	LojTH31OLfHQBx9lOmQb98jwIxjkqV2p5WzmP8dmHGhSSjIHKHadr7J9+vCnkWvPvTL6
	M9G4fSJYRtp0q/oGsH9Wkb+1b0XEnTYOC3Mq+gUiaRkOveM0/+FqtGMrDdCajJcoC2OY
	/1TFhiks51ufeCet+uzyQNAvRrF9i88Y3zNWrQTdp4ciNAhlgsyRsHOrPkjX0+Brx2nn
	YBGQ==
X-Gm-Message-State: APf1xPBZBcEn/RlCTYXHKSEumUhqxcPiEfw/agHco/XNcuI/y6PXd01U
	LnrvsWHbl+qVyeNcBVNMLKV5vsKn
X-Google-Smtp-Source: AG47ELup+csYeXYuYhZTYluLp33OQ9dCWEsvnOMLODIqWyjJ+ZpN35YuORFhanMR/FEBEppSzic/zg==
X-Received: by 10.98.131.4 with SMTP id h4mr4511502pfe.156.1519969401181;
	Thu, 01 Mar 2018 21:43:21 -0800 (PST)
Received: from hermes.local ([2601:646:8880:466c:b139:7d65:a2c3:de0a])
	by smtp.gmail.com with ESMTPSA id
	189sm10988515pfu.129.2018.03.01.21.43.19
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Thu, 01 Mar 2018 21:43:20 -0800 (PST)
To: Matt Madison <matt@madison.systems>,
	openembedded-core@lists.openembedded.org
References: <20180301231654.24018-1-matt@madison.systems>
From: Khem Raj <raj.khem@gmail.com>
Organization: HIMVIS LLC
Message-ID: <dd2616c3-2032-4ec8-87f5-cfbf598389f4@gmail.com>
Date: Thu, 1 Mar 2018 21:43:17 -0800
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.13; rv:59.0)
	Gecko/20100101 Thunderbird/59.0
MIME-Version: 1.0
In-Reply-To: <20180301231654.24018-1-matt@madison.systems>
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
X-List-Received-Date: Fri, 02 Mar 2018 05:43:21 -0000
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit



On 3/1/18 3:16 PM, Matt Madison wrote:
> New in v3:
>      * reduced one of the go source patches,
>        eliminating an unneeded change (thanks
>        Otavio)
>      * Added bbclass and recipe patches to
>        handle SECURITY_CFLAGS settings if
>        they're enabled
>      * Added go-runtime-staticdev to target-side
>        SDK, needed for go static builds (fixes
>        test case failure in oe-selftest)
>      * two more minor cleanups
> 
> New in v2:
>      * Fixed Upstream-Status line in go patches
>      * Added GOTMPDIR to do_configure[dirs]
> 
> Updates to the go recipes and bbclasses for go1.10, which
> moves the bulk of the toolchain bootstrap and build out
> of the 'make.bash' script and to the 'dist' tool.  This
> required a rework of the patches to the go source.
> 
> go1.10 introduces significant changes to the go build
> tool as well, requiring some further patches to make
> it work for OE builds.

The errors from v2 are gone but here I am seeing another error in 
meta-influx with this patchset with ptest enabled

DISTRO_FEATURES_append = " ptest"


bitbake github.com-eapache-go-xerial-snappy


| DEBUG: Executing shell function do_compile_ptest_base
| go build github.com/golang/snappy: missing or invalid GOROOT-resident 
package
| WARNING: 
/mnt/a/zonit/build/tmp/work/aarch64-bec-linux/github.com-eapache-go-xerial-snappy/1.0-r0/temp/run.do_compile_ptest_base.21897:1 
exit 1 from 'go_list_package_tests'

This error seems to be due to a patch 
0007-cmd-go-make-GOROOT-precious-by-default.patch

It worked fine with 1.9

> 
> See https://golang.org/doc/go1.10 for a complete list
> of new features and changes.
> 
> Following the update are some cleanup/improvement
> patches.
> 
> Matt Madison (13):
>    go: update go 1.9 -> go 1.10
>    go: set GOMIPS envrionment variable
>    go.bbclass: rename GO_TMPDIR -> GOTMPDIR
>    go.bbclass: remove debug-related commands
>    go.bbclass: don't stage test data with sources
>    go.bbclass: ptest cleanup and improvements
>    goarch.bbclass: disable shared runtime for nativesdk builds
>    go: move common settings to go-common.inc
>    go.bbclass, goarch.bbclass: update SECURITY_CFLAGS
>    go: disable PIE CFLAGS for nativesdk and cross-canadian builds
>    packagegroup-go-sdk-target: add go-runtime-staticdev
>    go-runtime: remove unneeded nativesdk override, rename variable
>    go-cross-canadian: remove verbosity setting from GO_LDFLAGS
> 
>   meta/classes/go.bbclass                            | 108 ++++----
>   meta/classes/goarch.bbclass                        |  13 +
>   .../packagegroups/packagegroup-go-sdk-target.bb    |   1 +
>   meta/recipes-devtools/go/go-1.10.inc               |  21 ++
>   ...1-allow-CC-and-CXX-to-have-multiple-words.patch |  33 +++
>   ...-content-based-hash-generation-less-pedan.patch | 220 ++++++++++++++++
>   ...OLDIR-to-be-overridden-in-the-environment.patch |  64 +++++
>   .../0004-ld-add-soname-to-shareable-objects.patch  |  47 ++++
>   ...verride-CC-when-building-dist-and-go_boot.patch |  40 +++
>   ...-cmd-dist-separate-host-and-target-builds.patch | 277 +++++++++++++++++++++
>   ...07-cmd-go-make-GOROOT-precious-by-default.patch |  97 ++++++++
>   ...ld-replace-glibc-dynamic-linker-with-musl.patch | 130 ++++++++++
>   meta/recipes-devtools/go/go-1.9.inc                |  26 --
>   .../0001-make.bash-quote-CC_FOR_TARGET.patch       |  32 ---
>   ...CC-and-CXX-environment-variable-construct.patch |  67 -----
>   ...sh-better-separate-host-and-target-builds.patch |  92 -------
>   ...w-GOTOOLDIR-to-be-overridden-in-the-envir.patch |  68 -----
>   ...05-cmd-go-make-GOROOT-precious-by-default.patch |  41 ---
>   ...dd-GOTOOLDIR_BOOTSTRAP-environment-variab.patch |  36 ---
>   .../0007-ld-add-soname-to-shareable-objects.patch  |  46 ----
>   ...dd-GOHOSTxx-indirection-for-cross-canadia.patch |  33 ---
>   ...dmode-pie-forces-external-linking-mode-on.patch |  47 ----
>   ...verride-CC-when-building-dist-and-go_boot.patch |  43 ----
>   .../go/go-1.9/set-external-linker.patch            | 111 ---------
>   meta/recipes-devtools/go/go-common.inc             |   6 +
>   meta/recipes-devtools/go/go-cross-canadian.inc     |  26 +-
>   ...s-canadian_1.9.bb => go-cross-canadian_1.10.bb} |   0
>   meta/recipes-devtools/go/go-cross.inc              |  56 ++---
>   .../go/{go-cross_1.9.bb => go-cross_1.10.bb}       |   0
>   meta/recipes-devtools/go/go-crosssdk.inc           |  14 +-
>   .../go/{go-crosssdk_1.9.bb => go-crosssdk_1.10.bb} |   0
>   meta/recipes-devtools/go/go-native.inc             |  25 +-
>   .../go/{go-native_1.9.bb => go-native_1.10.bb}     |   0
>   meta/recipes-devtools/go/go-runtime.inc            |  56 ++---
>   .../go/{go-runtime_1.9.bb => go-runtime_1.10.bb}   |   0
>   meta/recipes-devtools/go/go-target.inc             |  24 +-
>   meta/recipes-devtools/go/{go_1.9.bb => go_1.10.bb} |   0
>   37 files changed, 1095 insertions(+), 805 deletions(-)
>   create mode 100644 meta/recipes-devtools/go/go-1.10.inc
>   create mode 100644 meta/recipes-devtools/go/go-1.10/0001-allow-CC-and-CXX-to-have-multiple-words.patch
>   create mode 100644 meta/recipes-devtools/go/go-1.10/0002-cmd-go-make-content-based-hash-generation-less-pedan.patch
>   create mode 100644 meta/recipes-devtools/go/go-1.10/0003-allow-GOTOOLDIR-to-be-overridden-in-the-environment.patch
>   create mode 100644 meta/recipes-devtools/go/go-1.10/0004-ld-add-soname-to-shareable-objects.patch
>   create mode 100644 meta/recipes-devtools/go/go-1.10/0005-make.bash-override-CC-when-building-dist-and-go_boot.patch
>   create mode 100644 meta/recipes-devtools/go/go-1.10/0006-cmd-dist-separate-host-and-target-builds.patch
>   create mode 100644 meta/recipes-devtools/go/go-1.10/0007-cmd-go-make-GOROOT-precious-by-default.patch
>   create mode 100644 meta/recipes-devtools/go/go-1.10/0008-ld-replace-glibc-dynamic-linker-with-musl.patch
>   delete mode 100644 meta/recipes-devtools/go/go-1.9.inc
>   delete mode 100644 meta/recipes-devtools/go/go-1.9/0001-make.bash-quote-CC_FOR_TARGET.patch
>   delete mode 100644 meta/recipes-devtools/go/go-1.9/0002-cmd-go-fix-CC-and-CXX-environment-variable-construct.patch
>   delete mode 100644 meta/recipes-devtools/go/go-1.9/0003-make.bash-better-separate-host-and-target-builds.patch
>   delete mode 100644 meta/recipes-devtools/go/go-1.9/0004-cmd-go-allow-GOTOOLDIR-to-be-overridden-in-the-envir.patch
>   delete mode 100644 meta/recipes-devtools/go/go-1.9/0005-cmd-go-make-GOROOT-precious-by-default.patch
>   delete mode 100644 meta/recipes-devtools/go/go-1.9/0006-make.bash-add-GOTOOLDIR_BOOTSTRAP-environment-variab.patch
>   delete mode 100644 meta/recipes-devtools/go/go-1.9/0007-ld-add-soname-to-shareable-objects.patch
>   delete mode 100644 meta/recipes-devtools/go/go-1.9/0008-make.bash-add-GOHOSTxx-indirection-for-cross-canadia.patch
>   delete mode 100644 meta/recipes-devtools/go/go-1.9/0009-cmd-go-buildmode-pie-forces-external-linking-mode-on.patch
>   delete mode 100644 meta/recipes-devtools/go/go-1.9/0010-make.bash-override-CC-when-building-dist-and-go_boot.patch
>   delete mode 100644 meta/recipes-devtools/go/go-1.9/set-external-linker.patch
>   rename meta/recipes-devtools/go/{go-cross-canadian_1.9.bb => go-cross-canadian_1.10.bb} (100%)
>   rename meta/recipes-devtools/go/{go-cross_1.9.bb => go-cross_1.10.bb} (100%)
>   rename meta/recipes-devtools/go/{go-crosssdk_1.9.bb => go-crosssdk_1.10.bb} (100%)
>   rename meta/recipes-devtools/go/{go-native_1.9.bb => go-native_1.10.bb} (100%)
>   rename meta/recipes-devtools/go/{go-runtime_1.9.bb => go-runtime_1.10.bb} (100%)
>   rename meta/recipes-devtools/go/{go_1.9.bb => go_1.10.bb} (100%)
> 

