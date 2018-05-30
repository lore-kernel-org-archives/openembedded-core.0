Return-Path: <nick83ola@gmail.com>
Received: from mail-ot0-f193.google.com (mail-ot0-f193.google.com
	[74.125.82.193])
	by mail.openembedded.org (Postfix) with ESMTP id 3499C74D49
	for <openembedded-core@lists.openembedded.org>;
	Wed, 30 May 2018 13:51:39 +0000 (UTC)
Received: by mail-ot0-f193.google.com with SMTP id h6-v6so2125036otj.0
	for <openembedded-core@lists.openembedded.org>;
	Wed, 30 May 2018 06:51:41 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=mime-version:from:date:message-id:subject:to;
	bh=bmiWn/s74NRYCig3mjIj10qs7hE1hWsnbcLhr8E6Cdw=;
	b=JceWERqDbVyrjAcPHkTynvmaVpL/WaYFTP0Az6bQzHbWtckThR9MnpP56PMfB9Lrz8
	t/vS+sFzJHrSTKIwfQinHFdl3RTYDCBopwWBK/IP7+OfHZEGRtGJh1Pwp/zlPyKGgCbc
	HqvIjvJnu1uxHMoZcBNIHh+MoX6k5pZ+LVYBQFcaF/7DorXeq/kx7YRRRhafi1k6KpCT
	jLae6Yf7d3EvMiNT/H4iHSDSRqZ3YL1fjCxRRh7IzefU9/7xjU85tqiDSdt7q/KMqYsS
	5HtKBBr1PdKszWJdkkrelZXIx86oZ/dGFbXCI9p+yMRfEF6fCDBTbBWceBrYipnvNpdB
	+ZHg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:from:date:message-id:subject:to;
	bh=bmiWn/s74NRYCig3mjIj10qs7hE1hWsnbcLhr8E6Cdw=;
	b=G4P2wrw2jrepeOyAkSK6eBIzwGzQcJ8IMyD4ppQGCeh6zpZMLqK4jdEllnqT52SZiF
	ep561FMKAlIE5nm2mJbWpmwubyfdSqeZ30UT6hlZO/j1afoOqHzpgw9MhM0xK7OkPqPa
	9kKK8uktDQqdmziWbE0t3FJPTcgjshERoqyioflUZ1Cs6b+MpSpteh2l0/qzopNk/Hph
	1V1H/qLh8lfziNQE898zxmeq1evbDodWqG4JXPPzZfgQixdHs/RVqkztOkJEUBq74sjG
	snzNtfN06xbRkU9khJ992gQeiSDt4uuSvKeHMotFZpacgKXJLXrTn6zG5VmKvnE1SrvE
	ZB0g==
X-Gm-Message-State: ALKqPwe4k7Wv/TDHbFZk4Q84ogtndJfYpVXmhLpf2SjCysPr8zX2/YDc
	yT0B8QXgH4i3s7n5c4DLAgR2qIe+k7+hg/DMqOo6qQ==
X-Google-Smtp-Source: ADUXVKKUADXaSRBBlqLI6GHtsWuWTHAxw3vLzw4SP2F7JFPXxCzdGtB8uS1mLzkPxs/x3CG3yfgC89f3HH9PMTj6DF8=
X-Received: by 2002:a9d:2c7:: with SMTP id 65-v6mr1944456otl.71.1527688300694; 
	Wed, 30 May 2018 06:51:40 -0700 (PDT)
MIME-Version: 1.0
Received: by 2002:a9d:2927:0:0:0:0:0 with HTTP; Wed, 30 May 2018 06:51:20
	-0700 (PDT)
From: nick83ola <nick83ola@gmail.com>
Date: Wed, 30 May 2018 14:51:20 +0100
Message-ID: <CABPh3UM7sBjU3rhDQ+-nJrXYrQF1Kf=NsFhaAp35o3sDn+fBNw@mail.gmail.com>
To: openembedded-core@lists.openembedded.org
Subject: [PATCH] hostapd defconfig: update defconfig from 2.6 hostapd package
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
X-List-Received-Date: Wed, 30 May 2018 13:51:40 -0000
Content-Type: text/plain; charset="UTF-8"

