Received: from mga03.intel.com ([143.182.124.21])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <sgw@linux.intel.com>) id 1SNsdJ-00006X-Di
	for openembedded-core@lists.openembedded.org;
	Fri, 27 Apr 2012 23:23:17 +0200
Received: from azsmga002.ch.intel.com ([10.2.17.35])
	by azsmga101.ch.intel.com with ESMTP; 27 Apr 2012 14:13:38 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.71,315,1320652800"; d="scan'208";a="93983286"
Received: from unknown (HELO [10.255.12.123]) ([10.255.12.123])
	by AZSMGA002.ch.intel.com with ESMTP; 27 Apr 2012 14:13:37 -0700
Message-ID: <4F9B0C01.1060305@linux.intel.com>
Date: Fri, 27 Apr 2012 14:13:37 -0700
From: Saul Wold <sgw@linux.intel.com>
User-Agent: Mozilla/5.0 (X11; Linux x86_64;
	rv:11.0) Gecko/20120329 Thunderbird/11.0.1
MIME-Version: 1.0
To: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
References: <cover.1335118369.git.otavio@ossystems.com.br>
In-Reply-To: <cover.1335118369.git.otavio@ossystems.com.br>
Subject: Re: [PATCH 0/5] Patches from O.S. Systems' tree
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
X-List-Received-Date: Fri, 27 Apr 2012 21:23:17 -0000
Content-Type: text/plain; charset=ISO-8859-1; format=flowed
Content-Transfer-Encoding: 7bit

On 04/22/2012 12:15 PM, Otavio Salvador wrote:
> The u-boot new release has been tested on i.MX53 and has D_P = -1 to
> allow people to test it. Please give them a test.
>
> The following changes since commit b19af63a201933038a044f29570710fe38365f28:
>
>    self-hosted-image: Update poky revision to point at the 1.2 release branch (2012-04-22 16:07:44 +0100)
>
> are available in the git repository at:
>    git://github.com/OSSystems/oe-core master
>    https://github.com/OSSystems/oe-core/tree/HEAD
>
> Otavio Salvador (5):
>    connman: backport test script fixes
>    u-boot.inc: fix compilation when using 'gold' as linker
>    u-boot-fw-utils: add 2012.04 release
>    u-boot-mkimage: add 2012.04 release
>    u-boot: add 2012.04 release
>
>   meta/recipes-bsp/u-boot/u-boot-fw-utils_2012.04.bb |   33 ++++++++++++
>   meta/recipes-bsp/u-boot/u-boot-mkimage_2012.04.bb  |   33 ++++++++++++
>   meta/recipes-bsp/u-boot/u-boot.inc                 |    4 ++
>   meta/recipes-bsp/u-boot/u-boot_2012.04.bb          |   30 +++++++++++
>   .../connman/test-set-ipv4-method-api-fix.patch     |   50 ++++++++++++++++++
>   .../connman/test-set-ipv6-method-api-fix.patch     |   55 ++++++++++++++++++++
>   meta/recipes-connectivity/connman/connman_0.79.bb  |    4 +-
>   7 files changed, 208 insertions(+), 1 deletions(-)
>   create mode 100644 meta/recipes-bsp/u-boot/u-boot-fw-utils_2012.04.bb
>   create mode 100644 meta/recipes-bsp/u-boot/u-boot-mkimage_2012.04.bb
>   create mode 100644 meta/recipes-bsp/u-boot/u-boot_2012.04.bb
>   create mode 100644 meta/recipes-connectivity/connman/connman/test-set-ipv4-method-api-fix.patch
>   create mode 100644 meta/recipes-connectivity/connman/connman/test-set-ipv6-method-api-fix.patch
>

Merged into OE-Core

Thanks
	Sau!


