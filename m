Received: from mga14.intel.com ([143.182.124.37])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <sgw@linux.intel.com>) id 1Qrw1d-0001yF-KC
	for openembedded-core@lists.openembedded.org;
	Fri, 12 Aug 2011 20:00:05 +0200
Received: from azsmga001.ch.intel.com ([10.2.17.19])
	by azsmga102.ch.intel.com with ESMTP; 12 Aug 2011 10:55:31 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.67,363,1309762800"; d="scan'208";a="37913752"
Received: from unknown (HELO [10.255.14.248]) ([10.255.14.248])
	by azsmga001.ch.intel.com with ESMTP; 12 Aug 2011 10:55:31 -0700
Message-ID: <4E456913.9090101@linux.intel.com>
Date: Fri, 12 Aug 2011 10:55:31 -0700
From: Saul Wold <sgw@linux.intel.com>
User-Agent: Mozilla/5.0 (X11; U; Linux x86_64; en-US;
	rv:1.9.2.17) Gecko/20110428 Fedora/3.1.10-1.fc13 Thunderbird/3.1.10
MIME-Version: 1.0
To: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
References: <cover.1313111544.git.mark.hatle@windriver.com>
In-Reply-To: <cover.1313111544.git.mark.hatle@windriver.com>
Subject: Re: [PATCH 0/3] Fix ATTEMPTONLY and SUGGESTS in package_rpm
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
X-List-Received-Date: Fri, 12 Aug 2011 18:00:05 -0000
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 08/11/2011 06:14 PM, Mark Hatle wrote:
> Fix ATTEMPTONLY and SUGGESTS in package_rpm.  This relies on the previous
> changes to the rpm platform and package_rpm.bbclass I sent earlier today.
>
> Note patch 1 and 2 are the earlier set, which I am not resending.
>
> The following changes since commit a92d56058b21913570bb17ae416c3b00afce055e:
>
>    gnome-doc-utils: respect python-dir setting EXTRA_OECONF (2011-08-11 19:13:38 +0100)
>
> are available in the git repository at:
>    git://git.pokylinux.org/poky-contrib mhatle/fix_1366
>    http://git.pokylinux.org/cgit.cgi/poky-contrib/log/?h=mhatle/fix_1366
>
> Mark Hatle (3):
>    rpm: Fix the canonical arch --target processing and cleanup
>    package_rpm.bbclass: Update the platform config and --target
>    package_rpm: Fix attemptonly and suggest packages
>
>   meta/classes/package_rpm.bbclass                   |   39 +++++--
>   .../recipes-devtools/rpm/rpm/export-rpmbag-h.patch |   45 -------
>   meta/recipes-devtools/rpm/rpm/hdraddorappend.patch |   22 ----
>   meta/recipes-devtools/rpm/rpm/rpm-canonarch.patch  |  134 ++++++++++++++++++++
>   meta/recipes-devtools/rpm/rpm/rpm-no-loop.patch    |   38 ------
>   meta/recipes-devtools/rpm/rpm/rpm-no-loopmsg.patch |   16 +++
>   meta/recipes-devtools/rpm/rpm/rpm-nrescan.patch    |   17 ---
>   meta/recipes-devtools/rpm/rpm_5.4.0.bb             |    8 +-
>   8 files changed, 184 insertions(+), 135 deletions(-)
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



