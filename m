Return-Path: <anibal.limon@linux.intel.com>
Received: from mga02.intel.com (mga02.intel.com [134.134.136.20])
	by mail.openembedded.org (Postfix) with ESMTP id D013D72523
	for <openembedded-core@lists.openembedded.org>;
	Tue,  9 Dec 2014 18:25:03 +0000 (UTC)
Received: from orsmga002.jf.intel.com ([10.7.209.21])
	by orsmga101.jf.intel.com with ESMTP; 09 Dec 2014 10:13:49 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.07,546,1413270000"; d="scan'208";a="651086693"
Received: from alimon-thinkpad-w540.zpn.intel.com (HELO [10.219.4.60])
	([10.219.4.60])
	by orsmga002.jf.intel.com with ESMTP; 09 Dec 2014 10:13:48 -0800
Message-ID: <54873BE9.9030905@linux.intel.com>
Date: Tue, 09 Dec 2014 12:14:01 -0600
From: =?UTF-8?B?QW7DrWJhbCBMaW3Ds24=?= <anibal.limon@linux.intel.com>
User-Agent: Mozilla/5.0 (X11; Linux x86_64;
	rv:31.0) Gecko/20100101 Thunderbird/31.2.0
MIME-Version: 1.0
To: "Kamble, Nitin A" <nitin.a.kamble@intel.com>, 
	"Burton, Ross" <ross.burton@intel.com>,
	"openembedded-core@lists.openembedded.org"
	<openembedded-core@lists.openembedded.org>
References: <cover.1417734782.git.anibal.limon@linux.intel.com>
	<ADD6A3980E8C39419A432FF422031B4C7CF45250@ORSMSX103.amr.corp.intel.com>
In-Reply-To: <ADD6A3980E8C39419A432FF422031B4C7CF45250@ORSMSX103.amr.corp.intel.com>
Subject: Re: [PATCHv2 0/3] Upgrades for comply Intel Graphics Stack Release 2014Q3
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
X-List-Received-Date: Tue, 09 Dec 2014 18:25:11 -0000
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 8bit


On 09/12/14 11:20, Kamble, Nitin A wrote:
>
>> -----Original Message-----
>> From: openembedded-core-bounces@lists.openembedded.org
>> [mailto:openembedded-core-bounces@lists.openembedded.org] On Behalf
>> Of Aníbal Limón
>> Sent: Thursday, December 04, 2014 3:18 PM
>> To: openembedded-core@lists.openembedded.org
>> Subject: [OE-core] [PATCHv2 0/3] Upgrades for comply Intel Graphics Stack
>> Release 2014Q3
>>
>> Testing was made building and running core-image-sato in qemux86,
>> qemumips, and qemuarm also core-image-sato/core-image-weston in Intel
>> NUC.
>>
>> Tests freedesktop piglit was run in Intel NUC with 95% of tests passes
>> (9251/9694), you can found full results at [1].
> Is there a previous data point to compare, which can indicate weather the recipe updates are causing any regression or not?
>
> Nitin
>
I don't know, maybe Ross knows?.
>> [YOCTO #6805]
>>
>> [1] https://bugzilla.yoctoproject.org/attachment.cgi?id=2267
>>
>> The following changes since commit
>> a862bf045109d213c301121961bd8d389e48b13d:
>>
>>    upstream_tracking.inc: update entries for dbus (2014-12-03 12:24:01 +0000)
>>
>> are available in the git repository at:
>>
>>    git://git.yoctoproject.org/poky-contrib
>> alimon/linux_intel_graphics_2014q3_v2
>>    http://git.yoctoproject.org/cgit.cgi/poky-
>> contrib/log/?h=alimon/linux_intel_graphics_2014q3_v2
>>
>> Aníbal Limón (3):
>>    libdrm: Upgrade to 2.4.58.
>>    mesa: Upgrade to 10.3.4.
>>    xorg-xserver: Upgrade to 1.16.2.
>>
>>   meta/recipes-graphics/drm/libdrm.inc               |   1 +
>>   .../drm/libdrm/GNU_SOURCE_definition.patch         |  30 --
>>   meta/recipes-graphics/drm/libdrm_2.4.54.bb         |   8 -
>>   meta/recipes-graphics/drm/libdrm_2.4.58.bb         |   7 +
>>   .../mesa/{mesa-gl_10.1.3.bb => mesa-gl_10.3.4.bb}  |   0
>>   ..._sw-include-xlib_sw_winsys.h-only-when-HA.patch |  52 ---  ...ate-
>> NativeDisplayType-depending-on-config.patch | 362 ---------------------
>>   .../mesa/mesa/0006-fix-out-of-tree-egl.patch       |  48 ---
>>   .../mesa/{mesa_10.1.3.bb => mesa_10.3.4.bb}        |   9 +-
>>   meta/recipes-graphics/mesa/mesa_git.bb             |   9 +-
>>   .../recipes-graphics/xorg-xserver/xserver-xorg.inc |   5 +-
>>   .../xorg-xserver/xserver-xorg/crosscompile.patch   |  22 --
>>   .../xserver-xorg/mips64-compiler.patch             |  29 --
>>   .../xorg-xserver/xserver-xorg/present-module.patch |  66 ----
>>   ...erver-xorg_1.15.1.bb => xserver-xorg_1.16.2.bb} |   9 +-
>>   15 files changed, 21 insertions(+), 636 deletions(-)  delete mode 100644
>> meta/recipes-graphics/drm/libdrm/GNU_SOURCE_definition.patch
>>   delete mode 100644 meta/recipes-graphics/drm/libdrm_2.4.54.bb
>>   create mode 100644 meta/recipes-graphics/drm/libdrm_2.4.58.bb
>>   rename meta/recipes-graphics/mesa/{mesa-gl_10.1.3.bb => mesa-
>> gl_10.3.4.bb} (100%)  delete mode 100644 meta/recipes-
>> graphics/mesa/mesa/0002-pipe_loader_sw-include-xlib_sw_winsys.h-only-
>> when-HA.patch
>>   delete mode 100644 meta/recipes-graphics/mesa/mesa/0003-EGL-Mutate-
>> NativeDisplayType-depending-on-config.patch
>>   delete mode 100644 meta/recipes-graphics/mesa/mesa/0006-fix-out-of-
>> tree-egl.patch
>>   rename meta/recipes-graphics/mesa/{mesa_10.1.3.bb => mesa_10.3.4.bb}
>> (62%)  delete mode 100644 meta/recipes-graphics/xorg-xserver/xserver-
>> xorg/crosscompile.patch
>>   delete mode 100644 meta/recipes-graphics/xorg-xserver/xserver-
>> xorg/mips64-compiler.patch
>>   delete mode 100644 meta/recipes-graphics/xorg-xserver/xserver-
>> xorg/present-module.patch
>>   rename meta/recipes-graphics/xorg-xserver/{xserver-xorg_1.15.1.bb =>
>> xserver-xorg_1.16.2.bb} (75%)
>>
>> --
>> 1.9.1
>>
>> --
>> _______________________________________________
>> Openembedded-core mailing list
>> Openembedded-core@lists.openembedded.org
>> http://lists.openembedded.org/mailman/listinfo/openembedded-core


