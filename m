Return-Path: <armccurdy@gmail.com>
Received: from mail-pg0-f46.google.com (mail-pg0-f46.google.com [74.125.83.46])
	by mail.openembedded.org (Postfix) with ESMTP id BC61278277
	for <openembedded-core@lists.openembedded.org>;
	Fri,  8 Sep 2017 23:22:21 +0000 (UTC)
Received: by mail-pg0-f46.google.com with SMTP id v66so7028101pgb.5
	for <openembedded-core@lists.openembedded.org>;
	Fri, 08 Sep 2017 16:22:23 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=from:to:cc:subject:date:message-id:in-reply-to:references;
	bh=Bz302jxKBYK5wYIExbYVkHjQRWrVe96ZvFkS0akAs3o=;
	b=NmwkO+d1r7obUt8RMVv/jjTig+a2e81+NIPZGFrY6zPcEop/lmHphnF/4EfE491sRu
	B0Hu6XF/qo8WgNaDoLC2S5/tkFSyGIv7SlcjccYuzfH8ZjoqRuBvlXtFvn4XsF4Y6lMl
	WJFUFmurZOtBVPk0p93KnDSyOb4iMcILMxF+CORJMtrl4OU/euTiWgPkTCiFDx5qLn41
	mTNjUGo/u3NgLmrmGTtQFjyKbZU3xsBpdqUFVT2CbEJypktK2pYeZZOjeMFRKNzyBBi4
	feVXFji5Jyn/iXJKBBzoPIAPam2DoUYohnjPXmhTux2wcK4pQIBc/gFclM/29pmAglbh
	mUIA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
	:references;
	bh=Bz302jxKBYK5wYIExbYVkHjQRWrVe96ZvFkS0akAs3o=;
	b=VX3IjKtdsHapHXn1sZ+4/jkzk0Hk/5vbgR3NvSxBE4gx8Y5g1it4Al4Nw/Gxq3A9WU
	LJGVclhh9yk6y2TEsfozksJ/b1bXAPtVglL1ivtvsDFSJdEzSiTZZbHzNIfor8y5lWMb
	xGaWsp8OntAROuP5vRYzEfoSOSoxKFUQCoXKeAn4dxGHj8gYvWJElLGL0WzEALaMMqQe
	diTowSGW9HwfbYgGoVrbiRTpXKuNPn4kTz6EsaK9rnG17K+g9UP2N8dgnyiZjav5xOZT
	kTEhYH9Mb2JNOP9RCIA0hhDUbi68dwEE0WlOemuGbaRzY04dmsdnY3+Lp4cxFKQAW6oP
	LsMw==
X-Gm-Message-State: AHPjjUgWXT2FHUMSUwIvRlWiTFucDtKIZbO7SFl315quMbJfjssupBxW
	0XnZz7Z5RAwEFCiV
X-Google-Smtp-Source: ADKCNb4hd3Qx3qaXpa9gW/f4YdLSwMSs5vENf29bteNnCF+z8abLUWltU5ZLCtr9vS6BDEOs8HzRCg==
X-Received: by 10.99.60.13 with SMTP id j13mr4556212pga.384.1504912942598;
	Fri, 08 Sep 2017 16:22:22 -0700 (PDT)
Received: from e6520.cablelabs.com ([4.16.80.121])
	by smtp.gmail.com with ESMTPSA id
	q13sm5510822pfi.110.2017.09.08.16.22.21
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
	Fri, 08 Sep 2017 16:22:21 -0700 (PDT)
From: Andre McCurdy <armccurdy@gmail.com>
To: openembedded-core@lists.openembedded.org
Date: Fri,  8 Sep 2017 16:21:43 -0700
Message-Id: <1504912911-23120-8-git-send-email-armccurdy@gmail.com>
X-Mailer: git-send-email 1.9.1
In-Reply-To: <1504912911-23120-1-git-send-email-armccurdy@gmail.com>
References: <1504912911-23120-1-git-send-email-armccurdy@gmail.com>
Subject: [daisy][PATCH 07/15] ossp-uuid: update SRC_URI to not use Google Code
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
X-List-Received-Date: Fri, 08 Sep 2017 23:22:22 -0000

From: Alexander Kanavin <alexander.kanavin@linux.intel.com>

Google Code is shutting down so tarballs will be fetched from a Debian mirror
instead

Signed-off-by: Alexander Kanavin <alexander.kanavin@linux.intel.com>
Signed-off-by: Ross Burton <ross.burton@intel.com>
(cherry picked from commit 779c53911da663f06437e8a06c9a8c361d614fe6)
Signed-off-by: Andre McCurdy <armccurdy@gmail.com>
---
 meta/recipes-devtools/ossp-uuid/ossp-uuid_1.6.2.bb | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta/recipes-devtools/ossp-uuid/ossp-uuid_1.6.2.bb b/meta/recipes-devtools/ossp-uuid/ossp-uuid_1.6.2.bb
index f524854..e77be99 100644
--- a/meta/recipes-devtools/ossp-uuid/ossp-uuid_1.6.2.bb
+++ b/meta/recipes-devtools/ossp-uuid/ossp-uuid_1.6.2.bb
@@ -17,7 +17,7 @@ LIC_FILES_CHKSUM = "file://README;beginline=30;endline=55;md5=b394fadb039bbfca6a
 
 PR = "r2"
 
-SRC_URI = "http://gnome-build-stage-1.googlecode.com/files/uuid-1.6.2.tar.gz \
+SRC_URI = "${DEBIAN_MIRROR}/main/o/${BPN}/${BPN}_${PV}.orig.tar.gz \
 	   file://0001-Change-library-name.patch \
 	   file://0002-uuid-preserve-m-option-status-in-v-option-handling.patch \
 	   file://0003-Fix-whatis-entries.patch \
-- 
1.9.1


