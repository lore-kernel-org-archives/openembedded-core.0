Received: from mail-iw0-f175.google.com ([209.85.214.175])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <raj.khem@gmail.com>) id 1Q5W1a-0005BA-OX
	for openembedded-core@lists.openembedded.org;
	Fri, 01 Apr 2011 06:31:54 +0200
Received: by iwn10 with SMTP id 10so3432253iwn.6
	for <openembedded-core@lists.openembedded.org>;
	Thu, 31 Mar 2011 21:29:50 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=domainkey-signature:from:to:cc:subject:date:message-id:x-mailer
	:in-reply-to:references;
	bh=VTYUls5TlnFUqViUshP+yCyTP3LVjaqk/FxaJm2me7Y=;
	b=ZfIDwUvZ+76UiD7XpuTHGD5I3zow6JqGQMYGOm4htAuFFWpD6HTV6VJvkQyPju+S3N
	OcIHgqjbXvchSVWpDHbEdMTJBPqLQmE+hFH8UriGQY957BJtZ4Qi7c2VSoOJ5HOiOvyf
	oP2TZLhwSqPew5/LV/Up59NbUX3TzlDBIWx88=
DomainKey-Signature: a=rsa-sha1; c=nofws; d=gmail.com; s=gamma;
	h=from:to:cc:subject:date:message-id:x-mailer:in-reply-to:references;
	b=ZyYgaZZO0kBTiKrkXo6KcOmMR+0PkRnvoP2N0/EY3+UkLtrNIXCDjE+R2Hk2e6ZcMy
	ofd2tHui0vg8NENc9tCReYBtoGGAJR5q8TNe/oXLvoKDXmNGRaDQfgIamIHMd4W54SCs
	/YhzSNCUkMtGOM0HgrXJ2f+5wYcyWA1UAOlNk=
Received: by 10.231.117.157 with SMTP id r29mr3412611ibq.128.1301632178830;
	Thu, 31 Mar 2011 21:29:38 -0700 (PDT)
Received: from localhost.localdomain
	(99-57-141-118.lightspeed.sntcca.sbcglobal.net [99.57.141.118])
	by mx.google.com with ESMTPS id gy41sm1182554ibb.22.2011.03.31.21.29.37
	(version=TLSv1/SSLv3 cipher=OTHER);
	Thu, 31 Mar 2011 21:29:38 -0700 (PDT)
From: Khem Raj <raj.khem@gmail.com>
To: OE core <openembedded-core@lists.openembedded.org>
Date: Thu, 31 Mar 2011 21:29:30 -0700
Message-Id: <9a48f0f3f9de28625cb8b0d86690a9a42fc0ea45.1301631488.git.raj.khem@gmail.com>
X-Mailer: git-send-email 1.7.4.1
In-Reply-To: <cover.1301631488.git.raj.khem@gmail.com>
References: <cover.1301631488.git.raj.khem@gmail.com>
Subject: [PATCH 25/46] gcc-runtime_4.5.1.bb: Do not filter out -feliminate-dwarf2-dups
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
X-List-Received-Date: Fri, 01 Apr 2011 04:31:55 -0000

This is already taken care by bitbake.conf

Signed-off-by: Khem Raj <raj.khem@gmail.com>
---
 meta/recipes-devtools/gcc/gcc-runtime_4.5.1.bb |    5 -----
 1 files changed, 0 insertions(+), 5 deletions(-)

diff --git a/meta/recipes-devtools/gcc/gcc-runtime_4.5.1.bb b/meta/recipes-devtools/gcc/gcc-runtime_4.5.1.bb
index 9d4e158..2127eb6 100644
--- a/meta/recipes-devtools/gcc/gcc-runtime_4.5.1.bb
+++ b/meta/recipes-devtools/gcc/gcc-runtime_4.5.1.bb
@@ -9,8 +9,3 @@ SRC_URI_append = "file://fortran-cross-compile-hack.patch"
 ARCH_FLAGS_FOR_TARGET += "-isystem${STAGING_INCDIR}"
 
 EXTRA_OECONF += "--disable-libunwind-exceptions"
-
-# gcc 4.5 ends up in ICE when using -feliminate-dwarf2-dups in libstdc++
-# compiling pre compiled headers so we remove this option when compiling
-# to workaround it
-CXXFLAGS := "${@oe_filter_out('-feliminate-dwarf2-dups', '${CXXFLAGS}', d)}"
-- 
1.7.4.1



