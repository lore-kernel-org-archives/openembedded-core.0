Received: from mga14.intel.com ([143.182.124.37])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <sgw@linux.intel.com>) id 1Ss4cO-0000bx-8P
	for openembedded-core@lists.openembedded.org;
	Fri, 20 Jul 2012 06:15:08 +0200
Received: from azsmga001.ch.intel.com ([10.2.17.19])
	by azsmga102.ch.intel.com with ESMTP; 19 Jul 2012 21:03:24 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.71,315,1320652800"; d="scan'208";a="170666503"
Received: from unknown (HELO [10.255.12.214]) ([10.255.12.214])
	by azsmga001.ch.intel.com with ESMTP; 19 Jul 2012 21:03:24 -0700
Message-ID: <5008D88C.7000806@linux.intel.com>
Date: Thu, 19 Jul 2012 21:03:24 -0700
From: Saul Wold <sgw@linux.intel.com>
User-Agent: Mozilla/5.0 (X11; Linux x86_64;
	rv:13.0) Gecko/20120615 Thunderbird/13.0.1
MIME-Version: 1.0
To: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
References: <cover.1342616605.git.andrei@gherzan.ro>
In-Reply-To: <cover.1342616605.git.andrei@gherzan.ro>
Cc: Andrei Gherzan <andrei.gherzan@windriver.com>
Subject: Re: [PATCH V5 0/4] Modified the references to stat function in the patch's comments (only cover)
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
X-List-Received-Date: Fri, 20 Jul 2012 04:15:08 -0000
Content-Type: text/plain; charset=ISO-8859-1; format=flowed
Content-Transfer-Encoding: 7bit

On 07/18/2012 06:12 AM, Andrei Gherzan wrote:
> Changes from V4:
> Added SoB and Upstream-Status to patches.
> Modified the references to "stat" function in the patch's comments.
> Modified Ross's patch name in SRC_URI.
>
> Changes from V3: Messed up my patches. As well, added Ross Burton's patch:
> [OE-core] [PATCH 2/2] connman: fix crashes on startup on PPC/MIPS
>
> Update connman to v1.3.
> Fix dependencies needed for tests.
> Add patches to fix runtime segfault on mips and ppc architecture.
>
> Machine tested: qemux86 / qemumips
>
> Tests done on connman-gnome
>          OnlineMode / OfflineMode
>          Enable / Disable Wired Networks
>          Set manual IP configuration
>
> Tests on connman v.1.3
>          addr-test
>          iptables-test
>          polkit-test
>          get-global-timeservers
>          get-proxy-autoconfig
>          get-services
>          get-state
>          list-services
>          show-introspection
>          test-clock
>          test-connman
>          test-counter
>          test-manager
>          test-session
>
> The following changes since commit 90ad663909c0c8a405b22a510c9f957007d02669:
>
>    upstream_tracking: update boost (2012-07-09 17:21:38 +0100)
>
> are available in the git repository at:
>
>    git://git.yoctoproject.org/poky-contrib ag/connman1.3
>    http://git.yoctoproject.org/cgit.cgi/poky-contrib/log/?h=ag/connman1.3
>
> Andrei Gherzan (3):
>    connman: Update to version 1.3
>    connman.inc: Add missing dependencies needed by some tests
>    connman: Add patches to fix connman on fs with no d_type support
>
> Ross Burton (1):
>    connman: fix crashes on startup on PPC/MIPS
>
>   meta/recipes-connectivity/connman/connman.inc      |    4 +-
>   ...ck-that-the-string-isn-t-empty-before-spl.patch |   37 ++++++++++++
>   ...If-there-is-no-d_type-support-use-fstatat.patch |   61 ++++++++++++++++++++
>   ...If-there-is-no-d_type-support-use-fstatat.patch |   49 ++++++++++++++++
>   .../connman/{connman_1.0.bb => connman_1.3.bb}     |   11 ++--
>   5 files changed, 156 insertions(+), 6 deletions(-)
>   create mode 100644 meta/recipes-connectivity/connman/connman/0001-storage-check-that-the-string-isn-t-empty-before-spl.patch
>   create mode 100644 meta/recipes-connectivity/connman/connman/0001-timezone.c-If-there-is-no-d_type-support-use-fstatat.patch
>   create mode 100644 meta/recipes-connectivity/connman/connman/0002-storage.c-If-there-is-no-d_type-support-use-fstatat.patch
>   rename meta/recipes-connectivity/connman/{connman_1.0.bb => connman_1.3.bb} (40%)
>

Merged into OE-Core

Thanks
	Sau!


