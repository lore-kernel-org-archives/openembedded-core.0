Return-Path: <akuster808@gmail.com>
Received: from mail-pf1-f171.google.com (mail-pf1-f171.google.com
	[209.85.210.171])
	by mail.openembedded.org (Postfix) with ESMTP id 1EDED71CBD
	for <openembedded-core@lists.openembedded.org>;
	Thu, 13 Dec 2018 21:39:50 +0000 (UTC)
Received: by mail-pf1-f171.google.com with SMTP id c72so1736552pfc.6
	for <openembedded-core@lists.openembedded.org>;
	Thu, 13 Dec 2018 13:39:51 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=from:to:subject:date:message-id:in-reply-to:references;
	bh=Y/pxz/icFEkY0L96myEe6awz/UVpyQ+2fYgQ0YE/HvU=;
	b=KNk5RT0cc4DQYbiPajxeUzizijU5cmojtsSD99Cx/5HWt9MRStMVketLa+sjmhMV+I
	SKngVNy2PxV7Qvu+vfgHQpWS2geVMpBMu9FH9bvjKbKKjaFTFLeLz+bNzH41lDEx2mU8
	LdSiFtpiFvASoOM9yrn7ditx+2Yr0oBDlFuFGUzh54i+SgNr6rEvcZYyMc41AOamXnBC
	CLgxJbzANtyo1xrfnKZqFYGkjidMpAao952nWtt04kNcGFjRh+w0RYozoclYvoKy8u+7
	FuifTC3jqdHud5xIWnxvkYg7dcEaFOT6qaXmucQrdbIQX/uNuvYdyDdD0NgrCgVy9Yn6
	fmYQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
	:references;
	bh=Y/pxz/icFEkY0L96myEe6awz/UVpyQ+2fYgQ0YE/HvU=;
	b=tTpBmpN0bsXUOgW4uNC4n/996su7QwgnIo1wXMMAK+iU9m21a5bqly6uNixj1RXgj5
	Dde5bF3SwTKkJE/fy06jCcDFHwHMrmnDcKIJy8w4UJKFBBBgBAi5i+brcMs5oZTVg3Qt
	ffX/a6MoN5KObQ8tzYHLViG9JP1ic64KF/p7xVpYvie3gCbLgsnIjtu69Acu3dXKjeOM
	Swrx9Fd1x7yFqSyv+2UDvOpkdwvhrZEyqWsaV0IjXBOYaAnJEMJcsmfcuYgmr5UBT/3+
	RAQ1mRp8p/DMD59lSRB2zlzAWMAV8rGAOzedHeJrIWiqonNBCpp4thoR+QqybZqJ3+/w
	xLNg==
X-Gm-Message-State: AA+aEWZSUO1nCzRLi3n4QN/aurkvWHL6+cDLct0hr8/7xxPkFh4cD/J8
	h834KFeHMRiU1oZ8aGZI9xa1gXnc
X-Google-Smtp-Source: AFSGD/UgS6jezAXuiaP3uOJ4hoV/d8WAq9CpT7FcG/aSEMYqfA3QB/rWhzCv5BapeHROzkBrYxY0Bw==
X-Received: by 2002:a63:4b25:: with SMTP id y37mr405454pga.181.1544737191185; 
	Thu, 13 Dec 2018 13:39:51 -0800 (PST)
Received: from akuster-ThinkPad-T460s.hsd1.ca.comcast.net
	([2601:202:4180:c33:79af:1f36:1822:3801])
	by smtp.gmail.com with ESMTPSA id
	b9sm3288912pfi.118.2018.12.13.13.39.50
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
	Thu, 13 Dec 2018 13:39:50 -0800 (PST)
From: Armin Kuster <akuster808@gmail.com>
To: openembedded-core@lists.openembedded.org,
	akuster808@gmail.com
Date: Thu, 13 Dec 2018 13:38:50 -0800
Message-Id: <c5d41ce2dea0b6218710e0be7e31b24e40503952.1544735897.git.akuster808@gmail.com>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <cover.1544735897.git.akuster808@gmail.com>
References: <cover.1544735897.git.akuster808@gmail.com>
Subject: [PATCH 42/45] oeqa/selftest/esdk: Ensure parent directory exists
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
X-List-Received-Date: Thu, 13 Dec 2018 21:39:50 -0000

From: Richard Purdie <richard.purdie@linuxfoundation.org>

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

(From OE-Core rev: 170a601a99836d13b69e5287bee0d3e71983dd46)

Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
---
 meta/lib/oeqa/selftest/cases/eSDK.py | 1 +
 1 file changed, 1 insertion(+)

diff --git a/meta/lib/oeqa/selftest/cases/eSDK.py b/meta/lib/oeqa/selftest/cases/eSDK.py
index 14f75d8..1e79d1d 100644
--- a/meta/lib/oeqa/selftest/cases/eSDK.py
+++ b/meta/lib/oeqa/selftest/cases/eSDK.py
@@ -73,6 +73,7 @@ CORE_IMAGE_EXTRA_INSTALL = "perl"
         cls.image = 'core-image-minimal'
 
         bb_vars = get_bb_vars(['SSTATE_DIR', 'WORKDIR'], cls.image)
+        bb.utils.mkdirhier(bb_vars["WORKDIR"])
         cls.tmpdirobj = tempfile.TemporaryDirectory(prefix="selftest-esdk-", dir=bb_vars["WORKDIR"])
         cls.tmpdir_eSDKQA = cls.tempdirobj.name
 
-- 
2.7.4


