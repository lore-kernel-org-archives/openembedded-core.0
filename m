Return-Path: <michael.g.wood@intel.com>
Received: from mail-wm0-f52.google.com (mail-wm0-f52.google.com [74.125.82.52])
	by mail.openembedded.org (Postfix) with ESMTP id 2FF6E770E3
	for <openembedded-core@lists.openembedded.org>;
	Wed,  6 Apr 2016 17:00:48 +0000 (UTC)
Received: by mail-wm0-f52.google.com with SMTP id v188so29991791wme.1
	for <openembedded-core@lists.openembedded.org>;
	Wed, 06 Apr 2016 10:00:49 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=intel-com.20150623.gappssmtp.com; s=20150623;
	h=from:to:cc:subject:date:message-id:in-reply-to:references;
	bh=iERXncdwoPVhRi6M1+miJlLrATtiM89k3bH7boFNROM=;
	b=G3pYvwOiwpHBkN83CdzgYqVXqYOTg9YWgc0fBRnjhN+CG1KrWteA3PiBg9zOBq0sAP
	+yyWW8y+pTbucPuCic6W4pgyR6j9NcTZ5aQXaRUu6HKMX43nYFwcwOm3ypMgv1N1SHJj
	f3pzNH4Qt5ZySp5EzPZLQDK6o6LENlbyPu/ZjIzTg7mo2bbF3VHLQ1JzPlRSc7wXs7YM
	IDZn349iOuljUeOfh+ReLxsAC19z4bopPkS5RDQLsIO5Cda0cuDMctQKN8iha/nE0UE+
	zgS+HGQfOKn/o/p4xRv7t2uhtoqr6KVbfAjBsNR2PMqjYzUoj+jZy/w2JS64SjPEtzFk
	0gCg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
	:references;
	bh=iERXncdwoPVhRi6M1+miJlLrATtiM89k3bH7boFNROM=;
	b=GBjEtf6MPfiZTXK/SvLyBVofQqTihUYdoYj4gtnK2uPl2psAST0zPNxQbYV720OZ0W
	8WAr2e7klHei9rDbRC+hrDwtX4FgoZg5OhMm6XfF9Gavr+KWO+wMJKKDARnAiOZ3zEzJ
	rTivf2BCadpw0bEoJAQ0r3Ypw0ntfOZMa12iXoy8DdXbbqwMo4G1FK/c6xQtz3dykLx/
	IeuFjLouzen3K7y3djiIQ21lqoLaweqVauPx4ao55KJrBncBS7rTng9dA94gIR9fqKWZ
	dNJTzFHe+Yf66ZTiFpN5tZRpzPEdpG//rv6hpLAVt3yIZAUZUHzRNGfhu0PLE3/8cg/8
	6GHw==
X-Gm-Message-State: AD7BkJJZIVDDIDObL/2PImv2Sz0O76WWwPcjMt9ypk4iUVmzyqlx2iRDc6FiledzFuRRP8IH
X-Received: by 10.28.53.4 with SMTP id c4mr25797141wma.34.1459962048997;
	Wed, 06 Apr 2016 10:00:48 -0700 (PDT)
Received: from draco.icx.intel.com ([83.217.123.106])
	by smtp.gmail.com with ESMTPSA id
	l135sm4630344wmb.13.2016.04.06.10.00.47
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
	Wed, 06 Apr 2016 10:00:48 -0700 (PDT)
From: Michael Wood <michael.g.wood@intel.com>
To: openembedded-core@lists.openembedded.org
Date: Wed,  6 Apr 2016 18:00:42 +0100
Message-Id: <1459962043-30259-2-git-send-email-michael.g.wood@intel.com>
X-Mailer: git-send-email 2.1.4
In-Reply-To: <1459962043-30259-1-git-send-email-michael.g.wood@intel.com>
References: <1459962043-30259-1-git-send-email-michael.g.wood@intel.com>
Subject: [PATCH] toaster: add DL_DIR and SSTATE_DIR to oe toasterconf
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
X-List-Received-Date: Wed, 06 Apr 2016 17:00:50 -0000

From: Ed Bartosh <ed.bartosh@linux.intel.com>

Signed-off-by: Ed Bartosh <ed.bartosh@linux.intel.com>
Signed-off-by: Michael Wood <michael.g.wood@intel.com>
---
 meta/conf/toasterconf.json | 4 +++-
 1 file changed, 3 insertions(+), 1 deletion(-)

diff --git a/meta/conf/toasterconf.json b/meta/conf/toasterconf.json
index 1987793..bbd40e9 100644
--- a/meta/conf/toasterconf.json
+++ b/meta/conf/toasterconf.json
@@ -2,9 +2,11 @@
     "config": {
         "MACHINE"      : "qemux86",
         "DISTRO"       : "poky",
+        "DL_DIR"       : "${TOPDIR}/../downloads",
         "IMAGE_FSTYPES": "ext3 jffs2 tar.bz2",
         "IMAGE_INSTALL_append": "",
-        "PACKAGE_CLASSES": "package_rpm"
+        "PACKAGE_CLASSES": "package_rpm",
+        "SSTATE_DIR"   : "${TOPDIR}/../sstate-cache"
     },
     "layersources": [
         {
-- 
2.1.4


