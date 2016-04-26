Return-Path: <andre.draszik@gmail.com>
Received: from mail-wm0-f54.google.com (mail-wm0-f54.google.com [74.125.82.54])
	by mail.openembedded.org (Postfix) with ESMTP id 520E86FEFA
	for <openembedded-core@lists.openembedded.org>;
	Tue, 26 Apr 2016 11:03:06 +0000 (UTC)
Received: by mail-wm0-f54.google.com with SMTP id u206so2413527wme.1
	for <openembedded-core@lists.openembedded.org>;
	Tue, 26 Apr 2016 04:03:07 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:from:to:subject:date:message-id:mime-version
	:content-transfer-encoding;
	bh=3j0aAuwy029ujJ+hSnebQL2UkhyEe75GcYKom+OVmoE=;
	b=NZPXitwsrGnfoD7rtLyIONjqKP14eTtmjPq6qCyrvDA5JyNdpEL4xsSlEcQQptbnsC
	0TAjCeIYkpXJRkmyLd44JE6FdfizKthEqvDMKFujnWhWPYa3Q2HhR6rhLyOzGU95PkZO
	3KTMSWOy+Yb2L1e8HqWGnXYjlASQrx5uMzstbgnrocirfbnERBPJsP5EP8Nzv8DbYGNL
	ScED6duyfnyFPXV4DuWeYXlIBFXeBM2pcEQOIlpeATLjMoold9x5NGS26MLwwNVvZkUX
	1SKos/XINFtYiDqXKkjsD9QxDhoowCQQbE7gOxwIVU6ykEKahNeoYStyb+X1vFvDgwDv
	SGLQ==
X-Gm-Message-State: AOPr4FXeyVRUzRI4SgT72r4SX3lXRrAjvLErYtFwr3URt83O5KIOtKFY9z5xiheZ9l9FCw==
X-Received: by 10.28.230.137 with SMTP id e9mr3159457wmi.0.1461668586766;
	Tue, 26 Apr 2016 04:03:06 -0700 (PDT)
Received: from localhost.localdomain ([185.46.212.56])
	by smtp.gmail.com with ESMTPSA id
	e140sm23551016wma.13.2016.04.26.04.03.05
	for <openembedded-core@lists.openembedded.org>
	(version=TLSv1/SSLv3 cipher=OTHER);
	Tue, 26 Apr 2016 04:03:05 -0700 (PDT)
From: =?UTF-8?q?Andr=C3=A9=20Draszik?= <git@andred.net>
To: openembedded-core@lists.openembedded.org
Date: Tue, 26 Apr 2016 12:03:02 +0100
Message-Id: <1461668582-14069-1-git-send-email-git@andred.net>
X-Mailer: git-send-email 2.8.1
MIME-Version: 1.0
Subject: [PATCH] tune-mips32r2.inc: add soft-float variants
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
X-List-Received-Date: Tue, 26 Apr 2016 11:03:07 -0000
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

From: André Draszik <adraszik@tycoint.com>

Signed-off-by: André Draszik <adraszik@tycoint.com>
---
 meta/conf/machine/include/tune-mips32r2.inc | 12 ++++++++++++
 1 file changed, 12 insertions(+)

diff --git a/meta/conf/machine/include/tune-mips32r2.inc b/meta/conf/machine/include/tune-mips32r2.inc
index 0e95ec8..5e398cb 100644
--- a/meta/conf/machine/include/tune-mips32r2.inc
+++ b/meta/conf/machine/include/tune-mips32r2.inc
@@ -6,6 +6,7 @@ TUNEVALID[mips32r2] = "Enable mips32r2 specific processor optimizations"
 TUNECONFLICTS[mips32r2] = "n64 n32"
 TUNE_CCARGS .= "${@bb.utils.contains('TUNE_FEATURES', 'mips32r2', ' -march=mips32r2', '', d)}"
 
+# hard float
 AVAILTUNES += "mips32r2 mips32r2el"
 
 TUNE_FEATURES_tune-mips32r2 = "${TUNE_FEATURES_tune-mips} mips32r2"
@@ -15,3 +16,14 @@ PACKAGE_EXTRA_ARCHS_tune-mips32r2 = "mips mips32 mips32r2"
 TUNE_FEATURES_tune-mips32r2el = "${TUNE_FEATURES_tune-mipsel} mips32r2"
 MIPSPKGSFX_VARIANT_tune-mips32r2el = "mips32r2el"
 PACKAGE_EXTRA_ARCHS_tune-mips32r2el = "mipsel mips32el mips32r2el"
+
+# soft float
+AVAILTUNES += "mips32r2-nf mips32r2el-nf"
+
+TUNE_FEATURES_tune-mips32r2-nf = "${TUNE_FEATURES_tune-mips-nf} mips32r2"
+MIPSPKGSFX_VARIANT_tune-mips32r2-nf = "mips32r2"
+PACKAGE_EXTRA_ARCHS_tune-mips32r2-nf = "mips-nf mips32-nf mips32r2-nf"
+
+TUNE_FEATURES_tune-mips32r2el-nf = "${TUNE_FEATURES_tune-mipsel-nf} mips32r2"
+MIPSPKGSFX_VARIANT_tune-mips32r2el-nf = "mips32r2el"
+PACKAGE_EXTRA_ARCHS_tune-mips32r2el-nf = "mipsel-nf mips32el-nf mips32r2el-nf"
-- 
2.8.1


