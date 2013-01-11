Received: from mga03.intel.com ([143.182.124.21])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <sgw@linux.intel.com>) id 1Ttmep-00061R-AG
	for openembedded-core@lists.openembedded.org;
	Fri, 11 Jan 2013 23:01:00 +0100
Received: from azsmga001.ch.intel.com ([10.2.17.19])
	by azsmga101.ch.intel.com with ESMTP; 11 Jan 2013 13:45:42 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.84,453,1355126400"; d="scan'208";a="242932554"
Received: from unknown (HELO [10.255.14.194]) ([10.255.14.194])
	by azsmga001.ch.intel.com with ESMTP; 11 Jan 2013 13:45:42 -0800
Message-ID: <50F08806.2030509@linux.intel.com>
Date: Fri, 11 Jan 2013 13:45:42 -0800
From: Saul Wold <sgw@linux.intel.com>
User-Agent: Mozilla/5.0 (X11; Linux x86_64;
	rv:17.0) Gecko/17.0 Thunderbird/17.0
MIME-Version: 1.0
To: tom.zanussi@intel.com
References: <cover.1357930527.git.tom.zanussi@intel.com>
In-Reply-To: <cover.1357930527.git.tom.zanussi@intel.com>
Cc: openembedded-core@lists.openembedded.org
Subject: Re: [PATCH 0/5] Remove legacy lttng
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
X-List-Received-Date: Fri, 11 Jan 2013 22:01:01 -0000
Content-Type: text/plain; charset=ISO-8859-1; format=flowed
Content-Transfer-Encoding: 7bit

On 01/11/2013 11:20 AM, tom.zanussi@intel.com wrote:
> From: Tom Zanussi <tom.zanussi@intel.com>
>
> This patchset removes legacy lttng, which hasn't been operational in
> Yocto for awhile now.  lttng-2.0 is the current version, which was
> recently updated and now does work.
>
> With legacy lttng gone, lttng-2.0 can be renamed back to lttng, which
> this patchset also does.
>
> Tested on crownbay (kernel and userspace).
>
> v2 changes:
>
> - added upgrade path for lttng2->lttng rename
> - since the original posting, lttng-2.0 was upgraded, so the original
>    patchset had to be rebased on top of that
>
> The following changes since commit 53cc748b93e8af584557d6db5309c3e955182c5c:
>
>    linux-libc-headers: fix headers install in long path name environments (2013-01-10 23:53:51 +0000)
>
> are available in the git repository at:
>
>    git://git.yoctoproject.org/poky-contrib.git tzanussi/rm-legacy-lttng-v2
>    http://git.yoctoproject.org/cgit/cgit.cgi/poky-contrib/log/?h=tzanussi/rm-legacy-lttng-v2
>
> Tom Zanussi (5):
>    lttng: remove 'legacy' lttng
>    lttng2-ust: rename to lttng-ust
>    recipes-kernel/lttng-2.0: rename to recipes-kernel/lttng
>    lttng: remove references to legacy lttng recipes
>    recipe_color.inc: add lttng recipes

These last 2 should go to poky@yoctoproject.org

Thanks
	Sau!

>
>   meta-yocto/conf/distro/include/distro_alias.inc    |  3 --
>   meta-yocto/conf/distro/include/maintainers.inc     |  3 --
>   meta-yocto/conf/distro/include/recipe_color.inc    |  5 +--
>   .../packagegroup-core-tools-profile.bb             |  2 +-
>   .../{lttng-2.0 => lttng}/babeltrace_1.0.0.bb       |  0
>   meta/recipes-kernel/lttng/lttng-control_0.89.bb    | 23 ------------
>   ...modules-replace-KERNELDIR-with-KERNEL_SRC.patch |  0
>   .../{lttng-2.0 => lttng}/lttng-modules_2.1.0.bb    |  0
>   .../{lttng-2.0 => lttng}/lttng-tools_2.1.0.bb      |  2 +-
>   meta/recipes-kernel/lttng/lttng-ust_0.16.bb        | 32 -----------------
>   .../lttng-ust_2.1.0.bb}                            |  5 +++
>   .../lttng-viewer/add_linkage_to_lttvwindow.patch   | 42 ----------------------
>   meta/recipes-kernel/lttng/lttng-viewer_0.12.38.bb  | 40 ---------------------
>   13 files changed, 10 insertions(+), 147 deletions(-)
>   rename meta/recipes-kernel/{lttng-2.0 => lttng}/babeltrace_1.0.0.bb (100%)
>   delete mode 100644 meta/recipes-kernel/lttng/lttng-control_0.89.bb
>   rename meta/recipes-kernel/{lttng-2.0 => lttng}/lttng-modules/lttng-modules-replace-KERNELDIR-with-KERNEL_SRC.patch (100%)
>   rename meta/recipes-kernel/{lttng-2.0 => lttng}/lttng-modules_2.1.0.bb (100%)
>   rename meta/recipes-kernel/{lttng-2.0 => lttng}/lttng-tools_2.1.0.bb (97%)
>   delete mode 100644 meta/recipes-kernel/lttng/lttng-ust_0.16.bb
>   rename meta/recipes-kernel/{lttng-2.0/lttng2-ust_2.1.0.bb => lttng/lttng-ust_2.1.0.bb} (87%)
>   delete mode 100644 meta/recipes-kernel/lttng/lttng-viewer/add_linkage_to_lttvwindow.patch
>   delete mode 100644 meta/recipes-kernel/lttng/lttng-viewer_0.12.38.bb
>


