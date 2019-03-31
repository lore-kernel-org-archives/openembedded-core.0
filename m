Return-Path: <open.source@oleksandr-kravchuk.com>
Received: from mail-lj1-f170.google.com (mail-lj1-f170.google.com
	[209.85.208.170])
	by mail.openembedded.org (Postfix) with ESMTP id D1F4D6D9AB
	for <openembedded-core@lists.openembedded.org>;
	Sun, 31 Mar 2019 16:21:56 +0000 (UTC)
Received: by mail-lj1-f170.google.com with SMTP id l7so5910709ljg.6
	for <openembedded-core@lists.openembedded.org>;
	Sun, 31 Mar 2019 09:21:58 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=oleksandr-kravchuk-com.20150623.gappssmtp.com; s=20150623;
	h=from:to:cc:subject:date:message-id;
	bh=16SENMqKCKp6bjy085HSIGWidHQaLxgP0+9f7beWFBM=;
	b=QWq1xG2pOjAvBtwVJngZF1lLeuw+aSU1frtTX8vxUzwwmS0VjzHOlLC4HYaqt9o0d8
	5RwBWIzM9t/MbNa0MZantdMVZsYMe4xzSi2R9Zy0HL6LLJB7K3F8oR5BbYvNiONnEaes
	JejfeWZh8AuWY524G9f1ZmWJ9KdqMp4owAPoOVPGfGzAFgPnBIyV4YuikEdb0isei6TI
	PU9KeHGKvjAEp28LfPqeVX36bXAoBmeWPgxJAXG0TgfTRRc+7oYFrqEHissckbXQGOqY
	xPIOMTRpghMo7vhMspBqUuImUkX2iiBzI8URi+latUNmdHEsYkFlP+zrY5FMP8yA6G55
	hh4A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:cc:subject:date:message-id;
	bh=16SENMqKCKp6bjy085HSIGWidHQaLxgP0+9f7beWFBM=;
	b=A2dqhRxZ2t5FfXK7Q1MUGeQtxQPnEFKSlWAuqOOWBYtzxJ8BUwPx4TVu4iJGwLuk4Y
	9xtSAqkp0TAVQLEv1i/EJrM4kBUJpGDiIkhA9mRaHKZsSZ30+m1cNIlmG4xzrZc1He4F
	x53G3J+it6PIfL3BbNsN9J6R1QgonibQf+SFQ+Jhog1bY7zvrIGATUmYSlAPd49tzCYA
	EXlVsh9LpkwKAi0ExgUXwu30/H0t3I0h0dmuSQ+FqiuuK8RyxayCMkupm6UIVvIlH/XH
	cCK+Y3qiwsm09mpvLI1fM0eMuFZJDixVg6d7yb2k1x344SsdSsRlq4DTwHqi2eglY6ja
	BjhA==
X-Gm-Message-State: APjAAAXzIPVivZ0RaQ2P2gvgPnT4dmZQD3so1AerA+/oaYvc6vdE7yg2
	t1R4vs70CgRFer12TFRIucLkOVYfXbU=
X-Google-Smtp-Source: APXvYqyIMIKfHUlwpfFU8lfyIiaQxR1a5KJlTS7faTTFHh0e0mQoouMbJQSMKlHIr27JX879myBEtg==
X-Received: by 2002:a2e:9649:: with SMTP id z9mr14329820ljh.92.1554049316443; 
	Sun, 31 Mar 2019 09:21:56 -0700 (PDT)
Received: from localhost.localdomain (c83-252-117-108.bredband.comhem.se.
	[83.252.117.108])
	by smtp.gmail.com with ESMTPSA id k5sm1538102lja.78.2019.03.31.09.21.55
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Sun, 31 Mar 2019 09:21:55 -0700 (PDT)
From: Oleksandr Kravchuk <open.source@oleksandr-kravchuk.com>
To: openembedded-core@lists.openembedded.org
Date: Sun, 31 Mar 2019 18:21:51 +0200
Message-Id: <20190331162151.22172-1-open.source@oleksandr-kravchuk.com>
X-Mailer: git-send-email 2.17.1
Cc: Oleksandr Kravchuk <open.source@oleksandr-kravchuk.com>
Subject: [PATCH] tar: update to 1.32
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
X-List-Received-Date: Sun, 31 Mar 2019 16:21:57 -0000

Signed-off-by: Oleksandr Kravchuk <open.source@oleksandr-kravchuk.com>
---
 meta/recipes-extended/tar/{tar_1.31.bb => tar_1.32.bb} | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)
 rename meta/recipes-extended/tar/{tar_1.31.bb => tar_1.32.bb} (92%)

diff --git a/meta/recipes-extended/tar/tar_1.31.bb b/meta/recipes-extended/tar/tar_1.32.bb
similarity index 92%
rename from meta/recipes-extended/tar/tar_1.31.bb
rename to meta/recipes-extended/tar/tar_1.32.bb
index a785042615..d14aeb8061 100644
--- a/meta/recipes-extended/tar/tar_1.31.bb
+++ b/meta/recipes-extended/tar/tar_1.32.bb
@@ -11,8 +11,8 @@ SRC_URI = "${GNU_MIRROR}/tar/tar-${PV}.tar.bz2 \
            file://musl_dirent.patch \
 "
 
-SRC_URI[md5sum] = "77afa35b696c8d760331fa0e12c2fac9"
-SRC_URI[sha256sum] = "577bd4463eea103bdfc662fc385789e2228dbeb399a1d0b98571ed9ce044f763"
+SRC_URI[md5sum] = "17917356fff5cb4bd3cd5a6c3e727b05"
+SRC_URI[sha256sum] = "e4bb9e08e12e7fa9f11fef544efc85e59ba34538593d9ad38148c7ca2bfbb566"
 
 inherit autotools gettext texinfo
 
-- 
2.17.1


