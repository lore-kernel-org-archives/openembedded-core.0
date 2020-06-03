Received: from huawei.com (huawei.com [45.249.212.191])
 by mx.groups.io with SMTP id smtpd.web12.8748.1591169931402021817
 for <openembedded-core@lists.openembedded.org>;
 Wed, 03 Jun 2020 00:38:51 -0700
Authentication-Results: mx.groups.io;
 dkim=missing; spf=pass (domain: huawei.com, ip: 45.249.212.191, mailfrom: zhengjunling@huawei.com)
Received: from DGGEMS403-HUB.china.huawei.com (unknown [172.30.72.59])
	by Forcepoint Email with ESMTP id 3591231A4C1592615D31
	for <openembedded-core@lists.openembedded.org>; Wed,  3 Jun 2020 15:38:48 +0800 (CST)
Received: from HULK-Android.huawei.com (10.113.189.218) by
 DGGEMS403-HUB.china.huawei.com (10.3.19.203) with Microsoft SMTP Server id
 14.3.487.0; Wed, 3 Jun 2020 15:38:38 +0800
From: "Junling Zheng" <zhengjunling@huawei.com>
To: <openembedded-core@lists.openembedded.org>
CC: <fanyiming@huawei.com>
Subject: [OE-core] [PATCH 1/2] buildstats.bbclass: Remove useless variables
Date: Wed, 3 Jun 2020 15:38:27 +0800
Message-ID: <20200603073828.7704-1-zhengjunling@huawei.com>
X-Mailer: git-send-email 2.17.1
MIME-Version: 1.0
X-Originating-IP: [10.113.189.218]
X-CFilter-Loop: Reflected
Content-Type: text/plain

Remove useless variables bn and bsdir in write_task_data().

Signed-off-by: Junling Zheng <zhengjunling@huawei.com>
---
 meta/classes/buildstats.bbclass | 2 --
 1 file changed, 2 deletions(-)

diff --git a/meta/classes/buildstats.bbclass b/meta/classes/buildstats.bbclass
index 2590c60c63..e7d47c74df 100644
--- a/meta/classes/buildstats.bbclass
+++ b/meta/classes/buildstats.bbclass
@@ -80,8 +80,6 @@ def get_buildtimedata(var, d):
     return timediff, cpuperc
 
 def write_task_data(status, logfile, e, d):
-    bn = d.getVar('BUILDNAME')
-    bsdir = os.path.join(d.getVar('BUILDSTATS_BASE'), bn)
     with open(os.path.join(logfile), "a") as f:
         elapsedtime = get_timedata("__timedata_task", d, e.time)
         if elapsedtime:
-- 
2.17.1

