Return-Path: <ptsneves@gmail.com>
Received: from mail-wr0-f170.google.com (mail-wr0-f170.google.com
	[209.85.128.170])
	by mail.openembedded.org (Postfix) with ESMTP id 5CF767780A
	for <openembedded-core@lists.openembedded.org>;
	Mon,  2 Jul 2018 10:53:30 +0000 (UTC)
Received: by mail-wr0-f170.google.com with SMTP id u7-v6so15054350wrn.12
	for <openembedded-core@lists.openembedded.org>;
	Mon, 02 Jul 2018 03:53:32 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc; bh=vuD/2XAGmU460vbk/4/b4TZ2hKcf+kqszvhRen9bbO4=;
	b=t2AJXgXi7osFwZu4VkCieSIYw1VgyCwmcegqQv50Gb58psjwuQ61FskXrLgEV9Ra9L
	l77MbjPKnDt1DtFd+C96k126cRP9Ed4W6wdvU00LmRPiSgZvP38bokOBNah+gYTNCC2t
	B0hbGvyAJfOeD4BD95xbHyi+XhWEDUsWNcjKyXOruYd1jdlDBT56zhtFq/2Udzn0di9W
	BGR35TztB9b8PVRRmBmKP1/NEKWANBrId5Ld+5AVrQdVuY9Vm1MA1vLGuCKRtwTHRA/v
	LC0j6S5q7ukGybHQBMB2sixNyhQk28ug2497wlbTPwZCzkMpPDLpaJMfCYSdNqxjq74Z
	VTyA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc;
	bh=vuD/2XAGmU460vbk/4/b4TZ2hKcf+kqszvhRen9bbO4=;
	b=TxquuTCykQ6sZ0saBmkK9Rjd8UvWyxyY7u4jMt8rj5BGMHn5z4X2h95gMbrdWR/O8O
	Lmb4Py4NE8s9azNkgw1SWK7TWLrVYbWv/ATu8lMJmgHOed+R8LWdp0rcdHmh1MvhDLph
	61EVh6DQIsbjM5xSl6Ff5Qtr50ETL5xnHQXDNZg0elnU9G9eOODC/v36e9zB+J6pjLiH
	CXNQMoB+Kv1SowSIVg7jQ/HpVOiPmgBEofmD6VaREfGzj/KmQeP7zOJAzJQVDh5kp/3K
	ucNJZHhgRnbwRFt03aYYIdFLUlptWvY2GqDq1W1631O+y8g44bFnUa215WputncY07I4
	/gag==
X-Gm-Message-State: APt69E22VZHX84VNGaz5IGFk8aX74PAFZ0LeSLPFZX7RVrCs9eoV27Rj
	NO3uklVI927Ol6Fx01B+Mra5VjzgBKHJHV7OVkMT
X-Google-Smtp-Source: AAOMgpeDH/x45ez5vpD3ma3GFtZqubKiOirsUbb1J3aPVhyBeFZXPAaKMDt31POGzw17y/JN5gnSBuNF8lvs0/VTF2A=
X-Received: by 2002:a5d:478d:: with SMTP id
	w13-v6mr18013048wrq.188.1530528811417; 
	Mon, 02 Jul 2018 03:53:31 -0700 (PDT)
MIME-Version: 1.0
Received: by 2002:a1c:e719:0:0:0:0:0 with HTTP;
	Mon, 2 Jul 2018 03:53:30 -0700 (PDT)
In-Reply-To: <1530485600-15284-1-git-send-email-akuster808@gmail.com>
References: <1530485600-15284-1-git-send-email-akuster808@gmail.com>
From: Paulo Neves <ptsneves@gmail.com>
Date: Mon, 2 Jul 2018 12:53:30 +0200
Message-ID: <CAJO0J4irFc+5Bx4ABhyNRyOrBfy=V+6d1R=8HJF_NRXE+ETL+g@mail.gmail.com>
To: Armin Kuster <akuster808@gmail.com>
Cc: OE-core <openembedded-core@lists.openembedded.org>
Subject: Re: [P=V2][PATCH] dhcp: update 4.4.1
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
X-List-Received-Date: Mon, 02 Jul 2018 10:53:31 -0000
Content-Type: text/plain; charset="UTF-8"

Is it possible to add the sigoff Paulo Neves <paulo.neves@nokia.com>?

Paulo Neves

