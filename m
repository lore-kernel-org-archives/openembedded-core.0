Received: from mail-wr1-f51.google.com (mail-wr1-f51.google.com [209.85.221.51])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.4387.1794732570849724975
 for <openembedded-core@lists.openembedded.org>;
 Sun, 15 Nov 2026 00:49:31 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@linuxfoundation.org header.s=google header.b=Oi39OgAC;
 spf=pass (domain: linuxfoundation.org, ip: 209.85.221.51, mailfrom: richard.purdie@linuxfoundation.org)
Received: by mail-wr1-f51.google.com with SMTP id ffacd0b85a97d-491971ac844so2254634f8f.2
        for <openembedded-core@lists.openembedded.org>; Sun, 15 Nov 2026 00:49:30 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linuxfoundation.org; s=google; t=1794732569; x=1795337369; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=bfPqxnnrPcmDHG7CZpqqwYdrk79EiIFko9RVMoc/CKc=;
        b=Oi39OgACfN3klcmNuXZu6ldLXQ/fvums9JYc6Ohz1KNxTwjmTPGMXxXSGGkUCYeAK2
         pASl/xNQMKTN4etPkfSVo0pwcjJZwy+1R0FdlbR2qlqSzgXBUURkr2DYCUpDjmKD+9Bp
         sHV93oqlwFkbgoUmWgjwFBJANHLDT1UMuPRoI=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794732569; x=1795337369;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to:content-type;
        bh=bfPqxnnrPcmDHG7CZpqqwYdrk79EiIFko9RVMoc/CKc=;
        b=sNDTgT4ijje9xTll/JGh2yZYoLEK35Zpf+4Y6MABwYdr52QUNt4YF4hp1KuV9JkEZX
         jAvjJHi1JXo8TegFK5rlR82EoJ9SvLXqFsOVsfPH2cMNpkasHarKx5hlHb/+f6RdVSyR
         /rUOvRQ6+RMIyChYd96Vhyj3hsAGAUEzdnkyCuhEcxRmTrsvq5Lkt88kzi2kemxjSRw3
         LXhPvrh7Sk2uTGx6xYNhqv5EOkCHPXi2Ju9PcVKaft3L8Qp1mnF+ONR2udJYjLaDoXpJ
         c2a5pcStIcXvYGWlQffpbwxLEPyY+PjtnDLoA7D4sja/DDYW0WDp7Bk9TC81LUTgI15R
         Wziw==
X-Gm-Message-State: APuU4Z+hDd3J17BcTQev7x9OutiMxG1+6upRx+Zzh2szRFcPq5SOV+mO
	tFPGAuivnNKHhzlNMxhUYWXmfkwvHFOwYb2R1zngHWZ35Fgqsa2Kvc+WX1sScOdGLyRT5oMGyiX
	3Oekozik=
X-Gm-Gg: AYBFou2TrWxCWPVRF50RrTNyktpPAmWV0OK6WiD46qz8cNvKVGIEt0pGQcYYmo0Ue99
	eeFq2wtqcAOemWb8uMo8kiwBFkPHKakM/qr8aJePsom1HRNhhXiziEFmwWNbqFTlLasbpIG59Qu
	8DANNXB3ijW7ntdoyBhP6t0uOAsiUnamcl/GAqM0Iag4d14G/LmFsHVqA7b7R2jcrBd1A9pyWw8
	Zsu1MbaUmTr5gWWEX132YD2KGqBH1gzCj96/uhe5KSBN9v6/Hg20FBANci9HX/oF/txKLiTmnd2
	7CPvBmnyJbR63phPuOiAZHCYqesB9HExv5olHF3j71CPyoNDsF5gq+TjDr4HKSZR70Dnzhhroon
	yiSvF2hnqiPlg5C9FhajttZWP7fTtkC3vtgSffC5kAxvdmm0cP2THrOxt10arLDGCGw1aWU228j
	T/XVYAMaS4yn9kvuljCkhUQrW5GX4btGobMFcc/nsNzkMcbm/g/XXpIjXE1lxcwwNRHf4zNhwlo
	BPn8K++eOV5nv9lDltSOW2paJwH0V0JO6Ui0Di/g2bA8OSacZQaDCykYNqGAnTt2iez9ePZ/jqL
	X/TxCKtoTuBUv84KPDxEtMQPwjOThfTLE8/Phzzir/VkGBi5/dbVuNfWOg==
X-Received: by 2002:a05:6000:46c2:b0:48f:db47:6ebf with SMTP id ffacd0b85a97d-49c729bb31fmr10663382f8f.38.1794732569013;
        Sun, 15 Nov 2026 00:49:29 -0800 (PST)
Return-Path: <richard.purdie@linuxfoundation.org>
Received: from max.int.rpsys.net ([2001:8b0:aba:5f3c:4b65:588d:a4ce:ce3f])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-49c60f8d66esm13804452f8f.57.2026.11.15.00.49.26
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 15 Nov 2026 00:49:27 -0800 (PST)
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: openembedded-core@lists.openembedded.org
Subject: [PATCH 25/41] oeqa/core/loader: Simplify the _make_failed_test override
Date: Sun, 15 Nov 2026 08:48:28 +0000
Message-ID: <20261115084845.701136-25-richard.purdie@linuxfoundation.org>
X-Mailer: git-send-email 2.55.0
In-Reply-To: <20261115084845.701136-1-richard.purdie@linuxfoundation.org>
References: <20261115084845.701136-1-richard.purdie@linuxfoundation.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by lin-tor-korg-lkml-alma10-1 with HTTPS for <openembedded-core@lists.openembedded.org>; Sun, 15 Nov 2026 08:49:33 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/250256
Content-Type: text/plain; charset="utf-8"

We now require python 3.9 or later so we can drop the python 3.4
era compatibility code.

AI-Generated: Uses Claude Opus 5.5
Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
---
 meta/lib/oeqa/core/loader.py | 9 ++-------
 1 file changed, 2 insertions(+), 7 deletions(-)

diff --git a/meta/lib/oeqa/core/loader.py b/meta/lib/oeqa/core/loader.py
index 5e96988b7a9..719e2a8a4c3 100644
--- a/meta/lib/oeqa/core/loader.py
+++ b/meta/lib/oeqa/core/loader.py
@@ -8,7 +8,6 @@ import os
 import re
 import sys
 import unittest
-import inspect
 
 from oeqa.core.utils.path import findFile
 from oeqa.core.utils.test import getSuiteModules, getCaseID
@@ -23,12 +22,8 @@ from oeqa.core.decorator import decoratorClasses, OETestDecorator, \
 #
 # For our purposes, it is better to raise the exceptions in the loading
 # step rather than waiting to run the test suite.
-#
-# Generate the function definition because this differ across python versions
-# Python >= 3.4.4 uses tree parameters instead four but for example Python 3.5.3
-# ueses four parameters so isn't incremental.
-_failed_test_args = inspect.getfullargspec(unittest.loader._make_failed_test).args
-exec("""def _make_failed_test(%s): raise exception""" % ', '.join(_failed_test_args))
+def _make_failed_test(methodname, exception, *args, **kwargs):
+    raise exception
 unittest.loader._make_failed_test = _make_failed_test
 
 def _find_duplicated_modules(suite, directory):
