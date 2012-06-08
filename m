Received: from mga07.intel.com ([143.182.124.22] helo=azsmga101.ch.intel.com)
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <ross.burton@intel.com>) id 1Sctjb-0007wh-37
	for openembedded-core@lists.openembedded.org;
	Fri, 08 Jun 2012 09:35:51 +0200
Received: from mail-ey0-f180.google.com ([209.85.215.180])
	by mga03.intel.com with ESMTP/TLS/RC4-SHA; 08 Jun 2012 00:25:19 -0700
Received: by eaai12 with SMTP id i12so755312eaa.25
	for <openembedded-core@lists.openembedded.org>;
	Fri, 08 Jun 2012 00:25:17 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=google.com; s=20120113;
	h=date:from:to:message-id:in-reply-to:references:subject:x-mailer
	:mime-version:content-type:content-transfer-encoding
	:content-disposition:x-gm-message-state;
	bh=tCjOMP2r+P3S/Mcvrq4Js3PKJXh2KlZGo+mnIGvOmQ4=;
	b=i6rpFG68ddbbaOiIibwIH3QdxSg8NSnl3TIVojjX43zQ98yynxE4H9ph9ZAlGrZ6Bq
	8iRV2aFh9aqgOmzR6jEKnPBHqIj9UX0qWuC9iGzBcux7VVaeTi/oAifu2tW/R9pOt7CK
	y9ef4B1aNwM6Hk/ynq067+F7Q9v0beNbw40FtmRpnSgIVxZ3ZC7v6uK3rRPQ4foRRF6h
	COsMhk4ODX3BDY+YLyIccc/3oeDDp6NqLAHPH1Q7n8bkqiLSOOV2TrgsmHOndCSlu9Xf
	XyVQKQEyh26aA1QdeAlnI7cI+EaqG9ZpwrvhSZ74SWW8idm5KQmHsVT5NA+fS7C+lezN
	c2Yw==
Received: by 10.14.94.143 with SMTP id n15mr3187351eef.60.1339140317270;
	Fri, 08 Jun 2012 00:25:17 -0700 (PDT)
Received: from elizabeth.local (35.106.2.81.in-addr.arpa. [81.2.106.35])
	by mx.google.com with ESMTPS id a16sm19015736eeg.0.2012.06.08.00.25.12
	(version=SSLv3 cipher=OTHER); Fri, 08 Jun 2012 00:25:13 -0700 (PDT)
Date: Fri, 8 Jun 2012 08:25:14 +0100
From: Ross Burton <ross.burton@intel.com>
To: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Message-ID: <97360C35D62646D2ADBC8E355B76C317@intel.com>
In-Reply-To: <4ed9ae726e8494b9ccfbf531a90b0c3e5dc60c27.1339111944.git.elizabeth.flanagan@intel.com>
References: <cover.1339111944.git.elizabeth.flanagan@intel.com>
	<4ed9ae726e8494b9ccfbf531a90b0c3e5dc60c27.1339111944.git.elizabeth.flanagan@intel.com>
X-Mailer: sparrow 1.4.2 (build 959.4)
MIME-Version: 1.0
X-Gm-Message-State: ALoCoQnTsyBDkX6w6WdWxYzAP1Q2mcFKJTj3UG4L+d4exQBae3fnIpwfV+5oukhm0Iqf61eHlwH/
Subject: Re: [Consolidated Pull 18/22] connman: upgrade to 1.0
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
X-List-Received-Date: Fri, 08 Jun 2012 07:35:51 -0000
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

This depends on a patch to connman-gnome that I was going to test yesterday but family-wide illness got the better of me.  I may be able to get it done today, otherwise please drop this. 

Ross 


On Friday, 8 June 2012 at 00:37, Elizabeth Flanagan wrote:

