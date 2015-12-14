Return-Path: <armccurdy@gmail.com>
Received: from mail-pf0-f174.google.com (mail-pf0-f174.google.com
	[209.85.192.174])
	by mail.openembedded.org (Postfix) with ESMTP id 9D4706612D
	for <openembedded-core@lists.openembedded.org>;
	Mon, 14 Dec 2015 20:04:55 +0000 (UTC)
Received: by pff63 with SMTP id 63so16598877pff.2
	for <openembedded-core@lists.openembedded.org>;
	Mon, 14 Dec 2015 12:04:56 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=from:to:cc:subject:date:message-id;
	bh=SIhEXpZ8l23oCZ7VGwMN1a761Y/lFEWZ7A1tcKD0GLc=;
	b=SkHu984qkKCgaU8Ht9ZVCtsUkGdALriHZgGFbTUBKl/WAUbNiQsExomGFwLCh8aYMk
	L5QBgWLqj8I4JfXhcHn2dkSn+VNv49Mvuu2f8ZUgRC2UWxhgElxha03sgcwzpNqPM2Qy
	tllWQg/nOe5c6EAeP8XFYZKEDTriOehJsXnXO9m7loYJiJ7VApgQmCFZQt3tmHpNkfq2
	e/U0/G07FOBy5ozAJYKS3G5XATdppoBNm1JTn9VQHvi22Yom3TI/iDk9o/2Qo74wW8ch
	BaYDP4S2l2WXLpJnPhcUSDeP3XcYnZBsOYfdGUlfA3A1prneLRx1qsgjwEKxHaVhx/BE
	GapQ==
X-Received: by 10.98.70.89 with SMTP id t86mr6674916pfa.107.1450123496839;
	Mon, 14 Dec 2015 12:04:56 -0800 (PST)
Received: from e6520.cablelabs.com
	(50-204-102-64-static.hfc.comcastbusiness.net. [50.204.102.64])
	by smtp.gmail.com with ESMTPSA id
	ga13sm44660261pac.47.2015.12.14.12.04.55
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
	Mon, 14 Dec 2015 12:04:55 -0800 (PST)
From: Andre McCurdy <armccurdy@gmail.com>
To: openembedded-core@lists.openembedded.org
Date: Mon, 14 Dec 2015 12:04:49 -0800
Message-Id: <1450123490-3438-1-git-send-email-armccurdy@gmail.com>
X-Mailer: git-send-email 1.9.1
Subject: [PATCH 1/2] kernel-yocto.bbclass: remove do_kernel_link_vmlinux from SRCTREECOVEREDTASKS
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
X-List-Received-Date: Mon, 14 Dec 2015 20:04:57 -0000

The do_kernel_link_vmlinux() task modifies the build directory (not
the source tree) and should not be skipped when externalsrc is being
used.

Signed-off-by: Andre McCurdy <armccurdy@gmail.com>
---
 meta/classes/kernel-yocto.bbclass | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta/classes/kernel-yocto.bbclass b/meta/classes/kernel-yocto.bbclass
index 00d9667..3762d1d 100644
--- a/meta/classes/kernel-yocto.bbclass
+++ b/meta/classes/kernel-yocto.bbclass
@@ -1,5 +1,5 @@
 # remove tasks that modify the source tree in case externalsrc is inherited
-SRCTREECOVEREDTASKS += "do_kernel_link_vmlinux do_kernel_configme do_validate_branches do_kernel_configcheck do_kernel_checkout do_shared_workdir do_fetch do_unpack do_patch"
+SRCTREECOVEREDTASKS += "do_kernel_configme do_validate_branches do_kernel_configcheck do_kernel_checkout do_shared_workdir do_fetch do_unpack do_patch"
 
 # returns local (absolute) path names for all valid patches in the
 # src_uri
-- 
1.9.1


