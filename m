Return-Path: <akuster808@gmail.com>
Received: from mail-pg0-f66.google.com (mail-pg0-f66.google.com [74.125.83.66])
	by mail.openembedded.org (Postfix) with ESMTP id 04D5977BD2
	for <openembedded-core@lists.openembedded.org>;
	Fri,  3 Nov 2017 19:54:56 +0000 (UTC)
Received: by mail-pg0-f66.google.com with SMTP id s75so3350476pgs.0
	for <openembedded-core@lists.openembedded.org>;
	Fri, 03 Nov 2017 12:54:58 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=from:to:subject:date:message-id:in-reply-to:references;
	bh=4JyoYOFTMGdppbKDHOb4Rtrc6MuErdHSq5fWz2bFqxg=;
	b=vam5f8gBAJLp5W8WcmW54W/6Dy+BLUx468MfewWLqiNjuuVpgr78jmtg3bF229Ae8O
	yTX+mnN3LZs/hXeRIzxTBC9axTNRAc2eQj6JFOeH09zkVpVzzMq67t/X3W0Z38s5ZvbQ
	bu7ZAiYgfSVx1hBHbDIRIDFlzMSQFI7TPhkdwhDHFKPmtfGNzmC70yELeZJAztKmmtWn
	ezQyD/qXDtN2M1ml4xe+icixgkm2YIVFG0d8TI1fCpNjJXPHbfDtgOMXjAEb3JWTAKdH
	IYLvLJ6CU0SasX/fNMPOcjX1Usiy8ilAEA9fxabNK0OgNNGZJELfPhlx81MvEBglQdXa
	UuHw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
	:references;
	bh=4JyoYOFTMGdppbKDHOb4Rtrc6MuErdHSq5fWz2bFqxg=;
	b=PlMPiuDlZqKQbsHpI7sTqt14MlKViQD+Wtxx/Ho3nL24N7UKG9r0zH5SAsckKMdsjx
	qwPin/E7KSg5ax++exEkf0YBKTlBGJA8bXJMSX1dgohAnKS+5SWUL5O7xXzBL5u3hU5S
	Ea+wYo7JRmlwAnDmTNYkEX6NZw5a9XD/s9TLK1SOT8Iq6+j/MrYv2nzk3UDVh10tVV1k
	u//kXU0z5xwseRNkFf8FcaPRnqfzXMPHGwV74jxTfwPuR2ADPSU2XSZgGzNadJtRozBK
	aiNUz3EvwplkM+hmWPf/T9gbFh/NEHG9D8KclTKJkxR0lPSLvozZKFJZCL80U/arG+mC
	fmLQ==
X-Gm-Message-State: AMCzsaWV/UFf5ZD3/yx3EKIy93lfqBGoeq9qhXlqsNq2ktvw2ta5dfQl
	iJQ/UTgT4qkqJCiLMli6D8Q=
X-Google-Smtp-Source: ABhQp+Sp/vmhgNfiPWrYJ0UpSNmxegw5fpI33U6k2lumuYAllBCLe/JQCNi6sCzCN7VJ5nlG4suMrw==
X-Received: by 10.159.197.70 with SMTP id d6mr6877512plo.8.1509738898015;
	Fri, 03 Nov 2017 12:54:58 -0700 (PDT)
Received: from akuster-ThinkPad-T460s.mvista.com
	([2601:202:4001:9ea0:78e5:dcc3:4839:af44])
	by smtp.gmail.com with ESMTPSA id
	c26sm12781112pfl.115.2017.11.03.12.54.57
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
	Fri, 03 Nov 2017 12:54:57 -0700 (PDT)
From: Armin Kuster <akuster808@gmail.com>
To: akuster@mvista.com,
	openembedded-core@lists.openembedded.org
Date: Fri,  3 Nov 2017 12:54:39 -0700
Message-Id: <229331c9c5a762707b007860680a7f98c366b3ec.1509738544.git.akuster808@gmail.com>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <cover.1509738544.git.akuster808@gmail.com>
References: <cover.1509738544.git.akuster808@gmail.com>
Subject: [PATCH 05/15] libxkbcommon: update to 0.7.2
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
X-List-Received-Date: Fri, 03 Nov 2017 19:54:57 -0000

Signed-off-by: Armin Kuster <akuster@mvista.com>
---
 .../xorg-lib/{libxkbcommon_0.7.1.bb => libxkbcommon_0.7.2.bb}         | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)
 rename meta/recipes-graphics/xorg-lib/{libxkbcommon_0.7.1.bb => libxkbcommon_0.7.2.bb} (83%)

diff --git a/meta/recipes-graphics/xorg-lib/libxkbcommon_0.7.1.bb b/meta/recipes-graphics/xorg-lib/libxkbcommon_0.7.2.bb
similarity index 83%
rename from meta/recipes-graphics/xorg-lib/libxkbcommon_0.7.1.bb
rename to meta/recipes-graphics/xorg-lib/libxkbcommon_0.7.2.bb
index 81df1dd..e32dc80 100644
--- a/meta/recipes-graphics/xorg-lib/libxkbcommon_0.7.1.bb
+++ b/meta/recipes-graphics/xorg-lib/libxkbcommon_0.7.2.bb
@@ -9,8 +9,8 @@ DEPENDS = "util-macros flex-native bison-native"
 
 SRC_URI = "http://xkbcommon.org/download/${BPN}-${PV}.tar.xz"
 
-SRC_URI[md5sum] = "947ba609cb0239b9462127d5cf8908ee"
-SRC_URI[sha256sum] = "ba59305d2e19e47c27ea065c2e0df96ebac6a3c6e97e28ae5620073b6084e68b"
+SRC_URI[md5sum] = "f53fa65beb5ae4b6a6b7f08f9dedabc4"
+SRC_URI[sha256sum] = "28a4dc2735863bec2dba238de07fcdff28c5dd2300ae9dfdb47282206cd9b9d8"
 
 UPSTREAM_CHECK_URI = "http://xkbcommon.org/"
 
-- 
2.7.4


