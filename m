Return-Path: <akuster808@gmail.com>
Received: from mail-pf0-f170.google.com (mail-pf0-f170.google.com
	[209.85.192.170])
	by mail.openembedded.org (Postfix) with ESMTP id C9B0B77A02
	for <openembedded-core@lists.openembedded.org>;
	Fri, 17 Mar 2017 03:01:01 +0000 (UTC)
Received: by mail-pf0-f170.google.com with SMTP id w189so33156014pfb.0
	for <openembedded-core@lists.openembedded.org>;
	Thu, 16 Mar 2017 20:01:03 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=subject:to:references:from:message-id:date:user-agent:mime-version
	:in-reply-to; bh=V/CofLdnOMW0+NslsT3hqxql//X2iOigMG1UxyN0WgM=;
	b=uFDkzWyv21UOP7H0r8L3n8DoM+YzfYVWIhB2RaxmpHObRpQRC/rsWB9CmOtHwOsHOP
	wHis2cI5FzL/YAKrtiu8qXhNI/sDZasi7Uct+M3WNA1cTbyH/dMGfOSqDjcoXEXMSyw/
	zPBegmwwrQLSO1+VsbTEoupT+RU2i7CFDpTUDJ28+samF9p+huwvTYxMqVc8w5veX7mu
	B6IhQF4u07GFoS1m+povCA8dRWyFtN3+/z/zQXJXsiZfbwbCHweviMxZmMcMRqBVcqRY
	JZtvsmkwF0kGTeu0ngQPulvj0JeGNPxJLZBhk96/NCq2uiv2ueN1nm7H2aM0w3UGNyTJ
	eVxg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:subject:to:references:from:message-id:date
	:user-agent:mime-version:in-reply-to;
	bh=V/CofLdnOMW0+NslsT3hqxql//X2iOigMG1UxyN0WgM=;
	b=Ma0Ml7F3aTe7yYN/5qEz3HLu+uKUhdbQgixS2pr7p4nyxFgrzuuZYH8sD2zBQVD0Yb
	u4f9mu0qeBuIHqCfkPOGxzr4SPIbYYJ0Ccfeyyw7hIghh5UN7MITNmR4/lm4KNIivVUo
	11pxZOEby61BwVOU2PGAB+VpzLT0c9+P37v2FhgbjrWgcwqRibk62wRWEXKd2loXjodN
	wO699Cy/vfmzBI4EGKiXFeaY0mO61ZsVyb3cgPAT9Uz0MCBLMtB+2C1NJmcLcS0cUnCL
	V6EeCxX33b+ZgfSBf9Tcp2VDD+XxpGcib3n2jV2yQgiAir5824Mpf4Y35guWZ7QK6WU0
	tWDA==
X-Gm-Message-State: AFeK/H1QWTwpAc9jMjFNlTU34EKHjLYcmjc4SNaybaYioF1Ap/ymWV1Tyom7Oxv1hAo01g==
X-Received: by 10.99.116.10 with SMTP id p10mr13491168pgc.74.1489719662562;
	Thu, 16 Mar 2017 20:01:02 -0700 (PDT)
Received: from [10.5.7.41] ([223.196.115.131])
	by smtp.gmail.com with ESMTPSA id
	t12sm13021667pfg.14.2017.03.16.20.01.00
	for <openembedded-core@lists.openembedded.org>
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Thu, 16 Mar 2017 20:01:01 -0700 (PDT)
To: openembedded-core@lists.openembedded.org
References: <20170316233429.GA3293@jama>
From: akuster808 <akuster808@gmail.com>
Message-ID: <6268d24d-c246-d835-b744-c18565be0fd9@gmail.com>
Date: Thu, 16 Mar 2017 20:00:58 -0700
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:45.0) Gecko/20100101
	Thunderbird/45.7.0
