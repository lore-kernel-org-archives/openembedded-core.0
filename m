Return-Path: <akuster808@gmail.com>
Received: from mail-pl0-f52.google.com (mail-pl0-f52.google.com
	[209.85.160.52])
	by mail.openembedded.org (Postfix) with ESMTP id AC3177461D
	for <openembedded-core@lists.openembedded.org>;
	Wed,  4 Apr 2018 01:49:23 +0000 (UTC)
Received: by mail-pl0-f52.google.com with SMTP id 59-v6so9069862plc.13
	for <openembedded-core@lists.openembedded.org>;
	Tue, 03 Apr 2018 18:49:24 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=from:to:subject:date:message-id:in-reply-to:references;
	bh=/6RihELX9lSLIUX2frXA++rM4Cp6C+Wm5t8LOu3zDc0=;
	b=nb3jYZMDf9B/ZWIi6j3j0CxZuXXbyUoXMHPKpt22o881cwVvk59c91whuWaTs1T+O7
	BDX6K2i4neg+3pQN9lIw8rpxRMT1fe0xvDmAnPI40PaK6LD3r9Xkl9xHnZylwQgzDYin
	+EiHQegM0aXApLmlgtGidPIj2GN9Gjc2s6DKvUnbqULymk+fTrV4ve/f/A353jXgogn3
	8s2UtdW6ukfjsvA7Bfrs+2RMZiLwiogEWyQx9ATX03Giqe4r9GqCVDsni6G5X7hlHg8W
	2XXsNYXbbYevX7eZtbvLPqWW9uGEYQNMlfoWbzM4q7soFUwM/2iMIalVUvBXlr+YhtvV
	ILUQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
	:references;
	bh=/6RihELX9lSLIUX2frXA++rM4Cp6C+Wm5t8LOu3zDc0=;
	b=M1YSzi/uFjZ2oYalRs59XH44+PCfIQl0mTgTYcM9Mctv5QwBRRMML92jdidIs+g93x
	KszXm53M7aFQwZPoliGfKqQ6nDHjstQ6LmvETK7ugBC7ZwDV4zKHF65nB1dmFIXpfK0E
	I0bLZnuBufioq38hpztzHUWZgWb8E97DQGA9jQEUE11BosqpyD/fQKyxygyTCtthluSb
	NooouoOaNYQfmWcOQZGh4I28GoFUVABFlAybErrbOmrridN6qw6cUmnB0KkAwyVB6ZfL
	+7VHTDSavG91v9x5ek2bI/g7/szxqNS6IsAPp+d8h5mzteCnKAB2rz2vFzhkzPa3fTkz
	HVgw==
X-Gm-Message-State: AElRT7FTTr9hm/CAqYgLNS8w0x93VAkQxLoJKKdDs7M/jD6gIGAWx4Ws
	A4ahft4EKwW9p3t2cS6btzUJ/A==
X-Google-Smtp-Source: AIpwx4/BvKRsXaeUpw582EXl3rmM2nayYA+JqzYwrANghEV4IPomeJp60dZROF8oFbKgI4lXOJ7c5w==
X-Received: by 2002:a17:902:aa86:: with SMTP id
	d6-v6mr16831587plr.375.1522806564456; 
	Tue, 03 Apr 2018 18:49:24 -0700 (PDT)
Received: from akuster-ThinkPad-T460s.mvista.com
	([2601:202:4000:1184:a4f3:7c10:9123:63ea])
	by smtp.gmail.com with ESMTPSA id
	d8sm7485877pfh.177.2018.04.03.18.49.23
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
	Tue, 03 Apr 2018 18:49:23 -0700 (PDT)
From: Armin Kuster <akuster808@gmail.com>
To: openembedded-core@lists.openembedded.org,
	akuster808@gmail.com
Date: Tue,  3 Apr 2018 18:49:00 -0700
Message-Id: <127a63118aacede3815e5bdcebbd4d3784bd07a0.1522806183.git.akuster808@gmail.com>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <cover.1522806183.git.akuster808@gmail.com>
References: <cover.1522806183.git.akuster808@gmail.com>
Subject: [PATCH 01/21] libpcre2: update to 10.31
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
X-List-Received-Date: Wed, 04 Apr 2018 01:49:23 -0000

From: Armin Kuster <akuster@mvista.com>

LICENSE changed do to updating copyrige date

Signed-off-by: Armin Kuster <akuster@mvista.com>
---
 .../libpcre/{libpcre2_10.30.bb => libpcre2_10.31.bb}                | 6 +++---
 1 file changed, 3 insertions(+), 3 deletions(-)
 rename meta/recipes-support/libpcre/{libpcre2_10.30.bb => libpcre2_10.31.bb} (90%)

diff --git a/meta/recipes-support/libpcre/libpcre2_10.30.bb b/meta/recipes-support/libpcre/libpcre2_10.31.bb
similarity index 90%
rename from meta/recipes-support/libpcre/libpcre2_10.30.bb
rename to meta/recipes-support/libpcre/libpcre2_10.31.bb
index 46c2d63..a10c312 100644
--- a/meta/recipes-support/libpcre/libpcre2_10.30.bb
+++ b/meta/recipes-support/libpcre/libpcre2_10.31.bb
@@ -8,14 +8,14 @@ SUMMARY = "Perl Compatible Regular Expressions version 2"
 HOMEPAGE = "http://www.pcre.org"
 SECTION = "devel"
 LICENSE = "BSD"
-LIC_FILES_CHKSUM = "file://LICENCE;md5=12d55e15a0c6da5c645ba40382bd3293"
+LIC_FILES_CHKSUM = "file://LICENCE;md5=f5e4bde9fd0493d0967b4dba9899590f"
 
 SRC_URI = "https://ftp.pcre.org/pub/pcre/pcre2-${PV}.tar.bz2 \
            file://pcre-cross.patch \
 "
 
-SRC_URI[md5sum] = "d3adf4b130eed854a530390f00020a65"
-SRC_URI[sha256sum] = "90bd41c605d30e3745771eb81928d779f158081a51b2f314bbcc1f73de5773db"
+SRC_URI[md5sum] = "e0b91c891a3c49050f7fd15de33d0ba4"
+SRC_URI[sha256sum] = "e07d538704aa65e477b6a392b32ff9fc5edf75ab9a40ddfc876186c4ff4d68ac"
 
 CVE_PRODUCT = "pcre2"
 
-- 
2.7.4


