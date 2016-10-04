Return-Path: <ross.burton@intel.com>
Received: from mail-wm0-f53.google.com (mail-wm0-f53.google.com [74.125.82.53])
	by mail.openembedded.org (Postfix) with ESMTP id 86D76719FA
	for <openembedded-core@lists.openembedded.org>;
	Tue,  4 Oct 2016 09:41:26 +0000 (UTC)
Received: by mail-wm0-f53.google.com with SMTP id 197so32900440wmk.1
	for <openembedded-core@lists.openembedded.org>;
	Tue, 04 Oct 2016 02:41:28 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=intel-com.20150623.gappssmtp.com; s=20150623;
	h=from:to:subject:date:message-id;
	bh=u+uzoRn+Gvv8JqB8s5Ac+W02Ci+x1Q44PZFN9iUbTf8=;
	b=z+JCHnT8qYu2/4tN47LxPtARwAhZ8QZKUAK+7I73OGahQrGTh2traibkt+1TfRNP9n
	EEj4lIdmQONW+26bCAyywRsg+iFvBigAy2A8Wjq9lPLtoHM6bV6JWclWDidjXn1N++AQ
	XYTAZTQlLsZZySm5PUWoM0ZfhlNBItZzLMYihJOpoOoROKbJzmJ/HDYH7XAmSDVeUyIu
	kuW2cmoyLBBmps/1YqWAXSGUjx+dk/r9UpDQACWGRc9oeijhCphlOdfNsQ6iJ1DB55tA
	fIQuKVfJEy9oOtyuUMnElc7ng8r8FDz4nEN30KUDScHu8iasUbO89Bs5HBX4rf3twzWj
	3Krg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:from:to:subject:date:message-id;
	bh=u+uzoRn+Gvv8JqB8s5Ac+W02Ci+x1Q44PZFN9iUbTf8=;
	b=VTb5pL4tvpKbEM01Wi2/HiBC/hvjHcNz+QweczSi731yDuEuAwwI9fr0Mh9ODEHM6c
	LIjuP5+v4gN3R2lDQI+E7xlUFiofusaAW/ykI5J7NEjTBGMxUUbgQS9hDRfiG3Zgorq8
	L3zvo7uXqq+/8zUkk2rBFmCz7dWLCpyBJfR9t4+jk3yUQkLOCQYtMxyBQ3W2XT+ZcGzl
	9wGXX8G983iKqp26Q60F52ETXN+5bgkN64Pl78DJzb/CjG63umBeNqh76NmGwvlS1rK0
	kMttz9oHbr5QKJ3U+RKA+SyNqq+X6R3Tmuwi039EmT7QSFQYopo65ckX3TTmmms1y6m9
	V1Hw==
X-Gm-Message-State: AA6/9RnrXnGbdP8Rx59GO2HRoppIkMsvXW3JO5Atf2xCiITfRswYRYlef3A+7d/Tk8uBsF0F
X-Received: by 10.28.128.86 with SMTP id b83mr14659433wmd.40.1475574087866;
	Tue, 04 Oct 2016 02:41:27 -0700 (PDT)
Received: from flashheart.burtonini.com (home.burtonini.com. [81.2.106.35])
	by smtp.gmail.com with ESMTPSA id
	w138sm24355830wmd.1.2016.10.04.02.41.27
	for <openembedded-core@lists.openembedded.org>
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
	Tue, 04 Oct 2016 02:41:27 -0700 (PDT)
From: Ross Burton <ross.burton@intel.com>
To: openembedded-core@lists.openembedded.org
Date: Tue,  4 Oct 2016 10:41:25 +0100
Message-Id: <1475574085-4340-1-git-send-email-ross.burton@intel.com>
X-Mailer: git-send-email 2.8.1
Subject: [PATCH] Revert "attr: Added ncurses to depends"
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
X-List-Received-Date: Tue, 04 Oct 2016 09:41:28 -0000

There doesn't appear to be any reason to keep this dependency on ncurses in
attr, so remove it.

This reverts commit 7c474dc3d65bb3f71b375d36d81959cb405be80a.

Signed-off-by: Ross Burton <ross.burton@intel.com>
---
 meta/recipes-support/attr/attr.inc | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta/recipes-support/attr/attr.inc b/meta/recipes-support/attr/attr.inc
index a1b0829..e8b5d05 100644
--- a/meta/recipes-support/attr/attr.inc
+++ b/meta/recipes-support/attr/attr.inc
@@ -2,7 +2,7 @@ SUMMARY = "Utilities for manipulating filesystem extended attributes"
 HOMEPAGE = "http://savannah.nongnu.org/projects/attr/"
 SECTION = "libs"
 
-DEPENDS = "ncurses virtual/libintl"
+DEPENDS = "virtual/libintl"
 
 LICENSE = "LGPLv2.1+ & GPLv2+"
 LICENSE_${PN} = "GPLv2+"
-- 
2.8.1


