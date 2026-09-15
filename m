Return-Path: <richard.purdie@linuxfoundation.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 92EE6C88E77
	for <webhook@archiver.kernel.org>; Tue, 15 Sep 2026 09:52:39 +0000 (UTC)
Received: from mail-wm2-f12.google.com (mail-wm2-f12.google.com [74.125.225.140])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.19506.1789465957036576627
 for <openembedded-core@lists.openembedded.org>;
 Tue, 15 Sep 2026 02:52:37 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@linuxfoundation.org header.s=google header.b=HuCNjzU0;
 spf=pass (domain: linuxfoundation.org, ip: 74.125.225.140, mailfrom: richard.purdie@linuxfoundation.org)
Received: by mail-wm2-f12.google.com with SMTP id 5b1f17b1804b1-49b91369d18so510805e9.0
        for <openembedded-core@lists.openembedded.org>; Tue, 15 Sep 2026 02:52:36 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linuxfoundation.org; s=google; t=1789465955; x=1790070755; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=J9H8Gh1uc2/VHva5X5M0N7HvpuMQpxxQ+cHS/x75nuo=;
        b=HuCNjzU00u1z4EqhtKvwHLNnsYKo3TYpcHc6TRZswZ3ReIh6zjoK+PHhy+hFr0ZsLo
         Q0ugfwrJOTv1WbiRVcY/9/crnAYeEiWzXwJW8gerN1fnIMjQax8XCNML9fLpbNLHqfPR
         ecBGAaXdGotOdg1cZqF+fGvwiie8qx1lKSOWI=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1789465955; x=1790070755;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to:content-type;
        bh=J9H8Gh1uc2/VHva5X5M0N7HvpuMQpxxQ+cHS/x75nuo=;
        b=yhBS7gKrrenrGOBJD5joPhQTc7KR0VvXfAI8oewuBkszDje/2NBI6p8dHv2cftV5Ks
         hyKf3fJskWEKUkXwKGMNRiHl1wW3lKuDGJ3Sty19Gxb3YCzdn5HyxsNc7x7sgMdI4op1
         yDHL3b48lEDB2QXUQxjVXtQYWRlDLhjsi9i2RtB7FESzxqa4hx/PJ07zS0L5UvH78b2r
         +YK4CkW7P5jXpfNFBt9RufwokBuz+OGRWBGN05iJZOEsZhlj++Za9jJLIbqPLzK6Z3BK
         FR7qFKuhrbctv1QWtUkCE7YXrIsBwPwQ1kAWxGqpuifE91qskVFjMHkB82cZibW6aQEx
         AZkQ==
X-Gm-Message-State: AFuF++l4hqJIuLvK5KStwYiUPGWa5oowIQHa6sjheCNhq5qboReaWtbH
	crHuZTy+pWvPNh/8R1SZ0uLRBqoG0DKfEl6IAz6wjac5P/XT11R+fRG01E7hO52sGRqAZ7i9GtZ
	2IWLaSkU=
X-Gm-Gg: AYBFou0K9KRIbqNLwW6rz11hYn/p6/Eykag43q4GyW6/5C8l/ooYLr9gwOqV9K9WPEF
	HO/8fMWeqfNib7Ijv5CXF3UPkVd/UDUlc2Si/Bw00JAa/csItNQvQWnoA7h0aSTh3sQTDMOrXkS
	ffnZ+0HYBj9F7HQy8a6AuIdfM2RS6hswGknaZgWmOsztr3cKpygwaEk/em+UFqymRKd62SF2eY3
	fU6WnxypfaXDMP/xInrodJIzU80FbrSQYLbT+CCmfyrnN3H0dXx7touJzf6g0EFbnbPoJHP1gH4
	nWLl0+dhqMmgYvVhzau/XcpYMZIY31r4JDRc3SgmZK8vADT/chO1j9BqYG9io7jlIyQ7hQqA94c
	oD9+FzEjBt3bZM2iI+uSBjvP2+bhLLfodAYB0ev73DHbPbZk0GCss9ZAYiz5RdQEn80hUE0j2rp
	jX3EMPZ/8LDwcWS5YMznjV4MReb14JeVBtBd4QATW0GljvldDKi5ZWbDq3D4CQ5uXbOXdFud9J6
	jDMHFtIcLFIJryVmr7REIWIYqHT
