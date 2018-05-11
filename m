Return-Path: <ross.burton@intel.com>
Received: from mail-wm0-f66.google.com (mail-wm0-f66.google.com [74.125.82.66])
	by mail.openembedded.org (Postfix) with ESMTP id 9905E7712D
	for <openembedded-core@lists.openembedded.org>;
	Fri, 11 May 2018 16:06:15 +0000 (UTC)
Received: by mail-wm0-f66.google.com with SMTP id a137-v6so3434614wme.1
	for <openembedded-core@lists.openembedded.org>;
	Fri, 11 May 2018 09:06:16 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=intel-com.20150623.gappssmtp.com; s=20150623;
	h=from:to:subject:date:message-id;
	bh=Lnq9E0LgbrDAaw1OEUogRSKC8puefYeVjXxmvnfm20I=;
	b=q66M2LlhII3tGQAT0RpZeOYPzqzRJxXZzlmAyi4YEhIfdz1Rk/9Om32PitE5ynjiP+
	2nJg1lhaSlGA8tftQCh97jMvaE4cXjcdLcJaQEFfs3WLbLa/1fyFHDQKUJnVVNMU7MkI
	Frmr1nskTYgtn5h+bzgIBQRQKFAcfRcuW1MZVLHyasKCor9c8q8a2afr6UFkb25VRr0V
	dyn5WZyZ1n7qyzwjPrtygs+qpQQe3oFcYVfglr3Xla0xCzizeLDpxOnNqjjO9gz8VE9b
	MFazc4olVTKfXK7/AQf3lMmS3DtCrT86fsx57oWtPhYiU4RFwF0APzGVPD8KPEJyezJG
	AONg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:subject:date:message-id;
	bh=Lnq9E0LgbrDAaw1OEUogRSKC8puefYeVjXxmvnfm20I=;
	b=bMSOvK4C8XupcRKOKilf+/epeCd5d7ZRaqGEecmuoSEo603SMuaGtrHkTPDJvzAxlY
	hNCsoSGkl5Xqy3Tyf11AFJ9z5c61Wq/UuSpuDBdLXysX4TBSCQMZbJaIyvvsDyB263z8
	ZV8RM+Lt8Op9lboPXpaihrRmfMZ/Ozuo3roAIQoNkUNUYNk4FtgEVhNqECKq3bAn6A+X
	T6xGUG/joVyU7TXfnXl8JKRCp03UKC2kDydWMnq4biQoNjl+YYHxBQT4X6TGWBKx6Qqd
	bkzn87u8XdHMyBri7w0h5ITwA4KG5G79h30szuJLEQdAQ4qlcPmqK/Bq7Fr8ptjbzIVo
	HV8A==
X-Gm-Message-State: ALKqPweUg/YkJU1a1oYN5mH7wBAin6zuOWY4OmwTPhyW/mui1E+pQF+g
	w/cQeWufh65XGFvsHFh7wFFhltiB
X-Google-Smtp-Source: AB8JxZoVthRvpr+5g4ReyMPrVBMPWhUOEHCaxQEDqmQ6E0i7+qo86G+6nhDRMu+VC9LkUCgGEBSEbw==
X-Received: by 2002:a1c:c588:: with SMTP id
	v130-v6mr2138835wmf.135.1526054775719; 
	Fri, 11 May 2018 09:06:15 -0700 (PDT)
Received: from flashheart.burtonini.com (35.106.2.81.in-addr.arpa.
	[81.2.106.35]) by smtp.gmail.com with ESMTPSA id
	v192-v6sm1603993wme.45.2018.05.11.09.06.14
	for <openembedded-core@lists.openembedded.org>
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Fri, 11 May 2018 09:06:14 -0700 (PDT)
From: Ross Burton <ross.burton@intel.com>
To: openembedded-core@lists.openembedded.org
Date: Fri, 11 May 2018 17:06:12 +0100
Message-Id: <20180511160613.10926-1-ross.burton@intel.com>
X-Mailer: git-send-email 2.11.0
Subject: [PATCH 1/2] swig: fix patch headers
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
X-List-Received-Date: Fri, 11 May 2018 16:06:16 -0000

Signed-off-by: Ross Burton <ross.burton@intel.com>
---
 ...ig-3.0.12-Coverity-fix-issue-reported-for-SWIG_Python_FixMetho.patch | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta/recipes-devtools/swig/swig/swig-3.0.12-Coverity-fix-issue-reported-for-SWIG_Python_FixMetho.patch b/meta/recipes-devtools/swig/swig/swig-3.0.12-Coverity-fix-issue-reported-for-SWIG_Python_FixMetho.patch
index eab50fc7ef7..10e4afd1ba0 100644
--- a/meta/recipes-devtools/swig/swig/swig-3.0.12-Coverity-fix-issue-reported-for-SWIG_Python_FixMetho.patch
+++ b/meta/recipes-devtools/swig/swig/swig-3.0.12-Coverity-fix-issue-reported-for-SWIG_Python_FixMetho.patch
@@ -13,7 +13,7 @@ The issue is only reported for the "swig_ptr: " line, but for
 consistency we replace both occurrences of strncpy with memcpy.
 ---
 Signed-off-by: Khem Raj <raj.khem@gmail.com>
-Status: Backport [https://github.com/swig/swig/pull/898]
+Upstream-Status: Backport [https://github.com/swig/swig/pull/898]
 
  Lib/python/pyinit.swg | 4 ++--
  1 file changed, 2 insertions(+), 2 deletions(-)
-- 
2.11.0


