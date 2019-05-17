Return-Path: <alex.kanavin@gmail.com>
Received: from mail-wr1-f67.google.com (mail-wr1-f67.google.com
	[209.85.221.67])
	by mail.openembedded.org (Postfix) with ESMTP id 71D987DEC6
	for <openembedded-core@lists.openembedded.org>;
	Fri, 17 May 2019 18:12:09 +0000 (UTC)
Received: by mail-wr1-f67.google.com with SMTP id b18so8029596wrq.12
	for <openembedded-core@lists.openembedded.org>;
	Fri, 17 May 2019 11:12:10 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=from:to:cc:subject:date:message-id:in-reply-to:references;
	bh=p7nqd8Kwzn35oAPigPApPXlCBVAuEKBf8HQsrvE35Dk=;
	b=UpUtuwDxK3LWhywfdS5T99ojPf5GO/eL62z+csUQvkGbzLNnhhudZEHhd9teFNxbN5
	yApZvp5vnIX6zFAvCSC2MFTl3JWASjw3foSo4URcD3M66hTJc9LxrFKq3scp/VQPlLW/
	BCsKw/hFnqe+gbaVKUhghXdN3cZojq7m/OcRdcxzqiPdkaR+1M4uGQPX/9kPx1AtjPg7
	WJA8qNl+0fKiFTKm26kF6aDTS55r7WV6UIsuCF7wzo0pMygNulLdaPWoq/8V8whYGnSz
	EXfnu3EAADYgbaEFidBmKlJAS+TsAtMcPTW+KmoDWZmKYohr6vVdcs3dQivRkEYMzYIZ
	m4rg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
	:references;
	bh=p7nqd8Kwzn35oAPigPApPXlCBVAuEKBf8HQsrvE35Dk=;
	b=FBmcUyOFoIC4q51NCweWgSQbwtO6znU+2fh3t3YbIZ2uj8HhdjMetjS7QUNZIC/ZEh
	7WEnSlAolu6cOpYpBXe6rnwrcwn9p0dFg88uUx/A+fxX348/Ke5/NvZAbwyvzNbKQvZ5
	Ws6tmuMz4Lu/O4xedtob3raU7iEJNsbZ4EyUDC1Qmxp2GL1E0HDLpYSg7G7iGr4GQOwO
	XbGwS2Zl/ceUNM6Ri7kn1v7/LhW9R6WZXBpzSftO37mo9zQN4IQvbVHGJUkvuUuvtKmG
	Qdr1LOEDW4nDSpKqlV5LONM+OpItmVfKeUN6ERRSWPbFpMpJtX4MNkca8SLXGOMiy0a8
	uv9w==
X-Gm-Message-State: APjAAAVlLcz02doMqC9MceWd3cdLzmTk7hYsIYkbKYrsL4CxEKeDVZRx
	3NZ8OejbjHjJ2e4kU7qa4naiw6UY
X-Google-Smtp-Source: APXvYqxucKZw5jhL7MAObwZVl3bhGuC0u2V3tC+3iCZeF43OJ66uVIWZva+mrs+TaEmfMnRZcDzYtw==
X-Received: by 2002:adf:ab45:: with SMTP id r5mr9431881wrc.100.1558116729833; 
	Fri, 17 May 2019 11:12:09 -0700 (PDT)
Received: from alexander-box.luxoft.com ([62.96.135.139])
	by smtp.gmail.com with ESMTPSA id
	c63sm10188093wma.29.2019.05.17.11.12.09
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Fri, 17 May 2019 11:12:09 -0700 (PDT)
From: Alexander Kanavin <alex.kanavin@gmail.com>
To: openembedded-core@lists.openembedded.org
Date: Fri, 17 May 2019 20:11:27 +0200
Message-Id: <20190517181151.44001-13-alex.kanavin@gmail.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20190517181151.44001-1-alex.kanavin@gmail.com>
References: <20190517181151.44001-1-alex.kanavin@gmail.com>
Subject: [PATCH 13/37] gawk: upgrade 4.2.1 -> 5.0.0
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
X-List-Received-Date: Fri, 17 May 2019 18:12:09 -0000

Signed-off-by: Alexander Kanavin <alex.kanavin@gmail.com>
---
 meta/recipes-extended/gawk/{gawk_4.2.1.bb => gawk_5.0.0.bb} | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)
 rename meta/recipes-extended/gawk/{gawk_4.2.1.bb => gawk_5.0.0.bb} (90%)

diff --git a/meta/recipes-extended/gawk/gawk_4.2.1.bb b/meta/recipes-extended/gawk/gawk_5.0.0.bb
similarity index 90%
rename from meta/recipes-extended/gawk/gawk_4.2.1.bb
rename to meta/recipes-extended/gawk/gawk_5.0.0.bb
index 96637523947..b1e1b212a3a 100644
--- a/meta/recipes-extended/gawk/gawk_4.2.1.bb
+++ b/meta/recipes-extended/gawk/gawk_5.0.0.bb
@@ -19,8 +19,8 @@ SRC_URI = "${GNU_MIRROR}/gawk/gawk-${PV}.tar.gz \
            file://run-ptest \
 "
 
-SRC_URI[md5sum] = "0256724a0af50cb83ac92f833488673d"
-SRC_URI[sha256sum] = "2b23d51503b2df9a41aa6fddc6002ad7ebf2a386ac19dc1b6be0dd48b0acf6db"
+SRC_URI[md5sum] = "45366249c13aae2bfb00e8e97c3f39b7"
+SRC_URI[sha256sum] = "2d686c9a5b7ba292bc3fa56bc84a1959d721a9d57970a76413156d4b8f1fc67d"
 
 inherit autotools gettext texinfo update-alternatives
 
-- 
2.17.1


