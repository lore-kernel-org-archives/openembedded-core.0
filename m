Return-Path: <david.partain@est.tech>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id EF93CCD5BD1
	for <webhook@archiver.kernel.org>; Mon,  1 Jun 2026 07:55:40 +0000 (UTC)
Received: from tor.source.kernel.org (tor.source.kernel.org [172.105.4.254])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.23083.1780298540891958177
 for <openembedded-core@lists.openembedded.org>;
 Mon, 01 Jun 2026 00:22:21 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@kernel.org header.s=k20201202 header.b=jRwhyjyX;
 spf=pass (domain: kernel.org, ip: 172.105.4.254, mailfrom: devnull+rouven.czerwinski.linaro.org@kernel.org)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by tor.source.kernel.org (Postfix) with ESMTP id 4025D601D9;
	Mon,  1 Jun 2026 07:13:04 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPS id E9024C2BCC7;
	Mon,  1 Jun 2026 07:13:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1780297983;
	bh=MPDrzJC8tyalyCmD76yhTAaozPjhbe2FvmmS5f+o/CI=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:Reply-To:From;
	b=jRwhyjyX6yCp/Kj3R1a0WTxSUbUdvR3rTbuAWbibqABPaLuWncbWURed0AhWpUxYF
	 Afhyq//qB2IKuD57bTMVScHc5L1XdxvIxbdZz0deeL56B7chPRzG6VOltqDUUYoJQ0
	 tnxOd9d0sRIT66EehAjZmpl5BY29Yc5tttgJeIbxrFyO/tlyUCgtg6luv+S8bPfEAx
	 7gfLb4GjaLU8FrZMM9FpleQbCCUd39Tl1Q+LWY7p053Uavk/ukXZYOHTtG9XLC+DJ5
	 X5Hsae7EY3apKwcUSWzicwszL/Dy93SdVzFxt7W9t7eR/VC5KuDcAQ/aDcfkPYCYYN
	 FrFPWg3zJZgmg==
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id E3267CD5BD1;
	Mon,  1 Jun 2026 07:13:03 +0000 (UTC)
From: Rouven Czerwinski via B4 Relay <devnull+rouven.czerwinski.linaro.org@kernel.org>
Date: Mon, 01 Jun 2026 09:13:06 +0200
Subject: [PATCH 5/6] documentation.conf: remove do_package_write_tar doc
MIME-Version: 1.0
Message-Id: <20260601-topic-packagemanager-cleanup-v1-5-926e4d5b724d@linaro.org>
References: <20260601-topic-packagemanager-cleanup-v1-0-926e4d5b724d@linaro.org>
In-Reply-To: <20260601-topic-packagemanager-cleanup-v1-0-926e4d5b724d@linaro.org>
To: openembedded-core@lists.openembedded.org
Cc: Rouven Czerwinski <rouven.czerwinski@linaro.org>
X-Mailer: b4 0.14.3
X-Developer-Signature: v=1; a=ed25519-sha256; t=1780297982; l=1340;
 i=rouven.czerwinski@linaro.org; s=20260126; h=from:subject:message-id;
 bh=gJXJdXbIOcV8pEHaKXHwJEGJs0JU5ItGpBpISFuQBkg=;
 b=aT7oyIlEx26Y/SuP99/5B5SoY4R/GZaX3Ag0fvnH7AwWKVliKwmCWRMbaHGBQuqfCr/MRZ+/K
 5YCiXGVj+zUC+s8sEgPsaP5UkcBWKIIUtGOj1FtfNLlI8XiDfCdFIyn
X-Developer-Key: i=rouven.czerwinski@linaro.org; a=ed25519;
 pk=/5pmUK/XIAIIo8JA0axgfy1k8NRhRTQkxVwZYa1ga7U=
X-Endpoint-Received: by B4 Relay for rouven.czerwinski@linaro.org/20260126
 with auth_id=616
X-Original-From: Rouven Czerwinski <rouven.czerwinski@linaro.org>
Reply-To: rouven.czerwinski@linaro.org
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 01 Jun 2026 07:55:40 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/237820

From: Rouven Czerwinski <rouven.czerwinski@linaro.org>

The package_tar.bbclass was removed in 90ce19122802
("meta/classes-global: remove package_tar.bbclass"), remove the
documentation variable associated with it as well.

No functional changes.

Signed-off-by: Rouven Czerwinski <rouven.czerwinski@linaro.org>
---
 meta/conf/documentation.conf | 1 -
 1 file changed, 1 deletion(-)

diff --git a/meta/conf/documentation.conf b/meta/conf/documentation.conf
index 94368d5c2b..953b2140d1 100644
--- a/meta/conf/documentation.conf
+++ b/meta/conf/documentation.conf
@@ -35,7 +35,6 @@ do_package_qa[doc] = "Runs QA checks on packaged files"
 do_package_write_deb[doc] = "Creates the actual DEB packages and places them in the Package Feed area"
 do_package_write_ipk[doc] = "Creates the actual IPK packages and places them in the Package Feed area"
 do_package_write_rpm[doc] = "Creates the actual RPM packages and places them in the Package Feed area"
-do_package_write_tar[doc] = "Creates tar archives for packages and places them in the Package Feed area"
 do_packagedata[doc] = "Creates package metadata used by the build system to generate the final packages"
 do_patch[doc] = "Locates patch files and applies them to the source code"
 do_populate_lic[doc] = "Writes license information for the recipe that is collected later when the image is constructed"

-- 
2.52.0



