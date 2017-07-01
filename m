Return-Path: <raj.khem@gmail.com>
Received: from mail-pf0-f194.google.com (mail-pf0-f194.google.com
	[209.85.192.194])
	by mail.openembedded.org (Postfix) with ESMTP id 2A28478288
	for <openembedded-core@lists.openembedded.org>;
	Sat,  1 Jul 2017 14:23:41 +0000 (UTC)
Received: by mail-pf0-f194.google.com with SMTP id s66so20428033pfs.2
	for <openembedded-core@lists.openembedded.org>;
	Sat, 01 Jul 2017 07:23:43 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=from:to:cc:subject:date:message-id:in-reply-to:references;
	bh=KvYtoumU+G8w9eYfTEag8zdudKNPD0Bi7q+6oJdQims=;
	b=ZRciF8Kx4vbL/Odm2hOUFRkYRe0YjnQzmQ/TZT28ZINmnFswY2ZYyQecghTSnQ7oxI
	LwykG7V+wmz/Id9SqIb4xq6MtjoILR01Bi2UyTtxsZV9mD2bXJ+POCQfCj4pJLiA/K2A
	F/lPrx+8+MWoiuafA8N67fRHZlV6WjkfYZw+59ZYq2tEHdk6WGVy3uyl8z9vEuaUXk3X
	u20mzLFcMk6FnX5RM2HT5Lct1puA0gN8OgQ3aPv0nMlX6pURqbShW1uFkviPDcHsYPvq
	37B6UTdJ5JgKBGFNSy8vM1vot0ERwVDrWguDLXqMfnGh7ON0kTjgWgf6sqgusbPhp+3X
	BmFQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
	:references;
	bh=KvYtoumU+G8w9eYfTEag8zdudKNPD0Bi7q+6oJdQims=;
	b=imBHIdCMVdpYyoF9Jmfv9eEmJ1F4knLKlDn79uvOxilaOwTn9LKeIP9FuodhCA6qnk
	wDFsMsuib3/BLoVQXdpRqT5LF5hj1ywiUeYeOBTQJrXonSj1mUWYUulMzYSCeRED49fb
	F0wsrcuGkzJOmFYz49QVYcXs4QjZYCwXgAFlB/nIhtK2qU6m7phYiPVoddRLQByLAO7g
	OAaZghzunYFXQ1/iHtgvIdGRKE7ko6CWRqFX4cOIOyYoKpi1kAYotwlS8G5NUZHZh4TY
	tcdZwD6CcgPwVHcVSiDwlQeEtds7iRzVe3cMHI0Qs0riyhfDG9gfFUeUtr1ByMeMx0I+
	3Emg==
X-Gm-Message-State: AIVw113ldmCYckVE4aCjAfqnJSHMEgkzi+SC5gZz5fbBO4dhDVX6aeT4
	C9tnalWraoeYcxD3
X-Received: by 10.99.102.68 with SMTP id a65mr1055810pgc.252.1498919023091;
	Sat, 01 Jul 2017 07:23:43 -0700 (PDT)
Received: from localhost.localdomain ([2601:646:8882:b8c::3df3])
	by smtp.gmail.com with ESMTPSA id
	17sm25026909pfn.84.2017.07.01.07.23.41
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Sat, 01 Jul 2017 07:23:42 -0700 (PDT)
From: Khem Raj <raj.khem@gmail.com>
To: openembedded-core@lists.openembedded.org
Date: Sat,  1 Jul 2017 07:23:06 -0700
Message-Id: <d0aa41ee8eef4b5f2d6290aaa2344dbda976816e.1498893436.git.raj.khem@gmail.com>
X-Mailer: git-send-email 2.13.2
In-Reply-To: <cover.1498893436.git.raj.khem@gmail.com>
References: <cover.1498893436.git.raj.khem@gmail.com>
Subject: [PATCH 03/19] glibc: Enable obsoleted nsl
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
X-List-Received-Date: Sat, 01 Jul 2017 14:23:42 -0000

libnsl has been obsoleted in 2.26 and will be removed in future
until them we enable it

Signed-off-by: Khem Raj <raj.khem@gmail.com>
---
 meta/recipes-core/glibc/glibc_2.25.90.bb | 1 +
 1 file changed, 1 insertion(+)

diff --git a/meta/recipes-core/glibc/glibc_2.25.90.bb b/meta/recipes-core/glibc/glibc_2.25.90.bb
index b2f4db5181..bdbfd40ada 100644
--- a/meta/recipes-core/glibc/glibc_2.25.90.bb
+++ b/meta/recipes-core/glibc/glibc_2.25.90.bb
@@ -76,6 +76,7 @@ EXTRA_OECONF = "--enable-kernel=${OLDEST_KERNEL} \
                 --with-headers=${STAGING_INCDIR} \
                 --without-selinux \
                 --enable-obsolete-rpc \
+                --enable-obsolete-nsl \
                 --enable-tunables \
                 --enable-bind-now \
                 --enable-stack-protector=strong \
-- 
2.13.2


