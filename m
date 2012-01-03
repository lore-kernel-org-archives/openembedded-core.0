Received: from mga03.intel.com ([143.182.124.21])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <sgw@linux.intel.com>) id 1RiEKx-00027z-Ae
	for openembedded-core@lists.openembedded.org;
	Wed, 04 Jan 2012 01:04:11 +0100
Received: from azsmga001.ch.intel.com ([10.2.17.19])
	by azsmga101.ch.intel.com with ESMTP; 03 Jan 2012 15:56:49 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.71,315,1320652800"; d="scan'208";a="92057640"
Received: from unknown (HELO [10.255.13.127]) ([10.255.13.127])
	by azsmga001.ch.intel.com with ESMTP; 03 Jan 2012 15:56:49 -0800
Message-ID: <4F0395C0.4020805@linux.intel.com>
Date: Tue, 03 Jan 2012 15:56:48 -0800
From: Saul Wold <sgw@linux.intel.com>
User-Agent: Mozilla/5.0 (X11; Linux x86_64;
	rv:7.0) Gecko/20110927 Thunderbird/7.0
MIME-Version: 1.0
To: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
References: <cover.1325145929.git.edwin.zhai@intel.com>
In-Reply-To: <cover.1325145929.git.edwin.zhai@intel.com>
Subject: Re: [PATCH 0/2] Bug fixes
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
X-List-Received-Date: Wed, 04 Jan 2012 00:04:11 -0000
Content-Type: text/plain; charset=ISO-8859-1; format=flowed
Content-Transfer-Encoding: 7bit

On 12/29/2011 12:09 AM, edwin.zhai@intel.com wrote:
> From: Zhai Edwin<edwin.zhai@intel.com>
>
> All,
> Patch of gnome-keyring to fix gsettings-data-convert seg fault, modified according to Saul's comments.
> Another patch of matchbox-wm to remove the dependence between window manager and X session.
>
> The following changes since commit 6a1b5c28f22bb07a0b7102eb88441d05768ec52e:
>
>    self-hosted-image: Add builder user and mini X (2011-12-29 10:42:07 +0800)
>
> are available in the git repository at:
>    git://git.pokylinux.org/poky-contrib gzhai/build-appliance2
>    http://git.pokylinux.org/cgit.cgi/poky-contrib/log/?h=gzhai/build-appliance2
>
> Zhai Edwin (2):
>    gnome-keyring: fix gsettings_data_convert seg fault

Merged this one to OE-Core

>    matchbox-wm: Remove x-session-manager handling
>
We need a little more explaintion about why you are removing the U-A 
code from the matchbox-wm?

Thanks
	Sau!


>   meta/recipes-gnome/gnome/gnome-keyring_2.32.1.bb   |   12 ++++++++++--
>   .../matchbox-wm/matchbox-wm_1.2.bb                 |    9 ++-------
>   .../matchbox-wm/matchbox-wm_git.bb                 |    9 ++-------
>   3 files changed, 14 insertions(+), 16 deletions(-)
>
>
> _______________________________________________
> Openembedded-core mailing list
> Openembedded-core@lists.openembedded.org
> http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-core
>


