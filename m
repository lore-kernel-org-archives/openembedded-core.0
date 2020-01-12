Return-Path: <akuster808@gmail.com>
Received: from mail-pg1-f195.google.com (mail-pg1-f195.google.com
	[209.85.215.195])
	by mail.openembedded.org (Postfix) with ESMTP id AB9AD7F8B6
	for <openembedded-core@openembedded.org>;
	Sun, 12 Jan 2020 06:36:35 +0000 (UTC)
Received: by mail-pg1-f195.google.com with SMTP id 6so3122260pgk.0
	for <openembedded-core@openembedded.org>;
	Sat, 11 Jan 2020 22:36:37 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=from:to:cc:subject:date:message-id:in-reply-to:references;
	bh=eR2ft08DeiTl24R83rzvxRaio6Hyt0t+pPTAj7elHuk=;
	b=TGXfZtVxgp+wVlFfjgpRZGhlfGEWJ6rOhAAuezxxWX8aBqg3O6hx9096sUwuvh39tg
	D9vjL6wNSZaxB3QV6XMRKz7zhaZfxeqlXn9G3mMVhKXX8SY+YmmyT04/RZ+G6FyDgnSR
	sqBsA0mbovsbqabQdHcw9OquSBFCKqFl4brPwkIQ7ZWbtnQvqoz9Ebg7zgthCCPDR7Al
	+DDggVinzEFGnp0AcgDYh3kwYOOwnrpSUYMX/nojo2sV92WUivsgwCGRCDUGf5Jad3Km
	wgPi4zCaxj+b+fMRlxAI7Qc0WCjZebB4uPqUbPV08XHdD4b4h1ln8s5q324k4Zd6Jz0O
	lndg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
	:references;
	bh=eR2ft08DeiTl24R83rzvxRaio6Hyt0t+pPTAj7elHuk=;
	b=eOWhvLA5MFjXvCLb9PqafaSNmQ9Qc5O3zkqAvZNbwkA6eGFWZ+g7BBJR+tVnZCY+9+
	S6asyNbmnzMbdgp4490Otk8hfKPMIw7RBBsQ+VvNrKv+dAsE+WjuxfgUa2ubRXTIhH7o
	DxVn71zPIwIwgYRFvLQImP2lIJunhSTd0ddYt3pwUgwiHnCid799D7jBMsBqBahSnkQ3
	yKQs9T/MQYyUmTZG6Kwut49Aow4lmKgEXWEeEUTQVSpA7HL45F4Pjn8jkIpzzM7YOK15
	DtZ2ARqTyV6CD7usvf0uOtSNm0Yfit/UDKJrJt+03UBc7Yk2g/eDD5EFQ413LQByxMl9
	97+Q==
X-Gm-Message-State: APjAAAVUzbmmhqy1dLVtTpk6Gtxl9Ximt88ZYotifmdkNqYs9fI4zQ9J
	BY5UrGcMoJCBBDITrCEhZwPVAluv
X-Google-Smtp-Source: APXvYqyAco6GuvMvqg3iK9mMSNquHrhT0ab7X3yvVrVC0i3AU/2sgbBc2e+vV/ybFrXMp/3wphNX+Q==
X-Received: by 2002:a65:484d:: with SMTP id i13mr14836155pgs.32.1578810996590; 
	Sat, 11 Jan 2020 22:36:36 -0800 (PST)
Received: from akuster-ThinkPad-T460s.hsd1.ca.comcast.net
	([2601:202:4180:a5c0:3849:7200:d754:59fc])
	by smtp.gmail.com with ESMTPSA id
	136sm8437493pgg.74.2020.01.11.22.36.35
	(version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
	Sat, 11 Jan 2020 22:36:36 -0800 (PST)
From: Armin Kuster <akuster808@gmail.com>
To: openembedded-core@openembedded.org
Date: Sat, 11 Jan 2020 22:36:31 -0800
Message-Id: <20200112063633.11144-2-akuster808@gmail.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20200112063633.11144-1-akuster808@gmail.com>
References: <20200112063633.11144-1-akuster808@gmail.com>
Subject: [warror][PATCH 2/4] sudo: correct SRC_URI
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
X-List-Received-Date: Sun, 12 Jan 2020 06:36:35 -0000

From: Alexander Kanavin <alex.kanavin@gmail.com>

The old URI returns 404, and has an invalid TLS certificate.

Signed-off-by: Alexander Kanavin <alex.kanavin@gmail.com>
Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
(cherry picked from commit 73ff6aba0a53ffc3ee0a5859a3ad4c8021be4de0)
Signed-off-by: Armin Kuster <akuster808@gmail.com>
---
 meta/recipes-extended/sudo/sudo_1.8.27.bb | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta/recipes-extended/sudo/sudo_1.8.27.bb b/meta/recipes-extended/sudo/sudo_1.8.27.bb
index 7460a5bfed..bbca8395b9 100644
--- a/meta/recipes-extended/sudo/sudo_1.8.27.bb
+++ b/meta/recipes-extended/sudo/sudo_1.8.27.bb
@@ -1,6 +1,6 @@
 require sudo.inc
 
-SRC_URI = "http://ftp.sudo.ws/sudo/dist/sudo-${PV}.tar.gz \
+SRC_URI = "http://www.sudo.ws/sudo/dist/sudo-${PV}.tar.gz \
            ${@bb.utils.contains('DISTRO_FEATURES', 'pam', '${PAM_SRC_URI}', '', d)} \
            file://0001-Include-sys-types.h-for-id_t-definition.patch \
            file://CVE-2019-14287-1.patch \
-- 
2.17.1


