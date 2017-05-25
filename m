Return-Path: <armccurdy@gmail.com>
Received: from mail-pf0-f195.google.com (mail-pf0-f195.google.com
	[209.85.192.195])
	by mail.openembedded.org (Postfix) with ESMTP id CA8957815F
	for <openembedded-core@lists.openembedded.org>;
	Thu, 25 May 2017 19:50:06 +0000 (UTC)
Received: by mail-pf0-f195.google.com with SMTP id n23so41104108pfb.3
	for <openembedded-core@lists.openembedded.org>;
	Thu, 25 May 2017 12:50:08 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=from:to:cc:subject:date:message-id;
	bh=775LVIeC5IhIpw0hJt1nrDbTtigb91SfAn13SRAh/Q8=;
	b=ilMTuG/EH/m9rM3GRXwDopHnzYR5wCu+BdN/u+rMYCHB3W63iGoBG9ODXsHCTVVhL6
	/sGWDStszykapa5545BZW1sW1/YBxxvLcYpM1T/KgjXDZNzfe/aekHSPPnUGof3csXCR
	+o8MNch0rTAUMWpdcGHPgYmZct+p3dQd3uPNvXK9eEYbeUnOD+cvMYqhu+tliYtxH0G/
	6ijPPJJVwUDZor0rEnMTjnCbN1Z1T7wBzz6JKRRLj/fJ5T66spUTQHeLXubqHx+Gr3CY
	IV+Dv/VWODlpMAjNljrDMfyrTi2UpSeVEysu04WyCY6uq1AMdYJ25soY+1OuaVCHTyqg
	87DQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:cc:subject:date:message-id;
	bh=775LVIeC5IhIpw0hJt1nrDbTtigb91SfAn13SRAh/Q8=;
	b=Rf6zdDFYSev2P/gQcbpCmBV2sYgwpXAQoCKM1ekj/zw/H/M6MkToKNky6E9470nri+
	AuY1TXfjv4c2QKaqGqq15WTux4C3LH5wBicNEvjcPfPGyopCxSSeypvtuefkTN5SEfV7
	JTPZ9qreiMnCEtJ0STeOFieYTXfcVguZZLnju7E+788eF+dMrB61gROrnAaw/MCxzJzT
	aBNGFkYp8iJGf6qf7qVH9SGWxoAJn2T/BCJnRS/lLFVuGozTwGeZEAViQ3XJQ3EKh67U
	l6WlQogmRiPGOvDS7HtqEoHXg3391ndcp+XzmWTa5IpyowfbSNL99EU4eu6J9BrEF1fY
	WamA==
X-Gm-Message-State: AODbwcBAWTPssMOpA9HOo+S9Vo+b/AWh2hmkYvJupxDObL5EqdZNuzDB
	oGKC/Ax+bHchZg==
X-Received: by 10.98.205.65 with SMTP id o62mr46331512pfg.105.1495741807724;
	Thu, 25 May 2017 12:50:07 -0700 (PDT)
Received: from e6520.cablelabs.com ([4.16.80.121])
	by smtp.gmail.com with ESMTPSA id
	z3sm15323684pfk.99.2017.05.25.12.50.06
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
	Thu, 25 May 2017 12:50:06 -0700 (PDT)
From: Andre McCurdy <armccurdy@gmail.com>
To: openembedded-core@lists.openembedded.org
Date: Thu, 25 May 2017 12:50:01 -0700
Message-Id: <1495741801-3123-1-git-send-email-armccurdy@gmail.com>
X-Mailer: git-send-email 1.9.1
Subject: [PATCH] tune-mips32*.inc: use consistent comments across all three .inc files
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
X-List-Received-Date: Thu, 25 May 2017 19:50:07 -0000

No functional changes, just use a consistent set of comments to
separate hard and soft float tuning options.

Signed-off-by: Andre McCurdy <armccurdy@gmail.com>
---
 meta/conf/machine/include/tune-mips32.inc   | 6 +++++-
 meta/conf/machine/include/tune-mips32r2.inc | 4 ++--
 meta/conf/machine/include/tune-mips32r6.inc | 2 +-
 3 files changed, 8 insertions(+), 4 deletions(-)

