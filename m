Return-Path: <ross.burton@intel.com>
Received: from mail-wm0-f42.google.com (mail-wm0-f42.google.com [74.125.82.42])
	by mail.openembedded.org (Postfix) with ESMTP id 468807899F
	for <openembedded-core@lists.openembedded.org>;
	Tue, 17 Jul 2018 16:39:29 +0000 (UTC)
Received: by mail-wm0-f42.google.com with SMTP id f21-v6so18996wmc.5
	for <openembedded-core@lists.openembedded.org>;
	Tue, 17 Jul 2018 09:39:30 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=intel-com.20150623.gappssmtp.com; s=20150623;
	h=from:to:subject:date:message-id:in-reply-to:references;
	bh=aR6j8Zr9OQfsrWvFJwq7aO7LUAbLGMIjlJoA1h54UyE=;
	b=XI8e8Z4YFwCKIUiQC2dbrQSRG2dhjSd8lWJPtZuLUZPjFSzPCuwEDQGjoEQ+So7/KD
	g0aoxg5LD8FVzpZhpxmZWjcHVlZq+XY1q5cOqGa5yJecoiuyuqnpOdrA0EgQw+BcntI/
	xJDYgnxKMQu8J4dJb+digYSjpGNw3G+V/clWdhbtjk9zK3IuhGsJzLxFZqIQqei90iNM
	mVhv1vBlgDQNih7Aj+ScQrFVaVJrtS81xgZbH99pCdWDnwWp5dkFrVyIW6srDJ8xBKpF
	pSLStDIF86wojTvtkqV+80ZB+9kZ2SvjK+LNDkl/kcoXb0/H0tO0DUqSRWBoDz7PT2EV
	FtCg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
	:references;
	bh=aR6j8Zr9OQfsrWvFJwq7aO7LUAbLGMIjlJoA1h54UyE=;
	b=GL69TDjpSvJrO7QJ7+UgcK7s8cbr2agsO009Ie/NUXjpH9qF2pkrQLmSkg/cKDv9U4
	JDIrtfhXlr45MlGWNgWAxqZj5kElEOiHlwA492ThRXNYMKRlKA3SDWsGND/+i/AcM11R
	6DJ3aBGcxosnp5HOsT4e15ZZXE0BB7MN7AvqiycxaOLfN+mv91KsMbr2X/QfF2b8EDtz
	DNk6hph7pp5qppcSh8FVbUa+IRhS6Twb0P4OTUBOXQRViG9R2NHNmG7U+OIXLd03dgsY
	afBhK2s5k2jK427zujU3NKtnY4an2dFDxIvtjr60dt36VO0XEZeMUiYHSCqhihUeHJsh
	qf4g==
X-Gm-Message-State: AOUpUlEzVxj0Ztyw1YtRvzplpcl0/wczpO/Lx/FX8+xZoUnzEYg4mV5H
	Q9yjUprPzMdBkJOt4UJXMF3DavVp
X-Google-Smtp-Source: AAOMgpdX43Dyw234dNpYllK3/40auU4h21yEhL4aNOC1cRLCl01DVP8scgN/HlNieLumCVH1iclfZg==
X-Received: by 2002:a1c:c1c8:: with SMTP id
	r191-v6mr1757470wmf.103.1531845569777; 
	Tue, 17 Jul 2018 09:39:29 -0700 (PDT)
Received: from flashheart.burtonini.com (35.106.2.81.in-addr.arpa.
	[81.2.106.35]) by smtp.gmail.com with ESMTPSA id
	i125-v6sm15958wmd.11.2018.07.17.09.39.28
	for <openembedded-core@lists.openembedded.org>
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Tue, 17 Jul 2018 09:39:28 -0700 (PDT)
From: Ross Burton <ross.burton@intel.com>
To: openembedded-core@lists.openembedded.org
Date: Tue, 17 Jul 2018 17:39:08 +0100
Message-Id: <20180717163910.3196-13-ross.burton@intel.com>
X-Mailer: git-send-email 2.11.0
In-Reply-To: <20180717163910.3196-1-ross.burton@intel.com>
References: <20180717163910.3196-1-ross.burton@intel.com>
Subject: [PATCH 13/15] shared-mime-info: upgrade 1.9 -> 1.10
X-BeenThere: openembedded-core@lists.openembedded.org
X-Mailman-Version: 2.1.12
Precedence: list
List-Id: Patches and discussions about the oe-core layer
	<openembedded-core.lists.openembedded.org>
List-Unsubscribe: <http://lists.openembedded.org/mailman/options/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.openembedded.org/pipermail/openembedded-core/>
List-Post: <mailto:openembedded-core@lists.openembedded.org>
List-Help: <mailto:openembedded-core-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.openembedded.org/mailman/listinfo/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Tue, 17 Jul 2018 16:39:29 -0000

Signed-off-by: Ross Burton <ross.burton@intel.com>
---
 meta/recipes-support/shared-mime-info/shared-mime-info_1.10.bb | 7 +++++++
 meta/recipes-support/shared-mime-info/shared-mime-info_1.9.bb  | 7 -------
 2 files changed, 7 insertions(+), 7 deletions(-)
 create mode 100644 meta/recipes-support/shared-mime-info/shared-mime-info_1.10.bb
 delete mode 100644 meta/recipes-support/shared-mime-info/shared-mime-info_1.9.bb

diff --git a/meta/recipes-support/shared-mime-info/shared-mime-info_1.10.bb b/meta/recipes-support/shared-mime-info/shared-mime-info_1.10.bb
new file mode 100644
index 00000000000..9fc210b718d
--- /dev/null
+++ b/meta/recipes-support/shared-mime-info/shared-mime-info_1.10.bb
@@ -0,0 +1,7 @@
+require shared-mime-info.inc
+
+SRC_URI += "file://parallelmake.patch \
+	    file://install-data-hook.patch"
+
+SRC_URI[md5sum] = "418c2ced9dc4dd5ca8b06a755e6d64e9"
+SRC_URI[sha256sum] = "c625a83b4838befc8cafcd54e3619946515d9e44d63d61c4adf7f5513ddfbebf"
diff --git a/meta/recipes-support/shared-mime-info/shared-mime-info_1.9.bb b/meta/recipes-support/shared-mime-info/shared-mime-info_1.9.bb
deleted file mode 100644
index f9b273edc6b..00000000000
--- a/meta/recipes-support/shared-mime-info/shared-mime-info_1.9.bb
+++ /dev/null
@@ -1,7 +0,0 @@
-require shared-mime-info.inc
-
-SRC_URI += "file://parallelmake.patch \
-	    file://install-data-hook.patch"
-
-SRC_URI[md5sum] = "45103889b91242850aa47f09325e798b"
-SRC_URI[sha256sum] = "5c0133ec4e228e41bdf52f726d271a2d821499c2ab97afd3aa3d6cf43efcdc83"
-- 
2.11.0


