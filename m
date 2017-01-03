Return-Path: <maxin.john@intel.com>
Received: from mga11.intel.com (mga11.intel.com [192.55.52.93])
	by mail.openembedded.org (Postfix) with ESMTP id F027E60190
	for <openembedded-core@lists.openembedded.org>;
	Tue,  3 Jan 2017 10:02:21 +0000 (UTC)
Received: from fmsmga003.fm.intel.com ([10.253.24.29])
	by fmsmga102.fm.intel.com with ESMTP; 03 Jan 2017 02:02:18 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.33,451,1477983600"; d="scan'208";a="804570678"
Received: from mbabyjoh-desk.fi.intel.com (HELO
	mbabyjoh-desk.ger.corp.intel.com) ([10.237.72.71])
	by FMSMGA003.fm.intel.com with ESMTP; 03 Jan 2017 02:02:17 -0800
Date: Tue, 3 Jan 2017 12:02:21 +0200
From: "Maxin B. John" <maxin.john@intel.com>
To: Chen Qi <Qi.Chen@windriver.com>
Message-ID: <20170103100220.GA1795@mbabyjoh-desk.ger.corp.intel.com>
References: <cover.1483434815.git.Qi.Chen@windriver.com>
MIME-Version: 1.0
In-Reply-To: <cover.1483434815.git.Qi.Chen@windriver.com>
User-Agent: Mutt/1.5.23 (2014-03-12)
Cc: openembedded-core@lists.openembedded.org
Subject: Re: [PATCH 0/1] busybox: upgrade to 1.25.1
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
X-List-Received-Date: Tue, 03 Jan 2017 10:02:22 -0000
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

Hi,

On Tue, Jan 03, 2017 at 05:16:05PM +0800, Chen Qi wrote:
> The following changes since commit dbb247cac5fbf7b037e4955f9793828451723924:
> 
>   bitbake: cookerdata: Convert multiconfig to use BB_CURRENT_MC (2016-12-22 12:36:40 +0000)
> 
> are available in the git repository at:
> 
>   git://git.pokylinux.org/poky-contrib ChenQi/busybox-1.25.1
>   http://git.pokylinux.org/cgit.cgi/poky-contrib/log/?h=ChenQi/busybox-1.25.1
> 
> Chen Qi (1):
>   busybox: upgrade to 1.25.1

BusyBox 1.26.1 (stable) was released on  2 January 2017. Can we move to this release?

>  ...e-the-behaviour-of-c-parameter-to-match-u.patch |  73 -----------
>  ...biproute-handle-table-ids-larger-than-255.patch |  40 +++---
>  ...-n-flushes-pattern-space-terminates-early.patch |  72 -----------
>  .../busybox/busybox/CVE-2016-2147.patch            |  57 --------
>  .../busybox/busybox/CVE-2016-2147_2.patch          |  32 -----
>  .../busybox/busybox/CVE-2016-2148.patch            |  74 -----------
>  .../busybox-1.24.1-truncate-open-mode.patch        |  81 ------------
>  .../busybox/busybox-1.24.1-unzip-regression.patch  | 143 ---------------------
>  .../busybox/busybox/busybox-1.24.1-unzip.patch     | 118 -----------------
>  .../busybox/busybox/busybox-cross-menuconfig.patch |  71 ----------
>  .../busybox-kbuild-race-fix-commit-d8e61bb.patch   |  53 --------
>  .../busybox/busybox-udhcpc-no_deconfig.patch       |  61 ++++-----
>  .../commit-applet_tables-fix-commit-0dddbc1.patch  |  61 ---------
>  ...lem_on_mips64_n64_big_endian_musl_systems.patch |  90 -------------
>  .../busybox/busybox/makefile-fix-backport.patch    |  40 ------
>  .../{busybox_1.24.1.bb => busybox_1.25.1.bb}       |  17 +--
>  meta/recipes-core/busybox/busybox_git.bb           |   7 +-
>  17 files changed, 51 insertions(+), 1039 deletions(-)
>  delete mode 100644 meta/recipes-core/busybox/busybox/0001-flock-update-the-behaviour-of-c-parameter-to-match-u.patch
>  delete mode 100644 meta/recipes-core/busybox/busybox/0001-sed-fix-sed-n-flushes-pattern-space-terminates-early.patch
>  delete mode 100644 meta/recipes-core/busybox/busybox/CVE-2016-2147.patch
>  delete mode 100644 meta/recipes-core/busybox/busybox/CVE-2016-2147_2.patch
>  delete mode 100644 meta/recipes-core/busybox/busybox/CVE-2016-2148.patch
>  delete mode 100644 meta/recipes-core/busybox/busybox/busybox-1.24.1-truncate-open-mode.patch
>  delete mode 100644 meta/recipes-core/busybox/busybox/busybox-1.24.1-unzip-regression.patch
>  delete mode 100644 meta/recipes-core/busybox/busybox/busybox-1.24.1-unzip.patch
>  delete mode 100644 meta/recipes-core/busybox/busybox/busybox-cross-menuconfig.patch
>  delete mode 100644 meta/recipes-core/busybox/busybox/busybox-kbuild-race-fix-commit-d8e61bb.patch
>  delete mode 100644 meta/recipes-core/busybox/busybox/commit-applet_tables-fix-commit-0dddbc1.patch
>  delete mode 100644 meta/recipes-core/busybox/busybox/ip_fix_problem_on_mips64_n64_big_endian_musl_systems.patch
>  delete mode 100644 meta/recipes-core/busybox/busybox/makefile-fix-backport.patch
>  rename meta/recipes-core/busybox/{busybox_1.24.1.bb => busybox_1.25.1.bb} (65%)

Best Regards,
Maxin

