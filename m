Received: from mail.yoctoproject.org (mail.yoctoproject.org [])
 by mx.groups.io with SMTP id smtpd.web12.5217.1613463848503672594
 for <openembedded-core@lists.openembedded.org>;
 Tue, 16 Feb 2021 00:24:11 -0800
Authentication-Results: mx.groups.io;
 dkim=missing; spf=none, err=permanent DNS error (domain: auh.yoctoproject.org, ip: <nil>, mailfrom: auh@auh.yoctoproject.org)
Received: from [172.29.10.113] (unknown [172.29.10.113])
	by mail.yoctoproject.org (Postfix) with ESMTP id E031038C128F
	for <openembedded-core@lists.openembedded.org>; Tue, 16 Feb 2021 08:24:10 +0000 (UTC)
MIME-Version: 1.0
From: auh@auh.yoctoproject.org
To: Alexander Kanavin <alex.kanavin@gmail.com>
Cc: openembedded-core@lists.openembedded.org
Subject: [AUH] lighttpd: upgrading to 1.4.59 SUCCEEDED
Message-ID: <MADEUP.16642CD2F5902F7E.20265@lists.openembedded.org>
X-Groupsio-MsgNum: 148125
Content-Type: multipart/mixed; boundary="===============7177221626098132204=="

--===============7177221626098132204==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

Hello,

this email is a notification from the Auto Upgrade Helper
that the automatic attempt to upgrade the recipe *lighttpd* to *1.4.59* has Succeeded.

Next steps:
    - apply the patch: git am 0001-lighttpd-upgrade-1.4.58-1.4.59.patch
    - check the changes to upstream patches and summarize them in the commit message,
    - compile an image that contains the package
    - perform some basic sanity tests
    - amend the patch and sign it off: git commit -s --reset-author --amend
    - send it to the appropriate mailing list

Alternatively, if you believe the recipe should not be upgraded at this time,
you can fill RECIPE_NO_UPDATE_REASON in respective recipe file so that
automatic upgrades would no longer be attempted.

Please review the attached files for further information and build/update failures.
Any problem please file a bug at https://bugzilla.yoctoproject.org/enter_bug.cgi?product=Automated%20Update%20Handler

Regards,
The Upgrade Helper

--===============7177221626098132204==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment; filename="buildhistory-diff.txt"

packages/core2-32-poky-linux/lighttpd: PACKAGES: added "lighttpd-module-ajp13"
Changes to packages/core2-32-poky-linux/lighttpd (sysroot):
  /usr/lib/mod_ajp13.so was added

--===============7177221626098132204==
Content-Type: text/x-diff; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment;
 filename="0001-lighttpd-upgrade-1.4.58-1.4.59.patch"

From 0a80dc996bbb8e19a506bf0e01b8bfdba0c6a746 Mon Sep 17 00:00:00 2001
From: Upgrade Helper <auh@auh.yoctoproject.org>
Date: Mon, 15 Feb 2021 22:43:35 +0000
Subject: [PATCH] lighttpd: upgrade 1.4.58 -> 1.4.59

---
 .../lighttpd/{lighttpd_1.4.58.bb => lighttpd_1.4.59.bb}         | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta/recipes-extended/lighttpd/{lighttpd_1.4.58.bb => lighttpd_1.4.59.bb} (97%)

diff --git a/meta/recipes-extended/lighttpd/lighttpd_1.4.58.bb b/meta/recipes-extended/lighttpd/lighttpd_1.4.59.bb
similarity index 97%
rename from meta/recipes-extended/lighttpd/lighttpd_1.4.58.bb
rename to meta/recipes-extended/lighttpd/lighttpd_1.4.59.bb
index f0589e94c0..705ece8e19 100644
--- a/meta/recipes-extended/lighttpd/lighttpd_1.4.58.bb
+++ b/meta/recipes-extended/lighttpd/lighttpd_1.4.59.bb
@@ -19,7 +19,7 @@ SRC_URI = "http://download.lighttpd.net/lighttpd/releases-1.4.x/lighttpd-${PV}.t
         file://0001-Use-pkg-config-for-pcre-dependency-instead-of-config.patch \
         "
 
-SRC_URI[sha256sum] = "267feffda13a190ebdce7b15172d8be16da98008457f30fddecd72832d126d0e"
+SRC_URI[sha256sum] = "fb953db273daef08edb6e202556cae8a3d07eed6081c96bd9903db957d1084d5"
 
 PACKAGECONFIG ??= "openssl pcre zlib \
     ${@bb.utils.filter('DISTRO_FEATURES', 'ipv6', d)} \
-- 
2.17.1


