Received: from mga09.intel.com ([134.134.136.24])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <sgw@linux.intel.com>) id 1RYib7-0003kL-Qj
	for openembedded-core@openembedded.org; Thu, 08 Dec 2011 19:21:34 +0100
Received: from orsmga001.jf.intel.com ([10.7.209.18])
	by orsmga102.jf.intel.com with ESMTP; 08 Dec 2011 10:14:43 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.67,352,1309762800"; d="scan'208";a="84396128"
Received: from unknown (HELO [10.255.12.35]) ([10.255.12.35])
	by orsmga001.jf.intel.com with ESMTP; 08 Dec 2011 10:14:42 -0800
Message-ID: <4EE0FE92.6090407@linux.intel.com>
Date: Thu, 08 Dec 2011 10:14:42 -0800
From: Saul Wold <sgw@linux.intel.com>
User-Agent: Mozilla/5.0 (X11; Linux x86_64;
	rv:7.0) Gecko/20110927 Thunderbird/7.0
MIME-Version: 1.0
To: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
References: <cover.1323272370.git.lei.mei@intel.com>
In-Reply-To: <cover.1323272370.git.lei.mei@intel.com>
Cc: openembedded-core@openembedded.org
Subject: Re: [PATCH 0/2]dropbear:Upgrade from 0.53.1 to 2011.54
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
X-List-Received-Date: Thu, 08 Dec 2011 18:21:34 -0000
Content-Type: text/plain; charset=ISO-8859-1; format=flowed
Content-Transfer-Encoding: 7bit

On 12/07/2011 07:49 AM, Mei Lei wrote:
> Hi all,
> 	This patch upgrade dropbear from 0.53.1 to 2011.54. The new release added ALLOW_BLANK_PASSWORD option, we can enable empty passwd login funciton in options.h.
> 	So change the allow-nopw.patch content to enable this function.
> 	Please review it.
> Thanks,
> Lei
> The following changes since commit 493746f1d7f1410284880203c1ac462d61ab5299:
>    Martin Jansa (1):
>          matchbox-session-sato: respect VIRTUAL-RUNTIME_initscripts settings
>
> are available in the git repository at:
>
>    git://git.pokylinux.org/poky-contrib lmei3/dropbear
>    http://git.pokylinux.org/cgit.cgi/poky-contrib/log/?h=lmei3/dropbear
>
> Mei Lei (2):
>    dropbear: Upgrade from 0.53.1 to 2011.54
>    distro_tracking_fields.inc: Update dropbear,iproute2,net-tools
>      tracking information.
>
>   .../conf/distro/include/distro_tracking_fields.inc |   19 ++++---
>   .../configure.patch                                |    0
>   .../dropbear/dropbear/allow-nopw.patch             |   55 ++++++--------------
>   meta/recipes-core/dropbear/dropbear_0.53.1.bb      |    6 --
>   meta/recipes-core/dropbear/dropbear_2011.54.bb     |    6 ++
>   5 files changed, 33 insertions(+), 53 deletions(-)
>   rename meta/recipes-core/dropbear/{dropbear-0.53.1 =>  dropbear-2011.54}/configure.patch (100%)
>   delete mode 100644 meta/recipes-core/dropbear/dropbear_0.53.1.bb
>   create mode 100644 meta/recipes-core/dropbear/dropbear_2011.54.bb
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


