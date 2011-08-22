Received: from mga03.intel.com ([143.182.124.21])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <sgw@linux.intel.com>) id 1QveA5-0001xk-OI
	for openembedded-core@lists.openembedded.org;
	Tue, 23 Aug 2011 01:44:09 +0200
Received: from azsmga001.ch.intel.com ([10.2.17.19])
	by azsmga101.ch.intel.com with ESMTP; 22 Aug 2011 16:39:23 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.68,266,1312182000"; d="scan'208";a="41271149"
Received: from unknown (HELO [10.255.13.234]) ([10.255.13.234])
	by azsmga001.ch.intel.com with ESMTP; 22 Aug 2011 16:39:23 -0700
Message-ID: <4E52E8AA.2070806@linux.intel.com>
Date: Mon, 22 Aug 2011 16:39:22 -0700
From: Saul Wold <sgw@linux.intel.com>
User-Agent: Mozilla/5.0 (X11; Linux x86_64;
	rv:5.0) Gecko/20110707 Thunderbird/5.0
MIME-Version: 1.0
To: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
References: <cover.1313503778.git.dexuan.cui@intel.com>
In-Reply-To: <cover.1313503778.git.dexuan.cui@intel.com>
Subject: Re: [PATCH 00/10] fixes to 1371 and 1330, and upgrades to some recipes
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
X-List-Received-Date: Mon, 22 Aug 2011 23:44:10 -0000
Content-Type: text/plain; charset=ISO-8859-1; format=flowed
Content-Transfer-Encoding: 7bit

On 08/16/2011 07:13 AM, Dexuan Cui wrote:
> The following changes since commit 13db5f420ca9bff98561f80d78958278734ad1f4:
>
>    distro-tracking: Update info for gpgme, libassuan, apr... after last upgrade. (2011-08-15 15:26:04 +0100)
>
> are available in the git repository at:
>    git://git.pokylinux.org/poky-contrib dcui/master
>    http://git.pokylinux.org/cgit.cgi/poky-contrib/log/?h=dcui/master
>
> Dexuan Cui (10):
>    bluez-hcidump: upgrade from 2.0 to 2.1
>    tcf-agent: add openssl into DEPENDS
>    cronie: upgrade from 1.4.7 to 1.4.8
>    mdadm: upgrade mdadm from 3.2.1 to 3.2.2
>    util-macros: upgrade from 1.14.0 to the latest version 0.15.0
>    freetype: upgrade from 2.4.4 to 2.4.6
>    xproto: upgrade from 7.0.21 to 7.0.22
>    glproto: upgrade from 1.4.13 to 1.4.14
>    dri2proto: upgrade from 2.4 to 2.6
>    distro_tracking_fields.inc: update the info for the following recipes
>
>   .../conf/distro/include/distro_tracking_fields.inc |   56 +++---
>   .../{bluez-hcidump_2.0.bb =>  bluez-hcidump_2.1.bb} |    4 +-
>   meta/recipes-devtools/tcf-agent/tcf-agent_svn.bb   |    4 +-
>   .../cronie/{cronie_1.4.7.bb =>  cronie_1.4.8.bb}    |    6 +-
>   .../mdadm/fix_for_compilation_with_gcc-4.6.0.patch |  174 --------------------
>   .../mdadm/{mdadm_3.2.1.bb =>  mdadm_3.2.2.bb}       |    9 +-
>   .../no-hardcode.patch                              |    0
>   .../{freetype_2.4.4.bb =>  freetype_2.4.6.bb}       |    8 +-
>   .../restore_to_old_xDRI2BufferSwapComplete.patch   |   53 ------
>   .../{dri2proto_2.4.bb =>  dri2proto_2.6.bb}         |    7 +-
>   .../restore_the_old_xGLXBufferSwapComplete.patch   |   53 ------
>   .../{glproto_1.4.13.bb =>  glproto_1.4.14.bb}       |    7 +-
>   .../{xproto_7.0.21.bb =>  xproto_7.0.22.bb}         |    4 +-
>   ...util-macros_1.14.0.bb =>  util-macros_1.15.0.bb} |    4 +-
>   14 files changed, 53 insertions(+), 336 deletions(-)
>   rename meta/recipes-connectivity/bluez/{bluez-hcidump_2.0.bb =>  bluez-hcidump_2.1.bb} (83%)
>   rename meta/recipes-extended/cronie/{cronie_1.4.7.bb =>  cronie_1.4.8.bb} (94%)
>   delete mode 100644 meta/recipes-extended/mdadm/mdadm/fix_for_compilation_with_gcc-4.6.0.patch
>   rename meta/recipes-extended/mdadm/{mdadm_3.2.1.bb =>  mdadm_3.2.2.bb} (77%)
>   rename meta/recipes-graphics/freetype/{freetype-2.4.4 =>  freetype-2.4.6}/no-hardcode.patch (100%)
>   rename meta/recipes-graphics/freetype/{freetype_2.4.4.bb =>  freetype_2.4.6.bb} (82%)
>   delete mode 100644 meta/recipes-graphics/xorg-proto/dri2proto/restore_to_old_xDRI2BufferSwapComplete.patch
>   rename meta/recipes-graphics/xorg-proto/{dri2proto_2.4.bb =>  dri2proto_2.6.bb} (66%)
>   delete mode 100644 meta/recipes-graphics/xorg-proto/glproto/restore_the_old_xGLXBufferSwapComplete.patch
>   rename meta/recipes-graphics/xorg-proto/{glproto_1.4.13.bb =>  glproto_1.4.14.bb} (68%)
>   rename meta/recipes-graphics/xorg-proto/{xproto_7.0.21.bb =>  xproto_7.0.22.bb} (72%)
>   rename meta/recipes-graphics/xorg-util/{util-macros_1.14.0.bb =>  util-macros_1.15.0.bb} (80%)
>
Merged into OE-Core

Thanks
	Sau!



