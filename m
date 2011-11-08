Received: from mga14.intel.com ([143.182.124.37])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <sgw@linux.intel.com>) id 1RNuiy-0005Zs-3c
	for openembedded-core@lists.openembedded.org;
	Wed, 09 Nov 2011 00:05:00 +0100
Received: from azsmga002.ch.intel.com ([10.2.17.35])
	by azsmga102.ch.intel.com with ESMTP; 08 Nov 2011 14:58:44 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.69,479,1315206000"; d="scan'208";a="34657099"
Received: from unknown (HELO [10.255.12.14]) ([10.255.12.14])
	by AZSMGA002.ch.intel.com with ESMTP; 08 Nov 2011 14:58:43 -0800
Message-ID: <4EB9B423.6090807@linux.intel.com>
Date: Tue, 08 Nov 2011 14:58:43 -0800
From: Saul Wold <sgw@linux.intel.com>
User-Agent: Mozilla/5.0 (X11; Linux x86_64;
	rv:7.0) Gecko/20110927 Thunderbird/7.0
MIME-Version: 1.0
To: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
References: <cover.1320268188.git.mark.hatle@windriver.com>
In-Reply-To: <cover.1320268188.git.mark.hatle@windriver.com>
Subject: Re: [PATCH 0/1] Uprev to pseudo 1.2
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
X-List-Received-Date: Tue, 08 Nov 2011 23:05:00 -0000
Content-Type: text/plain; charset=ISO-8859-1; format=flowed
Content-Transfer-Encoding: 7bit

On 11/02/2011 02:11 PM, Mark Hatle wrote:
> Uprev to pseudo 1.2.
>
> This was heavily tested by building oe-core with numerous image
> configurations.  Each configuration generated the same image before and
> after the change from the current to new version of pseudo.
>
> The primary purpose of this change is to enable the PSEUDO_UNLOAD
> functionality that may be used for performance enhancements in future
> versions of oe-core.
>
> The following changes since commit 37579d7d74d127c90c1e078d05c5bf4ba0b3f755:
>
>    meta: glib-2.0: don't apply qsort_r test removable patch for native version (2011-11-02 09:08:21 +0000)
>
> are available in the git repository at:
>    git://git.pokylinux.org/poky-contrib mhatle/pseudo
>    http://git.pokylinux.org/cgit.cgi/poky-contrib/log/?h=mhatle/pseudo
>
> Mark Hatle (1):
>    pseudo: Uprev pseudo to version 1.2
>
>   .../conf/distro/include/distro_tracking_fields.inc |    6 +-
>   .../pseudo/pseudo/realpath_fix.patch               |  165 --------------------
>   .../pseudo/{pseudo_1.1.1.bb =>  pseudo_1.2.bb}      |    7 +-
>   meta/recipes-devtools/pseudo/pseudo_git.bb         |    6 +-
>   4 files changed, 9 insertions(+), 175 deletions(-)
>   delete mode 100644 meta/recipes-devtools/pseudo/pseudo/realpath_fix.patch
>   rename meta/recipes-devtools/pseudo/{pseudo_1.1.1.bb =>  pseudo_1.2.bb} (48%)
>
Merged to OE-Core

Thanks	
Sau!


