Return-Path: <raj.khem@gmail.com>
Received: from mail-pf1-f195.google.com (mail-pf1-f195.google.com
	[209.85.210.195])
	by mail.openembedded.org (Postfix) with ESMTP id 0EBBB6BAAB
	for <openembedded-core@lists.openembedded.org>;
	Thu,  8 Aug 2019 00:59:23 +0000 (UTC)
Received: by mail-pf1-f195.google.com with SMTP id r7so43060896pfl.3
	for <openembedded-core@lists.openembedded.org>;
	Wed, 07 Aug 2019 17:59:25 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=from:to:cc:subject:date:message-id:mime-version
	:content-transfer-encoding;
	bh=mnyGJbmXbxNxHtp9eV4FJKKf4O8nDqEkvXqZ0sHoodc=;
	b=vU+Nxf+RLaelcWX1vg5bZ9qjZg3TxVEL1U1zfjgPp8idIsIflLvzKoU1WSliEaJZti
	uSkT+kaQa7xRBGbJdJtaL1JYYj/H7YNvxW2tyYicJOgYAES9YgUu4ZqwDDP6TQb1LApN
	s3BYXVCso0622A6zVYJtpvzMIKfOfaAfMUcaRBcQpVePSOvE4y7xxl91arcvKx01xJM9
	ehinVKSBZ0uHvtEq9zw+Ze35Wtl63rckGC1medosvMKb8XobZROGDhQMx3vS6D1aK8Eu
	TABRXDXo+GNcP1AKQwKmEPkZLnEkBXCz6VPQWhq+ya60kAMiQprM6MALY7f/XIDFJ5jw
	+WOg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
	:content-transfer-encoding;
	bh=mnyGJbmXbxNxHtp9eV4FJKKf4O8nDqEkvXqZ0sHoodc=;
	b=mFJw/QVxSIVWpc4Q43q8PMbyyJBPRwruBos7TzaTMsxKrDM2JS1fNP0xe5sRTePA8J
	ECpTjIMm6Xo85BtFp3H0zgWYwHtatKlVJJDnGa6GLbpoI8iV4jYCaJ6lIwSAu9oWyUgU
	W1yDdqUjbjFymaX9IKnlco1yvlt9f5/ObPESt+axdQa8bZCSPRPcWovHgZthmUlKRLj6
	ampD1KJDJiyK0orD4pMwFmnexIvRhyO68WqR8+SkStwDX+xrmYZdHzJkqNtl6GLw3wng
	IqAC4qq6celBnITeM0nuSxYUmSFq6SutfcC2ohYr184M977IfKBwj/sCoc6YFWn/s9Z8
	0lpw==
X-Gm-Message-State: APjAAAVOkBdMwyQBZKpMdAJaFam9Z0JagLxK9+HKP+9LhypXT6eJKogX
	3p8InMVKTGEE8wpnwfLzE34dXH9sKQA=
X-Google-Smtp-Source: APXvYqwhIeAkkSFJ5RbiJO0At6s/DzqfHAftxTxcXqIWtA+atEGkXT57i0erBEhWanAUFgus2CTvBQ==
X-Received: by 2002:a63:40a:: with SMTP id 10mr10366899pge.317.1565225964448; 
	Wed, 07 Aug 2019 17:59:24 -0700 (PDT)
Received: from apollo.hsd1.ca.comcast.net (c-73-71-176-3.hsd1.ca.comcast.net.
	[73.71.176.3]) by smtp.gmail.com with ESMTPSA id
	bo20sm371947pjb.23.2019.08.07.17.59.23
	(version=TLS1_3 cipher=AEAD-AES256-GCM-SHA384 bits=256/256);
	Wed, 07 Aug 2019 17:59:23 -0700 (PDT)
From: Khem Raj <raj.khem@gmail.com>
To: openembedded-core@lists.openembedded.org
Date: Wed,  7 Aug 2019 17:59:13 -0700
Message-Id: <20190808005913.15713-1-raj.khem@gmail.com>
X-Mailer: git-send-email 2.22.0
MIME-Version: 1.0
Subject: [PATCH V3] musl: Update to master tip
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
X-List-Received-Date: Thu, 08 Aug 2019 00:59:24 -0000
Content-Transfer-Encoding: 8bit

Fix for RISC-V build regression

64bit time syscall plumbing

Changes are here [1]

[1] https://git.musl-libc.org/cgit/musl/log/?qt=range&q=0ce49d0a301b4142741b32773492af90f66ed3ca..d0b547dfb5f7678cab6bc39dd736ed6454357ca4

Signed-off-by: Khem Raj <raj.khem@gmail.com>
---
v2:
- Move to latest tip
- Add a fix to fix the ssh issue seen on AB testing

v3:
- Update to latest tip which includes the regression fix as well

 meta/recipes-core/musl/musl_git.bb | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta/recipes-core/musl/musl_git.bb b/meta/recipes-core/musl/musl_git.bb
index 039932a3bc..c3786c4eb3 100644
--- a/meta/recipes-core/musl/musl_git.bb
+++ b/meta/recipes-core/musl/musl_git.bb
@@ -4,7 +4,7 @@
 require musl.inc
 inherit linuxloader
 
-SRCREV = "0ce49d0a301b4142741b32773492af90f66ed3ca"
+SRCREV = "d0b547dfb5f7678cab6bc39dd736ed6454357ca4"
 
 BASEVER = "1.1.23"
 
-- 
2.22.0


