Return-Path: <kergoth@gmail.com>
Received: from mail-pf0-f196.google.com (mail-pf0-f196.google.com
	[209.85.192.196])
	by mail.openembedded.org (Postfix) with ESMTP id 5500E78698
	for <openembedded-core@lists.openembedded.org>;
	Thu, 21 Jun 2018 21:08:04 +0000 (UTC)
Received: by mail-pf0-f196.google.com with SMTP id y5-v6so2115346pfn.4
	for <openembedded-core@lists.openembedded.org>;
	Thu, 21 Jun 2018 14:08:05 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=from:to:cc:subject:date:message-id:in-reply-to:references;
	bh=xo8TGTJNIob/hVk7MAjc/uHB83ZZyCCl8clE4mO0zZk=;
	b=cOhqZWuyCjvmKJ4F0lw4YX4EqLZ8ZQnBjZGGy7azFw2Ifgv7jdmYl8kZawKUB0zE9Z
	NNmIYpr7HfLVwI+6B/tK5XbxHIBqzmW5C8+yIuawQ+nF2GXSwsFWUiFFOkld0rS4HGGN
	eONw1OLlDQzcMH03+DD7gN4425HVYOPPgcbkANUG1XmItFa9f9TTljTfiNowh2XF2OdZ
	2ASNvT+MbcXCAiqxJuSJZ6QRXCi+6Tk3Bpo0JxSQfKZ5Ei7eM2FC2mkAlg08j4QjVz+X
	r8uKeAz1d319f4qFvg8/c55pYrYvv6ZXIrs4dHcaZKwBMqpEYg2zbxMkuhLZm7wPqDGa
	R9vQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
	:references;
	bh=xo8TGTJNIob/hVk7MAjc/uHB83ZZyCCl8clE4mO0zZk=;
	b=HaM4CdlSDoHvjA/trSgm4gFf6EBxmjQD0g1XJ6r7KpU0L/yV2aV0kNSrzWqeze7Pm4
	aU2w4qDK2wJ5YN/ig7OQVv+xhuC5ljYvP5YwcncaAWvRzFBR3iwPQuTbev91z2rEaaxI
	hAu872w16/+GQcY2UGKevhNnn/WbwtDw0nmQ7qoCb0lyy1kW9OpjNcjcknhDyTg0/tbA
	rWQcir2tE7OjC+yYhXetU4dfcSvf6yeH27i7LhW06f5dTe6ALE4xkXgRYuQKTtaSJ47Z
	j0o0GX9wCjTYDZPF2PVB1suu+6P5sFI33q6m1Ch65G9/W5C1c+/M2QrtWHNU4muTPgsR
	Us4Q==
X-Gm-Message-State: APt69E1P8OyEfspXksPUWtntt4pMphH47FEGBfWlqAB7VdIrQ/dIad2O
	WKzQmpjN2NtM5+O9RFFfxMrteHQN
X-Google-Smtp-Source: ADUXVKLz0aU+BqL70/ZoIiAsW/tH/xBTGUTMY9HpQYcsxBgVMKcCAjfafqhz6SNxlsOWMgC6vYfPRg==
X-Received: by 2002:a65:4042:: with SMTP id
	h2-v6mr23231600pgp.78.1529615285211; 
	Thu, 21 Jun 2018 14:08:05 -0700 (PDT)
Received: from svr-pkl-eng-07.mgc.mentorg.com ([110.93.212.98])
	by smtp.gmail.com with ESMTPSA id
	l62-v6sm8448499pga.21.2018.06.21.14.08.02
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
	Thu, 21 Jun 2018 14:08:04 -0700 (PDT)
From: Christopher Larson <kergoth@gmail.com>
To: openembedded-core@lists.openembedded.org
Date: Fri, 22 Jun 2018 02:07:36 +0500
Message-Id: <5ce7b09e00b4967d2c0efaad58049cf871fab57a.1529604086.git.chris_larson@mentor.com>
X-Mailer: git-send-email 2.11.1
In-Reply-To: <cover.1529604086.git.chris_larson@mentor.com>
References: <cover.1529604086.git.chris_larson@mentor.com>
Cc: Christopher Larson <chris_larson@mentor.com>
Subject: [PATCH 6/6] perf: drop the rdep on man
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
X-List-Received-Date: Thu, 21 Jun 2018 21:08:04 -0000

From: Christopher Larson <chris_larson@mentor.com>

It's not common practice to make -doc rdep on man when man pages are
included, and doing so prevents the recipe from building for non-gplv3

Signed-off-by: Christopher Larson <chris_larson@mentor.com>
---
 meta/recipes-kernel/perf/perf.bb | 1 -
 1 file changed, 1 deletion(-)

diff --git a/meta/recipes-kernel/perf/perf.bb b/meta/recipes-kernel/perf/perf.bb
index 51f5597eb92..5e710f61834 100644
--- a/meta/recipes-kernel/perf/perf.bb
+++ b/meta/recipes-kernel/perf/perf.bb
@@ -239,7 +239,6 @@ PACKAGE_ARCH = "${MACHINE_ARCH}"
 PACKAGES =+ "${PN}-archive ${PN}-tests ${PN}-perl ${PN}-python"
 
 RDEPENDS_${PN} += "elfutils bash"
-RDEPENDS_${PN}-doc += "man"
 RDEPENDS_${PN}-archive =+ "bash"
 RDEPENDS_${PN}-python =+ "bash python python-modules ${@bb.utils.contains('PACKAGECONFIG', 'audit', 'audit-python', '', d)}"
 RDEPENDS_${PN}-perl =+ "bash perl perl-modules"
-- 
2.11.1


