Return-Path: <paul@betafive.co.uk>
Received: from out2-smtp.messagingengine.com (out2-smtp.messagingengine.com
	[66.111.4.26])
	by mail.openembedded.org (Postfix) with ESMTP id 7E9747DED0
	for <openembedded-core@lists.openembedded.org>;
	Sat, 11 May 2019 16:00:31 +0000 (UTC)
Received: from compute1.internal (compute1.nyi.internal [10.202.2.41])
	by mailout.nyi.internal (Postfix) with ESMTP id 48BFC2A322;
	Sat, 11 May 2019 12:00:32 -0400 (EDT)
Received: from mailfrontend1 ([10.202.2.162])
	by compute1.internal (MEProxy); Sat, 11 May 2019 12:00:32 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=betafive.co.uk;
	h=subject:to:references:from:message-id:date:mime-version
	:in-reply-to:content-type:content-transfer-encoding; s=fm1; bh=p
	uX5QvbVMPm4nzDuahMZN6+I88LL/b/YYBtSAivrnSE=; b=GeCrZXaiZr54Plxs1
	aEqHZmlUu+Bh6CLjfy5s92jGYsc8jxUSdgbEDjERs+0TvS1jrk7AJQzsZEkMnWT+
	M7rJbWYeua52IAnQtV7JDxXt+aaOx7ZOM3pzFYN4ZJlRWs+c074yOekpvb/YyYEf
	RDCoax5YH2UwyTx37roWGJAc5IkkIbgn4XGaPTOXQxskp7ssfAWpov6iMWhVegOw
	yLjz2zXDw516QTEGXG7cqG2xTp4Wj2C6DBL5Kpr0ZmUg/wP9OE6TbdHJpF1mCeo2
	eeekMf5y9Wd/Vv7yQvbu2syLvSMLdMKnwSPBBtPKr1PaQzgq5I04b+tQNZ7PSC2h
	jVR5w==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	messagingengine.com; h=content-transfer-encoding:content-type
	:date:from:in-reply-to:message-id:mime-version:references
	:subject:to:x-me-proxy:x-me-proxy:x-me-sender:x-me-sender
	:x-sasl-enc; s=fm2; bh=puX5QvbVMPm4nzDuahMZN6+I88LL/b/YYBtSAivrn
	SE=; b=Xbv8z101UFG3o2W9enGZIhontnXNyrrQXXO510lE6DS4UTaja0CdCKQE+
	VPXCfopUxO0JveU4NinRUhILqVaj8GjxkiHiTyE9ZDmstUeZDhK9iM2+UxoZTH3X
	JsBUS+elWWqzuC4Tw8ztzc7RTQ2uUjSt6xI4agyFZCytDD0CkdfJt2qGB9yWccvZ
	wknfZLsgnTUrRunhtpvg9B/goX1NeW9g4kGljC9jb1p0cnOfx3TAGdzlYQFVjk3W
	rxCcrSvPUG9w6WeCc5tbyKxzCmjSGSZ4+yEUD/ejv8S2nw980NBn+1FGL2OZPrKg
	BkC005WqBEXFHgmzh0GQ9bzO5Z8MA==
X-ME-Sender: <xms:n_HWXFS8Bqntw_tPM9U5WllwrlzpLJPI5_Qr0DQtnmPMyoND9IhDcw>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgeduuddrledtgdeljecutefuodetggdotefrodftvf
	curfhrohhfihhlvgemucfhrghsthforghilhdpqfgfvfdpuffrtefokffrpgfnqfghnecu
	uegrihhlohhuthemuceftddtnecusecvtfgvtghiphhivghnthhsucdlqddutddtmdenuc
	fjughrpefuvfhfhfhokffffgggjggtgfesthekredttdefjeenucfhrhhomheprfgruhhl
	uceurghrkhgvrhcuoehprghulhessggvthgrfhhivhgvrdgtohdruhhkqeenucffohhmrg
	hinhepfedvrdhinhgtpdhophgvnhgvmhgsvgguuggvugdrohhrghenucfkphepkedurddu
	keejrdefvddrudefkeenucfrrghrrghmpehmrghilhhfrhhomhepphgruhhlsegsvghtrg
	hfihhvvgdrtghordhukhenucevlhhushhtvghrufhiiigvpedt
