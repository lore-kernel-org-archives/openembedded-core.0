Return-Path: <richard.purdie@linuxfoundation.org>
Received: from mail-wm1-f52.google.com (mail-wm1-f52.google.com
	[209.85.128.52])
	by mail.openembedded.org (Postfix) with ESMTP id 1BAF861649
	for <openembedded-core@lists.openembedded.org>;
	Wed, 19 Feb 2020 22:53:30 +0000 (UTC)
Received: by mail-wm1-f52.google.com with SMTP id t14so10692wmi.5
	for <openembedded-core@lists.openembedded.org>;
	Wed, 19 Feb 2020 14:53:32 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=linuxfoundation.org; s=google;
	h=from:to:subject:date:message-id:mime-version
	:content-transfer-encoding;
	bh=MgRP9OGQNrA242k3PCynVcAjrhMzKXgkqEfwggqLnHs=;
	b=F0wIXtKBiv/IVOMCWuXUsuCKSmixi4+vOFCU3FWeaWV++0KdaHVDvFSNo3p73eqxnW
	q5CM4gfYPz9MdUF3UCPMySOoPcMUIScJaASRno2B+gvkiy5Pf5J9u80cLt+bgU4bOj7k
	V16AtWS3WTVoY9Tjjntmtv9iiMSK+I8jTyy3I=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:subject:date:message-id:mime-version
	:content-transfer-encoding;
	bh=MgRP9OGQNrA242k3PCynVcAjrhMzKXgkqEfwggqLnHs=;
	b=gEeN681Fdz3lGICUN2urKX5jdY3mb2vrD5jhxGFH0MetYunmdBBG0ame2vWdPh5mdE
	4+qiHTQaxNpkgExbkrGTb7iy/ZTq5WgakKgayNt3kdBljf41fHlne8TWYxLouJS4IGz0
	18XfSVG7plt6YIaPOnXCmk1q3QiaQWxIJHTiyoJl+kR6qWyO3V1dMNOEjugiARM/pDnR
	twuWt5QD0EaWaKIptHUdv7DLj5mpziEOFj/fzqW0zij3jCo7JmeOj4IIwadN+bCtwXFC
	E1hszsY0lCCTBdmu+1/M1HIkJymgTR/hb1MulAXMVRj8gEOSxYZyJD9rB6wgvPoTa2ol
	m5Bw==
X-Gm-Message-State: APjAAAUxt68gbSfMxzg+1kN4QM94RQd1/+dD0LUlKXK8zBIhjA/jsaCY
	WTbIJhaZfrMuh9neo6JvYl1agHujvxQ=
X-Google-Smtp-Source: APXvYqzpbznc9ZAEJhv9EFh/RbTtVXLe4EZRsN1zf3UgEngCobIIljTk3a5LRyaPCKTFmF5muq+NhQ==
X-Received: by 2002:a7b:c4cc:: with SMTP id g12mr34035wmk.68.1582152811309;
	Wed, 19 Feb 2020 14:53:31 -0800 (PST)
Received: from hex.int.rpsys.net (5751f4a1.skybroadband.com. [87.81.244.161])
	by smtp.gmail.com with ESMTPSA id
	w8sm1804659wmm.0.2020.02.19.14.53.30
	for <openembedded-core@lists.openembedded.org>
	(version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
	Wed, 19 Feb 2020 14:53:30 -0800 (PST)
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: openembedded-core@lists.openembedded.org
Date: Wed, 19 Feb 2020 22:53:29 +0000
Message-Id: <20200219225329.145039-1-richard.purdie@linuxfoundation.org>
X-Mailer: git-send-email 2.25.0
MIME-Version: 1.0
Subject: [PATCH] scripts/combo-layer: Fix deprecation warning
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
X-List-Received-Date: Wed, 19 Feb 2020 22:53:31 -0000
Content-Transfer-Encoding: 8bit

Resolve:
combo-layer:83: DeprecationWarning: This method will be removed in future versions.  Use 'parser.read_file()' instead.

Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
---
 scripts/combo-layer | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/scripts/combo-layer b/scripts/combo-layer
index 9b50e9873da..a634dd69d2a 100755
--- a/scripts/combo-layer
+++ b/scripts/combo-layer
@@ -80,7 +80,7 @@ class Configuration(object):
         logger.debug("Loading config file %s" % self.conffile)
         self.parser = configparser.ConfigParser()
         with open(self.conffile) as f:
-            self.parser.readfp(f)
+            self.parser.read_file(f)
 
         # initialize default values
         self.commit_msg_template = "Automatic commit to update last_revision"
-- 
2.25.0


