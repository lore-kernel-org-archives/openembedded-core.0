Return-Path: <alex.kanavin@gmail.com>
Received: from mail-ed1-f46.google.com (mail-ed1-f46.google.com
	[209.85.208.46])
	by mail.openembedded.org (Postfix) with ESMTP id 5480B608BC
	for <openembedded-core@lists.openembedded.org>;
	Thu, 30 Jan 2020 14:47:04 +0000 (UTC)
Received: by mail-ed1-f46.google.com with SMTP id v28so4024991edw.12
	for <openembedded-core@lists.openembedded.org>;
	Thu, 30 Jan 2020 06:47:05 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=from:to:cc:subject:date:message-id:in-reply-to:references
	:mime-version:content-transfer-encoding;
	bh=pxJnUcaMozOuZOvTpulUg2mXu0Ws6ub72oE5CmAqHJM=;
	b=YbN09/U6M1rCJtuPBFtDSdIfUKil6sp32b2kWra2mX6NZPPD6VkuWLFQ2lFw05Uy5v
	ukGy1WNjOjZFcGxUSWeKCbCWVUZaG+YWaBYy/DyTbAZgYUEofBIygccMWbYKpF8SozQ1
	d0NlMcpLTLOf/4jhRIZF3yQe+29fpFUh/VqLj67Ab0J6HFlLqCPkBvH53/7EJOKIVg+D
	DqM6MGN26C3l+4XCfzWXXCi1CB+AG7pCwWWB/eg0/wiMbTFcGxm/ZaRjHKGhR6WTfbzS
	tJX3ic8cj96DJ4k+vHa0A9Nrs4A6yAkSItewx8rsaK2heg07/NR3TN9LP39ha/f7QpWf
	/5Qg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
	:references:mime-version:content-transfer-encoding;
	bh=pxJnUcaMozOuZOvTpulUg2mXu0Ws6ub72oE5CmAqHJM=;
	b=KCYVOJ/dw4qdCikJ81W7Es4vVf2gKjCaTFfqHN46rQDsVLQcruQ7KSsJcAUcqe7Io3
	L2g90JVvu753wpYgbyXvhPg/JZDDvokXEn1iKu1Q3jnwViC1TRYbmoY2YCm6A+0XdMJe
	SzjvP0imdnAboQLkmmtbXZ9yzb1qBNs5YoDy3KOvOVwHAIWLOaPVdhaZz3WRLyHshkXP
	0IlwiiI/eE5En45FjL6kzL/9fu2kinUr8rFvulweCDxBegslcOYhK2jayB74caP6UfR9
	BhN7PWsZIT+4nXhVsPzjUOdash91T5LNQHWJnZ3Dm9eFgy21im5E7t3aScoKwIEVTEud
	00Ng==
X-Gm-Message-State: APjAAAVWA4bsht1wiHMXpAE+cXnAzx3SMWOYahD9OiqnfjmyjRmhysKZ
	62y8CaEJMVMw+Vj77O5xEQTfKI08
X-Google-Smtp-Source: APXvYqzMVo53/rnZX+XUCD5awSTVoPpNYmeaE+BcVmeBOx9a+gQyaRNrUbD0LojCVxFIxY5PKUSJLQ==
X-Received: by 2002:a5d:45c4:: with SMTP id b4mr33315672wrs.303.1580288895824; 
	Wed, 29 Jan 2020 01:08:15 -0800 (PST)
Received: from linux-f9zs.box (cable-95-168-152-69.cust.telecolumbus.net.
	[95.168.152.69]) by smtp.gmail.com with ESMTPSA id
	a62sm1550224wmh.33.2020.01.29.01.08.15
	(version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
	Wed, 29 Jan 2020 01:08:15 -0800 (PST)
From: Alexander Kanavin <alex.kanavin@gmail.com>
To: openembedded-core@lists.openembedded.org
Date: Wed, 29 Jan 2020 10:07:26 +0100
Message-Id: <20200129090738.1398-12-alex.kanavin@gmail.com>
X-Mailer: git-send-email 2.25.0
In-Reply-To: <20200129090738.1398-1-alex.kanavin@gmail.com>
References: <20200129090738.1398-1-alex.kanavin@gmail.com>
MIME-Version: 1.0
Subject: [PATCH 12/24] piglit: upgrade to latest revision
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
X-List-Received-Date: Fri, 31 Jan 2020 09:28:16 -0000
Content-Transfer-Encoding: 8bit

Signed-off-by: Alexander Kanavin <alex.kanavin@gmail.com>
---
 meta/recipes-graphics/piglit/piglit_git.bb | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta/recipes-graphics/piglit/piglit_git.bb b/meta/recipes-graphics/piglit/piglit_git.bb
index f53098c45de..d0d83316977 100644
--- a/meta/recipes-graphics/piglit/piglit_git.bb
+++ b/meta/recipes-graphics/piglit/piglit_git.bb
@@ -10,7 +10,7 @@ SRC_URI = "git://gitlab.freedesktop.org/mesa/piglit.git;protocol=https \
            "
 UPSTREAM_CHECK_COMMITS = "1"
 
-SRCREV = "603cfb97542a411e8957a0d689d8b28cf8b9ef4d"
+SRCREV = "6126c2d4e476c7770d216ffa1932c10e2a5a7813"
 # (when PV goes above 1.0 remove the trailing r)
 PV = "1.0+gitr${SRCPV}"
 
-- 
2.25.0


