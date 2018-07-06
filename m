Return-Path: <ross.burton@intel.com>
Received: from mail-wm0-f67.google.com (mail-wm0-f67.google.com [74.125.82.67])
	by mail.openembedded.org (Postfix) with ESMTP id 277EC78A99
	for <openembedded-core@lists.openembedded.org>;
	Fri,  6 Jul 2018 15:47:52 +0000 (UTC)
Received: by mail-wm0-f67.google.com with SMTP id p11-v6so14828187wmc.4
	for <openembedded-core@lists.openembedded.org>;
	Fri, 06 Jul 2018 08:47:53 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=intel-com.20150623.gappssmtp.com; s=20150623;
	h=from:to:subject:date:message-id;
	bh=X+gD+4XburGg+a1WYDdQb6ASVsHYHn+PTitCo45vPHc=;
	b=xZkGaVNf794qs36JI9OqVeghDvSBeQvy+CJhbiwkDuMT3xWzgQpM2GwLPC8KzHCh6V
	Jb5/qwL1yVbnv58+BFZbq44bT85gLkyQhr7rW2/aA0UMrVNY/yLQCHHu23bg3HJjxxOm
	DJWaxIYLdFTAB0J41olPKqmCtQZC2YP0zlTnz7H8DNjXk9CG9z0EyzpKDOGv/+Fk+BDj
	dqweDqw2w+tKLEZIdTmaeY1IX4lbb/ANI6higcIhcMvh7GD78Ot/vEiDgLoCwDtN6Ge9
	4g957VVMwWwdkDuTR4W/4PZ2ArhzZPMXAYIMdI45geQ34gw08nTpY8tTiw72lD6TCvmw
	zflw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:subject:date:message-id;
	bh=X+gD+4XburGg+a1WYDdQb6ASVsHYHn+PTitCo45vPHc=;
	b=QKCxb+eTH2V+r2mzAzek+oFO6id8EmtQh6xenoZvBN1DWQwrCi4/lRDn2WNGsSXE/F
	PgaYJsJZ1JP6totildBQ4R44SoVx2vgKlxq9LPzD/SkkC2LPYFev3p94GjcwFvPuMb2o
	Sr3VfvkUkHJEzxHp7pjiOBcAigyGJ6WCZR7uVs2eHwQ1TJYWKG0q1N2FFXoApJgUajUz
	T8+gM8UTiDHfe+2Ey/yeI6kedCxWBT6mJQuyxsfx6hsSMQ01XKrxteJniqMkemMxK+M8
	PUJbsoCQNVCKyigUmikDMAfbdQgJLyp9nFVqbVN39m5xSieaxCuFrSK5g1THsXMcDo4u
	rsfw==
X-Gm-Message-State: APt69E2hfEJbgYsbwbiY/uhS1qHhJ5s1HoTLwsp2a/Rto1EZZDrpPsZB
	7XLUgdxweYqxak16Cpuc88JXZB6I
X-Google-Smtp-Source: AAOMgpcm9Ein7FU6tUwWNWDNoItNdm5esfEY74uoOKsn8ZNSbtnecI6q+4b4CCNSu4EuzT7nxhMWow==
X-Received: by 2002:a1c:e146:: with SMTP id
	y67-v6mr6411478wmg.108.1530892072490; 
	Fri, 06 Jul 2018 08:47:52 -0700 (PDT)
Received: from flashheart.burtonini.com (35.106.2.81.in-addr.arpa.
	[81.2.106.35]) by smtp.gmail.com with ESMTPSA id
	a2-v6sm6344984wmb.6.2018.07.06.08.47.51
	for <openembedded-core@lists.openembedded.org>
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Fri, 06 Jul 2018 08:47:51 -0700 (PDT)
From: Ross Burton <ross.burton@intel.com>
To: openembedded-core@lists.openembedded.org
Date: Fri,  6 Jul 2018 16:47:49 +0100
Message-Id: <20180706154749.19324-1-ross.burton@intel.com>
X-Mailer: git-send-email 2.11.0
Subject: [PATCH] minicom: remove dead URL from UPSTREAM_CHECK_URI
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
X-List-Received-Date: Fri, 06 Jul 2018 15:47:52 -0000

Signed-off-by: Ross Burton <ross.burton@intel.com>
---
 meta/recipes-extended/minicom/minicom_2.7.1.bb | 2 --
 1 file changed, 2 deletions(-)

diff --git a/meta/recipes-extended/minicom/minicom_2.7.1.bb b/meta/recipes-extended/minicom/minicom_2.7.1.bb
index be0b48dfdf5..1e6f1317ebe 100644
--- a/meta/recipes-extended/minicom/minicom_2.7.1.bb
+++ b/meta/recipes-extended/minicom/minicom_2.7.1.bb
@@ -16,8 +16,6 @@ SRC_URI = "${DEBIAN_MIRROR}/main/m/${BPN}/${BPN}_${PV}.orig.tar.gz \
 SRC_URI[md5sum] = "9021cb8c5445f6e6e74b2acc39962d62"
 SRC_URI[sha256sum] = "532f836b7a677eb0cb1dca8d70302b73729c3d30df26d58368d712e5cca041f1"
 
-UPSTREAM_CHECK_URI = "https://alioth.debian.org/frs/?group_id=30018"
-
 PACKAGECONFIG ??= ""
 PACKAGECONFIG[lockdev] = "--enable-lockdev,--disable-lockdev,lockdev"
 
-- 
2.11.0


