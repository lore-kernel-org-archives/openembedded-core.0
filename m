Return-Path: <akuster808@gmail.com>
Received: from mail-pf1-f173.google.com (mail-pf1-f173.google.com
	[209.85.210.173])
	by mail.openembedded.org (Postfix) with ESMTP id 0CC7E7F9DE
	for <openembedded-core@openembedded.org>;
	Thu, 16 Jan 2020 15:21:04 +0000 (UTC)
Received: by mail-pf1-f173.google.com with SMTP id q10so10359378pfs.6
	for <openembedded-core@openembedded.org>;
	Thu, 16 Jan 2020 07:21:06 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=from:to:subject:date:message-id:in-reply-to:references;
	bh=3wqyJYpps9i428cwTH7uDQeIR4/7/mW+uYY3ssNFb4o=;
	b=MnQ7wzZAWhray2gOwUrFX7su8jX2eZ1h64Tke4Nef1YDZyiHn+IVcCNW3N9q8fVT6T
	00K6ZeFXnUfdmsO2K5yKEL+Kfxl2LsIJmkGL5SI/U4KflAdR+GGu2qvDXcQvn29MM+lZ
	A97Fr4umFnTpMla7qHRel48siYUOlDdrGO68lGHR/0vcrVlnkSlcGTvyrl8Fo0oHG0Na
	fHmeFmzZQDONG6DZOcNRG+phuEOuQFYMRFO8DqhC53A84abbqoodhRbopGGEV6yUxCan
	pmMeLwEDaB++gJ9g4dYE8nw4unTusEXirTPxQQmbX60zKmmE+ySvBdner6fO9NqSK7V0
	C1rA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
	:references;
	bh=3wqyJYpps9i428cwTH7uDQeIR4/7/mW+uYY3ssNFb4o=;
	b=lrN+2ty/PeRe/VQu7SrLCctagN/ipPu1kO3mcTxAgvHCj3fEiW/jrgciesVHQWh40j
	7R6/63ftysUnaI/v3fblw5tgTISVMclQ//BaMe8w1uZKr1pfdwvBNSUREKSaq67mNO3R
	Hyud7/qR2js2UBlp9dQTKHqI8EXBnvDx9LxDr0RVY3Q60vrYoClTUZGyMidTA1AhP7WY
	N/S2kjtX4frpRpdMxHlwuNVjvuoWdJubWi/hz6ps4aTJ8FjdOzcNMLGnv+a+wpT5zxb+
	sU+Fa+/7epRg9Mz087UJUaP6tRhs0JjAUaqAhTaz5P9J42LrXNmXQ7LbqJTKCFGowDDA
	3U0g==
X-Gm-Message-State: APjAAAVD6xxmN72dVkI/25YPX4h4JtGAfhSD8OhpJh292l5Qq0G7VXJ+
	Ztjp/mCfBYyZimY40OlhOKPJrlPp
X-Google-Smtp-Source: APXvYqynZh1et+CuINrjnjmpzlsDZmpLjIksV3tYZu2VdP5KGCeeNarWlc0oJ0MrEIkblp2S6mFxbQ==
X-Received: by 2002:a65:4d0b:: with SMTP id i11mr41589575pgt.340.1579188065934;
	Thu, 16 Jan 2020 07:21:05 -0800 (PST)
Received: from akuster-ThinkPad-T460s.mvista.com
	([2601:202:4180:a5c0:e8a7:159f:54e9:3f07])
	by smtp.gmail.com with ESMTPSA id
	n26sm26282377pgd.46.2020.01.16.07.21.05
	for <openembedded-core@openembedded.org>
	(version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
	Thu, 16 Jan 2020 07:21:05 -0800 (PST)
From: Armin Kuster <akuster808@gmail.com>
To: openembedded-core@openembedded.org
Date: Thu, 16 Jan 2020 07:20:31 -0800
Message-Id: <f774665ee4dcdc5a1fe1f51384d82fb8e1b219e1.1579187957.git.akuster808@gmail.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <cover.1579187957.git.akuster808@gmail.com>
References: <cover.1579187957.git.akuster808@gmail.com>
Subject: [warrior 22/32] cve-update-db-native: don't hardcode the database name
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
X-List-Received-Date: Thu, 16 Jan 2020 15:21:05 -0000

From: Ross Burton <ross.burton@intel.com>

Don't hardcode the database filename, there's a variable for this in
cve-check.bbclass.

(From OE-Core rev: 0d188a9dc4ae64c64cd661e9d9c3841e86f226ab)

Signed-off-by: Ross Burton <ross.burton@intel.com>
Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
Signed-off-by: Armin Kuster <akuster808@gmail.com>
---
 meta/recipes-core/meta/cve-update-db-native.bb | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/meta/recipes-core/meta/cve-update-db-native.bb b/meta/recipes-core/meta/cve-update-db-native.bb
index 19875a49b1..c15534de08 100644
--- a/meta/recipes-core/meta/cve-update-db-native.bb
+++ b/meta/recipes-core/meta/cve-update-db-native.bb
@@ -28,8 +28,8 @@ python do_populate_cve_db() {
     BASE_URL = "https://nvd.nist.gov/feeds/json/cve/1.0/nvdcve-1.0-"
     YEAR_START = 2002
 
-    db_dir = os.path.join(d.getVar("DL_DIR"), 'CVE_CHECK')
-    db_file = os.path.join(db_dir, 'nvdcve_1.0.db')
+    db_file = d.getVar("CVE_CHECK_DB_FILE")
+    db_dir = os.path.dirname(db_file)
     json_tmpfile = os.path.join(db_dir, 'nvd.json.gz')
 
     # Don't refresh the database more than once an hour
-- 
2.17.1


