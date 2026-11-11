Received: from mail-wm1-f53.google.com (mail-wm1-f53.google.com [209.85.128.53])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.2362.1794418543686461360
 for <openembedded-core@lists.openembedded.org>;
 Wed, 11 Nov 2026 09:35:43 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20260707 header.b=uSvEnRQn;
 spf=pass (domain: gmail.com, ip: 209.85.128.53, mailfrom: stondo@gmail.com)
Received: by mail-wm1-f53.google.com with SMTP id 5b1f17b1804b1-4a5b2be99a8so27905685e9.2
        for <openembedded-core@lists.openembedded.org>; Wed, 11 Nov 2026 09:35:43 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794418542; x=1795023342; darn=lists.openembedded.org;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:date:subject:cc:to:from:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=NifgvPF30MbFNY5IpUT5kxGOKA9ILfbSNaB83WvB920=;
        b=uSvEnRQnm2urTcdNRY+4jrtjI0xdc7IrVh/0DyMCTXIOTI5RTqLc8SQtNfUv6YoSHR
         kb371bRtDbGKvj0AmeqXFEu4gSSIWONPZVdgGuUNmU8yrK7PzbZNaVbCS7IVyvEWMqBE
         /1gTD3bkZBGVG40Be1wh9Rz01732eBiY37QsmXf0/WgjSIkFFuiAOI5hhemcKCb2DgZb
         S7sIakF67UfgVjRfxwi/0HfE9L5UbmhNmAHA8F4SwP9rKasOxWPx+xOLnBlv4CpazJma
         0JkYQ0tchPizx2+X/+lTgj7ldfofTS9rlYLD3weYSURjncuuTvw9baRYPqLkmTzUyAHq
         RGqQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794418542; x=1795023342;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:date:subject:cc:to:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=NifgvPF30MbFNY5IpUT5kxGOKA9ILfbSNaB83WvB920=;
        b=Eg0J4efulaOqcTW8R7MxrLxzukW+hsbn07qQdylGES/KbkB+yCS7L7Xjcp45ZdEy+w
         1ekIvFeu87E6/cz0Bnkk+2CH6GhE9eBN6d9oJvfMHH3XDoUuFdY8oJ8d8lfvWcHllDtz
         VkeoPhCNFGC8uq3rhTsr6FgBqBDx+JF3E5G00FZPfU8XxJAXi5SiBMIt+5ZX7ndmeELn
         hEX+/GWVfYn1j+qh8btKquM2VX5NkACi6CKJhRQSRmblaL8bBr5+Yis+XxGZRcT+lgWO
         lRKEIQKgVpwZo70leKJNkRLgA2YWYY9J18Xpg3x3Na1BUHYcUn9GEMPlUZUkwF092f8d
         NDXw==
X-Gm-Message-State: APuU4Z9tNqhAdjA0FsaIkhkkme4YatwMhCzFvcBhUEc46AiZX8Nkk+od
	SUpYCWLl5L1JF3d72Kesl3WfEtfPp2wn06KyAhEqPmtlR1qkYwvBF5yMebwpUJrZ
X-Gm-Gg: AYBFou1pZW3wmBomFFE5pfBFki2IamMhV4xWzEuDzP3cwLZ+CfherpRW8PwdxUuYa9n
	XSqK3R+CkCSdCdPRag9cSlYnTGzOo8a3XydTKUj2UTcjqe/FmKFfKu+InLx6coaMWZzWEeGUm+P
	FC5AyZllh2MEwLru1xXzMM+pDoZ2Fm+BBpQBpdLwSH12Z+HGpohQRJNDVtOiCOhhb1v0DoundzF
	2UbSxEgS5H7wWBb6u4oOTSPbVCnvQnaeTbjsTNhQJfEPgrPtukjK5HJa42IupXd5nKacKlWT/5X
	xI7Bb1JxeS8NHakzbxWCLzSa3nnypUO83QHtLJzG6yQXKDi9BJJzHwrN4KxfLL/pMZFkz+vEkmp
	AhNbJTSX/oMcNtbkvDuG5+7iC+AfcMLta8WLfGMiX6MP9UVJtNoe7GxE61jqYTPpZbxLFoa6QFW
	ZMyd19FqE/qTdIx65dhkWMSCZGv+QhF7fbIpXdd6R4U9XF4gmR/wvz/x7vWhpojfO8OpUzBysVr
	DeqjTqrktV84FkC2FYqPqGKsL2eyzKoaQjHVBG57qqhc3pYXGmJ7m/7cSdMvaJMnsXIquPcVmFL
	Cmoe3qYRZd+vRJiOT7+kovhl+FPoS4JLV9AK1sLx3y0y1rg=
