Return-Path: <alex.kanavin@gmail.com>
Received: from mail-wm1-f49.google.com (mail-wm1-f49.google.com
	[209.85.128.49])
	by mail.openembedded.org (Postfix) with ESMTP id 1CF8D7C2F3
	for <openembedded-core@lists.openembedded.org>;
	Wed, 30 Jan 2019 11:00:01 +0000 (UTC)
Received: by mail-wm1-f49.google.com with SMTP id y139so20968984wmc.5
	for <openembedded-core@lists.openembedded.org>;
	Wed, 30 Jan 2019 03:00:03 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=from:to:subject:date:message-id:in-reply-to:references;
	bh=neUq1Tvjq3VWYti6PWcv9Haum3dpeYrtr6eTcRExj84=;
	b=LxRS+W2/QMLGL8PIAOt3uRx2UaWvNSnHsVv9dbVpu83rwKIszUPlN7/oLwCs4N/kgL
	ljUdvvgzMm/QU8YmsQSiUZUcfW42p1676wzHYsZ/ypc82CoSLKi+cfDhtKZ0JR+KHgjr
	4aH8IkXSDDuNIOnWVLTn5OuRu7TGWo8zqRQFTAyWu6e4yw0l/25SfsrlKZ5XRTAwcpz2
	vCHjCbaKL64w/F/NOJsllNBy13pK7JbvNO8ILbJmgWnixVhQ8fgnsAYTsZRc7NigYnDH
	wkMDqsK1uaVUSCb7xYrLb9YRNocEZM8N9dzFaaDY4YxzjLK7DwuEN4TkI+K8b/avvneI
	2SVw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
	:references;
	bh=neUq1Tvjq3VWYti6PWcv9Haum3dpeYrtr6eTcRExj84=;
	b=laHqQcWqttV2ymNPx10ngxyopadWVFQrUsfaXKdZfNwMXt1snqy4MoEB5vvDgJAJQt
	EUt5mC7DQQQfnrjh1mf716ztshQUxbzma4S/pEfPsCks+Ce5jHcbU46pE0ooYKHp5spn
	gCakDHoMhYaD1Fez6UVJ8ydOHcHGNwjo/ki55PELSejkMEDBf9HRhwzsZ2aqcw5Fg0j8
	pSimO2bf59pOgkRykeKKNg8f1tEf5EeV0SE4cisbq8TZOtoxCQ4KQX3vGaFBJ2ZhlEuH
	EvmREkNzOXeh3gvku7LieQ0mIB7DpwunWxQSAPr88ihB/HaFpr1cA9wFBhhPfRxseQMp
	DnWw==
X-Gm-Message-State: AJcUukf43BqoLUXfPC9MSyuAE2aWMLfuucjim2f/DXOzrcnoWKFAfLVl
	R4GP3WNHElg/xbKh4AxJMn2trF9Z
X-Google-Smtp-Source: ALg8bN4JEogIqjm6qRmKoLKvLHPB/wiXbsVYRaBPbbITyc6QxxDEwHJJ3OqkXBQBbFjjP2aA1arMFg==
X-Received: by 2002:a1c:7eca:: with SMTP id z193mr24144097wmc.5.1548846002572; 
	Wed, 30 Jan 2019 03:00:02 -0800 (PST)
Received: from alexander-box.luxoft.com ([62.96.135.139])
	by smtp.gmail.com with ESMTPSA id
	a18sm1127705wrp.13.2019.01.30.03.00.01
	for <openembedded-core@lists.openembedded.org>
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Wed, 30 Jan 2019 03:00:01 -0800 (PST)
From: Alexander Kanavin <alex.kanavin@gmail.com>
To: openembedded-core@lists.openembedded.org
Date: Wed, 30 Jan 2019 11:59:34 +0100
Message-Id: <afaa914a9e873b8aff736198a2f2a8f78aef9b35.1548845917.git.alex.kanavin@gmail.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <cover.1548845917.git.alex.kanavin@gmail.com>
References: <cover.1548845917.git.alex.kanavin@gmail.com>
Subject: [PATCH 11/20] atk: disable gobject-introspection for nativesdk
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
X-List-Received-Date: Wed, 30 Jan 2019 11:00:02 -0000

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


