Return-Path: <open.source@oleksandr-kravchuk.com>
Received: from mail-wm0-f41.google.com (mail-wm0-f41.google.com [74.125.82.41])
	by mail.openembedded.org (Postfix) with ESMTP id 0BC5B7503C
	for <openembedded-core@lists.openembedded.org>;
	Fri,  1 Jun 2018 22:15:02 +0000 (UTC)
Received: by mail-wm0-f41.google.com with SMTP id p11-v6so4373323wmc.4
	for <openembedded-core@lists.openembedded.org>;
	Fri, 01 Jun 2018 15:15:04 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=oleksandr-kravchuk-com.20150623.gappssmtp.com; s=20150623;
	h=from:to:cc:subject:date:message-id;
	bh=Leia1IQ/558Fr9a/CQ5pT824q9T/wqBaQuauhzgpqOc=;
	b=fH7glgzwwfVCt4JnIE+9OMc1vV5kesbQo2qum3l8Xo+27ZG5tS4l/hMz3N9+vax8XK
	YVrCQT9GxqEfWQatWaGSYwFwikbL0jBYxK9tP//NJ6I1BBEYnsYK1chbMGupgF2sxVu/
	yfv9286s9SWHGBuy1MVbLaSzsjkZzrPRuCcjqGluhbrPSYZICYabOjWV51alecVjlLZp
	fMCf5cm6FeemwoJF1KWlNuvwk+nLkR1l4R0aGiTRLdYeGltjOJuPF5nNhrl7GrXBe1PX
	kkgXFWka1NiZMqvK6IhmU/zGWzw64XXqLc44zIgU0iQeMkVJsTfrUTJBiHO+lUQT0d4u
	3eoQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:cc:subject:date:message-id;
	bh=Leia1IQ/558Fr9a/CQ5pT824q9T/wqBaQuauhzgpqOc=;
	b=VlLePXGz3bGggpv//+EYHc+q9mKxTgTgVxNfSLBc+caf1EwRZUL4k0fpr5n20adxFO
	nd6HMVriMeBVgRFBgwXGD0R6evCCfq8lqV9d9qWx0caz/NEVcrya4rPNG5u6z1gE/OK3
	5dfOWa+OdFkU/Mc9SLUl2+CFQEfe75Gflljzh4CXQngul0jAF1d6mNkFCvtGdXh6zZwb
	/+xqN/WeC7ln4n5T9ptotv0Cqn1T2hCWit9PdTbtGLjpg2QJqUcjqGQPl8SRd69ow/LG
	vfE5d91Fk4Oc5kQfMT8HXfMVv7vyLKRgCutK+Ga33O2p06A+dkvELvxZ7UG3bSTBylVM
	BdDg==
X-Gm-Message-State: ALKqPwe2UfzKmXcE7+PpRv18q2kMJiZAraVeiab0cmJ0e8nqyqFloRae
	rww1kx2JDQnirfKUge5k22Jfkcc3
X-Google-Smtp-Source: ADUXVKLm2wm/tGO4XUhNTk2nYPFqIsO7VGIC/5zV0SBsUXVB/coA3bPbLo8cVEpBUmvCEFLN4dkRDQ==
X-Received: by 2002:a50:9b5b:: with SMTP id
	a27-v6mr14090906edj.60.1527891303239; 
	Fri, 01 Jun 2018 15:15:03 -0700 (PDT)
Received: from localhost.localdomain ([2a04:ae08:1403:ff00:489:7961:466d:7cf7])
	by smtp.gmail.com with ESMTPSA id
	t1-v6sm21902962edq.84.2018.06.01.15.15.01
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Fri, 01 Jun 2018 15:15:01 -0700 (PDT)
From: Oleksandr Kravchuk <open.source@oleksandr-kravchuk.com>
X-Google-Original-From: Oleksandr Kravchuk <dev@sashko.rv.ua>
To: openembedded-core@lists.openembedded.org
Date: Sat,  2 Jun 2018 00:14:39 +0200
Message-Id: <20180601221440.29992-1-dev@sashko.rv.ua>
X-Mailer: git-send-email 2.17.0
Cc: Oleksandr Kravchuk <dev@sashko.rv.ua>
Subject: [meta-oe][PATCH 1/2] chrpath: fix SRC_URI
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
X-List-Received-Date: Fri, 01 Jun 2018 22:15:03 -0000

Signed-off-by: Oleksandr Kravchuk <dev@sashko.rv.ua>
---
 meta/recipes-devtools/chrpath/chrpath_0.16.bb | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta/recipes-devtools/chrpath/chrpath_0.16.bb b/meta/recipes-devtools/chrpath/chrpath_0.16.bb
index b61eef9c8b..0428210567 100644
--- a/meta/recipes-devtools/chrpath/chrpath_0.16.bb
+++ b/meta/recipes-devtools/chrpath/chrpath_0.16.bb
@@ -7,7 +7,7 @@ BUGTRACKER = "http://alioth.debian.org/tracker/?atid=412807&group_id=31052"
 LICENSE = "GPLv2"
 LIC_FILES_CHKSUM = "file://COPYING;md5=59530bdf33659b29e73d4adb9f9f6552"
 
-SRC_URI = "https://alioth.debian.org/frs/download.php/file/3979/chrpath-0.16.tar.gz \
+SRC_URI = "https://src.fedoraproject.org/lookaside/extras/chrpath/chrpath-0.16.tar.gz/2bf8d1d1ee345fc8a7915576f5649982/chrpath-0.16.tar.gz \
            file://standarddoc.patch"
 
 SRC_URI[md5sum] = "2bf8d1d1ee345fc8a7915576f5649982"
-- 
2.17.0


