Return-Path: <koen.kooi@linaro.org>
Received: from mail-we0-f169.google.com (mail-we0-f169.google.com
	[74.125.82.169])
	by mail.openembedded.org (Postfix) with ESMTP id A238A6DDF5
	for <openembedded-core@lists.openembedded.org>;
	Tue, 14 Jan 2014 11:02:23 +0000 (UTC)
Received: by mail-we0-f169.google.com with SMTP id u57so221960wes.0
	for <openembedded-core@lists.openembedded.org>;
	Tue, 14 Jan 2014 03:02:24 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
	:references;
	bh=UleQ58GD9T9hlw4+hMuHR/+CeuLpvzvWUOODpKPCSPo=;
	b=fDOP+11WSiCI+o9AlvnVNzYDS4qa+DrQXassISh7YLjcxPwO7e2AADqFB9l+dK5V1i
	Pe7TRafKyGY1k1qELa33NVdHgZjHDC0ZtxqaU5tKRai72AF3OVLrjs4EGQHuSCWlXMOB
	5iu08kMQlIfFR739SVzc4jDS8ja+8QuZCMtTEWRSuCQ3YMEO5GsSPgY7sKfjCzockzkM
	JsY3ZGV28uCZqVOjsKJBSWoxaqYviq/Cjot3xwkqYLmLhgYflt4fuwZIpnaGNCUML1sR
	qcHyYka4ijdqU9gv/oZQ0b2L8ANiJctPp3QVC58kQyh0Xz4s5vxsbj26r7T9zS+L32Dy
	buJw==
X-Gm-Message-State: ALoCoQnBJttrugB8pDJbV93TA4qKD16xNLP0hgClUp5850U/bQBXfknJrVOWPC6qrdGZ4d1gHeE+
X-Received: by 10.180.187.36 with SMTP id fp4mr19873416wic.9.1389697344270;
	Tue, 14 Jan 2014 03:02:24 -0800 (PST)
Received: from localhost ([2001:610:612:0:5e51:4fff:fec8:7c15])
	by mx.google.com with ESMTPSA id j3sm904361wiy.3.2014.01.14.03.02.23
	for <multiple recipients>
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Tue, 14 Jan 2014 03:02:23 -0800 (PST)
From: Koen Kooi <koen.kooi@linaro.org>
To: openembedded-core@lists.openembedded.org
Date: Tue, 14 Jan 2014 12:00:47 +0100
Message-Id: <1389697249-4062-3-git-send-email-koen.kooi@linaro.org>
X-Mailer: git-send-email 1.8.4.2
In-Reply-To: <1389697249-4062-1-git-send-email-koen.kooi@linaro.org>
References: <1389697249-4062-1-git-send-email-koen.kooi@linaro.org>
Cc: Koen Kooi <koen.kooi@linaro.org>
Subject: [PATCH 3/5] distrodata bbclass: add support for lz4 archives
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
X-List-Received-Date: Tue, 14 Jan 2014 11:02:24 -0000

Signed-off-by: Koen Kooi <koen.kooi@linaro.org>
---
 meta/classes/distrodata.bbclass | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/meta/classes/distrodata.bbclass b/meta/classes/distrodata.bbclass
index 2c365f9..b47358b 100644
--- a/meta/classes/distrodata.bbclass
+++ b/meta/classes/distrodata.bbclass
@@ -289,9 +289,9 @@ python do_checkpkg() {
         ver_regex = "(([A-Z]*\d+[a-zA-Z]*[\.\-_]*)+)"#"((\d+[\.\-_[a-z]])+)"
         # src.rpm extension was added only for rpm package. Can be removed if the rpm
         # packaged will always be considered as having to be manually upgraded
-        suffix = "(tar\.gz|tgz|tar\.bz2|zip|xz|rpm|bz2|orig\.tar\.gz|tar\.xz|src\.tar\.gz|src\.tgz|svnr\d+\.tar\.bz2|stable\.tar\.gz|src\.rpm)"
+        suffix = "(tar\.gz|tgz|tar\.bz2|tar\.lz4|zip|xz|rpm|bz2|lz4|orig\.tar\.gz|tar\.xz|src\.tar\.gz|src\.tgz|svnr\d+\.tar\.bz2|stable\.tar\.gz|src\.rpm)"
 
-        suffixtuple = ("tar.gz", "tgz", "zip", "tar.bz2", "tar.xz", "bz2", "orig.tar.gz", "src.tar.gz", "src.rpm", "src.tgz", "svnr\d+.tar.bz2", "stable.tar.gz", "src.rpm")
+        suffixtuple = ("tar.gz", "tgz", "zip", "tar.bz2", "tar.xz", "tar.lz4", "bz2", "lz4", "orig.tar.gz", "src.tar.gz", "src.rpm", "src.tgz", "svnr\d+.tar.bz2", "stable.tar.gz", "src.rpm")
         sinterstr = "(?P<name>%s?)v?(?P<ver>%s)(\-source)?" % (prefix, ver_regex)
         sdirstr = "(?P<name>%s)\.?v?(?P<ver>%s)(\-source)?[\.\-](?P<type>%s$)" % (prefix, ver_regex, suffix)
 
-- 
1.8.4.2


