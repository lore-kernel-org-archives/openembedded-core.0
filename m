Received: from NAM12-MW2-obe.outbound.protection.outlook.com (NAM12-MW2-obe.outbound.protection.outlook.com [40.107.244.56])
 by mx.groups.io with SMTP id smtpd.web11.13186.1608920290432979877
 for <openembedded-core@lists.openembedded.org>;
 Fri, 25 Dec 2020 10:18:11 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@agilent.com header.s=selector1 header.b=eoib3yLm;
 spf=permerror, err=parse error for token &{10 18 %{i}._ip.%{h}._ehlo.%{d}._spf.vali.email}: invalid domain name (domain: agilent.com, ip: 40.107.244.56, mailfrom: chris.laplante@agilent.com)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=WOI/as24mIjwyWSuRIXjudq+PUm8TuHuGaJbJmlJfCoBkQiQhH9KYMzrU2ykl+YZpLdstF1DIRiDjoAOLRqsnZl/24p4u69R76OzsO2i99UnY47ITbTffEWB6lXUPQis+XvBwTW8Ckv/5kei5fzb/EEKbMqFQrOLsfsdP86ZPksez073YgTabM1DU0GThg0sCAqSFld/8tflUfd6sy9LVggJxgMVFCqH2SmgrURAqok/6+E1cRaXxCzHq0OW2PLL/qPWY6iShdIXZFjSQjdWpiIdTWiC1RVqmOXPPFpG82sw+Bd0DHtRIKWTbePr2oSTmfFMP0zlDLXu9k29fT/HbQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Gtf+tr/MQKp9amefwzUWODgz/P1vaqZzaJfN2jY+634=;
 b=cypHODQlGVqxVGAAlOtGHnD2IWyHzG1cQNrLpyhezpwXD4oj5CysJ9Q7ouosuQcFWPrUfKnwEX1IVISQL3VWixpFJcYyXwPEtodoZwbbXzY7ArvFwUnmWigO3ybPDqODUbmEAV2/9BjWvqrx+KjWVZczESD5Zns5mrMPaSX6Vhx22J/gW4CK2WkDoHiBAUfoRE+OvBLvuwXbfAb/YIIuZXgeNNwg7n/MHTrgzmpzXps+VmryYBm6mTnJT+16mcKbntT/wwDB5RkhT9W8gGuTSCHi9d+DeO/iJTnT9yc9hxYN8ZL6yvCp92H7bnm8AzldQBUboWksCAxrRYvC2PYDQw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 192.25.218.37) smtp.rcpttodomain=lists.openembedded.org
 smtp.mailfrom=agilent.com; dmarc=pass (p=reject sp=reject pct=100)
 action=none header.from=agilent.com; dkim=none (message not signed); arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=agilent.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Gtf+tr/MQKp9amefwzUWODgz/P1vaqZzaJfN2jY+634=;
 b=eoib3yLmP8lOI9c/S9aV6UV1HMgR1U//PpEXWg708a62V6vELIV03I3E2KGyNR4m5HaxoxtRpBBWtMwwNiyfTUlucK1GQ1QoTPGluCglrB2H8ugZ960tDRZ1IhfBf3vfiZhVZxSSKY+DyoAGh5qOVdYlzPCC94lf64IZ4WplrpYjDp63oVZug6krU8UZhKxwqoM+ZysZm+GWEDUiB4yocFAJzcDBJZ00PYCkwCHT3Sobma1fxHBbHqsD/Lh3gcQj4dRlI7659U9lrVNi9jcv9SoMkDUVvY+6qFuPD9Kb1BcqCoE2U9BVL96StogL6IehcJm4WGctm3xpVDSgZj3kTA==
Received: from MW2PR16CA0009.namprd16.prod.outlook.com (2603:10b6:907::22) by
 MN2PR12MB3422.namprd12.prod.outlook.com (2603:10b6:208:ce::27) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.3676.31; Fri, 25 Dec 2020 18:18:08 +0000
