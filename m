Return-Path: <danismostlikely@gmail.com>
Received: from mail-wr0-f194.google.com (mail-wr0-f194.google.com
	[209.85.128.194])
	by mail.openembedded.org (Postfix) with ESMTP id BA5FE78312
	for <openembedded-core@lists.openembedded.org>;
	Fri, 11 May 2018 20:11:59 +0000 (UTC)
Received: by mail-wr0-f194.google.com with SMTP id h5-v6so6446893wrm.4
	for <openembedded-core@lists.openembedded.org>;
	Fri, 11 May 2018 13:12:01 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=from:to:subject:date:message-id:in-reply-to:references;
	bh=p/OQ3thmwHS5IUCrOoie/bLdKdaIBig1+xvL55Z1sgw=;
	b=DbFLpyIAtOPfRSaCyjPYifulLURlktkNZgHlBGlOq9JYhGIt1HBL2EXMifJ+Bun/Zj
	FZmhCMOTHm6ox4ZAckP2qST5nEw9+XwCpwGqrfskXxyx3a4bg1d8fRKJp9r3OdOQL7tv
	rgamhGq2AZU2podcIy+fOiC4py8NFbksjdePgDH+ouFSvVT6mkh5zQL1mvwQ3n1hILdj
	KXGhYvIyfMwKU5hQjspFUK3TOMDrxLgEy1H2k9DR33cU7d0Yam/olzhlrbO4ZGgwSFoG
	pNt/iew+AF2Mg27+QJ43XUqKzhWKfBWH2SlhrlyruRwGEddUiC8zbj7UXm1vmTOkjRfR
	+FkA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
	:references;
	bh=p/OQ3thmwHS5IUCrOoie/bLdKdaIBig1+xvL55Z1sgw=;
	b=fwyfOCXvyKWwq1XW9mM9rE422nFGdbftLcSa8zO2Vg1G0nfqONYZBWJVDTV3p+cFXF
	HWPtmLNxObemovXeNMNvoCxFvyL0Td9zNIPRjOeq3F9i8Pb7a3voU5ZnTvdzuTtQ/J/S
	dT+dzxmEejY9tvwmDxXDBuW4f8gFymSVKLMDiXsrOJyJogIx9+LdL42zabFxPPy3iP3z
	gu3qPVveof2L2CffotDh9YZuX9gX2LYB+hxQgX4mCXtkLf0cm8efmrFqvHVO0rRyA6jm
	cu/LX+pAU7DW/ywkoQunbhY9aHSRu9WGqt3nzoVuIVxh8JWmQGDF2KH0yMffH65CmpID
	hSdw==
X-Gm-Message-State: ALKqPwe0ge+uSQ2qK9sxiFT5OanujCDBr+n0ddOEkxBviY+YwLvnSMhk
	tOUpGKwb7E26MJLTgbb6mYyVP8o8
X-Google-Smtp-Source: AB8JxZqJ1ma+xvY9kYEskwXJXOtf9tTbU3oGGfPmLa4lf1h0mhqEULgHGSnhEu71O39/L0tjrknzHA==
X-Received: by 2002:adf:d4c8:: with SMTP id w8-v6mr350851wrk.8.1526069520348; 
	Fri, 11 May 2018 13:12:00 -0700 (PDT)
