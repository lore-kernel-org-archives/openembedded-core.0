Return-Path: <alex.kanavin@gmail.com>
Received: from mail-wr1-f45.google.com (mail-wr1-f45.google.com
	[209.85.221.45])
	by mail.openembedded.org (Postfix) with ESMTP id 9300C7F518
	for <openembedded-core@lists.openembedded.org>;
	Thu, 10 Oct 2019 11:18:59 +0000 (UTC)
Received: by mail-wr1-f45.google.com with SMTP id j18so7368748wrq.10
	for <openembedded-core@lists.openembedded.org>;
	Thu, 10 Oct 2019 04:19:00 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=from:to:cc:subject:date:message-id:in-reply-to:references;
	bh=X2i0oqJK7nGMPFgxHBJj0g9gZhxOKdZnJPfQiehYvIo=;
	b=SMjXakqLcr45vZbzYVchUoIggqebIZkWps10MXwc3rDPI6mFDKOWtuGQj77K1l1a0A
	6WVFYWCeYH5EsyiLoJ+sso7vEt22YAtX7XSKgQHnSD9ZQF7Sle1f8ymvO5u/wp/H3Qzn
	hrITADdQSTtauKegnOShozoWbzQG08VvHRiBxVceCkiYeGlDaToctMSU7eyOEPk1YZCj
	qN+ZWnETINWvNS0Vl1Eiyv8Zu/ldhQuORlbXTNNUsTP6VFt8IsmsmwTd1JuvLXqRXdoO
	VU5KwRnlMqVghoWLssf2mdyRd20DhLxb9hWHNJHBMOgabWiJrwkGmpdJoDZ6FTy6OD0L
	MOrg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
	:references;
	bh=X2i0oqJK7nGMPFgxHBJj0g9gZhxOKdZnJPfQiehYvIo=;
	b=UzLc9HCB4YL45rOMo9NjR5SC2YpQnJDGf1rClMtyrUdmZzAImhC0ghcmp7MWSYKn/O
	ufK20v9yOIpWrw37ioYzBhS+wBdvxmgXzkPWVPflQGxUvW5UQEsuzW4sxfwqhWT1xprJ
	Iv/DdZl1zezlLp64AGyRSkvzVEpideibF+dnUhhuGDEd52MG0SAroiaioXk6MMXX+Qfd
	zkaoIsCqX2y42Z5tq45ehU+pZVOuGQX62CsHxVUvkDN1fIpp+NKNdvId8bKcaa5NmKd3
	DW8FyMIpx0BCejUO3O7emLVkgvKXTkwE5gBCrZ5JhsQgAsNz7HF1Oguerzaa8kKgJMWd
	VmeA==
X-Gm-Message-State: APjAAAVMU11VsluegfR43wZIUIFSybtrR534aUcrkeTF9mI0Nw3p9hdv
	1aXoREdAI6fk3BNloWIyq/CznmfayCY=
X-Google-Smtp-Source: APXvYqxw3PXJkvItpJaBWd5sWKClS7kTxnsbEBObrpBbJ1sQcf3P5nECdlUE3JaawVQvH3DjPwhXyA==
X-Received: by 2002:adf:f50b:: with SMTP id q11mr4479341wro.310.1570706340150; 
	Thu, 10 Oct 2019 04:19:00 -0700 (PDT)
Received: from alexander-box.luxoft.com ([62.96.135.139])
	by smtp.gmail.com with ESMTPSA id
	l13sm5831372wmj.25.2019.10.10.04.18.59
	(version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
	Thu, 10 Oct 2019 04:18:59 -0700 (PDT)
From: Alexander Kanavin <alex.kanavin@gmail.com>
To: openembedded-core@lists.openembedded.org
Date: Thu, 10 Oct 2019 13:18:45 +0200
Message-Id: <20191010111848.3825-7-alex.kanavin@gmail.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20191010111848.3825-1-alex.kanavin@gmail.com>
References: <20191010111848.3825-1-alex.kanavin@gmail.com>
Subject: [PATCH 07/10] bind: do not RDEPEND on bash
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
X-List-Received-Date: Thu, 10 Oct 2019 11:19:00 -0000

Nothing in the target installation actually needs it.

Signed-off-by: Alexander Kanavin <alex.kanavin@gmail.com>
---
 meta/recipes-connectivity/bind/bind_9.11.5-P4.bb | 2 --
 1 file changed, 2 deletions(-)

diff --git a/meta/recipes-connectivity/bind/bind_9.11.5-P4.bb b/meta/recipes-connectivity/bind/bind_9.11.5-P4.bb
index 69b11740734..f4e985036d5 100644
--- a/meta/recipes-connectivity/bind/bind_9.11.5-P4.bb
+++ b/meta/recipes-connectivity/bind/bind_9.11.5-P4.bb
@@ -133,7 +133,5 @@ PACKAGE_BEFORE_PN += "${@bb.utils.contains('PACKAGECONFIG', 'python3', 'python3-
 FILES_python3-bind = "${sbindir}/dnssec-coverage ${sbindir}/dnssec-checkds \
                 ${sbindir}/dnssec-keymgr ${PYTHON_SITEPACKAGES_DIR}"
 
-RDEPENDS_${PN} = "bash"
-RDEPENDS_${PN}-utils = "bash"
 RDEPENDS_${PN}-dev = ""
 RDEPENDS_python3-bind = "python3-core python3-ply"
-- 
2.17.1


