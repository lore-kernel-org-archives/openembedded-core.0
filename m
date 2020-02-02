Return-Path: <raj.khem@gmail.com>
Received: from mail-pf1-f196.google.com (mail-pf1-f196.google.com
	[209.85.210.196])
	by mail.openembedded.org (Postfix) with ESMTP id 525ED60E77
	for <openembedded-core@lists.openembedded.org>;
	Sun,  2 Feb 2020 18:34:59 +0000 (UTC)
Received: by mail-pf1-f196.google.com with SMTP id x185so6326752pfc.5
	for <openembedded-core@lists.openembedded.org>;
	Sun, 02 Feb 2020 10:35:00 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=from:to:cc:subject:date:message-id:in-reply-to:references
	:mime-version:content-transfer-encoding;
	bh=5TAplFk3iCX8mbw5wFiQLSTLApvFKKHzOTb8KQS2+dA=;
	b=Ktg4R39/DgkbNtgg7yPAF9lBM7kWZh8x6ieqXgUi1SEW27zy5tCFxIGcrK3DXRYEnW
	YOj+QCXZAcge9q68JeHtCOuHjhbOEWseIFSqUTvYadqwFuEoPNQV3CW2ZuZy/6iaVhO8
	0bIcyI1De3SQEMp/LJJJWN3UHmYtri2enBQsGoUS/Iu0VYxeOypVLCeFkiwh2TT6NMs1
	cRopXxDfBIjjCSHQb/OKyegQzugYEOJCfLYquwIRWCywiyJnEoq2marXVdQ0iT2sXuQ5
	84ZebSbHc8xhmBG6jLXw3uZ9wNGamSS4IuoEqaVzxoL0+ttoebiWkLY1p1WZoyxnj4Oq
	6aOw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
	:references:mime-version:content-transfer-encoding;
	bh=5TAplFk3iCX8mbw5wFiQLSTLApvFKKHzOTb8KQS2+dA=;
	b=GkBKf2rkvEFcto06WYjCqOtD3ihTTPVoKMIt+H+lAfzMcUaxhyBkJNNZfR7WQ7fYoH
	iDML8t1RPA7BUogwdnpZztGLT6dHFw8uuGjupOj570n6586T47GTsy7ptGgan48rWxvu
	L/PwvyilHqLGfFEny4cI2MVdGk6HOeSe3SJUK1aGFoCr3Gzhl+KbolYZ9jkWg4zZPtBW
	u/6Mur83xaReyajKiqL1pf4jIf17xJsgdJNryr+LvNU2T4UW/VGUoWh133kN5JG5VAXP
	cJGlXfL9OI+91uDDpyI2KjgHaxkxvAfmDKjnOf2J1Xy6EDhg8Y2dR9tnd+YnCXrQJ5xy
	Pbgg==
X-Gm-Message-State: APjAAAUVhYSX30MA4Jmpo+Qu2IIjt92S/wj1XML+WLyg98Iiow6W074u
	lesxtUU4PxQKCcvnaFVdLsRj2j7qDzE=
X-Google-Smtp-Source: APXvYqy0Iv6fUPyrZlVP0cMvyG6ECpJIiTuCH4aDNAsHmXltANQFqSp5JFdwpfb8JaIV9E9t4LFXFA==
X-Received: by 2002:aa7:9546:: with SMTP id w6mr20685846pfq.66.1580668500268; 
	Sun, 02 Feb 2020 10:35:00 -0800 (PST)
Received: from apollo.hsd1.ca.comcast.net ([2601:646:9200:4e0::5683])
	by smtp.gmail.com with ESMTPSA id
	z27sm17761809pfj.107.2020.02.02.10.34.59
	(version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
	Sun, 02 Feb 2020 10:34:59 -0800 (PST)
From: Khem Raj <raj.khem@gmail.com>
To: openembedded-core@lists.openembedded.org
Date: Sun,  2 Feb 2020 10:34:58 -0800
Message-Id: <cc7808875acd04bc56a43325b78fc145c03b4b61.1580668334.git.raj.khem@gmail.com>
X-Mailer: git-send-email 2.25.0
In-Reply-To: <cover.1580668334.git.raj.khem@gmail.com>
References: <cover.1580668334.git.raj.khem@gmail.com>
MIME-Version: 1.0
Subject: [PATCH 1/2] netbase: Upgrade to 6.0
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
X-List-Received-Date: Sun, 02 Feb 2020 18:35:00 -0000
Content-Transfer-Encoding: 8bit

adjust install to pick new files from S

Signed-off-by: Khem Raj <raj.khem@gmail.com>
---
 .../netbase/{netbase_5.8.bb => netbase_6.0.bb}         | 10 +++++-----
 1 file changed, 5 insertions(+), 5 deletions(-)
 rename meta/recipes-core/netbase/{netbase_5.8.bb => netbase_6.0.bb} (61%)

diff --git a/meta/recipes-core/netbase/netbase_5.8.bb b/meta/recipes-core/netbase/netbase_6.0.bb
similarity index 61%
rename from meta/recipes-core/netbase/netbase_5.8.bb
rename to meta/recipes-core/netbase/netbase_6.0.bb
index df617f4481..2fb5762b30 100644
--- a/meta/recipes-core/netbase/netbase_5.8.bb
+++ b/meta/recipes-core/netbase/netbase_6.0.bb
@@ -8,13 +8,13 @@ PE = "1"
 
 SRC_URI = "${DEBIAN_MIRROR}/main/n/${BPN}/${BPN}_${PV}.tar.xz"
 
-SRC_URI[md5sum] = "ca2e339861b64370779341b9696ee3df"
-SRC_URI[sha256sum] = "4a9035eb379c4f7f7d424e5580b219b79566fa366c812542691ae337486cfb8e"
+SRC_URI[md5sum] = "3417b0487161f1a2b070a3308cd7f957"
+SRC_URI[sha256sum] = "692baeb7b76eba5580c7edbc97ce1784a06b5aa4b367c5ed0b39e0ce7a97d594"
 
 UPSTREAM_CHECK_URI = "${DEBIAN_MIRROR}/main/n/netbase/"
 do_install () {
 	install -d ${D}/${mandir}/man8 ${D}${sysconfdir}
-	install -m 0644 etc-rpc ${D}${sysconfdir}/rpc
-	install -m 0644 etc-protocols ${D}${sysconfdir}/protocols
-	install -m 0644 etc-services ${D}${sysconfdir}/services
+	install -m 0644 ${S}/etc/rpc ${D}${sysconfdir}/rpc
+	install -m 0644 ${S}/etc/protocols ${D}${sysconfdir}/protocols
+	install -m 0644 ${S}/etc/services ${D}${sysconfdir}/services
 }
-- 
2.25.0


