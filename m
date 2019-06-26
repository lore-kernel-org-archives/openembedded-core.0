Return-Path: <lemagoup@gmail.com>
Received: from mail-wm1-f65.google.com (mail-wm1-f65.google.com
	[209.85.128.65])
	by mail.openembedded.org (Postfix) with ESMTP id 0A72D7C5FC
	for <openembedded-core@lists.openembedded.org>;
	Wed, 26 Jun 2019 12:15:19 +0000 (UTC)
Received: by mail-wm1-f65.google.com with SMTP id w9so4507083wmd.1
	for <openembedded-core@lists.openembedded.org>;
	Wed, 26 Jun 2019 05:15:21 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=from:to:cc:subject:date:message-id;
	bh=lDTeZpb8J9cLEhXwpcJJMwYxAW5t3/Sn1ITJzg2dUF0=;
	b=dNrGdAZPQjMYi+nu3YDefzFnvkm2AEhCckO9oD4/e9Wlm2unYZPasszBg7amgN5T6O
	I4NyZj0bR1w281UOGcfJYuhfspc7fYAIK5g5qF2lSKaiGYIRETCSkH+8GZvHwStU5THv
	ClwNbCy9c1XuJLw5a/lv+bS1UsQSUdfSKk/fG/nFseC0ihiLinam/TJMZSOS8rcOZ4b7
	1jkYRfx1TDrUxO3ngHIbmeJJ8KuAqxDPKuurufCYyz7BO9xfXaYU999BOfXK+eaEdPur
	vGWeWE3c9UveBjaRpPmMTSC20204u9yaZethSsUzmyNA65H0L8OnQ73h5cCUD0DUThdh
	kEUg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:cc:subject:date:message-id;
	bh=lDTeZpb8J9cLEhXwpcJJMwYxAW5t3/Sn1ITJzg2dUF0=;
	b=uRB0QxYg5T8UkBT3Bt6WtgR9P+8e2iVMF+ejaGdIWE5NLRFjcrm6eSG1G5rNyuQ1/O
	/BrX87SrP9A/WBcENwKHabR1S2Dtt7KR68rfRK9jNby+mrL3eTMRgIna172ItUWkYANT
	IcLx5b2QDZbxfgO+73+WMKQTMxR7kci2tTIloKRaLEkdF/cOZX9/k1iqbPWN/IUnMqO5
	GBl22cF9mBmKbMMBpJP6cCKxf8vGE05OIwGpmWvyrOkKsPSFFVOBlMcz1uIY8xGCAVq4
	59aIt115Y6itGZumQQYBYaMYZaZcqQdVj+GtF7xJdmjEmPLfbNjLAAYyPDG3I4dlMi0V
	oH0g==
X-Gm-Message-State: APjAAAW5OrUvVMzLx2BKQugeHdTHH52s8MnYG3YzMwcHUFl1Tw7RRaHr
	mrp0IQIHAg+3QdgwOAQNY2PVUwTf
X-Google-Smtp-Source: APXvYqyB5V29iCf+Gooz4aA4M13DDBnkZSaGLIVW5MJwrgf/Q8HYqA9iG5kl/d0N2l9Yg6H9EyMrRQ==
X-Received: by 2002:a1c:44d4:: with SMTP id r203mr2509759wma.158.1561551320107;
	Wed, 26 Jun 2019 05:15:20 -0700 (PDT)
Received: from localhost.localdomain
	(softbank-robotics-gw1.ter4.eqx2.par.cust.as8218.eu.
	[158.255.112.194])
	by smtp.gmail.com with ESMTPSA id 5sm37369391wrc.76.2019.06.26.05.15.19
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Wed, 26 Jun 2019 05:15:19 -0700 (PDT)
From: Pierre Le Magourou <lemagoup@gmail.com>
To: openembedded-core@lists.openembedded.org
Date: Wed, 26 Jun 2019 14:14:34 +0200
Message-Id: <20190626121434.32034-1-lemagoup@gmail.com>
X-Mailer: git-send-email 2.11.0
Subject: [PATCH] cve-update-db: do_populate_cve_db depends on do_fetch
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
X-List-Received-Date: Wed, 26 Jun 2019 12:15:20 -0000

From: Pierre Le Magourou <pierre.lemagourou@softbankrobotics.com>

To be able to populate NVD database on a fetchall
(bitbake <image> --run-all=fetch), set the do_populate_cve_db task to be
executed before do_fetch.

Signed-off-by: Pierre Le Magourou <pierre.lemagourou@softbankrobotics.com>
---
 meta/recipes-core/meta/cve-update-db.bb | 3 +--
 1 file changed, 1 insertion(+), 2 deletions(-)

diff --git a/meta/recipes-core/meta/cve-update-db.bb b/meta/recipes-core/meta/cve-update-db.bb
index 1f48820cc6..5778e00e79 100644
--- a/meta/recipes-core/meta/cve-update-db.bb
+++ b/meta/recipes-core/meta/cve-update-db.bb
@@ -6,7 +6,6 @@ PACKAGES = ""
 
 inherit nopackages
 
-deltask do_fetch
 deltask do_unpack
 deltask do_patch
 deltask do_configure
@@ -113,7 +112,7 @@ def update_db(c, json_filename):
 
 
 
-addtask do_populate_cve_db before do_cve_check
+addtask do_populate_cve_db before do_fetch
 do_populate_cve_db[nostamp] = "1"
 
 EXCLUDE_FROM_WORLD = "1"
-- 
2.11.0