hostapd defconfig: update defconfig from 2.6 hostapd package

the previous implementation of this recipe use a very old
defconfig from hostapd 0.7.3
Update it with the latest version and add some option
from debian defconfig

Signed-off-by: Nicola Lunghi <nicola.lunghi@jci.com>
---
 .../hostapd/hostapd/defconfig                 | 273 +++++++++++++++---
 1 file changed, 236 insertions(+), 37 deletions(-)

diff --git a/meta-oe/recipes-connectivity/hostapd/hostapd/defconfig
b/meta-oe/recipes-connectivity/hostapd/hostapd/defconfig
index 278964017..f958db431 100644
--- a/meta-oe/recipes-connectivity/hostapd/hostapd/defconfig
+++ b/meta-oe/recipes-connectivity/hostapd/hostapd/defconfig
@@ -15,30 +15,33 @@ CONFIG_DRIVER_HOSTAP=y
 # Driver interface for wired authenticator
 CONFIG_DRIVER_WIRED=y

-# Driver interface for madwifi driver
-#CONFIG_DRIVER_MADWIFI=y
-#CFLAGS += -I../../madwifi # change to the madwifi source directory
-
-# Driver interface for Prism54 driver
-CONFIG_DRIVER_PRISM54=y
-
 # Driver interface for drivers using the nl80211 kernel interface
 CONFIG_DRIVER_NL80211=y
+
+# QCA vendor extensions to nl80211
+CONFIG_DRIVER_NL80211_QCA=y
+
+# driver_nl80211.c requires libnl. If you are compiling it yourself
+# you may need to point hostapd to your version of libnl.
+#
+#CFLAGS += -I$<path to libnl include files>
+#LIBS += -L$<path to libnl library files>
+
+# Use libnl v2.0 (or 3.0) libraries.
+#CONFIG_LIBNL20=y
+
+# Use libnl 3.2 libraries (if this is selected, CONFIG_LIBNL20 is ignored)
 CONFIG_LIBNL32=y
-# driver_nl80211.c requires a rather new libnl (version 1.1) which may not be
-# shipped with your distribution yet. If that is the case, you need to build
-# newer libnl version and point the hostapd build to use it.
-#LIBNL=/usr/src/libnl
-#CFLAGS += -I$(LIBNL)/include
-#LIBS += -L$(LIBNL)/lib

 # Driver interface for FreeBSD net80211 layer (e.g., Atheros driver)
 #CONFIG_DRIVER_BSD=y
 #CFLAGS += -I/usr/local/include
 #LIBS += -L/usr/local/lib
+#LIBS_p += -L/usr/local/lib
+#LIBS_c += -L/usr/local/lib

 # Driver interface for no driver (e.g., RADIUS server only)
-#CONFIG_DRIVER_NONE=y
+CONFIG_DRIVER_NONE=y

 # IEEE 802.11F/IAPP
 CONFIG_IAPP=y
@@ -50,14 +53,14 @@ CONFIG_RSN_PREAUTH=y
 CONFIG_PEERKEY=y

 # IEEE 802.11w (management frame protection)
-# This version is an experimental implementation based on IEEE 802.11w/D1.0
-# draft and is subject to change since the standard has not yet been finalized.
-# Driver support is also needed for IEEE 802.11w.
-#CONFIG_IEEE80211W=y
+CONFIG_IEEE80211W=y

 # Integrated EAP server
 CONFIG_EAP=y

+# EAP Re-authentication Protocol (ERP) in integrated EAP server
+CONFIG_ERP=y
+
 # EAP-MD5 for the integrated EAP server
 CONFIG_EAP_MD5=y

