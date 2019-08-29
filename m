Return-Path: <open.source@oleksandr-kravchuk.com>
Received: from mail-lj1-f196.google.com (mail-lj1-f196.google.com
	[209.85.208.196])
	by mail.openembedded.org (Postfix) with ESMTP id 3C49D7F3B3
	for <openembedded-core@lists.openembedded.org>;
	Thu, 29 Aug 2019 22:47:18 +0000 (UTC)
Received: by mail-lj1-f196.google.com with SMTP id h15so4589453ljg.10
	for <openembedded-core@lists.openembedded.org>;
	Thu, 29 Aug 2019 15:47:20 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=oleksandr-kravchuk-com.20150623.gappssmtp.com; s=20150623;
	h=from:to:cc:subject:date:message-id;
	bh=btQKXW3b5/rl+D+9ycYNkIDqqJ9fGb56kA1y3/ooERI=;
	b=QgQ1p9KS6uQHjhk1Cz9MPCE6z0HwAnFApB6eEtDtPRg/avTdKqgewZxLxMGE4lmtBz
	v3L2roHRnE7c9WvCGjghTc+/jfrVH4cl3vbk57mK0yUV75vwmYgdha3OY80ZjRRghwki
	YpW+UgS1ZKEGzVfdQv4pA/FiRTn3zJRXDqxMzASaaCF0kyviSt6s686C58BpXLzuKi7i
	RhdoHXUkbFkDORkSTGodxb+64NJhrhuv/zegDrfgZQUgcWemPCsmDLSnKwc+1OH1m9U1
	cbkG20Ra0ruLyRbEsdCvYCv1uQ+QvjfiARdCbb7nEqHuLCcbzcmutbDc4cQK9ccBrcPO
	96fQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:cc:subject:date:message-id;
	bh=btQKXW3b5/rl+D+9ycYNkIDqqJ9fGb56kA1y3/ooERI=;
	b=ujdrwOc8c9/3xo+5VxJAInTDoL5uMJR59xIMyMVbIf0Cw9ZZwqTwL79y3HLyvv4c6H
	sKN/t3iw4PqJyeyVHAzMWFkbceuruE+EHP+Gl2kxSLKzRMTKJLF87Pqmbd7003qWijf0
	9LPcbreVda022o8ODel7Di8Uiom7AiGwZbe9wTIUylUgI3CQsQ0seumdg8ENwd/qngNa
	ngofGomlGCGb8xit1jbEpV8MiG+dUAssjNCy1zvGvHlmOLJuiLAsG0oE/k3Ls7BJ/3XT
	vgNnbXc1WxuI3SO7bYPFhwOlSdiXzdV0IS/vxIkJQbVVW+c57KUiChejM38sGA4zBe8Z
	3itg==
X-Gm-Message-State: APjAAAV6tUeXlgCNE+77HOCxkH1LzRPNf9+LcKmLVhnZdQ3NmXvRvzM8
	D9L+QUlPs+tWwcy907jSwVxsuUz3KSE=
X-Google-Smtp-Source: APXvYqwvAtLRX6o9xvRAcqR1FH+/i+UwDBdmamBqE00v6QWm1WSrzCnCOsP/Qo+nXOh5VKrxZPzNyw==
X-Received: by 2002:a2e:9a05:: with SMTP id o5mr5013203lji.234.1567118839351; 
	Thu, 29 Aug 2019 15:47:19 -0700 (PDT)
Received: from localhost.localdomain (c83-252-117-108.bredband.comhem.se.
	[83.252.117.108])
	by smtp.gmail.com with ESMTPSA id e21sm589762lfj.10.2019.08.29.15.47.18
	(version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
	Thu, 29 Aug 2019 15:47:18 -0700 (PDT)
From: Oleksandr Kravchuk <open.source@oleksandr-kravchuk.com>
To: openembedded-core@lists.openembedded.org
Date: Fri, 30 Aug 2019 00:47:16 +0200
Message-Id: <20190829224716.25355-1-open.source@oleksandr-kravchuk.com>
X-Mailer: git-send-email 2.17.1
Cc: Oleksandr Kravchuk <open.source@oleksandr-kravchuk.com>
Subject: [PATCH] libsolv: update to 0.7.6
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
X-List-Received-Date: Thu, 29 Aug 2019 22:47:19 -0000

Signed-off-by: Oleksandr Kravchuk <open.source@oleksandr-kravchuk.com>
---
 .../libsolv/{libsolv_0.7.5.bb => libsolv_0.7.6.bb}              | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta/recipes-extended/libsolv/{libsolv_0.7.5.bb => libsolv_0.7.6.bb} (93%)

diff --git a/meta/recipes-extended/libsolv/libsolv_0.7.5.bb b/meta/recipes-extended/libsolv/libsolv_0.7.6.bb
similarity index 93%
rename from meta/recipes-extended/libsolv/libsolv_0.7.5.bb
rename to meta/recipes-extended/libsolv/libsolv_0.7.6.bb
index 80ce76b45f..3df8993089 100644
--- a/meta/recipes-extended/libsolv/libsolv_0.7.5.bb
+++ b/meta/recipes-extended/libsolv/libsolv_0.7.6.bb
@@ -10,7 +10,7 @@ DEPENDS = "expat zlib"
 SRC_URI = "git://github.com/openSUSE/libsolv.git \
 "
 
-SRCREV = "2cab7ea00d08390374b25b11d969f3740c4660f4"
+SRCREV = "17ce4bc4fb52a0b32964f3b7d491c18177980be1"
 
 UPSTREAM_CHECK_GITTAGREGEX = "(?P<pver>\d+(\.\d+)+)"
 
-- 
2.17.1


