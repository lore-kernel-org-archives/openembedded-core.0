Return-Path: <akuster808@gmail.com>
Received: from mail-pf1-f177.google.com (mail-pf1-f177.google.com
	[209.85.210.177])
	by mail.openembedded.org (Postfix) with ESMTP id A39B1916B7
	for <openembedded-core@openembedded.org>;
	Sun, 26 Jan 2020 16:24:58 +0000 (UTC)
Received: by mail-pf1-f177.google.com with SMTP id i23so3754721pfo.2
	for <openembedded-core@openembedded.org>;
	Sun, 26 Jan 2020 08:25:00 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=from:to:subject:date:message-id:in-reply-to:references;
	bh=k4dkoc7wf2rbH8idE5u3k0QPjqo6/wXlm+O+FOk53kc=;
	b=Ou3+43zd14pz881r5Bj7fHb6/DVsJOyeF3BjJjTWRZrbaWawm402fWbgVkw0F+2HIz
	AqXOwQOztS+WjpvM8nstbe8pIYkJH/3biiyLRDALlQuCtqJwc74Xx+dghKzU/CtLuWNm
	0FQufv1akbyhaTKSW/i6KKRSfzyljmWl/RgaYVyWnLBoNj1FAbUDKT5ea9Ccdu6GYasu
	lsEUGEoGQwXB7GWwUJK2I0rogE4VZdI7c0bHy0/y6qUmYdcz5MygADbyE/ZoJc8GUMzQ
	3Ag8Qtw6FIr7KlqUhxcUQaAPlPZOZIVUBA8ewJoeOWu1GqFaaJLFGZJeoQFLDmMjemNE
	VcFQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
	:references;
	bh=k4dkoc7wf2rbH8idE5u3k0QPjqo6/wXlm+O+FOk53kc=;
	b=KAwK8LFzYK+XelVW1s0mooC2ipwSKD3cmNQQvmzrWsarnAh/wtiEjkGg66t8q1L+Ox
	7cqg5FAeiytWxsON79epHJ5xQ7miHIyvWQ0xEyBE2gcOlYWsrK0SmU9fxMwb+/JplWOV
	My0qGy0xDvBE1nmONqkUj/InLR52Nm090Oios+EN5sNag2OYYoHIaO2WYKEuftcLTloR
	axs1xTGs9ZRsMCjgH7m8SgalrBQf6AFu+77ChmhiQKhKv0gdktspxCfy24gBndUt9YWE
	tZuU3WMzDq23EzX/vkeEutIgZG8LVWQPOoFpoV3FOyrG1weD+ugGehUYwwo9/czOCtSL
	ghBQ==
X-Gm-Message-State: APjAAAUfmtQxwBaR0HlUsnm5en/M0SDMiKNoM160auxWEmiSwD461ktZ
	1zyMOVix21QzfJt7xorA2H+XLhGi
X-Google-Smtp-Source: APXvYqx+DvQgJJLS50yEYODWo/PUeassrgLEpsNkuqTqQw0CyyxvtxFcyp0EzQGTvxwLLqEHgqtjaQ==
X-Received: by 2002:aa7:961b:: with SMTP id q27mr12566849pfg.23.1580055899641; 
	Sun, 26 Jan 2020 08:24:59 -0800 (PST)
Received: from akuster-ThinkPad-T460s.mvista.com
	([2601:202:4180:a5c0:bddb:633c:e712:cec2])
	by smtp.gmail.com with ESMTPSA id
	f43sm13046556pje.23.2020.01.26.08.24.59
	for <openembedded-core@openembedded.org>
	(version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
	Sun, 26 Jan 2020 08:24:59 -0800 (PST)
From: Armin Kuster <akuster808@gmail.com>
To: openembedded-core@openembedded.org
Date: Sun, 26 Jan 2020 08:24:28 -0800
Message-Id: <262ac0c4d534b1858b81c7d69b6ff57c5d3a4559.1580055797.git.akuster808@gmail.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <cover.1580055797.git.akuster808@gmail.com>
References: <cover.1580055797.git.akuster808@gmail.com>
Subject: [warrior 03/29] python3: Upgrade 3.7.5 -> 3.7.6
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
X-List-Received-Date: Sun, 26 Jan 2020 16:24:58 -0000

From: Adrian Bunk <bunk@stusta.de>

Signed-off-by: Adrian Bunk <bunk@stusta.de>
Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
---
 .../python/{python3_3.7.5.bb => python3_3.7.6.bb}             | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)
 rename meta/recipes-devtools/python/{python3_3.7.5.bb => python3_3.7.6.bb} (98%)

diff --git a/meta/recipes-devtools/python/python3_3.7.5.bb b/meta/recipes-devtools/python/python3_3.7.6.bb
similarity index 98%
rename from meta/recipes-devtools/python/python3_3.7.5.bb
rename to meta/recipes-devtools/python/python3_3.7.6.bb
index c90054d45a..7a569f9ca7 100644
--- a/meta/recipes-devtools/python/python3_3.7.5.bb
+++ b/meta/recipes-devtools/python/python3_3.7.6.bb
@@ -38,8 +38,8 @@ SRC_URI_append_class-nativesdk = " \
            file://0001-main.c-if-OEPYTHON3HOME-is-set-use-instead-of-PYTHON.patch \
            "
 
-SRC_URI[md5sum] = "08ed8030b1183107c48f2092e79a87e2"
-SRC_URI[sha256sum] = "e85a76ea9f3d6c485ec1780fca4e500725a4a7bbc63c78ebc44170de9b619d94"
+SRC_URI[md5sum] = "c08fbee72ad5c2c95b0f4e44bf6fd72c"
+SRC_URI[sha256sum] = "55a2cce72049f0794e9a11a84862e9039af9183603b78bc60d89539f82cf533f"
 
 # exclude pre-releases for both python 2.x and 3.x
 UPSTREAM_CHECK_REGEX = "[Pp]ython-(?P<pver>\d+(\.\d+)+).tar"
-- 
2.17.1


