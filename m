Return-Path: <ross.burton@intel.com>
Received: from mail-wr1-f68.google.com (mail-wr1-f68.google.com
	[209.85.221.68])
	by mail.openembedded.org (Postfix) with ESMTP id 3CBAA6BF43
	for <openembedded-core@lists.openembedded.org>;
	Fri, 30 Nov 2018 14:29:24 +0000 (UTC)
Received: by mail-wr1-f68.google.com with SMTP id x10so5470943wrs.8
	for <openembedded-core@lists.openembedded.org>;
	Fri, 30 Nov 2018 06:29:26 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=intel-com.20150623.gappssmtp.com; s=20150623;
	h=from:to:subject:date:message-id;
	bh=rFu9k1PfZj1QrrjQBg4FkKO4Sb1dQ1BKInjLCD42tzQ=;
	b=T/Lz3CeLm6ye3iqOLDFYni21JeqGvTptwBKFvvfXFz5n+y8hU3DIa1vT4uHMmJ1vo9
	jtLmuns+d+NSVDBI2RBz15clG96Ai/uPL9InPo6TJzMHgyZKu8WYTTH3fqZxBge3YRFu
	diwRg3DGZ+NG+W7oX9KbW8Th7X4VO05lPWqNIxOE/CGQPaSG+MwETC4rWbBQQ0isy5XZ
	WyPzn/X1mOC2ykxa2Df6SxRt7k+8PyYo6h10sUvTVP9/soZkSWCe/Udm396p3A7elENO
	g8d2hjuwdIOP2htiu7ZG/68gA4+xoNKX/5kAQ+LfJ/P4wen+WnzgNsVuW9NosM6+nmtc
	HFzw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:subject:date:message-id;
	bh=rFu9k1PfZj1QrrjQBg4FkKO4Sb1dQ1BKInjLCD42tzQ=;
	b=eSpDSdYWVBljPsCKFSSArC2b4wItExOeRnReDlH3m4/mLk2sDlaG6aopmiDE7+OCIV
	mxGGUSvmgn7NWJmv8oCYOYa3RYuLNmcIH98ZphGmZWTtuSF368BSSwpgEQen9G2HHPN2
	Bkbg5I55pf/55aiuveuSySuiqzlm7UpIoGZYaDSNZa6ixqYNsehS5YS2Kx6NxwdYpJ9n
	yb2mk875NkAPUl1Mx0+XhU+Xxbnu1qoaDJpy9mQQA0ptwvyGKi4gbYXNvE1kJGvKMpQm
	DMedpIqvVbXdJdZs+H/wXspR82PcQFq5IWAsr5eIXOuLMzhOHJzW3fhZQGd/+eFnsxo4
	dDnA==
X-Gm-Message-State: AA+aEWZEM5CFRXET9uc1OxdCn3LMk+p7gIKCN2pYkBektPiJfLprDO8t
	lAGnXdt0biC+T5NAD1CnlWe+cz3rCuo=
X-Google-Smtp-Source: AFSGD/Vqh8+t3guZnFBKVj+3Ai2QoRZs7hA/WbjKtZL4D+TtHPztG98Q4QLyJIXVIb3iUrKAmCaLFA==
X-Received: by 2002:adf:8506:: with SMTP id 6mr5412294wrh.128.1543588165489;
	Fri, 30 Nov 2018 06:29:25 -0800 (PST)
Received: from flashheart.burtonini.com (35.106.2.81.in-addr.arpa.
	[81.2.106.35]) by smtp.gmail.com with ESMTPSA id
	142sm6535927wmw.27.2018.11.30.06.29.24
	for <openembedded-core@lists.openembedded.org>
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Fri, 30 Nov 2018 06:29:24 -0800 (PST)
From: Ross Burton <ross.burton@intel.com>
To: openembedded-core@lists.openembedded.org
Date: Fri, 30 Nov 2018 14:29:23 +0000
Message-Id: <20181130142923.8497-1-ross.burton@intel.com>
X-Mailer: git-send-email 2.11.0
Subject: [PATCH] piglit: add missing waffle-bin dependency
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
X-List-Received-Date: Fri, 30 Nov 2018 14:29:25 -0000

The sanity test uses wflinfo, so depend on waffle-bin.

Signed-off-by: Ross Burton <ross.burton@intel.com>
---
 meta/recipes-graphics/piglit/piglit_git.bb | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta/recipes-graphics/piglit/piglit_git.bb b/meta/recipes-graphics/piglit/piglit_git.bb
index 00e830d5796..622e0462b36 100644
--- a/meta/recipes-graphics/piglit/piglit_git.bb
+++ b/meta/recipes-graphics/piglit/piglit_git.bb
@@ -44,7 +44,7 @@ do_configure_prepend() {
 
 OECMAKE_TARGET_INSTALL = "install/strip"
 
-RDEPENDS_${PN} = "waffle python3 python3-mako python3-json \
+RDEPENDS_${PN} = "waffle waffle-bin python3 python3-mako python3-json \
 	python3-misc \
 	python3-unixadmin python3-xml python3-multiprocessing \
 	python3-six python3-shell python3-io \
-- 
2.11.0


