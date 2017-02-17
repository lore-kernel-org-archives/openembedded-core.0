Return-Path: <richard.purdie@linuxfoundation.org>
Received: from dan.rpsys.net (5751f4a1.skybroadband.com [87.81.244.161])
	by mail.openembedded.org (Postfix) with ESMTP id 0D52C731C7
	for <openembedded-core@lists.openembedded.org>;
	Fri, 17 Feb 2017 21:11:06 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by dan.rpsys.net (8.14.4/8.14.4/Debian-4.1ubuntu1) with ESMTP id
	v1HLB2gf029737; Fri, 17 Feb 2017 21:11:02 GMT
Received: from dan.rpsys.net ([127.0.0.1])
	by localhost (dan.rpsys.net [127.0.0.1]) (amavisd-new, port 10024)
	with LMTP id qlk42mHx2Epl; Fri, 17 Feb 2017 21:11:02 +0000 (GMT)
Received: from hex ([192.168.3.34]) (authenticated bits=0)
	by dan.rpsys.net (8.14.4/8.14.4/Debian-4.1ubuntu1) with ESMTP id
	v1HLAuJc029728
	(version=TLSv1/SSLv3 cipher=AES128-GCM-SHA256 bits=128 verify=NOT);
	Fri, 17 Feb 2017 21:11:00 GMT
Message-ID: <1487365856.4999.47.camel@linuxfoundation.org>
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: Patrick Ohly <patrick.ohly@intel.com>,
	openembedded-core@lists.openembedded.org
Date: Fri, 17 Feb 2017 13:10:56 -0800
In-Reply-To: <cb8f971b4cb03c90f6459374609be3dce53f2ab1.1485530988.git-series.patrick.ohly@intel.com>
References: <cover.51e0eb88ea69468cf5a410aa7194c25cf61d57b7.1485530988.git-series.patrick.ohly@intel.com>
	<cb8f971b4cb03c90f6459374609be3dce53f2ab1.1485530988.git-series.patrick.ohly@intel.com>
X-Mailer: Evolution 3.18.5.2-0ubuntu3.1 
Mime-Version: 1.0
Subject: Re: [PATCH v5 03/12] ovmf: move from meta-luv to OE-core
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
X-List-Received-Date: Fri, 17 Feb 2017 21:11:07 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit

On Fri, 2017-01-27 at 16:30 +0100, Patrick Ohly wrote:
> From: meta-luv <luv@lists.01.org>
> 
> This is an unmodified copy of
> github.com/01org/luv-yocto/meta-luv/recipes-core/ovmf revision
> 4be4329.

https://autobuilder.yocto.io/builders/nightly-world/builds/156

which boils down to:

| "gcc-ar" cr /home/pokybuild/yocto-autobuilder/yocto-worker/nightly-world/build/build/tmp/work/x86-pokymllib32-linux/lib32-ovmf/git-r0/git/Build/OvmfIa32/RELEASE_GCC5/IA32/MdeModulePkg/Library/BootLogoLib/BootLogoLib/OUTPUT/BootLogoLib.lib  @/home/pokybuild/yocto-autobuilder/yocto-worker/nightly-world/build/build/tmp/work/x86-pokymllib32-linux/lib32-ovmf/git-r0/git/Build/OvmfIa32/RELEASE_GCC5/IA32/MdeModulePkg/Library/BootLogoLib/BootLogoLib/OUTPUT/object_files.lst
| make: *** [/home/pokybuild/yocto-autobuilder/yocto-worker/nightly-world/build/build/tmp/work/x86-pokymllib32-linux/lib32-ovmf/git-r0/git/Build/OvmfIa32/RELEASE_GCC5/IA32/MdeModulePkg/Library/BootMaintenanceManagerUiLib/BootMaintenanceManagerUiLib/DEBUG/BootMaintenanceManager.c] Error 2
| VfrCompile: ERROR 1003: Invalid option value
|   VFR file name /home/pokybuild/yocto-autobuilder/yocto-worker/nightly-world/build/build/tmp/work/x86-pokymllib32-linux/lib32-ovmf/git-r0/git/Build/OvmfIa32/RELEASE_GCC5/IA32/MdeModulePkg/Library/BootMaintenanceManagerUiLib/BootMaintenanceManagerUiLib/OUTPUT/BootMaintenanceManager.i is too long.
| "gcc-ar" cr /home/pokybuild/yocto-autobuilder/yocto-worker/nightly-world/build/build/tmp/work/x86-pokymllib32-linux/lib32-ovmf/git-r0/git/Build/OvmfIa32/RELEASE_GCC5/IA32/OvmfPkg/Library/NvVarsFileLib/NvVarsFileLib/OUTPUT/NvVarsFileLib.lib  @/home/pokybuild/yocto-autobuilder/yocto-worker/nightly-world/build/build/tmp/work/x86-pokymllib32-linux/lib32-ovmf/git-r0/git/Build/OvmfIa32/RELEASE_GCC5/IA32/OvmfPkg/Library/NvVarsFileLib/NvVarsFileLib/OUTPUT/object_files.lst

i.e. path length issues.

We saw this on multiple builds :(.

Cheers,

Richard

