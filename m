Return-Path: <alex.kanavin@gmail.com>
Received: from mail-wm1-f49.google.com (mail-wm1-f49.google.com
	[209.85.128.49])
	by mail.openembedded.org (Postfix) with ESMTP id 758287BFFB
	for <openembedded-core@lists.openembedded.org>;
	Tue, 15 Jan 2019 16:39:18 +0000 (UTC)
Received: by mail-wm1-f49.google.com with SMTP id n190so3991380wmd.0
	for <openembedded-core@lists.openembedded.org>;
	Tue, 15 Jan 2019 08:39:19 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=from:to:subject:date:message-id:in-reply-to:references;
	bh=neUq1Tvjq3VWYti6PWcv9Haum3dpeYrtr6eTcRExj84=;
	b=eBAo9Y0fmmvkSUHk+77vtdMkE6JNG3ZKBGL5WZ5/NQKLFvk0wSbXcrjq2vEt9oq7Kc
	Pl3B86hoXAAOCyLkQxyjgQ2evL+oHyEhfBh7HE80uKCIMbtpfEi1KBMje8flXGMnTcBG
	3/bk9/+tidcutiXA/pXXBXDUIHzQsB3fdSiwEhNhRhglukDvVfk7fqMLR4+Od0oyY0bX
	3SqPghLDtF6LKH6RKBmLogYV+6Pi+Az++o7gUUYlUCanN+iJDhAO20sck6wGRDooqJOM
	DOtVreYlvUfeD2IWYXtVVKkU+ELgvp4IM1K71rRsfb4f7WRKJ1JY3N86R4Ipi6sGyX9T
	awcg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
	:references;
	bh=neUq1Tvjq3VWYti6PWcv9Haum3dpeYrtr6eTcRExj84=;
	b=A5+YlmGn4NjA8eW2wCrbbKjD4sv9cRFBYIZcWu1MEP+QKmgKJY0RYCxWYWdh/tchDr
	330QBqV8BCWjUqmDtgcymsX6dorBv67ePBD0VOmnf7G0StaMIqTwEAUcqs+lSKW4fEhF
	Yn0p3o89h9NPlOpMzAm1ZEWHtRWdTYxpTS9nAwFUbyDAZk7dsSWLWFhA6yZjoK2D51Ri
	ReGibDY24Eroj1GAr1f2VLolYHqS9v4nx8lAE0Nn2ObQIHFQYACdODEqCilDiRJUFSv8
	wiY81f7QLuENPucuoio+ydIxZ2ndD+ytxV6sTSnHtvtgWwNXCphE4w9az6BfoAY2KuYs
	Y8kg==
X-Gm-Message-State: AJcUuke2OSu4ZsieN7YdSAyfHyaOE3wAGg1/wFYXGKq/PMb9dpxYDafx
	Zn0xXUq+L4puweGhaRSo28SgLHJcNPM=
X-Google-Smtp-Source: ALg8bN6UnwcGSMVOWpOS4UFqIs/GY1ky9uir2ozu8HdmbRTmtZQlS7KtVxv9TTC72TMkDFtOCdAbxQ==
X-Received: by 2002:a1c:ae88:: with SMTP id x130mr3826318wme.91.1547570359030; 
	Tue, 15 Jan 2019 08:39:19 -0800 (PST)
Received: from alexander-box.luxoft.com ([62.96.135.139])
	by smtp.gmail.com with ESMTPSA id
	f15sm77594927wrt.10.2019.01.15.08.39.18
	for <openembedded-core@lists.openembedded.org>
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Tue, 15 Jan 2019 08:39:18 -0800 (PST)
From: Alexander Kanavin <alex.kanavin@gmail.com>
To: openembedded-core@lists.openembedded.org
Date: Tue, 15 Jan 2019 17:38:50 +0100
Message-Id: <f2ae9fb04e39a6da21ecf42a3028a3308a404655.1547570285.git.alex.kanavin@gmail.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <cover.1547570285.git.alex.kanavin@gmail.com>
References: <cover.1547570285.git.alex.kanavin@gmail.com>
Subject: [PATCHv2 15/22] atk: disable gobject-introspection for nativesdk
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
X-List-Received-Date: Tue, 15 Jan 2019 16:39:19 -0000

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