MIME-Version: 1.0
In-Reply-To: <20170316233429.GA3293@jama>
Subject: Re: State of bitbake world, Failed tasks 2017-03-15
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
X-List-Received-Date: Fri, 17 Mar 2017 03:01:05 -0000
Content-Type: multipart/alternative;
	boundary="------------41E1392A09F85E9B92EF0AC4"

--------------41E1392A09F85E9B92EF0AC4
Content-Type: text/plain; charset=windows-1252; format=flowed
Content-Transfer-Encoding: 7bit



On 03/16/2017 04:34 PM, Martin Jansa wrote:
> == Number of issues - stats ==
> {| class='wikitable'
> !|Date		     !!colspan='3'|Failed tasks			    !!colspan='6'|Failed depencencies			 !!|Signatures		  !!colspan='12'|QA !!Comment
> |-
> ||		||qemuarm	||qemux86	||qemux86_64	||qemuarm||max||min	||qemux86||max||min	||all 	||already-stripped	||libdir	||textrel	||build-deps	||file-rdeps	||version-going-backwards	||host-user-contaminated	||installed-vs-shipped	||unknown-configure-option	||symlink-to-sysroot	||invalid-pkgconfig	||pkgname	||	
> |-
> ||2017-03-15	||4	||4	||4	||N/A	||N/A	||N/A	||N/A	||N/A	||N/A	||0	||0		||0		||4		||0		||0		||0		||2		||0		||0		||0		||0		||0		||	
> |}
>
> http://www.openembedded.org/wiki/Bitbake_World_Status
>
> == Failed tasks 2017-03-15 ==
>
> INFO: jenkins-job.sh-1.8.19 Complete log available at http://logs.nslu2-linux.org/buildlogs/oe/world/pyro/log.report.20170316_132623.log
>
> === common (3) ===
>      * meta-openembedded/meta-oe/recipes-support/devmem2/devmem2.bb:do_patch
>      * meta-openembedded/meta-perl/recipes-perl/libnet/libnet-ssleay-perl_1.65.bb:do_configure
will take a look as this failure.
-armin
>      * virtual:native:meta-openembedded/meta-efl/recipes-efl/efl/efl_1.15.1.bb:do_compile
>
> === common-x86 (1) ===
>      * meta-openembedded/meta-oe/recipes-support/vboxguestdrivers/vboxguestdrivers_5.1.14.bb:do_install
>
> === qemuarm (1) ===
>      * meta-qt5/recipes-connectivity/libqofono/libqofono_git.bb:do_compile
>
> === qemux86 (0) ===
>
> === qemux86_64 (0) ===
>
> === Number of failed tasks (12) ===
> {| class=wikitable
> |-
> || qemuarm 	|| 4	 || http://logs.nslu2-linux.org/buildlogs/oe/world/pyro/log.world.qemuarm.20170314_100521.log/ || http://errors.yoctoproject.org/Errors/Build/33915/
> |-
> || qemux86 	|| 4	 || http://logs.nslu2-linux.org/buildlogs/oe/world/pyro/log.world.qemux86.20170314_115504.log/ || http://errors.yoctoproject.org/Errors/Build/33916/
> |-
> || qemux86_64 	|| 4	 || http://logs.nslu2-linux.org/buildlogs/oe/world/pyro/log.world.qemux86-64.20170315_125349.log/ || http://errors.yoctoproject.org/Errors/Build/34634/
> |}
>
> === PNBLACKLISTs (351) ===
>
> === QA issues (6) ===
> {| class=wikitable
> !| Count		||Issue
> |-
> ||0	||already-stripped
> |-
> ||0	||build-deps
> |-
> ||0	||file-rdeps
> |-
> ||0	||installed-vs-shipped
> |-
> ||0	||invalid-pkgconfig
> |-
> ||0	||libdir
> |-
> ||0	||pkgname
> |-
> ||0	||symlink-to-sysroot
> |-
> ||0	||unknown-configure-option
> |-
> ||0	||version-going-backwards
> |-
> ||2	||host-user-contaminated
> |-
> ||4	||textrel
> |}
>
>
>
> === Incorrect PACKAGE_ARCH or sstate signatures (0) ===
>
> Complete log: http://logs.nslu2-linux.org/buildlogs/oe/world/pyro/log.signatures.20170315_080310.log/
>
> No issues detected
>
> == Tested changes (not included in master yet) - bitbake ==
> latest upstream commit:
> e455e40 toaster: resolve missing 'native[sdk]:' prefixes
> not included in master yet:
> 7b8d726 world-image: add extra target
>
> == Tested changes (not included in master yet) - openembedded-core ==
> latest upstream commit:
> 477805b wic: selftest: account for occasional newline in debugfs file names
> not included in master yet:
> ea4cfd5 qemux86: Add identical qemux86copy variant for tests
> 2b668d7 sstate-sysroot-cruft.sh: Extend the whitelist
> 20180be recipes: Replace "cp -a" with "cp -R --no-dereference --preserve=mode,links"
> 9e09509 buildhistory.bbclass: metadata-revs show repo parent
> 997fdda metadata-revs: provide more information
> b8a5ee2 report-error: Allow to upload reports automatically
> 9eee58b rm_work: restore old rm_work_all
> 830f53e Revert "rm_work: restore old rm_work_all"
> 4126661 Revert "rm_work.bbclass: clean up sooner"
> b96ea1d bitbake.conf: Add few more binaries to HOSTTOOLS_NONFATAL
> 6f9a0ae bitbake.conf: Temporary add few more binaries to HOSTTOOLS_NONFATAL
>
> == Tested changes (not included in master yet) - meta-openembedded ==
> latest upstream commit:
> 1dff235 vim: add native BBCLASSEXTEND
> not included in master yet:
> 0fa3a88 netcat-openbsd: fix implicit dependency on pkg-config
> d27cf15 inetutils: Move files only when src != dst.
> 2889a9e ebtables: Move files only when src != dst.
> ec34e51 netcf_git: Check if src != dst while moving files.
> 0e1b685 dnsmasq: add info for port setting
> b80d8ce dnsmasq: disable the service by default
> 8712656 ptpd: add pkgconfig to inherit
> 7faad88 samba: update tevent_internal.h
> f25452b wireshark: update to 2.2.5
> 5f24fb9 postfix: remove references to buildmachine paths in target makedefs.out
> 8ed26e0 chrony: fix build failure for arma9
> 1a6700c libcec: update to version 4.0.1 and provide package for python3 wrapper
> 47f7f79 meson: Update to 0.37.1
> 14e8457 meson.bbclass: Add support for more standard installation directories
> ae60e0d meson.bbclass: Make changes to meson.build files trigger reconfiguration
> b2b8e3e meson.bbclass: Support building for native
> ea83fbc meson.bbclass: Use the correct C++ compiler when cross compiling
> 8055f63 lvm2: fix bash depends QA issue
> b4173fc python-pyserial: update to version 3.3
> 135418c fuse: update HOMEPAGE and SRC_URI
> 2829912 curlpp: update HOMEPAGE and SRC_URI
> 4902e90 libdnet: update SRC_URI
> 41a056d cherokee: update SRC_URI
> deacf40 lmsensors: update SRC_URI and S
> da983d9 recipes: delete obsolete patches
> 4cae8ae meta: do not prepend/append to BBCLASSEXTEND
> a08f230 toybox: Fix configure failure
> 8cdc920 toybox: Upgrade to 0.7.3
> cdf1f00 luajit: test SITEINFO_BITS instead of maintaining a list of 32bit targets
> dfca01b acpica: moved to OE-core
> 493978b devmem2: use different filename to avoid checksum conflicts
> 735a7b5 vim: Update to 8.0.0427
> fe056aa efl: append -fPIC only for target builds
> 2edb15b scsirastools: add dependency on groff-native
> 871b5b9 openflow: add dependency on openssl-native
> b89e68a lprng: disable clear support
>
> == Tested changes (not included in master yet) - meta-qt5 ==
> latest upstream commit:
> 9927aac qtbase: PACKAGECONFIG[gtk] change gtk+ -> gtk+3 in dependencies
> not included in master yet:
> 4f44a57 packagegroup-qt5-toolchain-target: Add QtSerialBus to meta-toolchain-qt5.
> abc89e9 qtbase-native; do not build qdbuscpp2xml and qdbusxml2cpp bootstrapped
> bd2258f packagegroup-qt5-toolchain-target: add qtquickcontrols2 package
> 18603cd qtwebengine: show progress for do_compile
>
> == Tested changes (not included in master yet) - meta-browser ==
> latest upstream commit:
> 021a954 chromium-browser: add missing dependency on gperf-native
> not included in master yet:
> a9dd704 chromium: disable generate_character_data for x86
>
> == Tested changes (not included in master yet) - meta-webos-ports ==
> latest upstream commit:
> 4d4ffcb packagegroup-luneos-extended: drop qtscenegraph-adaptation
> not included in master yet:
>
> == Tested changes (not included in master yet) - meta-smartphone ==
> latest upstream commit:
> e39c265 android-system-image: fix builds that don't have overlay-libs
> not included in master yet:
>
>


