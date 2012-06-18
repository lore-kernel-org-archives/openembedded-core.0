Received: from mga11.intel.com ([192.55.52.93])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <sgw@linux.intel.com>) id 1SgfI8-0001tG-U2
	for openembedded-core@lists.openembedded.org;
	Mon, 18 Jun 2012 18:59:05 +0200
Received: from fmsmga002.fm.intel.com ([10.253.24.26])
	by fmsmga102.fm.intel.com with ESMTP; 18 Jun 2012 09:48:21 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.71,315,1320652800"; d="scan'208";a="181666637"
Received: from unknown (HELO [10.255.12.105]) ([10.255.12.105])
	by fmsmga002.fm.intel.com with ESMTP; 18 Jun 2012 09:48:20 -0700
Message-ID: <4FDF5BD4.3040707@linux.intel.com>
Date: Mon, 18 Jun 2012 09:48:20 -0700
From: Saul Wold <sgw@linux.intel.com>
User-Agent: Mozilla/5.0 (X11; Linux x86_64;
	rv:12.0) Gecko/20120430 Thunderbird/12.0.1
MIME-Version: 1.0
To: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
References: <cover.1339740433.git.raj.khem@gmail.com>
In-Reply-To: <cover.1339740433.git.raj.khem@gmail.com>
Subject: Re: [PATCH 0/9 V3] rpm compilation on uclibc
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
X-List-Received-Date: Mon, 18 Jun 2012 16:59:05 -0000
Content-Type: text/plain; charset=ISO-8859-1; format=flowed
Content-Transfer-Encoding: 7bit

On 06/14/2012 11:12 PM, Khem Raj wrote:
>
> This patch now can compile a uclibc sato image using rpm as packaging backend
> fixes libzypp, zypper, sat-solver builds on uclibc
> Upgrades uclibc-0.9.33 to latest on branch since we need
> the fixes for glib-2.32.x to work correctly.
> Fix glib-2.32.x build failure on x86_64/uclibc by caching
> the relevant config variables (guint32/guint64) same patch was
> applied to other architecture site files recently.
>
> The following changes since commit ba380813c0198f95b1e786aa7f49b80c68cfe9b9:
>
>    gcc-configure-target: Fix sysroot option breakage I introduced (sorry) (2012-06-14 19:48:07 +0100)
>
> are available in the git repository at:
>    git://git.openembedded.org/openembedded-core-contrib kraj/misc-updates
>    http://cgit.openembedded.org/cgit.cgi/openembedded-core-contrib/log/?h=kraj/misc-updates
>
> Khem Raj (9):
>    uclibc_0.9.33.bb: Upgrade to latest git
>    site/x86_64-linux-uclibc: Cache definitions of guint32/guint64
>    rpm: Fix compilation on uclibc
>    rpm: Use link time check for libssp
>    sat-solver: Fix build on uclibc
>    libzypp: Fix build with uclibc
>    rpm: pass lrt and lpthread to link step explicitly for uclibc
>    zypper: Fix build on uclibc
>    libzypp: Define OECMAKE_CXX_LINK_FLAGS when compiling for uclibc
>
>   meta/recipes-core/uclibc/uclibc_0.9.33.bb          |    4 +-
>   .../rpm/rpm/fstack-protector-configure-check.patch |   13 ++++
>   meta/recipes-devtools/rpm/rpm/rpmatch.patch        |   42 +++++++++++++
>   meta/recipes-devtools/rpm/rpm/uclibc-support.patch |   63 ++++++++++++++++++++
>   meta/recipes-devtools/rpm/rpm_5.4.9.bb             |    7 ++-
>   meta/recipes-extended/libzypp/libzypp/cstdio.patch |   49 +++++++++++++++
>   meta/recipes-extended/libzypp/libzypp_git.bb       |    9 ++-
>   .../sat-solver/sat-solver/futimes.patch            |   32 ++++++++++
>   meta/recipes-extended/sat-solver/sat-solver_git.bb |    3 +
>   meta/recipes-extended/zypper/zypper/rpmatch.patch  |   23 +++++++
>   meta/recipes-extended/zypper/zypper_git.bb         |    2 +
>   meta/site/x86_64-linux-uclibc                      |    3 +
>   12 files changed, 245 insertions(+), 5 deletions(-)
>   create mode 100644 meta/recipes-devtools/rpm/rpm/fstack-protector-configure-check.patch
>   create mode 100644 meta/recipes-devtools/rpm/rpm/rpmatch.patch
>   create mode 100644 meta/recipes-devtools/rpm/rpm/uclibc-support.patch
>   create mode 100644 meta/recipes-extended/libzypp/libzypp/cstdio.patch
>   create mode 100644 meta/recipes-extended/sat-solver/sat-solver/futimes.patch
>   create mode 100644 meta/recipes-extended/zypper/zypper/rpmatch.patch
>

Merged Updated set into OE-Core

Thanks
	Sau!


