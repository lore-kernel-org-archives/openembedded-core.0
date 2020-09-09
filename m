Received: from NAM12-BN8-obe.outbound.protection.outlook.com (NAM12-BN8-obe.outbound.protection.outlook.com [40.107.237.52])
 by mx.groups.io with SMTP id smtpd.web12.2131.1599672929022486371
 for <openembedded-core@lists.openembedded.org>;
 Wed, 09 Sep 2020 10:35:29 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@agilent.com header.s=selector1 header.b=fyY3iO2A;
 spf=permerror, err=parse error for token &{10 18 %{i}._ip.%{h}._ehlo.%{d}._spf.vali.email}: invalid domain name (domain: agilent.com, ip: 40.107.237.52, mailfrom: chris.laplante@agilent.com)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=A7AmCIY92Ew8rBYA+XpZotRTpy6AjTZqbLwHckFLK3VDSPR6nPZ0awCjmxYOrFR2uQUwVuQ/oEY/Jt7mw3x5dpJcjsT8UvvcZR7uObJPOPIUps1QjdrCWiHct/m/QCgNocMRZEXSGRijoEcegA2iZeH8bovbNmpdVOWLqPF/X5s2xAnqAurIk0T+aNySzZnmmoYJG3IL6BWjThn2vesNLvdWMsuRAqybJx8WvtwSyTV6jVj9DdsIRYpIZVv3tWbVaBSAngJYzTXB6LW1+SrzVCOpztAnWAiLDdyfOEVsGmOCEt6XTtMjpbNCnU58IVw8yq2lp7xlUro3zDyyrw2OZQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=iBJ1R5vl8N2Nmp6r0IvYFWujq17V3+HVGzX/9ogiV+4=;
 b=PHHME9vr82EOBtR/hx7O97ZkIU88avDrIKjBOalt7ad2Alo9laByH5jSrZ59yuFfPW5r185nSxqV0SLb3xP22kiDzU3LgC3UXZt6vFQwPcUNmdl83gSguray7IeO0pyYQLak7a9ojL7D15cUJ/7T80gVPteKbBOJ6IGr6Xx1pt9mzg1yKEQlCDv9MJtmydz9BiNJc65P/HhKXPdRXRBA+gGGoovjuZtdNujfJRO7eswNbIdbwxAR29zoa9uz96g3YDldqemv7NgIKv1kW3yidYr0p6VtZE3tZcxqpb5KYdMZnbAGFA3zXdyOfo9LHtkuEWaHF4YTTyd5QxhUlhqu5Q==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 192.25.218.41) smtp.rcpttodomain=lists.openembedded.org
 smtp.mailfrom=agilent.com; dmarc=pass (p=reject sp=reject pct=100)
 action=none header.from=agilent.com; dkim=none (message not signed); arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=agilent.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=iBJ1R5vl8N2Nmp6r0IvYFWujq17V3+HVGzX/9ogiV+4=;
 b=fyY3iO2ASOteUtnRMVfUIx58f08tdAV+RDHvrhqAC1wzimrqkt/IJ0UtIMGLQ1kEcXZyPj3uBnQGB+AJiqZJYPp89gReDE8kDvzZiXS4yNM6maC49R0q33Lr5JiUJW9R4LtcSQZ782af7MwSZAU312dq/gUdtaTdRMcMmru/eR7V+EzhL00ELd1irC4QqbSVDqEj14ZVoIOn2LFK31OVo0zo+8HHXV/eHqFjP2h/sT2UX1rmaPq63gTzi3J46Zw5yPqJdCgca2yfyaFWEbtN22lZUUWpwVJhlbrtQ2Qb9ZUUVBUhfheP6yAI///ig8h6uEhguwHd7Jx0dsH1WN4t0A==
Received: from BN1PR13CA0030.namprd13.prod.outlook.com (2603:10b6:408:e2::35)
 by MN2PR12MB3390.namprd12.prod.outlook.com (2603:10b6:208:c9::25) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3370.16; Wed, 9 Sep
 2020 17:35:27 +0000
Received: from BN8NAM12FT058.eop-nam12.prod.protection.outlook.com
 (2603:10b6:408:e2:cafe::62) by BN1PR13CA0030.outlook.office365.com
 (2603:10b6:408:e2::35) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3370.10 via Frontend
 Transport; Wed, 9 Sep 2020 17:35:27 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 192.25.218.41)
 smtp.mailfrom=agilent.com; lists.openembedded.org; dkim=none (message not
 signed) header.d=none;lists.openembedded.org; dmarc=pass action=none
 header.from=agilent.com;
