Received: from mga11.intel.com ([192.55.52.93])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <sgw@linux.intel.com>) id 1SjCII-0008Aj-9a
	for openembedded-core@lists.openembedded.org;
	Mon, 25 Jun 2012 18:37:42 +0200
Received: from fmsmga001.fm.intel.com ([10.253.24.23])
	by fmsmga102.fm.intel.com with ESMTP; 25 Jun 2012 09:26:50 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.71,315,1320652800"; d="scan'208";a="169776464"
Received: from unknown (HELO [10.255.12.180]) ([10.255.12.180])
	by fmsmga001.fm.intel.com with ESMTP; 25 Jun 2012 09:26:50 -0700
Message-ID: <4FE8914A.1090408@linux.intel.com>
Date: Mon, 25 Jun 2012 09:26:50 -0700
From: Saul Wold <sgw@linux.intel.com>
User-Agent: Mozilla/5.0 (X11; Linux x86_64;
	rv:12.0) Gecko/20120430 Thunderbird/12.0.1
MIME-Version: 1.0
To: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
References: <cover.1340385690.git.scott.a.garman@intel.com>
In-Reply-To: <cover.1340385690.git.scott.a.garman@intel.com>
Cc: Scott Garman <scott.a.garman@intel.com>
Subject: Re: [PATCH 0/2] Recipe upgrades - gzip and sudo
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
X-List-Received-Date: Mon, 25 Jun 2012 16:37:42 -0000
Content-Type: text/plain; charset=ISO-8859-1; format=flowed
Content-Transfer-Encoding: 7bit

On 06/22/2012 10:25 AM, Scott Garman wrote:
> Hello,
>
> These are some trivial recipe upgrades for gzip and sudo. They have
> been build-tested for all 5 of our qemu architectures, and I've done
> a visual inspection of the package output to watch for any troublesome
> differences. (I do intend to start using buildhistory soon)
>
> Note, this pull request is for oe-core master.
>
> Scott
>
> The following changes since commit e2cc4a44d510e0d473d15f207c1c886db6a5ccf7:
>
>    [PATCH] guile: fix compilation on MIPS/PPC (2012-06-21 13:41:12 +0100)
>
> are available in the git repository at:
>
>    git://git.yoctoproject.org/poky-contrib sgarman/recipe-upgrades-oe
>    http://git.yoctoproject.org/cgit.cgi/poky-contrib/log/?h=sgarman/recipe-upgrades-oe
>
> Scott Garman (2):
>    gzip: upgrade to 1.5
>    sudo: upgrade to 1.8.5p2
>
>   meta/recipes-extended/gzip/gzip.inc                |    7 +++++--
>   meta/recipes-extended/gzip/gzip_1.4.bb             |   10 ----------
>   meta/recipes-extended/gzip/gzip_1.5.bb             |   10 ++++++++++
>   meta/recipes-extended/sudo/sudo.inc                |    2 +-
>   .../sudo/{sudo_1.8.4p4.bb =>  sudo_1.8.5p2.bb}      |    6 +++---
>   5 files changed, 19 insertions(+), 16 deletions(-)
>   delete mode 100644 meta/recipes-extended/gzip/gzip_1.4.bb
>   create mode 100644 meta/recipes-extended/gzip/gzip_1.5.bb
>   rename meta/recipes-extended/sudo/{sudo_1.8.4p4.bb =>  sudo_1.8.5p2.bb} (83%)
>

Merged into OE-Core

Thanks
	Sau!


