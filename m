Return-Path: <ross.burton@intel.com>
Received: from mail-wr1-f46.google.com (mail-wr1-f46.google.com
	[209.85.221.46])
	by mail.openembedded.org (Postfix) with ESMTP id 7EC167FFA3
	for <openembedded-core@lists.openembedded.org>;
	Wed, 18 Sep 2019 13:27:51 +0000 (UTC)
Received: by mail-wr1-f46.google.com with SMTP id b9so6970641wrs.0
	for <openembedded-core@lists.openembedded.org>;
	Wed, 18 Sep 2019 06:27:52 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=intel-com.20150623.gappssmtp.com; s=20150623;
	h=from:to:subject:date:message-id:mime-version
	:content-transfer-encoding;
	bh=afNXVaRvOToR8w+uER6KivB+9Mq1oT/6krP3YNVoRh8=;
	b=HfP4X7GImhiZThS27zBkau2jEMUp3QNk3CAXCJAC7ZWjPU6WQevtGAPPRjJSXF4em0
	J8n8EtoN9D7wHPIO8BdKxuqgKJRosTYhZwGfEJ5JK5nk6F9RYSWp+Mm3QZRsuyxuxm0S
	JxaEh5mkUFRdi3HFNIG7cuQgo26sKHmH/3TIq0mfZlY5LMXc6o9gyOzdEPpWNGKm9Y/F
	ccylLZX+dLSoGX7ujwchguv8LhqxZ/sIgAGZ4oEcIaYxC9ofS3+M7X/XbYUrsm90vy4J
	XBwKr+jgw3ASp9QX+8C44G87GLON+iMBoi+KGS/PjA9ljBUEZ4Nu3wxQcEukzGq4CZmE
	snlg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:subject:date:message-id:mime-version
	:content-transfer-encoding;
	bh=afNXVaRvOToR8w+uER6KivB+9Mq1oT/6krP3YNVoRh8=;
	b=oTk9Diwp2b7RLrPUm5NcwHR35LQNANDS+A9TODnKnsCf4bZrcNJdrz2woq5IiBer2J
	5qbHpvkdx3pSIevMBkBFwX1rwmLtkvoWHnRmcImUtdtxbd6bhb1Jkkldg2516mGiGbVc
	qCnXf2dp8ZbURsmU4E7rahTR8pEFy2gu83wP7B3tsCVXAZRrvqql57E8yv0VcTkd0XlB
	E9FgG0HxrBvE6duEd3Df90W095+lMbrrzNoJJ8pmHLmojcD7hSyxPqWpbf7Nva+3Vc5A
	7wohqKsKihsd9pi5v35IUezk7ZbXv+EMOPqS2+F9pJ+2A09pQn/WYtrMeMxIuM7naDlj
	ALWg==
X-Gm-Message-State: APjAAAVsTn5KGMXI8a8Cucf6Sis0PORWgNTWCP8JUKwQLYnSzg/duxmW
	Uliy3IQb51sdddg5iENzlx+lB2Es+Lw=
X-Google-Smtp-Source: APXvYqzzx10vDp5Vt6kDpPKa4P/oRY5vqu9xavKuSE4FUUYLuTAhrJZgmaK0KrB8SAeKo73gqRnGWw==
X-Received: by 2002:adf:f150:: with SMTP id y16mr2923697wro.71.1568813271920; 
	Wed, 18 Sep 2019 06:27:51 -0700 (PDT)
Received: from flashheart.burtonini.com (35.106.2.81.in-addr.arpa.
	[81.2.106.35])
	by smtp.gmail.com with ESMTPSA id d9sm7812207wrf.62.2019.09.18.06.27.50
	for <openembedded-core@lists.openembedded.org>
	(version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
	Wed, 18 Sep 2019 06:27:50 -0700 (PDT)
From: Ross Burton <ross.burton@intel.com>
To: openembedded-core@lists.openembedded.org
Date: Wed, 18 Sep 2019 14:27:42 +0100
Message-Id: <20190918132744.11195-1-ross.burton@intel.com>
X-Mailer: git-send-email 2.20.1
MIME-Version: 1.0
Subject: [PATCH 1/3] acpica: upgrade 20190509 -> 20190816
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
X-List-Received-Date: Wed, 18 Sep 2019 13:27:51 -0000
Content-Transfer-Encoding: 8bit

Signed-off-by: Ross Burton <ross.burton@intel.com>
---
 .../acpica/{acpica_20190509.bb => acpica_20190816.bb}         | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)
 rename meta/recipes-extended/acpica/{acpica_20190509.bb => acpica_20190816.bb} (91%)

diff --git a/meta/recipes-extended/acpica/acpica_20190509.bb b/meta/recipes-extended/acpica/acpica_20190816.bb
similarity index 91%
rename from meta/recipes-extended/acpica/acpica_20190509.bb
rename to meta/recipes-extended/acpica/acpica_20190816.bb
index cf6db336a6f..8f799747756 100644
--- a/meta/recipes-extended/acpica/acpica_20190509.bb
+++ b/meta/recipes-extended/acpica/acpica_20190816.bb
@@ -17,8 +17,8 @@ COMPATIBLE_HOST = "(i.86|x86_64|arm|aarch64).*-linux"
 DEPENDS = "bison flex bison-native"
 
 SRC_URI = "https://acpica.org/sites/acpica/files/acpica-unix2-${PV}.tar.gz"
-SRC_URI[md5sum] = "dd1f8240f924b12b0a0de0c31ab26ab1"
-SRC_URI[sha256sum] = "860b5f94a0590b278592acf16a4556b05ff0309c08e8c48aa29827cfa02c8e9d"
+SRC_URI[md5sum] = "6a73b1e34715916fa31132dbe11008b0"
+SRC_URI[sha256sum] = "888e80f3bb77381620a5ead208e1a1be06f3ea66ddc8cfdfa62811cae5f03752"
 UPSTREAM_CHECK_URI = "https://acpica.org/downloads"
 
 S = "${WORKDIR}/acpica-unix2-${PV}"
-- 
2.20.1


