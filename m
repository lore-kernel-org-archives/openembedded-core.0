Return-Path: <akuster808@gmail.com>
Received: from mail-pg1-f196.google.com (mail-pg1-f196.google.com
	[209.85.215.196])
	by mail.openembedded.org (Postfix) with ESMTP id A103A7E323
	for <openembedded-core@lists.openembedded.org>;
	Mon,  3 Jun 2019 15:07:15 +0000 (UTC)
Received: by mail-pg1-f196.google.com with SMTP id d30so8444407pgm.7
	for <openembedded-core@lists.openembedded.org>;
	Mon, 03 Jun 2019 08:07:17 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=from:to:subject:date:message-id:in-reply-to:references;
	bh=ZJgy31HwqQGQh3vpGEugRP+B/IwVmQlNVQTSGDBTfrU=;
	b=HsxC0EbzHQcS6iUFSVO6D+rbzJGLT88NFJrChaOH+OayoJtW9xWsP/zlZCtwTHHZNk
	yAEpF2d2/jKtStrMfCdXNiGhZND+Wzi5TtyjTk+KRhEqjjhJCMmgj5LOcde2BIH0stzL
	gRYL9joc0Up43B+U6T1Fj03ungn+WEn9s3YUZOiWURHMQ2OKvTtvGNdZishDUQTZUbrP
	cuMmQ+5b3Ipff/q1IfgEEgbK0a1glWvULpTTnVgeHUyGmk7T9GYe4RL1rRTRy8LQjmke
	DOwdNsY/sYv1gDSfpZ2cXdQeeXNJ2G5T+M7kNp5ZwvF/vFUHoaVXSaebxvZtBn8G1YKy
	qdoA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
	:references;
	bh=ZJgy31HwqQGQh3vpGEugRP+B/IwVmQlNVQTSGDBTfrU=;
	b=bwGuL3HaOl2E5WQL4q2LQxUUG1HrIsdxfngO5G7uNitLqY6usp0QN7mjAlkAdg33AK
	9QVDd6D3pNz1H+hY3tAjfDmoVC6dqxH2bBkk2NGEuqcfO48YnfXVFEGAARda+gAVpXtE
	bqb+sVWzH4TocWVk8TPWEaBSaW3LH8V3P2e8/zoqFhibh4SaLaGjZOAUF6QQbb2Yw+nW
	rX2Hct74rO/2vf48iVDM1VPOnUHOwi22a/ipmfVqOfdyQuVsvKmcW+u1Vo1YdqTROXyH
	YhtYlrDYfTh6iIORTCMAvHMfesV18anuP6PAIN8azD/pd3jZdibYnW9KOXehGb9M8twR
	r5nw==
X-Gm-Message-State: APjAAAX7a3jnyXeWUMbxryZUAONYkP2ZulyWyBrbXFgzFdqs0Loj4zcR
	k4YbHGSstkMAx9gLHgAHzvNeZ8Ez
X-Google-Smtp-Source: APXvYqy0PA8d/jcHiHcRnUymUnHQppk8oCHGM4WraD5WzDIjICzpcZ5FzJeKOqU37OfSb6FJ+zbCLQ==
X-Received: by 2002:a17:90a:a505:: with SMTP id
	a5mr13163141pjq.27.1559574436807; 
	Mon, 03 Jun 2019 08:07:16 -0700 (PDT)
Received: from akuster-ThinkPad-T460s.hsd1.ca.comcast.net
	([2601:202:4180:c33:847:4796:a7c5:c767])
	by smtp.gmail.com with ESMTPSA id
	s5sm14250546pgj.60.2019.06.03.08.07.16
	for <openembedded-core@lists.openembedded.org>
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
	Mon, 03 Jun 2019 08:07:16 -0700 (PDT)
From: Armin Kuster <akuster808@gmail.com>
To: openembedded-core@lists.openembedded.org
Date: Mon,  3 Jun 2019 08:06:52 -0700
Message-Id: <f704c1021e311ad493374d8cd38e800b79a96746.1559574291.git.akuster808@gmail.com>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <cover.1559574291.git.akuster808@gmail.com>
References: <cover.1559574291.git.akuster808@gmail.com>
Subject: [PATCH 09/21] apr/apr-util: Add ptest dependency on libgcc
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
X-List-Received-Date: Mon, 03 Jun 2019 15:07:15 -0000

From: Richard Purdie <richard.purdie@linuxfoundation.org>

Avoid:

libgcc_s.so.1 must be installed for pthread_cancel to work

when running the ptest without libgcc.

Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
Signed-off-by: Armin Kuster <akuster808@gmail.com>
---
 meta/recipes-support/apr/apr-util_1.6.1.bb | 1 +
 meta/recipes-support/apr/apr_1.6.5.bb      | 2 ++
 2 files changed, 3 insertions(+)

diff --git a/meta/recipes-support/apr/apr-util_1.6.1.bb b/meta/recipes-support/apr/apr-util_1.6.1.bb
index 0c90f8d..1f9fea2 100644
--- a/meta/recipes-support/apr/apr-util_1.6.1.bb
+++ b/meta/recipes-support/apr/apr-util_1.6.1.bb
@@ -79,6 +79,7 @@ INSANE_SKIP_${PN} += "dev-so"
 inherit ptest
 
 RDEPENDS_${PN}-ptest_append_libc-glibc = " glibc-gconv-iso8859-1 glibc-gconv-iso8859-2 glibc-gconv-utf-7"
+RDEPENDS_${PN}-ptest += "libgcc"
 
 do_compile_ptest() {
 	cd ${B}/test
diff --git a/meta/recipes-support/apr/apr_1.6.5.bb b/meta/recipes-support/apr/apr_1.6.5.bb
index 432e4ed..79879ff 100644
--- a/meta/recipes-support/apr/apr_1.6.5.bb
+++ b/meta/recipes-support/apr/apr_1.6.5.bb
@@ -53,6 +53,8 @@ do_configure_prepend() {
 FILES_${PN}-dev += "${libdir}/apr.exp ${datadir}/build-1/*"
 RDEPENDS_${PN}-dev += "bash"
 
+RDEPENDS_${PN}-ptest += "libgcc"
+
 #for some reason, build/libtool.m4 handled by buildconf still be overwritten
 #when autoconf, so handle it again.
 do_configure_append() {
-- 
2.7.4


