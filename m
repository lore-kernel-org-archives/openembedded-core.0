Return-Path: <open.source@oleksandr-kravchuk.com>
Received: from mail-lf1-f67.google.com (mail-lf1-f67.google.com
	[209.85.167.67])
	by mail.openembedded.org (Postfix) with ESMTP id 4D3037F339
	for <openembedded-core@lists.openembedded.org>;
	Tue, 10 Sep 2019 23:29:11 +0000 (UTC)
Received: by mail-lf1-f67.google.com with SMTP id j4so14861524lfh.8
	for <openembedded-core@lists.openembedded.org>;
	Tue, 10 Sep 2019 16:29:13 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=oleksandr-kravchuk-com.20150623.gappssmtp.com; s=20150623;
	h=from:to:cc:subject:date:message-id;
	bh=NoU29YOm6XU/O7X9SsEwrUyF4uhgn4hp2qpCBiUqYfU=;
	b=ZVq6t2kGrlIigFDuMiCYzyVxfIYgVWTzDTgQN0DoUzLIbPcUXMHYd7O5+r3a4ymYn1
	BwPwp6hFahRXMPoCKZwdb77Fzpjbcj85lttT8/gqZQabJ+yPQGYuAKdyiKvcfvVM7+8i
	Jk8EwK5Jf4KK+KlDo1NPOGKUftTwDvjEdT2ufgUKaDNtHJCYmq7INZl+6eHD5qCXS3v5
	QSIUbYyId+hh4zfsTIMvURWStvyI+rn7LQP/A1c2eeJsfxCFS9rMlJ79AXIO8Ik6AzGf
	eAkOcLkUkR+Nmi4Qlt5ZlVeMuDttJIXpQATswDALuHjqcpxxw/rMI2IrXZ1DdO3b1EQP
	KfVQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:cc:subject:date:message-id;
	bh=NoU29YOm6XU/O7X9SsEwrUyF4uhgn4hp2qpCBiUqYfU=;
	b=dM/n4x6IXi53qZjPmJnbIT1WdAJmZu9OKojD83kDPjTFNfyj4QTDRKiagUWbkPis5X
	1+ocel8ZwG7S+udk5VyQC64gdiaLNbqas6Iho8cvQ+aj8C9d1jEuIDS+o/jpOGRiHhlz
	vOgvPGrQ+yc9CrRZRG2NyXEFzDlWQTIznKz/aEGF1zpwCQD1iEJwJJMVrUsAZpv+cVg0
	mj4bEpLq7rM14Gx9rKJisqzm5m/vnZI4wMGtDwPyUWbgRZdEmozkDWxf68VWDp/wA2Qy
	O4HWkKJUbxYA+v3KgDX4j/xUKI/cIQr5iX6EnlYnTcbYez/um3nT5aTVEjMWzxoJqRvW
	/rSQ==
X-Gm-Message-State: APjAAAXKv234Qjyr4VUT84fdezh4xIeFV5iQ7zZoNnEHRDUdYQS3eCtT
	EsNen2pF3/iuFJGIcqunkuundRxUCR8=
X-Google-Smtp-Source: APXvYqyNXF6/TDTcFUaiW1csc7B9zoDGlhP5J8INku9eXGGK5MjywB6rjkltDKeAtHitCdFm2ztaLg==
X-Received: by 2002:a19:c3d3:: with SMTP id t202mr22665277lff.48.1568158152271;
	Tue, 10 Sep 2019 16:29:12 -0700 (PDT)
Received: from lund.luxoft.com (c213-89-0-115.bredband.comhem.se.
	[213.89.0.115])
	by smtp.gmail.com with ESMTPSA id h5sm2909539ljl.26.2019.09.10.16.29.11
	(version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
	Tue, 10 Sep 2019 16:29:11 -0700 (PDT)
From: Oleksandr Kravchuk <open.source@oleksandr-kravchuk.com>
To: openembedded-core@lists.openembedded.org
Date: Wed, 11 Sep 2019 01:09:08 +0200
Message-Id: <20190910230908.31819-1-open.source@oleksandr-kravchuk.com>
X-Mailer: git-send-email 2.17.1
Cc: Oleksandr Kravchuk <open.source@oleksandr-kravchuk.com>
Subject: [PATCH] python3-pygobject: update to 3.34.0
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
X-List-Received-Date: Tue, 10 Sep 2019 23:29:12 -0000

Signed-off-by: Oleksandr Kravchuk <open.source@oleksandr-kravchuk.com>
---
 ...ython3-pygobject_3.32.2.bb => python3-pygobject_3.34.0.bb} | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)
 rename meta/recipes-devtools/python/{python3-pygobject_3.32.2.bb => python3-pygobject_3.34.0.bb} (87%)

diff --git a/meta/recipes-devtools/python/python3-pygobject_3.32.2.bb b/meta/recipes-devtools/python/python3-pygobject_3.34.0.bb
similarity index 87%
rename from meta/recipes-devtools/python/python3-pygobject_3.32.2.bb
rename to meta/recipes-devtools/python/python3-pygobject_3.34.0.bb
index 476957e887..6babf0cae8 100644
--- a/meta/recipes-devtools/python/python3-pygobject_3.32.2.bb
+++ b/meta/recipes-devtools/python/python3-pygobject_3.34.0.bb
@@ -14,8 +14,8 @@ SRC_URI = " \
     http://ftp.gnome.org/pub/GNOME/sources/${SRCNAME}/${@gnome_verdir("${PV}")}/${SRCNAME}-${PV}.tar.xz \
     file://0001-Do-not-build-tests.patch \
 "
-SRC_URI[md5sum] = "92ffa25351782feb96362f0dace2089f"
-SRC_URI[sha256sum] = "c39ca2a28364b57fa00549c6e836346031e6b886c3ceabfd8ab4b4fed0a83611"
+SRC_URI[md5sum] = "ca1dc4f31c1d6d283758e8f315a88ab6"
+SRC_URI[sha256sum] = "87e2c9aa785f352ef111dcc5f63df9b85cf6e05e52ff04f803ffbebdacf5271a"
 
 UNKNOWN_CONFIGURE_WHITELIST = "introspection"
 
-- 
2.17.1


