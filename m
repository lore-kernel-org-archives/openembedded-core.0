Return-Path: <armccurdy@gmail.com>
Received: from mail-oi0-f66.google.com (mail-oi0-f66.google.com
	[209.85.218.66])
	by mail.openembedded.org (Postfix) with ESMTP id CD9E577156
	for <openembedded-core@lists.openembedded.org>;
	Thu, 28 Jan 2016 02:11:17 +0000 (UTC)
Received: by mail-oi0-f66.google.com with SMTP id r14so54127oie.2
	for <openembedded-core@lists.openembedded.org>;
	Wed, 27 Jan 2016 18:11:18 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=from:to:cc:subject:date:message-id;
	bh=BODkHv2mw6++WsVx3BjDM2Jt8V4IVArGxByNxcMylBg=;
	b=aM3kbBRXrZurX2197Y6oVJn9oYdyApviYTmsOfykuKZl7ANfJ3aSTJQ1znz6UvzHI4
	XtzY/JWxsq+hmEXEfHan4esMYaewOdyVrjS+w+pOFjvCpm2O2elIm6s9XIpTwJ+UxYpy
	GTeRt1t1kor4LUV4O7P829QJvPC7mVFDKgnmWHE4QGpkvVNj5wgJ+IoEkYpq/bhOJdxH
	BzGKVUuSqwYYiZrtocSGi1LKoN0I6pTkNc1hLSFT47XwHaHk3fxDDshwIoxFcd9iBs6V
	2bqNNjz4Gw0SEVeGPcvs1EtWkfdxOg4U+57xMI/ZYrD1mrTYCMl/Y0sOzQ1z1xlbEgrF
	5hug==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:from:to:cc:subject:date:message-id;
	bh=BODkHv2mw6++WsVx3BjDM2Jt8V4IVArGxByNxcMylBg=;
	b=B+7UTRm6KGYduTJrm3isIolsSjhnrmFf/0Tz/VFRBgVczzpMWSIcGmpZ2tmW+uyWiz
	RBYYu4lD5bLb1Npcin+MyEpN7HkkjHE7d90VMEhj7lQ6OnawCTrc6ylfZDHkJQ1frgbO
	XtHZMHTt17tVP4gGHc8bsze/2qgMi2lVmgNyVSpNQ0VxEBXiegj6OA3EApWtJJjmDIFS
	QTnqacJaKhklpMtWhtr26lTuvL+OBVc5+vhRpXhDHfZRaO7z9ddFxeNcBKRLcv+l9LqN
	eY7Y2HvxgXS8SznT6O3MNXDZ6q9xxQLJl43wHgm3Og1bWLVNx5/pT0Jh8ajijPCDFYMR
	bZCg==
X-Gm-Message-State: AG10YOTWsDtHVT4JrOlRyzWMmXMVPQCsP5d8psCjE4SFrxbyBmtpmZzI9czjyCSHUYXATg==
X-Received: by 10.202.195.18 with SMTP id t18mr332450oif.80.1453947078273;
	Wed, 27 Jan 2016 18:11:18 -0800 (PST)
Received: from e6520.cablelabs.com
	(50-204-102-64-static.hfc.comcastbusiness.net. [50.204.102.64])
	by smtp.gmail.com with ESMTPSA id q4sm4448874oew.6.2016.01.27.18.11.16
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
	Wed, 27 Jan 2016 18:11:17 -0800 (PST)
From: Andre McCurdy <armccurdy@gmail.com>
To: openembedded-core@lists.openembedded.org
Date: Wed, 27 Jan 2016 18:11:08 -0800
Message-Id: <1453947071-13364-1-git-send-email-armccurdy@gmail.com>
X-Mailer: git-send-email 1.9.1
Subject: [PATCH 0/3] stop exporting PATCH_GET = "0"
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
X-List-Received-Date: Thu, 28 Jan 2016 02:11:18 -0000

Andre McCurdy (3):
  bitbake.conf: stop exporting PATCH_GET = "0"
  gcc-cross.inc: drop pruning of PATCH_GET from the testgcc script
  glibc-testing.inc: drop pruning of PATCH_GET from the testglibc script

 meta/conf/bitbake.conf                    | 10 ----------
 meta/recipes-core/glibc/glibc-testing.inc |  1 -
 meta/recipes-devtools/gcc/gcc-cross.inc   |  1 -
 3 files changed, 12 deletions(-)

-- 
1.9.1


