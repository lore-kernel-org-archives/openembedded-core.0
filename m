Received: from mail1.bemta26.messagelabs.com (mail1.bemta26.messagelabs.com [85.158.142.115])
 by mx.groups.io with SMTP id smtpd.web11.2116.1620949520565598997
 for <openembedded-core@lists.openembedded.org>;
 Thu, 13 May 2021 16:45:21 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@fujitsu.com header.s=170520fj header.b=YW+bKzQE;
 spf=pass (domain: fujitsu.com, ip: 85.158.142.115, mailfrom: wangmy@fujitsu.com)
Return-Path: <wangmy@fujitsu.com>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=fujitsu.com;
	s=170520fj; t=1620949518; i=@fujitsu.com;
	bh=AB4suGJq7IKM95FJ5B6VHB2vjhwbKNxI7ZgvRAlOTK8=;
	h=From:To:CC:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type;
	b=YW+bKzQEDxRCim54Z9AOmc5wIwjWQX2Ei8DTKloHJbrGn5v8VMs3G/qUpbpxoo7wO
	 hkWBDu/sQUsg4Zxseq9NxgoGJPXi1Br1qtoZMZCsD9PuvB28d7BsFCrA5gCH1qg7YI
	 kLvebTlstYBiS/Sg7qQ2qu4iQUmdzU3s/nNN+0eFdY1wel3aHQwlv0Vb6yNaTX1dXD
	 B9JKXHUQC8TGpajIYmFI9/6l6VDKARJ7mdTFLH12o/SlW2jVL3cACO/mL34y7Ussfn
	 7F/GNR9gAmiYGUnQRP1Z7yk62UFknIgeHMdHBPK7jX4sjORbRs/ptjREuCqwC9M2iB
	 OI/Ixo903gM+A==
Received: from [100.113.6.193] (using TLSv1.2 with cipher DHE-RSA-AES256-GCM-SHA384 (256 bits))
	by server-4.bemta.az-b.eu-central-1.aws.symcld.net id 5A/6E-27273-D0ABD906; Thu, 13 May 2021 23:45:17 +0000
X-Brightmail-Tracker: H4sIAAAAAAAAA+NgFtrAIsWRWlGSWpSXmKPExsViZ8MxVZd319w
  Eg11XRSzu/HzH7sDocW7jCsYAxijWzLyk/IoE1owZ8ycxFvzkrHg95zBrA+NMzi5GLg4hgVlM
  Eks+7WGFcI4zShz7vYali5GTg01ATWL6rRtACQ4OEQE9iav/REHCzAIqEi9+97CD2MICDhI3L
  i9kBLFZBFQl1nQdB7N5BRwlJh9fAGZLCChITHn4nhnE5hRwknjbsZAVxBYCqnl0ooEZol5Q4u
  TMJywQ8yUkDr54wQzRqygx+3IzC4RdIfH68CXmCYz8s5C0zELSsoCRaRWjZVJRZnpGSW5iZo6
  uoYGBrqGhsa6JrqGxgV5ilW6SXmqpbnJqXklRIlBWL7G8WK+4Mjc5J0UvL7VkEyMwIFMKWZp2
  MP5+9UHvEKMkB5OSKO9Jz9kJQnxJ+SmVGYnFGfFFpTmpxYcYZTg4lCR4zXfOTRASLEpNT61Iy
  8wBRgdMWoKDR0mEN2sHUJq3uCAxtzgzHSJ1ilFRSpx3IkhCACSRUZoH1waLyEuMslLCvIwMDA
  xCPAWpRbmZJajyrxjFORiVhHkdQKbwZOaVwE1/BbSYCWjxjemzQBaXJCKkpBqY5rq8OWuiof/
  m25Jt/zh3bJcKz0hs33HhOIN2fG3BPRYBp/Tndb+iBP+ETHlhMlkmIHZPuMpEC3lRh4j9Ux6r
  buTYHjKtqq8lYP/W5H02IZ8lSnyNj8WpuDG/Lj/59fiMM2ZFk5v+v1t4akdp/d/8l9NncBstf
  aD0QzxS2bLx3/W52+qvOx19bBgcMyX+gMUE1YyVDDU/J0+0KdG/9GWfR3R4IWtnr77kyqaDv+
  N+93q9Uf5h48e8/An/whf9AvMY1lxjLdvBu5lr24HjN3JtTzMLH7Gtr+cTXvE3/zXzZ6+u9uz
  NU7vu6My1Z125TodT6FeOB+uMvRoStUxTp17Jm+sjp1+k1vDgw82d7stDlFiKMxINtZiLihMB
  vtcIYEMDAAA=
