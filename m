Return-Path: <sgw@linux.intel.com>
Received: from mga02.intel.com (mga02.intel.com [134.134.136.20])
	by mail.openembedded.org (Postfix) with ESMTP id 36D2972732
	for <openembedded-core@lists.openembedded.org>;
	Tue, 23 Dec 2014 22:57:02 +0000 (UTC)
Received: from fmsmga003.fm.intel.com ([10.253.24.29])
	by orsmga101.jf.intel.com with ESMTP; 23 Dec 2014 14:57:03 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.97,862,1389772800"; d="scan'208";a="432753678"
Received: from aeadams-mobl.ger.corp.intel.com (HELO localhost.localdomain)
	([10.255.13.204])
	by FMSMGA003.fm.intel.com with ESMTP; 23 Dec 2014 14:45:30 -0800
Message-ID: <5499F33E.2070306@linux.intel.com>
Date: Tue, 23 Dec 2014 14:57:02 -0800
From: Saul Wold <sgw@linux.intel.com>
User-Agent: Mozilla/5.0 (X11; Linux x86_64;
	rv:31.0) Gecko/20100101 Thunderbird/31.3.0
MIME-Version: 1.0
To: openembedded-core@lists.openembedded.org
References: <cover.1418190513.git.sgw@linux.intel.com>
In-Reply-To: <cover.1418190513.git.sgw@linux.intel.com>
Subject: Re: [PATCH 0/6] Updates and bug fixes
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
X-List-Received-Date: Tue, 23 Dec 2014 22:57:08 -0000
Content-Type: text/plain; charset=windows-1252; format=flowed
Content-Transfer-Encoding: 7bit


ping!

On 12/09/2014 09:55 PM, Saul Wold wrote:
> The nss* tarballs have been removed so we need to use the git repos at
> 0pointer. These git repos need to build the README, but use lynx, so disable
> for now.
>
> Sau!
>
> The following changes since commit 219e793907406eabf632e784e3a11ab9acb77cfb:
>
>    qemu/libc-package: Fix qemu option handling (2014-12-05 17:59:42 +0000)
>
> are available in the git repository at:
>
>    git://git.openembedded.org/openembedded-core-contrib sgw/updates
>    http://cgit.openembedded.org/cgit.cgi/openembedded-core-contrib/log/?h=sgw/updates
>
> Saul Wold (6):
>    procps: Upgrade to 3.3.10
>    babeltrace: Update to 1.2.4
>    npth: npth needs pthread in some cases
>    libdaemon: Convert to git
>    libnss-mdns: Convert to git
>    nss-myhostname: Convert to git
>
>   .../libnss-mdns/libnss-mdns-disable-docs.patch     |  23 +++++
>   .../libnss-mdns/libnss-mdns_0.10.bb                |  10 +-
>   .../procps-3.2.8/0001-Fix-musl-build-failure.patch |  29 ------
>   .../procps-3.2.8/60_linux_version_init.patch       |  54 ----------
>   .../procps/procps-3.2.8/detect_bitness.patch       |  26 -----
>   .../procps/procps-3.2.8/gnu-kbsd-version.patch     |  44 --------
>   .../procps/procps-3.2.8/install.patch              |  39 --------
>   .../procps/procps-3.2.8/linux-limits.patch         |  15 ---
>   .../procps/procps-3.2.8/procmodule.patch           |  38 -------
>   .../procps-3.2.8/procps-3.2.7-top-remcpu.patch     | 111 ---------------------
>   .../procps-3.2.8/procps-3.2.8+gmake-3.82.patch     |  19 ----
>   .../procps-3.2.8/procps-3.2.8-ps-cgroup.patch      |  82 ---------------
>   .../procps/procps-3.2.8/psmodule.patch             |  23 -----
>   meta/recipes-extended/procps/procps.inc            |  31 ------
>   .../procps/procps/fix-configure.patch              |  19 ++++
>   .../procps/{procps-3.2.8 => procps}/sysctl.conf    |   0
>   meta/recipes-extended/procps/procps_3.2.8.bb       |  37 -------
>   meta/recipes-extended/procps/procps_3.3.10.bb      |  62 ++++++++++++
>   .../{babeltrace_1.2.3.bb => babeltrace_1.2.4.bb}   |   4 +-
>   meta/recipes-support/libdaemon/libdaemon_0.14.bb   |  13 +--
>   meta/recipes-support/npth/npth/pkgconfig.patch     |   3 +-
>   .../nss-myhostname-disable-docs.patch              |  25 +++++
>   .../nss-myhostname/nss-myhostname_0.3.bb           |  12 ++-
>   23 files changed, 153 insertions(+), 566 deletions(-)
>   create mode 100644 meta/recipes-connectivity/libnss-mdns/libnss-mdns/libnss-mdns-disable-docs.patch
>   delete mode 100644 meta/recipes-extended/procps/procps-3.2.8/0001-Fix-musl-build-failure.patch
>   delete mode 100644 meta/recipes-extended/procps/procps-3.2.8/60_linux_version_init.patch
>   delete mode 100644 meta/recipes-extended/procps/procps-3.2.8/detect_bitness.patch
>   delete mode 100644 meta/recipes-extended/procps/procps-3.2.8/gnu-kbsd-version.patch
>   delete mode 100644 meta/recipes-extended/procps/procps-3.2.8/install.patch
>   delete mode 100644 meta/recipes-extended/procps/procps-3.2.8/linux-limits.patch
>   delete mode 100644 meta/recipes-extended/procps/procps-3.2.8/procmodule.patch
>   delete mode 100644 meta/recipes-extended/procps/procps-3.2.8/procps-3.2.7-top-remcpu.patch
>   delete mode 100644 meta/recipes-extended/procps/procps-3.2.8/procps-3.2.8+gmake-3.82.patch
>   delete mode 100644 meta/recipes-extended/procps/procps-3.2.8/procps-3.2.8-ps-cgroup.patch
>   delete mode 100644 meta/recipes-extended/procps/procps-3.2.8/psmodule.patch
>   delete mode 100644 meta/recipes-extended/procps/procps.inc
>   create mode 100644 meta/recipes-extended/procps/procps/fix-configure.patch
>   rename meta/recipes-extended/procps/{procps-3.2.8 => procps}/sysctl.conf (100%)
>   delete mode 100644 meta/recipes-extended/procps/procps_3.2.8.bb
>   create mode 100644 meta/recipes-extended/procps/procps_3.3.10.bb
>   rename meta/recipes-kernel/lttng/{babeltrace_1.2.3.bb => babeltrace_1.2.4.bb} (89%)
>   create mode 100644 meta/recipes-support/nss-myhostname/nss-myhostname/nss-myhostname-disable-docs.patch
>

