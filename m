Return-Path: <alex.kanavin@gmail.com>
Received: from mail-ed1-f65.google.com (mail-ed1-f65.google.com
	[209.85.208.65])
	by mail.openembedded.org (Postfix) with ESMTP id 0DB426041E
	for <openembedded-core@lists.openembedded.org>;
	Thu, 30 Jan 2020 15:21:42 +0000 (UTC)
Received: by mail-ed1-f65.google.com with SMTP id p23so4214591edr.5
	for <openembedded-core@lists.openembedded.org>;
	Thu, 30 Jan 2020 07:21:44 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=from:to:cc:subject:date:message-id:in-reply-to:references
	:mime-version:content-transfer-encoding;
	bh=QvbBgGcLfPxXvUNWEq0tSZBoCD0mgipBPFWknwFpGnk=;
	b=ZivO+Ncj+xJgBib2Avymd2rCalkZU+eRIbKt29Y5W+J7xRPtiLfbhfOEwrlbpzMtYr
	09eGCyhGy4/N0GqJh4N0+oVcB1LF+Wsc5/56MvMG0JXiQng0hl9DGWFnxKGO5TK918te
	UJ6n89AGsWsAIXyAbjXgJWS6vNsY+K16F67LCnVfu9tjT6nVKM8hJcczTYsqR1ed8wCN
	OGudDO/I5AUbinksocEseoaWhchEjIxo0x2myk/fBpM3nn25uJ6sikniQxSbYQQzL5oM
	XyEcotLIXCN4Oh/43Z67S5Z+zQRKdGmJmRk+K1RrDRLOwrhvFyXj9AitN5Aj0i6vm+Y3
	jZBQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
	:references:mime-version:content-transfer-encoding;
	bh=QvbBgGcLfPxXvUNWEq0tSZBoCD0mgipBPFWknwFpGnk=;
	b=mtuEbdfzT+nvFdAXUq0inoocjPW8Mxo10AJRTRG22mCVskkWS4ZlVwuW8FCBoyH43o
	VWeGWUuKW9iCoM+ZsHQc1EOEE5Z4DMNX/t2+CCJj7h0ThbNpxK7o91utuV2DgTZwxC3W
	sEOIGh7G0R7qki9mHuGC3k5hSW8P5GzwbX7Bw9vVa1JabJ1b21egMO2jTlKBmnlyQ6xS
	MSOfmz3MRueu35h3/m9KvZYX9idFq43mENzeIAmbtlzUSnQF5ujSjpoHgQPDQzuxB/ga
	/N5ewkKDZNWAqArlr0hm+5uMJ29rSKen9OonWzxRCOZddoIBo85P/gvPDnz2HWaND534
	rwwg==
X-Gm-Message-State: APjAAAX2RjNL6bDvZGLCH7ThdNfhabSWYqnTHQLmiJTlkYh9PCzyQvF2
	KjvF+nOCN/NOZ4MWtG+gO8bmZWhH
X-Google-Smtp-Source: APXvYqz02kkXMxgfmBk+x7AQFIv4SWY+SMvXkEUlp5POSnh2V6W4D6k2bPTe8vraQufC6ML48/lT6g==
X-Received: by 2002:adf:ee82:: with SMTP id b2mr32782625wro.194.1580288887544; 
	Wed, 29 Jan 2020 01:08:07 -0800 (PST)
Received: from linux-f9zs.box (cable-95-168-152-69.cust.telecolumbus.net.
	[95.168.152.69]) by smtp.gmail.com with ESMTPSA id
	a62sm1550224wmh.33.2020.01.29.01.08.06
	(version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
	Wed, 29 Jan 2020 01:08:07 -0800 (PST)
From: Alexander Kanavin <alex.kanavin@gmail.com>
To: openembedded-core@lists.openembedded.org
Date: Wed, 29 Jan 2020 10:07:16 +0100
Message-Id: <20200129090738.1398-2-alex.kanavin@gmail.com>
X-Mailer: git-send-email 2.25.0
In-Reply-To: <20200129090738.1398-1-alex.kanavin@gmail.com>
References: <20200129090738.1398-1-alex.kanavin@gmail.com>
MIME-Version: 1.0
Subject: [PATCH 02/24] findutils: drop upstream-version-is-even
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
X-List-Received-Date: Fri, 31 Jan 2020 09:28:18 -0000
Content-Transfer-Encoding: 8bit

Upstream seems to have dropped the odd-even policy

Signed-off-by: Alexander Kanavin <alex.kanavin@gmail.com>
---
 meta/recipes-extended/findutils/findutils.inc | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta/recipes-extended/findutils/findutils.inc b/meta/recipes-extended/findutils/findutils.inc
index a0e1f8962c5..9aa7239825b 100644
--- a/meta/recipes-extended/findutils/findutils.inc
+++ b/meta/recipes-extended/findutils/findutils.inc
@@ -8,7 +8,7 @@ SECTION = "console/utils"
 
 SRC_URI = "${GNU_MIRROR}/${BPN}/${BP}.tar.xz"
 
-inherit autotools gettext texinfo update-alternatives upstream-version-is-even
+inherit autotools gettext texinfo update-alternatives
 
 ALTERNATIVE_${PN} = "find xargs"
 ALTERNATIVE_PRIORITY = "100"
-- 
2.25.0