X-ME-Proxy: <xmx:n_HWXGAOUn9TDcMH6Q6ni-kn-FG-FHKQNb2xy140j5E2keqEeA3xXA>
	<xmx:n_HWXDbB5V2Gt0w5J-cYdu7HaM8rIeIl3LgxH67nhRMrXSV7W4iK0Q>
	<xmx:n_HWXKZnpTkFmLabuznoITA5V5ByHf-DBTKoLTcPXrgWnBKsCVjDiA>
	<xmx:oPHWXE-frnrwrpoSsy9b_mPLlfkgx2S__jzvOfx4AOM-3pcgFO0UKg>
Received: from [192.168.2.138] (138.32.187.81.in-addr.arpa [81.187.32.138])
	by mail.messagingengine.com (Postfix) with ESMTPA id 3D6AF80062;
	Sat, 11 May 2019 12:00:31 -0400 (EDT)
To: Armin Kuster <akuster808@gmail.com>,
	openembedded-core@lists.openembedded.org
References: <cover.1557584714.git.akuster808@gmail.com>
From: Paul Barker <paul@betafive.co.uk>
Organization: Beta Five Ltd
Message-ID: <54934103-7a6c-ebb0-ba90-8ef87251616f@betafive.co.uk>
Date: Sat, 11 May 2019 17:00:31 +0100
User-Agent: Mozilla/5.0 (Windows NT 10.0; WOW64; rv:60.0) Gecko/20100101
	Thunderbird/60.5.0
MIME-Version: 1.0
In-Reply-To: <cover.1557584714.git.akuster808@gmail.com>
Subject: Re: [PATCH 00/41] Warrior pull request
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
X-List-Received-Date: Sat, 11 May 2019 16:00:31 -0000
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-GB
Content-Transfer-Encoding: 8bit

