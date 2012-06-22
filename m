Received: from mga01.intel.com ([192.55.52.88])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <sgw@linux.intel.com>) id 1Si8AF-0000GF-F9
	for openembedded-core@lists.openembedded.org;
	Fri, 22 Jun 2012 20:00:59 +0200
Received: from fmsmga002.fm.intel.com ([10.253.24.26])
	by fmsmga101.fm.intel.com with ESMTP; 22 Jun 2012 10:50:11 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.71,315,1320652800"; d="scan'208";a="183788689"
Received: from unknown (HELO [10.255.12.175]) ([10.255.12.175])
	by fmsmga002.fm.intel.com with ESMTP; 22 Jun 2012 10:50:11 -0700
Message-ID: <4FE4B053.9050108@linux.intel.com>
Date: Fri, 22 Jun 2012 10:50:11 -0700
From: Saul Wold <sgw@linux.intel.com>
User-Agent: Mozilla/5.0 (X11; Linux x86_64;
	rv:12.0) Gecko/20120430 Thunderbird/12.0.1
MIME-Version: 1.0
To: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
References: <cover.1340119197.git.ross.burton@intel.com>
In-Reply-To: <cover.1340119197.git.ross.burton@intel.com>
Subject: Re: [PATCH 0/6] ConnMan upgrades, split up
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
X-List-Received-Date: Fri, 22 Jun 2012 18:00:59 -0000
Content-Type: text/plain; charset=ISO-8859-1; format=flowed
Content-Transfer-Encoding: 7bit

On 06/19/2012 08:22 AM, Ross Burton wrote:
> The connman upgrades started to get a bit unweidly as they were fixing obvious
> problems and upgrading.  I've split up the upgrades into a finer patch series
> for easier review.
>
> Ross
>
> The following changes since commit e0a70547069fe7e8a2d6bdaffc985fb172d46c31:
>
>    perl: Allow perl to cross build and native build in a directory named "t" (2012-06-18 17:33:04 +0100)
>
> are available in the git repository at:
>    git://git.yoctoproject.org/poky-contrib ross/connman
>    http://git.yoctoproject.org/cgit.cgi/poky-contrib/log/?h=ross/connman
>
> Ross Burton (6):
>    connman: rationalise configure options
>    connman: add compat RPROVIDES for older packaging
>    connman: upgrade to 1.0
>    connman-gnome: fix build depends (Yocto #2556)
>    connman-gnome: clean up runtime dependencies
>    connman-gnome: upgrade to 0.7, which works with connman 1.0
>
>   .../connman/connman-gnome_0.5.bb                   |   38 --------------
>   .../connman/connman-gnome_0.7.bb                   |   19 +++++++
>   meta/recipes-connectivity/connman/connman.inc      |   27 +++++++---
>   .../connman/connman/disable_alg-test.patch         |   46 ----------------
>   .../connman/connman/ethernet_default.patch         |   22 --------
>   .../connman/test-set-ipv4-method-api-fix.patch     |   50 ------------------
>   .../connman/test-set-ipv6-method-api-fix.patch     |   55 --------------------
>   .../connman/{connman_0.79.bb =>  connman_1.0.bb}    |   10 +---
>   8 files changed, 41 insertions(+), 226 deletions(-)
>   delete mode 100644 meta/recipes-connectivity/connman/connman-gnome_0.5.bb
>   create mode 100644 meta/recipes-connectivity/connman/connman-gnome_0.7.bb
>   delete mode 100644 meta/recipes-connectivity/connman/connman/disable_alg-test.patch
>   delete mode 100644 meta/recipes-connectivity/connman/connman/ethernet_default.patch
>   delete mode 100644 meta/recipes-connectivity/connman/connman/test-set-ipv4-method-api-fix.patch
>   delete mode 100644 meta/recipes-connectivity/connman/connman/test-set-ipv6-method-api-fix.patch
>   rename meta/recipes-connectivity/connman/{connman_0.79.bb =>  connman_1.0.bb} (53%)
>

Merged into OE-Core

Thanks
	Sau!