@@ -77,46 +80,53 @@ CONFIG_EAP_GTC=y
 CONFIG_EAP_TTLS=y

 # EAP-SIM for the integrated EAP server
-#CONFIG_EAP_SIM=y
+CONFIG_EAP_SIM=y

 # EAP-AKA for the integrated EAP server
-#CONFIG_EAP_AKA=y
+CONFIG_EAP_AKA=y

 # EAP-AKA' for the integrated EAP server
 # This requires CONFIG_EAP_AKA to be enabled, too.
-#CONFIG_EAP_AKA_PRIME=y
+CONFIG_EAP_AKA_PRIME=y

 # EAP-PAX for the integrated EAP server
-#CONFIG_EAP_PAX=y
+CONFIG_EAP_PAX=y

 # EAP-PSK for the integrated EAP server (this is _not_ needed for WPA-PSK)
-#CONFIG_EAP_PSK=y
+CONFIG_EAP_PSK=y
+
+# EAP-pwd for the integrated EAP server (secure authentication with a password)
+CONFIG_EAP_PWD=y

 # EAP-SAKE for the integrated EAP server
-#CONFIG_EAP_SAKE=y
+CONFIG_EAP_SAKE=y

 # EAP-GPSK for the integrated EAP server
-#CONFIG_EAP_GPSK=y
+CONFIG_EAP_GPSK=y
 # Include support for optional SHA256 cipher suite in EAP-GPSK
-#CONFIG_EAP_GPSK_SHA256=y
+CONFIG_EAP_GPSK_SHA256=y

 # EAP-FAST for the integrated EAP server
-# Note: Default OpenSSL package does not include support for all the
-# functionality needed for EAP-FAST. If EAP-FAST is enabled with OpenSSL,
-# the OpenSSL library must be patched (openssl-0.9.9-session-ticket.patch)
-# to add the needed functions.
-#CONFIG_EAP_FAST=y
+# Note: If OpenSSL is used as the TLS library, OpenSSL 1.0 or newer is needed
+# for EAP-FAST support. Older OpenSSL releases would need to be patched, e.g.,
+# with openssl-0.9.8x-tls-extensions.patch, to add the needed functions.
+CONFIG_EAP_FAST=y

 # Wi-Fi Protected Setup (WPS)
 CONFIG_WPS=y
 # Enable UPnP support for external WPS Registrars
-#CONFIG_WPS_UPNP=y
+CONFIG_WPS_UPNP=y
+# Enable WPS support with NFC config method
+CONFIG_WPS_NFC=y

 # EAP-IKEv2
-#CONFIG_EAP_IKEV2=y
+CONFIG_EAP_IKEV2=y

 # Trusted Network Connect (EAP-TNC)
-#CONFIG_EAP_TNC=y
+CONFIG_EAP_TNC=y
+
+# EAP-EKE for the integrated EAP server
+CONFIG_EAP_EKE=y

 # PKCS#12 (PFX) support (used to read private key and certificate file from
 # a file that usually has extension .p12 or .pfx)
@@ -130,16 +140,205 @@ CONFIG_RADIUS_SERVER=y
 CONFIG_IPV6=y

 # IEEE Std 802.11r-2008 (Fast BSS Transition)
-#CONFIG_IEEE80211R=y
+CONFIG_IEEE80211R=y

 # Use the hostapd's IEEE 802.11 authentication (ACL), but without
-# the IEEE 802.11 Management capability (e.g., madwifi or FreeBSD/net80211)
-CONFIG_DRIVER_RADIUS_ACL=y
+# the IEEE 802.11 Management capability (e.g., FreeBSD/net80211)
+#CONFIG_DRIVER_RADIUS_ACL=y

 # IEEE 802.11n (High Throughput) support
 CONFIG_IEEE80211N=y

