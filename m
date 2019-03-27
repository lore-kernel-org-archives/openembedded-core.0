Return-Path: <alex.kanavin@gmail.com>
Received: from mail-lj1-f196.google.com (mail-lj1-f196.google.com
	[209.85.208.196])
	by mail.openembedded.org (Postfix) with ESMTP id 0E3837D113
	for <openembedded-core@lists.openembedded.org>;
	Wed, 27 Mar 2019 14:09:31 +0000 (UTC)
Received: by mail-lj1-f196.google.com with SMTP id v22so14505218lje.9
	for <openembedded-core@lists.openembedded.org>;
	Wed, 27 Mar 2019 07:09:33 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=from:to:cc:subject:date:message-id:in-reply-to:references;
	bh=4zAwV6WPBWP3QQwrtE3ckYDGU20DU24FNWLuDaM+b8Y=;
	b=cq4K6A1BJzuw9jzUkS9m/XukCd9ZLCZmRhNaZRN/dfDfG33eXnME8zCNzNdfRLl3Vq
	Z1crhKWIqxEBSJFCyYrD1xGyq5wl7MTHHXN1x77jarycpMCME3KzwpQg/Yw4X7hpga50
	VYXWHdQLNZtY16dQQ9v/KpbijkuANKf2js6RTlwisfmzeYnoTIyUDVPQTSZwT8INe9CC
	Pn5CgirP8nP91DbdF/KQS0fvKynIX7hQCU6J7cq5q4EVN2J+5gln8e8YUb8KmN+2AbFI
	ZXVcF29U0CSGxbnLP2CiJMlYF5u1StxLtCzBYwv6Zvkaxo+o9D/S+6R6mSl7JBSjVLia
	BOGQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
	:references;
	bh=4zAwV6WPBWP3QQwrtE3ckYDGU20DU24FNWLuDaM+b8Y=;
	b=A9wKpmTuZIYQOxzZVFdeC0eXJicMcrtLRkSksTq+wNIWGj3/l8r2Cv+Hk7W9LZZnuM
	j+pUlFbgXsfll7DtJDsWoFDkIZJr2JwRBwD7f9tIue0JcscjkyGwGwsdTcrs0ZUezH2Y
	jzxGj0iwILe2swtd1fyyhAlTd0AO+4dLT2AjxCND5u3l6ssn+q6SBwOj4AuADIvpv0q9
	rwDGcULLM+o1PFBykeOAW1+KNI5dOJsgNoFxUpYaoEc3OvuxfnEm8BsDJZsuu80a28A3
	KgRD755h8LkRd6D0uSNYtVu/hFSoNs2jvBy/VsGGLbO4VcM96QSPfqxwFB4G1ODq2yLX
	rkVA==
X-Gm-Message-State: APjAAAWPZ8S3B7lJQENa/kvDWmerIOY+3ZrGrWNfihFs++jJDPatP6Gm
	Kbk6+LZa0uR9B3YpWYcejaBtOa5Z
X-Google-Smtp-Source: APXvYqw/QT4OUil2dCI7ItWkf+RcdFRj3h2IBiTKc0Xp34aOfM/KKpF73ay/kg8+OR5de4DIJPH/dg==
X-Received: by 2002:a2e:8108:: with SMTP id d8mr1333355ljg.57.1553695772427;
	Wed, 27 Mar 2019 07:09:32 -0700 (PDT)
Received: from alexander-box.luxoft.com ([62.96.135.139])
	by smtp.gmail.com with ESMTPSA id 1sm4704382ljw.56.2019.03.27.07.09.31
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Wed, 27 Mar 2019 07:09:31 -0700 (PDT)
From: Alexander Kanavin <alex.kanavin@gmail.com>
To: openembedded-core@lists.openembedded.org
Date: Wed, 27 Mar 2019 15:09:19 +0100
Message-Id: <20190327140922.109867-5-alex.kanavin@gmail.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20190327140922.109867-1-alex.kanavin@gmail.com>
References: <20190327140922.109867-1-alex.kanavin@gmail.com>
Subject: [PATCH 5/8] sysklogd: switch SRC_URI to the new, maintained location
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
X-List-Received-Date: Wed, 27 Mar 2019 14:09:32 -0000

The previous SRC_URI seems to be gone, and sysklogd hasn't received
any updates there for a long time.

The new location says:

Origin & References

This is the continuation of the original sysklogd by Martin Schulze.
Now maintained by Joachim Nilsson. Please file bug reports, or send
pull requests for bug fixes and proposed extensions at GitHub.

and generally seems credible: http://troglobit.com/

Signed-off-by: Alexander Kanavin <alex.kanavin@gmail.com>
---
 meta/recipes-extended/sysklogd/sysklogd.inc      | 3 ++-
 meta/recipes-extended/sysklogd/sysklogd_1.5.1.bb | 3 +--
 2 files changed, 3 insertions(+), 3 deletions(-)

diff --git a/meta/recipes-extended/sysklogd/sysklogd.inc b/meta/recipes-extended/sysklogd/sysklogd.inc
index f151dd87f78..749026f8533 100644
--- a/meta/recipes-extended/sysklogd/sysklogd.inc
+++ b/meta/recipes-extended/sysklogd/sysklogd.inc
@@ -13,7 +13,7 @@ LIC_FILES_CHKSUM = "file://COPYING;md5=8ca43cbc842c2336e835926c2166c28b \
 
 inherit update-rc.d update-alternatives systemd
 
-SRC_URI = "http://www.infodrom.org/projects/sysklogd/download/sysklogd-${PV}.tar.gz \
+SRC_URI = "git://github.com/troglobit/sysklogd.git;nobranch=1 \
            file://no-strip-install.patch \
            file://0001-Fix-build-with-musl.patch \
            file://0001-fix-problems-that-causes-a-segmentation-fault-under-.patch \
@@ -24,6 +24,7 @@ SRC_URI = "http://www.infodrom.org/projects/sysklogd/download/sysklogd-${PV}.tar
            file://klogd.service \
            file://tmpfiles.sysklogd.conf \
            "
+S = "${WORKDIR}/git"
 
 SRC_URI_append_e500v2 = " file://no-vectorization.patch"
 
diff --git a/meta/recipes-extended/sysklogd/sysklogd_1.5.1.bb b/meta/recipes-extended/sysklogd/sysklogd_1.5.1.bb
index 975ecc2b633..88bcfd9e4a0 100644
--- a/meta/recipes-extended/sysklogd/sysklogd_1.5.1.bb
+++ b/meta/recipes-extended/sysklogd/sysklogd_1.5.1.bb
@@ -1,4 +1,3 @@
 require sysklogd.inc
 
-SRC_URI[md5sum] = "c70599ab0d037fde724f7210c2c8d7f8"
-SRC_URI[sha256sum] = "5166c185ae23c92e8b9feee66a6e3d0bc944bf673112f53e3ecf62e08ce7c201"
+SRCREV = "930a2b1c0d15b14309a49f14e3f30e905456af4d"
-- 
2.17.1


