Received: from smtp2.axis.com (smtp2.axis.com [])
 by mx.groups.io with SMTP id smtpd.web10.7634.1593080526167583199
 for <openembedded-core@lists.openembedded.org>;
 Thu, 25 Jun 2020 03:22:08 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@axis.com header.s=axis-central1 header.b=pFFiHaLE;
 spf=fail (domain: axis.com, ip: <nil>, mailfrom: fredrik.gustafsson@axis.com)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
  d=axis.com; l=1504; q=dns/txt; s=axis-central1;
  t=1593080527; x=1624616527;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=JbRa2CRc83KeHuV7sbmaMNyguhagWKG9W6INagzJRtc=;
  b=pFFiHaLEDpKUycRBezTQ/8PVNtWh/pPeyA4DFhG37A2VSJydVRn43EX9
   nQtHr6ZInwfNHk05d9ELw7rOeIuNCQS7u4itlroF5EY4ZhbumlLiqAANG
   7z8HMO/beRL56lNDLATD87/WTGy3qjwp86entFnHyVwbmrp9dUPD/6ySb
   8Vy354htuVUTCCD7xFtDKtF0ztiU6bCmcvtwxCoEoNlTqea49C9FpTy+T
   zzd4Aeje8I0GpNH2/gwm/IDh5C/NRNFLIjyPR0R60k/Ut1OQcwHsjZLQY
   V91BFZq0Rr/4AGM3ENgrvkC7IQIUA6Y6U/hpxzbqoQ7HnQQDE+G9dCR/J
   Q==;
IronPort-SDR: uOOuJuAaFkXrpbASTSwToN0ecpxNP+JgHM9GRNuRQAQJ38ESVEO8oBiaIMyfV7mOgyzmHJ+IbB
 X4/7hI2YxuLrLjQvMrs741vosVQBnJ90oPuvLevs15LdDD/hfgjk6yse9cii5lb5wsNicRDrb1
 7DwUqZhWJlaR6qznAfcJJQ49FcbBP6l7V8d2p61UwBoifpvvqpyRVHCfWbuKMVhWphSt/WwLdT
 WK3bgKb7/Tp0k6ZtSrCe/C6eahQ26tV6Z3sE30bMsqp4fie50yNxASTEvTEwsMr4rclWU6F791
 4vU=
X-IronPort-AV: E=Sophos;i="5.75,278,1589234400"; 
   d="scan'208";a="9893880"
From: "Fredrik Gustafsson" <fredrik.gustafsson@axis.com>
To: <openembedded-core@lists.openembedded.org>
CC: <tools-cfpbuild-internal@axis.com>, <hugo.cedervall@axis.com>, Fredrik
 Gustafsson <fredrigu@axis.com>
Subject: [PATCH v2 02/26] package_managers: Add directory structure
Date: Thu, 25 Jun 2020 12:21:21 +0200
Message-ID: <20200625102145.7139-3-fredrigu@axis.com>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20200625102145.7139-1-fredrigu@axis.com>
References: <20200625102145.7139-1-fredrigu@axis.com>
MIME-Version: 1.0
Return-Path: fredrigu@axis.com
Content-Transfer-Encoding: 8bit
Content-Type: text/plain

This is first part of a refactoring to split up the package managers to
different files making it easier to extend OE-Core with more package
managers.

Signed-off-by: Fredrik Gustafsson <fredrigu@axis.com>
---
 meta/lib/oe/package_managers/deb/__init__.py | 3 +++
 meta/lib/oe/package_managers/ipk/__init__.py | 3 +++
 meta/lib/oe/package_managers/rpm/__init__.py | 3 +++
 3 files changed, 9 insertions(+)
 create mode 100644 meta/lib/oe/package_managers/deb/__init__.py
 create mode 100644 meta/lib/oe/package_managers/ipk/__init__.py
 create mode 100644 meta/lib/oe/package_managers/rpm/__init__.py

diff --git a/meta/lib/oe/package_managers/deb/__init__.py b/meta/lib/oe/package_managers/deb/__init__.py
new file mode 100644
index 0000000000..a2094304c9
--- /dev/null
+++ b/meta/lib/oe/package_managers/deb/__init__.py
@@ -0,0 +1,3 @@
+#
+# SPDX-License-Identifier: GPL-2.0-only
+#
diff --git a/meta/lib/oe/package_managers/ipk/__init__.py b/meta/lib/oe/package_managers/ipk/__init__.py
new file mode 100644
index 0000000000..a2094304c9
--- /dev/null
+++ b/meta/lib/oe/package_managers/ipk/__init__.py
@@ -0,0 +1,3 @@
+#
+# SPDX-License-Identifier: GPL-2.0-only
+#
diff --git a/meta/lib/oe/package_managers/rpm/__init__.py b/meta/lib/oe/package_managers/rpm/__init__.py
new file mode 100644
index 0000000000..a2094304c9
--- /dev/null
+++ b/meta/lib/oe/package_managers/rpm/__init__.py
@@ -0,0 +1,3 @@
+#
+# SPDX-License-Identifier: GPL-2.0-only
+#
-- 
2.20.1

