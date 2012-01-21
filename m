Received: from mga14.intel.com ([143.182.124.37])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <sgw@linux.intel.com>) id 1RoS5n-0004GS-FO
	for openembedded-core@lists.openembedded.org;
	Sat, 21 Jan 2012 04:58:15 +0100
Received: from azsmga002.ch.intel.com ([10.2.17.35])
	by azsmga102.ch.intel.com with ESMTP; 20 Jan 2012 19:50:33 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.71,315,1320652800"; d="scan'208";a="58605840"
Received: from unknown (HELO [10.255.14.79]) ([10.255.14.79])
	by AZSMGA002.ch.intel.com with ESMTP; 20 Jan 2012 19:50:32 -0800
Message-ID: <4F1A3608.70002@linux.intel.com>
Date: Fri, 20 Jan 2012 19:50:32 -0800
From: Saul Wold <sgw@linux.intel.com>
User-Agent: Mozilla/5.0 (X11; Linux x86_64;
	rv:8.0) Gecko/20111115 Thunderbird/8.0
MIME-Version: 1.0
To: Liming Wang <liming.wang@windriver.com>
References: <1325752666-28560-1-git-send-email-liming.wang@windriver.com>
In-Reply-To: <1325752666-28560-1-git-send-email-liming.wang@windriver.com>
Cc: openembedded-core@lists.openembedded.org
Subject: Re: [PATCH 0/4] qemuppc: replace emulation of qemuppc
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
X-List-Received-Date: Sat, 21 Jan 2012 03:58:15 -0000
Content-Type: text/plain; charset=ISO-8859-1; format=flowed
Content-Transfer-Encoding: 7bit

On 01/05/2012 12:37 AM, Liming Wang wrote:
> Hi Richard,
>
> These patches are aimed to replace emulation of qemuppc from prep to mac99.
> With this new emulation, qemuppc now supports framebuffer and the network
> works well.
>
Is there anything that needs to be setup differently for the runqemu 
scripts?  Our sanity tests have failed after changing to the new ppc 
code and I wonder if there is something for the command line or ???

THanks
	Sau!

> The kernel config also needs modification and I will let Bruce to review the
> patches.
>
> The following changes since commit 0ff1d667dc23b0cc903c18f1b5e032c2b6630aae:
>
>    distro: Add poky-tiny distro definition
>
> are available in the git repository at:
>
>    git://128.224.162.211/poky.git qemuppc-new
>
> Liming Wang (4):
>        qemuppc: replace emulation of qemuppc from prep to mac99
>        qemuppc: add pointercal file
>        qemuppc: add machconfig
>        tslib: enable big endian support for qemuppc
>
>   meta/conf/machine/qemuppc.conf                     |    2 +-
>   .../formfactor/files/qemuppc/machconfig            |   10 ++++++++++
>   .../pointercal/files/qemuppc/pointercal            |  Bin 0 ->  36 bytes
>   meta/recipes-graphics/tslib/tslib_1.0.bb           |    1 +
>   scripts/runqemu                                    |    7 +------
>   scripts/runqemu-internal                           |   16 ++++++++--------
>   6 files changed, 21 insertions(+), 15 deletions(-)
>   create mode 100755 meta/recipes-bsp/formfactor/files/qemuppc/machconfig
>   create mode 100644 meta/recipes-bsp/pointercal/files/qemuppc/pointercal
>


