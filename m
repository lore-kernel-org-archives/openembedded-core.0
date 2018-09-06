Return-Path: <alex.kanavin@gmail.com>
Received: from mail-ed1-f65.google.com (mail-ed1-f65.google.com
	[209.85.208.65])
	by mail.openembedded.org (Postfix) with ESMTP id 0ABAE795E2
	for <openembedded-core@lists.openembedded.org>;
	Thu,  6 Sep 2018 10:40:43 +0000 (UTC)
Received: by mail-ed1-f65.google.com with SMTP id j62-v6so8498300edd.7
	for <openembedded-core@lists.openembedded.org>;
	Thu, 06 Sep 2018 03:40:45 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=from:to:cc:subject:date:message-id:in-reply-to:references;
	bh=+dyUjeHgUo2Z9A6OsWkmaBQgjHRMnRcelZr0l+yrsKU=;
	b=eb0oYFzLrr87XiqwdydVLJeXOQL9G+IntACDNNzPwwWg0oVs88VmuDimR9ARn6XrwH
	4u2T7fbSO/At4wm6DWhr6iHds6epF6xmg7GyjoDpjdXQfQu6GDYMo+VgqIId+1zfsvIl
	Hcn5YHFaJ/xvN8F4lv2NX7pTeM00mmtvrjxk3ddPECyrwAJGEBNyA4G009blSEeN5pAo
	LGQwRVGHviOgcf96V89T4ohhgmc+YCrfN/9SuWBuMlZGC4DlpFWFmnmvJdREj7LRyuj4
	HHPeIxDLlXcjQN4Kcgu0I4pTV0pO4G3d0nLt52dar4HHLkiltcN+niSmuL5kQzHPpU+d
	HMxw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
	:references;
	bh=+dyUjeHgUo2Z9A6OsWkmaBQgjHRMnRcelZr0l+yrsKU=;
	b=aGVrZ+oReX/VaaDXSB34EZML/p6b3d05ux+gtFwDTOX2SXzdQ5M0jCVlXR0Qaeh5/U
	i23+zYVcmT9M8vAPgLOjy05NI8yDgMy7lUMLXazEt9wNL17c+PlxX0No9wZFdt9pxmd8
	qLtZxfdDpCDYNRrVCr6XxGZAmGOWWNLYcTkg30jLC0plworuxz+wiqAtcXpPXXOypRY1
	y6OJQ0jofquAlKVXTrcGdDvfz6b/tZdX0P8u4r77Cg5NgH/zHJZZ2HDk5tDOj8bD0Nv2
	CZhIHunT/s90h3Sf86TQSg/em5Qxx9PdQkL3PSMjVUHIV2GeLLyAAMtKQVwf7jaa+Zrr
	Wfsg==
X-Gm-Message-State: APzg51BgbPxBzEx1im5nxg3t+YtGEbjiTtHv8aPGHXuEFzJFymjcpYqU
	LdkVyAJHcDxiDodHyoo7sTQkBwBHaWQ=
X-Google-Smtp-Source: ANB0VdZQM4WocRHQXQvns5gJtpBHiYgh6I2qACb71I6iGAUKqHiApUlEZ0OjCbSGyVsXu3hkYcZN6A==
X-Received: by 2002:a50:9b5c:: with SMTP id
	a28-v6mr2918526edj.167.1536230444660; 
	Thu, 06 Sep 2018 03:40:44 -0700 (PDT)
Received: from localhost.localdomain ([79.140.126.226])
	by smtp.gmail.com with ESMTPSA id
	k28-v6sm2256506ede.11.2018.09.06.03.40.43
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
	Thu, 06 Sep 2018 03:40:44 -0700 (PDT)
From: Alexander Kanavin <alex.kanavin@gmail.com>
To: openembedded-core@lists.openembedded.org
Date: Thu,  6 Sep 2018 12:40:20 +0200
Message-Id: <1536230436-30342-5-git-send-email-alex.kanavin@gmail.com>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <1536230436-30342-1-git-send-email-alex.kanavin@gmail.com>
References: <1536230436-30342-1-git-send-email-alex.kanavin@gmail.com>
Subject: [PATCHv2 05/21] qemu: fix upstream version check
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
X-List-Received-Date: Thu, 06 Sep 2018 10:40:44 -0000

Signed-off-by: Alexander Kanavin <alex.kanavin@gmail.com>
---
 meta/recipes-devtools/qemu/qemu_3.0.0.bb | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta/recipes-devtools/qemu/qemu_3.0.0.bb b/meta/recipes-devtools/qemu/qemu_3.0.0.bb
index 80da081..588db7f 100644
--- a/meta/recipes-devtools/qemu/qemu_3.0.0.bb
+++ b/meta/recipes-devtools/qemu/qemu_3.0.0.bb
@@ -22,7 +22,7 @@ SRC_URI = "https://download.qemu.org/${BPN}-${PV}.tar.xz \
            file://0010-linux-user-Fix-webkitgtk-hangs-on-32-bit-x86-target.patch \
            file://0011-Revert-linux-user-fix-mmap-munmap-mprotect-mremap-sh.patch \
            "
-UPSTREAM_CHECK_REGEX = "qemu-(?P<pver>\d+\..*)\.tar"
+UPSTREAM_CHECK_REGEX = "qemu-(?P<pver>\d+(\.\d+)+)\.tar"
 
 SRC_URI_append_class-native = " \
             file://0012-fix-libcap-header-issue-on-some-distro.patch \
-- 
2.7.4