diff --git a/meta/conf/machine/include/tune-mips32.inc b/meta/conf/machine/include/tune-mips32.inc
index ce0445f..a90c0f0 100644
--- a/meta/conf/machine/include/tune-mips32.inc
+++ b/meta/conf/machine/include/tune-mips32.inc
@@ -6,7 +6,8 @@ TUNEVALID[mips32] = "Enable mips32 specific processor optimizations"
 TUNECONFLICTS[mips32] = "n64 n32"
 TUNE_CCARGS .= "${@bb.utils.contains('TUNE_FEATURES', 'mips32', ' -march=mips32', '', d)}"
 
-AVAILTUNES += "mips32 mips32el mips32-nf mips32el-nf"
+# Base Tunes (Hard Float)
+AVAILTUNES += "mips32 mips32el"
 
 TUNE_FEATURES_tune-mips32 = "${TUNE_FEATURES_tune-mips} mips32"
 MIPSPKGSFX_VARIANT_tune-mips32 = "mips32"
@@ -16,6 +17,9 @@ TUNE_FEATURES_tune-mips32el = "${TUNE_FEATURES_tune-mipsel} mips32"
 MIPSPKGSFX_VARIANT_tune-mips32el = "mips32el"
 PACKAGE_EXTRA_ARCHS_tune-mips32el = "mipsel mips32el"
 
+# Soft Float
+AVAILTUNES += "mips32-nf mips32el-nf"
+
 TUNE_FEATURES_tune-mips32-nf = "${TUNE_FEATURES_tune-mips-nf} mips32"
 MIPSPKGSFX_VARIANT_tune-mips32-nf = "mips32"
 PACKAGE_EXTRA_ARCHS_tune-mips32-nf = "mips-nf mips32-nf"
diff --git a/meta/conf/machine/include/tune-mips32r2.inc b/meta/conf/machine/include/tune-mips32r2.inc
index 5e398cb..14473ca 100644
--- a/meta/conf/machine/include/tune-mips32r2.inc
+++ b/meta/conf/machine/include/tune-mips32r2.inc
@@ -6,7 +6,7 @@ TUNEVALID[mips32r2] = "Enable mips32r2 specific processor optimizations"
 TUNECONFLICTS[mips32r2] = "n64 n32"
 TUNE_CCARGS .= "${@bb.utils.contains('TUNE_FEATURES', 'mips32r2', ' -march=mips32r2', '', d)}"
 
-# hard float
+# Base Tunes (Hard Float)
 AVAILTUNES += "mips32r2 mips32r2el"
 
 TUNE_FEATURES_tune-mips32r2 = "${TUNE_FEATURES_tune-mips} mips32r2"
@@ -17,7 +17,7 @@ TUNE_FEATURES_tune-mips32r2el = "${TUNE_FEATURES_tune-mipsel} mips32r2"
 MIPSPKGSFX_VARIANT_tune-mips32r2el = "mips32r2el"
 PACKAGE_EXTRA_ARCHS_tune-mips32r2el = "mipsel mips32el mips32r2el"
 
-# soft float
+# Soft Float
 AVAILTUNES += "mips32r2-nf mips32r2el-nf"
 
 TUNE_FEATURES_tune-mips32r2-nf = "${TUNE_FEATURES_tune-mips-nf} mips32r2"
diff --git a/meta/conf/machine/include/tune-mips32r6.inc b/meta/conf/machine/include/tune-mips32r6.inc
index dea33ea..44369cb 100644
--- a/meta/conf/machine/include/tune-mips32r6.inc
+++ b/meta/conf/machine/include/tune-mips32r6.inc
@@ -6,7 +6,7 @@ TUNEVALID[mipsisa32r6] = "Enable mipsisa32r6 specific processor optimizations"
 TUNECONFLICTS[mipsisa32r6] = "n64 n32"
 TUNE_CCARGS .= "${@bb.utils.contains('TUNE_FEATURES', 'mipsisa32r6', ' -march=mips32r6', '', d)}"
 
-# Base Tunes
+# Base Tunes (Hard Float)
 AVAILTUNES += "mipsisa32r6 mipsisa32r6el"
 
 TUNE_FEATURES_tune-mipsisa32r6 = "o32 bigendian mipsisa32r6 fpu-hard r6"
-- 
1.9.1


