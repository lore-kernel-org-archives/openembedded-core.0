Return-Path: <raj.khem@gmail.com>
Received: from mail-pg1-f175.google.com (mail-pg1-f175.google.com
	[209.85.215.175])
	by mail.openembedded.org (Postfix) with ESMTP id 5EBE07ED4A
	for <openembedded-core@lists.openembedded.org>;
	Mon, 19 Aug 2019 16:43:18 +0000 (UTC)
Received: by mail-pg1-f175.google.com with SMTP id n190so1538707pgn.0
	for <openembedded-core@lists.openembedded.org>;
	Mon, 19 Aug 2019 09:43:19 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=from:to:cc:subject:date:message-id:in-reply-to:references
	:mime-version:content-transfer-encoding;
	bh=mC7ZGWNrZQXXOBbHdt3mn5Y3XpJENHrlSfKIcDDAb48=;
	b=nhcpUjvtC+xBtZcG9sfFDcCWClPfwvrBKG+NK6wiQUfS+7vSCNAbe5ZyzL1FmAGDaX
	mxiirxIyZp7PDQCPDW7Kh5vauplrCfFVb6TA8UcP+6QyC8BACRWpVjlgrqQsYlmwgbof
	xURAggCvYPKFynFJtfSLpU70R0L8V7nzXhFK5Q65+noq749ZYvPIpmn71wIN9b25NcTl
	q986dD0nuIA+hq9j8wV8n9Na9uLRFsnvCdVplovgpVZTbEifeMH0aW7VBEoTsUNc42ao
	88ki9inICQNoeT93cZB/ZR7EZLayC+AExUcA4FZKUJ0fdjczNDHlZeYEfw6ycqXutgOR
	dXTg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
	:references:mime-version:content-transfer-encoding;
	bh=mC7ZGWNrZQXXOBbHdt3mn5Y3XpJENHrlSfKIcDDAb48=;
	b=mAdsw7NULMclLgOdQcl9vxh3qyKmzKQZK45KO6aYDfs6BmKzHnv8CQUeFrkFn7cC+T
	cfilF8MdFy0aEA8EboTtD9THNOoqtFiTOzi1irSO5Ce1VVQ78lpehBnmfhEAeBXQHjqj
	7Ctpwg+fHHJIoBl/3Kmr8cXsHy7rlgWweMSjBR53pSS+fUpCnPOMirP113Lopx/1qlov
	w1dvV7XX8QCirziHQhhkBn7vgzzxvcYOvqeTy3rYTLirrK5W9j9HZdp5aInXb9JHQY7Q
	4vjdLlDH8d/zORBtjZS4c00TSO6QLG/s1DiMMhR38Kz6eC+/5QMHyXQ6RZfpiPzvo+kX
	fnQA==
X-Gm-Message-State: APjAAAWUFLXkQKAsX75sUDtpsyzAnL75d9anaTZSGNnvzsfZft+6hv9O
	SM0BCVnCctGdvMQd4SOdFXz/G9yuYKo=
X-Google-Smtp-Source: APXvYqz4ANsJtpoHhOLrRapHtPbG2v4xaO0pWbPVirwgZ94api3aD9iPTPIz7VO8mJD6gsEMZjz5/g==
X-Received: by 2002:a17:90a:4c:: with SMTP id 12mr20977537pjb.40.1566232999086;
	Mon, 19 Aug 2019 09:43:19 -0700 (PDT)
Received: from apollo.hsd1.ca.comcast.net (c-73-71-176-3.hsd1.ca.comcast.net.
	[73.71.176.3]) by smtp.gmail.com with ESMTPSA id
	f20sm17462791pgg.56.2019.08.19.09.43.18
	(version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
	Mon, 19 Aug 2019 09:43:18 -0700 (PDT)
From: Khem Raj <raj.khem@gmail.com>
To: openembedded-core@lists.openembedded.org
Date: Mon, 19 Aug 2019 09:42:59 -0700
Message-Id: <20190819164259.19878-2-raj.khem@gmail.com>
X-Mailer: git-send-email 2.22.1
In-Reply-To: <20190819164259.19878-1-raj.khem@gmail.com>
References: <20190819164259.19878-1-raj.khem@gmail.com>
MIME-Version: 1.0
Subject: [PATCH 2/2] opensbi: Disable SECURITY_CFLAGS since it cant link with libssp
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
X-List-Received-Date: Mon, 19 Aug 2019 16:43:18 -0000
Content-Transfer-Encoding: 8bit

Signed-off-by: Khem Raj <raj.khem@gmail.com>
---
 meta/recipes-bsp/opensbi/opensbi_0.4.bb | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/meta/recipes-bsp/opensbi/opensbi_0.4.bb b/meta/recipes-bsp/opensbi/opensbi_0.4.bb
index 382752895c..b030436688 100644
--- a/meta/recipes-bsp/opensbi/opensbi_0.4.bb
+++ b/meta/recipes-bsp/opensbi/opensbi_0.4.bb
@@ -49,3 +49,5 @@ FILES_${PN} += "/platform/${RISCV_SBI_PLAT}/firmware/fw_dynamic.*"
 
 COMPATIBLE_HOST = "(riscv64|riscv32).*"
 INHIBIT_PACKAGE_STRIP = "1"
+
+SECURITY_CFLAGS = ""
-- 
2.22.1


