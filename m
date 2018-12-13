Return-Path: <akuster808@gmail.com>
Received: from mail-pl1-f196.google.com (mail-pl1-f196.google.com
	[209.85.214.196])
	by mail.openembedded.org (Postfix) with ESMTP id 165516D137
	for <openembedded-core@lists.openembedded.org>;
	Thu, 13 Dec 2018 21:39:24 +0000 (UTC)
Received: by mail-pl1-f196.google.com with SMTP id y1so1657186plp.9
	for <openembedded-core@lists.openembedded.org>;
	Thu, 13 Dec 2018 13:39:25 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=from:to:subject:date:message-id:in-reply-to:references;
	bh=1RAiJiMVpyv35qA2xjPD/RlKHYsD962VxJtA5GU8rbM=;
	b=VnoILk4gE33SE5T/thv/YqDhv9sdDwwMdCqLhX3B2N8eiU0eMg2PgY6VBBfr8acXIJ
	LjL68PAZL8MBbn37YJgqabdTMl42EJKhQQaphkzd1+qy8uElTsdJRVYgpluymWuhFfF0
	7M9AVHeAghngWY4yi1eaLScR2IHx5myzHTq/zstmu3PJ1nzvjab144ZCySePWWGVGyie
	L9mm2VRQNWxODbY16ZabHB/t9WX5BvHmDtI4zj+lAMZgnikQjxL1bY8XlxAaeOagi/JP
	AcVlMP3PFCWAu8+8/N/oB9VSjTDYXhLyoPRstlgiqEa2nDH+V9nNG5kGY+49Majwx//g
	bXow==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
	:references;
	bh=1RAiJiMVpyv35qA2xjPD/RlKHYsD962VxJtA5GU8rbM=;
	b=LXcTallHConElr+q1s3X44ZXB0eh5XstFhg2s1aMRkiJaEBN3R/we7WsieUltrtUAQ
	ybYRwCd4ZDq6jBUJTam7xjkeZWay/z3IYvUu6lhM2YIV/xOWVbnGHWO7dYEcyxJlm+S8
	Qo4rrs4pW57GxUFiYU33TcpDts2n+rH+A1oFByjGn6M3jaGC/Fkb13SYHpo1NppLuEfy
	fXf8M2UlhD3jbzErrI1I847pIL+hB1r6LpoXsRc6lUR3v+c02hKborlrTf4xoInuStmz
	pQHdnP0S19KFErbmH9wdaabnYVRrS+Ez/5okE8npIPWhhDlvm5xfGnivwGrbE9mNRuRp
	hQUQ==
X-Gm-Message-State: AA+aEWZHCpS8/RHrFaNlXsdZoozytm8hYRcEwWXJvUu1Ao2zKOeQQj5C
	CncCKiKYZZJcj6aR+hh6ESpQ9fhS
X-Google-Smtp-Source: AFSGD/W4XtBuAfJq6r+7kZhMQimW5PTARAOQprl5Pwyqs88CpWKP9yYFOripiO1OETr2jJRNEcyesg==
X-Received: by 2002:a17:902:15a8:: with SMTP id
	m37mr434709pla.129.1544737164811; 
	Thu, 13 Dec 2018 13:39:24 -0800 (PST)
Received: from akuster-ThinkPad-T460s.hsd1.ca.comcast.net
	([2601:202:4180:c33:79af:1f36:1822:3801])
	by smtp.gmail.com with ESMTPSA id
	b9sm3288912pfi.118.2018.12.13.13.39.23
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
	Thu, 13 Dec 2018 13:39:23 -0800 (PST)
From: Armin Kuster <akuster808@gmail.com>
To: openembedded-core@lists.openembedded.org,
	akuster808@gmail.com
Date: Thu, 13 Dec 2018 13:38:28 -0800
Message-Id: <2a620829217ed9d7908ad60096037fd3ec55b9d1.1544735897.git.akuster808@gmail.com>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <cover.1544735897.git.akuster808@gmail.com>
References: <cover.1544735897.git.akuster808@gmail.com>
Subject: [PATCH 20/45] oeqa/loader: Fix deprecation warning
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
X-List-Received-Date: Thu, 13 Dec 2018 21:39:24 -0000

From: Richard Purdie <richard.purdie@linuxfoundation.org>

Clean up the warning:
meta/lib/oeqa/core/loader.py:27: DeprecationWarning: inspect.getargspec() is deprecated, use inspect.signature() or inspect.getfullargspec()
  _failed_test_args = inspect.getargspec(unittest.loader._make_failed_test).args

(From OE-Core rev: d2deb66830be2d44532fea3d5db763b57778252a)

(From OE-Core rev: f9ab10bb08446052fd6af2a21f38d8454e466d51)

Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
---
 meta/lib/oeqa/core/loader.py | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta/lib/oeqa/core/loader.py b/meta/lib/oeqa/core/loader.py
index 98fc0f6..2255cf1 100644
--- a/meta/lib/oeqa/core/loader.py
+++ b/meta/lib/oeqa/core/loader.py
@@ -24,7 +24,7 @@ from oeqa.core.decorator import decoratorClasses, OETestDecorator, \
 # Generate the function definition because this differ across python versions
 # Python >= 3.4.4 uses tree parameters instead four but for example Python 3.5.3
 # ueses four parameters so isn't incremental.
-_failed_test_args = inspect.getargspec(unittest.loader._make_failed_test).args
+_failed_test_args = inspect.getfullargspec(unittest.loader._make_failed_test).args
 exec("""def _make_failed_test(%s): raise exception""" % ', '.join(_failed_test_args))
 unittest.loader._make_failed_test = _make_failed_test
 
-- 
2.7.4


