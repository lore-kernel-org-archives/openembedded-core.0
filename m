Return-Path: <luca.boccassi@gmail.com>
Received: from mail-wr1-f66.google.com (mail-wr1-f66.google.com
	[209.85.221.66])
	by mail.openembedded.org (Postfix) with ESMTP id 596EA7D3AC
	for <openembedded-core@lists.openembedded.org>;
	Mon, 17 Jun 2019 19:05:33 +0000 (UTC)
Received: by mail-wr1-f66.google.com with SMTP id n9so11227073wru.0
	for <openembedded-core@lists.openembedded.org>;
	Mon, 17 Jun 2019 12:05:34 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=from:to:cc:subject:date:message-id:mime-version
	:content-transfer-encoding;
	bh=n6yj0YErvdgQttyDLAbp1ssis2DOvh3VklRlBszjSFY=;
	b=nTGtcowvYmBEsGUdPUeulN2LSL5QMe1ZlHU1yVxHGjIzpJ3gK6Xu3iJs12RkOFraxj
	G4z+mK4Qs+VPQaSgkTQ54mbwu7hFCoXZQVI0nyrsSwII7fvzxpi/0QmHLu7qltJ8TeIr
	7rtVVImSNT7EkABn+06zjv+4dJVgyYV2QX3H8Lw9qrNArCFMxifqWkeGuIFwi0LwskOp
	9DH+ItLIBZIOHxEz1BxMijO8VJDNrtuYeONPes9+SCxm6aOMkQBaSCTA/+7gAli5665t
	jfYeijo7ZnUqtNTjL7XUBUM2EVLqAhP0hp2EeQjDHjjjPFlYxXpn+FMuGqmXeS8O0cL+
	M5fQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
	:content-transfer-encoding;
	bh=n6yj0YErvdgQttyDLAbp1ssis2DOvh3VklRlBszjSFY=;
	b=ESksHe9FgxTpTom6+KHZD8KTin0EP5ui8huA34hrFNkuewe+G4TvK2aBl2mmNgKvYs
	GRsKTpV6R2NhzFDigW3L38/DhI+T8s9mql1V8hHcROJI8BXGFjadJIVBxZZesUpGdj1M
	2KGpDVQiyT5mDHvVNK5xrKcvXjWht+xscR685IIAzo8d2pJ2vQ5NVHMuJy7kPKSfectj
	jSNWCdpUmYJ9FA1IgPJGtJ40aDycbAw/6VlIU4m7M66AEOzgpjUy4jG2M0wsgWeZpCFd
	/kQkYVM8U3Vp0/rdg+cr3B6prNj5yxr0d52U3X30jEz2J4KYOLUXr7gY1lptLyAS80SO
	y8/A==
X-Gm-Message-State: APjAAAUaAaaMQlxXKLYPUz9LiYk/8Jqn6yrVPANXtqoIHtuUiQsxYZdz
	wWPBAmie6u2yM2L9aKT4Iz3MYCNQ
X-Google-Smtp-Source: APXvYqzXxsBPPLe7mcEj55s7jNUOXQf8KrTktBWrUUKs1nRQFYRTYKdrjkTDQftME9qi9lAJBIWYvA==
X-Received: by 2002:adf:fc52:: with SMTP id e18mr15504625wrs.14.1560798333696; 
	Mon, 17 Jun 2019 12:05:33 -0700 (PDT)
Received: from localhost ([88.98.246.218]) by smtp.gmail.com with ESMTPSA id
	e21sm14149131wra.27.2019.06.17.12.05.31
	(version=TLS1_3 cipher=AEAD-AES256-GCM-SHA384 bits=256/256);
	Mon, 17 Jun 2019 12:05:31 -0700 (PDT)
From: luca.boccassi@gmail.com
To: openembedded-core@lists.openembedded.org
Date: Mon, 17 Jun 2019 20:05:22 +0100
Message-Id: <20190617190522.8564-1-luca.boccassi@gmail.com>
X-Mailer: git-send-email 2.20.1
MIME-Version: 1.0
Cc: Chris PeBenito <Christopher.PeBenito@microsoft.com>
Subject: [PATCH] volatile-binds: Change cp to use -a instead of -p.
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
X-List-Received-Date: Mon, 17 Jun 2019 19:05:33 -0000
Content-Transfer-Encoding: 8bit

From: Chris PeBenito <Christopher.PeBenito@microsoft.com>

This is needed on SELinux systems, so the labels (xattrs) are preserved.

Signed-off-by: Chris PeBenito <Christopher.PeBenito@microsoft.com>
---
 meta/recipes-core/volatile-binds/files/mount-copybind | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/meta/recipes-core/volatile-binds/files/mount-copybind b/meta/recipes-core/volatile-binds/files/mount-copybind
index fddf520053..e32e675308 100755
--- a/meta/recipes-core/volatile-binds/files/mount-copybind
+++ b/meta/recipes-core/volatile-binds/files/mount-copybind
@@ -42,14 +42,14 @@ if [ -d "$mountpoint" ]; then
     if ! mount -t overlay overlay -olowerdir="$mountpoint",upperdir="$spec",workdir="$overlay_workdir" "$mountpoint" > /dev/null 2>&1; then
 
         if [ "$specdir_existed" != "yes" ]; then
-            cp -pPR "$mountpoint"/. "$spec/"
+            cp -aPR "$mountpoint"/. "$spec/"
         fi
 
         mount -o "bind$options" "$spec" "$mountpoint"
     fi
 elif [ -f "$mountpoint" ]; then
     if [ ! -f "$spec" ]; then
-        cp -pP "$mountpoint" "$spec"
+        cp -aP "$mountpoint" "$spec"
     fi
 
     mount -o "bind$options" "$spec" "$mountpoint"
-- 
2.20.1


