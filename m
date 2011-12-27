Received: from mga03.intel.com ([143.182.124.21])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <sgw@linux.intel.com>) id 1Rfbvq-0006mD-H9
	for openembedded-core@lists.openembedded.org;
	Tue, 27 Dec 2011 19:39:27 +0100
Received: from azsmga001.ch.intel.com ([10.2.17.19])
	by azsmga101.ch.intel.com with ESMTP; 27 Dec 2011 10:32:13 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.71,315,1320652800"; d="scan'208";a="89988013"
Received: from unknown (HELO [10.255.12.84]) ([10.255.12.84])
	by azsmga001.ch.intel.com with ESMTP; 27 Dec 2011 10:32:12 -0800
Message-ID: <4EFA0F2C.30906@linux.intel.com>
Date: Tue, 27 Dec 2011 10:32:12 -0800
From: Saul Wold <sgw@linux.intel.com>
User-Agent: Mozilla/5.0 (X11; Linux x86_64;
	rv:7.0) Gecko/20110927 Thunderbird/7.0
MIME-Version: 1.0
To: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
References: <cover.1324601996.git.mark.hatle@windriver.com>
In-Reply-To: <cover.1324601996.git.mark.hatle@windriver.com>
Subject: Re: [PATCH 0/7] Misc fixes and cleanups
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
X-List-Received-Date: Tue, 27 Dec 2011 18:39:27 -0000
Content-Type: text/plain; charset=ISO-8859-1; format=flowed
Content-Transfer-Encoding: 7bit

On 12/22/2011 05:01 PM, Mark Hatle wrote:
> Misc fixes and cleanups that affect various parts of the system...
>
> The following changes since commit c38693f78c968ab5f4bb557c20d1c8c55393ed6b:
>
>    opkg: Fix installation order in feeds with mutiple providers of packages (2011-12-22 22:38:09 +0000)
>
> are available in the git repository at:
>    git://git.pokylinux.org/poky-contrib mhatle/misc-fixes
>    http://git.pokylinux.org/cgit.cgi/poky-contrib/log/?h=mhatle/misc-fixes
>
> Mark Hatle (7):
>    package.bbclass: Adjust RPM call to use dynamic location for magic
>      files
>    package_rpm.bbclass:  Add RPMSPEC_PREAMBLE
>    rpm_5.4.0: Fix configuration issue with native/nativesdk
>    udev: Remove linux-libc-headers dependency
>    gperf: Add missing SRC checksum
>    which: Add missing SRC checksums
The Above were all merged to OE-Core

Thanks
	Sau!


>    base.bbclass: Allow buildstats to be optionally supplied
>
No sure about this, no comments, but RP did not take it yet.

Sau!


>   meta/classes/base.bbclass                  |    1 -
>   meta/classes/package.bbclass               |    2 +-
>   meta/classes/package_rpm.bbclass           |    8 +++++++-
>   meta/conf/local.conf.sample                |    3 ++-
>   meta/recipes-core/udev/udev-new.inc        |    2 +-
>   meta/recipes-devtools/rpm/rpm_5.4.0.bb     |    3 ++-
>   meta/recipes-extended/gperf/gperf_3.0.3.bb |    3 +++
>   meta/recipes-extended/which/which_2.18.bb  |    3 +++
>   8 files changed, 19 insertions(+), 6 deletions(-)
>


