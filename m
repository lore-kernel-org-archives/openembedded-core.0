Return-Path: <andre.draszik@gmail.com>
Received: from mail-wm0-f68.google.com (mail-wm0-f68.google.com [74.125.82.68])
	by mail.openembedded.org (Postfix) with ESMTP id 9D35A6FF73
	for <openembedded-core@lists.openembedded.org>;
	Thu, 24 Aug 2017 09:19:26 +0000 (UTC)
Received: by mail-wm0-f68.google.com with SMTP id f127so2101644wmf.3
	for <openembedded-core@lists.openembedded.org>;
	Thu, 24 Aug 2017 02:19:27 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:subject:date:message-id:mime-version
	:content-transfer-encoding;
	bh=zc+ZsbAE0fEUDoR7KcrwwaXPpS/SMR8g0UjSLcnOPs8=;
	b=c9uXMGVj7YbIDBlqnZgY58M2vskU/YfWGup17AhBStkSjs7HRwWcPv6f2aqtpCbTsB
	UjmWx9JUpvofa6VfenlsxtxBalB0IcUWKSAbWGUU4a9+NLbXKfjTl4S21fViM7Q5W3+0
	tJGwbkLm2mYYqHRDM88EgJB9sHW3tS6PaAUOdKDYwztSl7L6IzlWTO//Bjqrrh9pq70w
	8XhWbQwxf+NMc45hKkGt7qjPp3H/e40y9KvCryO/ZhFXZpo5OW+FFh2KtX3fTguuuBaB
	jmkwCwlQLEYTHN4CrfOn9VChzpOBL+KAsOuRVblpnbyZqOFmxOl81SmJffNHLhVjMr2J
	K6+g==
X-Gm-Message-State: AHYfb5gDacneD5gdcfxcRKqS7CYuftGmuuGuSOdu81fFDFzKvm1gGvvB
	cR/mciWoKqB92L14BN8=
X-Received: by 10.80.170.58 with SMTP id o55mr5688511edc.164.1503566366836;
	Thu, 24 Aug 2017 02:19:26 -0700 (PDT)
Received: from tfsielt31850.garage.tyco.com ([77.107.218.170])
	by smtp.gmail.com with ESMTPSA id
	h36sm2371840eda.12.2017.08.24.02.19.24
	for <openembedded-core@lists.openembedded.org>
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Thu, 24 Aug 2017 02:19:25 -0700 (PDT)
From: =?UTF-8?q?Andr=C3=A9=20Draszik?= <git@andred.net>
To: openembedded-core@lists.openembedded.org
Date: Thu, 24 Aug 2017 10:19:24 +0100
Message-Id: <20170824091924.25945-1-git@andred.net>
X-Mailer: git-send-email 2.14.1
MIME-Version: 1.0
Subject: [PATCH] bitbake.conf: Add run-parts to HOSTTOOLS
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
X-List-Received-Date: Thu, 24 Aug 2017 09:19:26 -0000
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

From: André Draszik <adraszik@tycoint.com>

ca-certificates runs a postinst task, update-ca-certificates,
which ultimately wants to execute run-parts.

Signed-off-by: André Draszik <adraszik@tycoint.com>
---
 meta/conf/bitbake.conf | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta/conf/bitbake.conf b/meta/conf/bitbake.conf
index 334ba2361f..8011689118 100644
--- a/meta/conf/bitbake.conf
+++ b/meta/conf/bitbake.conf
@@ -469,7 +469,7 @@ HOSTTOOLS += " \
     fgrep file find flock g++ gawk gcc getconf getopt git grep gunzip gzip \
     head hostname install ld ldd ln ls make makeinfo md5sum mkdir mknod \
     mktemp mv nm objcopy objdump od patch perl pod2man pr printf pwd python python2 \
-    python2.7 python3 ranlib readelf readlink rm rmdir rpcgen sed sh sha256sum \
+    python2.7 python3 ranlib readelf readlink rm rmdir rpcgen run-parts sed sh sha256sum \
     sleep sort split stat strings strip tail tar tee test touch tr true uname \
     uniq wc wget which xargs \
 "
-- 
2.14.1


