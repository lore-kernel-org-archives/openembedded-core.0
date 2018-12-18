Return-Path: <alex.kanavin@gmail.com>
Received: from mail-wm1-f52.google.com (mail-wm1-f52.google.com
	[209.85.128.52])
	by mail.openembedded.org (Postfix) with ESMTP id 9A1817C102
	for <openembedded-core@lists.openembedded.org>;
	Tue, 18 Dec 2018 16:30:25 +0000 (UTC)
Received: by mail-wm1-f52.google.com with SMTP id d15so3300616wmb.3
	for <openembedded-core@lists.openembedded.org>;
	Tue, 18 Dec 2018 08:30:26 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=from:to:cc:subject:date:message-id:in-reply-to:references;
	bh=S7YW+1G7Pt1cKgyQX62FjeokIlgxNwoWoTdJXt6+rZw=;
	b=IdLHS32VuKSeSKyBQuHy3rhMCduDj7ZYXExMwNxDbyDgrI7OB7nyqfalkSOGqXjLCp
	4F8SDTkU/egzMEjqi1xteq2OWNHFrj8d9roTbyLXM6zzTTeG+i1xDG5MwW4yz8cWSUud
	2znh9qnXzCO6j79raLyAXsvY7D0DlW91/Lp63O45727U3Hw7w9RSWz+y3fQjnzTWD6Qq
	qXx/Anz2KUaBmKwW6b3TvOCbvCjoTavc8quqDut1l7kyZuXOM8yob82cpJUnOZOhubb8
	tZ0hCq18eOMrnEN7stNfB2tJuTeznvcKMGGIXw5Tuco8jMFkOdlvO8CqD04Z5ZZyEThE
	38Ew==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
	:references;
	bh=S7YW+1G7Pt1cKgyQX62FjeokIlgxNwoWoTdJXt6+rZw=;
	b=ZcIu2wV7tOvVbVhKCktSLMdR88YDlKg74UhMD9kElBOyF8ZonZ42i2s+QRqg8SkGaf
	i6tt147PWCkcM/iCOn+NCkFVUM8hG13uvQxUqPCxCTixzq/J6IcwHs91BTxhwUIIMF+3
	Ec7Mh82i91Hkr1EMsVhRxClT4vcO8LDCZK5GkiyGXaOpZZ0d2SSjL6EWWi2i6bTEnI1C
	FFz2R0ozTnvrfDctYXxDGqqfLUTlaTSzpkAZJDw2RRjeSxMhPZFykZaRcihtOd1hCBjS
	Qho7xofHhdECHkNbLEryBKQjs0EwKLKj0F8d9rQbM32ThvRZ8SmVlVQ4BkwCmmyTicUI
	PuKw==
X-Gm-Message-State: AA+aEWbjgI7KxRzzQuNENFzftKz7urQbrMJbKM6tWZhnlZOp9Y7apHBa
	CyFQ6BO8+aa4nszp9QHMvZfxpOzs
X-Google-Smtp-Source: AFSGD/V3RyMVUaEEmUyLm+oEmshHayu3o/oEO0zi5IS/b2x4QZgdhBAGIQm4u9gHVgMWud7NtMoZag==
X-Received: by 2002:a7b:c8d7:: with SMTP id f23mr3754742wml.121.1545150625995; 
	Tue, 18 Dec 2018 08:30:25 -0800 (PST)
Received: from alexander-box.luxoft.com ([62.96.135.139])
	by smtp.gmail.com with ESMTPSA id
	f18sm2237849wrs.92.2018.12.18.08.30.24
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Tue, 18 Dec 2018 08:30:25 -0800 (PST)
From: Alexander Kanavin <alex.kanavin@gmail.com>
To: openembedded-core@lists.openembedded.org
Date: Tue, 18 Dec 2018 17:30:04 +0100
Message-Id: <20181218163005.1330-12-alex.kanavin@gmail.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20181218163005.1330-1-alex.kanavin@gmail.com>
References: <20181218163005.1330-1-alex.kanavin@gmail.com>
Subject: [PATCH 12/13] webkitgtk: upgrade 2.22.4 -> 2.22.5
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
X-List-Received-Date: Tue, 18 Dec 2018 16:30:26 -0000

Signed-off-by: Alexander Kanavin <alex.kanavin@gmail.com>
---
 .../webkit/{webkitgtk_2.22.4.bb => webkitgtk_2.22.5.bb}       | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)
 rename meta/recipes-sato/webkit/{webkitgtk_2.22.4.bb => webkitgtk_2.22.5.bb} (97%)

diff --git a/meta/recipes-sato/webkit/webkitgtk_2.22.4.bb b/meta/recipes-sato/webkit/webkitgtk_2.22.5.bb
similarity index 97%
rename from meta/recipes-sato/webkit/webkitgtk_2.22.4.bb
rename to meta/recipes-sato/webkit/webkitgtk_2.22.5.bb
index 196122002bb..fc56822f7aa 100644
--- a/meta/recipes-sato/webkit/webkitgtk_2.22.4.bb
+++ b/meta/recipes-sato/webkit/webkitgtk_2.22.5.bb
@@ -22,8 +22,8 @@ SRC_URI = "http://www.webkitgtk.org/releases/${BPN}-${PV}.tar.xz \
            file://detect-gstreamer-gl.patch \
            "
 
-SRC_URI[md5sum] = "9f08d09cfc21c761a431a545549f301a"
-SRC_URI[sha256sum] = "fab5be2883802352ae0e735dd1eff4bc18abaff7ac78689cec72eb2f611943b8"
+SRC_URI[md5sum] = "96a731522b800f38e70f85c22f8de477"
+SRC_URI[sha256sum] = "99d3863f418a7c3a3e37e5062950dbf2d91fb106ec1633459b0ef6f2d5f6cb13"
 
 inherit cmake pkgconfig gobject-introspection perlnative distro_features_check upstream-version-is-even gtk-doc
 
-- 
2.17.1


