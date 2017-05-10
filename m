Return-Path: <akuster808@gmail.com>
Received: from mail-pf0-f193.google.com (mail-pf0-f193.google.com
	[209.85.192.193])
	by mail.openembedded.org (Postfix) with ESMTP id 0CC6A71A84
	for <openembedded-core@lists.openembedded.org>;
	Wed, 10 May 2017 15:39:58 +0000 (UTC)
Received: by mail-pf0-f193.google.com with SMTP id v14so4162232pfd.3
	for <openembedded-core@lists.openembedded.org>;
	Wed, 10 May 2017 08:40:00 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=subject:to:references:from:message-id:date:user-agent:mime-version
	:in-reply-to:content-transfer-encoding;
	bh=7fxFBiH9K23HKrGylEZu1mN4DBU/zxK3rAS4oumuocU=;
	b=lVlm0DzQS4Jtwcqk8ica3/ePVvyUl0Li4kLMrBOWsr/7RazGedA/AKaTYscrN2HVdb
	v9nD0gIJtgiDdgkHEyK4ZP86exP3Sh8Ka7FD1X3gvsIRchubdSRTTrdcYqI5L73cTNCF
	2FF7j+rSRRLB1V4JJiWECvKSfJVJxj6iw03EnuRUkLPQwRqkgfEDi6jIj8kEcDQ8xMwd
	4jpOPvAoJvnOj5HgB+OqCt4rapwSksL6Hp+xfYw4PBxP5/XMc3+rllNKWVqntvKpoFYH
	2VuC8/wg4lRXqu97y2r0aqRZCotVz3EuJCO33rWFPCAaknEymEhPbITQvuCKqTFYXnsk
	KVxw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:subject:to:references:from:message-id:date
	:user-agent:mime-version:in-reply-to:content-transfer-encoding;
	bh=7fxFBiH9K23HKrGylEZu1mN4DBU/zxK3rAS4oumuocU=;
	b=O4wZ7bwyMWNSo1CpaQGOESXortyDS4Gh8zMUEEFI042hw4ptW+fDL4ddH9RYXJTNyV
	hrTahK5mmvrfc7S34u7Mv6Na6ds0jKp3djJ/mYcGxORP8C7QRnmSKNivzD/G1qOqYbB/
	T5TDve3Z0BaS2fkN57vvFmJ+Cy2T7Bezm8lJjrawSz2pncNvWZxGDLDi7asHlbBk35aA
	mErjazEhIhn3APMP1EE351u7Y1Ne+T2Asqfmemmm8YmuReoNfefAn/M/aX4FwYxbuNUP
	9NP1XZl5Q2faU9IuiwwYrTgcp7NAto8q6C2DirTml9hs6RnjjIzcambG9hT+02Ftx1oY
	HCCQ==
X-Gm-Message-State: AODbwcCn3nWnZiv9pwRnPjAPu8wyWJcO2BZoPr2E+HkjOaPGDcrJv+S1
	VGk02XGQ4V68Rw==
X-Received: by 10.84.204.8 with SMTP id a8mr9127252ple.4.1494430800041;
	Wed, 10 May 2017 08:40:00 -0700 (PDT)
Received: from ?IPv6:2601:202:4001:9ea0:e3df:bf0a:9f90:498e?
	([2601:202:4001:9ea0:e3df:bf0a:9f90:498e])
	by smtp.gmail.com with ESMTPSA id k8sm5638942pgp.59.2017.05.10.08.39.58
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Wed, 10 May 2017 08:39:59 -0700 (PDT)
To: Alexander Kanavin <alexander.kanavin@linux.intel.com>,
	openembedded-core@lists.openembedded.org
References: <cover.1494425038.git.alexander.kanavin@linux.intel.com>
From: akuster808 <akuster808@gmail.com>
Message-ID: <7162282b-8323-0df7-79a7-8ea2e9cf2e01@gmail.com>
Date: Wed, 10 May 2017 08:39:57 -0700
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:45.0) Gecko/20100101
	Thunderbird/45.8.0
MIME-Version: 1.0
In-Reply-To: <cover.1494425038.git.alexander.kanavin@linux.intel.com>
Subject: Re: [RFC PATCH 00/10] Add openssl 1.1
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
X-List-Received-Date: Wed, 10 May 2017 15:39:59 -0000
Content-Type: text/plain; charset=windows-1252; format=flowed
Content-Transfer-Encoding: 7bit



