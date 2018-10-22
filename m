Return-Path: <akuster808@gmail.com>
Received: from mail-wr1-f65.google.com (mail-wr1-f65.google.com
	[209.85.221.65])
	by mail.openembedded.org (Postfix) with ESMTP id 7089679BCA
	for <openembedded-core@lists.openembedded.org>;
	Mon, 22 Oct 2018 14:05:20 +0000 (UTC)
Received: by mail-wr1-f65.google.com with SMTP id d2-v6so45130941wro.7
	for <openembedded-core@lists.openembedded.org>;
	Mon, 22 Oct 2018 07:05:21 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=from:to:cc:subject:date:message-id:in-reply-to:references;
	bh=oxElXkWJIifJKE2sOj8p1GoHaRe4g/BuXkJJV4C9YWg=;
	b=YW+AkAz8P2zCrx4ExGSFxGBUvpjMMk8Tb5v0Qd/UpzOyB5ejGioy9fb4Y7Jrvawcph
	tydgSnU3iY4G/Zv+mfCeU+19PGYtK9Kd9VwY+ZoWdwgaerzlEiFR3bnNRa6YroKFwIwC
	CnJZDdYk+41/v7Q/DyEvE7+e3BvIxjM3fll+X6HaGSbfMBQO1ranZ6o7vSgNO58Q+nlx
	EIeozsxWLZRjtwUThsBIKCrxulNq8H53aCDsWswoQGt1Giy9Co/MeC3ufBlbpsQmSPts
	6JVXspeCuM53c3PtMhf6TawV3R3wazIScbXu+VtsZfuXJtWZrqP/5O9PhGQ8DrtQdmYS
	rMeA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
	:references;
	bh=oxElXkWJIifJKE2sOj8p1GoHaRe4g/BuXkJJV4C9YWg=;
	b=nYcpDeRHbylKILaJcMDBE7iHOtC7bM89Hd8otufmhrFzAoQG/S8OUcoR05ijxbJKcv
	rPWl1dLQWm4fgT8/GtQ8sHK69J7Kp15otEJDza0kwmaxMUj8ptDsbnF8M7hbNmMYEX5m
	OvVFS4UUE0+uTdCaBmLOiuJKNbUK7VGoNReSR6rU9xnZTimcMVoPKmad3QpNyZl9OQU3
	i6ohKgF4ExLyYxjHruIHroG39yuviQLAgzI9zjqT1rIYBswgpOFUrwV5L/txnldyMPGl
	ZjdqKW+FxPk9vX7NYtELquCrnDVs991psRe4/3N5E7yNzjJdkZBsuYyqUBG4hLtlUpwP
	BgHA==
X-Gm-Message-State: AGRZ1gIFKBJvglUnl3Wd/24zZA0WAyl/Ou0wsQO+X3vpo+zvHfgTjf/X
	27xG54CZ1BGI2OdFabv176c=
X-Google-Smtp-Source: AJdET5f6ck4gVjiRdMQWQyg1qWRUl/fzQE/3vD0Zj7kBqOy4fa76grMwDd/B+ubWGug7slF4IY0Iiw==
X-Received: by 2002:a5d:6045:: with SMTP id
	j5-v6mr10031734wrt.21.1540217120893; 
	Mon, 22 Oct 2018 07:05:20 -0700 (PDT)
Received: from akuster-ThinkPad-T460s.event.pylonone.net ([185.7.230.214])
	by smtp.gmail.com with ESMTPSA id
	o130-v6sm9209989wmd.11.2018.10.22.07.05.18
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
	Mon, 22 Oct 2018 07:05:20 -0700 (PDT)
From: Armin Kuster <akuster808@gmail.com>
To: akuster808@gmail.com,
	openembedded-core@lists.openembedded.org
Date: Mon, 22 Oct 2018 15:05:00 +0100
Message-Id: <1540217112-24479-2-git-send-email-akuster808@gmail.com>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <1540217112-24479-1-git-send-email-akuster808@gmail.com>
References: <1540217112-24479-1-git-send-email-akuster808@gmail.com>
Cc: Armin Kuster <akuster@mvista.com>
Subject: [PATCH 01/13] nss: update to 3.39 includes CVE-2018-12384
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
X-List-Received-Date: Mon, 22 Oct 2018 14:05:20 -0000

From: Armin Kuster <akuster@mvista.com>

see: https://developer.mozilla.org/en-US/docs/Mozilla/Projects/NSS/NSS_3.39_release_notes

Signed-off-by: Armin Kuster <akuster@mvista.com>
---
 meta/recipes-support/nss/{nss_3.38.bb => nss_3.39.bb} | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)
 rename meta/recipes-support/nss/{nss_3.38.bb => nss_3.39.bb} (98%)

diff --git a/meta/recipes-support/nss/nss_3.38.bb b/meta/recipes-support/nss/nss_3.39.bb
similarity index 98%
rename from meta/recipes-support/nss/nss_3.38.bb
rename to meta/recipes-support/nss/nss_3.39.bb
index e0ee209..cdc95c6 100644
--- a/meta/recipes-support/nss/nss_3.38.bb
+++ b/meta/recipes-support/nss/nss_3.39.bb
@@ -30,8 +30,8 @@ SRC_URI = "http://ftp.mozilla.org/pub/mozilla.org/security/nss/releases/${VERSIO
            file://system-pkcs11.txt \
            "
 
-SRC_URI[md5sum] = "ac9065460a7634ba8eb0f942f404e773"
-SRC_URI[sha256sum] = "2c643d3c08d6935f4d325f40743719b6990aa25a79ec2f8f712c99d086672f62"
+SRC_URI[md5sum] = "10720fc70fd483de1b085402fb10ed59"
+SRC_URI[sha256sum] = "6be64dd76f212415cc8bc34343ac1e7389048db4db9a023a84873c411dc5864b"
 
 UPSTREAM_CHECK_URI = "https://developer.mozilla.org/en-US/docs/Mozilla/Projects/NSS/NSS_Releases"
 UPSTREAM_CHECK_REGEX = "NSS_(?P<pver>.+)_release_notes"
-- 
2.7.4