Received-SPF: Pass (protection.outlook.com: domain of agilent.com designates
 192.25.218.41 as permitted sender) receiver=protection.outlook.com;
 client-ip=192.25.218.41; helo=edgeappmail.agilent.com;
Received: from edgeappmail.agilent.com (192.25.218.41) by
 BN8NAM12FT058.mail.protection.outlook.com (10.13.182.188) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.3370.8 via Frontend Transport; Wed, 9 Sep 2020 17:35:27 +0000
Received: from laplante-lm-19.localdomain (192.25.126.27) by
 edgeappmail.agilent.com (192.25.218.41) with Microsoft SMTP Server id
 15.1.2044.4; Wed, 9 Sep 2020 11:35:25 -0600
From: "Chris Laplante" <chris.laplante@agilent.com>
To: <openembedded-core@lists.openembedded.org>
CC: Chris Laplante <chris.laplante@agilent.com>
Subject: [PATCH 1/4] cve-update-db-native: add progress handler
Date: Wed, 9 Sep 2020 13:35:07 -0400
Message-ID: <20200909173510.114925-1-chris.laplante@agilent.com>
X-Mailer: git-send-email 2.17.1
MIME-Version: 1.0
Return-Path: chris.laplante@agilent.com
Received-SPF: SoftFail (wpcosapexchedg2.windmz.agilent.com: domain of
 transitioning chris.laplante@agilent.com discourages use of 192.25.126.27 as
 permitted sender)
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: d9390623-ea8c-4c18-e6c0-08d854e6bda9
X-MS-TrafficTypeDiagnostic: MN2PR12MB3390:
X-MS-Exchange-Transport-Forked: True
X-Microsoft-Antispam-PRVS: 
	<MN2PR12MB3390B82891372F915E1051248B260@MN2PR12MB3390.namprd12.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:118;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 
	VyRMaZcJQQ4soT8J99HrQ+dfgi0pOqgjENINIImwWZBDj13ZuFUjDCqOTeTyTSkz4YDav6bCnKozRPVeoglqRvhv8IZqnRPDJvLjAMPpmYuvLLbD4/JadFn45EGjKVCOdzgFJ+fCDfVweMhzkNaYGi+tnWRdNRJJSotFYKGqs7B2M/C12XEBWgOsFuJH6DyMDte9/ifrzB8CzUt979Xu8GoAJDbElM5ZfMFCtQjBF908gymH70rubdI8eS7kYejMGRZwYVZg47prRmIKneiAphQN1d+Q0gW3juOi/T+HEOcfizP/+g97PJiJkMFz5VcDtSVNk9vYJNE7AaV2/K7MBZlHxGqOuPIvC3EmgWvuu3X0c0DwBl/JNlNtFNK/edIcumYMyt/FQdUEe6lGr0CPRTAnzljWTMbVNY8OucaSTQ0=
X-Forefront-Antispam-Report: 
	CIP:192.25.218.41;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:edgeappmail.agilent.com;PTR:exch.smtp.agilent.com;CAT:NONE;SFS:(4636009)(346002)(396003)(136003)(376002)(39860400002)(29502001)(46966005)(82310400003)(478600001)(426003)(316002)(107886003)(36906005)(83380400001)(70206006)(26005)(44832011)(1076003)(6666004)(186003)(2906002)(86362001)(956004)(82740400003)(2616005)(356005)(5660300002)(7636003)(47076004)(36756003)(8676002)(4326008)(6916009)(15650500001)(8936002)(336012);DIR:OUT;SFP:1101;
X-OriginatorOrg: agilent.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 09 Sep 2020 17:35:27.2785
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: d9390623-ea8c-4c18-e6c0-08d854e6bda9
X-MS-Exchange-CrossTenant-Id: a9c0bc09-8b46-4206-9351-2ba12fb4a5c0
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=a9c0bc09-8b46-4206-9351-2ba12fb4a5c0;Ip=[192.25.218.41];Helo=[edgeappmail.agilent.com]
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: TreatMessagesAsInternal-BN8NAM12FT058.eop-nam12.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MN2PR12MB3390
Content-Type: text/plain

Signed-off-by: Chris Laplante <chris.laplante@agilent.com>
---
 .../recipes-core/meta/cve-update-db-native.bb | 90 ++++++++++---------
 1 file changed, 47 insertions(+), 43 deletions(-)

