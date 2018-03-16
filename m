Return-Path: <otavio.salvador@gmail.com>
Received: from mail-qk0-f194.google.com (mail-qk0-f194.google.com
	[209.85.220.194])
	by mail.openembedded.org (Postfix) with ESMTP id 3F29B788CD
	for <openembedded-core@lists.openembedded.org>;
	Fri, 16 Mar 2018 12:57:33 +0000 (UTC)
Received: by mail-qk0-f194.google.com with SMTP id j73so3443172qke.6
	for <openembedded-core@lists.openembedded.org>;
	Fri, 16 Mar 2018 05:57:35 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:cc:subject:date:message-id:organization;
	bh=9fU+v4Tc1AOKl5mnMSfAXnQWH7fs8HlElPAcv0FBReE=;
	b=ujmqXszlAVQM6pl1xET3+u4zQPMa3aUOFWVQl3ooRtLz7kilcqfzdYMnLP5LJg+GV0
	Y6tiVpLr7PrbjSSqCx5Sgo4LnPZLOpWheb6oU0AMHJlCPTfMJahMBpDcsQKw7yDCKP4D
	0/a9nxJnjuB35ZuL2I2Gob8mU0HxEF6TtZBOtZWzfxebCfAsx1ozslS7G7BbnxlKSZxD
	ryhCFzlFRxHw5cVhsVnw5a/JaMYLPNvWRZgY6wHIv5tKq23QSf1KHj4bxJfHxICD29wN
	kiAdH+VKOOS8I6bemliK8WCGnFI605EI81EcLIs6s4d1Txnvr0I7SXwxmEgS28MC52F1
	drgQ==
X-Gm-Message-State: AElRT7GykuJHeMN7QE8hmqx6iGQLBrP6q9yU12gJd3u5qcMAwv20e5a4
	8s5iGVyayUlb9UoSDvtXPm8YMw==
X-Google-Smtp-Source: AG47ELsoPAqw9DBjmAyQpCqcZXjRIil4QSJR9KqxfRRzwiAx+FL/kS9M1rwcjwH9cNZEcf4FGGrKAw==
X-Received: by 10.55.43.4 with SMTP id r4mr2518039qkh.356.1521205054747;
	Fri, 16 Mar 2018 05:57:34 -0700 (PDT)
Received: from localhost.localdomain ([181.220.79.73])
	by smtp.gmail.com with ESMTPSA id
	w18sm5160955qkw.35.2018.03.16.05.57.31
	(version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
	Fri, 16 Mar 2018 05:57:33 -0700 (PDT)
Received: by localhost.localdomain (sSMTP sendmail emulation);
	Fri, 16 Mar 2018 09:57:27 -0300
From: Otavio Salvador <otavio@ossystems.com.br>
To: OpenEmbedded Core Mailing List <openembedded-core@lists.openembedded.org>
Date: Fri, 16 Mar 2018 09:57:25 -0300
Message-Id: <20180316125725.25370-1-otavio@ossystems.com.br>
X-Mailer: git-send-email 2.16.2
Organization: O.S. Systems Software LTDA.
Cc: Otavio Salvador <otavio@ossystems.com.br>
Subject: [RESEND PATCH] glide.bbclass: Add class to easy Glide use
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
X-List-Received-Date: Fri, 16 Mar 2018 12:57:34 -0000

To use 'glide' this class does the integration and reduces code
duplication.

Signed-off-by: Otavio Salvador <otavio@ossystems.com.br>
---

 meta/classes/glide.bbclass | 9 +++++++++
 1 file changed, 9 insertions(+)
 create mode 100644 meta/classes/glide.bbclass

diff --git a/meta/classes/glide.bbclass b/meta/classes/glide.bbclass
new file mode 100644
index 00000000000..52291bab8cf
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


