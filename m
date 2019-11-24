Return-Path: <akuster808@gmail.com>
Received: from mail-pl1-f178.google.com (mail-pl1-f178.google.com
	[209.85.214.178])
	by mail.openembedded.org (Postfix) with ESMTP id A0B607FCAA
	for <openembedded-core@lists.openembedded.org>;
	Sun, 24 Nov 2019 23:51:10 +0000 (UTC)
Received: by mail-pl1-f178.google.com with SMTP id w7so5577505plz.12
	for <openembedded-core@lists.openembedded.org>;
	Sun, 24 Nov 2019 15:51:12 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=from:to:subject:date:message-id:in-reply-to:references;
	bh=cGz+I40OhU3eBw3cXQNwtSezOFj2xOrJynffXUkRH1o=;
	b=MFR7ucIJqgJejLEVaNOLP2zT7qeEvzLbQkBUqJrFKvWFJlV4IOBMO5CiWBSUo0Iwig
	7OGNR2/Nm0fa74NCqCpSN+7JDURCUbFm3hVOwKMm80XaGs02nPtY1fbFG9eETPgoqZ6M
	qJFyMvtAn7wJ774m+FkFY8oKZcg8vhaw4V2xOJ3DIHGJ5qj4vJzZt2+hxdNecIzMS3bQ
	Ut52vJfFEe+ibObdgQ9FxEhf+I3hmTacPiu15L4PHR9wX3Y//LVcopl5xjerq6WDltDZ
	m1w5wBeL0Jao1nyPTbJTkT1qUvVat9VAyE0VsO+Wp064yvL2BlE8o+9ff8nZDYjZRJMo
	ZyOA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
	:references;
	bh=cGz+I40OhU3eBw3cXQNwtSezOFj2xOrJynffXUkRH1o=;
	b=Acjg+DqSr4T1HRMFoJk0qhoJVxsO+SGNlwuck0/jrUG/JaM5sPs+JclxavzUH4ULu/
	Y5cCQTiYKhV/1AbBtGoHWZ1d5kHb0kDuG5/v0vDKqX87IaHf5jFBhey3tfio9Z+lS7Pk
	FTx3Pj+ogTi3ETR308hD0Czn9x+1zwkmFGG8iX7Cimqb5g0t66BWZVP5R0s5sqsG/t0H
	FYYtI7Ukdj+qcMeWfUA2ATyJn+8ts03fjLejNLgAxMuV5dPIRP4aHGpfHHgvnsczYzWG
	2ZPqYVKfO8LXXZCFT8scjFw58exrE4pwuyR18WvVbqBElQnHiwMdhJZb3utiRqq+KkKx
	pg4A==
X-Gm-Message-State: APjAAAV4ab2AcJ8BDFvDHZ5x3zGTY8LKZSS6cE1dpRbsQnURhKHcpjt4
	U7MFeGnKn2w6qPpHq+s+M8PVuHqm
X-Google-Smtp-Source: APXvYqxBU+43RmkNQ3vVq+oZZI2gg22P/KaxbjT74MzdVA8Ei1EEFcyune0redl1CyWQ13Y7cqCdSQ==
X-Received: by 2002:a17:90a:77c8:: with SMTP id
	e8mr33981645pjs.83.1574639471613; 
	Sun, 24 Nov 2019 15:51:11 -0800 (PST)
Received: from akuster-ThinkPad-T460s.hsd1.ca.comcast.net
	([2601:202:4180:a5c0:69ac:e4d2:e89f:98da])
	by smtp.gmail.com with ESMTPSA id
	q200sm5619783pfq.87.2019.11.24.15.51.10
	for <openembedded-core@lists.openembedded.org>
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
	Sun, 24 Nov 2019 15:51:11 -0800 (PST)
From: Armin Kuster <akuster808@gmail.com>
To: openembedded-core@lists.openembedded.org
Date: Sun, 24 Nov 2019 15:50:35 -0800
Message-Id: <37ed803128fcc09bc3f941e62726da2821de4932.1574639349.git.akuster808@gmail.com>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <cover.1574639349.git.akuster808@gmail.com>
References: <cover.1574639349.git.akuster808@gmail.com>
Subject: [zeus 30/35] core-image-full-cmdline: Add less
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
X-List-Received-Date: Sun, 24 Nov 2019 23:51:11 -0000

From: Richard Purdie <richard.purdie@linuxfoundation.org>

Less was coming from busybox in these images, add the full version.

[YOCTO #13630]

Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
Signed-off-by: Armin Kuster <akuster808@gmail.com>
---
 meta/recipes-extended/packagegroups/packagegroup-core-full-cmdline.bb | 1 +
 1 file changed, 1 insertion(+)

diff --git a/meta/recipes-extended/packagegroups/packagegroup-core-full-cmdline.bb b/meta/recipes-extended/packagegroups/packagegroup-core-full-cmdline.bb
index 2d96d1b..15a8e6d 100644
--- a/meta/recipes-extended/packagegroups/packagegroup-core-full-cmdline.bb
+++ b/meta/recipes-extended/packagegroups/packagegroup-core-full-cmdline.bb
@@ -81,6 +81,7 @@ RDEPENDS_packagegroup-core-full-cmdline-utils = "\
     gawk \
     gmp \
     grep \
+    less \
     makedevs \
     mc \
     mc-fish \
-- 
2.7.4


