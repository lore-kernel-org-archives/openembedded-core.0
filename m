Return-Path: <raj.khem@gmail.com>
Received: from mail-pf0-f196.google.com (mail-pf0-f196.google.com
	[209.85.192.196])
	by mail.openembedded.org (Postfix) with ESMTP id BFB0365CB6
	for <openembedded-core@lists.openembedded.org>;
	Sat, 14 Oct 2017 15:49:13 +0000 (UTC)
Received: by mail-pf0-f196.google.com with SMTP id p87so12625042pfj.3
	for <openembedded-core@lists.openembedded.org>;
	Sat, 14 Oct 2017 08:49:15 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=from:to:cc:subject:date:message-id:in-reply-to:references;
	bh=Gk04p3auzf6gIP6fTJSLVCjPKVZK+jvet6ep0+Ev+uY=;
	b=fy3yZx7JyR2RTHTTuQoMFV9sNFQ0ubNq+RntSXjzugXBnUETbvurHC6Gsb824v+WUZ
	IWWisfaknexX1r+ECdPv1Xiep7TEcC73MSNMCPPrY3B95k8O2cDVNk3+OxmWA4cGtEH8
	DuGn9yRYOQ21T9C/gUbmKLVikciIaTiXFQ0FkT+oI/WpmLfNhpssgLSbgUQvKspx2TIy
	kZ7lg/sFDv7LhZs6CMv9vv7rIignUvTq2TPyAiu1ppmf2OZYvneni0DD08o3k/mSuGJj
	RF01MPJsk9jplQCrkUk4PfzzBHMYdmE3UJy2gjPepRBYTfqwYp+wleuIOV8x0+HPNDkL
	6wqA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
	:references;
	bh=Gk04p3auzf6gIP6fTJSLVCjPKVZK+jvet6ep0+Ev+uY=;
	b=STPpd8YccO7tuND82EMHxyjcAwkWPGaOHVIziBmq2PsSd6nxRwVUixyr7SmqBHdAEH
	ZnpTxstL2VzvHTyO7av3zh6i6kKyUqiYK3llDEcVxT2WjJ55boRnU67ZmagQf8Yp55pi
	TUa75pgT17LSRSH9249aUXwoRLLgotX6hRrtG3ycik3ySJAqDsDqHDMvOwCdNgFV1RPO
	r+4HRXnn7ka+HgFDU1M0Rb2Y8wMw3A7TSyIZ8Bcb2bQCAakBQ5f2AtMGtrAPPnP/5N/o
	06gWybnwqrz5Yp+6iRN3rzwCK7pDzMVTXooQm7BWuj8qiInIfb1d+3E8l//84SAHb92d
	ps5w==
X-Gm-Message-State: AMCzsaXzdSN/gXVk4lX77Ssrym3FhUYx7JAnn+qI04b7iwGfyhMlENET
	RHbe1hazjBzu1cj4NyTK++q1xQ==
X-Google-Smtp-Source: AOwi7QA30ueET35hW9vHIM+LdGnNdHZmjdau3S6m6d0Iu7t5ZKlk1iTujogxpaTpSXiLSalc9XUoTg==
X-Received: by 10.98.200.20 with SMTP id z20mr4321466pff.65.1507996154808;
	Sat, 14 Oct 2017 08:49:14 -0700 (PDT)
Received: from localhost.localdomain ([2601:646:8882:b8c::74e7])
	by smtp.gmail.com with ESMTPSA id r9sm8384819pfd.6.2017.10.14.08.49.13
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Sat, 14 Oct 2017 08:49:13 -0700 (PDT)
From: Khem Raj <raj.khem@gmail.com>
To: openembedded-core@lists.openembedded.org
Date: Sat, 14 Oct 2017 08:48:56 -0700
Message-Id: <20171014154858.35123-5-raj.khem@gmail.com>
X-Mailer: git-send-email 2.14.2
In-Reply-To: <20171014154858.35123-1-raj.khem@gmail.com>
References: <20171014154858.35123-1-raj.khem@gmail.com>
Subject: [PATCH 5/7] libcheck: Upgrade to 0.11.0+
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
X-List-Received-Date: Sat, 14 Oct 2017 15:49:13 -0000

Signed-off-by: Khem Raj <raj.khem@gmail.com>
---
 .../libcheck/{libcheck_0.10.0.bb => libcheck_git.bb}          | 11 ++++++-----
 1 file changed, 6 insertions(+), 5 deletions(-)
 rename meta/recipes-support/libcheck/{libcheck_0.10.0.bb => libcheck_git.bb} (66%)

diff --git a/meta/recipes-support/libcheck/libcheck_0.10.0.bb b/meta/recipes-support/libcheck/libcheck_git.bb
similarity index 66%
rename from meta/recipes-support/libcheck/libcheck_0.10.0.bb
rename to meta/recipes-support/libcheck/libcheck_git.bb
index 9d34198a96..2c28afefaa 100644
--- a/meta/recipes-support/libcheck/libcheck_0.10.0.bb
+++ b/meta/recipes-support/libcheck/libcheck_git.bb
@@ -5,13 +5,14 @@ SECTION = "devel"
 LICENSE  = "LGPLv2.1+"
 LIC_FILES_CHKSUM = "file://COPYING.LESSER;md5=2d5025d4aa3495befef8f17206a5b0a1"
 
-SRC_URI = "${SOURCEFORGE_MIRROR}/check/check-${PV}.tar.gz \
-          "
+SRCREV = "23ee70fee382df7f604b1756a35a9d4c7b632805"
+
+PV = "0.11.0+git${SRCPV}"
 
-SRC_URI[md5sum] = "53c5e5c77d090e103a17f3ed7fd7d8b8"
-SRC_URI[sha256sum] = "f5f50766aa6f8fe5a2df752666ca01a950add45079aa06416b83765b1cf71052"
+SRC_URI = "git://github.com/libcheck/check;protocol=https\
+          "
 
-S = "${WORKDIR}/check-${PV}"
+S = "${WORKDIR}/git"
 
 inherit autotools pkgconfig texinfo
 
-- 
2.14.2


