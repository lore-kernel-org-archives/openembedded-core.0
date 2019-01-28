Return-Path: <alex.kanavin@gmail.com>
Received: from mail-wm1-f65.google.com (mail-wm1-f65.google.com
	[209.85.128.65])
	by mail.openembedded.org (Postfix) with ESMTP id B1D0F7C48D
	for <openembedded-core@lists.openembedded.org>;
	Mon, 28 Jan 2019 12:47:22 +0000 (UTC)
Received: by mail-wm1-f65.google.com with SMTP id t200so13866069wmt.0
	for <openembedded-core@lists.openembedded.org>;
	Mon, 28 Jan 2019 04:47:24 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=from:to:subject:date:message-id:in-reply-to:references;
	bh=neUq1Tvjq3VWYti6PWcv9Haum3dpeYrtr6eTcRExj84=;
	b=M6aC6pZxATHxqz2xcvmbssd+Kg5TX8ZrRaaXBbFFNi6zfMet0LnfMk9hZadfJ1llys
	jYe91HqOaogWwqcChqKEffeBbS9JpYnJN1EzJZcrNy82b5UPaedA53bC3TInwDeCN2ZZ
	n44X2zKw4/YXARR8goMMVEU0oEXtP3RadXCEjYNMrkEb6LEpuAuUhB44wJhFl4tjM/sm
	oqp54xEm1gRj+qboEzO3JiX+40+T97DhUbdSHISED7eTE4HZ0F8vnnLlYU4XzJvJRzcd
	vl+ZTmHYWatpIn4r7/SETPzMRI9JfL+YkS+NBPvebmoCGkU5bgspEFVggLCS75BPKElb
	4dQg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
	:references;
	bh=neUq1Tvjq3VWYti6PWcv9Haum3dpeYrtr6eTcRExj84=;
	b=WckZXYy7UdJYe5HT+fkELxszbCUVdDqX9D7f+IabsYGDJam6ulRDB/QkRi77Qj+8PE
	2ZNi2QggeWR0+dBX+iYxtD3L3oWgRMSeO1v2SC13PQzkRtMcBQBBaRMeGchscsqqHqQx
	m85wDqgCxz4sGfd05wJXpP9mszbLukibUsAMplCPXqXv/heEsmovDaJgu/omy9ooLg/3
	Peex4XgWY1VX+8IR/rQ9Ah+2HIrrIbmh2l0SXzK0mdBxEdWyLRqcisY+Nhj7GgHZfOjT
	y6dfdlVsFEze12vIqZ2XJT6N65HZRF4mSyt2VS22BBO6anaLUjG7JjYZQxEsZnSbTS9F
	caYA==
X-Gm-Message-State: AJcUuke4c/GFwVWddEl/T/LKkVDw83oQ6udN8wjLZWkHUcfdRWq/SqRd
	DNxhS6zo5RqJ9QRLL6V27rhM02/0
X-Google-Smtp-Source: ALg8bN6G5TRs/u2V04MH0oJb6wL7emmIEioO/tkJ7LDvJMIOjPLFPtOVq1VTMZCi4UdQbqmXkuYrFQ==
X-Received: by 2002:a7b:cd85:: with SMTP id y5mr16355141wmj.129.1548679643336; 
	Mon, 28 Jan 2019 04:47:23 -0800 (PST)
Received: from alexander-box.luxoft.com ([62.96.135.139])
	by smtp.gmail.com with ESMTPSA id
	j33sm186026218wre.91.2019.01.28.04.47.22
	for <openembedded-core@lists.openembedded.org>
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Mon, 28 Jan 2019 04:47:22 -0800 (PST)
From: Alexander Kanavin <alex.kanavin@gmail.com>
To: openembedded-core@lists.openembedded.org
Date: Mon, 28 Jan 2019 13:46:46 +0100
Message-Id: <04de28f2d67f14e72517f8a0bbef6f5da1141484.1548679462.git.alex.kanavin@gmail.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <cover.1548679462.git.alex.kanavin@gmail.com>
References: <cover.1548679462.git.alex.kanavin@gmail.com>
Subject: [PATCH 15/24] atk: disable gobject-introspection for nativesdk
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
X-List-Received-Date: Mon, 28 Jan 2019 12:47:23 -0000

We do not support g-i for nativesdk, neverthless atk tries and fails.

Signed-off-by: Alexander Kanavin <alex.kanavin@gmail.com>
---
 meta/recipes-support/atk/atk_2.30.0.bb | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/meta/recipes-support/atk/atk_2.30.0.bb b/meta/recipes-support/atk/atk_2.30.0.bb
index 481f8e89a13..4e2dacbc4d8 100644
--- a/meta/recipes-support/atk/atk_2.30.0.bb
+++ b/meta/recipes-support/atk/atk_2.30.0.bb
@@ -20,6 +20,8 @@ GTKDOC_DISABLE_FLAG = "-Ddocs=false"
 GI_ENABLE_FLAG = "-Dintrospection=true"
 GI_DISABLE_FLAG = "-Dintrospection=false"
 
+EXTRA_OEMESON_append_class-nativesdk = " ${GI_DISABLE_FLAG}"
+
 EXTRA_OEMESON_append_class-target = " ${@bb.utils.contains('GI_DATA_ENABLED', 'True', '${GI_ENABLE_FLAG}', \
                                                                                        '${GI_DISABLE_FLAG}', d)} "
 
-- 
2.17.1


