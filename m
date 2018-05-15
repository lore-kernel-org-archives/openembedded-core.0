Return-Path: <ross.burton@intel.com>
Received: from mail-wr0-f170.google.com (mail-wr0-f170.google.com
	[209.85.128.170])
	by mail.openembedded.org (Postfix) with ESMTP id 2DED175036
	for <openembedded-core@lists.openembedded.org>;
	Tue, 15 May 2018 09:51:32 +0000 (UTC)
Received: by mail-wr0-f170.google.com with SMTP id p4-v6so15324355wrh.3
	for <openembedded-core@lists.openembedded.org>;
	Tue, 15 May 2018 02:51:34 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=intel-com.20150623.gappssmtp.com; s=20150623;
	h=from:to:subject:date:message-id:in-reply-to:references;
	bh=DJ8hRFwK8mJE3nCttWLd+HWC1wlyJgz8gtgObYtEVSk=;
	b=zgRI3Wz9A7y0BrLG4gwGHyU6WZ4bcmdOnwNKRM1LQoRSywtiuqquqPjXGY+zBzqzti
	LYZ2WKB4hG8jLt6VVa8Z14h4J8ip/jjQPz1G1wVu4k4Cd7oqCwHBXdNahsA5ph5Re98/
	dUKXX1spnW3QX4PG5W1VwTDFqKM41eH5veAVzhjuS/peEf5/DdHlmoMPg7QzOly7kjTW
	yB5c+qBluRvQ541+Y25W5M9/9CE3OACunN6P9PjyosQa2e3FrXGSNNRfnYeBuH9kmskm
	sXajKlL1B2f1Qf00Q6ZNM6Gp+wmuoQaOeo+4GLO50jgxR1sbhdOaqg2cps3PGzFGGWUQ
	zepg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
	:references;
	bh=DJ8hRFwK8mJE3nCttWLd+HWC1wlyJgz8gtgObYtEVSk=;
	b=LiEYbR+3JxybSgZFyv/aVWIVI1vlqb8s91S8yjIMq/ry+HZUn2Nv4BV8/qFgMya678
	M4xRV9WdZ5JcHrplEhshMll4zsJCZvCyvn0kvGUnXhvQufvkxRiNnpEL3L/dPYGCfUFB
	roVnaPT/cYJU8/D1hc8G4kg5j48UuUYLGL0k08n/bH5WeKPOv5nT3TBFuJahL0lmLx+3
	FAJo/R9IMgEKko3+HQfBOLxyIenNoto41+pF1X3Vzdd+GB0sgSaceB4j+Wle5409KQM9
	qBukCx58wlnGSCwFMANsgpSRBKj1BFV3hX23P45atCm9qKHZbc1PCPBZxqHQ42VhRFUS
	Npog==
X-Gm-Message-State: ALKqPweCFw8mxP1d+AbLT8EnfXTbLAP7AiAm6m5M8tgJWmb9gpMfWSKc
	bAk00KSli8DI+k/GOg7crJ+ABjoT
X-Google-Smtp-Source: AB8JxZoLrV+CV1+sah9khB8rdY3ea8YvA2uVuEIEzIUdI2bNl5oYvDZn+UOjAPe2pElnStwo2v3x9Q==
X-Received: by 2002:adf:a9aa:: with SMTP id
	b39-v6mr10208433wrd.36.1526377893445; 
	Tue, 15 May 2018 02:51:33 -0700 (PDT)
Received: from flashheart.burtonini.com (35.106.2.81.in-addr.arpa.
	[81.2.106.35]) by smtp.gmail.com with ESMTPSA id
	x16-v6sm8047693wmc.2.2018.05.15.02.51.32
	for <openembedded-core@lists.openembedded.org>
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Tue, 15 May 2018 02:51:32 -0700 (PDT)
From: Ross Burton <ross.burton@intel.com>
To: openembedded-core@lists.openembedded.org
Date: Tue, 15 May 2018 10:51:29 +0100
Message-Id: <20180515095129.3107-2-ross.burton@intel.com>
X-Mailer: git-send-email 2.11.0
In-Reply-To: <20180515095129.3107-1-ross.burton@intel.com>
References: <20180515095129.3107-1-ross.burton@intel.com>
Subject: [PATCH 2/2] packagegroup-core-x11-sato: don't install libsdl
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
X-List-Received-Date: Tue, 15 May 2018 09:51:33 -0000

libsdl isn't a key part of the Sato desktop, remove it and let it be installed
by dependencies if required.

Signed-off-by: Ross Burton <ross.burton@intel.com>
---
 meta/recipes-sato/packagegroups/packagegroup-core-x11-sato.bb | 1 -
 1 file changed, 1 deletion(-)

diff --git a/meta/recipes-sato/packagegroups/packagegroup-core-x11-sato.bb b/meta/recipes-sato/packagegroups/packagegroup-core-x11-sato.bb
index 224428ddda5..2707a2192e1 100644
--- a/meta/recipes-sato/packagegroups/packagegroup-core-x11-sato.bb
+++ b/meta/recipes-sato/packagegroups/packagegroup-core-x11-sato.bb
@@ -32,7 +32,6 @@ RDEPENDS_${PN}-base = "\
     adwaita-icon-theme \
     settings-daemon \
     shutdown-desktop \
-    libsdl \
     ${NETWORK_MANAGER} \
     udev-extraconf \
     ${@bb.utils.contains('DISTRO_FEATURES', 'pulseaudio', 'pulseaudio-server pulseaudio-client-conf-sato pulseaudio-misc', '', d)} \
-- 
2.11.0


