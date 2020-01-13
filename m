Return-Path: <akuster808@gmail.com>
Received: from mail-pg1-f180.google.com (mail-pg1-f180.google.com
	[209.85.215.180])
	by mail.openembedded.org (Postfix) with ESMTP id 0445F7FD25
	for <openembedded-core@openembedded.org>;
	Mon, 13 Jan 2020 15:30:59 +0000 (UTC)
Received: by mail-pg1-f180.google.com with SMTP id x7so4854385pgl.11
	for <openembedded-core@openembedded.org>;
	Mon, 13 Jan 2020 07:31:01 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=from:to:cc:subject:date:message-id:in-reply-to:references;
	bh=NSt20zg8g3JXLLNErnQ8uhgUYZDyEK/VWUKdsnXFH2I=;
	b=VALmI7p58j0C8vR28AStYUEWRoNzOhzcYkQnrcAriirfkpbP6QdBqbTzBkQ0j48QEe
	ti23x9bm6qL3r4+31pePh0dDh6plHVKBWPFgIw3uy/QAdmPcPRKFkBm2QShhdJNSQbBc
	GOdT4n93DMAHOvqlNMerkC5x3QOzu5A3QDFRH0/ftjYH6YSdBzLx0F51sLgFxdIddUsV
	HOT2hVhJidPm6tSgbfc2BpNqPPOOtlySCAlIMeprXPcTJRbXqcj/Hcps6UGwMd2QHURo
	gIA4hcHURkLORPb+XMDoM1BEPprwYZ2YuM72hmZtsQGfnM72P2/YYPUig8Vi1smhaH1c
	HVrw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
	:references;
	bh=NSt20zg8g3JXLLNErnQ8uhgUYZDyEK/VWUKdsnXFH2I=;
	b=KFK7MNl3aCqZ8c9czB0XgYTr7rQrgYNiIKPRgI6yvELURnIU/7NsRfUYuKuL4KuQ69
	KDoP3pSurDL89yFq/rmaAxC6GUhOyGbs88VYHOEICVfno8TgfsV5WVLpy/5iyT3D/1xM
	GeIp6MzVX+Gu+zmY8CXYKBJHjZd+Wv7BI7SOqhwtA897HpNrRJ7O6ltxaoNEasTxQAM4
	N1sddj5AIUNbzqIGjCsSFSVeoPX1a+5SxkgUNw+/s9NHvH+hd6Y+Es05RJ8d9qx9PZ9q
	ZqPxQB5gvrgJyN//Zye9pUxqQjkpaYC/PLxyG0noEayvruVA7kON/cv2UN13thqhpmsD
	vEwA==
X-Gm-Message-State: APjAAAVUK72LoNLIqz13j7Dkh6i4IDWJeYC91OgiPvoZEvKjUfHCqwM7
	MYHoKbI1cv+jGQZM5TMDcIfl/y+d
X-Google-Smtp-Source: APXvYqwUtahyRuWzLFfRa7QWjdA4gPgyIuNkZVdxUE2RXdgMqXF00/p6Y38lBPHj3fIMT4n1mJdC5w==
X-Received: by 2002:a63:4e06:: with SMTP id c6mr21019839pgb.187.1578929460974; 
	Mon, 13 Jan 2020 07:31:00 -0800 (PST)
Received: from akuster-ThinkPad-T460s.hsd1.ca.comcast.net
	([2601:202:4180:a5c0:2dcb:8dcc:2050:e41d])
	by smtp.gmail.com with ESMTPSA id
	q8sm14167646pgg.92.2020.01.13.07.31.00
	(version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
	Mon, 13 Jan 2020 07:31:00 -0800 (PST)
From: Armin Kuster <akuster808@gmail.com>
To: openembedded-core@openembedded.org
Date: Mon, 13 Jan 2020 07:30:23 -0800
Message-Id: <72c22b8791707480c380f49305c6d394578b2a4b.1578929268.git.akuster808@gmail.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <cover.1578929268.git.akuster808@gmail.com>
References: <cover.1578929268.git.akuster808@gmail.com>
Cc: akuster808@gnail.com
Subject: [warrior 24/28] cve-check: Switch to NVD CVE JSON feed version 1.1
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
X-List-Received-Date: Mon, 13 Jan 2020 15:31:00 -0000

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


