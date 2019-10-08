Return-Path: <ross.burton@intel.com>
Received: from mail-wm1-f67.google.com (mail-wm1-f67.google.com
	[209.85.128.67])
	by mail.openembedded.org (Postfix) with ESMTP id B27F87F37F
	for <openembedded-core@lists.openembedded.org>;
	Tue,  8 Oct 2019 11:52:02 +0000 (UTC)
Received: by mail-wm1-f67.google.com with SMTP id f22so2809744wmc.2
	for <openembedded-core@lists.openembedded.org>;
	Tue, 08 Oct 2019 04:52:04 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=intel-com.20150623.gappssmtp.com; s=20150623;
	h=from:to:subject:date:message-id:mime-version
	:content-transfer-encoding;
	bh=HGn4IwJB4U11A7oM75fkJbwQ6E3dTdgb1EkyHCFbrK0=;
	b=pycvWGo9Y6oF9pIr/LHi3lhPIpGdRNjTw8UkYRSRHE9X5vlzh5LfOoxrUHo+0Utwat
	M4aw/JIQh9Fn0ZE4gEqvGq37r19ARfRx4WFtO2BAeScMRiyN9q2iDMgemC974o1oQc+l
	HquftRvLMLC3JyT25XZ572j+WhPUic41ensFANK6xj6bzN9lZnaEQtwClSXORrHOYSkG
	VR5PuWfhlEEEyKW7De5E7o3qcEtL3GuAxU+lL7EE86DATLxoQzIxoJ5jDZxzCZtVk7nz
	hQCu7e5JXpqOnN1ei1AWMjUqcK/M7ptIm20gKpHIwVBN21rELpd9C14IfgL+CyQ4zXEM
	y+3g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:subject:date:message-id:mime-version
	:content-transfer-encoding;
	bh=HGn4IwJB4U11A7oM75fkJbwQ6E3dTdgb1EkyHCFbrK0=;
	b=qlBqiGkhHu8ROBOhocH69lFc+za9hoJ08YzqbhE0jUM3xa307A90jQmSfBqCqAADTl
	VqKm3fy10DmmnjAh2CgAoMUupPAuyS1N/7EuiUSAZHYJ2jy9q2TMIBMlSQZI0g82peuu
	K2TN8e570Vs8K3KT72NnFmw+N4mHr6AGOcHyBxXs2B+5NhEdAdXYWd7cd5Z+Uhk284+t
	nUFNgiEkbZC82Vi12dDGMWU/951womJnQnFDpAHy3xjIzBSj/JW/IdA1bkAKP6P0N4nc
	yXRF6SwdTQTxfCW5cKXPLOV7wq0Zs4VcMMtqQKQJ88mFX80kmKrRweBcyRpyBPqYRMlP
	/vkg==
X-Gm-Message-State: APjAAAX96xg4tcQxmqVOPDZBgRhXURpMHJCOKsO4sp66Ow3Vgdlti/IX
	P2CUVDkIHTlnwm0SQDJfYsRcbWtz0vc=
X-Google-Smtp-Source: APXvYqyQQMjMsoXT+Ld+nPcE+17Owddz34DjPljP+FO+7Busy5eZjzRD2X37tonsvRB9LX6cK9Noug==
X-Received: by 2002:a1c:540c:: with SMTP id i12mr3708211wmb.90.1570535523251; 
	Tue, 08 Oct 2019 04:52:03 -0700 (PDT)
Received: from flashheart.burtonini.com (35.106.2.81.in-addr.arpa.
	[81.2.106.35])
	by smtp.gmail.com with ESMTPSA id i5sm2633660wmd.21.2019.10.08.04.52.02
	for <openembedded-core@lists.openembedded.org>
	(version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
	Tue, 08 Oct 2019 04:52:02 -0700 (PDT)
From: Ross Burton <ross.burton@intel.com>
To: openembedded-core@lists.openembedded.org
Date: Tue,  8 Oct 2019 12:52:01 +0100
Message-Id: <20191008115201.17035-1-ross.burton@intel.com>
X-Mailer: git-send-email 2.20.1
MIME-Version: 1.0
Subject: [PATCH] oeqa/sdk: improve Meson test
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
X-List-Received-Date: Tue, 08 Oct 2019 11:52:02 -0000
Content-Transfer-Encoding: 8bit

Verify that the build inside the SDK is detected as a cross compilation.

Signed-off-by: Ross Burton <ross.burton@intel.com>
---
 meta/lib/oeqa/sdk/cases/buildepoxy.py | 4 +++-
 1 file changed, 3 insertions(+), 1 deletion(-)

diff --git a/meta/lib/oeqa/sdk/cases/buildepoxy.py b/meta/lib/oeqa/sdk/cases/buildepoxy.py
index f3d207c6ddd..4211955f8d3 100644
--- a/meta/lib/oeqa/sdk/cases/buildepoxy.py
+++ b/meta/lib/oeqa/sdk/cases/buildepoxy.py
@@ -32,7 +32,9 @@ class EpoxyTest(OESDKTestCase):
             self.assertTrue(os.path.isdir(dirs["source"]))
             os.makedirs(dirs["build"])
 
-            self._run("meson -Degl=no -Dglx=no -Dx11=false {build} {source}".format(**dirs))
+            log = self._run("meson -Degl=no -Dglx=no -Dx11=false {build} {source}".format(**dirs))
+            # Check that Meson thinks we're doing a cross build and not a native
+            self.assertIn("Build type: cross build", log)
             self._run("ninja -C {build} -v".format(**dirs))
             self._run("DESTDIR={install} ninja -C {build} -v install".format(**dirs))
 
-- 
2.20.1


