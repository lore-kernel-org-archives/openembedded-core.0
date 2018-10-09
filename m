Return-Path: <ross.burton@intel.com>
Received: from mail-wm1-f68.google.com (mail-wm1-f68.google.com
	[209.85.128.68])
	by mail.openembedded.org (Postfix) with ESMTP id 8F2E471C07
	for <openembedded-core@lists.openembedded.org>;
	Tue,  9 Oct 2018 11:00:22 +0000 (UTC)
Received: by mail-wm1-f68.google.com with SMTP id 206-v6so1391608wmb.5
	for <openembedded-core@lists.openembedded.org>;
	Tue, 09 Oct 2018 04:00:24 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=intel-com.20150623.gappssmtp.com; s=20150623;
	h=from:to:subject:date:message-id;
	bh=WvnBc8fMkstmEY65eqGwn4XckhqdaKpuy6y0SBfLOos=;
	b=My7RxDh4Tr7u60+f0G+50mwHLxchrk2cYDlUXVJk5pdyiI8m14PjI6hPKpb0pbpaa/
	+CUSDRE9N2xkEr2i6aHPkpro47MBZHBVCGbWEB3YzKJjYFUN4OxSAyz0VUo3D230c9Ix
	VBTHtpZCzTMmaMVROeRykxFLV2DOqKOw+n9ZD62ARUL1NOBDyOBXMwKS4jF2rc98/sXz
	KecUGNQIK+xS+65sb+mSuwsvwA/WsDV/aNAMpla92ouNsi61WN0L14v0XtPEKuCY4pXq
	yZbdqhi0eQuLA1hbqTl6xDcGlhUHngSRI+60iSPZ/VPV1RvA0mEcSnWund5yaZPOiX8y
	R5Lw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:subject:date:message-id;
	bh=WvnBc8fMkstmEY65eqGwn4XckhqdaKpuy6y0SBfLOos=;
	b=NBg7fJs2jhsvfjCHgfUjQ68dKqA/eCNwWLKSm7DaH7MW9vyNogrIsVkgxSUgrAguxM
	RbF5Ck21Xh7C2NkTAFI5DnjDcRf9KYXSGj+7wEWV8fYIXG6u6frTXkMSDUWHV2ZcgBvs
	xQJUuzczRyBhHo4DTk6UNhv+84ng3Ow62ZR7DqkWjEUbIWcfTogXzVT8GG5ZjpJ+unIh
	EFtOPgb7UUjdCZiXCc4+mp9iPpn/YXdh41TwdBSlrr9oZm9XE5HFGBdgRjwfQsNHI8bv
	nOUcm6lw+Ldqah9k/u2sw5eB3r9S8PEGteKnkKzCjzNF/Hf608BvhCx0l+qdFcu6lHfg
	o2ZQ==
X-Gm-Message-State: ABuFfoheKJc1pCgT579aZejSJvTx7M3Gl51gqy/bcRQxHPdDdcxLihY9
	LxPAX8zggTC5zrpLHeyUyB84su22l6s=
X-Google-Smtp-Source: ACcGV62nJSiccstWs9RqGa1UKHb1thi+nO0eBSB5QyThu+ylJq+qZT+7nxW1ckNe0XB+tHf5gN8rVQ==
X-Received: by 2002:a1c:3ec3:: with SMTP id
	l186-v6mr1487817wma.84.1539082822963; 
	Tue, 09 Oct 2018 04:00:22 -0700 (PDT)
Received: from flashheart.burtonini.com (35.106.2.81.in-addr.arpa.
	[81.2.106.35]) by smtp.gmail.com with ESMTPSA id
	c14-v6sm13038233wmh.44.2018.10.09.04.00.21
	for <openembedded-core@lists.openembedded.org>
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Tue, 09 Oct 2018 04:00:22 -0700 (PDT)
From: Ross Burton <ross.burton@intel.com>
To: openembedded-core@lists.openembedded.org
Date: Tue,  9 Oct 2018 12:00:19 +0100
Message-Id: <20181009110019.16171-1-ross.burton@intel.com>
X-Mailer: git-send-email 2.11.0
Subject: [PATCH] glib-2.0: add missing locale dependencies to PN-ptest
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
X-List-Received-Date: Tue, 09 Oct 2018 11:00:23 -0000

The test suite skips several tests if the required locales are not found, so add
them as dependencies of glib-2.0-ptest.

Signed-off-by: Ross Burton <ross.burton@intel.com>
---
 meta/recipes-core/glib-2.0/glib.inc | 13 +++++++++++++
 1 file changed, 13 insertions(+)

diff --git a/meta/recipes-core/glib-2.0/glib.inc b/meta/recipes-core/glib-2.0/glib.inc
index ad4f2aebd71..f78aa9bfe6d 100644
--- a/meta/recipes-core/glib-2.0/glib.inc
+++ b/meta/recipes-core/glib-2.0/glib.inc
@@ -152,6 +152,19 @@ RDEPENDS_${PN}-ptest_append_libc-glibc = "\
             glibc-gconv-iso8859-15 \
             glibc-charmap-invariant \
             glibc-localedata-translit-cjk-variants \
+            locale-base-tr-tr \
+            locale-base-lt-lt \
+            locale-base-ja-jp.euc-jp \
+            locale-base-fa-ir \
+            locale-base-ru-ru \
+            locale-base-de-de \
+            locale-base-pl-pl \
+            locale-base-hr-hr \
+            locale-base-el-gr \
+            locale-base-fr-fr \
+            locale-base-fr-fr \
+            locale-base-es-es \
+            locale-base-en-gb \
            "
 
 INSANE_SKIP_${PN}-ptest += "libdir"
-- 
2.11.0


