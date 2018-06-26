Return-Path: <ross.burton@intel.com>
Received: from mail-wr0-f195.google.com (mail-wr0-f195.google.com
	[209.85.128.195])
	by mail.openembedded.org (Postfix) with ESMTP id 56E976076F
	for <openembedded-core@lists.openembedded.org>;
	Tue, 26 Jun 2018 11:44:32 +0000 (UTC)
Received: by mail-wr0-f195.google.com with SMTP id e18-v6so16925924wrs.5
	for <openembedded-core@lists.openembedded.org>;
	Tue, 26 Jun 2018 04:44:34 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=intel-com.20150623.gappssmtp.com; s=20150623;
	h=from:to:subject:date:message-id;
	bh=lgQ5vZsT3G3DoAcUuLxuy51aDLTJxjDwJ4WtIokuzpA=;
	b=QAllCUY9/m5Q5NFJZHKVNJTFuXP2qE3HWHKds3Md9elMxXAOYi37ELGGO7mzYhlRk4
	sl6nnahCh3Hf8JNdgnkbef+PlCAuq+aW7pLR0PIDhaAsPikty83vu40OOyrPE2OuDpnJ
	peBtLgvzgJ3+wLtMQlnhDrfGBejnwD3OuuPrsZFD2O3brtoU+xBv423dt1cD3kf3xCUX
	hDQqEqfxQh1DZ8nHhBmvhX9GCy4Gu4o59FT31/WnGLPeJyBNE7sX3MELD2FJK0YEoXCR
	OEosNZJDpEXRyOUxezf0urbgRZFIqKp+sVTlriOnBh1lzcKObkUNDkrDvwBD8eTuIW2Z
	r3Bw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:subject:date:message-id;
	bh=lgQ5vZsT3G3DoAcUuLxuy51aDLTJxjDwJ4WtIokuzpA=;
	b=tZXI9/tjS5XH7iMnMwdUBa9EwbtcNfGA5z1QbsEwlLVI3F1rR9TPSkdQnLqPo6Q4cR
	jgWUD3h3ewYGO2vB2b6a/aCJ6INkNbYuWo3O1od6YmhTM8tb0woZ+tBLUgAvZblSStGA
	cECM48SC4gc2cCszVNLqQzh2GcswESDp2iGyQ8j+fEmW+ZurwB2C/RVqz1BhS1AIPxvO
	dAz3moQRWULvTpqm9wJPa5Rkf6S9AtmpBcHuk2+gqgLC9DM9sWUoxK/izkU5ektoxA2V
	9ACffLmnhZ73Uaz4aTvxb+rFGDasDu8yNoW2NzAGtsgky50WvpqI+JD98bVNqkd8ArgB
	0oAw==
X-Gm-Message-State: APt69E3ni8m59gUZ/GrsQy4k5vSkdpod0zV1Z80PbovUKZq0T6/f/46K
	UrPxxqiGnwTNQtsReSPDm/MhSXX8
X-Google-Smtp-Source: AAOMgpfawuLJGZ+nUt8LulGd58GhILFTM7ii7yiAy2jyHHrV6PjoPW+ad2xwHdxRRoJbL2H8H9X9kQ==
X-Received: by 2002:adf:890a:: with SMTP id
	s10-v6mr1223564wrs.122.1530013473398; 
	Tue, 26 Jun 2018 04:44:33 -0700 (PDT)
Received: from flashheart.burtonini.com (35.106.2.81.in-addr.arpa.
	[81.2.106.35]) by smtp.gmail.com with ESMTPSA id
	v25-v6sm1180981wmh.43.2018.06.26.04.44.31
	for <openembedded-core@lists.openembedded.org>
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Tue, 26 Jun 2018 04:44:32 -0700 (PDT)
From: Ross Burton <ross.burton@intel.com>
To: openembedded-core@lists.openembedded.org
Date: Tue, 26 Jun 2018 12:44:30 +0100
Message-Id: <20180626114430.14590-1-ross.burton@intel.com>
X-Mailer: git-send-email 2.11.0
Subject: [PATCH] maintainers: assign systemtap to Victor Kanensky
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
X-List-Received-Date: Tue, 26 Jun 2018 11:44:33 -0000

Signed-off-by: Ross Burton <ross.burton@intel.com>
---
 meta/conf/distro/include/maintainers.inc | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/meta/conf/distro/include/maintainers.inc b/meta/conf/distro/include/maintainers.inc
index d569e0a7ec3..7dd5e658225 100644
--- a/meta/conf/distro/include/maintainers.inc
+++ b/meta/conf/distro/include/maintainers.inc
@@ -657,8 +657,8 @@ RECIPE_MAINTAINER_pn-systemd-bootconf = "Chen Qi <Qi.Chen@windriver.com>"
 RECIPE_MAINTAINER_pn-systemd-compat-units = "Chen Qi <Qi.Chen@windriver.com>"
 RECIPE_MAINTAINER_pn-systemd-serialgetty = "Chen Qi <Qi.Chen@windriver.com>"
 RECIPE_MAINTAINER_pn-systemd-systemctl-native = "Chen Qi <Qi.Chen@windriver.com>"
-RECIPE_MAINTAINER_pn-systemtap = "Alexander Kanavin <alex.kanavin@gmail.com>"
-RECIPE_MAINTAINER_pn-systemtap-uprobes = "Alexander Kanavin <alex.kanavin@gmail.com>"
+RECIPE_MAINTAINER_pn-systemtap = "Victor Kamensky <kamensky@cisco.com>"
+RECIPE_MAINTAINER_pn-systemtap-uprobes = "Victor Kamensky <kamensky@cisco.com>"
 RECIPE_MAINTAINER_pn-sysvinit = "Ross Burton <ross.burton@intel.com>"
 RECIPE_MAINTAINER_pn-sysvinit-inittab = "Ross Burton <ross.burton@intel.com>"
 RECIPE_MAINTAINER_pn-taglib = "Maxin B. John <maxin.john@intel.com>"
-- 
2.11.0


