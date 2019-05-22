Return-Path: <jonathan.rajotte-julien@efficios.com>
Received: from mail.efficios.com (mail.efficios.com [167.114.142.138])
	by mail.openembedded.org (Postfix) with ESMTP id AE9EC7E294
	for <openembedded-core@lists.openembedded.org>;
	Wed, 22 May 2019 22:06:58 +0000 (UTC)
Received: from localhost (ip6-localhost [IPv6:::1])
	by mail.efficios.com (Postfix) with ESMTP id 44A001E51D6
	for <openembedded-core@lists.openembedded.org>;
	Wed, 22 May 2019 18:06:59 -0400 (EDT)
Received: from mail.efficios.com ([IPv6:::1])
	by localhost (mail02.efficios.com [IPv6:::1]) (amavisd-new, port 10032)
	with ESMTP id gksQsjQhAe2L; Wed, 22 May 2019 18:06:58 -0400 (EDT)
Received: from localhost (ip6-localhost [IPv6:::1])
	by mail.efficios.com (Postfix) with ESMTP id A8F0C1E51D2;
	Wed, 22 May 2019 18:06:58 -0400 (EDT)
DKIM-Filter: OpenDKIM Filter v2.10.3 mail.efficios.com A8F0C1E51D2
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=efficios.com;
	s=default; t=1558562818;
	bh=1WvcL+PyIvkNtadhX7ls6ao1BW7ykeu+yCHKrUe2fJY=;
	h=From:To:Date:Message-Id;
	b=pY/2OqZ8CUSV/5ZmiN5z2emUcGVNAaXc93qaRmDRPOXPb8YSbGO3NfWhnvDMw4RE8
	C1HsneoD+itocITLpQg7thc62rvvO5ePLgjsX5h5Rfjj9gC7vwz4XDUA4tK2Nv9qKf
	OK5Ef2PlaMd2nKqzzuSzV2BJYfbl6vYp5wNbQWFfF5x9WMk7eVECD2uLWP1Arhk+p8
	e2HWjZEbZLyPR1mAg8kJ2hwGjBq0SZZeVoOuynWZnvFoQRZd7xpDLpYHUX4f+XwnyG
	6RCXhFrBN0hOKI3CbqUbA/gLbe6rjBC30HUprF8ElcGR5CAFc1h7z9iEqN3GC39UJo
	p4wu10IaywTSQ==
X-Virus-Scanned: amavisd-new at efficios.com
Received: from mail.efficios.com ([IPv6:::1])
	by localhost (mail02.efficios.com [IPv6:::1]) (amavisd-new, port 10026)
	with ESMTP id Hnhul1Q86gaz; Wed, 22 May 2019 18:06:58 -0400 (EDT)
Received: from joraj-yocto-dev.internal.efficios.com
	(192-222-181-218.qc.cable.ebox.net [192.222.181.218])
	by mail.efficios.com (Postfix) with ESMTPSA id 8770E1E51CC;
	Wed, 22 May 2019 18:06:58 -0400 (EDT)
From: Jonathan Rajotte <jonathan.rajotte-julien@efficios.com>
To: openembedded-core@lists.openembedded.org
Date: Wed, 22 May 2019 22:06:44 +0000
Message-Id: <20190522220645.4412-1-jonathan.rajotte-julien@efficios.com>
X-Mailer: git-send-email 2.17.1
Subject: [PATCH 1/2] lttng-tools: prevent test timeout when lttng-modules is not present
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
X-List-Received-Date: Wed, 22 May 2019 22:06:58 -0000

Signed-off-by: Jonathan Rajotte <jonathan.rajotte-julien@efficios.com>
---
 meta/recipes-kernel/lttng/lttng-tools_2.10.6.bb | 1 +
 1 file changed, 1 insertion(+)

diff --git a/meta/recipes-kernel/lttng/lttng-tools_2.10.6.bb b/meta/recipes-kernel/lttng/lttng-tools_2.10.6.bb
index a3fabb20ec..f1bb7224f3 100644
--- a/meta/recipes-kernel/lttng/lttng-tools_2.10.6.bb
+++ b/meta/recipes-kernel/lttng/lttng-tools_2.10.6.bb
@@ -39,6 +39,7 @@ SRC_URI = "https://lttng.org/files/lttng-tools/lttng-tools-${PV}.tar.bz2 \
            file://0005-Tests-use-modprobe-to-test-for-the-presence-of-lttng.patch \
            file://0006-Tests-check-for-lttng-modules-presence.patch \
            file://0007-Fix-getgrnam-is-not-MT-Safe-use-getgrnam_r.patch \
+           file://0008-Fix-check-for-lttng-modules-presence-before-testing.patch \
            "
 
 SRC_URI[md5sum] = "e88c521b5da6bb48a8187af633336ecc"
-- 
2.17.1


