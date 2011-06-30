Received: from mga11.intel.com ([192.55.52.93])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <sgw@linux.intel.com>) id 1Qc8D3-0007Fv-8q
	for openembedded-core@lists.openembedded.org;
	Thu, 30 Jun 2011 05:46:33 +0200
Received: from fmsmga001.fm.intel.com ([10.253.24.23])
	by fmsmga102.fm.intel.com with ESMTP; 29 Jun 2011 20:42:49 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.65,447,1304319600"; d="scan'208";a="24568057"
Received: from unknown (HELO [10.255.14.13]) ([10.255.14.13])
	by fmsmga001.fm.intel.com with ESMTP; 29 Jun 2011 20:42:49 -0700
Message-ID: <4E0BF0B8.6070307@linux.intel.com>
Date: Wed, 29 Jun 2011 20:42:48 -0700
From: Saul Wold <sgw@linux.intel.com>
User-Agent: Mozilla/5.0 (X11; U; Linux x86_64; en-US;
	rv:1.9.2.17) Gecko/20110428 Fedora/3.1.10-1.fc13 Thunderbird/3.1.10
MIME-Version: 1.0
To: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
References: <cover.1308071077.git.scott.a.garman@intel.com>
In-Reply-To: <cover.1308071077.git.scott.a.garman@intel.com>
Cc: Scott Garman <scott.a.garman@intel.com>
Subject: Re: [PATCH 0/2] sudo upgrade
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
X-List-Received-Date: Thu, 30 Jun 2011 03:46:33 -0000
Content-Type: text/plain; charset=ISO-8859-1; format=flowed
Content-Transfer-Encoding: 7bit

On 06/14/2011 10:19 AM, Scott Garman wrote:
> Hello,
>
> Here's a recipe upgrade I squeezed in between some other things this
> morning.
>
> The following changes since commit 7aa7673459376aff911cef820c9417c998d1aa96:
>
>    meta-yocto/linux-yocto: update to match the renamed linux-yocto recipes (2011-06-14 09:21:32 -0700)
>
> are available in the git repository at:
>    git://git.pokylinux.org/poky-contrib sgarman/sudo-upgrade
>    http://git.pokylinux.org/cgit.cgi/poky-contrib/log/?h=sgarman/sudo-upgrade
>
> Scott Garman (2):
>    sudo: upgrade to v1.8.1p2
>    distro_tracking: update sudo tracking info
>
>   .../conf/distro/include/distro_tracking_fields.inc |    8 +++---
>   meta/recipes-extended/sudo/sudo.inc                |   27 ++++++++-----------
>   .../sudo/{sudo_1.7.4p6.bb =>  sudo_1.8.1p2.bb}      |    4 +-
>   3 files changed, 17 insertions(+), 22 deletions(-)
>   rename meta/recipes-extended/sudo/{sudo_1.7.4p6.bb =>  sudo_1.8.1p2.bb} (52%)
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


