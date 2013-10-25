Return-Path: <cazfi74@gmail.com>
Received: from mail-la0-f50.google.com (mail-la0-f50.google.com
	[209.85.215.50])
	by mail.openembedded.org (Postfix) with ESMTP id 600166D3B4
	for <openembedded-core@lists.openembedded.org>;
	Fri, 25 Oct 2013 07:39:27 +0000 (UTC)
Received: by mail-la0-f50.google.com with SMTP id ec20so2765513lab.37
	for <openembedded-core@lists.openembedded.org>;
	Fri, 25 Oct 2013 00:39:28 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=from:to:cc:subject:date:message-id:in-reply-to:references
	:in-reply-to:references;
	bh=NqxBW+0Lk6viNfS8lDaVCifpTTxFxnj6Z4uA1O9xBU0=;
	b=GYp+oB2GU3gKwGz2qiKYLHNib5HuUAXYaZeT+CKRni7JXZ5o5g4PTIGfdpQU1mVttA
	aBqv1+y9J/QnxysZqd31/0B7+5wUuIauSJXJeCCjN1vDE+K3jenaaDroKI0a6sd+n3jz
	n0haBPQum+F0uFitNU7e5JWH2kLRZ2Ao+Ng8pwD5DVYt9BEdzzSzEbp054DprejS34pJ
	tNYXDc3fKNSoG7nv6bmrKjd3pBaNSEhMNwAsat1UMh9d7wTwEsWKU/PhU1wpraZy3mYS
	q2IntGJvRKuMvuDFvWPOPCX2WgtMUJ2Jvf7XVZjQRwPuqNPdHrmR5nCtRmCmmA1FbFFU
	mk5A==
X-Received: by 10.152.116.109 with SMTP id jv13mr4312568lab.30.1382686768524; 
	Fri, 25 Oct 2013 00:39:28 -0700 (PDT)
Received: from prime (a91-153-14-158.elisa-laajakaista.fi. [91.153.14.158])
	by mx.google.com with ESMTPSA id l10sm1595640lbh.13.2013.10.25.00.39.26
	for <multiple recipients>
	(version=TLSv1.2 cipher=RC4-SHA bits=128/128);
	Fri, 25 Oct 2013 00:39:27 -0700 (PDT)
Received: from cazfi by prime with local (Exim 4.80)
	(envelope-from <cazfi74@gmail.com>)
	id 1VZbzR-000841-LY; Fri, 25 Oct 2013 10:39:25 +0300
From: Marko Lindqvist <cazfi74@gmail.com>
To: openembedded-core@lists.openembedded.org
Date: Fri, 25 Oct 2013 10:39:23 +0300
Message-Id: <d97f472684f7ac38fac3dbabf92624ca9a2bd7ad.1382686685.git.cazfi74@gmail.com>
X-Mailer: git-send-email 1.8.4.rc3
In-Reply-To: <b4d752157bb874d686fb25ae43e4dc499596c22c.1382686685.git.cazfi74@gmail.com>
References: <b4d752157bb874d686fb25ae43e4dc499596c22c.1382686685.git.cazfi74@gmail.com>
In-Reply-To: <cover.1382686685.git.cazfi74@gmail.com>
References: <cover.1382686685.git.cazfi74@gmail.com>
Subject: [PATCH 3/4] libfm: upgrade to upstream version 1.1.2.2
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
X-List-Received-Date: Fri, 25 Oct 2013 07:39:28 -0000

Signed-off-by: Marko Lindqvist <cazfi74@gmail.com>
---
 .../{libfm-1.1.0 => libfm-1.1.2.2}/fix-make-parallelism-issue.patch | 0
 meta/recipes-support/libfm/{libfm_1.1.0.bb => libfm_1.1.2.2.bb}     | 6 ++----
 2 files changed, 2 insertions(+), 4 deletions(-)
 rename meta/recipes-support/libfm/{libfm-1.1.0 => libfm-1.1.2.2}/fix-make-parallelism-issue.patch (100%)
 rename meta/recipes-support/libfm/{libfm_1.1.0.bb => libfm_1.1.2.2.bb} (82%)

diff --git a/meta/recipes-support/libfm/libfm-1.1.0/fix-make-parallelism-issue.patch b/meta/recipes-support/libfm/libfm-1.1.2.2/fix-make-parallelism-issue.patch
similarity index 100%
rename from meta/recipes-support/libfm/libfm-1.1.0/fix-make-parallelism-issue.patch
rename to meta/recipes-support/libfm/libfm-1.1.2.2/fix-make-parallelism-issue.patch
diff --git a/meta/recipes-support/libfm/libfm_1.1.0.bb b/meta/recipes-support/libfm/libfm_1.1.2.2.bb
similarity index 82%
rename from meta/recipes-support/libfm/libfm_1.1.0.bb
rename to meta/recipes-support/libfm/libfm_1.1.2.2.bb
index 23f132a..1146d16 100644
--- a/meta/recipes-support/libfm/libfm_1.1.0.bb
+++ b/meta/recipes-support/libfm/libfm_1.1.2.2.bb
@@ -10,14 +10,12 @@ LIC_FILES_CHKSUM = "file://COPYING;md5=59530bdf33659b29e73d4adb9f9f6552 \
 SECTION = "x11/libs"
 DEPENDS = "glib-2.0 pango gtk+ menu-cache intltool-native libexif"
 
-PR = "r0"
-
 SRC_URI = "${SOURCEFORGE_MIRROR}/pcmanfm/libfm-${PV}.tar.gz \
            file://fix-make-parallelism-issue.patch \
            "
 
-SRC_URI[md5sum] = "a5bc8b8291cf810c659bfb3af378b5de"
-SRC_URI[sha256sum] = "b9426e588670b53570b808c49abd1d103863614dd3622559b8c3ef1392fe0b3d"
+SRC_URI[md5sum] = "ea3d09b23ef4c37cb84ae57ea16b8f08"
+SRC_URI[sha256sum] = "158e2b6974350d2dab15932b496bb4d448553e60bbf7cdfe4d6e9bd99d19d682"
 
 inherit autotools pkgconfig
 
-- 
1.8.4.rc3


