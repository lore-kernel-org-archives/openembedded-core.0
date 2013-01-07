Received: from mail-ia0-f176.google.com ([209.85.210.176])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <raj.khem@gmail.com>) id 1TsLl2-0004I5-P3
	for openembedded-core@lists.openembedded.org;
	Tue, 08 Jan 2013 00:05:31 +0100
Received: by mail-ia0-f176.google.com with SMTP id y26so16939019iab.21
	for <openembedded-core@lists.openembedded.org>;
	Mon, 07 Jan 2013 14:50:18 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc:content-type;
	bh=XD3JDyyKiRlR7GuiM9EubQWz9UtaW+xBZZ+gCcuuZ4M=;
	b=GcaxbswT4RRoWp1b0X4/jm3WMU6fxTaohdHUAq6EhyInj5tpTJBMb5eifUgz22tvxE
	1biZY3H7rhV5UkV3y3ZYE29F9YrqAN4KHD2jaT5ymHtuYaq9i7r1LzUuIzCvD9hD2T+I
	F5U1T8BDiovsdFK2GZA2/+2FCpc332jXGFbeEwCJpuZlypOvpeNnxX8ITVB1KdYgm78i
	mNQb2In8gKAoU6qTxkLkvfCMgwJZIXFtMCECEj0y+yg4lnX//IeeEBZwFa0V+VJwBLRK
	LaInRZtrHYzH0hNM45jy7NbuHSJct5x8Y8GJ+3Kl8l+g+E+UNS/ZqeTsti8WRCkAak4y
	2EUQ==
Received: by 10.50.56.232 with SMTP id d8mr7022967igq.112.1357599018510; Mon,
	07 Jan 2013 14:50:18 -0800 (PST)
MIME-Version: 1.0
Received: by 10.64.19.8 with HTTP; Mon, 7 Jan 2013 14:49:48 -0800 (PST)
In-Reply-To: <cover.1357343832.git.raj.khem@gmail.com>
References: <cover.1357343832.git.raj.khem@gmail.com>
From: Khem Raj <raj.khem@gmail.com>
Date: Mon, 7 Jan 2013 14:49:48 -0800
Message-ID: <CAMKF1spo+=xXVZSDNw3kaLbSc-XKUw8Uewn5DNTvgueu2TLt_Q@mail.gmail.com>
To: openembedded-core@lists.openembedded.org
Subject: Re: [RFC][PATCH 0/4] eglibc 2.17 upgrade
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
X-List-Received-Date: Mon, 07 Jan 2013 23:05:33 -0000
Content-Type: text/plain; charset=UTF-8

A bit of an update here.
I have pushed another patch on top of this list to the branch to fix
udev and after that I have been able
to build and boot core-image-sato on all supported qemu machines.

