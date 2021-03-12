Received: from mail1.bemta26.messagelabs.com (mail1.bemta26.messagelabs.com [85.158.142.114])
 by mx.groups.io with SMTP id smtpd.web09.1422.1615507898841928885
 for <openembedded-core@lists.openembedded.org>;
 Thu, 11 Mar 2021 16:11:39 -0800
Authentication-Results: mx.groups.io;
 dkim=missing; spf=pass (domain: fujitsu.com, ip: 85.158.142.114, mailfrom: wangmy@fujitsu.com)
Return-Path: <wangmy@fujitsu.com>
Received: from [100.113.5.248] (using TLSv1.2 with cipher DHE-RSA-AES256-GCM-SHA384 (256 bits))
	by server-3.bemta.az-b.eu-central-1.aws.symcld.net id F5/98-23163-7B1BA406; Fri, 12 Mar 2021 00:11:35 +0000
X-Brightmail-Tracker: H4sIAAAAAAAAA+NgFtrAIsWRWlGSWpSXmKPExsViZ8MxVXf7Rq8
  Eg95rfBZ3fr5jd2D0OLdxBWMAYxRrZl5SfkUCa0bngnlsBV9ZKw6s3M/UwLiStYuRi0NIYAaT
  xOJnz9ggnOOMEt/69jN1MXJysAloSvRu2cLYxcjBISKgJ3H1nyhImFlAXeLSuhYWEFtYwEri4
  dbD7CA2i4CqxNMNa8DivAIuEk8PfmQEsSUEFCSmPHzPDGJzCrhKbFt7EGy8EFDN74NnmSHqBS
  VOznzCAjFfQuLgixfMEL2KErMvN7NA2JUSezY/ZJ3AyD8LScssJC0LGJlWMVomFWWmZ5TkJmb
  m6BoaGOgaGhrrmusamRrpJVbpJumlluomp+aVFCUCZfUSy4v1iitzk3NS9PJSSzYxAgMypZD9
  zw7G668/6B1ilORgUhLllVrplSDEl5SfUpmRWJwRX1Sak1p8iFGGg0NJgnfKBqCcYFFqempFW
  mYOMDpg0hIcPEoivE5rgdK8xQWJucWZ6RCpU4yKUuK8R9YDJQRAEhmleXBtsIi8xCgrJczLyM
  DAIMRTkFqUm1mCKv+KUZyDUUmYNx9kO09mXgnc9FdAi5mAFnupgi0uSURISTUwXVy3a3XElsq
  dC/Y4Ou+xfsHrrvBs5yGnglihmN8LOh0srt6N+s48Y8WaL1LMDbtz/9e53i6s3fN4a65xwuZp
  tgvdXq9eIs3782u66Y+G3DD/p/GRV7543ng79c1DEZ0vn97ObXNbLrBZymTxsaDd7qpfHeb9M
  K6YPDPlq+Q2Nb0pNhbxc9x/zw5V63PS2+v69aW8sLr9g3NfOL/98E7lbxCeuY+h9k7LuhVTdj
  +6zZp56WHG7vbS3nnLz9z86a7imiEUwz594uWVj9uKOqPmvtbn2SPaL8ytw+qyZ+aml1rNs5e
  qfXacez6X8eX5efPiTj1uthFsf3Bw4cNkHs/HS/yq7+bvPW5Z++RClcOXOa+VWIozEg21mIuK
  EwGuCg4DQwMAAA==
X-Env-Sender: wangmy@fujitsu.com
X-Msg-Ref: server-23.tower-245.messagelabs.com!1615507894!2001350!1
X-Originating-IP: [62.60.8.149]
X-SYMC-ESS-Client-Auth: outbound-route-from=fail
X-StarScan-Received: 
X-StarScan-Version: 9.60.3; banners=-,-,-
X-VirusChecked: Checked
Received: (qmail 26731 invoked from network); 12 Mar 2021 00:11:35 -0000
Received: from unknown (HELO mailhost2.uk.fujitsu.com) (62.60.8.149)
  by server-23.tower-245.messagelabs.com with ECDHE-RSA-AES256-GCM-SHA384 encrypted SMTP; 12 Mar 2021 00:11:35 -0000
Received: from r01ukexcasm111.r01.fujitsu.local ([10.183.43.167])
	by mailhost2.uk.fujitsu.com (8.14.5/8.14.5) with ESMTP id 12C0BSwb020599
	(version=TLSv1/SSLv3 cipher=AES256-SHA bits=256 verify=FAIL)
	for <openembedded-core@lists.openembedded.org>; Fri, 12 Mar 2021 00:11:34 GMT
Received: from localhost.localdomain.localdomain (10.167.225.33) by
 R01UKEXCASM111.r01.fujitsu.local (10.183.43.167) with Microsoft SMTP Server
 (TLS) id 15.0.1497.2; Fri, 12 Mar 2021 00:11:31 +0000
From: "Wang Mingyu" <wangmy@cn.fujitsu.com>
To: <openembedded-core@lists.openembedded.org>
CC: Wang Mingyu <wangmy@cn.fujitsu.com>
Subject: [PATCH] libmc: use update-alternatives for sha1.h
Date: Fri, 12 Mar 2021 08:11:16 +0800
Message-ID: <1615507876-7478-2-git-send-email-wangmy@cn.fujitsu.com>
X-Mailer: git-send-email 1.8.3.1
In-Reply-To: <1615507876-7478-1-git-send-email-wangmy@cn.fujitsu.com>
References: <1615507876-7478-1-git-send-email-wangmy@cn.fujitsu.com>
MIME-Version: 1.0
X-Originating-IP: [10.167.225.33]
X-ClientProxiedBy: G08CNEXCHPEKD06.g08.fujitsu.local (10.167.33.205) To
 R01UKEXCASM111.r01.fujitsu.local (10.183.43.167)
Content-Type: text/plain

czmq also uses the doc 'sha1.h'.

czmq has a priority of 60.

Signed-off-by: Wang Mingyu <wangmy@cn.fujitsu.com>
---
 meta/recipes-support/libmd/libmd_1.0.3.bb | 6 ++++++
 1 file changed, 6 insertions(+)

diff --git a/meta/recipes-support/libmd/libmd_1.0.3.bb b/meta/recipes-support/libmd/libmd_1.0.3.bb
index 2e6762e490..19773633f7 100644
--- a/meta/recipes-support/libmd/libmd_1.0.3.bb
+++ b/meta/recipes-support/libmd/libmd_1.0.3.bb
@@ -14,3 +14,9 @@ SRC_URI[sha256sum] = "5a02097f95cc250a3f1001865e4dbba5f1d15554120f95693c0541923c
 inherit autotools
 
 BBCLASSEXTEND = "native nativesdk"
+
+inherit update-alternatives
+
+ALTERNATIVE_PRIORITY = "100"
+ALTERNATIVE_${PN}-doc = "sha1.h"
+ALTERNATIVE_LINK_NAME[sha1.h] = "${includedir}/sha1.h"
-- 
2.25.1

