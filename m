Received: from alln-iport-8.cisco.com (alln-iport-8.cisco.com [173.37.142.95])
 by mx.groups.io with SMTP id smtpd.web08.615.1626990691129153227
 for <openembedded-core@lists.openembedded.org>;
 Thu, 22 Jul 2021 14:51:31 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@cisco.com header.s=iport header.b=EKYYlgqO;
 spf=pass (domain: cisco.com, ip: 173.37.142.95, mailfrom: fib@cisco.com)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=cisco.com; i=@cisco.com; l=98; q=dns/txt; s=iport;
  t=1626990691; x=1628200291;
  h=from:to:subject:date:message-id:mime-version:
   content-transfer-encoding;
  bh=3bLWi5WUJpHagpd4s+OPuPWNs5JE9PzSRPm/1M40cvg=;
  b=EKYYlgqOtEs33qqQWKK+IpH0vG0eEqSjzfRcAORIcyDFBaKxBB/q4NpK
   KBnqHhSmtVVkfpHGHE6JDjw7NRTBwC5CYturwKmcZ1Yyo816XIkxD7SQ6
   3/RA6aTeXEUr++HrwA/AGTnGByFClOG9JArBwty2P8gQXPPyQquXjMcIg
   U=;
X-IPAS-Result: =?us-ascii?q?A0AcAwAe6Plgl5ldJa1agmICg3c6lRcGjCuGa4oMgXwLA?=
 =?us-ascii?q?QEBDQEBQQQBAYdQAiU2Bw4CBAEBAQEDAgMBAQEBBQEBBQEBAQIBBgQUAQEBA?=
 =?us-ascii?q?QEBAQFyhXVDARABhikBgVODNYJiJQGpCYIsgQGEaIU2gToBiHuFFxx9gRCKC?=
 =?us-ascii?q?YUuBKc5nQ+DMJ4kGiuDUQGjEbZ5hB0CBAYFAhaBZwUtgVszGggbFYMlTxkOj?=
 =?us-ascii?q?jiOViFqAgYLAQEDCYQ5hyABAQ?=
IronPort-HdrOrdr: A9a23:hOlX5KuzSFpefo9V89euB0zV7skDY9V00zEX/kB9WHVpm6uj5q
 KTdZsguyMc5Ax9ZJhCo6HiBED/exLhHPdOiOF7V4tKNzOIhILHFu1fBPPZowEJ30bFh4pgPW
 AKSdkaNOHN
X-IronPort-Anti-Spam-Filtered: true
X-IronPort-AV: E=Sophos;i="5.84,262,1620691200"; 
   d="scan'208";a="745238108"
Received: from rcdn-core-2.cisco.com ([173.37.93.153])
  by alln-iport-8.cisco.com with ESMTP/TLS/DHE-RSA-SEED-SHA; 22 Jul 2021 21:51:09 +0000
Received: from sjc-ads-259.cisco.com (sjc-ads-259.cisco.com [171.71.190.191])
	by rcdn-core-2.cisco.com (8.15.2/8.15.2) with ESMTPS id 16MLp8wK009939
	(version=TLSv1.2 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=NO)
	for <openembedded-core@lists.openembedded.org>; Thu, 22 Jul 2021 21:51:09 GMT
Received: by sjc-ads-259.cisco.com (Postfix, from userid 488756)
	id 59F4DCC128E; Thu, 22 Jul 2021 14:51:08 -0700 (PDT)
From: "Ruslan Babayev (fib)" <fib@cisco.com>
To: openembedded-core@lists.openembedded.org
Subject: Cherry-picking fixes into Dunfell
Date: Thu, 22 Jul 2021 14:50:45 -0700
Message-Id: <20210722215047.1735683-1-fib@cisco.com>
X-Mailer: git-send-email 2.26.2.Cisco
MIME-Version: 1.0
X-Outbound-SMTP-Client: 171.71.190.191, sjc-ads-259.cisco.com
X-Outbound-Node: rcdn-core-2.cisco.com
Content-Transfer-Encoding: 8bit

The following two fixes are in master but affecting Dunfell.
Cherry-picked with some massaging.