X-Env-Sender: wangmy@fujitsu.com
X-Msg-Ref: server-4.tower-238.messagelabs.com!1620949516!37780!1
X-Originating-IP: [62.60.8.149]
X-SYMC-ESS-Client-Auth: outbound-route-from=pass
X-StarScan-Received: 
X-StarScan-Version: 9.75.3; banners=-,-,-
X-VirusChecked: Checked
Received: (qmail 525 invoked from network); 13 May 2021 23:45:17 -0000
Received: from unknown (HELO mailhost2.uk.fujitsu.com) (62.60.8.149)
  by server-4.tower-238.messagelabs.com with ECDHE-RSA-AES256-GCM-SHA384 encrypted SMTP; 13 May 2021 23:45:17 -0000
Received: from R01UKEXCASM126.r01.fujitsu.local ([10.183.43.178])
	by mailhost2.uk.fujitsu.com (8.14.5/8.14.5) with ESMTP id 14DNjBv3000496
	(version=TLSv1/SSLv3 cipher=AES256-SHA bits=256 verify=FAIL)
	for <openembedded-core@lists.openembedded.org>; Fri, 14 May 2021 00:45:16 +0100
Received: from localhost.localdomain.localdomain (10.167.225.33) by
 R01UKEXCASM126.r01.fujitsu.local (10.183.43.178) with Microsoft SMTP Server
 (TLS) id 15.0.1497.2; Fri, 14 May 2021 00:45:12 +0100
From: "wangmy" <wangmy@fujitsu.com>
To: <openembedded-core@lists.openembedded.org>
CC: Wang Mingyu <wangmy@fujitsu.com>
Subject: [OE-core] [PATCH] python3-six: upgrade 1.15.0 -> 1.16.0
Date: Fri, 14 May 2021 07:44:59 +0800
Message-ID: <1620949499-3981-2-git-send-email-wangmy@fujitsu.com>
X-Mailer: git-send-email 1.8.3.1
In-Reply-To: <1620949499-3981-1-git-send-email-wangmy@fujitsu.com>
References: <1620949499-3981-1-git-send-email-wangmy@fujitsu.com>
MIME-Version: 1.0
X-Originating-IP: [10.167.225.33]
X-ClientProxiedBy: G08CNEXCHPEKD08.g08.fujitsu.local (10.167.33.83) To
 R01UKEXCASM126.r01.fujitsu.local (10.183.43.178)
Content-Type: text/plain

Signed-off-by: Wang Mingyu <wangmy@fujitsu.com>
---
 meta/recipes-devtools/python/python3-six_1.15.0.bb | 5 -----
 meta/recipes-devtools/python/python3-six_1.16.0.bb | 5 +++++
 2 files changed, 5 insertions(+), 5 deletions(-)
 delete mode 100644 meta/recipes-devtools/python/python3-six_1.15.0.bb
 create mode 100644 meta/recipes-devtools/python/python3-six_1.16.0.bb

diff --git a/meta/recipes-devtools/python/python3-six_1.15.0.bb b/meta/recipes-devtools/python/python3-six_1.15.0.bb
deleted file mode 100644
index 6c6f3f9629..0000000000
--- a/meta/recipes-devtools/python/python3-six_1.15.0.bb
+++ /dev/null
@@ -1,5 +0,0 @@
-inherit setuptools3
-require python-six.inc
-
-SRC_URI[md5sum] = "9f90a0eaa0ea7747fda01ca79d21ebcb"
-SRC_URI[sha256sum] = "30639c035cdb23534cd4aa2dd52c3bf48f06e5f4a941509c8bafd8ce11080259"
diff --git a/meta/recipes-devtools/python/python3-six_1.16.0.bb b/meta/recipes-devtools/python/python3-six_1.16.0.bb
new file mode 100644
index 0000000000..ce5b10c42e
--- /dev/null
+++ b/meta/recipes-devtools/python/python3-six_1.16.0.bb
@@ -0,0 +1,5 @@
+inherit setuptools3
+require python-six.inc
+
+SRC_URI[md5sum] = "a7c927740e4964dd29b72cebfc1429bb"
+SRC_URI[sha256sum] = "1e61c37477a1626458e36f7b1d82aa5c9b094fa4802892072e49de9c60c4c926"
-- 
2.25.1

