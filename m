Return-Path: <schnitzeltony@gmail.com>
Received: from mail-wm1-f51.google.com (mail-wm1-f51.google.com
	[209.85.128.51])
	by mail.openembedded.org (Postfix) with ESMTP id 19E7A7FDE8
	for <openembedded-core@lists.openembedded.org>;
	Thu,  9 Jan 2020 20:26:42 +0000 (UTC)
Received: by mail-wm1-f51.google.com with SMTP id 20so4267908wmj.4
	for <openembedded-core@lists.openembedded.org>;
	Thu, 09 Jan 2020 12:26:43 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=from:to:subject:date:message-id:in-reply-to:references:mime-version
	:content-transfer-encoding;
	bh=ctsK01/s5pOWfvbT4fIwb52Bb/UT1KouJ6xjSnlusvk=;
	b=LPWF986wu0w9xeujxm2X53Wr7KlbJmLvCE+OdtVkSzllfggWjjCQaC8TaWtX8sGBHu
	s+hqbllCg158wKHZDbhB8gyEIToZtHSCSC1HQPI8Vs2WzctJ38EqYYCeLz14Afy3c0A5
	zs8UYZkSPVTHovGQ7PyhJwT7juqvEuxZWpgkQ2IAK7WKSy/OYUMVo8x9Y3EHT6JtkTuc
	AmF3W6fhUjl657+PlZhbnVPWm4HgA3mK3T2KFwhFJkTZv1UpNeg+UlK2ulgixJ/X7Ub/
	qYQzsMjvEDTGCDld689mKfv+jOrSHUFr+/gaGYUOMxlwQUY+weOmdnzaHZztpUtjvnzy
	uY0Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
	:references:mime-version:content-transfer-encoding;
	bh=ctsK01/s5pOWfvbT4fIwb52Bb/UT1KouJ6xjSnlusvk=;
	b=QqlrWcDz3YftUoWv2kH4rRIs+XBkK8QlsAqhiPFgoa051bW/MhCBz0cX5OR+yeOodZ
	wr4Ahx6jlXEn6rySbfwsiGDh6pjWYDeWnr2Hb2mdszcb0YbRnQMP+xSE8iesndnw+2i7
	TxAS5cum+B6mVI4Wmz3x3KrWW6l7mzRxQc0DxPFeLn0/xtbQ9T3by5okOgUEDxKn5UMK
	W4RjrnS7TZ/hojO2uyJ1LXJU32OlsoE7Jo3ZyYQOPUp7v2/SAAm8cTzd5Vr74ZesA3k0
	2cQ8j94JTVnUdhoOsptg/gpN9WXrJQy2xf83K4JK55JuBCotO4ftTsr6G59WuCikoaCq
	qxxA==
X-Gm-Message-State: APjAAAVIdRWrIL/+K6SbeWM/bNszTMmv6VwOuKv63HwU99fDwNqyLOM8
	n4DpPaOUPPibGJ1cHXtKjFTPUYZLtbo=
X-Google-Smtp-Source: APXvYqxDTV7JxNKPT1lmqPtCECdy+fiTfHZZ71ZpjLVYRLloXIOP/1mOEooGgbC9Hlm8zXOZF06PtA==
X-Received: by 2002:a7b:cfc9:: with SMTP id f9mr7064279wmm.1.1578601602677;
	Thu, 09 Jan 2020 12:26:42 -0800 (PST)
Received: from superandy.speedport.ip
	(p200300F07F0446528B12EBEBA10192C2.dip0.t-ipconnect.de.
	[2003:f0:7f04:4652:8b12:ebeb:a101:92c2])
	by smtp.gmail.com with ESMTPSA id z6sm9149986wrw.36.2020.01.09.12.26.41
	for <openembedded-core@lists.openembedded.org>
	(version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
	Thu, 09 Jan 2020 12:26:42 -0800 (PST)
From: =?UTF-8?q?Andreas=20M=C3=BCller?= <schnitzeltony@gmail.com>
To: openembedded-core@lists.openembedded.org
Date: Thu,  9 Jan 2020 21:26:22 +0100
Message-Id: <20200109202623.28936-11-schnitzeltony@gmail.com>
X-Mailer: git-send-email 2.21.0
In-Reply-To: <20200109202623.28936-1-schnitzeltony@gmail.com>
References: <20200109202623.28936-1-schnitzeltony@gmail.com>
MIME-Version: 1.0
Subject: [PATCH 10/11] insane.bbclass: Spawn warning for missing mime-xdg in inherit
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
X-List-Received-Date: Thu, 09 Jan 2020 20:26:42 -0000
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

If a package signals that it can open mime-types but does not inharit mime-xdg,
a warning is created.

Signed-off-by: Andreas Müller <schnitzeltony@gmail.com>
---
 meta/classes/insane.bbclass | 20 +++++++++++++++++++-
 1 file changed, 19 insertions(+), 1 deletion(-)

diff --git a/meta/classes/insane.bbclass b/meta/classes/insane.bbclass
index 442e9e5113..4ca39f22ff 100644
--- a/meta/classes/insane.bbclass
+++ b/meta/classes/insane.bbclass
@@ -28,7 +28,7 @@ WARN_QA ?= "ldflags useless-rpaths rpaths staticdev libdir xorg-driver-abi \
             pn-overrides infodir build-deps src-uri-bad \
             unknown-configure-option symlink-to-sysroot multilib \
             invalid-packageconfig host-user-contaminated uppercase-pn patch-fuzz \
-            mime \
+            mime mime-xdg \
             "
 ERROR_QA ?= "dev-so debug-deps dev-deps debug-files arch pkgconfig la \
             perms dep-cmp pkgvarcheck perm-config perm-line perm-link \
@@ -197,6 +197,24 @@ def package_qa_check_mime(path, name, d, elf, messages):
         package_qa_add_message(messages, "mime", "package contains mime types but does not inhert mime.bbclass: %s path '%s'" % \
                  (name, package_qa_clean_path(path,d)))
 
+QAPATHTEST[mime-xdg] = "package_qa_check_mime_xdg"
+def package_qa_check_mime_xdg(path, name, d, elf, messages):
+    """
+    Check if package installs desktop file containing MimeType and requires
+    mime-types.bbclass to create /usr/share/applications/mimeinfo.cache
+    """
+
+    if d.getVar("desktopdir") in path and path.endswith('.desktop') and not bb.data.inherits_class("mime-xdg", d):
+        mime_type_found = False
+        with open(path, 'r') as f:
+            for line in f.read().split('\n'):
+                if 'MimeType' in line:
+                    mime_type_found = True
+                    break;
+        if mime_type_found:
+            package_qa_add_message(messages, "mime-xdg", "package contains desktop file with key 'MimeType' but does not inhert mime-xdg.bbclass: %s path '%s'" % \
+                    (name, package_qa_clean_path(path,d)))
+
 def package_qa_check_libdir(d):
     """
     Check for wrong library installation paths. For instance, catch
-- 
2.21.0


