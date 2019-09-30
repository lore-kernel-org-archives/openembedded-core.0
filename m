Return-Path: <akuster808@gmail.com>
Received: from mail-pl1-f193.google.com (mail-pl1-f193.google.com
	[209.85.214.193])
	by mail.openembedded.org (Postfix) with ESMTP id 4B3A67BD72
	for <openembedded-core@lists.openembedded.org>;
	Mon, 30 Sep 2019 04:47:54 +0000 (UTC)
Received: by mail-pl1-f193.google.com with SMTP id t10so3401862plr.8
	for <openembedded-core@lists.openembedded.org>;
	Sun, 29 Sep 2019 21:47:55 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=from:to:subject:date:message-id:in-reply-to:references;
	bh=1Su/5nV7II3Jkg0RaUvRENr7KKJ3ROXXmUd3eBh3R4w=;
	b=fkk1iIYo04eGgDWBO7YqCwwH7AUMRCS9WzgaNaqrgqYYBYUgzbCzLGCHvNHv190oN1
	E5BUGOu5VXxhVfZEkVATq4+1x1CXxcNtfi3wyAdhXc1nT5ygVBRztY00segjNUlFk0dM
	ryy7Qgj2gQuwOSF4apZQs//27kFAslTbHDBm7fH7qsOr0c56XoIpbiDsWyJNyc0qjpuS
	kSrJni7XLYYm7uTRXLkZHaIlg9CuLz1QP4FwBXtozwjqJKQaZG2fR8PEbGzJCKVTlYF5
	N4xTuQmpJH81axr1Fk4zt7wQO0RRqKULSliKpuXcXlPnHnwm1X8EZw9DzUqb0PhuKwuZ
	YWrA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
	:references;
	bh=1Su/5nV7II3Jkg0RaUvRENr7KKJ3ROXXmUd3eBh3R4w=;
	b=jM6s20TQ2J/Y3cLf+S9qknFe/r8+IoVx+ENiM2eBDXUrtGRcqP2hWqyJiJKGRJ14vz
	nC/6jvK1/lm4GR+3zfYx/AsjDxk4NS7Hn3xkFsAmNMLqBYh1I0wEVjxjt19oNncvHyH1
	R1eVS12TWwaxa+CrQ2tBDghteto7jr52PROGDjOGdDaYVo/KxA6zZy6OpLVVjTsa0AQo
	qKrJj/jtZPpWktgIwHlk/SsUPX/KQvY1gpN9BsNxbfiwKQZwirthSNANTBRMOULm71nh
	uNZM0gXgW2RUKdWMqvNNyxbF1TewiiyXjgOkfowevEFGHq8Lq3z0Ebw4PEcD+NvCp832
	J8VA==
X-Gm-Message-State: APjAAAWpk+ltX1LrhnqlfavtlO7Cxm7Q++YDfiMjQcuE7eHDpH2QJqLD
	Dj0M/ld0aZIa/aKev3t0FO+hKw3Udpo=
X-Google-Smtp-Source: APXvYqzGKhrv8kotBW1ZgxEQCc27OcZu6VEo6tx1beq73ExT9Q/eNkNEKAxZG8WMxJqNYI1F075jAQ==
X-Received: by 2002:a17:902:a70f:: with SMTP id
	w15mr18627776plq.132.1569818875311; 
	Sun, 29 Sep 2019 21:47:55 -0700 (PDT)
Received: from akuster-ThinkPad-T460s.hsd1.ca.comcast.net
	([2601:202:4180:a5c0:edf9:811d:ad92:85c2])
	by smtp.gmail.com with ESMTPSA id
	h15sm18888493pgn.76.2019.09.29.21.47.54
	for <openembedded-core@lists.openembedded.org>
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
	Sun, 29 Sep 2019 21:47:54 -0700 (PDT)
From: Armin Kuster <akuster808@gmail.com>
To: openembedded-core@lists.openembedded.org
Date: Sun, 29 Sep 2019 21:46:57 -0700
Message-Id: <789be0bd85bfcd6ee27d68fa53f67bd221f8286b.1569818533.git.akuster808@gmail.com>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <cover.1569818533.git.akuster808@gmail.com>
References: <cover.1569818533.git.akuster808@gmail.com>
Subject: [warrior-next 02/54] binutils: CVE-2019-9070 is same as CVE-2019-9071
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
X-List-Received-Date: Mon, 30 Sep 2019 04:47:54 -0000

From: Anuj Mittal <anuj.mittal@intel.com>

See:

https://gcc.gnu.org/bugzilla/show_bug.cgi?id=89395

(From OE-Core rev: cef180de3684491f1ac4180ddbcc102121222181)

Signed-off-by: Anuj Mittal <anuj.mittal@intel.com>
Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
Signed-off-by: Armin Kuster <akuster808@gmail.com>
---
 meta/recipes-devtools/binutils/binutils/CVE-2019-9071.patch | 1 +
 1 file changed, 1 insertion(+)

diff --git a/meta/recipes-devtools/binutils/binutils/CVE-2019-9071.patch b/meta/recipes-devtools/binutils/binutils/CVE-2019-9071.patch
index 26f4809..f025399 100644
--- a/meta/recipes-devtools/binutils/binutils/CVE-2019-9071.patch
+++ b/meta/recipes-devtools/binutils/binutils/CVE-2019-9071.patch
@@ -16,6 +16,7 @@ Subject: [PATCH] Pull in patch for libiberty that fixes a stack exhaustion bug
 	reached.
 
 CVE: CVE-2019-9071
+CVE: CVE-2019-9070
 Upstream-Status: Backport
 Signed-off-by: Anuj Mittal <anuj.mittal@intel.com>
 ---
-- 
2.7.4