diff --git a/meta/recipes-core/meta/cve-update-db-native.bb b/meta/recipes-core/meta/cve-update-db-native.bb
index 32d6dbdffc..2221825bf8 100644
--- a/meta/recipes-core/meta/cve-update-db-native.bb
+++ b/meta/recipes-core/meta/cve-update-db-native.bb
@@ -29,6 +29,7 @@ python do_populate_cve_db() {
     Update NVD database with json data feed
     """
     import bb.utils
+    import bb.progress
     import sqlite3, urllib, urllib.parse, shutil, gzip
     from datetime import date
 
@@ -60,54 +61,57 @@ python do_populate_cve_db() {
 
     initialize_db(c)
 
-    for year in range(YEAR_START, date.today().year + 1):
-        year_url = BASE_URL + str(year)
-        meta_url = year_url + ".meta"
-        json_url = year_url + ".json.gz"
+    with bb.progress.ProgressHandler(d) as ph:
+        total_years = date.today().year + 1 - YEAR_START
+        for i, year in enumerate(range(YEAR_START, date.today().year + 1)):
+            ph.update((float(i + 1) / total_years) * 100)
+            year_url = BASE_URL + str(year)
+            meta_url = year_url + ".meta"
+            json_url = year_url + ".json.gz"
 
-        # Retrieve meta last modified date
-        try:
-            response = urllib.request.urlopen(meta_url)
-        except urllib.error.URLError as e:
-            cve_f.write('Warning: CVE db update error, Unable to fetch CVE data.\n\n')
-            bb.warn("Failed to fetch CVE data (%s)" % e.reason)
-            return
-
-        if response:
-            for l in response.read().decode("utf-8").splitlines():
-                key, value = l.split(":", 1)
-                if key == "lastModifiedDate":
-                    last_modified = value
-                    break
-            else:
-                bb.warn("Cannot parse CVE metadata, update failed")
-                return
-
-        # Compare with current db last modified date
-        c.execute("select DATE from META where YEAR = ?", (year,))
-        meta = c.fetchone()
-        if not meta or meta[0] != last_modified:
-            # Clear products table entries corresponding to current year
-            c.execute("delete from PRODUCTS where ID like ?", ('CVE-%d%%' % year,))
-
-            # Update db with current year json file
+            # Retrieve meta last modified date
             try:
-                response = urllib.request.urlopen(json_url)
-                if response:
-                    update_db(c, gzip.decompress(response.read()).decode('utf-8'))
-                c.execute("insert or replace into META values (?, ?)", [year, last_modified])
+                response = urllib.request.urlopen(meta_url)
             except urllib.error.URLError as e:
-                cve_f.write('Warning: CVE db update error, CVE data is outdated.\n\n')
-                bb.warn("Cannot parse CVE data (%s), update failed" % e.reason)
+                cve_f.write('Warning: CVE db update error, Unable to fetch CVE data.\n\n')
+                bb.warn("Failed to fetch CVE data (%s)" % e.reason)
                 return
 
-        # Update success, set the date to cve_check file.
-        if year == date.today().year:
-            cve_f.write('CVE database update : %s\n\n' % date.today())
-
-    cve_f.close()
-    conn.commit()
-    conn.close()
+            if response:
+                for l in response.read().decode("utf-8").splitlines():
+                    key, value = l.split(":", 1)
+                    if key == "lastModifiedDate":
+                        last_modified = value
+                        break
+                else:
+                    bb.warn("Cannot parse CVE metadata, update failed")
+                    return
+
+            # Compare with current db last modified date
+            c.execute("select DATE from META where YEAR = ?", (year,))
+            meta = c.fetchone()
+            if not meta or meta[0] != last_modified:
+                # Clear products table entries corresponding to current year
+                c.execute("delete from PRODUCTS where ID like ?", ('CVE-%d%%' % year,))
+
+                # Update db with current year json file
+                try:
+                    response = urllib.request.urlopen(json_url)
+                    if response:
+                        update_db(c, gzip.decompress(response.read()).decode('utf-8'))
+                    c.execute("insert or replace into META values (?, ?)", [year, last_modified])
+                except urllib.error.URLError as e:
+                    cve_f.write('Warning: CVE db update error, CVE data is outdated.\n\n')
+                    bb.warn("Cannot parse CVE data (%s), update failed" % e.reason)
+                    return
+
+            # Update success, set the date to cve_check file.
+            if year == date.today().year:
+                cve_f.write('CVE database update : %s\n\n' % date.today())
+
+        cve_f.close()
+        conn.commit()
+        conn.close()
 }
 
 def initialize_db(c):
-- 
2.17.1

