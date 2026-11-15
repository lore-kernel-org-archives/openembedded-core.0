Received: from mail-wr1-f50.google.com (mail-wr1-f50.google.com [209.85.221.50])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.4391.1794732581136279304
 for <openembedded-core@lists.openembedded.org>;
 Sun, 15 Nov 2026 00:49:41 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@linuxfoundation.org header.s=google header.b=EcnYYkZV;
 spf=pass (domain: linuxfoundation.org, ip: 209.85.221.50, mailfrom: richard.purdie@linuxfoundation.org)
Received: by mail-wr1-f50.google.com with SMTP id ffacd0b85a97d-48e47347279so932772f8f.1
        for <openembedded-core@lists.openembedded.org>; Sun, 15 Nov 2026 00:49:40 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linuxfoundation.org; s=google; t=1794732579; x=1795337379; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=WEc00Cdh0QhWCDTYSFtHY98d7wGTGyajtlwtkeNudSI=;
        b=EcnYYkZVoAf0Um2LhWum8wTb4ctqzCCUuilRqZm6VI05FmM7Fd5ugN6k9sexp8uY+0
         qTApufaDVAHrYEEzIKhUWeKLlfuiwrv+vPgV+0wgD3X6ePcXY4j9X6cL/TtBSnO0LiAn
         DHHqgj+HenlhqHMV6vPyWMD0MUJOXwtKT61Cc=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794732579; x=1795337379;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to:content-type;
        bh=WEc00Cdh0QhWCDTYSFtHY98d7wGTGyajtlwtkeNudSI=;
        b=law2YYBtwPWqrVQv4Jo4oIBDu65wWYfDvIQT06hDQDTC8hf/BRrwMut+3Mui+OMybH
         b7duAEZqsgNpG3Z50bKfCUnWwZoGMlY+7VchRG946arL6mm82qXnhdUbv3Mhu/3Bv2Oo
         uyt3xvXBVl1dSG/OsLDTysFzK9JWsDR5tThIdCFYRv7Ov/3T4AUTIWVNsbH0mijHC8cO
         KkCyFU/2QvU4IrA1ZwaGJSjfLKxvC9Y9qG8pk7zo4mBRNiQrBjuVzaSC9ZGAf+QCW4nE
         Wf2gRvJ6rMuSY9kLQkrkRcXrBK+BL/Hg3EbDLQG8FxQgtewhSIEkDa+ZcVqemZid4zRV
         gt1Q==
X-Gm-Message-State: APuU4Z/7xyAmQVC7sdGwyGBbSKmmAUvpmFBIbvvasK/Wf7GG039rOmKH
	75XzO14Dk6iGGbiDPpDkMDh7kuoOQKyHAszE2Ujhb2oh3tnqYf4dLOcqA8Jr8nPSx9p2IpGAyM2
	qyDUurYU=
X-Gm-Gg: AYBFou3Cex76UXhZhR1jAVdeedCAu58ScjJiu7KzgPdZMhh0dfursKpgf7Xz2Ya+ji+
	W5WoAXhLvUYpBT+s+UNyZip7E5VvRsuq5dxpO1fSGzctnQgYaub1AnwT8w5rR5zW7l21eVrU2tb
	+ipeBChT3SrFbmDA7XkM4AT2UX4OQ/xXlwXfK4O/mBq0Z2AXJyrfKDQkMyIbWSZOXcO7syjKLsy
	qYZ/idWsPLlB+/FFTQglwR/0WXWpx3DxmQbJoirWxfpdxp7vO2VXLIX8WHY8aU5TT53QCSawtfF
	A1Trjmi2Anjao3a/8N6CZifD+GONrWZ1cnDGi6PQKGlTfEw4uMcP8aByN0MbZ4doDA48517tKUi
	1xrS06+MR/S3YR8qjq7Zcd7jy6h2aWo43nI9WN3n2qD5RU+gPnMx11aLUgF/k9xnUQ9osm/FASq
	A75Hmxq59EkhUDbI6YMf4qUADoG8OTqtb1tzvWyfC5JEQoW6xeY5fgRYmQjNf8PQgdA1tzn0+nU
	7EMLfAsXQaGpGErVICl/XKKlK/hWBGyiYnagaobwU+EINdLC5gzRDfMCvmY9+b1XS82LWE41GNg
	4WmffQuZ8XOKekZDwmX3LtobL1RLnSAgbesTTU0Nrz58pCu3q3+EQ50Zng==
X-Received: by 2002:a05:6000:2007:b0:491:7ab7:81a1 with SMTP id ffacd0b85a97d-49c72c9be63mr14642656f8f.46.1794732579363;
        Sun, 15 Nov 2026 00:49:39 -0800 (PST)
Return-Path: <richard.purdie@linuxfoundation.org>
Received: from max.int.rpsys.net ([2001:8b0:aba:5f3c:4b65:588d:a4ce:ce3f])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-49c60f8d66esm13804452f8f.57.2026.11.15.00.49.37
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 15 Nov 2026 00:49:38 -0800 (PST)
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: openembedded-core@lists.openembedded.org
Subject: [PATCH 31/41] oeqa/buildperf: Drop sortTestMethodsUsing from the test runner
Date: Sun, 15 Nov 2026 08:48:34 +0000
Message-ID: <20261115084845.701136-31-richard.purdie@linuxfoundation.org>
X-Mailer: git-send-email 2.55.0
In-Reply-To: <20261115084845.701136-1-richard.purdie@linuxfoundation.org>
References: <20261115084845.701136-1-richard.purdie@linuxfoundation.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by lin-tor-korg-lkml-alma10-1 with HTTPS for <openembedded-core@lists.openembedded.org>; Sun, 15 Nov 2026 08:49:44 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/250262
Content-Type: text/plain; charset="utf-8"

Only test loaders use sortTestMethodsUsing so setting it on the runner
has no effect; BuildPerfTestLoader already sets it. Also fix the
runner's docstring.

AI-Generated: Uses Claude Opus 5.5
Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
---
 meta/lib/oeqa/buildperf/base.py | 3 +--
 1 file changed, 1 insertion(+), 2 deletions(-)

diff --git a/meta/lib/oeqa/buildperf/base.py b/meta/lib/oeqa/buildperf/base.py
index 6735e14fc8b..ce39bead31a 100644
--- a/meta/lib/oeqa/buildperf/base.py
+++ b/meta/lib/oeqa/buildperf/base.py
@@ -486,8 +486,7 @@ class BuildPerfTestLoader(unittest.TestLoader):
 
 
 class BuildPerfTestRunner(unittest.TextTestRunner):
-    """Test loader for build performance tests"""
-    sortTestMethodsUsing = None
+    """Test runner for build performance tests"""
 
     def __init__(self, out_dir, *args, **kwargs):
         super().__init__(*args, **kwargs)
