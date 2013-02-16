Received: from mga14.intel.com ([143.182.124.37])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <sgw@linux.intel.com>) id 1U6akT-0006TC-HX
	for openembedded-core@lists.openembedded.org;
	Sat, 16 Feb 2013 06:55:46 +0100
Received: from azsmga002.ch.intel.com ([10.2.17.35])
	by azsmga102.ch.intel.com with ESMTP; 15 Feb 2013 21:39:27 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.84,677,1355126400"; d="scan'208";a="203023087"
Received: from unknown (HELO [10.255.12.117]) ([10.255.12.117])
	by AZSMGA002.ch.intel.com with ESMTP; 15 Feb 2013 21:39:26 -0800
Message-ID: <511F1B8E.90707@linux.intel.com>
Date: Fri, 15 Feb 2013 21:39:26 -0800
From: Saul Wold <sgw@linux.intel.com>
User-Agent: Mozilla/5.0 (X11; Linux x86_64;
	rv:17.0) Gecko/17.0 Thunderbird/17.0
MIME-Version: 1.0
To: Ross Burton <ross.burton@intel.com>
References: <cover.1360933659.git.ross.burton@intel.com>
In-Reply-To: <cover.1360933659.git.ross.burton@intel.com>
Cc: openembedded-core@lists.openembedded.org
Subject: Re: [PATCH V2 0/4] Allow xserver-xf86-config to ship no xorg.conf
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
X-List-Received-Date: Sat, 16 Feb 2013 05:55:47 -0000
Content-Type: text/plain; charset=ISO-8859-1; format=flowed
Content-Transfer-Encoding: 7bit

On 02/15/2013 05:09 AM, Ross Burton wrote:
> Hi,
>
> Same as V1, apart from changing package_deb to have the same check on conffiles
> as package_ipk.
>

Unless I got the wrong set, this still seems to have trouble with the
hardware BSPs for routerstation and MPC machines.

Maybe you need to build those.

Thanks
	Sau!

> Ross
>
> The following changes since commit 5a4ea383c3fc792cea87b834655eb013120fbb15:
>
>    poky.conf: Add Ubuntu 12.04.2 to sanity tested distros (2013-02-14 23:18:00 +0000)
>
> are available in the git repository at:
>
>    git://git.yoctoproject.org/poky-contrib ross/xorg
>
> for you to fetch changes up to 2ea6a8883fe2adfccd845bd94b10c5bf0b03bfe0:
>
>    xserver-xf86-config: empty generic xorg.conf (2013-02-15 13:04:30 +0000)
>
> ----------------------------------------------------------------
> Ross Burton (4):
>        package_ipk: check CONFFILES exist before adding them to metadata
>        package_deb: check CONFFILES exist before adding them to metadata
>        xserver-xf86-config: don't ship empty xorg.conf
>        xserver-xf86-config: empty generic xorg.conf
>
>   meta/classes/package_deb.bbclass                   |    3 ++-
>   meta/classes/package_ipk.bbclass                   |    3 ++-
>   .../xorg-xserver/xserver-xf86-config/xorg.conf     |   26 --------------------
>   .../xorg-xserver/xserver-xf86-config_0.1.bb        |   10 +++++---
>   4 files changed, 10 insertions(+), 32 deletions(-)
>
> Ross Burton (4):
>    package_ipk: check CONFFILES exist before adding them to metadata
>    package_deb: check CONFFILES exist before adding them to metadata
>    xserver-xf86-config: don't ship empty xorg.conf
>    xserver-xf86-config: empty generic xorg.conf
>
>   meta/classes/package_deb.bbclass                   |    3 ++-
>   meta/classes/package_ipk.bbclass                   |    3 ++-
>   .../xorg-xserver/xserver-xf86-config/xorg.conf     |   26 --------------------
>   .../xorg-xserver/xserver-xf86-config_0.1.bb        |   10 +++++---
>   4 files changed, 10 insertions(+), 32 deletions(-)
>


