Return-Path: <otavio.salvador@gmail.com>
Received: from mail-qt0-f193.google.com (mail-qt0-f193.google.com
	[209.85.216.193])
	by mail.openembedded.org (Postfix) with ESMTP id B4EA771A70
	for <openembedded-core@lists.openembedded.org>;
	Fri, 16 Mar 2018 19:48:48 +0000 (UTC)
Received: by mail-qt0-f193.google.com with SMTP id g60so12094017qtd.11
	for <openembedded-core@lists.openembedded.org>;
	Fri, 16 Mar 2018 12:48:50 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:cc:subject:date:message-id:organization;
	bh=l0s/Y9QLWorSTLzNzPYP+XUzxfnwCsWmX3bzNdwdp5w=;
	b=iLO7qs15sZ0sb7uGFSsPphyKPRNLjlD1D8lL6G7vvfpuTPjBWRO7v6tRf9/An5Guvf
	hvYRnzi9Kn/HjxSHugUy62ahJPyH97LXGbuToO6cKFgCWzfg+e1rdCgeiTdyxAksPlKz
	cW+KjuJcabGyfbVhZwkkRmv7HkkhBlhcOlpjfLG6Cx6eIlDgoqXsFLRia55GjddIftB/
	ihE8HTjcLN98bOlFqPQ9C3OaApQxvrUKTo8myIsMfbM+FP+sAcpGKTYXDD7TE+qBsZy2
	J0BlnBo3NsYQpH1uSOXjg7GI3FQSNK7ytMJ5oKkSMgkQ2ubwEuL6LZX+1OofCvT5En2N
	8JRA==
X-Gm-Message-State: AElRT7EK0HPB5CdXzYylDbxShUMJ35l53dL7eABHvFyUpNcRXKAHCA9R
	a1gD/JVuM/z3bIhNNYTVQneGsw==
X-Google-Smtp-Source: AG47ELuF9JjdF/fkBT5//ofvtsgQSOCGC4+mZrVeRKDhqJguX6gX/xV6KrrYPAh1hTJh3SzYvlFbTQ==
X-Received: by 10.237.60.155 with SMTP id d27mr4661155qtf.210.1521229729073;
	Fri, 16 Mar 2018 12:48:49 -0700 (PDT)
Received: from localhost.localdomain ([181.220.79.73])
	by smtp.gmail.com with ESMTPSA id
	g124sm5244015qkb.67.2018.03.16.12.48.46
	(version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
	Fri, 16 Mar 2018 12:48:48 -0700 (PDT)
Received: by localhost.localdomain (sSMTP sendmail emulation);
	Fri, 16 Mar 2018 16:48:41 -0300
From: Otavio Salvador <otavio@ossystems.com.br>
To: OpenEmbedded Core Mailing List <openembedded-core@lists.openembedded.org>
Date: Fri, 16 Mar 2018 16:48:41 -0300
Message-Id: <20180316194841.1186-1-otavio@ossystems.com.br>
X-Mailer: git-send-email 2.16.2
Organization: O.S. Systems Software LTDA.
Cc: Otavio Salvador <otavio@ossystems.com.br>
Subject: [PATCH v2] glide.bbclass: Add class to easy Glide use
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
X-List-Received-Date: Fri, 16 Mar 2018 19:48:49 -0000

To use 'glide' this class does the integration and reduces code
duplication.

Signed-off-by: Otavio Salvador <otavio@ossystems.com.br>
---

Changes in v2:
- Use B to infer the build dir (Matt)

 meta/classes/glide.bbclass | 9 +++++++++
 1 file changed, 9 insertions(+)
 create mode 100644 meta/classes/glide.bbclass

diff --git a/meta/classes/glide.bbclass b/meta/classes/glide.bbclass
new file mode 100644
index 00000000000..db421745bd0
--- /dev/null
+++ b/meta/classes/glide.bbclass
@@ -0,0 +1,9 @@
+# Handle Glide Vendor Package Management use
+#
+# Copyright 2018 (C) O.S. Systems Software LTDA.
+
+DEPENDS_append = " glide-native"
+
+do_compile_prepend() {
+    ( cd ${B}/src/${GO_IMPORT} && glide install )
+}
-- 
2.16.2


