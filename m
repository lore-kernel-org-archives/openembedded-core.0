Received: from mga01.intel.com ([192.55.52.88])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <sgw@linux.intel.com>) id 1TuojK-0006N9-1v
	for openembedded-core@lists.openembedded.org;
	Mon, 14 Jan 2013 19:25:57 +0100
Received: from fmsmga002.fm.intel.com ([10.253.24.26])
	by fmsmga101.fm.intel.com with ESMTP; 14 Jan 2013 10:10:34 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.84,468,1355126400"; d="scan'208";a="276738430"
Received: from unknown (HELO [10.255.14.213]) ([10.255.14.213])
	by fmsmga002.fm.intel.com with ESMTP; 14 Jan 2013 10:10:33 -0800
Message-ID: <50F44A19.9040804@linux.intel.com>
Date: Mon, 14 Jan 2013 10:10:33 -0800
From: Saul Wold <sgw@linux.intel.com>
User-Agent: Mozilla/5.0 (X11; Linux x86_64;
	rv:17.0) Gecko/17.0 Thunderbird/17.0
MIME-Version: 1.0
To: Radu Moisan <radu.moisan@intel.com>
References: <cover.1357647338.git.radu.moisan@intel.com>
	<50F09EDA.1000807@linux.intel.com> <50F43D8A.8020502@intel.com>
In-Reply-To: <50F43D8A.8020502@intel.com>
Cc: openembedded-core@lists.openembedded.org
Subject: Re: [PATCH 00/21][RFC v3] systemd Integration
X-BeenThere: openembedded-core@lists.openembedded.org
X-Mailman-Version: 2.1.11
Precedence: list
List-Id: Patches and discussions about the oe-core layer
	<openembedded-core.lists.openembedded.org>
List-Unsubscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/options/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.linuxtogo.org/pipermail/openembedded-core>
List-Post: <mailto:openembedded-core@lists.openembedded.org>
List-Help: <mailto:openembedded-core-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Mon, 14 Jan 2013 18:25:58 -0000
Content-Type: text/plain; charset=ISO-8859-1; format=flowed
Content-Transfer-Encoding: 7bit

On 01/14/2013 09:16 AM, Radu Moisan wrote:
>
> On 01/12/2013 01:23 AM, Saul Wold wrote:
>> On 01/08/2013 04:24 AM, Radu Moisan wrote:
>>> As Ross suggested I've done the following changes to the previous set:
>>> * added two patches (the first two) that address multiple init
>>> systems support,\
>>> as in shifting from default hardcoded sysvinit to something more
>>> generic while
>>> the default values still remains on sysvinit
>>> * moved automatic setting of PREFERRED_PROVIDER_udev into
>>> default_providers.inc
>>> * removed ahavi-systemd since all it provided was service files; now
>>> service files
>>> are pulled in by avahi-daemon
>>> * also rebased on master
>>>
>>> The following changes since commit
>>> 7e1f8faad0c4b6f490c26f87acc698dd6e002b15:
>>>
>>>    perl: Remove bashism from perl-tests.inc (2013-01-07 22:37:37 +0000)
>>>
>>> are available in the git repository at:
>>>
>>>    git://git.yoctoproject.org/poky-contrib rmoisan/systemd
>>> http://git.yoctoproject.org/cgit.cgi/poky-contrib/log/?h=rmoisan/systemd
>>>
>>> Enrico Scholz (1):
>>>    systemd: move disable operation into prerm() script
>>>
>>> Holger Hans Peter Freyther (2):
>>>    systemd: Make the main systemd files proper CONFFILES
>>>    systemd: Introduce a create-volatile to create tmp directories
>> White space 4 spaces vs tab
>
> Fixed.
>
>>
>>>
>>> Khem Raj (1):
>>>    systemd: Fix build when base_libdir is not /lib
>>>
>>> Martin Donnelly (2):
>>>    cgroups: Add INSANE_SKIP to avoid warning about .so file
>>>    systemd: Remove sysvinit mount related services if systemd is enabled
>>>
>>> Martin Jansa (2):
>>>    systemd: fix FILESPATH to find systemctl
>>>    systemd: add PACKAGES_DYNAMIC
>>>
>>> Radu Moisan (13):
>>>    default-distrovars: Add DISTRO_FEATURES_INITMAN to DISTRO_FEATURES
>>>    default-providers: Automatically set PREFERRED_PROVIDER_udev
>>>    systemd: initial integration
>> I believe this was mentioned before, but can you avoid making white
>> space changes, you seem to have changed tabs (which we use tabs for
>> shell based functions and 4 spaces for python based functions)
>>
>> Specifically, I saw some changes in wpa-supplicant-1.0.inc, busybox,
>> dropbear, initscripts
>>
> Reviewed those files and cleaned them up to comply.
>
I am still seeing white space changes, as mentioned before if you want 
to cleanup white space changes, make that a separate and distinct patch, 
so for instance in dropbear you un-indented some SRC_URIs, that should 
be a distinct patch with white space changes only separate from the 
addition of the dropbear*.service files.

I know I might be getting a little nit-picky, but it's about readability 
and understanding the change sets, I just stop looking because it's hard 
to see the changes clearly.

So please check you whitespace and sent a seperate whitespace fixup patch.

>> For the systemd-serialgetty, can we not carry around a LICENSE file,
>> and instead point to the meta/files/common-licenses for a checksum?
>>
>
> Done.
>
>> Also a load of the patches do not contains Signed-off-by or
>> Upstream-Status tags.
>>
>
> Updated Signed-off-by
> yet to check and update Upstream-Status.
>
>>
>>>    systemd: Add systemd_base.bbclass
>>>    systemd: Add systemd option to PREFERRED_PROVIDER_udev
>>>    systemd: set default.target to multi-user.target
>>>    systemd: update FILESPATH with *-native directory
>>>    systemd: disable sysfs.service
>> White space changes, makes it much harder to review, please fix
>
> corrected white spaces.
> disabled hostname.sh, mountall.sh, mountnfs.sh and sysfs.sh when running
> with systemd
> changed patch header & description
>
Still seems to be white space issues with this one.

Thanks
	Sau!

>>
>>
>>>    systemd: Add systemd-compat-units
>>>    systemd: Add avahi to packagegroup-core-boot
>>>    xserver-nodm-init: Enable systemd support
>>>    util-linux: Enable systemd support
>> What's the actual change here?  Whitespace?
>
> dropped.
> white space issues fixed in initial commit.
>
>>>    systemd: Disable xz when building with GPLv3 incompatibility flag
>> This should go away, I have verified that the license field in xz is
>> wrong and should not contain GPLv3 since it's a build macro, not a
>> runtime, and the LICENSE field pertains to packaged and installed
>> items and their licenses.
>>
> dropped.
>
> Radu
>
>


