Return-Path: <vishal.bhoj@linaro.org>
Received: from mail-wr0-f179.google.com (mail-wr0-f179.google.com
	[209.85.128.179])
	by mail.openembedded.org (Postfix) with ESMTP id 37A7F78315
	for <openembedded-core@lists.openembedded.org>;
	Thu, 31 Aug 2017 10:29:04 +0000 (UTC)
Received: by mail-wr0-f179.google.com with SMTP id k94so944638wrc.0
	for <openembedded-core@lists.openembedded.org>;
	Thu, 31 Aug 2017 03:29:06 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
	h=from:to:cc:subject:date:message-id;
	bh=gjFzriWPkIGyR/MjbVV0SePk2xGvJyL8vL/C380cZ+g=;
	b=JoB4IRlE1qGhwPqeYeQ68mRBBoEVSY7SqLkkauMFz/UMrR2J6dqX2MCzQjmAW08ZKt
	IE/meZOYTmI60SPKr4ZH8ohVt1MbolmK/L+PxFPH853itdRutyHUAL/EY8xH8uQij2T6
	xI1ThSnZtQajDK0fMQA06sEnB11QVvs8akabo=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:cc:subject:date:message-id;
	bh=gjFzriWPkIGyR/MjbVV0SePk2xGvJyL8vL/C380cZ+g=;
	b=bX7LVHUs34q1MSiYjDERZUkj3N+lL3aQz4VsCmlP6+SFzFNjL4Zg10rcDc0quYOUwP
	e1JHpr5mu4WvM31LlREXtmmFaTm98oWwvgukEe3EFhvpFUGFNHiVDoN9hmH7P8QLiBVI
	4Gz0bRDwuL91kANlDGH1M2UUtOqjlQMeIlt0veFAuSDN3vCSTN435j4lUtykjrhSkXC6
	By1scpTv0TnKUmTSUmrrSuLaoj8vumttfAUrTWcpZRAlgQli/HHXTupV1hEnEFFl9ERg
	+R5psuu+1DjqwSR89NJZquThJSmZOxuiNAmNpM/3Av0axYYs8O1WAuAX1bvxVA5FEKcx
	OGJQ==
X-Gm-Message-State: AHYfb5hJPtNd/dxkUOHEhnHmC5s4fAqq2eIHPlKOYKfNqogzU+sDqGip
	xFPSE8KmRisPXI4jn3nnmw==
X-Received: by 10.223.141.170 with SMTP id o39mr1197600wrb.23.1504175345425;
	Thu, 31 Aug 2017 03:29:05 -0700 (PDT)
Received: from hackbox.linaro.org ([81.128.185.36])
	by smtp.gmail.com with ESMTPSA id
	l19sm6104288wrl.45.2017.08.31.03.29.03
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
	Thu, 31 Aug 2017 03:29:04 -0700 (PDT)
From: Vishal Bhoj <vishal.bhoj@linaro.org>
To: openembedded-core@lists.openembedded.org
Date: Thu, 31 Aug 2017 11:28:49 +0100
Message-Id: <20170831102849.24684-1-vishal.bhoj@linaro.org>
X-Mailer: git-send-email 2.13.0
Cc: patches@linaro.org
Subject: [PATCH] openssl10: set right target for ilp32 build
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
X-List-Received-Date: Thu, 31 Aug 2017 10:29:05 -0000

Signed-off-by: Vishal Bhoj <vishal.bhoj@linaro.org>
---
 meta/recipes-connectivity/openssl/openssl10.inc | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta/recipes-connectivity/openssl/openssl10.inc b/meta/recipes-connectivity/openssl/openssl10.inc
index 5782990850..a710e9e25a 100644
--- a/meta/recipes-connectivity/openssl/openssl10.inc
+++ b/meta/recipes-connectivity/openssl/openssl10.inc
@@ -126,7 +126,7 @@ do_configure () {
 	linux-mips*)
 		target=debian-mips
 		;;
-	linux-microblaze*|linux-nios2*)
+	linux-microblaze*|linux-nios2*|linux-gnu*ilp32**)
 		target=linux-generic32
 		;;
 	linux-powerpc)
--
2.13.0


