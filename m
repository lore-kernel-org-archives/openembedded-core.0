Return-Path: <alex.kanavin@gmail.com>
Received: from mail-wm1-f44.google.com (mail-wm1-f44.google.com
	[209.85.128.44])
	by mail.openembedded.org (Postfix) with ESMTP id 5F3947DFBB
	for <openembedded-core@lists.openembedded.org>;
	Fri, 17 May 2019 18:12:05 +0000 (UTC)
Received: by mail-wm1-f44.google.com with SMTP id f204so7792613wme.0
	for <openembedded-core@lists.openembedded.org>;
	Fri, 17 May 2019 11:12:06 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=from:to:cc:subject:date:message-id:in-reply-to:references;
	bh=VeDZrZEkikt4/Ph08iANpbCDaVcUcT7widJ05AoRd3M=;
	b=b5LOYmtQbu2YCOVQzERlvd6hkZKQNMuusjQvVLpVGKxkorefx9z21e+uRwJLWgjMxq
	7u+w7wk3Y6qtt9Bg0iiqHqfhW0tXY79p9mK++UOi1jOnT20ijI20bxkUBJ4d3dup56cu
	CdoomfRfJLXVKFRQIKPze77CxFSFKCJoN91ZoeiHxWNicLy78Sez4H1QNAMTVbfoWVNZ
	IdZOfsfQSmar6WQpU+KqzWGv7SijGDseKzGI3kWg7na2PWwRYz3y5xbvAlwR7lCYneRA
	kh5Dji8FpZ/XcOZVrb955cdRjE9rWqq3NzGag86wxpwyq4hR7yo+aNblNeDbVlERng/U
	3D6w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
	:references;
	bh=VeDZrZEkikt4/Ph08iANpbCDaVcUcT7widJ05AoRd3M=;
	b=bT4SCz7wYG5iZXR9/tBTifqwgnTBrSZXToiqUlRbmBUZtJtnoC4Fp3wJBGar+YA8ok
	JHGkd4aAYV0Lsb5xsmu9m6pcQPJute5y5GDxWWpU7HvOh6BLlo8h6bw3NfG7Nd/bsC0Z
	i6wU2PpUzpwi166J8MkL0nNSipaAEcJ3kbV2v/wiuZgSn+BO+OWdBMzeDjDxnYSo4mlO
	kwtmlA4Mr4cj6zSrMzBH/DB7o+I747kSM5SbP+VPiA8VH7GpSLbJpySU81BuED003P2K
	HNHAqtTKNaxBJxH0u74yMTWB++VfToo2rVq1VJJ6ik51giU3TuCDjXtoQCMpfIvvj+md
	eP+A==
X-Gm-Message-State: APjAAAXS3fvgTaKxrolvtPl3oi9hlf6QbLdttqx/6cM5Z6ghn8wVHOuE
	0gLK1pknFl5ooHOojBRtmFOiKjyS
X-Google-Smtp-Source: APXvYqwdP8klV6I1YaoMotmiPLPvWGxfO+I5jIjg7Y8r/yT/AE1yv7ryvKEQmz0yr9VAaWDawjbhHA==
X-Received: by 2002:a1c:4045:: with SMTP id n66mr3194478wma.142.1558116725940; 
	Fri, 17 May 2019 11:12:05 -0700 (PDT)
Received: from alexander-box.luxoft.com ([62.96.135.139])
	by smtp.gmail.com with ESMTPSA id
	c63sm10188093wma.29.2019.05.17.11.12.05
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Fri, 17 May 2019 11:12:05 -0700 (PDT)
From: Alexander Kanavin <alex.kanavin@gmail.com>
To: openembedded-core@lists.openembedded.org
Date: Fri, 17 May 2019 20:11:23 +0200
Message-Id: <20190517181151.44001-9-alex.kanavin@gmail.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20190517181151.44001-1-alex.kanavin@gmail.com>
References: <20190517181151.44001-1-alex.kanavin@gmail.com>
Subject: [PATCH 09/37] python3-mako: upgrade 1.0.9 -> 1.0.10
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
X-List-Received-Date: Fri, 17 May 2019 18:12:05 -0000

Signed-off-by: Alexander Kanavin <alex.kanavin@gmail.com>
---
 meta/recipes-devtools/python/python-mako.inc                  | 4 ++--
 .../python/{python3-mako_1.0.9.bb => python3-mako_1.0.10.bb}  | 0
 2 files changed, 2 insertions(+), 2 deletions(-)
 rename meta/recipes-devtools/python/{python3-mako_1.0.9.bb => python3-mako_1.0.10.bb} (100%)

diff --git a/meta/recipes-devtools/python/python-mako.inc b/meta/recipes-devtools/python/python-mako.inc
index 97c624bbc66..20808fe5aca 100644
--- a/meta/recipes-devtools/python/python-mako.inc
+++ b/meta/recipes-devtools/python/python-mako.inc
@@ -8,8 +8,8 @@ PYPI_PACKAGE = "Mako"
 
 inherit pypi
 
-SRC_URI[md5sum] = "d739720f3f0d6a1cb6a96ea7a4760c3e"
-SRC_URI[sha256sum] = "0728c404877cd4ca72c409c0ea372dc5f3b53fa1ad2bb434e1d216c0444ff1fd"
+SRC_URI[md5sum] = "a94d376078dda65f834ea5049a81ebb5"
+SRC_URI[sha256sum] = "7165919e78e1feb68b4dbe829871ea9941398178fa58e6beedb9ba14acf63965"
 
 RDEPENDS_${PN} = "${PYTHON_PN}-html \
                   ${PYTHON_PN}-netclient \
diff --git a/meta/recipes-devtools/python/python3-mako_1.0.9.bb b/meta/recipes-devtools/python/python3-mako_1.0.10.bb
similarity index 100%
rename from meta/recipes-devtools/python/python3-mako_1.0.9.bb
rename to meta/recipes-devtools/python/python3-mako_1.0.10.bb
-- 
2.17.1


