Return-Path: <akuster808@gmail.com>
Received: from mail-wr1-f51.google.com (mail-wr1-f51.google.com
	[209.85.221.51])
	by mail.openembedded.org (Postfix) with ESMTP id B4C347FC18
	for <openembedded-core@lists.openembedded.org>;
	Sat, 26 Oct 2019 06:50:19 +0000 (UTC)
Received: by mail-wr1-f51.google.com with SMTP id q13so4637580wrs.12
	for <openembedded-core@lists.openembedded.org>;
	Fri, 25 Oct 2019 23:50:21 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=from:to:subject:date:message-id:in-reply-to:references;
	bh=toOA5tC9SD9lNazNArWLY/d7qfUnxMP9wHqncPnIoPo=;
	b=SH2kapzUMnh40m9WKbt96b5NrwPjldq6U7G3IIsO1dCEKkzSV7clP036IzB1tzBsls
	zbQXRiiU6bnTfGtlivf7PC5diYKngMfDPqZc/9GrZ9gljKpTgtBst+/4jj/jppcea8h5
	3Fz1401aom89tvPCgf9Dl5fUmSEz6GePhPtGoXfbGIjmxouBq35XAlXClPGrnTmZuCBT
	kiPJ/dfC7HLswYGZVEbJK6/CJp1ZXao+QEhm3peJXhSW1kHFlrYoILetWcggMzmesJY8
	0ofxQC0QUxf4gt82MFh15VFlzM2PWY1dVG2lixq0VHhS3fVdUAKTYxCuPtnHYMZ9XoXW
	/oHA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
	:references;
	bh=toOA5tC9SD9lNazNArWLY/d7qfUnxMP9wHqncPnIoPo=;
	b=TLPkwydoQSefpye795vfRosGiUMuULHQDlxLQpG8kPwmFyvtxXKuKXAoilPd03UknM
	g5voh/4a5ZJMSTYPLEh7rz1D/+PT4V3WLnE4a6GA88bJcPlWv6kftMbCtcyIweed8NcA
	tCpOGtZCoZAR0falFHp5kzAAhYi/MPONRqMGhkh1TpkW6X823mUdjh5n3fpRuafHek41
	9PM9BAc3hmBOZ0XE7JJ3+myqJY35I5X2VepPTnZiwcoir/S2KixroK2wtJxj2NAFR2vl
	o1c4KbasOUxRF+xw3J0vKuVzBYRpym+/sJvdGxPudAvWZPNYSeO7aYvvvoO3fVmSO4Vb
	e/2g==
X-Gm-Message-State: APjAAAWfI9VLZF/NsiC5NfDFgjcVXxJ5WM+Nknw1LAR1HM7vG8ArqauX
	c2tW63gm2Z1nw7kJrmMCze4LvAOkKTg=
X-Google-Smtp-Source: APXvYqzfdngmiadLtW0eAL2sPvlAWJ6gkXho6vopBgYPkMh/v/xeCPUWJYa9dxAubDKvCsUOTM/bEA==
X-Received: by 2002:adf:c98b:: with SMTP id f11mr6579549wrh.274.1572072620203; 
	Fri, 25 Oct 2019 23:50:20 -0700 (PDT)
Received: from akuster-ThinkPad-T460s.controleur.wifipass.org ([178.18.58.186])
	by smtp.gmail.com with ESMTPSA id v6sm4807911wru.72.2019.10.25.23.50.19
	for <openembedded-core@lists.openembedded.org>
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
	Fri, 25 Oct 2019 23:50:19 -0700 (PDT)
From: Armin Kuster <akuster808@gmail.com>
To: openembedded-core@lists.openembedded.org
Date: Fri, 25 Oct 2019 23:49:51 -0700
Message-Id: <578f41124565a7cda738c7fe3d25702ee41b08ed.1572072422.git.akuster808@gmail.com>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <cover.1572072421.git.akuster808@gmail.com>
References: <cover.1572072421.git.akuster808@gmail.com>
Subject: [zeus 19/28] openssl: make OPENSSL_ENGINES match install path
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
X-List-Received-Date: Sat, 26 Oct 2019 06:50:20 -0000

From: George McCollister <george.mccollister@gmail.com>

Set OPENSSL_ENGINES to the path where engines are actually installed.

Signed-off-by: George McCollister <george.mccollister@gmail.com>
Signed-off-by: Ross Burton <ross.burton@intel.com>
(cherry picked from commit 59565fec0b3f3e24eb01c03b671913599cd3134d)
Signed-off-by: Armin Kuster <akuster808@gmail.com>
---
 meta/recipes-connectivity/openssl/openssl_1.1.1d.bb | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta/recipes-connectivity/openssl/openssl_1.1.1d.bb b/meta/recipes-connectivity/openssl/openssl_1.1.1d.bb
index 072f727..8819e19 100644
--- a/meta/recipes-connectivity/openssl/openssl_1.1.1d.bb
+++ b/meta/recipes-connectivity/openssl/openssl_1.1.1d.bb
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


