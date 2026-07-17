Return-Path: <twoerner@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 3DCE3C44524
	for <webhook@archiver.kernel.org>; Fri, 17 Jul 2026 14:34:56 +0000 (UTC)
Received: from mail-qv1-f51.google.com (mail-qv1-f51.google.com [209.85.219.51])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.15067.1784298894286500418
 for <openembedded-core@lists.openembedded.org>;
 Fri, 17 Jul 2026 07:34:54 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20251104 header.b=Jfl2uEzt;
 spf=pass (domain: gmail.com, ip: 209.85.219.51, mailfrom: twoerner@gmail.com)
Received: by mail-qv1-f51.google.com with SMTP id 6a1803df08f44-8eeb4508f29so80460276d6.0
        for <openembedded-core@lists.openembedded.org>; Fri, 17 Jul 2026 07:34:54 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1784298893; x=1784903693; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=loH9pS1TiHmIzEs4SEHCy+VsBuz3HopPeLckocxKE+Q=;
        b=Jfl2uEzttCz6R9gYnzyxlm8Z4iV1Dauiay2kK3kODqlwWHXLOM6BEGUWJqO0bmzntu
         OtzLVrjq9VAh4fw527AmE/QawT4YIC2tFZT0z6ht2ysLcIX4lZvhYDunTHWjuY6W8/Lg
         Rk5z+QuBehJeRvTLnq3O1WvD1CKuao/CXVERf4yf9cbDqcEv1ZMs6ncaKe3+8QtbVr6h
         u03vG+U5FXjjT8HIx7GAmpM5o716Tu8Dj7Z10dCsoI46uf0cQ3Ob6EcqGlKBtKdAZSrQ
         3oLTGqS4P5sb89rj3x+bpt9U8CF4dkfoyQkxIVAsh7hTqtIDLliwQ0hkIScbsLPOc/xD
         UVaw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1784298893; x=1784903693;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to:content-type;
        bh=loH9pS1TiHmIzEs4SEHCy+VsBuz3HopPeLckocxKE+Q=;
        b=s68DDmIX+5XB7ZlnjBCXNG0cMYcLm/CKlATlRpBLbhe5h0u+m+vyKJmcOVmL1cf2Wz
         hJwNF/Gvh+hxuzB5cnyXcaF/Nv5W02ikIS8tS9jSBJbUhogMIMJg197TPHpX203cgC2V
         7RSoAt1VT2Q+ukaMI53w/1jgU+xFLEN6tsmgkozilpLuDorZbqkNz48mH6KUMjNV5xYY
         ysxs8oE5k9K8nIgD6/mu2vmWIYgsd06Awn2U3hI/28lriAlDza8PG0Kf/fuLMyiZV4bz
         X6KEgSJwza0lrvYynCGsnJxEZ6VldXoAE/xpJLNYo4rp4miNirKRtmUcYlQDilN/oYwR
         m2QA==
X-Gm-Message-State: AOJu0YzT2qE/R0fsRNeC8OyWUr/+mCQs5FBekFPb77wCogZYrBArf3va
	WGRBBF7sWvb6QVGrPlZ7GHLaIiOP4574Bp1BqOVkpm4ajsd2UdYjjzlr3N0MfQ==
X-Gm-Gg: AfdE7cl4iJOUFwNMMc7+W+SOAdcBTVqvvL5j0doq4S+yPplsvPz9DG144u8AbrcJn8y
	/6JjbnDHpasnMn5hGLCjczGXO4NASHl5IhgI5nNVGUtOCRTK8HTRJciQLQuHWr4+RsEnSExJzjE
	A+H/C9NKmuK3Ugr3VL/IYRcf8txDVl7rqQqf5jgS4X/VDvBJyLzV3AkdoU2cjLEqfR2oVEnMahy
	lP/cvoxcA7TNT9LhFMqkdA3t/IrjjqwgtleGZliTXL0b2qzEbqeWubt1yzsRDU7xLaBL/8/aNn6
	nGPqgaSEFIg9CubIRrw91nUwXhp4ab44a5G+M1mXBEnvuW2Z6TUu0cWubflinuuNTNmKlTjhkw5
	0goVvf9Ou7twWIneGijyGFfhxmqrmPUmlM6syeOwxmUFffJFu/lsmUz9eW6aEqs+JZQU3L65xhn
	HWjnoKrCI9UBRCVbiQ5U+yPU3oliafXitpPkPuLkDMpPQ/
X-Received: by 2002:a05:620a:2604:b0:914:e3dd:17ea with SMTP id af79cd13be357-930b3e9c2f5mr299988485a.12.1784298893049;
        Fri, 17 Jul 2026 07:34:53 -0700 (PDT)
Received: from localhost.localdomain (pppoe-209-91-167-254.vianet.ca. [209.91.167.254])
        by smtp.gmail.com with ESMTPSA id af79cd13be357-930b5493cb0sm165208785a.42.2026.07.17.07.34.51
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 17 Jul 2026 07:34:51 -0700 (PDT)
From: Trevor Woerner <twoerner@gmail.com>
To: openembedded-core@lists.openembedded.org
Subject: [PATCH v2 3/4] oe/path: canonicalize('') should return '' rather than the cwd
Date: Fri, 17 Jul 2026 10:34:24 -0400
Message-ID: <20260717143425.3521709-4-twoerner@gmail.com>
X-Mailer: git-send-email 2.51.0
In-Reply-To: <20260717143425.3521709-1-twoerner@gmail.com>
References: <20260717143425.3521709-1-twoerner@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Fri, 17 Jul 2026 14:34:56 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/241199

canonicalize() splits its input on the separator and runs each token
through os.path.realpath(). os.path.realpath('') returns the current
working directory, so canonicalize('') and canonicalize(None) wrongly
produced the cwd instead of an empty string, and a stray separator (for
example "a,,b") injected a spurious cwd entry into the result.

Skip empty tokens alongside the existing unexpanded-variable skip so only
real paths are canonicalized.

AI-Generated: codex/claude-opus 4.8 (xhigh)
Signed-off-by: Trevor Woerner <twoerner@gmail.com>
---
changes in v2:
- No change; carried over from v1.
---
 meta/lib/oe/path.py | 6 +++++-
 1 file changed, 5 insertions(+), 1 deletion(-)

diff --git a/meta/lib/oe/path.py b/meta/lib/oe/path.py
index 44a9ff9d0757..7255d99bc2f7 100644
--- a/meta/lib/oe/path.py
+++ b/meta/lib/oe/path.py
@@ -356,7 +356,11 @@ def canonicalize(paths, sep=','):
     # prefixes in sting compares later on, where the slashes then are important.
     canonical_paths = []
     for path in (paths or '').split(sep):
-        if '$' not in path:
+        # Skip empty tokens as well as unexpanded bitbake variables: an
+        # empty path would otherwise reach os.path.realpath(''), which
+        # returns the current working directory, so canonicalize('') or
+        # canonicalize(None) would wrongly produce the cwd instead of ''.
+        if path and '$' not in path:
             trailing_slash = path.endswith('/') and '/' or ''
             canonical_paths.append(os.path.realpath(path) + trailing_slash)
 
-- 
2.50.0.173.g8b6f19ccfc3a


