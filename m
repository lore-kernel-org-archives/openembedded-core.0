Return-Path: <otavio.salvador@gmail.com>
Received: from mail-qk0-f194.google.com (mail-qk0-f194.google.com
	[209.85.220.194])
	by mail.openembedded.org (Postfix) with ESMTP id A128078493
	for <openembedded-core@lists.openembedded.org>;
	Wed,  8 Nov 2017 13:17:40 +0000 (UTC)
Received: by mail-qk0-f194.google.com with SMTP id a142so3218087qkb.5
	for <openembedded-core@lists.openembedded.org>;
	Wed, 08 Nov 2017 05:17:41 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
	:references:organization;
	bh=/CCs/qtzPeQjUQALC801HXgvUHhEj3whOxwwC6WUU7g=;
	b=L69PFZcOhpvPyW0BFmiorjgPKtfoK4ldzmySbS0tq2Da2CXWOsCXbg6dlyYtyZsw9K
	UrbGmamiZSTnheAXjPmOQrDC55r7O3qEVm2YNorNkwfjS/BmsbLlCEloWlVJzzJnrSJG
	vyIn5nAQ9nuRPvXw4khxWnx+uiT7XSo98/BlXcmITRyHM4uvZCRVP8NPw+64onD+mUan
	RJbLOk0nhJcBIclL/GMJFT8LusDIWG2Av7mCqVuEdZyeqJDVm6eTWq7battNUXb927jT
	cqw1s+l+0MWOuWEDj3tDyX/Eu9gpCSm/ayUEO/TXE/QCS6oikZTcfewGn1fqK/SXoLgT
	bD5g==
X-Gm-Message-State: AJaThX6nH54doU40jIueIJXvx6kf+ACulq9qNaBo4ZHaa8PuC2M8AwTt
	lBhlw8TJuv1i0cuhA255NvAocg==
X-Google-Smtp-Source: ABhQp+Qmo5YudgbpmcXfj+CsFrML0E+VTXFVsHF/EidPBhMPme2zYAiqYr8wjJ1vzW9+2oZTfd7aMw==
X-Received: by 10.55.40.211 with SMTP id o80mr671311qko.148.1510147061304;
	Wed, 08 Nov 2017 05:17:41 -0800 (PST)
Received: from localhost.localdomain ([181.220.79.73])
	by smtp.gmail.com with ESMTPSA id z7sm2703161qtz.40.2017.11.08.05.17.38
	(version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
	Wed, 08 Nov 2017 05:17:40 -0800 (PST)
Received: by localhost.localdomain (sSMTP sendmail emulation);
	Wed, 08 Nov 2017 11:17:35 -0200
From: Otavio Salvador <otavio@ossystems.com.br>
To: OpenEmbedded Core Mailing List <openembedded-core@lists.openembedded.org>
Date: Wed,  8 Nov 2017 11:17:14 -0200
Message-Id: <20171108131716.26248-3-otavio@ossystems.com.br>
X-Mailer: git-send-email 2.15.0
In-Reply-To: <20171108131716.26248-1-otavio@ossystems.com.br>
References: <20171108131716.26248-1-otavio@ossystems.com.br>
Organization: O.S. Systems Software LTDA.
Cc: Otavio Salvador <otavio@ossystems.com.br>
Subject: [PATCH v7 2/4] libdrm: upgrade to 2.4.88
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
X-List-Received-Date: Wed, 08 Nov 2017 13:17:40 -0000

Signed-off-by: Otavio Salvador <otavio@ossystems.com.br>
---

Changes in v7:
 - upgrade to 2.4.88 release

Changes in v6: None
Changes in v5:
 - new patch

Changes in v4: None
Changes in v3: None
Changes in v2: None

 meta/recipes-graphics/drm/{libdrm_2.4.83.bb => libdrm_2.4.88.bb} | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)
 rename meta/recipes-graphics/drm/{libdrm_2.4.83.bb => libdrm_2.4.88.bb} (93%)

diff --git a/meta/recipes-graphics/drm/libdrm_2.4.83.bb b/meta/recipes-graphics/drm/libdrm_2.4.88.bb
similarity index 93%
rename from meta/recipes-graphics/drm/libdrm_2.4.83.bb
rename to meta/recipes-graphics/drm/libdrm_2.4.88.bb
index a5cb75c266..735f734295 100644
--- a/meta/recipes-graphics/drm/libdrm_2.4.83.bb
+++ b/meta/recipes-graphics/drm/libdrm_2.4.88.bb
@@ -16,8 +16,8 @@ SRC_URI = "http://dri.freedesktop.org/libdrm/${BP}.tar.bz2 \
            file://0001-configure.ac-Allow-explicit-enabling-of-cunit-tests.patch \
           "
 
-SRC_URI[md5sum] = "23800953ed7564988872e1e8c61fde31"
-SRC_URI[sha256sum] = "03a52669da60ead62548a35bc430aafb6c2d8dd21ec9dba3a90f96eff5fe36d6"
+SRC_URI[md5sum] = "fe4d5c77f1468ee73d0bbb30d76945d7"
+SRC_URI[sha256sum] = "b5e55dbac2124e742e639f5b8553e8b7395863bf73dab4f77e99fe2fc25572b5"
 
 inherit autotools pkgconfig manpages
 
-- 
2.15.0