On Fri, Jan 4, 2013 at 4:00 PM, Khem Raj <raj.khem@gmail.com> wrote:
> I would like folks to try and test this upgrade. I have tested it on angstrom/systemd-image
> booted on all supported qemu images.
>
> This is however now the final set since I have to put the 2.17 tars on
> downloads location
>
> Please try it out in your configurations and let me know if you find issues.
>
> The following changes since commit b693f6d3d48b281fbbf71fd56996c85e23c3a9c9:
>
>   freetype: update to 2.4.11 which includes fixes for CVE-2012-{5668, 5669, 5670} (2012-12-31 09:42:49 +0000)
>
> are available in the git repository at:
>
>   git://git.openembedded.org/openembedded-core-contrib kraj/eglibc-2.17
>   http://cgit.openembedded.org/cgit.cgi/openembedded-core-contrib/log/?h=kraj/eglibc-2.17
>
> Khem Raj (3):
>   eglibc: Upgrade recipes 2.16 -> 2.17
>   eglibc_2.17: Fix Tibetian locale generation error
>   ofono: Fix build with eglibc 2.17
>
> Noor Ahsan (1):
>   cairo: Adds libxext in X11DEPENDS.
>
>  meta/conf/distro/include/tcmode-default.inc        |    2 +-
>  .../ofono/ofono/missing-ssize_t.patch              |   23 ++
>  meta/recipes-connectivity/ofono/ofono_1.12.bb      |    3 +-
>  ...tive_2.16.bb => cross-localedef-native_2.17.bb} |   12 +-
>  .../0001-Add-ARM-specific-static-stubs.c.patch     |   27 --
>  ..._handle_at-open_by_handle-etc.-to-PowerPC.patch |   65 ----
>  ...f-libgcc_s-and-libgcc_eh-when-building-gl.patch |  343 --------------------
>  .../eglibc-2.16/use-sysroot-cxx-headers.patch      |   42 ---
>  .../0001-R_ARM_TLS_DTPOFF32.patch                  |    0
>  .../0001-eglibc-menuconfig-support.patch           |    0
>  ...n-libm-err-tab.pl-with-specific-dirs-in-S.patch |    0
>  ...0002-eglibc-menuconfig-hex-string-options.patch |    0
>  ...0003-eglibc-menuconfig-build-instructions.patch |    0
>  .../GLRO_dl_debug_mask.patch                       |    0
>  .../IO-acquire-lock-fix.patch                      |    0
>  .../add_resource_h_to_wait_h.patch                 |    0
>  .../eglibc-svn-arm-lowlevellock-include-tls.patch  |    0
>  .../eglibc_fix_findidx_parameters.patch            |    0
>  .../{eglibc-2.16 => eglibc-2.17}/etc/ld.so.conf    |    0
>  .../fileops-without-wchar-io.patch                 |    0
>  .../eglibc/eglibc-2.17/fix-tibetian-locales.patch  |   38 +++
>  .../fix_for_centos_5.8.patch                       |    0
>  .../fsl-ppc-no-fsqrt.patch                         |    0
>  .../generate-supported.mk                          |    0
>  .../glibc.fix_sqrt2.patch                          |    0
>  .../initgroups_keys.patch                          |    0
>  .../ld-search-order.patch                          |    0
>  .../mips-rld-map-check.patch                       |    0
>  .../multilib_readlib.patch                         |    0
>  .../ppc-sqrt_finite.patch                          |    0
>  .../ppc_slow_ieee754_sqrt.patch                    |    0
>  .../relocatable_sdk.patch                          |    0
>  .../tzselect-awk.patch                             |    0
>  .../{eglibc-2.16 => eglibc-2.17}/tzselect-sh.patch |   54 ++-
>  ...libc-initial_2.16.bb => eglibc-initial_2.17.bb} |    0
>  meta/recipes-core/eglibc/eglibc-locale.inc         |    2 -
>  ...eglibc-locale_2.16.bb => eglibc-locale_2.17.bb} |    0
>  meta/recipes-core/eglibc/eglibc-mtrace.inc         |    1 -
>  ...eglibc-mtrace_2.16.bb => eglibc-mtrace_2.17.bb} |    0
>  ...libc-scripts_2.16.bb => eglibc-scripts_2.17.bb} |    0
>  .../eglibc/{eglibc_2.16.bb => eglibc_2.17.bb}      |   39 +--
>  meta/recipes-graphics/cairo/cairo.inc              |    8 +-
>  meta/recipes-graphics/cairo/cairo_1.12.8.bb        |    2 +-
>  43 files changed, 107 insertions(+), 554 deletions(-)
>  create mode 100644 meta/recipes-connectivity/ofono/ofono/missing-ssize_t.patch
>  rename meta/recipes-core/eglibc/{cross-localedef-native_2.16.bb => cross-localedef-native_2.17.bb} (74%)
>  delete mode 100644 meta/recipes-core/eglibc/eglibc-2.16/0001-Add-ARM-specific-static-stubs.c.patch
>  delete mode 100644 meta/recipes-core/eglibc/eglibc-2.16/0001-Add-name_to_handle_at-open_by_handle-etc.-to-PowerPC.patch
>  delete mode 100644 meta/recipes-core/eglibc/eglibc-2.16/0001-Avoid-use-of-libgcc_s-and-libgcc_eh-when-building-gl.patch
>  delete mode 100644 meta/recipes-core/eglibc/eglibc-2.16/use-sysroot-cxx-headers.patch
>  rename meta/recipes-core/eglibc/{eglibc-2.16 => eglibc-2.17}/0001-R_ARM_TLS_DTPOFF32.patch (100%)
>  rename meta/recipes-core/eglibc/{eglibc-2.16 => eglibc-2.17}/0001-eglibc-menuconfig-support.patch (100%)
>  rename meta/recipes-core/eglibc/{eglibc-2.16 => eglibc-2.17}/0001-eglibc-run-libm-err-tab.pl-with-specific-dirs-in-S.patch (100%)
>  rename meta/recipes-core/eglibc/{eglibc-2.16 => eglibc-2.17}/0002-eglibc-menuconfig-hex-string-options.patch (100%)
>  rename meta/recipes-core/eglibc/{eglibc-2.16 => eglibc-2.17}/0003-eglibc-menuconfig-build-instructions.patch (100%)
>  rename meta/recipes-core/eglibc/{eglibc-2.16 => eglibc-2.17}/GLRO_dl_debug_mask.patch (100%)
>  rename meta/recipes-core/eglibc/{eglibc-2.16 => eglibc-2.17}/IO-acquire-lock-fix.patch (100%)
>  rename meta/recipes-core/eglibc/{eglibc-2.16 => eglibc-2.17}/add_resource_h_to_wait_h.patch (100%)
>  rename meta/recipes-core/eglibc/{eglibc-2.16 => eglibc-2.17}/eglibc-svn-arm-lowlevellock-include-tls.patch (100%)
>  rename meta/recipes-core/eglibc/{eglibc-2.16 => eglibc-2.17}/eglibc_fix_findidx_parameters.patch (100%)
>  rename meta/recipes-core/eglibc/{eglibc-2.16 => eglibc-2.17}/etc/ld.so.conf (100%)
>  rename meta/recipes-core/eglibc/{eglibc-2.16 => eglibc-2.17}/fileops-without-wchar-io.patch (100%)
>  create mode 100644 meta/recipes-core/eglibc/eglibc-2.17/fix-tibetian-locales.patch
>  rename meta/recipes-core/eglibc/{eglibc-2.16 => eglibc-2.17}/fix_for_centos_5.8.patch (100%)
>  rename meta/recipes-core/eglibc/{eglibc-2.16 => eglibc-2.17}/fsl-ppc-no-fsqrt.patch (100%)
>  rename meta/recipes-core/eglibc/{eglibc-2.16 => eglibc-2.17}/generate-supported.mk (100%)
>  rename meta/recipes-core/eglibc/{eglibc-2.16 => eglibc-2.17}/glibc.fix_sqrt2.patch (100%)
>  rename meta/recipes-core/eglibc/{eglibc-2.16 => eglibc-2.17}/initgroups_keys.patch (100%)
>  rename meta/recipes-core/eglibc/{eglibc-2.16 => eglibc-2.17}/ld-search-order.patch (100%)
>  rename meta/recipes-core/eglibc/{eglibc-2.16 => eglibc-2.17}/mips-rld-map-check.patch (100%)
>  rename meta/recipes-core/eglibc/{eglibc-2.16 => eglibc-2.17}/multilib_readlib.patch (100%)
>  rename meta/recipes-core/eglibc/{eglibc-2.16 => eglibc-2.17}/ppc-sqrt_finite.patch (100%)
>  rename meta/recipes-core/eglibc/{eglibc-2.16 => eglibc-2.17}/ppc_slow_ieee754_sqrt.patch (100%)
>  rename meta/recipes-core/eglibc/{eglibc-2.16 => eglibc-2.17}/relocatable_sdk.patch (100%)
>  rename meta/recipes-core/eglibc/{eglibc-2.16 => eglibc-2.17}/tzselect-awk.patch (100%)
>  rename meta/recipes-core/eglibc/{eglibc-2.16 => eglibc-2.17}/tzselect-sh.patch (77%)
>  rename meta/recipes-core/eglibc/{eglibc-initial_2.16.bb => eglibc-initial_2.17.bb} (100%)
>  rename meta/recipes-core/eglibc/{eglibc-locale_2.16.bb => eglibc-locale_2.17.bb} (100%)
>  rename meta/recipes-core/eglibc/{eglibc-mtrace_2.16.bb => eglibc-mtrace_2.17.bb} (100%)
>  rename meta/recipes-core/eglibc/{eglibc-scripts_2.16.bb => eglibc-scripts_2.17.bb} (100%)
>  rename meta/recipes-core/eglibc/{eglibc_2.16.bb => eglibc_2.17.bb} (74%)
>
> --
> 1.7.9.5
>


