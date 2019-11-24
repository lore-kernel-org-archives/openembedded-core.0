Return-Path: <akuster808@gmail.com>
Received: from mail-pj1-f48.google.com (mail-pj1-f48.google.com
	[209.85.216.48])
	by mail.openembedded.org (Postfix) with ESMTP id AB0317FC0A
	for <openembedded-core@lists.openembedded.org>;
	Sun, 24 Nov 2019 23:50:47 +0000 (UTC)
Received: by mail-pj1-f48.google.com with SMTP id w8so5585005pjh.11
	for <openembedded-core@lists.openembedded.org>;
	Sun, 24 Nov 2019 15:50:49 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=from:to:subject:date:message-id:in-reply-to:references;
	bh=TqNrn9U3D+Iq4V2VGhGE7YQXx3GiAI4JY7mRHk1+n48=;
	b=b6hgeCVCvAFDgfN9hTS+MnIFmdUW6XjhoJBdxfvdCLrx1MVz9btMuwtTW49Zbm0VY1
	4QB4liCT6SmBM1Xs5bVBO67Y+5PNb6yID6u9g9qvXzBuCEtaaaqJMKCdroAPTGcJlzIE
	NKkKeFyESNa0zXxWGETnQ2AppG4zAWS5PDAQirs4/Xj0tzZ4hMn8DHG/xz+S3yms7f/y
	2TdFCTkNcjnW8Hos5FalO12BOsWvkTvlfip01azpydTtsySvVPlGso66uwiPtPV0s/bo
	11i70no/TL8CkA0KI0EvuDs46m6c6lQ5iMnT3+/2iyJ9UwAwYUWNRvqCyTl89v//s4wq
	+yGg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
	:references;
	bh=TqNrn9U3D+Iq4V2VGhGE7YQXx3GiAI4JY7mRHk1+n48=;
	b=UZ3LVl1WAMfRkJvysm5MrVWQB+VdlbsT0r5R3RYDttxrRerDS1eVyESvTNKiTjNQ55
	LIfsklfZIQJmM9x3Yq1BYAn0jU3Ts2wE0vrIzLg9gT4feC2YLRapL0NExQ9axI4qbgOt
	lTiK95vi0wRZJk75RhJhjFKEZdjIVKtdc0mROIDdNCiVbP4oYvgpoLDBghVzviSVxvWX
	K0tPpgEzPmbHT26NcI7mwQYHni5dfJI4CGq208XIm00807BIc1RR1TcEwEzwt6Go060w
	EgCVcQihpljavidjWjNuWofz+FmrdudwRlfck4Cj48QGE+TxJj36yx6NpG3vQ9/smTXN
	PF/A==
X-Gm-Message-State: APjAAAV0lz7tCGw/ZIa4Ut8rVAlpuzZ4QU9dA/cV/vtwgIi9pzGp0kiI
	kwWyeS8TBN7NoRVLjk+UD1iIGLw8
X-Google-Smtp-Source: APXvYqxwCCGf1wDYA9obvj+h6gImV32898siCuKyCFUrYJ+9UuptPl0McHi8L+Qb5Rz4F07L0ez3yg==
X-Received: by 2002:a17:90a:a00d:: with SMTP id
	q13mr34726932pjp.106.1574639448634; 
	Sun, 24 Nov 2019 15:50:48 -0800 (PST)
Received: from akuster-ThinkPad-T460s.hsd1.ca.comcast.net
	([2601:202:4180:a5c0:69ac:e4d2:e89f:98da])
	by smtp.gmail.com with ESMTPSA id
	q200sm5619783pfq.87.2019.11.24.15.50.47
	for <openembedded-core@lists.openembedded.org>
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
	Sun, 24 Nov 2019 15:50:48 -0800 (PST)
From: Armin Kuster <akuster808@gmail.com>
To: openembedded-core@lists.openembedded.org
Date: Sun, 24 Nov 2019 15:50:10 -0800
Message-Id: <00b322e35a7f5b95f3e3c5189796f7901ca596a1.1574639349.git.akuster808@gmail.com>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <cover.1574639349.git.akuster808@gmail.com>
References: <cover.1574639349.git.akuster808@gmail.com>
Subject: [zeus 05/35] cve-update-db-native: don't hardcode the database name
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
X-List-Received-Date: Sun, 24 Nov 2019 23:50:47 -0000

From: Ross Burton <ross.burton@intel.com>

Don't hardcode the database filename, there's a variable for this in
cve-check.bbclass.

(From OE-Core rev: 0d188a9dc4ae64c64cd661e9d9c3841e86f226ab)

Signed-off-by: Ross Burton <ross.burton@intel.com>
Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
Signed-off-by: Anuj Mittal <anuj.mittal@intel.com>
---
 meta/recipes-core/meta/cve-update-db-native.bb | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/meta/recipes-core/meta/cve-update-db-native.bb b/meta/recipes-core/meta/cve-update-db-native.bb
index 19875a4..c15534d 100644
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
2.7.4


