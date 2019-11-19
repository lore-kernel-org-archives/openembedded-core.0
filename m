Return-Path: <alex.kanavin@gmail.com>
Received: from mail-wm1-f68.google.com (mail-wm1-f68.google.com
	[209.85.128.68])
	by mail.openembedded.org (Postfix) with ESMTP id 4FB5F7F8AF
	for <openembedded-core@lists.openembedded.org>;
	Tue, 19 Nov 2019 13:26:21 +0000 (UTC)
Received: by mail-wm1-f68.google.com with SMTP id l17so3205811wmh.0
	for <openembedded-core@lists.openembedded.org>;
	Tue, 19 Nov 2019 05:26:22 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=from:to:cc:subject:date:message-id:in-reply-to:references
	:mime-version:content-transfer-encoding;
	bh=rB62csrMoWIt/F77FvNBES5wdadrJEyB1kwtmytGG3Q=;
	b=fnrwWzYmI4GbuNSO61sCc/bKToo3O0eQWOoKEmdU8kmgskGSlkx4uBcqMLpgKHfnDE
	dSsI2+DJCuChtQRurpDiLnKZUsTFl9PVT3tpZDDqLRRR9e26XTGi9nl6TihGCNe0knx1
	k6v2mId2U25R8eAbM6HGB7iiuuffjCERvBOKBYHkY2IxUKxS913QlkBoONV0jjjzeTS+
	KX6l93fGRmswfZ+WQRnpjYVwrPlp7Lo1unE8afP0uf70sHs4So1BIuHcmYqqerxb7lgA
	cqrOVfakgcVJ3X92E2nF/j3S+GmEbWaBvHWzHIqKZ/wsWJnJEph0bb5EFS7dYddowq/3
	uIOw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
	:references:mime-version:content-transfer-encoding;
	bh=rB62csrMoWIt/F77FvNBES5wdadrJEyB1kwtmytGG3Q=;
	b=t8QLpv/m2k64IWiS4uRjONu06uNNyhoM4dq7Z5tUDSCBWyS0SPzpD9eIcvvjWoen9R
	BsR5RVnChqlx/qmivVGz39DWoOHG0Cm8aGIIvHqJ52i3llkuNoCjRRQK++NW2rfoVbC3
	lsdyjPzyK/h5f7Wf8XtUZ/FW96cxgoE5rHDuImCSCF7v8NKbDoKPIEGQghvBTIRnhlas
	b+VukvyRBYPB31ut2F3Wbgc39/2TXyicUl5Pe33Eojy6QUBTioP3vzV2NCV5KihxZ83/
	NOCRYGyB0R2rVhgUfO5P5O7z7f/pFRt+MNFWiYJWRAW0ZmJK0PVOgcGMIwj7whJycEjM
	C4Wg==
X-Gm-Message-State: APjAAAXm5AuBMkmlRCosec/A9O5oF9OXTjuZ8PMrLzg7e8BnGIK5Ho/w
	HezM37mXEMsC10QgxEYRpV1GsxQJ
X-Google-Smtp-Source: APXvYqxtOzq6qlv893huHO+JdzgFrqp1LEsdRyGuNwvOesersgtgh2vkz2yTNoW7WzKLtnY+KP/ZEQ==
X-Received: by 2002:a1c:a556:: with SMTP id o83mr5431133wme.165.1574169981835; 
	Tue, 19 Nov 2019 05:26:21 -0800 (PST)
Received: from alexander-box.rd.corpintra.net ([141.113.66.202])
	by smtp.gmail.com with ESMTPSA id
	200sm3447380wme.32.2019.11.19.05.26.21
	(version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
	Tue, 19 Nov 2019 05:26:21 -0800 (PST)
From: Alexander Kanavin <alex.kanavin@gmail.com>
To: openembedded-core@lists.openembedded.org
Date: Tue, 19 Nov 2019 14:25:56 +0100
Message-Id: <20191119132556.107508-5-alex.kanavin@gmail.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20191119132556.107508-1-alex.kanavin@gmail.com>
References: <20191119132556.107508-1-alex.kanavin@gmail.com>
MIME-Version: 1.0
Subject: [PATCH 5/5] psmisc: remove a patch that is no longer necessary
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
X-List-Received-Date: Tue, 19 Nov 2019 13:26:21 -0000
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

Signed-off-by: Alexander Kanavin <alex.kanavin@gmail.com>
---
 ...te-src-directory-before-attempting-t.patch | 28 -------------------
 meta/recipes-extended/psmisc/psmisc_23.3.bb   |  1 -
 2 files changed, 29 deletions(-)
 delete mode 100644 meta/recipes-extended/psmisc/psmisc/0001-Makefile.am-create-src-directory-before-attempting-t.patch

diff --git a/meta/recipes-extended/psmisc/psmisc/0001-Makefile.am-create-src-directory-before-attempting-t.patch b/meta/recipes-extended/psmisc/psmisc/0001-Makefile.am-create-src-directory-before-attempting-t.patch
deleted file mode 100644
index 9451303dd7b..00000000000
--- a/meta/recipes-extended/psmisc/psmisc/0001-Makefile.am-create-src-directory-before-attempting-t.patch
+++ /dev/null
@@ -1,28 +0,0 @@
-From dac375f640fecd45e6254a8d870ee37ec8f41670 Mon Sep 17 00:00:00 2001
-From: Alexander Kanavin <alex.kanavin@gmail.com>
-Date: Thu, 2 Nov 2017 16:21:22 +0200
-Subject: [PATCH] Makefile.am: create src directory before attempting to write
- there
-
-Otherwise out of tree builds will fail.
-
-Upstream-Status: Pending
-Signed-off-by: Alexander Kanavin <alex.kanavin@gmail.com>
-
----
- Makefile.am | 2 +-
- 1 file changed, 1 insertion(+), 1 deletion(-)
-
-diff --git a/Makefile.am b/Makefile.am
-index 441ae94..882969d 100644
---- a/Makefile.am
-+++ b/Makefile.am
-@@ -86,7 +86,7 @@ EXTRA_DIST = src/signames.c README.md misc/git-version-gen
- CLEANFILES = src/signames.h
- 
- src/signames.h: src/signames.c Makefile src/$(am__dirstamp)
--		export LC_ALL=C ; \
-+		export LC_ALL=C ; mkdir -p src ; \
- 		@CPP@ -dM $< |\
- 		tr -s '\t ' ' ' | sort -n -k 3 | sed \
- 	's:#define SIG\([A-Z][A-Z]*[0-9]*\) \([0-9][0-9]*\).*$\:{\ \2,"\1" },:p;d' | \
diff --git a/meta/recipes-extended/psmisc/psmisc_23.3.bb b/meta/recipes-extended/psmisc/psmisc_23.3.bb
index b3c3c7e5a84..e569f1074b6 100644
--- a/meta/recipes-extended/psmisc/psmisc_23.3.bb
+++ b/meta/recipes-extended/psmisc/psmisc_23.3.bb
@@ -4,7 +4,6 @@ LIC_FILES_CHKSUM = "file://COPYING;md5=0636e73ff0215e8d672dc4c32c317bb3"
 
 SRC_URI = "git://gitlab.com/psmisc/psmisc.git;protocol=https \
            file://0001-Use-UINTPTR_MAX-instead-of-__WORDSIZE.patch \
-	   file://0001-Makefile.am-create-src-directory-before-attempting-t.patch \
            "
 SRCREV = "78bde849041e6c914a2a517ebe1255b86dc98772"
 S = "${WORKDIR}/git"
-- 
2.17.1


