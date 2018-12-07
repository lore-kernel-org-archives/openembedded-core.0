Return-Path: <richard.purdie@linuxfoundation.org>
Received: from mail-wm1-f54.google.com (mail-wm1-f54.google.com
	[209.85.128.54])
	by mail.openembedded.org (Postfix) with ESMTP id 0B8776D1AC
	for <openembedded-core@lists.openembedded.org>;
	Fri,  7 Dec 2018 12:06:06 +0000 (UTC)
Received: by mail-wm1-f54.google.com with SMTP id s14so4180120wmh.1
	for <openembedded-core@lists.openembedded.org>;
	Fri, 07 Dec 2018 04:06:08 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=linuxfoundation.org; s=google;
	h=from:to:subject:date:message-id:mime-version
	:content-transfer-encoding;
	bh=xwy710QkvNCtamy6dlFE2UeccEVcisYGbKsOB5wPYkk=;
	b=E8BdNwKeDeGsuR3LfIxKDlqPD4e5aTOVkmNIM7USjliNanFRT9g3uTEknBqMWRcNM2
	TOlFM7dCvR7CISqe4ZaxV8QhUK2dydxHYsF5oqNL4wv4ofPgmRoBYnSyMVec1Y/fEL55
	SpTintp/+gG7wbuOvvHTOuvtn2ln2DYz0pr+8=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:subject:date:message-id:mime-version
	:content-transfer-encoding;
	bh=xwy710QkvNCtamy6dlFE2UeccEVcisYGbKsOB5wPYkk=;
	b=WucTHFM6/09t006cUGeshhvlKONVkg8pa89YfAcE9rj5f9bq/lKqUgMpFxiyDowxo/
	QOIL/iL8/iPWCKqatXiB/QtXLJu/KdwTITncgvNCJUYmY4qUm9o/BRN19CQxEbYsN52x
	CXLRy8eIN8WKkUvJArHtIdZH2/ACzyc4wZNROePIli0Qru4g5emsKm7RAgr3cABvtDn6
	n/dno9TVmmH2vr06SQ9CakSLpGRPl9P92cY52O7L2k5tYKapwU7YMcU8b4GS3VumHRdW
	Gjyfoq401mGMGQK9L7aMlifa0tTi5qliOkTyT7pLJGEofF2R82RiCi38QfAU2h2CSvQR
	pHZw==
X-Gm-Message-State: AA+aEWbwG564NRGXdGPfHCDtZTA2hfamjkq6aTbSeHwQGCWnakf8axgp
	qbMHNNCaBsNPIAUdBW9WANS1286o/EY=
X-Google-Smtp-Source: AFSGD/WOlRVfSf/Qffrm5oC7AYtslB5J81UFhq1kP+QAQU3S55AQCNShqC1bhyGWBGJcXZ8IP+vItw==
X-Received: by 2002:a1c:cc2:: with SMTP id 185mr2074671wmm.1.1544184367349;
	Fri, 07 Dec 2018 04:06:07 -0800 (PST)
Received: from hex.int.rpsys.net (5751f4a1.skybroadband.com. [87.81.244.161])
	by smtp.gmail.com with ESMTPSA id
	y9sm2818574wrq.55.2018.12.07.04.06.06
	for <openembedded-core@lists.openembedded.org>
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Fri, 07 Dec 2018 04:06:06 -0800 (PST)
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: openembedded-core@lists.openembedded.org
Date: Fri,  7 Dec 2018 12:06:04 +0000
Message-Id: <20181207120605.11344-1-richard.purdie@linuxfoundation.org>
X-Mailer: git-send-email 2.19.1
MIME-Version: 1.0
Subject: [PATCH 1/2] oeqa/selftest/esdk: Ensure parent directory exists
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
X-List-Received-Date: Fri, 07 Dec 2018 12:06:07 -0000
Content-Transfer-Encoding: 8bit

INFO - ======================================================================
INFO - ERROR: setUpClass (eSDK.oeSDKExtSelfTest)
INFO - ----------------------------------------------------------------------
INFO - Traceback (most recent call last):
  File "/home/pokybuild/yocto-worker/oe-selftest-debian/build/meta/lib/oeqa/core/case.py", line 32, in _oeSetUpClass
    clss.setUpClassMethod()
  File "/home/pokybuild/yocto-worker/oe-selftest-debian/build/meta/lib/oeqa/selftest/cases/eSDK.py", line 76, in setUpClass
    cls.tmpdirobj = tempfile.TemporaryDirectory(prefix="selftest-esdk-", dir=bb_vars["WORKDIR"])
  File "/usr/lib/python3.5/tempfile.py", line 929, in __init__
    self.name = mkdtemp(suffix, prefix, dir)
  File "/usr/lib/python3.5/tempfile.py", line 507, in mkdtemp
    _os.mkdir(file, 0o700)
FileNotFoundError: [Errno 2] No such file or directory: '/home/pokybuild/yocto-worker/oe-selftest-debian/build/build/tmp/work/qemux86_64-poky-linux/core-image-minimal/1.0-r0/selftest-esdk-q7ln84gc'

Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
---
 meta/lib/oeqa/selftest/cases/eSDK.py | 1 +
 1 file changed, 1 insertion(+)

diff --git a/meta/lib/oeqa/selftest/cases/eSDK.py b/meta/lib/oeqa/selftest/cases/eSDK.py
index 12bd710e2dc..d7aef939913 100644
--- a/meta/lib/oeqa/selftest/cases/eSDK.py
+++ b/meta/lib/oeqa/selftest/cases/eSDK.py
@@ -73,6 +73,7 @@ CORE_IMAGE_EXTRA_INSTALL = "perl"
         cls.image = 'core-image-minimal'
 
         bb_vars = get_bb_vars(['SSTATE_DIR', 'WORKDIR'], cls.image)
+        bb.utils.mkdirhier(bb_vars["WORKDIR"])
         cls.tmpdirobj = tempfile.TemporaryDirectory(prefix="selftest-esdk-", dir=bb_vars["WORKDIR"])
         cls.tmpdir_eSDKQA = cls.tmpdirobj.name
 
-- 
2.19.1


