Return-Path: <jpewhacker@gmail.com>
Received: from mail-io1-f50.google.com (mail-io1-f50.google.com
	[209.85.166.50])
	by mail.openembedded.org (Postfix) with ESMTP id 30B927EADD
	for <openembedded-core@lists.openembedded.org>;
	Tue, 27 Aug 2019 19:34:21 +0000 (UTC)
Received: by mail-io1-f50.google.com with SMTP id b10so932335ioj.2
	for <openembedded-core@lists.openembedded.org>;
	Tue, 27 Aug 2019 12:34:22 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=from:to:cc:subject:date:message-id:in-reply-to:references
	:mime-version:content-transfer-encoding;
	bh=r4qDbWRl2PkcRZjqCWJBdLz6zormTj0BSbhpd22RrXM=;
	b=dO/5A6uWud/thhNrPLJXGX+t7gNlOdD//UJkl8pBt3RQ6a6Q0fOAxiZ4NnjiJ508OR
	ms2bEuSuKrx5oqMF76ST6VbUEQUXJ+fgHS9e1tKX1v63C5hQ9COSEsgHgcNIM363uWjf
	psXujcjRbXwGoKaGnMrY3egNpw62Rl5Pk7z6dLmKQofGGtapikJqQmX5pdIw1juKPP9O
	owyLwckXWLhPZWqyXRQvoHwl8UV7sfQIjKdrRyKdc6qtUqeGCH88TNa0HlygVrA244jO
	Hx4H/8QKoC2qgkOYpFvPWLwgzQ8QZUle2WvafS3YsxNP+5YLMxKn2e5bZlVucsvV+geO
	fg1g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
	:references:mime-version:content-transfer-encoding;
	bh=r4qDbWRl2PkcRZjqCWJBdLz6zormTj0BSbhpd22RrXM=;
	b=f17eoFscLEge+8MFm96c3yxWyaukkDXtoAYC1BPcryZSDpdysV2qHOUnmbkW2OdbfQ
	YsW2RkU+FRrTqhbRW3+LEDsk0j32SWQl2neytcJ1Tbg1bVxHM67213nIqP02LBACpnx7
	ViZLNI7CGpMBqwc4mSTBiS+uJlq/+Bb2DYGdyP9pl9lwK0fUwbvnScH1vxyUalbNMGkJ
	fNwor89QGbEyJNkcMeyBhOA1ysS7qCPdnUYqLsgoG/18nbPdyd/rCtVRpA8If4dCvZUK
	aaOsR04vAH/YoYx6rGXEvM6kYIgmhQK7xDQq3YdSgM39ELIwhOb7kFG5cqO7G3i99J6c
	Ssjw==
X-Gm-Message-State: APjAAAWhu45fgBM9YoFti8PYkpQtIGLbEh3xhZUHuSpvsjj0cYSMttcl
	UckWSiCCNhv6EbVzaQhHr1OnEw9h
X-Google-Smtp-Source: APXvYqy+qUO2ClBwm5vW/zWf9hmbd73T6wajPf4GXClvLevbbj0jXj0ZLk0pHrhgBhrQ8dhvreBlaw==
X-Received: by 2002:a02:69d1:: with SMTP id e200mr485071jac.138.1566934462078; 
	Tue, 27 Aug 2019 12:34:22 -0700 (PDT)
Received: from ola-842mrw1.ad.garmin.com ([204.77.163.55])
	by smtp.gmail.com with ESMTPSA id 8sm47288ion.26.2019.08.27.12.34.20
	(version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
	Tue, 27 Aug 2019 12:34:21 -0700 (PDT)
From: Joshua Watt <jpewhacker@gmail.com>
X-Google-Original-From: Joshua Watt <JPEWhacker@gmail.com>
To: openembedded-core@lists.openembedded.org
Date: Tue, 27 Aug 2019 14:33:49 -0500
Message-Id: <20190827193349.23254-6-JPEWhacker@gmail.com>
X-Mailer: git-send-email 2.21.0
In-Reply-To: <20190827193349.23254-1-JPEWhacker@gmail.com>
References: <20190827193349.23254-1-JPEWhacker@gmail.com>
MIME-Version: 1.0
Subject: [PATCH 5/5] oeqa: Enable reproducible build test
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
X-List-Received-Date: Tue, 27 Aug 2019 19:34:21 -0000
Content-Transfer-Encoding: 8bit

[YOCTO #13323]

Signed-off-by: Joshua Watt <JPEWhacker@gmail.com>
---
 meta/lib/oeqa/selftest/cases/reproducible.py | 1 -
 1 file changed, 1 deletion(-)

diff --git a/meta/lib/oeqa/selftest/cases/reproducible.py b/meta/lib/oeqa/selftest/cases/reproducible.py
index ebfa88fbc55..c6cc0b7d0eb 100644
--- a/meta/lib/oeqa/selftest/cases/reproducible.py
+++ b/meta/lib/oeqa/selftest/cases/reproducible.py
@@ -120,7 +120,6 @@ class ReproducibleTests(OESelftestTestCase):
         self.extras['reproducible']['files'].setdefault(package_class, {})[name] = [
                 {'reference': p.reference, 'test': p.test} for p in packages]
 
-    @unittest.skip("Reproducible builds do not yet pass")
     def test_reproducible_builds(self):
         capture_vars = ['DEPLOY_DIR_' + c.upper() for c in self.package_classes]
 
-- 
2.21.0


