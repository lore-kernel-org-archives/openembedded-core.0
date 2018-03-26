Return-Path: <akuster808@gmail.com>
Received: from mail-pl0-f66.google.com (mail-pl0-f66.google.com
	[209.85.160.66])
	by mail.openembedded.org (Postfix) with ESMTP id 831DA786C9
	for <openembedded-core@lists.openembedded.org>;
	Mon, 26 Mar 2018 14:31:23 +0000 (UTC)
Received: by mail-pl0-f66.google.com with SMTP id f5-v6so12029664plj.13
	for <openembedded-core@lists.openembedded.org>;
	Mon, 26 Mar 2018 07:31:25 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=from:to:subject:date:message-id:in-reply-to:references;
	bh=XUGF7uEscSrLe7u9IlrUoPH8pvPSjONKM+xUhmJ/Ick=;
	b=nsnwBzMyyuM9z1M8z4edvOmeF+5qNG0Clc2KSHXAAobh5Ggny8y8PpndrXLrEAiP4D
	nXePfHePETtMMI7lS5SwSOdEpAY/xwcLW+GC8+RLeYbViWUm3coreu1H2pNC0H7zL3/H
	BkvHlITklBGi5R9FL54NgdAnYRNaLb1OwC9sO/WD//I5X23gUsJ+I1WEZ0d+ydhcc1Q8
	498xgV8HwadSq2Q/q42DntC5wTZwr9RahPKi0t5+V8mhoVXNYFaMUwZrRroBqaYLgxMe
	spMMKfARgvp6lfLwik4rC01UT+lsLneDEJZYHki/vrOOKW7iKFAY5op2fmBHgf4f9vKQ
	PjdQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
	:references;
	bh=XUGF7uEscSrLe7u9IlrUoPH8pvPSjONKM+xUhmJ/Ick=;
	b=pr2o6HGRSJ18w1XwB1+6PwAE9eJKOgcLDJRjcevYnuq/g7C8zuUmiFsa2vYeoYapni
	MNcUlPrZoTGTmEjMX+Tf4JNu9gQNILq9vbOu2g0Z5J//uY6rTehfhkUBufoHpobqXhX3
	iJLj2QqYE8E2Q63B4OnioqWOKODScvM7WNc0l4VOimqWYKn3BKWz71XZqs593wEbCFBW
	Sz045/4hzpRTTSIWtTTEi65aaCqYtLcn5COrv+Ww3/OOZapNO2wFuElxuriq8MXmWKD1
	YdcFH/zYy+7bS3DopEOqL2hju+p/N5Deo+7Ge7mDK2WCn5NjQQHmZKIpTVIsnjoSY4WM
	7WQA==
X-Gm-Message-State: AElRT7GJGjN+7zaEUWuKshF5EjBizZlhEY3maBsan1u2O1IGXnVkIme9
	v9tEaIVURrm6yngaglvpwXjOlg==
X-Google-Smtp-Source: AG47ELvJFfDINrlw5jNpyZpLcwoXMXlHgP0n0UCD5djP0OyZIjgHfhDGdPaVENgnVoArAiJYWA9fqw==
X-Received: by 2002:a17:902:1006:: with SMTP id
	b6-v6mr11583962pla.252.1522074684854; 
	Mon, 26 Mar 2018 07:31:24 -0700 (PDT)
Received: from akuster-ThinkPad-T460s.hsd1.ca.comcast.net
	([2601:202:4000:1184:203c:a04e:87e9:791b])
	by smtp.gmail.com with ESMTPSA id
	j11sm29932492pff.94.2018.03.26.07.31.24
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
	Mon, 26 Mar 2018 07:31:24 -0700 (PDT)
From: Armin Kuster <akuster808@gmail.com>
To: akuster@mvista.com,
	openembedded-core@lists.openembedded.org
Date: Mon, 26 Mar 2018 07:30:12 -0700
Message-Id: <56ca033c283186a49129c9666ecc0025d83e82c8.1521989435.git.akuster@mvista.com>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <cover.1521989435.git.akuster@mvista.com>
References: <cover.1521989435.git.akuster@mvista.com>
Subject: [PATCH 09/21] gnutls: update to 3.6.2
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
X-List-Received-Date: Mon, 26 Mar 2018 14:31:23 -0000

From: Armin Kuster <akuster@mvista.com>

Signed-off-by: Armin Kuster <akuster@mvista.com>
---
 meta/recipes-support/gnutls/{gnutls_3.6.1.bb => gnutls_3.6.2.bb} | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)
 rename meta/recipes-support/gnutls/{gnutls_3.6.1.bb => gnutls_3.6.2.bb} (54%)

diff --git a/meta/recipes-support/gnutls/gnutls_3.6.1.bb b/meta/recipes-support/gnutls/gnutls_3.6.2.bb
similarity index 54%
rename from meta/recipes-support/gnutls/gnutls_3.6.1.bb
rename to meta/recipes-support/gnutls/gnutls_3.6.2.bb
index 7624a20..e540528 100644
--- a/meta/recipes-support/gnutls/gnutls_3.6.1.bb
+++ b/meta/recipes-support/gnutls/gnutls_3.6.2.bb
@@ -3,7 +3,7 @@ require gnutls.inc
 SRC_URI += "file://0001-configure.ac-fix-sed-command.patch \
             file://arm_eabi.patch \
            "
-SRC_URI[md5sum] = "4b65ae3ffef59f3eeed51a6166ff12b3"
-SRC_URI[sha256sum] = "20b10d2c9994bc032824314714d0e84c0f19bdb3d715d8ed55beb7364a8ebaed"
+SRC_URI[md5sum] = "8b4912c6c0e5ffefd3dbb4888eaf8a58"
+SRC_URI[sha256sum] = "bcd5db7b234e02267f36b5d13cf5214baac232b7056a506252b7574ea7738d1f"
 
 BBCLASSEXTEND = "native nativesdk"
-- 
2.7.4


