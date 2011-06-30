Received: from mga11.intel.com ([192.55.52.93])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <sgw@linux.intel.com>) id 1Qc8Jb-0007Lc-B5
	for openembedded-core@lists.openembedded.org;
	Thu, 30 Jun 2011 05:53:19 +0200
Received: from fmsmga002.fm.intel.com ([10.253.24.26])
	by fmsmga102.fm.intel.com with ESMTP; 29 Jun 2011 20:49:35 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.65,447,1304319600"; d="scan'208";a="22161423"
Received: from unknown (HELO [10.255.14.13]) ([10.255.14.13])
	by fmsmga002.fm.intel.com with ESMTP; 29 Jun 2011 20:49:27 -0700
Message-ID: <4E0BF246.5030500@linux.intel.com>
Date: Wed, 29 Jun 2011 20:49:26 -0700
From: Saul Wold <sgw@linux.intel.com>
User-Agent: Mozilla/5.0 (X11; U; Linux x86_64; en-US;
	rv:1.9.2.17) Gecko/20110428 Fedora/3.1.10-1.fc13 Thunderbird/3.1.10
MIME-Version: 1.0
To: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
References: <cover.1308244596.git.scott.a.garman@intel.com>
In-Reply-To: <cover.1308244596.git.scott.a.garman@intel.com>
Cc: Scott Garman <scott.a.garman@intel.com>
Subject: Re: [PATCH 0/2] mtools upgrade
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
X-List-Received-Date: Thu, 30 Jun 2011 03:53:19 -0000
Content-Type: text/plain; charset=ISO-8859-1; format=flowed
Content-Transfer-Encoding: 7bit

On 06/16/2011 10:18 AM, Scott Garman wrote:
> Upgrade the mtools recipe to the latest upstream release, v4.0.16.
>
> Build tested for all 5 of our qemu MACHINEs.
>
> The following changes since commit e1f6ebba3ab2fc8a469c1d96fc6d4c4b8f16845c:
>
>    meta-yocto: use FILESEXTRAPATHS_prepend := in all bbappends (2011-06-15 11:49:42 +0100)
>
> are available in the git repository at:
>    git://git.pokylinux.org/poky-contrib sgarman/mtools-upgrade
>    http://git.pokylinux.org/cgit.cgi/poky-contrib/log/?h=sgarman/mtools-upgrade
>
> Scott Garman (2):
>    mtools: upgrade to v4.0.16
>    distro_tracking: update mtools tracking info
>
>   .../conf/distro/include/distro_tracking_fields.inc |    9 ++++-----
>   .../mtools/mtools/no-x11.gplv3.patch               |    9 ++++++---
>   .../mtools/{mtools_4.0.15.bb =>  mtools_4.0.16.bb}  |    4 ++--
>   3 files changed, 12 insertions(+), 10 deletions(-)
>   rename meta/recipes-devtools/mtools/{mtools_4.0.15.bb =>  mtools_4.0.16.bb} (80%)
>
>
> _______________________________________________
> Openembedded-core mailing list
> Openembedded-core@lists.openembedded.org
> http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-core
>

Merged into OE-Core

Thanks
	Sau!



