Return-Path: <bruce.ashfield@gmail.com>
Received: from mail-qk1-f194.google.com (mail-qk1-f194.google.com
	[209.85.222.194])
	by mail.openembedded.org (Postfix) with ESMTP id A4BAD7F568
	for <openembedded-core@lists.openembedded.org>;
	Mon, 21 Oct 2019 20:16:26 +0000 (UTC)
Received: by mail-qk1-f194.google.com with SMTP id 4so14017313qki.6
	for <openembedded-core@lists.openembedded.org>;
	Mon, 21 Oct 2019 13:16:28 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=from:to:cc:subject:date:message-id:in-reply-to:references
	:mime-version:content-transfer-encoding;
	bh=P6aqrNr0XqBLxFv6IVM1Xk8bCttW+FA7Uw+MKyuxW2M=;
	b=sica9OQlAicPldRbD9U5wCc77bOCsXZy1alE5mkCiqmRhYoyRGYYu7Dx6PXOaczpQh
	UssZiMIF1KXOSd0ZHCAoXDVIWa3+POxhz5riTDatBCz9FAl433DiYzwblcSsBu0ggv50
	EJopxu/7+YAIhZPL3ZzAFKJv8NmEk8NFRR7hmi23q8LN2v+aWHsJpc6YGboVLPB2FpiQ
	vdq42d2+E8ubLjkXiwOZsMq6TlUf2s7WuwQzrWmf5d5q/LO3A0RpgzUwGc01isrKrqYg
	9GFO6yCnzLwAEuJuqcU410lOGUjPQWiSgtnM7vHEyyKRQrpKcoRM06S7sCSezx8SiIFO
	M5eg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
	:references:mime-version:content-transfer-encoding;
	bh=P6aqrNr0XqBLxFv6IVM1Xk8bCttW+FA7Uw+MKyuxW2M=;
	b=Pz/vmCNnl4BRNz8slsAoGCW1cg7BoSwDwMN58J8nZJ9BJQWs4qWna5D/Jpt0yDCShV
	w7+caSQaLkqCs3NmkxaQ3bwjoGdQuSV+bk4jseAiBdsbkZL8YH+FyKBgOasYvKUe57gu
	KC/OZFFrQWsOvTcF88iHK/+QqGvvVZpXAn8cAb8ZOOwGn6PL4jA7jAuLp/QoNcKY7Rbi
	egA28OkI3WdAd4Mxwmh5RYZQhrHe+hK7DdjmZ+dO8anypO5rbiKABvbdmKRNxnG+iowK
	89hKEHbYBURpuf7jE6oxHhWDjud5q5NmIbE4Jdavw/w5vq68zSrTXG/gpblbu1kz1Qz8
	DjNg==
X-Gm-Message-State: APjAAAWWCdzrS4KBnd3neTdyIrm9Jm+ZihuS915fZAAHnCzYa9T1++mF
	hkXgfESQ4nFEotFHudVfLZ0=
X-Google-Smtp-Source: APXvYqxOIgLkdn1R2LNaUKrcSNxoPjl+Q2/3QyVZokib68gY7AMfN+xuR5OBa/iTBfzrGEtnAUH0Kg==
X-Received: by 2002:ae9:f204:: with SMTP id m4mr3573864qkg.300.1571688987547; 
	Mon, 21 Oct 2019 13:16:27 -0700 (PDT)
Received: from localhost.localdomain
	(CPEe8de27b71faa-CM64777d5e8820.cpe.net.cable.rogers.com.
	[174.113.11.95]) by smtp.gmail.com with ESMTPSA id
	o12sm4666903qkk.54.2019.10.21.13.16.26
	(version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
	Mon, 21 Oct 2019 13:16:26 -0700 (PDT)
From: bruce.ashfield@gmail.com
To: richard.purdie@linuxfoundation.org
Date: Mon, 21 Oct 2019 16:16:17 -0400
Message-Id: <81b2138f099b5a6a8fc9c044cac0145b3a0cc403.1571688520.git.bruce.ashfield@gmail.com>
X-Mailer: git-send-email 2.19.1
In-Reply-To: <cover.1571688520.git.bruce.ashfield@gmail.com>
References: <cover.1571688520.git.bruce.ashfield@gmail.com>
MIME-Version: 1.0
Cc: openembedded-core@lists.openembedded.org
Subject: [PATCH 5/6] perf: add 'cap' PACKAGECONFIG
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
X-List-Received-Date: Mon, 21 Oct 2019 20:16:27 -0000
Content-Transfer-Encoding: 8bit

From: Bruce Ashfield <bruce.ashfield@gmail.com>

perf can use libcap when available, so we add a packageconfig
for those that want the support.

Signed-off-by: Bruce Ashfield <bruce.ashfield@gmail.com>
---
 meta/recipes-kernel/perf/perf.bb | 1 +
 1 file changed, 1 insertion(+)

diff --git a/meta/recipes-kernel/perf/perf.bb b/meta/recipes-kernel/perf/perf.bb
index 66d3c1d325..191305969c 100644
--- a/meta/recipes-kernel/perf/perf.bb
+++ b/meta/recipes-kernel/perf/perf.bb
@@ -25,6 +25,7 @@ PACKAGECONFIG[jvmti] = ",NO_JVMTI=1"
 # libaudit support would need scripting to be enabled
 PACKAGECONFIG[audit] = ",NO_LIBAUDIT=1,audit"
 PACKAGECONFIG[manpages] = ",,xmlto-native asciidoc-native"
+PACKAGECONFIG[cap] = ",,libcap"
 
 # libunwind is not yet ported for some architectures
 PACKAGECONFIG_remove_arc = "libunwind"
-- 
2.19.1


