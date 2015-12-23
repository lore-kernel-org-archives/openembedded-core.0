Return-Path: <armccurdy@gmail.com>
Received: from mail-io0-f178.google.com (mail-io0-f178.google.com
	[209.85.223.178])
	by mail.openembedded.org (Postfix) with ESMTP id 909227317D
	for <openembedded-core@lists.openembedded.org>;
	Wed, 23 Dec 2015 00:13:02 +0000 (UTC)
Received: by mail-io0-f178.google.com with SMTP id 186so204933282iow.0
	for <openembedded-core@lists.openembedded.org>;
	Tue, 22 Dec 2015 16:13:03 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=from:to:cc:subject:date:message-id:in-reply-to:references;
	bh=SIhEXpZ8l23oCZ7VGwMN1a761Y/lFEWZ7A1tcKD0GLc=;
	b=WyFVGl/cdPqp2Xlm2OCyrowtOigrG37RulFJ2UrcUGRp6orTp7apF037UpaXtCZaAy
	r3F3hw1c94Ra4vbb+X8GjkNERAzXYc9KXZxW8LthszRDkUNKPODy+HzakKTLb+TaHzJ+
	nBOYl6EfEArx5fkXGbNpWQkxcvVJRe3yrVOrol+i80WQFsED1OM9GML9SwHAC6x1nfOV
	uPTDCH6l0dq5p1oQKJYOj/HLB07K7D763NllxS2I3iQHJlkoJDpq+Ed+mwYOZq4E345m
	jjx8D5L17r/AhZ6+mHWt93FL4dOMcLr6vmBCd8ZKJN7g9+KDBQyy1CJN1PePsiq42/sv
	DH3A==
X-Received: by 10.107.40.65 with SMTP id o62mr27257882ioo.20.1450829583101;
	Tue, 22 Dec 2015 16:13:03 -0800 (PST)
Received: from e6520.cablelabs.com
	(50-204-102-64-static.hfc.comcastbusiness.net. [50.204.102.64])
	by smtp.gmail.com with ESMTPSA id
	l21sm15032468ioe.21.2015.12.22.16.13.01
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
	Tue, 22 Dec 2015 16:13:01 -0800 (PST)
From: Andre McCurdy <armccurdy@gmail.com>
To: openembedded-core@lists.openembedded.org
Date: Tue, 22 Dec 2015 16:12:52 -0800
Message-Id: <1450829573-777-2-git-send-email-armccurdy@gmail.com>
X-Mailer: git-send-email 1.9.1
In-Reply-To: <1450829573-777-1-git-send-email-armccurdy@gmail.com>
References: <1450829573-777-1-git-send-email-armccurdy@gmail.com>
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
X-List-Received-Date: Wed, 23 Dec 2015 00:13:03 -0000

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


