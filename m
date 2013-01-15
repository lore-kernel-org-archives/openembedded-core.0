Received: from mga11.intel.com ([192.55.52.93])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <sgw@linux.intel.com>) id 1Tv1Mg-0000VD-1v
	for openembedded-core@lists.openembedded.org;
	Tue, 15 Jan 2013 08:55:26 +0100
Received: from fmsmga002.fm.intel.com ([10.253.24.26])
	by fmsmga102.fm.intel.com with ESMTP; 14 Jan 2013 23:40:00 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.84,471,1355126400"; d="scan'208";a="276977873"
Received: from unknown (HELO [10.255.14.213]) ([10.255.14.213])
	by fmsmga002.fm.intel.com with ESMTP; 14 Jan 2013 23:40:00 -0800
Message-ID: <50F507D0.2060707@linux.intel.com>
Date: Mon, 14 Jan 2013 23:40:00 -0800
From: Saul Wold <sgw@linux.intel.com>
User-Agent: Mozilla/5.0 (X11; Linux x86_64;
	rv:17.0) Gecko/17.0 Thunderbird/17.0
MIME-Version: 1.0
To: Constantin Musca <constantinx.musca@intel.com>
References: <cover.1358175955.git.constantinx.musca@intel.com>
In-Reply-To: <cover.1358175955.git.constantinx.musca@intel.com>
Cc: openembedded-core@lists.openembedded.org
Subject: Re: [PATCH v2 0/6] On-target multilib gcc enhacement
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
X-List-Received-Date: Tue, 15 Jan 2013 07:55:27 -0000
Content-Type: text/plain; charset=ISO-8859-1; format=flowed
Content-Transfer-Encoding: 7bit

On 01/14/2013 07:16 AM, Constantin Musca wrote:
> This patchset enables the user to build gcc with configurable multilib options.
> The following changes since commit 53cc748b93e8af584557d6db5309c3e955182c5c:
>
>    linux-libc-headers: fix headers install in long path name environments (2013-01-10 23:53:51 +0000)
>
> are available in the git repository at:
>
>    git://git.pokylinux.org/poky-contrib cmuscax/gcc_enhan3
>    http://git.pokylinux.org/cgit.cgi/poky-contrib/log/?h=cmuscax/gcc_enhan3
>
> Constantin Musca (6):
>    gcc: add missing dependency (zlib)
>    gcc: remove the 64bithack patch
>    multilib.conf: add TARGET_ARCH to MULTILIB_SAVE_VARNAME
>    gcc: enable multilib for target gcc
>    tune-mips32: add BASE_LIB to mips32 tunes
>    tune-ppc603e: add BASE_LIB
>
This patch set caused a number of failures on the Autobuilder today. 
please check the AB results.

Thanks

	Sau!

>   meta/conf/machine/include/tune-mips32.inc          |   4 +
>   meta/conf/machine/include/tune-ppc603e.inc         |   1 +
>   meta/conf/multilib.conf                            |   2 +-
>   meta/recipes-devtools/gcc/gcc-4.7.inc              |   5 +-
>   meta/recipes-devtools/gcc/gcc-4.7/64bithack.patch  |  63 -------
>   meta/recipes-devtools/gcc/gcc-common.inc           |  25 +++
>   meta/recipes-devtools/gcc/gcc-configure-common.inc |   3 +-
>   meta/recipes-devtools/gcc/gcc-configure-target.inc |   1 +
>   meta/recipes-devtools/gcc/gcc-multilib-config.inc  | 200 +++++++++++++++++++++
>   meta/recipes-devtools/gcc/libgcc_4.7.bb            |  44 +++++
>   10 files changed, 280 insertions(+), 68 deletions(-)
>   delete mode 100644 meta/recipes-devtools/gcc/gcc-4.7/64bithack.patch
>   create mode 100644 meta/recipes-devtools/gcc/gcc-multilib-config.inc
>


