Return-Path: <raj.khem@gmail.com>
Received: from mail-pf1-f174.google.com (mail-pf1-f174.google.com
	[209.85.210.174])
	by mail.openembedded.org (Postfix) with ESMTP id 21EF061437
	for <openembedded-core@lists.openembedded.org>;
	Sat, 15 Feb 2020 23:23:40 +0000 (UTC)
Received: by mail-pf1-f174.google.com with SMTP id i6so6919100pfc.1
	for <openembedded-core@lists.openembedded.org>;
	Sat, 15 Feb 2020 15:23:42 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=from:to:cc:subject:date:message-id:mime-version
	:content-transfer-encoding;
	bh=vBahR3pC8csUICyMZwEv6Dt6XaKJCMtvRIptrQHR5m4=;
	b=HHI0HscpauKEpO48P3Uyk1vFlvUQriZXlpOPBnyHSg8pCad/BoEOiaaQrlmkPXKQr+
	mF/sFO8QcZAkPvP/mUt4Ber9gLPDmebensKZrA0DgTBPbgcv63rkkDtMwtOL1N5EJ7Av
	Prnkx2pPeHfkqt/PEP1eOpGAFQEKw5Gbi1VoB0zApuXH+8Hj+9mgX1l58/rWrd30tjRt
	sBPt5+QdE8I96ZpQZYyrCFeuCsRfvLeptUvy8M1RahscRxzFg6oaiFG3pYZeGFtnsn1i
	eGf+POLvOUaiXGUrxj5tdyORriYlmJeQLYF7HlKSOkPUKa84tn+LRBsXxO+/G+MtqURI
	P0tg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
	:content-transfer-encoding;
	bh=vBahR3pC8csUICyMZwEv6Dt6XaKJCMtvRIptrQHR5m4=;
	b=ZdOT+Hx1vx0jxu+kDc/wo7DcGiR/hiqE649F4hbWUXXAxhiKn84HaWT5VaPVAnXQr5
	qHUt9XHMBuEMYBHZZSqkpdO/jaiL0v/pTuujXXmyXqW46oYAOoUNu+tYuCbopEjpZ1kC
	J4NmWWKuSrybjC9QAfXZrNNra0x3cc7+OA2byvfoNM/fcHfmnPW2QhkcROFAMtEzjdBU
	17OvBBgk3R41VwruCKN+yFmCCmTkXdN3EudRtcbvlOaHZ3DOQqC6zFXZc19hJAvPJxxw
	bcXT/t5UPzPQTD4xa0c2bSwdfNDURH8PdRubPFrRWGhlLY+7NtNybbbE3OzR3BXThADg
	Uklg==
X-Gm-Message-State: APjAAAUaczrx7ACfuzBO247BLvf4mFD10i2gZ5IjwW76NQdqYp7nUyzO
	foKDPBCkIxMe/4jxw96T5q9/J4W33j8=
X-Google-Smtp-Source: APXvYqz9tAW2XUFLX3hqAgPa+X/fTz9TSzgCad+foMK1pFqbnngRzkpqQnBVxGAN9ubtxtIE5k5cvg==
X-Received: by 2002:a63:6607:: with SMTP id a7mr10975798pgc.310.1581809021634; 
	Sat, 15 Feb 2020 15:23:41 -0800 (PST)
Received: from apollo.hsd1.ca.comcast.net ([2601:646:9200:4e0::709])
	by smtp.gmail.com with ESMTPSA id
	i64sm11993428pgc.51.2020.02.15.15.23.40
	(version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
	Sat, 15 Feb 2020 15:23:41 -0800 (PST)
From: Khem Raj <raj.khem@gmail.com>
To: openembedded-core@lists.openembedded.org
Date: Sat, 15 Feb 2020 15:23:38 -0800
Message-Id: <20200215232339.1859-1-raj.khem@gmail.com>
X-Mailer: git-send-email 2.25.0
MIME-Version: 1.0
Subject: [PATCH] insane.bbclass: Correct typo inhert->inherit
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
X-List-Received-Date: Sat, 15 Feb 2020 23:23:41 -0000
Content-Transfer-Encoding: 8bit

Signed-off-by: Khem Raj <raj.khem@gmail.com>
---
 meta/classes/insane.bbclass | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta/classes/insane.bbclass b/meta/classes/insane.bbclass
index 7425b8cbd5..478240fa57 100644
--- a/meta/classes/insane.bbclass
+++ b/meta/classes/insane.bbclass
@@ -194,7 +194,7 @@ def package_qa_check_mime(path, name, d, elf, messages):
     """
 
     if d.getVar("datadir") + "/mime/packages" in path and path.endswith('.xml') and not bb.data.inherits_class("mime", d):
-        package_qa_add_message(messages, "mime", "package contains mime types but does not inhert mime: %s path '%s'" % \
+        package_qa_add_message(messages, "mime", "package contains mime types but does not inherit mime: %s path '%s'" % \
                  (name, package_qa_clean_path(path,d)))
 
 QAPATHTEST[mime-xdg] = "package_qa_check_mime_xdg"
-- 
2.25.0


