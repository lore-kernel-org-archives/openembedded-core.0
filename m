Received: from mga01.intel.com ([192.55.52.88])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <sgw@linux.intel.com>) id 1RiESf-0002T9-Ti
	for openembedded-core@lists.openembedded.org;
	Wed, 04 Jan 2012 01:12:10 +0100
Received: from fmsmga001.fm.intel.com ([10.253.24.23])
	by fmsmga101.fm.intel.com with ESMTP; 03 Jan 2012 16:04:48 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.71,315,1320652800"; d="scan'208";a="102880824"
Received: from unknown (HELO [10.255.13.127]) ([10.255.13.127])
	by fmsmga001.fm.intel.com with ESMTP; 03 Jan 2012 16:04:48 -0800
Message-ID: <4F0397A0.1060007@linux.intel.com>
Date: Tue, 03 Jan 2012 16:04:48 -0800
From: Saul Wold <sgw@linux.intel.com>
User-Agent: Mozilla/5.0 (X11; Linux x86_64;
	rv:7.0) Gecko/20110927 Thunderbird/7.0
MIME-Version: 1.0
To: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
References: <cover.1325234092.git.dexuan.cui@intel.com>
In-Reply-To: <cover.1325234092.git.dexuan.cui@intel.com>
Subject: Re: [PATCH 0/6] upgrading from Dexuan: Dec 30, 2011
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
X-List-Received-Date: Wed, 04 Jan 2012 00:12:10 -0000
Content-Type: text/plain; charset=ISO-8859-1; format=flowed
Content-Transfer-Encoding: 7bit

On 12/30/2011 12:53 AM, Dexuan Cui wrote:
> The following changes since commit 9fc755cdb528f0913baf1f2d86ef62ee4cae92f2:
>
>    Add Upstream-Status to patches (2011-12-29 13:58:12 -0800)
>
> are available in the git repository at:
>    git://git.pokylinux.org/poky-contrib dcui/stage/master_under_test
>    http://git.pokylinux.org/cgit.cgi/poky-contrib/log/?h=dcui/stage/master_under_test
>
> Dexuan Cui (6):
>    mdadm: upgrade to the latest version 3.2.3
>    liburcu: upgrade from 0.6.4 to the latest 0.6.7
>    lttng-ust: upgrade from 0.15 to the latest 0.16
>    libpciaccess: upgrade from 0.12.1 to 0.12.902
>    util-macros: upgrade from 1.15.0 to the latest 1.16.0
>    distro_tracking_fields.inc: update the info
>
>   .../conf/distro/include/distro_tracking_fields.inc |  107 +++++++++++---------
>   .../0001-mdadm-fix-build-failures-ppc64.patch      |   52 ----------
>   .../mdadm/{mdadm_3.2.2.bb =>  mdadm_3.2.3.bb}       |   13 +--
>   .../fix_deletion_of_last_handle.patch              |   51 +++++++++
>   ...ciaccess_0.12.1.bb =>  libpciaccess_0.12.902.bb} |    8 +-
>   ...util-macros_1.15.0.bb =>  util-macros_1.16.0.bb} |    4 +-
>   meta/recipes-kernel/lttng/fix-powerpc64.patch      |   17 ---
>   .../lttng/{lttng-ust_0.15.bb =>  lttng-ust_0.16.bb} |    9 +-
>   .../liburcu/{liburcu_0.6.4.bb =>  liburcu_0.6.7.bb} |    6 +-
>   9 files changed, 128 insertions(+), 139 deletions(-)
>   delete mode 100644 meta/recipes-extended/mdadm/files/0001-mdadm-fix-build-failures-ppc64.patch
>   rename meta/recipes-extended/mdadm/{mdadm_3.2.2.bb =>  mdadm_3.2.3.bb} (65%)
>   create mode 100644 meta/recipes-graphics/xorg-lib/libpciaccess-0.12.902/fix_deletion_of_last_handle.patch
>   rename meta/recipes-graphics/xorg-lib/{libpciaccess_0.12.1.bb =>  libpciaccess_0.12.902.bb} (50%)
>   rename meta/recipes-graphics/xorg-util/{util-macros_1.15.0.bb =>  util-macros_1.16.0.bb} (75%)
>   delete mode 100644 meta/recipes-kernel/lttng/fix-powerpc64.patch
>   rename meta/recipes-kernel/lttng/{lttng-ust_0.15.bb =>  lttng-ust_0.16.bb} (79%)
>   rename meta/recipes-support/liburcu/{liburcu_0.6.4.bb =>  liburcu_0.6.7.bb} (80%)
>

Merged into OE-Core

Thanks
	Sau!



