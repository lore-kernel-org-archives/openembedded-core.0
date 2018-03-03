Return-Path: <matt@madison.systems>
Received: from mail-lf0-f65.google.com (mail-lf0-f65.google.com
	[209.85.215.65])
	by mail.openembedded.org (Postfix) with ESMTP id E163878974
	for <openembedded-core@lists.openembedded.org>;
	Sat,  3 Mar 2018 17:44:11 +0000 (UTC)
Received: by mail-lf0-f65.google.com with SMTP id i80so17665516lfg.5
	for <openembedded-core@lists.openembedded.org>;
	Sat, 03 Mar 2018 09:44:13 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=madison-systems.20150623.gappssmtp.com; s=20150623;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc; bh=ds0mYhrTCnzszny6dcb64TrE63AltGqtF3gaKD6iyR4=;
	b=MMbN42Kec/t04iw3tUzqGjuAPQqQ6ZEOSxpp8pDBGqkYEMkLC/AuhM5usB4rluNnCN
	Q7iDCZijUsN+ny751sXp0MiCUrAGmG0i+SiwW7bEPCQMXQcr63PuYtMxLxrdK88zkZVg
	YLDc00OJPoUDpKAGBuaRTp2WHx9xqsjXsY54QRwblwRi6oPLLEcQAe5LDTQfzrGB2RTc
	zGcrBspIcYByz0glkKYC6OX0L6ua0ux8saikoVTwuHsQe6zmadR6ckF0VrMoP6Ttl6be
	p93XegLEjwHBhEBM89f4GGNz2YPzIS3Whg18bL6kFxRPOo4Hp976yyOA0bmhx+N4R0Pv
	OXug==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc;
	bh=ds0mYhrTCnzszny6dcb64TrE63AltGqtF3gaKD6iyR4=;
	b=dlk0yR8wnTl9aiIG5Ycg8I2E3Y2ZV+IWiiDDi/bq+fiqzEsH5YUhigpkjh+9zlDuTO
	E55WU1trNwUVSFwR/S+367m5j+9/da3aiRtwBrpNrNzqwTEyUKdwUwS6HJG53P3QjyUx
	onKeMjoxiI6XDwsg2g/tjLOQdceuK63O0xQp023rVxtwVPKjdjdal/+sBUXV/NGHoPDU
	IdJjwXOPb9fe4we3wGrIE9bFc55G3Td3dDBEK7boGaxNmvC8XHhvFUgbcBc4pUtL8rg+
	mx8G1lJValGdpnDRHmywHkqMWpShjXGfOlbS70j9MIzfY9XAep+5evjH0mecn+UdLja4
	g2Fg==
X-Gm-Message-State: AElRT7GIrMV9SUa77GBcmage+QZU4sPYv5yB2euELJfd7MFkMKMEM0Fz
	p00rfQUwpblgcrD8x7xmmwj6Oo5Rj45BfAlI1lsnXQ==
X-Google-Smtp-Source: AG47ELtmOfNO3OgmcDwVTJcy5xTUthY2pT/juGaNZFZ0//EkoMw8PsUpswA08oNJOlnpUWIUt/OWXBP/pm8oGSB78GA=
X-Received: by 10.25.81.141 with SMTP id g13mr6129257lfl.19.1520099052502;
	Sat, 03 Mar 2018 09:44:12 -0800 (PST)
MIME-Version: 1.0
Received: by 10.25.156.131 with HTTP; Sat, 3 Mar 2018 09:44:11 -0800 (PST)
In-Reply-To: <876d96e7-1425-df8e-621c-b2dd3c263d88@gmail.com>
References: <20180302203314.32737-1-matt@madison.systems>
	<876d96e7-1425-df8e-621c-b2dd3c263d88@gmail.com>
From: Matt Madison <matt@madison.systems>
Date: Sat, 3 Mar 2018 09:44:11 -0800
Message-ID: <CAGgRHJoNhQTyVN7ww5BAoQLs1GPkxO3rsdujLttH8V-84vFiAw@mail.gmail.com>
To: Khem Raj <raj.khem@gmail.com>
Cc: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH v4 00/13] go1.10 update and misc improvements
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
X-List-Received-Date: Sat, 03 Mar 2018 17:44:12 -0000
Content-Type: text/plain; charset="UTF-8"