Received: from MW2NAM12FT012.eop-nam12.prod.protection.outlook.com
 (2603:10b6:907:0:cafe::82) by MW2PR16CA0009.outlook.office365.com
 (2603:10b6:907::22) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3700.27 via Frontend
 Transport; Fri, 25 Dec 2020 18:18:07 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 192.25.218.37)
 smtp.mailfrom=agilent.com; lists.openembedded.org; dkim=none (message not
 signed) header.d=none;lists.openembedded.org; dmarc=pass action=none
 header.from=agilent.com;
Received-SPF: Pass (protection.outlook.com: domain of agilent.com designates
 192.25.218.37 as permitted sender) receiver=protection.outlook.com;
 client-ip=192.25.218.37; helo=edgeappmail.agilent.com;
Received: from edgeappmail.agilent.com (192.25.218.37) by
 MW2NAM12FT012.mail.protection.outlook.com (10.13.180.79) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.3700.20 via Frontend Transport; Fri, 25 Dec 2020 18:18:07 +0000
Received: from localhost.localdomain (10.255.85.181) by
 edgeappmail.agilent.com (192.25.218.37) with Microsoft SMTP Server id
 15.1.2044.4; Fri, 25 Dec 2020 11:18:02 -0700
From: "Chris Laplante" <chris.laplante@agilent.com>
To: <openembedded-core@lists.openembedded.org>
CC: Chris Laplante <chris.laplante@agilent.com>
Subject: [PATCH] contrib/git-hooks: add a sendemail-validate example hook that adds FROM: lines to outgoing patch emails
Date: Fri, 25 Dec 2020 13:16:49 -0500
Message-ID: <20201225181649.36785-1-chris.laplante@agilent.com>
X-Mailer: git-send-email 2.17.1
MIME-Version: 1.0
Return-Path: chris.laplante@agilent.com
Received-SPF: SoftFail (wpcosapexchedg1.windmz.agilent.com: domain of
 transitioning chris.laplante@agilent.com discourages use of 10.255.85.181 as
 permitted sender)
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 972a1488-4196-4c67-abb2-08d8a9016db8
X-MS-TrafficTypeDiagnostic: MN2PR12MB3422:
X-MS-Exchange-Transport-Forked: True
X-Microsoft-Antispam-PRVS: 
	<MN2PR12MB34220E576E3D8D0989C96FE78BDC0@MN2PR12MB3422.namprd12.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:765;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 
	4SI8n2HkJNSk22huOW5iHLwU/6kiFvY0/zi6/AhnxX60VL0WHb4iX7WZFVb7WVyJnQ6Hu5lVWWIwNtv0GOlULs2rEvwPX6rEEWTawWtXXbMlwcHEkx/gJGpReDqtjYUcvJpPVDO/EFdqvB9KC/4jeLVEAYK5Jo5MBALOVfYkB/9VjYxiS5MH/PHZUxAGHAYi/WWbQDispPfvMF0y3INFMVqG5mIOepfbxCbrXfeiOsN3LoXaVwpqcTXa0MEw/jQWxy16i/9bLdS0U5RQtSMTgFJW3KwAzZMscdB+uHohohq0kPo8kjPwDfaBcrAGo9cOfq25HJZHgKi2ymzRsyo3pETUJHSh49UDNwSNW5nmTmDFlwByeQfL0wixxEtsQ7hCvjcfzQwkx/hCFMKhiubAJIuZbTZs2bAvx+Fpa8RsJ+ceqC/GY+oVnbM3PlcUty5tX6UGoZua+aUbT4bdp85l1hZ2coMX/ce3bHTbA1kzne/8+rznO+IJ8cV9pLvOXcWVHN/Uof7v7wz+xXuEsDXrxQ==
X-Forefront-Antispam-Report: 
	CIP:192.25.218.37;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:edgeappmail.agilent.com;PTR:wpcosapexchedg1.windmz.agilent.com;CAT:NONE;SFS:(4636009)(396003)(376002)(346002)(136003)(39860400002)(29502001)(46966006)(86362001)(83380400001)(36756003)(44832011)(6916009)(5660300002)(82310400003)(7636003)(316002)(8936002)(356005)(186003)(34020700004)(82740400003)(2616005)(426003)(8676002)(336012)(26005)(1076003)(4326008)(15650500001)(107886003)(70206006)(6666004)(47076005)(2906002)(45080400002)(478600001);DIR:OUT;SFP:1101;
