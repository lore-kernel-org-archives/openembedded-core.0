Return-Path: <sgw@linux.intel.com>
Received: from mga01.intel.com (mga01.intel.com [192.55.52.88])
	by mail.openembedded.org (Postfix) with ESMTP id 6B8DF61663
	for <openembedded-core@lists.openembedded.org>;
	Sat, 20 Jul 2013 15:02:02 +0000 (UTC)
Received: from fmsmga002.fm.intel.com ([10.253.24.26])
	by fmsmga101.fm.intel.com with ESMTP; 20 Jul 2013 08:01:53 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.89,708,1367996400"; d="scan'208";a="373428922"
Received: from unknown (HELO [10.255.13.254]) ([10.255.13.254])
	by fmsmga002.fm.intel.com with ESMTP; 20 Jul 2013 08:01:53 -0700
Message-ID: <51EAA660.7080905@linux.intel.com>
Date: Sat, 20 Jul 2013 08:01:52 -0700
From: Saul Wold <sgw@linux.intel.com>
User-Agent: Mozilla/5.0 (X11; Linux x86_64;
	rv:17.0) Gecko/20130514 Thunderbird/17.0.6
MIME-Version: 1.0
To: 'Patches and discussions about the oe-core layer'
	<openembedded-core@lists.openembedded.org>, 
	meta-freescale@yoctoproject.org
Cc: Otavio Salvador <otavio@ossystems.com.br>
Subject: Mesa issues in Freescale ARM Builds
X-BeenThere: openembedded-core@lists.openembedded.org
X-Mailman-Version: 2.1.12
Precedence: list
List-Id: Patches and discussions about the oe-core layer
	<openembedded-core.lists.openembedded.org>
List-Unsubscribe: <http://lists.openembedded.org/mailman/options/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.openembedded.org/pipermail/openembedded-core/>
List-Post: <mailto:openembedded-core@lists.openembedded.org>
List-Help: <mailto:openembedded-core-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.openembedded.org/mailman/listinfo/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Sat, 20 Jul 2013 15:02:02 -0000
Content-Type: text/plain; charset=ISO-8859-1; format=flowed
Content-Transfer-Encoding: 7bit


Hi Jonathan, Martin, Freescale Folks:

You both have been recently modifying the mesa recipes, it seems to have 
triggered some build failures on the nightly-fsl-arm  builds in master. 
  I am going to build MUT today with Jonathan's change, so we might have 
failures there also.

> ERROR: Multiple .bb files are due to be built which each provide mesa (/srv/home/pokybuild/yocto-autobuilder-new/yocto-slave/nightly-fsl-arm/build/meta/recipes-graphics/mesa/mesa_git.bb /srv/home/pokybuild/yocto-autobuilder-new/yocto-slave/nightly-fsl-arm/build/meta/recipes-graphics/mesa/mesa_9.1.3.bb).
>  This usually means one provides something the other doesn't and should.
> ERROR: Multiple .bb files are due to be built which each provide virtual/libgles1 (/srv/home/pokybuild/yocto-autobuilder-new/yocto-slave/nightly-fsl-arm/build/meta/recipes-graphics/mesa/mesa_git.bb /srv/home/pokybuild/yocto-autobuilder-new/yocto-slave/nightly-fsl-arm/build/meta-fsl-arm/recipes-graphics/amd-gpu-x11-bin/amd-gpu-x11-bin-mx51_11.09.01.bb).
>  This usually means one provides something the other doesn't and should.
> ERROR: Multiple .bb files are due to be built which each provide virtual/libgles2 (/srv/home/pokybuild/yocto-autobuilder-new/yocto-slave/nightly-fsl-arm/build/meta/recipes-graphics/mesa/mesa_git.bb /srv/home/pokybuild/yocto-autobuilder-new/yocto-slave/nightly-fsl-arm/build/meta-fsl-arm/recipes-graphics/amd-gpu-x11-bin/amd-gpu-x11-bin-mx51_11.09.01.bb).
>  This usually means one provides something the other doesn't and should.
> ERROR: Multiple .bb files are due to be built which each provide virtual/egl (/srv/home/pokybuild/yocto-autobuilder-new/yocto-slave/nightly-fsl-arm/build/meta/recipes-graphics/mesa/mesa_git.bb /srv/home/pokybuild/yocto-autobuilder-new/yocto-slave/nightly-fsl-arm/build/meta-fsl-arm/recipes-graphics/amd-gpu-x11-bin/amd-gpu-x11-bin-mx51_11.09.01.bb).
>  This usually means one provides something the other doesn't and should.