--------------41E1392A09F85E9B92EF0AC4
Content-Type: text/html; charset=windows-1252
Content-Transfer-Encoding: 7bit

<html>
  <head>
    <meta content="text/html; charset=windows-1252"
      http-equiv="Content-Type">
  </head>
  <body bgcolor="#FFFFFF" text="#000000">
    <p><br>
    </p>
    <br>
    <div class="moz-cite-prefix">On 03/16/2017 04:34 PM, Martin Jansa
      wrote:<br>
    </div>
    <blockquote cite="mid:20170316233429.GA3293@jama" type="cite">
      <pre wrap="">== Number of issues - stats ==
{| class='wikitable'
!|Date		     !!colspan='3'|Failed tasks			    !!colspan='6'|Failed depencencies			 !!|Signatures		  !!colspan='12'|QA !!Comment
|-
||		||qemuarm	||qemux86	||qemux86_64	||qemuarm||max||min	||qemux86||max||min	||all 	||already-stripped	||libdir	||textrel	||build-deps	||file-rdeps	||version-going-backwards	||host-user-contaminated	||installed-vs-shipped	||unknown-configure-option	||symlink-to-sysroot	||invalid-pkgconfig	||pkgname	||	
|-
||2017-03-15	||4	||4	||4	||N/A	||N/A	||N/A	||N/A	||N/A	||N/A	||0	||0		||0		||4		||0		||0		||0		||2		||0		||0		||0		||0		||0		||	
|}

