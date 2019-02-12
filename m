Return-Path: <raj.khem@gmail.com>
Received: from mail-pg1-f194.google.com (mail-pg1-f194.google.com
	[209.85.215.194])
	by mail.openembedded.org (Postfix) with ESMTP id 2BB646BF38
	for <openembedded-core@lists.openembedded.org>;
	Tue, 12 Feb 2019 05:48:00 +0000 (UTC)
Received: by mail-pg1-f194.google.com with SMTP id g189so726797pgc.5
	for <openembedded-core@lists.openembedded.org>;
	Mon, 11 Feb 2019 21:48:02 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=from:to:cc:subject:date:message-id:in-reply-to:references
	:mime-version:content-transfer-encoding;
	bh=pPrWUhqEw4CtFMdMUz8OR0TgIP8L0gTgO7rzpuEuAwg=;
	b=LZPXsB3Tgo79YlDnjmkiFkhg0q+jLdzQ0KAVvMUYMKyYBMhKnaC9trR8uNhL5SaTxU
	z83ms8870llD21j9Ebh/QDVJia44AaKuMIA7UsHw+FkJwbqUd4LryuLG7r2gzbDRIres
	ZznWPifW0sXNxNMzP9Yeb3Vnj0M1DMddh9zFyfeDy3r0k9hLNh+48pLkqw5qsZu7TSzf
	CKd93+bhey+Epm6I4x5CVYfrkWUSVsxv647nPaicCey8iqP1mpgMNWFoRjuWyvP/aCW5
	8pMlwzPcgZ5RUwSJinthdbGqHU2fuT+tuAausgxdlTnHAbG+t+g+hJiv7CkAxVqUCo0+
	4zVA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
	:references:mime-version:content-transfer-encoding;
	bh=pPrWUhqEw4CtFMdMUz8OR0TgIP8L0gTgO7rzpuEuAwg=;
	b=Io5KRRwrO1y1Oqja9GQFO1k+JKFQZGNkZ68Wx6hqIvGMHPY0845XoESp6Ex6o7Mb5C
	hrY9ykekfdt7zEtyHV/pvZikq+eUyFvhFOfhHmrl5nWHRFMK/AUIFE0YG8AYeUjibE7w
	yyu2mpeb7oP6ib2NQjmgGAuWdHQGBacECCvgJYTG4HqtGfXw3PadoJp1lHOFfGA9Fiox
	bklzCV/hkhJiwq2Mr/R7NLhYmacf3PwKyicGERhJm5PHwhnXADbgd+WiwdieiyBcMeQ3
	VHfBEqMelorzA66Pl/+D3lXBPjhck0BYCAjqOZPTyzEiNq1jEqGbb4CkJ7dFgw0cf9Jo
	KLaA==
X-Gm-Message-State: AHQUAua4SmLu9rl5zqIn0HBmTbV5lQlMtAtIGM6iIykT9QpGu5d4rHP4
	6F9iXABQEHi2PvBZcedIaq7jCCc3
X-Google-Smtp-Source: AHgI3IZoqEjgdlv60qPuvgJmawAg2j2jKMFPxEu5GS1yC8Nd1OOM29IJ8MPe8iDsEkXVH/8x+3rzdA==
X-Received: by 2002:a65:6497:: with SMTP id e23mr2045643pgv.89.1549950481696; 
	Mon, 11 Feb 2019 21:48:01 -0800 (PST)
Received: from apollo.hsd1.ca.comcast.net ([2601:646:8500:6bc6::dc44])
	by smtp.gmail.com with ESMTPSA id
	b15sm2020017pfj.44.2019.02.11.21.48.01
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Mon, 11 Feb 2019 21:48:01 -0800 (PST)
From: Khem Raj <raj.khem@gmail.com>
To: openembedded-core@lists.openembedded.org
Date: Mon, 11 Feb 2019 21:47:53 -0800
Message-Id: <20190212054754.2801-2-raj.khem@gmail.com>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20190212054754.2801-1-raj.khem@gmail.com>
References: <20190212054754.2801-1-raj.khem@gmail.com>
MIME-Version: 1.0
Subject: [PATCH 2/3] libc-package.bbclass: Use install utility to create directories with right permissions
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
X-List-Received-Date: Tue, 12 Feb 2019 05:48:01 -0000
Content-Transfer-Encoding: 8bit

Could fix issues where dirs with wrong permission is created with mkdir -p

Signed-off-by: Khem Raj <raj.khem@gmail.com>
---
 meta/classes/libc-package.bbclass | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta/classes/libc-package.bbclass b/meta/classes/libc-package.bbclass
index 0b4c666a74..34025635ce 100644
--- a/meta/classes/libc-package.bbclass
+++ b/meta/classes/libc-package.bbclass
@@ -61,7 +61,7 @@ LOCALETREESRC ?= "${PKGD}"
 do_prep_locale_tree() {
 	treedir=${WORKDIR}/locale-tree
 	rm -rf $treedir
-	mkdir -p $treedir/${base_bindir} $treedir/${base_libdir} $treedir/${datadir} $treedir/${localedir}
+	install -d $treedir/${base_bindir} $treedir/${base_libdir} $treedir/${datadir} $treedir/${localedir}
 	tar -cf - -C ${LOCALETREESRC}${datadir} -p i18n | tar -xf - -C $treedir/${datadir}
 	# unzip to avoid parsing errors
 	for i in $treedir/${datadir}/i18n/charmaps/*gz; do 
-- 
2.20.1


