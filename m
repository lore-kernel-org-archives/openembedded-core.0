Received: from mga01.intel.com ([192.55.52.88])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <sgw@linux.intel.com>) id 1RPzxe-0002YA-AP
	for openembedded-core@lists.openembedded.org;
	Mon, 14 Nov 2011 18:04:47 +0100
Received: from fmsmga002.fm.intel.com ([10.253.24.26])
	by fmsmga101.fm.intel.com with ESMTP; 14 Nov 2011 08:58:07 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.69,509,1315206000"; d="scan'208";a="90273998"
Received: from unknown (HELO [10.255.15.217]) ([10.255.15.217])
	by fmsmga002.fm.intel.com with ESMTP; 14 Nov 2011 08:58:07 -0800
Message-ID: <4EC1489F.60304@linux.intel.com>
Date: Mon, 14 Nov 2011 08:58:07 -0800
From: Saul Wold <sgw@linux.intel.com>
User-Agent: Mozilla/5.0 (X11; Linux x86_64;
	rv:7.0) Gecko/20110927 Thunderbird/7.0
MIME-Version: 1.0
To: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
References: <cover.1321244755.git.sgw@linux.intel.com>
	<20111114073943.GA3445@jama.jama.net>
In-Reply-To: <20111114073943.GA3445@jama.jama.net>
Cc: Martin Jansa <martin.jansa@gmail.com>
Subject: Re: [CONSOLIDATED PULL 00/21] Updates and Fixes
X-BeenThere: openembedded-core@lists.openembedded.org
X-Mailman-Version: 2.1.11
Precedence: list
Reply-To: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
List-Id: Patches and discussions about the oe-core layer
	<openembedded-core.lists.openembedded.org>
List-Unsubscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/options/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.linuxtogo.org/pipermail/openembedded-core>
List-Post: <mailto:openembedded-core@lists.openembedded.org>
List-Help: <mailto:openembedded-core-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Mon, 14 Nov 2011 17:04:47 -0000
Content-Type: text/plain; charset=ISO-8859-1; format=flowed
Content-Transfer-Encoding: 7bit

On 11/13/2011 11:39 PM, Martin Jansa wrote:
> On Sun, Nov 13, 2011 at 08:27:50PM -0800, Saul Wold wrote:
>> Richard,
>>
>> This set has been build tested and reviewed.  I did have to update
>> bitbake.conf for both then gnu-config and base.bblcass changes to
>> modify ASSUME_PROVIDED, please review this.
>
> Reported on IRC, but better to say it here too I guess:
>
> 08:36:32<  JaMa|off>  sgw: all thumb patches somehow lost the important
> part ARM_INSTRUCTION_SET = "arm"
> 08:37:02<  JaMa|off>  sgw: so your CONSOLIDATED PULL has only PR bumps
> while jansa/pull had ARM_INSTRUCTION_SET and PR bumps
Not sure what happened here, I will double check my contents and rebase 
as needed.

> 08:38:07<  JaMa|off>  sgw: and subversion-native should work without
> adding it to ASSUME_PROVIDED :/
>
I would like to know what your setup is and how your testing this, 
because every time I tried without the ASSUME_PROVIDED change, I got a 
circular dependency.

Sau!


