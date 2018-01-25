Return-Path: <straka.derek@gmail.com>
Received: from mail-qt0-f195.google.com (mail-qt0-f195.google.com
	[209.85.216.195])
	by mail.openembedded.org (Postfix) with ESMTP id 5A8AA60721
	for <openembedded-core@lists.openembedded.org>;
	Thu, 25 Jan 2018 16:59:45 +0000 (UTC)
Received: by mail-qt0-f195.google.com with SMTP id x27so20859267qtm.12
	for <openembedded-core@lists.openembedded.org>;
	Thu, 25 Jan 2018 08:59:46 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:cc:subject:date:message-id;
	bh=cOPspwxOePlwe7ryHviE6xnurlL/temk6iCX6kgtLzU=;
	b=S74Q9Ji92ePxFrMChpELT4wsfmPlj/az8esHldPVxqHaqnskKCfeMr/p/h1zF914in
	HUIKx9zSRH4lwKpG0ve8rkVJ6e9OE17opPPwH5JyuUK3YoqcXU7SCZHv8hXfN6XJSkFw
	/CaOrJ+7ToNDI+mOzIm44ED2gODuhblqZzc8m72Ay7SsYn9ZKcCV7Meddtm4aJeULLQV
	8U/JgRNcoZug0vGajV4AZZ2ETmtZPYut3JDk8Q6LTjOM/LEGSGsMwbx3A9691h5oXqNX
	KksmIGPGaKj5geF+sBFDufjwP29xwPUF3u9entTD91GDS8Y9rxhKU7A6b/O0c8GbXgXX
	XDuA==
X-Gm-Message-State: AKwxytdhKusvSRi4GakgyaWSrQc0DBzJsibAAbOn1w7aa88EahmUQdct
	3XXzPuFGazBFDiEdiJ9tg0wCajcC
X-Google-Smtp-Source: AH8x225O4OtQwqKJ3FWfChyty3JM+InfILYcNDeYU6CfbH208L4bCwfQdWxcqm5Z/5ramP34ov8XWA==
X-Received: by 10.200.51.225 with SMTP id d30mr17833265qtb.338.1516899586156; 
	Thu, 25 Jan 2018 08:59:46 -0800 (PST)
Received: from sparta.ny.asterius.io ([68.132.72.199])
	by smtp.gmail.com with ESMTPSA id
	m82sm2087153qki.81.2018.01.25.08.59.45
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
	Thu, 25 Jan 2018 08:59:45 -0800 (PST)
From: Derek Straka <derek@asterius.io>
To: openembedded-core@lists.openembedded.org
Date: Thu, 25 Jan 2018 11:59:29 -0500
Message-Id: <1516899569-21048-1-git-send-email-derek@asterius.io>
X-Mailer: git-send-email 2.7.4
Subject: [PATCH] python3-manifest: add the _pydecimal files to the numbers package
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
X-List-Received-Date: Thu, 25 Jan 2018 16:59:46 -0000

The _pydecimal files are required to use the numbers package
and downstream packages are currently required to add a RDEPENDS
on python3-misc to avoid an import error

Signed-off-by: Derek Straka <derek@asterius.io>
---
 meta/recipes-devtools/python/python3/python3-manifest.json | 8 +++++---
 1 file changed, 5 insertions(+), 3 deletions(-)

diff --git a/meta/recipes-devtools/python/python3/python3-manifest.json b/meta/recipes-devtools/python/python3/python3-manifest.json
index ef9826f..5b7b70b 100644
--- a/meta/recipes-devtools/python/python3/python3-manifest.json
+++ b/meta/recipes-devtools/python/python3/python3-manifest.json
@@ -799,13 +799,15 @@
         "cached": [
             "${libdir}/python3.5/__pycache__/decimal.*.pyc",
             "${libdir}/python3.5/__pycache__/fractions.*.pyc",
-            "${libdir}/python3.5/__pycache__/numbers.*.pyc"
+            "${libdir}/python3.5/__pycache__/numbers.*.pyc",
+            "${libdir}/python3.5/__pycache__/_pydecimal.*.pyc"
         ],
         "files": [
             "${libdir}/python3.5/decimal.py",
             "${libdir}/python3.5/fractions.py",
             "${libdir}/python3.5/lib-dynload/_decimal.*.so",
-            "${libdir}/python3.5/numbers.py"
+            "${libdir}/python3.5/numbers.py",
+            "${libdir}/python3.5/_pydecimal.py"
         ],
         "rdepends": [
             "core"
@@ -1137,4 +1139,4 @@
         ],
         "summary": "Python XML-RPC support"
     }
-}
\ No newline at end of file
+}
-- 
2.7.4


