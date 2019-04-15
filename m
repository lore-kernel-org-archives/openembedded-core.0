Return-Path: <alex.kanavin@gmail.com>
Received: from mail-wr1-f68.google.com (mail-wr1-f68.google.com
	[209.85.221.68])
	by mail.openembedded.org (Postfix) with ESMTP id E78527D957
	for <openembedded-core@lists.openembedded.org>;
	Mon, 15 Apr 2019 10:55:03 +0000 (UTC)
Received: by mail-wr1-f68.google.com with SMTP id g3so21292684wrx.9
	for <openembedded-core@lists.openembedded.org>;
	Mon, 15 Apr 2019 03:55:05 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=from:to:cc:subject:date:message-id:in-reply-to:references;
	bh=PkNDapm2k6/e2EwkNHX5c1Po1+fDZBSQFn1ELtaTNi8=;
	b=pIfHcg9uWUnMhhAPy/sEZnxOmfoYBAkjjWrCR++aDrwt65zaoV5KVhHXP4HB09LaXo
	VnQlNbeNqWcYFYVADlHqzEoa58mVHXCJbcuersujP7Hz+9Eji9VIKIjWD/6oBAqb9VJ/
	O0uR39tOTjAijYNfUZqkbPaARxGurR2RgBzYRNJSkgtcpQyK549mpxVBOmwy7f1bRrVH
	P1J84pfIOS6OfLRMxgeqbeozjHNvik8hgF/ZIN7mWcYj0Hycyx9gDlJ5gK2pxJYa5TM5
	8egsNTEFSmOiIZdSnzVhmn4S2QbaeVZ9rMsL4PcSFCvP4SNfw17AeFsJgZlmYmLJ0kML
	XjZg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
	:references;
	bh=PkNDapm2k6/e2EwkNHX5c1Po1+fDZBSQFn1ELtaTNi8=;
	b=Dn5G16EROKSTBuaI6Gxi/iDNCw7k5YX2I8HCGCxR0D1/Ygefuu2Y1AiKOX8lsIC0is
	4KlidHHd90Xg0DMFSaBLtoxRT8CcyTl4cxyvpbCqEtUIppj13fYUs6Csui5jbqRFLSof
	RgFDvyQkhL7bYlpp5jYqrS8iq44UobXorKy6Xr6kNc0Q/gb/jtjpthKb4wq06tjtf9HJ
	XTw5DPDKRC1PoXG0GfFSfaARyRZvzt6z8PgsAzTL2PlST17KJjzr/WcYZ/FMvPuzgcqs
	iAbxPSy9CNXip7xFr//8UacxTETuAi1g07gSeV5wAHzY7EEU5WLrgh/dsqqG9m7EjCOU
	RgRQ==
X-Gm-Message-State: APjAAAVUZTTkH7VBCmWIRGfBcflbG4WVP+famWp1NceeadBZOt5RH3Jr
	1rXHZElWyu71UaINbz7FFDozKSPrXzs=
X-Google-Smtp-Source: APXvYqzrOmpZFLJVFYXk9ptZrC0QMwSQfla3RaETNKv9WUhtrR26UC/vtDcKDnTSa3g2XG9pF/ySeQ==
X-Received: by 2002:adf:ea0b:: with SMTP id q11mr28147468wrm.233.1555325704637;
	Mon, 15 Apr 2019 03:55:04 -0700 (PDT)
Received: from alexander-box.luxoft.com ([62.96.135.139])
	by smtp.gmail.com with ESMTPSA id
	o10sm75468400wru.54.2019.04.15.03.55.03
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Mon, 15 Apr 2019 03:55:04 -0700 (PDT)
From: Alexander Kanavin <alex.kanavin@gmail.com>
To: openembedded-core@lists.openembedded.org
Date: Mon, 15 Apr 2019 12:54:40 +0200
Message-Id: <20190415105457.57067-2-alex.kanavin@gmail.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20190415105457.57067-1-alex.kanavin@gmail.com>
References: <20190415105457.57067-1-alex.kanavin@gmail.com>
Subject: [PATCH 02/19] dtc: upgrade 1.4.7 -> 1.5.0
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
X-List-Received-Date: Mon, 15 Apr 2019 10:55:04 -0000

Signed-off-by: Alexander Kanavin <alex.kanavin@gmail.com>
---
 meta/recipes-kernel/dtc/dtc.inc                        | 2 ++
 meta/recipes-kernel/dtc/{dtc_1.4.7.bb => dtc_1.5.0.bb} | 2 +-
 2 files changed, 3 insertions(+), 1 deletion(-)
 rename meta/recipes-kernel/dtc/{dtc_1.4.7.bb => dtc_1.5.0.bb} (81%)

diff --git a/meta/recipes-kernel/dtc/dtc.inc b/meta/recipes-kernel/dtc/dtc.inc
index 7a923bf5206..0650e3c82e6 100644
--- a/meta/recipes-kernel/dtc/dtc.inc
+++ b/meta/recipes-kernel/dtc/dtc.inc
@@ -12,6 +12,8 @@ UPSTREAM_CHECK_GITTAGREGEX = "v(?P<pver>\d+(\.\d+)+)"
 
 EXTRA_OEMAKE='NO_PYTHON=1 PREFIX="${prefix}" LIBDIR="${libdir}" DESTDIR="${D}"'
 
+inherit pkgconfig
+
 S = "${WORKDIR}/git"
 
 do_install () {
diff --git a/meta/recipes-kernel/dtc/dtc_1.4.7.bb b/meta/recipes-kernel/dtc/dtc_1.5.0.bb
similarity index 81%
rename from meta/recipes-kernel/dtc/dtc_1.4.7.bb
rename to meta/recipes-kernel/dtc/dtc_1.5.0.bb
index 6ce462a7f49..a9c131706ce 100644
--- a/meta/recipes-kernel/dtc/dtc_1.4.7.bb
+++ b/meta/recipes-kernel/dtc/dtc_1.5.0.bb
@@ -3,7 +3,7 @@ require dtc.inc
 LIC_FILES_CHKSUM = "file://GPL;md5=94d55d512a9ba36caa9b7df079bae19f \
 		    file://libfdt/libfdt.h;beginline=3;endline=52;md5=fb360963151f8ec2d6c06b055bcbb68c"
 
-SRCREV = "88f18909db731a627456f26d779445f84e449536"
+SRCREV = "d37f6b20107e952064e3f77e9d6915a9c09d10a6"
 
 S = "${WORKDIR}/git"
 
-- 
2.17.1


