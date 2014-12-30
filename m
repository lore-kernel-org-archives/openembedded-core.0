Return-Path: <otavio.salvador@gmail.com>
Received: from mail-vc0-f171.google.com (mail-vc0-f171.google.com
	[209.85.220.171])
	by mail.openembedded.org (Postfix) with ESMTP id 242D760232
	for <openembedded-core@lists.openembedded.org>;
	Tue, 30 Dec 2014 16:25:55 +0000 (UTC)
Received: by mail-vc0-f171.google.com with SMTP id hy4so5813220vcb.2
	for <openembedded-core@lists.openembedded.org>;
	Tue, 30 Dec 2014 08:25:56 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=sender:from:to:cc:subject:date:message-id:in-reply-to:references
	:organization; bh=1XfntlYttJUy6GeQiYC866HqvzqlDVkyZCfh/wjx5fg=;
	b=T1Ej/shORQvNs9zvSV7C++R+PUgjju128cjTpLaxlqyXkU89Vkt7CUlWqoqAPkviN/
	0qcE4k0U7iBhvgT2XhG1edjPSsvBTSXjbuUkiCz5k+bmry2WYYKVrUCSYbU75obA/iKB
	jo/hvIGbQbXxcMs7TaGk42w2/N0BybQ8Wjip4/GZ74w+pKxTF4T9nW+2+HelYxRgl0//
	JNUseFvP7qKzEi2YwNmncwrxUadQU1oa5zZIqfq8AukPxeNo2QZ/5Tov6BdzvOSGHiyo
	fGBQYiC1IXIijqFGqgjgqBS0wl2tkwLrTt0nGjvCIcvxck6lHdHiMd0Q7PH27hxsIAjr
	XEUw==
X-Received: by 10.52.166.102 with SMTP id zf6mr29871542vdb.25.1419956756070;
	Tue, 30 Dec 2014 08:25:56 -0800 (PST)
Received: from nano.lab.ossystems.com.br ([177.100.225.47])
	by mx.google.com with ESMTPSA id h5sm5944570vds.10.2014.12.30.08.25.54
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Tue, 30 Dec 2014 08:25:54 -0800 (PST)
Sender: Otavio Salvador <otavio.salvador@gmail.com>
Received: by nano.lab.ossystems.com.br (Postfix, from userid 1000)
	id 4978B1C9F1E43; Tue, 30 Dec 2014 14:25:52 -0200 (BRST)
From: Otavio Salvador <otavio@ossystems.com.br>
To: OpenEmbedded Core Mailing List <openembedded-core@lists.openembedded.org>
Date: Tue, 30 Dec 2014 14:25:50 -0200
Message-Id: <1419956751-12552-2-git-send-email-otavio@ossystems.com.br>
X-Mailer: git-send-email 2.1.4
In-Reply-To: <1419956751-12552-1-git-send-email-otavio@ossystems.com.br>
References: <1419956751-12552-1-git-send-email-otavio@ossystems.com.br>
Organization: O.S. Systems Software LTDA.
Cc: Otavio Salvador <otavio@ossystems.com.br>
Subject: [PATCH 2/3] lttng-tools: Update to 2.5.3 version
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
X-List-Received-Date: Tue, 30 Dec 2014 16:25:59 -0000

Signed-off-by: Otavio Salvador <otavio@ossystems.com.br>
---
 .../lttng/{lttng-tools_2.5.0.bb => lttng-tools_2.5.3.bb}               | 3 +--
 1 file changed, 1 insertion(+), 2 deletions(-)
 rename meta/recipes-kernel/lttng/{lttng-tools_2.5.0.bb => lttng-tools_2.5.3.bb} (97%)

diff --git a/meta/recipes-kernel/lttng/lttng-tools_2.5.0.bb b/meta/recipes-kernel/lttng/lttng-tools_2.5.3.bb
similarity index 97%
rename from meta/recipes-kernel/lttng/lttng-tools_2.5.0.bb
rename to meta/recipes-kernel/lttng/lttng-tools_2.5.3.bb
index fd44aa5..87052eb 100644
--- a/meta/recipes-kernel/lttng/lttng-tools_2.5.0.bb
+++ b/meta/recipes-kernel/lttng/lttng-tools_2.5.3.bb
@@ -12,8 +12,7 @@ LIC_FILES_CHKSUM = "file://LICENSE;md5=01d7fc4496aacf37d90df90b90b0cac1 \
 DEPENDS = "liburcu popt lttng-ust libxml2"
 RDEPENDS_${PN}-ptest += "make perl bash"
 
-SRCREV = "8b27cacb277c2cdab791139b08da8eb87ab14a88"
-PV = "v2.5.0"
+SRCREV = "75d966798cf8cbe8ca12773c2bf2822983bd78a3"
 
 PYTHON_OPTION = "am_cv_python_pyexecdir='${libdir}/python${PYTHON_BASEVERSION}/site-packages' \
                  am_cv_python_pythondir='${libdir}/python${PYTHON_BASEVERSION}/site-packages' \
-- 
2.1.4


