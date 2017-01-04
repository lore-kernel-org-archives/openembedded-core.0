Return-Path: <kergoth@gmail.com>
Received: from mail-wm0-f65.google.com (mail-wm0-f65.google.com [74.125.82.65])
	by mail.openembedded.org (Postfix) with ESMTP id 9B47660762
	for <openembedded-core@lists.openembedded.org>;
	Wed,  4 Jan 2017 22:58:08 +0000 (UTC)
Received: by mail-wm0-f65.google.com with SMTP id c85so55464831wmi.1
	for <openembedded-core@lists.openembedded.org>;
	Wed, 04 Jan 2017 14:58:09 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=from:to:cc:subject:date:message-id:in-reply-to:references;
	bh=0xHhKsCmcehowEikDqBNSA+I5B+dZrhkScWn7xX4MIA=;
	b=KRk8cWxKiOvK19IIWoFYNp7VB0EVa8Tn9JdMCfeY1SQAN/aoZzaeC2PWhR87I0n1YD
	Bz0oWbA8ForSMgIwN3Az9smZZ/rMhnESFLmOXsa62ajVTmYwiNvkK929K2gyJ0p3VpeT
	0aRgbUO8IOuOGIVXMuVg84h3pGJryBpTGWxtzQ0AtkwBbfnaVsnARMF4z5kj+ZSqj5nQ
	+xRdoTyk2YcSv8fP+9N5xXmzDeKWjPDItBVD6gtPpEJnktnek/oMmI12XSZcr+mZa2wt
	yRrF69OIys6yjqcUQQeVlNDKGgCKK2Lvw3CExDCF8ytIHjPMRQvw8ZRoScDEt/MKIzIA
	Ketw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
	:references;
	bh=0xHhKsCmcehowEikDqBNSA+I5B+dZrhkScWn7xX4MIA=;
	b=NzJXHaOz8MV4riSZdRNDcXkAJMjd0SxVl64Cmn/1ZHw+V9II1s/QNtR4Skr4C0kttX
	ZtSGypDLE3QVKE9cItmZYDRhOTLRxVJHYCSvcc0Eok1/Xd62IAGyTSeY9MG9U8LB72pA
	blXy9tJKmFgsqlYVJjD1c+M6W5Pr+tJaSBqwNTLJuKyQoeZQVllSf6x2W516VUQgFVLC
	sgM5t7KEMfzB9jAW1WqnnmH9qFh9UOyClH0XYLneA67wauEV6EWpr7n9PZCge8lV69tG
	c3LFZP+HszqSJSbEhD0Oz3XuxTT8Y6lhm6nlOadm0Y/OWsLmLoux7fIpwHsyFMTxn3il
	Mhcw==
X-Gm-Message-State: AIkVDXKWOPYCiJmwwQi5qqMh9tUcydQyOtkpKgN410PJrPSKg8Z2fyfIMV5MpKogXh9Stg==
X-Received: by 10.28.211.72 with SMTP id k69mr58231184wmg.138.1483570688224;
	Wed, 04 Jan 2017 14:58:08 -0800 (PST)
Received: from quark.alm.mentorg.com (nat-lmt.mentorg.com. [139.181.28.34])
	by smtp.gmail.com with ESMTPSA id 6sm100453855wjt.5.2017.01.04.14.58.06
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
	Wed, 04 Jan 2017 14:58:07 -0800 (PST)
From: Christopher Larson <kergoth@gmail.com>
To: openembedded-core@lists.openembedded.org
Date: Wed,  4 Jan 2017 15:57:53 -0700
Message-Id: <49ea0e7ba64de9f79d3f082defee7bd510a137f6.1483570577.git.chris_larson@mentor.com>
X-Mailer: git-send-email 2.8.0
In-Reply-To: <cover.1483570577.git.chris_larson@mentor.com>
References: <cover.1483570577.git.chris_larson@mentor.com>
Cc: Christopher Larson <chris_larson@mentor.com>
Subject: [PATCH 4/6] eglinfo-x11: add opengl to REQUIRED_DISTRO_FEATURES
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
X-List-Received-Date: Wed, 04 Jan 2017 22:58:09 -0000

From: Christopher Larson <chris_larson@mentor.com>

The .inc already included this, but the x11 version was overriding it. This is
a problem, as the x11 version still needs opengl as well as x11. Append
instead.

Signed-off-by: Christopher Larson <chris_larson@mentor.com>
---
 meta/recipes-graphics/eglinfo/eglinfo-x11_1.0.0.bb | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/meta/recipes-graphics/eglinfo/eglinfo-x11_1.0.0.bb b/meta/recipes-graphics/eglinfo/eglinfo-x11_1.0.0.bb
index 3427fdf..db00f76 100644
--- a/meta/recipes-graphics/eglinfo/eglinfo-x11_1.0.0.bb
+++ b/meta/recipes-graphics/eglinfo/eglinfo-x11_1.0.0.bb
@@ -6,7 +6,8 @@ include eglinfo.inc
 DEPENDS += "virtual/libx11"
 
 inherit distro_features_check
+
 # depends on virtual/libx11
-REQUIRED_DISTRO_FEATURES = "x11"
+REQUIRED_DISTRO_FEATURES += "x11"
 
 SUMMARY += "(X11 version)"
-- 
2.8.0


