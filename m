Return-Path: <akuster808@gmail.com>
Received: from mail-pa0-f66.google.com (mail-pa0-f66.google.com
	[209.85.220.66])
	by mail.openembedded.org (Postfix) with ESMTP id 0932E62136
	for <openembedded-core@lists.openembedded.org>;
	Sun, 22 May 2016 22:13:38 +0000 (UTC)
Received: by mail-pa0-f66.google.com with SMTP id xm6so16006523pab.3
	for <openembedded-core@lists.openembedded.org>;
	Sun, 22 May 2016 15:13:39 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=subject:to:references:from:message-id:date:user-agent:mime-version
	:in-reply-to:content-transfer-encoding;
	bh=aVEzows3it3Z+9iMAbikE4I8zKJIVHFhf9cCTxj1B+g=;
	b=jn3qFOMRBEfIJLrEf3YcwCxx0Yjs9KjaudmEdMrnHQ1YC5B5z95UZ5j8UtKj/96otL
	ypE6hAKePPJMt4pEISJvRY/v5+bi7v+Sjj1DcTR8N1YSi8TFF2m5oTumNEjcBklYHytj
	HGh37NwbL/28yzC5U6qSEh0vZk0q+o2Im21XfL9I7G+7kpIBy7sopLRHvYgKHSruQXX7
	SjUQDXPkBcBU2gi8hJ7iqKs9M2shLJQfIK6x4lkl7IxVDPGF65/z1MdV9RfgqyVs27Ka
	vTT8zjoBt26wNBd8ozl0h681hJJ3jANDFMyhbJ+IZllE+xF6LSyqZIfPJhtBgSDDI528
	zilw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:subject:to:references:from:message-id:date
	:user-agent:mime-version:in-reply-to:content-transfer-encoding;
	bh=aVEzows3it3Z+9iMAbikE4I8zKJIVHFhf9cCTxj1B+g=;
	b=bfD2WDckmnJvVAaStiaGZ2rXEnvsL/R3IGnxY90Z/T9NXvarMRKqiDedRBJDjnOtwp
	ro1v8iuAwOruRmHuJqn5JyaetZHJcq3TQmNfDMNkMjH4g+gUfB9i07P/I+3znIZEvdnq
	2yJCldgVNgJPgccz1EwJiDqbpTHMEIOHEqwqwyBJb0cg2BohYTyLfT0xcFBeledxtYTI
	jr0HAzOjsueApZ6vm4aL51zjcmRI78lEj7QuLcPnuRZpnP2kV9YCF7SUBRGqptLNZdIi
	ttpqbMr077XOUHETsrIJ5i1qKxiPLT9bHZbI2d4fqLDCjw2fAuG9tEQL7DKkh2i1X5XD
	tIbQ==
X-Gm-Message-State: AOPr4FVHXTh1bAIgLCWPy++Ti+Ho4U7Jrwyl/s1ssNYBbJpnuCrVFvyVJ0BbhCsKhmQHcA==
X-Received: by 10.67.14.68 with SMTP id fe4mr22520062pad.93.1463955219365;
	Sun, 22 May 2016 15:13:39 -0700 (PDT)
Received: from Akusters-laptop.local (c-76-20-92-207.hsd1.ca.comcast.net.
	[76.20.92.207]) by smtp.googlemail.com with ESMTPSA id
	n190sm41467731pfn.23.2016.05.22.15.13.37
	(version=TLSv1/SSLv3 cipher=OTHER);
	Sun, 22 May 2016 15:13:37 -0700 (PDT)
To: Richard Purdie <richard.purdie@linuxfoundation.org>,
	openembedded-core@lists.openembedded.org
References: <cover.1463330208.git.akuster@mvista.com>
	<1463514221.4578.23.camel@linuxfoundation.org>
From: akuster808 <akuster808@gmail.com>
Message-ID: <e02d0891-dbd8-ada5-9fe2-332ec8c4d5e8@gmail.com>
Date: Sun, 22 May 2016 15:13:58 -0700
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.11; rv:45.0)
	Gecko/20100101 Thunderbird/45.1.0
MIME-Version: 1.0
In-Reply-To: <1463514221.4578.23.camel@linuxfoundation.org>
Subject: Re: [PATCH 00/98] Pull request: Krogoth-next
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
X-List-Received-Date: Sun, 22 May 2016 22:13:39 -0000
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 8bit

On 5/17/16 12:43 PM, Richard Purdie wrote:
> On Sun, 2016-05-15 at 09:47 -0700, Armin Kuster wrote:
>> From: Armin Kuster <akuster@mvista.com>
>>
>> Please consider these changes for the next krogoth release.
>>
>> Built & testimage on all qemu targets
> Thanks, I had a few questions about some of these below.
>
>> Note[1]: qemu update pending AB build and review
>> Note[2]: need to reconcile [master][krogoth] patches
> What does this mean?