>>
>> Thanks
>> 	Sau!
>>
>> The following changes since commit a8ed4fcd79f6283c1d45f347dce894d784183900:
>>
>>    xinit: rdepends on util-linux-mcookie to avoid brining whole util-linux (2011-11-11 11:00:56 +0000)
>>
>> are available in the git repository at:
>>    git://git.openembedded.org/openembedded-core-contrib sgw/stage
>>    http://cgit.openembedded.org/cgit.cgi/openembedded-core-contrib/log/?h=sgw/stage
>>
>> Martin Jansa (13):
>>    libatomics-ops: force ARM mode
>>    pulseaudio-0.9.23: force ARM mode
>>    aspell: force ARM mode
>>    webkit-gtk: force arm mode to work around binutils segfault
>>    subversion: add 1.7.0 with native support and negative D_P for now
>>    base.bbclass: add subversion-native to DEPENDS if there is svn:// in
>>      SRC_URI
>>    time: rename files dir to time-1.7 for faster lookup
>>    time: drop default S and 2 useless comments
>>    time: use u-a for time, conflicts with busybox
>>    util-linux: use u-a for flock and blockdev, conflicts with busybox
>>    util-linux: add missing u-a calls for setsid chrt
>>    util-linux: bump PR after u-a changes
>>    kbd: use u-a for chvt, deallocvt, fgconssole, openvt, conflicts with
>>      busybox
>>
>> Otavio Salvador (1):
>>    dhcp: generate initial leases files for server
>>
>> Saul Wold (5):
>>    file: update to 5.09
>>    gnu-config: update to git HEAD
>>    boost: Update to 1.47.0&  Cleanup
>>    bitbake.conf: Update ASSUME_PROVIDED
>>    distro_tracking: Refect Recipe Updates&  Status
>>
>> Simon Busch (1):
>>    qt4-x11-free: bring back pkg-config fixups
>>
>> Xiaofeng Yan (1):
>>    directfb: update to 1.4.15
>>
>>   meta/classes/base.bbclass                          |    8 +-
>>   meta/conf/bitbake.conf                             |    7 +-
>>   .../conf/distro/include/distro_tracking_fields.inc |   49 ++--
>>   meta/recipes-connectivity/dhcp/dhcp.inc            |    9 +-
>>   meta/recipes-connectivity/dhcp/dhcp_4.2.0.bb       |    2 +-
>>   meta/recipes-core/kbd/kbd_1.15.2.bb                |   29 ++-
>>   meta/recipes-core/util-linux/util-linux.inc        |   14 +-
>>   meta/recipes-core/util-linux/util-linux_2.19.1.bb  |    2 +-
>>   .../file/file/fix_version_check.patch              |   21 ++
>>   .../file/{file_5.04.bb =>  file_5.09.bb}            |    9 +-
>>   .../gnu-config/config-guess-uclibc.patch           |  145 +++++------
>>   .../{gnu-config_20080123.bb =>  gnu-config_git.bb}  |   15 +-
>>   .../subversion/subversion-1.7.0/libtool2.patch     |   15 ++
>>   .../subversion/subversion_1.7.0.bb                 |   37 +++
>>   .../time/{files =>  time-1.7}/debian.patch          |    0
>>   meta/recipes-extended/time/time.inc                |   10 +
>>   meta/recipes-extended/time/time_1.7.bb             |    5 +-
>>   .../{directfb_1.4.12.bb =>  directfb_1.4.15.bb}     |    9 +-
>>   .../directfb-1.2.x-fix-pkgconfig-cflags.patch      |   36 ++--
>>   .../pulseaudio/libatomics-ops_1.2.bb               |    2 +-
>>   .../pulseaudio/pulseaudio_0.9.23.bb                |    2 +-
>>   meta/recipes-qt/qt4/qt4-x11-free.inc               |   16 ++-
>>   meta/recipes-sato/webkit/webkit-gtk_svn.bb         |    2 +-
>>   meta/recipes-support/aspell/aspell_0.60.6.1.bb     |    2 +-
>>   meta/recipes-support/boost/boost-jam-native.inc    |   32 ---
>>   .../boost/boost-jam-native_3.1.18.bb               |    8 -
>>   .../boost/{boost-36.inc =>  boost.inc}              |   42 +++-
>>   .../boost/{boost_1.44.0.bb =>  boost_1.47.0.bb}     |   13 +-
>>   .../recipes-support/boost/files/1.34.1-gcc43.patch |  226 -----------------
>>   .../boost/files/atomic_count_gcc_atomicity.patch   |   15 --
>>   meta/recipes-support/boost/files/gcc41.patch       |   16 --
>>   meta/recipes-support/boost/files/gcc43.patch       |  258 --------------------
>>   .../recipes-support/boost/files/linux-uclibc.patch |   12 -
>>   .../boost/files/unit_test_log10f.patch             |   22 --
>>   34 files changed, 333 insertions(+), 757 deletions(-)
>>   create mode 100644 meta/recipes-devtools/file/file/fix_version_check.patch
>>   rename meta/recipes-devtools/file/{file_5.04.bb =>  file_5.09.bb} (79%)
>>   rename meta/recipes-devtools/gnu-config/{gnu-config_20080123.bb =>  gnu-config_git.bb} (73%)
>>   create mode 100644 meta/recipes-devtools/subversion/subversion-1.7.0/libtool2.patch
>>   create mode 100644 meta/recipes-devtools/subversion/subversion_1.7.0.bb
>>   rename meta/recipes-extended/time/{files =>  time-1.7}/debian.patch (100%)
>>   rename meta/recipes-graphics/directfb/{directfb_1.4.12.bb =>  directfb_1.4.15.bb} (63%)
>>   delete mode 100644 meta/recipes-support/boost/boost-jam-native.inc
>>   delete mode 100644 meta/recipes-support/boost/boost-jam-native_3.1.18.bb
>>   rename meta/recipes-support/boost/{boost-36.inc =>  boost.inc} (88%)
>>   rename meta/recipes-support/boost/{boost_1.44.0.bb =>  boost_1.47.0.bb} (66%)
>>   delete mode 100644 meta/recipes-support/boost/files/1.34.1-gcc43.patch
>>   delete mode 100644 meta/recipes-support/boost/files/atomic_count_gcc_atomicity.patch
>>   delete mode 100644 meta/recipes-support/boost/files/gcc41.patch
>>   delete mode 100644 meta/recipes-support/boost/files/gcc43.patch
>>   delete mode 100644 meta/recipes-support/boost/files/linux-uclibc.patch
>>   delete mode 100644 meta/recipes-support/boost/files/unit_test_log10f.patch
>>
>> --
>> 1.7.6.4
>>
>>
>> _______________________________________________
>> Openembedded-core mailing list
>> Openembedded-core@lists.openembedded.org
>> http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-core
>
>
>
> _______________________________________________
> Openembedded-core mailing list
> Openembedded-core@lists.openembedded.org
> http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-core


