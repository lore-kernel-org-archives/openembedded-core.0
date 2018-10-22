Return-Path: <akuster808@gmail.com>
Received: from mail-wr1-f68.google.com (mail-wr1-f68.google.com
	[209.85.221.68])
	by mail.openembedded.org (Postfix) with ESMTP id 4AB0479BBF
	for <openembedded-core@lists.openembedded.org>;
	Mon, 22 Oct 2018 14:05:31 +0000 (UTC)
Received: by mail-wr1-f68.google.com with SMTP id y16so45137960wrw.3
	for <openembedded-core@lists.openembedded.org>;
	Mon, 22 Oct 2018 07:05:32 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=from:to:subject:date:message-id:in-reply-to:references;
	bh=DG2DqsLP+o9PDnqlfGXyhRQ2mSZ9oTlvswyN9FBu/H0=;
	b=Ma5aLf0MmSNTqKxF0cvLr3SSBh9jcocZ9xKRLFhcbXWYtFMfw48wC5i/NigFBXJ/iE
	XYE8Covnx9uBCjvbXFRHvud52Hh0N3V31x+blgwToJf4u3WGVtbrvAgXPqY0p/uCqBA9
	t+gBfZhvXu1SgcmpLL6t8MkONaMtF1/5yhaz8efURlqg8ZCzYXsBYmAYm+am03ScWnL0
	Pi7PdjK+cNnMf3wpqnLD28QF/G5o7+qi0+JcGRmAumJlQaPMkhk81fI8wMQiazgpsqJm
	fcPZ2p8LHyU5Bi6OMAT9M7NnoFO8fTXrq2ERjXKqSyGF4Th0sq7tjWrP5/To3BzAfxgt
	D3kQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
	:references;
	bh=DG2DqsLP+o9PDnqlfGXyhRQ2mSZ9oTlvswyN9FBu/H0=;
	b=agMV26GcRz0e3e5RjSTjZk2vfcg0zMmk8M19MdE00cGZrbUXaiIqjDtpcftqO48K32
	3XqgvuvRL08/T8W0fuyJo8I+O3/QLHXVWTD9CERu4Bhj4OtPruXmCMBQPxlN2VcC7lTW
	yhknxx/BU9HDLWn9ucM7pdcNujzMnh3YcDbM5qNxAoHeqW3K2plWILy8cCBmdSoRKEKu
	7xKl2UnGBJKltemy6aAET1k1zjiBl+Wa0vmQcSeAgezx+fOa5hhyIOAULAwV462acEtD
	BNUxPZF/wbjVh1gKloYduW4RHT5stlBrIvES1nWkXqwihUfff0vlmQyc9Dxy6XIy7QWa
	Rc8A==
X-Gm-Message-State: AGRZ1gJaSjkHk/g2BEp1SXJh+cbFgZ/1G/fCLViEuZo7/zv2rqEYU9PZ
	t3blajasMg8V9pQOnionEY8=
X-Google-Smtp-Source: AJdET5fK4+QNnNnEoeIjc5tcPSwMsK41HkFBCffLxzPgbsz7fdlMM1zRzRIu47dkK9OCj0FYidSMcg==
X-Received: by 2002:a5d:62d1:: with SMTP id
	o17-v6mr14024508wrv.27.1540217131971; 
	Mon, 22 Oct 2018 07:05:31 -0700 (PDT)
Received: from akuster-ThinkPad-T460s.event.pylonone.net ([185.7.230.214])
	by smtp.gmail.com with ESMTPSA id
	o130-v6sm9209989wmd.11.2018.10.22.07.05.29
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
	Mon, 22 Oct 2018 07:05:31 -0700 (PDT)
From: Armin Kuster <akuster808@gmail.com>
To: akuster808@gmail.com,
	openembedded-core@lists.openembedded.org
Date: Mon, 22 Oct 2018 15:05:06 +0100
Message-Id: <1540217112-24479-8-git-send-email-akuster808@gmail.com>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <1540217112-24479-1-git-send-email-akuster808@gmail.com>
References: <1540217112-24479-1-git-send-email-akuster808@gmail.com>
Subject: [PATCH 07/13] libsm: update to 1.2.3
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
X-List-Received-Date: Mon, 22 Oct 2018 14:05:31 -0000

reoder things per style

Signed-off-by: Armin Kuster <akuster808@gmail.com>
---
 meta/recipes-graphics/xorg-lib/{libsm_1.2.2.bb => libsm_1.2.3.bb} | 8 ++++----
 1 file changed, 4 insertions(+), 4 deletions(-)
 rename meta/recipes-graphics/xorg-lib/{libsm_1.2.2.bb => libsm_1.2.3.bb} (87%)

diff --git a/meta/recipes-graphics/xorg-lib/libsm_1.2.2.bb b/meta/recipes-graphics/xorg-lib/libsm_1.2.3.bb
similarity index 87%
rename from meta/recipes-graphics/xorg-lib/libsm_1.2.2.bb
rename to meta/recipes-graphics/xorg-lib/libsm_1.2.3.bb
index fdc693b..81b434e 100644
--- a/meta/recipes-graphics/xorg-lib/libsm_1.2.2.bb
+++ b/meta/recipes-graphics/xorg-lib/libsm_1.2.3.bb
@@ -22,10 +22,10 @@ PE = "1"
 
 XORG_PN = "libSM"
 
-BBCLASSEXTEND = "native"
-
-SRC_URI[md5sum] = "499a7773c65aba513609fe651853c5f3"
-SRC_URI[sha256sum] = "0baca8c9f5d934450a70896c4ad38d06475521255ca63b717a6510fdb6e287bd"
+SRC_URI[md5sum] = "87c7fad1c1813517979184c8ccd76628"
+SRC_URI[sha256sum] = "2d264499dcb05f56438dee12a1b4b71d76736ce7ba7aa6efbf15ebb113769cbb"
 
 PACKAGECONFIG ??= "${@bb.utils.filter('DISTRO_FEATURES', 'ipv6', d)}"
 PACKAGECONFIG[ipv6] = "--enable-ipv6,--disable-ipv6,"
+
+BBCLASSEXTEND = "native"
-- 
2.7.4


