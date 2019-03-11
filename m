Return-Path: <richard.purdie@linuxfoundation.org>
Received: from mail-pf1-f170.google.com (mail-pf1-f170.google.com
	[209.85.210.170])
	by mail.openembedded.org (Postfix) with ESMTP id 5AA6A607A4
	for <openembedded-core@lists.openembedded.org>;
	Mon, 11 Mar 2019 03:12:37 +0000 (UTC)
Received: by mail-pf1-f170.google.com with SMTP id i19so2650253pfd.0
	for <openembedded-core@lists.openembedded.org>;
	Sun, 10 Mar 2019 20:12:38 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=linuxfoundation.org; s=google;
	h=from:to:cc:subject:date:message-id:in-reply-to:references
	:mime-version:content-transfer-encoding;
	bh=7lBMyO26EjvnPRd53suDxK+b+1ENU1GUKjqKWTn+3sE=;
	b=Vsz51/y8a5mYocrxNh4kmpNQxS9LyeKKL/0A4UZy3Gbc2oX+zqu2w/XgrZ3G4P9FiX
	USKos//A5OE76HGN/8eaopShoWIFG5COwdV3pICH7E7XpkGfAMyoDDXEs7/Jrs/+5Iye
	hjyQNZgRi8vv1Zc9iRBlrGiHxhLJUIGbiR2G4=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
	:references:mime-version:content-transfer-encoding;
	bh=7lBMyO26EjvnPRd53suDxK+b+1ENU1GUKjqKWTn+3sE=;
	b=oUvWfqCv7OCnJRhamMQNXs04vIgPnMwHdY728SGvH2x6jg6k21qIT5y29PSmD4W310
	LXNDbFmthiso9ad/2Hixkc+KxR+Mmq4UkStfZ+xnsEJf7f1FEytBMwiAv9BaP+CAgW/d
	bVYheDw//WH20SkGy3rVzSyOt/iDXS7LCXBGPZjYqHA44Mfi8W51rMUnYzMhIktwRMP/
	vT6MavH9K/O7Qx/TfkvbET653d0yRgkDLRqeqbekPNeQX41KWHPgtqwU4ax6wvFvW6BK
	ql9xlhMeqj6dyavpiGAaPe//b70MLp9xaVelxVfVT2oTZK3gmqNbePOyoO6P32VLtjLE
	btzw==
X-Gm-Message-State: APjAAAVUmvE6Jmm+bBfqywY9L20Si+bQwsCQHB7qySlswpEJ+jZ1P+sG
	kcRYMDlI23AyuB3gJojuEcMvj1n43JK6wA==
X-Google-Smtp-Source: APXvYqwULPOeKs8wzTiqK5J3tybpb0838Md9shb1b6xodBb17EF9YsZGvK5g7LT1cAn0rPM3IumM+Q==
X-Received: by 2002:a62:6453:: with SMTP id y80mr30778134pfb.203.1552273957881;
	Sun, 10 Mar 2019 20:12:37 -0700 (PDT)
Received: from hex.int.rpsys.net ([12.27.65.221])
	by smtp.gmail.com with ESMTPSA id l2sm6166861pgj.64.2019.03.10.20.12.36
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Sun, 10 Mar 2019 20:12:36 -0700 (PDT)
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: openembedded-core@lists.openembedded.org
Date: Mon, 11 Mar 2019 03:12:30 +0000
Message-Id: <20190311031230.21497-5-richard.purdie@linuxfoundation.org>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20190311031230.21497-1-richard.purdie@linuxfoundation.org>
References: <20190311031230.21497-1-richard.purdie@linuxfoundation.org>
MIME-Version: 1.0
Subject: [PATCH 5/5] meta-selftest/virgl: Exclude centos7 from the kmscube test
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
X-List-Received-Date: Mon, 11 Mar 2019 03:12:37 -0000
Content-Transfer-Encoding: 8bit

This test does not work on centos7 so diable it (as was done in the
original series before we thought it was working).

Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
---
 meta-selftest/lib/oeqa/runtime/cases/virgl.py | 6 ++++++
 1 file changed, 6 insertions(+)

diff --git a/meta-selftest/lib/oeqa/runtime/cases/virgl.py b/meta-selftest/lib/oeqa/runtime/cases/virgl.py
index fd6b7851dbe..d301a19fa42 100644
--- a/meta-selftest/lib/oeqa/runtime/cases/virgl.py
+++ b/meta-selftest/lib/oeqa/runtime/cases/virgl.py
@@ -1,6 +1,7 @@
 from oeqa.runtime.case import OERuntimeTestCase
 from oeqa.core.decorator.depends import OETestDepends
 import subprocess
+import oe.lsb
 
 class VirglTest(OERuntimeTestCase):
 
@@ -12,6 +13,11 @@ class VirglTest(OERuntimeTestCase):
 
     @OETestDepends(['virgl.VirglTest.test_kernel_driver'])
     def test_kmscube(self):
+
+        distro = oe.lsb.distro_identifier()
+        if distro and distro == 'centos-7':
+            self.skipTest('kmscube is not working when centos 7 is the host OS')
+
         status, output = self.target.run('kmscube', timeout=30)
         self.assertEqual(status, 0, "kmscube exited with non-zero status %d and output:\n%s" %(status, output))
         self.assertIn('renderer: "virgl"', output, "kmscube does not seem to use virgl:\n%s" %(output))
-- 
2.20.1


