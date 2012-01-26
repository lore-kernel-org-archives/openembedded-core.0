Received: from mga14.intel.com ([143.182.124.37])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <sgw@linux.intel.com>) id 1RqTAw-00045Y-Md
	for openembedded-core@lists.openembedded.org;
	Thu, 26 Jan 2012 18:31:55 +0100
Received: from azsmga001.ch.intel.com ([10.2.17.19])
	by azsmga102.ch.intel.com with ESMTP; 26 Jan 2012 09:17:11 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.71,315,1320652800"; d="scan'208";a="100055110"
Received: from unknown (HELO [10.255.14.96]) ([10.255.14.96])
	by azsmga001.ch.intel.com with ESMTP; 26 Jan 2012 09:17:11 -0800
Message-ID: <4F218A96.8020905@linux.intel.com>
Date: Thu, 26 Jan 2012 09:17:10 -0800
From: Saul Wold <sgw@linux.intel.com>
User-Agent: Mozilla/5.0 (X11; Linux x86_64;
	rv:8.0) Gecko/20111115 Thunderbird/8.0
MIME-Version: 1.0
To: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
References: <cover.1327255445.git.shane.wang@intel.com>
In-Reply-To: <cover.1327255445.git.shane.wang@intel.com>
Subject: Re: [PATCH 00/18][V1] upgrade recipes
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
X-List-Received-Date: Thu, 26 Jan 2012 17:31:55 -0000
Content-Type: text/plain; charset=ISO-8859-1; format=flowed
Content-Transfer-Encoding: 7bit

