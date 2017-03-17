Return-Path: <akuster808@gmail.com>
Received: from mail-pg0-f51.google.com (mail-pg0-f51.google.com [74.125.83.51])
	by mail.openembedded.org (Postfix) with ESMTP id 4E43B779F9
	for <openembedded-core@lists.openembedded.org>;
	Fri, 17 Mar 2017 03:15:17 +0000 (UTC)
Received: by mail-pg0-f51.google.com with SMTP id b129so34293145pgc.2
	for <openembedded-core@lists.openembedded.org>;
	Thu, 16 Mar 2017 20:15:19 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=subject:to:references:from:message-id:date:user-agent:mime-version
	:in-reply-to; bh=tGMxooM7TRyKKXZ1o+kWtP5kN33DCGiPxXP/T/+iWRI=;
	b=cLGxNqYVxoRc6F0J3tVkX3ZEJ0+1byUqkN58JpHXlo5Z/4+CsWhndgtGhPsKwFaIMa
	cuwGn0JQSmxXw5htWO/v7ycf9YlawOCPbmnkH4w7VdC1G4/qmyPq3S+v5AG7q02SQbYy
	6nIbh1ToHeMNs6o20GamItNdOFDW4316w9Xv9Ixm44cBpq/RMq83KjK0CvE2ajifqMns
	LZ72AY3QSLrBiOAWjs7JUIdmw+NbzIazWCjRwy6DY1jlFPdEh1kj64lEKnEh6vfbKDtp
	RzWTiAgq4Fyvzc2s3/MN6kRa/yFlDe1nbugXRpenQA2JYZyOTuQ9uqvWepa/z6DlAjw7
	S19A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:subject:to:references:from:message-id:date
	:user-agent:mime-version:in-reply-to;
	bh=tGMxooM7TRyKKXZ1o+kWtP5kN33DCGiPxXP/T/+iWRI=;
	b=qTVtim/BMed/D/+OhqfDjU1iyNmbxgK6xfnzK3zvncTlA+FC4xCrh8V3xsv3t7hT7u
	cthBO809dIvRQquZKphB/kxxPaPzd/GmWqF49fU6fUckbG3K+vo8H0nD7zOTpP3+YQCl
	SMKXQZZM0jExvVCvLWFiP8IqKB35tYIZeabl7FnGwaqv1F3qlYp9qAsbBk06XZvL5oeO
	J9W0Q6rs7teVA80pIBskrLO9GWJFWxIWYWL4BmqqCNVc9vVqrsg7tjz6FTiXInTcm82G
	UfyJ5udBdhAbidR6/ezIrS2GY3rAuNX0NXo3GWD26djM/cWBNEJxbin2D1R1/dDxOF9m
	W4CQ==
X-Gm-Message-State: AFeK/H2DnhzLAgwADWRmjVbfXzgQ11C0zONYQWGf2+E1umwaLRdiAHN67FPH/fWyj/kHDA==
X-Received: by 10.99.210.81 with SMTP id t17mr13808040pgi.80.1489720518927;
	Thu, 16 Mar 2017 20:15:18 -0700 (PDT)
Received: from [10.5.7.41] ([223.196.115.131])
	by smtp.gmail.com with ESMTPSA id
	132sm13138135pgf.27.2017.03.16.20.15.17
	for <openembedded-core@lists.openembedded.org>
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Thu, 16 Mar 2017 20:15:18 -0700 (PDT)
To: openembedded-core@lists.openembedded.org
References: <20170316233429.GA3293@jama>
From: akuster808 <akuster808@gmail.com>
Message-ID: <9f57e4e7-470f-3c18-1ad6-6464248565e7@gmail.com>
Date: Thu, 16 Mar 2017 20:15:14 -0700
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
X-List-Received-Date: Fri, 17 Mar 2017 03:15:18 -0000
Content-Type: multipart/alternative;
	boundary="------------C6AA02821F935A62D356E43F"

--------------C6AA02821F935A62D356E43F
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
correction. version 1.80 is now in master-next but not listed below as 
not being included so I am am going to ignore this issue for now.
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


--------------C6AA02821F935A62D356E43F
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
    correction. version 1.80 is now in master-next but not listed below
    as not being included so I am am going to ignore this issue for now.<br>
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

--------------C6AA02821F935A62D356E43F--
