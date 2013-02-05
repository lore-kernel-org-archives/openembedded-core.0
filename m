Received: from mga01.intel.com ([192.55.52.88])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <sgw@linux.intel.com>) id 1U2piC-0007ey-L9
	for openembedded-core@lists.openembedded.org;
	Tue, 05 Feb 2013 22:05:54 +0100
Received: from fmsmga001.fm.intel.com ([10.253.24.23])
	by fmsmga101.fm.intel.com with ESMTP; 05 Feb 2013 12:50:01 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.84,609,1355126400"; d="scan'208";a="283218264"
Received: from unknown (HELO [10.255.12.90]) ([10.255.12.90])
	by fmsmga001.fm.intel.com with ESMTP; 05 Feb 2013 12:50:01 -0800
Message-ID: <51117079.10005@linux.intel.com>
Date: Tue, 05 Feb 2013 12:50:01 -0800
From: Saul Wold <sgw@linux.intel.com>
User-Agent: Mozilla/5.0 (X11; Linux x86_64;
	rv:17.0) Gecko/17.0 Thunderbird/17.0
MIME-Version: 1.0
To: Laurentiu Palcu <laurentiu.palcu@intel.com>
References: <cover.1359968730.git.laurentiu.palcu@intel.com>
In-Reply-To: <cover.1359968730.git.laurentiu.palcu@intel.com>
Cc: openembedded-core@lists.openembedded.org
Subject: Re: [PATCH 0/5] Remove /var/cache from volatiles directory
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
X-List-Received-Date: Tue, 05 Feb 2013 21:05:55 -0000
Content-Type: text/plain; charset=ISO-8859-1; format=flowed
Content-Transfer-Encoding: 7bit

On 02/04/2013 01:26 AM, Laurentiu Palcu wrote:
> Hi,
>
> Re-generating applications' cache every time the system is rebooted is not a
> very efficient process for an embedded device. Usually, the cache directory is
> used by applications to store data resulting from time consmuming I/O or
> calculation. So, this patchset will take out /var/cache from tmpfs.
>
I did a basic test with this change along with the "read-only-rootfs" 
IMAGE_FEATURE and things are looking pretty good.  The only thing I 
noticed is that we leave some /etc/*- files around, I know it's not this 
patch.

Acked-by: Saul Wold <sgw@linux.intel.com>

Thanks
	Sau!
> Thanks,
> Laurentiu
>
> The following changes since commit 75f470cd18d693a9a96d9849291c2c8de4dcbeb8:
>
>    qt4: Add space for _appends (2013-02-01 22:49:47 +0000)
>
> are available in the git repository at:
>
>    git://git.yoctoproject.org/poky-contrib lpalcu/remove_cache_from_volatiles
>    http://git.yoctoproject.org/cgit.cgi/poky-contrib/log/?h=lpalcu/remove_cache_from_volatiles
>
> Laurentiu Palcu (5):
>    base-files: remove /var/cache from volatiles
>    fs-perms: remove /var/cache from volatiles
>    initscripts: remove /var/cache from volatiles
>    systemd: remove /var/cache from volatiles
>    rpm: remove /var/volatiles/cache/rpm from the FILEs list
>
>   meta/files/fs-perms.txt                            |    1 -
>   meta/recipes-core/base-files/base-files_3.0.14.bb  |    4 ++--
>   .../initscripts/initscripts-1.0/volatiles          |    2 --
>   .../systemd/systemd/00-create-volatile.conf        |    1 -
>   meta/recipes-devtools/rpm/rpm_5.4.9.bb             |    1 -
>   5 files changed, 2 insertions(+), 7 deletions(-)
>