X-OriginatorOrg: agilent.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 25 Dec 2020 18:18:07.2636
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 972a1488-4196-4c67-abb2-08d8a9016db8
X-MS-Exchange-CrossTenant-Id: a9c0bc09-8b46-4206-9351-2ba12fb4a5c0
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=a9c0bc09-8b46-4206-9351-2ba12fb4a5c0;Ip=[192.25.218.37];Helo=[edgeappmail.agilent.com]
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: TreatMessagesAsInternal-MW2NAM12FT012.eop-nam12.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MN2PR12MB3422
Content-Type: text/plain

From: Chris Laplante <chris.laplante@agilent.com>

This is useful for people using Microsoft Exchange / Office 360, which
butchers patches causing author identity to be lost.

Signed-off-by: Chris Laplante <chris.laplante@agilent.com>
---
 contrib/git-hooks/sendemail-validate.sample | 78 +++++++++++++++++++++
 1 file changed, 78 insertions(+)
 create mode 100755 contrib/git-hooks/sendemail-validate.sample

diff --git a/contrib/git-hooks/sendemail-validate.sample b/contrib/git-hooks/sendemail-validate.sample
new file mode 100755
index 0000000000..af5d55cb00
--- /dev/null
+++ b/contrib/git-hooks/sendemail-validate.sample
@@ -0,0 +1,78 @@
+#!/usr/bin/env python3
+
+# Copyright (C) 2020  Agilent Technologies, Inc.
+# Author: Chris Laplante <chris.laplante@agilent.com>
+
+# This sendemail-validate hook injects 'From: ' header lines into outgoing
+# emails sent via 'git send-email', to ensure that accurate commit authorship
+# information is present. It was created because some email servers
+# (notably Microsoft Exchange / Office 360) seem to butcher outgoing patches,
+# resulting in incorrect authorship.
+
+# Current limitations:
+#   1. Assumes one per patch per email
+#   2. Minimal error checking
+#
+# Installation:
+#   1. Copy to .git/hooks/sendemail-validate
+#   2. chmod +x .git/hooks/sendemail-validate
+
+
+import enum
+import re
+import subprocess
+import sys
+
+
+class Subject(enum.IntEnum):
+    NOT_SEEN = 0
+    CONSUMING = 1
+    SEEN = 2
+
+
+def make_from_line():
+    cmd = ["git", "var", "GIT_COMMITTER_IDENT"]
+    proc = subprocess.run(cmd, check=True, stdout=subprocess.PIPE, universal_newlines=True)
+    regex = re.compile(r"^(.*>).*$")
+    match = regex.match(proc.stdout)
+    assert match is not None
+    return "From: {0}".format(match.group(1))
+
+
+def main():
+    email = sys.argv[1]
+
+    with open(email, "r") as f:
+        email_lines = f.read().split("\n")
+
+    subject_seen = Subject.NOT_SEEN
+    first_body_line = None
+    for i, line in enumerate(email_lines):
+        if (subject_seen == Subject.NOT_SEEN) and line.startswith("Subject: "):
+            subject_seen = Subject.CONSUMING
+            continue
+        if subject_seen == Subject.CONSUMING:
+            if not line.strip():
+                subject_seen = Subject.SEEN
+                continue
+        if subject_seen == Subject.SEEN:
+            first_body_line = i
+            break
+
+    assert subject_seen == Subject.SEEN
+    assert first_body_line is not None
+
+    from_line = make_from_line()
+    # Only add FROM line if it is not already there
+    if email_lines[first_body_line] != from_line:
+        email_lines.insert(first_body_line, from_line)
+        email_lines.insert(first_body_line + 1, "")
+        with open(email, "w") as f:
+            f.write("\n".join(email_lines))
+
+    return 0
+
+
+if __name__ == "__main__":
+    sys.exit(main())
+
-- 
2.17.1