On Sat, Mar 3, 2018 at 8:40 AM, Khem Raj <raj.khem@gmail.com> wrote:
>
>
> On 3/2/18 12:33 PM, Matt Madison wrote:
>>
>> New in v4:
>>      * updated the go source patch to protect
>>        GOROOT to defer generating an error
>>        until a build action would try to update
>>        something in GOROOT
>>      * updated go.bbclass to compile for both
>>        static and dynamic linking, similar to
>>        go-runtime
>>      * fixed missing sign-off
>>
>> New in v3:
>>      * reduced one of the go source patches,
>>        eliminating an unneeded change (thanks
>>        Otavio)
>>      * Added bbclass and recipe patches to
>>        handle SECURITY_CFLAGS settings if
>>        they're enabled
>>      * Added go-runtime-staticdev to target-side
>>        SDK, needed for go static builds (fixes
>>        test case failure in oe-selftest)
>>      * two more minor cleanups
>>
>> New in v2:
>>      * Fixed Upstream-Status line in go patches
>>      * Added GOTMPDIR to do_configure[dirs]
>>
>> Updates to the go recipes and bbclasses for go1.10, which
>> moves the bulk of the toolchain bootstrap and build out
>> of the 'make.bash' script and to the 'dist' tool.  This
>> required a rework of the patches to the go source.
>>
>> go1.10 introduces significant changes to the go build
>> tool as well, requiring some further patches to make
>> it work for OE builds.
>>
>> See https://golang.org/doc/go1.10 for a complete list
>> of new features and changes.
>>
>> Following the update are some cleanup/improvement
>> patches.
>>
>
> this patchset is addressing all previously reported issues so thanks for
> fixing them, I am now running into runtime crash issues on aarch64
> especially with influxdb but then influxdb does not claim go 1.10 support.
> That also raises a question if 1.9 should be kept along for a release for
> 1.10 migration path to get some more time. I would support keeping both for
> 2.5 release.

If there's general agreement on keeping both, I could see about
reworking the patch set to leave 1.9 in place.

> Additionally, I have sent couple of patches on top of this series which
> address a build issue I was seeing on aarch64 and introduces a class to use
> godep tool.

Since it looks like I'll have to do a v5 on my series anyway, I can
pull in that backport for the aarch64 issue.

Thanks,
-Matt

