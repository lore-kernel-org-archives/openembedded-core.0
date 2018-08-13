Return-Path: <richard.purdie@linuxfoundation.org>
Received: from mail-wr1-f41.google.com (mail-wr1-f41.google.com
	[209.85.221.41])
	by mail.openembedded.org (Postfix) with ESMTP id 45F4778F1A
	for <openembedded-core@lists.openembedded.org>;
	Mon, 13 Aug 2018 14:28:38 +0000 (UTC)
Received: by mail-wr1-f41.google.com with SMTP id h10-v6so14442538wre.6
	for <openembedded-core@lists.openembedded.org>;
	Mon, 13 Aug 2018 07:28:39 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=linuxfoundation.org; s=google;
	h=from:to:subject:date:message-id:in-reply-to:references;
	bh=r2l2sNTdO/MYnv8m/Qa/XjvhRuXSeW0SAYTA19dUAfY=;
	b=Y7qeUO6nANB/3KW+o1597xuKnOiFmqW7oXQLO6xfJRsYruug/JmYQBSBpaEr1DNpHB
	S+aa0YI9FuSdOjtFJXA7yOnB9IRWo6ZDtkYOvnN1/0k6bVLJkx+3aSv9/wxTh9g0ppMK
	9370WEXISq6dBytKY4uO/xaIgcJEBC77BIGAA=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
	:references;
	bh=r2l2sNTdO/MYnv8m/Qa/XjvhRuXSeW0SAYTA19dUAfY=;
	b=RoBRdhGRSUMhWZeBfMUtEs+lEURCbBtWCvTrTanDN9mzK86gEFHQCdPtq+bvf4+6gJ
	/ZHcQnjfKTOBJZCdzi0K+cJwUJxf+o5BWc2henGsD0XhdBAZRY6JzrMcI3q+NXNeA1Ow
	5qlU743Qadb7FIMU6gkuMt8U2LlmBZd4q9xrCBW38dg/9J2HJ97oRM1X099+XHLk5H1N
	ItK/Fs5QlwapCHtenj0znte2Twsicvyp2Z3EhnTU2cK2HdFII5tPaHKwadZhVC+qhTZW
	eVKMZLBiaZPwvdr7zkUztWxdlmQdq0xvH4KuAaEHycd7VCGbrxRz5YZXcXITVTHS0Xzm
	AIkw==
X-Gm-Message-State: AOUpUlHlz2JMBRJ2A2mobL7LxCvoyI6bCjkRqv6C+9+SKc0FLFHV9FDS
	e58P+AnHKAnfbX9OOWo+ezGMaTLonaQ=
X-Google-Smtp-Source: AA+uWPzS7HUsxX7snhc5nhlXDJEPTH2aNXmDy6PQDWvs7pHnGBw2maGdy1QDmbwoYN12oHc+XMCWiQ==
X-Received: by 2002:adf:8161:: with SMTP id
	88-v6mr10604775wrm.22.1534170518883; 
	Mon, 13 Aug 2018 07:28:38 -0700 (PDT)
Received: from hex.int.rpsys.net (5751f4a1.skybroadband.com. [87.81.244.161])
	by smtp.gmail.com with ESMTPSA id
	x7-v6sm13488254wrr.95.2018.08.13.07.28.37
	for <openembedded-core@lists.openembedded.org>
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Mon, 13 Aug 2018 07:28:37 -0700 (PDT)
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: openembedded-core@lists.openembedded.org
Date: Mon, 13 Aug 2018 15:28:30 +0100
Message-Id: <20180813142835.5309-2-richard.purdie@linuxfoundation.org>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20180813142835.5309-1-richard.purdie@linuxfoundation.org>
References: <20180813142835.5309-1-richard.purdie@linuxfoundation.org>
Subject: [PATCH 2/7] screen: Add virtual/crypt dependency
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
X-List-Received-Date: Mon, 13 Aug 2018 14:28:38 -0000

screen uses crypt() so add the missing DEPENDS triggered by glibc 2.28.

Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
---
 meta/recipes-extended/screen/screen_4.6.2.bb | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta/recipes-extended/screen/screen_4.6.2.bb b/meta/recipes-extended/screen/screen_4.6.2.bb
index 7a33c31d8cc..375dce949d0 100644
--- a/meta/recipes-extended/screen/screen_4.6.2.bb
+++ b/meta/recipes-extended/screen/screen_4.6.2.bb
@@ -11,7 +11,7 @@ LICENSE = "GPLv3+"
 LIC_FILES_CHKSUM = "file://COPYING;md5=d32239bcb673463ab874e80d47fae504 \
                     file://screen.h;endline=26;md5=3971142989289a8198a544220703c2bf"
 
-DEPENDS = "ncurses \
+DEPENDS = "ncurses virtual/crypt \
           ${@bb.utils.contains('DISTRO_FEATURES', 'pam', 'libpam', '', d)}"
 RDEPENDS_${PN} = "base-files"
 
-- 
2.17.1


