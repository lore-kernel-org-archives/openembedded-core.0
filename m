Return-Path: <anders@chargestorm.se>
Received: from mail-lf0-f41.google.com (mail-lf0-f41.google.com
	[209.85.215.41])
	by mail.openembedded.org (Postfix) with ESMTP id 7C4EF7734B
	for <openembedded-core@lists.openembedded.org>;
	Fri, 27 Jan 2017 09:06:19 +0000 (UTC)
Received: by mail-lf0-f41.google.com with SMTP id x1so71991344lff.0
	for <openembedded-core@lists.openembedded.org>;
	Fri, 27 Jan 2017 01:06:20 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=chargestorm-se.20150623.gappssmtp.com; s=20150623;
	h=from:to:subject:date:message-id:in-reply-to:references;
	bh=N45d0zgXqybWbeiSeEs4XdD/Bx/TBNgYkPK+2ZS9KME=;
	b=0fbu0M9BgqiEQWCqAi3hjXXM9v6YsscwxhyLTlK6+AS9XnmWWv7S8nCfpEDGEqnrpa
	jibJ2l3ShOfLdD8FeOzriCMZBH9Jz6wRRQuZBu29GRNVjh2dYUUVRBMwWQkPIOfTQicS
	IPQqSXO35TCBQcg9XmAgdg9DJW0dDyNpEP4OX6RZRxf/g9EsC/qa9gMtA+pbhhW0zkW7
	4yhmpbmtEI6eUqOjOuN2dNfG3nAWoroBUI60YMPYClMguzl6Q/elhSnsPZW9aeSqGAet
	jL2hhbQs/hXS4bwwQBfhinztDH8NJKFr+JkOON81ZBT/poYTwSIt8Gvpdzz0zZm9YzAb
	n1eQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
	:references;
	bh=N45d0zgXqybWbeiSeEs4XdD/Bx/TBNgYkPK+2ZS9KME=;
	b=CVPrHzAQ03j41Z+tfpOOfv6wVxATSr6/XrdewLWjWOdjkj2axONbaxjhh0arqdqPpV
	ICIK4eGBL8CdkFZRfYG+4h8/9X+nTefo2x49UEFdHG7pC0tQbSvyA1Rk7uIAxZDkmlB2
	bheJl4j9JMZtRaXe+F44d4z5+PoKmQLJXBLhWBYNiZ6THqsnQNMgocJHkan2C9B/NYu1
	A1eUKfBmpJOSkirm5lonF3MkRL9OyqR369YcTkNs+OVEbHtgzwKxJuuQidK2qye3l37v
	0JNDSaSbDnYOF85Cm/WJTY1RGIgJkph/e3sA99FCcPzuIbR2I4aCme1nPZOZbae6vtXF
	TNRQ==
X-Gm-Message-State: AIkVDXIZTj5sNRiH/rQ4y6ayAd68BGKaZkSTRXdJ7i6xYQCZ8lMWmn8E3SUWpr851ls1eQ==
X-Received: by 10.25.22.201 with SMTP id 70mr2404661lfw.97.1485507979759;
	Fri, 27 Jan 2017 01:06:19 -0800 (PST)
Received: from localhost (194-237-220-218.customer.telia.com.
	[194.237.220.218]) by smtp.gmail.com with ESMTPSA id
	l133sm1138503lfg.40.2017.01.27.01.06.18
	for <openembedded-core@lists.openembedded.org>
	(version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
	Fri, 27 Jan 2017 01:06:18 -0800 (PST)
From: Anders Darander <anders@chargestorm.se>
To: openembedded-core@lists.openembedded.org
Date: Fri, 27 Jan 2017 10:05:57 +0100
Message-Id: <e2337e34a19a5b54c90e64ff5c4126ca7bcf2323.1485505680.git.anders@chargestorm.se>
X-Mailer: git-send-email 2.11.0
In-Reply-To: <cover.1485505680.git.anders@chargestorm.se>
References: <cover.1485505680.git.anders@chargestorm.se>
Subject: [PATCH 2/7] python3-manifest: move htlm.py to python3-html
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
X-List-Received-Date: Fri, 27 Jan 2017 09:06:21 -0000

This allows us to use html.py without importing misc.

Signed-off-by: Anders Darander <anders@chargestorm.se>
---
 meta/recipes-devtools/python/python-3.5-manifest.inc | 2 +-
 scripts/contrib/python/generate-manifest-3.5.py      | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/meta/recipes-devtools/python/python-3.5-manifest.inc b/meta/recipes-devtools/python/python-3.5-manifest.inc
index b92048f305..6093c2806b 100644
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
index cf19f477ab..cc2e5619e6 100755
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
2.11.0


