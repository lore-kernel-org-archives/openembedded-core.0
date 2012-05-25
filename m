Received: from mga09.intel.com ([134.134.136.24])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <sgw@linux.intel.com>) id 1SXxgj-0004e4-9R
	for openembedded-core@lists.openembedded.org;
	Fri, 25 May 2012 18:48:29 +0200
Received: from orsmga002.jf.intel.com ([10.7.209.21])
	by orsmga102.jf.intel.com with ESMTP; 25 May 2012 09:38:15 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.67,351,1309762800"; d="scan'208";a="148462440"
Received: from unknown (HELO [10.255.12.24]) ([10.255.12.24])
	by orsmga002.jf.intel.com with ESMTP; 25 May 2012 09:38:15 -0700
Message-ID: <4FBFB577.2080208@linux.intel.com>
Date: Fri, 25 May 2012 09:38:15 -0700
From: Saul Wold <sgw@linux.intel.com>
User-Agent: Mozilla/5.0 (X11; Linux x86_64;
	rv:12.0) Gecko/20120430 Thunderbird/12.0.1
MIME-Version: 1.0
To: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
References: <cover.1337731367.git.nitin.a.kamble@intel.com>
In-Reply-To: <cover.1337731367.git.nitin.a.kamble@intel.com>
Subject: Re: [PATCH 00/30] automake 1.12 related fixes
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
X-List-Received-Date: Fri, 25 May 2012 16:48:30 -0000
Content-Type: text/plain; charset=ISO-8859-1; format=flowed
Content-Transfer-Encoding: 7bit

On 05/22/2012 05:03 PM, nitin.a.kamble@intel.com wrote:
> From: Nitin A Kamble<nitin.a.kamble@intel.com>
>
> The following changes since commit 39a9267dee0a0ee4d87ed51d4a0272549c462b02:
>
>    Hob: add '--select a machine--' and '--select a base image--' to GUI (2012-05-22 14:56:17 +0100)
>
> are available in the git repository at:
>    git://git.pokylinux.org/poky-contrib nitin/automake-1.12-related-fixes
>    http://git.pokylinux.org/cgit.cgi/poky-contrib/log/?h=nitin/automake-1.12-related-fixes
>
> Nitin A Kamble (30):
>    gmp: fix build with automake 1.12
>    mpfr: fix build with automake 1.12
>    popt: fix build with automake 1.12
>    rpm: fix build with automake 1.12
>    libxml2: fix build with automake 1.12
>    shadow shadow-native: fix build with automake 1.12
>    jpeg: fix build with automake 1.12
Patch failure

>    libtasn1: fix build with automake 1.12
>    systemtap: fix build with automake 1.12
>    libmpc: fix build with automake 1.12
>    libcheck: fix build with automake 1.12
>    texinfo: fix build with automake 1.12
>    libidn: fix build with automake 1.12
>    glew: fix build with automake 1.12
>    findutils: fix build with automake 1.12
>    gawk: fix build with automake 1.12
Issue with patch

>    lrzsz: fix build with automake 1.12
>    minicom: fix build with automake 1.12
>    lighttpd: fix build with automake 1.12
>    gnutls: fix build with automake 1.12
Patch did not apply correctly

>    libfm: fix build with automake 1.12
>    libcroco: fix build with automake 1.12
>    gmp-4.2.1: fix build with automake 1.12
>    coreutils-native-6.9: fix build with automake 1.12
>    grub-0.97: fix build with automake 1.12
>    diffutils-2.8.1: fix build with automake 1.12
>    grep-2.5.1a: fix build with automake 1.12
>    gawk-3.1.5: fix build with automake 1.12
>    findutils-4.2.31: fix build with automake 1.12
>    make-3.81: fix build with automake 1.12
>

Merged this set a part for the ones noted above

Sau!

