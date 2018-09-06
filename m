Return-Path: <alex.kanavin@gmail.com>
Received: from mail-ed1-f48.google.com (mail-ed1-f48.google.com
	[209.85.208.48])
	by mail.openembedded.org (Postfix) with ESMTP id C83A5795CC
	for <openembedded-core@lists.openembedded.org>;
	Thu,  6 Sep 2018 10:29:49 +0000 (UTC)
Received: by mail-ed1-f48.google.com with SMTP id s10-v6so8445701edb.11
	for <openembedded-core@lists.openembedded.org>;
	Thu, 06 Sep 2018 03:29:51 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=from:to:cc:subject:date:message-id:in-reply-to:references;
	bh=WiRgaquyHO+/9aHm/a36KlWyqqyLDXiBrZRM+8yvJro=;
	b=a6WZ8J+U3yMiyWYkxJVKI0R1eYzfXZR/RlwVTn3HYtCPoT5uN90kZtsqNTpuGrpbia
	YImAuAYPRnvnrDtXbcOUuLC7j16S1urJ3piQhKIS4BIdDqtbXfW36ZgF4mjoIj3qKSqo
	beOKRi+R0TCoie0DiM8ZHP0EF6QpxnmPytgXYvZiASCOKj+h/IEdZyhnNKsaIJMJYKRt
	7aFPEpn9QQCBoaAhDw4aGhW4JnYYPu2o48g4OebXccV8S3ltf51t8QXWuV27IYTRse00
	ji1fJxo+27XEDa29NrPcgoqwPiEv/P5MHa2MzpgZKEz+hek9eEFUx2KAt0uhvID004++
	0Bsg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
	:references;
	bh=WiRgaquyHO+/9aHm/a36KlWyqqyLDXiBrZRM+8yvJro=;
	b=oweq1A0ewMkAwREgV6sza/rnnaz0u11NcObrt8UYmiw3NChyB7Gbz32lhut7wVAfBC
	tLquHXeMtnUnQ7PhP2HGT+UU3ktGGdLL5Zicf4WVQO9HqOwh6nZZdfsVRu/Kcml2FH+b
	WOsefyxnNvIjvrC1w4nWNzHY3r+9Ip4v/ZO45z5a1o3rx+YQ2uoVTcMUU8TNtJJGpVgn
	7lGBK63x5H9y2mf9FQjl8jyQ51YpJYSug75FFCY9Sb8GS6NonOxEpt3JJxCQ3xTCY578
	U8i4VrI2K8WXe1DOF00PvzG53p4hXbXVNMfrUze0qshgJIbOjpDWl54ogQSiNdmRbQ4Z
	neow==
X-Gm-Message-State: APzg51DSyEM5DK9lMNx8lxIQ9cLYPUiJNGk/ZeqhhrjYwwIm1rrYFTd3
	XWvmLER6vz/6gVAH3bEzfsrRVbPTIjI=
X-Google-Smtp-Source: ANB0VdbMBJLsh/JoNbU/SzlwpmhfxMugqM95EKOFcRDu3cwlId+YYChJ6NarZCEiz8FoidztgbNV/Q==
X-Received: by 2002:a50:c292:: with SMTP id
	o18-v6mr2959466edf.188.1536229790214; 
	Thu, 06 Sep 2018 03:29:50 -0700 (PDT)
Received: from localhost.localdomain ([79.140.126.226])
	by smtp.gmail.com with ESMTPSA id
	d3-v6sm2495886edi.80.2018.09.06.03.29.49
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
	Thu, 06 Sep 2018 03:29:49 -0700 (PDT)
From: Alexander Kanavin <alex.kanavin@gmail.com>
To: openembedded-core@lists.openembedded.org
Date: Thu,  6 Sep 2018 12:29:20 +0200
Message-Id: <1536229770-29600-11-git-send-email-alex.kanavin@gmail.com>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <1536229770-29600-1-git-send-email-alex.kanavin@gmail.com>
References: <1536229770-29600-1-git-send-email-alex.kanavin@gmail.com>
Subject: [PATCH 11/21] lighttpd: update to 1.4.50
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
X-List-Received-Date: Thu, 06 Sep 2018 10:29:50 -0000

