Received: from mail-pb0-f47.google.com ([209.85.160.47])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <raj.khem@gmail.com>) id 1TrHRD-0000SY-Kv
	for openembedded-core@lists.openembedded.org;
	Sat, 05 Jan 2013 01:16:39 +0100
Received: by mail-pb0-f47.google.com with SMTP id un1so9431196pbc.34
	for <openembedded-core@lists.openembedded.org>;
	Fri, 04 Jan 2013 16:01:29 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=x-received:from:to:cc:subject:date:message-id:x-mailer;
	bh=VKMBUXQbRqIy2M2GLHg5QtVruy3pCz661fUDIguX+UA=;
	b=omOzLb0uid6FIsRht0WFK+Z7chqnzH1bSYVPQaNgKCruTFAnog6AIhTYt/rjLquPQ0
	C3sKqttSF6eUvhYjuh8IUzn4aLB5XPbWjGSKPMkZ8GQ0gWyOelgCcS6yqQxQQu7K7o4O
	R2PF5P1Ply0CbAtxBZ3N6Q6V8A3u4HBh44UyF+4vXAZi7kTYusUtljMx/4k1gG/Rr023
	adDlLcz4CGn75Ll7cmJIVn86QNQAubGlR4WO/cmIxOBPVrBo58RYH3NmpZelXAavxp3S
	OXLPsO14OHrbcRywMnDFYCdUEiLKIgGCKgX7jAYNv0JH6FZcs35xIFEvpyI3IBnINc7v
	u13Q==
X-Received: by 10.68.240.36 with SMTP id vx4mr166110977pbc.90.1357344089133;
	Fri, 04 Jan 2013 16:01:29 -0800 (PST)
Received: from agate.agate.openembedded.org (oldbuilder.nslu2-linux.org.
	[140.211.169.168])
	by mx.google.com with ESMTPS id ai8sm33017934pbd.14.2013.01.04.16.01.27
	(version=TLSv1/SSLv3 cipher=OTHER);
	Fri, 04 Jan 2013 16:01:28 -0800 (PST)
From: Khem Raj <raj.khem@gmail.com>
To: openembedded-core@lists.openembedded.org
Date: Fri,  4 Jan 2013 16:00:47 -0800
Message-Id: <cover.1357343832.git.raj.khem@gmail.com>
X-Mailer: git-send-email 1.7.9.5
Subject: [RFC][PATCH 0/4] eglibc 2.17 upgrade
X-BeenThere: openembedded-core@lists.openembedded.org
X-Mailman-Version: 2.1.11
Precedence: list
List-Id: Patches and discussions about the oe-core layer
	<openembedded-core.lists.openembedded.org>
List-Unsubscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/options/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.linuxtogo.org/pipermail/openembedded-core>
List-Post: <mailto:openembedded-core@lists.openembedded.org>
List-Help: <mailto:openembedded-core-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Sat, 05 Jan 2013 00:16:40 -0000

I would like folks to try and test this upgrade. I have tested it on angstrom/systemd-image
booted on all supported qemu images.

This is however now the final set since I have to put the 2.17 tars on
downloads location

Please try it out in your configurations and let me know if you find issues.

The following changes since commit b693f6d3d48b281fbbf71fd56996c85e23c3a9c9:

  freetype: update to 2.4.11 which includes fixes for CVE-2012-{5668, 5669, 5670} (2012-12-31 09:42:49 +0000)

are available in the git repository at:

  git://git.openembedded.org/openembedded-core-contrib kraj/eglibc-2.17
  http://cgit.openembedded.org/cgit.cgi/openembedded-core-contrib/log/?h=kraj/eglibc-2.17

Khem Raj (3):
  eglibc: Upgrade recipes 2.16 -> 2.17
  eglibc_2.17: Fix Tibetian locale generation error
  ofono: Fix build with eglibc 2.17

