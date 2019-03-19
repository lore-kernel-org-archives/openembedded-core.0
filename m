Return-Path: <otavio.salvador@gmail.com>
Received: from mail-qt1-f182.google.com (mail-qt1-f182.google.com
	[209.85.160.182])
	by mail.openembedded.org (Postfix) with ESMTP id 8AE127CE5A
	for <openembedded-core@lists.openembedded.org>;
	Tue, 19 Mar 2019 16:37:09 +0000 (UTC)
Received: by mail-qt1-f182.google.com with SMTP id v32so22852789qtc.10
	for <openembedded-core@lists.openembedded.org>;
	Tue, 19 Mar 2019 09:37:11 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
	:references:mime-version:organization:content-transfer-encoding;
	bh=PLABV/EGZCpGiBNBiMA5Uo0S6A8eEKjN1x7jA0QEiI0=;
	b=rkHAw/olkUWO26/zIYy2/JCo4DIJbsFzNRkNibQP8CiVs+Ac4o3wVCcSPLKc+MGjAJ
	lclnPCZ+bJQ53xgLzr4MspZ+HxjZSyVDVsntV9ySJtAaqzhy/vYE8HklBaGFtEjPAKFo
	E+MxW2M9EjJnbNYpoQ2rfI/p7ONZmfEKBmwOHFmSA9ELDtJc93TrV0D94dBWIQBeprrs
	0RtS3xEUHEQ9yrq3U8aIjkZ+hBFl8XMqupZN3D1P6/5gfGwZ9K6Bry1V9VY9Z3TN/lm5
	U4/koUOoNNkUk3Lw7fRwv0CrQjq932O2G8l1iTKJqCXjnjpr79QC0m1Q70YX93c3U3NB
	+l6A==
X-Gm-Message-State: APjAAAW73QUFFSfySu1NmxJa6ROt0KGp0IzsfsiBvtdWVgEzRW1tcNVn
	ssqpFnu6f+uI8/wcAI90X2GLYAz1
X-Google-Smtp-Source: APXvYqyR78OsnPjl97mWVu+APvWJyY98k8rCnBwCxFDpzFz99TqdqBQZxYFBXODV0hMdvLYh8jq6iw==
X-Received: by 2002:a0c:b758:: with SMTP id q24mr2635962qve.149.1553013430261; 
	Tue, 19 Mar 2019 09:37:10 -0700 (PDT)
Received: from localhost.localdomain ([177.194.204.148])
	by smtp.gmail.com with ESMTPSA id e6sm7526002qkb.77.2019.03.19.09.37.07
	(version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
	Tue, 19 Mar 2019 09:37:09 -0700 (PDT)
Received: by localhost.localdomain (sSMTP sendmail emulation);
	Tue, 19 Mar 2019 13:37:05 -0300
From: Otavio Salvador <otavio@ossystems.com.br>
To: OpenEmbedded Core Mailing List <openembedded-core@lists.openembedded.org>
Date: Tue, 19 Mar 2019 13:36:52 -0300
Message-Id: <20190319163652.24216-3-otavio@ossystems.com.br>
X-Mailer: git-send-email 2.21.0
In-Reply-To: <20190319163652.24216-1-otavio@ossystems.com.br>
References: <20190319163652.24216-1-otavio@ossystems.com.br>
MIME-Version: 1.0
Organization: O.S. Systems Software LTDA.
Cc: Otavio Salvador <otavio@ossystems.com.br>
Subject: [PATCH v5 3/3] openssl10: Upgrade 1.0.2q -> 1.0.2r
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
X-List-Received-Date: Tue, 19 Mar 2019 16:37:09 -0000
Content-Transfer-Encoding: 8bit

Signed-off-by: Otavio Salvador <otavio@ossystems.com.br>
---

Changes in v5:
- new patch

Changes in v4: None
Changes in v3: None
Changes in v2: None

 .../openssl/{openssl10_1.0.2q.bb => openssl10_1.0.2r.bb}      | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)
 rename meta/recipes-connectivity/openssl/{openssl10_1.0.2q.bb => openssl10_1.0.2r.bb} (98%)

diff --git a/meta/recipes-connectivity/openssl/openssl10_1.0.2q.bb b/meta/recipes-connectivity/openssl/openssl10_1.0.2r.bb
similarity index 98%
rename from meta/recipes-connectivity/openssl/openssl10_1.0.2q.bb
rename to meta/recipes-connectivity/openssl/openssl10_1.0.2r.bb
index eacdf8b86e..87df4f517a 100644
--- a/meta/recipes-connectivity/openssl/openssl10_1.0.2q.bb
+++ b/meta/recipes-connectivity/openssl/openssl10_1.0.2r.bb
@@ -53,8 +53,8 @@ SRC_URI_append_class-nativesdk = " \
            file://environment.d-openssl.sh \
            "
 
-SRC_URI[md5sum] = "7563e1ce046cb21948eeb6ba1a0eb71c"
-SRC_URI[sha256sum] = "5744cfcbcec2b1b48629f7354203bc1e5e9b5466998bbccc5b5fcde3b18eb684"
+SRC_URI[md5sum] = "0d2baaf04c56d542f6cc757b9c2a2aac"
+SRC_URI[sha256sum] = "ae51d08bba8a83958e894946f15303ff894d75c2b8bbd44a852b64e3fe11d0d6"
 
 S = "${WORKDIR}/openssl-${PV}"
 
-- 
2.21.0