--===============7177221626098132204==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment; filename="buildhistory-diff-full.txt"

packages/core2-32-poky-linux/lighttpd: PACKAGES: added "lighttpd-module-ajp13"
packages/core2-32-poky-linux/lighttpd: PKGV changed from 1.4.58 [default] to 1.4.59 [default]
packages/core2-32-poky-linux/lighttpd: SRC_URI changed from "http://download.lighttpd.net/lighttpd/releases-1.4.x/lighttpd-1.4.58.tar.xz file://index.html.lighttpd file://lighttpd.conf file://lighttpd file://0001-Use-pkg-config-for-pcre-dependency-instead-of-config.patch" to "http://download.lighttpd.net/lighttpd/releases-1.4.x/lighttpd-1.4.59.tar.xz file://index.html.lighttpd file://lighttpd.conf file://lighttpd file://0001-Use-pkg-config-for-pcre-dependency-instead-of-config.patch"
packages/core2-32-poky-linux/lighttpd: PV changed from "1.4.58" to "1.4.59"
packages/core2-32-poky-linux/lighttpd/lighttpd-dbg: PKGV changed from 1.4.58 [default] to 1.4.59 [default]
packages/core2-32-poky-linux/lighttpd/lighttpd-dbg: PV changed from "1.4.58" to "1.4.59"
packages/core2-32-poky-linux/lighttpd/lighttpd-dbg: PKGSIZE changed from 2686380 to 2738404 (+2%)
packages/core2-32-poky-linux/lighttpd/lighttpd-dev: PKGV changed from 1.4.58 [default] to 1.4.59 [default]
packages/core2-32-poky-linux/lighttpd/lighttpd-dev: PV changed from "1.4.58" to "1.4.59"
packages/core2-32-poky-linux/lighttpd/lighttpd-doc: PKGV changed from 1.4.58 [default] to 1.4.59 [default]
packages/core2-32-poky-linux/lighttpd/lighttpd-doc: PV changed from "1.4.58" to "1.4.59"
packages/core2-32-poky-linux/lighttpd/lighttpd-locale: PKGV changed from 1.4.58 [default] to 1.4.59 [default]
packages/core2-32-poky-linux/lighttpd/lighttpd-locale: PV changed from "1.4.58" to "1.4.59"
packages/core2-32-poky-linux/lighttpd/lighttpd-module-access: PKGV changed from 1.4.58 [default] to 1.4.59 [default]
packages/core2-32-poky-linux/lighttpd/lighttpd-module-access: PV changed from "1.4.58" to "1.4.59"
packages/core2-32-poky-linux/lighttpd/lighttpd-module-accesslog: PKGV changed from 1.4.58 [default] to 1.4.59 [default]
packages/core2-32-poky-linux/lighttpd/lighttpd-module-accesslog: PV changed from "1.4.58" to "1.4.59"
packages/core2-32-poky-linux/lighttpd/lighttpd-module-alias: PKGV changed from 1.4.58 [default] to 1.4.59 [default]
packages/core2-32-poky-linux/lighttpd/lighttpd-module-alias: PV changed from "1.4.58" to "1.4.59"
packages/core2-32-poky-linux/lighttpd/lighttpd-module-auth: PKGV changed from 1.4.58 [default] to 1.4.59 [default]
packages/core2-32-poky-linux/lighttpd/lighttpd-module-auth: PV changed from "1.4.58" to "1.4.59"
packages/core2-32-poky-linux/lighttpd/lighttpd-module-authn-file: PKGV changed from 1.4.58 [default] to 1.4.59 [default]
packages/core2-32-poky-linux/lighttpd/lighttpd-module-authn-file: PV changed from "1.4.58" to "1.4.59"
packages/core2-32-poky-linux/lighttpd/lighttpd-module-cgi: PKGV changed from 1.4.58 [default] to 1.4.59 [default]
packages/core2-32-poky-linux/lighttpd/lighttpd-module-cgi: PV changed from "1.4.58" to "1.4.59"
packages/core2-32-poky-linux/lighttpd/lighttpd-module-deflate: PKGV changed from 1.4.58 [default] to 1.4.59 [default]
packages/core2-32-poky-linux/lighttpd/lighttpd-module-deflate: PV changed from "1.4.58" to "1.4.59"
packages/core2-32-poky-linux/lighttpd/lighttpd-module-dirlisting: PKGV changed from 1.4.58 [default] to 1.4.59 [default]
packages/core2-32-poky-linux/lighttpd/lighttpd-module-dirlisting: PV changed from "1.4.58" to "1.4.59"
packages/core2-32-poky-linux/lighttpd/lighttpd-module-evasive: PKGV changed from 1.4.58 [default] to 1.4.59 [default]
packages/core2-32-poky-linux/lighttpd/lighttpd-module-evasive: PV changed from "1.4.58" to "1.4.59"
packages/core2-32-poky-linux/lighttpd/lighttpd-module-evhost: PKGV changed from 1.4.58 [default] to 1.4.59 [default]
packages/core2-32-poky-linux/lighttpd/lighttpd-module-evhost: PV changed from "1.4.58" to "1.4.59"
packages/core2-32-poky-linux/lighttpd/lighttpd-module-expire: PKGV changed from 1.4.58 [default] to 1.4.59 [default]
packages/core2-32-poky-linux/lighttpd/lighttpd-module-expire: PV changed from "1.4.58" to "1.4.59"
packages/core2-32-poky-linux/lighttpd/lighttpd-module-extforward: PKGV changed from 1.4.58 [default] to 1.4.59 [default]
packages/core2-32-poky-linux/lighttpd/lighttpd-module-extforward: PV changed from "1.4.58" to "1.4.59"
packages/core2-32-poky-linux/lighttpd/lighttpd-module-fastcgi: PKGV changed from 1.4.58 [default] to 1.4.59 [default]
packages/core2-32-poky-linux/lighttpd/lighttpd-module-fastcgi: PV changed from "1.4.58" to "1.4.59"
packages/core2-32-poky-linux/lighttpd/lighttpd-module-flv-streaming: PKGV changed from 1.4.58 [default] to 1.4.59 [default]
packages/core2-32-poky-linux/lighttpd/lighttpd-module-flv-streaming: PV changed from "1.4.58" to "1.4.59"
packages/core2-32-poky-linux/lighttpd/lighttpd-module-indexfile: PKGV changed from 1.4.58 [default] to 1.4.59 [default]
packages/core2-32-poky-linux/lighttpd/lighttpd-module-indexfile: PV changed from "1.4.58" to "1.4.59"
packages/core2-32-poky-linux/lighttpd/lighttpd-module-openssl: PKGV changed from 1.4.58 [default] to 1.4.59 [default]
packages/core2-32-poky-linux/lighttpd/lighttpd-module-openssl: PV changed from "1.4.58" to "1.4.59"
packages/core2-32-poky-linux/lighttpd/lighttpd-module-proxy: PKGV changed from 1.4.58 [default] to 1.4.59 [default]
packages/core2-32-poky-linux/lighttpd/lighttpd-module-proxy: PV changed from "1.4.58" to "1.4.59"
packages/core2-32-poky-linux/lighttpd/lighttpd-module-redirect: PKGV changed from 1.4.58 [default] to 1.4.59 [default]
packages/core2-32-poky-linux/lighttpd/lighttpd-module-redirect: PV changed from "1.4.58" to "1.4.59"
packages/core2-32-poky-linux/lighttpd/lighttpd-module-rewrite: PKGV changed from 1.4.58 [default] to 1.4.59 [default]
packages/core2-32-poky-linux/lighttpd/lighttpd-module-rewrite: PV changed from "1.4.58" to "1.4.59"
packages/core2-32-poky-linux/lighttpd/lighttpd-module-rrdtool: PKGV changed from 1.4.58 [default] to 1.4.59 [default]
packages/core2-32-poky-linux/lighttpd/lighttpd-module-rrdtool: PV changed from "1.4.58" to "1.4.59"
packages/core2-32-poky-linux/lighttpd/lighttpd-module-scgi: PKGV changed from 1.4.58 [default] to 1.4.59 [default]
packages/core2-32-poky-linux/lighttpd/lighttpd-module-scgi: PV changed from "1.4.58" to "1.4.59"
packages/core2-32-poky-linux/lighttpd/lighttpd-module-secdownload: PKGV changed from 1.4.58 [default] to 1.4.59 [default]
packages/core2-32-poky-linux/lighttpd/lighttpd-module-secdownload: PV changed from "1.4.58" to "1.4.59"
packages/core2-32-poky-linux/lighttpd/lighttpd-module-setenv: PKGV changed from 1.4.58 [default] to 1.4.59 [default]
packages/core2-32-poky-linux/lighttpd/lighttpd-module-setenv: PV changed from "1.4.58" to "1.4.59"
packages/core2-32-poky-linux/lighttpd/lighttpd-module-simple-vhost: PKGV changed from 1.4.58 [default] to 1.4.59 [default]
packages/core2-32-poky-linux/lighttpd/lighttpd-module-simple-vhost: PV changed from "1.4.58" to "1.4.59"
packages/core2-32-poky-linux/lighttpd/lighttpd-module-sockproxy: PKGV changed from 1.4.58 [default] to 1.4.59 [default]
packages/core2-32-poky-linux/lighttpd/lighttpd-module-sockproxy: PV changed from "1.4.58" to "1.4.59"
packages/core2-32-poky-linux/lighttpd/lighttpd-module-ssi: PKGV changed from 1.4.58 [default] to 1.4.59 [default]
packages/core2-32-poky-linux/lighttpd/lighttpd-module-ssi: PV changed from "1.4.58" to "1.4.59"
packages/core2-32-poky-linux/lighttpd/lighttpd-module-staticfile: PKGV changed from 1.4.58 [default] to 1.4.59 [default]
packages/core2-32-poky-linux/lighttpd/lighttpd-module-staticfile: PV changed from "1.4.58" to "1.4.59"
packages/core2-32-poky-linux/lighttpd/lighttpd-module-status: PKGV changed from 1.4.58 [default] to 1.4.59 [default]
packages/core2-32-poky-linux/lighttpd/lighttpd-module-status: PV changed from "1.4.58" to "1.4.59"
packages/core2-32-poky-linux/lighttpd/lighttpd-module-uploadprogress: PKGV changed from 1.4.58 [default] to 1.4.59 [default]
packages/core2-32-poky-linux/lighttpd/lighttpd-module-uploadprogress: PV changed from "1.4.58" to "1.4.59"
packages/core2-32-poky-linux/lighttpd/lighttpd-module-userdir: PKGV changed from 1.4.58 [default] to 1.4.59 [default]
packages/core2-32-poky-linux/lighttpd/lighttpd-module-userdir: PV changed from "1.4.58" to "1.4.59"
packages/core2-32-poky-linux/lighttpd/lighttpd-module-usertrack: PKGV changed from 1.4.58 [default] to 1.4.59 [default]
packages/core2-32-poky-linux/lighttpd/lighttpd-module-usertrack: PV changed from "1.4.58" to "1.4.59"
packages/core2-32-poky-linux/lighttpd/lighttpd-module-vhostdb: PKGV changed from 1.4.58 [default] to 1.4.59 [default]
packages/core2-32-poky-linux/lighttpd/lighttpd-module-vhostdb: PV changed from "1.4.58" to "1.4.59"
packages/core2-32-poky-linux/lighttpd/lighttpd-module-webdav: PKGV changed from 1.4.58 [default] to 1.4.59 [default]
packages/core2-32-poky-linux/lighttpd/lighttpd-module-webdav: PV changed from "1.4.58" to "1.4.59"
packages/core2-32-poky-linux/lighttpd/lighttpd-module-wstunnel: PKGV changed from 1.4.58 [default] to 1.4.59 [default]
packages/core2-32-poky-linux/lighttpd/lighttpd-module-wstunnel: PV changed from "1.4.58" to "1.4.59"
packages/core2-32-poky-linux/lighttpd/lighttpd-src: PKGV changed from 1.4.58 [default] to 1.4.59 [default]
packages/core2-32-poky-linux/lighttpd/lighttpd-src: PV changed from "1.4.58" to "1.4.59"
packages/core2-32-poky-linux/lighttpd/lighttpd-src: PKGSIZE changed from 2631657 to 2674929 (+2%)
packages/core2-32-poky-linux/lighttpd/lighttpd-staticdev: PKGV changed from 1.4.58 [default] to 1.4.59 [default]
packages/core2-32-poky-linux/lighttpd/lighttpd-staticdev: PV changed from "1.4.58" to "1.4.59"
packages/core2-32-poky-linux/lighttpd/lighttpd: PKGV changed from 1.4.58 [default] to 1.4.59 [default]
packages/core2-32-poky-linux/lighttpd/lighttpd: PV changed from "1.4.58" to "1.4.59"
Changes to packages/core2-32-poky-linux/lighttpd (sysroot):
  /usr/lib/mod_ajp13.so was added

--===============7177221626098132204==--
