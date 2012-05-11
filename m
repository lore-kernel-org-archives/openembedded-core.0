Received: from mga11.intel.com ([192.55.52.93])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <sgw@linux.intel.com>) id 1SShIO-0000mC-0x
	for openembedded-core@lists.openembedded.org;
	Fri, 11 May 2012 06:17:36 +0200
Received: from fmsmga002.fm.intel.com ([10.253.24.26])
	by fmsmga102.fm.intel.com with ESMTP; 10 May 2012 21:07:39 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.71,315,1320652800"; d="scan'208";a="164773043"
Received: from unknown (HELO [10.255.12.250]) ([10.255.12.250])
	by fmsmga002.fm.intel.com with ESMTP; 10 May 2012 21:07:39 -0700
Message-ID: <4FAC908B.2040300@linux.intel.com>
Date: Thu, 10 May 2012 21:07:39 -0700
From: Saul Wold <sgw@linux.intel.com>
User-Agent: Mozilla/5.0 (X11; Linux x86_64;
	rv:12.0) Gecko/20120430 Thunderbird/12.0.1
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
X-List-Received-Date: Fri, 11 May 2012 04:17:36 -0000
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

Not sure if you saw this error:

ERROR: Multiple .bb files are due to be built which each provide 
virtual/libgl 
(/srv/home/pokybuild/yocto-autobuilder/yocto-slave/nightly-mips/build/meta/recipes-graphics/mesa/mesa-dri_7.11.bb 
/srv/home/pokybuild/yocto-autobuilder/yocto-slave/nightly-mips/build/meta/recipes-graphics/mesa/mesa-xlib_7.11.bb).
  This usually means one provides something the other doesn't and should.

I think this might be related to your change, I need to confirm it still.

Builds are completeing but the error exists on all non-x86* qemu machines

Thanks

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


