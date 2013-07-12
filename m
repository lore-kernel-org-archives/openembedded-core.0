Return-Path: <sgw@linux.intel.com>
Received: from mga01.intel.com (mga01.intel.com [192.55.52.88])
	by mail.openembedded.org (Postfix) with ESMTP id 78E896B1AB
	for <openembedded-core@lists.openembedded.org>;
	Fri, 12 Jul 2013 16:37:23 +0000 (UTC)
Received: from fmsmga002.fm.intel.com ([10.253.24.26])
	by fmsmga101.fm.intel.com with ESMTP; 12 Jul 2013 09:37:20 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.89,654,1367996400"; d="scan'208";a="369344260"
Received: from unknown (HELO [10.255.13.73]) ([10.255.13.73])
	by fmsmga002.fm.intel.com with ESMTP; 12 Jul 2013 09:37:20 -0700
Message-ID: <51E030C1.8030102@linux.intel.com>
Date: Fri, 12 Jul 2013 09:37:21 -0700
From: Saul Wold <sgw@linux.intel.com>
User-Agent: Mozilla/5.0 (X11; Linux x86_64;
	rv:17.0) Gecko/20130514 Thunderbird/17.0.6
MIME-Version: 1.0
To: Andrei Dinu <andrei.adrianx.dinu@intel.com>
References: <1373635702-22234-1-git-send-email-andrei.adrianx.dinu@intel.com>
In-Reply-To: <1373635702-22234-1-git-send-email-andrei.adrianx.dinu@intel.com>
Cc: openembedded-core@lists.openembedded.org
Subject: Re: [PATCH] sudo upgrade to 1.8.7
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
X-List-Received-Date: Fri, 12 Jul 2013 16:37:23 -0000
Content-Type: text/plain; charset=ISO-8859-1; format=flowed
Content-Transfer-Encoding: 7bit

