Return-Path: <akuster808@gmail.com>
Received: from mail-pj1-f53.google.com (mail-pj1-f53.google.com
	[209.85.216.53])
	by mail.openembedded.org (Postfix) with ESMTP id E84407FDA4
	for <openembedded-core@lists.openembedded.org>;
	Mon, 16 Dec 2019 16:00:21 +0000 (UTC)
Received: by mail-pj1-f53.google.com with SMTP id ca19so3164168pjb.8
	for <openembedded-core@lists.openembedded.org>;
	Mon, 16 Dec 2019 08:00:23 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=from:to:subject:date:message-id:in-reply-to:references;
	bh=905yWqdeIGCayTdsC6Nq6OoyUJiefrqmQru1RYtH1Mc=;
	b=DqBx+MAZzrtEIIg+h1qkYg6Zj/ra2jT/QGrU1yUiViXHXBl/IKSu3D0IhLbE5Gomiy
	DSKtzHHQ8VVcuIqO5PHu2SPdpBZjJNmI/sPavJE3m44N9V8FOtpCskr1iJSh7G2DrV4U
	cAb6xW3F6Fcu/fb5UCNPNmyWB6vyxR4QUjN3NAGZTXh/8DOXrVHhOxGFzDX/iJJsNdB+
	9B9Tk+6pcoBIldBUjx7cIBq/VbeVXosRGe8P2oAd9qLuy5HL+XwSEJnuagnELW+oQABx
	YzX1E2gv2Ef5MpzJtPqomC9oVDxOVMyIIi9m6k4DMP2uy8eNgB131zomjN5w1DLrQm2U
	CH1A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
	:references;
	bh=905yWqdeIGCayTdsC6Nq6OoyUJiefrqmQru1RYtH1Mc=;
	b=qoUD0B3i/FCbgqPJGpCTwpJh86s3AoPgYrUaOGgNAWVslCOjLeTXvJMAUYSyJJEfjs
	ZSk4ncJ1cCmMVO6mFsfOQsQgKGySoKVfm+WmwoXRi/HJXbmlIQj3d4X9OB7TJRv1S2fh
	pNbG+r/KZerMYl2LpArYcD69WlQbIUVnLmjn8MMPe55sZD8be8EDHUxeefF9E64x5SBB
	flvw+SjEsAumkiO2QFZj3VYUfaHfWeqH8ovHEPYo8ypXytWXY4ylNJBUKGcCH6BEbmwM
	/eQzJlZYC8V63r6JxSdrpHgvbiVrEpcI81Bz4alTQ+ATRKpRQ/Xkvhm9+Z6qcVBmBAYL
	S2Ng==
X-Gm-Message-State: APjAAAWubtqp7gZDzfQHLSbUYl/KScr/7t/EVfLEpRthO4v+9KKIIhGT
	huvByVskhEmgDOXd5ETZ/8Nl7UU532c=
X-Google-Smtp-Source: APXvYqxx8UncbWkTbtTSMNBUD8Jno3b20xA18AfSR6U86juuXvqyGHHSFtHl4qtvrDJTSAfO6BvXRA==
X-Received: by 2002:a17:902:ff10:: with SMTP id
	f16mr16806117plj.312.1576512022884; 
	Mon, 16 Dec 2019 08:00:22 -0800 (PST)
Received: from akuster-ThinkPad-T460s.mvista.com
	([2601:202:4180:a5c0:e5c5:31c9:a010:f145])
	by smtp.gmail.com with ESMTPSA id
	g6sm19568697pjl.25.2019.12.16.08.00.22
	for <openembedded-core@lists.openembedded.org>
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
	Mon, 16 Dec 2019 08:00:22 -0800 (PST)
From: Armin Kuster <akuster808@gmail.com>
To: openembedded-core@lists.openembedded.org
Date: Mon, 16 Dec 2019 08:00:01 -0800
Message-Id: <29cc2b5cd4bcce1c9e93395a1640014877486d7a.1576511913.git.akuster808@gmail.com>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <cover.1576511913.git.akuster808@gmail.com>
References: <cover.1576511913.git.akuster808@gmail.com>
Subject: [thud 11/18] cve-update-db-native: don't hardcode the database name
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
X-List-Received-Date: Mon, 16 Dec 2019 16:00:22 -0000

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


