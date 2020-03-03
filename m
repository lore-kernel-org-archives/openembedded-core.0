Return-Path: <wallinux@gmail.com>
Received: from mail-lf1-f54.google.com (mail-lf1-f54.google.com
	[209.85.167.54])
	by mail.openembedded.org (Postfix) with ESMTP id 4EDD961890
	for <openembedded-core@lists.openembedded.org>;
	Tue,  3 Mar 2020 15:54:27 +0000 (UTC)
Received: by mail-lf1-f54.google.com with SMTP id s1so3207235lfd.3
	for <openembedded-core@lists.openembedded.org>;
	Tue, 03 Mar 2020 07:54:28 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=from:to:cc:subject:date:message-id:mime-version
	:content-transfer-encoding;
	bh=ZHEnHOSsck0+I7tUovZPilxsC5xWYeBbFlmQbLjJ7lE=;
	b=MU5NMg1MMjDPkh+Es84EP+mKhaj0vKvGXoYAydk/yVoz6fCSuoKpJ4CbQYvUzmz/8R
	mSMFdogWmCXRBPREGxoJUwTP1b8iQKSmMd3Uuk3OgDodNY0s3sllYc4+DZo4qgzep4S5
	Rs44ZOr20JVhtBGT0+lfLXaY+DDbTeq1F1sQs2YUmENuRsVq2/xTMaMFhzfJZK0K+l54
	p7hnS6GR09yZEX6g+CDTBx/iIgKwP7IVp+HjCQXOpqP6AzEpz+GHb9yAHbGWFcpiCZHy
	k2zBjqqjHf2wctGAdXS3Y1wPMzQbAub7SPA8fLZxkj8reR7EKXjWxQuN0rVvWTYu+PZ+
	dSCg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
	:content-transfer-encoding;
	bh=ZHEnHOSsck0+I7tUovZPilxsC5xWYeBbFlmQbLjJ7lE=;
	b=ZdHFMtbTdLmT7ByC2yGCRkUkXPdP+CkEWHQ4UGX5KgDIk3vgi/3NDoqDDhcq4B6J4j
	1aAFSDExr/EoG2qG5yMFxvua8+mvQtu1cDUxXlMjxTjauwpwvvDLelj9bHbhfaSitrUB
	2BYlWKKi42gDT06RtkO6JIAw7ELOS8tnDmWp3onkeIQ18PVZ0BNS/fgiL0X5nzXwiYJd
	lU6ajuYvNp/4MD2p3xHv/zfGA3G2Wg1J/ECaDppksfs0VRrWTOwsHhqokN8RJxNUd0a1
	Kjdf8NkhQ+mvg/Z/A5s64oezNGK8Wxa2ShuENewrU29JqDblaPF29M3vNxA9XL80kRea
	upmw==
X-Gm-Message-State: ANhLgQ1GEMxQzhU6oMVi2YuLxbmSUsREf3Jpr1ADna+a/UnaLOjBY5EO
	zLShd1sl8vXk110LyBBYEDcyznY8eqI=
X-Google-Smtp-Source: ADFU+vs/Vuh/e32SOFJ0mPddeiqs6Nd4hK6msAFfL1UB8MlIhau09kx1I7RXTz+mhVlgsmnS4SSWoA==
X-Received: by 2002:ac2:4c39:: with SMTP id u25mr3080297lfq.195.1583250867545; 
	Tue, 03 Mar 2020 07:54:27 -0800 (PST)
Received: from arn-awallin-linux-l5.corp.ad.wrs.com
	(h-155-4-243-131.NA.cust.bahnhof.se. [155.4.243.131])
	by smtp.gmail.com with ESMTPSA id
	n26sm11017642lfi.5.2020.03.03.07.54.26
	(version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
	Tue, 03 Mar 2020 07:54:26 -0800 (PST)
From: Anders Wallin <wallinux@gmail.com>
To: openembedded-core@lists.openembedded.org
Date: Tue,  3 Mar 2020 16:54:20 +0100
Message-Id: <20200303155420.24684-1-wallinux@gmail.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Subject: [PATCH v2] babeltrace: only check latest git tag version for 1.x.x
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
X-List-Received-Date: Tue, 03 Mar 2020 15:54:27 -0000
Content-Transfer-Encoding: 8bit

version 2.x.x will be added with a new babeltrace2 recipe

Signed-off-by: Anders Wallin <wallinux@gmail.com>
---
 meta/recipes-kernel/lttng/babeltrace_1.5.8.bb | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta/recipes-kernel/lttng/babeltrace_1.5.8.bb b/meta/recipes-kernel/lttng/babeltrace_1.5.8.bb
index c050dc674d..4d2492a170 100644
--- a/meta/recipes-kernel/lttng/babeltrace_1.5.8.bb
+++ b/meta/recipes-kernel/lttng/babeltrace_1.5.8.bb
@@ -11,7 +11,7 @@ SRC_URI = "git://git.linuxfoundation.org/diamon/babeltrace.git;branch=stable-1.5
 	   file://run-ptest \
 	  "
 SRCREV = "054a54ae10b01a271afc4f19496c041b10fb414c"
-UPSTREAM_CHECK_GITTAGREGEX = "v(?P<pver>\d+(\.\d+)+)$"
+UPSTREAM_CHECK_GITTAGREGEX = "v(?P<pver>1(\.\d+)+)$"
 
 S = "${WORKDIR}/git"
 
-- 
2.25.1


