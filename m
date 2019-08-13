Return-Path: <alex.kanavin@gmail.com>
Received: from mail-wm1-f53.google.com (mail-wm1-f53.google.com
	[209.85.128.53])
	by mail.openembedded.org (Postfix) with ESMTP id D7BAD60234
	for <openembedded-core@lists.openembedded.org>;
	Tue, 13 Aug 2019 18:24:23 +0000 (UTC)
Received: by mail-wm1-f53.google.com with SMTP id v19so2274617wmj.5
	for <openembedded-core@lists.openembedded.org>;
	Tue, 13 Aug 2019 11:24:25 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=from:to:cc:subject:date:message-id:in-reply-to:references;
	bh=9vMvRrTgMGb2iln3cudVgU/fiA+do6OnqO9i6tYLp6s=;
	b=Ch8bhYH3c9E/tobD7I9AVj6DFt7KrEu+neeOlMJKSXjumPquY+2W6C18XQy5Xqt8B2
	P/yojatW76Ii9FUP0xsraLZMqOaZWvhQyX0M95bMc2wcuc71jjlS+uRTUTvLH7JE/8CY
	fSL16kPMfzFp3eHlQSUDJR6RUqiJOJkZqb8MRunF4vY4L2xK9+PIa6gg0wIKCpSAUJMX
	6Am1HUaWvf1ilBpvm2aVZ02jJZSx3hT2iwz27GUs/+KLGk8m2UbBiYNejui8AKm2wArp
	u4IUCZj4bdYY9FxJA80P98WdJ/sa5aA9naGgK/B04Hi/Po1StV5rrh7tNo0nfz2JdqoM
	3yOA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
	:references;
	bh=9vMvRrTgMGb2iln3cudVgU/fiA+do6OnqO9i6tYLp6s=;
	b=lYj/R6ZltoJkV468SZRxn+z3g0zaTuEF0mWi+HdGBBMZSHs9Z0CsI2ysZQCChPr8Qd
	qyBXn4vhu3+RCbj32DEbDgYQVT+1EitqQwlUyU8NIUYkEjmhf6QFVK3QH55qufzBNEyw
	ScOqz5vv+5SIAYCfn+2+i7yYGuCyaWMPv8/etvcLgz0X48zYajYq8xuovcsCBYNdzghh
	jM4+Ze0HjyoA2y8LL09s+4vcNjlGmokCvNIQ336F3Reg7lz0E0hRfeiQj23Yk068zSbe
	6p91e8B5qJfw1tI2lQyMJhV8aPvryw+MeUBdIRgn7C8kzsR3877Xk7p4Xf81lznPRqfZ
	98Tw==
X-Gm-Message-State: APjAAAXZMDhLZMOQov1BzoHpYpIWyIiyEUCXzXM39rzhT+WILdmmRmVi
	rfa82KpA4914kePlegBq9EXr4HLhc6g=
X-Google-Smtp-Source: APXvYqzOHqTWjxR3ztGOXjJUIdWXaNnvqUfiWpftFl5sgGXSWB4aMI8acMFkSBM1HqWd2HaL6x6Zsw==
X-Received: by 2002:a1c:544e:: with SMTP id p14mr4334575wmi.4.1565720664453;
	Tue, 13 Aug 2019 11:24:24 -0700 (PDT)
Received: from alexander-box.luxoft.com ([62.96.135.139])
	by smtp.gmail.com with ESMTPSA id c6sm3218230wma.25.2019.08.13.11.24.23
	(version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
	Tue, 13 Aug 2019 11:24:24 -0700 (PDT)
From: Alexander Kanavin <alex.kanavin@gmail.com>
To: openembedded-core@lists.openembedded.org
Date: Tue, 13 Aug 2019 20:24:14 +0200
Message-Id: <20190813182414.2952-5-alex.kanavin@gmail.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20190813182414.2952-1-alex.kanavin@gmail.com>
References: <20190813182414.2952-1-alex.kanavin@gmail.com>
Subject: [PATCH 5/5] ovmf: fix upstream version check
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
X-List-Received-Date: Tue, 13 Aug 2019 18:24:24 -0000

Signed-off-by: Alexander Kanavin <alex.kanavin@gmail.com>
---
 meta/recipes-core/ovmf/ovmf_git.bb | 1 +
 1 file changed, 1 insertion(+)

diff --git a/meta/recipes-core/ovmf/ovmf_git.bb b/meta/recipes-core/ovmf/ovmf_git.bb
index 7944ee97d49..b569b593fc2 100644
--- a/meta/recipes-core/ovmf/ovmf_git.bb
+++ b/meta/recipes-core/ovmf/ovmf_git.bb
@@ -21,6 +21,7 @@ SRC_URI = "gitsm://github.com/tianocore/edk2.git;branch=master;protocol=git \
 
 PV = "edk2-stable201905"
 SRCREV="20d2e5a125e34fc8501026613a71549b2a1a3e54"
+UPSTREAM_CHECK_GITTAGREGEX = "(?P<pver>edk2-stable.*)"
 
 inherit deploy
 
-- 
2.17.1


