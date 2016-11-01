Return-Path: <fabio.berton@ossystems.com.br>
Received: from mail-vk0-f66.google.com (mail-vk0-f66.google.com
	[209.85.213.66])
	by mail.openembedded.org (Postfix) with ESMTP id AB73B71B15
	for <openembedded-core@lists.openembedded.org>;
	Tue,  1 Nov 2016 19:54:42 +0000 (UTC)
Received: by mail-vk0-f66.google.com with SMTP id p9so1709762vkd.1
	for <openembedded-core@lists.openembedded.org>;
	Tue, 01 Nov 2016 12:54:44 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=ossystems-com-br.20150623.gappssmtp.com; s=20150623;
	h=from:to:cc:subject:date:message-id:in-reply-to:references
	:organization; bh=PGch9bEt8O5X+IaNkWtanZ2lEbkiHKxvKGsqpNky1FU=;
	b=vDr9cnyCmDDB4ZwdBGbv4dfZ6dEGI4wfGpX9MFvh4HB613MygxLEtpiJJLpAHNR2aW
	4vE1JZw42tiC8xGsBF3iX9ZQyf7BlmSCTZb51BAV1sQZ0elZqOiOBgd0BFdarCE6MH4Z
	mQLhwYt3qtjhDBtRs/tIsZ6aCDFRGHfiS/v3FyRBC075YDrJQIGg5RZxGQnEYGfw8HIZ
	Zv5tFJePpQbn+n2fv2yxvHpNl4EsTXbiRKHiXMtfxOMnc0ZrGcSoRhMxPd5Jz+v34pAE
	8LxCgO7OAjxWr2PzX3gknWGZ/H6M6pwcBgokufBtWHhxiAdWVT6FVQTLbuLyk3klLz4F
	GVsw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
	:references:organization;
	bh=PGch9bEt8O5X+IaNkWtanZ2lEbkiHKxvKGsqpNky1FU=;
	b=fNA58LQhoCZ9j0sTFJgAP35hjG2blvCz09SIP4bHlCOR1zOFWUySFmgEy8x9whhkq5
	hlUdbUIhPvx6JgIULsbh6mJuKRVg7VlZZxxlOVvpy20fb4M9xLcmJSfyjfxB7yjGNsbu
	rIsPRfcEp9DqJ1cToJbAoF6L4sruNke8NawE6VDO6TNnipcv8fmFdg9DvoSBxySsQhy+
	+oqX0vaU+6XSrHdH/ZVimhxPLl5dnWxl8Cd1RGeAsqa0uCFXXQXZThx6uA7A3qv5FiXS
	GzkF7FbT0ocw6sPOaLLAaJWME+seu+t+KyZcxRDKbEC5231odNVXo3KBPYNXxNFXbcAa
	Uh2A==
X-Gm-Message-State: ABUngve8GaS7ZrCvUrhTIRXxlEsC5VB403Lk31LYx2R8PLyNNwxNhrszSgFRT9vDXXSKZQ==
X-Received: by 10.31.4.210 with SMTP id 201mr13220251vke.105.1478030083833;
	Tue, 01 Nov 2016 12:54:43 -0700 (PDT)
Received: from monster.lab.ossystems.com.br ([187.23.155.148])
	by smtp.gmail.com with ESMTPSA id q7sm8055913vke.20.2016.11.01.12.54.41
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
	Tue, 01 Nov 2016 12:54:42 -0700 (PDT)
From: Fabio Berton <fabio.berton@ossystems.com.br>
To: openembedded-core@lists.openembedded.org
Date: Tue,  1 Nov 2016 17:53:56 -0200
Message-Id: <1478030040-20670-4-git-send-email-fabio.berton@ossystems.com.br>
X-Mailer: git-send-email 2.1.4
In-Reply-To: <1478030040-20670-1-git-send-email-fabio.berton@ossystems.com.br>
References: <1478030040-20670-1-git-send-email-fabio.berton@ossystems.com.br>
Organization: O.S. Systems Software LTDA.
Subject: [PATCH 4/8] serf: Update to version 1.3.9
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
X-List-Received-Date: Tue, 01 Nov 2016 19:54:42 -0000

Change SRC_URI to download from official project page.

Signed-off-by: Fabio Berton <fabio.berton@ossystems.com.br>
---
 meta/recipes-support/serf/{serf_1.3.8.bb => serf_1.3.9.bb} | 6 +++---
 1 file changed, 3 insertions(+), 3 deletions(-)
 rename meta/recipes-support/serf/{serf_1.3.8.bb => serf_1.3.9.bb} (73%)

diff --git a/meta/recipes-support/serf/serf_1.3.8.bb b/meta/recipes-support/serf/serf_1.3.9.bb
similarity index 73%
rename from meta/recipes-support/serf/serf_1.3.8.bb
rename to meta/recipes-support/serf/serf_1.3.9.bb
index c498d90..851ec0c 100644
--- a/meta/recipes-support/serf/serf_1.3.8.bb
+++ b/meta/recipes-support/serf/serf_1.3.9.bb
@@ -1,10 +1,10 @@
 SUMMARY = "High-Performance Asynchronous HTTP Client Library"
-SRC_URI = "http://snapshot.debian.org/archive/debian/20160728T043443Z/pool/main/s/${BPN}/${BPN}_${PV}.orig.tar.gz \
+SRC_URI = "https://www.apache.org/dist/${PN}/${PN}-${PV}.tar.bz2 \
            file://norpath.patch \
            file://env.patch"
 
-SRC_URI[md5sum] = "713beaf05d7f3329de121e218e2fcb93"
-SRC_URI[sha256sum] = "77134cd5010664ca023585bce50978bd4005906ed280ff889f591f86df7c59e4"
+SRC_URI[md5sum] = "370a6340ff20366ab088012cd13f2b57"
+SRC_URI[sha256sum] = "549c2d21c577a8a9c0450facb5cca809f26591f048e466552240947bdf7a87cc"
 
 UPSTREAM_CHECK_URI = "${DEBIAN_MIRROR}/main/s/serf/"
 
-- 
2.1.4


