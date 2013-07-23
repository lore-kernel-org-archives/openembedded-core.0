Return-Path: <sgw@linux.intel.com>
Received: from mga09.intel.com (mga09.intel.com [134.134.136.24])
	by mail.openembedded.org (Postfix) with ESMTP id 9B5616A9C4
	for <openembedded-core@lists.openembedded.org>;
	Tue, 23 Jul 2013 14:51:05 +0000 (UTC)
Received: from orsmga001.jf.intel.com ([10.7.209.18])
	by orsmga102.jf.intel.com with ESMTP; 23 Jul 2013 07:48:31 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.89,728,1367996400"; d="scan'208";a="350206967"
Received: from unknown (HELO [10.255.14.5]) ([10.255.14.5])
	by orsmga001.jf.intel.com with ESMTP; 23 Jul 2013 07:51:05 -0700
Message-ID: <51EE9859.8030304@linux.intel.com>
Date: Tue, 23 Jul 2013 07:51:05 -0700
From: Saul Wold <sgw@linux.intel.com>
User-Agent: Mozilla/5.0 (X11; Linux x86_64;
	rv:17.0) Gecko/20130514 Thunderbird/17.0.6
MIME-Version: 1.0
To: Richard Purdie <richard.purdie@linuxfoundation.org>
References: <cover.1374511663.git.sgw@linux.intel.com>
	<51EE95A9.3070603@linux.intel.com>
In-Reply-To: <51EE95A9.3070603@linux.intel.com>
Cc: paul.eggleton@linux.intel.com, dvhart@linux.intel.com,
	zhenhua.luo@freescale.com, otavio@ossystems.com.br,
	openembedded-core@lists.openembedded.org
Subject: Re: [CONSOLIDATED PULL 00/27] Ready for Pull after final ACK
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
X-List-Received-Date: Tue, 23 Jul 2013 14:51:05 -0000
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit

On 07/23/2013 07:39 AM, Saul Wold wrote:
> On 07/22/2013 10:12 AM, Saul Wold wrote:
>> Richard,
>>
>> This has been trimmed and reviewed, please wait for Paul and Ross
>> (traveling)
>> final ACKs.
>>
>> ** Reminder to BSP Maintainers - Please update your mesa .bbappends ***
>> ** I will send email when RP has pulled, please keep me posted on your
>> branches **
>>
>> Thanks
>>     Sau!
>>
>>
>> The following changes since commit
>> 8fc6904fe97438478119db6cd23b7b4eb33b50aa:
>>
>>    curl: add upstream status to patch (2013-07-18 12:21:13 -0700)
>>
>> are available in the git repository at:
>>
>>    git://git.openembedded.org/openembedded-core-contrib sgw/stage
>>
>> http://cgit.openembedded.org/cgit.cgi/openembedded-core-contrib/log/?h=sgw/stage
>>
>>
>> André Draszik (1):
>>    directfb: don't patch pkg-config files
>>
>> Beth Flanagan (1):
>>    adt_installer_internal: fix spelling error
>>
>> Chen Qi (2):
>>    useradd.bbclass: add a new base class and code refactor
>>    extrausers.bbclass: add a new bbclass
>>
>> Daniel Nilsson (1):
>>    glew: Update GLEW version number in autotools patch
>>
>> Emilia Ciobanu (3):
>>    kmod:add GIT revision to PV variable
>>    lttng-modules: Append _git to recipe name and add GIT revision to PV
>>        variable
>>    docbook-sgml-dtd-4.5-native.bb: Add real PV inside the recipe
>>
>> Jesse Zhang (1):
>>    tremor: add a patch to build with arm thumb
>>
>> Jonathan Liu (5):
>>    systemd: remove unneeded modprobe.rules
>>    mesa: upgrade to 9.1.5
>>    wget: backport fixes for documentation build errors
>>    mesa: use LLVM 3.3 by default
>>    boot-directdisk: use awk instead of echo -ne for dash compatibility
>>
>> Martin Jansa (6):
>>    gst-plugins-good: add PACKAGECONFIG for jack
>>    gst-plugins-ugly: add PACKAGECONFIG for x264, cdio, dvdread
>>    pulseaudio: add PACKAGECONFIG for jack
>>    subversion: add PACKAGECONFIG for sasl
>>    cups: add PACKAGECONFIG for avahi
>>    mesa: add Upstream-Status
>>
>> Ming Liu (1):
>>    libpam: add a new 'nullok_secure' option support to pam_unix
>>
>> Muhammad Shakeel (1):
>>    systemd: Remove systemd_unitdir if systemd is not in distro features
>>
> Richard:
>
> I removed this from the sgw/stage branch post ACK due to a V2 being posted.
>
Added back in as the V2 was really the sysvinit portion, not changing 
the systemd side, my bad for 7:00am working.

Sau!

