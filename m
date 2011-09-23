Received: from mga14.intel.com ([143.182.124.37])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <sgw@linux.intel.com>) id 1R6vI0-0005Su-BB
	for openembedded-core@lists.openembedded.org;
	Fri, 23 Sep 2011 04:14:57 +0200
Received: from azsmga002.ch.intel.com ([10.2.17.35])
	by azsmga102.ch.intel.com with ESMTP; 22 Sep 2011 19:09:35 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.68,426,1312182000"; d="scan'208";a="19839718"
Received: from unknown (HELO [10.255.15.16]) ([10.255.15.16])
	by AZSMGA002.ch.intel.com with ESMTP; 22 Sep 2011 19:09:34 -0700
Message-ID: <4E7BEA5E.3040800@linux.intel.com>
Date: Thu, 22 Sep 2011 19:09:34 -0700
From: Saul Wold <sgw@linux.intel.com>
User-Agent: Mozilla/5.0 (X11; U; Linux i686 (x86_64); en-US;
	rv:1.9.2.22) Gecko/20110902 Thunderbird/3.1.14
MIME-Version: 1.0
To: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
References: <cover.1316680595.git.dexuan.cui@intel.com>
In-Reply-To: <cover.1316680595.git.dexuan.cui@intel.com>
Subject: Re: [PATCH 0/1] fix to bug 1507
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
X-List-Received-Date: Fri, 23 Sep 2011 02:14:57 -0000
Content-Type: text/plain; charset=ISO-8859-1; format=flowed
Content-Transfer-Encoding: 7bit

On 09/22/2011 01:38 AM, Dexuan Cui wrote:
> Thanks a lot for RP's suggestion about how to make the patch.
>
> The following changes since commit 468e4a2f0e63e9d33e88b98a7d075b186ef481b2:
>
>    glib-2.0: Drop old 2.27.5 development version (2011-09-22 08:47:22 +0100)
>
> are available in the git repository at:
>    git://git.pokylinux.org/poky-contrib dcui/bug-1507
>    http://git.pokylinux.org/cgit.cgi/poky-contrib/log/?h=dcui/bug-1507
>
> Dexuan Cui (1):
>    qemu-config: use pkg_postinst to generate the proper shutdown.desktop
>
>   meta/recipes-bsp/qemu-config/qemu-config.bb        |    7 ++++++-
>   .../qemu-config/qemuarm/shutdown.desktop           |   10 ----------
>   2 files changed, 6 insertions(+), 11 deletions(-)
>   delete mode 100644 meta/recipes-bsp/qemu-config/qemu-config/qemuarm/shutdown.desktop
>

Merged into OE-Core

Thanks
	Sau!


