Return-Path: <akuster808@gmail.com>
Received: from mail-pa0-f65.google.com (mail-pa0-f65.google.com
	[209.85.220.65])
	by mail.openembedded.org (Postfix) with ESMTP id 0472476E3F
	for <openembedded-core@lists.openembedded.org>;
	Tue,  9 Aug 2016 23:44:18 +0000 (UTC)
Received: by mail-pa0-f65.google.com with SMTP id cf3so1700888pad.2
	for <openembedded-core@lists.openembedded.org>;
	Tue, 09 Aug 2016 16:44:19 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=from:to:subject:date:message-id;
	bh=+Dp3OGwbDrhMikNWbnm7KN5ECdFJBCXYAKB59/XO644=;
	b=C5aP6oJ8w7pD0rdIIYRf3kq+x5QbMKReXhUPgndH8VqGOYhm4QxRgvs+y/zIc83T+m
	ZQv+Twu1vpYJ/dYFHzJJF7fURjG3LuYbYSifvkGjIC/aMcI4HQT/O4yhlLZ99a+Wk8AA
	C8DuTmM16Llqkcssi6EC+G4Gvof5RWEzwCXcw0pzOpOwpxf/fzNe4QFuvMYYsm9gEYlG
	M9JHWK4WozpIjaXIgMTWFoh67uHAGW9Zl0OIB+KExGSeKvqvbT0RKB7d0eJcwHVw4EkO
	67illKU25RF98SWektLVF8gTw12qpBKx5eCsOV6uqQ9Wcn8II9JFGQSH2rhuettgcrpC
	0q9w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:from:to:subject:date:message-id;
	bh=+Dp3OGwbDrhMikNWbnm7KN5ECdFJBCXYAKB59/XO644=;
	b=Tkk7rjUv585crOdtCRLWGwjRHSmYvGSPcJju9W4K9uJqOFtzA9V6unEXRtgPDJSzZs
	IKNyAKCAe6tr9IHLMen9JI5xbG1xQP04HwNVKKAsJbVKzOcKQ5FjeLZa/oeK4DN6KhkO
	ht7uuE51wLXWFOJKvXQWU+LiuuKCYKgFAtMVTe9waaJjGnK1W5YSxJZXPt+/VrDZ9di+
	SABYR+Vw1GFP0oVhEEH18ArlOpR1CEnpp1BpxTDmKmJ83/ltibV+ExfSXYD2LmUSJlm+
	upGuMGlF0j3RYt6euKsSuiS8YF6pO7nPixH6IDiI+nVcmjVpn+obBnGLNz/Cf5oLofFE
	UpvA==
X-Gm-Message-State: AEkoouttKpw31vOLWu1afnJCVr3LUvmIFOt51NG3f3omSJSbQKGcuwjBT1M9p4suNg3eQg==
X-Received: by 10.66.248.10 with SMTP id yi10mr1693226pac.31.1470786258575;
	Tue, 09 Aug 2016 16:44:18 -0700 (PDT)
Received: from Pahoa2.mvista.com ([50.233.148.156])
	by smtp.gmail.com with ESMTPSA id
	tm1sm58692798pac.23.2016.08.09.16.44.17
	for <openembedded-core@lists.openembedded.org>
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
	Tue, 09 Aug 2016 16:44:17 -0700 (PDT)
From: Armin Kuster <akuster808@gmail.com>
To: openembedded-core@lists.openembedded.org
Date: Tue,  9 Aug 2016 16:44:16 -0700
Message-Id: <1470786256-25154-1-git-send-email-akuster808@gmail.com>
X-Mailer: git-send-email 2.3.5
Subject: [PATCH][master] curl: Update to 7.50.1
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
X-List-Received-Date: Tue, 09 Aug 2016 23:44:19 -0000

This fixes 3 CVES:

CVE-2016-5419
CVE-2016-5420
CVE-2016-5421

Affects curl <= 7.50.0

Signed-off-by: Armin Kuster <akuster808@gmail.com>
---
 meta/recipes-support/curl/curl_7.49.1.bb | 71 --------------------------------
 meta/recipes-support/curl/curl_7.50.1.bb | 71 ++++++++++++++++++++++++++++++++
 2 files changed, 71 insertions(+), 71 deletions(-)
 delete mode 100644 meta/recipes-support/curl/curl_7.49.1.bb
 create mode 100644 meta/recipes-support/curl/curl_7.50.1.bb

