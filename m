Received: from mga09.intel.com ([134.134.136.24])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <sgw@linux.intel.com>) id 1S7ChF-0004uS-Vo
	for openembedded-core@lists.openembedded.org;
	Mon, 12 Mar 2012 22:22:28 +0100
Received: from orsmga001.jf.intel.com ([10.7.209.18])
	by orsmga102.jf.intel.com with ESMTP; 12 Mar 2012 14:13:42 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.67,352,1309762800"; d="scan'208";a="117023792"
Received: from unknown (HELO [10.255.15.137]) ([10.255.15.137])
	by orsmga001.jf.intel.com with ESMTP; 12 Mar 2012 14:13:41 -0700
Message-ID: <4F5E6705.2050703@linux.intel.com>
Date: Mon, 12 Mar 2012 14:13:41 -0700
From: Saul Wold <sgw@linux.intel.com>
User-Agent: Mozilla/5.0 (X11; Linux x86_64;
	rv:10.0.1) Gecko/20120216 Thunderbird/10.0.1
MIME-Version: 1.0
To: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
References: <1330928512-12937-1-git-send-email-raj.khem@gmail.com>
In-Reply-To: <1330928512-12937-1-git-send-email-raj.khem@gmail.com>
Subject: Re: [PATCH] gcc: Upgrade to 4.6.3 release
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
X-List-Received-Date: Mon, 12 Mar 2012 21:22:51 -0000
Content-Type: text/plain; charset=ISO-8859-1; format=flowed
Content-Transfer-Encoding: 7bit

On 03/04/2012 10:21 PM, Khem Raj wrote:
> core-image-sato/core-image-minimal builds and boots
> on all qemu machines
>
> Signed-off-by: Khem Raj<raj.khem@gmail.com>
> ---
>   meta/recipes-devtools/gcc/gcc-4.6.inc              |    9 +-
>   .../GPLUSPLUS_INCLUDE_DIR_with_sysroot.patch       |   32 +++---
>   .../gcc/gcc-4.6/gcc-flags-for-build.patch          |   97 +++++++++++---------
>   .../gcc-4.6/gcc-poison-system-directories.patch    |   80 ++++++++--------
>   .../gcc/gcc-4.6/gcc-with-linker-hash-style.patch   |   36 ++++----
>   .../gcc/gcc-4.6/volatile_access_backport.patch     |   28 ------
>   6 files changed, 131 insertions(+), 151 deletions(-)
>   delete mode 100644 meta/recipes-devtools/gcc/gcc-4.6/volatile_access_backport.patch
>
Merged into OE-Core

Thanks
	Sau!



