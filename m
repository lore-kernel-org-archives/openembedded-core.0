Return-Path: <alex.kanavin@gmail.com>
Received: from mail-wr1-f68.google.com (mail-wr1-f68.google.com
	[209.85.221.68])
	by mail.openembedded.org (Postfix) with ESMTP id 362B67F9A3
	for <openembedded-core@lists.openembedded.org>;
	Mon, 18 Nov 2019 14:31:38 +0000 (UTC)
Received: by mail-wr1-f68.google.com with SMTP id s5so19770890wrw.2
	for <openembedded-core@lists.openembedded.org>;
	Mon, 18 Nov 2019 06:31:39 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=from:to:cc:subject:date:message-id:in-reply-to:references;
	bh=JobdxVctDF/BynbmmbR18/fOpan2G6o/N1VoegFhwNQ=;
	b=VNzSoMvIkSdldIQwTZ4iQNmi6wsQZaNnqG/2XHaWkV+JHSuNmflh5xPzaOcVOfXjxA
	AUQO0Jb5OgFvKdIdtg7wXACdXza2y7O81SvuG84O262lAS9RbVOBP10H1c6fQrMn0v+0
	3jzKVzm7GQAoQwIF6H+HZkc8ELktUTSS8mfkVyZ4jZbdVcE9Onuu1sG0Jpt9XTGmVge7
	9hLdrlFqiU/gf9XVb40ZhbdYdiDldmi5wP6YqrXkRioY5F0n+9LVE22auMXKoj59LP/a
	FjycEuUtmSgd+Obx4cWoktMEzExo9r8SEQETddrxvgpBI7/hdTi4QPbK/QwE5/qT7vr5
	RTCA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
	:references;
	bh=JobdxVctDF/BynbmmbR18/fOpan2G6o/N1VoegFhwNQ=;
	b=XLleCGL9lsqbIsDzyXaOletWQF5mBY18Y1jEkHE4k/bloI4lXWaFh0xo5qZdnu13/r
	f42dg0R0NgDBsO12t/zdYImE+2ZdG6mvz81nsY+AQBZ5UAnEHjQ/cnND2C8x42NN/TDq
	7a4LWLWgq/ysuaayoGu8w+Vo7FytzDIfIoXvFbK6fICPaXrRIZC8d2cTZPIoZ8THRwlF
	vbLn1zTVBUpYMaMSeDlhNhJbD1w/JAV7IxR1+/5ld7mT+PIKngVTMrDvjiksYE91TtFA
	dErdUqf94W7d6xqRHyQvRl76t9Ba0LYpJx7VU78x/eu+M4KIJho8P64UO5NTR9NPHH2+
	pRGA==
X-Gm-Message-State: APjAAAWbaLewjPl4+7XSKOly1n0dMCrj7iN6MDQcOfStDlmwnBOadipi
	6fDsmrUlunTN+7klA5jUqB32c3PA
X-Google-Smtp-Source: APXvYqyJsw8Nx9IfeI3xiYPLxbvxd0Aom5q0Jo+rEKzFUF4dd3KcocuEzfDeFU5UrpY8kvseU7EGzA==
X-Received: by 2002:a5d:4410:: with SMTP id z16mr11545641wrq.85.1574087498934; 
	Mon, 18 Nov 2019 06:31:38 -0800 (PST)
Received: from alexander-box.rd.corpintra.net ([141.113.66.202])
	by smtp.gmail.com with ESMTPSA id
	f24sm20097324wmb.37.2019.11.18.06.31.36
	(version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
	Mon, 18 Nov 2019 06:31:38 -0800 (PST)
From: Alexander Kanavin <alex.kanavin@gmail.com>
To: openembedded-core@lists.openembedded.org
Date: Mon, 18 Nov 2019 15:28:44 +0100
Message-Id: <20191118142852.22981-5-alex.kanavin@gmail.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20191118142852.22981-1-alex.kanavin@gmail.com>
References: <20191118142852.22981-1-alex.kanavin@gmail.com>
Subject: [PATCH 05/13] librepo: upgrade 1.10.6 -> 1.11.0
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
X-List-Received-Date: Mon, 18 Nov 2019 14:31:39 -0000

Signed-off-by: Alexander Kanavin <alex.kanavin@gmail.com>
---
 .../librepo/{librepo_1.10.6.bb => librepo_1.11.0.bb}            | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta/recipes-devtools/librepo/{librepo_1.10.6.bb => librepo_1.11.0.bb} (93%)

diff --git a/meta/recipes-devtools/librepo/librepo_1.10.6.bb b/meta/recipes-devtools/librepo/librepo_1.11.0.bb
similarity index 93%
rename from meta/recipes-devtools/librepo/librepo_1.10.6.bb
rename to meta/recipes-devtools/librepo/librepo_1.11.0.bb
index cf4de22c474..30c8a5c55d5 100644
--- a/meta/recipes-devtools/librepo/librepo_1.10.6.bb
+++ b/meta/recipes-devtools/librepo/librepo_1.11.0.bb
@@ -8,7 +8,7 @@ SRC_URI = "git://github.com/rpm-software-management/librepo.git \
            file://0004-Set-gpgme-variables-with-pkg-config-not-with-cmake-m.patch \
            "
 
-SRCREV = "2ec349f1c686c1704dc83da6c118035ff57c8dea"
+SRCREV = "497f5eb2293662835bed6bdb0f43521788b2cebe"
 
 S = "${WORKDIR}/git"
 
-- 
2.17.1


