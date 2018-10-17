Return-Path: <anibal.limon@linaro.org>
Received: from mail-pg1-f195.google.com (mail-pg1-f195.google.com
	[209.85.215.195])
	by mail.openembedded.org (Postfix) with ESMTP id 7AE9679B5B
	for <openembedded-core@lists.openembedded.org>;
	Wed, 17 Oct 2018 23:00:51 +0000 (UTC)
Received: by mail-pg1-f195.google.com with SMTP id f8-v6so13224513pgq.5
	for <openembedded-core@lists.openembedded.org>;
	Wed, 17 Oct 2018 16:00:52 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
	h=from:to:cc:subject:date:message-id:in-reply-to:references
	:mime-version:content-transfer-encoding;
	bh=K2aHj+2viIIJ0GTaBiIrcK4oAi2YyPQdlCV7xihuww8=;
	b=gRSQBZGCd5esQqTVKWYYwZyxjxCQaMpZU9lXCd4jiB8YVqrzHApxq2fb5Uz3859byK
	qR80r4Eu8JgRiRB/lDnAjZMhBK8IxoYAKFjy8jkH1bEH6cfWNBFEfxj2A81Z6elvs9Vm
	/AeoYi6KApeKm/8WiNYXFxw0eRP4D3+QLebig=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
	:references:mime-version:content-transfer-encoding;
	bh=K2aHj+2viIIJ0GTaBiIrcK4oAi2YyPQdlCV7xihuww8=;
	b=Bk/Ewi+jdWwKv/gLayZzrKMh4epyWyt3HOsnsZikR/1xHqIJjxeHtW3qH5tGEB6Pei
	ybLk1rIv3d8Yzya/WOsPIcEkFRbHtQSTAIuSSqklRf0MfEKmztmZpQ0d2LzdGX6lpuV7
	bY0nxAqaCd4hqAEhLFTthhwpq+3bInAO8WbJgOcMhnwhVfwgWxEH/da1volnEI/FAcDu
	hAYL/WUQL0B6CZLlP8kvxeV1qJlj/JE6OiPLLuVgEqqfDAXFqn/fSqYx5w5rKUMcH/2t
	fQMoj8Nn28QqCST/1pRfN2tmNuVLhKrgDxowH8DmBarrHBWi4k7YzinhtdtAhbk0lDYT
	/Rjg==
X-Gm-Message-State: ABuFfoj80YODeS3pQfcmvOBBW5AlC5qQ84PkwztpdtFKNovlMwFJvDyv
	gdrKEM6/E8NEmjCpx7la1xQYB6v8UB0=
X-Google-Smtp-Source: ACcGV61wKXzfHL2VaQAxEMMGXIF98M1KHtAoojmK90kHSR9u68YxV2GwZpzNORJ6pLnnREgn5ngHrw==
X-Received: by 2002:a63:7c5e:: with SMTP id
	l30-v6mr25828046pgn.45.1539817252340; 
	Wed, 17 Oct 2018 16:00:52 -0700 (PDT)
Received: from blackbox.Home ([200.68.141.5]) by smtp.gmail.com with ESMTPSA id
	i71-v6sm26467929pgc.87.2018.10.17.16.00.50
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Wed, 17 Oct 2018 16:00:51 -0700 (PDT)
From: =?UTF-8?q?An=C3=ADbal=20Lim=C3=B3n?= <anibal.limon@linaro.org>
To: openembedded-core@lists.openembedded.org
Date: Wed, 17 Oct 2018 18:00:44 -0500
Message-Id: <20181017230044.24098-2-anibal.limon@linaro.org>
X-Mailer: git-send-email 2.11.0
In-Reply-To: <20181017230044.24098-1-anibal.limon@linaro.org>
References: <20181017230044.24098-1-anibal.limon@linaro.org>
MIME-Version: 1.0
Subject: [PATCH 2/2] meta/classes/testexport: Remove __pycache__ from exported tests
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
X-List-Received-Date: Wed, 17 Oct 2018 23:00:51 -0000
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

The __pycache__ is created based on python3 version in the build machine
and isn't a garantee to be useful on the system that runs exported tests.

Signed-off-by: Aníbal Limón <anibal.limon@linaro.org>
---
 meta/classes/testexport.bbclass | 5 +++++
 1 file changed, 5 insertions(+)

diff --git a/meta/classes/testexport.bbclass b/meta/classes/testexport.bbclass
index 8b01504d3a..f38d093e81 100644
--- a/meta/classes/testexport.bbclass
+++ b/meta/classes/testexport.bbclass
@@ -131,6 +131,11 @@ def copy_needed_files(d, tc):
     shutil.copy2(image_manifest, os.path.join(test_data_path, os.path.basename(image_manifest)))
     shutil.copy2(tdname, os.path.join(test_data_path, os.path.basename(tdname)))
 
+    for subdir, dirs, files in os.walk(export_path):
+        for dir in dirs:
+            if dir == '__pycache__':
+                shutil.rmtree(os.path.join(subdir, dir))
+
     # Create tar file for common parts of testexport
     create_tarball(d, "testexport.tar.gz", d.getVar("TEST_EXPORT_DIR"))
 
-- 
2.11.0


