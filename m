Return-Path: <ross.burton@intel.com>
Received: from mail-wg0-f46.google.com (mail-wg0-f46.google.com [74.125.82.46])
	by mail.openembedded.org (Postfix) with ESMTP id 6B8827210E
	for <openembedded-core@lists.openembedded.org>;
	Thu, 15 Jan 2015 11:21:42 +0000 (UTC)
Received: by mail-wg0-f46.google.com with SMTP id x13so14263212wgg.5
	for <openembedded-core@lists.openembedded.org>;
	Thu, 15 Jan 2015 03:21:43 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:from:to:subject:date:message-id;
	bh=eZcBhyhtveAYx+a9cCFkMVDiHQrM2XZpqSYPz3ew4+g=;
	b=ZyPtN46TiFr8+48s2Mg+vn+Xzvrc4s3JcapE1BmFhHEeYBT7smyygE+jz8ek0KB4LI
	ULx1xW/YAmzOayog3aJdOIu+SOmZMEPLsZmy1oW6JObro6aJAPS6KNfaRQc8mov7lOm0
	BEBwW5E9LLDDaYiCE5SIAcZJqZsNi7ZzD0UfUtpmgXmq1vJ76PdIv59AtBeAETktgY+0
	PbDSzZ6ngNi8PAI1u9Ar114QYUtvSFgKhh1GQN7Qlf6sxrQknrBFIq4Qw/KtL15Ju5N1
	zp6lWBz8LkTqpy7OO8Xb+8oIRLDJ3JhK4oyOaqKO77iVpj0EORNcaKeLsmNUcY7S0hrd
	QByQ==
X-Gm-Message-State: ALoCoQl8PXgeYHhbX7N+K+2tY9ilAQQiMw0u1tLJsnFNGbbq7R4xafCwXQv58hm4xwR2F2vPBMLu
X-Received: by 10.194.201.137 with SMTP id ka9mr17574301wjc.66.1421320903224; 
	Thu, 15 Jan 2015 03:21:43 -0800 (PST)
Received: from flashheart.burtonini.com (35.106.2.81.in-addr.arpa.
	[81.2.106.35])
	by mx.google.com with ESMTPSA id r3sm22370423wic.10.2015.01.15.03.21.42
	for <openembedded-core@lists.openembedded.org>
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Thu, 15 Jan 2015 03:21:42 -0800 (PST)
From: Ross Burton <ross.burton@intel.com>
To: openembedded-core@lists.openembedded.org
Date: Thu, 15 Jan 2015 11:20:18 +0000
Message-Id: <1421320818-31989-1-git-send-email-ross.burton@intel.com>
X-Mailer: git-send-email 1.7.10.4
Subject: [PATCH] msmtp: fix configure options
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
X-List-Received-Date: Thu, 15 Jan 2015 11:21:56 -0000

msmtp moved from gnome-keyring to libsecret, so update EXTRA_OECONF.  Also
explicitly disable libgsasl to avoid potential non-deterministic builds in the
future.

Signed-off-by: Ross Burton <ross.burton@intel.com>
---
 meta/recipes-extended/msmtp/msmtp_1.6.1.bb |    2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta/recipes-extended/msmtp/msmtp_1.6.1.bb b/meta/recipes-extended/msmtp/msmtp_1.6.1.bb
index 6ce94fe..c9ad1da 100644
--- a/meta/recipes-extended/msmtp/msmtp_1.6.1.bb
+++ b/meta/recipes-extended/msmtp/msmtp_1.6.1.bb
@@ -17,7 +17,7 @@ SRC_URI[sha256sum] = "c45d47f2dc77484e3f74c0f66aef0d5d95de6c47ed71d9f926d86d546f
 
 inherit gettext autotools update-alternatives pkgconfig
 
-EXTRA_OECONF += "--without-gnome-keyring --without-libidn"
+EXTRA_OECONF += "--without-libsecret --without-libgsasl --without-libidn"
 
 ALTERNATIVE_${PN} = "sendmail"
 ALTERNATIVE_TARGET[sendmail] = "${bindir}/msmtp"
-- 
1.7.10.4


