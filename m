Received: from mga02.intel.com ([134.134.136.20])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <sgw@linux.intel.com>) id 1RiEq4-0003CO-3A
	for openembedded-core@lists.openembedded.org;
	Wed, 04 Jan 2012 01:36:22 +0100
Received: from orsmga002.jf.intel.com ([10.7.209.21])
	by orsmga101.jf.intel.com with ESMTP; 03 Jan 2012 16:28:57 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.67,351,1309762800"; d="scan'208";a="94150565"
Received: from unknown (HELO [10.255.13.127]) ([10.255.13.127])
	by orsmga002.jf.intel.com with ESMTP; 03 Jan 2012 16:28:57 -0800
Message-ID: <4F039D49.5000605@linux.intel.com>
Date: Tue, 03 Jan 2012 16:28:57 -0800
From: Saul Wold <sgw@linux.intel.com>
User-Agent: Mozilla/5.0 (X11; Linux x86_64;
	rv:7.0) Gecko/20110927 Thunderbird/7.0
MIME-Version: 1.0
To: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
References: <cover.1325252645.git.shane.wang@intel.com>
In-Reply-To: <cover.1325252645.git.shane.wang@intel.com>
Subject: Re: [PATCH 00/14] [RESEND V2] Upgrade 12 more packages, Dec 30, 2011
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
X-List-Received-Date: Wed, 04 Jan 2012 00:36:22 -0000
Content-Type: text/plain; charset=ISO-8859-1; format=flowed
Content-Transfer-Encoding: 7bit

On 12/30/2011 06:33 AM, Shane Wang wrote:
> This is the second version of the patch set which I sent out with the title "[V1] Upgrade 4 more packages, Dec 27, 2011",
> I upgrade 8 more packages. So, totally 12 for this round, it includes freetype, minicom, libical, libsamplerate0, hdparm, oprofileui, libomxil, linux-firmware, matchbox-wm-2, quota, watchdog, and puzzles.
> So, the previous patchset "[V1] Upgrade 4 more packages, Dec 27, 2011" can be skipped.
>
> Please review.
>
> The following changes since commit d107ab4a11db3df9018d7795aef31e3484367607:
>
>    coreutils: ensure --color works so DEPEND on libcap (2011-12-30 14:22:50 +0800)
>
> are available in the git repository at:
>    git://git.pokylinux.org/poky-contrib shane/upgrade2
>    http://git.pokylinux.org/cgit.cgi/poky-contrib/log/?h=shane/upgrade2
>
> Shane Wang (14):
>    freetype: upgrade to 2.4.8
>    minicom: upgrade to 2.5
>    libical: upgrade to 0.48
>    libsamplerate0: upgrade to 0.1.8
>    distro_tracking_fields: update the info for recipe upgrade.
>    hdparm: upgrade to 9.37
>    oprofileui: upgrade to 82ecf8c6b53b84f80682a8312f9defa83a95f2a3
>    libomxil: upgrade to 0.9.3
>    linux-firmware: upgrade to 15888a2eab052ac3d3f49334e4f6f05f347a516e
>    matchbox-wm-2: ugrade to 01fa5465743c9ee43d040350f4405d35293e4869
>    quota: upgrade to 4.00
>    watchdog: upgrade to 5.11
>    puzzles: upgrade to r9375.
>    distro_tracking_fields: update the info for this round of package
>      upgrade
>
Merged all of this excpet for the hdparm due to the issues already in email.

Thanks
	Sau!