X-Received: by 2002:a05:600c:b86:b0:4a1:de8a:603a with SMTP id 5b1f17b1804b1-4ba093583e2mr60815865e9.6.1794418541860;
        Wed, 11 Nov 2026 09:35:41 -0800 (PST)
Return-Path: <stondo@gmail.com>
Received: from fedora ([165.225.94.251])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4ba0950394fsm54823785e9.2.2026.11.11.09.35.40
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 11 Nov 2026 09:35:41 -0800 (PST)
From: Stefano Tondo <stondo@gmail.com>
To: openembedded-core@lists.openembedded.org
Cc: yoann.congal@smile.fr,
	jpewhacker@gmail.com,
	peter.marko@siemens.com,
	adrian.freihofer@siemens.com,
	patrick.wicki@siemens.com,
	stefano.tondo.ext@siemens.com,
	Kazuyoshi Akiyama <kazuyoshi_akiyama@jp.honda>,
	Mathieu Dubois-Briand <mathieu.dubois-briand@bootlin.com>,
	Richard Purdie <richard.purdie@linuxfoundation.org>
Subject: [wrynose][PATCH 1/4] spdx30_tasks: Fix duplicated revision in Git PURLs
Date: Wed, 11 Nov 2026 18:35:34 +0100
Message-ID: <20261111173537.3653558-2-stondo@gmail.com>
X-Mailer: git-send-email 2.56.0
In-Reply-To: <20261111173537.3653558-1-stondo@gmail.com>
References: <20261111173537.3653558-1-stondo@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by lin-tor-korg-lkml-alma10-1 with HTTPS for <openembedded-core@lists.openembedded.org>; Wed, 11 Nov 2026 17:35:44 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/250046
Content-Type: text/plain; charset="utf-8"

From: KAZUYOSHI AKIYAMA (秋山 和慶) <kazuyoshi_akiyama@jp.honda>

_generate_git_purl() generates invalid PURLs of the form
`pkg:github/<owner>/<repo>@<rev>@<rev>`.
purl-spec only allows a single `@<rev>`.

oe.spdx_common.fetch_data_to_uri() already appends "@<rev>" to the
download location, and urlparse() leaves that suffix in parsed.path.
Therefore, the parsed repository name(`{repo}`) includes `@<rev>`.
So, need to strip the revision suffix before splitting out
the owner(`{owner}`) and the repository name(`{repo}`).

While here, replace str.replace(".git", "") with str.removesuffix() so
repository names that contain ".git" elsewhere are preserved.

Signed-off-by: Kazuyoshi Akiyama <kazuyoshi_akiyama@jp.honda>
Signed-off-by: Mathieu Dubois-Briand <mathieu.dubois-briand@bootlin.com>
Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
(cherry picked from commit e31479ddbaf58d5c2eda2b0051e1a821d46e6f7c)
Signed-off-by: Stefano Tondo <stefano.tondo.ext@siemens.com>
---
 meta/lib/oe/spdx30_tasks.py | 7 +++++--
 1 file changed, 5 insertions(+), 2 deletions(-)

diff --git a/meta/lib/oe/spdx30_tasks.py b/meta/lib/oe/spdx30_tasks.py
index 1821dd7de4..d5128fff52 100644
--- a/meta/lib/oe/spdx30_tasks.py
+++ b/meta/lib/oe/spdx30_tasks.py
@@ -425,11 +425,14 @@ def _generate_git_purl(d, download_location, srcrev):
 
     for domain, purl_type in git_purl_handlers.items():
         if hostname == domain:
-            path = parsed.path.strip('/')
+            # oe.spdx_common.fetch_data_to_uri() appends "@<rev>" to the
+            # download location, which must not become part of the
+            # repository name
+            path = parsed.path.strip('/').partition('@')[0]
             path_parts = path.split('/')
             if len(path_parts) >= 2:
                 owner = path_parts[0]
-                repo = path_parts[1].replace('.git', '')
+                repo = path_parts[1].removesuffix('.git')
                 return f"{purl_type}/{owner}/{repo}@{srcrev}"
             break
 
-- 
2.56.0

