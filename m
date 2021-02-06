Received: from mail-wr1-f52.google.com (mail-wr1-f52.google.com [209.85.221.52])
 by mx.groups.io with SMTP id smtpd.web12.6797.1612621669463890330
 for <openembedded-core@lists.openembedded.org>;
 Sat, 06 Feb 2021 06:27:49 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20161025 header.b=PeaNRk9V;
 spf=pass (domain: gmail.com, ip: 209.85.221.52, mailfrom: quaresma.jose@gmail.com)
Received: by mail-wr1-f52.google.com with SMTP id v15so11159343wrx.4
        for <openembedded-core@lists.openembedded.org>; Sat, 06 Feb 2021 06:27:49 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=MJ1Q5R7PtiUybFoGei4VJ0MHgzVcmmCb4l7V/4qMP2Q=;
        b=PeaNRk9VxEApPRVD0a/IwxhCC9wOY8SMPbdeq/qXqGFtyjZqWuQ7tq1pQLNTa+oVhX
         5K5UtoZ8VjlbdKIyGAaf6IqkExMxbH4XnCkRBWl3HLweX+4LvYaZrUv2cD7RnYeJ0jCH
         a7LDFyjsmSydHRL9DSiE66dNgkZB+3N1ciN5WPAf+8QXHEA+HkggS1qRO8v/zlCgw2Zy
         RENuEPhujol7hkfUt/jvwELin8fXNghCAAe5GFwGj+toj+ag7OO2OqZjJP+TOiPSwovd
         N7hJUVLazq+tU2W1LZBJK5/b4U/knF891sR8Pkmc1nXOqeB//Wd1y8aQX80I8A0Wy9CZ
         BhIw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=MJ1Q5R7PtiUybFoGei4VJ0MHgzVcmmCb4l7V/4qMP2Q=;
        b=KJTr6XMdl8GEhYUJp9N+FHxOJrADjViyfVEcbnQIhiKzDh9yKqjR+gxOvZMuFi9wvb
         nE4K64AdyzMTrDDOnUjJRcsGv3XHFmhB17vy8KAmug38s3s1PHZ6/shhmPxcDIOm9aYz
         NK9ZeUJoayo16/4WF9eFBohxwF/rPeSQwFDTSF/Pj1ugUrferM4pkR8Gv+4mPgd8A/vG
         vU9i6ahmBcMdJN1AaYxQZGZ6GFxd25m95kvVugrTvxjjGpw0H/up4mCKVH82B2ZnmQyx
         Q40z5CFxlKbIbHKlsHzFso408c7Z397LlZ0IVRj+dBuhUMwjmXR/nBxxejFmN08NlV/U
         p19A==
X-Gm-Message-State: AOAM532efIvCLqYejgEzkfPHSnSJdKkAgALVvrM8HgK00rPLVoPMPTSG
	cZ+pSJzaq95REeizQayC4Sqf4SW67v5ZYg==
X-Google-Smtp-Source: ABdhPJzhAzMeVFtCfZBKkyh8uaWrNlDa/3wkkLURHbdNDoSQGM+Zeiaj3VaCLV62ttyRWHJ5f0QxaA==
X-Received: by 2002:a05:6000:192:: with SMTP id p18mr10447040wrx.69.1612621668128;
        Sat, 06 Feb 2021 06:27:48 -0800 (PST)
Return-Path: <quaresma.jose@gmail.com>
Received: from dragon.lan (176.57.115.89.rev.vodafone.pt. [89.115.57.176])
        by smtp.gmail.com with ESMTPSA id b13sm15730012wrt.31.2021.02.06.06.27.44
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 06 Feb 2021 06:27:47 -0800 (PST)
From: "Jose Quaresma" <quaresma.jose@gmail.com>
To: openembedded-core@lists.openembedded.org
Cc: Jose Quaresma <quaresma.jose@gmail.com>
Subject: [PATCH 2/2] selftest/reproducible: remove spirv-tools-dev from exclusion list
Date: Sat,  6 Feb 2021 14:27:11 +0000
Message-Id: <20210206142711.1058717-2-quaresma.jose@gmail.com>
X-Mailer: git-send-email 2.30.0
In-Reply-To: <20210206142711.1058717-1-quaresma.jose@gmail.com>
References: <20210206142711.1058717-1-quaresma.jose@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Signed-off-by: Jose Quaresma <quaresma.jose@gmail.com>
---
 meta/lib/oeqa/selftest/cases/reproducible.py | 1 -
 1 file changed, 1 deletion(-)

diff --git a/meta/lib/oeqa/selftest/cases/reproducible.py b/meta/lib/oeqa/selftest/cases/reproducible.py
index eee494e5cc..deddf6e50b 100644
--- a/meta/lib/oeqa/selftest/cases/reproducible.py
+++ b/meta/lib/oeqa/selftest/cases/reproducible.py
@@ -65,7 +65,6 @@ exclude_packages = [
 	'quilt-ptest',
 	'rsync',
 	'ruby',
-	'spirv-tools-dev',
 	'swig',
 	'syslinux-misc',
 	'systemd-bootchart',
-- 
2.30.0

