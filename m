Received: from mail-vc0-f175.google.com ([209.85.220.175])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <philip.balister@gmail.com>) id 1TbECq-0005iW-FP
	for openembedded-core@openembedded.org; Wed, 21 Nov 2012 18:35:24 +0100
Received: by mail-vc0-f175.google.com with SMTP id m8so3319789vcd.6
	for <openembedded-core@openembedded.org>;
	Wed, 21 Nov 2012 09:21:18 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=sender:from:to:cc:subject:date:message-id:x-mailer;
	bh=efbJ1dbkM1ey/HsTnQ5Ht5bAcO7/92i9W7xQMk2U0mQ=;
	b=q8AItysAMgJ5PkCmhhiCeW8JhohFxuz3Y5pb+BiWM0ZG2/2k0puXdQJcnmwDi9q8P/
	c+AxXhSnc1SSxmFN/grQeumqUQ9rorxz+MRiIoBe4uQ1sj3sPHPzjOv0fuYyPHwb7t9o
	3ufPDWVL3QKYJ+lldhAjCec3qlq2gbcuhAvRpJWVBZOjmWVet+ifJjCuonYQ3i4vSpC4
	tVubiRIHeWbumQF7+qN1NX2KwtYTAvcRFdIsynCPknfH7irfut7XFqf0dqb7/AsJJK+/
	bDqOTHEsX/2obiLTUqFWxocSJE12TLD9rB3lsnKNYmp5e6a8aCltPEfJiTatn3T8sM8L
	LYCA==
Received: by 10.52.89.172 with SMTP id bp12mr25871480vdb.19.1353518478849;
	Wed, 21 Nov 2012 09:21:18 -0800 (PST)
Received: from localhost.localdomain ([96.240.166.19])
	by mx.google.com with ESMTPS id cz16sm363216vdb.15.2012.11.21.09.21.16
	(version=TLSv1/SSLv3 cipher=OTHER);
	Wed, 21 Nov 2012 09:21:17 -0800 (PST)
Sender: Philip Balister <philip.balister@gmail.com>
From: Philip Balister <philip@balister.org>
To: openembedded-core@openembedded.org
Date: Wed, 21 Nov 2012 12:21:13 -0500
Message-Id: <1353518473-27252-1-git-send-email-philip@balister.org>
X-Mailer: git-send-email 1.7.11.7
Subject: [PATCH] insane.bbclass : Disable tests for unsafe references in binaries and scripts.
X-BeenThere: openembedded-core@lists.openembedded.org
X-Mailman-Version: 2.1.11
Precedence: list
List-Id: Patches and discussions about the oe-core layer
	<openembedded-core.lists.openembedded.org>
List-Unsubscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/options/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.linuxtogo.org/pipermail/openembedded-core>
List-Post: <mailto:openembedded-core@lists.openembedded.org>
List-Help: <mailto:openembedded-core-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Wed, 21 Nov 2012 17:35:24 -0000

These test look for programs in / that depend on programs in /usr. After
a brief discussion in #oe, we decided these tests should be disabled so
we can focus on more serious QA issues.

If you are working on a system where / and /usr are on different partitions,
you should turn these tests back on and resolving the QA warnings.

Signed-off-by: Philip Balister <philip@balister.org>
---
 meta/classes/insane.bbclass | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta/classes/insane.bbclass b/meta/classes/insane.bbclass
index 237ee82..c5c84b8 100644
--- a/meta/classes/insane.bbclass
+++ b/meta/classes/insane.bbclass
@@ -113,7 +113,7 @@ def package_qa_get_machine_dict():
 
 
 # Currently not being used by default "desktop"
-WARN_QA ?= "ldflags useless-rpaths rpaths unsafe-references-in-binaries unsafe-references-in-scripts staticdev libdir xorg-driver-abi textrel"
+WARN_QA ?= "ldflags useless-rpaths rpaths staticdev libdir xorg-driver-abi textrel"
 ERROR_QA ?= "dev-so debug-deps dev-deps debug-files arch la2 pkgconfig la perms dep-cmp"
 
 ALL_QA = "${WARN_QA} ${ERROR_QA}"
-- 
1.7.11.7



