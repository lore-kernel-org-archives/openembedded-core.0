Return-Path: <sgw@linux.intel.com>
Received: from mga03.intel.com (unknown [143.182.124.21])
	by mail.openembedded.org (Postfix) with ESMTP id 506C760167
	for <openembedded-core@lists.openembedded.org>;
	Tue, 20 May 2014 17:41:27 +0000 (UTC)
Received: from azsmga001.ch.intel.com ([10.2.17.19])
	by azsmga101.ch.intel.com with ESMTP; 20 May 2014 10:41:28 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.98,875,1392192000"; d="scan'208";a="434624073"
Received: from unknown (HELO [10.255.12.101]) ([10.255.12.101])
	by azsmga001.ch.intel.com with ESMTP; 20 May 2014 10:41:27 -0700
Message-ID: <537B93C7.5080407@linux.intel.com>
Date: Tue, 20 May 2014 10:41:27 -0700
From: Saul Wold <sgw@linux.intel.com>
User-Agent: Mozilla/5.0 (X11; Linux x86_64;
	rv:24.0) Gecko/20100101 Thunderbird/24.4.0
MIME-Version: 1.0
To: openembedded-core@lists.openembedded.org
References: <cover.1400607302.git.sgw@linux.intel.com>
In-Reply-To: <cover.1400607302.git.sgw@linux.intel.com>
Subject: Re: [CONSOLIDATED PULL 00/24] Updated with CVE set
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
X-List-Received-Date: Tue, 20 May 2014 17:41:29 -0000
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit

On 05/20/2014 10:37 AM, Saul Wold wrote:
> Richard,
>
> This contains the set from yesterday, plus additional updates
> and the first load of CVE patches (most will be back ported to
> daisy).
>
> Sau!
>
> The following changes since commit be0327b6a900be5434b6b1f08277faf2f65d5da8:
>
>    initrdscripts: fix for /run/media (2014-05-20 14:53:00 +0100)
>
> are available in the git repository at:
>
>    git://git.openembedded.org/openembedded-core-contrib sgw/stage
>    http://cgit.openembedded.org/cgit.cgi/openembedded-core-contrib/log/?h=sgw/stage
>
> Chen Qi (1):
>    runqemu-internal: add "console=ttyS0" to ramfs image kernel parameters
>
> Chong Lu (2):
>    libpcre: Update to 8.35 version
>    quilt: Update to 0.63 version
>
> Cristian Iorga (1):
>    harfbuzz: upgrade to 0.9.28
>
> João Henrique Ferreira de Freitas (2):
>    wic: add support to look in all layers and get .wks file
>    wic: add support to look in all layers and get plugins
>
> Khem Raj (1):
>    tcmode-default.inc: Default to using gcc 4.9
>
Oops, this one slipped past me, I have removed it from the 
oe-contrib/sgw/stage branch.

We are still testing with it, but waiting for the PPC issue to be 
resolved before enabling it in master.

Sau!


