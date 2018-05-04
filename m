Return-Path: <armccurdy@gmail.com>
Received: from mail-pf0-f194.google.com (mail-pf0-f194.google.com
	[209.85.192.194])
	by mail.openembedded.org (Postfix) with ESMTP id B77A37017B
	for <openembedded-core@lists.openembedded.org>;
	Fri,  4 May 2018 22:52:59 +0000 (UTC)
Received: by mail-pf0-f194.google.com with SMTP id f20so9712964pfn.0
	for <openembedded-core@lists.openembedded.org>;
	Fri, 04 May 2018 15:53:00 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=from:to:cc:subject:date:message-id:in-reply-to:references;
	bh=1fkdemq6sxez+ydxehhx6KOEHlKmLzSzmw4kX7ZKmX4=;
	b=InPKloaSmq4fEkIkhbUs3uhHOkkzaNGvHmhHzZRHUeBQa3wxc4+NYyAfAiqAdn48H6
	hZY3EXSd3ajQaO2Ewx/GFA12oHoU/ie028cyV4C4lXdctW1bxg9BTZrEJ0YybeU5SlK8
	kk1B41fzAjStIFbVO61QQO0fp60XOWA2iX48Vfof2ZL3xXCqC5W5g6QKGWVC0z9m6evJ
	QAarjkg6XDPIqxAfkN8/iCdhp9ohKJhSPJg1FcX1S08OEGsQfOcw5ZbbtxTyoWbh6ehk
	Z17hrZPDlHIQ4RH0fRl3fydppd0ESNBhFP9Y+tcc7igw22oIU1EiaFsCm0Oop7i8YlCd
	RUzg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
	:references;
	bh=1fkdemq6sxez+ydxehhx6KOEHlKmLzSzmw4kX7ZKmX4=;
	b=KcNk6JRFfDojFDvG7ih4L31HtfqdxYRoXIOMDRpTrk7+BRnB4BQw12eF93b8f3voWG
	P8Rkvo3Sk4jRxTF3tvzNomhhiIPitOlxx2aJRm6oSnxxMjCNUel42vTZoG7EQhbQ+PlG
	tDvAorje8JwAQmnmIvghFKaBohfoOKXY870pTpfwD/oS7hDVnShQqqQMHJ1uvytMwXgv
	4kDeM+eA0C69ok4cl3ZPbNgeFh0vGDKE4ZPk30CPYvGSF4KnvuaHX402hO3ExGoUEvK4
	qOKHSgsZOhipZe7yYqmbfDHdDXWqG3+0Q1UxaH4mmBGJ198EFyHEHGXL/9iARR21ZaUs
	7Y4w==
X-Gm-Message-State: ALQs6tBsF+UNYS+afUGSKU8HNvlu9F1BlkbnWwzpLUGbbxLqeNKCDwbK
	+YUsTueMPvR6Mo/JbPDW1A30ZQ==
X-Google-Smtp-Source: AB8JxZr20k6ifHhO6EZ6GEuTXPjurc8YbgRIa/VqT7DaLXghJZWndlP1rI6f5yW5Uycbh4eDgFBgxA==
X-Received: by 2002:a17:902:294a:: with SMTP id
	g68-v6mr29755588plb.110.1525474380225; 
	Fri, 04 May 2018 15:53:00 -0700 (PDT)
Received: from e6520.cablelabs.com ([4.16.80.121])
	by smtp.gmail.com with ESMTPSA id
	w26sm41378391pfi.17.2018.05.04.15.52.59
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
	Fri, 04 May 2018 15:52:59 -0700 (PDT)
From: Andre McCurdy <armccurdy@gmail.com>
To: openembedded-core@lists.openembedded.org
Date: Fri,  4 May 2018 15:52:45 -0700
Message-Id: <1525474370-7913-3-git-send-email-armccurdy@gmail.com>
X-Mailer: git-send-email 1.9.1
In-Reply-To: <1525474370-7913-1-git-send-email-armccurdy@gmail.com>
References: <1525474370-7913-1-git-send-email-armccurdy@gmail.com>
Subject: [PATCH 3/8] console-tools: move ASNEEDED over-ride into the console-tools recipe
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
X-List-Received-Date: Fri, 04 May 2018 22:52:59 -0000

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


