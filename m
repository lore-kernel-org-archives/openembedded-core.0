Received: from mail-gx0-f175.google.com ([209.85.161.175])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <raj.khem@gmail.com>) id 1QtSJV-0005WX-1i
	for openembedded-core@lists.openembedded.org;
	Wed, 17 Aug 2011 00:40:50 +0200
Received: by gxk3 with SMTP id 3so330274gxk.6
	for <openembedded-core@lists.openembedded.org>;
	Tue, 16 Aug 2011 15:36:11 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=from:to:subject:date:message-id:x-mailer:in-reply-to:references
	:in-reply-to:references;
	bh=ieJmQpzVrFgBrV3UlCIYCN79X/9j4hb45lzhiNEseww=;
	b=uuXOg5YNLl+gZQWYmIdFw3mXvPgd+D1ed5Km1oFidVWzWGKkUuYxil0QIyP26XO2Z0
	ZfKW1PyPGv/6jOINSoUETBC+x0Yzmf2duoTzFEHrxOwlTGaNGcxsd7CqrCccZqBgN6+7
	WhISf8QyAECZ9dF19KQAk47EzfJizJtGh4f8M=
Received: by 10.236.181.66 with SMTP id k42mr899967yhm.253.1313534171153;
	Tue, 16 Aug 2011 15:36:11 -0700 (PDT)
Received: from localhost.localdomain
	(99-57-141-118.lightspeed.sntcca.sbcglobal.net [99.57.141.118])
	by mx.google.com with ESMTPS id c63sm581513yhe.18.2011.08.16.15.36.10
	(version=TLSv1/SSLv3 cipher=OTHER);
	Tue, 16 Aug 2011 15:36:10 -0700 (PDT)
From: Khem Raj <raj.khem@gmail.com>
To: openembedded-core@lists.openembedded.org
Date: Tue, 16 Aug 2011 15:35:51 -0700
Message-Id: <39cf134434cfb41c57ab76560874c0842a7f0199.1313533911.git.raj.khem@gmail.com>
X-Mailer: git-send-email 1.7.5.4
In-Reply-To: <fcafbb92c3e07d372066a36e6af2dc13f0a99a1f.1313533911.git.raj.khem@gmail.com>
References: <fcafbb92c3e07d372066a36e6af2dc13f0a99a1f.1313533911.git.raj.khem@gmail.com>
In-Reply-To: <cover.1313533911.git.raj.khem@gmail.com>
References: <cover.1313533911.git.raj.khem@gmail.com>
Subject: [PATCH 4/5] gdb: Add lttng-ust to DEPENDS only for eglibc
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
X-List-Received-Date: Tue, 16 Aug 2011 22:40:50 -0000

Signed-off-by: Khem Raj <raj.khem@gmail.com>
---
 meta/recipes-devtools/gdb/gdb-common.inc |   11 +++++++++--
 1 files changed, 9 insertions(+), 2 deletions(-)

diff --git a/meta/recipes-devtools/gdb/gdb-common.inc b/meta/recipes-devtools/gdb/gdb-common.inc
index df6c70f..9879e97 100644
--- a/meta/recipes-devtools/gdb/gdb-common.inc
+++ b/meta/recipes-devtools/gdb/gdb-common.inc
@@ -2,9 +2,16 @@ DESCRIPTION = "gdb - GNU debugger"
 HOMEPAGE = "http://www.gnu.org/software/gdb/"
 LICENSE="GPLv3+"
 SECTION = "devel"
-DEPENDS = "ncurses readline elfutils lttng-ust"
+DEPENDS = "ncurses readline elfutils ${LTTNGUST}"
 
-INC_PR = "r2"
+LTTNGUST = "lttng-ust"
+LTTNGUST_libc-uclibc = ""
+LTTNGUST_mips = ""
+LTTNGUST_mipsel = ""
+LTTNGUST_mips64 = ""
+LTTNGUST_mips64el = ""
+
+INC_PR = "r3"
 
 LIC_FILES_CHKSUM = "file://COPYING;md5=59530bdf33659b29e73d4adb9f9f6552 \
 		file://COPYING.LIB;md5=9f604d8a4f8e74f4f5140845a21b6674 \
-- 
1.7.5.4



