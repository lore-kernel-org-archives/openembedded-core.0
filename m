Return-Path: <otavio.salvador@gmail.com>
Received: from mail-qg0-f66.google.com (mail-qg0-f66.google.com
	[209.85.192.66])
	by mail.openembedded.org (Postfix) with ESMTP id 2662C6E688
	for <openembedded-core@lists.openembedded.org>;
	Tue, 19 Apr 2016 20:17:45 +0000 (UTC)
Received: by mail-qg0-f66.google.com with SMTP id f74so2444769qge.3
	for <openembedded-core@lists.openembedded.org>;
	Tue, 19 Apr 2016 13:17:46 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:from:to:cc:subject:date:message-id:organization;
	bh=8KW9+iFup4ju8UhN8w36B21gx5Zm610hi+0zqwbpMEo=;
	b=RO+6c48mQ6MV6xD9PfMUxJkEH39qCbbRTNr0x6KathkaxzLkvsOK2lvegU8Inz1l7b
	mgscAWsV3GRF0REXBG8yN4EFDRI0nDHskLWkVGm7R/kiUaXB9LYhJn8sTp8uzBLcvbRG
	+4+IZnTdXHlaOCb5geSavVOBoc8JVbLm0p1XsA4goYSA9kKPSlC3ahAchc2WjbGe7atJ
	qF1/yBUuE53MaqsOyxIXrfwsqkyILQEk1qwwF1sKSXXIvn5uU7c3LyquyTRykckOuA/0
	2BAZ0USjCyaQCNUwHPOm2jaJmO9nEnlV+8EyBpLuI36xkqa7Du/PgO+ugP8mlQZrvudm
	si8Q==
X-Gm-Message-State: AOPr4FV8yiarG3MKxFr1//e4OqslREHMgskN7coW/akv+c+H5vxrZyNpqiqlxjp6m0uUIQ==
X-Received: by 10.140.98.175 with SMTP id o44mr6260459qge.46.1461097066552;
	Tue, 19 Apr 2016 13:17:46 -0700 (PDT)
Received: from localhost ([187.23.154.250]) by smtp.gmail.com with ESMTPSA id
	q138sm6147515qhb.23.2016.04.19.13.17.43
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Tue, 19 Apr 2016 13:17:45 -0700 (PDT)
Received: by localhost (sSMTP sendmail emulation);
	Tue, 19 Apr 2016 17:17:39 -0300
From: Otavio Salvador <otavio@ossystems.com.br>
To: OpenEmbedded Core Mailing List <openembedded-core@lists.openembedded.org>
Date: Tue, 19 Apr 2016 17:17:39 -0300
Message-Id: <1461097059-23345-1-git-send-email-otavio@ossystems.com.br>
X-Mailer: git-send-email 2.8.0
Organization: O.S. Systems Software LTDA.
Cc: Otavio Salvador <otavio@ossystems.com.br>
Subject: [PATCH] syslinux.bbclass: Remove APPEND from variable dependency
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
X-List-Received-Date: Tue, 19 Apr 2016 20:17:46 -0000

The value of APPEND is already being tracked and does impact on the
generated configuration file. This reverts the OE-Core:3c2d7ae5 commit
as it is not need anymore.

Signed-off-by: Otavio Salvador <otavio@ossystems.com.br>
---

 meta/classes/syslinux.bbclass | 1 -
 1 file changed, 1 deletion(-)

diff --git a/meta/classes/syslinux.bbclass b/meta/classes/syslinux.bbclass
index fd04ac6..4fcb0c5 100644
--- a/meta/classes/syslinux.bbclass
+++ b/meta/classes/syslinux.bbclass
@@ -190,4 +190,3 @@ python build_syslinux_cfg () {
 
     cfgfile.close()
 }
-build_syslinux_cfg[vardeps] += "APPEND"
-- 
2.8.0


