Return-Path: <armccurdy@gmail.com>
Received: from mail-pg0-f46.google.com (mail-pg0-f46.google.com [74.125.83.46])
	by mail.openembedded.org (Postfix) with ESMTP id 0DA7574B11
	for <openembedded-core@lists.openembedded.org>;
	Fri, 25 May 2018 00:14:24 +0000 (UTC)
Received: by mail-pg0-f46.google.com with SMTP id 15-v6so1167648pge.2
	for <openembedded-core@lists.openembedded.org>;
	Thu, 24 May 2018 17:14:26 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=from:to:cc:subject:date:message-id;
	bh=KX7DOKhX+HHdqcaWN3zb1b73Wv6v0lxRAd8FwKPUTH4=;
	b=gn6CxPqr1lMbrgkbW3q0Q7QMlQ4iukSg0ISKv04YviQdoIhudt794meus+Db8xY5BE
	i7kIMqU4t3NS3O2r6iCGeAAPJZkEAL4fRKfM7AGxS/k3LNBsIDP4XPbVcDOWUjgQGBYh
	5rWzsDu4v4MCr2Shrj8r/CXVcQ6yPP9Ie4Za+O0OdWWma7EhQ5Mb4EaoqmzEXEBWfaj/
	YG8/w2Ghn7rHUCj0ACYZCwmB0z5wIjCc+7xOY0AX8DkUogdUgxb9EoYUoET2UVYSkuBS
	4N1yL255+5HsuG5z7GZllQsgA3vy0BOrqt566mdiS8wlTAgBOaU1PRVJb732MYdGQwIe
	nu1g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:cc:subject:date:message-id;
	bh=KX7DOKhX+HHdqcaWN3zb1b73Wv6v0lxRAd8FwKPUTH4=;
	b=FY0Hd+a9KcosRFbEeRfpovnT+5l5gjpCkFZ23a6jAcZjZ5bA/rrZaWDlzv/YbfcbPv
	2SYpPSO1ErJpofVTZf4Qvg8AN2O5lO4OF7xfxd4+2bjhYetA5oZ+L3jGmyDRaErB60uC
	dJQjA+AlLsw+WZe9XQVbCq89qFk19Hcme4mgccbp6VcwpNcVL81y4hwXvs0CjMUjcOYO
	zx7dySacd0L8D9H36ym55qwcnrImj8742mR/LeFYqckvJsG0jz3kYIwSWqape22Fc4ae
	0ewa+PNLbKIZJc5hDqDcyd8W6eMXzc2EiDWKhK6jfIJj6RFm20W2FGTfr8vcnk2NbKB+
	76rQ==
X-Gm-Message-State: ALKqPwc6qRf1xXN/6vP3v6aZm2q/gTSlp0eS1jJvRAlhthP0nv/EAaBc
	eH60zs5Tsd9CJ2EasXVDierz6g==
X-Google-Smtp-Source: AB8JxZqTJVOh1W49TTCYBi2/9pl0hf678b/9dv1+NzZ8HgdWEC7o3sLzSQb/Knax7Ly/vjoSkvdG7A==
X-Received: by 2002:a65:5686:: with SMTP id v6-v6mr149633pgs.92.1527207265610; 
	Thu, 24 May 2018 17:14:25 -0700 (PDT)
Received: from e6520.cablelabs.com ([4.16.80.121])
	by smtp.gmail.com with ESMTPSA id
	h75-v6sm44191913pfh.148.2018.05.24.17.14.24
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
	Thu, 24 May 2018 17:14:24 -0700 (PDT)
From: Andre McCurdy <armccurdy@gmail.com>
To: openembedded-core@lists.openembedded.org
Date: Thu, 24 May 2018 17:14:17 -0700
Message-Id: <1527207259-30592-1-git-send-email-armccurdy@gmail.com>
X-Mailer: git-send-email 1.9.1
Subject: [PATCH 1/3] cpio: move contents of cpio_v2.inc into the cpio recipe
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
X-List-Received-Date: Fri, 25 May 2018 00:14:25 -0000

Merge contents of cpio_v2.inc into the only recipe which uses it.

Signed-off-by: Andre McCurdy <armccurdy@gmail.com>
---
 meta/recipes-extended/cpio/cpio_2.12.bb | 40 ++++++++++++++++++++++++++++--
 meta/recipes-extended/cpio/cpio_v2.inc  | 43 ---------------------------------
 2 files changed, 38 insertions(+), 45 deletions(-)
 delete mode 100644 meta/recipes-extended/cpio/cpio_v2.inc