+# Wireless Network Management (IEEE Std 802.11v-2011)
+# Note: This is experimental and not complete implementation.
+CONFIG_WNM=y
+
+# IEEE 802.11ac (Very High Throughput) support
+CONFIG_IEEE80211AC=y
+
 # Remove debugging code that is printing out debug messages to stdout.
 # This can be used to reduce the size of the hostapd considerably if debugging
 # code is not needed.
 #CONFIG_NO_STDOUT_DEBUG=y
+
+# Add support for writing debug log to a file: -f /tmp/hostapd.log
+# Disabled by default.
+CONFIG_DEBUG_FILE=y
+
+# Add support for sending all debug messages (regardless of debug verbosity)
+# to the Linux kernel tracing facility. This helps debug the entire stack by
+# making it easy to record everything happening from the driver up into the
+# same file, e.g., using trace-cmd.
+CONFIG_DEBUG_LINUX_TRACING=y
+
+# Remove support for RADIUS accounting
+#CONFIG_NO_ACCOUNTING=y
+
+# Remove support for RADIUS
+#CONFIG_NO_RADIUS=y
+
+# Remove support for VLANs
+#CONFIG_NO_VLAN=y
+
+# Enable support for fully dynamic VLANs. This enables hostapd to
+# automatically create bridge and VLAN interfaces if necessary.
+CONFIG_FULL_DYNAMIC_VLAN=y
+
+# Use netlink-based kernel API for VLAN operations instead of ioctl()
+# Note: This requires libnl 3.1 or newer.
+CONFIG_VLAN_NETLINK=y
+
+# Remove support for dumping internal state through control interface commands
+# This can be used to reduce binary size at the cost of disabling a debugging
+# option.
+#CONFIG_NO_DUMP_STATE=y
+
+# Enable tracing code for developer debugging
+# This tracks use of memory allocations and other registrations and reports
+# incorrect use with a backtrace of call (or allocation) location.
+#CONFIG_WPA_TRACE=y
+# For BSD, comment out these.
+#LIBS += -lexecinfo
+#LIBS_p += -lexecinfo
+#LIBS_c += -lexecinfo
+
+# Use libbfd to get more details for developer debugging
+# This enables use of libbfd to get more detailed symbols for the backtraces
+# generated by CONFIG_WPA_TRACE=y.
+#CONFIG_WPA_TRACE_BFD=y
+# For BSD, comment out these.
+#LIBS += -lbfd -liberty -lz
+#LIBS_p += -lbfd -liberty -lz
+#LIBS_c += -lbfd -liberty -lz
+
+# hostapd depends on strong random number generation being available from the
+# operating system. os_get_random() function is used to fetch random data when
+# needed, e.g., for key generation. On Linux and BSD systems, this works by
+# reading /dev/urandom. It should be noted that the OS entropy pool needs to be
+# properly initialized before hostapd is started. This is important especially
+# on embedded devices that do not have a hardware random number generator and
+# may by default start up with minimal entropy available for random number
+# generation.
+#
+# As a safety net, hostapd is by default trying to internally collect
+# additional entropy for generating random data to mix in with the data
+# fetched from the OS. This by itself is not considered to be very strong, but
+# it may help in cases where the system pool is not initialized properly.
+# However, it is very strongly recommended that the system pool is initialized
+# with enough entropy either by using hardware assisted random number
+# generator or by storing state over device reboots.
+#
+# hostapd can be configured to maintain its own entropy store over restarts to
+# enhance random number generation. This is not perfect, but it is much more
+# secure than using the same sequence of random numbers after every reboot.
+# This can be enabled with -e<entropy file> command line option. The specified
+# file needs to be readable and writable by hostapd.
+#
+# If the os_get_random() is known to provide strong random data (e.g., on
+# Linux/BSD, the board in question is known to have reliable source of random
+# data from /dev/urandom), the internal hostapd random pool can be disabled.
+# This will save some in binary size and CPU use. However, this should only be
+# considered for builds that are known to be used on devices that meet the
+# requirements described above.
+#CONFIG_NO_RANDOM_POOL=y
+
+# Should we use poll instead of select? Select is used by default.
+#CONFIG_ELOOP_POLL=y
+
+# Should we use epoll instead of select? Select is used by default.
+#CONFIG_ELOOP_EPOLL=y
+
+# Should we use kqueue instead of select? Select is used by default.
+#CONFIG_ELOOP_KQUEUE=y
+
+# Select TLS implementation
+# openssl = OpenSSL (default)
+# gnutls = GnuTLS
+# internal = Internal TLSv1 implementation (experimental)
+# none = Empty template
+CONFIG_TLS=openssl
+
+# TLS-based EAP methods require at least TLS v1.0. Newer version of TLS (v1.1)
+# can be enabled to get a stronger construction of messages when block ciphers
+# are used.
+CONFIG_TLSV11=y
+
+# TLS-based EAP methods require at least TLS v1.0. Newer version of TLS (v1.2)
+# can be enabled to enable use of stronger crypto algorithms.
+CONFIG_TLSV12=y
+
+# If CONFIG_TLS=internal is used, additional library and include paths are
+# needed for LibTomMath. Alternatively, an integrated, minimal version of
+# LibTomMath can be used. See beginning of libtommath.c for details on benefits
+# and drawbacks of this option.
+#CONFIG_INTERNAL_LIBTOMMATH=y
+#ifndef CONFIG_INTERNAL_LIBTOMMATH
+#LTM_PATH=/usr/src/libtommath-0.39
+#CFLAGS += -I$(LTM_PATH)
+#LIBS += -L$(LTM_PATH)
+#LIBS_p += -L$(LTM_PATH)
+#endif
+# At the cost of about 4 kB of additional binary size, the internal LibTomMath
+# can be configured to include faster routines for exptmod, sqr, and div to
+# speed up DH and RSA calculation considerably
+#CONFIG_INTERNAL_LIBTOMMATH_FAST=y
+
+# Interworking (IEEE 802.11u)
+# This can be used to enable functionality to improve interworking with
+# external networks.
+CONFIG_INTERWORKING=y
+
+# Hotspot 2.0
+#CONFIG_HS20=y
+
+# Enable SQLite database support in hlr_auc_gw, EAP-SIM DB, and eap_user_file
+#CONFIG_SQLITE=y
+
+# Enable Fast Session Transfer (FST)
+#CONFIG_FST=y
+
+# Enable CLI commands for FST testing
+#CONFIG_FST_TEST=y
+
+# Testing options
+# This can be used to enable some testing options (see also the example
+# configuration file) that are really useful only for testing clients that
+# connect to this hostapd. These options allow, for example, to drop a
+# certain percentage of probe requests or auth/(re)assoc frames.
+#
+#CONFIG_TESTING_OPTIONS=y
+
+# Automatic Channel Selection
+# This will allow hostapd to pick the channel automatically when channel is set
+# to "acs_survey" or "0". Eventually, other ACS algorithms can be added in
+# similar way.
+#
+# Automatic selection is currently only done through initialization, later on
+# we hope to do background checks to keep us moving to more ideal channels as
+# time goes by. ACS is currently only supported through the nl80211 driver and
+# your driver must have survey dump capability that is filled by the driver
+# during scanning.
+#
+# You can customize the ACS survey algorithm with the hostapd.conf variable
+# acs_num_scans.
+#
+# Supported ACS drivers:
+# * ath9k
+# * ath5k
+# * ath10k
+#
+# For more details refer to:
+# http://wireless.kernel.org/en/users/Documentation/acs
+#
+CONFIG_ACS=y
+
+# Multiband Operation support
+# These extentions facilitate efficient use of multiple frequency bands
+# available to the AP and the devices that may associate with it.
+CONFIG_MBO=y
+
+# Client Taxonomy
+# Has the AP retain the Probe Request and (Re)Association Request frames from
+# a client, from which a signature can be produced which can identify the model
+# of client device like "Nexus 6P" or "iPhone 5s".
+#CONFIG_TAXONOMY=y
-- 
2.17.0

