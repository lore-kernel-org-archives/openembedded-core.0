Received: from mga02.intel.com ([134.134.136.20])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <radu.moisan@intel.com>) id 1Tlz9Q-0005BQ-UZ
	for openembedded-core@lists.openembedded.org;
	Fri, 21 Dec 2012 10:44:21 +0100
Received: from orsmga002.jf.intel.com ([10.7.209.21])
	by orsmga101.jf.intel.com with ESMTP; 21 Dec 2012 01:29:34 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.84,329,1355126400"; d="scan'208";a="260653720"
Received: from dell-desktop (HELO [10.237.105.59]) ([10.237.105.59])
	by orsmga002.jf.intel.com with ESMTP; 21 Dec 2012 01:29:33 -0800
Message-ID: <50D42D58.4010703@intel.com>
Date: Fri, 21 Dec 2012 11:35:20 +0200
From: Radu Moisan <radu.moisan@intel.com>
User-Agent: Mozilla/5.0 (X11; Linux x86_64;
	rv:17.0) Gecko/17.0 Thunderbird/17.0
MIME-Version: 1.0
To: Saul Wold <sgw@linux.intel.com>
References: <cover.1356022882.git.radu.moisan@intel.com>
	<50D38B3E.30003@linux.intel.com>
In-Reply-To: <50D38B3E.30003@linux.intel.com>
Cc: openembedded-core@lists.openembedded.org
Subject: Re: [PATCH 00/28][RFC] systemd Integration
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
X-List-Received-Date: Fri, 21 Dec 2012 09:44:21 -0000
Content-Type: text/plain; charset=ISO-8859-1; format=flowed
Content-Transfer-Encoding: 7bit


On 12/21/2012 12:03 AM, Saul Wold wrote:
> On 12/20/2012 09:11 AM, Radu Moisan wrote:
>> I've rebased my branch, again :), with some cleanups here and there
>> I also pushed a few patches suggested by Martin.
>> Feel free to comment on everything.
>>
>> The following changes since commit 
>> 958162e96b4a4f23bca94500b5f20975633dd5c6:
>>
>>    bitbake: hob: use base image only if it was set (2012-12-14 
>> 17:31:31 +0000)
>>
> Sorry to say, this is still too far behind master, you really need to 
> rebase right to HEAD of master (or HEAD of oe-core), I tried to apply 
> this to the master and it failed to apply.
I'll rebase on master today.
>
>> are available in the git repository at:
>>
>>    git://git.yoctoproject.org/poky-contrib rmoisan/systemd
>> http://git.yoctoproject.org/cgit.cgi/poky-contrib/log/?h=rmoisan/systemd
>>
>> Enrico Scholz (1):
>>    systemd: move disable operation into prerm() script
>>
>> Holger Hans Peter Freyther (2):
>>    systemd: Make the main systemd files proper CONFFILES
>>    systemd: Introduce a create-volatile to create tmp directories
>>
>> Khem Raj (1):
>>    systemd: Fix build when base_libdir is not /lib
>>
>> Martin Donnelly (2):
>>    cgroups: Add INSANE_SKIP to avoid warning about .so file
>>    Remove sysvinit mount related services if systemd is enabled
>>
>> Martin Jansa (2):
>>    systemd-systemctl-native: fix FILESPATH to find systemctl
>>    systemd: add PACKAGES_DYNAMIC
>>
>> Radu Moisan (20):
>>    Systemd initial integration
>>    Add DISTRO_FEATURES_INITMAN to DISTRO_FEATURES
>>    Automatically set PREFERRED_PROVIDER_udev
>>    Add systemd_base.bbclass
>>    Include systemd-compat-units and avahi-systemd
>>    Inherit the systemd_base class
>>    set default.target to multi-user.target
>>    wpa-supplicant: Fix indentation
>>    dropbear: Fix indentation and cleanup
>>    systemd: Some more cleanup
>>    systemd: disable  source rcS-default
>>    polkit: merge together the two instances of PACKAGECONFIG
>>    systemd-native: update FILESPATH with *-native directory
>>    systemd: Remove gitpkgv.bbclass
>>    systemd: (temporary) remove dependency on cairo
>>    initscripts: Cleanup recipe
>>    systemd: disable sysfs.service
> Are you going to collapse all the systemd changes and clean up the 
> commit messages?
>
Wouldn't it be harder to review? I can do it anytime, if you think it is 
the right way to go.

Radu


