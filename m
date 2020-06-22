Received: from thoth.sbs.de (thoth.sbs.de [192.35.17.2])
 by mx.groups.io with SMTP id smtpd.web11.2169.1592847204132662340
 for <openembedded-core@lists.openembedded.org>;
 Mon, 22 Jun 2020 10:33:25 -0700
Authentication-Results: mx.groups.io;
 dkim=missing; spf=pass (domain: siemens.com, ip: 192.35.17.2, mailfrom: andrej.valek@siemens.com)
Received: from mail1.siemens.de (mail1.siemens.de [139.23.33.14])
	by thoth.sbs.de (8.15.2/8.15.2) with ESMTPS id 05MHXLx0026714
	(version=TLSv1.2 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK)
	for <openembedded-core@lists.openembedded.org>; Mon, 22 Jun 2020 19:33:22 +0200
Received: from dev.vm6.ccp.siemens.com ([167.87.72.36])
	by mail1.siemens.de (8.15.2/8.15.2) with ESMTP id 05MHXLJZ027140;
	Mon, 22 Jun 2020 19:33:21 +0200
Received: from mail2.siemens.de (localhost [127.0.0.1])
	by dev.vm6.ccp.siemens.com (Postfix) with ESMTP id 0A95698021E;
	Mon, 22 Jun 2020 19:33:21 +0200 (CEST)
From: "Andrej Valek" <andrej.valek@siemens.com>
To: openembedded-core@lists.openembedded.org
Cc: Andrej Valek <andrej.valek@siemens.com>,
        Peter Marko <peter.marko@siemens.com>
Subject: [OE-core][PATCH 0/1] oeqa/runtime/cases/ptest: Make output content path absolute
Date: Mon, 22 Jun 2020 19:33:06 +0200
Message-Id: <20200622173307.29538-1-andrej.valek@siemens.com>
X-Mailer: git-send-email 2.11.0

Ptests could be executed on any path. So output content should be placed
in workdir and not into current directory. Different path outside of
the builddir should be specified by setting TEST_LOG_DIR.

Isn't it better to use "os.chidir(self.td.get('TOPDIR'))" instead?


 meta/lib/oeqa/runtime/cases/ptest.py | 4 ++++
 1 file changed, 4 insertions(+)

-- 
2.11.0

