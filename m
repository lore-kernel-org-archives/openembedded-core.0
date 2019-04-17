Return-Path: <richard.purdie@linuxfoundation.org>
Received: from mail-wr1-f68.google.com (mail-wr1-f68.google.com
	[209.85.221.68])
	by mail.openembedded.org (Postfix) with ESMTP id 0F54A6C109
	for <openembedded-core@lists.openembedded.org>;
	Wed, 17 Apr 2019 16:00:06 +0000 (UTC)
Received: by mail-wr1-f68.google.com with SMTP id h4so32659559wre.7
	for <openembedded-core@lists.openembedded.org>;
	Wed, 17 Apr 2019 09:00:07 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=linuxfoundation.org; s=google;
	h=from:to:subject:date:message-id:in-reply-to:references:mime-version
	:content-transfer-encoding;
	bh=QOLY6fjOHMFIX10N3SFqeQfDOZ8inHUOgmK03Qz/TMQ=;
	b=JC4jPOKNiBR6SOhp1ugECNvAgVnk4Xf2zzNlHZpIZsdh8vUb8X+e7LNE8sv4mul9s9
	413F4/G9B3Hq7ef9RTBZj0r+5sPzo8AgfURC8zu6WVgKAwB6GvqhoPZjER/wCTDqQGQ9
	Ur8yincF4CoylNuCmd9EE+8cnloKnAUyOYyqw=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
	:references:mime-version:content-transfer-encoding;
	bh=QOLY6fjOHMFIX10N3SFqeQfDOZ8inHUOgmK03Qz/TMQ=;
	b=U+BPA17pF2R+LvTyGuprEzpbt3vevqSrMxRIa9zfjOnGPH/3r8D6WsS/rfZOBMZJdM
	FkFUvogCtiZLXJwuv8wAjiUOSJ/K5qSm5OCUFmSOyzjrfNb0wzPvm+Nt5obnuBnAoEUT
	2Wm3q8oQHFZBE4LnDAITpQOd8woF3ms7xevL1l2qsmcn6MPovL+KtcDmqZZYM2ImZJhy
	qOp7IduVotHMMlBtjMhLmJx9CCWgtFL7zS5h8+S9JfgNB1PtJS9kP988BhfQu4S14Phv
	/wd4aYOwmcTuOl8gNrjDc24wz01B8MC1oPrf3nE66JwRsL5BC2Q+YOU6qOQmkPHcxcRo
	bfNA==
X-Gm-Message-State: APjAAAXuNfSU0RRBztEI+etSoqH6FWNORc3pU1JXsRaVvYPVAGTRBQcd
	DBv688MxOk+xSpLN7yc0ERalTxx0JtQ=
X-Google-Smtp-Source: APXvYqyfKr6Sc1/kjLbApV/co+dE6ghu7rQw0Sc/wXS6LMLwGNBwskv+zlR3rv7tsNDXikGKJ/7JAg==
X-Received: by 2002:adf:ec87:: with SMTP id z7mr22777601wrn.44.1555516806734; 
	Wed, 17 Apr 2019 09:00:06 -0700 (PDT)
Received: from hex.int.rpsys.net (5751f4a1.skybroadband.com. [87.81.244.161])
	by smtp.gmail.com with ESMTPSA id
	t81sm5290330wmb.5.2019.04.17.09.00.05
	for <openembedded-core@lists.openembedded.org>
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Wed, 17 Apr 2019 09:00:06 -0700 (PDT)
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: openembedded-core@lists.openembedded.org
Date: Wed, 17 Apr 2019 16:59:46 +0100
Message-Id: <20190417155947.24890-2-richard.purdie@linuxfoundation.org>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20190417155947.24890-1-richard.purdie@linuxfoundation.org>
References: <20190417155947.24890-1-richard.purdie@linuxfoundation.org>
MIME-Version: 1.0
Subject: [PATCH 2/3] core-image-sato-sdk-ptest: Include more ptests in ptest image
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
X-List-Received-Date: Wed, 17 Apr 2019 16:00:06 -0000
Content-Transfer-Encoding: 8bit

There are recipes not included in core-image-sato-sdk which have ptests, include
these in our ptest test image using the new include file.

Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
---
 meta/recipes-sato/images/core-image-sato-sdk-ptest.bb | 4 ++++
 1 file changed, 4 insertions(+)

diff --git a/meta/recipes-sato/images/core-image-sato-sdk-ptest.bb b/meta/recipes-sato/images/core-image-sato-sdk-ptest.bb
index 57395992cc2..61cb9c6626c 100644
--- a/meta/recipes-sato/images/core-image-sato-sdk-ptest.bb
+++ b/meta/recipes-sato/images/core-image-sato-sdk-ptest.bb
@@ -1,9 +1,13 @@
 require core-image-sato-sdk.bb
+require conf/distro/include/ptest-packagelists.inc
 
 DESCRIPTION += "Also includes ptest packages."
 
 IMAGE_FEATURES += "ptest-pkgs"
 
+# Also include ptests which may not otherwise be included in a sato image
+IMAGE_INSTALL += "${PTESTS_FAST} ${PTESTS_SLOW}"
+
 # This image is sufficiently large (~1.8GB) that we need to be careful that it fits in a live
 # image (which has a 4GB limit), so nullify the overhead factor (1.3x out of the
 # box) and explicitly add just 1300MB.
-- 
2.20.1