On 11/05/2019 15:27, Armin Kuster wrote:
> Past due pull request for warrior-next
> 
> The following changes since commit f571b188177788d8ed0a7f3efe3569f153b1b0d3:
> 
>    build-appliance-image: Update to warrior head revision (2019-04-14 21:27:58 +0100)
> 
> are available in the git repository at:
> 
>    git://git.openembedded.org/openembedded-core-contrib stable/warrior-next
>    http://cgit.openembedded.org//log/?h=stable/warrior-next
> 
> Adrian Bunk (3):
>    gnutls: upgrade 3.6.5 -> 3.6.7
>    dhcp: Replace OE specific patch for compatibility with latest bind
>      with upstream patch
>    gnome-doc-utils: Remove stale patch
> 
> Alexander Kanavin (2):
>    python3: add another multilib fix
>    buildhistory: call a dependency parser only on actual dependency lists
> 
> Anuj Mittal (4):
>    gcc: fix CVE-2018-18484
>    gdb: fix CVE-2017-9778
>    binutils: fix CVE-2019-9074 CVE-2019-9075 CVE-2019-9076 CVE-2019-9077
>    openssh: fix CVE-2018-20685, CVE-2019-6109, CVE-2019-6111
> 
> Bruce Ashfield (8):
>    linux-yocto/5.0: update to v5.0.5
>    linux-yocto-rt: update to 5.0.5-rt3
>    linux-yocto/5.0: update to v5.0.7
>    linux-yocto/4.19: update to v4.19.34
>    linux-yocto-rt/4.19: fix merge conflict in lru_drain
>    linux-yocto/5.0: port RAID configuration tweaks from master
>    linux-yocto/5.0: integrate TCP timeout / hang fix
>    linux-yocto/5.0: update TCP patch to mainline version
> 
> Chen Qi (4):
>    busybox: fix ptest failure about 'dc'
>    base-files: move hostname operations out of issue file settings
>    dropbear: set CVE_PRODUCT
>    libsdl: set CVE_PRODUCT
> 
> Dengke Du (1):
>    linux-yocto_5.0: set devicetree for armv5
> 
> He Zhe (1):
>    ltp: Fix setrlimit03 call succeeded unexpectedly
> 
> Jaewon Lee (1):
>    Adding back wrapper and using OEPYTHON3HOME variable for python3
> 
> Jens Rehsack (1):
>    kernel-module-split.bbclass: support CONFIG_MODULE_COMPRESS=y
> 
> Joshua Watt (2):
>    resulttool: Load results from URL
>    resulttool: Add log subcommand
> 
> Kai Kang (1):
>    cryptodev: fix module loading error
> 
> Mardegan, Alberto (1):
>    oeqa/core/runner: dump stdout and stderr of each test case
> 
> Mariano Lopez (1):
>    ptest.bbclass: Use d.getVar instead of os.environ
> 
> Martin Jansa (2):
>    icecc.bbclass: stop causing everything to be effectivelly MACHINE_ARCH
>    glibc: always use bfd linker
> 
> Naveen Saini (2):
>    core-image-rt: make sure that we append to DEPENDS
>    core-image-rt-sdk: make sure that we append to DEPENDS
> 
> Oleksandr Kravchuk (1):
>    curl: update to 7.64.1
> 
> Richard Purdie (4):
>    core-image-sato-sdk-ptest: Try and keep image below 4GB limit
>    resultool/resultutils: Fix module import error
>    utils/multiprocess_launch: Improve failing subprocess output
>    python3: Drop ptest hack
> 
> Steven Hung (洪于玉) (1):
>    kernel.bbclass: convert base_do_unpack_append() to a task
> 
> sangeeta jain (1):
>    resulttool/manualexecution: Enable test case configuration option
> 
>   meta/classes/icecc.bbclass                         |    1 +
>   meta/classes/kernel-module-split.bbclass           |   20 +-
>   meta/classes/kernel.bbclass                        |    3 +-
>   meta/classes/ptest.bbclass                         |    4 +-
>   meta/classes/testimage.bbclass                     |    3 +-
>   meta/lib/oe/buildhistory_analysis.py               |    2 +-
>   meta/lib/oe/utils.py                               |    7 +-
>   meta/lib/oeqa/core/runner.py                       |   20 +-
>   ...eplace-custom-isc_boolean_t-with-C-standa.patch | 2882 --------------------
>   ...d-includes-of-new-BIND9-compatibility-hea.patch |   79 +
>   meta/recipes-connectivity/dhcp/dhcp_4.4.1.bb       |    2 +-
>   ...ve-progressmeter-force-an-update-at-the-b.patch |  121 +
>   .../openssh/openssh/CVE-2018-20685.patch           |   40 +
>   .../openssh/openssh/CVE-2019-6109.patch            |  275 ++
>   .../openssh/openssh/CVE-2019-6111.patch            |  187 ++
>   meta/recipes-connectivity/openssh/openssh_7.9p1.bb |    4 +
>   meta/recipes-core/base-files/base-files_3.0.14.bb  |    7 +-
>   ...ix-two-test-case-to-also-depend-on-DC_BIG.patch |   39 +
>   meta/recipes-core/busybox/busybox_1.30.1.bb        |    1 +
>   meta/recipes-core/dropbear/dropbear.inc            |    2 +
>   meta/recipes-core/glibc/glibc_2.29.bb              |    2 +-
>   meta/recipes-devtools/binutils/binutils-2.32.inc   |    4 +
>   .../binutils/binutils/CVE-2019-9074.patch          |   68 +
>   .../binutils/binutils/CVE-2019-9075.patch          |  119 +
>   .../binutils/binutils/CVE-2019-9076.patch          |   49 +
>   .../binutils/binutils/CVE-2019-9077.patch          |   37 +
>   meta/recipes-devtools/gcc/gcc-8.3.inc              |    1 +
>   ...sion-limit-to-libiberty-s-demangling-code.patch |  325 +++
>   meta/recipes-devtools/gdb/gdb-8.2.1.inc            |    1 +
>   meta/recipes-devtools/gdb/gdb/CVE-2017-9778.patch  |   99 +
>   ...ig.py-fix-another-place-where-lib-is-hard.patch |   31 +
>   ...EPYTHON3HOME-is-set-use-instead-of-PYTHON.patch |   47 +
>   .../python/python3/ptesthack.patch                 |   60 -
>   meta/recipes-devtools/python/python3_3.7.2.bb      |    9 +-
>   ...trlimit03.c-read-proc-sys-fs-nr_open-for-.patch |   70 +
>   meta/recipes-extended/ltp/ltp_20190115.bb          |    1 +
>   ...t.m4-Update-AM_GLIB_GNU_GETTEXT-to-match-.patch |   40 -
>   meta/recipes-graphics/libsdl/libsdl_1.2.15.bb      |    2 +
>   meta/recipes-graphics/libsdl2/libsdl2_2.0.9.bb     |    2 +
>   meta/recipes-kernel/cryptodev/cryptodev.inc        |    4 +-
>   ...01-Fix-module-loading-with-Linux-v5.0-rc5.patch |   59 +
>   meta/recipes-kernel/linux/linux-yocto-rt_4.19.bb   |    6 +-
>   meta/recipes-kernel/linux/linux-yocto-rt_5.0.bb    |    6 +-
>   meta/recipes-kernel/linux/linux-yocto-tiny_4.19.bb |    8 +-
>   meta/recipes-kernel/linux/linux-yocto-tiny_5.0.bb  |    8 +-
>   meta/recipes-kernel/linux/linux-yocto_4.19.bb      |   20 +-
>   meta/recipes-kernel/linux/linux-yocto_5.0.bb       |   21 +-
>   meta/recipes-rt/images/core-image-rt-sdk.bb        |    2 +-
>   meta/recipes-rt/images/core-image-rt.bb            |    2 +-
>   .../images/core-image-sato-sdk-ptest.bb            |    4 +-
>   .../curl/{curl_7.64.0.bb => curl_7.64.1.bb}        |    4 +-
>   .../gnutls/{gnutls_3.6.5.bb => gnutls_3.6.7.bb}    |    7 +-
>   scripts/lib/resulttool/log.py                      |   56 +
>   scripts/lib/resulttool/manualexecution.py          |   14 +-
>   scripts/lib/resulttool/merge.py                    |    8 +-
>   scripts/lib/resulttool/regression.py               |    6 +-
>   scripts/lib/resulttool/report.py                   |    2 +-
>   scripts/lib/resulttool/resultutils.py              |   23 +-
>   scripts/lib/resulttool/store.py                    |    4 +-
>   scripts/resulttool                                 |    2 +
>   60 files changed, 1871 insertions(+), 3061 deletions(-)
>   delete mode 100644 meta/recipes-connectivity/dhcp/dhcp/0001-dhcpd-fix-Replace-custom-isc_boolean_t-with-C-standa.patch
>   create mode 100644 meta/recipes-connectivity/dhcp/dhcp/0001-master-Added-includes-of-new-BIND9-compatibility-hea.patch
>   create mode 100644 meta/recipes-connectivity/openssh/openssh/0001-upstream-Have-progressmeter-force-an-update-at-the-b.patch
>   create mode 100644 meta/recipes-connectivity/openssh/openssh/CVE-2018-20685.patch
>   create mode 100644 meta/recipes-connectivity/openssh/openssh/CVE-2019-6109.patch
>   create mode 100644 meta/recipes-connectivity/openssh/openssh/CVE-2019-6111.patch
>   create mode 100644 meta/recipes-core/busybox/busybox/0001-dc.tests-fix-two-test-case-to-also-depend-on-DC_BIG.patch
>   create mode 100644 meta/recipes-devtools/binutils/binutils/CVE-2019-9074.patch
>   create mode 100644 meta/recipes-devtools/binutils/binutils/CVE-2019-9075.patch
>   create mode 100644 meta/recipes-devtools/binutils/binutils/CVE-2019-9076.patch
>   create mode 100644 meta/recipes-devtools/binutils/binutils/CVE-2019-9077.patch
>   create mode 100644 meta/recipes-devtools/gcc/gcc-8.3/0041-Add-a-recursion-limit-to-libiberty-s-demangling-code.patch
>   create mode 100644 meta/recipes-devtools/gdb/gdb/CVE-2017-9778.patch
>   create mode 100644 meta/recipes-devtools/python/python3/0001-Lib-sysconfig.py-fix-another-place-where-lib-is-hard.patch
>   create mode 100644 meta/recipes-devtools/python/python3/0001-main.c-if-OEPYTHON3HOME-is-set-use-instead-of-PYTHON.patch
>   delete mode 100644 meta/recipes-devtools/python/python3/ptesthack.patch
>   create mode 100644 meta/recipes-extended/ltp/ltp/0001-syscalls-setrlimit03.c-read-proc-sys-fs-nr_open-for-.patch
>   delete mode 100644 meta/recipes-gnome/gnome/gnome-doc-utils/0001-glib-gettext.m4-Update-AM_GLIB_GNU_GETTEXT-to-match-.patch
>   create mode 100644 meta/recipes-kernel/cryptodev/files/0001-Fix-module-loading-with-Linux-v5.0-rc5.patch
>   rename meta/recipes-support/curl/{curl_7.64.0.bb => curl_7.64.1.bb} (95%)
>   rename meta/recipes-support/gnutls/{gnutls_3.6.5.bb => gnutls_3.6.7.bb} (88%)
>   create mode 100644 scripts/lib/resulttool/log.py
> 

Could we also include 
https://git.openembedded.org/openembedded-core/commit/?id=f178990495c773b4b36b1be6aafc2da158b76894 
please?

Thanks,

-- 
Paul Barker
Managing Director & Principal Engineer
Beta Five Ltd

