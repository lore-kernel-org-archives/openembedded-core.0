Received: from mga02.intel.com ([134.134.136.20])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <sgw@linux.intel.com>) id 1S9fUN-0004LP-Kq
	for openembedded-core@lists.openembedded.org;
	Mon, 19 Mar 2012 17:31:19 +0100
Received: from orsmga001.jf.intel.com ([10.7.209.18])
	by orsmga101.jf.intel.com with ESMTP; 19 Mar 2012 09:22:27 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.67,352,1309762800"; d="scan'208";a="119166383"
Received: from unknown (HELO [10.255.15.160]) ([10.255.15.160])
	by orsmga001.jf.intel.com with ESMTP; 19 Mar 2012 09:22:27 -0700
Message-ID: <4F675D43.1000605@linux.intel.com>
Date: Mon, 19 Mar 2012 09:22:27 -0700
From: Saul Wold <sgw@linux.intel.com>
User-Agent: Mozilla/5.0 (X11; Linux x86_64;
	rv:10.0.1) Gecko/20120216 Thunderbird/10.0.1
MIME-Version: 1.0
To: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
References: <cover.1331824888.git.scott.a.garman@intel.com>
In-Reply-To: <cover.1331824888.git.scott.a.garman@intel.com>
Cc: Scott Garman <scott.a.garman@intel.com>
Subject: Re: [PATCH 0/4] Recipe upgrades - sudo, at, base-passwd
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
X-List-Received-Date: Mon, 19 Mar 2012 16:31:19 -0000
Content-Type: text/plain; charset=ISO-8859-1; format=flowed
Content-Transfer-Encoding: 7bit

On 03/15/2012 08:22 AM, Scott Garman wrote:
> Hello,
>
> Here are some recipe upgrades for sudo, at, and base-passwd.
>
> These recipes have been build tested on all 5 of our qemu architectures.
> I have also done a visual inspection of the image and package output
> between the previous and new versions of each recipe to check for
> potential errors.
>
> The following changes since commit d4f1ef6b8297826230a68e535098709d07de1f48:
>
>    qt4: package static libraries correctly to fix warnings (2012-03-15 13:33:37 +0000)
>
> are available in the git repository at:
>    git://git.pokylinux.org/poky-contrib sgarman/recipe-upgrades2-oe
>    http://git.pokylinux.org/cgit.cgi/poky-contrib/log/?h=sgarman/recipe-upgrades2-oesgarman/recipe-upgrades2-oe
>
> Scott Garman (4):
>    sudo: upgrade to 1.8.4p4
>    at: upgrade to 3.1.13
>    base-passwd: upgrade to 3.5.24
>    distro_tracking: update sudo, at, base-passwd
>
>   .../conf/distro/include/distro_tracking_fields.inc |   24 +++++++++---------
>   .../nobash.patch                                   |    0
>   .../root-home.patch                                |    0
>   ...base-passwd_3.5.22.bb =>  base-passwd_3.5.24.bb} |   16 ++++++------
>   .../at/{at_3.1.12.bb =>  at_3.1.13.bb}              |   13 ++++-----
>   .../configure-add-enable-pam.patch                 |    0
>   .../at/{at-3.1.12 =>  files}/configure.patch        |    0
>   .../fix_parallel_build_error.patch                 |    0
>   .../at/files/nonstripbinaries.patch                |   26 --------------------
>   .../at/{at-3.1.12 =>  files}/pam.conf.patch         |    0
>   meta/recipes-extended/at/files/use-ldflags.patch   |    5 ++-
>   .../sudo/{sudo_1.8.4.bb =>  sudo_1.8.4p4.bb}        |    6 ++--
>   12 files changed, 32 insertions(+), 58 deletions(-)
>   rename meta/recipes-core/base-passwd/{base-passwd-3.5.22 =>  base-passwd-3.5.24}/nobash.patch (100%)
>   rename meta/recipes-core/base-passwd/{base-passwd-3.5.22 =>  base-passwd-3.5.24}/root-home.patch (100%)
>   rename meta/recipes-core/base-passwd/{base-passwd_3.5.22.bb =>  base-passwd_3.5.24.bb} (95%)
>   rename meta/recipes-extended/at/{at_3.1.12.bb =>  at_3.1.13.bb} (88%)
>   rename meta/recipes-extended/at/{at-3.1.12 =>  files}/configure-add-enable-pam.patch (100%)
>   rename meta/recipes-extended/at/{at-3.1.12 =>  files}/configure.patch (100%)
>   rename meta/recipes-extended/at/{at-3.1.12 =>  files}/fix_parallel_build_error.patch (100%)
>   delete mode 100644 meta/recipes-extended/at/files/nonstripbinaries.patch
>   rename meta/recipes-extended/at/{at-3.1.12 =>  files}/pam.conf.patch (100%)
>   rename meta/recipes-extended/sudo/{sudo_1.8.4.bb =>  sudo_1.8.4p4.bb} (83%)
>

Merged into OE-Core

Thanks
	Sau!


