Return-Path: <open.source@oleksandr-kravchuk.com>
Received: from mail-lj1-f175.google.com (mail-lj1-f175.google.com
	[209.85.208.175])
	by mail.openembedded.org (Postfix) with ESMTP id CB5BE7E3B6
	for <openembedded-core@lists.openembedded.org>;
	Wed, 21 Aug 2019 19:02:48 +0000 (UTC)
Received: by mail-lj1-f175.google.com with SMTP id e24so3153831ljg.11
	for <openembedded-core@lists.openembedded.org>;
	Wed, 21 Aug 2019 12:02:49 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=oleksandr-kravchuk-com.20150623.gappssmtp.com; s=20150623;
	h=from:to:cc:subject:date:message-id;
	bh=7AFNN9EKaBj56ktldtDgBU+N2VYKO2QD6zG4mGXsPCI=;
	b=RIgvep52wrwQSX0yt0Hq5zRhJTR2s9UorRY5nvcJYhvdFubWdstm4M3CpQMxRTGP0X
	FSQQWosuNX0qEGNYyBUZ9+dAxzJlKhyKkXn3402+JGpZ8BMroXlbGiZ4IZizamYaIBLO
	S6Q/pPAgmA/GwJoPNui2CUe5DRpDIIbnIcN1i++EXgoWyWREm9RJPGKSDiLJ7se+RQ0z
	SyxVM5prhGgbkNyvPNhjFGQAhM1Rp7PMneXidtinfPLwTyQx5CsjOwTqKOkUX4EM6Zgv
	SFpR3VXOCyZSHJ9xB50fthmvJ48SNdNYu/4IiiHC8ukzmsWgb/+R3WrvrJAnM1XHzQw1
	x4UA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:cc:subject:date:message-id;
	bh=7AFNN9EKaBj56ktldtDgBU+N2VYKO2QD6zG4mGXsPCI=;
	b=ikzEExd4mnMBjV37gsfYGXjEjl8z3qA44VuC1beejDV7rq2vQJWU2s6hxMJqn09tl1
	0JKR/Ux6p+sjM6wB7UfUEKbcpRm4miZPzdPUrBZwFZAWSf0PGlxbQUMHy68VbMenqOpA
	1AxP0mF9YJlOHlFlwRzK/ci5pinx4O56Mlb1Cn1twfbzO8y3egiMdExu47Zj0RTOghDj
	lNgU9tpndVrvot3wvVqPelo2lsZnj5EvhIC40TXbAw8vMDq8bqXtoT6XH8++SJSDKR1p
	iDYvrOMA2ngvXo8jNSAUgRhLmSPGHA77+W2qyxWze2TlJ8CsFDzaCtyjuyKcg7CrXK9m
	qANA==
X-Gm-Message-State: APjAAAWr/3MXySUW31B1/43yvkwUSJ0qZMO33O4lc4hlBN0geThTTS2h
	xGFFQc1YqkJvRNI3ENzZO5JzeWIsmn4=
X-Google-Smtp-Source: APXvYqzIyNqouNkP8eINScjx9vRwSZc2Qm6JP33dRhyf1Lh6HDr4HMwe/tQQreMV1tOboyqizfYjNw==
X-Received: by 2002:a2e:9597:: with SMTP id w23mr19091411ljh.147.1566414168378;
	Wed, 21 Aug 2019 12:02:48 -0700 (PDT)
Received: from localhost.localdomain (c83-252-117-108.bredband.comhem.se.
	[83.252.117.108]) by smtp.gmail.com with ESMTPSA id
	x137sm3543213lff.23.2019.08.21.12.02.47
	(version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
	Wed, 21 Aug 2019 12:02:47 -0700 (PDT)
From: Oleksandr Kravchuk <open.source@oleksandr-kravchuk.com>
To: openembedded-core@lists.openembedded.org
Date: Wed, 21 Aug 2019 21:02:44 +0200
Message-Id: <20190821190244.7461-1-open.source@oleksandr-kravchuk.com>
X-Mailer: git-send-email 2.17.1
Cc: Oleksandr Kravchuk <oleksandr.kravchuk@pelagicore.com>,
	Oleksandr Kravchuk <open.source@oleksandr-kravchuk.com>
Subject: [PATCH] python-setuptools: update to 41.2.0
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
X-List-Received-Date: Wed, 21 Aug 2019 19:02:49 -0000

From: Oleksandr Kravchuk <oleksandr.kravchuk@pelagicore.com>

Signed-off-by: Oleksandr Kravchuk <open.source@oleksandr-kravchuk.com>
---
 meta/recipes-devtools/python/python-setuptools.inc            | 4 ++--
 ...ython-setuptools_41.1.0.bb => python-setuptools_41.2.0.bb} | 0
 ...hon3-setuptools_41.1.0.bb => python3-setuptools_41.2.0.bb} | 0
 3 files changed, 2 insertions(+), 2 deletions(-)
 rename meta/recipes-devtools/python/{python-setuptools_41.1.0.bb => python-setuptools_41.2.0.bb} (100%)
 rename meta/recipes-devtools/python/{python3-setuptools_41.1.0.bb => python3-setuptools_41.2.0.bb} (100%)

diff --git a/meta/recipes-devtools/python/python-setuptools.inc b/meta/recipes-devtools/python/python-setuptools.inc
index c806589dba..322197eed8 100644
--- a/meta/recipes-devtools/python/python-setuptools.inc
+++ b/meta/recipes-devtools/python/python-setuptools.inc
@@ -10,8 +10,8 @@ inherit pypi
 
 SRC_URI_append_class-native = " file://0001-conditionally-do-not-fetch-code-by-easy_install.patch"
 
-SRC_URI[md5sum] = "f26bbb3201c42ef37fb8d184cb85234d"
-SRC_URI[sha256sum] = "c519b84c299911fd94ef47e3de4fe678c254aefc5cdf8a9b12e4cdc8cc3744a8"
+SRC_URI[md5sum] = "a3470ce184da33f0fa6c9f44f6221bc0"
+SRC_URI[sha256sum] = "66b86bbae7cc7ac2e867f52dc08a6bd064d938bac59dfec71b9b565dd36d6012"
 
 DEPENDS += "${PYTHON_PN}"
 
diff --git a/meta/recipes-devtools/python/python-setuptools_41.1.0.bb b/meta/recipes-devtools/python/python-setuptools_41.2.0.bb
similarity index 100%
rename from meta/recipes-devtools/python/python-setuptools_41.1.0.bb
rename to meta/recipes-devtools/python/python-setuptools_41.2.0.bb
diff --git a/meta/recipes-devtools/python/python3-setuptools_41.1.0.bb b/meta/recipes-devtools/python/python3-setuptools_41.2.0.bb
similarity index 100%
rename from meta/recipes-devtools/python/python3-setuptools_41.1.0.bb
rename to meta/recipes-devtools/python/python3-setuptools_41.2.0.bb
-- 
2.17.1