<a class="moz-txt-link-freetext" href="http://www.openembedded.org/wiki/Bitbake_World_Status">http://www.openembedded.org/wiki/Bitbake_World_Status</a>

== Failed tasks 2017-03-15 ==

INFO: jenkins-job.sh-1.8.19 Complete log available at <a class="moz-txt-link-freetext" href="http://logs.nslu2-linux.org/buildlogs/oe/world/pyro/log.report.20170316_132623.log">http://logs.nslu2-linux.org/buildlogs/oe/world/pyro/log.report.20170316_132623.log</a>

=== common (3) ===
    * meta-openembedded/meta-oe/recipes-support/devmem2/devmem2.bb:do_patch
    * meta-openembedded/meta-perl/recipes-perl/libnet/libnet-ssleay-perl_1.65.bb:do_configure</pre>
    </blockquote>
    will take a look as this failure.<br>
    -armin<br>
    <blockquote cite="mid:20170316233429.GA3293@jama" type="cite">
      <pre wrap="">
    * virtual:native:meta-openembedded/meta-efl/recipes-efl/efl/efl_1.15.1.bb:do_compile

=== common-x86 (1) ===
    * meta-openembedded/meta-oe/recipes-support/vboxguestdrivers/vboxguestdrivers_5.1.14.bb:do_install