> Koen Kooi (1):
>    curl: work around RRECOMMENDS problems in -native* recipes
>
> Li Wang (2):
>    nss: CVE-2014-1492
>    nss: CVE-2013-1740
>
> Martin Jansa (1):
>    lttng-modules: Fix build with older kernels
>
> Paul Eggleton (2):
>    libav: upgrade 0.8.x version to 0.8.11
>    libav: upgrade 9.x version to 9.13
>
> Saul Wold (1):
>    cups: fix for cups not building without avahi
>
> Yue Tao (10):
>    Screen: fix for Security Advisory CVE-2009-1214
>    screen: fix for Security Advisory CVE-2009-1215
>    subversion: fix for Security Advisory CVE-2013-1849
>    subversion: fix for Security Advisory CVE-2013-4505
>    subversion: fix for Security Advisory CVE-2013-4131
>    subversion: fix for Security Advisory CVE-2013-1845
>    subversion: fix for Security Advisory CVE-2013-1847 and CVE-2013-1846
>    subversion: fix for Security Advisory CVE-2013-4277
>    tiff: fix for Security Advisory CVE-2013-4231
>    openssl: fix for CVE-2010-5298
>
>   meta/conf/distro/include/tcmode-default.inc        |   2 +-
>   .../openssl-1.0.1e/openssl-CVE-2010-5298.patch     |  24 +
>   .../quilt/{quilt-0.61.inc => quilt-0.63.inc}       |   5 +-
>   .../{quilt-native_0.61.bb => quilt-native_0.63.bb} |   0
>   .../quilt/{quilt_0.61.bb => quilt_0.63.bb}         |   0
>   .../subversion-CVE-2013-4131.patch                 |  42 +
>   .../subversion-CVE-2013-4277.patch                 |  15 +
>   .../subversion-CVE-2013-4505.patch                 | 130 +++
>   .../subversion/subversion-CVE-2013-1845.patch      | 171 ++++
>   .../subversion-CVE-2013-1847-CVE-2013-1846.patch   |  53 ++
>   .../subversion/subversion-CVE-2013-1849.patch      |  25 +
>   .../subversion/subversion-CVE-2013-4277.patch      |  15 +
>   .../subversion/subversion-CVE-2013-4505.patch      | 127 +++
>   .../subversion/subversion_1.6.15.bb                |   6 +-
>   .../subversion/subversion_1.7.10.bb                |   3 +
>   meta/recipes-extended/cups/cups/cups-str4402.patch | 190 +++++
>   .../screen-4.0.3/screen-4.0.2-CVE-2009-1215.patch  |  27 +
>   .../screen-4.0.3/screen-4.0.3-CVE-2009-1214.patch  |  86 ++
>   meta/recipes-extended/screen/screen_4.0.3.bb       |   2 +
>   .../{harfbuzz_0.9.27.bb => harfbuzz_0.9.28.bb}     |   8 +-
>   .../lttng/lttng-modules/bio-bvec-iter.patch        | 156 ++++
>   .../lttng/lttng-modules/fixup_block_driver.patch   | 122 ---
>   meta/recipes-kernel/lttng/lttng-modules_2.3.3.bb   |   2 +-
>   .../libav/{libav_0.8.9.bb => libav_0.8.11.bb}      |   4 +-
>   .../libav/{libav_9.10.bb => libav_9.13.bb}         |   4 +-
>   .../libtiff/files/libtiff-CVE-2013-4231.patch      |  44 +
>   meta/recipes-multimedia/libtiff/tiff_4.0.3.bb      |   3 +-
>   meta/recipes-support/curl/curl_7.36.0.bb           |   7 +-
>   .../libpcre/{libpcre_8.34.bb => libpcre_8.35.bb}   |   6 +-
>   .../nss/files/nss-CVE-2013-1740.patch              | 916 +++++++++++++++++++++
>   .../nss/files/nss-CVE-2014-1492.patch              |  68 ++
>   meta/recipes-support/nss/nss.inc                   |   2 +
>   scripts/lib/image/engine.py                        |  72 +-
>   scripts/lib/mic/plugin.py                          |  28 +-
>   scripts/runqemu-internal                           |   2 +-
>   scripts/wic                                        |   6 +
>   36 files changed, 2196 insertions(+), 177 deletions(-)
>   create mode 100644 meta/recipes-connectivity/openssl/openssl-1.0.1e/openssl-CVE-2010-5298.patch
>   rename meta/recipes-devtools/quilt/{quilt-0.61.inc => quilt-0.63.inc} (89%)
>   rename meta/recipes-devtools/quilt/{quilt-native_0.61.bb => quilt-native_0.63.bb} (100%)
>   rename meta/recipes-devtools/quilt/{quilt_0.61.bb => quilt_0.63.bb} (100%)
>   create mode 100644 meta/recipes-devtools/subversion/subversion-1.7.10/subversion-CVE-2013-4131.patch
>   create mode 100644 meta/recipes-devtools/subversion/subversion-1.7.10/subversion-CVE-2013-4277.patch
>   create mode 100644 meta/recipes-devtools/subversion/subversion-1.7.10/subversion-CVE-2013-4505.patch
>   create mode 100644 meta/recipes-devtools/subversion/subversion/subversion-CVE-2013-1845.patch
>   create mode 100644 meta/recipes-devtools/subversion/subversion/subversion-CVE-2013-1847-CVE-2013-1846.patch
>   create mode 100644 meta/recipes-devtools/subversion/subversion/subversion-CVE-2013-1849.patch
>   create mode 100644 meta/recipes-devtools/subversion/subversion/subversion-CVE-2013-4277.patch
>   create mode 100644 meta/recipes-devtools/subversion/subversion/subversion-CVE-2013-4505.patch
>   create mode 100644 meta/recipes-extended/cups/cups/cups-str4402.patch
>   create mode 100644 meta/recipes-extended/screen/screen-4.0.3/screen-4.0.2-CVE-2009-1215.patch
>   create mode 100644 meta/recipes-extended/screen/screen-4.0.3/screen-4.0.3-CVE-2009-1214.patch
>   rename meta/recipes-graphics/harfbuzz/{harfbuzz_0.9.27.bb => harfbuzz_0.9.28.bb} (87%)
>   create mode 100644 meta/recipes-kernel/lttng/lttng-modules/bio-bvec-iter.patch
>   delete mode 100644 meta/recipes-kernel/lttng/lttng-modules/fixup_block_driver.patch
>   rename meta/recipes-multimedia/libav/{libav_0.8.9.bb => libav_0.8.11.bb} (79%)
>   rename meta/recipes-multimedia/libav/{libav_9.10.bb => libav_9.13.bb} (74%)
>   create mode 100644 meta/recipes-multimedia/libtiff/files/libtiff-CVE-2013-4231.patch
>   rename meta/recipes-support/libpcre/{libpcre_8.34.bb => libpcre_8.35.bb} (91%)
>   create mode 100644 meta/recipes-support/nss/files/nss-CVE-2013-1740.patch
>   create mode 100644 meta/recipes-support/nss/files/nss-CVE-2014-1492.patch
>

