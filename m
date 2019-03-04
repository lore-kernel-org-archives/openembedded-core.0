Return-Path: <open.source@oleksandr-kravchuk.com>
Received: from mail-lf1-f67.google.com (mail-lf1-f67.google.com
	[209.85.167.67])
	by mail.openembedded.org (Postfix) with ESMTP id 3D7D46C1BE
	for <openembedded-core@lists.openembedded.org>;
	Mon,  4 Mar 2019 04:18:37 +0000 (UTC)
Received: by mail-lf1-f67.google.com with SMTP id d26so2492067lfa.1
	for <openembedded-core@lists.openembedded.org>;
	Sun, 03 Mar 2019 20:18:39 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=oleksandr-kravchuk-com.20150623.gappssmtp.com; s=20150623;
	h=from:to:cc:subject:date:message-id;
	bh=NDbxfBjuKuVuVrrRhr5oZS3HUW6123ZLohMR9sfy4Q4=;
	b=nl5SrK5Z0jcvGp2fXO91nMxo1uVPqupfEznDd4qPgL3tqK0ZPGYEgRXo5am3ljwvW1
	F8kDeULcx12grRo2I72XSGx0N75mGKbv22tGR2sYK+SVZEQ7hkHfMKAzgZzuMlB0QYlQ
	zka8EL9BWwW2nmnr3eGmP4rdmqHNwgUmmEIbv/0bTrHuCxHhKL3chNO1NPgSgYFKt/S9
	IzAw3093o/MV69EfoZOnWNkQX13Yc/ZkQgnN/BmVwmsxI7wGTmaElT+Bhh0rLaue0VI+
	X5jz9m3CruDwi4tGh+Q48D9k4utXYh2rJgsZG4ti3JCbpR4G+OoM0M676J/aqT0Ah++l
	29Ng==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:cc:subject:date:message-id;
	bh=NDbxfBjuKuVuVrrRhr5oZS3HUW6123ZLohMR9sfy4Q4=;
	b=fME3+ZECEh1EIR1HMzqHGoAH6pV5DEd8K2jTqxg3DvsiVv1eRN5hzSe+R5aJ2OgL83
	10lm5NMW+ocque5mqTVX5DyxVNrpHpYWK+KWeK3MAB4D5l7XZge1m+nFpTS8lPT6RyuE
	Rj7SASqvwshF8j0s3Ca8SzAbm+fM/Fa4cvL3FJdwIrMl26oK2YhM3o6p8JK/DWuED+9d
	yYJmAjgv+Xp0MV79VaD5oW97h57kZtieUeEDA28U208YM34XpICa1JMAvogVUDFkZtnG
	OlHr0WLP+L7Sya7+CzldFp7egSVwLZ66byP6zW9JLOu2sgH0zBbaO5ShB6eIYNnAYLie
	I4jA==
X-Gm-Message-State: APjAAAXZupPZVeeqspgAbrutZZDVyYWmGqfk8G+FVsT4qn7sIH/O6pb0
	HI7k21LoINY3ASSKgOk9ZlZpluZo8iQ=
X-Google-Smtp-Source: APXvYqxeXbfnoN6n4d1ORLxMEU7QYpCzk1iM+SggqqqFINGyf8/zU2oeDsTfkKKCKN3nVf1G202GUQ==
X-Received: by 2002:ac2:5607:: with SMTP id v7mr5935099lfd.50.1551673118234;
	Sun, 03 Mar 2019 20:18:38 -0800 (PST)
Received: from scout.office.pelagicore.net ([83.218.80.243])
	by smtp.gmail.com with ESMTPSA id
	m16sm1285992ljb.50.2019.03.03.20.18.36
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Sun, 03 Mar 2019 20:18:37 -0800 (PST)
From: Oleksandr Kravchuk <open.source@oleksandr-kravchuk.com>
X-Google-Original-From: Oleksandr Kravchuk <oleksandr.kravchuk@pelagicore.com>
To: openembedded-core@lists.openembedded.org
Date: Mon,  4 Mar 2019 05:18:22 +0100
Message-Id: <20190304041822.118083-1-oleksandr.kravchuk@pelagicore.com>
X-Mailer: git-send-email 2.17.1
Cc: Oleksandr Kravchuk <oleksandr.kravchuk@pelagicore.com>
Subject: [meta-oe][thud][PATCH] target-sdk-provides-dummy: add perl-module-overload
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
X-List-Received-Date: Mon, 04 Mar 2019 04:18:38 -0000

Signed-off-by: Oleksandr Kravchuk <oleksandr.kravchuk@pelagicore.com>
---
 meta/recipes-core/meta/target-sdk-provides-dummy.bb | 1 +
 1 file changed, 1 insertion(+)

diff --git a/meta/recipes-core/meta/target-sdk-provides-dummy.bb b/meta/recipes-core/meta/target-sdk-provides-dummy.bb
index edf07c4a23..13741f0a64 100644
--- a/meta/recipes-core/meta/target-sdk-provides-dummy.bb
+++ b/meta/recipes-core/meta/target-sdk-provides-dummy.bb
@@ -26,6 +26,7 @@ DUMMYPROVIDES = "\
     perl-module-getopt-long \
     perl-module-io-file \
     perl-module-posix \
+    perl-module-overload \
     perl-module-thread-queue \
     perl-module-threads \
     /bin/sh \
-- 
2.17.1


