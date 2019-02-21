Return-Path: <richard.purdie@linuxfoundation.org>
Received: from mail-wr1-f51.google.com (mail-wr1-f51.google.com
	[209.85.221.51])
	by mail.openembedded.org (Postfix) with ESMTP id C4AB87CB20
	for <openembedded-core@lists.openembedded.org>;
	Thu, 21 Feb 2019 12:41:43 +0000 (UTC)
Received: by mail-wr1-f51.google.com with SMTP id c8so29859345wrs.4
	for <openembedded-core@lists.openembedded.org>;
	Thu, 21 Feb 2019 04:41:45 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=linuxfoundation.org; s=google;
	h=from:to:cc:subject:date:message-id:in-reply-to:references
	:mime-version:content-transfer-encoding;
	bh=SjulXHELJm8enTy/1q2bok3+Z2jVj3zjy9Zt9ntLHZ4=;
	b=IqZuMVFyJTU5co85mPEPy1tJvPQdka3kEQLjHI9aXS10WuVUYKPu/CgEZD6f8epFmq
	LXrodsrfajDiZHYex3oCqTgFs/5EcVGANn/lkQujHKm0phS/9b5zVSe8PBgrPdC2qw+7
	oi9jnrt581a58PswnyAIgYMb6hwwF4SiBtUvQ=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
	:references:mime-version:content-transfer-encoding;
	bh=SjulXHELJm8enTy/1q2bok3+Z2jVj3zjy9Zt9ntLHZ4=;
	b=HEdQnS6RsiGXu+HdvHlAROGiJaIajMP3pWK0VnY324c3sJf9DUQ9lG1ghksnJhFror
	HlZdyosAJmkDkwS+2OyjDYE4ze0lnUunAggBFGxpVN62JLce2WXabJB8xAqxhCRNps72
	J81mDOkjatyFUgE+S8CJKeQ3kJ24tqaeRd3FdMJ5aOhDaJBvJ9VzJft+3tOh8i2RQG4U
	Wy6KEy674my19fk+LkFXamhYs6N5Obz/miof/NtlXo0UR70WEJq+u4PgkNHS17r+XGHS
	GIU1JdmOLv9CEpQMlSTwbDP/Jzi6kQW7zqkKavRZ+F/xiH5x6A7/WrFgYcLGv42+GW6S
	YWLQ==
X-Gm-Message-State: AHQUAuaLQPi1D1UqEYWpA5cemJVHXCmJd3p1fBul6PBa+d+V0cL9lTIq
	sP3G8llvYDlt2av1pEcpoOf8RHGpgIQ=
X-Google-Smtp-Source: AHgI3IZ6rfxE65LLyFS6L5/BGICDcMBBe/NQ7zLmwjlQtENXYP9DCkia58ywAG0dbrhOKuDYl3xaiQ==
X-Received: by 2002:adf:b3c3:: with SMTP id x3mr28529777wrd.294.1550752904237; 
	Thu, 21 Feb 2019 04:41:44 -0800 (PST)
Received: from hex.int.rpsys.net (5751f4a1.skybroadband.com. [87.81.244.161])
	by smtp.gmail.com with ESMTPSA id
	d16sm20787379wru.52.2019.02.21.04.41.42
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Thu, 21 Feb 2019 04:41:42 -0800 (PST)
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: openembedded-core@lists.openembedded.org
Date: Thu, 21 Feb 2019 12:41:27 +0000
Message-Id: <20190221124130.25733-11-richard.purdie@linuxfoundation.org>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20190221124130.25733-1-richard.purdie@linuxfoundation.org>
References: <20190221124130.25733-1-richard.purdie@linuxfoundation.org>
MIME-Version: 1.0
Cc: Tanu Kaskinen <tanuk@iki.fi>
Subject: [PATCH 11/14] sbc: upgrade 1.3 -> 1.4
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
X-List-Received-Date: Thu, 21 Feb 2019 12:41:44 -0000
Content-Transfer-Encoding: 8bit

Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
---
 meta/recipes-multimedia/sbc/{sbc_1.3.bb => sbc_1.4.bb} | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)
 rename meta/recipes-multimedia/sbc/{sbc_1.3.bb => sbc_1.4.bb} (84%)

diff --git a/meta/recipes-multimedia/sbc/sbc_1.3.bb b/meta/recipes-multimedia/sbc/sbc_1.4.bb
similarity index 84%
rename from meta/recipes-multimedia/sbc/sbc_1.3.bb
rename to meta/recipes-multimedia/sbc/sbc_1.4.bb
index 2bb895de980..674d77ef485 100644
--- a/meta/recipes-multimedia/sbc/sbc_1.3.bb
+++ b/meta/recipes-multimedia/sbc/sbc_1.4.bb
@@ -14,8 +14,8 @@ DEPENDS = "libsndfile1"
 
 SRC_URI = "${KERNELORG_MIRROR}/linux/bluetooth/${BP}.tar.xz"
 
-SRC_URI[md5sum] = "2d8b7841f2c11ab287718d562f2b981c"
-SRC_URI[sha256sum] = "e61022cf576f14190241e7071753fdacdce5d1dea89ffd704110fc50be689309"
+SRC_URI[md5sum] = "800fb0908899baa48dc216d8e156cc05"
+SRC_URI[sha256sum] = "518bf46e6bb3dc808a95e1eabad26fdebe8a099c1e781c27ed7fca6c2f4a54c9"
 
 inherit autotools pkgconfig
 
-- 
2.20.1


