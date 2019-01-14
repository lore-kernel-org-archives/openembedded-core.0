Return-Path: <alex.kanavin@gmail.com>
Received: from mail-wr1-f66.google.com (mail-wr1-f66.google.com
	[209.85.221.66])
	by mail.openembedded.org (Postfix) with ESMTP id 76BD17C03C
	for <openembedded-core@lists.openembedded.org>;
	Mon, 14 Jan 2019 15:03:30 +0000 (UTC)
Received: by mail-wr1-f66.google.com with SMTP id z5so23204364wrt.11
	for <openembedded-core@lists.openembedded.org>;
	Mon, 14 Jan 2019 07:03:31 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=from:to:subject:date:message-id:in-reply-to:references;
	bh=ivjJniFb/wwbQgAX9KhfCtrW1dG8QEVlcZ7AHXCeDX0=;
	b=gZiY6VTfHU7wGTX3UtkwYA62bxbMhVgdy3n8OtTQRWcI+AfJlrzbGsTIJNfm2Cn11C
	FDg612bBqNZ/1DKTHga4u/T25rtro/U8m3baG+I18bEbpvH/VUTk5KB8Xg7lWA0K2/27
	4hnytscM5OrffGHNUD4q4cISKZNhwkBivmKn1lhMEKpfRKsHv248PQ9K8/LJjzLHytG3
	Je3KbisMiHOClzijydOcVZUIPAGZUMbooFdJQ68Xnnbo05oxkXGLAVFxyTsKZqfCs9qq
	JKpzYV6CCvQ4rXYDVRpG1YHwQO+60BjD/tUbOBeZeMEG21KW0VkuvxRr3LVVoMRmAI3C
	uePA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
	:references;
	bh=ivjJniFb/wwbQgAX9KhfCtrW1dG8QEVlcZ7AHXCeDX0=;
	b=S4jUmF07aemjuD5YQbIGFi06NmOhh3u/PtvmNfr9XABfa7acYKU5wPhpd1pikz0kXa
	lkiiff45Tbc5hkgLf4xniUWHTlE9SLv/DDbP+W5OetQANjLgA0UpqYlBs5vEReH6Rj3H
	CEDANzoJRcPjlx4OAKHuY/a9C8vllnAy8/gyhu0pjcL+Z0uFNlkwfVsC6m0TspyC4UcW
	+dUVfi3hlB5oJzTVZ1mTjKsfKIy7kumuFMLilrsVoTLABqxN5nkpETf6EpiMahqrH+9n
	cQMAvuoGF6X6LiBGHCkMxL+OPC8BqG/jpbnQWd9JwJzSnpm8+5U8ulh7bLVs8NSiTt0D
	6O+w==
X-Gm-Message-State: AJcUukc4eghI9F4C0U7JiEGoY+5QuIZ3WbckFmdBsT2AXCofjoO0xJ35
	nabZSdkC905v5Excoj1naPNJWwU7
X-Google-Smtp-Source: ALg8bN7nL8VtSAOsbYej3yMIwhVxaLYVw/J3vn9eH3Qc9HJqgmKY+8NHib2qQAu1huvVbOGeuk1uxw==
X-Received: by 2002:adf:c846:: with SMTP id e6mr23696459wrh.243.1547478209782; 
	Mon, 14 Jan 2019 07:03:29 -0800 (PST)
Received: from alexander-box.luxoft.com ([62.96.135.139])
	by smtp.gmail.com with ESMTPSA id
	y34sm201725236wrd.68.2019.01.14.07.03.28
	for <openembedded-core@lists.openembedded.org>
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Mon, 14 Jan 2019 07:03:29 -0800 (PST)
From: Alexander Kanavin <alex.kanavin@gmail.com>
To: openembedded-core@lists.openembedded.org
Date: Mon, 14 Jan 2019 16:03:01 +0100
Message-Id: <435bc87d9d3927bc0f7f02b6dbd5b125d7aa85e7.1547477793.git.alex.kanavin@gmail.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <cover.1547477793.git.alex.kanavin@gmail.com>
References: <cover.1547477793.git.alex.kanavin@gmail.com>
Subject: [PATCH 05/23] pixbufcache.bbclass: remove a dependency loop introduced by enabling gtk+3-native
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
X-List-Received-Date: Mon, 14 Jan 2019 15:03:30 -0000

Signed-off-by: Alexander Kanavin <alex.kanavin@gmail.com>
---
 meta/classes/pixbufcache.bbclass | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta/classes/pixbufcache.bbclass b/meta/classes/pixbufcache.bbclass
index 3378ff2c806..fb50cd49659 100644
--- a/meta/classes/pixbufcache.bbclass
+++ b/meta/classes/pixbufcache.bbclass
@@ -3,7 +3,7 @@
 # packages.
 #
 
-DEPENDS += "qemu-native"
+DEPENDS_append_class-target = " qemu-native"
 inherit qemu
 
 PIXBUF_PACKAGES ??= "${PN}"
-- 
2.17.1