Signed-off-by: Alexander Kanavin <alex.kanavin@gmail.com>
---
 meta/recipes-extended/lighttpd/lighttpd_1.4.49.bb | 85 -----------------------
 meta/recipes-extended/lighttpd/lighttpd_1.4.50.bb | 85 +++++++++++++++++++++++
 2 files changed, 85 insertions(+), 85 deletions(-)
 delete mode 100644 meta/recipes-extended/lighttpd/lighttpd_1.4.49.bb
 create mode 100644 meta/recipes-extended/lighttpd/lighttpd_1.4.50.bb

diff --git a/meta/recipes-extended/lighttpd/lighttpd_1.4.49.bb b/meta/recipes-extended/lighttpd/lighttpd_1.4.49.bb
deleted file mode 100644
index 272a66a..0000000
--- a/meta/recipes-extended/lighttpd/lighttpd_1.4.49.bb
+++ /dev/null
@@ -1,85 +0,0 @@
-SUMMARY = "Lightweight high-performance web server"
-HOMEPAGE = "http://www.lighttpd.net/"
-BUGTRACKER = "http://redmine.lighttpd.net/projects/lighttpd/issues"
-
-LICENSE = "BSD"
-LIC_FILES_CHKSUM = "file://COPYING;md5=e4dac5c6ab169aa212feb5028853a579"
-
-SECTION = "net"
-RDEPENDS_${PN} = "lighttpd-module-dirlisting \
-                  lighttpd-module-indexfile \
-                  lighttpd-module-staticfile"
-RRECOMMENDS_${PN} = "lighttpd-module-access \
-                     lighttpd-module-accesslog"
-
-SRC_URI = "http://download.lighttpd.net/lighttpd/releases-1.4.x/lighttpd-${PV}.tar.xz \
-        file://index.html.lighttpd \
-        file://lighttpd.conf \
-        file://lighttpd \
-        file://lighttpd.service \
-        file://0001-Use-pkg-config-for-pcre-dependency-instead-of-config.patch \
-        "
-
-SRC_URI[md5sum] = "aaf8165379351c3766e5ad1e5c9dbe8b"
-SRC_URI[sha256sum] = "aedf49d7127d9e4c0ea56618e9e945a17674dc46a37ac7990120f87dd939ce09"
-
-PACKAGECONFIG ??= "openssl pcre zlib \
-    ${@bb.utils.filter('DISTRO_FEATURES', 'ipv6', d)} \
-    ${@bb.utils.contains('DISTRO_FEATURES', 'xattr', 'attr', '', d)} \
-"
-
-PACKAGECONFIG[ipv6] = "--enable-ipv6,--disable-ipv6"
-PACKAGECONFIG[mmap] = "--enable-mmap,--disable-mmap"
-PACKAGECONFIG[libev] = "--with-libev,--without-libev,libev"
-PACKAGECONFIG[mysql] = "--with-mysql,--without-mysql,mariadb"
-PACKAGECONFIG[ldap] = "--with-ldap,--without-ldap,openldap"
-PACKAGECONFIG[attr] = "--with-attr,--without-attr,attr"
-PACKAGECONFIG[valgrind] = "--with-valgrind,--without-valgrind,valgrind"
-PACKAGECONFIG[openssl] = "--with-openssl,--without-openssl,openssl"
-PACKAGECONFIG[krb5] = "--with-krb5,--without-krb5,krb5"
-PACKAGECONFIG[pcre] = "--with-pcre,--without-pcre,libpcre"
-PACKAGECONFIG[zlib] = "--with-zlib,--without-zlib,zlib"
-PACKAGECONFIG[bzip2] = "--with-bzip2,--without-bzip2,bzip2"
-PACKAGECONFIG[fam] = "--with-fam,--without-fam,gamin"
-PACKAGECONFIG[webdav-props] = "--with-webdav-props,--without-webdav-props,libxml2 sqlite3"
-PACKAGECONFIG[webdav-locks] = "--with-webdav-locks,--without-webdav-locks,util-linux"
-PACKAGECONFIG[gdbm] = "--with-gdbm,--without-gdbm,gdbm"
-PACKAGECONFIG[memcache] = "--with-memcached,--without-memcached,libmemcached"
-PACKAGECONFIG[lua] = "--with-lua,--without-lua,lua5.1"
-
-EXTRA_OECONF += "--enable-lfs"
-
-inherit autotools pkgconfig update-rc.d gettext systemd
-
-INITSCRIPT_NAME = "lighttpd"
-INITSCRIPT_PARAMS = "defaults 70"
-
-SYSTEMD_SERVICE_${PN} = "lighttpd.service"
-
-do_install_append() {
-	install -d ${D}${sysconfdir}/init.d ${D}${sysconfdir}/lighttpd.d ${D}/www/pages/dav
-	install -m 0755 ${WORKDIR}/lighttpd ${D}${sysconfdir}/init.d
-	install -m 0644 ${WORKDIR}/lighttpd.conf ${D}${sysconfdir}
-	install -m 0644 ${WORKDIR}/index.html.lighttpd ${D}/www/pages/index.html
-
-	install -d ${D}${systemd_unitdir}/system
-	install -m 0644 ${WORKDIR}/lighttpd.service ${D}${systemd_unitdir}/system
-	sed -i -e 's,@SBINDIR@,${sbindir},g' \
-		-e 's,@SYSCONFDIR@,${sysconfdir},g' \
-		-e 's,@BASE_BINDIR@,${base_bindir},g' \
-		${D}${systemd_unitdir}/system/lighttpd.service
-	#For FHS compliance, create symbolic links to /var/log and /var/tmp for logs and temporary data
-	ln -sf ${localstatedir}/log ${D}/www/logs
-	ln -sf ${localstatedir}/tmp ${D}/www/var
-}
-
-FILES_${PN} += "${sysconfdir} /www"
-
-CONFFILES_${PN} = "${sysconfdir}/lighttpd.conf"
-
-PACKAGES_DYNAMIC += "^lighttpd-module-.*"
-
-python populate_packages_prepend () {
-    lighttpd_libdir = d.expand('${libdir}')
-    do_split_packages(d, lighttpd_libdir, '^mod_(.*)\.so$', 'lighttpd-module-%s', 'Lighttpd module for %s', extra_depends='')
-}
diff --git a/meta/recipes-extended/lighttpd/lighttpd_1.4.50.bb b/meta/recipes-extended/lighttpd/lighttpd_1.4.50.bb
new file mode 100644
index 0000000..5373a61
--- /dev/null
+++ b/meta/recipes-extended/lighttpd/lighttpd_1.4.50.bb
@@ -0,0 +1,85 @@
+SUMMARY = "Lightweight high-performance web server"
+HOMEPAGE = "http://www.lighttpd.net/"
+BUGTRACKER = "http://redmine.lighttpd.net/projects/lighttpd/issues"
+
+LICENSE = "BSD"
+LIC_FILES_CHKSUM = "file://COPYING;md5=e4dac5c6ab169aa212feb5028853a579"
+
+SECTION = "net"
+RDEPENDS_${PN} = "lighttpd-module-dirlisting \
+                  lighttpd-module-indexfile \
+                  lighttpd-module-staticfile"
+RRECOMMENDS_${PN} = "lighttpd-module-access \
+                     lighttpd-module-accesslog"
+
+SRC_URI = "http://download.lighttpd.net/lighttpd/releases-1.4.x/lighttpd-${PV}.tar.xz \
+        file://index.html.lighttpd \
+        file://lighttpd.conf \
+        file://lighttpd \
+        file://lighttpd.service \
+        file://0001-Use-pkg-config-for-pcre-dependency-instead-of-config.patch \
+        "
+
+SRC_URI[md5sum] = "0547831efda8492648b7f0c652865dfd"
+SRC_URI[sha256sum] = "29378312d8887cbc14ffe8a7fadef2d5a08c7e7e1be942795142346ad95629eb"
+
+PACKAGECONFIG ??= "openssl pcre zlib \
+    ${@bb.utils.filter('DISTRO_FEATURES', 'ipv6', d)} \
+    ${@bb.utils.contains('DISTRO_FEATURES', 'xattr', 'attr', '', d)} \
+"
+
+PACKAGECONFIG[ipv6] = "--enable-ipv6,--disable-ipv6"
+PACKAGECONFIG[mmap] = "--enable-mmap,--disable-mmap"
+PACKAGECONFIG[libev] = "--with-libev,--without-libev,libev"
+PACKAGECONFIG[mysql] = "--with-mysql,--without-mysql,mariadb"
+PACKAGECONFIG[ldap] = "--with-ldap,--without-ldap,openldap"
+PACKAGECONFIG[attr] = "--with-attr,--without-attr,attr"
+PACKAGECONFIG[valgrind] = "--with-valgrind,--without-valgrind,valgrind"
+PACKAGECONFIG[openssl] = "--with-openssl,--without-openssl,openssl"
+PACKAGECONFIG[krb5] = "--with-krb5,--without-krb5,krb5"
+PACKAGECONFIG[pcre] = "--with-pcre,--without-pcre,libpcre"
+PACKAGECONFIG[zlib] = "--with-zlib,--without-zlib,zlib"
+PACKAGECONFIG[bzip2] = "--with-bzip2,--without-bzip2,bzip2"
+PACKAGECONFIG[fam] = "--with-fam,--without-fam,gamin"
+PACKAGECONFIG[webdav-props] = "--with-webdav-props,--without-webdav-props,libxml2 sqlite3"
+PACKAGECONFIG[webdav-locks] = "--with-webdav-locks,--without-webdav-locks,util-linux"
+PACKAGECONFIG[gdbm] = "--with-gdbm,--without-gdbm,gdbm"
+PACKAGECONFIG[memcache] = "--with-memcached,--without-memcached,libmemcached"
+PACKAGECONFIG[lua] = "--with-lua,--without-lua,lua5.1"
+
+EXTRA_OECONF += "--enable-lfs"
+
+inherit autotools pkgconfig update-rc.d gettext systemd
+
+INITSCRIPT_NAME = "lighttpd"
+INITSCRIPT_PARAMS = "defaults 70"
+
+SYSTEMD_SERVICE_${PN} = "lighttpd.service"
+
+do_install_append() {
+	install -d ${D}${sysconfdir}/init.d ${D}${sysconfdir}/lighttpd.d ${D}/www/pages/dav
+	install -m 0755 ${WORKDIR}/lighttpd ${D}${sysconfdir}/init.d
+	install -m 0644 ${WORKDIR}/lighttpd.conf ${D}${sysconfdir}
+	install -m 0644 ${WORKDIR}/index.html.lighttpd ${D}/www/pages/index.html
+
+	install -d ${D}${systemd_unitdir}/system
+	install -m 0644 ${WORKDIR}/lighttpd.service ${D}${systemd_unitdir}/system
+	sed -i -e 's,@SBINDIR@,${sbindir},g' \
+		-e 's,@SYSCONFDIR@,${sysconfdir},g' \
+		-e 's,@BASE_BINDIR@,${base_bindir},g' \
+		${D}${systemd_unitdir}/system/lighttpd.service
+	#For FHS compliance, create symbolic links to /var/log and /var/tmp for logs and temporary data
+	ln -sf ${localstatedir}/log ${D}/www/logs
+	ln -sf ${localstatedir}/tmp ${D}/www/var
+}
+
+FILES_${PN} += "${sysconfdir} /www"
+
+CONFFILES_${PN} = "${sysconfdir}/lighttpd.conf"
+
+PACKAGES_DYNAMIC += "^lighttpd-module-.*"
+
+python populate_packages_prepend () {
+    lighttpd_libdir = d.expand('${libdir}')
+    do_split_packages(d, lighttpd_libdir, '^mod_(.*)\.so$', 'lighttpd-module-%s', 'Lighttpd module for %s', extra_depends='')
+}
-- 
2.7.4


