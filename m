Return-Path: <akuster808@gmail.com>
Received: from mail-pl1-f177.google.com (mail-pl1-f177.google.com
	[209.85.214.177])
	by mail.openembedded.org (Postfix) with ESMTP id 00F217FD00
	for <openembedded-core@openembedded.org>;
	Mon, 13 Jan 2020 15:30:52 +0000 (UTC)
Received: by mail-pl1-f177.google.com with SMTP id b22so3937778pls.12
	for <openembedded-core@openembedded.org>;
	Mon, 13 Jan 2020 07:30:54 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=from:to:cc:subject:date:message-id:in-reply-to:references;
	bh=3wqyJYpps9i428cwTH7uDQeIR4/7/mW+uYY3ssNFb4o=;
	b=p+frz4gw8doeGauPY6UAVZkcJ1p+HpCW6zQ2NPzTLOrzd4l928HxvdVW/DCIEavVe0
	Ly4/rpfRCMnMGnCW15VXQIeje7+SRClyBZBPVfskySvC51/3FNYgqll8PhXUsWrDFTDa
	DGV0U4l2XrXuc6kloFnRoWW+/3eJCeKTwDRGUmFPtPH/KBLFbMY+zjmIvZKj2KnyHvY4
	uA7+f5rWREj+ntFVIofQjVTJI0AaiTjzT8w88/UTNgCNMS3STtTrMEVZUyVCIcoYMIg2
	0RchwMdh6LrrECT48P+iwqc3+yCqEJmYHbDOGodNI9ynFY7HWQGwB08RdDWhAUyUztgm
	x7UA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
	:references;
	bh=3wqyJYpps9i428cwTH7uDQeIR4/7/mW+uYY3ssNFb4o=;
	b=beoSy/GM2H5OZGopPgqwdvAKS282kpMPgjPjKTvvv8uORbRTg6Cb5OO3QQ+ThYV6n+
	9ejhkRtGvJT1fOR4S1+bGUZBrqWKu2ndOrOFzDxtWfv6fQ88LpPN4+JsnyP3a9FYDXF3
	rvTL/EIgdX2qkq+JMmng/hpYbh2xEnanTo7PBhW9pHqQvzNOebM0QaHSegQ3MMSX/kka
	egvvTCUqB/NnwE42pW3EvL14vozwn4rk918saSzgW9kl4LQmnNLI4jpkwtu23BiJJQE1
	SLmsE3Sb/Mf7/cLr8MV8lcMKG/YTd5QVuSUPk/XXd6ZVa20S8RtNaeUqY+AWLUADpkkz
	HaXw==
X-Gm-Message-State: APjAAAWEvWdnRc5q3HqejAdGDVOoW3hjMHX6iRMxliETALBblsayRYaH
	4ozdgJAHO8mx5LeYrZRuWcGC6mTs
X-Google-Smtp-Source: APXvYqydhER5nybqFqsBdHLPhbP6btmyrQWFQW9SZPkzTTr7kvrhg6468TKrZ79sUorOtVbBNJsROQ==
X-Received: by 2002:a17:90a:8d84:: with SMTP id
	d4mr23297099pjo.114.1578929453857; 
	Mon, 13 Jan 2020 07:30:53 -0800 (PST)
Received: from akuster-ThinkPad-T460s.hsd1.ca.comcast.net
	([2601:202:4180:a5c0:2dcb:8dcc:2050:e41d])
	by smtp.gmail.com with ESMTPSA id
	q8sm14167646pgg.92.2020.01.13.07.30.52
	(version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
	Mon, 13 Jan 2020 07:30:52 -0800 (PST)
From: Armin Kuster <akuster808@gmail.com>
To: openembedded-core@openembedded.org
Date: Mon, 13 Jan 2020 07:30:17 -0800
Message-Id: <f774665ee4dcdc5a1fe1f51384d82fb8e1b219e1.1578929268.git.akuster808@gmail.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <cover.1578929268.git.akuster808@gmail.com>
References: <cover.1578929268.git.akuster808@gmail.com>
Cc: akuster808@gnail.com
Subject: [warrior 18/28] cve-update-db-native: don't hardcode the database name
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
X-List-Received-Date: Mon, 13 Jan 2020 15:30:53 -0000

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


