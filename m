Return-Path: <raj.khem@gmail.com>
Received: from mail-pg1-f174.google.com (mail-pg1-f174.google.com
	[209.85.215.174])
	by mail.openembedded.org (Postfix) with ESMTP id 7E0527D3EF
	for <openembedded-core@lists.openembedded.org>;
	Tue, 28 May 2019 07:45:26 +0000 (UTC)
Received: by mail-pg1-f174.google.com with SMTP id a3so10467228pgb.3
	for <openembedded-core@lists.openembedded.org>;
	Tue, 28 May 2019 00:45:27 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=from:to:cc:subject:date:message-id:mime-version
	:content-transfer-encoding;
	bh=50AvNh2+7dfWgn6VbHfiVgiYOcK0uen9R5SO9iHxQNU=;
	b=Wkv36o9wSyWwzFdjih9hxail7kQ6isw3AuGqnoTxUWhy2+iedHME3HQbV0A2T45IKZ
	uigvjwX3CzxUeDhi6ZU4+xqmvjKXeqa9xPOv4nY4NhhF8ELJ62XbvaORIWuNj65dDT0L
	jjaX157XSenpVTJi1BmE899J4GUkBpb9yPsZRshqgXgj3YMeegs2DSJBAVS1omnOnY0e
	10Ck+f9OLI16NY1OIsBcfO3I7LnJ40V8nx75K0t1BuQXacRTpyMzC5AuwzqBUEtPFNcS
	PVv+PmLvBo25dd3Q5Qk5zuDvnZu+jPNyNk8FK07XSyiMM+9ZKM+xmWVnVQV4vUTH8tl6
	7+FA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
	:content-transfer-encoding;
	bh=50AvNh2+7dfWgn6VbHfiVgiYOcK0uen9R5SO9iHxQNU=;
	b=YtSGaCCvblDrbthZYoCehwbuWYG0KuU99ESf56m9pwfQ6k9cVsLy6CG9BJen7vZypz
	2sSEp3DG9oZtifP+2F4u5sTTQq2B9d8rTIgZdE0WzRftQ0OdsH648tLWGr0tEUJtaSXh
	DOd7UQuCgs7RU/isbat5X9D3AFVn7OAspA54Q1R7qxPwRG4n4VwrrPj4IbctI3IrJS/G
	CkBvXZgYyxfWAJTdntm1s5o55GWqvzQnKpwddSk4FA+AjqXaaR8KMpbYya4GV+yGP8sX
	VWj68Cg7TjO/2mAr3Iz0r8vb8TDAPbTDaoZd8nJJPU5ZJv99Usezng0wDSHjyft3iF0l
	gGXQ==
X-Gm-Message-State: APjAAAWQOm8nSvDWwQTn60QH80syEVVGIdbnsqPW7Te9Q6b/0BuHP8UQ
	yRmy1VxXPdMG4xIykVbI0t+gZWXf2Bo=
X-Google-Smtp-Source: APXvYqyhUQL+V61MY+uO+g7Fsfz6FkyKBO8MJEYL7qiFNqUGckAEeXBn8n8t/US9spfLhevqsMpGoQ==
X-Received: by 2002:aa7:9aa5:: with SMTP id x5mr49853875pfi.135.1559029525914; 
	Tue, 28 May 2019 00:45:25 -0700 (PDT)
Received: from apollo.hsd1.ca.comcast.net ([2601:646:8500:6bc6::e252])
	by smtp.gmail.com with ESMTPSA id
	f67sm15597613pfa.149.2019.05.28.00.45.24
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Tue, 28 May 2019 00:45:24 -0700 (PDT)
From: Khem Raj <raj.khem@gmail.com>
To: openembedded-core@lists.openembedded.org
Date: Tue, 28 May 2019 00:45:15 -0700
Message-Id: <20190528074515.43125-1-raj.khem@gmail.com>
X-Mailer: git-send-email 2.21.0
MIME-Version: 1.0
Subject: [PATCH] gdb: Let gdbserver be empty for riscv64
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
X-List-Received-Date: Tue, 28 May 2019 07:45:26 -0000
Content-Transfer-Encoding: 8bit

gdbserver does not yet build for riscv64, therefore
let the package be empty so we can build core-image-sato-sdk-ptest

Signed-off-by: Khem Raj <raj.khem@gmail.com>
---
 meta/recipes-devtools/gdb/gdb.inc | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/meta/recipes-devtools/gdb/gdb.inc b/meta/recipes-devtools/gdb/gdb.inc
index 52119a0aaa..0f10b41734 100644
--- a/meta/recipes-devtools/gdb/gdb.inc
+++ b/meta/recipes-devtools/gdb/gdb.inc
@@ -8,3 +8,6 @@ inherit gettext
 # cross-canadian must not see this
 PACKAGES =+ "gdbserver"
 FILES_gdbserver = "${bindir}/gdbserver"
+
+ALLOW_EMPTY_gdbserver_riscv64 = "1"
+
-- 
2.21.0


