Return-Path: <akuster808@gmail.com>
Received: from mail-pg0-f65.google.com (mail-pg0-f65.google.com [74.125.83.65])
	by mail.openembedded.org (Postfix) with ESMTP id 649AF77BC6
	for <openembedded-core@lists.openembedded.org>;
	Fri, 24 Mar 2017 16:01:17 +0000 (UTC)
Received: by mail-pg0-f65.google.com with SMTP id w20so1266702pgc.1
	for <openembedded-core@lists.openembedded.org>;
	Fri, 24 Mar 2017 09:01:18 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=from:to:subject:date:message-id:in-reply-to:references;
	bh=Q1rnehOyQY4ud/D5IFS1xHnOofqwjRBleNCFFB0Wahw=;
	b=Q+alCMIoMcuVVtVRGbudIrDAMnlfHmM35IjhmNY/Ps11Zidk+0sUkeAw/akHJYrTHS
	Y4gVBIb4b+8s9WN1C4/VbjuVFsdVkKjvNx8Kesoh133PaVy8XH9zzrN4Z48GHfHEmk5E
	6/20LK15D/KNx5AL6zDX3p8/mINla8f5Bjr0i1Fok2D/Ce2aUipV0RUHspy/cQN21qkP
	AAbQlXLNKZO1oT/NHT5AbeTQCWTSvw7JjAxb66hNJ0ORSxT7nq8AfPN8QpRFcbkLzpWW
	LNa9wX0P1wcrjAU3aGK7WxcxPRUVRA7n83gnczkEuhLcmxvnCjQefZ4A5I1SnqDqSTVN
	LzLQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
	:references;
	bh=Q1rnehOyQY4ud/D5IFS1xHnOofqwjRBleNCFFB0Wahw=;
	b=uCPaGNDINBjTvJ8lmeH304MzKPdYM1wyZoPLlRzFsTt6EI3q55LgDPygtbJAJSzZmJ
	rfSDYlQjblxdyfA0leRRFRZbiHxltCC68NqogCpjEivT5MLB0dfT3DpQOtBRpAa8yDK2
	jK1KYYSOT5enCg3KWW2urDPnmXKVZ1Z5rPHkLuY2EJih9giKEXSSQSrHyu2CLo32tDDl
	G8Z0JQFQOqboENEh+eorxNjSIl14fgObvYs9lMKDpWuuP9HZj/mU+lRkDFlfcZ/o+SnD
	B8gG2cUpJ7W9UQC2gLoB2KFUFooYslJO1pUi1RCYMrKheHOwsZ6ZiuSp/RUf69Wzoex7
	O+LQ==
X-Gm-Message-State: AFeK/H3oYbq6VwX5PKeYxe2cxn+z+/lqDezMWTb+10pFabbE/lHjdJUl0eqr+euiMJT4WQ==
X-Received: by 10.98.220.200 with SMTP id c69mr10293711pfl.60.1490371278550;
	Fri, 24 Mar 2017 09:01:18 -0700 (PDT)
Received: from akuster-ThinkPad-X240.mvista.com
	([2601:202:4001:9ea0:e3df:bf0a:9f90:498e])
	by smtp.gmail.com with ESMTPSA id
	h25sm5568800pfk.119.2017.03.24.09.01.17
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
	Fri, 24 Mar 2017 09:01:18 -0700 (PDT)
From: Armin Kuster <akuster808@gmail.com>
To: akuster@mvista.com,
	openembedded-core@lists.openembedded.org
Date: Fri, 24 Mar 2017 09:01:14 -0700
Message-Id: <1490371274-20416-2-git-send-email-akuster808@gmail.com>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <1490371274-20416-1-git-send-email-akuster808@gmail.com>
References: <1490371274-20416-1-git-send-email-akuster808@gmail.com>
Subject: [PATCH 2/2] tzdata: update to 2017b
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
X-List-Received-Date: Fri, 24 Mar 2017 16:01:19 -0000

From: Armin Kuster <akuster@mvista.com>

Signed-off-by: Armin Kuster <akuster@mvista.com>
---
 meta/recipes-extended/tzdata/{tzdata_2017a.bb => tzdata_2017b.bb} | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)
 rename meta/recipes-extended/tzdata/{tzdata_2017a.bb => tzdata_2017b.bb} (98%)

diff --git a/meta/recipes-extended/tzdata/tzdata_2017a.bb b/meta/recipes-extended/tzdata/tzdata_2017b.bb
similarity index 98%
rename from meta/recipes-extended/tzdata/tzdata_2017a.bb
rename to meta/recipes-extended/tzdata/tzdata_2017b.bb
index 1a37c27..2e4277f 100644
--- a/meta/recipes-extended/tzdata/tzdata_2017a.bb
+++ b/meta/recipes-extended/tzdata/tzdata_2017b.bb
@@ -9,8 +9,8 @@ DEPENDS = "tzcode-native"
 SRC_URI = "http://www.iana.org/time-zones/repository/releases/tzdata${PV}.tar.gz;name=tzdata"
 UPSTREAM_CHECK_URI = "http://www.iana.org/time-zones"
 
-SRC_URI[tzdata.md5sum] = "cb8274cd175f8a4d9d1b89895df876dc"
-SRC_URI[tzdata.sha256sum] = "df3a5c4d0a2cf0cde0b3f35796ccf6c9acfd598b8e70f8dece5404cd7626bbd6"
+SRC_URI[tzdata.md5sum] = "50dc0dc50c68644c1f70804f2e7a1625"
+SRC_URI[tzdata.sha256sum] = "f8242a522ea3496b0ce4ff4f2e75a049178da21001a08b8e666d8cbe07d18086"
 
 inherit allarch
 
-- 
2.7.4


