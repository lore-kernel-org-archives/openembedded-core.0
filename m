Return-Path: <alex.kanavin@gmail.com>
Received: from mail-wr1-f66.google.com (mail-wr1-f66.google.com
	[209.85.221.66])
	by mail.openembedded.org (Postfix) with ESMTP id 862DF7FDC9
	for <openembedded-core@lists.openembedded.org>;
	Thu, 19 Dec 2019 13:23:23 +0000 (UTC)
Received: by mail-wr1-f66.google.com with SMTP id c9so5956750wrw.8
	for <openembedded-core@lists.openembedded.org>;
	Thu, 19 Dec 2019 05:23:24 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=from:to:cc:subject:date:message-id:in-reply-to:references;
	bh=OkWd0YuK014JkjU8WiP/lOlrRF4x8h+Tz9oGD4JY/HQ=;
	b=L7evKT6Pkx5CYNKQnBv7q0y6tD9/J+9YePQVkIK7BhMU3PLiGoZDo+SazUe0tH7+6v
	7/b5POOM6MFx9iti8wjhku9gEuayVIVQtBYk34hg5tsGMeS2O10r18P+dXWCjhG4YATe
	k0fyKaGZVQjnBKL9G2nl9MYu2A/LuyB+h/qVkNYwMKmLlmxkpeDyqvb4e5JhhBN0RlCX
	FOE0u8oSS67BXIU4H2JPwHAkQQq3NZWC1/yyHCZSwAuaIz6cn/6LlQgresnwlyBteHY2
	DAjcd9EbnnsWNYbj1lN9sUdwWaWADuxdfC0HKHtXXCj1kp5PH3Qew6aKUQ9gfGvrgISn
	tEcg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
	:references;
	bh=OkWd0YuK014JkjU8WiP/lOlrRF4x8h+Tz9oGD4JY/HQ=;
	b=Ki+Xb3gZh9iS7vr/ezG3QQqfc39Oc7Sz3jBZjRJsTTkJq9rNkckU3eBhB1c6RHPN4Z
	ppDgMWowaSmXjyBJu3Nnelmg3zN9UGstvdwBQdqxy/d5JZiNWSef0dwcolKHdk4SRYFg
	lhJpPC2/3JKEAdE5T4OiFVQI8PsvLyOXH1RNeNtN2KQKjPQB58KMueQsLWv1POUxGVww
	PvzsPbh5R9trH8VLA91BrMqAw/gcejKahilD/4nmHijZGlg/FVmbxYbur7XcezZA/X+k
	0jVJi+PFHu4hEZ4yfI7wGMA77J3TFrm7l3RPpapLhHsXZzeBuASROKHhs5SBgiLfPMZN
	5h8w==
X-Gm-Message-State: APjAAAXjjHtiNkW0w94drmPIRVBFVzrXFfllMX4RRRYnd/9PylUg6aI1
	aLyynv3Xd6gly359VPhIPmEdHry2A94=
X-Google-Smtp-Source: APXvYqwoyIL/AOYDDsj3xeEsjXmP+9WuNw/X469hX3q4t2U7Cd5Rg7a+Cf0nz/9r8OUqN5fOp42xpw==
X-Received: by 2002:a5d:620b:: with SMTP id y11mr9295225wru.230.1576761803681; 
	Thu, 19 Dec 2019 05:23:23 -0800 (PST)
Received: from alexander-box.rd.corpintra.net ([141.113.66.202])
	by smtp.gmail.com with ESMTPSA id f17sm6182584wmc.8.2019.12.19.05.23.21
	(version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
	Thu, 19 Dec 2019 05:23:22 -0800 (PST)
From: Alexander Kanavin <alex.kanavin@gmail.com>
To: openembedded-core@lists.openembedded.org
Date: Thu, 19 Dec 2019 14:22:54 +0100
Message-Id: <20191219132301.80034-9-alex.kanavin@gmail.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20191219132301.80034-1-alex.kanavin@gmail.com>
References: <20191219132301.80034-1-alex.kanavin@gmail.com>
Subject: [PATCH 09/16] librepo: upgrade 1.11.0 -> 1.11.1
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
X-List-Received-Date: Thu, 19 Dec 2019 13:23:24 -0000

Signed-off-by: Alexander Kanavin <alex.kanavin@gmail.com>
---
 .../librepo/{librepo_1.11.0.bb => librepo_1.11.1.bb}            | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta/recipes-devtools/librepo/{librepo_1.11.0.bb => librepo_1.11.1.bb} (93%)

diff --git a/meta/recipes-devtools/librepo/librepo_1.11.0.bb b/meta/recipes-devtools/librepo/librepo_1.11.1.bb
similarity index 93%
rename from meta/recipes-devtools/librepo/librepo_1.11.0.bb
rename to meta/recipes-devtools/librepo/librepo_1.11.1.bb
index 30c8a5c55d5..dbf1016456e 100644
--- a/meta/recipes-devtools/librepo/librepo_1.11.0.bb
+++ b/meta/recipes-devtools/librepo/librepo_1.11.1.bb
@@ -8,7 +8,7 @@ SRC_URI = "git://github.com/rpm-software-management/librepo.git \
            file://0004-Set-gpgme-variables-with-pkg-config-not-with-cmake-m.patch \
            "
 
-SRCREV = "497f5eb2293662835bed6bdb0f43521788b2cebe"
+SRCREV = "5ade10012d40fad27a7aa1085091c2c5fdd099ff"
 
 S = "${WORKDIR}/git"
 
-- 
2.17.1


