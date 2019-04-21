Return-Path: <open.source@oleksandr-kravchuk.com>
Received: from mail-lf1-f67.google.com (mail-lf1-f67.google.com
	[209.85.167.67])
	by mail.openembedded.org (Postfix) with ESMTP id 88808751D2
	for <openembedded-core@lists.openembedded.org>;
	Sun, 21 Apr 2019 19:44:55 +0000 (UTC)
Received: by mail-lf1-f67.google.com with SMTP id h18so7524016lfj.11
	for <openembedded-core@lists.openembedded.org>;
	Sun, 21 Apr 2019 12:44:56 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=oleksandr-kravchuk-com.20150623.gappssmtp.com; s=20150623;
	h=from:to:cc:subject:date:message-id;
	bh=B22Zu6i8CU0CgtjDLu2RhEAavcfvP67/ZD1Za8fAoZ4=;
	b=UN7zdML4KHb06LjCThvFInwMc/M4eQFPLWm3pkwTqV4JPKtO1JrthdeMjqxjaUTcPD
	yoguP/q5+5rbThxF9Vf7h0z19YfTeKhGt3oENA3lX07gqDuqBTTroqPnca0Igzz/Mu/u
	2dh5N86mSMJKNHL4wa0Y5/x3NZWsOmbO9tbbGoGW34VIqQtLIqvYzOSsYS+SDYGeGsIv
	y8ODOtU4hgtkR0Pc9QMteKK4KlxPC4AbbmqgDbe6aJhFPEVk9+VIi63p/afpR3LzlQKn
	PTzirZcEln/77rB/xumItbpUIaR/bfnY1MzyroUR9jrgiKbmLzn7+tPcvyEPN+iESJuG
	XPtw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:cc:subject:date:message-id;
	bh=B22Zu6i8CU0CgtjDLu2RhEAavcfvP67/ZD1Za8fAoZ4=;
	b=DFkQ16BYHKChmEz3XldiQbxRhTkckVf6pS6pz5F55YWlr8PyL+w8GFlR48KbrBJ9HR
	KH5Qnb48S+rzAXWtCJw3JJ5OFHNLiH/u5c7tDYQ59jRjpfqIFW2De7o/RPCea1t1FPJA
	6p0PEi9u3NWcYKtANWrdgzFeWMVm8S7qdIzxqZoiTOBW3XcKjkN3FMq+8N/fU/+xEQEx
	LmVllRUKmV0VOYuDyNdRQtUVuoyQruOELjeRfnNRSLijzuohhwmikXbHzC0JhMUtAYU7
	Ol9qkQLULgz7sfhR2NLGuln6HbfCMsFBrEIVXuykuCSMrO+6FK6ACjP3ndoAIv3OqeIs
	2dLQ==
X-Gm-Message-State: APjAAAVgEFGZtFepGCPhBMwzf3kJABvDU2ey8KRdJM3m2V2UsFodn6u+
	q+0ZLmUg5MJ+m93nh2elLD9c681Ub0c=
X-Google-Smtp-Source: APXvYqw7PaP1lUy22MMgf+WYTtPA863mMHt8B9uREXBhZTEp4XGm+BJRIriWw4uZMlWhzfbzoJk/ig==
X-Received: by 2002:a19:7911:: with SMTP id u17mr8048390lfc.90.1555875895592; 
	Sun, 21 Apr 2019 12:44:55 -0700 (PDT)
Received: from localhost.localdomain (c83-252-117-108.bredband.comhem.se.
	[83.252.117.108])
	by smtp.gmail.com with ESMTPSA id x6sm2596571lfe.67.2019.04.21.12.44.54
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Sun, 21 Apr 2019 12:44:54 -0700 (PDT)
From: Oleksandr Kravchuk <open.source@oleksandr-kravchuk.com>
To: openembedded-core@lists.openembedded.org
Date: Sun, 21 Apr 2019 21:44:22 +0200
Message-Id: <20190421194422.10862-1-open.source@oleksandr-kravchuk.com>
X-Mailer: git-send-email 2.17.1
Cc: Oleksandr Kravchuk <open.source@oleksandr-kravchuk.com>
Subject: [PATCH][meta-oe] ell: add recipe
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
X-List-Received-Date: Sun, 21 Apr 2019 19:44:55 -0000

ELL has originally been part of meta-openembedded, but newer versions
of some of the oe-core components depend on it, e.g. ofono.

Signed-off-by: Oleksandr Kravchuk <open.source@oleksandr-kravchuk.com>
---
 meta/recipes-core/ell/ell_0.19.bb | 22 ++++++++++++++++++++++
 1 file changed, 22 insertions(+)
 create mode 100644 meta/recipes-core/ell/ell_0.19.bb

diff --git a/meta/recipes-core/ell/ell_0.19.bb b/meta/recipes-core/ell/ell_0.19.bb
new file mode 100644
index 0000000000..c0ba92a297
--- /dev/null
+++ b/meta/recipes-core/ell/ell_0.19.bb
@@ -0,0 +1,22 @@
+SUMMARY  = "Embedded Linux Library"
+DESCRIPTION = "The Embedded Linux Library (ELL) provides core, \
+low-level functionality for system daemons. It typically has no \
+dependencies other than the Linux kernel, C standard library, and \
+libdl (for dynamic linking). While ELL is designed to be efficient \
+and compact enough for use on embedded Linux platforms, it is not \
+limited to resource-constrained systems."
+SECTION = "libs"
+LICENSE  = "LGPLv2.1"
+LIC_FILES_CHKSUM = "file://COPYING;md5=fb504b67c50331fc78734fed90fb0e09"
+
+DEPENDS = "dbus"
+
+inherit autotools pkgconfig
+
+SRC_URI = "https://mirrors.edge.kernel.org/pub/linux/libs/${PN}/${PN}-${PV}.tar.xz"
+SRC_URI[md5sum] = "4356397ca11d5f8ec7f1aaf1e91ffea4"
+SRC_URI[sha256sum] = "a5a4d45ca002dd91560fcd565e696f59e82631e69c927115dafc640f0b8d779c"
+
+do_configure_prepend () {
+    mkdir -p ${S}/build-aux
+}
-- 
2.17.1


