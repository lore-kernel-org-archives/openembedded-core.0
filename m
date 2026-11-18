Received: from mail-qt1-f182.google.com (mail-qt1-f182.google.com [209.85.160.182])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.609.1795034979107971508
 for <openembedded-core@lists.openembedded.org>;
 Wed, 18 Nov 2026 12:49:39 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@baylibre.com header.s=google header.b=iT/624QV;
 spf=pass (domain: baylibre.com, ip: 209.85.160.182, mailfrom: tgamblin@baylibre.com)
Received: by mail-qt1-f182.google.com with SMTP id d75a77b69052e-536717a4d83so12045981cf.2
        for <openembedded-core@lists.openembedded.org>; Wed, 18 Nov 2026 12:49:38 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre.com; s=google; t=1795034978; x=1795639778; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=hOHrnJAUciQsAENFBTTOV7OmE4PMlS3XuHf6xMvyoeY=;
        b=iT/624QVUg7S2e2HSnC4z9Y1rkggJnog54srR8v/gsN9FmuJwJzlWl74gCAt5tE6bv
         PD/IItEacrgmx6ZyT0BAFhmBDMnqyLzbrI51dXfYxGuTswqVYmQDlgK8FKKXk5gpCWuv
         0kDB32GeFpPKgF6J5UXWMlRxexzkUr/WP8fn5d8z/UtRfmATZa0+tfjK2pgJrHZe8OEg
         QpIY/a/Gk8J2srcRFwaMJp06Ne0izLRqOodEoVbzkw8rHDVNXmSkoPk//ArPuHkroB3e
         fDKiGMuAJhMHnFx1RiZxciRr5Ka9cpnod+ZsbpHd3m6FHIP4/I3fMEL9Rm4q1JgS84On
         GPDQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795034978; x=1795639778;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=hOHrnJAUciQsAENFBTTOV7OmE4PMlS3XuHf6xMvyoeY=;
        b=pNQXQok0OQcL60O878W/dreXAGjlFSN0kXndUX/j3QHuWJkUD/sq5nbS7RzhXs+950
         f5bned/aIBqRtpHZouq7ow/8TpB2wrgAJBx/pGnMFRMT68DXaXO7VfhHNVZTaP9TbsA+
         Nc/AjG5lOl3I4LU/VgdgKUYexu9GfINbGqI4H+kSoN25AugJRHLIjkYwDD5wNjfyAdM+
         8z9WCjzcmW1RXeYSo/hBZvmCMvJO2B2QG6N/tPdfODZYCIKGeNFnfLxZD9xfMs7SCJ0B
         VwzFUbtpCQmZSJcpgDb4ni6O5+qg2NUHZlzShd8Ec/2FXewfCXEAuTHS4g6wX9nF94d9
         cBSw==
X-Gm-Message-State: APuU4Z+FoRteL83XJaDk+AbkU0v6Rz3RdvZQm03zUyLn6ByZxmPSE+iN
	18f8CV6O7ZUS30PK6omevhP/pPGu4NDvPNsQk8tWM6t7JiO9fVZU6ztMtqNBu7CCMf7a1IkCFCw
	SXgIs
X-Gm-Gg: AYBFou1x+G3dXX80nQ37w+BuzfA8aY7SqAEhz9ociR2XMkl3ixqOXCjeIqifEOF/v/7
	USUsz9joa0AUez30YC+bBB56RD5Q9vIrrEw+Rt92akRbfWitaIOcS8Mw9h7ugqQlI6TCpTCmgcU
	cQI/H48zbH15EgsErCwrWzq+Bic4+sSqA9XtNcQZjv8S+quaDEQVL9b/YAwZOG4JKuVp0MAQQWA
	XixXeDpZxEErD8miOqZ75wbAa2dPfzRsbZANyd9I+cIjRAlHb46Qx0lvUn9w8ElEQnL0bIwYp2n
	eRR/a8Fvr3uuXNqE0jhrBovH5V17+ab94iRLkZi3C7REfYPs3bLvDLohKYXBjDc8r/rDHEr9dvy
	1xecHIumqjc0DGiotFPAe77Ad04a8w88DSZS6bN9gf2vI6IHcZTBdws21JH7RHVrPfyb3JlMIZE
	jHZXDoDk6NPMbpmlU64Qnl1hZoGXjePY8wvZXL1ogQRzn/MuumNRNIXC8HteRbBtbc9C83gxy59
	C9fzwlVg/hOQI9jzQwtS20xrD9vz4MlSB5EC5Tejllh+c7E6VGhb8/Z8HC4ZnAreP809sTlS8Rx
	4wPomnmp6Gc+rlNz5yFk/9Ythj7RQn5OVy67fJOxxe3QzaAVp6JzS8+mKepN/JnhFUjJLrkak9T
	YtJr8
