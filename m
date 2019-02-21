Return-Path: <richard.purdie@linuxfoundation.org>
Received: from mail-wr1-f45.google.com (mail-wr1-f45.google.com
	[209.85.221.45])
	by mail.openembedded.org (Postfix) with ESMTP id 98B8C7CB21
	for <openembedded-core@lists.openembedded.org>;
	Thu, 21 Feb 2019 12:41:38 +0000 (UTC)
Received: by mail-wr1-f45.google.com with SMTP id w17so29810243wrn.12
	for <openembedded-core@lists.openembedded.org>;
	Thu, 21 Feb 2019 04:41:40 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=linuxfoundation.org; s=google;
	h=from:to:cc:subject:date:message-id:in-reply-to:references
	:mime-version:content-transfer-encoding;
	bh=fkdIcrjQ7J9bdLSzL7ZsqMSA/U6OX70Y2+oQgHV7k2U=;
	b=Dby2nCFhOXxuIDbjUXA9e8moIDVdlyEwPA+gy6sPwiAaj83KRBQquFYXlTG42584d+
	ZKADhdPNgC/AAM3VFiIvZxMHu4OkaoGhpC0EpEH8rUPXJUYd+88tI5PDL1b0hNcwxWeX
	l9s8g4MKf2JBq2g722D4b1Vj42LxoXfZ8R5x8=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
	:references:mime-version:content-transfer-encoding;
	bh=fkdIcrjQ7J9bdLSzL7ZsqMSA/U6OX70Y2+oQgHV7k2U=;
	b=f4/2LcV877LIPhjM0l6L2HMjhtMYsCBtgQoRdSNMi0ciLJCknbJAhYeblQblr4Hwy6
	kPtqS48Qw5kefSFp2FvIGWIUnyMhQnzvX9hBIMfmpJlvwrmUIjyyQLs+5rcowPTMNEZP
	lcNYlU8HC5jdsefTrvRHYcUKRsj4iCneuSnacTzpd26tuaBz0KL3wQB17OuaxNVgHucG
	7nfIEGLaG/7UC0tqJbl2md3IERJ5RyWHDUdh+5s7ysDAVKMOUFLsbT4dqv6xVcgvYfMj
	pKXQkueNnnQu9MVgq/Nen2AVzZhaGZcpBxIt6+piEr1rPR+WCnTHbHcdNkiHt8rGJ//Z
	LS5Q==
X-Gm-Message-State: AHQUAubfXR2RZSOXLNpR7Umm93Mj3C3ddftCJNpPA9gNRD4TIjUI9sXe
	KRH19Q+Q9QBJarI/XxmQj37m+mlC9IU=
X-Google-Smtp-Source: AHgI3IYO8iPdSLv6l7XwLd2ahuD2xNvwAzPBMEE77napAkaF5n9bvB0q4anLqjteBs7U/mziZXEglg==
X-Received: by 2002:a05:6000:92:: with SMTP id
	m18mr28047545wrx.258.1550752899202; 
	Thu, 21 Feb 2019 04:41:39 -0800 (PST)
Received: from hex.int.rpsys.net (5751f4a1.skybroadband.com. [87.81.244.161])
	by smtp.gmail.com with ESMTPSA id
	d16sm20787379wru.52.2019.02.21.04.41.38
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Thu, 21 Feb 2019 04:41:38 -0800 (PST)
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: openembedded-core@lists.openembedded.org
Date: Thu, 21 Feb 2019 12:41:23 +0000
Message-Id: <20190221124130.25733-7-richard.purdie@linuxfoundation.org>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20190221124130.25733-1-richard.purdie@linuxfoundation.org>
References: <20190221124130.25733-1-richard.purdie@linuxfoundation.org>
MIME-Version: 1.0
Subject: [PATCH 07/14] libxau: upgrade 1.0.8 -> 1.0.9
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
X-List-Received-Date: Thu, 21 Feb 2019 12:41:39 -0000
Content-Transfer-Encoding: 8bit

Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
---
 .../xorg-lib/{libxau_1.0.8.bb => libxau_1.0.9.bb}             | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)
 rename meta/recipes-graphics/xorg-lib/{libxau_1.0.8.bb => libxau_1.0.9.bb} (76%)

diff --git a/meta/recipes-graphics/xorg-lib/libxau_1.0.8.bb b/meta/recipes-graphics/xorg-lib/libxau_1.0.9.bb
similarity index 76%
rename from meta/recipes-graphics/xorg-lib/libxau_1.0.8.bb
rename to meta/recipes-graphics/xorg-lib/libxau_1.0.9.bb
index 8c52475b855..dcfc66652a8 100644
--- a/meta/recipes-graphics/xorg-lib/libxau_1.0.8.bb
+++ b/meta/recipes-graphics/xorg-lib/libxau_1.0.9.bb
@@ -20,5 +20,5 @@ XORG_PN = "libXau"
 
 BBCLASSEXTEND = "native nativesdk"
 
-SRC_URI[md5sum] = "685f8abbffa6d145c0f930f00703b21b"
-SRC_URI[sha256sum] = "fdd477320aeb5cdd67272838722d6b7d544887dfe7de46e1e7cc0c27c2bea4f2"
+SRC_URI[md5sum] = "c5f16288f2da9f071b29111d68797480"
+SRC_URI[sha256sum] = "ccf8cbf0dbf676faa2ea0a6d64bcc3b6746064722b606c8c52917ed00dcb73ec"
-- 
2.20.1


