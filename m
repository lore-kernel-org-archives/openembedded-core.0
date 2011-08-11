Received: from mail-yx0-f175.google.com ([209.85.213.175])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <kergoth@gmail.com>) id 1Qra0n-0005l6-BS
	for openembedded-core@lists.openembedded.org;
	Thu, 11 Aug 2011 20:29:45 +0200
Received: by yxi19 with SMTP id 19so1518839yxi.6
	for <openembedded-core@lists.openembedded.org>;
	Thu, 11 Aug 2011 11:25:10 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=from:to:cc:subject:date:message-id:x-mailer:in-reply-to:references
	:in-reply-to:references;
	bh=/bdYX/v6zHSNiDW2o6rDT8ZV0TyZPbUzeyx3+Lo0GgM=;
	b=fuAwk0bR+Jy1Pt5n5RDJB+cB0jjlCjvBZUUKDOcIks6pzRoOcO1Vos7s86iqhvA5aa
	GV26XQQEEk1nKOSWMUJ4yEfn1+eKlmGvVe00A9yUvt6G8eKrtefWq/+K2whVLS4UMLx7
	RnGIwVEHbEEl8YnYrMUbEy+DxkwKkP2Yp4i1I=
Received: by 10.150.206.18 with SMTP id d18mr917356ybg.352.1313087109981;
	Thu, 11 Aug 2011 11:25:09 -0700 (PDT)
Received: from localhost.localdomain (ip24-251-173-232.ph.ph.cox.net
	[24.251.173.232])
	by mx.google.com with ESMTPS id f5sm1281063ybd.13.2011.08.11.11.25.08
	(version=TLSv1/SSLv3 cipher=OTHER);
	Thu, 11 Aug 2011 11:25:09 -0700 (PDT)
From: Christopher Larson <kergoth@gmail.com>
To: openembedded-core@lists.openembedded.org
Date: Thu, 11 Aug 2011 11:23:49 -0700
Message-Id: <e8979401170f366258b23f8cd9ff85bc468aadf0.1313086806.git.chris_larson@mentor.com>
X-Mailer: git-send-email 1.7.4.1
In-Reply-To: <cover.1313086806.git.chris_larson@mentor.com>
References: <cover.1313086806.git.chris_larson@mentor.com>
In-Reply-To: <cover.1313086806.git.chris_larson@mentor.com>
References: <cover.1313086806.git.chris_larson@mentor.com>
Cc: Chris Larson <chris_larson@mentor.com>
Subject: [PATCH 2/7] insane: add linux-gnu to the platform data
X-BeenThere: openembedded-core@lists.openembedded.org
X-Mailman-Version: 2.1.11
Precedence: list
Reply-To: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
List-Id: Patches and discussions about the oe-core layer
	<openembedded-core.lists.openembedded.org>
List-Unsubscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/options/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.linuxtogo.org/pipermail/openembedded-core>
List-Post: <mailto:openembedded-core@lists.openembedded.org>
List-Help: <mailto:openembedded-core-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Thu, 11 Aug 2011 18:29:45 -0000

From: Chris Larson <chris_larson@mentor.com>

Signed-off-by: Chris Larson <chris_larson@mentor.com>
---
 meta/classes/insane.bbclass |    3 +++
 1 files changed, 3 insertions(+), 0 deletions(-)

diff --git a/meta/classes/insane.bbclass b/meta/classes/insane.bbclass
index 0267fad..a660a06 100644
--- a/meta/classes/insane.bbclass
+++ b/meta/classes/insane.bbclass
@@ -80,6 +80,9 @@ def package_qa_get_machine_dict():
                         "arm" :       (40,     0,    0,          True,          32),
                         "armeb" :     (40,     0,    0,          False,         32),
                       },
+            "linux-gnu" : {
+                        "powerpc":    (20,     0,    0,          False,         32),
+                      },
             "linux-gnuspe" : {
                         "powerpc":    (20,     0,    0,          False,         32),
                       },
-- 
1.7.4.1



