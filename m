Return-Path: <akuster808@gmail.com>
Received: from mail-pj1-f65.google.com (mail-pj1-f65.google.com
	[209.85.216.65])
	by mail.openembedded.org (Postfix) with ESMTP id B21AF7FBFF
	for <openembedded-core@openembedded.org>;
	Mon, 20 Jan 2020 06:38:25 +0000 (UTC)
Received: by mail-pj1-f65.google.com with SMTP id d5so6287334pjz.5
	for <openembedded-core@openembedded.org>;
	Sun, 19 Jan 2020 22:38:27 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=from:to:subject:date:message-id:in-reply-to:references;
	bh=y/3KXMxDz25N3o+xXUPPFWtsrODajH0HiYbIlzT0ro0=;
	b=PNNa/AVOMMN4Fq1suRDiyVtKhSVGCiPSz7ZNuQ8L9c1pZc5CQrnY9VBxVLVt4vX7xf
	uALDgaFjh8IB8wYj6lZDoO4Q52V80R0Jquhx4DDSHWxO08cyCCxXlMS4Bsn0tz8Punoj
	6zHgelM20NYHy+PyMhflSQjOG+9vI5jGBQag79QneXIs8AyugX3nZjypC6gs4UiSj3z5
	5acc5IQ4IX0kjmW/jy4cmXnHK0nyKaRjBU7/M3a9tQx2kewjSEi+C5Rnv/7F1kcDFwA2
	m20cIeOYQ25KVHpwuZN0z/6Hconl/ki3QFF0o/DusKCmIbeBHNbkl1MKYfTSwNjCNLLu
	rXDw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
	:references;
	bh=y/3KXMxDz25N3o+xXUPPFWtsrODajH0HiYbIlzT0ro0=;
	b=S0kQgmdPgJ3fATbxWYPvEp3LLEHHHIm0MQnjdkr5082RPy+Xb+36ZcIrHrmNoQe3X+
	hw2lZ0kNr4H0jfzgll2ARmzI0sBFAZxkj11nJEHxQZV//V5dzgq6Zz2wn3ThieAR0Lr+
	aKVycW4KqVWwacHBnuIBMkColRllQplnkYh2+YgQhGq9DNYd8EIE+xLKNOLzN6PnmL77
	YqyLGKNru+nwRkZPRnNiV8E7iKpjYCXJRvhLQ0DXys0yekbCEZYTuUM3zEMzPZ6SbjUc
	6rv/FnquBiKIC236Bi2e20lS6f9gNFBHeeCVQW8VE5p8nMOBzJCr2fe10adNVd2TQ+B+
	YuOQ==
X-Gm-Message-State: APjAAAVeTn760L8m0dW+G1ERCAWlAdpnojHuXFLDwZp1Wv2YaJnvRGOf
	z79PqK8hBd0yRyecxheqhlo+97QX
X-Google-Smtp-Source: APXvYqyWYEuNRAwSjaBuTjZhzXtdtLQrYvA5vmM2JrWMuQxKD4K+JqGGKt5QjJ1fm4ynzr9ZS1cQUw==
X-Received: by 2002:a17:902:8a85:: with SMTP id
	p5mr13885272plo.154.1579502306592; 
	Sun, 19 Jan 2020 22:38:26 -0800 (PST)
Received: from akuster-ThinkPad-T460s.mvista.com
	([2601:202:4180:a5c0:b5ff:6d3b:2415:6395])
	by smtp.gmail.com with ESMTPSA id
	p28sm36310484pgb.93.2020.01.19.22.38.25
	for <openembedded-core@openembedded.org>
	(version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
	Sun, 19 Jan 2020 22:38:26 -0800 (PST)
From: Armin Kuster <akuster808@gmail.com>
To: openembedded-core@openembedded.org
Date: Sun, 19 Jan 2020 22:38:18 -0800
Message-Id: <f0ea8b49a183d9340aaf0c60ee959aa8ec3c041c.1579502114.git.akuster808@gmail.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <cover.1579502114.git.akuster808@gmail.com>
References: <cover.1579502114.git.akuster808@gmail.com>
Subject: [zeus 2/5] populate_sdk_ext.bbclass: No longer needed to clean away conf/sanity_info
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
X-List-Received-Date: Mon, 20 Jan 2020 06:38:25 -0000

From: Peter Kjellerstedt <peter.kjellerstedt@axis.com>

Since the sanity_info file has moved from the conf directory to the
cache directory, there is no longer any need to clean it away
explicitly in clean_esdk_builddir() since the whole cache directory is
already cleaned away anyway.

Signed-off-by: Peter Kjellerstedt <peter.kjellerstedt@axis.com>
Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
(cherry picked from commit 40c30990e1be72130819c040fe471e2bdc0c6e7d)
Signed-off-by: Anuj Mittal <anuj.mittal@intel.com>
---
 meta/classes/populate_sdk_ext.bbclass | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta/classes/populate_sdk_ext.bbclass b/meta/classes/populate_sdk_ext.bbclass
index 9fda1c9e78..5657af4b6a 100644
--- a/meta/classes/populate_sdk_ext.bbclass
+++ b/meta/classes/populate_sdk_ext.bbclass
@@ -122,7 +122,7 @@ SDK_TITLE_task-populate-sdk-ext = "${@d.getVar('DISTRO_NAME') or d.getVar('DISTR
 def clean_esdk_builddir(d, sdkbasepath):
     """Clean up traces of the fake build for create_filtered_tasklist()"""
     import shutil
-    cleanpaths = 'cache conf/sanity_info tmp'.split()
+    cleanpaths = ['cache', 'tmp']
     for pth in cleanpaths:
         fullpth = os.path.join(sdkbasepath, pth)
         if os.path.isdir(fullpth):
-- 
2.17.1


