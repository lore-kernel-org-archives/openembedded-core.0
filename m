Received: from mga02.intel.com ([134.134.136.20])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <sgw@linux.intel.com>) id 1SRsi1-0001Da-VQ
	for openembedded-core@lists.openembedded.org;
	Wed, 09 May 2012 00:16:42 +0200
Received: from orsmga002.jf.intel.com ([10.7.209.21])
	by orsmga101.jf.intel.com with ESMTP; 08 May 2012 15:06:48 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.67,351,1309762800"; d="scan'208";a="141611440"
Received: from unknown (HELO [10.255.12.218]) ([10.255.12.218])
	by orsmga002.jf.intel.com with ESMTP; 08 May 2012 15:06:48 -0700
Message-ID: <4FA998F8.8060306@linux.intel.com>
Date: Tue, 08 May 2012 15:06:48 -0700
From: Saul Wold <sgw@linux.intel.com>
User-Agent: Mozilla/5.0 (X11; Linux x86_64;
	rv:12.0) Gecko/20120424 Thunderbird/12.0
MIME-Version: 1.0
To: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
References: <cover.1336015963.git.raj.khem@gmail.com>
In-Reply-To: <cover.1336015963.git.raj.khem@gmail.com>
Subject: Re: [PATCH 0/3] Enable xserver-xorg for all qemumachines
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
X-List-Received-Date: Tue, 08 May 2012 22:16:42 -0000
Content-Type: text/plain; charset=ISO-8859-1; format=flowed
Content-Transfer-Encoding: 7bit

On 05/02/2012 08:35 PM, Khem Raj wrote:
> Currently we use kdrive for all qemu machines except x86 and x86_64
> this patchset enables it for other qemu machines too
>
> I did not delete the kdrive recipes intentionally since I saw that
> there were some images which were using kdrive as xserver
>
> I have successfully sato image in qemumips qemuarm and qemuppc
>
Khem,

Not sure what I am doing differently, but I am not getting the xserver 
to start on at least ppc and mips (two that I tried just now).

Are you build a Yocto sato image or oe-core sato image?

I get the following on a ppc:

Fatal server error:
no screens found
xinit: giving up
xinit: unable to connect to X server: No such file or directory
xinit: server error


Sau!


> The following changes since commit 35b5fb2dd2131d4c7dc6635c14c6e08ea6926457:
>
>    eglibc-package: remove /var (2012-05-01 12:36:18 +0100)
>
> are available in the git repository at:
>    git://git.openembedded.org/openembedded-core-contrib kraj/qemu-xserver-xorg
>    http://cgit.openembedded.org/cgit.cgi/openembedded-core-contrib/log/?h=kraj/qemu-xserver-xorg
>
> Khem Raj (3):
>    qemumachines: Enable xserver-xorg as default xserver
>    xserver-xf86-config: Add xorg.conf for arm,mips,ppc,sh qemu machines
>    qemux86-64,qemux86: Override XSERVER variable
>
>   meta/conf/machine/include/qemu.inc                 |    9 ++-
>   meta/conf/machine/qemux86-64.conf                  |    2 +-
>   meta/conf/machine/qemux86.conf                     |    2 +-
>   .../xserver-xf86-config/qemuarm/xorg.conf          |   69 ++++++++++++++++++++
>   .../xserver-xf86-config/qemumips/xorg.conf         |   69 ++++++++++++++++++++
>   .../xserver-xf86-config/qemumips64/xorg.conf       |   69 ++++++++++++++++++++
>   .../xserver-xf86-config/qemuppc/xorg.conf          |   69 ++++++++++++++++++++
>   .../xserver-xf86-config/qemush4/xorg.conf          |   69 ++++++++++++++++++++
>   .../xorg-xserver/xserver-xf86-config_0.1.bb        |    2 +-
>   9 files changed, 356 insertions(+), 4 deletions(-)
>   create mode 100644 meta/recipes-graphics/xorg-xserver/xserver-xf86-config/qemuarm/xorg.conf
>   create mode 100644 meta/recipes-graphics/xorg-xserver/xserver-xf86-config/qemumips/xorg.conf
>   create mode 100644 meta/recipes-graphics/xorg-xserver/xserver-xf86-config/qemumips64/xorg.conf
>   create mode 100644 meta/recipes-graphics/xorg-xserver/xserver-xf86-config/qemuppc/xorg.conf
>   create mode 100644 meta/recipes-graphics/xorg-xserver/xserver-xf86-config/qemush4/xorg.conf
>


