Return-Path: <akuster808@gmail.com>
Received: from mail-pf1-f177.google.com (mail-pf1-f177.google.com
	[209.85.210.177])
	by mail.openembedded.org (Postfix) with ESMTP id 63E3B7CE6C
	for <openembedded-core@lists.openembedded.org>;
	Sun, 10 Mar 2019 18:07:51 +0000 (UTC)
Received: by mail-pf1-f177.google.com with SMTP id q17so1966086pfh.10
	for <openembedded-core@lists.openembedded.org>;
	Sun, 10 Mar 2019 11:07:52 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=from:to:subject:date:message-id:in-reply-to:references;
	bh=x4OJ8kZIb8RO9JM6Pjw+aYcY98Y3JDx1Q8Zg25dXqF8=;
	b=FqIuXWdTMV9PrKKVYIyGVHRJ1afAuvGnyC6nz+c/rgWikLT6Xiaom5Tw/WQJrXbE4h
	lxTOuZanDW7GJ/6Tw5SK5LfJGLeYEAL9dikOqdhkppSqg85Ats8zUfqeJOBd5YtHsJWY
	gmTf7zBSs92kYRBsZ0LpkPz4QpFZ0zYAqIJ+YPh2XdWBI/hcMsBbg17mO7OFTLVStM6g
	eQWa7Ng4qnhalCeIw3E9t/1luHFp+Fm6cxM87TQdBZXuY6y8a760Uwj1RENpf38r+tri
	Mx3w3H0HB3TYz8/Ifm2a/BxG6UKh+mlV11YI37TyV32UBw4O3pOy6oeMVJMP55Li9niZ
	1L9A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
	:references;
	bh=x4OJ8kZIb8RO9JM6Pjw+aYcY98Y3JDx1Q8Zg25dXqF8=;
	b=MIuhGz8ynse+K1e+Wf9j3yWn9BMkIcO1zXoXaazIOj73hLh50bvrWtKTQpJlCnL3tr
	cNnNF15TIjbdU5StjDQmYqZkPRB9J5xm43v4D8Pr2tiLbo8WjHs/PKffxLzf2FsQKrqr
	K/z3Zpa8REJU5b8o/5YWXtLAqPCqvCENccwUsqCqqC7y8vh5gNhwU97ynHON4oMd+MlV
	AleDO+DhfSOWltcEkXjaeSRlRp0KfXcd2aqC0RsQPpc/mvNtbx1PIGbcNVo22xdSFpOm
	cIm6gvzARl8iCjHO7Q9YFgjdrkDrqRfDC7yjfpLbjs7FhdWcboesSa3ZiLOQZlPB73U6
	wXFg==
X-Gm-Message-State: APjAAAWf5uktEh9+NG2V3q2owBSGO4CGs8733ZQA4HP2VXYb/KZdoP1E
	zQb4VZbRofzCYb1Na7STJEKomRzf
X-Google-Smtp-Source: APXvYqy2nWCfkp6zY0XYorvIp05FHCmkx3YADMlwx29J6ZuZ9eXFvmc1adiwpDYL4LKyvZVczf8CTA==
X-Received: by 2002:a63:8d42:: with SMTP id z63mr26760834pgd.414.1552241272334;
	Sun, 10 Mar 2019 11:07:52 -0700 (PDT)
Received: from akuster-ThinkPad-T460s.hsd1.ca.comcast.net
	([2601:202:4180:c33:18fc:c150:6496:1a0d])
	by smtp.gmail.com with ESMTPSA id y6sm5999607pfy.87.2019.03.10.11.07.51
	for <openembedded-core@lists.openembedded.org>
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
	Sun, 10 Mar 2019 11:07:51 -0700 (PDT)
From: Armin Kuster <akuster808@gmail.com>
To: openembedded-core@lists.openembedded.org
Date: Sun, 10 Mar 2019 11:07:41 -0700
Message-Id: <1552241263-26116-10-git-send-email-akuster808@gmail.com>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <1552241263-26116-1-git-send-email-akuster808@gmail.com>
References: <1552241263-26116-1-git-send-email-akuster808@gmail.com>
Subject: [PATCH 10/12] nspr: update 4.21
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
X-List-Received-Date: Sun, 10 Mar 2019 18:07:51 -0000

Signed-off-by: Armin Kuster <akuster808@gmail.com>
---
 meta/recipes-support/nspr/{nspr_4.20.bb => nspr_4.21.bb} | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)
 rename meta/recipes-support/nspr/{nspr_4.20.bb => nspr_4.21.bb} (96%)

diff --git a/meta/recipes-support/nspr/nspr_4.20.bb b/meta/recipes-support/nspr/nspr_4.21.bb
similarity index 96%
rename from meta/recipes-support/nspr/nspr_4.20.bb
rename to meta/recipes-support/nspr/nspr_4.21.bb
index 98ca909..25563e5 100644
--- a/meta/recipes-support/nspr/nspr_4.20.bb
+++ b/meta/recipes-support/nspr/nspr_4.21.bb
@@ -24,8 +24,8 @@ CACHED_CONFIGUREVARS_append_libc-musl = " CFLAGS='${CFLAGS} -D_PR_POLL_AVAILABLE
 UPSTREAM_CHECK_URI = "http://ftp.mozilla.org/pub/nspr/releases/"
 UPSTREAM_CHECK_REGEX = "v(?P<pver>\d+(\.\d+)+)/"
 
-SRC_URI[md5sum] = "1c198c7e73f6b0e2bb9153a644ba246b"
-SRC_URI[sha256sum] = "2c8964913da89ffbaf464d49ce44d79e8804e1794ef9a8c52a7bff7224d1556e"
+SRC_URI[md5sum] = "b865586f19912a50acc3755d8a45dbaa"
+SRC_URI[sha256sum] = "15ea32c7b100217b6e3193bc03e77f485d9bf7504051443ba9ce86d1c17c6b5a"
 
 CVE_PRODUCT = "netscape_portable_runtime"
 
-- 
2.7.4


