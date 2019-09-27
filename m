Return-Path: <jpewhacker@gmail.com>
Received: from mail-io1-f68.google.com (mail-io1-f68.google.com
	[209.85.166.68])
	by mail.openembedded.org (Postfix) with ESMTP id E7E847E544
	for <openembedded-core@lists.openembedded.org>;
	Fri, 27 Sep 2019 19:59:27 +0000 (UTC)
Received: by mail-io1-f68.google.com with SMTP id z19so19579679ior.0
	for <openembedded-core@lists.openembedded.org>;
	Fri, 27 Sep 2019 12:59:29 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=from:to:cc:subject:date:message-id:mime-version
	:content-transfer-encoding;
	bh=99pWJYG9aIv2TDq/3zfaYP9q+zAQM3VF4ykn5H8buaA=;
	b=iM8UdiXavS/cnfemgiBFNbm0ScrzKM0ZkH6XeyFlNWj8JRvHPCAuP5d0V6AF599wv7
	p9ly1jmoNMxnbnDX6Dp2FIFCUVlVWeoiC7+WKgBoJNbIXjQOlDdbd1B5qlGDggu/Elyj
	O14b0CZFOnafiDdET6AOvgaQh+hJR4ERHbUDpACysDH6tMZEMeLxVaI2FuDsH/GvZZ3G
	uroqjFCJ5K9Vp0RAnm9pEZByL5s8zMzP2+6yNtHtZquyHECs9k3pN43tNWc79E2KvbBo
	YRo65HbNiuPk+USsvlSnMuMsXlplbZuEJTN7plUTSq5/CWhesyOpj9qvrKpRV6d/tZMK
	e1HQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
	:content-transfer-encoding;
	bh=99pWJYG9aIv2TDq/3zfaYP9q+zAQM3VF4ykn5H8buaA=;
	b=F1CrFv3lPPuTwGZEdm7Rc/TmApqAwU84b95cwer4NqvpvY1d0Eg8wNhjn7Va0HJmj0
	/t37tbZJRU6YTTaRDETNtU6UK8VRIeH2alq4M1V5Ob+p+PLp2OStqNwWqoNEGLNU64z4
	Pc1rVw/n15fsmM/xyxsbB+EIyFbJkrtsIa7FSVLOTrZrDcHJla0LoPY7KWo4T4mKyPkj
	lwUWm2fDjZvLbhINAWv01faKDtC1fU9MT0aeJuIzH39KN2Wj9Vbfl8imNnqWVFGcaqHB
	agoEnMFJfjvZ9sqxGBQbWkuY3XlFqxw5Jcr3X8mWJyj1u5Vb/Ey5Uym92iYJ07NIgOKQ
	4MRg==
X-Gm-Message-State: APjAAAVkJyKVpYV2zzePKqJyRyFJmHG54EhR4KL0+ojsN51xjS7eAK0B
	NG+x3qimrb6//dtjXoZhvZo96HDY
X-Google-Smtp-Source: APXvYqwcIcXC3Oa8h9kyQRO9idFFADLi1jOh2zXfLrYH6Ok4BM6FJa7m2EbtubTT5+zdAEVLROMR5g==
X-Received: by 2002:a5d:9e08:: with SMTP id h8mr9828669ioh.274.1569614368506; 
	Fri, 27 Sep 2019 12:59:28 -0700 (PDT)
Received: from ola-842mrw1.ad.garmin.com ([204.77.163.55])
	by smtp.gmail.com with ESMTPSA id
	l19sm1887662ild.33.2019.09.27.12.59.27
	(version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
	Fri, 27 Sep 2019 12:59:27 -0700 (PDT)
From: Joshua Watt <jpewhacker@gmail.com>
X-Google-Original-From: Joshua Watt <JPEWhacker@gmail.com>
To: openembedded-core@lists.openembedded.org
Date: Fri, 27 Sep 2019 14:59:23 -0500
Message-Id: <20190927195923.31454-1-JPEWhacker@gmail.com>
X-Mailer: git-send-email 2.21.0
MIME-Version: 1.0
Subject: [PATCH] classes/reproducible_build: Create SDE destination
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
X-List-Received-Date: Fri, 27 Sep 2019 19:59:28 -0000
Content-Transfer-Encoding: 8bit

Creates the source data epoch file destination directory when restoring
from sstate

Signed-off-by: Joshua Watt <JPEWhacker@gmail.com>
---
 meta/classes/reproducible_build.bbclass | 1 +
 1 file changed, 1 insertion(+)

diff --git a/meta/classes/reproducible_build.bbclass b/meta/classes/reproducible_build.bbclass
index 99b749a9ee2..39b6e40cacc 100644
--- a/meta/classes/reproducible_build.bbclass
+++ b/meta/classes/reproducible_build.bbclass
@@ -53,6 +53,7 @@ do_deploy_source_date_epoch () {
 
 python do_deploy_source_date_epoch_setscene () {
     sstate_setscene(d)
+    bb.utils.mkdirhier(d.getVar('SDE_DIR'))
     sde_file = os.path.join(d.getVar('SDE_DEPLOYDIR'), '__source_date_epoch.txt')
     if os.path.exists(sde_file):
         os.rename(sde_file, d.getVar('SDE_FILE'))
-- 
2.21.0


