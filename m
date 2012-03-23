Received: from mail-wg0-f43.google.com ([74.125.82.43])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <martin.jansa@gmail.com>) id 1SBD9X-0006yx-Fe
	for openembedded-core@lists.openembedded.org;
	Fri, 23 Mar 2012 23:40:12 +0100
Received: by wgbdr12 with SMTP id dr12so2180728wgb.24
	for <openembedded-core@lists.openembedded.org>;
	Fri, 23 Mar 2012 15:31:14 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=from:to:subject:date:message-id:x-mailer:in-reply-to:references
	:in-reply-to:references;
	bh=wFio1MGvn84ucalyYZHJjNawUlUlPbAnETrKMlKekKQ=;
	b=SI5RYoIaBC/aVweWK1N+UwpEfGRsHzFYHmNW0A8NNJSbkMedWoIeXgcVG3uUxJwDwv
	qjx13rJdllDWTBS14zDgc4MHtego1LOUylNZFnBHjprskTnmvBUgafsOfsEzwFDYVQna
	xUHPRN/z6Il96X1m0MwUDiigQJcVB2ia8cYE2kjEYstPCaeod8jf0D4LXIOn2JBDh8Ro
	RD6Tqv/H+s3L+n8U3V3MFiBcADsgXguaNny4FKCOu0YNkxTK0EM/ZJrzesqEKE/1ErQ1
	wiecNH6gL/Ohy27dV207UwZOMOEVkNrvvfHEtKkFR8nKeq1nRuiaGrUxObojmMa8QyNa
	JFtQ==
Received: by 10.180.88.199 with SMTP id bi7mr625072wib.12.1332541874926;
	Fri, 23 Mar 2012 15:31:14 -0700 (PDT)
Received: from localhost ([94.230.152.246])
	by mx.google.com with ESMTPS id ex2sm28651379wib.8.2012.03.23.15.31.13
	(version=TLSv1/SSLv3 cipher=OTHER);
	Fri, 23 Mar 2012 15:31:14 -0700 (PDT)
From: Martin Jansa <martin.jansa@gmail.com>
To: openembedded-core@lists.openembedded.org
Date: Fri, 23 Mar 2012 23:30:43 +0100
Message-Id: <b24fa68cf829750ca4ab279fb898ef153e6fe403.1332541342.git.Martin.Jansa@gmail.com>
X-Mailer: git-send-email 1.7.8.5
In-Reply-To: <af4afbb6196cc0f3bacdca43776ae952c7bf4b05.1332541342.git.Martin.Jansa@gmail.com>
References: <af4afbb6196cc0f3bacdca43776ae952c7bf4b05.1332541342.git.Martin.Jansa@gmail.com>
In-Reply-To: <cover.1332541342.git.Martin.Jansa@gmail.com>
References: <cover.1332541342.git.Martin.Jansa@gmail.com>
Subject: [PATCHv 04/10] librsvg: import native support from meta-oe
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
X-List-Received-Date: Fri, 23 Mar 2012 22:40:12 -0000

Signed-off-by: Martin Jansa <Martin.Jansa@gmail.com>
---
 meta/recipes-gnome/librsvg/librsvg_2.32.1.bb |    2 ++
 1 files changed, 2 insertions(+), 0 deletions(-)

diff --git a/meta/recipes-gnome/librsvg/librsvg_2.32.1.bb b/meta/recipes-gnome/librsvg/librsvg_2.32.1.bb
index 1e57647..4e4e339 100644
--- a/meta/recipes-gnome/librsvg/librsvg_2.32.1.bb
+++ b/meta/recipes-gnome/librsvg/librsvg_2.32.1.bb
@@ -8,6 +8,8 @@ LIC_FILES_CHKSUM = "file://COPYING;md5=94d55d512a9ba36caa9b7df079bae19f \
 
 SECTION = "x11/utils"
 DEPENDS = "gtk+ libcroco cairo libxml2 popt"
+DEPENDS_virtclass-native = "cairo-native pango-native gdk-pixbuf-native"
+BBCLASSEXTEND = "native"
 
 PR = "r5"
 
-- 
1.7.8.5