diff --git a/meta/recipes-support/curl/curl_7.49.1.bb b/meta/recipes-support/curl/curl_7.49.1.bb
deleted file mode 100644
index db9dc1a..0000000
--- a/meta/recipes-support/curl/curl_7.49.1.bb
+++ /dev/null
@@ -1,71 +0,0 @@
-SUMMARY = "Command line tool and library for client-side URL transfers"
-HOMEPAGE = "http://curl.haxx.se/"
-BUGTRACKER = "http://curl.haxx.se/mail/list.cgi?list=curl-tracker"
-SECTION = "console/network"
-LICENSE = "MIT"
-LIC_FILES_CHKSUM = "file://COPYING;beginline=8;md5=3a34942f4ae3fbf1a303160714e664ac"
-
-SRC_URI = "http://curl.haxx.se/download/curl-${PV}.tar.bz2 \
-           file://0001-replace-krb5-config-with-pkg-config.patch \
-"
-
-# curl likes to set -g0 in CFLAGS, so we stop it
-# from mucking around with debug options
-#
-SRC_URI += " file://configure_ac.patch"
-
-SRC_URI[md5sum] = "6bb1f7af5b58b30e4e6414b8c1abccab"
-SRC_URI[sha256sum] = "eb63cec4bef692eab9db459033f409533e6d10e20942f4b060b32819e81885f1"
-
-inherit autotools pkgconfig binconfig multilib_header
-
-PACKAGECONFIG ??= "${@bb.utils.contains("DISTRO_FEATURES", "ipv6", "ipv6", "", d)} gnutls proxy zlib"
-PACKAGECONFIG_class-native = "ipv6 proxy ssl zlib"
-PACKAGECONFIG_class-nativesdk = "ipv6 proxy ssl zlib"
-
-PACKAGECONFIG[dict] = "--enable-dict,--disable-dict,"
-PACKAGECONFIG[gnutls] = "--with-gnutls,--without-gnutls,gnutls"
-PACKAGECONFIG[gopher] = "--enable-gopher,--disable-gopher,"
-PACKAGECONFIG[imap] = "--enable-imap,--disable-imap,"
-PACKAGECONFIG[ipv6] = "--enable-ipv6,--disable-ipv6,"
-PACKAGECONFIG[ldap] = "--enable-ldap,--disable-ldap,"
-PACKAGECONFIG[ldaps] = "--enable-ldaps,--disable-ldaps,"
-PACKAGECONFIG[libidn] = "--with-libidn,--without-libidn,libidn"
-PACKAGECONFIG[libssh2] = "--with-libssh2,--without-libssh2,libssh2"
-PACKAGECONFIG[pop3] = "--enable-pop3,--disable-pop3,"
-PACKAGECONFIG[proxy] = "--enable-proxy,--disable-proxy,"
-PACKAGECONFIG[rtmpdump] = "--with-librtmp,--without-librtmp,rtmpdump"
-PACKAGECONFIG[rtsp] = "--enable-rtsp,--disable-rtsp,"
-PACKAGECONFIG[smb] = "--enable-smb,--disable-smb,"
-PACKAGECONFIG[smtp] = "--enable-smtp,--disable-smtp,"
-PACKAGECONFIG[ssl] = "--with-ssl --with-random=/dev/urandom,--without-ssl,openssl"
-PACKAGECONFIG[telnet] = "--enable-telnet,--disable-telnet,"
-PACKAGECONFIG[tftp] = "--enable-tftp,--disable-tftp,"
-PACKAGECONFIG[zlib] = "--with-zlib=${STAGING_LIBDIR}/../,--without-zlib,zlib"
-PACKAGECONFIG[krb5] = "--with-gssapi,--without-gssapi,krb5"
-
-EXTRA_OECONF = " \
-    --enable-crypto-auth \
-    --with-ca-bundle=${sysconfdir}/ssl/certs/ca-certificates.crt \
-    --without-libmetalink \
-    --without-libpsl \
-    --without-nghttp2 \
-"
-
-do_install_append() {
-	oe_multilib_header curl/curlbuild.h
-}
-
-do_install_append_class-target() {
-	# cleanup buildpaths from curl-config
-	sed -i -e 's,${STAGING_DIR_HOST},,g' ${D}${bindir}/curl-config
-}
-
-PACKAGES =+ "lib${BPN}"
-
-FILES_lib${BPN} = "${libdir}/lib*.so.*"
-RRECOMMENDS_lib${BPN} += "ca-certificates"
-
-FILES_${PN} += "${datadir}/zsh"
-
-BBCLASSEXTEND = "native nativesdk"
diff --git a/meta/recipes-support/curl/curl_7.50.1.bb b/meta/recipes-support/curl/curl_7.50.1.bb
new file mode 100644
index 0000000..a21419a
--- /dev/null
+++ b/meta/recipes-support/curl/curl_7.50.1.bb
@@ -0,0 +1,71 @@
+SUMMARY = "Command line tool and library for client-side URL transfers"
+HOMEPAGE = "http://curl.haxx.se/"
+BUGTRACKER = "http://curl.haxx.se/mail/list.cgi?list=curl-tracker"
+SECTION = "console/network"
+LICENSE = "MIT"
+LIC_FILES_CHKSUM = "file://COPYING;beginline=8;md5=3a34942f4ae3fbf1a303160714e664ac"
+
+SRC_URI = "http://curl.haxx.se/download/curl-${PV}.tar.bz2 \
+           file://0001-replace-krb5-config-with-pkg-config.patch \
+"
+
+# curl likes to set -g0 in CFLAGS, so we stop it
+# from mucking around with debug options
+#
+SRC_URI += " file://configure_ac.patch"
+
+SRC_URI[md5sum] = "015f6a0217ca6f2c5442ca406476920b"
+SRC_URI[sha256sum] = "3c12c5f54ccaa1d40abc65d672107dcc75d3e1fcb38c267484334280096e5156"
+
+inherit autotools pkgconfig binconfig multilib_header
+
+PACKAGECONFIG ??= "${@bb.utils.contains("DISTRO_FEATURES", "ipv6", "ipv6", "", d)} gnutls proxy zlib"
+PACKAGECONFIG_class-native = "ipv6 proxy ssl zlib"
+PACKAGECONFIG_class-nativesdk = "ipv6 proxy ssl zlib"
+
+PACKAGECONFIG[dict] = "--enable-dict,--disable-dict,"
+PACKAGECONFIG[gnutls] = "--with-gnutls,--without-gnutls,gnutls"
+PACKAGECONFIG[gopher] = "--enable-gopher,--disable-gopher,"
+PACKAGECONFIG[imap] = "--enable-imap,--disable-imap,"
+PACKAGECONFIG[ipv6] = "--enable-ipv6,--disable-ipv6,"
+PACKAGECONFIG[ldap] = "--enable-ldap,--disable-ldap,"
+PACKAGECONFIG[ldaps] = "--enable-ldaps,--disable-ldaps,"
+PACKAGECONFIG[libidn] = "--with-libidn,--without-libidn,libidn"
+PACKAGECONFIG[libssh2] = "--with-libssh2,--without-libssh2,libssh2"
+PACKAGECONFIG[pop3] = "--enable-pop3,--disable-pop3,"
+PACKAGECONFIG[proxy] = "--enable-proxy,--disable-proxy,"
+PACKAGECONFIG[rtmpdump] = "--with-librtmp,--without-librtmp,rtmpdump"
+PACKAGECONFIG[rtsp] = "--enable-rtsp,--disable-rtsp,"
+PACKAGECONFIG[smb] = "--enable-smb,--disable-smb,"
+PACKAGECONFIG[smtp] = "--enable-smtp,--disable-smtp,"
+PACKAGECONFIG[ssl] = "--with-ssl --with-random=/dev/urandom,--without-ssl,openssl"
+PACKAGECONFIG[telnet] = "--enable-telnet,--disable-telnet,"
+PACKAGECONFIG[tftp] = "--enable-tftp,--disable-tftp,"
+PACKAGECONFIG[zlib] = "--with-zlib=${STAGING_LIBDIR}/../,--without-zlib,zlib"
+PACKAGECONFIG[krb5] = "--with-gssapi,--without-gssapi,krb5"
+
+EXTRA_OECONF = " \
+    --enable-crypto-auth \
+    --with-ca-bundle=${sysconfdir}/ssl/certs/ca-certificates.crt \
+    --without-libmetalink \
+    --without-libpsl \
+    --without-nghttp2 \
+"
+
+do_install_append() {
+	oe_multilib_header curl/curlbuild.h
+}
+
+do_install_append_class-target() {
+	# cleanup buildpaths from curl-config
+	sed -i -e 's,${STAGING_DIR_HOST},,g' ${D}${bindir}/curl-config
+}
+
+PACKAGES =+ "lib${BPN}"
+
+FILES_lib${BPN} = "${libdir}/lib*.so.*"
+RRECOMMENDS_lib${BPN} += "ca-certificates"
+
+FILES_${PN} += "${datadir}/zsh"
+
+BBCLASSEXTEND = "native nativesdk"
-- 
2.3.5


