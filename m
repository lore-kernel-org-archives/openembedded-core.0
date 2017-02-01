Return-Path: <liu.ming50@gmail.com>
Received: from mail-it0-f68.google.com (mail-it0-f68.google.com
	[209.85.214.68])
	by mail.openembedded.org (Postfix) with ESMTP id 3645971C90
	for <openembedded-core@lists.openembedded.org>;
	Wed,  1 Feb 2017 12:04:45 +0000 (UTC)
Received: by mail-it0-f68.google.com with SMTP id f200so2210461itf.3
	for <openembedded-core@lists.openembedded.org>;
	Wed, 01 Feb 2017 04:04:46 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=from:to:cc:subject:date:message-id;
	bh=yJGjFmLO748AaDHVVUWY5HndHKUFWbkJf2/l/HthA9M=;
	b=hWwlnCISEejMF3jYRwxbruqLncX3wKUMKQcYzsu4pz/0YaI7XHAbohf9L9n2Bja2Zd
	Gzx9dZKNv8aQoVBipTXNjpfW6li+YuD57OSyN0jqCotQd3Q6MATSWBajo6U7PcCyZkAN
	agswW81L1glZvseP99CkMGOw5NVdDOCit1JoDVz3fN5jpsqMz3zPzihLKnoi9ysHQ1p9
	CXd4jr3HV0/wxmCXdtXtcDuUT5t+4xkVAg71BwONulP/Igbs0ZDeQO38ON531mj3TWL7
	5oGvWgJ2oCtk5yq+OZ3eH1ySdcjqDWavUDAP8wBCA4UpUXnAnwbg6lwUu3ziWq3IR454
	TglQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:cc:subject:date:message-id;
	bh=yJGjFmLO748AaDHVVUWY5HndHKUFWbkJf2/l/HthA9M=;
	b=SeFvGxjQU+1oFgBJs/8gHegeg1lC+VW9RydKrw4hPM9lMCVZu1w6ECNpEnzvB0A2WH
	+vw9uGpWDAH4yOeP0b4SlhNg3KyG4TmwbPE9KmkNPwrzQL5bm9hf2t1WYwX9XTbSxIhK
	QARAaJDnCl7pCYSNdPkiTLJFTksztfaPf45Zy3Eb2bwZVXnVdhhq0j9Sxb/d7Di8HsW8
	WJ8LXnrYfgbS7wMtbM4CClEVHQyuRwPimS8Wnk/PGzxSOzaDvib7uqN8hZkgwmxul6pQ
	JtGmOpQfQlyEa9Yp47fdcFuRGz8HvwLN6BQTCz9d1I/lMV4otOPHLvVfGXgFq9WCpk9L
	jxew==
X-Gm-Message-State: AIkVDXK1lnXj3ZqD8XJQf3Amw9EfJlmqC/3KhuJIt1AMDfVIRoszSEoJRC3m2X9gs1uynA==
X-Received: by 10.36.92.132 with SMTP id q126mr1874595itb.108.1485950686032;
	Wed, 01 Feb 2017 04:04:46 -0800 (PST)
Received: from peterliu-Precision-M4800.emea.group.atlascopco.com
	([106.116.224.150])
	by smtp.gmail.com with ESMTPSA id j19sm9920975iti.3.2017.02.01.04.04.44
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
	Wed, 01 Feb 2017 04:04:45 -0800 (PST)
From: liu.ming50@gmail.com
To: openembedded-core@lists.openembedded.org
Date: Wed,  1 Feb 2017 13:04:19 +0100
Message-Id: <1485950659-10922-1-git-send-email-liu.ming50@gmail.com>
X-Mailer: git-send-email 1.9.1
Cc: Ming Liu <peter.x.liu@external.atlascopco.com>
Subject: [PATCH] scripts/runqemu: fix a typo
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
X-List-Received-Date: Wed, 01 Feb 2017 12:04:46 -0000

From: Ming Liu <peter.x.liu@external.atlascopco.com>

Signed-off-by: Ming Liu <peter.x.liu@external.atlascopco.com>
---
 scripts/runqemu | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/scripts/runqemu b/scripts/runqemu
index 31eff5a..d74f252 100755
--- a/scripts/runqemu
+++ b/scripts/runqemu
@@ -96,7 +96,7 @@ Examples:
 """)
 
 def check_tun():
-    """Check /dev/net/run"""
+    """Check /dev/net/tun"""
     dev_tun = '/dev/net/tun'
     if not os.path.exists(dev_tun):
         raise Exception("TUN control device %s is unavailable; you may need to enable TUN (e.g. sudo modprobe tun)" % dev_tun)
-- 
1.9.1


