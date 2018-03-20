Return-Path: <raj.khem@gmail.com>
Received: from mail-pl0-f67.google.com (mail-pl0-f67.google.com
	[209.85.160.67])
	by mail.openembedded.org (Postfix) with ESMTP id D20A5789C1
	for <openembedded-core@lists.openembedded.org>;
	Tue, 20 Mar 2018 03:02:33 +0000 (UTC)
Received: by mail-pl0-f67.google.com with SMTP id 61-v6so154225plf.3
	for <openembedded-core@lists.openembedded.org>;
	Mon, 19 Mar 2018 20:02:35 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=from:to:cc:subject:date:message-id;
	bh=+GJZjDg1LWn2ieu6NAi8g5tM7RR+XHJ4Tnkg4VQTIxQ=;
	b=feveiixzLvoWEaxQ2FoNvGJ9IeRLPcuYPXFlAYc2nsyyLUZ5tqGdaro76UV14SBM+5
	K2rcbYgStht6uWdNggtBF85ZqNaeMafj95d2oCzXBpjSQPalBY6TFtgLJvA9GhS6kl7K
	SDnVd4nHKU8CTZyPa0hAE6lXiN0lXrWb4UUU1FvUyOZgX0xYj0SgFbvw8bdR0kyTw7px
	8BCXSo9pCcCDkZpZdjSxRRLMaQ4c9EMytpQ8NnfuTfMhhlX0edTlm09e2ZFwl2smWtMA
	Dik5IAsmlAS1utYAznZOG9MNTXH2vn2NNhMtL14/R8p5QpB3LxFNDzBa9hdBvTPIgUEg
	+xaQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:cc:subject:date:message-id;
	bh=+GJZjDg1LWn2ieu6NAi8g5tM7RR+XHJ4Tnkg4VQTIxQ=;
	b=cx6BY6BhkRaTfSl9b6mjlz6IyAIw4qTApoz6bRln3pLxXKjbtYGHWUW4xYoSt8L7ta
	2aIwiWj1tJYbpx/XrTLrDbt5W7n6oEatl+ValgnxbDy3s+ZKgoC4jOqUZ2/BIjm//dpQ
	PUfE8DQdexd4CERSGa45QOmRSDqC7feEGUoRPRaGfCEvaA72Z1wrkGpnwfL4VQLpLFfo
	cPhRNllgBF+vDdnvcH94y2a2lVo9qEQ7/LXZ6yQsnapO2Apeud60tEd2ITtBiHOTCvXF
	GdHRdggFAOWpKKS4s3bzHJwcT3DLdRPvLFFKPppPtEOv8SFgBHSGL8pAXLeyFhIr/rdD
	bFlA==
X-Gm-Message-State: AElRT7EerAUWEFRSPb7buVlYSs1e4AwQIPGZ5pgHoEcPIXbFWZ0Qsik0
	pwMgkDAnCGresS5ICs5LSYe9vA==
X-Google-Smtp-Source: AG47ELsdQcgHMy+m+LIvhi7rczb81u3xxPFbOdVh7/XsEh6+/Tj6ofAc+uKEIRizAYryIlFsSYfCUA==
X-Received: by 2002:a17:902:9349:: with SMTP id
	g9-v6mr12475152plp.243.1521514954958; 
	Mon, 19 Mar 2018 20:02:34 -0700 (PDT)
Received: from localhost.localdomain ([2601:646:8880:466c:6245:cbff:fe64:591])
	by smtp.gmail.com with ESMTPSA id
	z15sm738405pfh.11.2018.03.19.20.02.34
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Mon, 19 Mar 2018 20:02:34 -0700 (PDT)
From: Khem Raj <raj.khem@gmail.com>
To: openembedded-core@lists.openembedded.org
Date: Mon, 19 Mar 2018 20:02:25 -0700
Message-Id: <20180320030225.37857-1-raj.khem@gmail.com>
X-Mailer: git-send-email 2.16.2
Subject: [PATCH] site/risc-v: Cache more variables to build libIDL
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
X-List-Received-Date: Tue, 20 Mar 2018 03:02:34 -0000

These variables force runtime tests during configure
they are already cached for other architectures

Signed-off-by: Khem Raj <raj.khem@gmail.com>
---
 meta/site/riscv32-linux | 13 +++++++++++++
 meta/site/riscv64-linux |  8 ++++++++
 2 files changed, 21 insertions(+)

diff --git a/meta/site/riscv32-linux b/meta/site/riscv32-linux
index 138aeb0a11..8a8a5fc1c4 100644
--- a/meta/site/riscv32-linux
+++ b/meta/site/riscv32-linux
@@ -1,6 +1,19 @@
+# general
+ac_cv_alignof_guint32=4
+ac_cv_alignof_guint64=8
+ac_cv_alignof_unsigned_long=4
+
 # glib-2.0
 glib_cv_stack_grows=${glib_cv_stack_grows=no}
 glib_cv_uscore=${glib_cv_uscore=no}
+glib_cv_sizeof_gmutex=${glib_cv_sizeof_gmutex=24}
+glib_cv_sizeof_intmax_t=${glib_cv_sizeof_intmax_t=8}
+glib_cv_sizeof_ptrdiff_t=${glib_cv_sizeof_ptrdiff_t=4}
+glib_cv_sizeof_size_t=${glib_cv_sizeof_size_t=4}
+glib_cv_sizeof_system_thread=${glib_cv_sizeof_system_thread=4}
+
+# libidl
+libIDL_cv_long_long_format=${libIDL_cv_long_long_format=ll}
 
 # startup-notification
 lf_cv_sane_realloc=${lf_cv_sane_realloc=yes}
diff --git a/meta/site/riscv64-linux b/meta/site/riscv64-linux
index 138aeb0a11..69ff137c9a 100644
--- a/meta/site/riscv64-linux
+++ b/meta/site/riscv64-linux
@@ -1,6 +1,14 @@
+# general
+ac_cv_alignof_guint32=4
+ac_cv_alignof_guint64=8
+ac_cv_alignof_unsigned_long=8
+
 # glib-2.0
 glib_cv_stack_grows=${glib_cv_stack_grows=no}
 glib_cv_uscore=${glib_cv_uscore=no}
 
+# libidl
+libIDL_cv_long_long_format=${libIDL_cv_long_long_format=ll}
+
 # startup-notification
 lf_cv_sane_realloc=${lf_cv_sane_realloc=yes}
-- 
2.16.2


