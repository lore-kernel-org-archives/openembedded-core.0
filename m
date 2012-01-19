Received: from mga14.intel.com ([143.182.124.37])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <sgw@linux.intel.com>) id 1Rnx2r-0004gs-QH
	for openembedded-core@lists.openembedded.org;
	Thu, 19 Jan 2012 19:49:10 +0100
Received: from azsmga002.ch.intel.com ([10.2.17.35])
	by azsmga102.ch.intel.com with ESMTP; 19 Jan 2012 10:41:29 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.71,315,1320652800"; d="scan'208";a="58095681"
Received: from unknown (HELO [10.255.14.6]) ([10.255.14.6])
	by AZSMGA002.ch.intel.com with ESMTP; 19 Jan 2012 10:41:28 -0800
Message-ID: <4F1863D8.8030203@linux.intel.com>
Date: Thu, 19 Jan 2012 10:41:28 -0800
From: Saul Wold <sgw@linux.intel.com>
User-Agent: Mozilla/5.0 (X11; Linux x86_64;
	rv:8.0) Gecko/20111115 Thunderbird/8.0
MIME-Version: 1.0
To: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
References: <1326870368-22219-1-git-send-email-raj.khem@gmail.com>
In-Reply-To: <1326870368-22219-1-git-send-email-raj.khem@gmail.com>
Subject: Re: [PATCH V2] uclibc: Upgrade to latest master
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
X-List-Received-Date: Thu, 19 Jan 2012 18:49:10 -0000
Content-Type: text/plain; charset=ISO-8859-1; format=flowed
Content-Transfer-Encoding: 7bit

On 01/17/2012 11:06 PM, Khem Raj wrote:
> Document the patches
>
> Signed-off-by: Khem Raj<raj.khem@gmail.com>
> ---
>   .../uclibc/uclibc-git/cross_compile_check.patch    |   13 +
>   .../recipes-core/uclibc/uclibc-git/fix_libdl.patch |   83 ++++
>   ...so_use_arm_dl_linux_resolve_in_thumb_mode.patch |    6 +
>   .../uclibc/uclibc-git/orign_path.patch             |  183 --------
>   .../uclibc/uclibc-git/powerpc_copysignl.patch      |    6 +
>   .../uclibc-git/remove_attribute_optimize_Os.patch  |    5 +
>   meta/recipes-core/uclibc/uclibc-git/rtld_no.patch  |  216 ---------
>   meta/recipes-core/uclibc/uclibc-git/uClibc.distro  |    2 +
>   .../uclibc/uclibc-git/uclibc-arm-ftruncate64.patch |    5 +
>   .../uclibc/uclibc-git/uclibc-execvpe.patch         |    3 +
>   .../uclibc-git/uclibc_enable_log2_test.patch       |    5 +
>   .../uclibc-git/uclibc_scheduler_update.patch       |  455 --------------------
>   meta/recipes-core/uclibc/uclibc.inc                |    2 +-
>   meta/recipes-core/uclibc/uclibc_git.bb             |   10 +-
>   14 files changed, 134 insertions(+), 860 deletions(-)
>   create mode 100644 meta/recipes-core/uclibc/uclibc-git/cross_compile_check.patch
>   create mode 100644 meta/recipes-core/uclibc/uclibc-git/fix_libdl.patch
>   delete mode 100644 meta/recipes-core/uclibc/uclibc-git/orign_path.patch
>   delete mode 100644 meta/recipes-core/uclibc/uclibc-git/rtld_no.patch
>   delete mode 100644 meta/recipes-core/uclibc/uclibc-git/uclibc_scheduler_update.patch
>

Merged into OE-Core

Thanks
	Sau!



