Received: from mga11.intel.com ([192.55.52.93])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <sgw@linux.intel.com>) id 1Q7xaP-0000tG-IQ
	for openembedded-core@lists.openembedded.org;
	Fri, 08 Apr 2011 00:21:57 +0200
Received: from fmsmga001.fm.intel.com ([10.253.24.23])
	by fmsmga102.fm.intel.com with ESMTP; 07 Apr 2011 15:08:58 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.63,319,1299484800"; d="scan'208";a="906936766"
Received: from unknown (HELO [10.255.12.228]) ([10.255.12.228])
	by fmsmga001.fm.intel.com with ESMTP; 07 Apr 2011 15:08:58 -0700
Message-ID: <4D9E35F9.2010502@linux.intel.com>
Date: Thu, 07 Apr 2011 15:08:57 -0700
From: Saul Wold <sgw@linux.intel.com>
User-Agent: Mozilla/5.0 (X11; U; Linux x86_64; en-US;
	rv:1.9.1.10) Gecko/20100621 Fedora/3.0.5-1.fc13 Lightning/1.0b2pre
	Thunderbird/3.0.5
MIME-Version: 1.0
To: Saul Wold <sgw@linux.intel.com>
References: <cover.1302211549.git.sgw@linux.intel.com>
In-Reply-To: <cover.1302211549.git.sgw@linux.intel.com>
Cc: Paul Eggleton <paul.eggleton@linux.intel.com>,
	Darren Hart <dvhart@linux.intel.com>,
	openembedded-core@lists.openembedded.org
Subject: Re: [PATCH 00/11] Recipe Update and Distro Tracking
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
X-List-Received-Date: Thu, 07 Apr 2011 22:21:57 -0000
Content-Type: text/plain; charset=ISO-8859-1; format=flowed
Content-Transfer-Encoding: 7bit

On 04/07/2011 02:37 PM, Saul Wold wrote:
> From: Saul Wold<sgw@linux.intel.com>
>
> Richard,
>
> This is a bacth of recipe updates done by me since these
> do not have maintainers currently.  I started adding
> Upstream-Status:.
>
> This also contains distro_tracking_fields.inc updates.
>
> Thanks
> 	Sau!
>
>
> Pull URL: git://git.pokylinux.org/poky-contrib.git
>    Branch: oe-work
>    Browse: http://git.pokylinux.org/cgit.cgi/poky-contrib/log/?h=oe-work
>
> Thanks,
>      Saul Wold<sgw@linux.intel.com>
> ---
>
>
> Darren Hart (1):
>    Update trace-cmd and kernelshark distro_tracking
>
> Paul Eggleton (1):
>    Update distro-tracking-fields.inc for recent qt4 changes
>
> Saul Wold (9):
>    createrepo: Update to 0.9.9
>    directfb: Update to 1.4.6
Fixed the subject of the patch to be 1.4.12
>    qmmp: update to version .4.3
Fixed the subject to be version 0.5.0

>    mc: update to version 4.7.5.1
>    gthumb: update to 2.12.1
>    chkconfig: Update to 1.3.49
>    liburi-perl: update to 1.58
>    distro tracking update
>    lsb: fix lic_files_chksum
>
>   .../conf/distro/include/distro_tracking_fields.inc |   73 ++++++++++++----
>   .../{liburi-perl_1.56.bb =>  liburi-perl_1.58.bb}   |    0
>   .../{chkconfig_1.3.49.bb =>  chkconfig_1.3.51.bb}   |    5 +-
>   meta/recipes-extended/lsb/lsbsetup_0.9.bb          |    2 +-
>   .../mc/{mc_4.7.5.bb =>  mc_4.7.5.1.bb}              |    6 +-
>   .../gthumb/{gthumb_2.12.1.bb =>  gthumb_2.12.2.bb}  |    4 +-
>   .../directfb/directfb-1.4.6/mkdfiff.patch          |   24 ------
>   meta/recipes-graphics/directfb/directfb.inc        |   11 +--
>   meta/recipes-graphics/directfb/directfb_1.4.12.bb  |   22 +++++
>   meta/recipes-graphics/directfb/directfb_1.4.6.bb   |   27 ------
>   .../directfb-1.2.x-fix-pkgconfig-cflags.patch      |   33 ++++----
>   .../directfb/files/dont-use-linux-config.patch     |   11 +++
>   .../qt-apps/{qmmp_0.4.3.bb =>  qmmp_0.5.0.bb}       |    4 +-
>   .../createrepo/createrepo/fix-native-install.patch |   88 ++++++++++---------
>   .../{createrepo_0.4.11.bb =>  createrepo_0.9.9.bb}  |    7 +-
>   15 files changed, 169 insertions(+), 148 deletions(-)
>   rename meta/recipes-devtools/perl/{liburi-perl_1.56.bb =>  liburi-perl_1.58.bb} (100%)
>   rename meta/recipes-extended/chkconfig/{chkconfig_1.3.49.bb =>  chkconfig_1.3.51.bb} (83%)
>   rename meta/recipes-extended/mc/{mc_4.7.5.bb =>  mc_4.7.5.1.bb} (76%)
>   rename meta/recipes-gnome/gthumb/{gthumb_2.12.1.bb =>  gthumb_2.12.2.bb} (76%)
>   delete mode 100644 meta/recipes-graphics/directfb/directfb-1.4.6/mkdfiff.patch
>   create mode 100644 meta/recipes-graphics/directfb/directfb_1.4.12.bb
>   delete mode 100644 meta/recipes-graphics/directfb/directfb_1.4.6.bb
>   rename meta/recipes-qt/qt-apps/{qmmp_0.4.3.bb =>  qmmp_0.5.0.bb} (92%)
>   rename meta/recipes-support/createrepo/{createrepo_0.4.11.bb =>  createrepo_0.9.9.bb} (73%)
>


