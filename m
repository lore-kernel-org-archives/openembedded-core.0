Return-Path: <richard.purdie@linuxfoundation.org>
Received: from mail-wm1-f50.google.com (mail-wm1-f50.google.com
	[209.85.128.50])
	by mail.openembedded.org (Postfix) with ESMTP id 9F188793F3
	for <openembedded-core@lists.openembedded.org>;
	Mon, 24 Sep 2018 22:13:46 +0000 (UTC)
Received: by mail-wm1-f50.google.com with SMTP id n11-v6so11542767wmc.2
	for <openembedded-core@lists.openembedded.org>;
	Mon, 24 Sep 2018 15:13:48 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=linuxfoundation.org; s=google;
	h=from:to:subject:date:message-id;
	bh=BjoV7wXRlVsss9F9JJNC7R/iE8IdNRhlHj5efdxKq/I=;
	b=gdn7+Lt9JSv2U/Ll7dfZo3sF4uv3tZZ2o4HHrMvlauJ/9sEj0o9W7OBmMqgoJ9lzAX
	HUUTzgAA+10D7t1+ZOgG8HaEgMN4igtC5k39bhkRXjH+IXMb1XcLXP0PLNwTe3a7bN5U
	WcHIyasiwpfoK5CsJl8tii182SDgrmMn2jE9I=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:subject:date:message-id;
	bh=BjoV7wXRlVsss9F9JJNC7R/iE8IdNRhlHj5efdxKq/I=;
	b=PP2n0wjgJEubCtRea5GrfdgDXOQ17D2Kv4RbzGz8MHbcNfE15xmy7hqJpMP7nEmB9m
	KUGjKTczu7XgJ4iexo6FkdGBYEmJ4aqa8Ytbt7ilsCVrTdt8StJpYqAjZa3RCr/d4wS6
	Nd7RHopjNITbKpk/1nqSI3qwPHTQFpPUouq8yhB3jz/KtM1AuzzO09CP4V6xZ90RmPA1
	odygFYXBrPX/MC6SaPPXStbTXrTT3Xf05/1J/ME2BST0moQcOTNaGUnS4Gzt4AzA01Cq
	1UQsqt328UOE3pGzVdufwRpnqZUwy4uhPV/BKG/KzTCibm4VBcCOS16n+IvKf/LV7Dno
	HAaw==
X-Gm-Message-State: ABuFfoikLfPu75qV6ajjtiC04H0btjCrJhDPQb2dU3g+nDK3C/KQheTR
	VOw6+3Jm89XOnS9gxq0eHnACoDuefTg=
X-Google-Smtp-Source: ACcGV616PgFLqB2vxbbriIzMK8jzS8kYYgVPf8ZWWdixIigVfQ9yfD6LmulPvggy1OhQrhvS1y9KAw==
X-Received: by 2002:a1c:d785:: with SMTP id
	o127-v6mr212321wmg.67.1537827227003; 
	Mon, 24 Sep 2018 15:13:47 -0700 (PDT)
Received: from hex.int.rpsys.net (5751f4a1.skybroadband.com. [87.81.244.161])
	by smtp.gmail.com with ESMTPSA id
	j133-v6sm563856wmd.12.2018.09.24.15.13.45
	for <openembedded-core@lists.openembedded.org>
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Mon, 24 Sep 2018 15:13:46 -0700 (PDT)
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: openembedded-core@lists.openembedded.org
Date: Mon, 24 Sep 2018 23:13:44 +0100
Message-Id: <20180924221344.16020-1-richard.purdie@linuxfoundation.org>
X-Mailer: git-send-email 2.17.1
Subject: [PATCH] scripts/autobuilder-worker-prereq-tests: Add to todo list
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
X-List-Received-Date: Mon, 24 Sep 2018 22:13:46 -0000

Note further tests needed after encountering issues.

Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
---
 scripts/autobuilder-worker-prereq-tests | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/scripts/autobuilder-worker-prereq-tests b/scripts/autobuilder-worker-prereq-tests
index e65071b227f..c0148fbce88 100755
--- a/scripts/autobuilder-worker-prereq-tests
+++ b/scripts/autobuilder-worker-prereq-tests
@@ -10,6 +10,9 @@
 # Add python3-git test
 # Add pigz test
 # vnc tests/checkvnc?
+# test sendmail works (for QA email notification)
+# test error report submission works
+# test buildistory git repo works?
 #
 
 . ./oe-init-build-env > /dev/null
-- 
2.17.1


