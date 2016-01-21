Return-Path: <armccurdy@gmail.com>
Received: from mail-oi0-f66.google.com (mail-oi0-f66.google.com
	[209.85.218.66])
	by mail.openembedded.org (Postfix) with ESMTP id E51FC73183
	for <openembedded-core@lists.openembedded.org>;
	Thu, 21 Jan 2016 02:43:35 +0000 (UTC)
Received: by mail-oi0-f66.google.com with SMTP id a202so1409738oib.3
	for <openembedded-core@lists.openembedded.org>;
	Wed, 20 Jan 2016 18:43:36 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=from:to:cc:subject:date:message-id:in-reply-to:references;
	bh=3myAksiwr2kVN9kq59BkA3htlEuQig/uGFa4jevhMhs=;
	b=u2BEptPpndyG8+ZH0JTA+pI8v2BryNT7JCccc2asS6g3/seRojyOI5ZaXRHo7bDh8c
	5btwcFDU533MTNa1Hl7SVbhprT68+on15ZHwQyRPQV7utxj7hKTl6ZOOT6KiD6EdqmsF
	lITLEd+Gn6B+a4PpFpNNGcCX+XNkvKqBT9MaoHxtIzvqA1qqiYbDHxx54mOXH9ueicin
	v9qyrVbBe+3uf71Ox2JbbcgsZIHoBPv5Mv6/UubLgC/h8blhMAjlkgTG9cGkWeNX3Nvv
	5o5W1ccju5hG4GPypbo7VOBnHawBErOWOAFJrGQ+PexBgSa2jBrTDJaVgOuJX+4WbnIn
	uq5g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
	:references;
	bh=3myAksiwr2kVN9kq59BkA3htlEuQig/uGFa4jevhMhs=;
	b=TaF17oXPK6yRDNO4gDFtMoBrB4zZYAlo5Qyo8vUu4hBL9Aw+0waF43pPO5N657bmYE
	qaVGyvSOf+txNQlygR5USpogXq3fAPqZLhowvgKBy8v+AMoNdhTcFHvmpxT8T9qPhBHG
	zcSda/zkfYixCj8gySKxqXjLi3wfxjzucS8xLw47Rsq4456VfVwiZ8uti0BQ/DeXkF6x
	l8+Je+KeKxq6nAPo7tVafW/kSPXOwSN7DgmFa+7kAn9ulj0OWtprANpb+gdXWoauwpke
	oLOGNAWCyXuuCZP/Ewgt9qcF1/qLtW1H9YNrOjA4ZEekfhvqO50W+b52sCJRV/SsiLVh
	f0GA==
X-Gm-Message-State: ALoCoQmB7xjwP7qxoybIW8ffAjoeuUGxmy1aEtdvdENq4k4G5Cju1S8DRhrODgWC2I8Yb3jU1acNOHx0/IUb3wLVOJWc/VvMLw==
X-Received: by 10.202.97.215 with SMTP id v206mr31270443oib.124.1453344216614; 
	Wed, 20 Jan 2016 18:43:36 -0800 (PST)
Received: from e6520.cablelabs.com
	(50-204-102-64-static.hfc.comcastbusiness.net. [50.204.102.64])
	by smtp.gmail.com with ESMTPSA id l3sm19310608oeq.0.2016.01.20.18.43.35
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
	Wed, 20 Jan 2016 18:43:35 -0800 (PST)
From: Andre McCurdy <armccurdy@gmail.com>
To: openembedded-core@lists.openembedded.org
Date: Wed, 20 Jan 2016 18:43:00 -0800
Message-Id: <1453344203-7118-3-git-send-email-armccurdy@gmail.com>
X-Mailer: git-send-email 1.9.1
In-Reply-To: <1453344203-7118-1-git-send-email-armccurdy@gmail.com>
References: <1453344203-7118-1-git-send-email-armccurdy@gmail.com>
Subject: [PATCH 02/25] gst-plugins-package.inc: minor formatting improvements
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
X-List-Received-Date: Thu, 21 Jan 2016 02:43:38 -0000

Signed-off-by: Andre McCurdy <armccurdy@gmail.com>
---
 meta/recipes-multimedia/gstreamer/gst-plugins-package.inc | 7 +++----
 1 file changed, 3 insertions(+), 4 deletions(-)

diff --git a/meta/recipes-multimedia/gstreamer/gst-plugins-package.inc b/meta/recipes-multimedia/gstreamer/gst-plugins-package.inc
index 6441b35..4201113 100644
--- a/meta/recipes-multimedia/gstreamer/gst-plugins-package.inc
+++ b/meta/recipes-multimedia/gstreamer/gst-plugins-package.inc
@@ -47,11 +47,10 @@ ALLOW_EMPTY_${PN}-dev = "1"
 ALLOW_EMPTY_${PN}-staticdev = "1"
 
 PACKAGES += "${PN}-apps ${PN}-meta ${PN}-glib"
-FILES_${PN}-apps = "${bindir}"
-
-RDEPENDS_${PN}-apps += "perl"
-RRECOMMENDS_${PN} += "${PN}-meta"
 
 FILES_${PN} = ""
+FILES_${PN}-apps = "${bindir}"
 FILES_${PN}-glib = "${datadir}/glib-2.0"
 
+RDEPENDS_${PN}-apps += "perl"
+RRECOMMENDS_${PN} += "${PN}-meta"
-- 
1.9.1


