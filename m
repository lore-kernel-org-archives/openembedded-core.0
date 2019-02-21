Return-Path: <richard.purdie@linuxfoundation.org>
Received: from mail-wr1-f52.google.com (mail-wr1-f52.google.com
	[209.85.221.52])
	by mail.openembedded.org (Postfix) with ESMTP id 5450C7CB36
	for <openembedded-core@lists.openembedded.org>;
	Thu, 21 Feb 2019 12:41:42 +0000 (UTC)
Received: by mail-wr1-f52.google.com with SMTP id n2so17702472wrw.8
	for <openembedded-core@lists.openembedded.org>;
	Thu, 21 Feb 2019 04:41:43 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=linuxfoundation.org; s=google;
	h=from:to:cc:subject:date:message-id:in-reply-to:references
	:mime-version:content-transfer-encoding;
	bh=xgmUYp1x1tQII35tCbjDMavj+PBi5qvPWNdAIrNbf80=;
	b=cCWrjOeegi0IrlCSMR0l72P3pigYX/4JljPA8tXNUECI6KbRs62MOldSlS25F5SSlE
	ioZN2Z9oj5uYj78GUwd+HqmyAY9tCMVCI7fMCEs1zvMOTRb5ggP9/xppfINxgg9CsEag
	6GIJ7O9qTYQmF76pebaCpvM0xkOoRAD7d8pYk=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
	:references:mime-version:content-transfer-encoding;
	bh=xgmUYp1x1tQII35tCbjDMavj+PBi5qvPWNdAIrNbf80=;
	b=IHyjqCoQ69gLVNs2xz8VrTLn17kgx2o4IG/0USpZkkN2k145qO8iTHb0r9uL8SAPQz
	e+d8kLvf7fEN/CHMRIGzYr9XoI0vOwI9Y0Iuh7UBujPPLKNlQv5z6ZhYVLeM+K5NKuzb
	FC/vuaiyZdd357ogGy3YyCbt9b/iWc9VGZdwzsfQmm7LkrFhxMnxa4DFMOPYouFsLw28
	EqvfCEaR/OUFEfcsJpn74ibpGMjaHVYRJUjabUStI6XwYRRBvWOYQyk7sFs3x42Aeg2K
	FnEu4tPmDl0Z8/ihL8j9/i20DZJr9/9mATIez6LDy1sUeY8qPIgWGuPRbNUcdiPMdzQd
	103A==
X-Gm-Message-State: AHQUAuYxR8GP5WpbxCuCU5yFPYVWPxR2/syqVZt4ORVNo99YBfcPH9J7
	GrRnNyAvfPZjESmhwOtfcAs7TutdTxk=
X-Google-Smtp-Source: AHgI3IZNN53f/CUJNkei6Qb94Re0kLu8/15iRa6NgM406OR0kQnWE5Q7FMk83L6q1PtMUZIMOy57dQ==
X-Received: by 2002:adf:b211:: with SMTP id u17mr21537338wra.322.1550752902669;
	Thu, 21 Feb 2019 04:41:42 -0800 (PST)
Received: from hex.int.rpsys.net (5751f4a1.skybroadband.com. [87.81.244.161])
	by smtp.gmail.com with ESMTPSA id
	d16sm20787379wru.52.2019.02.21.04.41.41
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Thu, 21 Feb 2019 04:41:41 -0800 (PST)
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: openembedded-core@lists.openembedded.org
Date: Thu, 21 Feb 2019 12:41:26 +0000
Message-Id: <20190221124130.25733-10-richard.purdie@linuxfoundation.org>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20190221124130.25733-1-richard.purdie@linuxfoundation.org>
References: <20190221124130.25733-1-richard.purdie@linuxfoundation.org>
MIME-Version: 1.0
Subject: [PATCH 10/14] readline: upgrade 7.0 -> 8.0
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
X-List-Received-Date: Thu, 21 Feb 2019 12:41:42 -0000
Content-Transfer-Encoding: 8bit

Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
---
 .../{readline-7.0 => readline-8.0}/configure-fix.patch     | 0
 .../readline/{readline-7.0 => readline-8.0}/norpath.patch  | 0
 meta/recipes-core/readline/readline_7.0.bb                 | 7 -------
 meta/recipes-core/readline/readline_8.0.bb                 | 7 +++++++
 4 files changed, 7 insertions(+), 7 deletions(-)
 rename meta/recipes-core/readline/{readline-7.0 => readline-8.0}/configure-fix.patch (100%)
 rename meta/recipes-core/readline/{readline-7.0 => readline-8.0}/norpath.patch (100%)
 delete mode 100644 meta/recipes-core/readline/readline_7.0.bb
 create mode 100644 meta/recipes-core/readline/readline_8.0.bb

diff --git a/meta/recipes-core/readline/readline-7.0/configure-fix.patch b/meta/recipes-core/readline/readline-8.0/configure-fix.patch
similarity index 100%
rename from meta/recipes-core/readline/readline-7.0/configure-fix.patch
rename to meta/recipes-core/readline/readline-8.0/configure-fix.patch
diff --git a/meta/recipes-core/readline/readline-7.0/norpath.patch b/meta/recipes-core/readline/readline-8.0/norpath.patch
similarity index 100%
rename from meta/recipes-core/readline/readline-7.0/norpath.patch
rename to meta/recipes-core/readline/readline-8.0/norpath.patch
diff --git a/meta/recipes-core/readline/readline_7.0.bb b/meta/recipes-core/readline/readline_7.0.bb
deleted file mode 100644
index 85dfaa62948..00000000000
--- a/meta/recipes-core/readline/readline_7.0.bb
+++ /dev/null
@@ -1,7 +0,0 @@
-require readline.inc
-
-SRC_URI += "file://configure-fix.patch \
-            file://norpath.patch"
-
-SRC_URI[archive.md5sum] = "205b03a87fc83dab653b628c59b9fc91"
-SRC_URI[archive.sha256sum] = "750d437185286f40a369e1e4f4764eda932b9459b5ec9a731628393dd3d32334"
diff --git a/meta/recipes-core/readline/readline_8.0.bb b/meta/recipes-core/readline/readline_8.0.bb
new file mode 100644
index 00000000000..99d022a32f6
--- /dev/null
+++ b/meta/recipes-core/readline/readline_8.0.bb
@@ -0,0 +1,7 @@
+require readline.inc
+
+SRC_URI += "file://configure-fix.patch \
+            file://norpath.patch"
+
+SRC_URI[archive.md5sum] = "7e6c1f16aee3244a69aba6e438295ca3"
+SRC_URI[archive.sha256sum] = "e339f51971478d369f8a053a330a190781acb9864cf4c541060f12078948e461"
-- 
2.20.1