and

> NOTE: recipe mesa-2_9.1.3-r0: task do_package_write_ipk: Started
> NOTE: recipe mesa-2_9.1.3-r0: task do_package_write_rpm: Started
> NOTE: recipe mesa-2_9.1.3-r0: task do_package_write_deb: Started
> ERROR: Recipe mesa is trying to change PR from 'r0' to 'r9.0'. This will cause do_package_write_* failures since the incorrect data will be used and they will be unable to find the right workdir.
> ERROR: Function failed: read_subpackage_metadata
> ERROR: Recipe mesa is trying to change PR from 'r0' to 'r9.0'. This will cause do_package_write_* failures since the incorrect data will be used and they will be unable to find the right workdir.
> ERROR: Function failed: read_subpackage_metadata
> ERROR: Logfile of failure stored in: /srv/home/pokybuild/yocto-autobuilder-new/yocto-slave/nightly-fsl-arm/build/build/tmp/work/imx53qsb-poky-linux-gnueabi/mesa/2_9.1.3-r0/temp/log.do_package_write_ipk.14976
> NOTE: recipe mesa-2_9.1.3-r0: task do_package_write_ipk: Failed
> ERROR: Recipe mesa is trying to change PR from 'r0' to 'r9.0'. This will cause do_package_write_* failures since the incorrect data will be used and they will be unable to find the right workdir.
> ERROR: Function failed: read_subpackage_metadata
> ERROR: Logfile of failure stored in: /srv/home/pokybuild/yocto-autobuilder-new/yocto-slave/nightly-fsl-arm/build/build/tmp/work/imx53qsb-poky-linux-gnueabi/mesa/2_9.1.3-r0/temp/log.do_package_write_rpm.14930
> NOTE: recipe mesa-2_9.1.3-r0: task do_package_write_rpm: Failed
> ERROR: Task 3724 (/srv/home/pokybuild/yocto-autobuilder-new/yocto-slave/nightly-fsl-arm/build/meta/recipes-graphics/mesa/mesa_9.1.3.bb, do_package_write_rpm) failed with exit code '1'
> ERROR: Task 3722 (/srv/home/pokybuild/yocto-autobuilder-new/yocto-slave/nightly-fsl-arm/build/meta/recipes-graphics/mesa/mesa_9.1.3.bb, do_package_write_ipk) failed with exit code '1'
> ERROR: Logfile of failure stored in: /srv/home/pokybuild/yocto-autobuilder-new/yocto-slave/nightly-fsl-arm/build/build/tmp/work/imx53qsb-poky-linux-gnueabi/mesa/2_9.1.3-r0/temp/log.do_package_write_deb.14949
> NOTE: recipe mesa-2_9.1.3-r0: task do_package_write_deb: Failed
> ERROR: Task 3723 (/srv/home/pokybuild/yocto-autobuilder-new/yocto-slave/nightly-fsl-arm/build/meta/recipes-graphics/mesa/mesa_9.1.3.bb, do_package_write_deb) failed with exit code '1'

This is strange since it seems to be picking up the git recipe and the 
version one, maybe due to the above error.

Thanks

-- 
     Sau!

Saul Wold
Yocto Component Wrangler @ Intel
Yocto Project / Poky Build System