X-Received: by 2002:a05:600c:8b54:b0:49e:7a00:b9a5 with SMTP id 5b1f17b1804b1-49e8222d27dmr6575535e9.4.1789465955332;
        Tue, 15 Sep 2026 02:52:35 -0700 (PDT)
Received: from max.int.rpsys.net ([2001:8b0:aba:5f3c:fe92:a101:5d63:1ea8])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-49e7d69f6d6sm62617775e9.8.2026.09.15.02.52.34
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 15 Sep 2026 02:52:34 -0700 (PDT)
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: openembedded-core@lists.openembedded.org
Subject: [PATCH 5/5] python3-vcs-versioning: upgrade 2.3.4 -> 2.4.0
Date: Tue, 15 Sep 2026 10:52:29 +0100
Message-ID: <20260915095229.2292237-5-richard.purdie@linuxfoundation.org>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20260915095229.2292237-1-richard.purdie@linuxfoundation.org>
References: <20260915095229.2292237-1-richard.purdie@linuxfoundation.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 15 Sep 2026 09:52:39 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/245835

- Add `scm.git.distance_scope` and `scm.git.distance_count`, restricting the distance count to the commits that touch a monorepo project (and optionally further shared directories) instead of every commit in the repository. Counting uses `--full-history` by default, or `--first-parent`; git's default history simplification is not offered because it can make the distance shrink across a merge. Git only.

- Select file finders by the VCS marker their entry point is named for (`.git`, `.hg`, `.jj`) instead of running every backend's command in turn. A tree with no VCS marker -- an unpacked sdist, say -- now spawns no subprocess at all, so a slow `hg` on `PATH` can no longer fail an unrelated build.

  The finders also survive a subprocess timeout: `subprocess.TimeoutExpired` was uncaught and aborted the build, and is now treated like any other failed probe.
- Prefer the fallback metadata nearest the project directory. A `.git_archival.txt` or `PKG-INFO` at the VCS root no longer shadows a monorepo project's own, which silently produced the root project's version.

Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
---
 ...-vcs-versioning_2.3.4.bb => python3-vcs-versioning_2.4.0.bb} | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta/recipes-devtools/python/{python3-vcs-versioning_2.3.4.bb => python3-vcs-versioning_2.4.0.bb} (91%)

diff --git a/meta/recipes-devtools/python/python3-vcs-versioning_2.3.4.bb b/meta/recipes-devtools/python/python3-vcs-versioning_2.4.0.bb
similarity index 91%
rename from meta/recipes-devtools/python/python3-vcs-versioning_2.3.4.bb
rename to meta/recipes-devtools/python/python3-vcs-versioning_2.4.0.bb
index e358c722d73..e66a7ce7b03 100644
--- a/meta/recipes-devtools/python/python3-vcs-versioning_2.3.4.bb
+++ b/meta/recipes-devtools/python/python3-vcs-versioning_2.4.0.bb
@@ -5,7 +5,7 @@ library that can be used independently of setuptools."
 LICENSE = "MIT"
 LIC_FILES_CHKSUM = "file://LICENSE.txt;md5=c9b06ad2ebd7e2e82d34b3caf353e7d5"
 
-SRC_URI[sha256sum] = "f3443da15a34a32755b04324e33c6166add300c7661f45902225190c9337f711"
+SRC_URI[sha256sum] = "cc4b66c02ae4cfb51e843910024f7142464c3391bb1f7e04608578b45046891b"
 
 SRC_URI += "\
     file://run-ptest \

