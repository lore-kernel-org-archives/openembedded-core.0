Received: from NAM11-BN8-obe.outbound.protection.outlook.com (NAM11-BN8-obe.outbound.protection.outlook.com [40.107.236.56])
 by mx.groups.io with SMTP id smtpd.web11.6547.1599684700785782073
 for <openembedded-core@lists.openembedded.org>;
 Wed, 09 Sep 2020 13:51:41 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@agilent.com header.s=selector1 header.b=up534Jea;
 spf=permerror, err=parse error for token &{10 18 %{i}._ip.%{h}._ehlo.%{d}._spf.vali.email}: invalid domain name (domain: agilent.com, ip: 40.107.236.56, mailfrom: chris.laplante@agilent.com)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=nA21LXxNizWaGmU8VXDlK1euRNHzGAhN1PnyeQ+d2D+b2ulVp4XGFP+zA2zmrEWVj3E0fXO0VBzBuHQ1P0lJteiD6lCRW64pgvpKccCSO2YOQrSpP6qW0jQx7uOcKpFs222RLsyJ+Vap9LJjFavykkK4B5J+I7KJFX3a8L7lZbBRf0bjsj4u/mc1B1k6JSJZ3Ck3r6TcEbcFCvydgXgrMGjHOoRuygg9t0gc9ZYpXbcb2xnSNYyRmCKM3Sq4RxIod92knMBjFybiVZzu0nxh14xdkoeqtRTxPe4bii8ltVk5QxiOJcRaSK0hxBCZxxodBCUypNXmW+J/hXjzu+gTOw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=iBJ1R5vl8N2Nmp6r0IvYFWujq17V3+HVGzX/9ogiV+4=;
 b=Ye/DaONHKAGmmsnvTX5sArSNlas18s7DSonTYeaYNMN66JjCh6tQrX9Fb8vgCsn7BvlcMWoP+xt0SORVYNcLSl+WoKTzetQTsR7JJ+nHY9N3qYoaLaZT9yuFSb3wp1zX9oiMVPqGIaOY0N3hPKIsphtlQ3FlHz0PESqUP5MbN0kZnAxngb0IxqH6S2Gdg4wH+T8+JNmo9wLZ+SBcZeu1r+TMNRMAhqXsWWQIn8HeCvLFKHbRL8ZpOcWDrhz5uoWrTe8tc7P58a3QfMOLBIc7kOBx+9t6VnO0UC86RYmUVssVXD4NuAVIQXD59lw01CP74j03wBMkFHxlIJPP8LGUOw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 192.25.218.41) smtp.rcpttodomain=lists.openembedded.org
 smtp.mailfrom=agilent.com; dmarc=pass (p=reject sp=reject pct=100)
 action=none header.from=agilent.com; dkim=none (message not signed); arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=agilent.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=iBJ1R5vl8N2Nmp6r0IvYFWujq17V3+HVGzX/9ogiV+4=;
 b=up534JeaSOm0oHol42eac+VuQc/n8ILk/viZcwwkzR3KwSayj/EouBCr7O88A6afW+wP6FCptFCNoexLVjaMf0xWKN7pqT907Io90PL2YhVOfBdL5W6767L7Je9MTDLitDkpilAey65vkPahmwIrdt+i0sdVwVV2oddkgfl6LgM2Hy9iEbXxzSDjfDzP6tzzwgCFOgf6Ejsop3yQl5ejzh9dCveKZDeMKh2zD9c3TgQK0jjhIFCpHI7CRk4dnby11hc234QyCiwHyBbp2UML04ZWsJ8aI+0Plq7VQvAIWc+ZsYiyVAB94DpPlV4x0K2l/7ez7hnhDzcFNlTFuegLRg==
Received: from BN6PR1401CA0009.namprd14.prod.outlook.com
 (2603:10b6:405:4b::19) by DM6PR12MB4652.namprd12.prod.outlook.com
 (2603:10b6:5:1d6::20) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3370.16; Wed, 9 Sep
 2020 20:51:39 +0000
Received: from BN8NAM12FT064.eop-nam12.prod.protection.outlook.com
 (2603:10b6:405:4b:cafe::5d) by BN6PR1401CA0009.outlook.office365.com
 (2603:10b6:405:4b::19) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3370.16 via Frontend
 Transport; Wed, 9 Sep 2020 20:51:39 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 192.25.218.41)
 smtp.mailfrom=agilent.com; lists.openembedded.org; dkim=none (message not
 signed) header.d=none;lists.openembedded.org; dmarc=pass action=none
 header.from=agilent.com;