=== qemuarm (1) ===
    * meta-qt5/recipes-connectivity/libqofono/libqofono_git.bb:do_compile

=== qemux86 (0) ===

=== qemux86_64 (0) ===

=== Number of failed tasks (12) ===
{| class=wikitable
|-
|| qemuarm 	|| 4	 || <a class="moz-txt-link-freetext" href="http://logs.nslu2-linux.org/buildlogs/oe/world/pyro/log.world.qemuarm.20170314_100521.log/">http://logs.nslu2-linux.org/buildlogs/oe/world/pyro/log.world.qemuarm.20170314_100521.log/</a> || <a class="moz-txt-link-freetext" href="http://errors.yoctoproject.org/Errors/Build/33915/">http://errors.yoctoproject.org/Errors/Build/33915/</a>
|-
|| qemux86 	|| 4	 || <a class="moz-txt-link-freetext" href="http://logs.nslu2-linux.org/buildlogs/oe/world/pyro/log.world.qemux86.20170314_115504.log/">http://logs.nslu2-linux.org/buildlogs/oe/world/pyro/log.world.qemux86.20170314_115504.log/</a> || <a class="moz-txt-link-freetext" href="http://errors.yoctoproject.org/Errors/Build/33916/">http://errors.yoctoproject.org/Errors/Build/33916/</a>
|-
|| qemux86_64 	|| 4	 || <a class="moz-txt-link-freetext" href="http://logs.nslu2-linux.org/buildlogs/oe/world/pyro/log.world.qemux86-64.20170315_125349.log/">http://logs.nslu2-linux.org/buildlogs/oe/world/pyro/log.world.qemux86-64.20170315_125349.log/</a> || <a class="moz-txt-link-freetext" href="http://errors.yoctoproject.org/Errors/Build/34634/">http://errors.yoctoproject.org/Errors/Build/34634/</a>
|}

=== PNBLACKLISTs (351) ===

=== QA issues (6) ===
{| class=wikitable
!| Count		||Issue
|-
||0	||already-stripped
|-
||0	||build-deps
|-
||0	||file-rdeps
|-
||0	||installed-vs-shipped
|-
||0	||invalid-pkgconfig
|-
||0	||libdir
|-
||0	||pkgname
|-
||0	||symlink-to-sysroot
|-
||0	||unknown-configure-option
|-
||0	||version-going-backwards
|-
||2	||host-user-contaminated
|-
||4	||textrel
|}



=== Incorrect PACKAGE_ARCH or sstate signatures (0) ===

Complete log: <a class="moz-txt-link-freetext" href="http://logs.nslu2-linux.org/buildlogs/oe/world/pyro/log.signatures.20170315_080310.log/">http://logs.nslu2-linux.org/buildlogs/oe/world/pyro/log.signatures.20170315_080310.log/</a>

No issues detected

== Tested changes (not included in master yet) - bitbake ==
latest upstream commit: 
e455e40 toaster: resolve missing 'native[sdk]:' prefixes
not included in master yet: 
7b8d726 world-image: add extra target

== Tested changes (not included in master yet) - openembedded-core ==
latest upstream commit: 
477805b wic: selftest: account for occasional newline in debugfs file names
not included in master yet: 
ea4cfd5 qemux86: Add identical qemux86copy variant for tests
2b668d7 sstate-sysroot-cruft.sh: Extend the whitelist
20180be recipes: Replace "cp -a" with "cp -R --no-dereference --preserve=mode,links"
9e09509 buildhistory.bbclass: metadata-revs show repo parent
997fdda metadata-revs: provide more information
b8a5ee2 report-error: Allow to upload reports automatically
9eee58b rm_work: restore old rm_work_all
830f53e Revert "rm_work: restore old rm_work_all"
4126661 Revert "rm_work.bbclass: clean up sooner"
b96ea1d bitbake.conf: Add few more binaries to HOSTTOOLS_NONFATAL
6f9a0ae bitbake.conf: Temporary add few more binaries to HOSTTOOLS_NONFATAL

