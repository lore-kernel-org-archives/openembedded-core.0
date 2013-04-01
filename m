Received: from mga02.intel.com ([134.134.136.20])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <radu.moisan@intel.com>) id 1UMaaK-0006Kr-VS
	for openembedded-core@lists.openembedded.org;
	Mon, 01 Apr 2013 10:59:25 +0200
Received: from orsmga002.jf.intel.com ([10.7.209.21])
	by orsmga101.jf.intel.com with ESMTP; 01 Apr 2013 01:42:15 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.87,385,1363158000"; d="scan'208";a="310420503"
Received: from dell-desktop.rb.intel.com (HELO [10.237.105.59])
	([10.237.105.59])
	by orsmga002.jf.intel.com with ESMTP; 01 Apr 2013 01:41:44 -0700
Message-ID: <5159484A.1020603@intel.com>
Date: Mon, 01 Apr 2013 11:41:46 +0300
From: Radu Moisan <radu.moisan@intel.com>
User-Agent: Mozilla/5.0 (X11; Linux x86_64;
	rv:17.0) Gecko/20130308 Thunderbird/17.0.4
MIME-Version: 1.0
To: Bernhard Reutner-Fischer <rep.dot.nop@gmail.com>
References: <1364551510-8648-1-git-send-email-radu.moisan@intel.com>
	<20130329170003.GA7125@mx.loc>
In-Reply-To: <20130329170003.GA7125@mx.loc>
Cc: openembedded-core@lists.openembedded.org
Subject: Re: [PATCH v2] busybox: Upgrade to v1.21.0
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
X-List-Received-Date: Mon, 01 Apr 2013 08:59:25 -0000
Content-Type: text/plain; charset=ISO-8859-1; format=flowed
Content-Transfer-Encoding: 7bit


On 03/29/2013 07:00 PM, Bernhard Reutner-Fischer wrote:
> On Fri, Mar 29, 2013 at 12:05:10PM +0200, Radu Moisan wrote:
>> Removed obsolete patches
>> Added a few new patches pending 1.21.1
>> *busybox-1.21.0-mdev.patch
>> *busybox-1.21.0-platform.patch
>> *busybox-1.21.0-xz.patch
>>
>> Signed-off-by: Radu Moisan <radu.moisan@intel.com>
>> ---
>> .../busybox-1.20.2/busybox-1.20.2-kernel_ver.patch |   28 -
>> .../busybox-mkfs-minix-tests_bigendian.patch       |   34 --
>> .../fix-for-spurious-testsuite-failure.patch       |   27 -
>> .../busybox/busybox-1.20.2/sys_resource.patch      |   99 ---
>> .../busybox/busybox-1.20.2/wget_dl_dir_fix.patch   |   30 -
>> .../B921600.patch                                  |    0
>> .../busybox-1.21.0/busybox-1.21.0-mdev.patch       |  643 ++++++++++++++++++++
>> .../busybox-1.21.0/busybox-1.21.0-platform.patch   |   24 +
>> .../busybox/busybox-1.21.0/busybox-1.21.0-xz.patch |   84 +++
>> .../busybox-appletlib-dependency.patch             |    0
>> .../busybox-udhcpc-no_deconfig.patch               |    0
>> .../{busybox-1.20.2 => busybox-1.21.0}/defconfig   |    0
>> .../get_header_tar.patch                           |    0
>> .../run-parts.in.usr-bin.patch                     |    6 +-
>> .../stat-usr-bin.patch                             |    0
>> ...estsuite-du-du-k-works-fix-false-positive.patch |    0
>> .../watch.in.usr-bin.patch                         |    0
>> .../{busybox_1.20.2.bb => busybox_1.21.0.bb}       |   17 +-
>> 18 files changed, 762 insertions(+), 230 deletions(-)
>> delete mode 100644 meta/recipes-core/busybox/busybox-1.20.2/busybox-1.20.2-kernel_ver.patch
>> delete mode 100644 meta/recipes-core/busybox/busybox-1.20.2/busybox-mkfs-minix-tests_bigendian.patch
>> delete mode 100644 meta/recipes-core/busybox/busybox-1.20.2/fix-for-spurious-testsuite-failure.patch
>> delete mode 100644 meta/recipes-core/busybox/busybox-1.20.2/sys_resource.patch
>> delete mode 100644 meta/recipes-core/busybox/busybox-1.20.2/wget_dl_dir_fix.patch
>> rename meta/recipes-core/busybox/{busybox-1.20.2 => busybox-1.21.0}/B921600.patch (100%)
> I wonder how this applies without fuzz as
> it was applied upstream back in 2009:
> http://git.busybox.net/busybox/commit/?id=e707a3000b2f6e2f684b6e85cd60590318d157c4

Many patches apply with some fuzz, and that's fine as log as it applies 
and keeps fixing something. However this one may not be necessary to 
carry along indeed. I'll look into it and drop, same for 
busybox-appletlib-dependency.patch if applied upstream.

Radu


