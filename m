Return-Path: <akuster808@gmail.com>
Received: from mail-pl0-f65.google.com (mail-pl0-f65.google.com
	[209.85.160.65])
	by mail.openembedded.org (Postfix) with ESMTP id 7B1FE77FEC
	for <openembedded-core@lists.openembedded.org>;
	Sun, 17 Dec 2017 16:34:42 +0000 (UTC)
Received: by mail-pl0-f65.google.com with SMTP id s3so3350772plp.4
	for <openembedded-core@lists.openembedded.org>;
	Sun, 17 Dec 2017 08:34:44 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=from:to:subject:date:message-id:in-reply-to:references;
	bh=8dljd3hDe3RhQ+xc4xCn8RWdtndISUcwqBq++uwHm4A=;
	b=X/9JhbSX9u2QNqvABZVo/5M3KJ/jg9dfMNBLnV/3vYFcVZj9otKqKuTEQobNSpxdf6
	ajfsfZN2AU82smYOrNPuXvv2tgwQhS8dCzfSAROi6H4rhARuyyyk64JoyMmmWN3IietO
	ImPaYBe97GgD4Qi4yAyr+Lmv7s4faoXoRLwuKsynP5OuIREVHDYSiKoRofbRSZ6Y8+kZ
	T83FQyN388c9oIAwxFb6NVS0QAm4KkeyRYUvzElxrxsk5EoSabt953IsyrkG8oXwuUxH
	wTYGT5prfALvXPWq+kMt1ihvKnFlw8fsXHdMKzmexz2X4P+wdxvlES8oCU2e+eBZMcAg
	nMyQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
	:references;
	bh=8dljd3hDe3RhQ+xc4xCn8RWdtndISUcwqBq++uwHm4A=;
	b=IX6qu9IDD6axZFthKVbkEba12JMJphTyjla9kPF6HRQv1JF88dLs7LnrbUxlviMkru
	iv9UiiEGjXdv7MNiZ4OfXCnRNJ0JkhO6A6Qh9tbI7SaPCzDALpXDl30YrLeUuhIDOlw1
	g/6fAAEFJVaeMqnhwbAIY+p878vF5Im61BuffYz7JiNkDyH1qeL3ymVNS9DAIog+FMOU
	am8+BIdiTuwXEMNjhYC1cYfJ+QY22QSzWv59ZOsAx3yc5UjvB191q89hKkF/uND+Hmr4
	QWniokCyDJBUplM1/d1pTJOAMNulpQLjtm3pA8fGdFz/P4F0B/DSRQfVO9JMs+/b0f5s
	LB1g==
X-Gm-Message-State: AKGB3mJoV9V+I6puH5Goe/zt3xfl9IoexuGHWF/YjvVKcR4QKOb1yrUd
	mVbfSe3D2Kypu+GnSw+1jiEMVQ==
X-Google-Smtp-Source: ACJfBouIxSMJ3M2h73UoTCSr1BeG9OamyTzqqaRNtY7lc3oBSdeEmTnTogYtemZX7bD4990ipoaqgw==
X-Received: by 10.84.171.193 with SMTP id l59mr20051800plb.33.1513528484631;
	Sun, 17 Dec 2017 08:34:44 -0800 (PST)
Received: from akuster-ThinkPad-T460s.mvista.com
	([2601:202:4000:1184:35e6:5321:54f2:87e6])
	by smtp.gmail.com with ESMTPSA id
	t202sm18393035pgb.75.2017.12.17.08.34.43
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
	Sun, 17 Dec 2017 08:34:44 -0800 (PST)
From: Armin Kuster <akuster808@gmail.com>
To: akuster@mvista.com,
	openembedded-core@lists.openembedded.org
Date: Sun, 17 Dec 2017 08:34:32 -0800
Message-Id: <6c3bf07f9329d32119027e8228f454e9b0bce1b8.1513527416.git.akuster@mvista.com>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <cover.1513527416.git.akuster@mvista.com>
References: <cover.1513527416.git.akuster@mvista.com>
Subject: [PATCH 3/8] libassuan: update to 2.5.1
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
X-List-Received-Date: Sun, 17 Dec 2017 16:34:43 -0000

From: Armin Kuster <akuster@mvista.com>

Signed-off-by: Armin Kuster <akuster@mvista.com>
---
 .../libassuan/{libassuan_2.4.4.bb => libassuan_2.5.1.bb}              | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)
 rename meta/recipes-support/libassuan/{libassuan_2.4.4.bb => libassuan_2.5.1.bb} (88%)

diff --git a/meta/recipes-support/libassuan/libassuan_2.4.4.bb b/meta/recipes-support/libassuan/libassuan_2.5.1.bb
similarity index 88%
rename from meta/recipes-support/libassuan/libassuan_2.4.4.bb
rename to meta/recipes-support/libassuan/libassuan_2.5.1.bb
index 7921c1d..34d5f16 100644
--- a/meta/recipes-support/libassuan/libassuan_2.4.4.bb
+++ b/meta/recipes-support/libassuan/libassuan_2.5.1.bb
@@ -17,8 +17,8 @@ SRC_URI = "${GNUPG_MIRROR}/libassuan/libassuan-${PV}.tar.bz2 \
            file://libassuan-add-pkgconfig-support.patch \
           "
 
-SRC_URI[md5sum] = "52385ec8d34f258bf10165d32c486002"
-SRC_URI[sha256sum] = "9e69a102272324de0bb56025779f84fd44901afcc6eac51505f6a63ea5737ca1"
+SRC_URI[md5sum] = "4354b7ae296894f232ada226a062d7d7"
+SRC_URI[sha256sum] = "47f96c37b4f2aac289f0bc1bacfa8bd8b4b209a488d3d15e2229cb6cc9b26449"
 
 BINCONFIG = "${bindir}/libassuan-config"
 
-- 
2.7.4


