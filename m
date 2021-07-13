Received: from sender4-op-o14.zoho.com (sender4-op-o14.zoho.com [136.143.188.14])
 by mx.groups.io with SMTP id smtpd.web10.1527.1626162892022718988
 for <openembedded-core@lists.openembedded.org>;
 Tue, 13 Jul 2021 00:55:12 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="no key for verify" header.i=dwrobel@ertelnet.rybnik.pl header.s=ertelnet header.b=dh+PjuXv;
 spf=temperror, err=temporary DNS error (domain: ertelnet.rybnik.pl, ip: 136.143.188.14, mailfrom: dwrobel@ertelnet.rybnik.pl)
ARC-Seal: i=1; a=rsa-sha256; t=1626162889; cv=none; 
	d=zohomail.com; s=zohoarc; 
	b=h1P+/oAcyQlCBCXcxnwP30h3+SZyo5CHHgvij+o1NNf4zok0GgZRBu2D3GBzapjVXvT+hiuWEK97lcGIJKDZF1hFbyXRxn2PHLQN8vJpkCQzeJx1UaeTHXug7flhKwigbp+DYV+ow5FOZhQq3o31RiOTEduFfrUm+To4T+pcI0Y=
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=zohomail.com; s=zohoarc; 
	t=1626162889; h=Content-Transfer-Encoding:Cc:Date:From:MIME-Version:Message-ID:Subject:To; 
	bh=KNVz+TYNkYsdz0qsWRlXPE6xLbBcusUAxwp7eLyHQdQ=; 
	b=OOIuWH9TomqyzbsHZnmQOk8OHZufVi7bmJtU0ysSCuwpOrIkTlhl7Gqztz63VosHIEE8CmRMHwYoadxA2hzr0c3xLj26YBDisxdSIJPxBZNLGB5ERTC6cRoOoLJiPcjyr7L8d0SO4/erDPYhDI+OEQnx5ytZPC73/jdwrUIezwU=
ARC-Authentication-Results: i=1; mx.zohomail.com;
	dkim=pass  header.i=ertelnet.rybnik.pl;
	spf=pass  smtp.mailfrom=dwrobel@ertelnet.rybnik.pl;
	dmarc=pass header.from=<dwrobel@ertelnet.rybnik.pl>
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; t=1626162889;
	s=ertelnet; d=ertelnet.rybnik.pl; i=dwrobel@ertelnet.rybnik.pl;
	h=From:To:Cc:Subject:Date:Message-Id:MIME-Version:Content-Transfer-Encoding;
	bh=KNVz+TYNkYsdz0qsWRlXPE6xLbBcusUAxwp7eLyHQdQ=;
	b=dh+PjuXvdRsCDGJXl8tHR1HpGC1XQ1+4Ik5nZ6D2kj/EPY3h192K5qwRWIoyWqPL
	KdfEw9nqXNVsucgCryev31je3gsZZkOAcLl2RwBtPb2quqzVJXbAx5j+DHrb60Y0/kP
	jG7ZRmXeGQfOnRuJR4dXogZ3LEiHJH0xs2XeC5AE=
Received: from localhost.localdomain.pl (91.230.58.69 [91.230.58.69]) by mx.zohomail.com
	with SMTPS id 1626162886197862.7298779827457; Tue, 13 Jul 2021 00:54:46 -0700 (PDT)
From: "Damian Wrobel" <dwrobel@ertelnet.rybnik.pl>
To: openembedded-core@lists.openembedded.org
Cc: Adam Romanek <romanek.adam@gmail.com>
Subject: [PATCH] own-mirrors: Add support for s3:// scheme in SOURCE_MIRROR_URL
Date: Tue, 13 Jul 2021 09:54:33 +0200
Message-Id: <20210713075433.750433-1-dwrobel@ertelnet.rybnik.pl>
X-Mailer: git-send-email 2.31.1
MIME-Version: 1.0
X-ZohoMailClient: External
Content-Transfer-Encoding: 8bit

From: Adam Romanek <romanek.adam@gmail.com>

Signed-off-by: Adam Romanek <romanek.adam@gmail.com>
Signed-off-by: Damian Wrobel <dwrobel@ertelnet.rybnik.pl>
---
 meta/classes/own-mirrors.bbclass | 1 +
 1 file changed, 1 insertion(+)

diff --git a/meta/classes/own-mirrors.bbclass b/meta/classes/own-mirrors.bbclass
index a777835138..d58a61fe0a 100644
--- a/meta/classes/own-mirrors.bbclass
+++ b/meta/classes/own-mirrors.bbclass
@@ -10,4 +10,5 @@ osc://.*/.*     ${SOURCE_MIRROR_URL} \n \
 https?$://.*/.* ${SOURCE_MIRROR_URL} \n \
 ftp://.*/.*     ${SOURCE_MIRROR_URL} \n \
 npm://.*/?.*    ${SOURCE_MIRROR_URL} \n \
+s3://.*/.*      ${SOURCE_MIRROR_URL} \n \
 "
-- 
2.31.1

