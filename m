Received: from mga11.intel.com ([192.55.52.93])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <sgw@linux.intel.com>) id 1RP1K4-0004sd-NW
	for openembedded-core@lists.openembedded.org;
	Sat, 12 Nov 2011 01:19:52 +0100
Received: from fmsmga001.fm.intel.com ([10.253.24.23])
	by fmsmga102.fm.intel.com with ESMTP; 11 Nov 2011 16:13:33 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.69,497,1315206000"; d="scan'208";a="84208797"
Received: from unknown (HELO [10.255.15.157]) ([10.255.15.157])
	by fmsmga001.fm.intel.com with ESMTP; 11 Nov 2011 16:13:33 -0800
Message-ID: <4EBDBA2D.2050706@linux.intel.com>
Date: Fri, 11 Nov 2011 16:13:33 -0800
From: Saul Wold <sgw@linux.intel.com>
User-Agent: Mozilla/5.0 (X11; Linux x86_64;
	rv:7.0) Gecko/20110927 Thunderbird/7.0
MIME-Version: 1.0
To: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
References: <cover.1320949721.git.mark.hatle@windriver.com>
In-Reply-To: <cover.1320949721.git.mark.hatle@windriver.com>
Subject: Re: [PATCH 0/5] Change the way RPM handles pre/post scripts
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
X-List-Received-Date: Sat, 12 Nov 2011 00:19:52 -0000
Content-Type: text/plain; charset=ISO-8859-1; format=flowed
Content-Transfer-Encoding: 7bit

On 11/10/2011 10:30 AM, Mark Hatle wrote:
> We change the way rootfs_rpm handles pre / post scripts in order to
> enable preinst scripts and better handling of post scripts.
>
> The following changes since commit 379c77d1516fe8fdbd1cd7063f709b5266872b03:
>
>    populate_*.bbclass: Correct INSTALL variable name after recent multilib changes (2011-11-10 18:05:06 +0000)
>
> are available in the git repository at:
>    git://git.pokylinux.org/poky-contrib mhatle/rpm
>    http://git.pokylinux.org/cgit.cgi/poky-contrib/log/?h=mhatle/rpm
>
> Mark Hatle (5):
>    rootfs_rpm.bbclass: Enable pre and post install scripts
>    rootfs_rpm.bbclass: Turn off script debugging
>    wpa-supplicant: Avoid blocking the post install script at cross
>      rootfs time.
>    shadow: Generate the shadow files at rootfs construction
>    sudo: Avoid post install scripts
>
>   meta/classes/package_rpm.bbclass                   |   33 ++++-
>   meta/classes/rootfs_rpm.bbclass                    |   27 +---
>   .../wpa-supplicant/wpa-supplicant-0.7.inc          |    4 +-
>   .../wpa-supplicant/wpa-supplicant_0.7.3.bb         |    2 +-
>   .../rpm/rpm/rpm-scriptletexechelper.patch          |  159 ++++++++++++++++++++
>   meta/recipes-devtools/rpm/rpm_5.4.0.bb             |    3 +-
>   meta/recipes-extended/shadow/shadow_4.1.4.3.bb     |   12 +-
>   meta/recipes-extended/sudo/sudo.inc                |    8 -
>   meta/recipes-extended/sudo/sudo_1.8.3.bb           |    5 +-
>   9 files changed, 214 insertions(+), 39 deletions(-)
>   create mode 100644 meta/recipes-devtools/rpm/rpm/rpm-scriptletexechelper.patch
>
Merged into OE-Core

Thanks	
	Sau!



