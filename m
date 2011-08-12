Received: from mga14.intel.com ([143.182.124.37])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <sgw@linux.intel.com>) id 1Qrvyv-0001ey-83
	for openembedded-core@lists.openembedded.org;
	Fri, 12 Aug 2011 19:57:17 +0200
Received: from azsmga002.ch.intel.com ([10.2.17.35])
	by azsmga102.ch.intel.com with ESMTP; 12 Aug 2011 10:52:43 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.67,363,1309762800"; 
   d="scan'208";a="6593939"
Received: from unknown (HELO [10.255.14.248]) ([10.255.14.248])
	by AZSMGA002.ch.intel.com with ESMTP; 12 Aug 2011 10:52:43 -0700
Message-ID: <4E45686B.4070700@linux.intel.com>
Date: Fri, 12 Aug 2011 10:52:43 -0700
From: Saul Wold <sgw@linux.intel.com>
User-Agent: Mozilla/5.0 (X11; U; Linux x86_64; en-US;
	rv:1.9.2.17) Gecko/20110428 Fedora/3.1.10-1.fc13 Thunderbird/3.1.10
MIME-Version: 1.0
To: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
References: <cover.1313077484.git.mark.hatle@windriver.com>
In-Reply-To: <cover.1313077484.git.mark.hatle@windriver.com>
Subject: Re: [PATCH 0/2] Fix on-target RPM platform mismatch
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
X-List-Received-Date: Fri, 12 Aug 2011 17:57:17 -0000
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 08/11/2011 08:46 AM, Mark Hatle wrote:
> This fixes the Yocto bug #1352.  When trying to install an arm package
> on the target, the platform no longer matched properly.  The platform was
> being set to arm*-oe-linux-gnu, instead of the proper arm*-oe-linux-gnueabi.
>
> The following changes since commit 87456db10d6e615e5f49453befedaa5957dfe292:
>
>    package_rpm.bbclass: Update the platform config and --target (2011-08-11 10:42:02 -0500)
>
> are available in the git repository at:
>    git://git.pokylinux.org/poky-contrib mhatle/fix_1352
>    http://git.pokylinux.org/cgit.cgi/poky-contrib/log/?h=mhatle/fix_1352
>
> Mark Hatle (2):
>    rpm: Fix the canonical arch --target processing and cleanup
>    package_rpm.bbclass: Update the platform config and --target
>
>   meta/classes/package_rpm.bbclass                   |   14 ++-
>   .../recipes-devtools/rpm/rpm/export-rpmbag-h.patch |   45 -------
>   meta/recipes-devtools/rpm/rpm/hdraddorappend.patch |   22 ----
>   meta/recipes-devtools/rpm/rpm/rpm-canonarch.patch  |  134 ++++++++++++++++++++
>   meta/recipes-devtools/rpm/rpm/rpm-no-loop.patch    |   38 ------
>   meta/recipes-devtools/rpm/rpm/rpm-no-loopmsg.patch |   16 +++
>   meta/recipes-devtools/rpm/rpm/rpm-nrescan.patch    |   17 ---
>   meta/recipes-devtools/rpm/rpm_5.4.0.bb             |    8 +-
>   8 files changed, 164 insertions(+), 130 deletions(-)
>   delete mode 100644 meta/recipes-devtools/rpm/rpm/export-rpmbag-h.patch
>   delete mode 100644 meta/recipes-devtools/rpm/rpm/hdraddorappend.patch
>   create mode 100644 meta/recipes-devtools/rpm/rpm/rpm-canonarch.patch
>   delete mode 100644 meta/recipes-devtools/rpm/rpm/rpm-no-loop.patch
>   create mode 100644 meta/recipes-devtools/rpm/rpm/rpm-no-loopmsg.patch
>   delete mode 100644 meta/recipes-devtools/rpm/rpm/rpm-nrescan.patch
>

Merged into OE-Core

Thanks
	Sau!