Received-SPF: Pass (protection.outlook.com: domain of agilent.com designates
 192.25.218.41 as permitted sender) receiver=protection.outlook.com;
 client-ip=192.25.218.41; helo=edgeappmail.agilent.com;
Received: from edgeappmail.agilent.com (192.25.218.41) by
 BN8NAM12FT064.mail.protection.outlook.com (10.13.182.118) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.3370.8 via Frontend Transport; Wed, 9 Sep 2020 20:51:39 +0000
Received: from laplante-lm-19.localdomain (192.25.126.27) by
 edgeappmail.agilent.com (192.25.218.41) with Microsoft SMTP Server id
 15.1.2044.4; Wed, 9 Sep 2020 14:51:27 -0600
From: "Chris Laplante" <chris.laplante@agilent.com>
To: <openembedded-core@lists.openembedded.org>
CC: Chris Laplante <chris.laplante@agilent.com>
Subject: [PATCH v2 1/4] cve-update-db-native: add progress handler
Date: Wed, 9 Sep 2020 16:51:06 -0400
Message-ID: <20200909205109.120033-2-chris.laplante@agilent.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20200909205109.120033-1-chris.laplante@agilent.com>
References: <20200909205109.120033-1-chris.laplante@agilent.com>
MIME-Version: 1.0
Return-Path: chris.laplante@agilent.com
Received-SPF: SoftFail (wpcosapexchedg2.windmz.agilent.com: domain of
 transitioning chris.laplante@agilent.com discourages use of 192.25.126.27 as
 permitted sender)
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 1329ce69-dc28-4711-e608-08d855022631
X-MS-TrafficTypeDiagnostic: DM6PR12MB4652:
X-MS-Exchange-Transport-Forked: True
X-Microsoft-Antispam-PRVS: 
	<DM6PR12MB465287D3E67CC0D8B17008E38B260@DM6PR12MB4652.namprd12.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:118;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 
	v7o431LNOpalotk+KDq8fig4NnCpeWlmDqi8OEIkVs/UgkTuerq4oANetUZuGoWM3m74ZwHcmMVYmHt7pM1QzHxt8Cs6b/sRZUTrfhgXSIBqLYBdAa+4ltfvSjqMKzP0mbNBrCRX7jUns4cp3xMp73kDSUgIq2cq+HfGwlZZwyD7J1mKamaxjPZyIpZeHrkFAZjG4QVhXhIT6oAS/HmYgtB8gLyzuQODBdfX1J01wTq6KVhkeQfsQEqEKiGeZJx/OpTx9F4VNkoTP3f1ijbh2wYOqq7FitsV2Nm0mCUZ161Q0y8qGhfE7XDf2P5Kg/YqcJzSeflJllsFeCWIPOOl5ubSiVKLPSKmU1XMG5W9JFGC9BKAPmnYpeJBT8EZMSYedTu7zN6mLwHFWifOFHFCWMHvSB4B5F7BWBFeGVS01Nc=
X-Forefront-Antispam-Report: 
	CIP:192.25.218.41;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:edgeappmail.agilent.com;PTR:exch.smtp.agilent.com;CAT:NONE;SFS:(4636009)(346002)(376002)(396003)(39860400002)(136003)(29502001)(46966005)(82740400003)(7636003)(6666004)(316002)(8676002)(356005)(1076003)(5660300002)(36756003)(6916009)(47076004)(2616005)(426003)(956004)(44832011)(86362001)(8936002)(4326008)(83380400001)(36906005)(26005)(15650500001)(82310400003)(107886003)(70206006)(2906002)(336012)(478600001)(186003);DIR:OUT;SFP:1101;
X-OriginatorOrg: agilent.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 09 Sep 2020 20:51:39.0635
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 1329ce69-dc28-4711-e608-08d855022631
X-MS-Exchange-CrossTenant-Id: a9c0bc09-8b46-4206-9351-2ba12fb4a5c0
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=a9c0bc09-8b46-4206-9351-2ba12fb4a5c0;Ip=[192.25.218.41];Helo=[edgeappmail.agilent.com]
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: TreatMessagesAsInternal-BN8NAM12FT064.eop-nam12.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM6PR12MB4652
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

