Return-Path: <daniel.diaz@linaro.org>
Received: from mail-ot0-f169.google.com (mail-ot0-f169.google.com
	[74.125.82.169])
	by mail.openembedded.org (Postfix) with ESMTP id 7819C77B65
	for <openembedded-core@lists.openembedded.org>;
	Thu, 23 Mar 2017 18:29:09 +0000 (UTC)
Received: by mail-ot0-f169.google.com with SMTP id a5so1500844oth.1
	for <openembedded-core@lists.openembedded.org>;
	Thu, 23 Mar 2017 11:29:11 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
	h=from:to:cc:subject:date:message-id:mime-version
	:content-transfer-encoding;
	bh=anZZEIQdh5Gmnaa2MoJIKjAhm+7jMbipzvOQQ51hD2M=;
	b=FvAMcPY3Mbbg54efq1UaVY7xmeh1sYf+IMJb5Et1W6yqP2Rafx6Di9dijJySGHLbL4
	++YrWTxVO31Rr+XKGagQnzXZQZA5vUnlYtC+5z70jo/uYj1l511a8orcD0Y1PLSboEO6
	JnJHQap9mR0ixkVyScbHUdcaGH7mfLVvCqI2c=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
	:content-transfer-encoding;
	bh=anZZEIQdh5Gmnaa2MoJIKjAhm+7jMbipzvOQQ51hD2M=;
	b=iq8ldBXvcoyrWsU0HRrBIPD4nFafpqr5t66wQOz5TzZh2CmTiBk82b6TG+YbkNXFqk
	zP9Kahyd8cNpCTty9t92QjhAiq4DX4If4jQ9hQO1KSH7mLYmr1RZ/1mltpbblIwX9B6W
	1BqL1yWmP5Y9aY1XSlCGtSZVV9xOi3qFfpO+eudfRoaLfezwZFO+K69JOUNc2MUI13F7
	nLudmnsetiVb18zcrHEJQLyI8D1yJYMKV9wyWuTnkEisUa8FePUEG+YUWgKkrfIIW9Wu
	FrQWpMTKoB6qvu96Eark4XG8wNmDXCu9UFSSuRSXfzs78AwtjkY9SzYxzcLxvntyJ132
	/Dww==
X-Gm-Message-State: AFeK/H0QQT0iMZpNNlimFWJPIspcKjIu6bNoDFsELodsX+wUv2rnmDIMbw1yLn1qJvZYlDtQ
X-Received: by 10.157.54.69 with SMTP id w63mr2051189otb.12.1490293751199;
	Thu, 23 Mar 2017 11:29:11 -0700 (PDT)
Received: from aura.cortijodelrio.net
	(CableLink67-82.telefonia.InterCable.net. [201.172.67.82])
	by smtp.googlemail.com with ESMTPSA id
	x143sm460812oia.26.2017.03.23.11.29.10
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
	Thu, 23 Mar 2017 11:29:10 -0700 (PDT)
From: =?UTF-8?q?Daniel=20D=C3=ADaz?= <daniel.diaz@linaro.org>
To: openembedded-core@lists.openembedded.org
Date: Thu, 23 Mar 2017 12:28:20 -0600
Message-Id: <1490293700-17717-1-git-send-email-daniel.diaz@linaro.org>
X-Mailer: git-send-email 1.9.1
MIME-Version: 1.0
Cc: Koen Kooi <koen.kooi@linaro.org>
Subject: [PATCH] base-files: resize only serial tty's in profile
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
X-List-Received-Date: Thu, 23 Mar 2017 18:29:10 -0000
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

Signed-off-by: Daniel Díaz <daniel.diaz@linaro.org>
---
 meta/recipes-core/base-files/base-files/profile | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta/recipes-core/base-files/base-files/profile b/meta/recipes-core/base-files/base-files/profile
index 7367fd1..c616616 100644
--- a/meta/recipes-core/base-files/base-files/profile
+++ b/meta/recipes-core/base-files/base-files/profile
@@ -26,7 +26,7 @@ if [ -x /usr/bin/resize ] && termpath="`tty`"; then
   # Make sure we are on a serial console (i.e. the device used starts with /dev/tty),
   # otherwise we confuse e.g. the eclipse launcher which tries do use ssh
   case "$termpath" in
-  /dev/tty*) resize >/dev/null
+  /dev/tty[A-z]*) resize >/dev/null
   esac
 fi
 
-- 
1.9.1


