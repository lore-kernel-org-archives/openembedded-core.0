Return-Path: <akuster808@gmail.com>
Received: from mail-pl1-f177.google.com (mail-pl1-f177.google.com
	[209.85.214.177])
	by mail.openembedded.org (Postfix) with ESMTP id 7AB847FBBD
	for <openembedded-core@lists.openembedded.org>;
	Tue, 12 Nov 2019 04:33:53 +0000 (UTC)
Received: by mail-pl1-f177.google.com with SMTP id d7so6940568pls.3
	for <openembedded-core@lists.openembedded.org>;
	Mon, 11 Nov 2019 20:33:55 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=from:to:subject:date:message-id:in-reply-to:references;
	bh=gHKFfCYnLv/xiNZ4o9kRqBiAnjQ0sz0wSQh9mpC5JvQ=;
	b=bqCviGtBZ3+eRuKnAreofYeqI8WiUwIjrQtyVuzYuk5p2imTjtIP4CmdTHL9aAFyDL
	xhH81oJ+AxvuDhp7pA0izPRcWaTPFM9f8htRSPLI27HCszIQojL4TjIk92UiyLvXfnlJ
	4cRlVRIXC5DCfn0crDZBrYvhiNuTBPS/REkN3spJ76isuog9LktSfgcQk3oOaLLh4bP8
	3m4XfK+hUtnC9tXHcq24s+2wax5gxHlViYqDJlR45JYf5V9TX7r9oJcaxT2Q2TVxaSyd
	CxYOxAz/NJUcX3LRULUTNug8p1sAZ1bzdg0QHRuACwmLof2zqGnrINta81L711RDUBcz
	f1sw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
	:references;
	bh=gHKFfCYnLv/xiNZ4o9kRqBiAnjQ0sz0wSQh9mpC5JvQ=;
	b=JW6Xw8I/Tw2NddWkkxdguJ9CnE2Ef5/H8WOANPqB8NUc7jlPMBub8FezDcp6fMSI4P
	y4fNg2bU9w+JCsT5lLIm6gXezDjRRTiO2ChnNeT7+OPtFI8bpOZD4BSkfoqqvMJvGd47
	DFzW7xVUH1Cw8t4d0Q+JPyXZIy/osOBF/r7UquWASE3eRxRwKBZ6PTY2n7hw6519hDtt
	Ka0tY0CU7AJXTkfNJCuR3eI4HTp1KwXyXMUc7FeFaQipmbRvqja8E3H+hFtVEP0qvU0N
	T5rUBUDIDtUWFPjItdmen2xlbzfdg4dHk+M3V6wkK/hQF5Bshlr3LuVRpVodm5sSFQsz
	qQ4g==
X-Gm-Message-State: APjAAAW1MzKppekV4K2AfF/YpNrg7PEpJPgHekoxYe+HFZE0c00rGOhD
	JchhZnUn+XflUnznsrGsHq4WW6Bl
X-Google-Smtp-Source: APXvYqx1QmNdbpWTPhhzXzN1ky7UaNrsmGHw4XoK537dpwjB5OqX012creNJ84yOGUGwwWIIHRs0lg==
X-Received: by 2002:a17:902:d881:: with SMTP id
	b1mr18709551plz.170.1573533234507; 
	Mon, 11 Nov 2019 20:33:54 -0800 (PST)
Received: from akuster-ThinkPad-T460s.mvista.com
	([2601:202:4180:a5c0:2cf9:53ea:e6ab:d378])
	by smtp.gmail.com with ESMTPSA id
	q12sm5212109pgl.23.2019.11.11.20.33.53
	for <openembedded-core@lists.openembedded.org>
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
	Mon, 11 Nov 2019 20:33:54 -0800 (PST)
From: Armin Kuster <akuster808@gmail.com>
To: openembedded-core@lists.openembedded.org
Date: Mon, 11 Nov 2019 20:33:33 -0800
Message-Id: <dbe5d8d0429ddca87fa80f613a8fbab287910696.1573532188.git.akuster808@gmail.com>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <cover.1573532188.git.akuster808@gmail.com>
References: <cover.1573532188.git.akuster808@gmail.com>
Subject: [PATCH 14/20] OEQA: move manual bash test to runtime
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
X-List-Received-Date: Tue, 12 Nov 2019 04:33:53 -0000

Signed-off-by: Armin Kuster <akuster808@gmail.com>
---
 meta/lib/oeqa/selftest/cases/runtime_test.py | 17 +++++++++++++++++
 1 file changed, 17 insertions(+)

diff --git a/meta/lib/oeqa/selftest/cases/runtime_test.py b/meta/lib/oeqa/selftest/cases/runtime_test.py
index 7d3922c..28804ea 100644
--- a/meta/lib/oeqa/selftest/cases/runtime_test.py
+++ b/meta/lib/oeqa/selftest/cases/runtime_test.py
@@ -322,3 +322,20 @@ class Postinst(OESelftestTestCase):
                 self.assertFalse(os.path.isfile(os.path.join(hosttestdir, "rootfs-after-failure")),
                                     "rootfs-after-failure file was created")
 
+
+
+class Bsp(OESelftestTestCase):
+    def test_bash_installed(self):
+        """
+        Summary:        The purpose of this test case is to verify that bash 
+                        in exists in the image. Test came from manual.
+        Expected:       Bash is found.
+        """
+
+        features = 'IMAGE_INSTALL_append = " bash"\n'
+        self.write_config(features)
+        bitbake('core-image-minimal')
+
+        with runqemu('core-image-minimal') as qemu:
+            result = runCmd("which bash" , shell=True)
+            self.assertEqual(0, result.status, "Couldn't find bash")
-- 
2.7.4