There are several [master][krogoth] patches that are no yet in master.

>
>> Note[3]: built world on meta-openembedded krogoth-next series, no
>> unexpected issues
>> The following changes since commit
>> 75ca53211488a3e268037a44ee2a7ac5c7181bd2:
>>
>>   bitbake: toaster: fix progress bar in MySQL environment (2016-05-13
>> 17:45:58 +0100)
>>
>> are available in the git repository at:
>>
>>   git://git.yoctoproject.org/poky-contrib akuster/krogoth-next
>>   http://git.yoctoproject.org/cgit.cgi/poky-contrib/log/?h=akuster/kr
>> ogoth-next
>>
>> Alexander D. Kanevskiy (1):
>>   image.bbclass: don't execute compression commands multiple times
>>
>> Alexander Kanavin (1):
>>   arch-powerpc64.inc: disable the use of qemu usermode on ppc64
>>
>> Anders Darander (1):
>>   lib/oe/rootfs: Fix DEBUGFS generation for opkg & openssl-cnf
>>
>> Andre McCurdy (1):
>>   image.bbclass: don't emit redundant IMAGE_CMD_xxx functions
>>
>> André Draszik (2):
>>   gdb: fix QA warning (uClibc)
>>   feature-arm-neon.inc: restore vfpv3-d16 support
>>
>> Armin Kuster (6):
>>   librsvg: Security fixes via update to 2.40.15
>>   openssl: Security fix via update to 1.0.2h
>>   gcc: Security fix CVE-2016-4488
>>   gcc: Security fix CVE-2016-4489
>>   gcc: Security fix CVE-2016-2226
>>   gcc: Security fix CVE-2016-4490
>>
>> Awais Belal (1):
>>   mesa-demos: remove demos using obsolete screen surface
>>
>> Bruce Ashfield (15):
>>   linux-yocto/uvesafb: print error message when task timeout occurs
>>   linux-yocto/4.4: sched/cgroup: Fix/cleanup cgroup teardown/init
>>   kern-tools: handle directories with, or without, trailing /
>>   kernel-yocto: allow branch auditing to be suspended
>>   linux-yocto/4.1: update to v4.1.22
>>   linux-yocto/4.1: make ltsi content available
>>   linux-yocto/4.4: BXT mmc fixes + PUNIT, tubropower, and telemetry
>>     backport
>>   linux-yocto/4.4: skylake configuration
>>   linux-yocto/4.4: broxton enablement and refactoring
>>   linux-yocto/4.4: bump to v4.4.8
>>   linux-yocto-rt/4.1: update to rt23
>>   linux-yocto/4.4: bump to v4.4.8
>>   linux-yocto/4.4: update to v4.4.9
>>   linux-yocto/4.4: beaglebone: Enable drm for omap
>>   linux-yocto/4.4: bump to v4.4.10
>>
>> Christopher Clark (1):
>>   linux-firmware: break out bnx2 mips firmware and WHENCE license
>>
>> Christopher Larson (2):
>>   image_types.bbclass: add WIC_CREATE_EXTRA_ARGS
>>   gcc: obey ldflags in the link of libgcc
>>
>> Dengke Du (2):
>>   bash: fixed ptest run-builtins failed
>>   lttng-tools: filter random filename of ptest output
>>
>> Denys Dmytriyenko (1):
>>   arch-armv7ve: inherit armv7a tunes file
>>
>> Diego Rondini (1):
>>   base-files: add some safety checks in profile
>>
>> Felipe F. Tonello (1):
>>   packagegroup-core-tools-profile: Enable valgrind on ARMv7a and
>> above
>>
>> Ian Reinhart Geiser (1):
>>   classes/image_vm: allow different filesystems to be used for VM
>>     images.
>>
>> Ioan-Adrian Ratiu (2):
>>   wic: isoimage-isohybrid: add grubefi configfile support
>>   wic: isoimage-isohybrid: fix splash file paths
>>
>> Ismo Puustinen (1):
>>   libpcre: Fix CVE-2016-3191
>>
>> Joshua Lock (2):
>>   security_flags: turn potential string format security issues into
>> an
>>     error
> Not appropriate for a stable branch?

removed. rebased new series.
>
>>   packagegroup-core-lsb: fix whitespace in meta-qt* warnings
>>
>> Jussi Kukkonen (1):
>>   gcc-sanitizers: Depend on target gcc
>>
>> Leonardo Sandoval (2):
>>   scripts/lib/bsp/kernel.py: force patching when branch is machine
>>     branch is re-use
>>   populate_sdk_ext.bbclass : Show logfile in case the SDK EXT
>>     installation failed
>>
>> Maxin B. John (3):
>>   popt: fix dependencies and QA Issue
>>   bash: fix dependencies and QA Issue
>>   libxml2: fix dependencies and QA Issues
>>
>> Paul Eggleton (4):
>>   recipetool: create: fix picking up false npm package directories
>>   recipetool: create: fix falling back to declared license for npm
>>     packages
>>   classes/insane: do not force LIC_FILES_CHKSUM unless SRC_URI is set
> This was related to a feature change in master, not sure we want to
> pull this into krogoth?

