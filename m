Return-Path: <armccurdy@gmail.com>
Received: from mail-pg0-f66.google.com (mail-pg0-f66.google.com [74.125.83.66])
	by mail.openembedded.org (Postfix) with ESMTP id E603574B03
	for <openembedded-core@lists.openembedded.org>;
	Tue, 29 May 2018 20:58:59 +0000 (UTC)
Received: by mail-pg0-f66.google.com with SMTP id m5-v6so2733700pgd.3
	for <openembedded-core@lists.openembedded.org>;
	Tue, 29 May 2018 13:59:01 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=from:to:cc:subject:date:message-id;
	bh=nCV5goknPXZ0I2fu+JnDCwN7ivz9M84d+D9EjUR8hB4=;
	b=PJYjUj2bFnzAyLY9za81CdYogAwa5YMF2Pdxrp25+ahyWvkmZLQILtRfE7zoFGT42n
	ToR2FPG8jvobvsnbrJojDY1zRizBVF7a0PDeX1rpyKiJOw2vO/wrqHN+s5jZlhJw1xOG
	088vlUYr2ED4RhaV/PihrxfH9sT01qa5Pwixy3ofrmnoSWb7Ze4jCt5VuBUm5beW76OL
	tg8sf/XBak90Ccs02r32qeOJLCQBU6/i6lghpgLHwEwNBPYmwkIb9y/SuvSCpofugq8W
	Qkt/HO2xxX8oYqJ7jRQn0QmYazlHatzcFkr01NVlNJuDH5ugH35lXcPYww5+UOEXaGMP
	Wd5g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:cc:subject:date:message-id;
	bh=nCV5goknPXZ0I2fu+JnDCwN7ivz9M84d+D9EjUR8hB4=;
	b=Q7rjvwfneTSOmDbH8ih8E+qvwIG/BOjTmF5EUnxBm/RbikO1Ui6Ake1VWSuXK2F7Xk
	tuBT1mgc0M8w/m8zMOQe8NT+8S2jrYybVDB6E5M18GvkiU4bZocU3DCyNq0I6PDA8nMO
	cephowAVqKxnQ+yzrgxKjJAYXmo2EqMWu4Qi50Ukzmrbgs9nDKffeNwSr0ZW+p0CL+Uy
	UXPEaYmFeKQGOmyErTvNwITSP04N5oTV1+v5svSA9ihVf6llBsNwXchv8qisSMrEZtAt
	OfstVNAvCzMAQRkjn9uZvzGQR/keYSJNS19O/0QoCL7UOu28LL3cBIkKovqlpnh90JSV
	a8gA==
X-Gm-Message-State: ALKqPwd45C+ag+j/zMDTmCpkP8C59D39OiUVxfH1JHWH3wFYg65u/r4j
	9XVM1rxGKClLijFo/twgjlVHGw==
X-Google-Smtp-Source: AB8JxZrxfPHHdYrH4HOyYUcZKOSpEP9kMFye7ti+wxsdOkpMKTOwhG1mKcWxtGRc7S+NqkJL3P0DhA==
X-Received: by 2002:a63:744a:: with SMTP id
	e10-v6mr15084289pgn.275.1527627540644; 
	Tue, 29 May 2018 13:59:00 -0700 (PDT)
Received: from e6520.cablelabs.com ([4.16.80.121])
	by smtp.gmail.com with ESMTPSA id
	o4-v6sm71378465pfg.129.2018.05.29.13.58.59
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
	Tue, 29 May 2018 13:59:00 -0700 (PDT)
From: Andre McCurdy <armccurdy@gmail.com>
To: openembedded-core@lists.openembedded.org
Date: Tue, 29 May 2018 13:58:55 -0700
Message-Id: <1527627535-317-1-git-send-email-armccurdy@gmail.com>
X-Mailer: git-send-email 1.9.1
Subject: [PATCH v2] dropbear: drop obsolete patch 0004-fix-2kb-keys.patch
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
X-List-Received-Date: Tue, 29 May 2018 20:59:00 -0000

The origins of the patch date back to early 2005 (prior to the start
of git history in oe-core) to fix a hardcoded limit on the maximum
size of remote host keys:

  http://familiar.handhelds.narkive.com/b1VGg2bI/problem-w-dropbear-ssh

The hardcoded limit was fixed upstream in dropbear 0.47:

  https://github.com/mkj/dropbear/commit/736f370dce614b717193f45d084e9e009de723ce

The patch has therefore been obsolete since then. It went unnoticed
until now as the patch has continued to apply - it modifies a value
which is not used.

Signed-off-by: Andre McCurdy <armccurdy@gmail.com>
---
 meta/recipes-core/dropbear/dropbear.inc               |  1 -
 .../dropbear/dropbear/0004-fix-2kb-keys.patch         | 19 -------------------
 2 files changed, 20 deletions(-)
 delete mode 100644 meta/recipes-core/dropbear/dropbear/0004-fix-2kb-keys.patch

diff --git a/meta/recipes-core/dropbear/dropbear.inc b/meta/recipes-core/dropbear/dropbear.inc
index 16ac644..a5dcab8 100644
--- a/meta/recipes-core/dropbear/dropbear.inc
+++ b/meta/recipes-core/dropbear/dropbear.inc
@@ -14,7 +14,6 @@ DEPENDS += "${@bb.utils.contains('DISTRO_FEATURES', 'pam', 'libpam', '', d)}"
 
 SRC_URI = "http://matt.ucc.asn.au/dropbear/releases/dropbear-${PV}.tar.bz2 \
            file://0001-urandom-xauth-changes-to-options.h.patch \
-           file://0004-fix-2kb-keys.patch \
            file://0007-fix-localoptions-search-path.patch \
            file://init \
            file://dropbearkey.service \
diff --git a/meta/recipes-core/dropbear/dropbear/0004-fix-2kb-keys.patch b/meta/recipes-core/dropbear/dropbear/0004-fix-2kb-keys.patch
deleted file mode 100644
index 60c6a29..0000000
--- a/meta/recipes-core/dropbear/dropbear/0004-fix-2kb-keys.patch
+++ /dev/null
@@ -1,19 +0,0 @@
-Subject: [PATCH 4/6] fix 2kb keys
-
-Upstream-Status: Inappropriate [configuration]
----
- kex.h | 2 +-
- 1 file changed, 1 insertion(+), 1 deletion(-)
-
-Index: dropbear-2017.75/kex.h
-===================================================================
---- dropbear-2017.75.orig/kex.h
-+++ dropbear-2017.75/kex.h
-@@ -106,6 +106,6 @@ int curve25519_donna(unsigned char *out,
- #endif
- 
- 
--#define MAX_KEXHASHBUF 2000
-+#define MAX_KEXHASHBUF 3000
- 
- #endif /* DROPBEAR_KEX_H_ */
-- 
1.9.1


