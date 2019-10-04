Return-Path: <ross.burton@intel.com>
Received: from mail-wm1-f42.google.com (mail-wm1-f42.google.com
	[209.85.128.42])
	by mail.openembedded.org (Postfix) with ESMTP id B36067F261
	for <openembedded-core@lists.openembedded.org>;
	Fri,  4 Oct 2019 00:22:34 +0000 (UTC)
Received: by mail-wm1-f42.google.com with SMTP id f22so3938363wmc.2
	for <openembedded-core@lists.openembedded.org>;
	Thu, 03 Oct 2019 17:22:36 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=intel-com.20150623.gappssmtp.com; s=20150623;
	h=from:to:subject:date:message-id:mime-version
	:content-transfer-encoding;
	bh=1aH/loQhQ04JlZh069qL6Z19hYuo0wJDy+sH6+vzNMI=;
	b=UVoX9fmjS65qSY07ziYYfZPv4AAhbn7nfCK601XPbGh93XB2smhPbHNEu25ZshtAF9
	ilG2ySFsJjUHdewaBb1mcOQaYfZ5ED9LN3E/GAJQ3J7q00zPi+qr0nB2Lb0xTfmXG4pO
	BG+Vhetr57Ahdor+unDh0BeNwlo8woYAgAwlZbmBwvG9KKkGd78CENrINFa5VvnKmyoJ
	/gpqUiCjOed4kkoNLplE3TXfa8N6A08AIOXgl52OHfGF7Tc8KPTmG6c/08j3ewbwcJQl
	tI4VYfu+dLh+3yqQoQTQrSEyKIvBjlBflacoFIPi9nERG9WhdJ2qxetkb9Nq01QAkVdW
	xeIg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:subject:date:message-id:mime-version
	:content-transfer-encoding;
	bh=1aH/loQhQ04JlZh069qL6Z19hYuo0wJDy+sH6+vzNMI=;
	b=s/lvMNuCBUCrxivpOXaq8m4ytDQswetSoPslsblpp17bW3mfzTH0IepuOMJTt1Ta9/
	vunWodMHFFhV6QKVMWafW+aPpiVTZOjYYb0R9pKKCAI2RjKGUvL8Y2auLNI2ndGcq1t5
	/KYp6wgfNElPDDwIkRUTNOuuAp1nJ/f11bNJHp376IMU1PSerTRDjpPcR+nyrkCJhqxm
	4R+gWh3CRqihAXbWQqn15vTGOChyNBtduxiB2CDkQhWUlb/DwHNkSPbvDYynGOKA1jJs
	4SSMa6aVG1H2GQ6971vrJGqhMl/ZLLiAdkNsnxGj49xriz9WWbGOBL0AUfKQCmh3aaGR
	l6Zw==
X-Gm-Message-State: APjAAAVCsHWZmOnP74Zik1pe0+56OZBCyBZeS6MKHrrWejsogSeV1hLQ
	eOma1edfl6ZHwfQqLRmbsyXfB1OsdIM=
X-Google-Smtp-Source: APXvYqxDHFL/v44Rcl3gPlKeGc3SV7Slz7DfOMNTkuHuz3Dynt9JvBy4HNPTmJpUtc20ppEyotiiaA==
X-Received: by 2002:a1c:3182:: with SMTP id x124mr9272513wmx.168.1570148555274;
	Thu, 03 Oct 2019 17:22:35 -0700 (PDT)
Received: from flashheart.burtonini.com (35.106.2.81.in-addr.arpa.
	[81.2.106.35])
	by smtp.gmail.com with ESMTPSA id e6sm6038167wrp.91.2019.10.03.17.22.34
	for <openembedded-core@lists.openembedded.org>
	(version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
	Thu, 03 Oct 2019 17:22:34 -0700 (PDT)
From: Ross Burton <ross.burton@intel.com>
To: openembedded-core@lists.openembedded.org
Date: Fri,  4 Oct 2019 01:22:33 +0100
Message-Id: <20191004002233.2223-1-ross.burton@intel.com>
X-Mailer: git-send-email 2.20.1
MIME-Version: 1.0
Subject: [PATCH] meson: update patch status
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
X-List-Received-Date: Fri, 04 Oct 2019 00:22:35 -0000
Content-Transfer-Encoding: 8bit

Signed-off-by: Ross Burton <ross.burton@intel.com>
---
 ...1-environment.py-detect-windows-also-if-the-system-str.patch | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta/recipes-devtools/meson/meson/0001-environment.py-detect-windows-also-if-the-system-str.patch b/meta/recipes-devtools/meson/meson/0001-environment.py-detect-windows-also-if-the-system-str.patch
index 37b5356d77a..2faeda2e711 100644
--- a/meta/recipes-devtools/meson/meson/0001-environment.py-detect-windows-also-if-the-system-str.patch
+++ b/meta/recipes-devtools/meson/meson/0001-environment.py-detect-windows-also-if-the-system-str.patch
@@ -4,7 +4,7 @@ Date: Mon, 25 Mar 2019 17:17:06 +0100
 Subject: [PATCH] environment.py: detect windows also if the system string
  contains 'mingw'
 
-Upstream-Status: Pending
+Upstream-Status: Backport [fe645a0a9e2da230d2c500af1f5b2db5da1e364d]
 Signed-off-by: Alexander Kanavin <alex.kanavin@gmail.com>
 
 ---
-- 
2.20.1


