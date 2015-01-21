Return-Path: <ross.burton@intel.com>
Received: from mail-we0-f176.google.com (mail-we0-f176.google.com
	[74.125.82.176])
	by mail.openembedded.org (Postfix) with ESMTP id 86AFE72BCE
	for <openembedded-core@lists.openembedded.org>;
	Wed, 21 Jan 2015 17:59:50 +0000 (UTC)
Received: by mail-we0-f176.google.com with SMTP id w62so18090589wes.7
	for <openembedded-core@lists.openembedded.org>;
	Wed, 21 Jan 2015 09:59:50 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:from:to:subject:date:message-id;
	bh=+r2qXVHJFkS+Ls+pc21hIOevrwOoJB8o+WLJd271pWk=;
	b=kaUdliE087U0b2M+AgQ/KsigykoOKpcVzzDrUDyLhWMOBtFFECbJ8BP4M0/RCb8tyN
	G7OC/AWeSh953FHuNXP0jpyvWuA5DA53snQp4kaT1yFAB0zGCidn4wx8uVhBIoibquQG
	7ur05l4IG5J9FDQqOWaSwojg0WxnMTWt2C9o0d62DQoGRBlg7SNqoOUNO3KvnQ0cE7z9
	CEmoXlSyJrUglkXBd5fIp2DNWG6Q3bv++nIgcy/XmZYqtQF21h78IlFhj4hRaUDJ8anZ
	VTtWF5rh4/saOZA2A4z7BJu8ZV3ps2U/1tygip1GgzG5wwjYdJYlPU9u75s9+57JO1IA
	o8cA==
X-Gm-Message-State: ALoCoQmJw2zO+Jhn8jyYSOAwpjsoZnIgM7gZD9G2+YcVi+Qi4Kf2Bo6pXknn9ng99EVW97DzamNa
X-Received: by 10.180.198.166 with SMTP id jd6mr58453493wic.18.1421863190809; 
	Wed, 21 Jan 2015 09:59:50 -0800 (PST)
Received: from flashheart.burtonini.com (35.106.2.81.in-addr.arpa.
	[81.2.106.35])
	by mx.google.com with ESMTPSA id dc1sm8202881wib.18.2015.01.21.09.59.49
	for <openembedded-core@lists.openembedded.org>
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Wed, 21 Jan 2015 09:59:50 -0800 (PST)
From: Ross Burton <ross.burton@intel.com>
To: openembedded-core@lists.openembedded.org
Date: Wed, 21 Jan 2015 17:58:14 +0000
Message-Id: <1421863094-7339-1-git-send-email-ross.burton@intel.com>
X-Mailer: git-send-email 1.7.10.4
Subject: [PATCH] insane: add unknown-configure-option to default WARN_QA
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
X-List-Received-Date: Wed, 21 Jan 2015 17:59:55 -0000


Signed-off-by: Ross Burton <ross.burton@intel.com>
---
 meta/classes/insane.bbclass |    1 +
 1 file changed, 1 insertion(+)

diff --git a/meta/classes/insane.bbclass b/meta/classes/insane.bbclass
index 71e94a0..06246da 100644
--- a/meta/classes/insane.bbclass
+++ b/meta/classes/insane.bbclass
@@ -30,6 +30,7 @@ WARN_QA ?= "ldflags useless-rpaths rpaths staticdev libdir xorg-driver-abi \
             textrel already-stripped incompatible-license files-invalid \
             installed-vs-shipped compile-host-path install-host-path \
             pn-overrides infodir build-deps file-rdeps pkgconfig-sysroot \
+            unknown-configure-option \
             "
 ERROR_QA ?= "dev-so debug-deps dev-deps debug-files arch pkgconfig la \
             perms dep-cmp pkgvarcheck perm-config perm-line perm-link \
-- 
1.7.10.4


