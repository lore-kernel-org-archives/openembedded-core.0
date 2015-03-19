Return-Path: <ajlennon@gmail.com>
Received: from mail-we0-f175.google.com (mail-we0-f175.google.com
	[74.125.82.175])
	by mail.openembedded.org (Postfix) with ESMTP id 425FC65CD0
	for <openembedded-core@lists.openembedded.org>;
	Thu, 19 Mar 2015 13:18:20 +0000 (UTC)
Received: by weop45 with SMTP id p45so57045069weo.0
	for <openembedded-core@lists.openembedded.org>;
	Thu, 19 Mar 2015 06:18:21 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=sender:from:to:subject:date:message-id:in-reply-to:references;
	bh=LlXugtQHr7NBPf+rGeeauJDSiIrkAgBMvhRHhtvtwgM=;
	b=G0ZbMVv1pea4Sjb5lipIp3+LjKexqOmRAhrG1caGLeqZ7eRjAhJQjJ/dH0OqTZjiIe
	pYIxwNHG7zXmYiY/z4L+vAUZDpmXm6+t6uxdgATBsHCHHdmrKbTqtkj7+ouqNSwYActo
	OmyHOl3GrBo4AVKVxzwky+WlzgPtvM+HYGM9AscJgMqnXy0gXNo/jHO4X/yQfoBfsfnc
	yqaYBWtJ5vpCHH3GcHndMGxYnsikPACgNYxkCZynXBoEfZbuBZiOu3HnsrbHbiMkP4GV
	ugejNF+jvb5wD0u+ObKk8ezgy3aRqJ9iW+6d9QVLXcoP09hyZb0f+ROXxpixV4t6YV/V
	cVuA==
X-Received: by 10.194.57.206 with SMTP id k14mr154726296wjq.1.1426771101315;
	Thu, 19 Mar 2015 06:18:21 -0700 (PDT)
Received: from localhost.localdomain
	(AMarseille-651-1-76-237.w109-208.abo.wanadoo.fr. [109.208.171.237])
	by mx.google.com with ESMTPSA id ge8sm1948572wjc.32.2015.03.19.06.18.17
	for <openembedded-core@lists.openembedded.org>
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
	Thu, 19 Mar 2015 06:18:17 -0700 (PDT)
Sender: Alex Lennon <ajlennon@gmail.com>
From: Alex J Lennon <ajlennon@dynamicdevices.co.uk>
To: openembedded-core@lists.openembedded.org
Date: Thu, 19 Mar 2015 13:17:34 +0000
Message-Id: <7c87cdf3c3ba961db9db89b0299ad0670e8c3d35.1426770861.git.ajlennon@dynamicdevices.co.uk>
X-Mailer: git-send-email 1.9.1
In-Reply-To: <cover.1426770861.git.ajlennon@dynamicdevices.co.uk>
References: <cover.1426770861.git.ajlennon@dynamicdevices.co.uk>
Subject: [PATCH 1/1] e2fsprogs: Package resize2fs
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
X-List-Received-Date: Thu, 19 Mar 2015 13:18:21 -0000

Signed-off-by: Alex J Lennon <ajlennon@dynamicdevices.co.uk>
---
 meta/recipes-devtools/e2fsprogs/e2fsprogs_1.42.9.bb | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/meta/recipes-devtools/e2fsprogs/e2fsprogs_1.42.9.bb b/meta/recipes-devtools/e2fsprogs/e2fsprogs_1.42.9.bb
index 1fb4a6cd..87243b2 100644
--- a/meta/recipes-devtools/e2fsprogs/e2fsprogs_1.42.9.bb
+++ b/meta/recipes-devtools/e2fsprogs/e2fsprogs_1.42.9.bb
@@ -63,9 +63,10 @@ do_install_append_class-target() {
 RDEPENDS_e2fsprogs = "e2fsprogs-badblocks"
 RRECOMMENDS_e2fsprogs = "e2fsprogs-mke2fs e2fsprogs-e2fsck"
 
-PACKAGES =+ "e2fsprogs-e2fsck e2fsprogs-mke2fs e2fsprogs-tune2fs e2fsprogs-badblocks"
+PACKAGES =+ "e2fsprogs-e2fsck e2fsprogs-mke2fs e2fsprogs-tune2fs e2fsprogs-badblocks e2fsprogs-resize2fs"
 PACKAGES =+ "libcomerr libss libe2p libext2fs"
 
+FILES_e2fsprogs-resize2fs = "${base_sbindir}/resize2fs*"
 FILES_e2fsprogs-e2fsck = "${base_sbindir}/e2fsck ${base_sbindir}/fsck.ext*"
 FILES_e2fsprogs-mke2fs = "${base_sbindir}/mke2fs ${base_sbindir}/mkfs.ext* ${sysconfdir}/mke2fs.conf"
 FILES_e2fsprogs-tune2fs = "${base_sbindir}/tune2fs ${base_sbindir}/e2label"
-- 
1.9.1


