Received: from koncepto.io (koncepto.io [195.154.119.111])
 by mx.groups.io with SMTP id smtpd.web10.51.1585349136781270403
 for <openembedded-core@lists.openembedded.org>;
 Fri, 27 Mar 2020 15:45:37 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@koncepto.io header.s=default header.b=nK5Q6gxw;
 spf=pass (domain: koncepto.io, ip: 195.154.119.111, mailfrom: pjtexier@koncepto.io)
Received: from menoah.home (lfbn-bor-1-1500-88.w193-250.abo.wanadoo.fr [193.250.66.88])
	by koncepto.io (Postfix) with ESMTPSA id 9FFE160044;
	Fri, 27 Mar 2020 23:45:34 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=koncepto.io;
	s=default; t=1585349134;
	bh=45Lg0HvZdv12iaiiovpDRiOmeZCmg2Or+2yvUVzjCtk=;
	h=From:To:Cc:Subject:Date:From;
	b=nK5Q6gxwh8c/AVptCCcF0437TbSoD/6/bB4+9Z5nx8po1oFn1tf8T9g+Fs1i+X3fP
	 htezEAZDpY46cOgtFVrXFtl/RlrpQ3zaH0i3yjGnZfBuXK3KVPiMC+tZlZWVKb/yoJ
	 iri7AeUowKEw7f4OnRQKbElkvLOlYlWbv+kCGVwXElz/Wb+46Izja1XoRnrZfzCK92
	 ZXn0NMnyURArSe14YzqKGaYVmYNAYNedQzhYKHtsDUwi0X7Gmro9qMpIzBew5tC7a8
	 xT2vJXg6EGTAAAdi+xDRnhj7KxUkFruAUWPimuZNhYi9dW0pOraQV6wS8p8sZJgQ83
	 ERi/R5ksRsvcQ==
From: "Pierre-Jean Texier" <pjtexier@koncepto.io>
To: openembedded-core@lists.openembedded.org
Cc: Pierre-Jean Texier <pjtexier@koncepto.io>
Subject: [meta-python][PATCH] python-engineio: upgrade 3.11.2 -> 3.12.1
Date: Fri, 27 Mar 2020 23:45:31 +0100
Message-Id: <1585349131-4922-1-git-send-email-pjtexier@koncepto.io>
X-Mailer: git-send-email 2.7.4

See full changelog https://github.com/miguelgrinberg/python-engineio/blob/master/CHANGES.md

Signed-off-by: Pierre-Jean Texier <pjtexier@koncepto.io>
---
 meta-python/recipes-devtools/python/python-engineio.inc               | 4 ++--
 .../python/{python3-engineio_3.11.2.bb => python3-engineio_3.12.1.bb} | 0
 2 files changed, 2 insertions(+), 2 deletions(-)
 rename meta-python/recipes-devtools/python/{python3-engineio_3.11.2.bb => python3-engineio_3.12.1.bb} (100%)

diff --git a/meta-python/recipes-devtools/python/python-engineio.inc b/meta-python/recipes-devtools/python/python-engineio.inc
index 9c067c9..965f420 100644
--- a/meta-python/recipes-devtools/python/python-engineio.inc
+++ b/meta-python/recipes-devtools/python/python-engineio.inc
@@ -9,5 +9,5 @@ inherit pypi
 
 PYPI_PACKAGE = "python-engineio"
 
-SRC_URI[md5sum] = "13345452be25c3b63d041f8f89e662d1"
-SRC_URI[sha256sum] = "47ae4a9b3b4f2e8a68929f37a518338838e119f24c9a9121af92c49f8bea55c3"
+SRC_URI[md5sum] = "e6ea8b3f2f32eeeb02014c46092f2adb"
+SRC_URI[sha256sum] = "2481732d93646998f7372ef0ecf003af7817b82720b881db173c3d50b4887916"
diff --git a/meta-python/recipes-devtools/python/python3-engineio_3.11.2.bb b/meta-python/recipes-devtools/python/python3-engineio_3.12.1.bb
similarity index 100%
rename from meta-python/recipes-devtools/python/python3-engineio_3.11.2.bb
rename to meta-python/recipes-devtools/python/python3-engineio_3.12.1.bb
-- 
2.7.4

