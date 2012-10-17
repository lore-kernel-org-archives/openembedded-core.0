Received: from mail-pb0-f47.google.com ([209.85.160.47])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <sgw@bigsur.com>) id 1TOWzr-0000qX-UF
	for openembedded-core@lists.openembedded.org;
	Wed, 17 Oct 2012 19:01:50 +0200
Received: by mail-pb0-f47.google.com with SMTP id ro12so6496803pbb.6
	for <openembedded-core@lists.openembedded.org>;
	Wed, 17 Oct 2012 09:48:12 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=bigsur.com; s=bigsur.com;
	h=sender:from:to:subject:date:message-id:x-mailer;
	bh=nIZARlf/qNmbQYwBDCh3xZlRwcn6sj5nLcO/2HF4aYs=;
	b=HxbisjC7rsuKEjtJXMYu2Lc8EZCc/YQD+qj5AtY33vuDNB8L0YXY7KrRouLd6ez+Sd
	/rcUSIQ/yD1dQQ8s80GBdrvkY0uJWuMBvucqKDd9rQSoReIN8pCkGbpmZEVbL/FOqWvz
	ROHFfaPvaUHWX1DWTZVf7nk7+OwtmKnTeXbA4=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=google.com; s=20120113;
	h=sender:from:to:subject:date:message-id:x-mailer:x-gm-message-state;
	bh=nIZARlf/qNmbQYwBDCh3xZlRwcn6sj5nLcO/2HF4aYs=;
	b=K2SbojY42wQmlGecAN4BR1yCHylLC/tzElOwhxwKEE1CDl+2G43AUOkZZ964V4J8n6
	Ni2Mpb/a9vEa/j/vgoDzkwl4XlAWbrU+b6ti5Ei8wdaVDFncly/05c6lAEn6fH/xCnJ7
	Z6lOrbtoDcY258zU/5vsHYtuqIvbFNybeFpZfW4TQRZqajauvMTr9hT4sU808pQZ7aGX
	+FrSfdYYZt95rBAVh0KM0pHI3pOHuCqkYP3U1jqd8ZtJsGf9BxQztOUYpLsJQ/rWmiLN
	H4IVvp+8ST/WZIg0x0QIMYyLdLhuvhzoBmeszuJJBfnee4kGKRXFMjYwjcyj9IlPnVRv
	vonA==
Received: by 10.66.72.134 with SMTP id d6mr52099900pav.13.1350492492402;
	Wed, 17 Oct 2012 09:48:12 -0700 (PDT)
Received: from localhost (c-71-193-189-117.hsd1.wa.comcast.net.
	[71.193.189.117])
	by mx.google.com with ESMTPS id c5sm12853668pay.5.2012.10.17.09.48.07
	(version=TLSv1/SSLv3 cipher=OTHER);
	Wed, 17 Oct 2012 09:48:07 -0700 (PDT)
Sender: Saul Wold <sgw@bigsur.com>
From: Saul Wold <sgw@linux.intel.com>
To: openembedded-core@lists.openembedded.org
Date: Wed, 17 Oct 2012 09:47:51 -0700
Message-Id: <1350492471-29526-1-git-send-email-sgw@linux.intel.com>
X-Mailer: git-send-email 1.7.9.5
X-Gm-Message-State: ALoCoQnD4FpaEoj8SyuN+ef2bdBw4brmJteMU/Snds3JvWghFKT3/aBsv+xrTJ8JlIsfAYR33znJ
Subject: [PATCH 1/2] perf: set the perfexecdir
X-BeenThere: openembedded-core@lists.openembedded.org
X-Mailman-Version: 2.1.11
Precedence: list
List-Id: Patches and discussions about the oe-core layer
	<openembedded-core.lists.openembedded.org>
List-Unsubscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/options/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.linuxtogo.org/pipermail/openembedded-core>
List-Post: <mailto:openembedded-core@lists.openembedded.org>
List-Help: <mailto:openembedded-core-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Wed, 17 Oct 2012 17:01:55 -0000

This allows the files installed into /usr/libexec to be
relocated to ${libexecdir}. removed unneded prefix=/usr,
which would prevent ${prefix} relocation.

Signed-off-by: Saul Wold <sgw@linux.intel.com>
---
 meta/recipes-kernel/perf/perf_3.4.bb |    2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta/recipes-kernel/perf/perf_3.4.bb b/meta/recipes-kernel/perf/perf_3.4.bb
index decc911..b094362 100644
--- a/meta/recipes-kernel/perf/perf_3.4.bb
+++ b/meta/recipes-kernel/perf/perf_3.4.bb
@@ -63,7 +63,7 @@ EXTRA_OEMAKE = \
 		ARCH=${ARCH} \
 		CC="${CC}" \
 		AR="${AR}" \
-		prefix=/usr \
+		perfexecdir=${libexecdir} \
 		NO_GTK2=1 ${TUI_DEFINES} NO_DWARF=1 ${SCRIPTING_DEFINES} \
 		'
 
-- 
1.7.9.5