== Tested changes (not included in master yet) - meta-openembedded ==
latest upstream commit: 
1dff235 vim: add native BBCLASSEXTEND
not included in master yet: 
0fa3a88 netcat-openbsd: fix implicit dependency on pkg-config
d27cf15 inetutils: Move files only when src != dst.
2889a9e ebtables: Move files only when src != dst.
ec34e51 netcf_git: Check if src != dst while moving files.
0e1b685 dnsmasq: add info for port setting
b80d8ce dnsmasq: disable the service by default
8712656 ptpd: add pkgconfig to inherit
7faad88 samba: update tevent_internal.h
f25452b wireshark: update to 2.2.5
5f24fb9 postfix: remove references to buildmachine paths in target makedefs.out
8ed26e0 chrony: fix build failure for arma9
1a6700c libcec: update to version 4.0.1 and provide package for python3 wrapper
47f7f79 meson: Update to 0.37.1
14e8457 meson.bbclass: Add support for more standard installation directories
ae60e0d meson.bbclass: Make changes to meson.build files trigger reconfiguration
b2b8e3e meson.bbclass: Support building for native
ea83fbc meson.bbclass: Use the correct C++ compiler when cross compiling
8055f63 lvm2: fix bash depends QA issue
b4173fc python-pyserial: update to version 3.3
135418c fuse: update HOMEPAGE and SRC_URI
2829912 curlpp: update HOMEPAGE and SRC_URI
4902e90 libdnet: update SRC_URI
41a056d cherokee: update SRC_URI
deacf40 lmsensors: update SRC_URI and S
da983d9 recipes: delete obsolete patches
4cae8ae meta: do not prepend/append to BBCLASSEXTEND
a08f230 toybox: Fix configure failure
8cdc920 toybox: Upgrade to 0.7.3
cdf1f00 luajit: test SITEINFO_BITS instead of maintaining a list of 32bit targets
dfca01b acpica: moved to OE-core
493978b devmem2: use different filename to avoid checksum conflicts
735a7b5 vim: Update to 8.0.0427
fe056aa efl: append -fPIC only for target builds
2edb15b scsirastools: add dependency on groff-native
871b5b9 openflow: add dependency on openssl-native
b89e68a lprng: disable clear support

== Tested changes (not included in master yet) - meta-qt5 ==
latest upstream commit: 
9927aac qtbase: PACKAGECONFIG[gtk] change gtk+ -&gt; gtk+3 in dependencies
not included in master yet: 
4f44a57 packagegroup-qt5-toolchain-target: Add QtSerialBus to meta-toolchain-qt5.
abc89e9 qtbase-native; do not build qdbuscpp2xml and qdbusxml2cpp bootstrapped
bd2258f packagegroup-qt5-toolchain-target: add qtquickcontrols2 package
18603cd qtwebengine: show progress for do_compile

== Tested changes (not included in master yet) - meta-browser ==
latest upstream commit: 
021a954 chromium-browser: add missing dependency on gperf-native
not included in master yet: 
a9dd704 chromium: disable generate_character_data for x86

== Tested changes (not included in master yet) - meta-webos-ports ==
latest upstream commit: 
4d4ffcb packagegroup-luneos-extended: drop qtscenegraph-adaptation
not included in master yet: 

== Tested changes (not included in master yet) - meta-smartphone ==
latest upstream commit: 
e39c265 android-system-image: fix builds that don't have overlay-libs
not included in master yet: 
</pre>
      <br>
      <fieldset class="mimeAttachmentHeader"></fieldset>
      <br>
    </blockquote>
    <br>
  </body>
</html>

--------------41E1392A09F85E9B92EF0AC4--