> From: Ross Burton <ross.burton@intel.com (mailto:ross.burton@intel.com)>
> 
> Drop all upstreamed or irrelevant patches, remove unused configure arguments,
> and add compatibility rprovides for what used to be plugins but are now
> integrated into the core.
> 
> Signed-off-by: Ross Burton <ross.burton@intel.com (mailto:ross.burton@intel.com)>
> Signed-off-by: Elizabeth Flanagan <elizabeth.flanagan@intel.com (mailto:elizabeth.flanagan@intel.com)>
> ---
> meta/recipes-connectivity/connman/connman.inc | 26 ++++++---
> ...ange-visibility-to-default-for-debug-symb.patch | 35 ------------
> .../connman/connman/disable_alg-test.patch | 46 ----------------
> .../connman/connman/ethernet_default.patch | 22 --------
> .../connman/test-set-ipv4-method-api-fix.patch | 50 ------------------
> .../connman/test-set-ipv6-method-api-fix.patch | 55 --------------------
> meta/recipes-connectivity/connman/connman_0.79.bb | 14 -----
> meta/recipes-connectivity/connman/connman_1.0.bb | 9 +++
> 8 files changed, 27 insertions(+), 230 deletions(-)
> delete mode 100644 meta/recipes-connectivity/connman/connman/0001-plugin.h-Change-visibility-to-default-for-debug-symb.patch
> delete mode 100644 meta/recipes-connectivity/connman/connman/disable_alg-test.patch
> delete mode 100644 meta/recipes-connectivity/connman/connman/ethernet_default.patch
> delete mode 100644 meta/recipes-connectivity/connman/connman/test-set-ipv4-method-api-fix.patch
> delete mode 100644 meta/recipes-connectivity/connman/connman/test-set-ipv6-method-api-fix.patch
> delete mode 100644 meta/recipes-connectivity/connman/connman_0.79.bb
> create mode 100644 meta/recipes-connectivity/connman/connman_1.0.bb
> 
> diff --git a/meta/recipes-connectivity/connman/connman.inc b/meta/recipes-connectivity/connman/connman.inc
> index 4fb7b43..83219c5 100644
> --- a/meta/recipes-connectivity/connman/connman.inc
> +++ b/meta/recipes-connectivity/connman/connman.inc
> @@ -11,7 +11,7 @@ HOMEPAGE = "http://connman.net/"
> BUGTRACKER = "http://bugs.meego.com/buglist.cgi?quicksearch=connman"
> LICENSE = "GPLv2"
> LIC_FILES_CHKSUM = "file://COPYING;md5=12f884d2ae1ff87c09e5b7ccc2c4ca7e \
> - file://src/main.c;beginline=1;endline=20;md5=4b55b550fa6b33cc2055ef30dd262b3e"
> + file://src/main.c;beginline=1;endline=20;md5=d6a1ac98a6791c5294e8a7f176ecd66d"
> 
> # we need to define the depends here, the dynamic stuff is too late
> DEPENDS = "dbus glib-2.0 ppp iptables gnutls \
> @@ -33,14 +33,11 @@ EXTRA_OECONF += "\
> --enable-ethernet \
> ${@base_contains('DISTRO_FEATURES', 'wifi','--enable-wifi ${TIST}', '--disable-wifi', d)} \
> ${@base_contains('DISTRO_FEATURES', 'bluetooth','--enable-bluetooth ${TIST}', '--disable-bluetooth', d)} \
> - --enable-dnsproxy \
> ${@base_contains('DISTRO_FEATURES', '3g', '', '--disable-ofono', d)} \
> --enable-tools \
> --enable-test \
> --disable-polkit \
> - --enable-client \
> - --enable-fake \
> - --disable-ntpd \
> + --disable-client \
> "
> 
> INITSCRIPT_NAME = "connman"
> @@ -72,13 +69,26 @@ do_install_append() {
> rmdir ${D}${libdir}/connman/scripts
> }
> 
> +# These used to be plugins, but now they are core
> +RPROVIDES_${PN} = "\
> + connman-plugin-loopback \
> + connman-plugin-ethernet \
> + ${@base_contains('DISTRO_FEATURES', 'bluetooth','connman-plugin-bluetooth', '', d)} \
> + ${@base_contains('DISTRO_FEATURES', 'wifi','connman-plugin-wifi', '', d)} \
> + ${@base_contains('DISTRO_FEATURES', '3g','connman-plugin-ofono', '', d)} \
> + "
> +
> +RDEPENDS_${PN} = "\
> + ${@base_contains('DISTRO_FEATURES', 'bluetooth', 'bluez4', '', d)} \
> + ${@base_contains('DISTRO_FEATURES', 'wifi','wpa-supplicant', '', d)} \
> + ${@base_contains('DISTRO_FEATURES', '3g','ofono', '', d)} \
> + "
> +
> PACKAGES_DYNAMIC = "${PN}-plugin-*"
> 
> python populate_packages_prepend() {
> depmap = dict( pppd="ppp",
> - wifi="wpa-supplicant",
> - bluetooth="bluez4",
> - ofono="ofono" )
> + )
> packages = []
> multilib_prefix = (d.getVar("MLPREFIX", True) or "")
> hook = lambda file,pkg,b,c,d:packages.append((file,pkg))
> diff --git a/meta/recipes-connectivity/connman/connman/0001-plugin.h-Change-visibility-to-default-for-debug-symb.patch b/meta/recipes-connectivity/connman/connman/0001-plugin.h-Change-visibility-to-default-for-debug-symb.patch
> deleted file mode 100644
> index e6f03e6..0000000
> --- a/meta/recipes-connectivity/connman/connman/0001-plugin.h-Change-visibility-to-default-for-debug-symb.patch
> +++ /dev/null
> @@ -1,35 +0,0 @@
> -From 4ddaf78dad5a9ee4a0658235f71b75132192123e Mon Sep 17 00:00:00 2001
> -From: Khem Raj <raj.khem@gmail.com (mailto:raj.khem@gmail.com)>
> -Date: Sat, 7 Apr 2012 18:52:12 -0700
> -Subject: [PATCH] plugin.h: Change visibility to default for debug symbols
> -
> -gold refuses to link in undefined weak symbols which
> -have hidden visibility
> -
> -Signed-off-by: Khem Raj <raj.khem@gmail.com (mailto:raj.khem@gmail.com)>
> -
> -
> -Upstream-Status: Pending
> ----
> - include/plugin.h | 4 ++--
> - 1 files changed, 2 insertions(+), 2 deletions(-)
> -
> -diff --git a/include/plugin.h b/include/plugin.h
> -index 692a4e5..a9361c3 100644
> ---- a/include/plugin.h
> -+++ b/include/plugin.h
> -@@ -89,9 +89,9 @@ struct connman_plugin_desc {
> - #else
> - #define CONNMAN_PLUGIN_DEFINE(name, description, version, priority, init, exit) \
> - extern struct connman_debug_desc __start___debug[] \
> -- __attribute__ ((weak, visibility("hidden"))); \
> -+ __attribute__ ((weak, visibility("default"))); \
> - extern struct connman_debug_desc __stop___debug[] \
> -- __attribute__ ((weak, visibility("hidden"))); \
> -+ __attribute__ ((weak, visibility("default"))); \
> - extern struct connman_plugin_desc connman_plugin_desc \
> - __attribute__ ((visibility("default"))); \
> - struct connman_plugin_desc connman_plugin_desc = { \
> --- 
> -1.7.5.4
> -
> diff --git a/meta/recipes-connectivity/connman/connman/disable_alg-test.patch b/meta/recipes-connectivity/connman/connman/disable_alg-test.patch
> deleted file mode 100644
> index f5cea00..0000000
> --- a/meta/recipes-connectivity/connman/connman/disable_alg-test.patch
> +++ /dev/null
> @@ -1,46 +0,0 @@
> -From 3ebba424d56919018733064ad9e0ab8790d2bf1d Mon Sep 17 00:00:00 2001
> -From: Otavio Salvador <otavio@ossystems.com.br (mailto:otavio@ossystems.com.br)>
> -Date: Fri, 16 Dec 2011 19:31:59 -0200
> -Subject: [PATCH] Disable building of alg-test
> -
> -alg-test utility depends on linux/if_alg.h header that is only
> -available on kernels >= 2.6.39.
> -
> -Upstream-Status: Inappropriate [configuration]
> -
> -Signed-off-by: Otavio Salvador <otavio@ossystems.com.br (mailto:otavio@ossystems.com.br)>
> ----
> - Makefile.am (http://Makefile.am) | 2 +-
> - configure.ac (http://configure.ac) | 3 ---
> - 2 files changed, 1 insertions(+), 4 deletions(-)
> -
> -diff --git a/Makefile.am (http://Makefile.am) b/Makefile.am (http://Makefile.am)
> -index a6509f1..93618a3 100644
> ---- a/Makefile.am (http://Makefile.am)
> -+++ b/Makefile.am (http://Makefile.am)
> -@@ -145,7 +145,7 @@ noinst_PROGRAMS += tools/wispr tools/supplicant-test \
> - tools/dbus-test tools/polkit-test \
> - tools/iptables-test tools/tap-test tools/wpad-test \
> - tools/stats-tool tools/private-network-test \
> -- tools/alg-test unit/test-session unit/test-ippool \
> -+ unit/test-session unit/test-ippool \
> - unit/test-nat
> - 
> - tools_wispr_SOURCES = $(gweb_sources) tools/wispr.c
> -diff --git a/configure.ac (http://configure.ac) b/configure.ac (http://configure.ac)
> -index 3dca02e..3b2da4d 100644
> ---- a/configure.ac (http://configure.ac)
> -+++ b/configure.ac (http://configure.ac)
> -@@ -419,9 +419,6 @@ if (test "${enable_tools}" = "yes"); then
> - AC_MSG_ERROR(GnuTLS library is required))
> - AC_SUBST(GNUTLS_CFLAGS)
> - AC_SUBST(GNUTLS_LIBS)
> --
> -- AC_CHECK_HEADERS(linux/if_alg.h, dummy=yes,
> -- AC_MSG_ERROR(User-space algorithm header files are required))
> - fi
> - AM_CONDITIONAL(TOOLS, test "${enable_tools}" = "yes")
> - 
> --- 
> -1.7.9.1
> -
> diff --git a/meta/recipes-connectivity/connman/connman/ethernet_default.patch b/meta/recipes-connectivity/connman/connman/ethernet_default.patch
> deleted file mode 100644
> index 6dae2aa..0000000
> --- a/meta/recipes-connectivity/connman/connman/ethernet_default.patch
> +++ /dev/null
> @@ -1,22 +0,0 @@
> -Default to enabling the ethernet interface. If we don't do this, connman
> -will shut down all the networking when it starts without any configuration
> -which is usualy not what the users expects. This is particularly
> -problematic with our qemu images and runtime testing using qemu.
> -
> -Upstream-Status: Inappropriate [Configuration]
> -
> -RP 2011/12/12
> -
> -Index: git/src/storage.c
> -===================================================================
> ---- git.orig/src/storage.c 2011-12-12 16:14:10.892316565 +0000
> -+++ git/src/storage.c 2011-12-12 16:14:13.788316431 +0000
> -@@ -367,7 +367,7 @@
> - "Enable", FALSE);
> - 
> - g_key_file_set_boolean(keyfile, "Wired",
> -- "Enable", FALSE);
> -+ "Enable", TRUE);
> - 
> - g_key_file_set_boolean(keyfile, "3G",
> - "Enable", FALSE);
> diff --git a/meta/recipes-connectivity/connman/connman/test-set-ipv4-method-api-fix.patch b/meta/recipes-connectivity/connman/connman/test-set-ipv4-method-api-fix.patch
> deleted file mode 100644
> index 78eb19a..0000000
> --- a/meta/recipes-connectivity/connman/connman/test-set-ipv4-method-api-fix.patch
> +++ /dev/null
> @@ -1,50 +0,0 @@
> -From 0b817dd3096f5c3ca8f0b868ee55ea550054137b Mon Sep 17 00:00:00 2001
> -From: Daniel Wagner <daniel.wagner@bmw-carit.de (mailto:daniel.wagner@bmw-carit.de)>
> -Date: Mon, 19 Mar 2012 14:03:27 +0100
> -Subject: [PATCH 3/3] set-ipv4-method: The arguments have to be wrapped into a
> - variant
> -
> -Fixes BMC#24986
> -
> -Upstream-Status: Backport
> -
> -Signed-off-by: Otavio Salvador <otavio@ossystems.com.br (mailto:otavio@ossystems.com.br)>
> ----
> - test/set-ipv4-method | 11 +++++++----
> - 1 file changed, 7 insertions(+), 4 deletions(-)
> -
> -diff --git a/test/set-ipv4-method b/test/set-ipv4-method
> -index 820b24b..235113f 100755
> ---- a/test/set-ipv4-method
> -+++ b/test/set-ipv4-method
> -@@ -3,6 +3,9 @@
> - import sys
> - import dbus
> - 
> -+def make_variant(string):
> -+ return dbus.String(string, variant_level=1)
> -+
> - def print_usage():
> - print "Usage: %s <service> [off|dhcp|manual <address> [netmask] [gateway]]" % (sys.argv[0])
> - 
> -@@ -20,13 +23,13 @@ properties = service.GetProperties()
> - 
> - print "Setting method %s for %s" % (sys.argv[2], sys.argv[1])
> - 
> --ipv4_configuration = { "Method": sys.argv[2] }
> -+ipv4_configuration = { "Method": make_variant(sys.argv[2]) }
> - if (len(sys.argv) > 3):
> -- ipv4_configuration["Address"] = sys.argv[3]
> -+ ipv4_configuration["Address"] = make_variant(sys.argv[3])
> - if (len(sys.argv) > 4):
> -- ipv4_configuration["Netmask"] = sys.argv[4]
> -+ ipv4_configuration["Netmask"] = make_variant(sys.argv[4])
> - if (len(sys.argv) > 5):
> -- ipv4_configuration["Gateway"] = sys.argv[5]
> -+ ipv4_configuration["Gateway"] = make_variant(sys.argv[5])
> - 
> - service.SetProperty("IPv4.Configuration", ipv4_configuration)
> - print "New IPv4.Configuration: ", ipv4_configuration
> --- 
> -1.7.9.5
> -
> diff --git a/meta/recipes-connectivity/connman/connman/test-set-ipv6-method-api-fix.patch b/meta/recipes-connectivity/connman/connman/test-set-ipv6-method-api-fix.patch
> deleted file mode 100644
> index 773127b..0000000
> --- a/meta/recipes-connectivity/connman/connman/test-set-ipv6-method-api-fix.patch
> +++ /dev/null
> @@ -1,55 +0,0 @@
> -From 2885e71c9c0df7ea9866e91ab79d255eaa8de53d Mon Sep 17 00:00:00 2001
> -From: Daniel Wagner <daniel.wagner@bmw-carit.de (mailto:daniel.wagner@bmw-carit.de)>
> -Date: Mon, 19 Mar 2012 14:03:28 +0100
> -Subject: [PATCH 2/3] set-ipv6-method: The arguments have to be wrapped into a
> - variant
> -
> -Fixes BMC#24986
> -
> -Upstream-Status: Backport
> -
> -Signed-off-by: Otavio Salvador <otavio@ossystems.com.br (mailto:otavio@ossystems.com.br)>
> ----
> - test/set-ipv6-method | 13 ++++++++-----
> - 1 file changed, 8 insertions(+), 5 deletions(-)
> -
> -diff --git a/test/set-ipv6-method b/test/set-ipv6-method
> -index 7f60b88..4f2de09 100755
> ---- a/test/set-ipv6-method
> -+++ b/test/set-ipv6-method
> -@@ -3,6 +3,9 @@
> - import sys
> - import dbus
> - 
> -+def make_variant(string):
> -+ return dbus.String(string, variant_level=1)
> -+
> - def print_usage():
> - print "Usage: %s <service> off|manual|auto [<address> [prefixlen] [gateway]] [<privacy>]" % (sys.argv[0])
> - 
> -@@ -19,17 +22,17 @@ properties = service.GetProperties()
> - 
> - print "Setting method %s for %s" % (sys.argv[2], sys.argv[1])
> - 
> --ipv6_configuration = { "Method": sys.argv[2] }
> -+ipv6_configuration = { "Method": make_variant(sys.argv[2])}
> - if sys.argv[2] == "auto":
> - if (len(sys.argv) > 3):
> -- ipv6_configuration["Privacy"] = sys.argv[3]
> -+ ipv6_configuration["Privacy"] = make_variant(sys.argv[3])
> - else:
> - if (len(sys.argv) > 3):
> -- ipv6_configuration["Address"] = sys.argv[3]
> -+ ipv6_configuration["Address"] = make_variant(sys.argv[3])
> - if (len(sys.argv) > 4):
> -- ipv6_configuration["PrefixLength"] = sys.argv[4]
> -+ ipv6_configuration["PrefixLength"] = make_variant(sys.argv[4])
> - if (len(sys.argv) > 5):
> -- ipv6_configuration["Gateway"] = sys.argv[5]
> -+ ipv6_configuration["Gateway"] = make_variant(sys.argv[5])
> - 
> - service.SetProperty("IPv6.Configuration", ipv6_configuration)
> - print "New IPv6.Configuration: ", ipv6_configuration
> --- 
> -1.7.9.5
> -
> diff --git a/meta/recipes-connectivity/connman/connman_0.79.bb b/meta/recipes-connectivity/connman/connman_0.79.bb
> deleted file mode 100644
> index ec3d147..0000000
> --- a/meta/recipes-connectivity/connman/connman_0.79.bb
> +++ /dev/null
> @@ -1,14 +0,0 @@
> -require connman.inc
> -
> -# 0.79 tag
> -SRCREV = "442b1fe603e005814f592a3dbcf0d0bfb13f961c"
> -SRC_URI = "git://git.kernel.org/pub/scm/network/connman/connman.git (http://git.kernel.org/pub/scm/network/connman/connman.git) \
> - file://add_xuser_dbus_permission.patch \
> - file://ethernet_default.patch \
> - file://disable_alg-test.patch \
> - file://0001-plugin.h-Change-visibility-to-default-for-debug-symb.patch \
> - file://test-set-ipv4-method-api-fix.patch \
> - file://test-set-ipv6-method-api-fix.patch \
> - file://connman"
> -S = "${WORKDIR}/git"
> -PR = "r5"
> diff --git a/meta/recipes-connectivity/connman/connman_1.0.bb b/meta/recipes-connectivity/connman/connman_1.0.bb
> new file mode 100644
> index 0000000..a85a77e
> --- /dev/null
> +++ b/meta/recipes-connectivity/connman/connman_1.0.bb
> @@ -0,0 +1,9 @@
> +require connman.inc
> +
> +# 0.94 tag
> +SRCREV = "6d6f312fb2b751b4cf7037f2a526c7785364732f"
> +SRC_URI = "git://git.kernel.org/pub/scm/network/connman/connman.git (http://git.kernel.org/pub/scm/network/connman/connman.git) \
> + file://add_xuser_dbus_permission.patch \
> + file://connman"
> +S = "${WORKDIR}/git"
> +PR = "r1"
> -- 
> 1.7.5.4
> 
> 
> _______________________________________________
> Openembedded-core mailing list
> Openembedded-core@lists.openembedded.org (mailto:Openembedded-core@lists.openembedded.org)
> http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-core





