Return-Path: <akuster808@gmail.com>
Received: from mail-pl1-f174.google.com (mail-pl1-f174.google.com
	[209.85.214.174])
	by mail.openembedded.org (Postfix) with ESMTP id 28D0D916B6
	for <openembedded-core@openembedded.org>;
	Sun, 26 Jan 2020 16:25:11 +0000 (UTC)
Received: by mail-pl1-f174.google.com with SMTP id d9so2848120plo.11
	for <openembedded-core@openembedded.org>;
	Sun, 26 Jan 2020 08:25:12 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=from:to:subject:date:message-id:in-reply-to:references;
	bh=voJI4yHMco+zLTEQ/umQ28c+RugwB8WQX59kCQU/8So=;
	b=NrcHROOjBJT8CfwHCvkNiHsZnE3/aZXy05mSXTJ/QjkD2BVL/S9kq7y5YL6MeMCd/y
	7rWVK1bIHbWWeVoAxbQgQFCHSdTjrC+7dcapsU6W4FtmtFe7Frx7bvAMhJEhvDmmhDgE
	hinFjUNm/aYgfcORxnlmspH3xrTVktWyvN2shq6kwFB4rJGbsqS7I6fm/yn9A2A2b2eE
	mh+cLnAbR/R9hFHIn3vowXeytdXMGe474TdWtSFxM+zvbgqIHy+wTBPg9Nm4ToQz7usk
	TUxu5mZXvlFinxWFVyf5zOFGoeK9foe0ATlFgjQrmPEv0oR38DpqDme6J0T60W0ia47E
	7HZQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
	:references;
	bh=voJI4yHMco+zLTEQ/umQ28c+RugwB8WQX59kCQU/8So=;
	b=Onkq7DHqnWObwBPII58IkfNNbW+3N0EY2meDSR90q2Ne001MqonqEegOKYxf/7f0FE
	hyg4s8R3OLf37KEunwUYAAqbJNX6h3pU71ulUf22Mnn1fXqgSEFqj3/j+JfsKiFO/yb+
	8XgMiT1HJn/L9zDAl8sP41HjjOTQjwrHWz/XA7DBBNY5MeV3VbNvn1ts2XtpK+Nmduqo
	BsLCzwgx/8dK401AI304LTsmvJIjWnkWpqS/lxCo5fplD9VclRvI2p6TxWXjug+ZKFUc
	Cb7OKjTzJs5RrTnR4sLG8mI1fjH78QYbap1DCjMl/TnJLvrZuQt51cmJp1z3iB70T8Vq
	D8Lw==
X-Gm-Message-State: APjAAAX9AGv+vN+q9y8cQHKkWPHsotuErxAZD++c8taTccWXp9MDZ8Kf
	cTwDBIzwy7cZH4bvHVM9ANTsGsMw
X-Google-Smtp-Source: APXvYqx6xdJcnnMLZakaVKagaq43f2jQ/e2aIZzCShGX6/p38Z/e2sK+OTSaBRwVfTmNFK3N64V3UQ==
X-Received: by 2002:a17:902:16b:: with SMTP id
	98mr13865026plb.218.1580055912017; 
	Sun, 26 Jan 2020 08:25:12 -0800 (PST)
Received: from akuster-ThinkPad-T460s.mvista.com
	([2601:202:4180:a5c0:bddb:633c:e712:cec2])
	by smtp.gmail.com with ESMTPSA id
	f43sm13046556pje.23.2020.01.26.08.25.11
	for <openembedded-core@openembedded.org>
	(version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
	Sun, 26 Jan 2020 08:25:11 -0800 (PST)
From: Armin Kuster <akuster808@gmail.com>
To: openembedded-core@openembedded.org
Date: Sun, 26 Jan 2020 08:24:44 -0800
Message-Id: <ca4fc78584ec5a7bbeac188f4ed935b3128eb6eb.1580055797.git.akuster808@gmail.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <cover.1580055797.git.akuster808@gmail.com>
References: <cover.1580055797.git.akuster808@gmail.com>
Subject: [warrior 19/29] lz4: Whitelist CVE-2014-4715
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
X-List-Received-Date: Sun, 26 Jan 2020 16:25:11 -0000

From: Adrian Bunk <bunk@stusta.de>

Signed-off-by: Adrian Bunk <bunk@stusta.de>
Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
Signed-off-by: Anuj Mittal <anuj.mittal@intel.com>
---
 meta/recipes-support/lz4/lz4_1.8.3.bb | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/meta/recipes-support/lz4/lz4_1.8.3.bb b/meta/recipes-support/lz4/lz4_1.8.3.bb
index 125836f7bf..605e148d81 100644
--- a/meta/recipes-support/lz4/lz4_1.8.3.bb
+++ b/meta/recipes-support/lz4/lz4_1.8.3.bb
@@ -18,6 +18,9 @@ UPSTREAM_CHECK_GITTAGREGEX = "v(?P<pver>.*)"
 
 S = "${WORKDIR}/git"
 
+# Fixed in r118, which is larger than the current version.
+CVE_CHECK_WHITELIST += "CVE-2014-4715"
+
 EXTRA_OEMAKE = "PREFIX=${prefix} CC='${CC}' DESTDIR=${D} LIBDIR=${libdir} INCLUDEDIR=${includedir}"
 
 do_install() {
-- 
2.17.1


