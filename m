Return-Path: <twoerner@gmail.com>
Received: from mail-qk1-f170.google.com (mail-qk1-f170.google.com
	[209.85.222.170])
	by mail.openembedded.org (Postfix) with ESMTP id BF6BC7FAA9
	for <openembedded-core@lists.openembedded.org>;
	Fri, 25 Oct 2019 20:20:17 +0000 (UTC)
Received: by mail-qk1-f170.google.com with SMTP id e66so2931094qkf.13
	for <openembedded-core@lists.openembedded.org>;
	Fri, 25 Oct 2019 13:20:19 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=from:to:subject:date:message-id:mime-version
	:content-transfer-encoding;
	bh=TzyaszPbindh5tY6F8OmEZ29zf32YchGQ81kRZr/LJk=;
	b=bmh/UPtjG6xJkUhjeK9caOLlFvoaPbQ9nY9UkSsoBBH1nZDJutaoYL/yMb6P9U/B2X
	gvdOy7PBIBeDk/lQUp0H1dwrJqQLONVZl9GUYuVeGEUW50gfUGAA//dEgizsvL1kTMlk
	VsNigjUrhsNu/6md9bkCWS55tr5LAuFl40g2yMlpnWu2zD24d0Ro9DfmeZcFF1Yxa7Iz
	W/CDw7tlcVtNk6y/0v7nihZIlWMeE5c9kwc5QKp8ZpYHs/BVTbne6PA2uU0VSvplUB1g
	xcUOiywbPsDBYawDiupmpQUoGaD1Is8Q5oIcn0O51DsiXnoRBw+AmQJm5uXDcnCln2Jl
	kORg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:subject:date:message-id:mime-version
	:content-transfer-encoding;
	bh=TzyaszPbindh5tY6F8OmEZ29zf32YchGQ81kRZr/LJk=;
	b=cBcUbSBSgNAdVTW8LhQXg+0P8a0JNtyoX2K+9viYIl6Z6mRmUE/+Rxvjb15NrWLGlE
	9cvXE0FpTeZqwnL2vIgOFZMSkR3OGp/FL0LjM0HtnEuUZPDRtrQ7n8F2eM+YN7nLwwg1
	YQZYp8a2Zx0iXAoiHySz+kWU6PrOjeqn09rWvMZGFsOG0pvwhDlVWNiVA1bpC0yZcchK
	/JXOkQz3w+NSjmV16SnBhE0ZpEjc5MjzUyBsk20EcQbgYS9/ESpDcNBDQsd6pSWVZR0l
	cWHpoC3wPVi4SVPX8rObkMHjYsUV5JhQczd61ruajqa8FpHarEDMYAxude/z4UgJeo6b
	bkRg==
X-Gm-Message-State: APjAAAWjVRGftzRbgvfR9LiHDaPc+xAnisSvLnUAi7oSH2IQxUA2IqxY
	dup757/1mxXuCzrZY/+W5uYZA6Qw
X-Google-Smtp-Source: APXvYqxunpcbG+8zYgBYUZqYvrFhE+ShmQBLFGVvLQavfkQZ/5q9gJhQx1RZcPpJLxhGC7P73kiUug==
X-Received: by 2002:ae9:c20d:: with SMTP id j13mr4403007qkg.461.1572034818007; 
	Fri, 25 Oct 2019 13:20:18 -0700 (PDT)
Received: from linux-uys3.suse ([206.248.190.95])
	by smtp.gmail.com with ESMTPSA id
	k40sm2502311qta.76.2019.10.25.13.20.16
	for <openembedded-core@lists.openembedded.org>
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Fri, 25 Oct 2019 13:20:17 -0700 (PDT)
From: Trevor Woerner <twoerner@gmail.com>
To: openembedded-core@lists.openembedded.org
Date: Fri, 25 Oct 2019 16:20:08 -0400
Message-Id: <20191025202008.23715-1-twoerner@gmail.com>
X-Mailer: git-send-email 2.23.0.37.g745f681289
MIME-Version: 1.0
Subject: [PATCH] libcap-ng: undefined reference to `pthread_atfork'
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
X-List-Received-Date: Fri, 25 Oct 2019 20:20:17 -0000
Content-Transfer-Encoding: 8bit

Some hosts need -lpthread in order to link properly (e.g. openSUSE 15.1).

Signed-off-by: Trevor Woerner <twoerner@gmail.com>
---
 meta/recipes-support/libcap-ng/libcap-ng_0.7.10.bb | 1 +
 1 file changed, 1 insertion(+)

diff --git a/meta/recipes-support/libcap-ng/libcap-ng_0.7.10.bb b/meta/recipes-support/libcap-ng/libcap-ng_0.7.10.bb
index 6e6de45494..01ea9a1490 100644
--- a/meta/recipes-support/libcap-ng/libcap-ng_0.7.10.bb
+++ b/meta/recipes-support/libcap-ng/libcap-ng_0.7.10.bb
@@ -3,6 +3,7 @@ require libcap-ng.inc
 inherit lib_package autotools
 
 EXTRA_OECONF += "--without-python --without-python3"
+LDFLAGS_append_class-native = " -lpthread"
 
 BBCLASSEXTEND = "native nativesdk"
 
-- 
2.23.0.37.g745f681289


