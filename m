Received: from mga09.intel.com ([134.134.136.24])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <sgw@linux.intel.com>) id 1T61pw-0006tY-Vn
	for openembedded-core@lists.openembedded.org;
	Mon, 27 Aug 2012 18:06:49 +0200
Received: from orsmga001.jf.intel.com ([10.7.209.18])
	by orsmga102.jf.intel.com with ESMTP; 27 Aug 2012 08:54:35 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.80,321,1344236400"; d="scan'208";a="185848225"
Received: from unknown (HELO [10.255.13.20]) ([10.255.13.20])
	by orsmga001.jf.intel.com with ESMTP; 27 Aug 2012 08:54:34 -0700
Message-ID: <503B9839.1070004@linux.intel.com>
Date: Mon, 27 Aug 2012 08:54:33 -0700
From: Saul Wold <sgw@linux.intel.com>
User-Agent: Mozilla/5.0 (X11; Linux x86_64;
	rv:14.0) Gecko/20120717 Thunderbird/14.0
MIME-Version: 1.0
To: Constantin Musca <constantinx.musca@intel.com>
References: <cover.1345818232.git.constantinx.musca@intel.com>
In-Reply-To: <cover.1345818232.git.constantinx.musca@intel.com>
Cc: openembedded-core@lists.openembedded.org
Subject: Re: [PATCH 0/4] Package upgrades
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
X-List-Received-Date: Mon, 27 Aug 2012 16:06:49 -0000
Content-Type: text/plain; charset=ISO-8859-1; format=flowed
Content-Transfer-Encoding: 7bit

On 08/24/2012 07:33 AM, Constantin Musca wrote:
> This is another set of package upgrades compiled on all architectures
> and tested using core-image-sato.
> The following changes since commit 054d95edad8d79ef1c6b30681395d50f3c6335b4:
>
>    poky.conf: restore Ubuntu 12.04 LTS to tested distro list (2012-08-23 17:23:40 +0100)
>
> are available in the git repository at:
>
>    git://git.yoctoproject.org/poky-contrib cmuscax/upgrades
>    http://git.yoctoproject.org/cgit.cgi/poky-contrib/log/?h=cmuscax/upgrades
>
> Constantin Musca (4):
>    wget: upgrade to 1.14
>    npth: upgrade to 0.91
>    kconfig-frontends: upgrade to 3.5
>    base-passwd: upgrade to 3.5.26
>
>   .../nobash.patch                                   |    0
>   .../root-home.patch                                |    0
>   ...base-passwd_3.5.24.bb => base-passwd_3.5.26.bb} |    6 ++---
>   ...g-frontends_3.4.bb => kconfig-frontends_3.5.bb} |    6 ++---
>   .../wget/wget-1.13.4/remove-gets.patch             |   23 --------------------
>   .../{wget-1.13.4 => wget-1.14}/fix_makefile.patch  |    0
>   meta/recipes-extended/wget/wget_1.13.4.bb          |   10 ---------
>   meta/recipes-extended/wget/wget_1.14.bb            |    9 ++++++++
>   .../npth/{npth_0.90.bb => npth_0.91.bb}            |    4 ++--
>   9 files changed, 16 insertions(+), 42 deletions(-)
>   rename meta/recipes-core/base-passwd/{base-passwd-3.5.24 => base-passwd-3.5.26}/nobash.patch (100%)
>   rename meta/recipes-core/base-passwd/{base-passwd-3.5.24 => base-passwd-3.5.26}/root-home.patch (100%)
>   rename meta/recipes-core/base-passwd/{base-passwd_3.5.24.bb => base-passwd_3.5.26.bb} (94%)
>   rename meta/recipes-devtools/kconfig-frontends/{kconfig-frontends_3.4.bb => kconfig-frontends_3.5.bb} (88%)
>   delete mode 100644 meta/recipes-extended/wget/wget-1.13.4/remove-gets.patch
>   rename meta/recipes-extended/wget/{wget-1.13.4 => wget-1.14}/fix_makefile.patch (100%)
>   delete mode 100644 meta/recipes-extended/wget/wget_1.13.4.bb
>   create mode 100644 meta/recipes-extended/wget/wget_1.14.bb
>   rename meta/recipes-support/npth/{npth_0.90.bb => npth_0.91.bb} (76%)
>

Merged into OE-Core

Thanks
	Sau!



