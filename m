Return-Path: <fabio.berton@ossystems.com.br>
Received: from mail-ua0-f193.google.com (mail-ua0-f193.google.com
	[209.85.217.193])
	by mail.openembedded.org (Postfix) with ESMTP id 13AEF71B1C
	for <openembedded-core@lists.openembedded.org>;
	Thu,  3 Nov 2016 20:42:59 +0000 (UTC)
Received: by mail-ua0-f193.google.com with SMTP id b35so2379561uaa.1
	for <openembedded-core@lists.openembedded.org>;
	Thu, 03 Nov 2016 13:43:01 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=ossystems-com-br.20150623.gappssmtp.com; s=20150623;
	h=from:to:cc:subject:date:message-id:in-reply-to:references
	:organization; bh=e682kMvtyN8yvtdVZzfgpltWx/3eO08Iv3HX76UNZec=;
	b=qYSmjQuGoiPqppMqlGoHLtD9kgIL3oVKHsnC01hRfVFr/co52ap9NDeC9RXjYlfMqL
	gfHb/agHQBTkreHD7hgucI3X3gERBFs6OhqPrVWGJ9dtc4/I7TetabT2KljQOdDivaC3
	ZnGkNRJEJ0BZuWxuyjGSwn/m/qixY1exMgobDm1nY79CEZQqD61COJHINdtMiUpwUjm/
	31YPz0Ml8+kTtsSvMLCxyWuCCIOVnrGEDXMDYVGOYkgTFx0PZrxSOzYvuXJSBCqHajng
	9AkiV7q/5iNNnNZxyaBur0m6OM1k+tCfxavGYUcBsDQBwMBdslAquUwYfPybdFsLACos
	pjJQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
	:references:organization;
	bh=e682kMvtyN8yvtdVZzfgpltWx/3eO08Iv3HX76UNZec=;
	b=UcplEOJNd3tvj6cfSwy8t8e5jRqCQ93DlSNVhLOEp4kJNI0kl2YjluJmgpsB1Df8UY
	i3rmzRpha3dwMOB4HGUGldsZOPC114DWcvrOzRZxI29KweTsh/cBrlX+cz9ZYkaDsLcw
	YLbOY7LSKWT3V/GPkypcIizCvLUpSfQBUzFHKmRGT2dQTqxZvWOPg2hEiu6L0GAs9Zry
	rmViaxd4eBXofMYHGj/7CQU5dDv2GXFbRpvmzLUOtanryaIXrBAmVlesuwCg8bQb2hM3
	a1Bn6z+tg4H+yCnY7+4/62lA4BPJbZH8wkslvfWHdglDF4a8MhC6opTpqysa+JXiw4tr
	34ig==
X-Gm-Message-State: ABUngveaSJN4xSYpK7+yohTBuCXAXHogYDO7mKXni1lCHe8K203qR6RezTZfg+RXDqtSlg==
X-Received: by 10.176.0.169 with SMTP id 38mr9183079uaj.34.1478205781071;
	Thu, 03 Nov 2016 13:43:01 -0700 (PDT)
Received: from monster.lab.ossystems.com.br ([187.23.155.148])
	by smtp.gmail.com with ESMTPSA id 42sm2151339uah.2.2016.11.03.13.42.59
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
	Thu, 03 Nov 2016 13:43:00 -0700 (PDT)
From: Fabio Berton <fabio.berton@ossystems.com.br>
To: openembedded-core@lists.openembedded.org
Date: Thu,  3 Nov 2016 18:41:58 -0200
Message-Id: <1478205719-28589-2-git-send-email-fabio.berton@ossystems.com.br>
X-Mailer: git-send-email 2.1.4
In-Reply-To: <1478205719-28589-1-git-send-email-fabio.berton@ossystems.com.br>
References: <1478205719-28589-1-git-send-email-fabio.berton@ossystems.com.br>
Organization: O.S. Systems Software LTDA.
Subject: [PATCH] 2/3] curl: Update to version 7.51.0
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
X-List-Received-Date: Thu, 03 Nov 2016 20:43:00 -0000

CVE fixed in 7.51.0:

  CVE-2016-8615: cookie injection for other servers
  CVE-2016-8616: case insensitive password comparison
  CVE-2016-8617: OOB write via unchecked multiplication
  CVE-2016-8618: double-free in curl_maprintf
  CVE-2016-8619: double-free in krb5 code
  CVE-2016-8620: glob parser write/read out of bounds
  CVE-2016-8621: curl_getdate read out of bounds
  CVE-2016-8622: URL unescape heap overflow via integer truncation
  CVE-2016-8623: Use-after-free via shared cookies
  CVE-2016-8624: invalid URL parsing with '#'
  CVE-2016-8625: IDNA 2003 makes curl use wrong host

To see complete log access link bellow:
  https://curl.haxx.se/changes.html#7_51_0

Signed-off-by: Fabio Berton <fabio.berton@ossystems.com.br>
---
 meta/recipes-support/curl/{curl_7.50.1.bb => curl_7.51.0.bb} | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)
 rename meta/recipes-support/curl/{curl_7.50.1.bb => curl_7.51.0.bb} (94%)

diff --git a/meta/recipes-support/curl/curl_7.50.1.bb b/meta/recipes-support/curl/curl_7.51.0.bb
similarity index 94%
rename from meta/recipes-support/curl/curl_7.50.1.bb
rename to meta/recipes-support/curl/curl_7.51.0.bb
index a21419a..e1a996b 100644
--- a/meta/recipes-support/curl/curl_7.50.1.bb
+++ b/meta/recipes-support/curl/curl_7.51.0.bb
@@ -14,8 +14,8 @@ SRC_URI = "http://curl.haxx.se/download/curl-${PV}.tar.bz2 \
 #
 SRC_URI += " file://configure_ac.patch"
 
-SRC_URI[md5sum] = "015f6a0217ca6f2c5442ca406476920b"
-SRC_URI[sha256sum] = "3c12c5f54ccaa1d40abc65d672107dcc75d3e1fcb38c267484334280096e5156"
+SRC_URI[md5sum] = "09a7c5769a7eae676d5e2c86d51f167e"
+SRC_URI[sha256sum] = "7f8240048907e5030f67be0a6129bc4b333783b9cca1391026d700835a788dde"
 
 inherit autotools pkgconfig binconfig multilib_header
 
-- 
2.1.4


