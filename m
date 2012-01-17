Received: from mga03.intel.com ([143.182.124.21])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <sgw@linux.intel.com>) id 1RnGYt-0000eE-Jk
	for openembedded-core@lists.openembedded.org;
	Tue, 17 Jan 2012 22:27:23 +0100
Received: from azsmga001.ch.intel.com ([10.2.17.19])
	by azsmga101.ch.intel.com with ESMTP; 17 Jan 2012 13:19:45 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.71,315,1320652800"; d="scan'208";a="96888230"
Received: from unknown (HELO [10.255.14.6]) ([10.255.14.6])
	by azsmga001.ch.intel.com with ESMTP; 17 Jan 2012 13:19:44 -0800
Message-ID: <4F15E5F0.8010500@linux.intel.com>
Date: Tue, 17 Jan 2012 13:19:44 -0800
From: Saul Wold <sgw@linux.intel.com>
User-Agent: Mozilla/5.0 (X11; Linux x86_64;
	rv:8.0) Gecko/20111115 Thunderbird/8.0
MIME-Version: 1.0
To: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
References: <1326819016-7111-1-git-send-email-raj.khem@gmail.com>
	<1326819016-7111-2-git-send-email-raj.khem@gmail.com>
In-Reply-To: <1326819016-7111-2-git-send-email-raj.khem@gmail.com>
Subject: Re: [PATCH 2/2] uclibc: Upgrade to latest master
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
X-List-Received-Date: Tue, 17 Jan 2012 21:27:24 -0000
Content-Type: text/plain; charset=ISO-8859-1; format=flowed
Content-Transfer-Encoding: 7bit

On 01/17/2012 08:50 AM, Khem Raj wrote:
> Signed-off-by: Khem Raj<raj.khem@gmail.com>
> ---
>   .../uclibc/uclibc-git/cross_compile_check.patch    |   13 +
>   .../recipes-core/uclibc/uclibc-git/fix_libdl.patch |   58 +++
>   .../uclibc/uclibc-git/orign_path.patch             |  183 --------
>   meta/recipes-core/uclibc/uclibc-git/rtld_no.patch  |  216 ---------
>   .../uclibc/uclibc-git/sort-sections-option.patch   |   15 +
>   meta/recipes-core/uclibc/uclibc-git/uClibc.distro  |    2 +
>   .../uclibc-git/uclibc_scheduler_update.patch       |  455 --------------------
>   meta/recipes-core/uclibc/uclibc.inc                |    2 +-
>   meta/recipes-core/uclibc/uclibc_git.bb             |   13 +-
>   9 files changed, 97 insertions(+), 860 deletions(-)
>   create mode 100644 meta/recipes-core/uclibc/uclibc-git/cross_compile_check.patch
>   create mode 100644 meta/recipes-core/uclibc/uclibc-git/fix_libdl.patch
>   delete mode 100644 meta/recipes-core/uclibc/uclibc-git/orign_path.patch
>   delete mode 100644 meta/recipes-core/uclibc/uclibc-git/rtld_no.patch
>   create mode 100644 meta/recipes-core/uclibc/uclibc-git/sort-sections-option.patch
>   delete mode 100644 meta/recipes-core/uclibc/uclibc-git/uclibc_scheduler_update.patch
>
Khem,

These new patches don't have Upstream-Status or Signed-off-by tags.


Thanks
	Sau!



