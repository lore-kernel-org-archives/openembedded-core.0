Return-Path: <alex.kanavin@gmail.com>
Received: from mail-wm1-f42.google.com (mail-wm1-f42.google.com
	[209.85.128.42])
	by mail.openembedded.org (Postfix) with ESMTP id 09C427F9B4
	for <openembedded-core@lists.openembedded.org>;
	Mon, 18 Nov 2019 13:08:53 +0000 (UTC)
Received: by mail-wm1-f42.google.com with SMTP id b17so18736758wmj.2
	for <openembedded-core@lists.openembedded.org>;
	Mon, 18 Nov 2019 05:08:55 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=from:to:cc:subject:date:message-id:in-reply-to:references;
	bh=300R6mbD/nE27HhMC0AqZAuTooA3D8j5Kduci5ZGiYk=;
	b=kDikIJLd/fWDLHryPPnA5Xn5jY/lgULRDaulW0GhtVKaWVOq81yTPhVUaZr5i+L8ul
	dXeDcT+Et56OiVqoJORZn9pOzbrggN/il04KjOSm0KzEeBXEp5v+OILJ5BB81nMs1oly
	wbYj5wowfWQFMDVE4fN7OcxZaDXT2cq0LXwtNs0+l6mDK1n1TsRSOhVKAbEwCOhdp7+o
	4VO69hu+Yluv13bD5yTrrXhOAYQHAE4IpZqVTo2/g4tHMyciR3ci7LfwfDdzKakJYcg/
	MCzWzo4gmEsAE7KIwUvJ6uIzjG/uXbZfnmccv0ngGFg0yihMzWH6Yum5k6zZTF8Jtio9
	gGlA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
	:references;
	bh=300R6mbD/nE27HhMC0AqZAuTooA3D8j5Kduci5ZGiYk=;
	b=hb2zoMgsDxcJJIDCuLGJO9ATl951G7Y2vIMPxWbA9pe7idGXGSs5Mxk0KLMFeo4Mk+
	sP36W8HBqBqUTCBq96rSjU4+ZYicTNC8kjd9avZSaLwuGeDCagpRX6bu9pheq4RoWsQ1
	nSkzGaDVn97fNc+F0dFX7cxsqAuyhTgcVjimrRIUvAXspmpMs7odC7lkKo0o+bLsEZlu
	gUa1amRctpQ1G1mNtaZiQIUOYl5Oo8MML4QsSSCDhHR3QePMUEIn9f2XBbu/Yx2rDXoG
	WJYysT7+rUMiM5EmKw29QXYOi+bk2f0lTzUrSL6dEMjPZxZVN6LHHz0RtOPqeSayos8J
	Z89g==
X-Gm-Message-State: APjAAAUje9YOerEGudVB7bcN+Q2TgNWWVGlJA8jUHhDNK6lPHCL7kTCY
	MmdU5GP8oxWIyyq8sZ3fRJ+0RpXC
X-Google-Smtp-Source: APXvYqxPY/yFLJPvtTNvaN/FEBQ3wPFvzadepJNLH/HtOGEfiuH3YH0e/9EnJQtr2EOAdhSjISVlwA==
X-Received: by 2002:a1c:dd45:: with SMTP id u66mr28152406wmg.12.1574082534518; 
	Mon, 18 Nov 2019 05:08:54 -0800 (PST)
Received: from alexander-box.rd.corpintra.net ([141.113.66.202])
	by smtp.gmail.com with ESMTPSA id
	z4sm21413846wmf.36.2019.11.18.05.08.49
	(version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
	Mon, 18 Nov 2019 05:08:54 -0800 (PST)
From: Alexander Kanavin <alex.kanavin@gmail.com>
To: openembedded-core@lists.openembedded.org
Date: Mon, 18 Nov 2019 14:07:59 +0100
Message-Id: <20191118130801.21860-11-alex.kanavin@gmail.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20191118130801.21860-1-alex.kanavin@gmail.com>
References: <20191118130801.21860-1-alex.kanavin@gmail.com>
Subject: [PATCH 11/13] vala: upgrade 0.46.3 -> 0.46.4
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
X-List-Received-Date: Mon, 18 Nov 2019 13:08:54 -0000

---
 meta/recipes-devtools/vala/{vala_0.46.3.bb => vala_0.46.4.bb} | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)
 rename meta/recipes-devtools/vala/{vala_0.46.3.bb => vala_0.46.4.bb} (57%)

diff --git a/meta/recipes-devtools/vala/vala_0.46.3.bb b/meta/recipes-devtools/vala/vala_0.46.4.bb
similarity index 57%
rename from meta/recipes-devtools/vala/vala_0.46.3.bb
rename to meta/recipes-devtools/vala/vala_0.46.4.bb
index eda5738c066..c4cd6dd4109 100644
--- a/meta/recipes-devtools/vala/vala_0.46.3.bb
+++ b/meta/recipes-devtools/vala/vala_0.46.4.bb
@@ -4,5 +4,5 @@ SRC_URI += "file://0001-git-version-gen-don-t-append-dirty-if-we-re-not-in-g.pat
            file://0001-vapigen.m4-use-PKG_CONFIG_SYSROOT_DIR.patch \
            "
 
-SRC_URI[md5sum] = "809ddac69b039ef509b61993c848613f"
-SRC_URI[sha256sum] = "e29c2b1f108dc22c91bb501975a77c938aef079ca7875e1fbf41191e22cc57e3"
+SRC_URI[md5sum] = "b79bbaf8929ec8ed35911b3571f5a248"
+SRC_URI[sha256sum] = "4bb9b60fc0230b0db2c8a0e2a80ec29f1c10b43dc78355abba78adedbc2e03a1"
-- 
2.17.1