On 07/12/2013 06:28 AM, Andrei Dinu wrote:
> upgrade from 1.8.6p8 -> 1.8.7
>
> - removed libtool.patch - contained upstream
> - new files checksum from year change ( 2012 -> 2013 )
>
> Signed-off-by: Andrei Dinu <andrei.adrianx.dinu@intel.com>
> ---
>   meta/recipes-extended/sudo/files/libtool.patch     |   42 --------------------
>   meta/recipes-extended/sudo/sudo.inc                |    4 +-
>   .../sudo/{sudo_1.8.6p8.bb => sudo_1.8.7.bb}        |    5 +--
>   3 files changed, 4 insertions(+), 47 deletions(-)
>   delete mode 100644 meta/recipes-extended/sudo/files/libtool.patch
>   rename meta/recipes-extended/sudo/{sudo_1.8.6p8.bb => sudo_1.8.7.bb} (81%)
>
> diff --git a/meta/recipes-extended/sudo/files/libtool.patch b/meta/recipes-extended/sudo/files/libtool.patch
> deleted file mode 100644
> index 10456d2..0000000
> --- a/meta/recipes-extended/sudo/files/libtool.patch
> +++ /dev/null
> @@ -1,42 +0,0 @@
> -From 8f89e456b2c23d78646a938ee5d4c5477c06c28d Mon Sep 17 00:00:00 2001
> -From: Andrei Dinu <andrei.adrianx.dinu@intel.com>
> -Date: Fri, 25 Jan 2013 16:18:37 +0200
> -Subject: [PATCH] Fix path to libtool scripts so autoreconf can succeed.
> -
> -Upstream-Status: Inappropriate [Other]
> -Workaround is specific to our build system.
> -
> -Signed-off-by: Scott Garman <scott.a.garman@intel.com>
> -Signed-off-by: Andrei Dinu <andrei.adrianx.dinu@intel.com>
> ----
> - aclocal.m4 |   14 +++++++-------
> - 1 file changed, 7 insertions(+), 7 deletions(-)
> -
> -diff --git a/aclocal.m4 b/aclocal.m4
> -index 481ffeb..0c53eeb 100644
> ---- a/aclocal.m4
> -+++ b/aclocal.m4
> -@@ -364,13 +364,13 @@ EOF
> - dnl
> - dnl Pull in libtool macros
> - dnl
> --m4_include([libtool.m4])
> --m4_include([ltoptions.m4])
> --m4_include([ltsugar.m4])
> --m4_include([ltversion.m4])
> --m4_include([lt~obsolete.m4])
> -+m4_include([m4/libtool.m4])
> -+m4_include([m4/ltoptions.m4])
> -+m4_include([m4/ltsugar.m4])
> -+m4_include([m4/ltversion.m4])
> -+m4_include([m4/lt~obsolete.m4])
> - dnl
> - dnl Pull in other non-standard macros
> - dnl
> --m4_include([ax_check_compile_flag.m4])
> --m4_include([ax_check_link_flag.m4])
> -+m4_include([m4/ax_check_compile_flag.m4])
> -+m4_include([m4/ax_check_link_flag.m4])
> ---
> -1.7.9.5
> -
> diff --git a/meta/recipes-extended/sudo/sudo.inc b/meta/recipes-extended/sudo/sudo.inc
> index 9dcb677..0632904 100644
> --- a/meta/recipes-extended/sudo/sudo.inc
> +++ b/meta/recipes-extended/sudo/sudo.inc
> @@ -4,8 +4,8 @@ HOMEPAGE = "http://www.sudo.ws"
>   BUGTRACKER = "http://www.sudo.ws/bugs/"
>   SECTION = "admin"
>   LICENSE = "ISC & BSD & Zlib"
> -LIC_FILES_CHKSUM = "file://doc/LICENSE;md5=d25a8240ca6decdecb9990789e593130 \
> -                    file://plugins/sudoers/redblack.c;beginline=1;endline=41;md5=fba1c1dca0951819964dfdc618e81724 \
> +LIC_FILES_CHKSUM = "file://doc/LICENSE;md5=9b2b7976b2182ee9a146710b32a01c7a \
> +                    file://plugins/sudoers/redblack.c;beginline=1;endline=41;md5=e2dbb155fc49beea947515300bab99e0 \
>                       file://compat/fnmatch.c;beginline=3;endline=27;md5=67f83ee9bd456557397082f8f1be0efd \
>                       file://compat/getcwd.c;beginline=5;endline=27;md5=449af4cc57fc7d46f42090608ba3e681 \
>                       file://compat/glob.c;beginline=6;endline=31;md5=5872733146b9eb0deb79e1f664815b85 \
> diff --git a/meta/recipes-extended/sudo/sudo_1.8.6p8.bb b/meta/recipes-extended/sudo/sudo_1.8.7.bb
> similarity index 81%
> rename from meta/recipes-extended/sudo/sudo_1.8.6p8.bb
> rename to meta/recipes-extended/sudo/sudo_1.8.7.bb
> index 00602c0..de79110 100644
> --- a/meta/recipes-extended/sudo/sudo_1.8.6p8.bb
> +++ b/meta/recipes-extended/sudo/sudo_1.8.7.bb
> @@ -3,13 +3,12 @@ require sudo.inc
>   PR = "r0"
>
You can drop this please

>   SRC_URI = "http://ftp.sudo.ws/sudo/dist/sudo-${PV}.tar.gz \
> -           file://libtool.patch \
>              ${@base_contains('DISTRO_FEATURES', 'pam', '${PAM_SRC_URI}', '', d)}"
>
>   PAM_SRC_URI = "file://sudo.pam"
>
> -SRC_URI[md5sum] = "6dac48c73c8e0932980efcddafa569af"
> -SRC_URI[sha256sum] = "c0baaa87f59153967b650a0dde2f7d4147d358fa15f3fdabb47e84d0282fe625"
> +SRC_URI[md5sum] = "a02367090e1dac8d0c1747de1127b6bf"
> +SRC_URI[sha256sum] = "39626cf3d48c4fd5a9139a2627d42bfefac7ce47f470bdba3aeb4e3d7c49566a"
>
>   DEPENDS += " ${@base_contains('DISTRO_FEATURES', 'pam', 'libpam', '', d)}"
>   RDEPENDS_${PN} += " ${@base_contains('DISTRO_FEATURES', 'pam', 'pam-plugin-limits pam-plugin-keyinit', '', d)}"
>
The pam stuff should be PACKAGECONFIG'ed



