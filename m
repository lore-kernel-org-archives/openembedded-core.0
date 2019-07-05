Return-Path: <lemagoup@gmail.com>
Received: from mail-wm1-f44.google.com (mail-wm1-f44.google.com
	[209.85.128.44])
	by mail.openembedded.org (Postfix) with ESMTP id C93E07E6DA
	for <openembedded-core@lists.openembedded.org>;
	Fri,  5 Jul 2019 09:40:58 +0000 (UTC)
Received: by mail-wm1-f44.google.com with SMTP id p74so5147423wme.4
	for <openembedded-core@lists.openembedded.org>;
	Fri, 05 Jul 2019 02:41:00 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=from:to:cc:subject:date:message-id;
	bh=AgDQoKyC3u4acJDy0xv8ILpnJHG+BXADPUIV7dexVhs=;
	b=HKL/bFGmpMHCSxDIK2fBc6KDSlroq4R2JxrFS3NNzjr7cH2YOJbwzyPvYGtMmVVDwT
	lyjrSe7YvcTk9a4ltea7NgNTB5UAEN5Oi5/odSJ575PvN7nN7UOt2dNm5j8rtiHeVTVW
	j5pViRRTwxncLpDtWRRoZWkf6Frtt6GP+PSCyLtLC5/Ma9VBC5LZbjY8i4w/WUgzyoYz
	oNknUM/BM7fTQH95Wff/vGMHlfq4kEabsPiJmCakJKuUqfITDi9t6/82obZFgzqcI1pe
	M3Nm9A0Vok8MVM0AZHtxfXHRC7Qwjn7+qixDes9v32EFIDLuaH/aNwi0mnRov4mCN4f6
	SAHg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:cc:subject:date:message-id;
	bh=AgDQoKyC3u4acJDy0xv8ILpnJHG+BXADPUIV7dexVhs=;
	b=rFO6RJeJxtkHayBepnDmJO2t6rgckrBVLYoNf9L5tUWjfmDbm8rNLFnYsJlczL3Bzy
	qRc3gnyqLU5mG7m+OTnRTecZ77pBLyoAyvLbZfIoIXw6Dn88wm6n/uLpqJBES53oGBMz
	HD5C1w3y2VvHALTrhvQcVqvCM/vAHWkvHwRmMkgckwfWS9BvsK745bLQ4JrQnwalFqZq
	kjpKnV1vw6PXC8N5E9IwBCimhuZVAmieaXz+55pZfuESL0anF1WzTXyHjtilirRW94J8
	nVr3iepn5ftejgHqmvSZs7oaw3mDB/baC3VQcS40Iuzy2UP4tkWzM2Ryt+vQ+t86R+Yi
	b60A==
X-Gm-Message-State: APjAAAXU2L35lbzBxgwnQk5R5IvMWPULhUpToashNjsKWgElGDUnIRZm
	GWTusunQcWbw1a+XLEFgUtv4NqJK
X-Google-Smtp-Source: APXvYqxD6RkGVAv9UrQiEVUfm/F+7uoal2kwxCV5aXLDdo0/Ov5Ezm7qV0YkWEtM3Gp7Rt2uHT2zBQ==
X-Received: by 2002:a1c:a7c6:: with SMTP id q189mr2711299wme.146.1562319659214;
	Fri, 05 Jul 2019 02:40:59 -0700 (PDT)
Received: from localhost.localdomain
	(softbank-robotics-gw1.ter4.eqx2.par.cust.as8218.eu.
	[158.255.112.194])
	by smtp.gmail.com with ESMTPSA id y16sm738249wrw.33.2019.07.05.02.40.58
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Fri, 05 Jul 2019 02:40:58 -0700 (PDT)
From: Pierre Le Magourou <lemagoup@gmail.com>
To: openembedded-core@lists.openembedded.org
Date: Fri,  5 Jul 2019 11:40:36 +0200
Message-Id: <20190705094038.29377-1-lemagoup@gmail.com>
X-Mailer: git-send-email 2.11.0
Subject: [PATCH v2 1/3] cve-check: Depends on cve-update-db-native
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
X-List-Received-Date: Fri, 05 Jul 2019 09:40:59 -0000

From: Pierre Le Magourou <pierre.lemagourou@softbankrobotics.com>

do_populate_cve_db is a native task.

Signed-off-by: Pierre Le Magourou <pierre.lemagourou@softbankrobotics.com>
---
 meta/classes/cve-check.bbclass                                       | 2 +-
 meta/recipes-core/meta/{cve-update-db.bb => cve-update-db-native.bb} | 0
 2 files changed, 1 insertion(+), 1 deletion(-)
 rename meta/recipes-core/meta/{cve-update-db.bb => cve-update-db-native.bb} (100%)

diff --git a/meta/classes/cve-check.bbclass b/meta/classes/cve-check.bbclass
index 81071e3f19..6ffa0c4688 100644
--- a/meta/classes/cve-check.bbclass
+++ b/meta/classes/cve-check.bbclass
@@ -63,7 +63,7 @@ python do_cve_check () {
 }
 
 addtask cve_check after do_unpack before do_build
-do_cve_check[depends] = "cve-update-db:do_populate_cve_db"
+do_cve_check[depends] = "cve-update-db-native:do_populate_cve_db"
 do_cve_check[nostamp] = "1"
 
 python cve_check_cleanup () {
diff --git a/meta/recipes-core/meta/cve-update-db.bb b/meta/recipes-core/meta/cve-update-db-native.bb
similarity index 100%
rename from meta/recipes-core/meta/cve-update-db.bb
rename to meta/recipes-core/meta/cve-update-db-native.bb
-- 
2.11.0