>
>
>> Matt Madison (13):
>>    go: update go 1.9 -> go 1.10
>>    go: set GOMIPS envrionment variable
>>    go.bbclass: rename GO_TMPDIR -> GOTMPDIR
>>    go.bbclass: remove debug-related commands
>>    go.bbclass: don't stage test data with sources
>>    go.bbclass: ptest cleanup and improvements
>>    goarch.bbclass: disable shared runtime for nativesdk builds
>>    go: move common settings to go-common.inc
>>    go.bbclass, goarch.bbclass: update SECURITY_CFLAGS
>>    go: disable PIE CFLAGS for nativesdk and cross-canadian builds
>>    packagegroup-go-sdk-target: add go-runtime-staticdev
>>    go-runtime: remove unneeded nativesdk override, rename variable
>>    go-cross-canadian: remove verbosity setting from GO_LDFLAGS
>>
>>   meta/classes/go.bbclass                            | 112 +++++----
>>   meta/classes/goarch.bbclass                        |  13 +
>>   .../packagegroups/packagegroup-go-sdk-target.bb    |   1 +
>>   meta/recipes-devtools/go/go-1.10.inc               |  21 ++
>>   ...1-allow-CC-and-CXX-to-have-multiple-words.patch |  33 +++
>>   ...-content-based-hash-generation-less-pedan.patch | 220
>> ++++++++++++++++
>>   ...OLDIR-to-be-overridden-in-the-environment.patch |  64 +++++
>>   .../0004-ld-add-soname-to-shareable-objects.patch  |  47 ++++
>>   ...verride-CC-when-building-dist-and-go_boot.patch |  40 +++
>>   ...-cmd-dist-separate-host-and-target-builds.patch | 277
>> +++++++++++++++++++++
>>   ...07-cmd-go-make-GOROOT-precious-by-default.patch | 108 ++++++++
>>   ...ld-replace-glibc-dynamic-linker-with-musl.patch | 130 ++++++++++
>>   meta/recipes-devtools/go/go-1.9.inc                |  26 --
>>   .../0001-make.bash-quote-CC_FOR_TARGET.patch       |  32 ---
>>   ...CC-and-CXX-environment-variable-construct.patch |  67 -----
>>   ...sh-better-separate-host-and-target-builds.patch |  92 -------
>>   ...w-GOTOOLDIR-to-be-overridden-in-the-envir.patch |  68 -----
>>   ...05-cmd-go-make-GOROOT-precious-by-default.patch |  41 ---
>>   ...dd-GOTOOLDIR_BOOTSTRAP-environment-variab.patch |  36 ---
>>   .../0007-ld-add-soname-to-shareable-objects.patch  |  46 ----
>>   ...dd-GOHOSTxx-indirection-for-cross-canadia.patch |  33 ---
>>   ...dmode-pie-forces-external-linking-mode-on.patch |  47 ----
>>   ...verride-CC-when-building-dist-and-go_boot.patch |  43 ----
>>   .../go/go-1.9/set-external-linker.patch            | 111 ---------
>>   meta/recipes-devtools/go/go-common.inc             |   6 +
>>   meta/recipes-devtools/go/go-cross-canadian.inc     |  26 +-
>>   ...s-canadian_1.9.bb => go-cross-canadian_1.10.bb} |   0
>>   meta/recipes-devtools/go/go-cross.inc              |  56 ++---
>>   .../go/{go-cross_1.9.bb => go-cross_1.10.bb}       |   0
>>   meta/recipes-devtools/go/go-crosssdk.inc           |  14 +-
>>   .../go/{go-crosssdk_1.9.bb => go-crosssdk_1.10.bb} |   0
>>   meta/recipes-devtools/go/go-native.inc             |  25 +-
>>   .../go/{go-native_1.9.bb => go-native_1.10.bb}     |   0
>>   meta/recipes-devtools/go/go-runtime.inc            |  56 ++---
>>   .../go/{go-runtime_1.9.bb => go-runtime_1.10.bb}   |   0
>>   meta/recipes-devtools/go/go-target.inc             |  24 +-
>>   meta/recipes-devtools/go/{go_1.9.bb => go_1.10.bb} |   0
>>   37 files changed, 1110 insertions(+), 805 deletions(-)
>>   create mode 100644 meta/recipes-devtools/go/go-1.10.inc
>>   create mode 100644
>> meta/recipes-devtools/go/go-1.10/0001-allow-CC-and-CXX-to-have-multiple-words.patch
>>   create mode 100644
>> meta/recipes-devtools/go/go-1.10/0002-cmd-go-make-content-based-hash-generation-less-pedan.patch
>>   create mode 100644
>> meta/recipes-devtools/go/go-1.10/0003-allow-GOTOOLDIR-to-be-overridden-in-the-environment.patch
>>   create mode 100644
>> meta/recipes-devtools/go/go-1.10/0004-ld-add-soname-to-shareable-objects.patch
>>   create mode 100644
>> meta/recipes-devtools/go/go-1.10/0005-make.bash-override-CC-when-building-dist-and-go_boot.patch
>>   create mode 100644
>> meta/recipes-devtools/go/go-1.10/0006-cmd-dist-separate-host-and-target-builds.patch
>>   create mode 100644
>> meta/recipes-devtools/go/go-1.10/0007-cmd-go-make-GOROOT-precious-by-default.patch
>>   create mode 100644
>> meta/recipes-devtools/go/go-1.10/0008-ld-replace-glibc-dynamic-linker-with-musl.patch
>>   delete mode 100644 meta/recipes-devtools/go/go-1.9.inc
>>   delete mode 100644
>> meta/recipes-devtools/go/go-1.9/0001-make.bash-quote-CC_FOR_TARGET.patch
>>   delete mode 100644
>> meta/recipes-devtools/go/go-1.9/0002-cmd-go-fix-CC-and-CXX-environment-variable-construct.patch
>>   delete mode 100644
>> meta/recipes-devtools/go/go-1.9/0003-make.bash-better-separate-host-and-target-builds.patch
>>   delete mode 100644
>> meta/recipes-devtools/go/go-1.9/0004-cmd-go-allow-GOTOOLDIR-to-be-overridden-in-the-envir.patch
>>   delete mode 100644
>> meta/recipes-devtools/go/go-1.9/0005-cmd-go-make-GOROOT-precious-by-default.patch
>>   delete mode 100644
>> meta/recipes-devtools/go/go-1.9/0006-make.bash-add-GOTOOLDIR_BOOTSTRAP-environment-variab.patch
>>   delete mode 100644
>> meta/recipes-devtools/go/go-1.9/0007-ld-add-soname-to-shareable-objects.patch
>>   delete mode 100644
>> meta/recipes-devtools/go/go-1.9/0008-make.bash-add-GOHOSTxx-indirection-for-cross-canadia.patch
>>   delete mode 100644
>> meta/recipes-devtools/go/go-1.9/0009-cmd-go-buildmode-pie-forces-external-linking-mode-on.patch
>>   delete mode 100644
>> meta/recipes-devtools/go/go-1.9/0010-make.bash-override-CC-when-building-dist-and-go_boot.patch
>>   delete mode 100644
>> meta/recipes-devtools/go/go-1.9/set-external-linker.patch
>>   rename meta/recipes-devtools/go/{go-cross-canadian_1.9.bb =>
>> go-cross-canadian_1.10.bb} (100%)
>>   rename meta/recipes-devtools/go/{go-cross_1.9.bb => go-cross_1.10.bb}
>> (100%)
>>   rename meta/recipes-devtools/go/{go-crosssdk_1.9.bb =>
>> go-crosssdk_1.10.bb} (100%)
>>   rename meta/recipes-devtools/go/{go-native_1.9.bb => go-native_1.10.bb}
>> (100%)
>>   rename meta/recipes-devtools/go/{go-runtime_1.9.bb =>
>> go-runtime_1.10.bb} (100%)
>>   rename meta/recipes-devtools/go/{go_1.9.bb => go_1.10.bb} (100%)
>>
>

