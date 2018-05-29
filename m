Return-Path: <armccurdy@gmail.com>
Received: from mail-pf0-f176.google.com (mail-pf0-f176.google.com
	[209.85.192.176])
	by mail.openembedded.org (Postfix) with ESMTP id 7CF9174A0E
	for <openembedded-core@lists.openembedded.org>;
	Tue, 29 May 2018 21:30:01 +0000 (UTC)
Received: by mail-pf0-f176.google.com with SMTP id c10-v6so7887032pfi.12
	for <openembedded-core@lists.openembedded.org>;
	Tue, 29 May 2018 14:30:02 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=from:to:cc:subject:date:message-id:in-reply-to:references;
	bh=w0a9r/5qBnuIHIi8jb7pLDBbOvcbZASfCF4X2B/5Y/g=;
	b=t+cD8Wl/YDCiMSi7QmWM4txmkj7eAqTYkpIsmk6Ch8sJKSqgJ3M68t0Sixixy3+iA8
	ari2Zqzz6RE0m7RkrD/pN/ONAiKc8MRcuiNUifwWkMWrCLJ+mAyxfq7ntW4xZxb1+rkq
	EmxFOngh3zgEel3CSElhPRJ9mWmPLqSDu0uxG1mlXwRvELL504C15tEtSNw4Hc/U4E9h
	TFKCfCBpDxWDLImg3YiY9a0A1Dx81Ad1QI1ZRxDlKUB3S2HY+0/6i8Dy+aEBmL/ClsFk
	xJjAFZIF0e+FP9O7eq/0o4GtGa8bSeQ/5FGAMI5yDwaP0xyC/j+0/Tn6wLqArScyxR9R
	zC3A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
	:references;
	bh=w0a9r/5qBnuIHIi8jb7pLDBbOvcbZASfCF4X2B/5Y/g=;
	b=r5dIbTs9nJaCTiPQazV/lq9ieLXSQb6c9+pjIq++dUjbEcLv24CtxmEV39LNdlJ1wZ
	MQYF4jBr8/OhoKOP6ATeTYtwDZotyFoeY0O9gWSw5RmAZIAB0XwoOofRE+bsx6Jn+oJ6
	P+seNCRknIQA9ULAfaRU4shGcB+AgtFB1IycpCJfyhngF/uv7ND+dyMrwQmeVeZsY2b4
	XISna/P1dpMuyA16OIX1szuzFid5nPw77Ky4E57AfqQ4r9roWQCN0jrIZgX0j7PChtX7
	bHTmV21ZJb9VhUx5vT7WnhnLzernRnxDEk4osn94zzAYlpTZ/7YwFB7kA8+l32rNoMfh
	MxOA==
X-Gm-Message-State: ALKqPwehhXmw4VCJr29lQsNsWolmLSWR2W4NZzrbwg7tX1zThq8REnUn
	mVz8A1EQy8gP+psGmKPlX0fd1w==
X-Google-Smtp-Source: ADUXVKJNU/BeE96f3zI8oJaksRJ7t9rGT0XrZ98j9oRNsqgivTHM4zaI8cpgUyE9H94HKp016UxBdA==
X-Received: by 2002:a63:6887:: with SMTP id
	d129-v6mr88275pgc.128.1527629402218; 
	Tue, 29 May 2018 14:30:02 -0700 (PDT)
Received: from e6520.cablelabs.com ([4.16.80.121])
	by smtp.gmail.com with ESMTPSA id
	i7-v6sm24362pfa.34.2018.05.29.14.30.01
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
	Tue, 29 May 2018 14:30:01 -0700 (PDT)
From: Andre McCurdy <armccurdy@gmail.com>
To: openembedded-core@lists.openembedded.org
Date: Tue, 29 May 2018 14:29:48 -0700
Message-Id: <1527629388-3808-6-git-send-email-armccurdy@gmail.com>
X-Mailer: git-send-email 1.9.1
In-Reply-To: <1527629388-3808-1-git-send-email-armccurdy@gmail.com>
References: <1527629388-3808-1-git-send-email-armccurdy@gmail.com>
Subject: [PATCH v2 5/5] bitbake.conf: fix minor typo in comments
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
X-List-Received-Date: Tue, 29 May 2018 21:30:01 -0000

Signed-off-by: Andre McCurdy <armccurdy@gmail.com>
---
 meta/conf/bitbake.conf | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta/conf/bitbake.conf b/meta/conf/bitbake.conf
index fab3dcc..3f63a25 100644
--- a/meta/conf/bitbake.conf
+++ b/meta/conf/bitbake.conf
@@ -93,7 +93,7 @@ VOLATILE_LOG_DIR ?= "yes"
 # Architecture-dependent build variables.
 ##################################################################
 
-# Immediate expansion since there is no point in reapeatedly calling
+# Immediate expansion since there is no point in repeatedly calling
 # os.uname() throughout parsing
 BUILD_ARCH := "${@os.uname()[4]}"
 BUILD_OS := "${@os.uname()[0].lower()}"
-- 
1.9.1