Noor Ahsan (1):
  cairo: Adds libxext in X11DEPENDS.

 meta/conf/distro/include/tcmode-default.inc        |    2 +-
 .../ofono/ofono/missing-ssize_t.patch              |   23 ++
 meta/recipes-connectivity/ofono/ofono_1.12.bb      |    3 +-
 ...tive_2.16.bb => cross-localedef-native_2.17.bb} |   12 +-
 .../0001-Add-ARM-specific-static-stubs.c.patch     |   27 --
 ..._handle_at-open_by_handle-etc.-to-PowerPC.patch |   65 ----
 ...f-libgcc_s-and-libgcc_eh-when-building-gl.patch |  343 --------------------
 .../eglibc-2.16/use-sysroot-cxx-headers.patch      |   42 ---
 .../0001-R_ARM_TLS_DTPOFF32.patch                  |    0
 .../0001-eglibc-menuconfig-support.patch           |    0
 ...n-libm-err-tab.pl-with-specific-dirs-in-S.patch |    0
 ...0002-eglibc-menuconfig-hex-string-options.patch |    0
 ...0003-eglibc-menuconfig-build-instructions.patch |    0
 .../GLRO_dl_debug_mask.patch                       |    0
 .../IO-acquire-lock-fix.patch                      |    0
 .../add_resource_h_to_wait_h.patch                 |    0
 .../eglibc-svn-arm-lowlevellock-include-tls.patch  |    0
 .../eglibc_fix_findidx_parameters.patch            |    0
 .../{eglibc-2.16 => eglibc-2.17}/etc/ld.so.conf    |    0
 .../fileops-without-wchar-io.patch                 |    0
 .../eglibc/eglibc-2.17/fix-tibetian-locales.patch  |   38 +++
 .../fix_for_centos_5.8.patch                       |    0
 .../fsl-ppc-no-fsqrt.patch                         |    0
 .../generate-supported.mk                          |    0
 .../glibc.fix_sqrt2.patch                          |    0
 .../initgroups_keys.patch                          |    0
 .../ld-search-order.patch                          |    0
 .../mips-rld-map-check.patch                       |    0
 .../multilib_readlib.patch                         |    0
 .../ppc-sqrt_finite.patch                          |    0
 .../ppc_slow_ieee754_sqrt.patch                    |    0
 .../relocatable_sdk.patch                          |    0
 .../tzselect-awk.patch                             |    0
 .../{eglibc-2.16 => eglibc-2.17}/tzselect-sh.patch |   54 ++-
 ...libc-initial_2.16.bb => eglibc-initial_2.17.bb} |    0
 meta/recipes-core/eglibc/eglibc-locale.inc         |    2 -
 ...eglibc-locale_2.16.bb => eglibc-locale_2.17.bb} |    0
 meta/recipes-core/eglibc/eglibc-mtrace.inc         |    1 -
 ...eglibc-mtrace_2.16.bb => eglibc-mtrace_2.17.bb} |    0
 ...libc-scripts_2.16.bb => eglibc-scripts_2.17.bb} |    0
 .../eglibc/{eglibc_2.16.bb => eglibc_2.17.bb}      |   39 +--
 meta/recipes-graphics/cairo/cairo.inc              |    8 +-
 meta/recipes-graphics/cairo/cairo_1.12.8.bb        |    2 +-
 43 files changed, 107 insertions(+), 554 deletions(-)
 create mode 100644 meta/recipes-connectivity/ofono/ofono/missing-ssize_t.patch
 rename meta/recipes-core/eglibc/{cross-localedef-native_2.16.bb => cross-localedef-native_2.17.bb} (74%)
 delete mode 100644 meta/recipes-core/eglibc/eglibc-2.16/0001-Add-ARM-specific-static-stubs.c.patch
 delete mode 100644 meta/recipes-core/eglibc/eglibc-2.16/0001-Add-name_to_handle_at-open_by_handle-etc.-to-PowerPC.patch
 delete mode 100644 meta/recipes-core/eglibc/eglibc-2.16/0001-Avoid-use-of-libgcc_s-and-libgcc_eh-when-building-gl.patch
 delete mode 100644 meta/recipes-core/eglibc/eglibc-2.16/use-sysroot-cxx-headers.patch
 rename meta/recipes-core/eglibc/{eglibc-2.16 => eglibc-2.17}/0001-R_ARM_TLS_DTPOFF32.patch (100%)
 rename meta/recipes-core/eglibc/{eglibc-2.16 => eglibc-2.17}/0001-eglibc-menuconfig-support.patch (100%)
 rename meta/recipes-core/eglibc/{eglibc-2.16 => eglibc-2.17}/0001-eglibc-run-libm-err-tab.pl-with-specific-dirs-in-S.patch (100%)
 rename meta/recipes-core/eglibc/{eglibc-2.16 => eglibc-2.17}/0002-eglibc-menuconfig-hex-string-options.patch (100%)
 rename meta/recipes-core/eglibc/{eglibc-2.16 => eglibc-2.17}/0003-eglibc-menuconfig-build-instructions.patch (100%)
 rename meta/recipes-core/eglibc/{eglibc-2.16 => eglibc-2.17}/GLRO_dl_debug_mask.patch (100%)
 rename meta/recipes-core/eglibc/{eglibc-2.16 => eglibc-2.17}/IO-acquire-lock-fix.patch (100%)
 rename meta/recipes-core/eglibc/{eglibc-2.16 => eglibc-2.17}/add_resource_h_to_wait_h.patch (100%)
 rename meta/recipes-core/eglibc/{eglibc-2.16 => eglibc-2.17}/eglibc-svn-arm-lowlevellock-include-tls.patch (100%)
 rename meta/recipes-core/eglibc/{eglibc-2.16 => eglibc-2.17}/eglibc_fix_findidx_parameters.patch (100%)
 rename meta/recipes-core/eglibc/{eglibc-2.16 => eglibc-2.17}/etc/ld.so.conf (100%)
 rename meta/recipes-core/eglibc/{eglibc-2.16 => eglibc-2.17}/fileops-without-wchar-io.patch (100%)
 create mode 100644 meta/recipes-core/eglibc/eglibc-2.17/fix-tibetian-locales.patch
 rename meta/recipes-core/eglibc/{eglibc-2.16 => eglibc-2.17}/fix_for_centos_5.8.patch (100%)
 rename meta/recipes-core/eglibc/{eglibc-2.16 => eglibc-2.17}/fsl-ppc-no-fsqrt.patch (100%)
 rename meta/recipes-core/eglibc/{eglibc-2.16 => eglibc-2.17}/generate-supported.mk (100%)
 rename meta/recipes-core/eglibc/{eglibc-2.16 => eglibc-2.17}/glibc.fix_sqrt2.patch (100%)
 rename meta/recipes-core/eglibc/{eglibc-2.16 => eglibc-2.17}/initgroups_keys.patch (100%)
 rename meta/recipes-core/eglibc/{eglibc-2.16 => eglibc-2.17}/ld-search-order.patch (100%)
 rename meta/recipes-core/eglibc/{eglibc-2.16 => eglibc-2.17}/mips-rld-map-check.patch (100%)
 rename meta/recipes-core/eglibc/{eglibc-2.16 => eglibc-2.17}/multilib_readlib.patch (100%)
 rename meta/recipes-core/eglibc/{eglibc-2.16 => eglibc-2.17}/ppc-sqrt_finite.patch (100%)
 rename meta/recipes-core/eglibc/{eglibc-2.16 => eglibc-2.17}/ppc_slow_ieee754_sqrt.patch (100%)
 rename meta/recipes-core/eglibc/{eglibc-2.16 => eglibc-2.17}/relocatable_sdk.patch (100%)
 rename meta/recipes-core/eglibc/{eglibc-2.16 => eglibc-2.17}/tzselect-awk.patch (100%)
 rename meta/recipes-core/eglibc/{eglibc-2.16 => eglibc-2.17}/tzselect-sh.patch (77%)
 rename meta/recipes-core/eglibc/{eglibc-initial_2.16.bb => eglibc-initial_2.17.bb} (100%)
 rename meta/recipes-core/eglibc/{eglibc-locale_2.16.bb => eglibc-locale_2.17.bb} (100%)
 rename meta/recipes-core/eglibc/{eglibc-mtrace_2.16.bb => eglibc-mtrace_2.17.bb} (100%)
 rename meta/recipes-core/eglibc/{eglibc-scripts_2.16.bb => eglibc-scripts_2.17.bb} (100%)
 rename meta/recipes-core/eglibc/{eglibc_2.16.bb => eglibc_2.17.bb} (74%)

-- 
1.7.9.5



