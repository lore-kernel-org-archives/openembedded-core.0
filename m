Return-Path: <raj.khem@gmail.com>
Received: from mail-pg0-f67.google.com (mail-pg0-f67.google.com [74.125.83.67])
	by mail.openembedded.org (Postfix) with ESMTP id CEC7B78906
	for <openembedded-core@lists.openembedded.org>;
	Sun, 11 Mar 2018 08:08:09 +0000 (UTC)
Received: by mail-pg0-f67.google.com with SMTP id e3so5254445pga.6
	for <openembedded-core@lists.openembedded.org>;
	Sun, 11 Mar 2018 00:08:11 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=from:to:cc:subject:date:message-id:in-reply-to:references;
	bh=awoT8qfZLVJR/wzs3QHnm7bqDWIR/7+SLqYwCG+gyn0=;
	b=EE7A0UnBTRHYzlTuCCQS+724mGqTQy9c4T6fL7krOruNS6sgnjJkvpeSEYQTv7nAAU
	8Fgz05RqBfYvKe0D9Gb9prXv748Uohd0PeqJIYp2ECIPcPJIlyawcOHzDqDIE8IGzZnX
	RVIog2SgPEMfUE/tZZmtm/xcqQI0xBYOeDK/wTlA8ssCRWQERkruFLXIweL0+Q4kkelQ
	UVF+/3NaO/iQscVrQQ+kYkGp+vAzSEpV4Ojwk84OmhgQoo4Zod++x6i1XNPORVS33Z7k
	5hwBR/Z6Z9Nmff3yNTMKOrMEk1WkLbLYnbH8IopLauGLQDYBZuTLWXkRTBQRWLqCKq6c
	pCwQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
	:references;
	bh=awoT8qfZLVJR/wzs3QHnm7bqDWIR/7+SLqYwCG+gyn0=;
	b=i6y30S8VoAcY3csABTW/d6NAUPJa6w0hcnuvJaObyEdL6y4EccMxnDUuqDe5BJ6Avi
	TTrOxDd9UEpVlSMkuKfXEWxkAxUEaVmm0s4AbtoVjABqPfpr8hz7FxJQ+RCJxHy9/uLy
	zf7s8UUafZkzkIQFSkrEqyzbDGUlNMIVv1AqYvsKnT4KU+fIGRRM/QDQWiDxzTi7oGk5
	FVps2ym8kqH8sG3opZXK63MZ47b5kx39BM8m9jppbp04Nez4iQUkWWiu5TASS+UcB6hp
	kNoPBc9lKc8JVsxxLulxSwCQ4E+52YhKQhWvXrjYyaDiJyCcMdmjK8cc/0maNzS4nLc+
	IUWg==
X-Gm-Message-State: AElRT7Fe2JGW++/XfUhgV6dOCCBhCsoQoqkt0EAUtYONpzBNw49k7AKd
	GAbezPZ8m6Cqj3tsUaX8DsXJfg==
X-Google-Smtp-Source: AG47ELvjUwHFNkPtoxBFslIgge3gKJE9OTll/cmF/M+snzkGl+BcyYe5gxl6fbUHIXfkUGQjvcLi4A==
X-Received: by 10.99.124.1 with SMTP id x1mr1509115pgc.318.1520755691153;
	Sun, 11 Mar 2018 00:08:11 -0800 (PST)
Received: from localhost.localdomain ([2601:646:8880:466c:6245:cbff:fe64:591])
	by smtp.gmail.com with ESMTPSA id
	q6sm8968184pga.37.2018.03.11.00.08.09
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Sun, 11 Mar 2018 00:08:10 -0800 (PST)
From: Khem Raj <raj.khem@gmail.com>
To: openembedded-core@lists.openembedded.org
Date: Sun, 11 Mar 2018 00:07:57 -0800
Message-Id: <9925eeb593e2b0117dd123ab5ac56908dfc23871.1520755515.git.raj.khem@gmail.com>
X-Mailer: git-send-email 2.16.2
In-Reply-To: <cover.1520755515.git.raj.khem@gmail.com>
References: <cover.1520755515.git.raj.khem@gmail.com>
Subject: [PATCH 3/4] site/riscv: Shunt the realloc configure test for startup-notification
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
X-List-Received-Date: Sun, 11 Mar 2018 08:08:09 -0000

Signed-off-by: Khem Raj <raj.khem@gmail.com>
---
 meta/site/riscv32-linux | 2 ++
 meta/site/riscv64-linux | 2 ++
 2 files changed, 4 insertions(+)

diff --git a/meta/site/riscv32-linux b/meta/site/riscv32-linux
index a496bd1aca..138aeb0a11 100644
--- a/meta/site/riscv32-linux
+++ b/meta/site/riscv32-linux
@@ -2,3 +2,5 @@
 glib_cv_stack_grows=${glib_cv_stack_grows=no}
 glib_cv_uscore=${glib_cv_uscore=no}
 
+# startup-notification
+lf_cv_sane_realloc=${lf_cv_sane_realloc=yes}
diff --git a/meta/site/riscv64-linux b/meta/site/riscv64-linux
index a496bd1aca..138aeb0a11 100644
--- a/meta/site/riscv64-linux
+++ b/meta/site/riscv64-linux
@@ -2,3 +2,5 @@
 glib_cv_stack_grows=${glib_cv_stack_grows=no}
 glib_cv_uscore=${glib_cv_uscore=no}
 
+# startup-notification
+lf_cv_sane_realloc=${lf_cv_sane_realloc=yes}
-- 
2.16.2


