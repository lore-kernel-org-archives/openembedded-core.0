Return-Path: <alex.kanavin@gmail.com>
Received: from mail-wr1-f52.google.com (mail-wr1-f52.google.com
	[209.85.221.52])
	by mail.openembedded.org (Postfix) with ESMTP id 39DDD7C0E9
	for <openembedded-core@lists.openembedded.org>;
	Tue, 18 Dec 2018 16:30:20 +0000 (UTC)
Received: by mail-wr1-f52.google.com with SMTP id v13so16540451wrw.5
	for <openembedded-core@lists.openembedded.org>;
	Tue, 18 Dec 2018 08:30:21 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=from:to:cc:subject:date:message-id:in-reply-to:references;
	bh=7Gr7++OTLHdq8ww+BAdIn7+G3jyTtmNcAoxC7LiMHlw=;
	b=G5BSvYta2AN5CdaMZTT3f5+v35Y02pYGcil4HKRoarcAoOMyFWLZjBMr7oz3c9fJgd
	8vMBGF2WHz2GfktN8UbModZFTQnFPG9Vr15kcT2K3UzHLPBhmQFQUrxzGv6qwIK6Ifb5
	IlzASjJZcdnwR0McSGtyGWt+R5QJbMLEoBXu1JwjKqPdgcjA0ZAcW9zF/cIwVbuUqtW5
	pImcbNl6gsW471Ls/RGkHfGidADFsaOd976YKug+Ue1Lct96IvIUgsOLxIjcleKwzm3Z
	a2E8Gv16peKNfiENqCo9ZJeScpcS6VTUpzfS9AwEzlZTeoaMTD35U8fCgEjA6ASPgdkq
	QSZQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
	:references;
	bh=7Gr7++OTLHdq8ww+BAdIn7+G3jyTtmNcAoxC7LiMHlw=;
	b=Unpqu52EK1ekyHm9SRlE2tpGxtK3ZQUB61+Lj+vZPGa1KTalOO6eCA520Q7gBYDtqQ
	oTt9kpvx9ZRi5JHd6/baoC5vTpgvtu7BgHR7vq/q3v3htbYdBbWFi6vLwyS2BrbUd8K6
	tWdB/dXHrayzsnPNzkf0J47XWGGloKmVtj53pV1/rz8gPtF0hz1snulTgMwE1X8LAFm/
	1g+0L9nXznOXs1UDfSAleFUdJXB89fs/LxcCZUG1FLEG2dhZqahOESFKuro1Lxq2C2+9
	y94xfjfkQuM8RL/yBkxpsIlZciR7dI7SBXxkglbbe4C4RwO+q+XaHpIa/DgJG02mjt0i
	OvYA==
X-Gm-Message-State: AA+aEWbGqZNaMqFrvYB6gL5JJFAs21cVlk8/mA1NkNFVsq6BgRFBGELp
	PQ0aeCcdFznRP7P1SpWksVq4QOJt
X-Google-Smtp-Source: AFSGD/Xnx8O8qIuD1f2tbgHcaa+ZnEKrPeZN777asYcNrJrZoWE5b4kL9QAhxIcqCJQwcL9jNfSdHA==
X-Received: by 2002:a5d:6152:: with SMTP id y18mr16267303wrt.141.1545150620532;
	Tue, 18 Dec 2018 08:30:20 -0800 (PST)
Received: from alexander-box.luxoft.com ([62.96.135.139])
	by smtp.gmail.com with ESMTPSA id
	f18sm2237849wrs.92.2018.12.18.08.30.19
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Tue, 18 Dec 2018 08:30:19 -0800 (PST)
From: Alexander Kanavin <alex.kanavin@gmail.com>
To: openembedded-core@lists.openembedded.org
Date: Tue, 18 Dec 2018 17:29:59 +0100
Message-Id: <20181218163005.1330-7-alex.kanavin@gmail.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20181218163005.1330-1-alex.kanavin@gmail.com>
References: <20181218163005.1330-1-alex.kanavin@gmail.com>
Subject: [PATCH 07/13] libdnf: upgrade 0.22.3 -> 0.24.1
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
X-List-Received-Date: Tue, 18 Dec 2018 16:30:20 -0000

Signed-off-by: Alexander Kanavin <alex.kanavin@gmail.com>
---
 .../libdnf/{libdnf_0.22.3.bb => libdnf_0.24.1.bb}               | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta/recipes-devtools/libdnf/{libdnf_0.22.3.bb => libdnf_0.24.1.bb} (95%)

diff --git a/meta/recipes-devtools/libdnf/libdnf_0.22.3.bb b/meta/recipes-devtools/libdnf/libdnf_0.24.1.bb
similarity index 95%
rename from meta/recipes-devtools/libdnf/libdnf_0.22.3.bb
rename to meta/recipes-devtools/libdnf/libdnf_0.24.1.bb
index d0cb01f0ea8..e379d8b256c 100644
--- a/meta/recipes-devtools/libdnf/libdnf_0.22.3.bb
+++ b/meta/recipes-devtools/libdnf/libdnf_0.24.1.bb
@@ -9,7 +9,7 @@ SRC_URI = "git://github.com/rpm-software-management/libdnf \
            file://0001-Add-WITH_TESTS-option.patch \
            "
 
-SRCREV = "5c198ea2357c5779cf83050e5291646c3b186446"
+SRCREV = "04b71d78a2170e930a3c248d48a231b19f823064"
 
 S = "${WORKDIR}/git"
 
-- 
2.17.1


