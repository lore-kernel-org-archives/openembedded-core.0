Return-Path: <open.source@oleksandr-kravchuk.com>
Received: from mail-lj1-f177.google.com (mail-lj1-f177.google.com
	[209.85.208.177])
	by mail.openembedded.org (Postfix) with ESMTP id 1CE106C129
	for <openembedded-core@lists.openembedded.org>;
	Thu, 15 Aug 2019 16:00:45 +0000 (UTC)
Received: by mail-lj1-f177.google.com with SMTP id l14so2653740ljj.9
	for <openembedded-core@lists.openembedded.org>;
	Thu, 15 Aug 2019 09:00:47 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=oleksandr-kravchuk-com.20150623.gappssmtp.com; s=20150623;
	h=from:to:cc:subject:date:message-id;
	bh=kjsf4kXhVXJxv2iPMvt1CcJO8daH7T6vBKqi2dfUYlQ=;
	b=nVtVS/VgM10+p41cpKBqASZ/yV+7gAXyai0d74UuisizRZ9qTYu4yHAFVNguOyhDvW
	pFC8G4v4nUnEeNTcVG6Rjk7EKj4LjazJL00U0CD4mna6NLRWDUZvOF8CE/uw18cqV4qT
	gqmE1eLb7zQX4wuTTfDw36oDAi95rv2YEMSki/MswI9ogboKP+KpNxo0qDGoLh04bj+4
	Wuc67+QYxkDE1TlkYJ2xYOBCgy5R9qqQz2ujq/Z/8WzSgKI486uB226U8EBA1t+7hE02
	ORQxiTAMfhd7kqZF4sTUMXe1giHhgs5yuwdLgQFZmJL7KzS4eJkwcUW6ZAx5ELEmfkma
	qcMA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:cc:subject:date:message-id;
	bh=kjsf4kXhVXJxv2iPMvt1CcJO8daH7T6vBKqi2dfUYlQ=;
	b=kWMfjQzO5iJHHduiDjYqa8FcR8ifp13tGhfRTiSTQbD4UQ79BntIWT4oPxCgFdPJ+U
	Wb/qggV69JK/cEjAJq2Zf3T0orVX40bD65guwx/ENLwARNwNXz90Ya1Lji50krvCV8Q+
	QqSBTLsYb4dlGTZdjKqxHvRQOmRKXyP83TB7sZKGGLrl7pu08OIjPuSsyYkkyknRxSj6
	+IcImvriq7x63/+1J2lRPf5CUYY3ELaVoFAVK1SQImAhvxiIiweaugex0LU6r9lkVX5l
	JkuPAQZsXBVNPGwvt1VZ9lqPx/QJcMBOMcMsx7yU37Hpzj9bhABmaOMEU7MH6920K5mq
	AjEA==
X-Gm-Message-State: APjAAAWIykCsPD71jx26hb7ZMFCowvzSDT39LTU8o/5uSDiAhDwBlSwA
	xNM+tQ9JXfjC5KrQ/YSdVZ6GykUaUBk=
X-Google-Smtp-Source: APXvYqyR6DP0HL/Ff+cxh+RUNOPBY/wJN903VJp0OiETN7U6Vqrhjxb9yV12agoDLOLHq+oHtxuqMw==
X-Received: by 2002:a2e:8ed5:: with SMTP id e21mr3089124ljl.156.1565884846120; 
	Thu, 15 Aug 2019 09:00:46 -0700 (PDT)
Received: from localhost.localdomain (c83-252-117-108.bredband.comhem.se.
	[83.252.117.108]) by smtp.gmail.com with ESMTPSA id
	l23sm540572lje.106.2019.08.15.09.00.45
	(version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
	Thu, 15 Aug 2019 09:00:45 -0700 (PDT)
From: Oleksandr Kravchuk <open.source@oleksandr-kravchuk.com>
To: openembedded-core@lists.openembedded.org
Date: Thu, 15 Aug 2019 18:00:43 +0200
Message-Id: <20190815160043.19967-1-open.source@oleksandr-kravchuk.com>
X-Mailer: git-send-email 2.17.1
Cc: Oleksandr Kravchuk <open.source@oleksandr-kravchuk.com>
Subject: [PATCH] python-setuptools: update to 41.1.0
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
X-List-Received-Date: Thu, 15 Aug 2019 16:00:46 -0000

Signed-off-by: Oleksandr Kravchuk <open.source@oleksandr-kravchuk.com>
---
 meta/recipes-devtools/python/python-setuptools.inc            | 4 ++--
 ...ython-setuptools_41.0.1.bb => python-setuptools_41.1.0.bb} | 0
 ...hon3-setuptools_41.0.1.bb => python3-setuptools_41.1.0.bb} | 0
 3 files changed, 2 insertions(+), 2 deletions(-)
 rename meta/recipes-devtools/python/{python-setuptools_41.0.1.bb => python-setuptools_41.1.0.bb} (100%)
 rename meta/recipes-devtools/python/{python3-setuptools_41.0.1.bb => python3-setuptools_41.1.0.bb} (100%)

diff --git a/meta/recipes-devtools/python/python-setuptools.inc b/meta/recipes-devtools/python/python-setuptools.inc
index f49e078697..c806589dba 100644
--- a/meta/recipes-devtools/python/python-setuptools.inc
+++ b/meta/recipes-devtools/python/python-setuptools.inc
@@ -10,8 +10,8 @@ inherit pypi
 
 SRC_URI_append_class-native = " file://0001-conditionally-do-not-fetch-code-by-easy_install.patch"
 
-SRC_URI[md5sum] = "6404ca798bb9a9073aff3b91b2df35c8"
-SRC_URI[sha256sum] = "a222d126f5471598053c9a77f4b5d4f26eaa1f150ad6e01dcf1a42e185d05613"
+SRC_URI[md5sum] = "f26bbb3201c42ef37fb8d184cb85234d"
+SRC_URI[sha256sum] = "c519b84c299911fd94ef47e3de4fe678c254aefc5cdf8a9b12e4cdc8cc3744a8"
 
 DEPENDS += "${PYTHON_PN}"
 
diff --git a/meta/recipes-devtools/python/python-setuptools_41.0.1.bb b/meta/recipes-devtools/python/python-setuptools_41.1.0.bb
similarity index 100%
rename from meta/recipes-devtools/python/python-setuptools_41.0.1.bb
rename to meta/recipes-devtools/python/python-setuptools_41.1.0.bb
diff --git a/meta/recipes-devtools/python/python3-setuptools_41.0.1.bb b/meta/recipes-devtools/python/python3-setuptools_41.1.0.bb
similarity index 100%
rename from meta/recipes-devtools/python/python3-setuptools_41.0.1.bb
rename to meta/recipes-devtools/python/python3-setuptools_41.1.0.bb
-- 
2.17.1