>   .../grub-0.97/grub_fix_for_automake-1.12.patch     |   48 ++++++++++++++++++
>   meta/recipes-bsp/grub/grub_0.97.bb                 |    6 ++-
>   .../lrzsz_fix_for_automake-1.12.patch              |   49 ++++++++++++++++++
>   meta/recipes-bsp/lrzsz/lrzsz_0.12.20.bb            |    6 ++-
>   .../coreutils_fix_for_automake-1.12.patch          |   32 ++++++++++++
>   meta/recipes-core/coreutils/coreutils_6.9.bb       |    6 ++-
>   .../jpeg/jpeg-8c/jpeg_fix_for_automake-1.12.patch  |   41 +++++++++++++++
>   meta/recipes-core/jpeg/jpeg_8c.bb                  |    6 ++-
>   .../libxml2/libxml2_fix_for_automake_1.12.patch    |   23 +++++++++
>   meta/recipes-core/libxml/libxml2_2.7.8.bb          |    5 +-
>   .../make-3.81/make_fix_for_automake-1.12.patch     |   43 ++++++++++++++++
>   meta/recipes-devtools/make/make_3.81.bb            |    4 +-
>   .../rpm/rpm/rpm_fix_for_automake-1.12.patch        |   21 ++++++++
>   meta/recipes-devtools/rpm/rpm_5.4.0.bb             |    3 +-
>   .../diffutils_fix_for_automake-1.12.patch          |   27 ++++++++++
>   meta/recipes-extended/diffutils/diffutils_2.8.1.bb |    6 ++-
>   .../findutils_fix_for_automake-1.12.patch          |   23 +++++++++
>   .../findutils_fix_for_automake-1.12.patch          |   22 ++++++++
>   .../recipes-extended/findutils/findutils_4.2.31.bb |    6 ++-
>   meta/recipes-extended/findutils/findutils_4.4.2.bb |    6 ++-
>   .../gawk-3.1.5/gawk_fix_for_automake-1.12.patch    |   41 +++++++++++++++
>   .../gawk/gawk/gawk_fix_for_automake-1.12.patch     |   23 +++++++++
>   meta/recipes-extended/gawk/gawk_3.1.5.bb           |    2 +
>   meta/recipes-extended/gawk/gawk_4.0.0.bb           |    5 +-
>   .../grep-2.5.1a/grep_fix_for_automake-1.12.patch   |   52 +++++++++++++++++++
>   meta/recipes-extended/grep/grep_2.5.1a.bb          |    7 ++-
>   .../libidn/libidn_fix_for_automake-1.12.patch      |   26 ++++++++++
>   meta/recipes-extended/libidn/libidn_1.24.bb        |    5 +-
>   .../files/lighttpd_fix_for_automake-1.12.patch     |   37 ++++++++++++++
>   meta/recipes-extended/lighttpd/lighttpd_1.4.30.bb  |    5 +-
>   .../minicom_fix_for_automake-1.12.patch            |   21 ++++++++
>   meta/recipes-extended/minicom/minicom_2.6.1.bb     |    3 +
>   .../files/shadow_fix_for_automake-1.12.patch       |   23 +++++++++
>   .../shadow/shadow-native_4.1.4.3.bb                |    6 ++-
>   meta/recipes-extended/shadow/shadow_4.1.4.3.bb     |    6 ++-
>   .../texinfo_fix_for_automake-1.12.patch            |   24 +++++++++
>   meta/recipes-extended/texinfo/texinfo_4.13a.bb     |    3 +-
>   .../glew/files/glew_fix_for_automake-1.12.patch    |   25 +++++++++
>   meta/recipes-graphics/glew/glew_1.7.0.bb           |    3 +-
>   .../systemtap_fix_for_automake_1.12.patch          |   23 +++++++++
>   meta/recipes-kernel/systemtap/systemtap_git.bb     |    2 +-
>   meta/recipes-kernel/systemtap/systemtap_git.inc    |    1 +
>   .../gmp/gmp-4.2.1/gmp_fix_for_automake-1.12.patch  |   48 ++++++++++++++++++
>   .../gmp/gmp/gmp_fix_for_automake-1.12.patch        |   48 ++++++++++++++++++
>   meta/recipes-support/gmp/gmp_4.2.1.bb              |    6 ++-
>   meta/recipes-support/gmp/gmp_5.0.4.bb              |    6 ++-
>   .../gnutls_fix_for_automake-1.12.patch             |   53 ++++++++++++++++++++
>   meta/recipes-support/gnutls/gnutls_2.12.19.bb      |    3 +-
>   .../libtasn1/libtasn1_fix_for_automake_1.12.patch  |   28 ++++++++++
>   meta/recipes-support/gnutls/libtasn1_2.12.bb       |    6 ++-
>   .../libcheck/libcheck_fix_for_automake-1.12.patch  |   26 ++++++++++
>   meta/recipes-support/libcheck/libcheck_0.9.8.bb    |    6 ++-
>   .../files/libcroco_fix_for_automake-1.12.patch     |   22 ++++++++
>   meta/recipes-support/libcroco/libcroco_0.6.3.bb    |    5 +-
>   .../libfm-0.1.17/libfm_fix_for_automake-1.12.patch |   48 ++++++++++++++++++
>   meta/recipes-support/libfm/libfm_0.1.17.bb         |    6 ++-
>   .../libmpc/libmpc_fix_for_automake-1.12.patch      |   26 ++++++++++
>   meta/recipes-support/libmpc/libmpc_0.8.2.bb        |    5 +-
>   .../mpfr-3.1.0/mpfr_fix_for_automake-1.12.patch    |   35 +++++++++++++
>   meta/recipes-support/mpfr/mpfr_3.1.0.bb            |    7 ++-
>   .../popt/popt/popt_fix_for_automake-1.12.patch     |   21 ++++++++
>   meta/recipes-support/popt/popt_1.16.bb             |    3 +-
>   62 files changed, 1082 insertions(+), 52 deletions(-)
>   create mode 100644 meta/recipes-bsp/grub/grub-0.97/grub_fix_for_automake-1.12.patch
>   create mode 100644 meta/recipes-bsp/lrzsz/lrzsz-0.12.20/lrzsz_fix_for_automake-1.12.patch
>   create mode 100644 meta/recipes-core/coreutils/coreutils-6.9/coreutils_fix_for_automake-1.12.patch
>   create mode 100644 meta/recipes-core/jpeg/jpeg-8c/jpeg_fix_for_automake-1.12.patch
>   create mode 100644 meta/recipes-core/libxml/libxml2/libxml2_fix_for_automake_1.12.patch
>   create mode 100644 meta/recipes-devtools/make/make-3.81/make_fix_for_automake-1.12.patch
>   create mode 100644 meta/recipes-devtools/rpm/rpm/rpm_fix_for_automake-1.12.patch
>   create mode 100644 meta/recipes-extended/diffutils/diffutils-2.8.1/diffutils_fix_for_automake-1.12.patch
>   create mode 100644 meta/recipes-extended/findutils/findutils-4.2.31/findutils_fix_for_automake-1.12.patch
>   create mode 100644 meta/recipes-extended/findutils/findutils-4.4.2/findutils_fix_for_automake-1.12.patch
>   create mode 100644 meta/recipes-extended/gawk/gawk-3.1.5/gawk_fix_for_automake-1.12.patch
>   create mode 100644 meta/recipes-extended/gawk/gawk/gawk_fix_for_automake-1.12.patch
>   create mode 100644 meta/recipes-extended/grep/grep-2.5.1a/grep_fix_for_automake-1.12.patch
>   create mode 100644 meta/recipes-extended/libidn/libidn/libidn_fix_for_automake-1.12.patch
>   create mode 100644 meta/recipes-extended/lighttpd/files/lighttpd_fix_for_automake-1.12.patch
>   create mode 100644 meta/recipes-extended/minicom/minicom-2.6.1/minicom_fix_for_automake-1.12.patch
>   create mode 100644 meta/recipes-extended/shadow/files/shadow_fix_for_automake-1.12.patch
>   create mode 100644 meta/recipes-extended/texinfo/texinfo-4.13a/texinfo_fix_for_automake-1.12.patch
>   create mode 100644 meta/recipes-graphics/glew/files/glew_fix_for_automake-1.12.patch
>   create mode 100644 meta/recipes-kernel/systemtap/systemtap/systemtap_fix_for_automake_1.12.patch
>   create mode 100644 meta/recipes-support/gmp/gmp-4.2.1/gmp_fix_for_automake-1.12.patch
>   create mode 100644 meta/recipes-support/gmp/gmp/gmp_fix_for_automake-1.12.patch
>   create mode 100644 meta/recipes-support/gnutls/gnutls-2.12.18/gnutls_fix_for_automake-1.12.patch
>   create mode 100644 meta/recipes-support/gnutls/libtasn1/libtasn1_fix_for_automake_1.12.patch
>   create mode 100644 meta/recipes-support/libcheck/libcheck/libcheck_fix_for_automake-1.12.patch
>   create mode 100644 meta/recipes-support/libcroco/files/libcroco_fix_for_automake-1.12.patch
>   create mode 100644 meta/recipes-support/libfm/libfm-0.1.17/libfm_fix_for_automake-1.12.patch
>   create mode 100644 meta/recipes-support/libmpc/libmpc/libmpc_fix_for_automake-1.12.patch
>   create mode 100644 meta/recipes-support/mpfr/mpfr-3.1.0/mpfr_fix_for_automake-1.12.patch
>   create mode 100644 meta/recipes-support/popt/popt/popt_fix_for_automake-1.12.patch
>


