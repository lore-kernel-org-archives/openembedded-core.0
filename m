Received: from mail-pz0-f47.google.com ([209.85.210.47])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <steve@sakoman.com>) id 1RzvBb-000308-8q
	for openembedded-core@lists.openembedded.org;
	Tue, 21 Feb 2012 20:15:39 +0100
Received: by daln34 with SMTP id n34so6004614dal.6
	for <openembedded-core@lists.openembedded.org>;
	Tue, 21 Feb 2012 11:07:19 -0800 (PST)
Received-SPF: pass (google.com: domain of steve@sakoman.com designates
	10.68.218.5 as permitted sender) client-ip=10.68.218.5; 
Authentication-Results: mr.google.com;
	spf=pass (google.com: domain of steve@sakoman.com
	designates 10.68.218.5 as permitted sender)
	smtp.mail=steve@sakoman.com
Received: from mr.google.com ([10.68.218.5])
	by 10.68.218.5 with SMTP id pc5mr78214894pbc.101.1329851239011
	(num_hops = 1); Tue, 21 Feb 2012 11:07:19 -0800 (PST)
MIME-Version: 1.0
Received: by 10.68.218.5 with SMTP id pc5mr64519224pbc.101.1329851238966;
	Tue, 21 Feb 2012 11:07:18 -0800 (PST)
Received: from quadra.sakoman.net
	(static-74-41-60-154.dsl1.pco.ca.frontiernet.net. [74.41.60.154])
	by mx.google.com with ESMTPS id m5sm16725791pbo.69.2012.02.21.11.07.17
	(version=SSLv3 cipher=OTHER); Tue, 21 Feb 2012 11:07:18 -0800 (PST)
From: Steve Sakoman <steve@sakoman.com>
To: openembedded-core@lists.openembedded.org
Date: Tue, 21 Feb 2012 11:07:09 -0800
Message-Id: <1329851229-31625-1-git-send-email-steve@sakoman.com>
X-Mailer: git-send-email 1.7.1
X-Gm-Message-State: ALoCoQmEmpZlz38qiu+M9AA3/cMKinKYuCmUytbAOwB0H6aYeTGuFLxtJIcxNMjJmbHluB81LMtZ
Cc: Steve Sakoman <steve@sakoman.com>
Subject: [PATCH] libxml2: add missing dependency on binutils
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
X-List-Received-Date: Tue, 21 Feb 2012 19:15:39 -0000

Otherwise build fails with following error:

| In file included from libxml.h:36:0,
|                  from xmlmemory.c:8:
| ./include/libxml/xmlversion.h:396:22: fatal error: ansidecl.h: No such file or directory

Signed-off-by: Steve Sakoman <steve@sakoman.com>
---
 meta/recipes-core/libxml/libxml2.inc |    2 +-
 1 files changed, 1 insertions(+), 1 deletions(-)

diff --git a/meta/recipes-core/libxml/libxml2.inc b/meta/recipes-core/libxml/libxml2.inc
index 0979acd..6230f60 100644
--- a/meta/recipes-core/libxml/libxml2.inc
+++ b/meta/recipes-core/libxml/libxml2.inc
@@ -10,7 +10,7 @@ LIC_FILES_CHKSUM = "file://Copyright;md5=bb90c48926316d9af6e2d70ca7013ade \
                     file://trio.c;beginline=5;endline=14;md5=6c025753c86d958722ec76e94cae932e"
 
 DEPENDS_virtclass-native = "python-native"
-DEPENDS =+ "zlib"
+DEPENDS =+ "zlib binutils"
 
 SRC_URI = "ftp://xmlsoft.org/libxml2/libxml2-${PV}.tar.gz \
            file://libxml-64bit.patch"
-- 
1.7.1



