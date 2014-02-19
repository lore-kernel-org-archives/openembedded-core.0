Return-Path: <martin.jansa@gmail.com>
Received: from mail-ea0-f169.google.com (mail-ea0-f169.google.com
	[209.85.215.169])
	by mail.openembedded.org (Postfix) with ESMTP id 102486F1AB
	for <openembedded-core@lists.openembedded.org>;
	Wed, 19 Feb 2014 08:00:54 +0000 (UTC)
Received: by mail-ea0-f169.google.com with SMTP id h10so160082eak.0
	for <openembedded-core@lists.openembedded.org>;
	Wed, 19 Feb 2014 00:00:55 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=from:to:cc:subject:date:message-id:in-reply-to:references;
	bh=X0Dol/YVUhcCRWFZCp0lT/00kte4WyxaDzADpzhDl3I=;
	b=ZtDZKA2t8V6poUFrW97PVywwdrMK8ZX6wLcNwfqzo6yfzLUELPX5ekhasWS1nJMjei
	sFssc/a7cDWo+GiTP+o3ewpq9gY6nbxHqKxZb3zJNO39tNmD1DYI4363csqs05YfqQ6l
	XkJ2pzlgXfxg92aLnoyaQBcEd3BdzOtt2MRjTRQPnHcsa+3SvavxPY0H+a7MmBGtBOqg
	bYYdQN1lhmZFe4to9l3jJiayIX74Y9HxZrOq5rB/L3KiCTqDEKvoAUYRJKE/NgOGbR+o
	d5xYX7RiQNKUa2kWSrBtR9IqkdiPgG54XwkTIwaq9Zvq/xg0LA6A5QrJr00EBen15zhh
	qP8w==
X-Received: by 10.14.246.68 with SMTP id p44mr1953122eer.72.1392796855462;
	Wed, 19 Feb 2014 00:00:55 -0800 (PST)
Received: from localhost (ip-89-176-104-3.net.upcbroadband.cz. [89.176.104.3])
	by mx.google.com with ESMTPSA id
	y47sm80100095eel.14.2014.02.19.00.00.54 for <multiple recipients>
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Wed, 19 Feb 2014 00:00:54 -0800 (PST)
From: Martin Jansa <martin.jansa@gmail.com>
To: openembedded-core@lists.openembedded.org
Date: Wed, 19 Feb 2014 09:01:24 +0100
Message-Id: <1392796884-8665-1-git-send-email-Martin.Jansa@gmail.com>
X-Mailer: git-send-email 1.8.5.3
In-Reply-To: <20140219075627.GA3854@jama>
References: <20140219075627.GA3854@jama>
Subject: [PATCH] package_manager.py: Fix $i -> %s in bb.note
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
X-List-Received-Date: Wed, 19 Feb 2014 08:00:55 -0000

* change the text a bit, because I have trouble parsing two
  verbs at the beginning of sentence.

Signed-off-by: Martin Jansa <Martin.Jansa@gmail.com>
---
 meta/lib/oe/package_manager.py | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta/lib/oe/package_manager.py b/meta/lib/oe/package_manager.py
index 6dc8fbd..0b376b7 100644
--- a/meta/lib/oe/package_manager.py
+++ b/meta/lib/oe/package_manager.py
@@ -1165,7 +1165,7 @@ class OpkgPM(PackageManager):
                              "returned %d:\n%s" % (pkg_info, e.returncode, e.output))
 
                 if output == "":
-                    bb.note("Requested ignored recommendation $i is "
+                    bb.note("Ignored bad recommendation: '%s' is "
                             "not a package" % pkg)
                     continue
 
-- 
1.8.5.3