On 05/10/2017 07:13 AM, Alexander Kanavin wrote:
> This patch series introduces the recipe for openssl 1.1 (openssl 1.0 is preserved
> but renamed to openssl10), and does a few necessary adjustmenets and updates to other
> recipes. The reason it's marked RFC is that there is one known remaining issue to
> resolve: specifically, u-boot needs to be ported to 1.1 before this series can be
> merged, otherwise there's a dependency conflict when building native u-boot. This
> should be resolved quite soon, but it isn't yet (as of u-boot v2017.05).
>
> Openssl 1.1 is an opt-out; it has the same recipe name as openssl 1.0 had, and so
> all dependencies are compiled with it by default. If there's an API issue, please
> fix it, or adjust the recipe to depend on 'openssl10' (which is a lesser solution,
> and subject to openssl 1.0 eventually being removed from oe-core).
>
> Please review the following changes for suitability for inclusion. If you have
> any objections or suggestions for improvement, please respond to the patches. If
> you agree with the changes, please provide your Acked-by
Acked-by: Armin Kuster <akuster@mvista.com>
> .
>
> The following changes since commit 381897c64069ea43d595380a3ae913bcc79cf7e1:
>
>    build-appliance-image: Update to master head revision (2017-05-01 08:56:47 +0100)
>
> are available in the git repository at:
>
>    git://git.yoctoproject.org/poky-contrib akanavin/openssl-1.1
>    http://git.yoctoproject.org/cgit.cgi/poky-contrib/log/?h=akanavin/openssl-1.1
>
> Alexander Kanavin (10):
>    python: update to 3.5.3
>    openssl: add a 1.1 version
>    u-boot-mkimage: depend on openssl 1.0
>    bind: fix upstream version check
>    bind: update to 9.10.5
>    openssh: depend on openssl 1.0
>    apr-util: add support for openssl 1.1 via backported patch
>    cryptodev-tests: depend on openssl 1.0
>    mailx: depend on openssl 1.0
>    gstreamer-plugins-bad: replace openssl dependency with nettle for hls
>      plugin
>
>   meta/conf/distro/include/no-static-libs.inc        |   3 +
>   meta/conf/distro/include/security_flags.inc        |   2 +-
>   meta/recipes-bsp/u-boot/u-boot-mkimage_2017.01.bb  |   2 +-
>   ...0001-build-use-pkg-config-to-find-libxml2.patch |  14 +-
>   ...=> 0001-confgen-don-t-build-unix.o-twice.patch} |  17 +-
>   .../bind/bind/CVE-2016-1285.patch                  | 154 ----------
>   .../bind/bind/CVE-2016-1286_1.patch                |  79 -----
>   .../bind/bind/CVE-2016-1286_2.patch                | 317 ---------------------
>   .../bind/bind/CVE-2016-2088.patch                  | 247 ----------------
>   .../bind/bind/CVE-2016-2775.patch                  |  90 ------
>   .../bind/bind/CVE-2016-2776.patch                  | 123 --------
>   .../bind/bind/mips1-not-support-opcode.diff        | 104 -------
>   .../bind/{bind_9.10.3-P3.bb => bind_9.10.5.bb}     |  27 +-
>   meta/recipes-connectivity/openssh/openssh_7.4p1.bb |   3 +-
>   ...ve-test-that-requires-running-as-non-root.patch |  49 ++++
>   ...1-Take-linking-flags-from-LDFLAGS-env-var.patch |  43 +++
>   .../recipes-connectivity/openssl/openssl/run-ptest |   4 +-
>   .../openssl/{openssl.inc => openssl10.inc}         |  14 +-
>   ...build-with-clang-using-external-assembler.patch |   0
>   .../{openssl => openssl10}/Makefiles-ptest.patch   |   0
>   .../Use-SHA256-not-MD5-as-default-digest.patch     |   0
>   .../configure-musl-target.patch                    |   0
>   .../{openssl => openssl10}/configure-targets.patch |   0
>   .../debian/c_rehash-compat.patch                   |   0
>   .../openssl/{openssl => openssl10}/debian/ca.patch |   0
>   .../debian/debian-targets.patch                    |   0
>   .../{openssl => openssl10}/debian/man-dir.patch    |   0
>   .../debian/man-section.patch                       |   0
>   .../{openssl => openssl10}/debian/no-rpath.patch   |   0
>   .../debian/no-symbolic.patch                       |   0
>   .../{openssl => openssl10}/debian/pic.patch        |   0
>   .../debian/version-script.patch                    |   0
>   .../debian1.0.2/block_digicert_malaysia.patch      |   0
>   .../debian1.0.2/block_diginotar.patch              |   0
>   .../debian1.0.2/version-script.patch               |   0
>   .../engines-install-in-libdir-ssl.patch            |   0
>   .../openssl/{openssl => openssl10}/find.pl         |   0
>   .../fix-cipher-des-ede3-cfb1.patch                 |   0
>   .../{openssl => openssl10}/oe-ldflags.patch        |   0
>   .../openssl-1.0.2a-x32-asm.patch                   |   0
>   ...-pointer-dereference-in-EVP_DigestInit_ex.patch |   0
>   .../{openssl => openssl10}/openssl-c_rehash.sh     |   0
>   .../openssl-fix-des.pod-error.patch                |   0
>   .../openssl-util-perlpath.pl-cwd.patch             |   0
>   .../openssl_fix_for_x32.patch                      |   0
>   .../openssl/{openssl => openssl10}/parallel.patch  |   0
>   .../{openssl => openssl10}/ptest-deps.patch        |   0
>   .../ptest_makefile_deps.patch                      |   0
>   .../openssl/openssl10/run-ptest                    |   2 +
>   .../{openssl => openssl10}/shared-libs.patch       |   0
>   .../{openssl_1.0.2k.bb => openssl10_1.0.2k.bb}     |   4 +-
>   .../recipes-connectivity/openssl/openssl_1.1.0e.bb | 146 ++++++++++
>   ...on3-native_3.5.2.bb => python3-native_3.5.3.bb} |   8 +-
>   ...the-shell-version-of-python-config-that-w.patch |  10 +-
>   ...pile.patch => 0001-cross-compile-support.patch} |  56 ++--
>   .../python3/python3-fix-CVE-2016-1000110.patch     | 148 ----------
>   .../python/python3/upstream-random-fixes.patch     | 288 +++++++++----------
>   .../python/{python3_3.5.2.bb => python3_3.5.3.bb}  |   9 +-
>   meta/recipes-extended/mailx/mailx_12.5-5.bb        |   2 +-
>   .../cryptodev/cryptodev-tests_1.8.bb               |   2 +-
>   .../gstreamer/gstreamer1.0-plugins-bad.inc         |   4 +-
>   .../recipes-support/apr/apr-util/openssl-1.1.patch | 253 ++++++++++++++++
>   meta/recipes-support/apr/apr-util_1.5.4.bb         |   1 +
>   63 files changed, 732 insertions(+), 1493 deletions(-)
>   rename meta/recipes-connectivity/bind/bind/{bind-confgen-build-unix.o-once.patch => 0001-confgen-don-t-build-unix.o-twice.patch} (80%)
>   delete mode 100644 meta/recipes-connectivity/bind/bind/CVE-2016-1285.patch
>   delete mode 100644 meta/recipes-connectivity/bind/bind/CVE-2016-1286_1.patch
>   delete mode 100644 meta/recipes-connectivity/bind/bind/CVE-2016-1286_2.patch
>   delete mode 100644 meta/recipes-connectivity/bind/bind/CVE-2016-2088.patch
>   delete mode 100644 meta/recipes-connectivity/bind/bind/CVE-2016-2775.patch
>   delete mode 100644 meta/recipes-connectivity/bind/bind/CVE-2016-2776.patch
>   delete mode 100644 meta/recipes-connectivity/bind/bind/mips1-not-support-opcode.diff
>   rename meta/recipes-connectivity/bind/{bind_9.10.3-P3.bb => bind_9.10.5.bb} (82%)
>   create mode 100644 meta/recipes-connectivity/openssl/openssl/0001-Remove-test-that-requires-running-as-non-root.patch
>   create mode 100644 meta/recipes-connectivity/openssl/openssl/0001-Take-linking-flags-from-LDFLAGS-env-var.patch
>   mode change 100755 => 100644 meta/recipes-connectivity/openssl/openssl/run-ptest
>   rename meta/recipes-connectivity/openssl/{openssl.inc => openssl10.inc} (95%)
>   rename meta/recipes-connectivity/openssl/{openssl => openssl10}/0001-Fix-build-with-clang-using-external-assembler.patch (100%)
>   rename meta/recipes-connectivity/openssl/{openssl => openssl10}/Makefiles-ptest.patch (100%)
>   rename meta/recipes-connectivity/openssl/{openssl => openssl10}/Use-SHA256-not-MD5-as-default-digest.patch (100%)
>   rename meta/recipes-connectivity/openssl/{openssl => openssl10}/configure-musl-target.patch (100%)
>   rename meta/recipes-connectivity/openssl/{openssl => openssl10}/configure-targets.patch (100%)
>   rename meta/recipes-connectivity/openssl/{openssl => openssl10}/debian/c_rehash-compat.patch (100%)
>   rename meta/recipes-connectivity/openssl/{openssl => openssl10}/debian/ca.patch (100%)
>   rename meta/recipes-connectivity/openssl/{openssl => openssl10}/debian/debian-targets.patch (100%)
>   rename meta/recipes-connectivity/openssl/{openssl => openssl10}/debian/man-dir.patch (100%)
>   rename meta/recipes-connectivity/openssl/{openssl => openssl10}/debian/man-section.patch (100%)
>   rename meta/recipes-connectivity/openssl/{openssl => openssl10}/debian/no-rpath.patch (100%)
>   rename meta/recipes-connectivity/openssl/{openssl => openssl10}/debian/no-symbolic.patch (100%)
>   rename meta/recipes-connectivity/openssl/{openssl => openssl10}/debian/pic.patch (100%)
>   rename meta/recipes-connectivity/openssl/{openssl => openssl10}/debian/version-script.patch (100%)
>   rename meta/recipes-connectivity/openssl/{openssl => openssl10}/debian1.0.2/block_digicert_malaysia.patch (100%)
>   rename meta/recipes-connectivity/openssl/{openssl => openssl10}/debian1.0.2/block_diginotar.patch (100%)
>   rename meta/recipes-connectivity/openssl/{openssl => openssl10}/debian1.0.2/version-script.patch (100%)
>   rename meta/recipes-connectivity/openssl/{openssl => openssl10}/engines-install-in-libdir-ssl.patch (100%)
>   rename meta/recipes-connectivity/openssl/{openssl => openssl10}/find.pl (100%)
>   rename meta/recipes-connectivity/openssl/{openssl => openssl10}/fix-cipher-des-ede3-cfb1.patch (100%)
>   rename meta/recipes-connectivity/openssl/{openssl => openssl10}/oe-ldflags.patch (100%)
>   rename meta/recipes-connectivity/openssl/{openssl => openssl10}/openssl-1.0.2a-x32-asm.patch (100%)
>   rename meta/recipes-connectivity/openssl/{openssl => openssl10}/openssl-avoid-NULL-pointer-dereference-in-EVP_DigestInit_ex.patch (100%)
>   rename meta/recipes-connectivity/openssl/{openssl => openssl10}/openssl-c_rehash.sh (100%)
>   rename meta/recipes-connectivity/openssl/{openssl => openssl10}/openssl-fix-des.pod-error.patch (100%)
>   rename meta/recipes-connectivity/openssl/{openssl => openssl10}/openssl-util-perlpath.pl-cwd.patch (100%)
>   rename meta/recipes-connectivity/openssl/{openssl => openssl10}/openssl_fix_for_x32.patch (100%)
>   rename meta/recipes-connectivity/openssl/{openssl => openssl10}/parallel.patch (100%)
>   rename meta/recipes-connectivity/openssl/{openssl => openssl10}/ptest-deps.patch (100%)
>   rename meta/recipes-connectivity/openssl/{openssl => openssl10}/ptest_makefile_deps.patch (100%)
>   create mode 100755 meta/recipes-connectivity/openssl/openssl10/run-ptest
>   rename meta/recipes-connectivity/openssl/{openssl => openssl10}/shared-libs.patch (100%)
>   rename meta/recipes-connectivity/openssl/{openssl_1.0.2k.bb => openssl10_1.0.2k.bb} (97%)
>   create mode 100644 meta/recipes-connectivity/openssl/openssl_1.1.0e.bb
>   rename meta/recipes-devtools/python/{python3-native_3.5.2.bb => python3-native_3.5.3.bb} (90%)
>   rename meta/recipes-devtools/python/python3/{000-cross-compile.patch => 0001-cross-compile-support.patch} (65%)
>   delete mode 100644 meta/recipes-devtools/python/python3/python3-fix-CVE-2016-1000110.patch
>   rename meta/recipes-devtools/python/{python3_3.5.2.bb => python3_3.5.3.bb} (96%)
>   create mode 100644 meta/recipes-support/apr/apr-util/openssl-1.1.patch
>


