Return-Path: <armccurdy@gmail.com>
Received: from mail-pl0-f66.google.com (mail-pl0-f66.google.com
	[209.85.160.66])
	by mail.openembedded.org (Postfix) with ESMTP id B5BCD750D4
	for <openembedded-core@lists.openembedded.org>;
	Wed,  9 May 2018 21:46:57 +0000 (UTC)
Received: by mail-pl0-f66.google.com with SMTP id i5-v6so23841plt.2
	for <openembedded-core@lists.openembedded.org>;
	Wed, 09 May 2018 14:46:58 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=from:to:cc:subject:date:message-id:in-reply-to:references;
	bh=1fkdemq6sxez+ydxehhx6KOEHlKmLzSzmw4kX7ZKmX4=;
	b=h7dy/holD3K/iDWNQMnSMKQT+uAy84IImp4m2rse5Fm5dtQeXDaiAw+hyjrWobheQu
	cE6W6uowTofPosSeXTk4Jn4othet0Rs4yJuS/8TslPvhN6bxJX7f7W9WtBaCH74NQ8xo
	GBLGD/JM00UIn1BFNxu8+2iTN+KGktuJq2oH6po6+Gv6+R3PY1RLGOE0isa+DcfaDqsO
	N/f/NvnZEPY7DJTsGzvVieXbYcYpLfcxWzSZS7Mz1wjnBqFcJLk+h5m1/D0CZxqzYuMB
	t/VvN1DEZwN8IaWP4K/qJQpyET64brgp1pvXG/VciDKtDXjRUJHuzQVStLNtuo/3ZogE
	8nzQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
	:references;
	bh=1fkdemq6sxez+ydxehhx6KOEHlKmLzSzmw4kX7ZKmX4=;
	b=jONa1YbJnTn7v08r1GGKggBqYScLPvlN28mEq1lQo2muoMIsIBOK4C1cPu7d0ZbjVQ
	tc2yFpbsSfOen59mrKmnJeR5cpAzJgzSC4ydX81dLOdr5i7j9EdEJbxpi0d7wIliQJPE
	xj/Ynnze5zUcNtoENldOU2OwIYwVDW/CkUGmN/JkVBkk38PgULOnfQwnaLQpc5Oue0Ck
	f0KuDq/iWgY3Zhdp5HW2RJN069He3LENTG81BCWJAxJjDNXJ0Fpw/1G/mEMGXPiT4l3O
	A95y8sVTVh7bYZhiNDSq4nROcZgv1wHGYMFHuD0R5nx00zeHHvl6k5pyNke+0CRtTIiZ
	cPJg==
X-Gm-Message-State: ALQs6tA42/bFgOHA3NwEUqIsTWZ3nKNRRaf674SfL6zxDlhNU5wQYnkL
	mhLeowTT4RqQyo0h5NLvr0WKEQ==
X-Google-Smtp-Source: AB8JxZqm04Cxx/Cd6S+C0nxhG/YBF5pZTz+voVbIV/f8VYsX/MG3lTSvL98gSeD38bUKB6JoqC0rYA==
X-Received: by 2002:a17:902:8a95:: with SMTP id
	p21-v6mr28451969plo.325.1525902418425; 
	Wed, 09 May 2018 14:46:58 -0700 (PDT)
Received: from e6520.guest-wifi.scl.liberty.com ([4.16.80.121])
	by smtp.gmail.com with ESMTPSA id
	76-v6sm3699193pge.75.2018.05.09.14.46.57
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
	Wed, 09 May 2018 14:46:57 -0700 (PDT)
From: Andre McCurdy <armccurdy@gmail.com>
To: openembedded-core@lists.openembedded.org
Date: Wed,  9 May 2018 14:46:43 -0700
Message-Id: <1525902408-6796-3-git-send-email-armccurdy@gmail.com>
X-Mailer: git-send-email 1.9.1
In-Reply-To: <1525902408-6796-1-git-send-email-armccurdy@gmail.com>
References: <1525902408-6796-1-git-send-email-armccurdy@gmail.com>
Subject: [PATCH v2 3/8] console-tools: move ASNEEDED over-ride into the console-tools recipe
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
X-List-Received-Date: Wed, 09 May 2018 21:46:57 -0000

Move the recipe specific over-ride for ASNEEDED into the recipe to
make it more apparent that the over-ride is being applied (and that
it should be re-checked on version updates, etc).

Also misc minor recipe cleanup (re-order variables to follow the OE
style guide, etc).

Signed-off-by: Andre McCurdy <armccurdy@gmail.com>
---
 meta/conf/distro/include/as-needed.inc                 |  1 -
 meta/recipes-core/console-tools/console-tools_0.3.2.bb | 10 ++++++----
 2 files changed, 6 insertions(+), 5 deletions(-)

diff --git a/meta/conf/distro/include/as-needed.inc b/meta/conf/distro/include/as-needed.inc
index 38de3a1..91c0762 100644
--- a/meta/conf/distro/include/as-needed.inc
+++ b/meta/conf/distro/include/as-needed.inc
@@ -1,7 +1,6 @@
 
 ASNEEDED = "-Wl,--as-needed"
 
-ASNEEDED_pn-console-tools = ""
 ASNEEDED_pn-distcc = ""
 ASNEEDED_pn-openobex = ""
 ASNEEDED_pn-icu = ""
diff --git a/meta/recipes-core/console-tools/console-tools_0.3.2.bb b/meta/recipes-core/console-tools/console-tools_0.3.2.bb
index 286c2a4..6b9c828 100644
--- a/meta/recipes-core/console-tools/console-tools_0.3.2.bb
+++ b/meta/recipes-core/console-tools/console-tools_0.3.2.bb
@@ -1,8 +1,8 @@
+SUMMARY = "Allows you to set-up and manipulate the Linux console"
+DESCRIPTION = "Provides tools that enable the set-up and manipulation of the linux console and console-font files."
 SECTION = "base"
 LICENSE = "GPLv2"
 LIC_FILES_CHKSUM = "file://COPYING.kbd;md5=9b2d91511d3d80d4d20ac6e6b0137fe9"
-SUMMARY = "Allows you to set-up and manipulate the Linux console"
-DESCRIPTION = "Provides tools that enable the set-up and manipulation of the linux console and console-font files."
 PR = "r8"
 
 SRC_URI = "${SOURCEFORGE_MIRROR}/lct/console-tools-${PV}.tar.gz \
@@ -26,8 +26,12 @@ SRC_URI[sha256sum] = "eea6b441672dacd251079fc85ed322e196282e0e66c16303ec64c3a2b1
 UPSTREAM_CHECK_URI = "http://sourceforge.net/projects/lct/files/console-tools-devel/"
 UPSTREAM_CHECK_REGEX = "/console-tools-devel/(?P<pver>(\d\d?\.)+\d\d?)/"
 
+inherit autotools gettext update-alternatives
+
 CFLAGS_append_aarch64 = " -D_USE_TERMIOS "
 
+ASNEEDED = ""
+
 do_configure_prepend () {
 	mkdir -p ${S}/m4
 	cp ${WORKDIR}/lcmessage.m4 ${S}/m4/
@@ -35,8 +39,6 @@ do_configure_prepend () {
 	cp ${WORKDIR}/Makevars ${S}/po/
 }
 
-inherit autotools gettext update-alternatives
-
 ALTERNATIVE_PRIORITY = "30"
 
 bindir_progs = "chvt deallocvt fgconsole openvt"
-- 
1.9.1


