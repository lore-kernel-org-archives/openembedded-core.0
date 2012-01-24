Received: from mail-gx0-f175.google.com ([209.85.161.175])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <raj.khem@gmail.com>) id 1RpkWO-0000FT-5S
	for openembedded-core@lists.openembedded.org;
	Tue, 24 Jan 2012 18:51:04 +0100
Received: by mail-gx0-f175.google.com with SMTP id p4so1916430ggn.6
	for <openembedded-core@lists.openembedded.org>;
	Tue, 24 Jan 2012 09:43:20 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=from:to:subject:date:message-id:x-mailer:in-reply-to:references
	:in-reply-to:references;
	bh=3o+uSY8M+meYR6NWiYwptbuiCnadf8nKR56jNUnyysE=;
	b=N09aK+LtIM7meu/6cIyNIqRExcnzWD66Ybq7b99Hcry9tf72YT8Uf5xpT0IItuQe7v
	dRtXv66YaAAgam31a3FvaW/OqcrTQIqlp140Qb5I6jtrAuaWpyUAHW9fqJvbYPg75Pbr
	Y3DN7DUrmY4GN2tfGdryzB1Zqea5H/8XSDYa4=
Received: by 10.50.209.4 with SMTP id mi4mr15496228igc.17.1327427000466;
	Tue, 24 Jan 2012 09:43:20 -0800 (PST)
Received: from leto.gateway.2wire.net
	(99-57-141-118.lightspeed.sntcca.sbcglobal.net. [99.57.141.118])
	by mx.google.com with ESMTPS id wn6sm9360062igb.3.2012.01.24.09.43.18
	(version=TLSv1/SSLv3 cipher=OTHER);
	Tue, 24 Jan 2012 09:43:19 -0800 (PST)
From: Khem Raj <raj.khem@gmail.com>
To: openembedded-core@lists.openembedded.org
Date: Tue, 24 Jan 2012 09:42:58 -0800
Message-Id: <9ac6a2dae557c51ed504a862678644f9e1e4ffe1.1327426808.git.raj.khem@gmail.com>
X-Mailer: git-send-email 1.7.8.3
In-Reply-To: <e035a903e7718b712b60ed33807b9ead906cee2f.1327426808.git.raj.khem@gmail.com>
References: <e035a903e7718b712b60ed33807b9ead906cee2f.1327426808.git.raj.khem@gmail.com>
In-Reply-To: <cover.1327426808.git.raj.khem@gmail.com>
References: <cover.1327426808.git.raj.khem@gmail.com>
Subject: [PATCH 4/7] uclibc: Dont package all .a in uclibc-dev
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
X-List-Received-Date: Tue, 24 Jan 2012 17:51:04 -0000

only *_nonshared.a are to be packaged in uclibc-dev
rest can go into uclibc-staticdev

Signed-off-by: Khem Raj <raj.khem@gmail.com>
---
 meta/recipes-core/uclibc/uclibc.inc |    3 +--
 1 files changed, 1 insertions(+), 2 deletions(-)

diff --git a/meta/recipes-core/uclibc/uclibc.inc b/meta/recipes-core/uclibc/uclibc.inc
index 0779221..5e9e2e9 100644
--- a/meta/recipes-core/uclibc/uclibc.inc
+++ b/meta/recipes-core/uclibc/uclibc.inc
@@ -13,7 +13,7 @@ SECTION = "libs"
 LIC_FILES_CHKSUM = "file://COPYING.LIB;md5=a6f89e2100d9b6cdffcea4f398e37343 \
 		    file://COPYING.LIB.boilerplate;md5=aaddeadcddeb918297e0e4afc52ce46f \
 file://${S}/test/regex/testregex.c;startline=1;endline=31;md5=234efb227d0a40677f895e4a1e26e960"
-INC_PR = "r4"
+INC_PR = "r5"
 
 require uclibc-config.inc
 STAGINGCC = "gcc-cross-intermediate"
@@ -75,7 +75,6 @@ FILES_${PN}-dev_append = "\
         ${libdir}/*_nonshared.a \
         ${libdir}/[S]*crt[1in].o \
         ${libdir}/crtreloc*.o \
-        ${libdir}/lib*.a \
         ${includedir}/*.h ${includedir}/*/*.h \
        "
 FILES_uclibc-utils = "${bindir} ${sbindir}"
-- 
1.7.8.3



