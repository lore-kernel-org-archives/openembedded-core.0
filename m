Return-Path: <raj.khem@gmail.com>
Received: from mail-pf0-f195.google.com (mail-pf0-f195.google.com
	[209.85.192.195])
	by mail.openembedded.org (Postfix) with ESMTP id 39B326E660
	for <openembedded-core@lists.openembedded.org>;
	Tue, 25 Jul 2017 08:35:39 +0000 (UTC)
Received: by mail-pf0-f195.google.com with SMTP id g69so3449260pfe.1
	for <openembedded-core@lists.openembedded.org>;
	Tue, 25 Jul 2017 01:35:40 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=from:to:cc:subject:date:message-id;
	bh=7H1anmI4oq80rsGLDP6Mamr7lfd/PQVqurTLeB2am7o=;
	b=NvRqGDwRUo3zHGiKm3ppkVUwoet4mymFVLXT8UcQmvGuDTjrh+g79BgBZiMLk0B8mD
	00+cifTnlsl/NUikqO8i3u9OurnJgtTRAOefi3M6Z0bwgGSXL/X0QoQwRvp9WW7aOtrq
	hss6iv51j49iR5RoaFaEp1Fy0J64T0yone+Z/RRPUwcC6YCdMJOzTmS6qsNM5BzTxPRh
	Qb2yWYJq0APLcCwqmJJmoTmIeyhfrckutk+YKozqF5EByoBLRMr7Ye8HAjVeUcJSbyPj
	1HzKtg7PywtZfy/P6CGIbcLvNU7+G493fL3Rhiu+ffZy7jfPv93pQL1LkBCJlAtYNNeI
	tyTQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:cc:subject:date:message-id;
	bh=7H1anmI4oq80rsGLDP6Mamr7lfd/PQVqurTLeB2am7o=;
	b=Y/kQTuzI4oJQ/SzHJlqsr+c56lcwFuSnFkl69Pwz+3sxFCzfGa8GfSsOnBb0QZ/Uo5
	WirmC9i0WVqUMQss6t75V8tJ0xnlc3pAvpkNtqOLyx2jXKb018mrQHmdNEAfduxhqlgp
	ppyIUo2sCQDsKUY+4FNCYo6HeUsncHE07NDpdka7EfCD9x5C5c9qbB4E3KNYglE4JrE8
	o6l+pF8Qp2RWojwcwBgiUUaeavJItg1QDi7huhyAnEt5T0pfPxg/aEDgooD20u1JgVzb
	ZLt1hYoKKqd7QJUdHS65gZZKT+VvKVEB64od945MShELMbbQnE6CqdxDKDQpzpVBxAnU
	CfCQ==
X-Gm-Message-State: AIVw113Bu/ZPQnWKiFAQ8e7FK3EZlMnYy+sQp+zdwjrjrWKQSZxjy4cX
	8+hMMk1YC0b7npIY
X-Received: by 10.101.87.205 with SMTP id q13mr19191207pgr.359.1500971740444; 
	Tue, 25 Jul 2017 01:35:40 -0700 (PDT)
Received: from localhost.localdomain ([2601:646:8882:b8c::9b53])
	by smtp.gmail.com with ESMTPSA id
	u5sm15245362pgc.92.2017.07.25.01.35.39
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Tue, 25 Jul 2017 01:35:39 -0700 (PDT)
From: Khem Raj <raj.khem@gmail.com>
To: openembedded-core@lists.openembedded.org
Date: Tue, 25 Jul 2017 01:35:29 -0700
Message-Id: <20170725083530.15432-1-raj.khem@gmail.com>
X-Mailer: git-send-email 2.13.3
Subject: [PATCH 1/2] python3-pycairo: Pass -fPIC via CFLAGS
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
X-List-Received-Date: Tue, 25 Jul 2017 08:35:39 -0000

Fixes

| /mnt/a/oe/build/tmp/work/corei7-64-bec-linux/python3-pycairo/1.10.0-r2/recipe-sysroot-native/usr/bin/x86_64-bec-linu
x/x86_64-bec-linux-ld: src/cairomodule.c.1.o: relocation R_X86_64_PC32 against symbol `CairoError' can not be used whe
n making a shared object; recompile with -fPIC

Signed-off-by: Khem Raj <raj.khem@gmail.com>
---
 meta/recipes-devtools/python/python3-pycairo_1.10.0.bb | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/meta/recipes-devtools/python/python3-pycairo_1.10.0.bb b/meta/recipes-devtools/python/python3-pycairo_1.10.0.bb
index f9031b3bca..9258ba11c7 100644
--- a/meta/recipes-devtools/python/python3-pycairo_1.10.0.bb
+++ b/meta/recipes-devtools/python/python3-pycairo_1.10.0.bb
@@ -19,6 +19,8 @@ S = "${WORKDIR}/pycairo-${PV}"
 
 inherit distutils3 pkgconfig
 
+CFLAGS += "-fPIC"
+
 BBCLASSEXTEND = "native"
 
 do_configure() {
-- 
2.13.3