> Otherwise this branch is ready to go with ACKs.
>
> Thanks
> Sau!
>
>
>> Petter Mabäcker (1):
>>    remake: fix insufficient gettext dependency
>>
>> Ross Burton (1):
>>    initrdscripts: mount / as read-only when live-booting
>>
>> Saul Wold (1):
>>    pigz: Fix typo in ALTERNATIVES line
>>
>> Tudor Florea (2):
>>    python: Add ptest
>>    kmod: Add ptest
>>
>>   meta/classes/boot-directdisk.bbclass               |   2 +-
>>   meta/classes/extrausers.bbclass                    |  61 ++++++
>>   meta/classes/systemd.bbclass                       |   9 +
>>   meta/classes/useradd.bbclass                       |  99 +--------
>>   meta/classes/useradd_base.bbclass                  | 230
>> +++++++++++++++++++++
>>   meta/recipes-core/initrdscripts/files/init-live.sh |   6 +-
>>   meta/recipes-core/systemd/systemd/modprobe.rules   |  17 --
>>   meta/recipes-core/systemd/systemd_204.bb           |   1 -
>>   .../docbook-sgml-dtd-4.5-native.bb                 |   1 +
>>   .../adt-installer/scripts/adt_installer_internal   |   2 +-
>>   .../python/python/fix-makefile-for-ptest.patch     |  33 +++
>>   meta/recipes-devtools/python/python/run-ptest      |   5 +
>>   meta/recipes-devtools/python/python_2.7.3.bb       |  10 +
>>   meta/recipes-devtools/remake/remake_git.bb         |   6 +-
>>   .../subversion/subversion_1.6.15.bb                |   2 +
>>   .../subversion/subversion_1.7.10.bb                |   2 +
>>   meta/recipes-extended/cups/cups16.inc              |   3 +
>>   .../pam-security-abstract-securetty-handling.patch | 200
>> ++++++++++++++++++
>>   .../pam/libpam/pam-unix-nullok-secure.patch        | 222
>> ++++++++++++++++++++
>>   meta/recipes-extended/pam/libpam_1.1.6.bb          |   4 +-
>>   meta/recipes-extended/pigz/pigz.inc                |   2 +-
>>   meta/recipes-extended/wget/wget-1.14/fix_doc.patch |  71 +++++++
>>   meta/recipes-extended/wget/wget_1.14.bb            |   1 +
>>   meta/recipes-graphics/directfb/directfb.inc        |   1 -
>>   .../directfb-1.2.x-fix-pkgconfig-cflags.patch      |  48 -----
>>   meta/recipes-graphics/glew/files/autotools.patch   |   4 +-
>>   ...ate-NativeDisplayType-depending-on-config.patch |   3 +
>>   ...move-the-power-of-two-sizeof-struct-cmd_b.patch |   0
>>   meta/recipes-graphics/mesa/mesa.inc                |   2 +-
>>   ...ate-NativeDisplayType-depending-on-config.patch |   3 +
>>   .../mesa/{mesa_9.1.3.bb => mesa_9.1.5.bb}          |   4 +-
>>   meta/recipes-kernel/kmod/kmod.inc                  |   4 +-
>>   meta/recipes-kernel/kmod/kmod/ptest.patch          |  25 +++
>>   meta/recipes-kernel/kmod/kmod/run-ptest            |   5 +
>>   meta/recipes-kernel/kmod/kmod_git.bb               |  10 +
>>   ...lttng-modules_2.2.0.bb => lttng-modules_git.bb} |   2 +-
>>   .../gstreamer/gst-plugins-good_0.10.31.bb          |   1 +
>>   .../gstreamer/gst-plugins-ugly_0.10.19.bb          |   5 +
>>   meta/recipes-multimedia/pulseaudio/pulseaudio.inc  |   1 +
>>   .../tremor/tremor-20120314/tremor-arm-thumb2.patch | 104 ++++++++++
>>   meta/recipes-multimedia/tremor/tremor_20120314.bb  |   1 +
>>   41 files changed, 1039 insertions(+), 173 deletions(-)
>>   create mode 100644 meta/classes/extrausers.bbclass
>>   create mode 100644 meta/classes/useradd_base.bbclass
>>   delete mode 100644 meta/recipes-core/systemd/systemd/modprobe.rules
>>   create mode 100644
>> meta/recipes-devtools/python/python/fix-makefile-for-ptest.patch
>>   create mode 100644 meta/recipes-devtools/python/python/run-ptest
>>   create mode 100644
>> meta/recipes-extended/pam/libpam/pam-security-abstract-securetty-handling.patch
>>
>>   create mode 100644
>> meta/recipes-extended/pam/libpam/pam-unix-nullok-secure.patch
>>   create mode 100644 meta/recipes-extended/wget/wget-1.14/fix_doc.patch
>>   delete mode 100644
>> meta/recipes-graphics/directfb/directfb/directfb-1.2.x-fix-pkgconfig-cflags.patch
>>
>>   rename meta/recipes-graphics/mesa/{mesa-9.1.3 =>
>> mesa-9.1.5}/0003-EGL-Mutate-NativeDisplayType-depending-on-config.patch (98%)
>>
>>   rename meta/recipes-graphics/mesa/{mesa-9.1.3 =>
>> mesa-9.1.5}/0005-llvmpipe-remove-the-power-of-two-sizeof-struct-cmd_b.patch
>> (100%)
>>   rename meta/recipes-graphics/mesa/{mesa_9.1.3.bb => mesa_9.1.5.bb}
>> (79%)
>>   create mode 100644 meta/recipes-kernel/kmod/kmod/ptest.patch
>>   create mode 100755 meta/recipes-kernel/kmod/kmod/run-ptest
>>   rename meta/recipes-kernel/lttng/{lttng-modules_2.2.0.bb =>
>> lttng-modules_git.bb} (97%)
>>   create mode 100644
>> meta/recipes-multimedia/tremor/tremor-20120314/tremor-arm-thumb2.patch
>>
> _______________________________________________
> Openembedded-core mailing list
> Openembedded-core@lists.openembedded.org
> http://lists.openembedded.org/mailman/listinfo/openembedded-core

