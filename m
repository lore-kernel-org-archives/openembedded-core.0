Received: from mga01.intel.com ([192.55.52.88])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <laurentiu.palcu@intel.com>) id 1SaGvQ-0002JC-3Y
	for openembedded-core@lists.openembedded.org;
	Fri, 01 Jun 2012 03:45:12 +0200
Received: from fmsmga001.fm.intel.com ([10.253.24.23])
	by fmsmga101.fm.intel.com with ESMTP; 31 May 2012 18:33:46 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.71,315,1320652800"; d="scan'208";a="159373239"
Received: from lpalcu-laptop.sh.intel.com (HELO [10.239.196.133])
	([10.239.196.133])
	by fmsmga001.fm.intel.com with ESMTP; 31 May 2012 18:33:45 -0700
Message-ID: <4FC81BF9.5050405@intel.com>
Date: Fri, 01 Jun 2012 04:33:45 +0300
From: Laurentiu Palcu <laurentiu.palcu@intel.com>
User-Agent: Mozilla/5.0 (X11; Linux x86_64;
	rv:12.0) Gecko/20120430 Thunderbird/12.0.1
MIME-Version: 1.0
To: openembedded-core@lists.openembedded.org
References: <cover.1338368508.git.edwin.zhai@intel.com>
	<2255c64e0eb4a2b5b7f063dbc5ff421e606458c8.1338368508.git.edwin.zhai@intel.com>
In-Reply-To: <2255c64e0eb4a2b5b7f063dbc5ff421e606458c8.1338368508.git.edwin.zhai@intel.com>
Subject: RPM packaging issue?
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
X-List-Received-Date: Fri, 01 Jun 2012 01:45:12 -0000
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: 7bit

Hi list,

I was trying to build core-image-gtk-directfb and ended up with this error:

Log data follows:
| DEBUG: Executing shell function do_rootfs
| ERROR: Function failed: do_rootfs (see
/home/lau/yocto/build/tmp/work/qemux86-poky-linux/core-image-minimal-1.0-r0/temp/log.do_rootfs.4857
for further information)
| Generating solve db for /home/lau/yocto/build/tmp/deploy/rpm/qemux86...
| Generating solve db for /home/lau/yocto/build/tmp/deploy/rpm/i586...
| Generating solve db for /home/lau/yocto/build/tmp/deploy/rpm/all...
| Generating solve db for /home/lau/yocto/build/tmp/deploy/rpm/all...
| Processing task-core-boot...
| Processing module-init-tools...
| Unable to find package module-init-tools (module-init-tools)!
NOTE: package core-image-minimal-1.0-r0: task do_rootfs: Failed

module-init-tools is provided by kmod package and is in the RDEPENDS of
task_base recipe.

Then I tried to add module_init_tools to CORE_IMAGE_EXTRA_INSTALL and
build core-image-minimal (just for testing), the same result.

The interesting thing is that this didn't happen if the packaging format
is ipk.

Anybody know anything about this issue?

Thanks,
Laurentiu


