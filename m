Return-Path: <ross.burton@intel.com>
Received: from mail-wr1-f66.google.com (mail-wr1-f66.google.com
	[209.85.221.66])
	by mail.openembedded.org (Postfix) with ESMTP id 48BDC6C44A
	for <openembedded-core@lists.openembedded.org>;
	Mon,  4 Nov 2019 12:27:17 +0000 (UTC)
Received: by mail-wr1-f66.google.com with SMTP id t1so10908940wrv.4
	for <openembedded-core@lists.openembedded.org>;
	Mon, 04 Nov 2019 04:27:18 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=intel-com.20150623.gappssmtp.com; s=20150623;
	h=from:to:subject:date:message-id:mime-version
	:content-transfer-encoding;
	bh=lvm+1NNVIqQ6lFSfxW5VzjR5nqAIA0H11crtaRapOgs=;
	b=a7sfFswr6pxl/MPwQuo4VtXu+cRyVTSIwpV6BggtrRexwLif/6RE6bsXue1nVhbpkq
	3mvOG+SyTO+WBBz8EVT8BNmZaV8RyZSpW/UqE+5l1oHOEkyo5uTS5TMkblPR/NneF2ZS
	XLJBzykAGqV5KdXQOLmZHXl/Fe8rxeVFlYQ01sGHgF18wN3eP7W0vPfxV1Lr90b/60pB
	THZ53mNGRZJUG8XSIIPd567dSJqgG9S1DjUGfEY5dcq0kw2qrHqA61eEkj7+qdLvZWdv
	3r5DFUf3tgi+RWVF/yqAWmoNtEbjO8NO1fHViAy8TTUOQ+GHqWha9B57Rez6hGi6p3+5
	nqog==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:subject:date:message-id:mime-version
	:content-transfer-encoding;
	bh=lvm+1NNVIqQ6lFSfxW5VzjR5nqAIA0H11crtaRapOgs=;
	b=TRRGtJvP0GierNHZCqVl5GRO6x1xntkpUI0ikMmg325YJtHUrjr8DOITvzJ1rTmw9x
	lUG0xxyrWZqyDXyj45NJyzwu4QElzmqzQxdQcfRCILyfXZinT4jB7klsTO+d15il0dz9
	X/pNhQjqJPE+Ck5Rh3Cl2mhe+v1bhiA4BPk8ssOx3fNFmdBeovMH2rksVsjd99BTIDtH
	C1XXkK1WyCdRq2RHCMbQc6mauz8HveJH7Du17/eD6xqDqW4W6tMpuYavi1WVILsim9iN
	q2+WorKhVy8UMu7GCctIrmt6bYGK3Df7Mo73bnotOkn9V+gAjVUIBhXVBqJKPINIllHQ
	sx6g==
X-Gm-Message-State: APjAAAWLDiLNh8JFkFiuBWurrhqGDWt+BKFDp44KRqBj/6+oNuIGqVmR
	P1uK8othV+Jwf8tAJ2LZRkMrU7zxPDc=
X-Google-Smtp-Source: APXvYqwOefM+oO2VzbSGKytTSSFgpIyV2Kf69a59CQt9Ahqyrp+TwkBFiNsW6A5ChUF5fDt8qdR5sQ==
X-Received: by 2002:a5d:63d2:: with SMTP id c18mr12562419wrw.365.1572870436456;
	Mon, 04 Nov 2019 04:27:16 -0800 (PST)
Received: from flashheart.burtonini.com (35.106.2.81.in-addr.arpa.
	[81.2.106.35])
	by smtp.gmail.com with ESMTPSA id l4sm882487wme.4.2019.11.04.04.27.15
	for <openembedded-core@lists.openembedded.org>
	(version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
	Mon, 04 Nov 2019 04:27:15 -0800 (PST)
From: Ross Burton <ross.burton@intel.com>
To: openembedded-core@lists.openembedded.org
Date: Mon,  4 Nov 2019 12:27:13 +0000
Message-Id: <20191104122713.23437-1-ross.burton@intel.com>
X-Mailer: git-send-email 2.20.1
MIME-Version: 1.0
Subject: [PATCH] patch: the CVE-2019-13638 fix also handles CVE-2018-20969
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
X-List-Received-Date: Mon, 04 Nov 2019 12:27:17 -0000
Content-Transfer-Encoding: 8bit

Signed-off-by: Ross Burton <ross.burton@intel.com>
---
 .../0001-Invoke-ed-directly-instead-of-using-the-shell.patch  | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/meta/recipes-devtools/patch/patch/0001-Invoke-ed-directly-instead-of-using-the-shell.patch b/meta/recipes-devtools/patch/patch/0001-Invoke-ed-directly-instead-of-using-the-shell.patch
index f60dfe879af..d13d419f51c 100644
--- a/meta/recipes-devtools/patch/patch/0001-Invoke-ed-directly-instead-of-using-the-shell.patch
+++ b/meta/recipes-devtools/patch/patch/0001-Invoke-ed-directly-instead-of-using-the-shell.patch
@@ -6,8 +6,8 @@ Subject: [PATCH] Invoke ed directly instead of using the shell
 * src/pch.c (do_ed_script): Invoke ed directly instead of using a shell
 command to avoid quoting vulnerabilities.
 
-CVE: CVE-2019-13638
-Upstream-Status: Backport[https://git.savannah.gnu.org/cgit/patch.git/patch/?id=3fcd042d26d70856e826a42b5f93dc4854d80bf0]
+CVE: CVE-2019-13638 CVE-2018-20969
+Upstream-Status: Backport [https://git.savannah.gnu.org/cgit/patch.git/patch/?id=3fcd042d26d70856e826a42b5f93dc4854d80bf0]
 Signed-off-by: Trevor Gamblin <trevor.gamblin@windriver.com>
 
 ---
-- 
2.20.1


