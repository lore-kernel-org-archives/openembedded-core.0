Return-Path: <alex.kanavin@gmail.com>
Received: from mail-wr1-f66.google.com (mail-wr1-f66.google.com
	[209.85.221.66])
	by mail.openembedded.org (Postfix) with ESMTP id 32C8D7DFBB
	for <openembedded-core@lists.openembedded.org>;
	Fri, 17 May 2019 18:12:06 +0000 (UTC)
Received: by mail-wr1-f66.google.com with SMTP id w8so8081391wrl.6
	for <openembedded-core@lists.openembedded.org>;
	Fri, 17 May 2019 11:12:07 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=from:to:cc:subject:date:message-id:in-reply-to:references;
	bh=JZcO0BwK3t23xoOeLjfj9k/OZ6UK+SCICkpQi9jQ4IM=;
	b=HxUR3vk9RFEd3TVmU61cA8CkQmtBA/4AMjC1Fa22zvCQjd7PQdy3OfCNFdYpjIWfZB
	9Ch80aSZ8V79y3odm7aIxYbsdT5aQyxECUN5F/+v5Jxc8Hq5BJsyye2QSbfSW/m9Tx5O
	X/YJ8U65TlWV4OOSAgpfiaS1JrZCwKjpDo3OGYRqQLuewWHc5kScZhFXn+qZmY9vwALd
	W+S0RK/Ndxgjy0jLYjbABYO16reVIRWUzi2f6QQy4GlrddCpH87arEvd9CT3An9RIkys
	qJdb1uBpcnHgayG9JGwN1/Vhk079OCoq2QiTcHpLQwhN0l+ukzPKEhu11serNkWeVkUA
	eqmw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
	:references;
	bh=JZcO0BwK3t23xoOeLjfj9k/OZ6UK+SCICkpQi9jQ4IM=;
	b=kQVVbNQEcjKua/nJYCruWx7II/4epgcSJU/9nCmPKxtwdmnmbAH7Nmlhvk5S08OGnq
	/MY1brnXWyxkqS7Y5BYYqph9VfSXHbmUbL6Four7qFXDSak5MGCI0py1JDvL5SHo7V4T
	O0pdoY2FAgsQCFThhUWIvkKb5ds9E5EjGjDn/ZkooeyRKWZ7yXzNoVhX37+f+qx+/9kJ
	mS9auYYSd+rS+lmP6DQqpcZyPw5333jzFODccM4qc9DGzRGOSjEGi0kNl/l3VvL0ClxC
	C5l1oCoMd6Pl+b0NDDuQXxiYYsIyx0Lo0TZ+hh1dJPNMaYZAC5SiuZfvIjtfEWpxTyVz
	1oow==
X-Gm-Message-State: APjAAAXamEel7yXdcSJe3M+K9anDqsz98XMZvnXYm+2K4eIXNMOPNC2D
	CYW3vY5Y4qUOeJvTHMy972Cdbl78
X-Google-Smtp-Source: APXvYqyHFeK2msoFcdMvf5a8GhbzF/whv/FLbaF6Dg0LmnOBCi/bYAYSdUSgJHUMY/kdDu7P+F9R5w==
X-Received: by 2002:a5d:4e09:: with SMTP id p9mr13011959wrt.218.1558116726777; 
	Fri, 17 May 2019 11:12:06 -0700 (PDT)
Received: from alexander-box.luxoft.com ([62.96.135.139])
	by smtp.gmail.com with ESMTPSA id
	c63sm10188093wma.29.2019.05.17.11.12.05
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Fri, 17 May 2019 11:12:06 -0700 (PDT)
From: Alexander Kanavin <alex.kanavin@gmail.com>
To: openembedded-core@lists.openembedded.org
Date: Fri, 17 May 2019 20:11:24 +0200
Message-Id: <20190517181151.44001-10-alex.kanavin@gmail.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20190517181151.44001-1-alex.kanavin@gmail.com>
References: <20190517181151.44001-1-alex.kanavin@gmail.com>
Subject: [PATCH 10/37] nss: upgrade 3.43 -> 3.44
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
X-List-Received-Date: Fri, 17 May 2019 18:12:06 -0000

Signed-off-by: Alexander Kanavin <alex.kanavin@gmail.com>
---
 meta/recipes-support/nss/{nss_3.43.bb => nss_3.44.bb} | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)
 rename meta/recipes-support/nss/{nss_3.43.bb => nss_3.44.bb} (98%)

diff --git a/meta/recipes-support/nss/nss_3.43.bb b/meta/recipes-support/nss/nss_3.44.bb
similarity index 98%
rename from meta/recipes-support/nss/nss_3.43.bb
rename to meta/recipes-support/nss/nss_3.44.bb
index f8cf5a46afb..4205d79485e 100644
--- a/meta/recipes-support/nss/nss_3.43.bb
+++ b/meta/recipes-support/nss/nss_3.44.bb
@@ -33,8 +33,8 @@ SRC_URI = "http://ftp.mozilla.org/pub/mozilla.org/security/nss/releases/${VERSIO
            file://system-pkcs11.txt \
            "
 
-SRC_URI[md5sum] = "67c8fa282c32cb56117fdd530dd77001"
-SRC_URI[sha256sum] = "f30bc1b7330887b75de9fec37dbc173001758dc43fb095ffbc45dac4093fe2ca"
+SRC_URI[md5sum] = "e9222b9573452b9f4e6ff4915d6407c2"
+SRC_URI[sha256sum] = "a5620e59b6eeedfd5a12c9298b50ad92e9898b223e214eb675e36f4ffb5b6aff"
 
 UPSTREAM_CHECK_URI = "https://developer.mozilla.org/en-US/docs/Mozilla/Projects/NSS/NSS_Releases"
 UPSTREAM_CHECK_REGEX = "NSS_(?P<pver>.+)_release_notes"
-- 
2.17.1


