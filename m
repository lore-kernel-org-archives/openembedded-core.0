Return-Path: <anders@chargestorm.se>
Received: from mail-lf0-f42.google.com (mail-lf0-f42.google.com
	[209.85.215.42])
	by mail.openembedded.org (Postfix) with ESMTP id 3575671E59
	for <openembedded-core@lists.openembedded.org>;
	Tue, 31 Jan 2017 07:18:19 +0000 (UTC)
Received: by mail-lf0-f42.google.com with SMTP id v186so206639695lfa.1
	for <openembedded-core@lists.openembedded.org>;
	Mon, 30 Jan 2017 23:18:20 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=chargestorm-se.20150623.gappssmtp.com; s=20150623;
	h=from:to:cc:subject:date:message-id:in-reply-to:references;
	bh=VW9e5+nQJfnS6O+lWEJEck/55pFiuqoUmkRu5dBRlOc=;
	b=idA4s30b07XEdp1iNZvyG8HLu8lw+nzn9d6o14Z7T2Zk3TeJwgb55oD99Reacq6JZL
	OMegriacmf7Z4ySNlD7qwf9DjqaJwzHeIQX2NuqCwQTLNwSt5N5u1VGuWsO4rUSC/6h1
	VTtYkSWYO+neEW6pvQQUW3us5BZ+KHiLbQY9jRn3QJzbrgQasP5Jg9kgrfj1zNCP3fxG
	moPbR7wUUbD5a/Su10mYFQJUci3JEt4Su8yDSwXe6RSoUk9zWvGtOWM5/JWtsYyZ6mei
	aV66P7hEbBRswesdHvg/SUomvapb+fnAbYD/FURpuwCuRFPnnOZQlVXnisqYXQO6DdNq
	5yCQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
	:references;
	bh=VW9e5+nQJfnS6O+lWEJEck/55pFiuqoUmkRu5dBRlOc=;
	b=VayVczqqXD/j8svy9NCBs2WfcWH+CQC11CPDR4lySRi5LY4x4GwD/7gNub5y+2F5Nt
	iMEyQO55YAxM0Fx/xmTziUuuJi9jmvZIfrjm/Fz09euJAmdsdwZRAmffuSkGebUCwPgZ
	I0drvXlwPOt7PML7VXtEwShfHo2+K6VcIFKomLYx3P4TV6SU8yWE09+Vom/td0t54JdX
	lfxr1x/+sFLw4zxBS8JRkA01VsD4Ig187fCMra1xATUR0AQqIXqo4ahADdDAmgIMnsTE
	EweaaLnxtrxlco46Zzn23bXbYeLCLkXL/MtGKKaT2TFXI2mfr8+j1naqaFFCPoqv46yv
	Iyaw==
X-Gm-Message-State: AIkVDXLW9BP1WyZt0jhhF3CywZtJl6VzMj+sJQOhd68COFnnEELRp+lq5+cAr9h7zrGyBg==
X-Received: by 10.25.169.67 with SMTP id s64mr8442666lfe.133.1485847099875;
	Mon, 30 Jan 2017 23:18:19 -0800 (PST)
Received: from localhost (194-237-220-218.customer.telia.com.
	[194.237.220.218])
	by smtp.gmail.com with ESMTPSA id n8sm4349395lfi.30.2017.01.30.23.18.19
	(version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
	Mon, 30 Jan 2017 23:18:19 -0800 (PST)
From: Anders Darander <anders@chargestorm.se>
To: openembedded-core@lists.openembedded.org
Date: Tue, 31 Jan 2017 08:18:11 +0100
Message-Id: <6f44da9601d2ae87573905ca1b7fa30cf5043100.1485846907.git.anders@chargestorm.se>
X-Mailer: git-send-email 2.11.0
In-Reply-To: <cover.1485846907.git.anders@chargestorm.se>
References: <cover.1485846907.git.anders@chargestorm.se>
Cc: Anders Darander <anders@chargestorm.se>
Subject: [PATCH v2 2/7] python3-manifest: move htlm.py to python3-html
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
X-List-Received-Date: Tue, 31 Jan 2017 07:18:20 -0000

This allows us to use html.py without importing misc.

Signed-off-by: Anders Darander <anders@chargestorm.se>
---
 meta/recipes-devtools/python/python-3.5-manifest.inc | 2 +-
 scripts/contrib/python/generate-manifest-3.5.py      | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/meta/recipes-devtools/python/python-3.5-manifest.inc b/meta/recipes-devtools/python/python-3.5-manifest.inc
index b92048f..6093c28 100644
--- a/meta/recipes-devtools/python/python-3.5-manifest.inc
+++ b/meta/recipes-devtools/python/python-3.5-manifest.inc
@@ -103,7 +103,7 @@ FILES_${PN}-gdbm="${libdir}/python3.5/lib-dynload/_gdbm.*.so ${libdir}/python3.5
 
 SUMMARY_${PN}-html="Python HTML processing support"
 RDEPENDS_${PN}-html="${PN}-core"
-FILES_${PN}-html="${libdir}/python3.5/formatter.* ${libdir}/python3.5/__pycache__/formatter.* ${libdir}/python3.5/htmlentitydefs.* ${libdir}/python3.5/__pycache__/htmlentitydefs.* ${libdir}/python3.5/htmllib.* ${libdir}/python3.5/__pycache__/htmllib.* ${libdir}/python3.5/markupbase.* ${libdir}/python3.5/__pycache__/markupbase.* ${libdir}/python3.5/sgmllib.* ${libdir}/python3.5/__pycache__/sgmllib.* ${libdir}/python3.5/HTMLParser.* ${libdir}/python3.5/__pycache__/HTMLParser.* "
+FILES_${PN}-html="${libdir}/python3.5/formatter.* ${libdir}/python3.5/__pycache__/formatter.* ${libdir}/python3.5/htmlentitydefs.* ${libdir}/python3.5/__pycache__/htmlentitydefs.* ${libdir}/python3.5/html ${libdir}/python3.5/html/__pycache__ ${libdir}/python3.5/htmllib.* ${libdir}/python3.5/__pycache__/htmllib.* ${libdir}/python3.5/markupbase.* ${libdir}/python3.5/__pycache__/markupbase.* ${libdir}/python3.5/sgmllib.* ${libdir}/python3.5/__pycache__/sgmllib.* ${libdir}/python3.5/HTMLParser.* ${libdir}/python3.5/__pycache__/HTMLParser.* "
 
 SUMMARY_${PN}-idle="Python Integrated Development Environment"
 RDEPENDS_${PN}-idle="${PN}-core ${PN}-tkinter"
diff --git a/scripts/contrib/python/generate-manifest-3.5.py b/scripts/contrib/python/generate-manifest-3.5.py
index cf19f47..cc2e561 100755
--- a/scripts/contrib/python/generate-manifest-3.5.py
+++ b/scripts/contrib/python/generate-manifest-3.5.py
@@ -276,7 +276,7 @@ if __name__ == "__main__":
     "lib-dynload/fcntl.*.so" )
 
     m.addPackage( "${PN}-html", "Python HTML processing support", "${PN}-core",
-    "formatter.* htmlentitydefs.* htmllib.* markupbase.* sgmllib.* HTMLParser.* " )
+    "formatter.* htmlentitydefs.* html htmllib.* markupbase.* sgmllib.* HTMLParser.* " )
 
     m.addPackage( "${PN}-importlib", "Python import implementation library", "${PN}-core ${PN}-lang",
     "importlib imp.*" )
-- 
2.10.2


