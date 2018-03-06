Return-Path: <otavio.salvador@gmail.com>
Received: from mail-ua0-f193.google.com (mail-ua0-f193.google.com
	[209.85.217.193])
	by mail.openembedded.org (Postfix) with ESMTP id 1D3CD789FF
	for <openembedded-core@lists.openembedded.org>;
	Tue,  6 Mar 2018 17:07:42 +0000 (UTC)
Received: by mail-ua0-f193.google.com with SMTP id x4so13520165uaj.11
	for <openembedded-core@lists.openembedded.org>;
	Tue, 06 Mar 2018 09:07:44 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:cc:subject:date:message-id:organization;
	bh=EIsw4tPUjjkDRZfBQ+ME/TkB18Tmq9HhSQy5npeo/vM=;
	b=ILheiccmrb6Ab1689DTFerFnzTgHJnfgwL/+c8SIprAsDKb2EuiOk0bOXbxOCuH1af
	WAVUU9r6nyGtWgSIgDgje7080t9+hbWvAO8aAbQvaHJLByUbBWQJhOmoRM+P4ClMUlic
	lGL/RfJNpKx0wFVNjODiknup/mD3rGvHl/QPxoFpq3aMkF8fMW4x/DcLsBLLHwyiwqv4
	LhO4lIQJVPP45psK4Hv+TdrUhdiWN4syUQSSMevWBufBYqbCwhojMYPgScXdELdDzpTc
	Wa6Tu4t0REdoSUZbmInhvrUX03u2eDVN2pdURqF4ZOkJqR/eyBFdymGf/9SQyA2/oTCZ
	rLPQ==
X-Gm-Message-State: APf1xPBrArXNgMU8xjILLg9Fazzfex64z9vupg6zO4bwpw7j5YW7JyWU
	RQ/xFYae1qyjYMhz/E8uZppnsA==
X-Google-Smtp-Source: AG47ELumWLhb5g257MoNUf7T7AhvkTJWEcs4q5Z5zUyy7e0Eq9/TSpinPV6eCltTOhzF+YtVoLmOKA==
X-Received: by 10.176.94.103 with SMTP id a39mr13891474uah.98.1520356063292;
	Tue, 06 Mar 2018 09:07:43 -0800 (PST)
Received: from localhost.localdomain ([181.220.79.73])
	by smtp.gmail.com with ESMTPSA id 34sm7475579uaq.39.2018.03.06.09.07.40
	(version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
	Tue, 06 Mar 2018 09:07:42 -0800 (PST)
Received: by localhost.localdomain (sSMTP sendmail emulation);
	Tue, 06 Mar 2018 14:07:36 -0300
From: Otavio Salvador <otavio@ossystems.com.br>
To: OpenEmbedded Core Mailing List <openembedded-core@lists.openembedded.org>
Date: Tue,  6 Mar 2018 14:07:35 -0300
Message-Id: <20180306170735.13762-1-otavio@ossystems.com.br>
X-Mailer: git-send-email 2.16.2
Organization: O.S. Systems Software LTDA.
Cc: Otavio Salvador <otavio@ossystems.com.br>
Subject: [PATCH] glide.bbclass: Add class to easy Glide use
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
X-List-Received-Date: Tue, 06 Mar 2018 17:07:43 -0000

To use 'glide' this class does the integration and reduces code
duplication.

Signed-off-by: Otavio Salvador <otavio@ossystems.com.br>
---

 meta/classes/glide.bbclass | 9 +++++++++
 1 file changed, 9 insertions(+)
 create mode 100644 meta/classes/glide.bbclass

diff --git a/meta/classes/glide.bbclass b/meta/classes/glide.bbclass
new file mode 100644
index 0000000000..52291bab8c
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
+    ( cd ${WORKDIR}/build/src/${GO_IMPORT} && glide install )
+}
-- 
2.16.2