On 01/22/2012 10:06 AM, Shane Wang wrote:
> Upgrade recipes to the latest, including strace, pciutils, ed, ofono, iproute2, bluez4, bluez-hcidump, kexec-tools, tremor, iptables, polkit, libxcb, xcb-proto, pixman, util-macros, and mobile-broadband-provider-info.
> Please review.
>
> The following changes since commit 3fe81df6400448b54b47a13f27e1389b1e824ab0:
>
>    distro_tracking: update libpng, libgdbus, opensp, nfs-utils manual check dates (2012-01-20 16:47:51 +0000)
>
> are available in the git repository at:
>    git://git.pokylinux.org/poky-contrib shane/china-new-year-upgrade
>    http://git.pokylinux.org/cgit.cgi/poky-contrib/log/?h=shane/china-new-year-upgrade
>
> Shane Wang (18):
>    util-macros: upgrade to 1.16.1
>    pixman: upgrade to 0.24.2
>    xcb-proto: upgrade to 1.7
>    libxcb: upgrade to 1.8
>    polkit: upgrade to 0.104
>    iptables: upgrade to 1.4.12.2
>    tremor: upgrade to 18163 (20120122)
>    kexec-tools: upgrade to 2.0.3
>    bluez-hcidump: upgrade to 2.2
>    bluez4: upgrade to 4.98
>    iproute2: upgrade to 3.2.0
>    mobile-broadband-provider-info: bring a new recipe into poky
>    ofono: upgrade to 1.3
>    ed: upgrade to 1.6
>    pciutils: upgrade to 3.1.9
>    strace: upgrade to 4.6
>    libsoup: update its info in distro_tracking.inc
>    distro_tracking.inc: update the info for recipes upgraded recently
>
>   .../conf/distro/include/distro_tracking_fields.inc |  105 ++++++++++---------
>   .../configure.patch                                |   69 +++++++-------
>   .../guess-fix.patch                                |    0
>   .../lib-build-fix.patch                            |    0
>   .../makefile.patch                                 |    0
>   .../pcimodules-pciutils.diff                       |    0
>   .../{pciutils_3.1.7.bb =>  pciutils_3.1.9.bb}       |    6 +-
>   .../{bluez-hcidump_2.1.bb =>  bluez-hcidump_2.2.bb} |    4 +-
>   .../{bluez4-4.96 =>  bluez4-4.98}/bluetooth.conf    |    0
>   .../bluez/{bluez4_4.96.bb =>  bluez4_4.98.bb}       |    6 +-
>   .../configure-cross.patch                          |   30 +++----
>   .../{iproute2_3.1.0.bb =>  iproute2_3.2.0.bb}       |    5 +-
>   .../mobile-broadband-provider-info_git.bb          |   13 +++
>   meta/recipes-connectivity/ofono/ofono.inc          |    2 +-
>   .../ofono/{ofono_1.0.bb =>  ofono_1.3.bb}           |    4 +-
>   .../{strace-4.5.20 =>  strace-4.6}/sigmask.patch    |    0
>   .../strace/{strace_4.5.20.bb =>  strace_4.6.bb}     |    8 +-
>   .../ed/{ed-1.5 =>  ed-1.6}/ed-1.2-build.patch       |    0
>   meta/recipes-extended/ed/{ed_1.5.bb =>  ed_1.6.bb}  |   10 +-
>   .../iptables/iptables/GNUmakefile.patch            |   18 ++++
>   .../{iptables_1.4.12.1.bb =>  iptables_1.4.12.2.bb} |    7 +-
>   .../introspection.patch                            |    0
>   .../polkit-1_pam.patch                             |    0
>   .../polkit/{polkit_0.103.bb =>  polkit_0.104.bb}    |    6 +-
>   .../xcb/{libxcb_1.7.bb =>  libxcb_1.8.bb}           |    6 +-
>   .../xcb/xcb-proto-1.6/xcb-proto-libdir.patch       |   14 ---
>   meta/recipes-graphics/xcb/xcb-proto.inc            |    3 +-
>   .../xcb/{xcb-proto_1.6.bb =>  xcb-proto_1.7.bb}     |    6 +-
>   .../{pixman_0.24.0.bb =>  pixman_0.24.2.bb}         |    4 +-
>   ...util-macros_1.16.0.bb =>  util-macros_1.16.1.bb} |    4 +-
>   .../fix_for_compiling_with_gcc-4.6.0.patch         |   40 --------
>   .../{kexec-tools_2.0.2.bb =>  kexec-tools_2.0.3.bb} |    7 +-
>   .../{tremor_20101121.bb =>  tremor_20120122.bb}     |    2 +-
>   33 files changed, 178 insertions(+), 201 deletions(-)
>   rename meta/recipes-bsp/pciutils/{pciutils-3.1.7 =>  pciutils-3.1.9}/configure.patch (85%)
>   rename meta/recipes-bsp/pciutils/{pciutils-3.1.7 =>  pciutils-3.1.9}/guess-fix.patch (100%)
>   rename meta/recipes-bsp/pciutils/{pciutils-3.1.7 =>  pciutils-3.1.9}/lib-build-fix.patch (100%)
>   rename meta/recipes-bsp/pciutils/{pciutils-3.1.7 =>  pciutils-3.1.9}/makefile.patch (100%)
>   rename meta/recipes-bsp/pciutils/{pciutils-3.1.7 =>  pciutils-3.1.9}/pcimodules-pciutils.diff (100%)
>   rename meta/recipes-bsp/pciutils/{pciutils_3.1.7.bb =>  pciutils_3.1.9.bb} (91%)
>   rename meta/recipes-connectivity/bluez/{bluez-hcidump_2.1.bb =>  bluez-hcidump_2.2.bb} (83%)
>   rename meta/recipes-connectivity/bluez/{bluez4-4.96 =>  bluez4-4.98}/bluetooth.conf (100%)
>   rename meta/recipes-connectivity/bluez/{bluez4_4.96.bb =>  bluez4_4.98.bb} (86%)
>   rename meta/recipes-connectivity/iproute2/{iproute2-3.1.0 =>  iproute2-3.2.0}/configure-cross.patch (69%)
>   rename meta/recipes-connectivity/iproute2/{iproute2_3.1.0.bb =>  iproute2_3.2.0.bb} (46%)
>   create mode 100644 meta/recipes-connectivity/mobile-broadband-provider-info/mobile-broadband-provider-info_git.bb
>   rename meta/recipes-connectivity/ofono/{ofono_1.0.bb =>  ofono_1.3.bb} (66%)
>   rename meta/recipes-devtools/strace/{strace-4.5.20 =>  strace-4.6}/sigmask.patch (100%)
>   rename meta/recipes-devtools/strace/{strace_4.5.20.bb =>  strace_4.6.bb} (67%)
>   rename meta/recipes-extended/ed/{ed-1.5 =>  ed-1.6}/ed-1.2-build.patch (100%)
>   rename meta/recipes-extended/ed/{ed_1.5.bb =>  ed_1.6.bb} (59%)
>   create mode 100644 meta/recipes-extended/iptables/iptables/GNUmakefile.patch
>   rename meta/recipes-extended/iptables/{iptables_1.4.12.1.bb =>  iptables_1.4.12.2.bb} (88%)
>   rename meta/recipes-extended/polkit/{polkit-0.103 =>  polkit-0.104}/introspection.patch (100%)
>   rename meta/recipes-extended/polkit/{polkit-0.103 =>  polkit-0.104}/polkit-1_pam.patch (100%)
>   rename meta/recipes-extended/polkit/{polkit_0.103.bb =>  polkit_0.104.bb} (83%)
>   rename meta/recipes-graphics/xcb/{libxcb_1.7.bb =>  libxcb_1.8.bb} (56%)
>   delete mode 100644 meta/recipes-graphics/xcb/xcb-proto-1.6/xcb-proto-libdir.patch
>   rename meta/recipes-graphics/xcb/{xcb-proto_1.6.bb =>  xcb-proto_1.7.bb} (58%)
>   rename meta/recipes-graphics/xorg-lib/{pixman_0.24.0.bb =>  pixman_0.24.2.bb} (83%)
>   rename meta/recipes-graphics/xorg-util/{util-macros_1.16.0.bb =>  util-macros_1.16.1.bb} (75%)
>   delete mode 100644 meta/recipes-kernel/kexec/kexec-tools/fix_for_compiling_with_gcc-4.6.0.patch
>   rename meta/recipes-kernel/kexec/{kexec-tools_2.0.2.bb =>  kexec-tools_2.0.3.bb} (47%)
>   rename meta/recipes-multimedia/tremor/{tremor_20101121.bb =>  tremor_20120122.bb} (88%)
>

Merged into OE-Core

Thanks
	Sau!


