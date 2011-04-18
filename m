Received: from mail-fx0-f47.google.com ([209.85.161.47])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <martin.jansa@gmail.com>) id 1QBjQ8-0003uB-IC
	for openembedded-core@lists.openembedded.org;
	Mon, 18 Apr 2011 10:02:56 +0200
Received: by mail-fx0-f47.google.com with SMTP id 19so3288161fxm.6
	for <openembedded-core@lists.openembedded.org>;
	Mon, 18 Apr 2011 01:00:38 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=domainkey-signature:from:to:cc:subject:date:message-id:x-mailer
	:in-reply-to:references;
	bh=gDDK0fC67XgVbHfLSlwS1c9HgzuYWPO9gQjP2xtQyqA=;
	b=o+bM/EscxvNT462EoahoV89lKy8mw1TfJu8G2IRKN21PL9GDbBTCg7WmAbrnEblp+5
	ty7MeLC1OeIZUKd+EAR30gY/uVfhHMcCY1YlJP0valcZHdyXozzMC1IdZ2GXpJZ83MRB
	XnQnfAcUkk4ClfgLyIToOSIQ5AMqKH1Buvo4g=
DomainKey-Signature: a=rsa-sha1; c=nofws; d=gmail.com; s=gamma;
	h=from:to:cc:subject:date:message-id:x-mailer:in-reply-to:references;
	b=XgY1qRGUE6W4LmGWD59lkIRia9pLO7GFcCtHTmRnKU5q5K5HtyRRhS1zmzAWLV4d/4
	+qA0Hl0hbyj7TZzZkIhdWzYJ2p5wAPq9e9I0JhiH3tuyxpNUYmKRB0kegLpT2R/OSWmw
	79dplCxNEYCxCwFGeykOy/xHRoGsre8oOKTjE=
Received: by 10.223.72.132 with SMTP id m4mr498616faj.86.1303113638782;
	Mon, 18 Apr 2011 01:00:38 -0700 (PDT)
Received: from localhost (161-24.13.24.78.awnet.cz [78.24.13.161])
	by mx.google.com with ESMTPS id j11sm1572934faa.20.2011.04.18.01.00.37
	(version=TLSv1/SSLv3 cipher=OTHER);
	Mon, 18 Apr 2011 01:00:38 -0700 (PDT)
From: Martin Jansa <martin.jansa@gmail.com>
To: openembedded-core@lists.openembedded.org
Date: Mon, 18 Apr 2011 10:00:32 +0200
Message-Id: <82e7534dc19afc4236082b989988c65e025efb80.1303113405.git.Martin.Jansa@gmail.com>
X-Mailer: git-send-email 1.7.5.rc1
In-Reply-To: <cover.1303113405.git.Martin.Jansa@gmail.com>
References: <cover.1303113405.git.Martin.Jansa@gmail.com>
Subject: [PATCH 4/4] python-dir.bbclass: define default PYTHON_BASEVERSION
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
X-List-Received-Date: Mon, 18 Apr 2011 08:02:56 -0000

Signed-off-by: Martin Jansa <Martin.Jansa@gmail.com>
---
 meta/classes/python-dir.bbclass |    1 +
 1 files changed, 1 insertions(+), 0 deletions(-)

diff --git a/meta/classes/python-dir.bbclass b/meta/classes/python-dir.bbclass
index a072a93..1ceb929 100644
--- a/meta/classes/python-dir.bbclass
+++ b/meta/classes/python-dir.bbclass
@@ -1,2 +1,3 @@
+PYTHON_BASEVERSION ?= "2.6"
 PYTHON_DIR = "python${PYTHON_BASEVERSION}"
 PYTHON_SITEPACKAGES_DIR = "${libdir}/${PYTHON_DIR}/site-packages"
-- 
1.7.5.rc1



