Return-Path: <akuster808@gmail.com>
Received: from mail-pf1-f173.google.com (mail-pf1-f173.google.com
	[209.85.210.173])
	by mail.openembedded.org (Postfix) with ESMTP id 8CBBD7F9C6
	for <openembedded-core@openembedded.org>;
	Thu, 16 Jan 2020 15:21:10 +0000 (UTC)
Received: by mail-pf1-f173.google.com with SMTP id q10so10359487pfs.6
	for <openembedded-core@openembedded.org>;
	Thu, 16 Jan 2020 07:21:12 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=from:to:subject:date:message-id:in-reply-to:references;
	bh=NSt20zg8g3JXLLNErnQ8uhgUYZDyEK/VWUKdsnXFH2I=;
	b=ZgDfMDYBJDLJCLsHcPqThn3Sv0WmAZa8BvtxBjMozONleQ4d0zZG/nsZZcOX5voS+R
	75b/oKEMbzt7kpgtM6YMyB/YhNWtJh//1BUDWY1B8nXpg9wLR70ivn/hNUJOnumh4oTz
	XpvQf5h0U0jwnqaTN5EExtZSKARErPu3q0VJWfsope5SF4HEUtSti1NEY+1ayVG72Edd
	ju59T5d1lXAa69LSwi7XFylWD0Z9jvnoKoAPvh1qQrqELRP6w/IwfTF0b6dzqM6GCutV
	aGum0U3j3Pf+ZOt+M6XaYQBm+M+r/jDL42GZ9J328fxLYFYKvKmtwFm9emMbEqvnV4Aa
	3C3A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
	:references;
	bh=NSt20zg8g3JXLLNErnQ8uhgUYZDyEK/VWUKdsnXFH2I=;
	b=buDde4mmaAhy3wceLPrfmLUqIWw7x8+rcaCn7lhefh+WLC+xlg81oBTryUbNwO5chW
	PmVG6w0TW0Gfbs1THTqssozYInEDpETMkcK8kiKdPVBqauBInX3JGpLYScnZ4kNFZ8Q8
	2gZE7c0DizyvbfAqiBFGt8AfRUcPhl0jiPr7N0f7UNH9TDkyijoZGJ/P9CJ+dq7ID5ev
	B0yRSl4cYGxiU74gnjcc3+c0L11u4SfP5GV8ERb2N7VS9TGLVYPoqfQadEnjoEBQOv43
	I0JHq6v4Clme7pKmgCPxqWzw7c1YeGmzkbTNya9rSqHV127SbxKaiHZVMWqaY0qq1zzq
	S9Bw==
X-Gm-Message-State: APjAAAWxvhAEUFl7qI+TCnMD9SymPB6SGWY91tZCQwn6oBuMRjNNNe4v
	KK1sMBL9NxEuxukyWSzCjyEYPBHs
X-Google-Smtp-Source: APXvYqw83fRas1/VgthwwXCrpLbdgMCG9HlLb4qy5UJy657x40JQSODJR8WYkWjdWun/KxE3xgeZ6A==
X-Received: by 2002:a63:710:: with SMTP id 16mr39481579pgh.58.1579188071467;
	Thu, 16 Jan 2020 07:21:11 -0800 (PST)
Received: from akuster-ThinkPad-T460s.mvista.com
	([2601:202:4180:a5c0:e8a7:159f:54e9:3f07])
	by smtp.gmail.com with ESMTPSA id
	n26sm26282377pgd.46.2020.01.16.07.21.10
	for <openembedded-core@openembedded.org>
	(version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
	Thu, 16 Jan 2020 07:21:11 -0800 (PST)
From: Armin Kuster <akuster808@gmail.com>
To: openembedded-core@openembedded.org
Date: Thu, 16 Jan 2020 07:20:37 -0800
Message-Id: <72c22b8791707480c380f49305c6d394578b2a4b.1579187957.git.akuster808@gmail.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <cover.1579187957.git.akuster808@gmail.com>
References: <cover.1579187957.git.akuster808@gmail.com>
Subject: [warrior 28/32] cve-check: Switch to NVD CVE JSON feed version 1.1
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
X-List-Received-Date: Thu, 16 Jan 2020 15:21:11 -0000

From: Niko Mauno <niko.mauno@iki.fi>

Switch to recently released version 1.1 of NVD CVE JSON feed, as in
https://nvd.nist.gov/General/News/JSON-1-1-Vulnerability-Feed-Release
it is mentioned that

  Due to changes required to support CVSS v3.1 scoring, the JSON
  vulnerability feeds must be modified. This will require the consumers
  of this data to update their internal processes. We will be providing
  the JSON 1.1 schema on the data feeds page and the information below
  to prepare for this transition.
  ...
  The JSON 1.1 data feeds will be available on September 9th, 2019. At
  that time the current JSON 1.0 data feeds will no longer available.

This change was tested briefly by issuing 'bitbake core-image-minimal'
with 'cve-check.bbclass' inherited via local.conf, and then comparing
the content between the resulting two
'DEPLOY_DIR_IMAGE/core-image-minimal-qemux86.cve' files, which did not
seem to contain any other change, except total of 167 entries like

  CVSS v3 BASE SCORE: 0.0

were replaced with similar 'CVSS v3 BASE SCORE:' entries which had
scores that were greater than '0.0' (up to '9.8').

(From OE-Core rev: cc20e4d8ff2f3aa52a2658404af9a0ff358cc323)

Signed-off-by: Niko Mauno <niko.mauno@iki.fi>
Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
Signed-off-by: Anuj Mittal <anuj.mittal@intel.com>
Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
(cherry picked from commit c92b8804d6e59b2707332859957f0e6a46db0a73)
Signed-off-by: Armin Kuster <akuster808@gmail.com>
---
 meta/classes/cve-check.bbclass                 | 2 +-
 meta/recipes-core/meta/cve-update-db-native.bb | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/meta/classes/cve-check.bbclass b/meta/classes/cve-check.bbclass
index 19ed5548b3..01b3637469 100644
--- a/meta/classes/cve-check.bbclass
+++ b/meta/classes/cve-check.bbclass
@@ -26,7 +26,7 @@ CVE_PRODUCT ??= "${BPN}"
 CVE_VERSION ??= "${PV}"
 
 CVE_CHECK_DB_DIR ?= "${DL_DIR}/CVE_CHECK"
-CVE_CHECK_DB_FILE ?= "${CVE_CHECK_DB_DIR}/nvdcve_1.0.db"
+CVE_CHECK_DB_FILE ?= "${CVE_CHECK_DB_DIR}/nvdcve_1.1.db"
 
 CVE_CHECK_LOG ?= "${T}/cve.log"
 CVE_CHECK_TMP_FILE ?= "${TMPDIR}/cve_check"
diff --git a/meta/recipes-core/meta/cve-update-db-native.bb b/meta/recipes-core/meta/cve-update-db-native.bb
index db1d69a28e..575254af40 100644
--- a/meta/recipes-core/meta/cve-update-db-native.bb
+++ b/meta/recipes-core/meta/cve-update-db-native.bb
@@ -27,7 +27,7 @@ python do_populate_cve_db() {
 
     bb.utils.export_proxies(d)
 
-    BASE_URL = "https://nvd.nist.gov/feeds/json/cve/1.0/nvdcve-1.0-"
+    BASE_URL = "https://nvd.nist.gov/feeds/json/cve/1.1/nvdcve-1.1-"
     YEAR_START = 2002
 
     db_file = d.getVar("CVE_CHECK_DB_FILE")
-- 
2.17.1


