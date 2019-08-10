Return-Path: <raj.khem@gmail.com>
Received: from mail-pg1-f194.google.com (mail-pg1-f194.google.com
	[209.85.215.194])
	by mail.openembedded.org (Postfix) with ESMTP id E0F397D088
	for <openembedded-core@lists.openembedded.org>;
	Sat, 10 Aug 2019 18:05:47 +0000 (UTC)
Received: by mail-pg1-f194.google.com with SMTP id x15so37071543pgg.8
	for <openembedded-core@lists.openembedded.org>;
	Sat, 10 Aug 2019 11:05:49 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=from:to:cc:subject:date:message-id:mime-version
	:content-transfer-encoding;
	bh=X5PFrCmHaWdc1F5c8CGgXL1leCxd1IVafVynVx1OkEo=;
	b=DKUsk6wWZk4sth1xlCNGBaG0hS8vMVPhzilkrUp3IRtHnQPQRte5+eSXbFjNKaOQZF
	CWqyL6N7Lqgz1jZ6dCfZRo/v+F3aMPbCIipIYyQNy/s1y+w2E3m3DrzbsQ8y8LVLZFvK
	dxHWnEOxq6PE1PhTjuaRf4nZYOT629hTRGrbVPEpo57a8s1cSaxh1sewf8hREQdL34Yv
	P26xS1UZ2tE1bsQIN4v8aT9m3gw7sVAJ/qF55PZgi4DP7RozEunZdW01RCfOaqOuFgrm
	QTaIa/pH+bQXba7s9trn3GLa7qbwSP36bC6qICljw4xT1wr+2EP7rW6q+btAZUJr9kvl
	ukNw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
	:content-transfer-encoding;
	bh=X5PFrCmHaWdc1F5c8CGgXL1leCxd1IVafVynVx1OkEo=;
	b=dZx4ZQi+cBCVZmvtJlPhyjQwKDHW8MMi3jFq7c96rHJ9mWzsYOuKJDdC/CsPgeBh+9
	gfSc9bclckJYmIKyRUna2RlFsHEQbDG5WJW1vfT3V/hW0VGSINbRvhzjL6YG9Ug8CdVC
	htPbK9tpCUZP8q6deeaOSgxUZEOYwwFc6VlPaWj0TfQjPfefJVU/2aieQ9i2nzCv8jRx
	dT6fOExBKfn9uQ1Ufw1wzzCpFhtDBfYmmkZtCz/hD4JWeu47VtZR4yMj1mlzkTw3F3/L
	H84wsyY1Gm+YI4NgAEJnfmZdTmeWS9Ltc7iFo6ID1Ny57BOyn0xqHVYl5+RMtJyhXVjJ
	u1IA==
X-Gm-Message-State: APjAAAWEA/ivJBcticnzF7FkSAm5Iyx0AwkZBp6OBzFzlzWf5GOaPNfb
	mqL8QobJkqjo15MXH6BT85205l32v3I=
X-Google-Smtp-Source: APXvYqx07VXGtcGXFXNJMtuIlDIua/rpj+TZchZgR8SvOfZF7YkCg9U5zpk/xju+8WXDPw1s/rCYYw==
X-Received: by 2002:a65:5082:: with SMTP id r2mr9247225pgp.170.1565460348538; 
	Sat, 10 Aug 2019 11:05:48 -0700 (PDT)
Received: from apollo.hsd1.ca.comcast.net (c-73-71-176-3.hsd1.ca.comcast.net.
	[73.71.176.3]) by smtp.gmail.com with ESMTPSA id
	k36sm101776026pgl.42.2019.08.10.11.05.47
	(version=TLS1_3 cipher=AEAD-AES256-GCM-SHA384 bits=256/256);
	Sat, 10 Aug 2019 11:05:48 -0700 (PDT)
From: Khem Raj <raj.khem@gmail.com>
To: openembedded-core@lists.openembedded.org
Date: Sat, 10 Aug 2019 11:05:40 -0700
Message-Id: <20190810180540.22123-1-raj.khem@gmail.com>
X-Mailer: git-send-email 2.22.0
MIME-Version: 1.0
Subject: [PATCH] oeqa/buildgalculator.py: Add dependency on gtk+3
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
X-List-Received-Date: Sat, 10 Aug 2019 18:05:48 -0000
Content-Transfer-Encoding: 8bit

This helps in skipping this test on images which are not using gtk and
as per the gcalculator website it needs gtk+3 or gtk+2 and libglade as
the build first looks for gtk+3

Signed-off-by: Khem Raj <raj.khem@gmail.com>
---
 meta/lib/oeqa/runtime/cases/buildgalculator.py | 1 +
 1 file changed, 1 insertion(+)

diff --git a/meta/lib/oeqa/runtime/cases/buildgalculator.py b/meta/lib/oeqa/runtime/cases/buildgalculator.py
index 6dd1faee0a..e5cc3e2888 100644
--- a/meta/lib/oeqa/runtime/cases/buildgalculator.py
+++ b/meta/lib/oeqa/runtime/cases/buildgalculator.py
@@ -25,6 +25,7 @@ class GalculatorTest(OERuntimeTestCase):
     @OEHasPackage(['gcc'])
     @OEHasPackage(['make'])
     @OEHasPackage(['autoconf'])
+    @OEHasPackage(['gtk+3'])
     def test_galculator(self):
         self.project.download_archive()
         self.project.run_configure()
-- 
2.22.0