>   .../conf/distro/include/distro_tracking_fields.inc |   53 +++---
>   .../recipes-extended/hdparm/hdparm-6.3/bswap.patch |   37 ----
>   .../hdparm/hdparm-6.3/uclibc.patch                 |   34 ---
>   meta/recipes-extended/hdparm/hdparm_6.3.bb         |   18 --
>   meta/recipes-extended/hdparm/hdparm_9.37.bb        |   35 +++
>   .../{minicom-2.4 =>  minicom-2.5}/gcc4-scope.patch  |    0
>   .../rename-conflicting-functions.patch             |    0
>   .../minicom/{minicom_2.4.bb =>  minicom_2.5.bb}     |    6 +-
>   .../quota/{quota_4.00-pre1.bb =>  quota_4.00.bb}    |    8 +-
>   meta/recipes-extended/stat/stat_3.3.bb             |   27 +++
>   .../watchdog/{watchdog_5.9.bb =>  watchdog_5.11.bb} |    6 +-
>   .../no-hardcode.patch                              |    0
>   .../{freetype_2.4.6.bb =>  freetype_2.4.8.bb}       |    6 +-
>   .../matchbox-wm-2/matchbox-wm-2_git.bb             |    2 +-
>   .../linux-firmware/linux-firmware_git.bb           |    4 +-
>   .../oprofileui/dso_linking_change_build_fix.patch  |   27 ---
>   .../oprofileui/migrate-from-gnomevfs-to-gio.patch  |  219 --------------------
>   meta/recipes-kernel/oprofile/oprofileui_git.bb     |    2 +-
>   .../libomxil/libomxil-0.9.3/configure-fix.patch    |   58 +++++
>   .../libomxil-0.9.3/makefile-docdir-fix.patch       |   19 ++
>   .../libomxil/libomxil-0.9.3/parallel-make.patch    |   18 ++
>   meta/recipes-multimedia/libomxil/libomxil_0.3.3.bb |   23 --
>   meta/recipes-multimedia/libomxil/libomxil_0.9.3.bb |   33 +++
>   .../libsamplerate-0.1.7-macro-quoting.patch        |   22 --
>   ...amplerate0_0.1.7.bb =>  libsamplerate0_0.1.8.bb} |    9 +-
>   .../libical/{libical_0.47.bb =>  libical_0.48.bb}   |    6 +-
>   .../puzzles/{puzzles_r9306.bb =>  puzzles_r9375.bb} |    6 +-
>   27 files changed, 246 insertions(+), 432 deletions(-)
>   delete mode 100644 meta/recipes-extended/hdparm/hdparm-6.3/bswap.patch
>   delete mode 100644 meta/recipes-extended/hdparm/hdparm-6.3/uclibc.patch
>   delete mode 100644 meta/recipes-extended/hdparm/hdparm_6.3.bb
>   create mode 100644 meta/recipes-extended/hdparm/hdparm_9.37.bb
>   rename meta/recipes-extended/minicom/{minicom-2.4 =>  minicom-2.5}/gcc4-scope.patch (100%)
>   rename meta/recipes-extended/minicom/{minicom-2.4 =>  minicom-2.5}/rename-conflicting-functions.patch (100%)
>   rename meta/recipes-extended/minicom/{minicom_2.4.bb =>  minicom_2.5.bb} (75%)
>   rename meta/recipes-extended/quota/{quota_4.00-pre1.bb =>  quota_4.00.bb} (78%)
>   create mode 100644 meta/recipes-extended/stat/stat_3.3.bb
>   rename meta/recipes-extended/watchdog/{watchdog_5.9.bb =>  watchdog_5.11.bb} (70%)
>   rename meta/recipes-graphics/freetype/{freetype-2.4.6 =>  freetype-2.4.8}/no-hardcode.patch (100%)
>   rename meta/recipes-graphics/freetype/{freetype_2.4.6.bb =>  freetype_2.4.8.bb} (91%)
>   delete mode 100644 meta/recipes-kernel/oprofile/oprofileui/dso_linking_change_build_fix.patch
>   delete mode 100644 meta/recipes-kernel/oprofile/oprofileui/migrate-from-gnomevfs-to-gio.patch
>   create mode 100644 meta/recipes-multimedia/libomxil/libomxil-0.9.3/configure-fix.patch
>   create mode 100644 meta/recipes-multimedia/libomxil/libomxil-0.9.3/makefile-docdir-fix.patch
>   create mode 100644 meta/recipes-multimedia/libomxil/libomxil-0.9.3/parallel-make.patch
>   delete mode 100644 meta/recipes-multimedia/libomxil/libomxil_0.3.3.bb
>   create mode 100644 meta/recipes-multimedia/libomxil/libomxil_0.9.3.bb
>   delete mode 100644 meta/recipes-multimedia/libsamplerate/libsamplerate0-0.1.7/libsamplerate-0.1.7-macro-quoting.patch
>   rename meta/recipes-multimedia/libsamplerate/{libsamplerate0_0.1.7.bb =>  libsamplerate0_0.1.8.bb} (61%)
>   rename meta/recipes-sato/libical/{libical_0.47.bb =>  libical_0.48.bb} (78%)
>   rename meta/recipes-sato/puzzles/{puzzles_r9306.bb =>  puzzles_r9375.bb} (91%)
>


