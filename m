Return-Path: <alex.kanavin@gmail.com>
Received: from mail-wr1-f65.google.com (mail-wr1-f65.google.com
	[209.85.221.65])
	by mail.openembedded.org (Postfix) with ESMTP id B3E8C7E042
	for <openembedded-core@lists.openembedded.org>;
	Mon, 20 May 2019 14:11:46 +0000 (UTC)
Received: by mail-wr1-f65.google.com with SMTP id f8so8399728wrt.1
	for <openembedded-core@lists.openembedded.org>;
	Mon, 20 May 2019 07:11:48 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=from:to:cc:subject:date:message-id:in-reply-to:references;
	bh=p7nqd8Kwzn35oAPigPApPXlCBVAuEKBf8HQsrvE35Dk=;
	b=KvTE0fUDrWIKW+lkqXNbb3hLdqiEmiN9jfkR7jeTs6+H5esQ+mOd3ljl4VIytLaA7+
	OBBJ7Wzpb9RfATj2lkuENCufbzT8ySFOQTcmKIVHCEuGD2Z0dAf2/QbOA4NxjNeqV+f9
	QdUBEpuao3W7YkJE8ivLocw+Ewn919NZzbRdoYmZbOewuLjGjn/ZLjXQX9I76BQ8z5Hy
	8TbIKmm4pAr80GqKpIbOmwDVG5QCAuy8XS8MutbOXjmnpbW3/xpu4OfHF1WYaEoeuro9
	7GXlZVljDRNxDGdLEtZHjC8nZJADQ8N2DRQbMcK65Em3BuS3lUf89uhVZUsEnOlb9iNX
	SL2A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
	:references;
	bh=p7nqd8Kwzn35oAPigPApPXlCBVAuEKBf8HQsrvE35Dk=;
	b=rj6tkJsZACtzMd1mYe3/bczjh/dnYIJy0ZAIZdgzPlCGT3g7pGHiTFMem3dLK5SPI+
	1Mgz6ohZmnbNW3KYDr3Y4sq4Mjrmzrg/4X6g7hgCVvSLs0QCaGlsK65ULe9Xbz6qvT3c
	8VsSkNO/ouRWBHoH77IIQK6nc9ao45E284+xEoyCqk5up6L9G63jROR2ok+llk4WYy30
	FpvB6RW4e4OiRhrMGFPXkhXRC7Eho2u0WaSwAfee+TKnuqZa9tpcYKzKw2qMSJA1dzF9
	iWuWA9LgL1PmjUeNwDsT4gkNHsDAorgaAEqiBiRA09XjbnH85olOKOlJwntJIZTuk+y+
	uwSA==
X-Gm-Message-State: APjAAAX9OXMoZbMZ4EcqvQ4+ydOudPkrCIy9ENyRVbqwE7ZhwgOGqzQc
	RfilLOHJWnN0TWTQYInCwULEYUZY
X-Google-Smtp-Source: APXvYqx74bglVla36F8JizxvXI0i3g39vAsQHaJuRo4uTY5Fi54jlYLeSSxKv44oqvySxUW4AsJnoQ==
X-Received: by 2002:adf:b3d4:: with SMTP id x20mr48455693wrd.284.1558361507318;
	Mon, 20 May 2019 07:11:47 -0700 (PDT)
Received: from alexander-box.luxoft.com ([62.96.135.139])
	by smtp.gmail.com with ESMTPSA id
	v5sm36242015wra.83.2019.05.20.07.11.46
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Mon, 20 May 2019 07:11:46 -0700 (PDT)
From: Alexander Kanavin <alex.kanavin@gmail.com>
To: openembedded-core@lists.openembedded.org
Date: Mon, 20 May 2019 16:10:57 +0200
Message-Id: <20190520141125.10805-14-alex.kanavin@gmail.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20190520141125.10805-1-alex.kanavin@gmail.com>
References: <20190520141125.10805-1-alex.kanavin@gmail.com>
Subject: [PATCH 14/42] gawk: upgrade 4.2.1 -> 5.0.0
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
X-List-Received-Date: Mon, 20 May 2019 14:11:47 -0000

Signed-off-by: Alexander Kanavin <alex.kanavin@gmail.com>
---
 meta/recipes-extended/gawk/{gawk_4.2.1.bb => gawk_5.0.0.bb} | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)
 rename meta/recipes-extended/gawk/{gawk_4.2.1.bb => gawk_5.0.0.bb} (90%)

diff --git a/meta/recipes-extended/gawk/gawk_4.2.1.bb b/meta/recipes-extended/gawk/gawk_5.0.0.bb
similarity index 90%
rename from meta/recipes-extended/gawk/gawk_4.2.1.bb
rename to meta/recipes-extended/gawk/gawk_5.0.0.bb
index 96637523947..b1e1b212a3a 100644
--- a/meta/recipes-extended/gawk/gawk_4.2.1.bb
+++ b/meta/recipes-extended/gawk/gawk_5.0.0.bb
@@ -19,8 +19,8 @@ SRC_URI = "${GNU_MIRROR}/gawk/gawk-${PV}.tar.gz \
            file://run-ptest \
 "
 
-SRC_URI[md5sum] = "0256724a0af50cb83ac92f833488673d"
-SRC_URI[sha256sum] = "2b23d51503b2df9a41aa6fddc6002ad7ebf2a386ac19dc1b6be0dd48b0acf6db"
+SRC_URI[md5sum] = "45366249c13aae2bfb00e8e97c3f39b7"
+SRC_URI[sha256sum] = "2d686c9a5b7ba292bc3fa56bc84a1959d721a9d57970a76413156d4b8f1fc67d"
 
 inherit autotools gettext texinfo update-alternatives
 
-- 
2.17.1


