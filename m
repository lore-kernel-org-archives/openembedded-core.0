Return-Path: <raj.khem@gmail.com>
Received: from mail-pg0-f68.google.com (mail-pg0-f68.google.com [74.125.83.68])
	by mail.openembedded.org (Postfix) with ESMTP id A78CA7475C
	for <openembedded-core@lists.openembedded.org>;
	Sun,  1 Apr 2018 07:19:57 +0000 (UTC)
Received: by mail-pg0-f68.google.com with SMTP id j3so7332326pgf.2
	for <openembedded-core@lists.openembedded.org>;
	Sun, 01 Apr 2018 00:19:58 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=from:to:cc:subject:date:message-id:in-reply-to:references;
	bh=tLlBrI+k1IlGAzNh8WhCRQdlmR7rhATH/XV+OeW/wm0=;
	b=WG4DdS8lv19TNNj1EacLSnjKX77aCBOYsELGtmHye/mqtkXfTnEnCvI9tu0ZcUrbkR
	KJI7u4fi69DQOOhTnJcgdyqXFjlmFd4YT70KOBSLpj7MOXJbeqCaot+AKJ6cSvlqPpM1
	qUfyfHS+LwsX7+bd6b9/uGv3o0y4gz7SACqf5U+uMxQ2xYIzHMfZPl/6g5jjUXzPR0On
	BkQLxuje98mo/JYFVLxjCNufBo87eZW7hn9ZN3Suvcyq1AF+C9V23QziDMT+6HZWYml1
	X79GrZ2zyDijnQtyp35yLyVUDTc3DLTmli0IBURvRPfeJfPAiNqFMarPqBOIrnRxEEWu
	GK7Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
	:references;
	bh=tLlBrI+k1IlGAzNh8WhCRQdlmR7rhATH/XV+OeW/wm0=;
	b=tB89AhnJNrDLvCzGCJzqN0gTTz0f1TQ/uaTMBLT92j3oAyVnfiZOMA82KUaQLphrdT
	QpyYPt+o/iiTHlvLQKVHmH9GRBW4ACUWHqn7ZhvWDGKmNRmoLt3U/EeO6kAzkAkx3qLn
	df/htrvIU/JBK+ifQrexkqIh7pC4vlFsYgCn2hmtFVDtjg9CXpF7ShRix3sTGKREvbbI
	OMd25q0v7bqOdFx7V5Kd5WRuhDSszIhtLWCyQZKbToCKjO8X74iIedEAtkg8xmvNqqiw
	s7wg4PNdJraUHMpEXIUQnTeh2EUyXw6Oijkguta8bFNs2jYNnIp6oIj/rBQKRQbbrBBI
	wJtw==
X-Gm-Message-State: AElRT7EQNyMlqAXhYSRy9191ExoE6TvXGCfHcjPzwclMflLkdvQFc0wp
	rlH49BtaPHgpR8YVWAMqhRTGOg==
X-Google-Smtp-Source: AIpwx4/VXhu56GmfapMNwbbN8gnhqgQion1cythfMAjGikoK6/mTw/DsFiJi+o7kcgaN0YTYwNcyXA==
X-Received: by 10.99.47.4 with SMTP id v4mr3521474pgv.42.1522567198158;
	Sun, 01 Apr 2018 00:19:58 -0700 (PDT)
Received: from localhost.localdomain ([2601:646:8880:466c:6245:cbff:fe64:591])
	by smtp.gmail.com with ESMTPSA id
	x128sm21481749pgb.31.2018.04.01.00.19.57
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Sun, 01 Apr 2018 00:19:57 -0700 (PDT)
From: Khem Raj <raj.khem@gmail.com>
To: openembedded-core@lists.openembedded.org
Date: Sun,  1 Apr 2018 00:19:43 -0700
Message-Id: <04dc80f68b371861e0ff25b972ff3f9ca7ecd653.1522567040.git.raj.khem@gmail.com>
X-Mailer: git-send-email 2.16.3
In-Reply-To: <cover.1522567040.git.raj.khem@gmail.com>
References: <cover.1522567040.git.raj.khem@gmail.com>
Subject: [PATCH 1/4] x264: Use updated gnu-config artifacts
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
X-List-Received-Date: Sun, 01 Apr 2018 07:19:57 -0000

It is not using autoconf completely, therefore there
is no autoreconf happening, so when we depend on latest
gnu-config changes e.g. new architectures like riscv
the build does not see them and fails.

Installing these files from native sysroot helps

Signed-off-by: Khem Raj <raj.khem@gmail.com>
---
 meta/recipes-multimedia/x264/x264_git.bb | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/meta/recipes-multimedia/x264/x264_git.bb b/meta/recipes-multimedia/x264/x264_git.bb
index a669295044..c445d15e69 100644
--- a/meta/recipes-multimedia/x264/x264_git.bb
+++ b/meta/recipes-multimedia/x264/x264_git.bb
@@ -43,6 +43,8 @@ EXTRA_OECONF = '--prefix=${prefix} \
                '
 
 do_configure() {
+    install -m 0755 ${STAGING_DATADIR_NATIVE}/gnu-config/config.guess ${S}
+    install -m 0755 ${STAGING_DATADIR_NATIVE}/gnu-config/config.sub ${S}
     ./configure ${EXTRA_OECONF}
 }
 
-- 
2.16.3