On Mon, Jul 2, 2018 at 12:53 AM, Armin Kuster <akuster808@gmail.com> wrote:
> include several CVE fixes.
> CVE: CVE-2018-5733
> CVE: CVE-2018-5732
>
> LIC_CHKSUM_FILE updated to SPFX format
>
> https://kb.isc.org/article/AA-01571
>
> remove several patches now included in update.
> Shared libarary support is now enabled in configure+lt, use it
> and revert to autotools-brokensep
> Refresh patches
>
> aligns support with bind 9.11.x
>
> add libxml2 support to configure.ac+lt
>
> [v2]
> cleaned up do_configure per feedback
> fix hard coded lib & include patch
>
> Signed-off-by: Armin Kuster <akuster808@gmail.com>
> ---
>  meta/recipes-connectivity/dhcp/dhcp.inc            |  15 +-
>  ...o-_PATH_DHCPD_CONF-and-_PATH_DHCLIENT_CON.patch |  13 +-
>  .../dhcp/dhcp/0003-link-with-lcrypto.patch         |  13 +-
>  .../dhcp/dhcp/0004-Fix-out-of-tree-builds.patch    | 109 +++++------
>  .../dhcp/0006-site.h-enable-gentle-shutdown.patch  |  13 +-
>  ...re-argument-to-make-the-libxml2-dependenc.patch |  40 +++-
>  .../dhcp/dhcp/0010-build-shared-libs.patch         | 208 ---------------------
>  ...all-to-isc_app_ctxstart-to-not-get-signal.patch |  81 --------
>  ...correct-the-intention-for-xml2-lib-search.patch |  13 +-
>  .../dhcp/dhcp/0013-fixup_use_libbind.patch         |  64 +++++++
>  .../dhcp/dhcp/CVE-2017-3144.patch                  |  74 --------
>  .../dhcp/{dhcp_4.3.6.bb => dhcp_4.4.1.bb}          |  13 +-
>  12 files changed, 181 insertions(+), 475 deletions(-)
>  delete mode 100644 meta/recipes-connectivity/dhcp/dhcp/0010-build-shared-libs.patch
>  delete mode 100644 meta/recipes-connectivity/dhcp/dhcp/0011-Moved-the-call-to-isc_app_ctxstart-to-not-get-signal.patch
>  create mode 100644 meta/recipes-connectivity/dhcp/dhcp/0013-fixup_use_libbind.patch
>  delete mode 100644 meta/recipes-connectivity/dhcp/dhcp/CVE-2017-3144.patch
>  rename meta/recipes-connectivity/dhcp/{dhcp_4.3.6.bb => dhcp_4.4.1.bb} (65%)
>
> diff --git a/meta/recipes-connectivity/dhcp/dhcp.inc b/meta/recipes-connectivity/dhcp/dhcp.inc
> index e943707..3e65e5c 100644
> --- a/meta/recipes-connectivity/dhcp/dhcp.inc
> +++ b/meta/recipes-connectivity/dhcp/dhcp.inc
> @@ -8,7 +8,7 @@ easier to administer devices."
>  HOMEPAGE = "http://www.isc.org/"
>
>  LICENSE = "ISC"
> -LIC_FILES_CHKSUM = "file://LICENSE;beginline=4;md5=c5c64d696107f84b56fe337d14da1753"
> +LIC_FILES_CHKSUM = "file://LICENSE;beginline=4;md5=004a4db50a1e20972e924a8618747c01"
>
>  DEPENDS = "openssl bind"
>
> @@ -24,7 +24,7 @@ SRC_URI = "http://ftp.isc.org/isc/dhcp/${PV}/dhcp-${PV}.tar.gz \
>  UPSTREAM_CHECK_URI = "ftp://ftp.isc.org/isc/dhcp/"
>  UPSTREAM_CHECK_REGEX = "(?P<pver>\d+\.\d+\.(\d+?))/"
>
> -inherit autotools systemd useradd update-rc.d
> +inherit autotools-brokensep systemd useradd update-rc.d
>
>  USERADD_PACKAGES = "${PN}-server"
>  USERADD_PARAM_${PN}-server = "--system --no-create-home --home-dir /var/run/${BPN} --shell /bin/false --user-group ${BPN}"
> @@ -48,11 +48,17 @@ EXTRA_OECONF = "--with-srv-lease-file=${localstatedir}/lib/dhcp/dhcpd.leases \
>                  --with-srv6-lease-file=${localstatedir}/lib/dhcp/dhcpd6.leases \
>                  --with-cli-lease-file=${localstatedir}/lib/dhcp/dhclient.leases \
>                  --with-cli6-lease-file=${localstatedir}/lib/dhcp/dhclient6.leases \
> -                --with-libbind=${STAGING_LIBDIR}/ \
>                  --enable-paranoia --disable-static \
>                  --with-randomdev=/dev/random \
> +                --with-libbind=${STAGING_DIR_HOST} \
> +               --enable-libtool \
>                 "
>
> +#Enable shared libs per dhcp README
> +do_configure_prepend () {
> +       cp configure.ac+lt configure.ac
> +}
> +
>  do_install_append () {
>         install -d ${D}${sysconfdir}/init.d
>         install -d ${D}${sysconfdir}/default
> @@ -96,8 +102,7 @@ PACKAGES += "dhcp-libs dhcp-server dhcp-server-config dhcp-client dhcp-relay dhc
>  PACKAGES_remove = "${PN}"
>  RDEPENDS_${PN}-dev = ""
>  RDEPENDS_${PN}-staticdev = ""
> -
> -FILES_${PN}-libs = "${libdir}/libdhcpctl.so.0* ${libdir}/libomapi.so.0*"
> +FILES_${PN}-libs = "${libdir}/libdhcpctl.so.0* ${libdir}/libomapi.so.0* ${libdir}/libdhcp.so.0*"
>
>  FILES_${PN}-server = "${sbindir}/dhcpd ${sysconfdir}/init.d/dhcp-server"
>  RRECOMMENDS_${PN}-server = "dhcp-server-config"
> diff --git a/meta/recipes-connectivity/dhcp/dhcp/0001-define-macro-_PATH_DHCPD_CONF-and-_PATH_DHCLIENT_CON.patch b/meta/recipes-connectivity/dhcp/dhcp/0001-define-macro-_PATH_DHCPD_CONF-and-_PATH_DHCLIENT_CON.patch
> index e5b3cf9..d1b57f0 100644
> --- a/meta/recipes-connectivity/dhcp/dhcp/0001-define-macro-_PATH_DHCPD_CONF-and-_PATH_DHCLIENT_CON.patch
> +++ b/meta/recipes-connectivity/dhcp/dhcp/0001-define-macro-_PATH_DHCPD_CONF-and-_PATH_DHCLIENT_CON.patch
> @@ -11,11 +11,11 @@ Signed-off-by: Hongxu Jia <hongxu.jia@windriver.com>
>   includes/site.h | 3 ++-
>   1 file changed, 2 insertions(+), 1 deletion(-)
>
> -diff --git a/includes/site.h b/includes/site.h
> -index b2f7fd7..280fbb9 100644
> ---- a/includes/site.h
> -+++ b/includes/site.h
> -@@ -149,7 +149,8 @@
> +Index: dhcp-4.4.1/includes/site.h
> +===================================================================
> +--- dhcp-4.4.1.orig/includes/site.h
> ++++ dhcp-4.4.1/includes/site.h
> +@@ -148,7 +148,8 @@
>   /* Define this if you want the dhcpd.conf file to go somewhere other than
>      the default location.   By default, it goes in /etc/dhcpd.conf. */
>
> @@ -25,6 +25,3 @@ index b2f7fd7..280fbb9 100644
>
>   /* Network API definitions.   You do not need to choose one of these - if
>      you don't choose, one will be chosen for you in your system's config
> ---
> -1.8.3.1
> -
> diff --git a/meta/recipes-connectivity/dhcp/dhcp/0003-link-with-lcrypto.patch b/meta/recipes-connectivity/dhcp/dhcp/0003-link-with-lcrypto.patch
> index 810c7b6..5b35933 100644
> --- a/meta/recipes-connectivity/dhcp/dhcp/0003-link-with-lcrypto.patch
> +++ b/meta/recipes-connectivity/dhcp/dhcp/0003-link-with-lcrypto.patch
> @@ -18,11 +18,11 @@ Signed-off-by: Hongxu Jia <hongxu.jia@windriver.com>
>   configure.ac | 4 ++++
>   1 file changed, 4 insertions(+)
>
> -diff --git a/configure.ac b/configure.ac
> -index cdfa352..44fb57e 100644
> ---- a/configure.ac
> -+++ b/configure.ac
> -@@ -591,6 +591,10 @@ AC_COMPILE_IFELSE([AC_LANG_PROGRAM([[]], [[void foo() __attribute__((noreturn));
> +Index: dhcp-4.4.1/configure.ac
> +===================================================================
> +--- dhcp-4.4.1.orig/configure.ac
> ++++ dhcp-4.4.1/configure.ac
> +@@ -612,6 +612,10 @@ AC_COMPILE_IFELSE([AC_LANG_PROGRAM([[]],
>   # Look for optional headers.
>   AC_CHECK_HEADERS(sys/socket.h net/if_dl.h net/if6.h regex.h)
>
> @@ -33,6 +33,3 @@ index cdfa352..44fb57e 100644
>   # Solaris needs some libraries for functions
>   AC_SEARCH_LIBS(socket, [socket])
>   AC_SEARCH_LIBS(inet_ntoa, [nsl])
> ---
> -1.8.3.1
> -
> diff --git a/meta/recipes-connectivity/dhcp/dhcp/0004-Fix-out-of-tree-builds.patch b/meta/recipes-connectivity/dhcp/dhcp/0004-Fix-out-of-tree-builds.patch
> index 7d1d867..b71c93d 100644
> --- a/meta/recipes-connectivity/dhcp/dhcp/0004-Fix-out-of-tree-builds.patch
> +++ b/meta/recipes-connectivity/dhcp/dhcp/0004-Fix-out-of-tree-builds.patch
> @@ -19,82 +19,75 @@ Signed-off-by: Hongxu Jia <hongxu.jia@windriver.com>
>   server/Makefile.am  | 2 +-
>   6 files changed, 9 insertions(+), 5 deletions(-)
>
> -diff --git a/client/Makefile.am b/client/Makefile.am
> -index 2cb83d8..4730bb3 100644
> ---- a/client/Makefile.am
> -+++ b/client/Makefile.am
> -@@ -7,11 +7,11 @@ SUBDIRS = . tests
> - BINDLIBDIR = @BINDDIR@/lib
> -
> - AM_CPPFLAGS = -DCLIENT_PATH='"PATH=$(sbindir):/sbin:/bin:/usr/sbin:/usr/bin"' \
> --            -DLOCALSTATEDIR='"$(localstatedir)"'
> -+            -DLOCALSTATEDIR='"$(localstatedir)"' -I$(top_srcdir)/includes
> -
> - dist_sysconf_DATA = dhclient.conf.example
> - sbin_PROGRAMS = dhclient
> --dhclient_SOURCES = clparse.c dhclient.c dhc6.c \
> -+dhclient_SOURCES = $(srcdir)/clparse.c $(srcdir)/dhclient.c $(srcdir)/dhc6.c \
> -                  scripts/bsdos scripts/freebsd scripts/linux scripts/macos \
> -                  scripts/netbsd scripts/nextstep scripts/openbsd \
> -                  scripts/solaris scripts/openwrt
> -diff --git a/common/Makefile.am b/common/Makefile.am
> -index 113aee8..0f24fbb 100644
> ---- a/common/Makefile.am
> -+++ b/common/Makefile.am
> +Index: dhcp-4.4.1/common/Makefile.am
> +===================================================================
> +--- dhcp-4.4.1.orig/common/Makefile.am
> ++++ dhcp-4.4.1/common/Makefile.am
>  @@ -1,4 +1,5 @@
>  -AM_CPPFLAGS = -I$(top_srcdir) -DLOCALSTATEDIR='"@localstatedir@"'
>  +AM_CPPFLAGS = -I$(top_srcdir)/includes -I$(top_srcdir) -DLOCALSTATEDIR='"@localstatedir@"'
>  +
>   AM_CFLAGS = $(LDAP_CFLAGS)
>
> - noinst_LIBRARIES = libdhcp.a
> -diff --git a/dhcpctl/Makefile.am b/dhcpctl/Makefile.am
> -index ceb0de1..ba8dd8b 100644
> ---- a/dhcpctl/Makefile.am
> -+++ b/dhcpctl/Makefile.am
> -@@ -1,5 +1,7 @@
> - BINDLIBDIR = @BINDDIR@/lib
> + lib_LIBRARIES = libdhcp.a
> +Index: dhcp-4.4.1/dhcpctl/Makefile.am
> +===================================================================
> +--- dhcp-4.4.1.orig/dhcpctl/Makefile.am
> ++++ dhcp-4.4.1/dhcpctl/Makefile.am
> +@@ -3,6 +3,8 @@ BINDLIBDNSDIR=@BINDLIBDNSDIR@
> + BINDLIBISCCFGDIR=@BINDLIBISCCFGDIR@
> + BINDLIBISCDIR=@BINDLIBISCDIR@
>
>  +AM_CPPFLAGS = -I$(top_srcdir)/includes -I$(top_srcdir)
>  +
>   bin_PROGRAMS = omshell
>   lib_LIBRARIES = libdhcpctl.a
>   noinst_PROGRAMS = cltest
> -diff --git a/omapip/Makefile.am b/omapip/Makefile.am
> -index 446a594..dd1afa0 100644
> ---- a/omapip/Makefile.am
> -+++ b/omapip/Makefile.am
> -@@ -1,4 +1,5 @@
> - BINDLIBDIR = @BINDDIR@/lib
> +Index: dhcp-4.4.1/server/Makefile.am
> +===================================================================
> +--- dhcp-4.4.1.orig/server/Makefile.am
> ++++ dhcp-4.4.1/server/Makefile.am
> +@@ -4,7 +4,7 @@
> + # production code. Sadly, we are not there yet.
> + SUBDIRS = . tests
> +
> +-AM_CPPFLAGS = -I.. -DLOCALSTATEDIR='"@localstatedir@"'
> ++AM_CPPFLAGS = -I$(top_srcdir) -DLOCALSTATEDIR='"@localstatedir@"' -I$(top_srcdir)/includes
> +
> + dist_sysconf_DATA = dhcpd.conf.example
> + sbin_PROGRAMS = dhcpd
> +Index: dhcp-4.4.1/client/Makefile.am
> +===================================================================
> +--- dhcp-4.4.1.orig/client/Makefile.am
> ++++ dhcp-4.4.1/client/Makefile.am
> +@@ -5,7 +5,7 @@
> + SUBDIRS = . tests
> +
> + AM_CPPFLAGS = -DCLIENT_PATH='"PATH=$(sbindir):/sbin:/bin:/usr/sbin:/usr/bin"'
> +-AM_CPPFLAGS += -DLOCALSTATEDIR='"$(localstatedir)"'
> ++AM_CPPFLAGS += -DLOCALSTATEDIR='"$(localstatedir)"' -I$(top_srcdir)/includes
> +
> + dist_sysconf_DATA = dhclient.conf.example
> + sbin_PROGRAMS = dhclient
> +Index: dhcp-4.4.1/omapip/Makefile.am
> +===================================================================
> +--- dhcp-4.4.1.orig/omapip/Makefile.am
> ++++ dhcp-4.4.1/omapip/Makefile.am
> +@@ -2,6 +2,7 @@ BINDLIBIRSDIR=@BINDLIBIRSDIR@
> + BINDLIBDNSDIR=@BINDLIBDNSDIR@
> + BINDLIBISCCFGDIR=@BINDLIBISCCFGDIR@
> + BINDLIBISCDIR=@BINDLIBISCDIR@
>  +AM_CPPFLAGS = -I$(top_srcdir)/includes
>
>   lib_LIBRARIES = libomapi.a
>   noinst_PROGRAMS = svtest
> -diff --git a/relay/Makefile.am b/relay/Makefile.am
> -index 3060eca..6d652f6 100644
> ---- a/relay/Makefile.am
> -+++ b/relay/Makefile.am
> -@@ -1,6 +1,6 @@
> - BINDLIBDIR = @BINDDIR@/lib
> -
> +Index: dhcp-4.4.1/relay/Makefile.am
> +===================================================================
> +--- dhcp-4.4.1.orig/relay/Makefile.am
> ++++ dhcp-4.4.1/relay/Makefile.am
> +@@ -1,4 +1,4 @@
>  -AM_CPPFLAGS = -DLOCALSTATEDIR='"@localstatedir@"'
>  +AM_CPPFLAGS = -DLOCALSTATEDIR='"@localstatedir@"' -I$(top_srcdir)/includes
>
>   sbin_PROGRAMS = dhcrelay
>   dhcrelay_SOURCES = dhcrelay.c
> -diff --git a/server/Makefile.am b/server/Makefile.am
> -index 54feedf..3990b9c 100644
> ---- a/server/Makefile.am
> -+++ b/server/Makefile.am
> -@@ -6,7 +6,7 @@ SUBDIRS = . tests
> -
> - BINDLIBDIR = @BINDDIR@/lib
> -
> --AM_CPPFLAGS = -I.. -DLOCALSTATEDIR='"@localstatedir@"'
> -+AM_CPPFLAGS = -I$(top_srcdir) -DLOCALSTATEDIR='"@localstatedir@"' -I$(top_srcdir)/includes
> -
> - dist_sysconf_DATA = dhcpd.conf.example
> - sbin_PROGRAMS = dhcpd
> ---
> -1.8.3.1
> -
> diff --git a/meta/recipes-connectivity/dhcp/dhcp/0006-site.h-enable-gentle-shutdown.patch b/meta/recipes-connectivity/dhcp/dhcp/0006-site.h-enable-gentle-shutdown.patch
> index c62b283..6ef70cc 100644
> --- a/meta/recipes-connectivity/dhcp/dhcp/0006-site.h-enable-gentle-shutdown.patch
> +++ b/meta/recipes-connectivity/dhcp/dhcp/0006-site.h-enable-gentle-shutdown.patch
> @@ -12,11 +12,11 @@ Signed-off-by: Hongxu Jia <hongxu.jia@windriver.com>
>   includes/site.h | 2 +-
>   1 file changed, 1 insertion(+), 1 deletion(-)
>
> -diff --git a/includes/site.h b/includes/site.h
> -index 280fbb9..e6c2972 100644
> ---- a/includes/site.h
> -+++ b/includes/site.h
> -@@ -296,7 +296,7 @@
> +Index: dhcp-4.4.1/includes/site.h
> +===================================================================
> +--- dhcp-4.4.1.orig/includes/site.h
> ++++ dhcp-4.4.1/includes/site.h
> +@@ -295,7 +295,7 @@
>      situations.  We plan to revisit this feature and may
>      make non-backwards compatible changes including the
>      removal of this define.  Use at your own risk.  */
> @@ -25,6 +25,3 @@ index 280fbb9..e6c2972 100644
>
>   /* Include old error codes.  This is provided in case you
>      are building an external program similar to omshell for
> ---
> -1.8.3.1
> -
> diff --git a/meta/recipes-connectivity/dhcp/dhcp/0007-Add-configure-argument-to-make-the-libxml2-dependenc.patch b/meta/recipes-connectivity/dhcp/dhcp/0007-Add-configure-argument-to-make-the-libxml2-dependenc.patch
> index 43c26ea..feb0754 100644
> --- a/meta/recipes-connectivity/dhcp/dhcp/0007-Add-configure-argument-to-make-the-libxml2-dependenc.patch
> +++ b/meta/recipes-connectivity/dhcp/dhcp/0007-Add-configure-argument-to-make-the-libxml2-dependenc.patch
> @@ -15,13 +15,13 @@ Signed-off-by: Hongxu Jia <hongxu.jia@windriver.com>
>   configure.ac | 11 +++++++++++
>   1 file changed, 11 insertions(+)
>
> -diff --git a/configure.ac b/configure.ac
> -index 44fb57e..8e9f509 100644
> ---- a/configure.ac
> -+++ b/configure.ac
> -@@ -611,6 +611,17 @@ AC_CHECK_FUNCS(strlcat)
> - # For HP/UX we need -lipv6 for if_nametoindex, perhaps others.
> - AC_SEARCH_LIBS(if_nametoindex, [ipv6])
> +Index: dhcp-4.4.1/configure.ac
> +===================================================================
> +--- dhcp-4.4.1.orig/configure.ac
> ++++ dhcp-4.4.1/configure.ac
> +@@ -642,6 +642,17 @@ if test "$have_nanosleep" = "rt"; then
> +       LIBS="-lrt $LIBS"
> + fi
>
>  +AC_ARG_WITH(libxml2,
>  +      AS_HELP_STRING([--with-libxml2], [link against libxml2. this is needed if bind was built with xml2 support enabled]),
> @@ -37,6 +37,26 @@ index 44fb57e..8e9f509 100644
>   # check for /dev/random (declares HAVE_DEV_RANDOM)
>   AC_MSG_CHECKING(for random device)
>   AC_ARG_WITH(randomdev,
> ---
> -1.8.3.1
> -
> +Index: dhcp-4.4.1/configure.ac+lt
> +===================================================================
> +--- dhcp-4.4.1.orig/configure.ac+lt
> ++++ dhcp-4.4.1/configure.ac+lt
> +@@ -909,6 +909,18 @@ elif test "$want_libtool" = "yes" -a "$u
> + fi
> + AM_CONDITIONAL(INSTALL_BIND, test "$want_install_bind" = "yes")
> +
> ++AC_ARG_WITH(libxml2,
> ++      AS_HELP_STRING([--with-libxml2], [link against libxml2. this is needed if bind was built with xml2 support enabled]),
> ++      with_libxml2="$withval", with_libxml2="no")
> ++
> ++if test x$with_libxml2 != xno; then
> ++      AC_SEARCH_LIBS(xmlTextWriterStartElement, [xml2],,
> ++              [if test x$with_libxml2 != xauto; then
> ++                      AC_MSG_FAILURE([*** Cannot find xmlTextWriterStartElement with -lxml2 and libxml2 was requested])
> ++              fi])
> ++fi
> ++
> ++
> + # OpenLDAP support.
> + AC_ARG_WITH(ldap,
> +     AS_HELP_STRING([--with-ldap],[enable OpenLDAP support in dhcpd (default is no)]),
> diff --git a/meta/recipes-connectivity/dhcp/dhcp/0010-build-shared-libs.patch b/meta/recipes-connectivity/dhcp/dhcp/0010-build-shared-libs.patch
> deleted file mode 100644
> index f128731..0000000
> --- a/meta/recipes-connectivity/dhcp/dhcp/0010-build-shared-libs.patch
> +++ /dev/null
> @@ -1,208 +0,0 @@
> -From 76c370a929e5ab5dbc81c2fbcf4e50f4fbc08ce9 Mon Sep 17 00:00:00 2001
> -From: Kai Kang <kai.kang@windriver.com>
> -Date: Tue, 15 Aug 2017 15:53:37 +0800
> -Subject: [PATCH 10/11] build shared libs
> -
> -Upstream-Status: Pending
> -
> -Port patches from Fedora to build shared libs rather than static libs.
> -
> -Signed-off-by: Kai Kang <kai.kang@windriver.com>
> -
> -Rebase to 4.3.6
> -
> -Signed-off-by: Hongxu Jia <hongxu.jia@windriver.com>
> ----
> - client/Makefile.am       |  4 ++--
> - common/tests/Makefile.am | 13 +++++--------
> - configure.ac             | 12 ++----------
> - dhcpctl/Makefile.am      | 14 ++++++--------
> - omapip/Makefile.am       |  7 +++----
> - relay/Makefile.am        |  5 ++---
> - server/Makefile.am       |  7 +++----
> - server/tests/Makefile.am |  7 +++----
> - 8 files changed, 26 insertions(+), 43 deletions(-)
> -
> -diff --git a/client/Makefile.am b/client/Makefile.am
> -index 84d8131..e776bf0 100644
> ---- a/client/Makefile.am
> -+++ b/client/Makefile.am
> -@@ -15,7 +15,7 @@ dhclient_SOURCES = $(srcdir)/clparse.c $(srcdir)/dhclient.c $(srcdir)/dhc6.c \
> -                  scripts/bsdos scripts/freebsd scripts/linux scripts/macos \
> -                  scripts/netbsd scripts/nextstep scripts/openbsd \
> -                  scripts/solaris scripts/openwrt
> --dhclient_LDADD = ../common/libdhcp.a ../omapip/libomapi.a $(BINDLIBDIR)/libirs.a \
> --               $(BINDLIBDIR)/libdns.a $(BINDLIBDIR)/libisccfg.a $(BINDLIBDIR)/libisc.a
> -+dhclient_LDADD = ../common/libdhcp.a ../omapip/libomapi.la \
> -+                -L$(BINDLIBDIR) -lirs -ldns -lisccfg -lisc
> - man_MANS = dhclient.8 dhclient-script.8 dhclient.conf.5 dhclient.leases.5
> - EXTRA_DIST = $(man_MANS)
> -diff --git a/common/tests/Makefile.am b/common/tests/Makefile.am
> -index 2f98d22..8745e88 100644
> ---- a/common/tests/Makefile.am
> -+++ b/common/tests/Makefile.am
> -@@ -15,26 +15,23 @@ ATF_TESTS += alloc_unittest dns_unittest misc_unittest ns_name_unittest
> - alloc_unittest_SOURCES = test_alloc.c $(top_srcdir)/tests/t_api_dhcp.c
> - alloc_unittest_LDADD = $(ATF_LDFLAGS)
> - alloc_unittest_LDADD += ../libdhcp.a  \
> --      ../../omapip/libomapi.a $(BINDLIBDIR)/libirs.a \
> --      $(BINDLIBDIR)/libdns.a $(BINDLIBDIR)/libisccfg.a  $(BINDLIBDIR)/libisc.a
> -+      ../../omapip/libomapi.la -L$(BINDLIBDIR) -ldns -lisccfg -lisc
> -
> - dns_unittest_SOURCES = dns_unittest.c $(top_srcdir)/tests/t_api_dhcp.c
> - dns_unittest_LDADD = $(ATF_LDFLAGS)
> - dns_unittest_LDADD += ../libdhcp.a  \
> --      ../../omapip/libomapi.a $(BINDLIBDIR)/libirs.a \
> --      $(BINDLIBDIR)/libdns.a $(BINDLIBDIR)/libisccfg.a  $(BINDLIBDIR)/libisc.a
> -+      ../../omapip/libomapi.la -L$(BINDLIBDIR) -ldns -lisccfg -lisc
> -
> - misc_unittest_SOURCES = misc_unittest.c $(top_srcdir)/tests/t_api_dhcp.c
> - misc_unittest_LDADD = $(ATF_LDFLAGS)
> - misc_unittest_LDADD += ../libdhcp.a  \
> --      ../../omapip/libomapi.a $(BINDLIBDIR)/libirs.a \
> --      $(BINDLIBDIR)/libdns.a $(BINDLIBDIR)/libisccfg.a  $(BINDLIBDIR)/libisc.a
> -+      ../../omapip/libomapi.la -L$(BINDLIBDIR) -ldns -lisccfg -lisc
> -
> - ns_name_unittest_SOURCES = ns_name_test.c $(top_srcdir)/tests/t_api_dhcp.c
> - ns_name_unittest_LDADD = $(ATF_LDFLAGS)
> - ns_name_unittest_LDADD += ../libdhcp.a  \
> --      ../../omapip/libomapi.a $(BINDLIBDIR)/libirs.a \
> --      $(BINDLIBDIR)/libdns.a $(BINDLIBDIR)/libisccfg.a  $(BINDLIBDIR)/libisc.a
> -+      ../../omapip/libomapi.a -L$(BINDLIBDIR) \
> -+      -ldns -lisccfg -lisc
> -
> - check: $(ATF_TESTS)
> -       @if test $(top_srcdir) != ${top_builddir}; then \
> -diff --git a/configure.ac b/configure.ac
> -index 8e9f509..bfe988a 100644
> ---- a/configure.ac
> -+++ b/configure.ac
> -@@ -47,16 +47,8 @@ AM_CONDITIONAL(CROSS_COMPILING, test "$cross_compiling" = "yes")
> - # Use this to define _GNU_SOURCE to pull in the IPv6 Advanced Socket API.
> - AC_USE_SYSTEM_EXTENSIONS
> -
> --AC_PROG_RANLIB
> --
> --AC_PATH_PROG(AR, ar)
> --AC_SUBST(AR)
> --
> --if test "X$AR" = "X"; then
> --      AC_MSG_ERROR([
> --ar program not found.  Please fix your PATH to include the directory in
> --which ar resides, or set AR in the environment with the full path to ar.])
> --fi
> -+# Use libtool to simplify building of shared libraries
> -+AC_PROG_LIBTOOL
> -
> - AC_CONFIG_HEADERS([includes/config.h])
> -
> -diff --git a/dhcpctl/Makefile.am b/dhcpctl/Makefile.am
> -index 9b2486e..784cdf7 100644
> ---- a/dhcpctl/Makefile.am
> -+++ b/dhcpctl/Makefile.am
> -@@ -3,19 +3,17 @@ BINDLIBDIR = @BINDDIR@
> - AM_CPPFLAGS = -I$(top_srcdir)/includes -I$(top_srcdir)
> -
> - bin_PROGRAMS = omshell
> --lib_LIBRARIES = libdhcpctl.a
> -+lib_LTLIBRARIES = libdhcpctl.la
> - noinst_PROGRAMS = cltest
> - man_MANS = omshell.1 dhcpctl.3
> - EXTRA_DIST = $(man_MANS)
> -
> - omshell_SOURCES = omshell.c
> --omshell_LDADD = libdhcpctl.a ../common/libdhcp.a ../omapip/libomapi.a \
> --              $(BINDLIBDIR)/libirs.a $(BINDLIBDIR)/libdns.a \
> --              $(BINDLIBDIR)/libisccfg.a $(BINDLIBDIR)/libisc.a
> -+omshell_LDADD = libdhcpctl.la ../common/libdhcp.a ../omapip/libomapi.la \
> -+              -L$(BINDLIBDIR) -lirs -ldns -lisccfg -lisc
> -
> --libdhcpctl_a_SOURCES = dhcpctl.c callback.c remote.c
> -+libdhcpctl_la_SOURCES = dhcpctl.c callback.c remote.c
> -
> - cltest_SOURCES = cltest.c
> --cltest_LDADD = libdhcpctl.a ../common/libdhcp.a ../omapip/libomapi.a \
> --             $(BINDLIBDIR)/libirs.a $(BINDLIBDIR)/libdns.a \
> --               $(BINDLIBDIR)/libisccfg.a $(BINDLIBDIR)/libisc.a
> -+cltest_LDADD = libdhcpctl.la ../common/libdhcp.a ../omapip/libomapi.la \
> -+             -L$(BINDLIBDIR) -lirs -ldns -lisccfg -lisc
> -diff --git a/omapip/Makefile.am b/omapip/Makefile.am
> -index e4a8599..c0c7a1e 100644
> ---- a/omapip/Makefile.am
> -+++ b/omapip/Makefile.am
> -@@ -1,10 +1,10 @@
> - BINDLIBDIR = @BINDDIR@
> - AM_CPPFLAGS = -I$(top_srcdir)/includes
> -
> --lib_LIBRARIES = libomapi.a
> -+lib_LTLIBRARIES = libomapi.la
> - noinst_PROGRAMS = svtest
> -
> --libomapi_a_SOURCES = protocol.c buffer.c alloc.c result.c connection.c \
> -+libomapi_la_SOURCES = protocol.c buffer.c alloc.c result.c connection.c \
> -                    errwarn.c listener.c dispatch.c generic.c support.c \
> -                    handle.c message.c convert.c hash.c auth.c inet_addr.c \
> -                    array.c trace.c toisc.c iscprint.c isclib.c
> -@@ -13,6 +13,5 @@ man_MANS = omapi.3
> - EXTRA_DIST = $(man_MANS)
> -
> - svtest_SOURCES = test.c
> --svtest_LDADD = libomapi.a $(BINDLIBDIR)/libirs.a $(BINDLIBDIR)/libdns.a \
> --              $(BINDLIBDIR)/libisccfg.a $(BINDLIBDIR)/libisc.a
> -+svtest_LDADD = libomapi.la -L$(BINDLIBDIR) -lirs -ldns -lisccfg -lisc
> -
> -diff --git a/relay/Makefile.am b/relay/Makefile.am
> -index b3bf578..f47009f 100644
> ---- a/relay/Makefile.am
> -+++ b/relay/Makefile.am
> -@@ -4,9 +4,8 @@ AM_CPPFLAGS = -DLOCALSTATEDIR='"@localstatedir@"' -I$(top_srcdir)/includes
> -
> - sbin_PROGRAMS = dhcrelay
> - dhcrelay_SOURCES = dhcrelay.c
> --dhcrelay_LDADD = ../common/libdhcp.a ../omapip/libomapi.a \
> --               $(BINDLIBDIR)/libirs.a $(BINDLIBDIR)/libdns.a \
> --               $(BINDLIBDIR)/libisccfg.a $(BINDLIBDIR)/libisc.a
> -+dhcrelay_LDADD = ../common/libdhcp.a ../omapip/libomapi.la \
> -+               -L$(BINDLIBDIR) -lirs -ldns -lisccfg -lisc
> - man_MANS = dhcrelay.8
> - EXTRA_DIST = $(man_MANS)
> -
> -diff --git a/server/Makefile.am b/server/Makefile.am
> -index b5d8c2d..d7f876d 100644
> ---- a/server/Makefile.am
> -+++ b/server/Makefile.am
> -@@ -15,10 +15,9 @@ dhcpd_SOURCES = dhcpd.c dhcp.c bootp.c confpars.c db.c class.c failover.c \
> -               dhcpv6.c mdb6.c ldap.c ldap_casa.c leasechain.c ldap_krb_helper.c
> -
> - dhcpd_CFLAGS = $(LDAP_CFLAGS)
> --dhcpd_LDADD = ../common/libdhcp.a ../omapip/libomapi.a \
> --            ../dhcpctl/libdhcpctl.a $(BINDLIBDIR)/libirs.a \
> --            $(BINDLIBDIR)/libdns.a $(BINDLIBDIR)/libisccfg.a \
> --            $(BINDLIBDIR)/libisc.a $(LDAP_LIBS)
> -+dhcpd_LDADD = ../common/libdhcp.a ../omapip/libomapi.la \
> -+            ../dhcpctl/libdhcpctl.la -L$(BINDLIBDIR) \
> -+            -lirs -ldns -lisccfg -lisc $(LDAP_LIBS)
> -
> - man_MANS = dhcpd.8 dhcpd.conf.5 dhcpd.leases.5
> - EXTRA_DIST = $(man_MANS)
> -diff --git a/server/tests/Makefile.am b/server/tests/Makefile.am
> -index 9821081..de95872 100644
> ---- a/server/tests/Makefile.am
> -+++ b/server/tests/Makefile.am
> -@@ -19,10 +19,9 @@ DHCPSRC = ../dhcp.c ../bootp.c ../confpars.c ../db.c ../class.c      \
> -           ../ddns.c ../dhcpleasequery.c ../dhcpv6.c ../mdb6.c        \
> -           ../ldap.c ../ldap_casa.c ../dhcpd.c ../leasechain.c
> -
> --DHCPLIBS = $(top_builddir)/common/libdhcp.a $(top_builddir)/omapip/libomapi.a \
> --          $(top_builddir)/dhcpctl/libdhcpctl.a $(BINDLIBDIR)/libirs.a \
> --        $(BINDLIBDIR)/libdns.a $(BINDLIBDIR)/libisccfg.a \
> --        $(BINDLIBDIR)/libisc.a
> -+DHCPLIBS = $(top_builddir)/common/libdhcp.a $(top_builddir)/omapip/libomapi.la \
> -+          $(top_builddir)/dhcpctl/libdhcpctl.la \
> -+          -L$(BINDLIBDIR) -lirs -ldns -lisccfg -lisc
> -
> - ATF_TESTS =
> - if HAVE_ATF
> ---
> -1.8.3.1
> -
> diff --git a/meta/recipes-connectivity/dhcp/dhcp/0011-Moved-the-call-to-isc_app_ctxstart-to-not-get-signal.patch b/meta/recipes-connectivity/dhcp/dhcp/0011-Moved-the-call-to-isc_app_ctxstart-to-not-get-signal.patch
> deleted file mode 100644
> index 67bb463..0000000
> --- a/meta/recipes-connectivity/dhcp/dhcp/0011-Moved-the-call-to-isc_app_ctxstart-to-not-get-signal.patch
> +++ /dev/null
> @@ -1,81 +0,0 @@
> -From 37725f3e22edb50e0ca2d1fff971321a5a4d5112 Mon Sep 17 00:00:00 2001
> -From: Hongxu Jia <hongxu.jia@windriver.com>
> -Date: Wed, 12 Jul 2017 03:05:13 -0400
> -Subject: [PATCH 11/11] Moved the call to isc_app_ctxstart() to not get signal
> - block by all threads
> -
> -Signed-off-by: Francis Dupont <fdupont@isc.org>
> -
> -In https://source.isc.org/git/bind9.git, since the following
> -commit applied:
> -...
> -commit b99bfa184bc9375421b5df915eea7dfac6a68a99
> -Author: Evan Hunt <each@isc.org>
> -Date:   Wed Apr 10 13:49:57 2013 -0700
> -
> -    [master] unify internal and export libraries
> -
> -    3550.       [func]          Unified the internal and export versions of the
> -                        BIND libraries, allowing external clients to use
> -                        the same libraries as BIND. [RT #33131]
> -...
> -(git show b99bfa184bc9375421b5df915eea7dfac6a68a99 -- ./lib/isc/unix/app.c)
> -
> -In this commit, if bind9 enable threads(ISC_PLATFORM_USETHREADS),
> -it blocks signal SIGHUP, SIGINT and SIGTERM in isc__app_ctxstart.
> -Which caused dhclient/dhcpd could not be stopped by SIGTERM.
> -
> -It caused systemd's reboot hung which send SIGTERM by default.
> -
> -Upstream-Status: Backport [https://source.isc.org/git/dhcp.git]
> -Signed-off-by: Hongxu Jia <hongxu.jia@windriver.com>
> ----
> - omapip/isclib.c | 25 +++++++++++++++----------
> - 1 file changed, 15 insertions(+), 10 deletions(-)
> -
> -diff --git a/omapip/isclib.c b/omapip/isclib.c
> -index ce86490..6a04345 100644
> ---- a/omapip/isclib.c
> -+++ b/omapip/isclib.c
> -@@ -185,16 +185,6 @@ dhcp_context_create(int flags,
> -               if (result != ISC_R_SUCCESS)
> -                       goto cleanup;
> -
> --              result = isc_app_ctxstart(dhcp_gbl_ctx.actx);
> --              if (result != ISC_R_SUCCESS)
> --                      return (result);
> --              dhcp_gbl_ctx.actx_started = ISC_TRUE;
> --
> --              /* Not all OSs support suppressing SIGPIPE through socket
> --               * options, so set the sigal action to be ignore.  This allows
> --               * broken connections to fail gracefully with EPIPE on writes */
> --              handle_signal(SIGPIPE, SIG_IGN);
> --
> -               result = isc_taskmgr_createinctx(dhcp_gbl_ctx.mctx,
> -                                                dhcp_gbl_ctx.actx,
> -                                                1, 0,
> -@@ -217,6 +207,21 @@ dhcp_context_create(int flags,
> -               result = isc_task_create(dhcp_gbl_ctx.taskmgr, 0, &dhcp_gbl_ctx.task);
> -               if (result != ISC_R_SUCCESS)
> -                       goto cleanup;
> -+
> -+              result = isc_app_ctxstart(dhcp_gbl_ctx.actx);
> -+              if (result != ISC_R_SUCCESS)
> -+                      return (result);
> -+              dhcp_gbl_ctx.actx_started = ISC_TRUE;
> -+
> -+              /* Not all OSs support suppressing SIGPIPE through socket
> -+               * options, so set the sigal action to be ignore.  This allows
> -+               * broken connections to fail gracefully with EPIPE on writes */
> -+              handle_signal(SIGPIPE, SIG_IGN);
> -+
> -+              /* Reset handlers installed by isc_app_ctxstart()
> -+               * to default for control-c and kill */
> -+              handle_signal(SIGINT, SIG_DFL);
> -+              handle_signal(SIGTERM, SIG_DFL);
> -       }
> -
> - #if defined (NSUPDATE)
> ---
> -1.8.3.1
> -
> diff --git a/meta/recipes-connectivity/dhcp/dhcp/0012-dhcp-correct-the-intention-for-xml2-lib-search.patch b/meta/recipes-connectivity/dhcp/dhcp/0012-dhcp-correct-the-intention-for-xml2-lib-search.patch
> index 2d3af9d..39ba65f 100644
> --- a/meta/recipes-connectivity/dhcp/dhcp/0012-dhcp-correct-the-intention-for-xml2-lib-search.patch
> +++ b/meta/recipes-connectivity/dhcp/dhcp/0012-dhcp-correct-the-intention-for-xml2-lib-search.patch
> @@ -19,11 +19,11 @@ Signed-off-by: Awais Belal <awais_belal@mentor.com>
>   configure.ac | 2 +-
>   1 file changed, 1 insertion(+), 1 deletion(-)
>
> -diff --git a/configure.ac b/configure.ac
> -index bfe988a..f0459e6 100644
> ---- a/configure.ac
> -+++ b/configure.ac
> -@@ -608,7 +608,7 @@ AC_ARG_WITH(libxml2,
> +Index: dhcp-4.4.1/configure.ac
> +===================================================================
> +--- dhcp-4.4.1.orig/configure.ac
> ++++ dhcp-4.4.1/configure.ac
> +@@ -647,7 +647,7 @@ AC_ARG_WITH(libxml2,
>         with_libxml2="$withval", with_libxml2="no")
>
>   if test x$with_libxml2 != xno; then
> @@ -32,6 +32,3 @@ index bfe988a..f0459e6 100644
>                 [if test x$with_libxml2 != xauto; then
>                         AC_MSG_FAILURE([*** Cannot find xmlTextWriterStartElement with -lxml2 and libxml2 was requested])
>                 fi])
> ---
> -2.11.1
> -
> diff --git a/meta/recipes-connectivity/dhcp/dhcp/0013-fixup_use_libbind.patch b/meta/recipes-connectivity/dhcp/dhcp/0013-fixup_use_libbind.patch
> new file mode 100644
> index 0000000..fcec010
> --- /dev/null
> +++ b/meta/recipes-connectivity/dhcp/dhcp/0013-fixup_use_libbind.patch
> @@ -0,0 +1,64 @@
> +lib and include path is hardcoded for use_libbind
> +
> +use libdir and includedir vars
> +
> +Upstream-Status: Pending
> +Signed-off-by: Armin Kuster <akuster808@gmail.com>
> +
> +Index: dhcp-4.4.1/configure.ac+lt
> +===================================================================
> +--- dhcp-4.4.1.orig/configure.ac+lt
> ++++ dhcp-4.4.1/configure.ac+lt
> +@@ -801,22 +801,22 @@ no)
> +       if test ! -d "$use_libbind"; then
> +               AC_MSG_ERROR([Cannot find bind directory at $use_libbind])
> +       fi
> +-      if test ! -d "$use_libbind/include" -o \
> +-              ! -f "$use_libbind/include/isc/buffer.h"
> ++      if test ! -d "$use_libbind/$includedir" -o \
> ++              ! -f "$use_libbind/$includedir/isc/buffer.h"
> +       then
> +-              AC_MSG_ERROR([Cannot find bind includes at $use_libbind/include])
> ++              AC_MSG_ERROR([Cannot find bind includes at $use_libbind/$includedir])
> +       fi
> +-      if test ! -d "$use_libbind/lib" -o \
> +-              \( ! -f "$use_libbind/lib/libisc.a" -a \
> +-                 ! -f "$use_libbind/lib/libisc.la" \)
> ++      if test ! -d "$use_libbind/$libdir" -o \
> ++              \( ! -f "$use_libbind/$libdir/libisc.a" -a \
> ++                 ! -f "$use_libbind/$libdir/libisc.la" \)
> +       then
> +-              AC_MSG_ERROR([Cannot find bind libraries at $use_libbind/lib])
> ++              AC_MSG_ERROR([Cannot find bind libraries at $use_libbind/$libdir])
> +       fi
> +       BINDDIR="$use_libbind"
> +-      BINDLIBIRSDIR="$BINDDIR/lib"
> +-      BINDLIBDNSDIR="$BINDDIR/lib"
> +-      BINDLIBISCCFGDIR="$BINDDIR/lib"
> +-      BINDLIBISCDIR="$BINDDIR/lib"
> ++      BINDLIBIRSDIR="$BINDDIR/$libdir"
> ++      BINDLIBDNSDIR="$BINDDIR/$libdir"
> ++      BINDLIBISCCFGDIR="$BINDDIR/$libdir"
> ++      BINDLIBISCDIR="$BINDDIR/$libdir"
> +       DISTCHECK_LIBBIND_CONFIGURE_FLAG="--with-libbind=$use_libbind"
> +       ;;
> + esac
> +@@ -856,14 +856,14 @@ AC_ARG_ENABLE(libtool,
> +
> + if test "$use_libbind" != "no"; then
> +       if test "$want_libtool" = "yes" -a \
> +-              ! -f "$use_libbind/lib/libisc.la"
> ++              ! -f "$use_libbind/$libdir/libisc.la"
> +       then
> +-              AC_MSG_ERROR([Cannot find dynamic libraries at $use_libbind/lib])
> ++              AC_MSG_ERROR([Cannot find dynamic libraries at $use_libbind/$libdir])
> +       fi
> +       if test "$want_libtool" = "no" -a \
> +-              ! -f "$use_libbind/lib/libisc.a"
> ++              ! -f "$use_libbind/$libdir/libisc.a"
> +       then
> +-              AC_MSG_ERROR([Cannot find static libraries at $use_libbind/lib])
> ++              AC_MSG_ERROR([Cannot find static libraries at $use_libbind/$libdir])
> +       fi
> + fi
> +
> diff --git a/meta/recipes-connectivity/dhcp/dhcp/CVE-2017-3144.patch b/meta/recipes-connectivity/dhcp/dhcp/CVE-2017-3144.patch
> deleted file mode 100644
> index 2b2688c..0000000
> --- a/meta/recipes-connectivity/dhcp/dhcp/CVE-2017-3144.patch
> +++ /dev/null
> @@ -1,74 +0,0 @@
> -From 8cfdedee369c26d2869b6ec4a64460b5f5a30934 Mon Sep 17 00:00:00 2001
> -From: Thomas Markwalder <tmark@isc.org>
> -Date: Thu, 7 Dec 2017 11:39:30 -0500
> -Subject: [PATCH] [v4_3] Plugs a socket descriptor leak in OMAPI
> -
> -        Merges in rt46767.
> -
> -Upstream-Status: Backport
> -[https://source.isc.org/cgi-bin/gitweb.cgi?p=dhcp.git;a=commitdiff;h=5097bc0559f592683faac1f67bf350e1bddf6ed4]
> -
> -CVE: CVE-2017-3144
> -
> -Signed-off-by: Mingli Yu <Mingli.Yu@windriver.com>
> -Signed-off-by: Yi Zhao <yi.zhao@windriver.com>
> ----
> - RELNOTES         | 7 +++++++
> - omapip/buffer.c  | 9 +++++++++
> - omapip/message.c | 2 +-
> - 3 files changed, 17 insertions(+), 1 deletion(-)
> -
> -diff --git a/RELNOTES b/RELNOTES
> -index dd40aaf..3741b80 100644
> ---- a/RELNOTES
> -+++ b/RELNOTES
> -@@ -66,6 +66,13 @@ We welcome comments from DHCP users, about this or anything else we do.
> - Email Vicky Risk, Product Manager at vicky@isc.org or discuss on
> - dhcp-users@lists.isc.org.
> -
> -+- Plugged a socket descriptor leak in OMAPI, that can occur when there is
> -+  data pending to be written to an OMAPI connection, when the connection
> -+  is closed by the reader.  Thanks to Pavel Zhukov at RedHat for bringing
> -+  this issue to our attention and whose patch helped guide us in the right
> -+  direction.
> -+  [ISc-Bugs #46767]
> -+
> -                       Changes since 4.3.6b1
> -
> - - None
> -diff --git a/omapip/buffer.c b/omapip/buffer.c
> -index f7fdc32..809034d 100644
> ---- a/omapip/buffer.c
> -+++ b/omapip/buffer.c
> -@@ -566,6 +566,15 @@ isc_result_t omapi_connection_writer (omapi_object_t *h)
> -                       omapi_buffer_dereference (&buffer, MDL);
> -               }
> -       }
> -+
> -+      /* If we had data left to write when we're told to disconnect,
> -+      * we need recall disconnect, now that we're done writing.
> -+      * See rt46767. */
> -+      if (c->out_bytes == 0 && c->state == omapi_connection_disconnecting) {
> -+              omapi_disconnect (h, 1);
> -+              return ISC_R_SHUTTINGDOWN;
> -+      }
> -+
> -       return ISC_R_SUCCESS;
> - }
> -
> -diff --git a/omapip/message.c b/omapip/message.c
> -index 59ccdc2..21bcfc3 100644
> ---- a/omapip/message.c
> -+++ b/omapip/message.c
> -@@ -339,7 +339,7 @@ isc_result_t omapi_message_unregister (omapi_object_t *mo)
> - }
> -
> - #ifdef DEBUG_PROTOCOL
> --static const char *omapi_message_op_name(int op) {
> -+const char *omapi_message_op_name(int op) {
> -       switch (op) {
> -       case OMAPI_OP_OPEN:    return "OMAPI_OP_OPEN";
> -       case OMAPI_OP_REFRESH: return "OMAPI_OP_REFRESH";
> ---
> -2.7.4
> -
> diff --git a/meta/recipes-connectivity/dhcp/dhcp_4.3.6.bb b/meta/recipes-connectivity/dhcp/dhcp_4.4.1.bb
> similarity index 65%
> rename from meta/recipes-connectivity/dhcp/dhcp_4.3.6.bb
> rename to meta/recipes-connectivity/dhcp/dhcp_4.4.1.bb
> index cc13549..159abbc 100644
> --- a/meta/recipes-connectivity/dhcp/dhcp_4.3.6.bb
> +++ b/meta/recipes-connectivity/dhcp/dhcp_4.4.1.bb
> @@ -7,16 +7,15 @@ SRC_URI += "file://0001-define-macro-_PATH_DHCPD_CONF-and-_PATH_DHCLIENT_CON.pat
>              file://0005-dhcp-client-fix-invoke-dhclient-script-failed-on-Rea.patch \
>              file://0006-site.h-enable-gentle-shutdown.patch \
>              file://0007-Add-configure-argument-to-make-the-libxml2-dependenc.patch \
> -            file://0008-tweak-to-support-external-bind.patch \
>              file://0009-remove-dhclient-script-bash-dependency.patch \
> -            file://0010-build-shared-libs.patch \
> -            file://0011-Moved-the-call-to-isc_app_ctxstart-to-not-get-signal.patch \
>              file://0012-dhcp-correct-the-intention-for-xml2-lib-search.patch \
> -            file://CVE-2017-3144.patch \
> -           "
> +            file://0013-fixup_use_libbind.patch \
> +"
>
> -SRC_URI[md5sum] = "afa6e9b3eb7539ea048421a82c668adc"
> -SRC_URI[sha256sum] = "a41eaf6364f1377fe065d35671d9cf82bbbc8f21207819b2b9f33f652aec6f1b"
> +SRC_URI[md5sum] = "18c7f4dcbb0a63df25098216d47b1ede"
> +SRC_URI[sha256sum] = "2a22508922ab367b4af4664a0472dc220cc9603482cf3c16d9aff14f3a76b608"
> +
> +LDFLAGS_append = " -pthread"
>
>  PACKAGECONFIG ?= ""
>  PACKAGECONFIG[bind-httpstats] = "--with-libxml2,--without-libxml2,libxml2"
> --
> 2.7.4
>
> --
> _______________________________________________
> Openembedded-core mailing list
> Openembedded-core@lists.openembedded.org
> http://lists.openembedded.org/mailman/listinfo/openembedded-core

