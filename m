Return-Path: <kergoth@gmail.com>
Received: from mail-oi0-f66.google.com (mail-oi0-f66.google.com
	[209.85.218.66])
	by mail.openembedded.org (Postfix) with ESMTP id 5D51571BA1
	for <openembedded-core@lists.openembedded.org>;
	Thu,  5 Jan 2017 19:46:45 +0000 (UTC)
Received: by mail-oi0-f66.google.com with SMTP id 3so51662441oih.1
	for <openembedded-core@lists.openembedded.org>;
	Thu, 05 Jan 2017 11:46:46 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=from:to:cc:subject:date:message-id:in-reply-to:references;
	bh=ZCTshl3N5gTcbmMamtPGd9bxZMe78RRvtGK4zNFM9Ec=;
	b=tTTKnNE3pXrpTgtROGv2dLIP1Oi0vdHoVIHYo4ZhD586gHIRDfuPfjIghazNDXCBjH
	GhFMwYbud3yT7VThrhDRtmPIvJldHnNgSXaMK1VxxIJ4k7nCAnJ2WkfRe+ZK5xDE8l7v
	zlzajMnnHsJPe6ShW2g6ig0KE84+291JbAPtb5/Or8w7Kx0z3uiBk4IxWNxYEmysEsNt
	kxFVP8aAkocyYUsbI8VzmEHgNjDw/jEWf5x5rj550j7CtIZZKnAZf65ziwnvkL2VWfHQ
	pUxXTDm1OWZhtBoX3bKNZ4f0o3I1PdPzXRlf8zCOz9hx0c1nZGgu3VF9TvYJepLy0dlT
	hjag==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
	:references;
	bh=ZCTshl3N5gTcbmMamtPGd9bxZMe78RRvtGK4zNFM9Ec=;
	b=HaFiQQPn18bBkDdL6oYStFwSRObP33DvHj4E95SjK+54JGJFdpS5tmeW+gnHoY+OAh
	MPWVaInQf6Csk+FRCVOc84RJuas2nd5bsnFCwN+/JjrQpSKBrZNXDJbU7Km1kKOJKfZQ
	vg6SNl+rJgd7jfC/AePJwZFRTKRQ1szze/Z4eJrppsTPWhJ+56M7v6DEyyBJhPfy3bzm
	n2gBNR1bI+4Lu/f1eGQ/fmX6CXK9qgtokXxm6wpC0+q2+pGzHkmpslJBql/F8kTj6pg2
	dQc5z6QAB4OGbD+Cna1HI1OVzaidsziH8Ykkjc44IwqSBMk/luBn3+jg8sbOrphhsBMA
	niqQ==
X-Gm-Message-State: AIkVDXIiTH/FtzUmfG83xi95mPPNx4aaofOycjM6dURLSsFaYgX2s12RjX9cEbHRoJ+TJg==
X-Received: by 10.202.75.139 with SMTP id y133mr33153289oia.193.1483645606011; 
	Thu, 05 Jan 2017 11:46:46 -0800 (PST)
Received: from amyr.alm.mentorg.com (nat-lmt.mentorg.com. [139.181.28.34])
	by smtp.gmail.com with ESMTPSA id d10sm153783otb.4.2017.01.05.11.46.44
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
	Thu, 05 Jan 2017 11:46:45 -0800 (PST)
From: Christopher Larson <kergoth@gmail.com>
To: openembedded-core@lists.openembedded.org
Date: Thu,  5 Jan 2017 12:46:22 -0700
Message-Id: <b8ffb56ed4e664a0ad5cfecd2e99215039a0ab7a.1483645446.git.chris_larson@mentor.com>
X-Mailer: git-send-email 2.8.0
In-Reply-To: <cover.1483645446.git.chris_larson@mentor.com>
References: <cover.1483645446.git.chris_larson@mentor.com>
Cc: Christopher Larson <chris_larson@mentor.com>
Subject: [PATCH 10/16] gstreamer1.0-libav: disable asm for x32
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
X-List-Received-Date: Thu, 05 Jan 2017 19:46:45 -0000

From: Christopher Larson <chris_larson@mentor.com>

The included libav lacks support for x32, so disable the assembly
optimizations.

Signed-off-by: Christopher Larson <chris_larson@mentor.com>
---
 meta/recipes-multimedia/gstreamer/gstreamer1.0-libav.inc | 4 ++++
 1 file changed, 4 insertions(+)

diff --git a/meta/recipes-multimedia/gstreamer/gstreamer1.0-libav.inc b/meta/recipes-multimedia/gstreamer/gstreamer1.0-libav.inc
index ea01163..c228306 100644
--- a/meta/recipes-multimedia/gstreamer/gstreamer1.0-libav.inc
+++ b/meta/recipes-multimedia/gstreamer/gstreamer1.0-libav.inc
@@ -30,6 +30,10 @@ LIBAV_EXTRA_CONFIGURE_COMMON_ARG = "--target-os=linux \
   ${GSTREAMER_1_0_DEBUG} \
   --cross-prefix='${HOST_PREFIX}'"
 
+# Disable assembly optimizations for X32, as this libav lacks the support
+PACKAGECONFIG_remove_linux-gnux32 = "yasm"
+LIBAV_EXTRA_CONFIGURE_COMMON_ARG_append_linux-gnux32 = " --disable-asm"
+
 LIBAV_EXTRA_CONFIGURE_COMMON = \
 '${LIBAV_EXTRA_CONFIGURE}="${LIBAV_EXTRA_CONFIGURE_COMMON_ARG}"'
 
-- 
2.8.0


