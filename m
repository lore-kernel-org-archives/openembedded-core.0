Return-Path: <alex.kanavin@gmail.com>
Received: from mail-wm1-f66.google.com (mail-wm1-f66.google.com
	[209.85.128.66])
	by mail.openembedded.org (Postfix) with ESMTP id 469BC7C0D1
	for <openembedded-core@lists.openembedded.org>;
	Tue, 18 Dec 2018 16:30:21 +0000 (UTC)
Received: by mail-wm1-f66.google.com with SMTP id c126so3456712wmh.0
	for <openembedded-core@lists.openembedded.org>;
	Tue, 18 Dec 2018 08:30:22 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=from:to:cc:subject:date:message-id:in-reply-to:references;
	bh=5z94GixBFKTeHrVD3T6zlTgWHxjhZHRIP3AX2cY9zMY=;
	b=CBgoG7pvK/WAEg/eqh1ZluQMQ+IsuxC2gdaRqz3cY/ewKHECrL5lt6mZKzlJDZDNxb
	jzmr2gHor4e7eipJYHmA97rVfh2508x8tkVvUMzcs0xO7EAyGyqKaW2PeMttrXowR5xE
	LmD/eS6rCD3w3s3FmBHMQ0/V57+vcFTrKw3d2s6L4xxlQ47HK8ynmyC2dHffPbonGWFM
	p1iirsPHXjGG+HNRs2lgiwwN/kiJ/KDITqFDFoiQPnNdhXYPEkHGmMX8O/4cro/tx8nO
	NpTxdJ6+OAcmMbSVS6QnTDRL6lgeNBGqwfcUzKqwwUOTTTnAggYF1g9C1bGf4/2ozEmF
	KOPg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
	:references;
	bh=5z94GixBFKTeHrVD3T6zlTgWHxjhZHRIP3AX2cY9zMY=;
	b=iwnQ/p8v1YjVtiaKT1O+gkhfBYIag0U7TnuFiGy4KBkWFqTk1G1X6u5IBs1+3dfJ3Q
	1d7rcO/fxZgs39OO40Jz2k6mEahI4VaFwUmWwjzwiaVi5/cg6qGMCnYmVZrbk6/iLM6t
	GwIFdQOuUei5cKOmPKFYa2rdxmIRb9Fv+SSCPipd8oOV55SbJRssb46LRgJGqF0rJ6y/
	60Pym2EqZzzpcRFS3eYJGfNf10LPJ8zntHeqolDVfH2rRIud0HGgF+VBhnbYzStXQRIM
	dAxXunjKSPv/olTyB0gGW5JdAbmL5M9mS/6VwtNXFERB2mswD8N97Wmq6gYKsWX4b2Hu
	lLvA==
X-Gm-Message-State: AA+aEWZ0CjepJ64UwhF52U/5m9XjZiSOtf8Y1KqJ3WX1M/XtKRz1Ni/1
	E49C4SBjz9McHrMZ2fDohqq2Vwfg
X-Google-Smtp-Source: AFSGD/UQOR6QWVKXW6ORzXSvE5nvP/DyLfYFI9xRwZWiT7hp7t4ViKsrXtrmHCYhf8F1vfsj18oiLg==
X-Received: by 2002:a1c:6707:: with SMTP id b7mr3859645wmc.138.1545150621610; 
	Tue, 18 Dec 2018 08:30:21 -0800 (PST)
Received: from alexander-box.luxoft.com ([62.96.135.139])
	by smtp.gmail.com with ESMTPSA id
	f18sm2237849wrs.92.2018.12.18.08.30.20
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Tue, 18 Dec 2018 08:30:20 -0800 (PST)
From: Alexander Kanavin <alex.kanavin@gmail.com>
To: openembedded-core@lists.openembedded.org
Date: Tue, 18 Dec 2018 17:30:00 +0100
Message-Id: <20181218163005.1330-8-alex.kanavin@gmail.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20181218163005.1330-1-alex.kanavin@gmail.com>
References: <20181218163005.1330-1-alex.kanavin@gmail.com>
Subject: [PATCH 08/13] lighttpd: upgrade 1.4.51 -> 1.4.52
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
X-List-Received-Date: Tue, 18 Dec 2018 16:30:23 -0000

Signed-off-by: Alexander Kanavin <alex.kanavin@gmail.com>
---
 .../lighttpd/{lighttpd_1.4.51.bb => lighttpd_1.4.52.bb}       | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)
 rename meta/recipes-extended/lighttpd/{lighttpd_1.4.51.bb => lighttpd_1.4.52.bb} (96%)

diff --git a/meta/recipes-extended/lighttpd/lighttpd_1.4.51.bb b/meta/recipes-extended/lighttpd/lighttpd_1.4.52.bb
similarity index 96%
rename from meta/recipes-extended/lighttpd/lighttpd_1.4.51.bb
rename to meta/recipes-extended/lighttpd/lighttpd_1.4.52.bb
index f28fd2f6905..adf77598d83 100644
--- a/meta/recipes-extended/lighttpd/lighttpd_1.4.51.bb
+++ b/meta/recipes-extended/lighttpd/lighttpd_1.4.52.bb
@@ -20,8 +20,8 @@ SRC_URI = "http://download.lighttpd.net/lighttpd/releases-1.4.x/lighttpd-${PV}.t
         file://0001-Use-pkg-config-for-pcre-dependency-instead-of-config.patch \
         "
 
-SRC_URI[md5sum] = "6e68c19601af332fa3c5f174245f59bf"
-SRC_URI[sha256sum] = "2af9fdb265d1f025bfa634e13770239712ecbd585e4975b8226edf1df74e9c82"
+SRC_URI[md5sum] = "34f5c79137325ba31484bed1e54e66e6"
+SRC_URI[sha256sum] = "27bc0991c530b7c6335e6efff2181934d3c1a1c516f7401ea71d8302cefda764"
 
 PACKAGECONFIG ??= "openssl pcre zlib \
     ${@bb.utils.filter('DISTRO_FEATURES', 'ipv6', d)} \
-- 
2.17.1