X-Received: by 2002:a05:622a:5c07:b0:533:22c2:6e11 with SMTP id d75a77b69052e-55d5a5b3551mr53423861cf.33.1795034977843;
        Wed, 18 Nov 2026 12:49:37 -0800 (PST)
Return-Path: <tgamblin@baylibre.com>
Received: from megalith.cgocable.net ([2001:1970:3847:e000:e8bd:ca0f:c232:9f10])
        by smtp.gmail.com with ESMTPSA id d75a77b69052e-55d66bca072sm8637541cf.17.2026.11.18.12.49.36
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 18 Nov 2026 12:49:37 -0800 (PST)
From: Trevor Gamblin <tgamblin@baylibre.com>
To: openembedded-core@lists.openembedded.org
Cc: raj.khem@gmail.com,
	mark.hatle@kernel.crashing.org,
	paul@pbarker.dev
Subject: [OE-core][PATCH 09/12] meta/conf/machine/include/riscv/arch-riscv.inc: error on very long package archs
Date: Wed, 18 Nov 2026 15:48:50 -0500
Message-ID: <20261118204853.2155173-10-tgamblin@baylibre.com>
X-Mailer: git-send-email 2.56.0
In-Reply-To: <20261118204853.2155173-1-tgamblin@baylibre.com>
References: <20261118204853.2155173-1-tgamblin@baylibre.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by lin-tor-korg-lkml-alma10-1 with HTTPS for <openembedded-core@lists.openembedded.org>; Wed, 18 Nov 2026 20:49:47 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/250592
Content-Type: text/plain; charset="utf-8"

Tunes that don't set RISCVPKGARCH:tune-<name> fall back to
TUNE_RISCV_PKGARCH, which grows with every extension enabled. This can
easily exceed allowable maximums for build and sstate paths, so make it
a fatal error when it's longer than 64 characters and inform the user
to set RISCVPKGARCH:tune-<name> instead.

Existing tunes already set RISCVPKGARCH:tune-<name>, so they are
unaffected. The longest known fallback is currently Microblaze-V's
riscv64imafdc_zicsr_zifencei_zba_zbb_zbs at 41 characters, which is well
under the set limit.

Signed-off-by: Trevor Gamblin <tgamblin@baylibre.com>
---
 meta/conf/machine/include/riscv/README         | 3 ++-
 meta/conf/machine/include/riscv/arch-riscv.inc | 8 +++++++-
 2 files changed, 9 insertions(+), 2 deletions(-)

diff --git a/meta/conf/machine/include/riscv/README b/meta/conf/machine/include/riscv/README
index ef7a484f25..c66925eb83 100644
--- a/meta/conf/machine/include/riscv/README
+++ b/meta/conf/machine/include/riscv/README
@@ -93,7 +93,8 @@ RISCVPKGARCH - This is the package arch actually used.  As with ARMPKGARCH
                on arm, each tune sets it as a literal in
                RISCVPKGARCH:tune-<name>, so that it only changes when
                deliberately changed.  Tunes that don't set it fall back to
-               TUNE_RISCV_PKGARCH.
+               TUNE_RISCV_PKGARCH, which is an error if that is longer
+               than 64 characters.
 
 The standard variables are defined as:
 
diff --git a/meta/conf/machine/include/riscv/arch-riscv.inc b/meta/conf/machine/include/riscv/arch-riscv.inc
index ff14f94deb..cde35ce56d 100644
--- a/meta/conf/machine/include/riscv/arch-riscv.inc
+++ b/meta/conf/machine/include/riscv/arch-riscv.inc
@@ -301,7 +301,13 @@ TUNE_ARCH = "${TUNE_RISCV_ARCH}"
 # Tunes that don't set it fall back to TUNE_RISCV_PKGARCH, which is built from
 # TUNE_FEATURES above, e.g.:
 #    riscv32imac
-RISCVPKGARCH = "${@d.getVar('RISCVPKGARCH:tune-${DEFAULTTUNE}') or d.getVar('TUNE_RISCV_PKGARCH')}"
+# However, TUNE_RISCV_PKGARCH grows with every extension the tune enables, so to
+# keep build and sstate paths manageable, RISCVPKGARCH:tune-<name> should be set
+# for a custom tune. For TUNE_RISCV_PKGARCH longer than 64 characters, throw an
+# error.
+RISCVPKGARCH = "${@d.getVar('RISCVPKGARCH:tune-${DEFAULTTUNE}') or \
+    ('${TUNE_RISCV_PKGARCH}' if len('${TUNE_RISCV_PKGARCH}') <= 64 else \
+     bb.fatal('The package arch for tune ${DEFAULTTUNE} would be ${TUNE_RISCV_PKGARCH}, which is longer than 64 characters. Set RISCVPKGARCH:tune-${DEFAULTTUNE} to a shorter name.'))}"
 TUNE_PKGARCH = "${RISCVPKGARCH}"
 
 # Misc settings
-- 
2.56.0