nope. removed.
>
>>   Drop unneeded LIC_FILES_CHKSUM values
> and this is related to the above, as are some of Roberts patches?

removed.
>
>> Peter Kjellerstedt (1):
>>   metadata_scm.bbclass: Do not assume ${COREBASE} is a Git repo
>>
>> Randy Witt (2):
>>   populate_sdk_ext: Change lockedsigs task mismatch to a warning
>>   devtool: Fix build-sdk when pn doesn't match filename
>>
>> Richard Purdie (6):
>>   meta-selftest/images: Add LIC_FILES_CHKSUM to images using
>>     image.bbclass
>>   test-empty-image: Fix LIC_FILES_CHKSUM typo
>>  oeqa/lic-checksum: Update after recent LIC_FILES_CHKSUM changes
> Not needed if we don't change LIC_FILES_CHKSUM handling in the release
> branch.

removed.
>
>>   image: Fix IMAGE_FEATURES determinism issue
>>   update-alternatives: Fix determinism issue
>>   lib/classextend: Fix determinism issue
>> Robert P. J. Day (1):
>>   attr: Remove redundant "+=" after "_append"
> Cosmetic, not really stable material?
removed.

My wife says that to me on occasion too.


>
>> Robert Yang (7):
>>   directfb/pango/webkit: base_contains -> bb.utils.contains
> Not sure the stable branch needs this.

missed removing that on. gone now.
>
>>   grub_git: set COMPATIBLE_HOST_armv7a to null
>>   insane.bbclass: remove workdir from package_qa_check_license()
>>   packagegroup.bbclass: set LICENSE and LIC_FILES_CHKSUM
>>   packagegroup-foo.bb: remove LICENSE = "MIT"
>>   meta-world-pkgdata: add LIC_FILES_CHKSUM
> More LIC_FILES_CHKSUM stuff which I don't think we should backport.
removed.
>
>>   libxsettings-client: fix COPYING file
>>
>> Ross Burton (23):
>>   package: ensure do_split_packages doesn't return duplicates
>>   autotools: warn when running intltoolize if intltool isn't a
>>     dependemcy
> Do we want to fix this in all recipes in the release branch? This one
> probably is reasonable but could be a pain.

nope. removed.
>
>>   busybox: don't build ar
>>   meta: add comments to explain autotools-brokensep use
>>   mx-1.0: inherit gtk-doc
>>   mx: move to autotools instead of autotools-brokensep
>>   bluez5: enable out-of-tree builds
>>   oeqa/sstatetests: add http_proxy to no-op hash test
>>   oeqa/sstatetests: remove temporary DL_DIRs in noop_samesigs
>>   autotools: add default for CACHED_CONFIGUREVARS
>>   python-pygobject: remove redundant gnome-common dependency
>>   gnome-desktop3: remove redundant gnome-common dependency
>>   webkitgtk: remove gnome-common dependency
>>   qemu: remove explicit but redundant native build dependencies
>>   mesa-gl: add missing MESA_CRYPTO to PACKAGECONFIG
>>   oeqa/selftest/buildoptions: remove buildhistory signature test
>>   eudev: add PACKAGECONFIG for hwdb
>>   dbus-test: install executables not libtool wrapper scripts
>>   mesa: add PACKAGECONFIG for gbm
>>   bitbake.conf: change APACHE_MIRROR to point at archive.apache.org
>>   image_types: fix image/compression dependency collection
>>   bitbake.conf: add default for IMAGE_FSTYPES_DEBUGFS
>>   bitbake: fetch2: export DBUS_SESSION_BUS_ADDRESS to support
>>     authentication agents
>>
>> Ruslan Bilovol (2):
>>   kernel-uimage: change target image to vmlinux
>>   libunwind: backport aarch64_be support
>>
>> Stephano Cetola (2):
>>   toolchain-scripts: replace source built-in call
>>   sysvinit-inittab: restrict labels to 4 chars
>>
>> Tristan Van Berkom (1):
>>   cross-localedef-native_2.22.bb: Use autotools configure
>>
>> Yuqing Zhu (1):
>>   alsa-lib: Fix incorrect appl pointer when mmap_commit() returns
>> error.

a rebased version is cooking with some additions. Hope to have new
request soon.

thanks for taking the time to review.

kind regards,
Armin
> Cheers,
>
> Richard



