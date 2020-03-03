Return-Path: <wallinux@gmail.com>
Received: from mail-lf1-f44.google.com (mail-lf1-f44.google.com
	[209.85.167.44])
	by mail.openembedded.org (Postfix) with ESMTP id EC92661901
	for <openembedded-core@lists.openembedded.org>;
	Tue,  3 Mar 2020 07:52:02 +0000 (UTC)
Received: by mail-lf1-f44.google.com with SMTP id c20so1897573lfb.0
	for <openembedded-core@lists.openembedded.org>;
	Mon, 02 Mar 2020 23:52:04 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=from:to:cc:subject:date:message-id:mime-version
	:content-transfer-encoding;
	bh=5GSAMfRM1db/GhAMmaiCu1zd1aX0G/+pDobf/wUgbBI=;
	b=nAN+eSf9/Th/BAf7Sdf1IcGxGvs912j7wkHaFGE/296bnQTRXcK1jQPZOgTLWJhjbU
	tcQ8N0a2wOK6eVXhJyuyzf5HRY8YRbu1j/MsI27K8qsMW4QDdorvr+7U8SKC5fN00GuX
	7HKSigan2yIDL00F5gkdH1N07l+68wZCVPG2SGInj0C5TAdnE1U/Zt+tpHX2sswsMpvR
	JPmSaRzTyR1lpRbP+csV0+fUJHmFv2LCBo2DvJVjAro7g8rCrkmq7RC3zjK9LouhGnXH
	kdXVziDkIvzSNLnCSdv6XR3ksEPxB4Li2kvTyi54ESDID9Go8UnEcGuO7FUAymD8HOqU
	lfag==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
	:content-transfer-encoding;
	bh=5GSAMfRM1db/GhAMmaiCu1zd1aX0G/+pDobf/wUgbBI=;
	b=qUaIacahI0C9/kmJzHj0omqEzpSG8FJCWPz65Z5GmnazCkDEKZFHotZR9EgfXN/v3R
	QNr0P1Vxo9idqs0Uty1CWUDPPXuUmrOJB6MjZo3l82ziWc8c4rhAnB3p3dUmMmM7A0pz
	raJmdbxQLsdzs+AxHbzZJGx5HbIFnK2st3J2MBAuqLMVPPt9B2sDWKCw4yoQxcS3v7qT
	bVfbuHxvHOxg2Ry1raVexCuC8iJK0cq6gn1OgdspZ1AcqHbnUEty4V9igp3h5blOzAJn
	2z/AUbxqLWCZHheZc9amn9SdwYQaqNyHUr9HwqzrKAjM18wnaMBPWiiZpno8SUIgnS7w
	0lQw==
X-Gm-Message-State: ANhLgQ1+Kpybk2gX/eQARaNkvF65kLVFWpSkwV9YkvWFFIiPzjWFYTIr
	dhofsuBTZRhv5wfLM89KYOvjXIOjCag=
X-Google-Smtp-Source: ADFU+vs27XDs3zUEw7tgtIB9TA2BID+vjmKFSJXbPKYWSs8Ybn+HtqPy+Ak0Ntbptk5tQ1yc10tEOg==
X-Received: by 2002:ac2:58ee:: with SMTP id v14mr84283lfo.62.1583221923140;
	Mon, 02 Mar 2020 23:52:03 -0800 (PST)
Received: from arn-awallin-linux-l5.corp.ad.wrs.com
	(h-155-4-243-131.NA.cust.bahnhof.se. [155.4.243.131])
	by smtp.gmail.com with ESMTPSA id n21sm5275089lfh.2.2020.03.02.23.52.02
	(version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
	Mon, 02 Mar 2020 23:52:02 -0800 (PST)
From: Anders Wallin <wallinux@gmail.com>
To: openembedded-core@lists.openembedded.org
Date: Tue,  3 Mar 2020 08:51:32 +0100
Message-Id: <20200303075132.25849-1-wallinux@gmail.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Subject: [PATCH] babeltrace: only check latest git tag version for 1.x.x
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
X-List-Received-Date: Tue, 03 Mar 2020 07:52:03 -0000
Content-Transfer-Encoding: 8bit

version 2.x.x will be added with a new babeltrace2 recipe

Signed-off-by: Anders Wallin <wallinux@gmail.com>
---
 meta/recipes-kernel/lttng/babeltrace_1.5.8.bb | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta/recipes-kernel/lttng/babeltrace_1.5.8.bb b/meta/recipes-kernel/lttng/babeltrace_1.5.8.bb
index c050dc674d..3268c5de9c 100644
--- a/meta/recipes-kernel/lttng/babeltrace_1.5.8.bb
+++ b/meta/recipes-kernel/lttng/babeltrace_1.5.8.bb
@@ -11,7 +11,7 @@ SRC_URI = "git://git.linuxfoundation.org/diamon/babeltrace.git;branch=stable-1.5
 	   file://run-ptest \
 	  "
 SRCREV = "054a54ae10b01a271afc4f19496c041b10fb414c"
-UPSTREAM_CHECK_GITTAGREGEX = "v(?P<pver>\d+(\.\d+)+)$"
+UPSTREAM_CHECK_GITTAGREGEX = "v(?P<pver>1+(\.\d+)+)$"
 
 S = "${WORKDIR}/git"
 
-- 
2.25.1


