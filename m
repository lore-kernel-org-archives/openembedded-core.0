Return-Path: <denis@denix.org>
Received: from mailout4.zoneedit.com (mailout4.zoneedit.com [64.68.198.17])
	by mail.openembedded.org (Postfix) with ESMTP id F21F9780AF
	for <openembedded-core@lists.openembedded.org>;
	Fri, 23 Jun 2017 16:19:04 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by mailout4.zoneedit.com (Postfix) with ESMTP id 2AC74208FB;
	Fri, 23 Jun 2017 16:19:05 +0000 (UTC)
Received: from mailout4.zoneedit.com ([127.0.0.1])
	by localhost (zmo03-pco.easydns.vpn [127.0.0.1]) (amavisd-new,
	port 10024)
	with ESMTP id Q7mplnSEhmn7; Fri, 23 Jun 2017 16:19:05 +0000 (UTC)
Received: from mail.denix.org (pool-100-15-85-143.washdc.fios.verizon.net
	[100.15.85.143])
	(using TLSv1 with cipher DHE-RSA-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mailout4.zoneedit.com (Postfix) with ESMTPSA id 034BC20072;
	Fri, 23 Jun 2017 16:19:03 +0000 (UTC)
Received: by mail.denix.org (Postfix, from userid 1000)
	id 79492162513; Fri, 23 Jun 2017 12:19:03 -0400 (EDT)
Date: Fri, 23 Jun 2017 12:19:03 -0400
From: Denys Dmytriyenko <denis@denix.org>
To: Ross Burton <ross.burton@intel.com>
Message-ID: <20170623161903.GV28053@denix.org>
References: <20170623154544.28745-1-ross.burton@intel.com>
MIME-Version: 1.0
In-Reply-To: <20170623154544.28745-1-ross.burton@intel.com>
User-Agent: Mutt/1.5.20 (2009-06-14)
Cc: openembedded-core@lists.openembedded.org
Subject: Re: [PATCH] meta: Fix malformed Upstream-Status tags
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
X-List-Received-Date: Fri, 23 Jun 2017 16:19:06 -0000
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit

On Fri, Jun 23, 2017 at 04:45:44PM +0100, Ross Burton wrote:
> Fix a variety of spelling and format mistakes to improve the ease of reading the
> tags programatically.
> 
> Signed-off-by: Ross Burton <ross.burton@intel.com>
> ---
>  .../openssh/fix-potential-signed-overflow-in-pointer-arithmatic.patch | 2 +-
>  .../glibc/glibc/0027-locale-fix-hard-coded-reference-to-gcc-E.patch   | 2 +-
>  meta/recipes-core/libxml/libxml2/libxml2-CVE-2016-4658.patch          | 2 +-
>  .../recipes-core/libxml/libxml2/libxml2-fix_NULL_pointer_derefs.patch | 3 +--
>  meta/recipes-core/libxml/libxml2/libxml2-fix_node_comparison.patch    | 4 ++--
>  meta/recipes-devtools/apt/apt/0001-apt-1.2.12-Fix-musl-build.patch    | 2 +-
>  .../0047-libgcc_s-Use-alias-for-__cpu_indicator_init-instead-.patch   | 2 +-
>  .../0001-Configure-Remove-fstack-protector-strong-for-native-.patch   | 2 +-
>  meta/recipes-extended/acpica/acpitests/aapits-linux.patch             | 2 +-
>  meta/recipes-extended/acpica/acpitests/aapits-makefile.patch          | 2 +-
>  .../Makefile-Do-not-fail-if-CONFIG_TRACEPOINTS-is-not-en.patch        | 2 +-
>  .../0001-correct-error-which-appeared-when-compiling-non-c-co.patch   | 2 +-
>  .../rng-tools/rng-tools/rng-tools-5-fix-textrels-on-PIC-x86.patch     | 1 -
>  13 files changed, 13 insertions(+), 15 deletions(-)
> 
> diff --git a/meta/recipes-connectivity/openssh/openssh/fix-potential-signed-overflow-in-pointer-arithmatic.patch b/meta/recipes-connectivity/openssh/openssh/fix-potential-signed-overflow-in-pointer-arithmatic.patch
> index df64a140d32..7e043a2db19 100644
> --- a/meta/recipes-connectivity/openssh/openssh/fix-potential-signed-overflow-in-pointer-arithmatic.patch
> +++ b/meta/recipes-connectivity/openssh/openssh/fix-potential-signed-overflow-in-pointer-arithmatic.patch
> @@ -8,7 +8,7 @@ type, so that 's - src' in strlcpy and others may trigger signed overflow.
>  In case of compilation by gcc or clang with -ftrapv option, the overflow
>  would lead to program abort.
>  
> -Upstream-status: Submitted [http://bugzilla.mindrot.org/show_bug.cgi?id=2608]
> +Upstream-Status: Submitted [http://bugzilla.mindrot.org/show_bug.cgi?id=2608]
>  
>  Signed-off-by: Yuanjie Huang <yuanjie.huang@windriver.com>
>  ---
> diff --git a/meta/recipes-core/glibc/glibc/0027-locale-fix-hard-coded-reference-to-gcc-E.patch b/meta/recipes-core/glibc/glibc/0027-locale-fix-hard-coded-reference-to-gcc-E.patch
> index 71c0bdcaea5..bce90557cfb 100644
> --- a/meta/recipes-core/glibc/glibc/0027-locale-fix-hard-coded-reference-to-gcc-E.patch
> +++ b/meta/recipes-core/glibc/glibc/0027-locale-fix-hard-coded-reference-to-gcc-E.patch
> @@ -17,7 +17,7 @@ environment.
>  This patch replaces the hard-coded reference to the gcc binary with the proper
>  environment variable, thus allowing a user to override it.
>  
> -Upstream-Status : Submitted [https://sourceware.org/ml/libc-alpha/2016-08/msg00746.html]
> +Upstream-Status: Submitted [https://sourceware.org/ml/libc-alpha/2016-08/msg00746.html]
>  ---
>   locale/gen-translit.pl | 2 +-
>   1 file changed, 1 insertion(+), 1 deletion(-)
> diff --git a/meta/recipes-core/libxml/libxml2/libxml2-CVE-2016-4658.patch b/meta/recipes-core/libxml/libxml2/libxml2-CVE-2016-4658.patch
> index 5412e8c02ab..bb55eed171f 100644
> --- a/meta/recipes-core/libxml/libxml2/libxml2-CVE-2016-4658.patch
> +++ b/meta/recipes-core/libxml/libxml2/libxml2-CVE-2016-4658.patch
> @@ -8,7 +8,7 @@ Namespace nodes must be copied to avoid use-after-free errors.
>  But they don't necessarily have a physical representation in a
>  document, so simply disallow them in XPointer ranges.
>  
> -Upstream-Status: Backported 
> +Upstream-Status: Backport
>   - [https://git.gnome.org/browse/libxml2/commit/?id=c1d1f7121194036608bf555f08d3062a36fd344b]
>   - [https://git.gnome.org/browse/libxml2/commit/?id=3f8a91036d338e51c059d54397a42d645f019c65]
>  CVE: CVE-2016-4658
> diff --git a/meta/recipes-core/libxml/libxml2/libxml2-fix_NULL_pointer_derefs.patch b/meta/recipes-core/libxml/libxml2/libxml2-fix_NULL_pointer_derefs.patch
> index 83552ca3ecf..c60e32f6561 100644
> --- a/meta/recipes-core/libxml/libxml2/libxml2-fix_NULL_pointer_derefs.patch
> +++ b/meta/recipes-core/libxml/libxml2/libxml2-fix_NULL_pointer_derefs.patch
> @@ -2,8 +2,7 @@ libxml2-2.9.4: Fix more NULL pointer derefs
>  
>  xpointer: Fix more NULL pointer derefs
>  
> -Upstream-Status: Backported [https://git.gnome.org/browse/libxml2/commit/?id=e905f08123e4a6e7731549e6f09dadff4cab65bd]
> -CVE: -
> +Upstream-Status: Backport [https://git.gnome.org/browse/libxml2/commit/?id=e905f08123e4a6e7731549e6f09dadff4cab65bd]
>  Signed-off-by: Andrej Valek <andrej.valek@siemens.com>
>  Signed-off-by: Pascal Bach <pascal.bach@siemens.com>
>  
> diff --git a/meta/recipes-core/libxml/libxml2/libxml2-fix_node_comparison.patch b/meta/recipes-core/libxml/libxml2/libxml2-fix_node_comparison.patch
> index 11718bb2bdf..65f6bef1e69 100644
> --- a/meta/recipes-core/libxml/libxml2/libxml2-fix_node_comparison.patch
> +++ b/meta/recipes-core/libxml/libxml2/libxml2-fix_node_comparison.patch
> @@ -5,10 +5,10 @@ xpath:
>   - Add sanity check for empty stack.
>   - Include comparation in changes from xmlXPathCmpNodesExt to xmlXPathCmpNodes
>  
> -Upstream-Status: Backported
> +Upstream-Status: Backport
>   - [https://git.gnome.org/browse/libxml2/commit/?id=c1d1f7121194036608bf555f08d3062a36fd344b]
>   - [https://git.gnome.org/browse/libxml2/commit/?id=a005199330b86dada19d162cae15ef9bdcb6baa8]
> -CVE: necessary changes for fixing CVE-2016-5131
> +CVE: CVE-2016-5131
>  Signed-off-by: Andrej Valek <andrej.valek@siemens.com>
>  Signed-off-by: Pascal Bach <pascal.bach@siemens.com>
>  
> diff --git a/meta/recipes-devtools/apt/apt/0001-apt-1.2.12-Fix-musl-build.patch b/meta/recipes-devtools/apt/apt/0001-apt-1.2.12-Fix-musl-build.patch
> index 04b0406583b..f7ac19bfd08 100644
> --- a/meta/recipes-devtools/apt/apt/0001-apt-1.2.12-Fix-musl-build.patch
> +++ b/meta/recipes-devtools/apt/apt/0001-apt-1.2.12-Fix-musl-build.patch
> @@ -11,7 +11,7 @@ header so define it manually.
>  apt-pkg/contrib/srvrec.h: Add explicity include of sys/types.h
>  to avoid errors in types u_int_SIZE.
>  
> -Upstream-status: Pending
> +Upstream-Status: Pending
>  
>  Signed-off-by: Aníbal Limón <anibal.limon@linux.intel.com>
>  ---
> diff --git a/meta/recipes-devtools/gcc/gcc-6.3/0047-libgcc_s-Use-alias-for-__cpu_indicator_init-instead-.patch b/meta/recipes-devtools/gcc/gcc-6.3/0047-libgcc_s-Use-alias-for-__cpu_indicator_init-instead-.patch
> index ed6cd6905c5..6b5da0254ef 100644
> --- a/meta/recipes-devtools/gcc/gcc-6.3/0047-libgcc_s-Use-alias-for-__cpu_indicator_init-instead-.patch
> +++ b/meta/recipes-devtools/gcc/gcc-6.3/0047-libgcc_s-Use-alias-for-__cpu_indicator_init-instead-.patch
> @@ -31,7 +31,7 @@ gcc/Changelog:
>  
>  Signed-off-by: Khem Raj <raj.khem@gmail.com>
>  ---
> -Upstream-Status: Rejected
> +Upstream-Status: Denied
>  
>   gcc/config/i386/i386.c       | 4 ++--
>   libgcc/config/i386/cpuinfo.c | 6 +++---
> diff --git a/meta/recipes-devtools/perl/perl/0001-Configure-Remove-fstack-protector-strong-for-native-.patch b/meta/recipes-devtools/perl/perl/0001-Configure-Remove-fstack-protector-strong-for-native-.patch
> index 7391ac58372..14a05d291b6 100644
> --- a/meta/recipes-devtools/perl/perl/0001-Configure-Remove-fstack-protector-strong-for-native-.patch
> +++ b/meta/recipes-devtools/perl/perl/0001-Configure-Remove-fstack-protector-strong-for-native-.patch
> @@ -10,7 +10,7 @@ be removed when all supported distros comes with GCC>=4.9.
>  
>  [YOCTO #10338]
>  
> -Upstream-status: Inappropriate [configuration]
> +Upstream-Status: Inappropriate [configuration]
>  
>  [1] http://errors.yoctoproject.org/Errors/Details/109589/
>  
> diff --git a/meta/recipes-extended/acpica/acpitests/aapits-linux.patch b/meta/recipes-extended/acpica/acpitests/aapits-linux.patch
> index 7c5d6b04431..56010466608 100644
> --- a/meta/recipes-extended/acpica/acpitests/aapits-linux.patch
> +++ b/meta/recipes-extended/acpica/acpitests/aapits-linux.patch
> @@ -3,7 +3,7 @@ Date: Mon, 7 Apr 2014 19:09:37 +0000
>  Subject: [PATCH 1/2] Fixup aapits build
>  
>  From http://git.linaro.org/people/al.stone/acpica-tools.git
> -Upstream-status: Unknown
> +Upstream-Status: Pending
>  
>  diff -urN acpica-unix2-20130626/tests/aapits/atexec.c acpica-unix2-20130626-aapits/tests/aapits/atexec.c
>  --- acpica-unix2-20130626/tests/aapits/atexec.c	2013-01-17 12:48:28.000000000 -0700
> diff --git a/meta/recipes-extended/acpica/acpitests/aapits-makefile.patch b/meta/recipes-extended/acpica/acpitests/aapits-makefile.patch
> index 4d9e9974ddd..f9d9deabf3c 100644
> --- a/meta/recipes-extended/acpica/acpitests/aapits-makefile.patch
> +++ b/meta/recipes-extended/acpica/acpitests/aapits-makefile.patch
> @@ -3,7 +3,7 @@ Date: Mon, 7 Apr 2014 19:09:37 +0000
>  Subject: [PATCH 1/2] Fixup aapits build
>  
>  From http://git.linaro.org/people/al.stone/acpica-tools.git
> -Upstream-status: Unknown
> +Upstream-Status: Pending
>  
>  diff -urN acpica-unix2-20140325/tests/aapits/Makefile acpica-unix2-20140325/tests/aapits/Makefile
>  --- acpica-unix2-20140325/tests/aapits/Makefile	2014-04-05 14:23:14.683636794 -0600
> diff --git a/meta/recipes-kernel/lttng/lttng-modules/Makefile-Do-not-fail-if-CONFIG_TRACEPOINTS-is-not-en.patch b/meta/recipes-kernel/lttng/lttng-modules/Makefile-Do-not-fail-if-CONFIG_TRACEPOINTS-is-not-en.patch
> index 6a91f3258b4..e4112422720 100644
> --- a/meta/recipes-kernel/lttng/lttng-modules/Makefile-Do-not-fail-if-CONFIG_TRACEPOINTS-is-not-en.patch
> +++ b/meta/recipes-kernel/lttng/lttng-modules/Makefile-Do-not-fail-if-CONFIG_TRACEPOINTS-is-not-en.patch
> @@ -10,7 +10,7 @@ however, not every kernel has the CONFIG_TRACEPOINTS feature enabled.
>  This change makes the build do not fail when CONFIG_TRACEPOINTS is not
>  available, allowing it to be kept being pulled by default.
>  
> -Upstream-Status: Inapropriate [embedded specific]
> +Upstream-Status: Inappropriate [embedded specific]
>  
>  Signed-off-by: Otavio Salvador <otavio@ossystems.com.br>
>  ---
> diff --git a/meta/recipes-support/boost/boost/0001-correct-error-which-appeared-when-compiling-non-c-co.patch b/meta/recipes-support/boost/boost/0001-correct-error-which-appeared-when-compiling-non-c-co.patch
> index 2598d2b1752..f96005ebc75 100644
> --- a/meta/recipes-support/boost/boost/0001-correct-error-which-appeared-when-compiling-non-c-co.patch
> +++ b/meta/recipes-support/boost/boost/0001-correct-error-which-appeared-when-compiling-non-c-co.patch
> @@ -4,7 +4,7 @@ Date: Wed, 1 Feb 2017 16:43:59 -0800
>  Subject: [PATCH] correct error which appeared when compiling non c++ compliant
>   code for arrays
>  
> -Upstream-Status: Backported [expected to be released in v1.65]
> +Upstream-Status: Backport [expected to be released in v1.65]
>  
>  ---
>   boost/serialization/array.hpp | 2 ++
> diff --git a/meta/recipes-support/rng-tools/rng-tools/rng-tools-5-fix-textrels-on-PIC-x86.patch b/meta/recipes-support/rng-tools/rng-tools/rng-tools-5-fix-textrels-on-PIC-x86.patch
> index 90c9d8c515f..93a5864a494 100644
> --- a/meta/recipes-support/rng-tools/rng-tools/rng-tools-5-fix-textrels-on-PIC-x86.patch
> +++ b/meta/recipes-support/rng-tools/rng-tools/rng-tools-5-fix-textrels-on-PIC-x86.patch
> @@ -13,7 +13,6 @@ original file as long as the author and the tester are credited.
>  
>  Gentoo-bug-url: https://bugs.gentoo.org/show_bug.cgi?id=469962
>  Gentoo-bug-url: https://bugs.gentoo.org/show_bug.cgi?id=518210
> -Upstream-status: Not sent yet

Should this one be "Pending" instead?


>  Signed-off-by: Francisco Blas Izquierdo Riera (klondike) <klondike@gentoo.org>
>  Reported-by: cilly <cilly@cilly.mine.nu>
>  Reported-by: Manuel Rüger <mrueg@gentoo.org>
> -- 
> 2.11.0
> 
> -- 
> _______________________________________________
> Openembedded-core mailing list
> Openembedded-core@lists.openembedded.org
> http://lists.openembedded.org/mailman/listinfo/openembedded-core

