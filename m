Return-Path: <philip.balister@gmail.com>
Received: from mail-qk0-f173.google.com (mail-qk0-f173.google.com
	[209.85.220.173])
	by mail.openembedded.org (Postfix) with ESMTP id 32534757B6
	for <openembedded-core@lists.openembedded.org>;
	Mon,  1 Jun 2015 20:17:38 +0000 (UTC)
Received: by qkoo18 with SMTP id o18so90310434qko.1
	for <openembedded-core@lists.openembedded.org>;
	Mon, 01 Jun 2015 13:17:39 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=sender:from:to:cc:subject:date:message-id:in-reply-to:references;
	bh=tO+r1oKBebvtD7kEaj4WVtV+8ZW7ZL1aX5E3NG4qkQ4=;
	b=jlc30dBwpZ8Q4oJnJ7DjF59gbjTvkDD+sFS5YC7de2VU2Y6KBO7TPT4lE4LV7+8SCl
	71zwE2UxQSuhh/NVa+C61gZpQdqFwRaoaW5Rt8gYItdKTFU/c7UPnoXSDDOlsBFnmH5+
	56pxtFflFf8HAKwdoAY35akqrkJyT0qXTVK09oudCTXt23ydbRt2Jlw5RlBUg2njotLy
	1J9G/M2M9mf34xdHitdlpcq0loSurTols5MMhJO9nA/cAK6XcRDytIM/ttu/AnfdJk/b
	lwS1yefHg5O+UMVOPz3SGbyUQhS5E5Sv+u52SwdudJeFSD3SeafyuspAiQFPJ39+aobd
	HGmQ==
X-Received: by 10.55.48.73 with SMTP id w70mr41436322qkw.49.1433189859802;
	Mon, 01 Jun 2015 13:17:39 -0700 (PDT)
Received: from thuvia.localdomain (pool-71-171-14-73.ronkva.east.verizon.net.
	[71.171.14.73])
	by mx.google.com with ESMTPSA id 80sm5728122qhr.26.2015.06.01.13.17.39
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Mon, 01 Jun 2015 13:17:39 -0700 (PDT)
Sender: Philip Balister <philip.balister@gmail.com>
From: Philip Balister <philip@balister.org>
To: openembedded-core@lists.openembedded.org
Date: Mon,  1 Jun 2015 16:17:22 -0400
Message-Id: <1433189842-17654-2-git-send-email-philip@balister.org>
X-Mailer: git-send-email 2.1.0
In-Reply-To: <1433189842-17654-1-git-send-email-philip@balister.org>
References: <1433189842-17654-1-git-send-email-philip@balister.org>
Subject: [PATCH 2/2] packagegroup-core-tools-profile.bb: Remove oprofile.
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
X-List-Received-Date: Mon, 01 Jun 2015 20:17:40 -0000

Oprofile functions duplicate perf. Since perf is easier to use drop oprofile
from the core-tools-profile package.

Also, the oprofile-ui package opens a port on the device. removing this
package reduces a possible security issue for devices with profiling tools.

Signed-off-by: Philip Balister <philip@balister.org>
---
 meta/recipes-core/packagegroups/packagegroup-core-tools-profile.bb | 3 ---
 1 file changed, 3 deletions(-)

diff --git a/meta/recipes-core/packagegroups/packagegroup-core-tools-profile.bb b/meta/recipes-core/packagegroups/packagegroup-core-tools-profile.bb
index 6f4842f..80f5933 100644
--- a/meta/recipes-core/packagegroups/packagegroup-core-tools-profile.bb
+++ b/meta/recipes-core/packagegroups/packagegroup-core-tools-profile.bb
@@ -19,15 +19,12 @@ PROFILE_TOOLS_SYSTEMD = "${@bb.utils.contains('DISTRO_FEATURES', 'systemd', 'sys
 RRECOMMENDS_${PN} = "\
     perf \
     trace-cmd \
-    kernel-module-oprofile \
     blktrace \
     ${PROFILE_TOOLS_X} \
     ${PROFILE_TOOLS_SYSTEMD} \
     "
 
 PROFILETOOLS = "\
-    oprofile \
-    oprofileui-server \
     powertop \
     latencytop \
     "
-- 
2.1.0


