Return-Path: <ross.burton@intel.com>
Received: from mail-wm0-f45.google.com (mail-wm0-f45.google.com [74.125.82.45])
	by mail.openembedded.org (Postfix) with ESMTP id 6FAB478558
	for <openembedded-core@lists.openembedded.org>;
	Wed,  8 Aug 2018 21:26:23 +0000 (UTC)
Received: by mail-wm0-f45.google.com with SMTP id r24-v6so598798wmh.0
	for <openembedded-core@lists.openembedded.org>;
	Wed, 08 Aug 2018 14:26:24 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=intel-com.20150623.gappssmtp.com; s=20150623;
	h=from:to:subject:date:message-id;
	bh=8SQ7mOM/tTeUuaTvQacvygea2GF8sKWjbKq0GFIWaHY=;
	b=hSDWQ2JOA+vRW8gcpflEAZebdAX/pCtVz+dfku93BNAnjxz2m9R8M6VQs9viUGIow0
	3FpKFPK6KPiOQpGUWS3xitD1cp6c5C8PKO+rD94MdXm3fExKhy1LGvy9LyLSJF9e+6HK
	l3WuYf0tLy8Zh49h9jOFnWA+UAraP0gzAJzPR6WdJ4uiNj4p8br4hZc3ak7McDuLrhY2
	hB7tp2MCrQNH9N8wwCzv3a6NYDno5qaKctNxoun4QMoAKrYc5JrdJvNg8UuLpZ7qdqkl
	Nj8WaJNe6m6e4RHmHJ0X6gn1gtM4VpUrCU1+1Y+EdQsPOE7SLc8hLrt9mihVy5TbqNYy
	MAtw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:subject:date:message-id;
	bh=8SQ7mOM/tTeUuaTvQacvygea2GF8sKWjbKq0GFIWaHY=;
	b=FEX1BbVLhlRVFpbCB4SBb3PJ9/fUvDCQ7tMc8ytUYvuJ8ubWc17s50dbsj5MO80JFz
	PZuF3y9AOHzULuz/3wb3ny2DElyF+PfyfRcK4lDVreKbrEDKUN+MIAsQy7PeUZOnF6FN
	fcDrkJdrDazRxT68f7ZON+XFL/PY4OwOPPzXQaI99CUwd5TPW24VDTz77Gj7X/ClC3dr
	v8WIdD2puTzMpn1BF8vtWrPIm7JLbxo3zi9QYRZCofGIPZhGQKtrkJ6bEMPHAA4d+bwC
	moNDXAOi141NpxkhURN3aVrxqEu+HqIf1AWLv8bT23Kcv1xbwh1bFPrmfCQoEUU89lJV
	qiGw==
X-Gm-Message-State: AOUpUlHygDYhSgoZGracJAsK6zuOsdTBHGj0RiaxpqaOP9OfRPEQ9RmP
	cfT6/DUnHya4xDW2XQkL23A68XYvQuI=
X-Google-Smtp-Source: AA+uWPzYSJpVh75nXWxK3W+DLd3YOpij0r2VoG+qrXrUqf4YEeX+2fsYuUrDM5DZU4id1RBSJg6xog==
X-Received: by 2002:a1c:cf05:: with SMTP id f5-v6mr2918291wmg.64.1533763583819;
	Wed, 08 Aug 2018 14:26:23 -0700 (PDT)
Received: from flashheart.burtonini.com (35.106.2.81.in-addr.arpa.
	[81.2.106.35]) by smtp.gmail.com with ESMTPSA id
	m68-v6sm11337038wmb.10.2018.08.08.14.26.22
	for <openembedded-core@lists.openembedded.org>
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Wed, 08 Aug 2018 14:26:23 -0700 (PDT)
From: Ross Burton <ross.burton@intel.com>
To: openembedded-core@lists.openembedded.org
Date: Wed,  8 Aug 2018 22:26:20 +0100
Message-Id: <20180808212620.9669-1-ross.burton@intel.com>
X-Mailer: git-send-email 2.11.0
Subject: [PATCH] oeqa/sdk/buildgalculator: check for nativesdk-gettext-dev
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
X-List-Received-Date: Wed, 08 Aug 2018 21:26:23 -0000

We don't need target gettext to build, but nativesdk-gettext-dev (for nls.m4).

Signed-off-by: Ross Burton <ross.burton@intel.com>
---
 meta/lib/oeqa/sdk/cases/buildgalculator.py | 6 +++---
 1 file changed, 3 insertions(+), 3 deletions(-)

diff --git a/meta/lib/oeqa/sdk/cases/buildgalculator.py b/meta/lib/oeqa/sdk/cases/buildgalculator.py
index 5a5bf992ebf..4c02ea4c51d 100644
--- a/meta/lib/oeqa/sdk/cases/buildgalculator.py
+++ b/meta/lib/oeqa/sdk/cases/buildgalculator.py
@@ -8,10 +8,10 @@ class GalculatorTest(OESDKTestCase):
 
     @classmethod
     def setUpClass(self):
-        if not (self.tc.hasTargetPackage("gtk\+3") or\
-                self.tc.hasTargetPackage("libgtk-3.0")):
+        if not (self.tc.hasTargetPackage(r"gtk\+3") or\
+                self.tc.hasTargetPackage(r"libgtk-3.0")):
             raise unittest.SkipTest("GalculatorTest class: SDK don't support gtk+3")
-        if not (self.tc.hasTargetPackage("gettext")):
+        if not (self.tc.hasHostPackage("nativesdk-gettext-dev")):
             raise unittest.SkipTest("GalculatorTest class: SDK doesn't contain gettext")
 
     def test_galculator(self):
-- 
2.11.0