diff --git a/meta/recipes-extended/cpio/cpio_2.12.bb b/meta/recipes-extended/cpio/cpio_2.12.bb
index 405a90e..0b83e9b 100644
--- a/meta/recipes-extended/cpio/cpio_2.12.bb
+++ b/meta/recipes-extended/cpio/cpio_2.12.bb
@@ -1,8 +1,13 @@
-require cpio_v2.inc
-
+SUMMARY = "GNU cpio is a program to manage archives of files"
+DESCRIPTION = "GNU cpio is a tool for creating and extracting archives, or copying files from one place to \
+another. It handles a number of cpio formats as well as reading and writing tar files."
+HOMEPAGE = "http://www.gnu.org/software/cpio/"
+SECTION = "base"
 LICENSE = "GPLv3"
 LIC_FILES_CHKSUM = "file://COPYING;md5=f27defe1e96c2e1ecd4e0c9be8967949"
 
+DEPENDS = "texinfo-native"
+
 SRC_URI = "${GNU_MIRROR}/cpio/cpio-${PV}.tar.gz \
            file://0001-Unset-need_charset_alias-when-building-for-musl.patch \
            file://0001-Fix-CVE-2015-1197.patch \
@@ -10,3 +15,34 @@ SRC_URI = "${GNU_MIRROR}/cpio/cpio-${PV}.tar.gz \
 
 SRC_URI[md5sum] = "fc207561a86b63862eea4b8300313e86"
 SRC_URI[sha256sum] = "08a35e92deb3c85d269a0059a27d4140a9667a6369459299d08c17f713a92e73"
+
+inherit autotools gettext texinfo
+
+EXTRA_OECONF += "DEFAULT_RMT_DIR=${base_sbindir}"
+
+do_install () {
+    autotools_do_install
+    if [ "${base_bindir}" != "${bindir}" ]; then
+        install -d ${D}${base_bindir}/
+        mv "${D}${bindir}/cpio" "${D}${base_bindir}/cpio"
+        rmdir ${D}${bindir}/
+    fi
+}
+
+PACKAGES =+ "${PN}-rmt"
+
+FILES_${PN}-rmt = "${base_sbindir}/rmt*"
+
+inherit update-alternatives
+
+ALTERNATIVE_PRIORITY = "100"
+
+ALTERNATIVE_${PN} = "cpio"
+ALTERNATIVE_${PN}-rmt = "rmt"
+
+ALTERNATIVE_LINK_NAME[cpio] = "${base_bindir}/cpio"
+
+ALTERNATIVE_PRIORITY[rmt] = "50"
+ALTERNATIVE_LINK_NAME[rmt] = "${base_sbindir}/rmt"
+
+BBCLASSEXTEND = "native"
diff --git a/meta/recipes-extended/cpio/cpio_v2.inc b/meta/recipes-extended/cpio/cpio_v2.inc
deleted file mode 100644
index 31adb71..0000000
--- a/meta/recipes-extended/cpio/cpio_v2.inc
+++ /dev/null
@@ -1,43 +0,0 @@
-SUMMARY = "GNU cpio is a program to manage archives of files"
-DESCRIPTION = "GNU cpio is a tool for creating and extracting archives, or copying files from one place to \
-another. It handles a number of cpio formats as well as reading and writing tar files."
-HOMEPAGE = "http://www.gnu.org/software/cpio/"
-SECTION = "base"
-
-DEPENDS = "texinfo-native"
-
-SRC_URI = "${GNU_MIRROR}/cpio/cpio-${PV}.tar.gz \
-    "
-
-inherit autotools gettext texinfo
-
-S = "${WORKDIR}/cpio-${PV}"
-
-EXTRA_OECONF += "DEFAULT_RMT_DIR=${base_sbindir}"
-
-do_install () {
-    autotools_do_install
-    if [ "${base_bindir}" != "${bindir}" ]; then
-        install -d ${D}${base_bindir}/
-        mv "${D}${bindir}/cpio" "${D}${base_bindir}/cpio"
-        rmdir ${D}${bindir}/
-    fi
-}
-
-PACKAGES =+ "${PN}-rmt"
-
-FILES_${PN}-rmt = "${base_sbindir}/rmt*"
-
-inherit update-alternatives
-
-ALTERNATIVE_PRIORITY = "100"
-
-ALTERNATIVE_${PN} = "cpio"
-ALTERNATIVE_${PN}-rmt = "rmt"
-
-ALTERNATIVE_LINK_NAME[cpio] = "${base_bindir}/cpio"
-
-ALTERNATIVE_PRIORITY[rmt] = "50"
-ALTERNATIVE_LINK_NAME[rmt] = "${base_sbindir}/rmt"
-
-BBCLASSEXTEND = "native"
-- 
1.9.1


