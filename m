Received: from mga03.intel.com ([143.182.124.21])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <sgw@linux.intel.com>) id 1S7UmL-0003qB-S5
	for openembedded-core@lists.openembedded.org;
	Tue, 13 Mar 2012 17:40:54 +0100
Received: from azsmga002.ch.intel.com ([10.2.17.35])
	by azsmga101.ch.intel.com with ESMTP; 13 Mar 2012 09:32:08 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.71,315,1320652800"; d="scan'208";a="77009103"
Received: from unknown (HELO [10.255.15.137]) ([10.255.15.137])
	by AZSMGA002.ch.intel.com with ESMTP; 13 Mar 2012 09:32:08 -0700
Message-ID: <4F5F7688.8080600@linux.intel.com>
Date: Tue, 13 Mar 2012 09:32:08 -0700
From: Saul Wold <sgw@linux.intel.com>
User-Agent: Mozilla/5.0 (X11; Linux x86_64;
	rv:10.0.1) Gecko/20120216 Thunderbird/10.0.1
MIME-Version: 1.0
To: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
References: <1331587452-27755-1-git-send-email-obi@opendreambox.org>
In-Reply-To: <1331587452-27755-1-git-send-email-obi@opendreambox.org>
Subject: Re: [PATCH 0/5] Python related patches
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
X-List-Received-Date: Tue, 13 Mar 2012 16:40:54 -0000
Content-Type: text/plain; charset=ISO-8859-1; format=flowed
Content-Transfer-Encoding: 7bit

On 03/12/2012 02:24 PM, Andreas Oberritter wrote:
> This set of patches obsoletes all my pending
> python-related patches. See the individual patches
> for detailed descriptions.
>
> All patches were runtime-tested on mips32el.
>
> Andreas Oberritter (5):
>    python, python-native: always set platform to linux2
>    python: regenerate plat-linux2/*.py
>    python: depend on bzip2
>    python-native: distutils: don't use libdir, remove dead code path
>    python, python-native: bump PR
>
>   ...2-distutils-prefix-is-inside-staging-area.patch |    6 ++--
>   .../sys_platform_is_now_always_linux2.patch        |   39 ++++++++++++++++++++
>   .../recipes-devtools/python/python-native_2.7.2.bb |    1 +
>   meta/recipes-devtools/python/python.inc            |    2 +-
>   .../python/python/07-linux3-regen-fix.patch        |   18 ---------
>   .../python/sys_platform_is_now_always_linux2.patch |   39 ++++++++++++++++++++
>   meta/recipes-devtools/python/python_2.7.2.bb       |   15 +++++++-
>   7 files changed, 96 insertions(+), 24 deletions(-)
>   create mode 100644 meta/recipes-devtools/python/python-native/sys_platform_is_now_always_linux2.patch
>   delete mode 100644 meta/recipes-devtools/python/python/07-linux3-regen-fix.patch
>   create mode 100644 meta/recipes-devtools/python/python/sys_platform_is_now_always_linux2.patch
>

Merged this series along with util-linux, and package.bbclass

Thanks
	Sau!


