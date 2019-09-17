Return-Path: <ross.burton@intel.com>
Received: from mail-wm1-f51.google.com (mail-wm1-f51.google.com
	[209.85.128.51])
	by mail.openembedded.org (Postfix) with ESMTP id 897B07F081
	for <openembedded-core@lists.openembedded.org>;
	Tue, 17 Sep 2019 09:20:43 +0000 (UTC)
Received: by mail-wm1-f51.google.com with SMTP id b24so2199509wmj.5
	for <openembedded-core@lists.openembedded.org>;
	Tue, 17 Sep 2019 02:20:44 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=intel-com.20150623.gappssmtp.com; s=20150623;
	h=from:to:subject:date:message-id:mime-version
	:content-transfer-encoding;
	bh=lO4RnQBxHxt7WuIVqqvapZ5UaPB+VmioZee8xNqP/0A=;
	b=uY5148c/UkCCQc0EmJRYggokf5PXloKlx1OTNXNw1XHaQ9/Xo4Oi6AGPsq2ayouocE
	kMCsbHDbAyBSP6TWYi42kskTgmEYnmlNVY44hwLKEz7hNu/oxIJi5fMinoohafoXr+pr
	X3qNMQ9wCqcxhIFTbyeu6gJi02t2kBjPBbhb/hiazV/xeLvNfkT7NO833hRKcqVmye7X
	n9QOPTl3UH8/G8P87IRH5BS7GEqCVu2QMMvm1HA9ZpkCmgVOLEz8pxnDooT8wmJAXIxq
	geEJSaot6Ecmaal+MXkM5chC68LrnG52Qw6ynDTtVZVaOl/BJHO1HTYU1YLLTDXOsgZn
	KsQw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:subject:date:message-id:mime-version
	:content-transfer-encoding;
	bh=lO4RnQBxHxt7WuIVqqvapZ5UaPB+VmioZee8xNqP/0A=;
	b=EzwDlDKBDkyOHrS0qFXOIxyTA/KmtixSsiTwJWsmPwMG2Ma7cHhr+JLZktOh+8fbID
	VyxQDxl9TwbV8yFWGSdMsLGxqTBzMcs9i/hedMewGWlcRZew6CeJqO5Fu0HhXsu1JXxx
	lN9tAxLrKI9fgc9eM6dVYKnXw9PdDXCmuZ69JW68tmaaKMM1V73XRl0Xfl0QDrlplYog
	htAg6Lw4e7pSUg9fIJ5RbBw0oKisOfsXHsqwmltcsYtVadcdICDP4W1MwTXutIFKmS2M
	3ywNKDB06kCGh5L81mGcRtZzNWEpcDLoyjO721Tc+3hjcgd2hb/7E+TCIfKIJ6kqJhUW
	fB6g==
X-Gm-Message-State: APjAAAV3ASEz+FYeLauqkdhNSO+IFBRDXjeQCfsLKR55PbjAV6Ac9Ion
	nWfpoORdVSe6c8BISaGmQIpSZBtw118=
X-Google-Smtp-Source: APXvYqyAPOMA2B4Y5mAinG9bd+G6OQ87eEPntSWRRyipL9YxzTwcVzlQ9e33iKz9sU2cM+JYDAOkng==
X-Received: by 2002:a1c:7ec4:: with SMTP id z187mr2573045wmc.94.1568712043864; 
	Tue, 17 Sep 2019 02:20:43 -0700 (PDT)
Received: from flashheart.burtonini.com (35.106.2.81.in-addr.arpa.
	[81.2.106.35]) by smtp.gmail.com with ESMTPSA id
	r12sm1504626wrq.88.2019.09.17.02.20.42
	for <openembedded-core@lists.openembedded.org>
	(version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
	Tue, 17 Sep 2019 02:20:43 -0700 (PDT)
From: Ross Burton <ross.burton@intel.com>
To: openembedded-core@lists.openembedded.org
Date: Tue, 17 Sep 2019 10:20:41 +0100
Message-Id: <20190917092041.3774-1-ross.burton@intel.com>
X-Mailer: git-send-email 2.20.1
MIME-Version: 1.0
Subject: [PATCH] oeqa/selftest/reproducible: test ipkgs too
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
X-List-Received-Date: Tue, 17 Sep 2019 09:20:43 -0000
Content-Transfer-Encoding: 8bit

Now that opkg-build can build reproducible ipkgs, we can also add those to the
test case.

[ YOCTO #13513 ]

Signed-off-by: Ross Burton <ross.burton@intel.com>
---
 meta/lib/oeqa/selftest/cases/reproducible.py | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta/lib/oeqa/selftest/cases/reproducible.py b/meta/lib/oeqa/selftest/cases/reproducible.py
index eee09d3fb26..c235c139ed1 100644
--- a/meta/lib/oeqa/selftest/cases/reproducible.py
+++ b/meta/lib/oeqa/selftest/cases/reproducible.py
@@ -72,7 +72,7 @@ def compare_file(reference, test, diffutils_sysroot):
     return result
 
 class ReproducibleTests(OESelftestTestCase):
-    package_classes = ['deb']
+    package_classes = ['deb', 'ipk']
     images = ['core-image-minimal']
 
     def setUpLocal(self):
-- 
2.20.1


