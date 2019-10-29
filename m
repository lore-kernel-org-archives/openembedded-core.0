Return-Path: <akuster808@gmail.com>
Received: from mail-wr1-f48.google.com (mail-wr1-f48.google.com
	[209.85.221.48])
	by mail.openembedded.org (Postfix) with ESMTP id E52067FBA8
	for <openembedded-core@lists.openembedded.org>;
	Tue, 29 Oct 2019 09:47:54 +0000 (UTC)
Received: by mail-wr1-f48.google.com with SMTP id o28so12859202wro.7
	for <openembedded-core@lists.openembedded.org>;
	Tue, 29 Oct 2019 02:47:56 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=from:to:subject:date:message-id:in-reply-to:references;
	bh=eljVyssSJxmUyKZWPskU8yUVm6TBcu1PNgwHImMIIdo=;
	b=e1Fb2DxmEqaY3QF1vg2vR/eStKwxaA+8+o/O6ZWvQtylwOGoAlOmIi4ZFFP+EhxC2R
	q4k9x/XeRuiUyBP1+XmmNMIDNuYbwSrcQa+qWIqgmqXKEy4GO/QywVMENita44vQSdID
	isvoLFIbaUPJ/hcCFASOWCQDHxiLKFoPjg9QUDPtQCVbcic9Ke7409iT1vwWpE9DwwLF
	aZ4Wds99ahh3iap4zq64oUPkoFBeMj/d/2Xi/MYECbTHLzPNM1o6Zz4MGzg4VjHQU8Wo
	x4J+x8jWhQRYXQKJW17IUdJYLo4FCDIL/dbSI5/nrgmGFSyGDB9ngy/lGSI70xpTyhCf
	wxXA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
	:references;
	bh=eljVyssSJxmUyKZWPskU8yUVm6TBcu1PNgwHImMIIdo=;
	b=WhfC5yDmRXAXNmWBfNFUIwTfpOj2tVUxR/uZopPxFYPYzdhYInsGUVrmZlEC6/HDU8
	Nyo+CIbC12WPkjgbE18YKn4q4OhxH0HW2tf/nHRp3I/LQs1GKVx6IUc+vQueLwvPOv7/
	iHR3xOpC2Ccrri8JSUe16HR4RJfMO6jt2BFRWR70XswCWreDzzF077z1Z8p/XIBDN4o7
	04ZWWIFJk6FWkUxGL28BKG7RorIq49jKXL3K6n7veDqXMs7o03MgRWFkkeOcmyrzDA5J
	Uh7+xQj4s6ncUImfwzvT4hqvfvP9amMHQ0sJDlHU3TI9b/LitZrICEnwm6uJoKnsKK4W
	D+Hw==
X-Gm-Message-State: APjAAAVbbL8fXopuRTgXzWCDbRcLzKkd5nLfhSSLEPVKEywZWkohHuce
	QuzO8MALB8ezuGJ52J+zgTuYcRod/d4=
X-Google-Smtp-Source: APXvYqzpM3FjwSOU4uIGagdCju7vCZGtDFsELbjZOIEuNbe/hTWYINCEWnCNrYZGulioJGniubaP5Q==
X-Received: by 2002:adf:efcb:: with SMTP id i11mr1423064wrp.229.1572342475378; 
	Tue, 29 Oct 2019 02:47:55 -0700 (PDT)
Received: from akuster-ThinkPad-T460s.mvista.com ([91.217.168.176])
	by smtp.gmail.com with ESMTPSA id
	36sm29150537wrj.42.2019.10.29.02.47.54
	for <openembedded-core@lists.openembedded.org>
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
	Tue, 29 Oct 2019 02:47:54 -0700 (PDT)
From: Armin Kuster <akuster808@gmail.com>
To: openembedded-core@lists.openembedded.org
Date: Tue, 29 Oct 2019 10:47:28 +0100
Message-Id: <c0c2390de30485c9e68cdf9d8fbce32d9f57f9b0.1572341125.git.akuster808@gmail.com>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <cover.1572341125.git.akuster808@gmail.com>
References: <cover.1572341125.git.akuster808@gmail.com>
Subject: [warrior 15/19] openssl: make OPENSSL_ENGINES match install path
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
X-List-Received-Date: Tue, 29 Oct 2019 09:47:55 -0000

From: George McCollister <george.mccollister@gmail.com>

Set OPENSSL_ENGINES to the path where engines are actually installed.

Signed-off-by: George McCollister <george.mccollister@gmail.com>
Signed-off-by: Ross Burton <ross.burton@intel.com>
(cherry picked from commit 59565fec0b3f3e24eb01c03b671913599cd3134d)
Signed-off-by: Armin Kuster <akuster808@gmail.com>
(cherry picked from commit 578f41124565a7cda738c7fe3d25702ee41b08ed)
Signed-off-by: Armin Kuster <akuster808@gmail.com>
---
 meta/recipes-connectivity/openssl/openssl_1.1.1b.bb | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta/recipes-connectivity/openssl/openssl_1.1.1b.bb b/meta/recipes-connectivity/openssl/openssl_1.1.1b.bb
index df2698f..9e36df8 100644
--- a/meta/recipes-connectivity/openssl/openssl_1.1.1b.bb
+++ b/meta/recipes-connectivity/openssl/openssl_1.1.1b.bb
@@ -148,7 +148,7 @@ do_install_append_class-native () {
 	    OPENSSL_CONF=${libdir}/ssl-1.1/openssl.cnf \
 	    SSL_CERT_DIR=${libdir}/ssl-1.1/certs \
 	    SSL_CERT_FILE=${libdir}/ssl-1.1/cert.pem \
-	    OPENSSL_ENGINES=${libdir}/ssl-1.1/engines
+	    OPENSSL_ENGINES=${libdir}/engines-1.1
 }
 
 do_install_append_class-nativesdk () {
-- 
2.7.4


