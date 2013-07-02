Return-Path: <otavio.salvador@gmail.com>
Received: from mail-qe0-f42.google.com (mail-qe0-f42.google.com
	[209.85.128.42])
	by mail.openembedded.org (Postfix) with ESMTP id 44D1B6AF4F
	for <openembedded-core@lists.openembedded.org>;
	Tue,  2 Jul 2013 14:15:07 +0000 (UTC)
Received: by mail-qe0-f42.google.com with SMTP id s14so2388223qeb.29
	for <openembedded-core@lists.openembedded.org>;
	Tue, 02 Jul 2013 07:15:08 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=sender:from:to:cc:subject:date:message-id:x-mailer:in-reply-to
	:references; bh=oEr8Rws+ewBK/BYN+3SIpFYWd9U4yi0aGTRdBSfYReM=;
	b=vBq6wY+t3EUuicIYIysRzHfQo4QV4jBjDQpfyc3aP0ppHWbHtCE5zj4L37IcQDjgiP
	+TBLrUHYOPL8jmso/HmWePN9IXhilEIzBNpHNgDAZ2u9Pgm6JWuZAbBxmaKkEikh0Snv
	Xy8mTwoQk2fPS4KpIqxuLnXb/DiE7yOoc1eAZnjBLqJxAM6Od+JaA45Rjg/ViugVAGfM
	fvEOlbDWcPfnvenA4InpFf00EIxZGdBaWf+zaDDzw+tRwjVxoKUoddbkaX9mjkOygqaV
	whk6NXIwjI3CVRzI584U5zwR3O468gao6jpsWdSpQzuLJ75TGdm4I5s/PN+Xpd+p1U1b
	URMw==
X-Received: by 10.224.171.132 with SMTP id h4mr39424211qaz.98.1372774508115;
	Tue, 02 Jul 2013 07:15:08 -0700 (PDT)
Received: from nano.lab.ossystems.com.br ([177.194.194.146])
	by mx.google.com with ESMTPSA id 15sm37190458qaa.9.2013.07.02.07.15.06
	for <multiple recipients>
	(version=TLSv1.2 cipher=ECDHE-RSA-RC4-SHA bits=128/128);
	Tue, 02 Jul 2013 07:15:07 -0700 (PDT)
Sender: Otavio Salvador <otavio.salvador@gmail.com>
From: Otavio Salvador <otavio@ossystems.com.br>
To: OpenEmbedded Core Mailing List <openembedded-core@lists.openembedded.org>
Date: Tue,  2 Jul 2013 11:14:42 -0300
Message-Id: <1372774482-16476-4-git-send-email-otavio@ossystems.com.br>
X-Mailer: git-send-email 1.8.3.1
In-Reply-To: <1372774482-16476-1-git-send-email-otavio@ossystems.com.br>
References: <1372774482-16476-1-git-send-email-otavio@ossystems.com.br>
Cc: Otavio Salvador <otavio@ossystems.com.br>
Subject: [PATCH 4/4] babeltrace: Update to 1.1.1 based release
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
X-List-Received-Date: Tue, 02 Jul 2013 14:15:07 -0000

Signed-off-by: Otavio Salvador <otavio@ossystems.com.br>
---
 meta/recipes-kernel/lttng/{babeltrace_1.1.0.bb => babeltrace_1.1.1.bb} | 3 +--
 1 file changed, 1 insertion(+), 2 deletions(-)
 rename meta/recipes-kernel/lttng/{babeltrace_1.1.0.bb => babeltrace_1.1.1.bb} (91%)

diff --git a/meta/recipes-kernel/lttng/babeltrace_1.1.0.bb b/meta/recipes-kernel/lttng/babeltrace_1.1.1.bb
similarity index 91%
rename from meta/recipes-kernel/lttng/babeltrace_1.1.0.bb
rename to meta/recipes-kernel/lttng/babeltrace_1.1.1.bb
index dd7e056..8aa3ae1 100644
--- a/meta/recipes-kernel/lttng/babeltrace_1.1.0.bb
+++ b/meta/recipes-kernel/lttng/babeltrace_1.1.1.bb
@@ -10,9 +10,8 @@ inherit autotools
 
 DEPENDS = "glib-2.0 util-linux popt"
 
-SRCREV = "c99b1910bea848e8f0ae5641bb63b8f4f84f3ec0"
+SRCREV = "a386e24609752742b100120db6798d311fab512a"
 PV = "1.1+git${SRCPV}"
-PR = "r0"
 
 SRC_URI = "git://git.efficios.com/babeltrace.git;protocol=git"
 
-- 
1.8.3.1


