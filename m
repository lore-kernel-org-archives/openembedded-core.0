Return-Path: <martin.jansa@gmail.com>
Received: from mail-wr0-f194.google.com (mail-wr0-f194.google.com
	[209.85.128.194])
	by mail.openembedded.org (Postfix) with ESMTP id 2CE89747DC
	for <openembedded-core@lists.openembedded.org>;
	Wed,  2 May 2018 14:37:34 +0000 (UTC)
Received: by mail-wr0-f194.google.com with SMTP id o2-v6so11388951wrj.13
	for <openembedded-core@lists.openembedded.org>;
	Wed, 02 May 2018 07:37:36 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=from:to:cc:subject:date:message-id;
	bh=3VjrqEfvJM1oj0VvbwfzTVpQ+xST7p/AkWg3jtH1JDQ=;
	b=D748CeDpHXhW2ctNO0S0agLlMTGynb3nv87cRw7e1FSFG4Vp7ihpd1CCgxczYqKj7n
	3YizI/nejhdsurc1JHbZAgEnW6rb0821CiLsMNT3CE5hRvecZJaaIfUn9QGMt/rNqMmX
	F/TZXPsDkOGsfArKe52je2/jNPRUHMdhXYMuu0p9XlbB5Eh6/dyDsQS0xVS7PwFLEPWw
	nyU8sTyrpaYnHITritrDsZ2uEA6n8VuFZD6NH1a3rQ10LEBXdvY2NhR1k4S6d65RB5EL
	FVileJSjBylf5ekGtjr0ZflKoihaj1msiEv6fA+tY/wLaCx/TT6RN/p3a+RStXqoV1JJ
	+KFQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:cc:subject:date:message-id;
	bh=3VjrqEfvJM1oj0VvbwfzTVpQ+xST7p/AkWg3jtH1JDQ=;
	b=sZ2v09o5Q9UNADyoXhXzvn6Ad6Xc+xuKn7RuAlHiTqunYaGQXxb/zTRxpWCg+ML/hv
	UyMXtAhCY+idbBnsT4Ok8xtHEDmBH3n6fZ7ku37O8Nu9yyDpmIa9gq/wbjhEdbMAv1mC
	0djDBRH+WmYYgTfoABNxaDxhWdeUS7VEvFo3Pk4D1IjY2baaRshCQSUNtaHk/Cdhp2IH
	9TrSy+2XpNGqriwwTxxL1xSrCeP/TFU822SGvuEcEHgQ5P00YZLWZxGpixoEB+mPJ92j
	WIN1XYKAGsMBhFYlrjEzZFvrILnzwjloWXndNcO/a2eUKkw3Y7Q7gMJzRu2nwpLmi5e6
	v8Rw==
X-Gm-Message-State: ALQs6tBCm9JC9IpGzVTeoO7yErKbgpEXybMf8HXvhdyMtdfkXJu96PMk
	W1A/Ed3lluKOFQCsYKuLdWz8aA==
X-Google-Smtp-Source: AB8JxZr2QUac0VBVsLD1pSsapzSqEs1jLsVR8IKfXGW80RCIz5gL45XPoF5yWkZ8g+lAvrVuowsvGw==
X-Received: by 2002:adf:9f4a:: with SMTP id
	f10-v6mr14587287wrg.216.1525271855208; 
	Wed, 02 May 2018 07:37:35 -0700 (PDT)
Received: from localhost ([217.30.68.212]) by smtp.gmail.com with ESMTPSA id
	q34-v6sm17890462wrb.27.2018.05.02.07.37.34
	(version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
	Wed, 02 May 2018 07:37:34 -0700 (PDT)
From: Martin Jansa <martin.jansa@gmail.com>
X-Google-Original-From: Martin Jansa <Martin.Jansa@gmail.com>
To: openembedded-core@lists.openembedded.org
Date: Wed,  2 May 2018 14:37:31 +0000
Message-Id: <20180502143733.6303-1-Martin.Jansa@gmail.com>
X-Mailer: git-send-email 2.17.0
Subject: [PATCH 1/3] json-c: upgrade to 0.13.1
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
X-List-Received-Date: Wed, 02 May 2018 14:37:35 -0000

* from https://github.com/json-c/json-c/commit/861c1a82868831bf82222f974f05c2af5a975d12

* Bump the major version of the .so library generated up to 4.0 to avoid
  conflicts because some downstream packagers of json-c had already done
  their own bump to ".so.3" for a much older 0.12 release.
* Add const size_t json_c_object_sizeof()
* Avoid invalid free (and thus a segfault) when ref_count gets < 0
* PR#394: fix handling of custom double formats that include a ".0"
* Avoid uninitialized variable warnings in json_object_object_foreach
* Issue #396: fix build for certain uClibc based systems.
* Add a top level fuzz directory for fuzzers run by OSS-Fuzz

Signed-off-by: Martin Jansa <Martin.Jansa@gmail.com>
---
 .../json-c/{json-c_0.13.bb => json-c_0.13.1.bb}     | 13 ++++++-------
 1 file changed, 6 insertions(+), 7 deletions(-)
 rename meta/recipes-devtools/json-c/{json-c_0.13.bb => json-c_0.13.1.bb} (78%)

diff --git a/meta/recipes-devtools/json-c/json-c_0.13.bb b/meta/recipes-devtools/json-c/json-c_0.13.1.bb
similarity index 78%
rename from meta/recipes-devtools/json-c/json-c_0.13.bb
rename to meta/recipes-devtools/json-c/json-c_0.13.1.bb
index 06319de323..5b10e68297 100644
--- a/meta/recipes-devtools/json-c/json-c_0.13.bb
+++ b/meta/recipes-devtools/json-c/json-c_0.13.1.bb
@@ -4,18 +4,17 @@ HOMEPAGE = "https://github.com/json-c/json-c/wiki"
 LICENSE = "MIT"
 LIC_FILES_CHKSUM = "file://COPYING;md5=de54b60fbbc35123ba193fea8ee216f2"
 
-SRC_URI = "https://s3.amazonaws.com/json-c_releases/releases/${BP}.tar.gz \
-           "
-SRC_URI[md5sum] = "11fc5d90c77375e5fc8401e8b9efbf21"
-SRC_URI[sha256sum] = "0316780be9ad16c42d7c26b015a784fd5df4b0909fef0aba51cfb13e492ac24d"
+SRC_URI = "https://s3.amazonaws.com/json-c_releases/releases/${BP}.tar.gz"
+SRC_URI[md5sum] = "04969ad59cc37bddd83741a08b98f350"
+SRC_URI[sha256sum] = "b87e608d4d3f7bfdd36ef78d56d53c74e66ab278d318b71e6002a369d36f4873"
 
 UPSTREAM_CHECK_REGEX = "json-c-(?P<pver>\d+(\.\d+)+).tar"
 # json-c releases page is fetching the list of releases in some weird XML format
 # from https://s3.amazonaws.com/json-c_releases and processes it with javascript :-/
 #UPSTREAM_CHECK_URI = "https://s3.amazonaws.com/json-c_releases/releases/index.html"
-RECIPE_UPSTREAM_VERSION = "0.13"
-RECIPE_UPSTREAM_DATE = "Dec 07, 2017"
-CHECK_DATE = "Jan 31, 2018"
+RECIPE_UPSTREAM_VERSION = "0.13.1"
+RECIPE_UPSTREAM_DATE = "Mar 04, 2018"
+CHECK_DATE = "May 02, 2018"
 
 RPROVIDES_${PN} = "libjson"
 
-- 
2.17.0


