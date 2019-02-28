Return-Path: <alex.kanavin@gmail.com>
Received: from mail-wr1-f68.google.com (mail-wr1-f68.google.com
	[209.85.221.68])
	by mail.openembedded.org (Postfix) with ESMTP id 1E8DC7CC46
	for <openembedded-core@lists.openembedded.org>;
	Thu, 28 Feb 2019 13:15:19 +0000 (UTC)
Received: by mail-wr1-f68.google.com with SMTP id w17so21887869wrn.12
	for <openembedded-core@lists.openembedded.org>;
	Thu, 28 Feb 2019 05:15:21 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=from:to:cc:subject:date:message-id:in-reply-to:references;
	bh=3ZTS6lrQcJFmyR6+j4zCbYxhgDdweFTR0cqRNbmsw04=;
	b=V4ehqiFifPg6zO0mPP4mmcIZYHe052to8a35/zpKEAzt5SHDPi9fAMEb70tdIN8Fxt
	sKGeKnoNiSA7uz8Tu3WNqlDW+MnvnOKdZuK0Sn9Pv74pTYXJcCqbpz1zcQKyVkMP4+bK
	zpyCUmFrvpLcyr2xE/aZ0+gqTUykmjLVdFk3NPT5HG+vGdBEgSQgu2LkivcDnKf5cw8Y
	s2tFYKEeWdDOQ+hX7AyB6G/S5drfV87rjG8c30y3QVJxF4eHtrC4raF4zZM/ERPQxb2c
	wka99WRis8mgz7Okssh4BKDK3aG8TlrB0UAq3qaYXQkodev9a/FsRKJH/6suEtlU+579
	cY7g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
	:references;
	bh=3ZTS6lrQcJFmyR6+j4zCbYxhgDdweFTR0cqRNbmsw04=;
	b=keXA/uJ7fktUlaK4eDOT5jAW0RN64nLIX/wINHkp5GhetY0fwExOIn8ivw10VZ1sxR
	6cLOr9VKES+RR21AfEplKp/yMF3e7cotjGR52FGRXWppkS65QO3q5AnVWxDur1lF3htt
	3UxcnEyNFw7q8/xgq+isx2vF4wKLYFo6TidnQR4fmpBCRZJB7mXgjVslRhqQKHE2F3oY
	OtV8g0qtRL9shw6f/4b52bFcrlw64jnXGyjH3c7eV24qcCCuPFwLCKuPVVGsb+/KqiNd
	JNzMY03ykX+K/Eb4uAMFudjl8GUaY/TCD330gTn9U/ppIz1QrSyOQBS51a/e+qgAB8zr
	F69g==
X-Gm-Message-State: APjAAAVp9yqlEjBJyum1XdRq7S0Etp6e+tkxsDwgXhorZoiA4Rmbx3k9
	dDxYeIxAwzOjqkd6oQmZHgWv/Q1z
X-Google-Smtp-Source: APXvYqyqMh8PVTBQNakZwhu5I22AfFWtu/cvBSWACjmDFxMaLfgs7PfhpwU9m0jJyWIK8KzqWMDxaw==
X-Received: by 2002:a5d:6543:: with SMTP id z3mr6188572wrv.200.1551359720500; 
	Thu, 28 Feb 2019 05:15:20 -0800 (PST)
Received: from alexander-box.luxoft.com ([62.96.135.139])
	by smtp.gmail.com with ESMTPSA id
	c17sm13644910wrs.17.2019.02.28.05.15.19
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Thu, 28 Feb 2019 05:15:19 -0800 (PST)
From: Alexander Kanavin <alex.kanavin@gmail.com>
To: openembedded-core@lists.openembedded.org
Date: Thu, 28 Feb 2019 14:15:07 +0100
Message-Id: <20190228131510.43557-5-alex.kanavin@gmail.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20190228131510.43557-1-alex.kanavin@gmail.com>
References: <20190228131510.43557-1-alex.kanavin@gmail.com>
Subject: [PATCH 5/8] qemu: remove support for building against host sdl
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
X-List-Received-Date: Thu, 28 Feb 2019 13:15:20 -0000

This hasn't been the default for a long time (as some distros don't
support it), and with gtk+ being the new default shouldn't
be needed at all.

Signed-off-by: Alexander Kanavin <alex.kanavin@gmail.com>
---
 meta/recipes-devtools/qemu/qemu.inc | 8 --------
 1 file changed, 8 deletions(-)

diff --git a/meta/recipes-devtools/qemu/qemu.inc b/meta/recipes-devtools/qemu/qemu.inc
index 985289f5426..a9d28bf5a38 100644
--- a/meta/recipes-devtools/qemu/qemu.inc
+++ b/meta/recipes-devtools/qemu/qemu.inc
@@ -80,14 +80,6 @@ export LIBTOOL="${HOST_SYS}-libtool"
 
 B = "${WORKDIR}/build"
 
-do_configure_prepend_class-native() {
-	# Append build host pkg-config paths for native target since the host may provide sdl
-	BHOST_PKGCONFIG_PATH=$(PATH=/usr/bin:/bin pkg-config --variable pc_path pkg-config || echo "")
-	if [ ! -z "$BHOST_PKGCONFIG_PATH" ]; then
-		export PKG_CONFIG_PATH=$PKG_CONFIG_PATH:$BHOST_PKGCONFIG_PATH
-	fi
-}
-
 do_configure() {
     ${S}/configure ${EXTRA_OECONF}
 }
-- 
2.17.1


