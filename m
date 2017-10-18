Return-Path: <otavio.salvador@gmail.com>
Received: from mail-qk0-f196.google.com (mail-qk0-f196.google.com
	[209.85.220.196])
	by mail.openembedded.org (Postfix) with ESMTP id 740487834C
	for <openembedded-core@lists.openembedded.org>;
	Wed, 18 Oct 2017 11:17:40 +0000 (UTC)
Received: by mail-qk0-f196.google.com with SMTP id d67so5720144qkg.5
	for <openembedded-core@lists.openembedded.org>;
	Wed, 18 Oct 2017 04:17:42 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
	:references:organization;
	bh=uhTXmI627sAiH66Pp1m/HSRasf7fUwPQtnrpZpc/qgM=;
	b=Mo2aV6S3Pzi3ep2gpntK3dIcwyHb6uyl/nQf/mMSUW0TJYZvmi3HIYr4ZYeXVz1RDn
	Ezlm5VID/UgJ2ayAKiso5pSMsnqec5G5rZngdbchgGz1S9TGLT5WjJrZ79FYguKVb6iR
	CY6ADyvSr0f6BUAZtrd+HKO/gdYXxu2DlDtkgTywft4bCD8dVFCbtd1wJoYSoUYrvE+8
	2LBV1IFeiC4GELadkpdL7jJwgmlJe+xc+P8JJHTV4DlQFptluBRuAC2R7QG5y0YaGAK1
	scB5BE8E1oNjQjd3egXdKswCw2R+43XJxVgbAXvwCQW9bFyNVN58MjTN4guanzl8JsOX
	Vdzg==
X-Gm-Message-State: AMCzsaWgfK7cLZ5jT4AsRTpCTcGWzbOf1tPTxYpryR7vjxhxIh/Hp/0W
	Wn7yen12YnoJ1RAoz8TjfwHN0g==
X-Google-Smtp-Source: ABhQp+Rz4GzLxD7aAdoofunHHQafdIEHuOfq7wJOEmKBaWclek42+YlZE/vDLdQsHDMSKlHUi2TX/A==
X-Received: by 10.55.80.3 with SMTP id e3mr1645253qkb.254.1508325461318;
	Wed, 18 Oct 2017 04:17:41 -0700 (PDT)
Received: from localhost.localdomain ([181.220.79.73])
	by smtp.gmail.com with ESMTPSA id j7sm7561653qth.68.2017.10.18.04.17.38
	(version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
	Wed, 18 Oct 2017 04:17:40 -0700 (PDT)
Received: by localhost.localdomain (sSMTP sendmail emulation);
	Wed, 18 Oct 2017 09:17:35 -0200
From: Otavio Salvador <otavio@ossystems.com.br>
To: OpenEmbedded Core Mailing List <openembedded-core@lists.openembedded.org>
Date: Wed, 18 Oct 2017 09:17:08 -0200
Message-Id: <20171018111708.2154-4-otavio@ossystems.com.br>
X-Mailer: git-send-email 2.14.2
In-Reply-To: <20171018111708.2154-1-otavio@ossystems.com.br>
References: <20171018111708.2154-1-otavio@ossystems.com.br>
Organization: O.S. Systems Software LTDA.
Cc: Otavio Salvador <otavio@ossystems.com.br>
Subject: [PATCH v5 3/3] libdrm: upgrade to 2.4.84
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
X-List-Received-Date: Wed, 18 Oct 2017 11:17:40 -0000

Signed-off-by: Otavio Salvador <otavio@ossystems.com.br>
---

Changes in v5:
 - new patch

Changes in v4: None
Changes in v3: None
Changes in v2: None

 meta/recipes-graphics/drm/{libdrm_2.4.83.bb => libdrm_2.4.84.bb} | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)
 rename meta/recipes-graphics/drm/{libdrm_2.4.83.bb => libdrm_2.4.84.bb} (93%)

diff --git a/meta/recipes-graphics/drm/libdrm_2.4.83.bb b/meta/recipes-graphics/drm/libdrm_2.4.84.bb
similarity index 93%
rename from meta/recipes-graphics/drm/libdrm_2.4.83.bb
rename to meta/recipes-graphics/drm/libdrm_2.4.84.bb
index a5cb75c266..95f72adae5 100644
--- a/meta/recipes-graphics/drm/libdrm_2.4.83.bb
+++ b/meta/recipes-graphics/drm/libdrm_2.4.84.bb
@@ -16,8 +16,8 @@ SRC_URI = "http://dri.freedesktop.org/libdrm/${BP}.tar.bz2 \
            file://0001-configure.ac-Allow-explicit-enabling-of-cunit-tests.patch \
           "
 
-SRC_URI[md5sum] = "23800953ed7564988872e1e8c61fde31"
-SRC_URI[sha256sum] = "03a52669da60ead62548a35bc430aafb6c2d8dd21ec9dba3a90f96eff5fe36d6"
+SRC_URI[md5sum] = "35b9544bc2ad864acd1abaa1a2b99092"
+SRC_URI[sha256sum] = "7ae9c24d91139ac9a2cdee06fe46dbe1c401a1eda1c0bd2a6d1ecf72f479e0aa"
 
 inherit autotools pkgconfig manpages
 
-- 
2.14.2


