Received: from mga11.intel.com ([192.55.52.93])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <sgw@linux.intel.com>) id 1Rk8Od-0000Wi-Uk
	for openembedded-core@lists.openembedded.org;
	Mon, 09 Jan 2012 07:07:52 +0100
Received: from fmsmga002.fm.intel.com ([10.253.24.26])
	by fmsmga102.fm.intel.com with ESMTP; 08 Jan 2012 22:00:23 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.71,315,1320652800"; d="scan'208";a="110137104"
Received: from unknown (HELO [10.255.13.28]) ([10.255.13.28])
	by fmsmga002.fm.intel.com with ESMTP; 08 Jan 2012 22:00:23 -0800
Message-ID: <4F0A8276.6050204@linux.intel.com>
Date: Sun, 08 Jan 2012 22:00:22 -0800
From: Saul Wold <sgw@linux.intel.com>
User-Agent: Mozilla/5.0 (X11; Linux x86_64;
	rv:8.0) Gecko/20111115 Thunderbird/8.0
MIME-Version: 1.0
To: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
References: <cover.1325792209.git.otavio@ossystems.com.br>
In-Reply-To: <cover.1325792209.git.otavio@ossystems.com.br>
Subject: Re: [PATCH 00/10] Pending patches from O.S. Systems tree
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
X-List-Received-Date: Mon, 09 Jan 2012 06:07:53 -0000
Content-Type: text/plain; charset=ISO-8859-1; format=flowed
Content-Transfer-Encoding: 7bit

On 01/05/2012 11:37 AM, Otavio Salvador wrote:
> The following changes since commit 563828bad19a242bba9ce3db461bb5807037dfdf:
>
>    multilib: Abstract class extension code into classextend.py (2012-01-05 12:36:08 +0000)
>
> are available in the git repository at:
>    git://github.com/OSSystems/oe-core master
>    https://github.com/OSSystems/oe-core/tree/HEAD
>
> Otavio Salvador (10):
>    qt4-graphics-system: add
>    qt4e.bbclass: add QT_BASE_NAME for use in recipes
>    qt4x11.bbclass: add QT_BASE_NAME for use in recipes
>    qt4-embedded.inc: use QT_BASE_NAME from qt4e.bbclass
>    qt4-x11-free.inc: use QT_BASE_NAME from qt4x11.bbclass
Merged these into OE-COre

>    initscripts: avoid mounting /sys if it is already mounted
Merged
>    busybox: disable syslogd configuration file support
We talked about this one on #yocto, already fixed in master (differently)

>    udev: ensure /dev/pts and /dev/shm does exists
Merged
>    udev: improve udev-cache robustnes
I guess you are looking into improvements.


>    udev: drop depmod handling code as it ought to be done in kernel
>      postinst
Dropped per your request

Thanks
	Sau!

>
>   meta/classes/qt4e.bbclass                          |    1 +
>   meta/classes/qt4x11.bbclass                        |    1 +
>   meta/recipes-core/busybox/busybox-1.19.3/defconfig |    2 +-
>   meta/recipes-core/busybox/busybox_1.19.3.bb        |    2 +-
>   .../initscripts/initscripts-1.0/sysfs.sh           |    4 +-
>   meta/recipes-core/initscripts/initscripts_1.0.bb   |    2 +-
>   meta/recipes-core/udev/udev.inc                    |   11 +++++++-
>   meta/recipes-core/udev/udev/init                   |   23 +++++++++++++---
>   meta/recipes-core/udev/udev/udev-cache             |   20 ++++++++++++--
>   meta/recipes-core/udev/udev/udev-cache.default     |    4 +++
>   meta/recipes-core/udev/udev_164.bb                 |    2 +-
>   .../qt4-graphics-system/qt4-graphics-system_1.0.bb |   27 ++++++++++++++++++++
>   meta/recipes-qt/qt4/qt4-embedded.inc               |    3 +-
>   meta/recipes-qt/qt4/qt4-x11-free.inc               |    3 +-
>   14 files changed, 86 insertions(+), 19 deletions(-)
>   create mode 100644 meta/recipes-core/udev/udev/udev-cache.default
>   create mode 100644 meta/recipes-qt/qt4-graphics-system/qt4-graphics-system_1.0.bb
>


