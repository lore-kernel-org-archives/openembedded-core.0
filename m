Return-Path: <akuster808@gmail.com>
Received: from mail-pg1-f180.google.com (mail-pg1-f180.google.com
	[209.85.215.180])
	by mail.openembedded.org (Postfix) with ESMTP id 016407FBF9
	for <openembedded-core@lists.openembedded.org>;
	Sun, 24 Nov 2019 23:50:43 +0000 (UTC)
Received: by mail-pg1-f180.google.com with SMTP id r18so6103837pgu.13
	for <openembedded-core@lists.openembedded.org>;
	Sun, 24 Nov 2019 15:50:45 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=from:to:subject:date:message-id:in-reply-to:references;
	bh=+LMlGnKmI3AhhiR5NxqS1aLpHol+DUF5nRTJyRHD1sY=;
	b=gaINqP8+Ffl4qNKuQSlIRMY8s+bC0LiEGZmc87hJY7NV9Qv3eJoJGRyT+RhSwV7gYf
	/WU8jI1ZFttN51dk/S68DSBn89tuBA0ZJ6yYdzNG7C+z+1bfBBgV+PpD6J2AfBc9OiXk
	taUgVEt8Rko0qL8ddmAPqMjqX6lzYSirVFAaCdE3W5LSGUDBOUbgq4A5P3TBrnmkx27V
	RmyhX0PSpw08OjLngCysVWV/mYEOyJrwC8Wn9LIDw/a+CSxUgE5S+D40O2sg6QmpAMzG
	xjPp/UlBwTnjSFfB4Oxjict5MNdtQHCRi4cjT/WVhIpJvmj6Rfs6PemeFmv87RlckuSC
	6IcQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
	:references;
	bh=+LMlGnKmI3AhhiR5NxqS1aLpHol+DUF5nRTJyRHD1sY=;
	b=PL9k9Qh+lFLh3+tnN/iTP5phiszt93ZmU3OXqfCRigd7ThVY1G+ol1IrEz48iSw7hJ
	Ral2rObTDgk5Qy+B9lxaX4ClJ1LpAylEYeo5ofHqc7wlMhAvvF3PLqFwb8OvmgGzdOUB
	1U/RDOpv/P24HrN1T5ZIORdeuxy4fNVoPhrMXi4I+Ok80OkgrCu0kDfJZQPohCIQTMZ+
	Kb/N3KUCzw+PwvIiULrL/HSdSLi8ha4bu/xgapUMC92nMYKokyofZmVKXb9E+a6Za4px
	q+bC9C7xglU0iE8U59w7IE46eJfUz3KI9l89gqtit7XHEHBwLmUGWM8qUC8xa/zk6W82
	ElHw==
X-Gm-Message-State: APjAAAX8FMTfrLxZaq+nLn99BJVcuGilMGxTpd8CuX3gKOwZnknKpZZ2
	dQcMSiD2rXAT5WUYZxVFn1v7EDcw
X-Google-Smtp-Source: APXvYqzxUVD9/GbHKapdOilfBRk9v1fNiBPSlxkpeG2vGBCESoEpclU5EqHh1fcKfqWlF5wGN/K1QQ==
X-Received: by 2002:a62:2a14:: with SMTP id q20mr31347524pfq.148.1574639444873;
	Sun, 24 Nov 2019 15:50:44 -0800 (PST)
Received: from akuster-ThinkPad-T460s.hsd1.ca.comcast.net
	([2601:202:4180:a5c0:69ac:e4d2:e89f:98da])
	by smtp.gmail.com with ESMTPSA id
	q200sm5619783pfq.87.2019.11.24.15.50.44
	for <openembedded-core@lists.openembedded.org>
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
	Sun, 24 Nov 2019 15:50:44 -0800 (PST)
From: Armin Kuster <akuster808@gmail.com>
To: openembedded-core@lists.openembedded.org
Date: Sun, 24 Nov 2019 15:50:06 -0800
Message-Id: <e9a2b7dfe912375bd95423d228aa1036bd97421c.1574639349.git.akuster808@gmail.com>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <cover.1574639349.git.akuster808@gmail.com>
References: <cover.1574639349.git.akuster808@gmail.com>
Subject: [zeus 01/35] lz4: Whitelist CVE-2014-4715
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
X-List-Received-Date: Sun, 24 Nov 2019 23:50:44 -0000

From: Adrian Bunk <bunk@stusta.de>

Signed-off-by: Adrian Bunk <bunk@stusta.de>
Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
Signed-off-by: Anuj Mittal <anuj.mittal@intel.com>
---
 meta/recipes-support/lz4/lz4_1.9.2.bb | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/meta/recipes-support/lz4/lz4_1.9.2.bb b/meta/recipes-support/lz4/lz4_1.9.2.bb
index f0a8416..ed4452c 100644
--- a/meta/recipes-support/lz4/lz4_1.9.2.bb
+++ b/meta/recipes-support/lz4/lz4_1.9.2.bb
@@ -18,6 +18,9 @@ UPSTREAM_CHECK_GITTAGREGEX = "v(?P<pver>.*)"
 
 S = "${WORKDIR}/git"
 
+# Fixed in r118, which is larger than the current version.
+CVE_CHECK_WHITELIST += "CVE-2014-4715"
+
 EXTRA_OEMAKE = "PREFIX=${prefix} CC='${CC}' DESTDIR=${D} LIBDIR=${libdir} INCLUDEDIR=${includedir}"
 
 do_install() {
-- 
2.7.4


