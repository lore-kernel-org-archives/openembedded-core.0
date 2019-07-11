Return-Path: <ross.burton@intel.com>
Received: from mail-wr1-f68.google.com (mail-wr1-f68.google.com
	[209.85.221.68])
	by mail.openembedded.org (Postfix) with ESMTP id 4F6F87ECBC
	for <openembedded-core@lists.openembedded.org>;
	Thu, 11 Jul 2019 23:54:25 +0000 (UTC)
Received: by mail-wr1-f68.google.com with SMTP id n9so8093311wru.0
	for <openembedded-core@lists.openembedded.org>;
	Thu, 11 Jul 2019 16:54:26 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=intel-com.20150623.gappssmtp.com; s=20150623;
	h=from:to:subject:date:message-id:mime-version
	:content-transfer-encoding;
	bh=fNOaq3HP9QKPcC/oHc1fcOjvtYbIBs4LjuPnGx8PqJ4=;
	b=2Ea5DmtHU41i9WsiuUb7HkRk4/w1BKQk3UNDDWdV7VbV/6VbPvCl7nMmyZXq18xkVU
	l6djuKBH0nIqxbVTQlPzYa7E+XuIaRSv3U4x/czoOodrLlgp82P1EXLJei/iyVAx6K1r
	8DsdVTAo8o9F5al+e1Vi3urtOkoNeLQIQ3rp2u2vLJXIxc9grvDHCxQdCstNXH39j09W
	TyawOJNNTrr6KnLvwXdrtf72hM8dSYYlbfZ7HHS9whW3H4oC7w8CXJKaxw3z2zwqcWXr
	doKLv4KZo20BK76UMpICgeiNVhjOszfUsWMqaoGsMG2j9N5qAml9RzMPyEkERp9EQkaG
	383Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:subject:date:message-id:mime-version
	:content-transfer-encoding;
	bh=fNOaq3HP9QKPcC/oHc1fcOjvtYbIBs4LjuPnGx8PqJ4=;
	b=VPjk0Uf4GN88K3qV4HoTGAjS0psQBWqyJ+asD0V24oMj7eOmlZ7TdZdaaGCAlYhXfb
	qfiDXQZ/+efS+5wiS1y4sX5WY1ygO0MTjt17jlXuERdW7ASmQeqI1ArXCnSyjhJstDmX
	XneetSx9g0h2Vq83J7LpMsLJUF4bYTK/bQSq05sAX09zNg9ykXxfu0VnLy5WTpalhNFJ
	wU98oqyaYQMnt854PCVLs1hjNonnJyRcV6Rey0GkzGQXKEPravMKqyQDzuYsXFpCoYNF
	MM2Hq1BDQS31rswXTM3n+xr4RrFE0qqrLa5LmJep0wTLECckEab9NMJKYCwZsBuTq8FT
	LadQ==
X-Gm-Message-State: APjAAAW2OMGB5KlOMkVLeu7ydjm3i594mAgMDhgOiLu+2XU0AyzPWlVR
	q4Fdg+tcHJ8j48yEflWDoYHWNLjyZ/U=
X-Google-Smtp-Source: APXvYqxlMer/soYsb1n1TbUM5S4DCYuciDQ1Ekj2X/3HtkZJ9zH3H3QXIkh/VH3d9x9luH80YgDSdQ==
X-Received: by 2002:a5d:4e08:: with SMTP id p8mr7139118wrt.20.1562889265809;
	Thu, 11 Jul 2019 16:54:25 -0700 (PDT)
Received: from flashheart.burtonini.com (35.106.2.81.in-addr.arpa.
	[81.2.106.35])
	by smtp.gmail.com with ESMTPSA id a6sm5209643wmj.15.2019.07.11.16.54.24
	for <openembedded-core@lists.openembedded.org>
	(version=TLS1_3 cipher=AEAD-AES256-GCM-SHA384 bits=256/256);
	Thu, 11 Jul 2019 16:54:25 -0700 (PDT)
From: Ross Burton <ross.burton@intel.com>
To: openembedded-core@lists.openembedded.org
Date: Fri, 12 Jul 2019 00:54:23 +0100
Message-Id: <20190711235423.23013-1-ross.burton@intel.com>
X-Mailer: git-send-email 2.20.1
MIME-Version: 1.0
Subject: [PATCH] ninja: use Python 3
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
X-List-Received-Date: Thu, 11 Jul 2019 23:54:25 -0000
Content-Transfer-Encoding: 8bit

As part of the mission to remove the use of Python 2, explicitly bootstrap Ninja
with Python 3.

Signed-off-by: Ross Burton <ross.burton@intel.com>
---
 meta/recipes-devtools/ninja/ninja_1.9.0.bb | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/meta/recipes-devtools/ninja/ninja_1.9.0.bb b/meta/recipes-devtools/ninja/ninja_1.9.0.bb
index 1b063289614..f1236e8ac82 100644
--- a/meta/recipes-devtools/ninja/ninja_1.9.0.bb
+++ b/meta/recipes-devtools/ninja/ninja_1.9.0.bb
@@ -17,11 +17,11 @@ S = "${WORKDIR}/git"
 do_configure[noexec] = "1"
 
 do_compile_class-native() {
-	./configure.py --bootstrap
+	python3 ./configure.py --bootstrap
 }
 
 do_compile() {
-	./configure.py
+	python3 ./configure.py
 	ninja
 }
 
-- 
2.20.1


