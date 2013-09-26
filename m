Return-Path: <ross.burton@intel.com>
Received: from mail-wg0-f41.google.com (mail-wg0-f41.google.com [74.125.82.41])
	by mail.openembedded.org (Postfix) with ESMTP id 98EA16CA88
	for <openembedded-core@lists.openembedded.org>;
	Thu, 26 Sep 2013 15:11:37 +0000 (UTC)
Received: by mail-wg0-f41.google.com with SMTP id l18so6372098wgh.2
	for <openembedded-core@lists.openembedded.org>;
	Thu, 26 Sep 2013 08:11:38 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:from:to:subject:date:message-id;
	bh=5Xl1UWZ4R1KMTgOlpqaneTbSFeRNsj51RiEgYzOiHLo=;
	b=hMrFlwjtGQ6HxS/uiAIO9s1dd0C/4URRq2AqzcTh21mnyqzuuTgonuDU2gBZ7yKG4G
	nPkg55bKtpC6FtshNlxLG9H4Hf+2VMcHAWzSFxdZS+mf3nFfi/KteOM3HaGFFub8uHPs
	QPQWEtrm08reqeVosj6B9nYzWq0xOFPt93mVr82ukHkAf3sVEkAJVkt/tmP56z6PL7jD
	/Lg+8n3xvLVdVCkM+ELZMuym1vAhY+0v3P9YDS7Avvmr2W+OO7Npf2EnaWvVodx2+uU2
	1g0ZzfHaIUTvNbKxKsEfv+yxIGcb6yp2hh2Q/w/yzJoCULWUQGpwMfKFCxobgJIVG1Vt
	Juyg==
X-Gm-Message-State: ALoCoQmxGCFsqjJkHPgaA1JRTO/n9Frx/orvs1WYCyUmjpGpWgAHKd9H/srGG8S+56nIGVrx+Zdz
X-Received: by 10.180.89.206 with SMTP id bq14mr1278119wib.56.1380208298625;
	Thu, 26 Sep 2013 08:11:38 -0700 (PDT)
Received: from melchett.burtonini.com (35.106.2.81.in-addr.arpa. [81.2.106.35])
	by mx.google.com with ESMTPSA id jf2sm4363194wic.2.1969.12.31.16.00.00
	(version=TLSv1.2 cipher=ECDHE-RSA-RC4-SHA bits=128/128);
	Thu, 26 Sep 2013 08:11:37 -0700 (PDT)
From: Ross Burton <ross.burton@intel.com>
To: openembedded-core@lists.openembedded.org
Date: Thu, 26 Sep 2013 16:11:33 +0100
Message-Id: <1380208293-11112-1-git-send-email-ross.burton@intel.com>
X-Mailer: git-send-email 1.7.10.4
Subject: [PATCH] oe-init-build-env-memres: use shell instead of Python to show the port number
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
X-List-Received-Date: Thu, 26 Sep 2013 15:11:38 -0000

Signed-off-by: Ross Burton <ross.burton@intel.com>
---
 oe-init-build-env-memres |    2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/oe-init-build-env-memres b/oe-init-build-env-memres
index 15e4f44..dca819b 100755
--- a/oe-init-build-env-memres
+++ b/oe-init-build-env-memres
@@ -52,4 +52,4 @@ else
 fi
 bitbake --server-only -t xmlrpc -B localhost:$port
 export BBSERVER=localhost:$port
-echo "Bitbake server started on port %s, use bitbake -m to shut it down"
+echo "Bitbake server started on port $port, use bitbake -m to shut it down"
-- 
1.7.10.4