Received: from mediabox.local ([2001:470:30f3:1:922b:34ff:fe5d:d4b3])
	by smtp.gmail.com with ESMTPSA id
	o20-v6sm4692147wro.67.2018.05.11.13.11.58
	for <openembedded-core@lists.openembedded.org>
	(version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
	Fri, 11 May 2018 13:11:59 -0700 (PDT)
From: Dan McGregor <danismostlikely@gmail.com>
To: openembedded-core@lists.openembedded.org
Date: Fri, 11 May 2018 14:10:55 -0600
Message-Id: <20180511201055.15463-3-danismostlikely@gmail.com>
X-Mailer: git-send-email 2.18.0-dev
In-Reply-To: <20180511201055.15463-1-danismostlikely@gmail.com>
References: <20180511201055.15463-1-danismostlikely@gmail.com>
Subject: [PATCH 3/3] base-files: make root home mode customisable
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
X-List-Received-Date: Fri, 11 May 2018 20:12:00 -0000

From: Dan McGregor <dan.mcgregor@usask.ca>

Signed-off-by: Dan McGregor <dan.mcgregor@usask.ca>
---
 meta/conf/bitbake.conf                            | 1 +
 meta/files/fs-perms-persistent-log.txt            | 4 ++--
 meta/files/fs-perms.txt                           | 4 ++--
 meta/recipes-core/base-files/base-files_3.0.14.bb | 4 +++-
 4 files changed, 8 insertions(+), 5 deletions(-)

diff --git a/meta/conf/bitbake.conf b/meta/conf/bitbake.conf
index a21b7282fbd..cd07b86a99c 100644
--- a/meta/conf/bitbake.conf
+++ b/meta/conf/bitbake.conf
@@ -84,6 +84,7 @@ USRBINPATH_class-nativesdk = "/usr/bin"
 
 # Root home directory
 ROOT_HOME ??= "/home/root"
+ROOT_HOME_MODE ??= "0700"
 
 # If set to boolean true ('yes', 'y', 'true', 't', '1'), /var/log links to /var/volatile/log.
 # If set to boolean false ('no', 'n', 'false', 'f', '0'), /var/log is on persistent storage.
diff --git a/meta/files/fs-perms-persistent-log.txt b/meta/files/fs-perms-persistent-log.txt
index 3a7cf3ab945..e16c4464843 100644
--- a/meta/files/fs-perms-persistent-log.txt
+++ b/meta/files/fs-perms-persistent-log.txt
@@ -59,8 +59,8 @@ ${localstatedir}/local		0755	root	root	false - - -
 /tmp				01777	root	root	false - - -
 ${localstatedir}/volatile/tmp	01777	root	root	false - - -
 
-# Set 0700
-${ROOT_HOME}			0700	root	root	false - - -
+# Set ${ROOT_HOME_MODE}, by default 0700.
+${ROOT_HOME}			${ROOT_HOME_MODE}	root	root	false - - -
 
 # Set 2775-lsb
 ${localstatedir}/mail		02775	root	mail	false - - -
diff --git a/meta/files/fs-perms.txt b/meta/files/fs-perms.txt
index c8c3ac5dbed..ad180399105 100644
--- a/meta/files/fs-perms.txt
+++ b/meta/files/fs-perms.txt
@@ -60,8 +60,8 @@ ${localstatedir}/local		0755	root	root	false - - -
 /tmp				01777	root	root	false - - -
 ${localstatedir}/volatile/tmp	01777	root	root	false - - -
 
-# Set 0700
-${ROOT_HOME}			0700	root	root	false - - -
+# Set ${ROOT_HOME_MODE}, by default 0700.
+${ROOT_HOME}			${ROOT_HOME_MODE}	root	root	false - - -
 
 # Set 2775-lsb
 ${localstatedir}/mail		02775	root	mail	false - - -
diff --git a/meta/recipes-core/base-files/base-files_3.0.14.bb b/meta/recipes-core/base-files/base-files_3.0.14.bb
index a4c22c51c77..6267b649465 100644
--- a/meta/recipes-core/base-files/base-files_3.0.14.bb
+++ b/meta/recipes-core/base-files/base-files_3.0.14.bb
@@ -35,7 +35,7 @@ dirs2775 = ""
 dirs555 = "/sys /proc"
 dirs755 = "/boot /dev ${base_bindir} ${base_sbindir} ${base_libdir} \
            ${sysconfdir} ${sysconfdir}/default \
-           ${sysconfdir}/skel ${nonarch_base_libdir} /mnt ${ROOT_HOME} /run \
+           ${sysconfdir}/skel ${nonarch_base_libdir} /mnt /run \
            ${prefix} ${bindir} ${docdir} /usr/games ${includedir} \
            ${libdir} ${sbindir} ${datadir} \
            ${datadir}/common-licenses ${datadir}/dict ${infodir} \
@@ -110,6 +110,8 @@ do_install () {
 		ln -sf volatile/$d ${D}${localstatedir}/$d
 	done
 
+	install -m ${ROOT_HOME_MODE} -d ${D}${ROOT_HOME}
+
 	ln -snf ../run ${D}${localstatedir}/run
 	ln -snf ../run/lock ${D}${localstatedir}/lock
 
-- 
2.18.0-dev


