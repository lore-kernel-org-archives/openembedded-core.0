Received: from rcdn-iport-8.cisco.com (rcdn-iport-8.cisco.com [173.37.86.79])
 by mx.groups.io with SMTP id smtpd.web09.851.1616685987367631228
 for <openembedded-core@lists.openembedded.org>;
 Thu, 25 Mar 2021 08:26:27 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@cisco.com header.s=iport header.b=Oj5OFOui;
 spf=pass (domain: cisco.com, ip: 173.37.86.79, mailfrom: dzagorui@cisco.com)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=cisco.com; i=@cisco.com; l=622; q=dns/txt; s=iport;
  t=1616685987; x=1617895587;
  h=from:to:subject:date:message-id:mime-version:
   content-transfer-encoding;
  bh=94sOkDRUp/JnyLNjWhn30ciGTGi8DckfCXgQr+RKW9M=;
  b=Oj5OFOuidDgdaDU3kWdW9AoNlvG8K/CcKqpe6Vp23dqVITuMq7Zis8sQ
   Im9eeWWt5V1lKg2WHkK8uhSKab3ikLZYcfvfRcIiD+3wzJifF5Rjn5C1v
   qX0ODXSChCL5j5eVmhsZqq1pUl+gDl8g/pvfxc8/FC0JVoI02xgJxylTR
   4=;
IronPort-HdrOrdr: =?us-ascii?q?A9a23=3A7wjre627D95oA/s/zTqgJAqjBCokLtp033?=
 =?us-ascii?q?Aq2lEZdDV+dMuEm8ey2MkB3RjvhzoLHF0mk9aMOK6PKEmsl6JdzIENMd6ZMj?=
 =?us-ascii?q?XOl3CvKOhZgLfK5x3FN2nA+vVG1aFmGpIOa+HYKVRhl8717E2ZHr8boeWvy6?=
 =?us-ascii?q?yjiefAw3oFd2gDAMtdxj1kAQWWGFAefmZ7LKc+faDx2uN34x6peXEada2AZk?=
 =?us-ascii?q?Utbqzku8DBko7gbFogARMqgTP+6Q+A2frdDwWS2AsYXnd05YoatULBkwD/+8?=
 =?us-ascii?q?yYwpSG9iM=3D?=
X-IronPort-Anti-Spam-Filtered: true
X-IronPort-Anti-Spam-Result: =?us-ascii?q?A0BVAwDlqlxg/5BdJa1aglmCK3ZWATk?=
 =?us-ascii?q?xsG+BfAsBAQENAQEgFAQBAYZOAiU0CQ4CAwEBCwEBBQEBAQIBBgRxhWENhn0?=
 =?us-ascii?q?BdF9EgnABgweqWYIphViDQ4FEgTmIXYRmJhyBSUKEbIQHgQaFKQSCR4EOToF?=
 =?us-ascii?q?anwCcH4MQiVmSeQ8igzaBTp9KtBCDfwIEBgUCFoFUOoFZMxoIGxWDJAlHGQ2?=
 =?us-ascii?q?QaYEMixIhAy8CNgIGCgEBAwmFJYJFAQE?=
X-IronPort-AV: E=Sophos;i="5.81,277,1610409600"; 
   d="scan'208";a="876472864"
Received: from rcdn-core-8.cisco.com ([173.37.93.144])
  by rcdn-iport-8.cisco.com with ESMTP/TLS/DHE-RSA-SEED-SHA; 25 Mar 2021 15:26:26 +0000
Received: from sjc-ads-9103.cisco.com (sjc-ads-9103.cisco.com [10.30.208.113])
	by rcdn-core-8.cisco.com (8.15.2/8.15.2) with ESMTPS id 12PFQPhD005537
	(version=TLSv1.2 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=NO)
	for <openembedded-core@lists.openembedded.org>; Thu, 25 Mar 2021 15:26:26 GMT
Received: by sjc-ads-9103.cisco.com (Postfix, from userid 487941)
	id B5EE2CC1251; Thu, 25 Mar 2021 08:26:25 -0700 (PDT)
From: "Denys Zagorui -X (dzagorui - GLOBALLOGIC INC@Cisco)" <dzagorui@cisco.com>
To: openembedded-core@lists.openembedded.org
Subject: [meta-oe][PATCH] bpftool: remove recipe from blacklist
Date: Thu, 25 Mar 2021 08:26:25 -0700
Message-Id: <20210325152625.32104-1-dzagorui@cisco.com>
X-Mailer: git-send-email 2.26.2.Cisco
MIME-Version: 1.0
X-Outbound-SMTP-Client: 10.30.208.113, sjc-ads-9103.cisco.com
X-Outbound-Node: rcdn-core-8.cisco.com
Content-Transfer-Encoding: 8bit

Have not seen build issues for 5.4 and 5.10
kernels so allow to build it

Signed-off-by: Denys Zagorui <dzagorui@cisco.com>
---
 meta-oe/recipes-kernel/bpftool/bpftool.bb | 1 -
 1 file changed, 1 deletion(-)

diff --git a/meta-oe/recipes-kernel/bpftool/bpftool.bb b/meta-oe/recipes-kernel/bpftool/bpftool.bb
index 1758430bc..e58bdd493 100644
--- a/meta-oe/recipes-kernel/bpftool/bpftool.bb
+++ b/meta-oe/recipes-kernel/bpftool/bpftool.bb
@@ -32,4 +32,3 @@ python do_package_prepend() {
 }
 
 B = "${WORKDIR}/${BPN}-${PV}"
-PNBLACKLIST[bpftool] ?= "Needs forward porting to kernel 5.2+"
-- 
2.26.2.Cisco

